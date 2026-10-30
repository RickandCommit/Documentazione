#!/usr/bin/env python3
"""
generate_site.py — Generatore dinamico del sito di documentazione RickandCommit.
Scansiona i PDF dei documenti, verbali e diari di bordo, genera le anteprime
ad alta risoluzione della prima pagina, compila le card HTML e gestisce la
progressione a pila delle fasi di progetto (Candidatura > RTB > PB) spostando
le fasi concluse in una sezione Archivio (nascosta finché vuota).
"""

import os
import sys
import re
import shutil
import argparse
from datetime import datetime

try:
    import fitz  # PyMuPDF
except ImportError:
    print("ERRORE: Modulo 'fitz' (PyMuPDF) non trovato. Installare con: pip install pymupdf")
    sys.exit(1)


COMPANY_NAMES = [
    "Eggon", "Ergon", "Halue", "Uranion", "SyncLab", "Sanmarco", "M31", "Var Group"
]

PHASE_ORDER = ["candidatura", "rtb", "pb"]

PHASE_META = {
    "candidatura": {
        "title": "Candidatura",
        "tag": "Candidatura",
        "folder": "Candidatura",
        "subtitle": "Documentazione formale per la candidatura all'assegnazione dei capitolati d'appalto.",
    },
    "rtb": {
        "title": "Requirements and Technology Baseline (RTB)",
        "tag": "RTB",
        "folder": "RTB",
        "subtitle": "Documentazione formale e verbali relativi alla Requirements and Technology Baseline (RTB).",
    },
    "pb": {
        "title": "Product Baseline (PB)",
        "tag": "PB",
        "folder": "PB",
        "subtitle": "Documentazione formale, manuali e verbali relativi alla Product Baseline (PB).",
    },
}

SVG_DOC_ICON = (
    '<svg class="doc-open-icon" viewBox="0 0 16 16" width="14" height="14" fill="currentColor" aria-hidden="true">'
    '<path fill-rule="evenodd" d="M4.25 2A2.25 2.25 0 002 4.25v7.5A2.25 2.25 0 004.25 14h7.5A2.25 2.25 0 0014 11.75V8.5a.75.75 0 00-1.5 0v3.25a.75.75 0 01-.75.75h-7.5a.75.75 0 01-.75-.75v-7.5a.75.75 0 01.75-.75H7.5a.75.75 0 000-1.5H4.25zM10.25 2a.75.75 0 000 1.5h2.44L6.97 9.22a.75.75 0 101.06 1.06L13.75 4.56v2.44a.75.75 0 001.5 0V2.75A.75.75 0 0014.5 2h-4.25z"/>'
    '</svg>'
)

SVG_VERBALE_ICON = (
    '<svg class="verbale-row-icon" viewBox="0 0 16 16" width="13" height="13" fill="currentColor" aria-hidden="true">'
    '<path fill-rule="evenodd" d="M4.25 2A2.25 2.25 0 002 4.25v7.5A2.25 2.25 0 004.25 14h7.5A2.25 2.25 0 0014 11.75V8.5a.75.75 0 00-1.5 0v3.25a.75.75 0 01-.75.75h-7.5a.75.75 0 01-.75-.75v-7.5a.75.75 0 01.75-.75H7.5a.75.75 0 000-1.5H4.25zM10.25 2a.75.75 0 000 1.5h2.44L6.97 9.22a.75.75 0 101.06 1.06L13.75 4.56v2.44a.75.75 0 001.5 0V2.75A.75.75 0 0014.5 2h-4.25z"/>'
    '</svg>'
)

SVG_SLIDE_ICON = (
    '<svg class="slide-h-open-icon" viewBox="0 0 16 16" width="14" height="14" fill="currentColor" aria-hidden="true">'
    '<path fill-rule="evenodd" d="M4.25 2A2.25 2.25 0 002 4.25v7.5A2.25 2.25 0 004.25 14h7.5A2.25 2.25 0 0014 11.75V8.5a.75.75 0 00-1.5 0v3.25a.75.75 0 01-.75.75h-7.5a.75.75 0 01-.75-.75v-7.5a.75.75 0 01.75-.75H7.5a.75.75 0 000-1.5H4.25zM10.25 2a.75.75 0 000 1.5h2.44L6.97 9.22a.75.75 0 101.06 1.06L13.75 4.56v2.44a.75.75 0 001.5 0V2.75A.75.75 0 0014.5 2h-4.25z"/>'
    '</svg>'
)


def render_pdf_first_page(pdf_path: str, output_image_path: str, dpi: int = 150) -> bool:
    """Renderizza la prima pagina di un file PDF in un'immagine PNG ad alta risoluzione."""
    try:
        os.makedirs(os.path.dirname(output_image_path), exist_ok=True)
        doc = fitz.open(pdf_path)
        if len(doc) == 0:
            return False
        page = doc[0]
        pix = page.get_pixmap(dpi=dpi)
        pix.save(output_image_path)
        doc.close()
        return True
    except Exception as e:
        print(f"[WARN] Impossibile generare anteprima per {pdf_path}: {e}")
        return False


def extract_metadata_from_pdf(pdf_path: str) -> dict:
    """Estrae testo, data, versione e metadati da un file PDF."""
    filename = os.path.basename(pdf_path)
    text = ""
    try:
        doc = fitz.open(pdf_path)
        pages_to_read = min(2, len(doc))
        for p in range(pages_to_read):
            text += doc[p].get_text() + "\n"
        doc.close()
    except Exception as e:
        print(f"[WARN] Errore lettura testo da {pdf_path}: {e}")

    # Estrazione Data (AAAA-MM-GG)
    date_match = re.search(r"(\d{4}-\d{2}-\d{2})", filename)
    if not date_match:
        date_match = re.search(r"(\d{4}-\d{2}-\d{2})", text)
    date_str = date_match.group(1) if date_match else ""

    # Estrazione Versione
    ver_match = re.search(r"_v?(\d+\.\d+\.\d+)", filename)
    if not ver_match:
        ver_match = re.search(r"Versione\s+v?(\d+\.\d+\.\d+)", text, re.IGNORECASE)
    if not ver_match:
        ver_match = re.search(r"v?(\d+\.\d+\.\d+)", text)
    version = f"v{ver_match.group(1)}" if ver_match else "v1.0.0"

    # Riconoscimento Azienda
    company = ""
    for comp in COMPANY_NAMES:
        if comp.lower() in filename.lower() or comp.lower() in text.lower():
            company = comp
            break

    is_signed = "firmato" in filename.lower() or "firmato" in text.lower()

    return {
        "filename": filename,
        "path": pdf_path,
        "date": date_str,
        "version": version,
        "company": company,
        "is_signed": is_signed,
        "text": text,
    }


def extract_metadata_from_typ(typ_path: str) -> dict:
    """Estrae testo, data, versione e metadati da un sorgente Typst (.typ)."""
    filename = os.path.basename(typ_path)
    text = ""
    try:
        with open(typ_path, "r", encoding="utf-8") as f:
            text = f.read()
    except Exception as e:
        print(f"[WARN] Errore lettura sorgente Typst da {typ_path}: {e}")

    # Estrazione Data (AAAA-MM-GG)
    date_match = re.search(r'data:\s*"(\d{4}-\d{2}-\d{2})"', text)
    if not date_match:
        date_match = re.search(r"(\d{4}-\d{2}-\d{2})", filename)
    date_str = date_match.group(1) if date_match else ""

    # Estrazione Versione
    ver_match = re.search(r'versione:\s*"([^"]+)"', text)
    if not ver_match:
        ver_match = re.search(r"Versione\s+v?(\d+\.\d+\.\d+)", text, re.IGNORECASE)
    if not ver_match:
        ver_match = re.search(r"v?(\d+\.\d+\.\d+)", text)
    version = ver_match.group(1) if ver_match else "v1.0.0"
    if not version.startswith("v"):
        version = f"v{version}"

    # Riconoscimento Azienda
    company = ""
    for comp in COMPANY_NAMES:
        if comp.lower() in filename.lower() or comp.lower() in text.lower():
            company = comp
            break

    is_signed = "firmato" in filename.lower()
    pdf_filename = filename[:-4] + ".pdf"

    return {
        "filename": pdf_filename,
        "path": typ_path,
        "date": date_str,
        "version": version,
        "company": company,
        "is_signed": is_signed,
        "text": text,
    }


def extract_metadata(path: str) -> dict:
    """Estrae metadati da PDF o da sorgente Typst (.typ)."""
    if path.endswith(".typ"):
        return extract_metadata_from_typ(path)
    return extract_metadata_from_pdf(path)


def list_documents_in_dirs(directories: list[str]) -> list[str]:
    """Elenca tutti i documenti (.pdf con fallback su .typ) presenti nelle cartelle fornite."""
    seen_bases = set()
    results = []

    # 1. Raccogli PDF (prioritari)
    for d in directories:
        if not os.path.isdir(d):
            continue
        for f in os.listdir(d):
            if f.endswith(".pdf") and not f.startswith("."):
                base = f[:-4]
                if base not in seen_bases:
                    seen_bases.add(base)
                    results.append(os.path.join(d, f))

    # 2. Raccogli sorgenti Typst (.typ) per file non ancora compilati in PDF
    for d in directories:
        if not os.path.isdir(d):
            continue
        for f in os.listdir(d):
            if f.endswith(".typ") and not f.startswith("."):
                base = f[:-4]
                if base not in seen_bases:
                    seen_bases.add(base)
                    results.append(os.path.join(d, f))

    return results


def find_pdf_in_dirs(filename_pattern: str, search_dirs: list[str]) -> str | None:
    """Cerca un file PDF corrispondente a un pattern nelle directory fornite."""
    regex = re.compile(filename_pattern, re.IGNORECASE)
    for d in search_dirs:
        if os.path.isdir(d):
            for root, _, files in os.walk(d):
                for f in files:
                    if f.endswith(".pdf") and regex.search(f):
                        return os.path.join(root, f)
    return None


def detect_active_phase(root_dir: str, override_phase: str | None = None) -> tuple[str, list[str]]:
    """
    Rileva la fase attiva del progetto secondo la pila: candidatura > rtb > pb.
    Restituisce (fase_attiva, lista_fasi_archiviate).
    """
    if override_phase and override_phase.lower() in PHASE_ORDER:
        active = override_phase.lower()
    else:
        pb_dir = os.path.join(root_dir, "PB")
        rtb_dir = os.path.join(root_dir, "RTB")

        def has_content(d: str) -> bool:
            if not os.path.isdir(d):
                return False
            for _, _, files in os.walk(d):
                if any(f.endswith((".typ", ".pdf")) for f in files):
                    return True
            return False

        if has_content(pb_dir):
            active = "pb"
        elif has_content(rtb_dir):
            active = "rtb"
        else:
            active = "candidatura"

    active_idx = PHASE_ORDER.index(active)
    archived = [p for p in reversed(PHASE_ORDER[:active_idx])]

    return active, archived


def build_navbar_html(active_phase: str, archived_phases: list[str]) -> str:
    """Genera i collegamenti della barra di navigazione dinamica."""
    active_title = PHASE_META[active_phase]["title"].split(" (")[0]
    links = [
        f'          <li>\n            <a href="#{active_phase}" class="nav-item-link" data-section="{active_phase}">{active_title}</a>\n          </li>',
        '          <li>\n            <a href="#diapositive" class="nav-item-link" data-section="diapositive">Diapositive</a>\n          </li>',
    ]
    if archived_phases:
        links.append(
            '          <li>\n            <a href="#archivio" class="nav-item-link" data-section="archivio">Archivio</a>\n          </li>'
        )
    links.append(
        '          <li>\n            <a href="#about" class="nav-item-link" data-section="about">About</a>\n          </li>'
    )
    links_html = "\n".join(links)

    return (
        '      <nav class="nav-menu-wrapper" id="navWrapper" aria-label="Navigazione sezioni">\n'
        '        <div class="nav-simple-underline" id="navUnderline"></div>\n'
        '        <ul class="nav-menu" id="navMenu">\n'
        f'{links_html}\n'
        '        </ul>\n'
        '      </nav>'
    )


def build_verbali_html(verbali_list: list[dict], phase_folder: str, subgroup: str) -> str:
    """Genera l'HTML delle card verbali ordinati LIFO."""
    if not verbali_list:
        return '<!-- Nessun verbale presente -->'

    lines = []
    for item in verbali_list:
        rel_pdf = f"{phase_folder}/Verbali/{subgroup}/{item['filename']}"
        status_suffix = " (Firmato)" if item["is_signed"] else ""
        if subgroup == "Esterni" and item["company"]:
            display_title = f"Verbale Esterno {item['company']}{status_suffix}"
        else:
            prefix = "Verbale Esterno" if subgroup == "Esterni" else "Verbale Interno"
            display_title = f"{prefix} {item['date']}{status_suffix}"

        card = (
            f'                <a href="{rel_pdf}" target="_blank" rel="noopener noreferrer" class="verbale-row-card" aria-label="Apri {display_title}">\n'
            f'                  <div class="verbale-row-left">\n'
            f'                    <span class="verbale-row-date">{item["date"]}</span>\n'
            f'                    <span class="verbale-row-title">{display_title}</span>\n'
            f'                  </div>\n'
            f'                  <div class="verbale-row-right">\n'
            f'                    <span class="doc-format-label">{item["version"]} · PDF</span>\n'
            f'                    {SVG_VERBALE_ICON}\n'
            f'                  </div>\n'
            f'                </a>'
        )
        lines.append(card)

    return "\n".join(lines)


def build_candidatura_section(site_dir: str, root_dir: str, is_archived: bool = False) -> str:
    """Costruisce la sezione HTML per la fase Candidatura."""
    search_dirs = [site_dir, os.path.join(root_dir, "Candidatura"), root_dir]
    assets_docs_dir = os.path.join(site_dir, "assets", "docs")
    candidatura_out_dir = os.path.join(site_dir, "Candidatura")
    os.makedirs(assets_docs_dir, exist_ok=True)
    os.makedirs(candidatura_out_dir, exist_ok=True)

    # 1. Lettera di Presentazione
    lettera_pdf = find_pdf_in_dirs(r".*Lettera_di_Presentazione.*\.pdf$", search_dirs)
    lettera_href = "Candidatura/2026-10-30_Lettera_di_Presentazione.pdf"
    if lettera_pdf:
        fname = os.path.basename(lettera_pdf)
        lettera_href = f"Candidatura/{fname}"
        preview_out = os.path.join(assets_docs_dir, "lettera_presentazione_preview.png")
        render_pdf_first_page(lettera_pdf, preview_out)

    # 2. Valutazione Capitolati
    valutazione_pdf = find_pdf_in_dirs(r".*Valutazione_dei_Capitolati.*\.pdf$", search_dirs)
    valutazione_ver = "v1.0.0"
    valutazione_href = f"Candidatura/Valutazione_dei_Capitolati_{valutazione_ver}.pdf"
    if valutazione_pdf:
        meta_val = extract_metadata_from_pdf(valutazione_pdf)
        valutazione_ver = meta_val["version"]
        target_name = f"Valutazione_dei_Capitolati_{valutazione_ver}.pdf"
        target_path = os.path.join(candidatura_out_dir, target_name)
        if os.path.abspath(valutazione_pdf) != os.path.abspath(target_path):
            try:
                shutil.copy2(valutazione_pdf, target_path)
            except Exception:
                pass
        valutazione_href = f"Candidatura/{target_name}"
        preview_out = os.path.join(assets_docs_dir, "valutazione_capitolati_preview.png")
        render_pdf_first_page(valutazione_pdf, preview_out)

    # 3. Dichiarazione Impegni
    impegni_pdf = find_pdf_in_dirs(r".*Dichiarazione_degli_Impegni.*\.pdf$", search_dirs)
    impegni_ver = "v1.0.0"
    impegni_href = f"Candidatura/Dichiarazione_degli_Impegni_{impegni_ver}.pdf"
    if impegni_pdf:
        meta_imp = extract_metadata_from_pdf(impegni_pdf)
        impegni_ver = meta_imp["version"]
        target_name = f"Dichiarazione_degli_Impegni_{impegni_ver}.pdf"
        target_path = os.path.join(candidatura_out_dir, target_name)
        if os.path.abspath(impegni_pdf) != os.path.abspath(target_path):
            try:
                shutil.copy2(impegni_pdf, target_path)
            except Exception:
                pass
        impegni_href = f"Candidatura/{target_name}"
        preview_out = os.path.join(assets_docs_dir, "preventivo_impegni_preview.png")
        render_pdf_first_page(impegni_pdf, preview_out)

    # Verbali Esterni (LIFO)
    ext_dirs = [
        os.path.join(site_dir, "Candidatura", "Verbali", "Esterni"),
        os.path.join(root_dir, "Candidatura", "Verbali", "Esterni"),
    ]
    ext_metas = [extract_metadata(p) for p in list_documents_in_dirs(ext_dirs)]
    ext_metas.sort(key=lambda x: x["date"], reverse=True)
    ext_html = build_verbali_html(ext_metas, "Candidatura", "Esterni")

    # Verbali Interni (LIFO)
    int_dirs = [
        os.path.join(site_dir, "Candidatura", "Verbali", "Interni"),
        os.path.join(root_dir, "Candidatura", "Verbali", "Interni"),
    ]
    int_metas = [extract_metadata(p) for p in list_documents_in_dirs(int_dirs)]
    int_metas.sort(key=lambda x: x["date"], reverse=True)
    int_html = build_verbali_html(int_metas, "Candidatura", "Interni")

    inner_html = (
        f'        <!-- Lettera di Presentazione -->\n'
        f'        <div class="candidatura-featured">\n'
        f'          <a href="{lettera_href}" target="_blank" rel="noopener noreferrer" class="doc-featured-card" aria-label="Apri Lettera di Presentazione PDF">\n'
        f'            <img src="assets/docs/lettera_presentazione_preview.png" alt="Anteprima Lettera di Presentazione" class="doc-thumb doc-thumb-lg" loading="lazy">\n'
        f'            <div class="doc-featured-main">\n'
        f'              <h3 class="doc-featured-title">Lettera di Presentazione</h3>\n'
        f'              <p class="doc-featured-desc">Contenuti della consegna e stato di avanzamento</p>\n'
        f'              <span class="doc-format-label">PDF</span>\n'
        f'            </div>\n'
        f'            <div class="doc-featured-right">\n'
        f'              {SVG_DOC_ICON}\n'
        f'            </div>\n'
        f'          </a>\n'
        f'        </div>\n\n'
        f'        <!-- Sottosezione: Documenti -->\n'
        f'        <div class="subsection-block">\n'
        f'          <div class="subsection-header">\n'
        f'            <h3 class="subsection-title">Documenti</h3>\n'
        f'          </div>\n'
        f'          <div class="docs-grid-two">\n'
        f'            <!-- 1. Valutazione dei Capitolati -->\n'
        f'            <a href="{valutazione_href}" target="_blank" rel="noopener noreferrer" class="doc-compact-card" aria-label="Apri Valutazione dei Capitolati PDF">\n'
        f'              <img src="assets/docs/valutazione_capitolati_preview.png" alt="Anteprima Valutazione dei Capitolati" class="doc-thumb" loading="lazy">\n'
        f'              <div class="doc-compact-body">\n'
        f'                <h4 class="doc-compact-title">Valutazione dei Capitolati</h4>\n'
        f'                <span class="doc-format-label">{valutazione_ver} · PDF</span>\n'
        f'              </div>\n'
        f'              <div class="doc-compact-right">\n'
        f'                {SVG_DOC_ICON}\n'
        f'              </div>\n'
        f'            </a>\n\n'
        f'            <!-- 2. Preventivo costi e assunzione impegni -->\n'
        f'            <a href="{impegni_href}" target="_blank" rel="noopener noreferrer" class="doc-compact-card" aria-label="Apri Preventivo costi e assunzione impegni PDF">\n'
        f'              <img src="assets/docs/preventivo_impegni_preview.png" alt="Anteprima Preventivo costi e assunzione impegni" class="doc-thumb" loading="lazy">\n'
        f'              <div class="doc-compact-body">\n'
        f'                <h4 class="doc-compact-title">Preventivo costi e assunzione impegni</h4>\n'
        f'                <span class="doc-format-label">{impegni_ver} · PDF</span>\n'
        f'              </div>\n'
        f'              <div class="doc-compact-right">\n'
        f'                {SVG_DOC_ICON}\n'
        f'              </div>\n'
        f'            </a>\n'
        f'          </div>\n'
        f'        </div>\n\n'
        f'        <!-- Sottosezione: Verbali -->\n'
        f'        <div class="subsection-block">\n'
        f'          <div class="subsection-header">\n'
        f'            <h3 class="subsection-title">Verbali</h3>\n'
        f'          </div>\n'
        f'          <div class="verbali-container">\n'
        f'            <!-- Verbali Esterni -->\n'
        f'            <div class="verbali-subgroup">\n'
        f'              <h4 class="verbali-subgroup-title">Verbali Esterni</h4>\n'
        f'              <div class="verbali-list">\n'
        f'{ext_html}\n'
        f'              </div>\n'
        f'            </div>\n\n'
        f'            <!-- Verbali Interni -->\n'
        f'            <div class="verbali-subgroup">\n'
        f'              <h4 class="verbali-subgroup-title">Verbali Interni</h4>\n'
        f'              <div class="verbali-list">\n'
        f'{int_html}\n'
        f'              </div>\n'
        f'            </div>\n'
        f'          </div>\n'
        f'        </div>'
    )

    meta = PHASE_META["candidatura"]
    if not is_archived:
        return (
            f'      <section id="candidatura" class="content-section">\n'
            f'        <div class="section-header-block">\n'
            f'          <h2 class="section-title">{meta["title"]}</h2>\n'
            f'          <p class="section-subtitle">\n'
            f'            {meta["subtitle"]}\n'
            f'          </p>\n'
            f'        </div>\n\n'
            f'{inner_html}\n'
            f'      </section>'
        )
    else:
        return (
            f'        <div class="archive-phase-card" id="archive-candidatura">\n'
            f'          <div class="archive-phase-header">\n'
            f'            <h3 class="archive-phase-title">{meta["title"]}</h3>\n'
            f'            <span class="archive-phase-badge">{meta["tag"]}</span>\n'
            f'          </div>\n'
            f'{inner_html}\n'
            f'        </div>'
        )


def build_generic_phase_section(phase_id: str, site_dir: str, root_dir: str, is_archived: bool = False) -> str:
    """Costruisce una sezione dinamica generica per fasi successive (RTB o PB)."""
    meta = PHASE_META[phase_id]
    folder = meta["folder"]
    phase_root = os.path.join(root_dir, folder)

    # Scansione Verbali Esterni ed Interni della fase
    ext_dirs = [
        os.path.join(site_dir, folder, "Verbali", "Esterni"),
        os.path.join(phase_root, "Verbali", "Esterni"),
    ]
    ext_metas = [extract_metadata(p) for p in list_documents_in_dirs(ext_dirs)]
    ext_metas.sort(key=lambda x: x["date"], reverse=True)
    ext_html = build_verbali_html(ext_metas, folder, "Esterni")

    int_dirs = [
        os.path.join(site_dir, folder, "Verbali", "Interni"),
        os.path.join(phase_root, "Verbali", "Interni"),
    ]
    int_metas = [extract_metadata(p) for p in list_documents_in_dirs(int_dirs)]
    int_metas.sort(key=lambda x: x["date"], reverse=True)
    int_html = build_verbali_html(int_metas, folder, "Interni")

    # Documenti principali della fase
    doc_files = []
    if os.path.isdir(phase_root):
        for f in os.listdir(phase_root):
            if f.endswith((".pdf", ".typ")) and not f.startswith("."):
                doc_files.append(os.path.join(phase_root, f))

    docs_cards = []
    for df in doc_files:
        meta_d = extract_metadata(df)
        fname = meta_d["filename"]
        title = fname[:-4].replace("_", " ")
        card = (
            f'            <a href="{folder}/{fname}" target="_blank" rel="noopener noreferrer" class="doc-compact-card" aria-label="Apri {title} PDF">\n'
            f'              <div class="doc-compact-body">\n'
            f'                <h4 class="doc-compact-title">{title}</h4>\n'
            f'                <span class="doc-format-label">{meta_d["version"]} · PDF</span>\n'
            f'              </div>\n'
            f'              <div class="doc-compact-right">\n'
            f'                {SVG_DOC_ICON}\n'
            f'              </div>\n'
            f'            </a>'
        )
        docs_cards.append(card)

    docs_cards_html = "\n".join(docs_cards) if docs_cards else '<!-- In attesa di rilascio documenti -->'

    inner_html = (
        f'        <div class="subsection-block">\n'
        f'          <div class="subsection-header">\n'
        f'            <h3 class="subsection-title">Documenti Formali</h3>\n'
        f'          </div>\n'
        f'          <div class="docs-grid-two">\n'
        f'{docs_cards_html}\n'
        f'          </div>\n'
        f'        </div>\n\n'
        f'        <div class="subsection-block">\n'
        f'          <div class="subsection-header">\n'
        f'            <h3 class="subsection-title">Verbali</h3>\n'
        f'          </div>\n'
        f'          <div class="verbali-container">\n'
        f'            <div class="verbali-subgroup">\n'
        f'              <h4 class="verbali-subgroup-title">Verbali Esterni</h4>\n'
        f'              <div class="verbali-list">\n'
        f'{ext_html}\n'
        f'              </div>\n'
        f'            </div>\n'
        f'            <div class="verbali-subgroup">\n'
        f'              <h4 class="verbali-subgroup-title">Verbali Interni</h4>\n'
        f'              <div class="verbali-list">\n'
        f'{int_html}\n'
        f'              </div>\n'
        f'            </div>\n'
        f'          </div>\n'
        f'        </div>'
    )

    if not is_archived:
        return (
            f'      <section id="{phase_id}" class="content-section">\n'
            f'        <div class="section-header-block">\n'
            f'          <h2 class="section-title">{meta["title"]}</h2>\n'
            f'          <p class="section-subtitle">\n'
            f'            {meta["subtitle"]}\n'
            f'          </p>\n'
            f'        </div>\n\n'
            f'{inner_html}\n'
            f'      </section>'
        )
    else:
        return (
            f'        <div class="archive-phase-card" id="archive-{phase_id}">\n'
            f'          <div class="archive-phase-header">\n'
            f'            <h3 class="archive-phase-title">{meta["title"]}</h3>\n'
            f'            <span class="archive-phase-badge">{meta["tag"]}</span>\n'
            f'          </div>\n'
            f'{inner_html}\n'
            f'        </div>'
        )


def build_phase_section(phase_id: str, site_dir: str, root_dir: str, is_archived: bool = False) -> str:
    """Instrada la costruzione della sezione corretta in base alla fase."""
    if phase_id == "candidatura":
        return build_candidatura_section(site_dir, root_dir, is_archived=is_archived)
    else:
        return build_generic_phase_section(phase_id, site_dir, root_dir, is_archived=is_archived)


def build_archive_section(archived_phases: list[str], site_dir: str, root_dir: str) -> str:
    """Costruisce la sezione Archivio contenente le fasi completate (vuota e nascosta se nessuna fase archiviata)."""
    if not archived_phases:
        return '<!-- Nessuna fase archiviata al momento -->'

    cards_html = []
    for ph in archived_phases:
        cards_html.append(build_phase_section(ph, site_dir, root_dir, is_archived=True))

    cards_combined = "\n".join(cards_html)
    return (
        f'      <section id="archivio" class="content-section">\n'
        f'        <div class="section-header-block">\n'
        f'          <h2 class="section-title">Archivio Documentale</h2>\n'
        f'          <p class="section-subtitle">\n'
        f'            Documentazione formale e verbali delle fasi di progetto precedentemente rilasciate e consolidate.\n'
        f'          </p>\n'
        f'        </div>\n\n'
        f'{cards_combined}\n'
        f'      </section>'
    )


def build_diapositive_html(slides: list[dict]) -> str:
    """Costruisce le card HTML delle presentazioni / diari di bordo ordinate LIFO."""
    if not slides:
        return '            <!-- Nessun diario di bordo presente al momento -->'

    lines = []
    for item in slides:
        rel_pdf = f"Diapositive/{item['filename']}"
        preview_img = f"assets/diapositive/ddb_{item['date']}_preview.png"
        display_title = f"Diario di Bordo {item['date']}"

        card = (
            f'            <a href="{rel_pdf}" target="_blank" rel="noopener noreferrer" class="slide-h-card" aria-label="Apri PDF del {display_title}">\n'
            f'              <div class="slide-h-preview">\n'
            f'                <img src="{preview_img}" alt="Anteprima slide {display_title}" class="slide-h-img" loading="lazy">\n'
            f'              </div>\n\n'
            f'              <div class="slide-h-body">\n'
            f'                <div class="slide-h-header">\n'
            f'                  <h4 class="slide-h-title">{display_title}</h4>\n'
            f'                  {SVG_SLIDE_ICON}\n'
            f'                </div>\n'
            f'                <p class="slide-h-desc">\n'
            f'                  Retrospettiva e diario di bordo periodico dell\'incontro di avanzamento.\n'
            f'                </p>\n'
            f'              </div>\n'
            f'            </a>'
        )
        lines.append(card)

    return "\n".join(lines)


def update_section(content: str, marker_name: str, new_html: str) -> str:
    """Sostituisce il blocco delimitato da marker dinamici con il nuovo HTML."""
    start_tag = f"<!-- DYNAMIC:{marker_name}_START -->"
    end_tag = f"<!-- DYNAMIC:{marker_name}_END -->"
    pattern = re.compile(rf"{re.escape(start_tag)}.*?{re.escape(end_tag)}", re.DOTALL)

    if pattern.search(content):
        return pattern.sub(f"{start_tag}\n{new_html}\n      {end_tag}", content)
    else:
        print(f"[WARN] Marker non trovato: {start_tag} ... {end_tag}")
        return content


def generate(site_dir: str, root_dir: str, phase_override: str | None = None):
    """Funzione principale di scansione, rendering anteprime e compilazione index.html."""
    print(f"[*] Avvio generatore dinamico sito RickandCommit...")
    print(f"[*] Root dir: {os.path.abspath(root_dir)}")
    print(f"[*] Site dir: {os.path.abspath(site_dir)}")

    index_html_path = os.path.join(site_dir, "index.html")
    if not os.path.isfile(index_html_path):
        print(f"ERRORE: {index_html_path} non trovato!")
        sys.exit(1)

    with open(index_html_path, "r", encoding="utf-8") as f:
        html_content = f.read()

    # 1. Rilevamento della fase attiva di progetto (Pila: Candidatura > RTB > PB)
    active_phase, archived_phases = detect_active_phase(root_dir, phase_override)
    print(f"[*] Fase attiva di progetto: {active_phase.upper()}")
    if archived_phases:
        print(f"[*] Fasi archiviate: {[p.upper() for p in archived_phases]}")
    else:
        print("[*] Nessuna fase archiviata (fase iniziale del progetto).")

    # 2. Aggiornamento Navbar dinamica
    navbar_html = build_navbar_html(active_phase, archived_phases)
    html_content = update_section(html_content, "NAVBAR", navbar_html)

    # 3. Costruzione della sezione attiva (in cima alla pila)
    active_section_html = build_phase_section(active_phase, site_dir, root_dir, is_archived=False)
    html_content = update_section(html_content, "ACTIVE_PHASE", active_section_html)

    # 4. Costruzione della sezione Archivio (vuota e nascosta se nessuna fase archiviata)
    archive_section_html = build_archive_section(archived_phases, site_dir, root_dir)
    html_content = update_section(html_content, "ARCHIVIO", archive_section_html)

    # 5. Diapositive / Diari di Bordo
    slide_dirs = [os.path.join(site_dir, "Diapositive"), os.path.join(root_dir, "Diapositive")]
    slide_files = list_documents_in_dirs(slide_dirs)
    slides_meta = []
    assets_diap_dir = os.path.join(site_dir, "assets", "diapositive")
    os.makedirs(assets_diap_dir, exist_ok=True)

    for p in slide_files:
        if not p.endswith(".pdf"):
            continue
        meta = extract_metadata_from_pdf(p)
        slides_meta.append(meta)
        preview_out = os.path.join(assets_diap_dir, f"ddb_{meta['date']}_preview.png")
        if render_pdf_first_page(p, preview_out):
            print(f"    [+] Generata anteprima slide: {preview_out}")

    slides_meta.sort(key=lambda x: x["date"], reverse=True)
    html_content = update_section(html_content, "DIAPOSITIVE", build_diapositive_html(slides_meta))

    # 6. Timestamp di rilascio nel footer
    now_str = datetime.now().strftime("%d/%m/%Y")
    last_update_html = (
        f'        <div class="footer-bottom-bar">\n'
        f'          <span class="footer-updated-badge">Ultimo aggiornamento: {now_str}</span>\n'
        f'        </div>'
    )
    html_content = update_section(html_content, "LAST_UPDATE", last_update_html)

    # Scrittura di index.html modificato
    with open(index_html_path, "w", encoding="utf-8") as f:
        f.write(html_content)

    print(f"[*] Sito aggiornato con successo: {index_html_path}")


def main():
    parser = argparse.ArgumentParser(description="Generatore dinamico sito RickandCommit.")
    parser.add_argument("--site-dir", default=None, help="Directory del sito (default: _site o .github/site)")
    parser.add_argument("--root-dir", default=".", help="Root directory del repository (default: .)")
    parser.add_argument("--phase", default=None, choices=["auto", "candidatura", "rtb", "pb"], help="Fase attiva del progetto")
    parser.add_argument("--update-source", action="store_true", help="Aggiorna anche i sorgenti in .github/site")
    args = parser.parse_args()

    root_dir = os.path.abspath(args.root_dir)
    site_dir = args.site_dir
    phase_override = None if args.phase == "auto" else args.phase

    if not site_dir:
        candidate_site = os.path.join(root_dir, "_site")
        if os.path.isdir(candidate_site):
            site_dir = candidate_site
        else:
            site_dir = os.path.join(root_dir, ".github", "site")

    generate(site_dir, root_dir, phase_override=phase_override)

    if args.update_source:
        src_site = os.path.join(root_dir, ".github", "site")
        if os.path.abspath(src_site) != os.path.abspath(site_dir):
            print(f"[*] Sincronizzazione sorgenti in {src_site}...")
            generate(src_site, root_dir, phase_override=phase_override)


if __name__ == "__main__":
    main()
