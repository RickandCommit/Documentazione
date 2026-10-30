#import "../../../.github/template/template.typ": *

#show: verbale.with(
  titolo: "Verbale del Secondo Incontro",
  tipo: "Verbale Interno",
  data: "2026-10-21",
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
  [1.0.0], [2026-10-22], [Sara Stefani], [Alessandro Rasia dal Polo], [Prima stesura del verbale approvata],
  [0.1.0], [2026-10-21], [Sara Stefani], [Alessandro Rasia dal Polo], [Stesura iniziale del verbale],
)
]

#pagebreak(weak: true)
#outline(title: "Indice")
#pagebreak(weak: true)

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

+ Contatti con i proponenti dei capitolati e preparazione degli incontri
+ Responsabile di progetto e durata degli sprint
+ Organizzazione dell'ambiente di lavoro su GitHub
+ Valutazione di strumenti complementari di tracciamento (Monday.com)
+ Template documentali in Typst e slide del Diario di Bordo
+ Pianificazione del documento di Valutazione dei capitolati

#v(0.6cm)

// ==================== 4. SVOLGIMENTO DELLA RIUNIONE ====================
= Svolgimento della riunione

== Contatti con i proponenti dei capitolati

L'incontro con *Ergon Informatica* (C7) è confermato per il pomeriggio di giovedì 22 ottobre 2026 su *Microsoft Teams*.

Per *Halue* (C8) ed *Eggon* (C2) verranno inviate entro giovedì le e-mail con le domande tecniche preparate, richiedendo la disponibilità per un breve incontro online oppure, in alternativa, una risposta scritta ai quesiti formulati dal gruppo.

== Responsabile di progetto e sprint

*Dorde Blagojevic* assume il ruolo di *Responsabile di progetto* per la fase iniziale e comunicherà il nominativo al prof. Vardanega, che ne aveva fatto formale richiesta.

Il gruppo ha stabilito di lavorare secondo *sprint bisettimanali*. La rotazione dei ruoli coinciderà con la chiusura di ciascuno sprint, in modo che ogni componente possa acquisire piena padronanza del ruolo senza cambi eccessivamente frequenti.

Nella fase preliminare attuale i ruoli restano flessibili; il conteggio rigoroso delle ore e dei costi sul foglio di calcolo condiviso partirà con la presentazione della candidatura e l'eventuale approvazione dell'appalto.

== Ambiente di lavoro su GitHub

La struttura delle cartelle del repository è stata discussa collegialmente e confermata.

La board di progetto (*RickandCommit - Dashboard*) adotterà il flusso Kanban con le seguenti colonne:

- *Backlog:* attività in attesa di prioritizzazione o di lavoro preliminare.
- *Ready:* task pronti per essere presi in carico dai componenti.
- *In Progress:* attività su cui i membri stanno attivamente lavorando.
- *In Review:* task completati, in attesa di revisione tra pari e merge della Pull Request.
- *Done:* obiettivi completati, verificati e conformi ai criteri di accettazione stabiliti.

Le issue deliberate nel primo verbale verranno inserite retroattivamente nella dashboard e marcate come completate, seguite da quelle definite nel corso della presente riunione.

== Valutazione di Monday.com

È stato valutato e approvato dal gruppo l'uso di Monday.com per la stima delle ore, il calcolo automatico dei costi e la generazione di grafici utili per le presentazioni del Diario di Bordo. *GitHub Projects resta lo strumento ufficiale e primario di tracciamento*, mentre Monday.com potrà essere affiancato ad esclusivo uso interno.

== Template documentali e Diario di Bordo

Per tutta la documentazione di progetto si utilizzerà *Typst*. Verrà definito un template ufficiale per i verbali, dotato di logo, intestazione, piè di pagina, registro delle modifiche versionato e tracciamento verso le issue di GitHub.

Sarà inoltre preparata una presentazione per il primo Diario di Bordo, che sintetizzi lo stato di avanzamento iniziale, la composizione del gruppo, l'organizzazione dei ruoli e le prime scelte metodologiche.

== Documento di Valutazione dei capitolati

Il gruppo ha deliberato di avviare immediatamente la stesura del documento di valutazione comparativa dei 10 capitolati. Ciascun capitolato sarà analizzato per requisiti, tecnologie richieste o consigliate, punti di forza e criticità tecniche.

Il documento verrà completato con le considerazioni finali al termine dei colloqui con le aziende proponenti.

// ==================== 5. CONCLUSIONI ====================
= Conclusioni

La riunione ha fornito al gruppo un assetto organizzativo solido ed efficace: sono stati formalizzati il ruolo di Responsabile e la cadenza degli sprint, definito il flusso di lavoro su GitHub e consolidati gli strumenti documentali. Restano da svolgere gli incontri con le aziende proponenti, a partire da quello con Ergon Informatica, per completare la valutazione dei capitolati in vista della candidatura ufficiale.

#pagebreak(weak: true)
// ==================== 6. DECISIONI E AZIONI NEL BACKLOG ====================
= Decisioni e azioni nel Backlog

#text(size: 10pt)[
#table(
  columns: (2.9cm, 3.5cm, 4.0cm, 2.2cm, 2.1cm, 1.3cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*ID*], [*Decisione*], [*Azione*], [*Incaricato*], [*Scadenza*], [*Issue*],
  [VI\_2026-10-21.D1], [Incontro con Ergon (C7) su Microsoft Teams confermato giovedì pomeriggio.], [Invio e-mail di conferma a Ergon con link Teams e disponibilità oraria.], [Jatin Bajaj], [2026-10-21], [—],
  [VI\_2026-10-21.D2], [Produzione e invio del verbale esterno.], [Stesura e invio del verbale esterno a Ergon.], [Sara Stefani], [2026-10-26], [—],
  [VI\_2026-10-21.D3], [Invio delle domande tecniche a Halue (C8) e a Eggon (C2).], [Invio e-mail con domande tecniche a Halue (C8) e a Eggon (C2).], [Jatin Bajaj], [2026-10-22], [#issue(9)],
  [VI\_2026-10-21.D4], [Nomina di Dorde Blagojevic a Responsabile di progetto per la fase iniziale.], [Comunicazione formale del Responsabile di progetto al prof. Vardanega.], [Dorde Blagojevic], [2026-10-22], [—],
  [VI\_2026-10-21.D5], [Adozione di sprint bisettimanali, con rotazione dei ruoli alla chiusura di ogni sprint.], [#nessuna], [—], [—], [—],
  [VI\_2026-10-21.D6], [Conferma della struttura delle cartelle del repository.], [Finalizzazione della struttura ad albero delle cartelle del repository.], [Dorde Blagojevic], [2026-10-22], [#issue(11)],
  [VI\_2026-10-21.D7], [Adozione del flusso Kanban su GitHub Projects.], [Configurazione di GitHub Projects (Kanban), inserimento issue retroattive e visibilità pubblica.], [Francesco Furin, Alessandro Rasia dal Polo], [2026-10-22], [#issue(10)],
  [VI\_2026-10-21.D8], [GitHub Projects come strumento ufficiale di tracciamento; Monday.com solo ad uso interno.], [Setup di Monday.com ad uso interno.], [Alessandro Rasia dal Polo], [2026-10-23], [#issue(7)],
  [VI\_2026-10-21.D9], [Typst come linguaggio di composizione di tutti i documenti ufficiali di gruppo.], [Realizzazione del template Typst per i verbali (con tabella issue e registro modifiche).], [Sara Stefani], [2026-10-23], [#issue(4)],
  [VI\_2026-10-21.D10], [Preparazione di una presentazione per il primo Diario di Bordo.], [Preparazione del template per le slide del Diario di Bordo.], [Nicola Bonetto], [2026-10-23], [#issue(6)],
  [VI\_2026-10-21.D11], [Avvio della stesura del documento di analisi e confronto dei 10 capitolati.], [Stesura iniziale della scheda di analisi dei 10 capitolati (requisiti, pro e contro).], [Tutti i membri], [2026-10-24], [#issue(5)],
  [VI\_2026-10-21.D12], [Redazione e verifica del verbale della riunione.], [Stesura formale del verbale.], [Sara Stefani], [2026-10-22], [#issue(8)],
)
]
