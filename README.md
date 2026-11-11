<div align="center">

# Documentazione
### Gruppo RickandCommit · Corso di Ingegneria del Software (A.A. 2026/2027)
**Università di Padova**

[![Stato Documentazione](https://img.shields.io/badge/Documentazione-Attiva-0969da?style=for-the-badge&logo=github)](https://rickandcommit.github.io/Documentazione/)
[![Capitolato C2](https://img.shields.io/badge/Capitolato-C2%20NEXUM%20Concierge-10b981?style=for-the-badge)](https://www.eggon.coach/)
[![Typst](https://img.shields.io/badge/Tipografia-Typst-239dad?style=for-the-badge&logo=typst)](https://typst.app/)
[![Licenza](https://img.shields.io/badge/Licenza-MIT-gray?style=for-the-badge)](LICENSE)

[🌐 **Sito Web Documentazione (GitHub Pages)**](https://rickandcommit.github.io/Documentazione/) · [📋 **Project Board (Kanban)**](https://github.com/orgs/RickandCommit/projects) · [📧 **Contatto Email**](mailto:rickandcommit@gmail.com)

</div>

---

## 📌 Panoramica del Progetto

Il presente repository raccoglie l'intera documentazione tecnica, gestionale e formale prodotta dal gruppo **RickandCommit** per il progetto didattico del corso di **Ingegneria del Software** (Laurea Triennale in Informatica, Università di Padova, a.a. 2026/2027).

A seguito della fase di valutazione comparativa e candidatura, al gruppo è stato ufficialmente aggiudicato l'appalto per il capitolato:
* **Capitolato:** **C2 — NEXUM Concierge** (Piattaforma avanzata di Customer Relationship Management e concierge virtuale per strutture ricettive)
* **Azienda Proponente:** **Eggon S.r.l.**
* **Committenti:** Prof. Tullio Vardanega, Prof. Riccardo Cardin

---

## 📂 Struttura della Repository

L'alberatura delle cartelle è organizzata per fasi di avanzamento del ciclo di vita del progetto (*baselines*):

```text
Documentazione/
│
├── .github/                         # Infrastruttura di automazione e supporto (nascosta)
│   ├── workflows/                   # GitHub Actions (validazione, build e deploy Pages)
│   ├── scripts/                     # Script di utilità (validate_structure.py, generate_site.py)
│   ├── template/                    # Motore Typst condiviso (template.typ e loghi istituzionali)
│   └── site/                        # Sorgenti del sito vetrina pubblicato su GitHub Pages
│
├── Candidatura/                     # Baseline 1: Documenti per la candidatura all'appalto (Conclusa)
│   ├── 2026-10-30_Lettera_di_Presentazione.typ
│   ├── Valutazione_dei_Capitolati.typ
│   ├── Dichiarazione_degli_Impegni.typ
│   └── Verbali/                     # Verbali interni ed esterni della fase di Candidatura
│       ├── Interni/
│       └── Esterni/
│
├── RTB/                             # Baseline 2: Requirements and Technology Baseline (Fase Attiva)
│   ├── Verbali/
│   │   ├── Interni/                 # Verbali riunioni interne RTB
│   │   └── Esterni/                 # Verbali incontri con Eggon S.r.l. (firmati)
│   └── ...                          # Documenti di baseline (Norme di Progetto, Glossario, ecc.)
│
├── PB/                              # Baseline 3: Product Baseline (Fase Futura)
│   └── ...
│
├── Diapositive/                     # Presentazioni periodiche dei Diari di Bordo (formato PDF)
│   ├── 2026-10-26_Diario_di_Bordo.pdf
│   └── 2026-11-02_Diario_di_Bordo.pdf
│
└── README.md                        # Questa guida
```

---

## ⚙️ Compilazione Locale dei Documenti Typst

Tutti i documenti formali e i verbali sono redatti in **Typst** (`.typ`), garantendo una composizione tipografica coerente e di qualità istituzionale.

### Prerequisiti
* Installare l'eseguibile di Typst (`>= 0.11.0`):
  * **Windows (winget):** `winget install --id Typst.Typst`
  * **macOS (brew):** `brew install typst`
  * **Linux (cargo):** `cargo install --locked typst-cli`

### Compilazione di un Documento o Verbale
Tutti i file `.typ` importano il template condiviso situato in `.github/template/template.typ`. Per compilare correttamente qualsiasi file senza errori di sandbox, specificare la root del repository tramite `--root .`:

```bash
# Compilazione di un verbale interno
typst compile --root . Candidatura/Verbali/Interni/2026-10-21_Verbale_Interno.typ output.pdf

# Compilazione di un documento principale con controllo continuo (--watch)
typst watch --root . Candidatura/Valutazione_dei_Capitolati.typ Valutazione_dei_Capitolati.pdf

# (Opzionale) Controllo automatico di conformità e compilazione
python .github/scripts/validate_structure.py --root-dir .
```

---

## 🔄 Flusso di Lavoro e Processo di Rilascio

Per conformità alle direttive di progetto, ogni modifica documentale segue un rigoroso processo a 4 stadi:

```
[ 1. Redazione ] ──▶ [ 2. Verifica ] ──▶ [ 3. Approvazione ] ──▶ [ 4. Rilascio ]
  Redattore             Verificatore          Responsabile            Merge su main
  (stesura v0.x)       (indipendente)         (autocratica)         (v1.0.0 / PDF)
```

1. **Redazione:** il Redattore incaricato sviluppa i contenuti su un branch dedicato (`doc/<nome>`, `verbale/interno-<data>`, `template/<nome>`).
2. **Verifica Indipendente:** un componente terzo controlla ortografia, chiarezza, aderenza alle convenzioni e conformità tecnica (*Autore $\neq$ Verificatore*).
3. **Approvazione:** il **Responsabile di Progetto** valida autocraticamente il documento verificato, certifcandone l'esito formale.
4. **Rilascio Ufficiale:** la Pull Request viene unita in `main` e la GitHub Action compila automaticamente i PDF aggiornati pubblicandoli su GitHub Pages.

---

## 📜 Convenzione di Versionamento (`vX.Y.Z`)

* **`X` (Major):** Rilascio formale di baseline (`v1.0.0` per Candidatura/RTB, `v2.0.0` per PB).
* **`Y` (Minor):** Aggiunta di nuove sezioni, completamento capitoli o modifiche strutturali.
* **`Z` (Patch):** Correzione di refusi, allineamenti formali o migliorie stilistiche.

Ogni documento include un **Registro delle Modifiche** cronologico inverso (LIFO) posto prima dell'indice dei contenuti.

---

## 📬 Contatti e Riferimenti

* **Repository:** [https://github.com/RickandCommit/Documentazione](https://github.com/RickandCommit/Documentazione)
* **Sito Web Pubblico:** [https://rickandcommit.github.io/Documentazione/](https://rickandCommit.github.io/Documentazione/)
* **Email Ufficiale:** [rickandcommit@gmail.com](mailto:rickandcommit@gmail.com)
* **Organizzazione GitHub:** [RickandCommit](https://github.com/RickandCommit)
