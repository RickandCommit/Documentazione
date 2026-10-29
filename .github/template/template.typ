// Template verbale di riunione — RickandCommit
// File da nominare: AAAA-MM-GG_Verbale_Interno.typ oppure AAAA-MM-GG_Verbale_Esterno_<Azienda>.typ
// Progetto di Ingegneria del Software (a.a. 2026/2027) — Università di Padova

#let data-verbale = "AAAA-MM-GG"
#let tipo-verbale = "Verbale Interno" // Cambiare in "Verbale Esterno" se applicabile

#set document(title: tipo-verbale + " " + data-verbale + " — RickandCommit", author: "RickandCommit")
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  footer: context [
    #line(length: 100%, stroke: 0.5pt + rgb("#b5b5b5"))
    #v(-0.2cm)
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: (left + horizon, center + horizon, right + horizon),
      [
        #box(height: 11pt, baseline: 15%)[#image("neon_logo.png")]
        #h(4pt)
        #text(size: 9pt, weight: "bold")[RickandCommit]
      ],
      [#text(size: 9pt)[#counter(page).display()]],
      [#text(size: 9pt)[#tipo-verbale #data-verbale]],
    )
  ],
)
#set text(font: "Libertinus Serif", size: 12pt, lang: "it")
#set heading(numbering: "1.1")
#set par(justify: true, leading: 0.68em)

#show heading.where(level: 1): it => block(above: 1.8em, below: 1em)[
  #text(size: 15pt, weight: "bold")[#it]
]
#show heading.where(level: 2): it => block(above: 1.4em, below: 0.8em)[
  #text(size: 13pt, weight: "bold")[#it]
]

#let issue(n) = link("https://github.com/RickandCommit/Documentazione/issues/" + str(n))[#text(fill: rgb("#0969da"))[#underline[\##n]]]
#let nessuna = [Nessuna azione operativa.]

// ==================== FRONTESPIZIO ====================
#align(center)[
  #grid(
    columns: (auto, auto),
    column-gutter: 2cm,
    align: horizon,
    [#image("neon_completo.png", width: 5.5cm)],
    [#image("unipd_logo.png", width: 3.5cm)],
  )
  #v(0.3cm)
  #text(size: 11pt)[Università di Padova]
  #v(0.05cm)
  #text(size: 10.5pt)[Corso di Ingegneria del Software · A.A. 2026/2027]
  #v(0.6cm)
  #text(size: 26pt, weight: "bold")[Verbale del [Numero] Incontro]
  #v(0.25cm)
  #text(size: 10pt, style: "italic")[Versione v1.0.0 · Ultima modifica: AAAA-MM-GG]
]

#v(0.5cm)

// ==================== INFORMAZIONI GENERALI ====================
#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 7pt,
  [*Data*], [#data-verbale],
  [*Ora inizio – Ora fine*], [00.00 – 00.00],
  [*Modalità*], [via Discord], // oppure [via Microsoft Teams], [in presenza], ecc.
  [*Redattore*], [Nome Cognome],
  [*Verificatore*], [Nome Cognome],
  [*Destinatari*], [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
)

#v(0.4cm)

// ==================== 1. REGISTRO DELLE MODIFICHE ====================
= Registro delle modifiche

#text(size: 10pt)[
#table(
  columns: (1.5cm, 2.2cm, 2.8cm, 2.8cm, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Versione*],
  table.cell(align: center)[*Data*],
  table.cell(align: center)[*Autore*],
  table.cell(align: center)[*Verificatore*],
  [*Descrizione*],
  [1.0.0], [AAAA-MM-GG], [Nome Cognome], [Nome Cognome], [Prima stesura del verbale approvata],
  [0.1.0], [AAAA-MM-GG], [Nome Cognome], [Nome Cognome], [Bozza iniziale della riunione],
)
]

#pagebreak()
#outline(title: "Indice")
#pagebreak()

// ==================== 2. PARTECIPANTI ====================
= Partecipanti

#table(
  columns: (1fr, auto),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Nome Cognome*], table.cell(align: center)[*Presenza*],
  [Jatin Bajaj], table.cell(align: center)[P],
  [Dorde Blagojevic], table.cell(align: center)[P],
  [Nicola Bonetto], table.cell(align: center)[P],
  [Francesco Furin], table.cell(align: center)[P],
  [Luka Lacic], table.cell(align: center)[P],
  [Alessandro Rasia dal Polo], table.cell(align: center)[P],
  [Sara Stefani], table.cell(align: center)[P],
)

#v(0.1cm)
#text(size: 8.5pt, style: "italic")[Legenda: P = Presente · A = Assente]

#v(0.4cm)

// ==================== 3. ORDINE DEL GIORNO ====================
= Ordine del giorno

+ Primo punto all'ordine del giorno
+ Secondo punto all'ordine del giorno
+ Terzo punto all'ordine del giorno

// ==================== 4. SVOLGIMENTO DELLA RIUNIONE ====================
= Svolgimento della riunione

== Primo punto all'ordine del giorno

Descrizione dettagliata della discussione e dei temi affrontati durante il primo punto.

== Secondo punto all'ordine del giorno

Descrizione dettagliata della discussione e dei temi affrontati durante il secondo punto.

== Terzo punto all'ordine del giorno

Descrizione dettagliata della discussione e dei temi affrontati durante il terzo punto.

// ==================== 5. CONCLUSIONI ====================
= Conclusioni

Breve riassunto dei risultati dell'incontro e indicazione dei passi successivi concordati dal gruppo.

#pagebreak()

// ==================== 6. DECISIONI E AZIONI NEL BACKLOG ====================
= Decisioni e azioni nel Backlog

#text(size: 10pt)[
#table(
  columns: (2.8cm, 3.8cm, 3.8cm, 2.3cm, 2.0cm, 1.3cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*ID*], [*Decisione*], [*Azione*], [*Incaricato*], [*Scadenza*], table.cell(align: center)[*Issue*],
  [VI\_AAAA-MM-GG.D1], [Descrizione sintetica della decisione presa.], [Azione operativa da svolgere.], [Nome Cognome], [AAAA-MM-GG], [#issue(1)],
  [VI\_AAAA-MM-GG.D2], [Descrizione sintetica di una decisione informativa.], [#nessuna], [—], [—], [—],
)
]
