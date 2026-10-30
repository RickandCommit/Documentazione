#import "../../../.github/template/template.typ": *

#show: verbale.with(
  titolo: "Verbale del Primo Incontro",
  tipo: "Verbale Interno",
  data: "2026-10-15",
  versione: "v1.1.0",
  ultima-modifica: "2026-10-25",
  ora-inizio: "15.00",
  ora-fine: "16.30",
  modalita: "Discord",
  redattore: "Sara Stefani",
  verificatore: "Alessandro Rasia dal Polo",
)

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
  [1.1.0], [2026-10-25], [Sara Stefani], [Alessandro Rasia dal Polo], [Aggiunta del collegamento alle issue di tracciamento su GitHub Projects],
  [1.0.0], [2026-10-15], [Sara Stefani], [Alessandro Rasia dal Polo], [Prima stesura del verbale approvata],
  [0.1.0], [2026-10-15], [Sara Stefani], [Alessandro Rasia dal Polo], [Stesura iniziale del verbale],
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
  [Jatin Bajaj], [P],
  [Dorde Blagojevic], [P],
  [Nicola Bonetto], [P],
  [Francesco Furin], [P],
  [Luka Lacic], [P],
  [Alessandro Rasia dal Polo], [P],
  [Sara Stefani], [P],
)

#v(0.1cm)
#text(size: 8.5pt, style: "italic")[Legenda: P = Presente · A = Assente]

#v(0.4cm)

// ==================== 3. ORDINE DEL GIORNO ====================
= Ordine del giorno

+ Presentazione dei membri del gruppo e disponibilità oraria
+ Definizione del nome del gruppo e progettazione del logo
+ Definizione dei canali di comunicazione interni ed esterni
+ Analisi e confronto preliminare sui capitolati d'appalto

#v(0.6cm)

// ==================== 4. SVOLGIMENTO DELLA RIUNIONE ====================
= Svolgimento della riunione

== Presentazione dei membri e disponibilità oraria

L'incontro è iniziato con una presentazione reciproca dei membri del gruppo, durante la quale sono stati condivisi gli impegni personali e accademici di ciascuno al fine di individuare le fasce orarie comuni per i futuri incontri di coordinamento. È stato concordato di tenere una riunione settimanale ordinaria il mercoledì pomeriggio.

== Definizione del nome del gruppo e progettazione del logo

Il gruppo ha deliberato all'unanimità l'adozione del nome ufficiale *RickandCommit*, stabilendo come regola vincolante di scriverlo sempre privo di spazi in CamelCase (`RickandCommit`).

È stata contestualmente avviata la progettazione grafica del logo ufficiale del gruppo. Il gruppo ha concordato un orientamento stilistico moderno e lineare a tema neon/portale. Sono state vagliate diverse proposte grafiche, demandando la conferma finale a un incontro successivo.

#pagebreak()
== Definizione dei canali di comunicazione interni ed esterni

Il gruppo ha stabilito i canali di comunicazione ufficiali per coordinare il lavoro:

- *WhatsApp:* per comunicazioni rapide, avvisi operativi e aggiornamenti brevi.
- *Discord:* per le riunioni virtuali di coordinamento, le sessioni di discussione tecnica e il pair programming.

Per tutte le comunicazioni *esterne* (con committenti e aziende proponenti), è stata istituita una casella di posta elettronica istituzionale dedicata:

#align(center)[
  #link("mailto:rickandcommit@gmail.com")[#underline[*rickandcommit\@gmail.com*]]
]

== Analisi e confronto preliminare sui capitolati d'appalto

Il gruppo ha svolto un esame comparativo iniziale dei capitolati d'appalto presentati, valutando per ciascuno:

- Le criticità e la complessità implementativa;
- La confidenza del gruppo con lo stack tecnologico richiesto o consigliato;
- L'interesse formativo comune e le preferenze individuali rispetto ai temi e alle aziende proponenti.

A valle della discussione, il gruppo ha concordato un orientamento iniziale, definendo la seguente *graduatoria preliminare di interesse*:

+ *C7*; Smart Dashboard: Piattaforma di Business Intelligence potenziata da AI (Ergon Informatica S.r.l.); *1º interesse*
+ *C2*; Concierge NEXUM (Eggon S.r.l.); *2º interesse*
+ *C8*; Sonar: Documentazione vivente di uno store Shopify (Halue S.r.l.); *3º interesse*

Tale graduatoria costituisce un'indicazione iniziale e sarà approfondita e confermata a valle dei colloqui tecnici con i referenti aziendali.

// ==================== 5. CONCLUSIONI ====================
= Conclusioni

L'incontro si è rivelato un punto di partenza positivo: sono stati formalizzati il nome del gruppo, i canali di comunicazione, le disponibilità orarie e l'orientamento iniziale sui capitolati d'appalto, gettando le basi per i successivi incontri operativi.

#pagebreak()
// ==================== 6. DECISIONI E AZIONI NEL BACKLOG ====================
= Decisioni e azioni nel Backlog

#text(size: 10pt)[
#table(
  columns: (2.9cm, 3.5cm, 4.0cm, 2.2cm, 2.1cm, 1.3cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*ID*], [*Decisione*], [*Azione*], [*Incaricato*], [*Scadenza*], [*Issue*],
  [VI\_2026-10-15.D1], [Graduatoria preliminare di interesse sui capitolati: C7 (1º interesse), C2 (2º interesse), C8 (3º interesse).], [Predisporre i quesiti tecnici da sottoporre ai proponenti nei colloqui.], [Tutti i membri], [2026-10-21], [—],
  [VI\_2026-10-15.D2], [Adozione del nome RickandCommit come denominazione del gruppo.], [#nessuna], [—], [—], [—],
  [VI\_2026-10-15.D3], [Comunicazioni interne gestite su Discord e WhatsApp.], [Creazione e configurazione dei canali Discord e WhatsApp.], [Dorde Blagojevic], [2026-10-16], [—],
  [VI\_2026-10-15.D4], [Google Calendar condiviso per scadenze, promemoria e riunioni.], [Configurazione del Google Calendar di gruppo.], [Francesco Furin], [2026-10-19], [#issue(2)],
  [VI\_2026-10-15.D5], [Repository ufficiale su GitHub e portale documentale su GitHub Pages.], [Inizializzazione repository GitHub e configurazione GitHub Pages.], [Dorde Blagojevic], [2026-10-16], [#issue(1)],
  [VI\_2026-10-15.D6], [Riunione settimanale ordinaria fissata il mercoledì pomeriggio.], [#nessuna], [—], [—], [—],
  [VI\_2026-10-15.D7], [Foglio di calcolo condiviso per la gestione e rendicontazione delle ore.], [Creazione del foglio condiviso per il tracciamento orario.], [Dorde Blagojevic], [2026-10-20], [—],
  [VI\_2026-10-15.D8], [Definizione del logo ufficiale di gruppo.], [Elaborazione delle proposte grafiche del logo.], [Tutti i membri], [2026-10-19], [—],
  [VI\_2026-10-15.D9], [Redazione e verifica del verbale della riunione.], [Stesura formale del verbale.], [Sara Stefani], [2026-10-15], [#issue(3)],
)
]
