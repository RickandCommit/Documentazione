#import "../.github/template/template.typ": *

#set document(
  title: "Lettera di Presentazione — Candidatura Capitolato C2 — RickandCommit",
  author: "RickandCommit"
)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
  header: context [
    #grid(
      columns: (1fr, 1fr),
      align: (left + horizon, right + horizon),
      [#logo-completo(width: 4.8cm)],
      [#logo-unipd(width: 3.2cm)],
    )
    #v(0.15cm)
    #line(length: 100%, stroke: 0.5pt + rgb("#b5b5b5"))
  ],
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
      [#text(size: 8.5pt)[Candidatura — 30 Ottobre 2026]],
    )
  ]
)

#set text(font: "Libertinus Serif", size: 11pt, lang: "it")
#set par(justify: true, leading: 0.65em)

#v(0.3cm)

// Dati Mittente e Destinatari
#grid(
  columns: (1fr, 1.2fr),
  gutter: 1cm,
  [
    *Mittente:* \
    Gruppo *RickandCommit* \
    Email: #link("mailto:rickandcommit@gmail.com")[rickandcommit\@gmail.com] \
    Sito web: #link("https://rickandcommit.github.io/Documentazione/")[rickandcommit.github.io] \
    \
    *Data:* 30 Ottobre 2026
  ],
  [
    *Ai gentili Committenti:* \
    Prof. Tullio Vardanega \
    Prof. Riccardo Cardin \
    Università di Padova \
    Dipartimento di Matematica "Tullio Levi-Civita"
  ]
)

#v(0.6cm)

*Oggetto:* Candidatura per l'assegnazione del capitolato d'appalto *C2 – NEXUM: Concierge per Richieste Operative* (proponente: *Eggon S.r.l.*).

#v(0.3cm)

Egregi Professori,

con la presente il gruppo *RickandCommit* intende sottoporre formalmente alla Vostra attenzione la propria candidatura per la realizzazione del capitolato d'appalto *C2 – NEXUM: Concierge per Richieste Operative*, proposto dall'azienda *Eggon S.r.l.*.

Tutta la documentazione ufficiale a supporto della candidatura è consultabile e liberamente accessibile al seguente indirizzo:
#align(center)[
  #box(
    fill: rgb("#f8fafc"),
    stroke: 0.5pt + rgb("#cbd5e1"),
    inset: (x: 14pt, y: 8pt),
    radius: 4pt,
    link("https://rickandcommit.github.io/Documentazione/")[https://rickandcommit.github.io/Documentazione/]
  )
]

Nel seguito vengono riassunte le principali motivazioni della scelta, la documentazione a corredo della candidatura e la composizione del team di progetto.

= Motivazioni della scelta

A valle di un'approfondita analisi comparativa dei dieci capitolati d'appalto e degli incontri conoscitivi svolti con i referenti aziendali (tra cui Ergon Informatica S.r.l. e Halue S.r.l.), il gruppo ha deliberato all'unanimità l'assegnazione della prima preferenza al capitolato *C2 – NEXUM Concierge*.

Le motivazioni cardine che hanno orientato la decisione del gruppo risiedono in:
- *Chiarezza e solidità dell'obiettivo (MVP):* il capitolato definisce con precisione e concretezza le quattro capacità operative essenziali del prodotto minimo funzionante nell'ambito della gestione di ferie e permessi, garantendo un perimetro di lavoro ben circoscritto, realistico e verificabile.
- *Innovazione tecnologica e valore formativo:* il progetto offre l'opportunità di confrontarsi con sfide di assoluta attualità industriale, combinando l'integrazione di Large Language Model (tramite Amazon Bedrock e la libreria `ruby_llm`) con la ricerca semantica vettoriale (PostgreSQL con estensione `pgvector`) e architetture transazionali robuste (TypeScript/Angular e Ruby on Rails).
- *Gestione della complessità architetturale:* collegare l'interrogazione documentale alle operazioni transazionali sui dati dei dipendenti richiede la gestione rigorosa di chiavi di idempotenza, autorizzazioni e conferme esplicite di sicurezza, fornendo un contesto didattico ideale per applicare buone pratiche di ingegneria del software.
- *Collaborazione e disponibilità del proponente:* l'azienda Eggon S.r.l. ha dimostrato grande apertura nel condividere architetture, codice sorgente di supporto e dataset sintetici per il collaudo, assicurando un canale di comunicazione rapido e incontri di allineamento periodici.

= Documentazione allegata a supporto della candidatura

A corredo della candidatura, il gruppo mette a disposizione i seguenti documenti formali:
- *Valutazione dei Capitolati* (`Valutazione_dei_Capitolati.pdf`), contenente l'analisi comparativa approfondita di tutti i capitolati e il dettaglio dei criteri decisionali;
- *Dichiarazione degli Impegni* (`Dichiarazione_degli_Impegni.pdf`), contenente il preventivo economico, la ripartizione dettagliata delle ore produttive per ciascun ruolo e componente, e la scadenza temporale concordata per la consegna finale;
- I verbali degli incontri esterni svolti con i referenti aziendali controfirmati dai proponenti.

= Costi e pianificazione del progetto

Come dettagliato nel documento *Dichiarazione degli Impegni*, il costo complessivo stimato per la realizzazione del progetto è pari a *12.575,00 €*, a fronte di un impegno produttivo complessivo di *630 ore* (90 ore individuali per ciascun componente). La consegna finale del prodotto collaudato (Product Baseline - PB) è fissata entro il *26 marzo 2027*.

= Componenti del gruppo

Il gruppo *RickandCommit* è composto da 7 studenti:

#align(center)[
#table(
  columns: (3.5cm, 3.5cm, 3cm),
  align: (left + horizon, left + horizon, center + horizon),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 7pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Cognome*], [*Nome*], [*Matricola*],
  [Bajaj], [Jatin], [2138010],
  [Blagojevic], [Dorde], [2116424],
  [Bonetto], [Nicola], [2148611],
  [Furin], [Francesco], [2138008],
  [Lacic], [Luka], [2145595],
  [Rasia dal Polo], [Alessandro], [2145590],
  [Stefani], [Sara], [2077673],
)
]

= Altri riferimenti utili

- *Repository GitHub ufficiale:* #link("https://github.com/RickandCommit/Documentazione")[https://github.com/RickandCommit/Documentazione]
- *Organizzazione GitHub del gruppo:* #link("https://github.com/RickandCommit")[https://github.com/RickandCommit]

Restando a completa disposizione per qualsiasi eventuale chiarimento, porgiamo cordiali saluti.

#v(0.6cm)

#align(right)[
  *Il gruppo RickandCommit* \
  #text(size: 9.5pt, style: "italic")[Jatin Bajaj, Dorde Blagojevic, Nicola Bonetto, Francesco Furin, \ Luka Lacic, Alessandro Rasia dal Polo, Sara Stefani]
]
