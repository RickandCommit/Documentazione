#set document(title: "Glossario — RickandCommit", author: "RickandCommit")
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
      [#text(size: 9pt)[Glossario v0.1.0]],
    )
  ],
)
#set text(font: "Libertinus Serif", size: 12pt, lang: "it")

#set heading(numbering: none)
#set par(justify: true, leading: 0.68em)

#show heading.where(level: 1): it => block(above: 1.8em, below: 1em)[
  #text(size: 16pt, weight: "bold")[#it]
]
#show heading.where(level: 2): it => block(above: 1.4em, below: 0.8em)[
  #text(size: 13pt, weight: "bold")[#it]
]

#let issue(n) = link("https://github.com/RickandCommit/Documentazione/issues/" + str(n))[#text(fill: rgb("#0969da"))[#underline[\##n]]]

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
  #text(size: 26pt, weight: "bold")[Glossario]
  #v(0.25cm)
  #text(size: 10pt, style: "italic")[Versione v0.1.0 · Ultima modifica: 2026-11-09]
]

#v(0.5cm)

// ==================== INFORMAZIONI GENERALI ====================
#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 7pt,
  [*Data*], [2026-11-09],
  [*Stato*], [In redazione],
  [*Redattore*], [Jatin Bajaj],
  [*Verificatore*], [Sara Stefani],
  [*Responsabile*], [Francesco Furin],
  [*Destinatari*], [Prof. Tullio Vardanega \ Prof. Riccardo Cardin \ Eggon S.r.l.],
)

#v(0.4cm)

// ==================== REGISTRO DELLE MODIFICHE ====================
#heading(level: 1, outlined: false)[Registro delle modifiche]

#text(size: 8.5pt)[
#table(
  // 1.8cm garantisce che "Versione" rimanga tutto su una riga
  columns: (1.8cm, 2.1cm, 1fr, 2.8cm, 2.8cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5.5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Versione*],
  table.cell(align: center)[*Data*],
  [*Descrizione*],
  table.cell(align: center)[*Autore*],
  table.cell(align: center)[*Verificatore*],

  [0.1.0], [2026-11-09], [Prima stesura del Glossario con i termini di capitolato C2, tecnologie AI e concetti di Ingegneria del Software], [Jatin Bajaj], [Sara Stefani],
)
]

#pagebreak()
#outline(title: "Indice")
#pagebreak()

// ==================== 1. INTRODUZIONE ====================
= Introduzione

== Finalità del documento
Il presente documento costituisce il *Glossario* ufficiale redatto dal gruppo *RickandCommit* per il progetto didattico di Ingegneria del Software (A.A. 2026/2027), relativo al capitolato d'appalto *C2 - NEXUM: Concierge per Richieste Operative* proposto dall'azienda *Eggon S.r.l.*.

Il documento ha la finalità di:
- Chiarire ed eliminare qualsiasi forma di ambiguità o soggettività riguardante la terminologia utilizzata all'interno dei documenti di progetto;
- Fornire una definizione univoca e condivisa per tutti gli stakeholder (fornitori, committenti e proponente);
- Definire i concetti chiave relativi al dominio di business (gestione ferie e permessi HR), alle tecnologie adottate (LLM, RAG, architetture conversazionali) e al processo metodologico ingegneristico.

== Convenzione tipografica
All'interno dell'intera documentazione ufficiale di progetto (Analisi dei Requisiti, Norme di Progetto, Piano di Progetto, Piano di Qualifica e Verbali), la prima occorrenza di ciascun termine definito nel presente Glossario viene evidenziata con una *G ad apice*, come nel seguente esempio:
#align(center)[
  #text(style: "italic")[termine]#super[G]
]
La marcatura è limitata alla sola prima comparsa del termine all'interno di ciascun documento o capitolo, al fine di preservare la scorrevolezza e la leggibilità del testo.

#pagebreak()

// ==================== 2. SEZIONI ALFABETICHE ====================
#let data-glossario = yaml("glossario.yml")

#for (lettera, termini) in data-glossario [
  = #lettera
  #v(0.2cm)
  
  #if termini != none and termini.len() > 0 [
    #for (parola, definizione) in termini [
      #block(width: 100%, breakable: false, inset: (bottom: 0.8em))[
        #text(weight: "bold", size: 11pt)[#parola] \
        #v(-0.15cm)
        #text(size: 10.5pt)[#definizione]
      ]
    ]
  ] else [
    #v(0.5cm)
    #text(style: "italic", fill: rgb("#777777"))[Nessun termine registrato al momento per questa sezione.]
  ]

  #if lettera != "Z" [
    #pagebreak()
  ]
]