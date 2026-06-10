from pathlib import Path
import json
import re
import xml.etree.ElementTree as ET
import zipfile

from oletools.olevba import VBA_Parser


ROOT = Path(__file__).resolve().parents[1]
XLSM = ROOT / "forbo Fullsan Quote Request Form.xlsm"
OUT = ROOT / "excel_extracted"


def clean_filename(name: str) -> str:
    return re.sub(r"[^A-Za-z0-9_.-]+", "_", name)


def extract_sheet_names() -> list[str]:
    ns = {"main": "http://schemas.openxmlformats.org/spreadsheetml/2006/main"}
    with zipfile.ZipFile(XLSM) as zf:
        workbook = ET.fromstring(zf.read("xl/workbook.xml"))
        sheets = []
        for sheet in workbook.find("main:sheets", ns):
            sheets.append(sheet.attrib.get("name", "Sheet"))
        return sheets


def extract_vba() -> list[dict]:
    OUT.mkdir(exist_ok=True)
    parser = VBA_Parser(str(XLSM))
    modules = []
    for _, _, filename, code in parser.extract_macros():
        if code is None:
            continue
        path = OUT / clean_filename(filename)
        path.write_text(code, encoding="utf-8", errors="replace")
        modules.append(
            {
                "file": filename,
                "path": str(path.relative_to(ROOT)),
                "lines": len(code.splitlines()),
                "subs": re.findall(r"(?im)^\\s*(?:Private\\s+|Public\\s+)?(?:Sub|Function)\\s+([A-Za-z0-9_]+)", code),
            }
        )
    return modules


def main() -> None:
    summary = {
        "workbook": XLSM.name,
        "sheets": extract_sheet_names(),
        "modules": extract_vba(),
    }
    (OUT / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
