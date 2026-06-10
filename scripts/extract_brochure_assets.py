from pathlib import Path

import fitz


ROOT = Path(__file__).resolve().parents[1]
PDF = ROOT / "forbo_Ref.no.888-2_1.2_S6.1"
RANGE_PDF = ROOT / "siegling prolink product range.pdf"
PAGE_DIR = ROOT / "assets" / "pages"
PRODUCT_DIR = ROOT / "assets" / "products"
RANGE_DIR = ROOT / "assets" / "range"


def render_page(page, output: Path, zoom: float = 1.6) -> None:
    matrix = fitz.Matrix(zoom, zoom)
    pix = page.get_pixmap(matrix=matrix, alpha=False)
    pix.save(output)


def render_crop(page, output: Path, rect, zoom: float = 2.0) -> None:
    matrix = fitz.Matrix(zoom, zoom)
    pix = page.get_pixmap(matrix=matrix, clip=rect, alpha=False)
    pix.save(output)


def main() -> None:
    PAGE_DIR.mkdir(parents=True, exist_ok=True)
    PRODUCT_DIR.mkdir(parents=True, exist_ok=True)
    RANGE_DIR.mkdir(parents=True, exist_ok=True)

    doc = fitz.open(PDF)
    for index, page in enumerate(doc, start=1):
        render_page(page, PAGE_DIR / f"page-{index:02}.png")

    # Product pages use the upper working area as a compact preview while detail
    # views link to the full rendered brochure page.
    for index in range(2, min(doc.page_count, 19) + 1):
        page = doc[index - 1]
        rect = page.rect
        crop = fitz.Rect(
            rect.x0 + rect.width * 0.05,
            rect.y0 + rect.height * 0.10,
            rect.x1 - rect.width * 0.05,
            rect.y0 + rect.height * 0.50,
        )
        render_crop(page, PRODUCT_DIR / f"product-{index:02}.png", crop)

    if RANGE_PDF.exists():
        range_doc = fitz.open(RANGE_PDF)
        for index, page in enumerate(range_doc, start=1):
            render_page(page, RANGE_DIR / f"range-{index:02}.png", zoom=1.35)


if __name__ == "__main__":
    main()
