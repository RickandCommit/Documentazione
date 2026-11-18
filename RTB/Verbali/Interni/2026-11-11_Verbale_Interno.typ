#import "../../../.github/template/template.typ": *

#show: verbale.with(
  titolo: "Verbale del Quinto Incontro",
  tipo: "Verbale Interno",
  data: "2026-11-11",
  versione: "v1.0.0",
  ultima-modifica: "2026-11-18",
  ora-inizio: "15.00",
  ora-fine: "15.40",
  modalita: "Discord",
  stato: "Approvato",
  redattore: "Nicola Bonetto",
  verificatore: "Sara Stefani",
  esito-verifica: "Positivo"
)

// ==================== REGISTRO DELLE MODIFICHE ====================
#registro-modifiche(
  table.cell(align: center)[1.0.0], table.cell(align: center)[2026-11-18], [Approvazione per il rilascio], [Francesco Furin], [—],
  table.cell(align: center)[0.2.0], table.cell(align: center)[2026-11-18], [Aggiornamento scadenze e voci nel backlog], [Nicola Bonetto], [Sara Stefani],  
  table.cell(align: center)[0.1.0], table.cell(align: center)[2026-11-18], [Stesura iniziale del verbale], [Nicola Bonetto], [Sara Stefani],
)

#pagebreak()
#outline(title: "Indice")
#pagebreak()

// ==================== 1. PARTECIPANTI ====================
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

// ==================== 2. ORDINE DEL GIORNO ====================
= Ordine del giorno

+ Debriefing del primo incontro con Eggon e verbale esterno
+ Avanzamento di Analisi dei Requisiti, Glossario e Norme di Progetto
+ Gestione della repository e verifica del sito su GitHub Pages
+ Preparazione dell'incontro con Eggon di martedì 17 novembre

// ==================== 3. SVOLGIMENTO DELLA RIUNIONE ====================
= Svolgimento della riunione

== Debriefing dell'incontro con Eggon

Il primo incontro con Eggon, svolto il 10 novembre, ha portato alla definizione della cadenza settimanale delle riunioni, il martedì alle 17.00; pertanto, il prossimo incontro è fissato per *martedì 17 novembre alle 17.00*. Il canale di comunicazione Telegram è stato aperto. 

== Avanzamento dei documenti

*Analisi dei Requisiti:* Alessandro ha iniziato a modellare i casi d'uso, concentrandosi sull'assistente, con *PlantUML*, che genera direttamente le immagini PNG da riga di comando a partire dai file `.puml`. Ha sollevato la questione se l'assistente e le persone esterne vadano considerati attori. Resta da definire dove collocare nella repository i diagrammi e il relativo codice PlantUML.

*Norme di Progetto:* hanno una struttura definita da uno standard ISO e in gran parte possono già essere compilate con quanto il gruppo sta facendo: documentazione, gestione degli artefatti e fornitura sono già coperti, mentre i processi legati al testing del codice verranno aggiunti più avanti.

*Glossario:* Jatin lo pubblicherà a breve. Glossario e Norme di Progetto vanno nella cartella RTB, fuori da quella dei verbali. A fine RTB ne verrà mantenuta la versione di riferimento della fase e in PB ne verrà pubblicata una copia evolutiva, per tenere traccia dell'evoluzione dei documenti; lo stesso vale per tutti i documenti comuni alle due revisioni.

La repository del prodotto verrà creata quando se ne presenterà la necessità.

== Repository e GitHub Pages

Sono stati effettuati il merge in `main` del branch di setup della baseline RTB e quello dell'ultimo Diario di Bordo, dopo l'aggiornamento del relativo branch. La sezione RTB non è ancora visibile sul sito: con il caricamento del primo verbale interno in RTB lo script dovrebbe spostare la Candidatura in archivio ed esporre RTB. Dorde verificherà il funzionamento e correggerà eventuali problemi.

Il template è stato aggiornato: il registro delle modifiche non compare più nell'indice e l'ordine delle colonne è cambiato. Il verbale della riunione precedente è completo e verrà integrato con scadenze e riferimenti alle issue.

== Ruoli e preparazione dell'incontro con Eggon

I ruoli restano *invariati fino a mercoledì 18 novembre*, termine dello sprint di due settimane. Francesco presenterà il Diario di Bordo di lunedì 16 novembre, in cui si riferirà anche del primo incontro con l'azienda.

In preparazione dell'incontro del 17 novembre, ciascuno studierà il capitolato individualmente così da poter definire ulteriori domande da fare prima del giorno dell'incontro. Alcuni punti da chiarire sono:

- *Formato dei dati e della documentazione sulle ferie:* il referente ha indicato formati facilmente processabili, con l'ipotesi, non essenziale, di un servizio esterno di conversione prima dell'importazione nel database.
- *Regole delle singole aziende:* da capire se fornite come documentazione o come file di configurazione (ad esempio JSON).
- *Inoltro della richiesta di ferie:* da capire se spetti all'assistente o a un servizio già esistente dell'azienda e fino a dove debba spingersi il POC.


// ==================== 4. CONCLUSIONI ====================
= Conclusioni

La riunione ha fatto il punto a metà del primo sprint della fase RTB. Le priorità sono l'invio del verbale esterno, la pubblicazione di Glossario e Norme di Progetto, l'avanzamento dell'analisi dei requisiti e la preparazione dell'incontro con Eggon del 17 novembre.

#pagebreak()

// ==================== 5. DECISIONI E AZIONI NEL BACKLOG ====================
= Decisioni e azioni nel Backlog

#text(size: 10pt)[
#set table.cell(breakable: false)
#table(
  columns: (3.1cm, 3.5cm, 3.6cm, 2.4cm, 2.0cm, 1.4cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*ID*], [*Decisione*], [*Azione*], [*Incaricato*], [*Scadenza*], table.cell(align: center)[*Issue*],
  [VI\_2026-11-11.D1], [Invio del verbale esterno del primo incontro a Eggon per la firma.], [Inviare il verbale al referente aziendale, anche via Telegram.], [Francesco Furin], [2026-11-18], [#issue(64)],
  [VI\_2026-11-11.D2], [Preparazione per il prossimo incontro con Eggon.], [Studiare le tecnologie e preparare le domande per l'incontro.], [Intero gruppo], [2026-11-16], [—],
  [VI\_2026-11-11.D3], [Prosecuzione dell'analisi dei requisiti, con i casi d'uso modellati in PlantUML.], [Proseguire la modellazione e documentare le scelte sugli attori.], [Alessandro Rasia dal Polo], [—], [#issue(62)],
  [VI\_2026-11-11.D4], [Prosecuzione delle Norme di Progetto secondo la struttura prevista dallo standard ISO.], [Proseguire la stesura delle norme.], [Luka Lacic], [—], [#issue(61)],
  [VI\_2026-11-11.D5], [Pubblicazione di Glossario e Norme di Progetto in RTB, con copia evolutiva in PB a fine fase.], [Pubblicare il Glossario nella cartella RTB.], [Jatin Bajaj], [—], [#issue(58)],
  [VI\_2026-11-11.D6], [Verifica del sito con il caricamento del primo verbale RTB.], [Controllare l'archiviazione della Candidatura e la comparsa di RTB, correggendo lo script se necessario.], [Dorde Blagojevic], [2026-11-18], [#issue(73)],
)
]
