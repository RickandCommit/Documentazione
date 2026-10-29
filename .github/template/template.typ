// Template ufficiale del gruppo RickandCommit — Ingegneria del Software (UniPD)
// Repository: RickandCommit/Documentazione

#let issue(n) = link("https://github.com/RickandCommit/Documentazione/issues/" + str(n))[#text(fill: rgb("#0969da"))[#underline[\##n]]]
#let nessuna = [Nessuna azione operativa.]

// Asset grafici condivisi (risolti relativamente a questo file template)
#let logo-inline = box(height: 11pt, baseline: 15%)[#image("assets/neon_logo.png")]
#let logo-completo(width: 5.5cm) = image("assets/neon_completo.png", width: width)
#let logo-unipd(width: 3.5cm) = image("assets/unipd_logo.png", width: width)

// ==================== TEMPLATE VERBALE ====================
#let verbale(
  titolo: "",
  tipo: "Verbale Interno",
  data: "",
  versione: "v1.0.0",
  ultima-modifica: "",
  ora-inizio: "",
  ora-fine: "",
  modalita: "Discord",
  redattore: "",
  verificatore: "",
  destinatari: [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
  body
) = {
  set document(title: tipo + " " + data + " — RickandCommit", author: "RickandCommit")
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    footer: context [
      #line(length: 100%, stroke: 0.5pt + rgb("#b5b5b5"))
      #v(-0.2cm)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        [
          #logo-inline
          #h(4pt)
          #text(size: 9pt, weight: "bold")[RickandCommit]
        ],
        [#text(size: 9pt)[#counter(page).display()]],
        [#text(size: 9pt)[#tipo #data]],
      )
    ],
  )
  set text(font: "Libertinus Serif", size: 12pt, lang: "it")
  set heading(numbering: "1.1")
  set par(justify: true, leading: 0.68em)

  show heading.where(level: 1): it => block(above: 1.8em, below: 1em)[
    #text(size: 15pt, weight: "bold")[#it]
  ]
  show heading.where(level: 2): it => block(above: 1.4em, below: 0.8em)[
    #text(size: 13pt, weight: "bold")[#it]
  ]

  // ==================== FRONTESPIZIO ====================
  align(center)[
    #grid(
      columns: (auto, auto),
      column-gutter: 2cm,
      align: horizon,
      [#logo-completo(width: 5.5cm)],
      [#logo-unipd(width: 3.5cm)],
    )
    #v(0.3cm)
    #text(size: 11pt)[Università di Padova]
    #v(0.05cm)
    #text(size: 10.5pt)[Corso di Ingegneria del Software · A.A. 2026/2027]
    #v(0.6cm)
    #text(size: 26pt, weight: "bold")[#titolo]
    #v(0.25cm)
    #text(size: 10pt, style: "italic")[Versione #versione · Ultima modifica: #ultima-modifica]
  ]

  v(0.5cm)

  // ==================== INFORMAZIONI GENERALI ====================
  table(
    columns: (auto, 1fr),
    stroke: 0.5pt + rgb("#b5b5b5"),
    inset: 7pt,
    [*Data*], [#data],
    [*Ora inizio – Ora fine*], [#ora-inizio – #ora-fine],
    [*Modalità*], [#modalita],
    [*Redattore*], [#redattore],
    [*Verificatore*], [#verificatore],
    [*Destinatari*], [#destinatari],
  )

  v(0.4cm)

  body
}

// ==================== TEMPLATE DOCUMENTO GENERALE ====================
#let documento(
  titolo: "",
  sottotitolo: "",
  versione: "v1.0.0",
  data: "",
  stato: "Approvato",
  uso: "Esterno",
  redattori: (),
  verificatori: (),
  destinatari: [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
  body
) = {
  set document(title: titolo + " — RickandCommit", author: "RickandCommit")
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    footer: context [
      #line(length: 100%, stroke: 0.5pt + rgb("#b5b5b5"))
      #v(-0.2cm)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        [
          #logo-inline
          #h(4pt)
          #text(size: 9pt, weight: "bold")[RickandCommit]
        ],
        [#text(size: 9pt)[#counter(page).display()]],
        [#text(size: 9pt)[#titolo]],
      )
    ],
  )
  set text(font: "Libertinus Serif", size: 12pt, lang: "it")
  set heading(numbering: "1.1")
  set par(justify: true, leading: 0.68em)

  show heading.where(level: 1): it => block(above: 1.8em, below: 1em)[
    #text(size: 15pt, weight: "bold")[#it]
  ]
  show heading.where(level: 2): it => block(above: 1.4em, below: 0.8em)[
    #text(size: 13pt, weight: "bold")[#it]
  ]

  // Frontespizio documento
  align(center)[
    #grid(
      columns: (auto, auto),
      column-gutter: 2cm,
      align: horizon,
      [#logo-completo(width: 5.5cm)],
      [#logo-unipd(width: 3.5cm)],
    )
    #v(0.3cm)
    #text(size: 11pt)[Università di Padova]
    #v(0.05cm)
    #text(size: 10.5pt)[Corso di Ingegneria del Software · A.A. 2026/2027]
    #v(0.6cm)
    #text(size: 26pt, weight: "bold")[#titolo]
    #if sottotitolo != "" [
      #v(0.2cm)
      #text(size: 14pt)[#sottotitolo]
    ]
    #v(0.25cm)
    #text(size: 10pt, style: "italic")[Versione #versione · Data: #data]
  ]

  v(0.5cm)

  table(
    columns: (auto, 1fr),
    stroke: 0.5pt + rgb("#b5b5b5"),
    inset: 7pt,
    [*Versione*], [#versione],
    [*Data approvazione*], [#data],
    [*Stato*], [#stato],
    [*Uso*], [#uso],
    [*Redattori*], [#if type(redattori) == array { redattori.join(" \\ ") } else { redattori }],
    [*Verificatori*], [#if type(verificatori) == array { verificatori.join(" \\ ") } else { verificatori }],
    [*Destinatari*], [#destinatari],
  )

  v(0.4cm)

  body
}
