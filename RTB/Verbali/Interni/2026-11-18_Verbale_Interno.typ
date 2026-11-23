#import "../../../.github/template/template.typ": *

#show: verbale.with(
  titolo: "Verbale del Sesto Incontro",
  tipo: "Verbale Interno",
  data: "2026-11-18",
  versione: "v1.0.0",
  ultima-modifica: "2026-11-23",
  ora-inizio: "15.00",
  ora-fine: "16.00",
  modalita: "Discord",
  stato: "Approvato",
  redattore: "Nicola Bonetto",
  verificatore: "Dorde Blagojevic",
  esito-verifica: "Positivo"
)

// ==================== REGISTRO DELLE MODIFICHE ====================
#registro-modifiche(
  table.cell(align: center)[1.0.0], table.cell(align: center)[2026-11-23], [Approvazione per il rilascio], [Sara Stefani], [—],
  table.cell(align: center)[0.1.0], table.cell(align: center)[2026-11-23], [Stesura iniziale del verbale], [Nicola Bonetto], [Dorde Blagojevic],
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

+ Chiusura dello Sprint 1 della fase RTB, stato della documentazione e verbali esterni con Eggon S.r.l.
+ Rotazione ufficiale dei ruoli e avvio dello Sprint 2 della fase RTB
+ Organizzazione della struttura della repository per l'Analisi dei Requisiti e automazione della compilazione dei diagrammi PlantUML
+ Revisione dell'Analisi dei Requisiti: criteri per attori primari e secondari, relazioni UML e aggiornamento dopo l'incontro con Eggon del 2026-11-17
+ Specifiche e contratti API verso i servizi Nexum (adozione di Bruno e vincoli di sicurezza)
+ Avvio della stesura iniziale del Piano di Progetto e del Piano di Qualifica

// ==================== 3. SVOLGIMENTO DELLA RIUNIONE ====================
= Svolgimento della riunione

== Chiusura dello Sprint 1 e stato della documentazione

Le Norme di Progetto, di cui esiste una prima stesura, e il Glossario proseguono sui rispettivi branch dedicati e restano non visibili sul sito: il merge avverrà prima della consegna della RTB.

Per l'Analisi dei Requisiti è stato predisposto un documento Typst a modo di template, in cui restano da inserire le descrizioni dei casi d'uso (una riga per caso d'uso). Il documento e i relativi file `.puml` vanno adeguati a quanto emerso nell'incontro con Eggon del 2026-11-17.

Il verbale esterno dell'incontro precedente è stato caricato nella repository. Per l'incontro con Eggon del 2026-11-17 il verbale esterno sarà redatto da Alessandro, con il supporto dei colleghi; Sara lo invierà poi su Telegram ai referenti aziendali per la firma.

== Rotazione dei ruoli e avvio dello Sprint 2

È stata formalizzata la rotazione bisettimanale dei ruoli per lo Sprint 2 della fase RTB:

- *Responsabile:* Sara Stefani, che gestisce i Diari di Bordo, il merge delle Pull Request e le comunicazioni su Telegram con Eggon, e avvia la stesura del Piano di Progetto
- *Verificatore:* Dorde Blagojevic, che controlla la conformità delle Pull Request e dei documenti prodotti
- *Amministratore:* Luka Lacic, che gestisce le issue, le milestones, i workflow di GitHub Actions e la struttura della repository
- *Progettisti:* Alessandro Rasia dal Polo e Francesco Furin, che definiscono l'architettura del POC (Ruby on Rails, AWS Bedrock e `pgvector`) e i contratti JSON/API verso Nexum
- *Analisti:* Nicola Bonetto e Jatin Bajaj, che proseguono l'Analisi dei Requisiti (casi d'uso, descrizioni e tabelle di tracciabilità)

== Struttura della repository e automazione PlantUML

Per l'Analisi dei Requisiti verrà predisposta, dentro `RTB/`, una cartella dedicata contenente il documento e una sottocartella per i casi d'uso, evitando omonimie tra una cartella e un singolo file in essa contenuto. I documenti con un solo file (Piano di Progetto, Piano di Qualifica, Norme di Progetto, Glossario) risiedono direttamente in `RTB/`, accanto alle cartelle dei verbali e dell'Analisi dei Requisiti.

Per evitare di versionare decine di immagini statiche, il gruppo ha approvato un'automazione (workflow CI) che compila i sorgenti `.puml` di PlantUML in formato vettoriale e li rende disponibili alla compilazione Typst, che ne ricava il percorso. Le esportazioni non vengono committate, in analogia con i PDF dei documenti. La cartella di output è generata dall'automazione.

Il gruppo ha fatto una valutazione iniziale sull'idea di collegare i termini dei documenti al Glossario, già adottata da altri gruppi che dispongono una pagina dedicata nel sito.

== Analisi dei Requisiti: attori, requisiti e relazioni UML

*Stato attuale.* Sono stati censiti circa 41 requisiti funzionali (classificati in obbligatori, desiderabili e opzionali), 5 requisiti di qualità, tutti obbligatori, e 6 requisiti di vincolo tecnologico (tra cui `pgvector` e Ruby on Rails con relativa versione), oltre a 15 casi d'uso preliminari. Alcuni casi d'uso coprono più requisiti e il numero è destinato a crescere. I requisiti sono suddivisi in funzionali, di qualità e di vincolo. Restano da rivalutare i requisiti prestazionali, come il tempo di risposta, che dipende anche dall'input del dipendente. I requisiti non indispensabili per l'MVP e per il POC, come il filtro delle richieste per anno solare o stato della pratica, sono classificati come desiderabili.

*Persistenza della conversazione.* Il requisito sul contesto conversazionale va modificato: la chat deve essere persistente anche tra ricaricamenti di pagina e sessioni distinte, e non solo nella sessione corrente.

*Criterio per gli attori.*
- _Attori primari:_ Dipendente e Amministratore HR.
- _Attori secondari:_ Provider LLM e Servizi/API Nexum, modellati come attori esterni in quanto componenti non controllate né modificabili dal gruppo. La scelta è coerente anche con l'obiettivo di mantenere il prodotto Concierge disaccoppiato e riutilizzabile da altre aziende; in una futura integrazione i servizi Nexum potrebbero diventare interni.
- Il backend Ruby e il database `pgvector` sono interni al sistema e non costituiscono attori.

*Relazioni UML.* Per gli scenari di errore e le deviazioni dal flusso normale (ad esempio il fallimento della comunicazione con le API Nexum o la violazione della soglia di ferie negative) si adotta sistematicamente `<<extend>>`; per le sotto-operazioni obbligatorie (ad esempio la conferma esplicita del dipendente) si adotta `<<include>>`. Le descrizioni dei casi d'uso indicano cosa accade e non come viene realizzato, aspetto che compete alla progettazione.

== Specifiche API Nexum e strumenti

*Scadenza.* Alessandro e Francesco finalizzeranno a breve il documento con le specifiche e i contratti JSON/API attesi da Nexum (ad esempio la struttura del payload con nome del dipendente, azienda, ferie e permessi totali, consumati e residui, e la gestione degli errori), da trasmettere ad Eggon per la creazione degli endpoint di test. Il gruppo non dispone dei manuali Nexum: descrive quindi ciò che si aspetta di ricevere e spetta ad Eggon modellare le API di conseguenza.

*Cancellazione delle richieste.* Le richieste possono essere in attesa, approvate o rifiutate e non sono ammesse modifiche. Il gruppo ha confermato di non esporre al chatbot funzioni di cancellazione delle richieste già registrate: la gestione resta al portale di back-office di Nexum. La scelta va riflessa nei requisiti e nei contratti API.

*Gestione degli errori.* Il comportamento in caso di saldo ferie negativo dipende dalle regole aziendali (ad esempio una tolleranza massima di ore, oppure nessuna tolleranza). Il gruppo ha evidenziato la necessità di definire presto la gestione degli errori, così da standardizzare le API, e di confrontarsi con Eggon sul punto.

*Strumenti e sicurezza.* Si adotta *Bruno* per definire e testare le collection API. È stabilito il *divieto assoluto* di committare API key, token o credenziali nella repository pubblica: i valori sensibili vengono gestiti tramite variabili locali. Insieme alle collection Bruno, il gruppo chiederà ad Eggon un token API e le modalità di autenticazione all'ambiente di test.

*Ambiente del POC.* È stata discussa la collocazione del POC: si chiederà ad Eggon se predisponrrà un ambiente, altrimenti il gruppo potrebbe eseguirlo autonomamente in un container Docker su un proprio server, in prospettiva su AWS.

== Piano di Progetto e Piano di Qualifica

Sara avvierà l'impostazione del Piano di Progetto, integrando la pianificazione degli sprint e i dati dei verbali interni. Il gruppo intende riportare le ore sul foglio di calcolo indicando anche lo sprint di appartenenza. Dorde predisporrà lo scheletro del Piano di Qualifica, finora rinviato, in parallelo alle attività di verifica.

Per l'architettura, la documentazione ufficiale non ne prevede una descrizione dedicata: per ora resta documentazione interna a supporto dell'Analisi dei Requisiti e del POC.

// ==================== 4. CONCLUSIONI ====================
= Conclusioni

La riunione ha ufficializzato la rotazione dei ruoli e l'avvio dello Sprint 2 della fase RTB. Le priorità immediate sono la consegna ad Eggon delle specifiche delle API Nexum e l'aggiornamento dell'Analisi dei Requisiti, insieme all'avvio del Piano di Progetto e del Piano di Qualifica.

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
  [VI\_2026-11-18.D1], [Redazione del verbale esterno dell'incontro con Eggon del 2026-11-17.], [Redigere il verbale esterno e inviarlo per la firma.], [Alessandro Rasia dal Polo, Sara Stefani], [2026-11-20], [#issue(77)],
  [VI\_2026-11-18.D2], [Definizione dell'architettura del POC e i contratti API Nexum, e inviarli ad Eggon.], [Definizione dell'architettura del Proof of Concept e delle specifiche dei contratti API verso NEXUM tramite Bruno, da trasmettere ad Eggon S.r.l.], [Alessandro Rasia dal Polo, Francesco Furin], [2026-11-25], [#issue(78)],
  [VI\_2026-11-18.D3], [Setup repository e automazione PlantUML], [Predisporre la struttura dell'Analisi dei Requisiti, le milestone e il workflow PlantUML.], [Luka Lacic], [2026-11-25], [#issue(80)],
  [VI\_2026-11-18.D4], [Aggiornamento Analisi dei Requisiti], [Aggiornamento dell'Analisi dei Requisiti (UC, requisiti funzionali, tabelle di tracciabilità, persistenza della sessione), recependo i chiarimenti ottenuti da Eggon.], [Nicola Bonetto, Jatin Bajaj], [2026-11-25], [#issue(81)],
  [VI\_2026-11-18.D5], [Avvio della stesura strutturale del Piano di Progetto.], [Impostare la struttura del Piano di Progetto.], [Sara Stefani], [2026-11-25], [#issue(82)],
  [VI\_2026-11-18.D6], [Avvio dello scheletro del Piano di Qualifica.], [Impostare lo scheletro del Piano di Qualifica e verificare le Pull Request aperte.], [Dorde Blagojevic], [2026-11-25], [#issue(83)],
  [VI\_2026-11-18.D7], [Aggiornamento settimanale delle slide del Diario di Bordo.], [Aggiornare le slide del Diario di Bordo.], [Sara Stefani], [2026-11-22], [#issue(84)],
)
]