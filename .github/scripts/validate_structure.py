#!/usr/bin/env python3
"""
validate_structure.py — Validatore formale di struttura, naming e convenzioni.
Verifica la conformità dell'alberatura, dei nomi dei file (regole ISO 8601,
assenza di spazi e caratteri non-ASCII) e l'integrità dei sorgenti Typst
secondo le regole operative del gruppo RickandCommit.
"""

import os
import sys
import re
import argparse
import subprocess

# Regex di conformità naming (da regole.md)
REGEX_VERBALE_INTERNO = re.compile(r"^\d{4}-\d{2}-\d{2}_Verbale_Interno\.(typ|pdf)$")
REGEX_VERBALE_ESTERNO = re.compile(r"^\d{4}-\d{2}-\d{2}_Verbale_Esterno_[A-Za-z0-9]+(_firmato)?\.(typ|pdf)$", re.IGNORECASE)
REGEX_DIARIO_DI_BORDO = re.compile(r"^\d{4}-\d{2}-\d{2}_Diario_di_Bordo\.pdf$")
REGEX_LETTERA_PRESENTAZIONE = re.compile(r"^\d{4}-\d{2}-\d{2}_Lettera_di_Presentazione\.(typ|pdf)$")
REGEX_DOC_BASELINE = re.compile(r"^[A-Z][a-zA-Z0-9_]+\.(typ|pdf)$")


def check_forbidden_characters(root_dir: str) -> list[str]:
    """Verifica che nessun file o cartella contenga spazi o caratteri non-ASCII."""
    errors = []
    ignored_dirs = {".git", ".typst", "_site", "node_modules", "__pycache__"}

    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Escludi cartelle di sistema/cache
        dirnames[:] = [d for d in dirnames if d not in ignored_dirs]

        for name in dirnames + filenames:
            rel_path = os.path.relpath(os.path.join(dirpath, name), root_dir)
            if " " in name:
                errors.append(f"[SPAZI VIETATI] Il percorso contiene spazi: '{rel_path}'")
            try:
                name.encode("ascii")
            except UnicodeEncodeError:
                errors.append(f"[CARATTERI NON-ASCII] Il percorso contiene caratteri speciali/accentati: '{rel_path}'")

    return errors


def check_directory_structure(root_dir: str) -> list[str]:
    """Verifica la corretta alberatura e nomenclatura dei file nelle cartelle formali."""
    errors = []

    # 1. Candidatura - Verbali Interni
    int_dir = os.path.join(root_dir, "Candidatura", "Verbali", "Interni")
    if os.path.isdir(int_dir):
        for f in os.listdir(int_dir):
            if f.startswith(".") or f == ".gitkeep":
                continue
            if not REGEX_VERBALE_INTERNO.match(f):
                errors.append(
                    f"[NAMING ERRATO] File verbale interno non conforme: '{f}'. "
                    f"Formato atteso: 'AAAA-MM-GG_Verbale_Interno.typ'"
                )

    # 2. Candidatura - Verbali Esterni
    ext_dir = os.path.join(root_dir, "Candidatura", "Verbali", "Esterni")
    if os.path.isdir(ext_dir):
        for f in os.listdir(ext_dir):
            if f.startswith(".") or f == ".gitkeep":
                continue
            if not REGEX_VERBALE_ESTERNO.match(f):
                errors.append(
                    f"[NAMING ERRATO] File verbale esterno non conforme: '{f}'. "
                    f"Formato atteso: 'AAAA-MM-GG_Verbale_Esterno_<Azienda>_firmato.pdf'"
                )

    # 3. Diapositive
    diap_dir = os.path.join(root_dir, "Diapositive")
    if os.path.isdir(diap_dir):
        for f in os.listdir(diap_dir):
            if f.startswith(".") or f == ".gitkeep":
                continue
            if not REGEX_DIARIO_DI_BORDO.match(f):
                errors.append(
                    f"[NAMING ERRATO] File diario di bordo non conforme: '{f}'. "
                    f"Formato atteso: 'AAAA-MM-GG_Diario_di_Bordo.pdf'"
                )

    # 4. Candidatura - Documenti Principali
    cand_dir = os.path.join(root_dir, "Candidatura")
    if os.path.isdir(cand_dir):
        for f in os.listdir(cand_dir):
            if f in ("Verbali", ".gitkeep") or os.path.isdir(os.path.join(cand_dir, f)):
                continue
            if f.endswith("Lettera_di_Presentazione.typ"):
                if not REGEX_LETTERA_PRESENTAZIONE.match(f):
                    errors.append(
                        f"[NAMING ERRATO] Lettera di Presentazione non conforme: '{f}'. "
                        f"Formato atteso: 'AAAA-MM-GG_Lettera_di_Presentazione.typ'"
                    )
            elif f.endswith(".typ"):
                if not REGEX_DOC_BASELINE.match(f):
                    errors.append(
                        f"[NAMING ERRATO] Documento di baseline non conforme: '{f}'. "
                        f"Formato atteso: 'Nome_Documento.typ' (senza versione nel nome file sorgente)"
                    )

    return errors


def test_typst_compilation(root_dir: str) -> list[str]:
    """Testa la compilazione di tutti i file Typst (.typ) presenti nel repository."""
    errors = []
    typ_files = []

    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Escludi cartelle di sistema
        if any(ignored in dirpath for ignored in [".git", "_site", ".typst", "node_modules"]):
            continue
        for f in filenames:
            if f.endswith(".typ") and not f == "template.typ":
                typ_files.append(os.path.join(dirpath, f))

    if not typ_files:
        print("[INFO] Nessun file Typst da compilare trovato.")
        return []

    print(f"[*] Individuati {len(typ_files)} file Typst da verificare...")
    temp_out = os.path.join(root_dir, "_temp_check.pdf")

    for tf in typ_files:
        rel_tf = os.path.relpath(tf, root_dir)
        print(f"    -> Verifica compilazione: {rel_tf}...")
        cmd = ["typst", "compile", "--root", root_dir, tf, temp_out]
        try:
            res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            if res.returncode != 0:
                errors.append(f"[ERRORE COMPILAZIONE] {rel_tf}:\n{res.stderr.strip()}")
            else:
                if os.path.isfile(temp_out):
                    os.remove(temp_out)
        except FileNotFoundError:
            print("[WARN] Eseguibile 'typst' non presente nel PATH locale. Salto la compilazione.")
            break
        except Exception as e:
            errors.append(f"[ERRORE SISTEMA] Compilazione fallita per {rel_tf}: {e}")

    if os.path.isfile(temp_out):
        os.remove(temp_out)

    return errors


def main():
    parser = argparse.ArgumentParser(description="Validatore convenzioni e naming RickandCommit.")
    parser.add_argument("--root-dir", default=".", help="Root directory del repository")
    parser.add_argument("--skip-typst", action="store_true", help="Salta la compilazione Typst")
    args = parser.parse_args()

    root_dir = os.path.abspath(args.root_dir)
    print("=" * 60)
    print(" RickandCommit — Controllo Qualità Struttura e Documenti")
    print(f" Root: {root_dir}")
    print("=" * 60)

    all_errors = []

    # 1. Controllo caratteri vietati
    print("[1/3] Controllo assenza spazi e caratteri non-ASCII...")
    char_errors = check_forbidden_characters(root_dir)
    all_errors.extend(char_errors)
    if not char_errors:
        print("      Conforme: nessun carattere non valido trovato.")
    else:
        for err in char_errors:
            print(f"      {err}")

    # 2. Controllo naming e convenzioni cartelle
    print("[2/3] Controllo alberatura cartelle e convenzioni naming...")
    struct_errors = check_directory_structure(root_dir)
    all_errors.extend(struct_errors)
    if not struct_errors:
        print("      Conforme: alberatura e convenzioni rispettate.")
    else:
        for err in struct_errors:
            print(f"      {err}")

    # 3. Compilazione Typst
    if not args.skip_typst:
        print("[3/3] Controllo compilazione Typst con template condiviso...")
        typst_errors = test_typst_compilation(root_dir)
        all_errors.extend(typst_errors)
        if not typst_errors:
            print("      Conforme: tutti i file Typst compilano regolarmente.")
        else:
            for err in typst_errors:
                print(f"      {err}")
    else:
        print("[3/3] Compilazione Typst saltata (--skip-typst).")

    print("-" * 60)
    if all_errors:
        print(f"FALLITO: Trovati {len(all_errors)} errori di conformità.")
        sys.exit(1)
    else:
        print("SUPERATO: Tutti i controlli sono stati superati con successo.")
        sys.exit(0)


if __name__ == "__main__":
    main()
