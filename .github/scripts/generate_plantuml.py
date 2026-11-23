#!/usr/bin/env python3
"""Genera SVG temporanei dai file PlantUML per la compilazione Typst."""

from pathlib import Path
import subprocess
import sys

root = Path(__file__).resolve().parents[2]
src = root / "RTB" / "Analisi_dei_Requisiti" / "Casi_Uso"
sources = sorted(src.glob("*.puml"))

if not sources:
    print("PlantUML: nessun sorgente .puml; generazione saltata.")
    sys.exit(0)

out = src / "out"
out.mkdir(exist_ok=True)

for source in sources:
    print(f"PlantUML: controllo {source.name}")
    subprocess.run(["plantuml", "-checkonly", str(source)], check=True, cwd=src)
    svg = out / f"{source.stem}.svg"
    with source.open("rb") as inp, svg.open("wb") as result:
        subprocess.run(["plantuml", "-tsvg", "-pipe"], stdin=inp, stdout=result, check=True, cwd=src)
    if not svg.is_file() or b"<svg" not in svg.read_bytes():
        raise RuntimeError(f"SVG non valido: {svg}")

print(f"PlantUML: generati {len(sources)} SVG in {out.relative_to(root)}")
