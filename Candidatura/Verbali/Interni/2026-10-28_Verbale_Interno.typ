// Verbale interno — riunione del 2026-10-28
// File: 2026-10-28_Verbale_Interno.typ

#let data-verbale = "2026-10-28"
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

#let nessuna = [Nessuna azione operativa.]
#let issue(n) = link("https://github.com/RickandCommit/Documentazione/issues/" + str(n))[\##n]

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
  #text(size: 26pt, weight: "bold")[Verbale del Terzo Incontro]
  #v(0.25cm)
  #text(size: 10pt, style: "italic")[Versione v0.2.0 · Ultima modifica: 2026-10-29]
]

#v(0.5cm)

// ==================== INFORMAZIONI GENERALI ====================
#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 7pt,
  [*Data*], [#data-verbale],
  [*Ora inizio – Ora fine*], [15:00 – 16:00],
  [*Modalità*], [Discord],
  [*Redattore*], [Sara Stefani],
  [*Verificatore*], [Alessandro Rasia dal Polo],
  [*Destinatari*], [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
)

#v(0.4cm)

// ==================== 1. REGISTRO DELLE MODIFICHE ====================
= Registro delle modifiche

#text(size: 10pt)[
#table(
  columns: (auto, auto, auto, auto, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5pt,
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Versione*], [*Data*], [*Autore*], [*Verificatore*], [*Descrizione*],

  [0.2.0], [2026-10-29], [Sara Stefani], [Alessandro Rasia dal Polo], [Aggiornamento della tabella delle decisioni],
  [0.1.0], [2026-10-28], [Sara Stefani], [Alessandro Rasia dal Polo], [Stesura iniziale del verbale],
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

+ Stato dei verbali esterni e stesura del verbale di Sonar (C8)
+ Ruoli di progetto e politica di rotazione in vista della candidatura
+ Strategia di scelta del capitolato (C7 e C2)
+ Revisione del sito web su GitHub Pages
+ Stato di avanzamento dei documenti

// ==================== 4. SVOLGIMENTO DELLA RIUNIONE ====================
= Svolgimento della riunione

== Verbali esterni

L'azienda Ergon ha restituito il verbale esterno controfirmato. Si è stabilito di caricare nella cartella dei verbali esterni direttamente il *PDF firmato*, in quanto unico documento con valore formale e probatorio dell'approvazione da parte del proponente.

L'incontro con *Sonar (C8)* si è concluso in data odierna. È prioritario redigere il verbale esterno e inviarlo al referente aziendale il prima possibile, per consentirne la firma e la restituzione prima della scadenza della candidatura.

== Rotazione dei ruoli e organizzazione

Il gruppo ha discusso se ruotare i ruoli durante la settimana corrente o mantenere l'assetto attuale. Si è concordato di *mantenere i ruoli attuali fino a martedì 3 novembre*, data prevista per l'assegnazione ufficiale dei capitolati. Con l'inizio formale della fase RTB (_Requirements and Technology Baseline_) partiranno la rotazione ufficiale periodica e il conteggio formale delle ore e dei costi sul foglio di calcolo.

== Selezione del capitolato e sondaggio interno

Il gruppo ha condotto un'analisi comparativa tra *C7* (Ergon) e *C2* (Eggon).

Nonostante la concorrenza su C7 da parte di altri gruppi, il gruppo ritiene di avere una documentazione, un'organizzazione della repository e un rigore metodologico tali da competere per l'assegnazione di C7.

Per formalizzare la prima scelta tra C7 e C2 verrà aperto un sondaggio rapido su WhatsApp, da concludere entro un paio d'ore, aggiornando poi il foglio di riepilogo delle preferenze.

== Revisione del sito web su GitHub Pages

È stata presentata e approvata la struttura grafica del sito:

- *Barra di navigazione:* intuitiva e predisposta per le future sezioni (RTB, PB, Glossario).
- *Sezione verbali:* verranno create due tabelle distinte, per separare i verbali interni da quelli esterni.
- *Sezione componenti:* mostrerà l'elenco dei membri del gruppo, senza tracciamento pubblico dei ruoli settimanali, che restano ad uso organizzativo interno.
- *Piè di pagina:* include i riferimenti per la copia rapida della mail di gruppo e il collegamento alla documentazione della repository.

== Avanzamento documentale

La versione preliminare della *Valutazione dei capitolati* è pronta. Verrà integrata con le informazioni emerse dagli incontri diretti con le aziende e poi sottoposta a verifica.

Il *Preventivo* e la *Dichiarazione degli impegni* sono in fase di completamento, con il calcolo dei costi e la suddivisione delle ore per ruolo.

Si conferma che il *Glossario* e le *Norme di Progetto* non devono essere pubblicati per la candidatura, come da indicazioni del docente. Per evitare documenti incompleti o prematuri, la loro stesura ufficiale inizierà con l'avvio della fase RTB.

Per il *Diario di Bordo*, verrà aggiornato il template delle slide per l'incontro di lunedì 2 novembre.

// ==================== 5. CONCLUSIONI ====================
= Conclusioni

La riunione ha definito le priorità in vista della candidatura di venerdì 30 ottobre: la stesura e l'invio del verbale esterno di Sonar, il sondaggio sulla scelta del capitolato, il completamento dei documenti e la consegna della candidatura via e-mail. I ruoli restano invariati fino al 3 novembre.

#pagebreak()

// ==================== 6. DECISIONI E AZIONI NEL BACKLOG ====================
= Decisioni e azioni nel Backlog

#text(size: 10pt)[
#set table.cell(breakable: false)
#table(
  columns: (3.1cm, 3.5cm, 3.6cm, 2.4cm, 2.0cm, 1.4cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*ID*], [*Decisione*], [*Azione*], [*Incaricato*], [*Scadenza*], table.cell(align: center)[*Issue*],
  [VI\_2026-10-28.D2], [Stesura del verbale esterno di Sonar (C8)], [Redigere il verbale e inviarlo al referente aziendale per la firma.], [Alessandro Rasia dal Polo], [2026-10-29], [#issue(18)],
  [VI\_2026-10-28.D4], [Apertura di un sondaggio su WhatsApp per stabilire la prima scelta tra C7 e C2.], [Aprire il sondaggio e aggiornare il foglio di riepilogo delle preferenze.], [Dorde Blagojevic], [2026-10-28], [—],
  [VI\_2026-10-28.D5], [Consegna della candidatura entro venerdì 30 ottobre alle 17:00 via e-mail.], [Redigere la Lettera di Candidatura, firmarla e verificare i collegamenti.], [Dorde Blagojevic], [2026-10-30], [#issue(26)],
  [VI\_2026-10-28.D6], [Approvazione del layout del sito], [Rifinire il codice del sito con le tabelle separate per i verbali.], [Dorde Blagojevic], [2026-10-29], [#issue(16)],
  [VI\_2026-10-28.D8], [Integrazione della Valutazione dei capitolati con gli esiti degli incontri con le aziende.], [Aggiornare e completare la Valutazione dei capitolati e sottoporla a verifica.], [Luka Lacic], [2026-10-30], [#issue(21)],
  [VI\_2026-10-28.D9], [Completamento di Preventivo e Dichiarazione degli impegni.], [Finalizzare il Preventivo dei costi e la Dichiarazione degli impegni.], [Luka Lacic], [2026-10-30], [#issue(20)],
  [VI\_2026-10-28.D10], [Aggiornamento del template delle slide del Diario di Bordo per lunedì.], [Aggiornare le slide del Diario di Bordo.], [Nicola Bonetto], [2026-11-01], [#issue(22)],
)
]
