import json
import re
from pathlib import Path

import fitz


ROOT = Path(__file__).resolve().parents[1]
PDF = ROOT / "forbo engineering manual.pdf"
OUT = ROOT / "engineering-data.js"
MANUAL_DIR = ROOT / "assets" / "manual"

SERIES_RANGES = {
    "s1": range(27, 39),
    "s2": range(39, 51),
    "s41": range(51, 61),
    "s5": range(61, 85),
    "s7": range(105, 117),
    "s81": range(117, 135),
    "s9": range(135, 147),
    "s91": range(147, 155),
    "s10": range(155, 169),
    "s11": range(169, 179),
    "s13": range(179, 187),
    "s14": range(187, 197),
    "s15": range(197, 203),
    "s17": range(203, 209),
    "s18": range(209, 220),
}

CATEGORY_MAP = {
    "BELT TYPES": "Belt surface",
    "PROFILES": "Profile",
    "SIDE GUARDS": "Accessory",
    "HOLD DOWN TABS": "Accessory",
    "SPROCKETS": "Drive",
    "PRR": "Accessory",
    "PROSNAP": "Service",
    "ACCESSORIES": "Accessory",
}

MATERIALS = [
    "POM-CR",
    "POM-HC",
    "POM-MD",
    "PP-MD",
    "PP-SW",
    "PE-MD",
    "PE-I",
    "PXX-HC",
    "PA-HT",
    "TPC1",
    "PLX",
    "POM",
    "PBT",
    "PE",
    "PP",
    "PA",
    "SS",
    "R2",
]

COLORS = {
    "AT": "Anthracite",
    "BG": "Beige",
    "BK": "Black",
    "BL": "Blue",
    "DB": "Dark blue",
    "GN": "Green",
    "LB": "Light blue",
    "LG": "Light gray",
    "OR": "Orange",
    "RE": "Red",
    "TQ": "Turquoise",
    "UC": "Uncolored",
    "WT": "White",
    "YL": "Yellow",
}


def slug(value: str) -> str:
    value = value.lower()
    value = value.replace("%", " percent ")
    value = re.sub(r"[^a-z0-9]+", "-", value)
    return value.strip("-")


def render_page(doc, page_number: int) -> None:
    page = doc[page_number - 1]
    pix = page.get_pixmap(matrix=fitz.Matrix(1.35, 1.35), alpha=False)
    pix.save(MANUAL_DIR / f"manual-{page_number:03}.png")


def normalize_line(line: str) -> str:
    return re.sub(r"\s+", " ", line.replace("\u2009", " ").replace("\u2005", " ")).strip()


def title_from_lines(lines):
    for line in lines:
        clean = normalize_line(line)
        if not clean.startswith("S"):
            continue
        if "|" in clean and re.search(r"S\d", clean):
            return clean
        if re.match(r"^S\d[\w.\- ()/]+$", clean) and len(clean) > 5:
            return clean
    return None


def category_from_text(text: str) -> str:
    for key, value in CATEGORY_MAP.items():
        if key in text:
            return value
    return "Engineering item"


def opening_from_title(title: str) -> str:
    match = re.search(r"(\d+\s?%)\s*(?:Opening|open)?", title, re.I)
    if match:
        return match.group(1).replace(" ", "")
    match = re.search(r"-(\d+)\s", title)
    if match:
        return f"{match.group(1)}%"
    return "N/A"


def description_from_text(lines, title: str, category: str) -> str:
    title_index = next((i for i, line in enumerate(lines) if normalize_line(line) == title), -1)
    candidates = []
    search_lines = lines[:title_index] if title_index > 0 else lines
    for line in search_lines:
        clean = normalize_line(line)
        if not clean or clean.startswith("I-") or "Prolink Engineering Manual" in clean:
            continue
        if "siegling prolink" in clean.lower() or clean.startswith("SERIES"):
            continue
        if any(word in clean.lower() for word in ["closed", "open", "surface", "profile", "sprocket", "retention", "release", "drainage", "grip", "accumulation"]):
            candidates.append(clean)
    if candidates:
        return " ".join(candidates[-2:])[:280]
    return f"{category} entry from the engineering manual with dimensions, materials, colors, temperature, and design reference data."


def unique_codes(source: str, codes) -> list[str]:
    found = []
    for code in codes:
        if re.search(rf"(?<![A-Z0-9-]){re.escape(code)}(?![A-Z0-9-])", source):
            found.append(code)
    return found


def tags_for(title: str, description: str, category: str) -> list[str]:
    text = f"{title} {description} {category}".lower()
    tags = set()
    if any(word in text for word in ["open", "grid", "drain", "air", "lateral rib"]):
        tags.add("drainage")
    if any(word in text for word in ["friction", "non skid", "slip", "nub", "cone", "grip"]):
        tags.add("grip")
    if any(word in text for word in ["hygiene", "clean", "food", "release"]):
        tags.add("hygiene")
    if any(word in text for word in ["profile", "side guard", "bulk", "retention", "incline"]):
        tags.update(["bulk", "incline"])
    if any(word in text for word in ["roller", "prr", "accumulation"]):
        tags.add("accumulation")
    if any(word in text for word in ["prosnap", "pin", "quick"]):
        tags.add("quickService")
    if "md" in text or "metal detectable" in text:
        tags.add("metalDetect")
    if not tags:
        tags.add("dryContact")
    return sorted(tags)


def main() -> None:
    MANUAL_DIR.mkdir(parents=True, exist_ok=True)
    doc = fitz.open(PDF)
    products = []
    traits = {}
    seen_titles = set()
    used_product_ids = set()

    for series_id, pages in SERIES_RANGES.items():
        for page_number in pages:
            page = doc[page_number - 1]
            text = page.get_text()
            if "OVERVIEW" in text and "BELT TYPES" not in text:
                render_page(doc, page_number)
                continue

            lines = page.get_text().splitlines()
            title = title_from_lines(lines)
            if not title:
                continue

            category = category_from_text(text)
            dedupe_key = (series_id, title, page_number)
            if dedupe_key in seen_titles:
                continue
            seen_titles.add(dedupe_key)
            render_page(doc, page_number)

            materials = unique_codes(text, MATERIALS)
            color_codes = unique_codes(text, COLORS.keys())
            colors = [f"{COLORS[code]} ({code})" for code in color_codes]
            description = description_from_text(lines, title, category)
            product_id = f"eng-{series_id}-{slug(title)}"
            if product_id in used_product_ids:
                product_id = f"{product_id}-page-{page_number}"
            used_product_ids.add(product_id)

            products.append(
                {
                    "id": product_id,
                    "seriesId": series_id,
                    "title": title,
                    "category": category,
                    "opening": opening_from_title(title),
                    "bestFit": description,
                    "description": description,
                    "materials": ", ".join(materials) if materials else "See engineering manual page",
                    "temperature": "See engineering manual page",
                    "page": page_number,
                    "sourceImage": f"assets/manual/manual-{page_number:03}.png",
                    "image": f"assets/manual/manual-{page_number:03}.png",
                    "tags": tags_for(title, description, category),
                    "notes": f"Engineering Manual page {page_number}.",
                }
            )

            traits[product_id] = {
                "materials": materials or ["Confirm with engineering manual"],
                "colors": colors or ["Confirm with engineering manual"],
            }

    OUT.write_text(
        "window.engineeringProducts = "
        + json.dumps(products, indent=2)
        + ";\nwindow.engineeringTraits = "
        + json.dumps(traits, indent=2)
        + ";\n",
        encoding="utf-8",
    )
    print(f"Generated {len(products)} engineering products")


if __name__ == "__main__":
    main()
