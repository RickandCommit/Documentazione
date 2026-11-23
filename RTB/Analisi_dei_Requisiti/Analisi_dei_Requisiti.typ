#import "../../.github/template/template.typ": *
#show: documento.with(
  titolo: "Analisi dei Requisiti",
  sottotitolo: "Specifica dei requisiti software per il capitolato C2 (NEXUM Concierge)",
  versione: "v0.7.0",
  data: "2026-11-16",
  stato: "In lavorazione",
  uso: "Esterno",
  redattori: ("Alessandro Rasia dal Polo",),
  verificatori: ("Sara Stefani",),
  destinatari: [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
)


#registro-modifiche(
  table.cell(align: center)[0.7.0], table.cell(align: center)[2026-11-16], [Aggiunte tabelle di riepilogo dei requisiti], [Alessandro Rasia dal Polo], [Sara Stefani],
  table.cell(align: center)[0.6.0], table.cell(align: center)[2026-11-16], [Scissione tabella dei requisiti in funzionali, qualità, prestazionali e di vincolo ], [Alessandro Rasia dal Polo], [Sara Stefani],
  table.cell(align: center)[0.5.0], table.cell(align: center)[2026-11-16], [Correzione diagrammi UML], [Alessandro Rasia dal Polo], [Sara Stefani],
  table.cell(align: center)[0.4.0], table.cell(align: center)[2026-11-15], [Scissione di un caso d'uso in più casi atomici], [Alessandro Rasia dal Polo], [Sara Stefani],
  table.cell(align: center)[0.3.0], table.cell(align: center)[2026-11-15], [Modificato il codice identificativo dei requisiti], [Alessandro Rasia dal Polo], [Sara Stefani],
  table.cell(align: center)[0.2.2], table.cell(align: center)[2026-11-15], [Modifica nome attore secondario], [Alessandro Rasia dal Polo], [Sara Stefani],
  table.cell(align: center)[0.2.1], table.cell(align: center)[2026-11-14], [Modifica formattazione delle tabelle], [Alessandro Rasia dal Polo], [Sara Stefani],
  table.cell(align: center)[0.2.0], table.cell(align: center)[2026-11-14], [Rimosso attore secondario], [Alessandro Rasia dal Polo], [Sara Stefani],
  table.cell(align: center)[0.1.0], table.cell(align: center)[2026-11-13], [Bozza iniziale del documento], [Alessandro Rasia dal Polo], [Sara Stefani],
)

#pagebreak()
#outline(title: "Indice", depth: 3, indent: auto)
#pagebreak()


= Introduzione

== Scopo del documento
Lo scopo del documento è definire in modo formale, rigoroso e strutturato i requisiti software del sistema *NEXUM Concierge*, sviluppato dal gruppo *RickandCommit* per conto dell'azienda proponente *Eggon S.r.l.*
All'interno del testo le funzionalità richieste comprese di casi d'uso sono classificate in requisiti obbligatori, desiserabili e opzionali, secondo le specifiche fornite dal capitolato C2 e quelle emerse dagli incontri con l'azienda proponente.

== Scopo del prodotto
Il prodotto *NEXUM Concierge* è un assistente conversazionale pensato per integrarsi nell'ecosistema *NEXUM*. L'obiettivo primario è agevolare l'accesso dei dipendenti alle informazioni e ai servizi aziendali attraverso il linguaggio naturale.

L'assistente è in grado di rispondere a diverse richieste utilizzando delle abilità speciche:
1. *Conoscenza aziendale:* consultazione documentale dei regolamenti e contratti interni tramite architettura RAG (*Retrieval-Augmented Generation*), con citazione esplicita delle fonti e astensione formale in caso di carenza o contrasto informativo.
2. *Conoscenza del prodotto:* guida contestuale all'uso delle funzionalità dell'applicazione NEXUM sulla base dei manuali operativi ufficiali.
3. *Consultazione dei dati personali:* lettura certificata e deterministica dei dati di cartellino (ferie e permessi fruiti, residui, storico richieste) tramite servizi applicativi autorizzati.
4. *Esecuzione di operazioni:* procedura guidata per la raccolta, riepilogo formale, conferma esplicita e registrazione di richieste di assenza.
5. *Governo della conoscenza (Backoffice):* ambiente amministrativo riservato al personale HR per il caricamento, organizzazione in bucket, sostituzione e ritiro delle fonti informative.

== Glossario
Al fine di prevenire qualsiasi ambiguità, i termini tecnici, gli acronimi e i concetti specifici di dominio utilizzati nella documentazione sono raccolti e formalizzati nel *Glossario* del progetto. I termini definiti nel glossario sono contraddistinti nel testo con una "G" a pedice (es. RAG#sub[G], Bucket#sub[G], LLM#sub[G]).

== Riferimenti

=== Riferimenti normativi
- *Standard ISO/IEC/IEEE 29148:2018:* _Systems and software engineering — Life cycle processes — Requirements engineering_.
- *Standard IEEE 830-1998:* _IEEE Recommended Practice for Software Requirements Specifications_.
- *Norme di Progetto:* documento interno del gruppo *RickandCommit*, reperibile nella cartella `Documentazione/`.

=== Riferimenti informativi
- *Capitolato d'Appalto C2 — NEXUM Concierge:*  documento di specifiche tecniche rilasciato da *Eggon S.r.l.*
- *Verbale Esterno 2026-11-10:* verbale del primo incontro tecnico di allineamento tra il gruppo *RickandCommit* e i referenti di *Eggon S.r.l.*.

#pagebreak()

// ============================================================
// SEZIONE 2: DESCRIZIONE GENERALE
// ============================================================
= Descrizione Generale

== Obiettivo del prodotto e contesto operativo
Il progetto prevede lo sviluppo del sistema *NEXUM Concierge*, un assistente integrato all'interno di una WebApp/PWA per il personale aziendale e un Backoffice amministrativo dedicato per la gestione della conoscenza. L'obiettivo primario è agevolare l'accesso dei dipendenti alle informazioni e ai servizi aziendali attraverso il linguaggio naturale.

Lo sviluppo del software segue un approccio incrementale a spirale: partendo da un prototipo verificativo (*Proof of Concept - PoC*) per la validazione della fattibilità tecnologica, si prosegue poi verso il rilascio di un *Minimum Viable Product (MVP)* pienamente operativo e collaudabile focalizzato sul dominio verticale di *ferie e permessi*.
L'obiettivo a lungo termine, espresso dai requisiti opzionali, prevede di integrare Concierge all'interno della piattaforma NEXUM.

== Confine del Sistema
Il confine del sistema delimita in maniera non ambigua le responsabilità del software da realizzare rispetto agli attori e ai servizi esterni. Il sistema *NEXUM Concierge* comprende:
- L'interfaccia utente conversazionale (WebApp / PWA fruibile da browser desktop e mobile)
- L'interfaccia amministrativa di Backoffice per la gestione dei bucket e delle fonti
- L'orchestratore del dialogo e la logica di business applicativa per l'identificazione e il routing delle intenzioni dell'utente
- Il motore di integrazione documentale e ricerca semantica

== Modellazione degli Attori
In conformità agli standard ISO/IEC/IEEE 29148 e alla notazione UML2, un *Attore* rappresenta un ruolo giocato da un'entità esterna non modificabile che interagisce direttamente con il sistema per raggiungere un obiettivo o per supportare l'erogazione di un servizio:
- *Attore Primario:* entità che avvia l'interazione per raggiungere un proprio obiettivo di business;
- *Attore Secondario:* sistema esterno, servizio o piattaforma di terze parti non modificabile che viene interpellato dal sistema durante l'interazione per completare l'obiettivo dell'attore primario;
- *Caso d'Uso (UC):* insieme di scenari (principale ed estensioni/inclusioni/generalizzazioni) che descrivono la sequenza di interazioni tra uno o più attori e il sistema per produrre un risultato misurabile e di valore per l'attore.

#table(
  columns: (2.8cm, 2.3cm, 1fr, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Attore*], [*Tipologia*], [*Ruolo nel Dominio*], [*Motivazione di Esternalità al Sistema*],
  
  [*Dipendente*\ (Personale)],
  [Primario],
  [Persona fisica autenticata facente parte dell'azienda. Utilizza la chat del Concierge per richiedere informazioni e gestire le richieste di ferie/permessi.],
  [È l'utente finale umano che fornisce gli stimoli al sistema tramite l'interfaccia utente.],

  [*Amministratore HR*\ (Responsabile Fonti)],
  [Primario],
  [Persona fisica con privilegi amministrativi. Accede al Backoffice per caricare, organizzare in bucket, aggiornare e ritirare le fonti aziendali.],
  [È l'operatore umano responsabile del patrimonio informativo aziendale nel backoffice.],

  [*Provider LLM*\ (AWS Bedrock)],
  [Secondario],
  [Servizio cloud esterno di inferenza per modelli linguistici (es. Claude) erogato tramite API da AWS su infrastruttura Eggon. Fornisce comprensione semantica e sintesi.],
  [Sistema esterno proprietario; il software sviluppato invia prompt strutturati e riceve completamenti testuali senza controllarne la piattaforma.],

  [*Servizi NEXUM*],
  [Secondario],
  [Insieme di API aziendali (reali o simulate per la fase PoC/MVP) che gestiscono l'accesso ai dati personali e la registrazione formale delle richieste di assenza.],
  [Sistema enterprise preesistente con cui il Concierge dialoga per eseguire controlli deterministici e garantire la persistenza transazionale.],
)


== Riservatezza dei Dati, Privacy (GDPR) e Gestione Token
- *Protezione dei dati personali:* i dati anagrafici, i saldi ferie e i dettagli delle richieste personali non vengono mai inviati ai modelli linguistici cloud a fini di addestramento o persistenza remota.
- *Gestione del budget AWS Bedrock:* la piattaforma è soggetta a limiti di spesa concordati con Eggon. Il sistema ottimizza la lunghezza dei prompt, applica limiti massimi di token in input/output e traccia l'uso complessivo per preservare la sostenibilità economica del servizio.

== Fonti dei Requisiti
I requisiti software sono stati ricavati ed elaborati a partire dalle seguenti fonti tracciate:
- *Capitolato d'Appalto C2:* documento di specifiche tecniche (requisiti di business identificati dal codice `RB-xx`).
- *Verbale Esterno 2026-11-10:* primo incontro di allineamento tecnico con i referenti di Eggon S.r.l. (decisioni e vincoli identificati da `VE-1.x`).
- *Analisi del Dominio (AD):* requisiti impliciti riguardanti usabilità per WebApp/PWA e standard di sicurezza.
- *Verbali Interni (VI-xx):* decisioni collegiali formalizzate dal gruppo durante i meeting interni.

== Caratteristiche degli Utenti
- *Dipendente:* collaboratore aziendale senza competenze tecniche specifiche. Può formulare richieste composte o parziali
- *Amministratore HR:* operatore con familiarità sui processi aziendali e sulla documentazione interna. Richiede controlli precisi su autorizzazioni, viste tabellari chiare, feedback asincrono sull'ingestione e log di audit verificabili.

== Piattaforma di Esecuzione e Vincoli Generali
- *Fruibilità Web:* interfaccia fruibile tramite WebApp moderna (compatibile con browser desktop e mobile standard)
- *Database e Vettorializzazione:* adozione di PostgreSQL con estensione `pgvector` per il motore RAG
- *Autenticazione nel PoC/RTB:* simulata tramite selettore di contesto (utente/azienda), in conformità con quanto concordato
- *Assenza di memoria cross-sessione:* come stabilito dal capitolato, la memoria delle conversazioni tra sessioni diverse non è prevista per l'MVP: ogni nuova sessione parte da uno stato iniziale pulito

#pagebreak()

// ============================================================
// SEZIONE 3: CASI D'USO (USE CASES)
// ============================================================
= Casi d'Uso

== Convenzioni e Norme di Progetto sui Casi d'Uso
In conformità alle norme di progetto concordate:
- *Regola di denominazione:* i casi d'uso adottano la forma canonica *Infinito Verbo + Oggetto*, formulati rigorosamente dal punto di vista dell'attore interagente.
- *Relazioni tra casi d'uso:*
  - *`<<include>>`:* la funzionalità inclusa è eseguita sempre e necessariamente durante l'esecuzione del caso d'uso base.
  - *`<<extend>>`:* la funzionalità estesa rappresenta un'eccezione, un errore o una variazione condizionata al verificarsi di uno specifico punto di estensione (*extension point*).

== Tabella riassuntiva dei Casi d'Uso

#table(
  columns: (1.5cm, 1fr, 2.2cm, 2.4cm, 2.3cm, 2.5cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Codice*],
  [*Titolo Caso d'Uso*],
  table.cell(align: center)[*Tipo*],
  [*Attore Primario*],
  [*Attori Secondari*],
  [*Fonti*],

  [UC1], [Interazione chat testuale], [Base], [Dipendente], [Provider LLM], [RB-01, RB-02, RB-03, RB-04],
  [UC1.1], [Chiarimento di informazioni ambigue], [<<extend>>], [Dipendente], [Provider LLM], [RB-04],
  [UC1.2], [Visualizzazione errore comunicazione LLM], [<<extend>>], [Dipendente], [Provider LLM], [RB-14],
  [UC2], [Richiesta informazioni su regolamenti aziendali], [Base], [Dipendente], [Provider LLM], [RB-02, RB-08],
  [UC2.1], [Visualizzazione messaggio di astensione], [<<extend>>], [Dipendente], [Provider LLM], [RB-08],
  [UC3], [Richiesta istruzioni su funzionalità NEXUM], [Base], [Dipendente], [Provider LLM], [RB-02, RB-07, RB-08],
  [UC3.1], [Visualizzazione assenza istruzioni prodotto], [<<extend>>], [Dipendente], [Provider LLM], [RB-08],
  [UC4], [Consultazione dati personali ferie e permessi], [Base], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-02, RB-09, RB-10],
  [UC4.1], [Visualizzazione errore recupero dati personali], [<<extend>>], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-14],
  [UC5], [Consultazione stato richieste presentate], [Base], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-13],
  [UC6], [Registrazione richiesta ferie o permessi], [Base], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-02, RB-11, RB-12, VE-1.4],
  [UC6.1], [Visualizzazione riepilogo dati richiesta], [<<include>>], [Dipendente], [Provider LLM], [RB-12],
  [UC6.2], [Conferma esplicita invio richiesta], [<<include>>], [Dipendente], [Provider LLM], [RB-12],
  [UC6.3], [Modifica dati richiesta in preparazione], [<<extend>>], [Dipendente], [Provider LLM], [RB-12],
  [UC6.4], [Visualizzazione errore validazione o sovrapposizione], [<<extend>>], [Dipendente], [Servizi NEXUM], [RB-14, VE-1.4],
  [UC7], [Creazione Bucket di conoscenza], [Base], [Amministratore HR], [—], [RB-05],
  [UC8], [Visualizzazione elenco Bucket], [Base], [Amministratore HR], [—], [RB-05],
  [UC9], [Modifica metadati Bucket], [Base], [Amministratore HR], [—], [RB-05],
  [UC10], [Ritiro Bucket di conoscenza], [Base], [Amministratore HR], [—], [RB-05],
  [UC11], [Caricamento nuova fonte documentale], [Base], [Amministratore HR], [—], [RB-05, RB-06],
  [UC12], [Sostituzione fonte documentale esistente], [Base], [Amministratore HR], [—], [RB-05],
  [UC13], [Ritiro fonte dalla consultazione], [Base], [Amministratore HR], [—], [RB-05],
  [UC14], [Monitoraggio stato elaborazione fonti], [Base], [Amministratore HR], [—], [RB-06, RB-14],
  [UC15], [Consultazione log operazioni e fonti consultate], [Base], [Amministratore HR], [—], [RB-15],
)

#pagebreak()

== Macroarea 1: Interazione Conversazionale e Gestione Contesto
Gestisce l'accesso e l'invio di messaggi tramite interfaccia chat testuale. Il sistema mantiene il contesto storico dei messaggi scambiati nella sessione, identifica le intenzioni dell'utente (routing verso la capacità opportuna) e interviene in modo proattivo quando le richieste contengono dati incompleti o ambigui (es. "vorrei prendere ferie dal 3 al 7" -> il sistema chiede conferma dell'anno o del mese di riferimento). In caso di mancata risposta o timeout da parte del provider AWS Bedrock, scatta la notifica dell'errore tecnico (UC1.2).

=== UC1: Interazione chat testuale
#figure(image("Casi_Uso/out/UC1.svg", width: 75%), caption: [UC1 – Interazione chat testuale])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Il dipendente inizia una conversazione con l'assistente virtuale]
- *Precondizioni:* [Il dipendente è autorizzato ed è stato autenticato]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]
- *Estensioni:* UC1.1, UC1.2.

=== UC1.1: Chiarimento di informazioni ambigue
#figure(image("Casi_Uso/out/UC1_1.svg", width: 75%), caption: [UC1.1 – Chiarimento di informazioni ambigue])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC1.2: Visualizzazione errore di comunicazione LLM
#figure(image("Casi_Uso/out/UC1_2.svg", width: 75%), caption: [UC1.2 – Visualizzazione errore di comunicazione LLM])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

#pagebreak()

== Macroarea 2: Consultazione Conoscenza (Regolamenti e Manuali)
Permette al dipendente di porre quesiti in linguaggio naturale relativi a:
1. *Regolamenti aziendali interni (UC2):* richieste su policy, preavvisi e contratti caricate dall'amministrazione. Il sistema genera la risposta indicando tassativamente le fonti utilizzate. Qualora le fonti siano assenti, non pertinenti o discordanti, il sistema si astiene esplicitamente dal formulare una risposta non verificabile (UC2.1).
2. *Manuali d'uso NEXUM (UC3):* istruzioni operative sul funzionamento della piattaforma applicativa. Questa base di conoscenza è formalmente distinta dalle policy interne: conoscere la schermata per inserire una richiesta non significa stabilire se l'azienda la approverà.

=== UC2: Richiesta informazioni su regolamenti aziendali
#figure(image("Casi_Uso/out/UC2.svg", width: 75%), caption: [UC2 – Richiesta informazioni su regolamenti aziendali])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]
- *Estensioni:* UC2.1.

=== UC2.1: Visualizzazione messaggio di astensione
#figure(image("Casi_Uso/out/UC2_1.svg", width: 75%), caption: [UC2.1 – Visualizzazione messaggio di astensione])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC3: Richiesta istruzioni su funzionalità NEXUM
#figure(image("Casi_Uso/out/UC3.svg", width: 75%), caption: [UC3 – Richiesta istruzioni su funzionalità NEXUM])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]
- *Estensioni:* UC3.1.

=== UC3.1: Visualizzazione assenza istruzioni prodotto
#figure(image("Casi_Uso/out/UC3_1.svg", width: 75%), caption: [UC3.1 – Visualizzazione assenza istruzioni prodotto])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

#pagebreak()

== Macroarea 3: Consultazione Dati Personali Ferie e Permessi
Abilita la consultazione dei dati applicativi del dipendente autenticato tramite servizi deterministici:
- *Consultazione fruito e residuo (UC4):* l'utente interroga il sistema sul proprio storico (es. "Quante ferie ho maturato o fatto quest'anno?"). Il sistema delega la query ai servizi autorizzati NEXUM specificando periodo temporale, unità di misura (giorni/ore) e criteri di conteggio deterministici.
- *Stato avanzamento pratiche (UC5):* restituisce la lista e lo stato aggiornato delle richieste inviate, evidenziando se sono in attesa di approvazione, approvate o rifiutate.

=== UC4: Consultazione dati personali, ferie e permessi
#figure(image("Casi_Uso/out/UC4.svg", width: 75%), caption: [UC4 – Consultazione dati personali, ferie e permessi])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]
- *Estensioni:* UC4.1.

=== UC4.1: Visualizzazione errore recupero dati personali
#figure(image("Casi_Uso/out/UC4_1.svg", width: 75%), caption: [UC4.1 – Visualizzazione errore recupero dati personali])
- *Attori Coinvolti:* Dipendente (Primario), Servizi NEXUM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC5: Consultazione stato richieste presentate
#figure(image("Casi_Uso/out/UC5.svg", width: 75%), caption: [UC5 – Consultazione stato richieste presentate])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

#pagebreak()

== Macroarea 4: Registrazione Richieste Ferie e Permessi (Workflow Guidato)
Rappresenta il flusso operativo dispositivo del sistema:
1. L'utente manifesta la volontà di richiedere ferie o permessi (es. "Segna ferie dal 12 al 16 maggio").
2. Il sistema estrae i parametri, risolve eventuali ambiguità e presenta obbligatoriamente un *Riepilogo Formale Completo (UC6.1)* indicante tipologia, data inizio, data fine, orari e ore complessive.
3. Il sistema richiede una *Conferma Esplicita (UC6.2)* tramite pulsante o risposta affermativa univoca.
4. Se l'utente decide di modificare uno o più dati *(UC6.3)*, il sistema rigenera il riepilogo e richiede una nuova conferma esplicita (RB-12).
5. All'atto dell'invio, le API deterministiche verificano la validità delle date e l'assenza di sovrapposizioni temporali con richieste preesistenti (VE-1.4); in caso di conflitto, la transazione viene respinta con apposita notifica di errore puntuale *(UC6.4)*. La registrazione avvenuta con successo attesta che la richiesta è nello stato registrata / in attesa di approvazione (RB-13).

=== UC6: Registrazione richiesta ferie o permessi
#figure(image("Casi_Uso/out/UC6.svg", width: 75%), caption: [UC6 – Registrazione richiesta ferie o permessi])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]
- *Inclusioni:* UC6.1, UC6.2.
- *Estensioni:* UC6.3, UC6.4.

=== UC6.1: Visualizzazione riepilogo dati richiesta
#figure(image("Casi_Uso/out/UC6_1.svg", width: 70%), caption: [UC6.1 – Visualizzazione riepilogo dati richiesta])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC6.2: Conferma esplicita invio richiesta
#figure(image("Casi_Uso/out/UC6_2.svg", width: 70%), caption: [UC6.2 – Conferma esplicita invio richiesta])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC6.3: Modifica dati della richiesta in preparazione
#figure(image("Casi_Uso/out/UC6_3.svg", width: 75%), caption: [UC6.3 – Modifica dati della richiesta in preparazione])
- *Attori Coinvolti:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC6.4: Visualizzazione errore validazione o sovrapposizione
#figure(image("Casi_Uso/out/UC6_4.svg", width: 75%), caption: [UC6.4 – Visualizzazione errore validazione o sovrapposizione])
- *Attori Coinvolti:* Dipendente (Primario), Servizi NEXUM (Secondario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

#pagebreak()

== Macroarea 5: Gestione Fonti e Knowledge Base (Backoffice)
Fornisce all'Amministratore HR gli strumenti per governare la conoscenza aziendale:
- Creazione e categorizzazione dei Bucket con assegnazione di gruppi destinatari autorizzati (UC7).
- Visualizzazione dell'elenco dei Bucket registrati (UC8).
- Modifica dei metadati e dei permessi di accesso dei Bucket (UC9).
- Ritiro immediato di un Bucket di conoscenza dalla consultazione (UC10).
- Caricamento di documenti (PDF o testo) (UC11).
- Sostituzione di una fonte documentale esistente con revisione normativa (UC12).
- Ritiro immediato di una fonte dalla consultazione (UC13).
- Monitoraggio asincrono dello stato di elaborazione dei documenti (in corso, indicizzato, errore) (UC14).
- Visualizzazione dei log di audit delle operazioni e delle fonti citate nelle risposte (UC15).

=== UC7: Creazione Bucket di conoscenza
#figure(image("Casi_Uso/out/UC7.svg", width: 65%), caption: [UC7 – Creazione Bucket di conoscenza])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC8: Visualizzazione elenco Bucket
#figure(image("Casi_Uso/out/UC8.svg", width: 65%), caption: [UC8 – Visualizzazione elenco Bucket])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC9: Modifica metadati Bucket
#figure(image("Casi_Uso/out/UC9.svg", width: 65%), caption: [UC9 – Modifica metadati Bucket])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC10: Ritiro Bucket di conoscenza
#figure(image("Casi_Uso/out/UC10.svg", width: 65%), caption: [UC10 – Ritiro Bucket di conoscenza])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC11: Caricamento nuova fonte documentale
#figure(image("Casi_Uso/out/UC11.svg", width: 65%), caption: [UC11 – Caricamento nuova fonte documentale])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC12: Sostituzione fonte documentale esistente
#figure(image("Casi_Uso/out/UC12.svg", width: 65%), caption: [UC12 – Sostituzione fonte documentale esistente])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC13: Ritiro fonte dalla consultazione
#figure(image("Casi_Uso/out/UC13.svg", width: 65%), caption: [UC13 – Ritiro fonte dalla consultazione])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC14: Monitoraggio stato elaborazione fonti
#figure(image("Casi_Uso/out/UC14.svg", width: 65%), caption: [UC14 – Monitoraggio stato elaborazione fonti])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

=== UC15: Consultazione log operazioni e fonti consultate
#figure(image("Casi_Uso/out/UC15.svg", width: 65%), caption: [UC15 – Consultazione log operazioni e fonti consultate])
- *Attori Coinvolti:* Amministratore HR (Primario).
- *Descrizione:* [Descrizione sintetica dell'interazione]
- *Precondizioni:* [Precondizioni d'accesso o di stato del sistema]
- *Scenario Principale:*
  1. [Passo 1]
  2. [Passo 2]
- *Postcondizioni:* [Stato del sistema al completamento con successo]

#pagebreak()
// ============================================================
// SEZIONE 4: REQUISITI SOFTWARE
// ============================================================
= Requisiti Software

I requisiti individuati sono classificati e identificati da un codice univoco secondo lo standard convenuto per il progetto:
- *RF-[Numero]:* Requisito Funzionale (funzionalità, interazioni, calcoli e comportamenti applicativi)
- *RQ-[Numero]:* Requisito di Qualità / Extra-funzionale (affidabilità, sicurezza, manutenibilità, isolamento)
- *RV-[Numero]:* Requisito di Vincolo (vincoli tecnologici, normativi o architetturali imposti dal committente/proponente)
- *RP-[Numero]:* Requisito Prestazionale (budget, risorse cloud, tempi di risposta medi)

Per ciascun requisito è specificato il grado di cogenza per la baseline RTB:
- *Obbligatorio (O):* requisito irrinunciabile per il soddisfacimento dei vincoli di capitolato (Milestone RTB / MVP).
- *Desiderabile (D):* funzionalità a valore aggiunto misurabile, non strettamente bloccante per l'accettazione iniziale.
- *Opzionale (Op):* funzionalità a completamento, suscettibile di negoziazione o estensione futura.

== Requisiti Funzionali

#text(size: 8.5pt)[
#table(
  columns: (1.8cm, 2.3cm, 1fr, 2.2cm, 2.5cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Codice*],
  table.cell(align: center)[*Importanza*],
  [*Descrizione del Requisito Funzionale*],
  table.cell(align: center)[*Casi d'Uso*],
  [*Fonti*],
  [RF-001], [Obbligatorio], [Il sistema deve consentire al Dipendente di inviare messaggi testuali in linguaggio naturale tramite l'interfaccia chat.], [UC1], [RB-01, RB-02],
  [RF-002], [Obbligatorio], [Il sistema deve mantenere il contesto della conversazione per l'intera durata della sessione corrente.], [UC1], [RB-04],
  [RF-003], [Obbligatorio], [Il sistema deve discriminare l'intento dell'utente tra: regole aziendali, istruzioni di prodotto, dati personali e operazioni.], [UC1], [RB-02],
  [RF-004], [Obbligatorio], [Il sistema deve consentire all'utente di alternare o combinare capacità informative e dispositive all'interno della medesima sessione di chat.], [UC1], [RB-03],
  [RF-005], [Obbligatorio], [Il sistema deve richiedere chiarimenti proattivi all'utente qualora l'input contenga informazioni ambigue o incomplete (es. date prive di anno).], [UC1.1], [RB-04],
  [RF-006], [Obbligatorio], [Il sistema deve notificare all'utente eventuali errori tecnici o timeout nella comunicazione con il provider LLM.], [UC1.2], [RB-14],
  [RF-007], [Obbligatorio], [Il sistema deve consentire la consultazione delle policy e dei regolamenti aziendali interni tramite RAG, rispondendo in linguaggio naturale.], [UC2], [RB-02, RB-08],
  [RF-008], [Obbligatorio], [Il sistema deve indicare esplicitamente i riferimenti delle fonti documentali utilizzate per formulare la risposta (documento e sezione).], [UC2, UC3], [RB-08],
  [RF-009], [Obbligatorio], [Il sistema deve astenersi formalmente dal formulare una risposta qualora le fonti documentali autorizzate risultino assenti, insufficienti o discordanti.], [UC2.1], [RB-08],
  [RF-010], [Obbligatorio], [Il sistema deve consentire la consultazione delle guide e dei manuali d'uso della piattaforma NEXUM.], [UC3], [RB-02, RB-07, RB-08],
  [RF-011], [Obbligatorio], [Il sistema deve gestire la base di conoscenza dei manuali NEXUM come fonte logicamente e operativamente distinta dai regolamenti interni.], [UC3], [RB-07],
  [RF-012], [Obbligatorio], [Il sistema deve notificare all'utente l'assenza di istruzioni operative qualora la funzionalità NEXUM richiesta non sia documentata nei manuali.], [UC3.1], [RB-08],
  [RF-013], [Obbligatorio], [Il sistema deve consentire al Dipendente di consultare il proprio storico di ferie e permessi fruiti interrogando i servizi applicativi autorizzati.], [UC4], [RB-09, RB-10],
  [RF-014], [Obbligatorio], [Il sistema deve presentare i dati delle assenze specificando chiaramente l'intervallo temporale, l'unità di misura (giorni o ore) e la tipologia.], [UC4], [RB-10],
  [RF-015], [Obbligatorio], [Il sistema deve vietare la deduzione o il calcolo matematico arbitrario del saldo ferie da parte dell'LLM in assenza di dati applicativi certi.], [UC4], [RB-09],
  [RF-016], [Obbligatorio], [Il sistema deve notificare all'utente eventuali errori o indisponibilità nella comunicazione con i servizi applicativi per il recupero dati.], [UC4.1], [RB-14],
  [RF-017], [Obbligatorio], [Il sistema deve consentire al Dipendente di visualizzare l'elenco e lo stato aggiornato delle proprie richieste di ferie/permessi presentate.], [UC5], [RB-13],
  [RF-018], [Obbligatorio], [Il sistema deve distinguere formalmente tra i seguenti stati delle richieste: registrata, in attesa di approvazione, approvata e respinta.], [UC5], [RB-13],
  [RF-019], [Obbligatorio], [Il sistema deve consentire al Dipendente di avviare in linguaggio naturale la procedura di richiesta di ferie o permessi.], [UC6], [RB-11],
  [RF-020], [Obbligatorio], [Il sistema deve estrarre deterministicamente i parametri della richiesta (tipo assenza, data inizio, data fine, orari) tramite function calling.], [UC6], [RB-11],
  [RF-021], [Obbligatorio], [Il sistema deve presentare obbligatoriamente all'utente un riepilogo formale completo dei dati della richiesta prima di procedere all'invio.], [UC6.1], [RB-12],
  [RF-022], [Obbligatorio], [Il sistema deve richiedere una conferma esplicita all'utente per completare l'inoltro della richiesta verso i servizi applicativi.], [UC6.2], [RB-12],
  [RF-023], [Obbligatorio], [Il sistema deve consentire all'utente di modificare uno o più dati della richiesta durante la fase di preparazione prima dell'invio definitivo.], [UC6.3], [RB-12],
  [RF-024], [Obbligatorio], [In caso di modifica dei dati in preparazione, il sistema deve invalidare la conferma, generare un nuovo riepilogo e richiedere una nuova conferma esplicita.], [UC6.3], [RB-12],
  [RF-025], [Obbligatorio], [Il sistema deve demandare la validazione delle date e il controllo delle sovrapposizioni temporali ai servizi applicativi di backend.], [UC6], [VE-1.4],
  [RF-026], [Obbligatorio], [Il sistema deve notificare all'utente il fallimento della registrazione qualora il servizio applicativo segnali una sovrapposizione temporale o violazione di policy.], [UC6.4], [RB-14, VE-1.4],
  [RF-027], [Obbligatorio], [A seguito di conferma positiva, il sistema deve persistere la richiesta nello stato "registrata / in attesa di approvazione" e notificare l'esito al dipendente.], [UC6], [RB-13],
  [RF-028], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di creare un nuovo Bucket di conoscenza specificando nome, descrizione, azienda e gruppi destinatari autorizzati.], [UC7], [RB-01, RB-05],
  [RF-029], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di visualizzare l'elenco dei Bucket di conoscenza configurati con il relativo stato e numero di fonti.], [UC8], [RB-05],
  [RF-030], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di modificare i metadati di un Bucket esistente (nome, descrizione, gruppi destinatari autorizzati).], [UC9], [RB-05],
  [RF-031], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di ritirare un intero Bucket di conoscenza escludendolo dalla consultazione attiva del Concierge.], [UC10], [RB-05],
  [RF-032], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di caricare documenti informativi in formato PDF testuale all'interno di uno specifico Bucket.], [UC11], [RB-05],
  [RF-033], [Obbligatorio], [Il sistema deve scomporre i documenti caricati in unità di conoscenza (chunk) preservando metadati di provenienza, versione e data di caricamento.], [UC11], [RB-06],
  [RF-034], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di sostituire una fonte documentale esistente con una versione aggiornata.], [UC12], [RB-05],
  [RF-035], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di ritirare una singola fonte documentale dalla consultazione attiva.], [UC13], [RB-05],
  [RF-036], [Obbligatorio], [Il sistema deve garantire che le fonti o i bucket ritirati siano immediatamente esclusi dalle risposte successive del Concierge.], [UC10, UC12, UC13], [RB-05, RB-08],
  [RF-037], [Obbligatorio], [Il sistema deve mostrare all'Amministratore HR lo stato di avanzamento dell'elaborazione delle fonti (in corso, indicizzato, errore di elaborazione).], [UC14], [RB-06, RB-14],
  [RF-038], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di consultare i log di tracciamento delle fonti citate e delle operazioni dispositive eseguite.], [UC15], [RB-15],
  [RF-039], [Desiderabile], [Il sistema dovrebbe consentire il caricamento di fonti documentali anche in formato Markdown (.md) o testo semplice (.txt) oltre ai PDF.], [UC11], [Capitolato C2],
  [RF-040], [Desiderabile], [Il sistema dovrebbe consentire al Dipendente di filtrare la visualizzazione delle proprie richieste di assenza per anno solare o per stato della pratica.], [UC5], [AD],
  [RF-041], [Opzionale], [Il sistema potrebbe consentire all'Amministratore HR di scaricare il file originale associato a una fonte documentale precedentemente caricata.], [UC8, UC11], [AD],
)
]

#pagebreak()

== Requisiti di Qualità (RQ)

#text(size: 9pt)[
#table(
  columns: (1.8cm, 2.3cm, 1fr, 2.5cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Codice*],
  table.cell(align: center)[*Importanza*],
  [*Descrizione del Requisito di Qualità*],
  [*Fonti*],
  [RQ-001], [Obbligatorio], [Il sistema deve implementare filtri di sicurezza su input e output per prevenire tentativi di manipolazione del prompt (Prompt Injection).], [VE-1.5, AD],
  [RQ-002], [Obbligatorio], [Il sistema deve impedire l'esfiltrazione accidentale di dati personali o sensibili (PII) verso l'esterno o verso soggetti non autorizzati.], [VE-1.5, AD],
  [RQ-003], [Obbligatorio], [Il sistema deve garantire la totale separazione logica dei dati e delle fonti tra aziende clienti differenti (isolamento multi-tenant).], [RB-01, AD],
  [RQ-004], [Obbligatorio], [L'architettura del sistema deve essere modulare per consentire l'estensione verso nuovi domini operativi e fonti senza refactoring globale.], [RB-16],
  [RQ-005], [Obbligatorio], [Il sistema deve registrare nei log di audit l'identificativo utente, la data, l'abilità invocata e l'esito di ciascuna operazione dispositiva.], [RB-15],
)
]

== Requisiti di Vincolo (RV)

#text(size: 9pt)[
#table(
  columns: (1.8cm, 2.3cm, 1fr, 2.5cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Codice*],
  table.cell(align: center)[*Importanza*],
  [*Descrizione del Requisito di Vincolo*],
  [*Fonti*],
  [RV-001], [Obbligatorio], [La base di conoscenza vettoriale deve essere implementata utilizzando PostgreSQL con l'estensione `pgvector`.], [VE-1.3],
  [RV-002], [Obbligatorio], [Per la revisione RTB/PoC, il Concierge deve essere sviluppato come architettura autonoma e disaccoppiata, interfacciata con API simulate di NEXUM.], [VE-1.1],
  [RV-003], [Obbligatorio], [L'interfaccia utente per il personale deve essere fruibile tramite WebApp / Progressive Web App (PWA) compatibile con i principali browser desktop.], [Capitolato C2],
  [RV-004], [Obbligatorio], [Il backend applicativo del sistema deve essere sviluppato adottando la versione stabile più recente del framework Ruby on Rails.], [VE §3.8],
  [RV-005], [Obbligatorio], [Il frontend dell'interfaccia utente deve essere sviluppato adottando il framework Angular v18.], [VE §3.8],
  [RV-006], [Obbligatorio], [L'integrazione con i modelli linguistici (LLM) deve avvenire tramite credenziali e API erogate su Amazon Web Services (AWS) Bedrock.], [VE-1.2, Capitolato C2],
)
]

== Requisiti Prestazionali (RP)

#text(size: 9pt)[
#table(
  columns: (1.8cm, 2.3cm, 1fr, 2.5cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Codice*],
  table.cell(align: center)[*Importanza*],
  [*Descrizione del Requisito Prestazionale*],
  [*Fonti*],
  [RP-001], [Obbligatorio], [Il sistema deve monitorare e tracciare il consumo dei token e i costi generati dalle invocazioni API su AWS Bedrock per rispettare il budget economico prefissato.], [VE-1.2],
  [RP-002], [Obbligatorio], [I processi di estrazione testo, chunking e vettorizzazione documentale devono essere eseguiti in modo asincrono per non bloccare l'esperienza d'uso.], [Capitolato C2, AD],
  [RP-003], [Desiderabile], [Il sistema dovrebbe completare il recupero documentale e la formulazione iniziale della risposta testuale entro un tempo medio accettabile per l'utente (5 secondi).], [AD],
)
]

#pagebreak()

// ============================================================
// SEZIONE 5: TRACCIAMENTO DEI REQUISITI
// ============================================================
= Tracciamento dei Requisiti

== Tracciamento Fonti → Requisiti Software (Sufficienza)
La presente matrice certifica che ogni bisogno, vincolo e aspettativa formulata dagli stakeholder nel Capitolato (*RB*), nei Verbali Esterni (*VE*) o nell'Analisi del Dominio (*AD*) è soddisfatta da almeno un requisito software formale (*Principio di Sufficienza*).

#text(size: 9pt)[
#table(
  columns: (2.5cm, 1fr, 3.8cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Fonte*], [*Descrizione Sintetica della Fonte*], [*Requisiti Software Soddisfatti*],
  [RB-01], [Contesto persona autenticata e azienda selezionata], [RF-001, RF-028, RQ-003],
  [RB-02], [Discriminazione dell'intento dell'utente], [RF-001, RF-003, RF-007, RF-010],
  [RB-03], [Combinazione di capacità differenti nel dialogo], [RF-004],
  [RB-04], [Mantenimento del contesto e chiarimenti proattivi], [RF-002, RF-005],
  [RB-05], [Caricamento, organizzazione, sostituzione e ritiro fonti da Backoffice], [RF-028, RF-029, RF-030, RF-031, RF-032, RF-034, RF-035, RF-036],
  [RB-06], [Trasformazione in unità di conoscenza (chunking, metadati, stato)], [RF-033, RF-037],
  [RB-07], [Distinzione della base di conoscenza dei manuali NEXUM], [RF-010, RF-011],
  [RB-08], [Citazione esplicita fonti e astensione formale per contrasto/carenza], [RF-007, RF-008, RF-009, RF-010, RF-012, RF-036],
  [RB-09], [Lettura dati personali solo via servizi autorizzati (nessun calcolo LLM)], [RF-013, RF-015],
  [RB-10], [Dati personali esposti con periodo, unità di misura e stati], [RF-013, RF-014],
  [RB-11], [Esecuzione operazioni tramite abilità definite e servizi applicativi], [RF-019, RF-020],
  [RB-12], [Riepilogo formale completo e conferma esplicita prima dell'invio], [RF-021, RF-022, RF-023, RF-024],
  [RB-13], [Distinzione formale degli stati delle richieste (registrata, approvata, ecc.)], [RF-017, RF-018, RF-027],
  [RB-14], [Notifica trasparente di errori tecnici, validazioni fallite e indisponibilità], [RF-006, RF-016, RF-026, RF-037],
  [RB-15], [Tracciabilità completa delle fonti consultate e degli esiti operativi], [RF-038, RQ-005],
  [RB-16], [Architettura aperta ed estensibile verso nuove fonti e abilità], [RQ-004],
  [VE-1.1], [Disaccoppiamento architetturale PoC/MVP e API simulate NEXUM], [RV-002],
  [VE-1.2], [Credenziali AWS Bedrock e monitoraggio del vincolo di budget token], [RV-006, RP-001],
  [VE-1.3], [Adozione di PostgreSQL con estensione `pgvector` e Rails latest], [RV-001, RV-004],
  [VE-1.4], [Validazione e controlli sovrapposizione ferie delegati al backend API], [RF-025, RF-026],
  [VE-1.5], [Sicurezza applicativa, anti-Prompt Injection e protezione dati sensibili (PII)], [RQ-001, RQ-002],
  [VE §3.8], [Standard tecnologici concordati: Angular v18 e Ruby on Rails], [RV-004, RV-005],
  [Capitolato C2], [Fruibilità come PWA desktop e gestione asincrona elaborazioni], [RV-003, RP-002, RF-039],
  [Analisi Dominio (AD)], [Usabilità, filtri avanzati, tempi di risposta e sicurezza d'uso], [RF-040, RF-041, RQ-001, RQ-002, RQ-003, RP-002, RP-003],
)
]

#pagebreak()

== Tracciamento Casi d'Uso → Requisiti Funzionali
La matrice di tracciabilità tra casi d'uso e requisiti funzionali attesta che ogni interazione prevista ha precisi riscontri comportamentali nel software (*Principio di Necessità*).

#text(size: 9pt)[
#table(
  columns: (2.5cm, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Caso d'Uso*], [*Requisiti Funzionali Implementati*],
  [UC1], [RF-001, RF-002, RF-003, RF-004],
  [UC1.1], [RF-005],
  [UC1.2], [RF-006],
  [UC2], [RF-007, RF-008],
  [UC2.1], [RF-009],
  [UC3], [RF-008, RF-010, RF-011],
  [UC3.1], [RF-012],
  [UC4], [RF-013, RF-014, RF-015],
  [UC4.1], [RF-016],
  [UC5], [RF-017, RF-018, RF-040],
  [UC6], [RF-019, RF-020, RF-025, RF-027],
  [UC6.1], [RF-021],
  [UC6.2], [RF-022, RF-024],
  [UC6.3], [RF-023],
  [UC6.4], [RF-026],
  [UC7], [RF-028],
  [UC8], [RF-029, RF-041],
  [UC9], [RF-030],
  [UC10], [RF-031, RF-036],
  [UC11], [RF-032, RF-033, RF-039, RF-041],
  [UC12], [RF-034, RF-036],
  [UC13], [RF-035, RF-036],
  [UC14], [RF-037],
  [UC15], [RF-038],
)
]

#pagebreak()

== Tracciamento Fonti di Capitolato → Casi d'Uso (Requisiti Utente)
La presente tabella riassume il legame diretto tra i requisiti di business formulati dal committente/proponente e i casi d'uso modellati, specificando tipologia, priorità e attori coinvolti.

#text(size: 8.5pt)[
#table(
  columns: (1.5cm, 1fr, 1.2cm, 1.5cm, 2.8cm, 2.5cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Fonte*],
  [*Descrizione Requisito Utente*],
  table.cell(align: center)[*Tipo*],
  table.cell(align: center)[*Priorità*],
  [*Attori Coinvolti*],
  table.cell(align: center)[*Casi d'Uso*],

  [RB-01], [Operare nel contesto della persona autenticata e dell'azienda selezionata.], [F], [O], [Dipendente], [UC1, UC4, UC5, UC6],
  [RB-02], [Riconoscere e distinguere richieste su regole aziendali, istruzioni di prodotto, dati personali e operazioni.], [F], [O], [Dipendente, Provider LLM], [UC1, UC2, UC3, UC4, UC6],
  [RB-03], [Combinare capacità informative e operative differenti all'interno della medesima conversazione.], [F], [O], [Dipendente], [UC1],
  [RB-04], [Mantenere il contesto del dialogo e richiedere chiarimenti in caso di informazioni ambigue (es. date senza anno).], [F], [O], [Dipendente, Provider LLM], [UC1, UC1.1, UC6],
  [RB-05], [Caricamento, organizzazione in bucket, sostituzione e ritiro delle fonti aziendali da Backoffice.], [F], [O], [Amministratore HR], [UC7, UC8, UC9, UC10],
  [RB-06], [Trasformazione delle fonti in unità di conoscenza consultabili preservando provenienza, contesto e versione.], [F], [O], [Amministratore HR], [UC8, UC11],
  [RB-07], [Gestione dei manuali NEXUM come fonte distinta dai regolamenti aziendali interni.], [F], [O], [Dipendente, Provider LLM], [UC3],
  [RB-08], [Risposte documentali con citazione delle fonti; astensione formale se fonti insufficienti o in contrasto.], [F], [O], [Dipendente, Provider LLM], [UC2, UC2.1, UC3, UC3.1],
  [RB-09], [Recupero dei dati personali solo tramite servizi applicativi autorizzati (nessun dato inventato dall'LLM).], [F], [O], [Dipendente, Servizi NEXUM], [UC4, UC5],
  [RB-10], [Dati personali esposti con periodo esplicito, unità di misura e significato degli stati considerati.], [F], [O], [Dipendente, Servizi NEXUM], [UC4],
  [RB-11], [Esecuzione delle operazioni tramite abilità definite e invocazione di servizi applicativi autorizzati.], [F], [O], [Dipendente, Servizi NEXUM], [UC6],
  [RB-12], [Mostrare riepilogo formale completo e richiedere conferma esplicita prima dell'invio; nuovo riepilogo se i dati variano.], [F], [O], [Dipendente], [UC6, UC6.1, UC6.2, UC6.3],
  [RB-13], [Distinguere formalmente tra registrazione, attesa di approvazione e approvazione della richiesta ferie.], [F], [O], [Dipendente, Servizi NEXUM], [UC5, UC6],
  [RB-14], [Comunicazione chiara all'utente di errori tecnici, validazioni fallite o indisponibilità dei servizi.], [F], [O], [Dipendente, Amministratore HR], [UC1.2, UC6.4, UC14],
  [RB-15], [Tracciabilità completa delle fonti consultate e degli esiti delle operazioni effettuate.], [Q], [O], [Amministratore HR], [UC15],
  [RB-16], [Architettura modulare ed estensibile per l'aggiunta di nuove fonti e abilità senza riprogettazione.], [Q], [O], [— (Vincolo architetturale)], [Requisiti di sistema],
  [VE-1.1], [Disaccoppiamento architetturale iniziale: Concierge autonomo interfacciato tramite simulatori/API NEXUM.], [V], [O], [Servizi NEXUM], [Requisiti di vincolo],
  [VE-1.2], [Accesso ad AWS Bedrock con monitoraggio del consumo di token e rispetto del budget prefissato.], [P], [O], [Provider LLM], [Requisiti prestazionali],
  [VE-1.3], [Adozione di PostgreSQL con estensione `pgvector` per la base di conoscenza vettoriale.], [V], [O], [— (Vincolo tecnologico)], [Requisiti di vincolo],
  [VE-1.4], [Controlli di validità e sovrapposizione ferie delegati deterministicamente al backend/API e non all'LLM.], [F], [O], [Servizi NEXUM], [UC6, UC6.4],
  [VE-1.5], [Prevenzione da Prompt Injection, filtri di sicurezza per input/output e tutela dei dati sensibili (PII).], [Q], [O], [— (Qualità di sicurezza)], [Requisiti di qualità],
)
]

#pagebreak()

// ============================================================
// SEZIONE 6: RIEPILOGO DEI REQUISITI
// ============================================================
= Riepilogo dei Requisiti

Di seguito si riportano i dati quantitativi di riepilogo dei requisiti software individuati, suddivisi per tipologia e grado di importanza concordato per la baseline RTB.

#table(
  columns: (3.5cm, 2.5cm, 2.5cm, 2.5cm, 2.5cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Tipologia*], [*Obbligatori*], [*Desiderabili*], [*Opzionali*], [*Totale*],
  [Funzionali (RF)], [38], [2], [1], [41],
  [Qualità (RQ)], [5], [0], [0], [5],
  [Vincolo (RV)], [6], [0], [0], [6],
  [Prestazionali (RP)], [2], [1], [0], [3],
  [*Totale Complessivo*], [*51*], [*3*], [*1*], [*55*],
)

#v(0.5cm)
#align(center)[
#table(
  columns: (4.0cm, 3.0cm, 3.0cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Importanza*], [*Numero Requisiti*], [*Percentuale*],
  [Obbligatori (O)], [51], [92.7%],
  [Desiderabili (D)], [3], [5.5%],
  [Opzionali (Op)], [1], [1.8%],
  [*Totale*], [*55*], [*100%*],
)
]
