#import "../.github/template/template.typ": *

#show: documento.with(
  titolo: "Glossario",
  sottotitolo: "Definizione univoca dei termini e della terminologia di dominio",
  versione: "v0.1.0",
  data: "2026-11-09",
  stato: "In redazione",
  redattori: ("Jatin Bajaj",),
  verificatori: ("Sara Stefani",),
  destinatari: [Prof. Tullio Vardanega \ Prof. Riccardo Cardin \ Eggon S.r.l.],
)

// ==================== 1. REGISTRO DELLE MODIFICHE ====================
= Registro delle modifiche

#text(size: 8.5pt)[
#table(
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

// ==================== 2. INTRODUZIONE ====================
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

// ==================== 3. SEZIONI ALFABETICHE ====================
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
