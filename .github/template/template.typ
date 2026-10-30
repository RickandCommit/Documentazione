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
  redattori: (),
  verificatore: "",
  verificatori: (),
  destinatari: [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
  body
) = {
  let doc-title = if titolo != "" {
    tipo + " (" + titolo + ") " + data + " — RickandCommit"
  } else {
    tipo + " " + data + " — RickandCommit"
  }
  set document(title: doc-title, author: "RickandCommit")
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

  // Normalizzazione e formattazione redattori e verificatori (con virgola se multipli)
  let red-val = if redattori != () { redattori } else { redattore }
  let ver-val = if verificatori != () { verificatori } else { verificatore }

  let label-red = if type(red-val) == array and red-val.len() > 1 { [*Redattori*] } else { [*Redattore*] }
  let label-ver = if type(ver-val) == array and ver-val.len() > 1 { [*Verificatori*] } else { [*Verificatore*] }

  let formatted-red = if type(red-val) == array { red-val.join(", ") } else { red-val }
  let formatted-ver = if type(ver-val) == array { ver-val.join(", ") } else { ver-val }

  // ==================== INFORMAZIONI GENERALI ====================
  table(
    columns: (auto, 1fr),
    stroke: 0.5pt + rgb("#b5b5b5"),
    inset: 7pt,
    [*Data*], [#data],
    [*Ora inizio – Ora fine*], [#ora-inizio – #ora-fine],
    [*Modalità*], [#modalita],
    [#label-red], [#formatted-red],
    [#label-ver], [#formatted-ver],
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

  let label-doc-red = if type(redattori) == array and redattori.len() == 1 { [*Redattore*] } else { [*Redattori*] }
  let label-doc-ver = if type(verificatori) == array and verificatori.len() == 1 { [*Verificatore*] } else { [*Verificatori*] }

  table(
    columns: (auto, 1fr),
    stroke: 0.5pt + rgb("#b5b5b5"),
    inset: 7pt,
    [*Versione*], [#versione],
    [*Data approvazione*], [#data],
    [*Stato*], [#stato],
    [*Uso*], [#uso],
    [#label-doc-red], [#if type(redattori) == array { redattori.join(", ") } else { redattori }],
    [#label-doc-ver], [#if type(verificatori) == array { verificatori.join(", ") } else { verificatori }],
    [*Destinatari*], [#destinatari],
  )

  v(0.4cm)

  body
}

// ==================== TEMPLATE LETTERA DI PRESENTAZIONE ====================
#let lettera(
  titolo: "Lettera di Presentazione",
  data: "30 Ottobre 2026",
  destinatari: [
    *Ai gentili Committenti:* \
    Prof. Tullio Vardanega \
    Prof. Riccardo Cardin \
    Università di Padova \
    Dipartimento di Matematica «Tullio Levi-Civita»
  ],
  mittente: [
    *Mittente:* \
    Gruppo *RickandCommit* \
    Email: #link("mailto:rickandcommit@gmail.com")[rickandcommit\@gmail.com] \
    \
    *Data:* 30 Ottobre 2026
  ],
  body
) = {
  set document(title: titolo + " — RickandCommit", author: "RickandCommit")
  set page(
    paper: "a4",
    margin: (top: 2.2cm, bottom: 2.2cm, left: 2.5cm, right: 2.5cm),
    header: context {
      if here().page() > 1 [
        #grid(
          columns: (1fr, 1fr),
          align: (left + horizon, right + horizon),
          [
            #logo-inline
            #h(4pt)
            #text(size: 8.5pt, weight: "bold")[RickandCommit]
          ],
          [#text(size: 8.5pt, fill: rgb("#4b5563"))[#titolo]],
        )
        #v(-0.15cm)
        #line(length: 100%, stroke: 0.5pt + rgb("#b5b5b5"))
      ]
    },
    footer: context [
      #line(length: 100%, stroke: 0.5pt + rgb("#b5b5b5"))
      #v(-0.2cm)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        [
          #logo-inline
          #h(4pt)
          #text(size: 8.5pt, weight: "bold")[RickandCommit]
        ],
        [#text(size: 8.5pt)[#counter(page).display()]],
        [#text(size: 8.5pt)[Candidatura — #data]],
      )
    ]
  )
  set text(font: "Libertinus Serif", size: 10.5pt, lang: "it")
  set par(justify: true, leading: 0.62em)

  // Intestazione con loghi in cima alla prima pagina
  grid(
    columns: (1fr, 1fr),
    align: (left + horizon, right + horizon),
    [#logo-completo(width: 4.8cm)],
    [#logo-unipd(width: 3.2cm)],
  )
  v(0.15cm)
  line(length: 100%, stroke: 0.5pt + rgb("#b5b5b5"))
  v(0.35cm)

  // Griglia Mittente e Destinatari
  grid(
    columns: (1fr, 1.2fr),
    gutter: 1cm,
    mittente,
    destinatari,
  )

  v(0.35cm)

  body
}

