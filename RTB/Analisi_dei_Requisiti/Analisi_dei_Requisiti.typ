#import "../../.github/template/template.typ": *
#show: documento.with(
  titolo: "Analisi dei Requisiti",
  sottotitolo: "Specifica dei requisiti software per il capitolato C2 (NEXUM Concierge)",
  versione: "v0.9.0",
  data: "2026-11-23",
  stato: "In lavorazione",
  uso: "Esterno",
  redattori: ("Alessandro Rasia dal Polo", "Jatin Bajaj", "Nicola Bonetto"),
  verificatori: ("Sara Stefani", "Dorde Blagojevic"),
  esito-verifica: "In attesa",
  destinatari: [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
)


#registro-modifiche(
  table.cell(align: center)[0.9.0], table.cell(align: center)[2026-11-23], [Completata Macroarea 5 (UC7-UC15)], [Nicola Bonetto], [Dorde Blagojevic],
  table.cell(align: center)[0.8.0], table.cell(align: center)[2026-11-23], [Recepiti chiarimenti Verbale Esterno 2026-11-17, completate Macroaree 1-4 (UC1-UC6) e aggiornati requisiti e tracciamento], [Jatin Bajaj], [Dorde Blagojevic],
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
All'interno del testo le funzionalità richieste comprese di casi d'uso sono classificate in requisiti obbligatori, desiderabili e opzionali, secondo le specifiche fornite dal capitolato C2 e quelle emerse dagli incontri con l'azienda proponente.

== Scopo del prodotto
Il prodotto *NEXUM Concierge* è un assistente conversazionale pensato per integrarsi nell'ecosistema *NEXUM*. L'obiettivo primario è agevolare l'accesso dei dipendenti alle informazioni e ai servizi aziendali attraverso il linguaggio naturale.

L'assistente è in grado di rispondere a diverse richieste utilizzando delle abilità specifiche:
1. *Conoscenza aziendale:* consultazione documentale dei regolamenti e contratti interni tramite architettura RAG (*Retrieval-Augmented Generation*), con citazione esplicita delle fonti e astensione formale in caso di carenza o contrasto informativo.
2. *Conoscenza del prodotto:* guida contestuale all'uso delle funzionalità dell'applicazione NEXUM sulla base dei manuali operativi ufficiali.
3. *Consultazione dei dati personali:* lettura certificata e deterministica dei dati di cartellino (ferie e permessi fruiti, residui, storico richieste) tramite servizi applicativi autorizzati.
4. *Esecuzione di operazioni:* procedura guidata per la raccolta, riepilogo formale, conferma esplicita e registrazione di richieste di assenza.
5. *Governo della conoscenza (Backoffice):* ambiente amministrativo riservato al personale HR per il caricamento, organizzazione in bucket, sostituzione e ritiro delle fonti informative.

== Glossario
Al fine di prevenire qualsiasi ambiguità, i termini tecnici, gli acronimi e i concetti specifici di dominio utilizzati nella documentazione sono raccolti e formalizzati nel *Glossario* del progetto. I termini definiti nel glossario sono contraddistinti alla prima occorrenza con una "G" ad apice (es. RAG#super[G], Bucket#super[G], LLM#super[G]).

== Riferimenti

=== Riferimenti normativi
- *Standard ISO/IEC/IEEE 29148:2018:* _Systems and software engineering — Life cycle processes — Requirements engineering_.
- *Standard IEEE 830-1998:* _IEEE Recommended Practice for Software Requirements Specifications_.
- *Norme di Progetto:* documento interno del gruppo *RickandCommit*, reperibile nella cartella `Documentazione/`.

=== Riferimenti informativi
- *Capitolato d'Appalto C2 — NEXUM Concierge:*  documento di specifiche tecniche rilasciato da *Eggon S.r.l.*
- *Verbale Esterno 2026-11-10:* verbale del primo incontro tecnico di allineamento tra il gruppo *RickandCommit* e i referenti di *Eggon S.r.l.*.
- *Verbale Esterno 2026-11-17:* verbale del secondo incontro tecnico di allineamento tra il gruppo *RickandCommit* e i referenti di *Eggon S.r.l.*.
- *Verbale Interno 2026-11-18:* verbale della riunione interna di avvio Sprint 2 RTB.

#pagebreak()

// ============================================================
// SEZIONE 2: DESCRIZIONE GENERALE
// ============================================================
= Descrizione Generale

== Obiettivo del prodotto e contesto operativo
Il progetto prevede lo sviluppo del sistema *NEXUM Concierge*, un assistente integrato all'interno di una WebApp/PWA per il personale aziendale e un Backoffice amministrativo dedicato per la gestione della conoscenza. L'obiettivo primario è agevolare l'accesso dei dipendenti alle informazioni e ai servizi aziendali attraverso il linguaggio naturale.

Lo sviluppo del software segue un approccio incrementale a spirale: partendo da un prototipo verificativo (*Proof of Concept - PoC*) per la validazione della fattibilità tecnologica, si prosegue poi verso il rilascio di un *Minimum Viable Product (MVP)* pienamente operativo e collaudabile focalizzato sul dominio verticale di *ferie e permessi*.
L'obiettivo a lungo termine, espresso dai requisiti opzionali, prevede di integrare Concierge all'interno della piattaforma NEXUM.

In particolare, per il perimetro dell'MVP sono stati concordati con l'azienda i seguenti limiti:
- gestione di una *singola azienda* (esclusa la gestione multi-azienda);
- *ruolo amministrativo unico* (HR/Amministrazione e Responsabile Fonti coincidono);
- gestione esclusiva di *ferie e permessi* con campo note opzionale (esclusa la tipologia malattia);
- *divieto di modifica diretta* delle richieste già inviate e gestione dell'eventuale cancellazione direttamente sul portale NEXUM.

== Confine del Sistema
Il confine del sistema delimita in maniera non ambigua le responsabilità del software da realizzare rispetto agli attori e ai servizi esterni. Il sistema *NEXUM Concierge* comprende:
- L'interfaccia utente conversazionale (WebApp / PWA fruibile da browser desktop e mobile)
- L'interfaccia amministrativa di Backoffice per la gestione dei bucket e delle fonti
- L'orchestratore del dialogo e la logica di business applicativa per l'identificazione e il routing delle intenzioni dell'utente
- Il motore di integrazione documentale e ricerca semantica
- Il database interno per la persistenza delle conversazioni e della base di conoscenza vettoriale (`pgvector`) e i tool applicativi controllati in Ruby (`ruby_llm`)

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
- *Verbale Esterno 2026-11-17:* secondo incontro di allineamento tecnico con i referenti di Eggon S.r.l. (decisioni e vincoli identificati da `VE-2.x`).

== Caratteristiche degli Utenti
- *Dipendente:* collaboratore aziendale senza competenze tecniche specifiche. Può formulare richieste composte o parziali
- *Amministratore HR:* operatore con familiarità sui processi aziendali e sulla documentazione interna. Richiede controlli precisi su autorizzazioni, viste tabellari chiare, feedback asincrono sull'ingestione e log di audit verificabili.

== Piattaforma di Esecuzione e Vincoli Generali
- *Fruibilità Web:* interfaccia fruibile tramite WebApp moderna (compatibile con browser desktop e mobile standard)
- *Database e Vettorializzazione:* adozione di PostgreSQL con estensione `pgvector` per il motore RAG
- *Autenticazione nel PoC/RTB:* simulata tramite selettore di contesto utente (con token applicativo fittizio per singola azienda), in conformità con quanto concordato
- *Persistenza intra-sessione e assenza di memoria cross-sessione:* come stabilito dal capitolato e confermato con l'azienda (`VE-2`), la conversazione corrente viene mantenuta all'interno della singola sessione anche in caso di ricaricamento della pagina o cambio schermata, finché l'utente non avvia esplicitamente una nuova sessione; tra sessioni distinte il sistema resta invece stateless e ogni nuova sessione parte da uno stato iniziale pulito

#pagebreak()

// ============================================================
// SEZIONE 3: CASI D'USO (USE CASES)
// ============================================================
= Casi d'Uso

== Convenzioni e Norme di Progetto sui Casi d'Uso
In conformità alle norme di progetto concordate:
- *Regola di denominazione:* i casi d'uso adottano una forma nominale chiara (*Azione/Sostantivo + Oggetto*), formulati dal punto di vista dell'attore interagente.
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

  [UC1], [Interazione chat testuale], [Base], [Dipendente], [Provider LLM], [RB-01, RB-02, RB-03, RB-04, VE-2.3],
  [UC1.1], [Chiarimento di informazioni ambigue], [<<extend>>], [Dipendente], [Provider LLM], [RB-04],
  [UC1.2], [Visualizzazione errore di comunicazione LLM], [<<extend>>], [Dipendente], [Provider LLM], [RB-14, VE-2.4],
  [UC1.3], [Visualizzazione errore di connessione lato client], [<<extend>>], [Dipendente], [—], [RB-14, VE-2.4],
  [UC1.4], [Avvio nuova sessione di chat], [<<extend>>], [Dipendente], [—], [RB-04, VE-2.3],
  [UC2], [Richiesta informazioni su regolamenti aziendali], [Base], [Dipendente], [Provider LLM], [RB-02, RB-08, VE-2.2],
  [UC2.1], [Visualizzazione messaggio di astensione], [<<extend>>], [Dipendente], [Provider LLM], [RB-08, VE-2.2],
  [UC3], [Richiesta istruzioni su funzionalità NEXUM], [Base], [Dipendente], [Provider LLM], [RB-02, RB-07, RB-08],
  [UC3.1], [Visualizzazione assenza istruzioni prodotto], [<<extend>>], [Dipendente], [Provider LLM], [RB-08],
  [UC4], [Consultazione dati personali, ferie e permessi], [Base], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-02, RB-09, RB-10],
  [UC4.1], [Visualizzazione errore recupero dati personali], [<<extend>>], [Dipendente], [Servizi NEXUM], [RB-14, VE-2.4],
  [UC5], [Consultazione stato richieste presentate], [Base], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-13, VE-2.5],
  [UC5.1], [Visualizzazione errore recupero stato richieste], [<<extend>>], [Dipendente], [Servizi NEXUM], [RB-14, VE-2.4],
  [UC6], [Registrazione richiesta ferie o permessi], [Base], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-02, RB-11, RB-12, VE-1.4, VE-2.5],
  [UC6.1], [Visualizzazione riepilogo dati richiesta], [<<include>>], [Dipendente], [Provider LLM], [RB-12, VE-2.4],
  [UC6.2], [Conferma esplicita invio richiesta], [<<include>>], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-12, VE-2.4],
  [UC6.3], [Modifica dati della richiesta in preparazione], [<<extend>>], [Dipendente], [Provider LLM], [RB-12],
  [UC6.4], [Visualizzazione errore validazione o sovrapposizione], [<<extend>>], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-14, VE-1.4, VE-2.4],
  [UC6.5], [Visualizzazione diniego per violazione regolamento aziendale], [<<extend>>], [Dipendente], [Servizi NEXUM, Provider LLM], [RB-08, VE-2.4, VE-2.5],
  [UC6.6], [Annullamento preparazione richiesta], [<<extend>>], [Dipendente], [Provider LLM], [RB-12],
  [UC7], [Creazione Bucket di conoscenza], [Base], [Amministratore HR], [—], [RB-05, VE-2.2],
  [UC7.1], [Visualizzazione errore validazione dati Bucket], [<<extend>>], [Amministratore HR], [—], [RB-14],
  [UC8], [Visualizzazione elenco Bucket], [Base], [Amministratore HR], [—], [RB-05],
  [UC9], [Modifica metadati Bucket], [Base], [Amministratore HR], [—], [RB-05],
  [UC10], [Ritiro Bucket di conoscenza], [Base], [Amministratore HR], [—], [RB-05, VE-2.2],
  [UC11], [Caricamento nuova fonte documentale], [Base], [Amministratore HR], [—], [RB-05, RB-06, VE-2.2],
  [UC11.1], [Visualizzazione errore file non valido], [<<extend>>], [Amministratore HR], [—], [RB-14],
  [UC12], [Sostituzione fonte documentale esistente], [Base], [Amministratore HR], [—], [RB-05, RB-06, VE-2.2],
  [UC13], [Ritiro fonte dalla consultazione], [Base], [Amministratore HR], [—], [RB-05, VE-2.2],
  [UC14], [Monitoraggio stato elaborazione fonti], [Base], [Amministratore HR], [—], [RB-06, RB-14],
  [UC14.1], [Visualizzazione dettaglio errore di elaborazione], [<<extend>>], [Amministratore HR], [—], [RB-14],
  [UC14.2], [Scaricamento file originale della fonte], [<<extend>>], [Amministratore HR], [—], [AD],
  [UC15], [Consultazione log operazioni e fonti consultate], [Base], [Amministratore HR], [—], [RB-15],
)

#pagebreak()

== Macroarea 1: Interazione Conversazionale e Gestione Contesto
Gestisce l'invio di messaggi e la ricezione di risposte tramite interfaccia chat testuale. Il sistema mantiene il contesto dei messaggi scambiati per tutta la durata della singola sessione (anche in caso di ricaricamento della pagina o cambio schermata), identifica l'intento dell'utente e interviene proattivamente in caso di richieste ambigue o incomplete (`UC1.1`). Sono inoltre gestiti la comunicazione di eventuali errori del provider LLM (`UC1.2`), gli errori di connessione lato client (`UC1.3`) e l'avvio esplicito di una nuova sessione di chat priva di contesto pregresso (`UC1.4`).

#figure(image("Casi_Uso/out/macroarea1.svg", width: 85%), caption: [Diagramma panoramico – Macroarea 1])

=== UC1: Interazione chat testuale
#figure(image("Casi_Uso/out/UC1.svg", width: 70%), caption: [UC1 – Interazione chat testuale])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il dipendente invia una richiesta in linguaggio naturale tramite l'interfaccia chat e riceve una risposta pertinente, mantenendo il contesto della sessione corrente.
- *Precondizioni:* Il sistema è attivo; il dipendente è autenticato e si trova nella schermata della chat.
- *Trigger:* Il dipendente desidera porre una domanda o avviare un'operazione tramite l'assistente conversazionale.
- *Scenario Principale:*
  1. Il dipendente accede alla chat; se esiste una conversazione attiva nella sessione corrente (anche dopo un ricaricamento della pagina o un cambio schermata), il sistema la mantiene visibile.
  2. Il dipendente inserisce e invia un messaggio testuale in linguaggio naturale.
  3. Il sistema acquisisce il messaggio, lo interpreta nel contesto della sessione corrente con il supporto del Provider LLM e identifica la capacità richiesta (regolamenti aziendali, istruzioni NEXUM, dati personali o operazioni).
  4. Il sistema elabora la richiesta e mostra la risposta testuale nella chat, aggiornando la cronologia della sessione corrente.
- *Scenari Alternativi:*
  - Se il messaggio contiene elementi ambigui o incompleti, il sistema richiede un chiarimento (*UC1.1*).
  - Se il Provider LLM non risponde o si verifica un errore tecnico persistente dopo i tentativi automatici di ripetizione, il sistema mostra un messaggio di errore non tecnico (*UC1.2*).
  - Se si verifica una caduta di rete o una disconnessione lato client, l'interfaccia segnala l'errore di connessione (*UC1.3*).
  - Se il dipendente sceglie di iniziare da zero, avvia una nuova sessione di chat (*UC1.4*).
- *Postcondizioni:* Il dipendente visualizza la risposta del sistema e la cronologia della sessione corrente è aggiornata e mantenuta fino all'avvio esplicito di una nuova sessione.
- *Estensioni:* UC1.1, UC1.2, UC1.3, UC1.4.

=== UC1.1: Chiarimento di informazioni ambigue
#figure(image("Casi_Uso/out/UC1_1.svg", width: 75%), caption: [UC1.1 – Chiarimento di informazioni ambigue])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il sistema rileva ambiguità o informazioni mancanti nel messaggio del dipendente e chiede un chiarimento mirato prima di procedere.
- *Precondizioni:* Il dipendente ha inviato un messaggio in `UC1` che ammette più interpretazioni o manca di parametri essenziali (es. una data priva di anno o di mese non deducibile dal contesto).
- *Condizione di estensione:* Nel contesto della richiesta sono presenti elementi ambigui o incompleti.
- *Scenario Principale:*
  1. Il sistema individua gli elementi mancanti o ambigui nella richiesta del dipendente con il supporto del Provider LLM.
  2. Il sistema sospende l'esecuzione della richiesta e formula nella chat una domanda di chiarimento chiara e mirata.
  3. Il dipendente risponde fornendo le precisazioni richieste, consentendo al dialogo di proseguire nel contesto corrente.
- *Postcondizioni:* Il dipendente ha ricevuto la richiesta di chiarimento e può completare i dati necessari per soddisfare la propria richiesta iniziale.

=== UC1.2: Visualizzazione errore di comunicazione LLM
#figure(image("Casi_Uso/out/UC1_2.svg", width: 75%), caption: [UC1.2 – Visualizzazione errore di comunicazione LLM])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il sistema informa il dipendente in modo comprensibile qualora la comunicazione con il Provider LLM fallisca in modo persistente.
- *Precondizioni:* Il dipendente ha inviato un messaggio in `UC1` e la comunicazione verso il Provider LLM ha generato un errore tecnico o un timeout anche dopo i tentativi automatici di ripetizione.
- *Condizione di estensione:* Indisponibilità o errore tecnico persistente del Provider LLM.
- *Scenario Principale:*
  1. Il sistema rileva il fallimento persistente della comunicazione con il Provider LLM.
  2. Il sistema nasconde eventuali dettagli o codici tecnici interni e mostra nella chat un messaggio sintetico e comprensibile (es. servizio temporaneamente non disponibile, invitando a riprovare più tardi).
- *Postcondizioni:* Il dipendente è informato dell'impossibilità temporanea di ottenere risposta, senza esposizione di codici di errore tecnici e senza compromettere la sessione di chat.

=== UC1.3: Visualizzazione errore di connessione lato client
#figure(image("Casi_Uso/out/UC1_3.svg", width: 75%), caption: [UC1.3 – Visualizzazione errore di connessione lato client])
- *Attori:* Dipendente (Primario).
- *Descrizione:* L'interfaccia utente avvisa il dipendente in caso di perdita di connettività o interruzione della comunicazione lato client.
- *Precondizioni:* Il dipendente sta interagendo con la chat in `UC1` e si verifica una perdita di connessione di rete o una disconnessione verso il sistema.
- *Condizione di estensione:* Perdita di connettività o disconnessione lato client.
- *Scenario Principale:*
  1. L'interfaccia utente rileva l'interruzione della connessione con il sistema.
  2. L'interfaccia mostra al dipendente un avviso chiaro sullo stato di disconnessione e sull'impossibilità temporanea di inviare o ricevere messaggi.
- *Postcondizioni:* Il dipendente è informato del problema di connettività lato client; i messaggi precedenti della sessione restano conservati fino al ripristino della connessione.

=== UC1.4: Avvio nuova sessione di chat
#figure(image("Casi_Uso/out/UC1_4.svg", width: 75%), caption: [UC1.4 – Avvio nuova sessione di chat])
- *Attori:* Dipendente (Primario).
- *Descrizione:* Il dipendente chiude esplicitamente la conversazione in corso per avviare una nuova sessione di chat priva del contesto precedente.
- *Precondizioni:* Il dipendente si trova in una sessione di chat attiva (`UC1`).
- *Trigger:* Il dipendente desidera iniziare una nuova conversazione senza mantenere il contesto di quella precedente.
- *Condizione di estensione:* Il dipendente seleziona la funzionalità di avvio di una nuova sessione di chat.
- *Scenario Principale:*
  1. Il dipendente richiede esplicitamente l'avvio di una nuova sessione di chat tramite l'interfaccia.
  2. Il sistema chiude la sessione conversazionale corrente.
  3. Il sistema apre una nuova sessione di chat pulita, pronta a ricevere nuovi messaggi senza memoria della conversazione precedente.
- *Postcondizioni:* La sessione precedente non è più attiva nella chat e il dipendente opera in una nuova sessione inizializzata da stato pulito.
#pagebreak()

== Macroarea 2: Consultazione Conoscenza (Regolamenti e Manuali)
Permette al dipendente di porre quesiti in linguaggio naturale relativi a due basi di conoscenza logicamente distinte:
1. *Regolamenti aziendali interni (`UC2`):* richieste su policy, preavvisi e regole aziendali caricate dal Backoffice. Il sistema consulta esclusivamente le fonti attive autorizzate (facendo prevalere la versione più recente in caso di aggiornamenti dello stesso regolamento) e indica sempre le fonti utilizzate nella risposta. In caso di carenza informativa o contrasti non risolvibili tra fonti diverse, il sistema si astiene esplicitamente (`UC2.1`).
2. *Manuali d'uso NEXUM (`UC3`):* istruzioni operative sul funzionamento della piattaforma applicativa, mantenute distinte dalle policy aziendali interne (conoscere come compilare una schermata non implica l'approvazione della richiesta). Se la funzionalità non è documentata nei manuali, il sistema lo comunica esplicitamente (`UC3.1`).

#figure(image("Casi_Uso/out/macroarea2.svg", width: 85%), caption: [Diagramma panoramico – Macroarea 2])

=== UC2: Richiesta informazioni su regolamenti aziendali
#figure(image("Casi_Uso/out/UC2.svg", width: 70%), caption: [UC2 – Richiesta informazioni su regolamenti aziendali])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il dipendente pone una domanda relativa alle regole e alle procedure aziendali su ferie e permessi e riceve una risposta basata sui regolamenti attivi, completa di citazione delle fonti.
- *Precondizioni:* Il sistema è attivo; il dipendente è autenticato e si trova nella chat (`UC1`); esistono fonti aziendali attive autorizzate per il profilo del dipendente.
- *Trigger:* Il dipendente desidera chiarire una regola, un preavviso o una procedura prevista dal regolamento aziendale.
- *Scenario Principale:*
  1. Il dipendente formula in chat una domanda sulle regole o procedure aziendali (es. giorni minimi di preavviso o gestione del saldo negativo).
  2. Il sistema identifica l'intento come richiesta di conoscenza aziendale e ricerca le informazioni pertinenti esclusivamente tra le fonti attive autorizzate per il dipendente (escludendo le fonti ritirate/archiviate).
  3. Qualora siano presenti versioni successive di uno stesso regolamento, il sistema considera esclusivamente la versione più recente.
  4. Il sistema elabora la risposta in linguaggio naturale con il supporto del Provider LLM basandosi solo sulle evidenze recuperate.
  5. Il sistema mostra al dipendente la risposta in chat accompagnata dai riferimenti espliciti delle fonti utilizzate (nome del documento e sezione pertinente).
- *Scenari Alternativi:*
  - Se le fonti autorizzate risultano assenti, insufficienti o presentano contrasti non risolvibili tra documenti distinti, il sistema si astiene dal rispondere (*UC2.1*).
- *Postcondizioni:* Il dipendente visualizza una risposta accurata basata sui regolamenti aziendali attivi con i relativi riferimenti documentali.
- *Estensioni:* UC2.1.

=== UC2.1: Visualizzazione messaggio di astensione
#figure(image("Casi_Uso/out/UC2_1.svg", width: 75%), caption: [UC2.1 – Visualizzazione messaggio di astensione])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il sistema informa esplicitamente il dipendente che non può fornire una risposta affidabile perché le fonti aziendali autorizzate sono assenti, insufficienti o in contrasto non risolvibile.
- *Precondizioni:* Il dipendente ha inviato una domanda sui regolamenti aziendali (`UC2`), ma la ricerca sulle fonti attive autorizzate non ha prodotto informazioni sufficienti oppure ha rilevato un contrasto non risolvibile tra fonti diverse.
- *Condizione di estensione:* Fonti autorizzate assenti, insufficienti o in contrasto non risolvibile.
- *Scenario Principale:*
  1. Il sistema verifica l'impossibilità di formulare una risposta supportata in modo certo dalle fonti aziendali attive.
  2. Il sistema evita di generare risposte non verificate e mostra in chat un messaggio esplicito di astensione, indicando chiaramente la carenza informativa o il contrasto riscontrato.
- *Postcondizioni:* Il dipendente è informato dell'impossibilità di rispondere con certezza e non riceve informazioni inventate o non supportate dai documenti aziendali.

=== UC3: Richiesta istruzioni su funzionalità NEXUM
#figure(image("Casi_Uso/out/UC3.svg", width: 70%), caption: [UC3 – Richiesta istruzioni su funzionalità NEXUM])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il dipendente chiede indicazioni operative su come utilizzare una funzionalità della piattaforma NEXUM (area ferie e permessi) e riceve istruzioni basate sui manuali ufficiali del prodotto.
- *Precondizioni:* Il sistema è attivo; il dipendente è autenticato e si trova nella chat (`UC1`); i manuali operativi NEXUM sono caricati e attivi nel sistema come fonte distinta dai regolamenti aziendali.
- *Trigger:* Il dipendente vuole sapere come utilizzare una schermata o una funzione dell'applicazione NEXUM.
- *Scenario Principale:*
  1. Il dipendente chiede in chat come eseguire un'operazione o dove trovare una funzione su NEXUM (es. come visualizzare o cancellare una richiesta sul portale).
  2. Il sistema identifica l'intento come richiesta di conoscenza del prodotto e ricerca le informazioni pertinenti esclusivamente nei manuali operativi NEXUM, mantenendoli separati dai regolamenti aziendali interni.
  3. Il sistema genera la guida operativa in linguaggio naturale con il supporto del Provider LLM.
  4. Il sistema mostra al dipendente le istruzioni richieste in chat indicando esplicitamente la fonte del manuale consultato (ed eventuale sezione pertinente).
- *Scenari Alternativi:*
  - Se nei manuali operativi NEXUM non sono presenti istruzioni relative alla funzionalità richiesta, il sistema lo segnala esplicitamente (*UC3.1*).
- *Postcondizioni:* Il dipendente visualizza le istruzioni operative richieste con indicazione della fonte del manuale NEXUM.
- *Estensioni:* UC3.1.

=== UC3.1: Visualizzazione assenza istruzioni prodotto
#figure(image("Casi_Uso/out/UC3_1.svg", width: 75%), caption: [UC3.1 – Visualizzazione assenza istruzioni prodotto])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il sistema comunica chiaramente al dipendente che la funzionalità NEXUM richiesta non è documentata nei manuali disponibili.
- *Precondizioni:* Il dipendente ha richiesto istruzioni operative su NEXUM (`UC3`), ma i manuali di prodotto caricati nel sistema non contengono informazioni pertinenti alla funzionalità domandata.
- *Condizione di estensione:* Assenza di istruzioni pertinenti nei manuali operativi NEXUM.
- *Scenario Principale:*
  1. Il sistema rileva che nessun manuale operativo NEXUM copre la funzionalità richiesta dal dipendente.
  2. Il sistema mostra in chat un messaggio chiaro in cui dichiara l'assenza di istruzioni disponibili per la funzionalità indicata, evitando di formulare indicazioni non verificate.
- *Postcondizioni:* Il dipendente è informato che la funzionalità richiesta non è presente nei manuali operativi disponibili.

#pagebreak()

== Macroarea 3: Consultazione Dati Personali Ferie e Permessi
Abilita la consultazione dei dati personali del dipendente autenticato tramite i Servizi NEXUM autorizzati, impedendo qualsiasi calcolo o deduzione arbitraria da parte del modello linguistico:
- *Consultazione saldo e storico ferie/permessi (`UC4`):* il dipendente interroga il sistema sui propri contatori di ferie e permessi (maturati, fruiti, in attesa e residui) con periodo e unità di misura espliciti; eventuali errori di recupero sono gestiti in `UC4.1`.
- *Consultazione stato richieste presentate (`UC5`):* il dipendente visualizza l'elenco e lo stato aggiornato delle proprie richieste, ciascuna classificata esclusivamente in uno dei tre stati previsti (*in attesa*, *approvata*, *rifiutata*); eventuali errori di recupero sono gestiti in `UC5.1`.

#figure(image("Casi_Uso/out/macroarea3.svg", width: 85%), caption: [Diagramma panoramico – Macroarea 3])

=== UC4: Consultazione dati personali, ferie e permessi
#figure(image("Casi_Uso/out/UC4.svg", width: 70%), caption: [UC4 – Consultazione dati personali, ferie e permessi])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* Il dipendente consulta i propri dati personali relativi a ferie e permessi (maturati, fruiti, in attesa e residui) recuperati in modo deterministico dai Servizi NEXUM autorizzati.
- *Precondizioni:* Il sistema è attivo; il dipendente è autenticato e si trova nella chat (`UC1`).
- *Trigger:* Il dipendente desidera conoscere il proprio saldo residuo o il riepilogo di ferie e permessi per un determinato periodo.
- *Scenario Principale:*
  1. Il dipendente chiede in chat informazioni sui propri dati di ferie o permessi (es. ferie fruite nell'anno corrente o ore di permesso residue).
  2. Il sistema interpreta la richiesta con il supporto del Provider LLM, individuando tipologia e periodo di riferimento (richiedendo chiarimenti tramite `UC1.1` se il periodo è ambiguo).
  3. Il sistema interroga in modo controllato i Servizi NEXUM nel contesto esclusivo del dipendente autenticato per recuperare i dati aggiornati.
  4. I Servizi NEXUM verificano l'identità e restituiscono i dati personali certificati (tipologia, periodo, unità di misura e contatori maturati, fruiti, in attesa e residui).
  5. Il sistema presenta al dipendente i dati ricevuti in linguaggio naturale, specificando chiaramente periodo, tipologia e unità di misura (giorni o ore), senza eseguire deduzioni arbitrarie in assenza di dati applicativi.
- *Scenari Alternativi:*
  - Se i Servizi NEXUM risultano indisponibili o restituiscono un errore tecnico persistente dopo i tentativi automatici di ripetizione, il sistema notifica l'errore in modo non tecnico (*UC4.1*).
- *Postcondizioni:* Il dipendente visualizza i propri dati aggiornati e certificati su ferie e permessi relativi al periodo richiesto.
- *Estensioni:* UC4.1.

=== UC4.1: Visualizzazione errore recupero dati personali
#figure(image("Casi_Uso/out/UC4_1.svg", width: 75%), caption: [UC4.1 – Visualizzazione errore recupero dati personali])
- *Attori:* Dipendente (Primario), Servizi NEXUM (Secondario).
- *Descrizione:* Il sistema informa il dipendente in modo chiaro e non tecnico qualora il recupero dei dati personali dai Servizi NEXUM fallisca in modo persistente.
- *Precondizioni:* Il dipendente ha richiesto i propri dati personali (`UC4`) e la comunicazione con i Servizi NEXUM non è andata a buon fine nemmeno dopo i tentativi automatici di ripetizione con attesa (debounce).
- *Condizione di estensione:* Errore tecnico persistente o indisponibilità dei Servizi NEXUM durante il recupero dei dati personali.
- *Scenario Principale:*
  1. Il sistema rileva il fallimento persistente nel recupero dei dati personali dai Servizi NEXUM.
  2. Il sistema filtra eventuali codici di errore o dettagli tecnici interni e mostra in chat un messaggio sintetico e comprensibile, invitando il dipendente a riprovare più tardi.
- *Postcondizioni:* Il dipendente è avvisato dell'impossibilità temporanea di consultare i propri dati personali senza esposizione di dettagli tecnici.

=== UC5: Consultazione stato richieste presentate
#figure(image("Casi_Uso/out/UC5.svg", width: 70%), caption: [UC5 – Consultazione stato richieste presentate])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* Il dipendente consulta l'elenco delle proprie richieste di ferie e permessi inviate e il relativo stato aggiornato (*in attesa*, *approvata* o *rifiutata*).
- *Precondizioni:* Il sistema è attivo; il dipendente è autenticato e si trova nella chat (`UC1`).
- *Trigger:* Il dipendente vuole verificare l'esito o lo stato di avanzamento delle proprie richieste di ferie o permessi già presentate.
- *Scenario Principale:*
  1. Il dipendente chiede in chat di visualizzare le proprie richieste di ferie o permessi presentate (eventualmente specificando un periodo o uno stato).
  2. Il sistema interpreta la richiesta con il supporto del Provider LLM e interroga i Servizi NEXUM nel contesto esclusivo del dipendente autenticato.
  3. I Servizi NEXUM restituiscono l'elenco aggiornato delle richieste del dipendente con tipologia, periodo e stato corrente.
  4. Il sistema mostra in chat le richieste distinguendo esplicitamente tra i tre stati previsti: *in attesa*, *approvata* e *rifiutata*.
- *Scenari Alternativi:*
  - Se non risultano richieste presenti per il dipendente nel periodo o filtro indicato, il sistema lo comunica esplicitamente in chat.
  - Se i Servizi NEXUM risultano indisponibili o falliscono in modo persistente dopo i tentativi automatici di ripetizione, il sistema mostra un messaggio di errore non tecnico (*UC5.1*).
- *Postcondizioni:* Il dipendente visualizza l'elenco e lo stato aggiornato delle proprie richieste di ferie e permessi.
- *Estensioni:* UC5.1.

=== UC5.1: Visualizzazione errore recupero stato richieste
#figure(image("Casi_Uso/out/UC5_1.svg", width: 75%), caption: [UC5.1 – Visualizzazione errore recupero stato richieste])
- *Attori:* Dipendente (Primario), Servizi NEXUM (Secondario).
- *Descrizione:* Il sistema informa il dipendente in modo comprensibile qualora il recupero dell'elenco delle richieste dai Servizi NEXUM fallisca in modo persistente.
- *Precondizioni:* Il dipendente ha chiesto di consultare lo stato delle proprie richieste (`UC5`) e la chiamata ai Servizi NEXUM ha fallito anche dopo i tentativi automatici di ripetizione con attesa (debounce).
- *Condizione di estensione:* Errore tecnico persistente o indisponibilità dei Servizi NEXUM durante il recupero dello stato delle richieste.
- *Scenario Principale:*
  1. Il sistema rileva il fallimento persistente nel recupero dell'elenco richieste dai Servizi NEXUM.
  2. Il sistema nasconde eventuali dettagli tecnici o codici di stato interni e mostra in chat un messaggio sintetico e comprensibile, invitando il dipendente a riprovare più tardi.
- *Postcondizioni:* Il dipendente è informato dell'impossibilità temporanea di consultare lo stato delle proprie richieste senza esposizione di errori tecnici.

#pagebreak()

== Macroarea 4: Registrazione Richieste Ferie e Permessi (Workflow Guidato)
Rappresenta il flusso operativo dispositivo del sistema nell'ambito dell'MVP, limitato esclusivamente a *ferie* e *permessi* con campo note opzionale e senza causali o sottotipi obbligatori (la malattia resta formalmente esclusa):
1. Il dipendente manifesta in linguaggio naturale la volontà di inserire una richiesta di ferie (data inizio, data fine, note opzionali) o di permesso (data, fascia oraria, note opzionali).
2. Il sistema raccoglie i parametri, risolve eventuali ambiguità (`UC1.1`), verifica il rispetto dei vincoli del regolamento aziendale (es. preavviso minimo e soglie di saldo negativo; in caso di violazione scatta `UC6.5`) e presenta obbligatoriamente un *Riepilogo Formale Completo (`UC6.1`)*.
3. Il dipendente può modificare i dati prima dell'invio (`UC6.3`), annullare la preparazione (`UC6.6`) oppure fornire una *Conferma Esplicita (`UC6.2`)* per inoltrare la richiesta.
4. All'atto dell'invio, i Servizi NEXUM verificano validità e assenza di sovrapposizioni temporali; eventuali errori di validazione, conflitti o indisponibilità persistenti sono comunicati in modo non tecnico (`UC6.4`). A registrazione avvenuta, la richiesta entra nello stato *in attesa*; non è prevista alcuna modifica diretta post-invio e l'eventuale cancellazione resta gestita direttamente sul portale NEXUM.

#figure(image("Casi_Uso/out/macroarea4.svg", width: 85%), caption: [Diagramma panoramico – Macroarea 4])

=== UC6: Registrazione richiesta ferie o permessi
#figure(image("Casi_Uso/out/UC6.svg", width: 70%), caption: [UC6 – Registrazione richiesta ferie o permessi])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* Il dipendente prepara, verifica, conferma e registra una nuova richiesta di ferie o permessi tramite il flusso conversazionale guidato.
- *Precondizioni:* Il sistema è attivo; il dipendente è autenticato e si trova nella chat (`UC1`).
- *Trigger:* Il dipendente desidera inviare una nuova richiesta di ferie o di permesso.
- *Scenario Principale:*
  1. Il dipendente esprime in chat l'intenzione di richiedere ferie o un permesso, indicando periodo (date per le ferie; data e fascia oraria per i permessi) ed eventuali note opzionali.
  2. Il sistema estrae i parametri della richiesta con il supporto del Provider LLM; se mancano dati essenziali o vi sono ambiguità (es. data priva di anno), richiede chiarimenti (`UC1.1`).
  3. Il sistema verifica il rispetto delle regole aziendali vigenti nei regolamenti attivi (es. preavviso minimo e limiti di saldo negativo, consultando i contatori tramite i Servizi NEXUM ove necessario).
  4. Il sistema mostra al dipendente il riepilogo formale completo dei dati della richiesta (*UC6.1*).
  5. Il dipendente fornisce la conferma esplicita per l'invio definitivo della richiesta (*UC6.2*).
  6. Il sistema inoltra la richiesta ai Servizi NEXUM nel contesto esclusivo del dipendente autenticato e riceve l'esito della registrazione.
  7. Il sistema comunica in chat l'avvenuta registrazione della richiesta nello stato *in attesa*, precisando che essa rimane soggetta al normale processo di approvazione aziendale su NEXUM.
- *Scenari Alternativi:*
  - Se la richiesta viola un vincolo del regolamento aziendale (es. preavviso insufficiente o saldo negativo non consentito), il sistema blocca l'invio e fornisce un diniego motivato (*UC6.5*).
  - Se il dipendente desidera correggere uno o più dati prima dell'invio, modifica la richiesta in preparazione (*UC6.3*) e ripete riepilogo e conferma.
  - Se il dipendente non conferma l'invio dopo il riepilogo, la preparazione viene annullata (*UC6.6*).
  - Se i Servizi NEXUM respingono la richiesta per dati non validi/sovrapposizione temporale o risultano indisponibili anche dopo i tentativi automatici di ripetizione, il sistema notifica l'errore (*UC6.4*).
- *Postcondizioni:* La richiesta di ferie o permesso è registrata presso i Servizi NEXUM nello stato *in attesa* e l'esito è comunicato al dipendente in chat.
- *Inclusioni:* UC6.1, UC6.2.
- *Estensioni:* UC6.3, UC6.4, UC6.5, UC6.6.

=== UC6.1: Visualizzazione riepilogo dati richiesta
#figure(image("Casi_Uso/out/UC6_1.svg", width: 70%), caption: [UC6.1 – Visualizzazione riepilogo dati richiesta])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Prima dell'invio definitivo, il sistema presenta al dipendente un riepilogo completo e strutturato di tutti i dati della richiesta in preparazione.
- *Precondizioni:* Il dipendente ha avviato `UC6` e tutti i parametri obbligatori della richiesta di ferie o permesso sono stati raccolti, disambiguati e verificati rispetto al regolamento aziendale.
- *Scenario Principale:*
  1. Il sistema compone il riepilogo completo dei dati raccolti: tipologia (*ferie* o *permesso*), date complete di anno (e fascia oraria/ore complessive per i permessi) ed eventuali note opzionali.
  2. Il sistema visualizza il riepilogo nella chat, evidenziando che la richiesta non è ancora stata inviata e invitando il dipendente a verificarne la correttezza.
- *Postcondizioni:* Il dipendente visualizza il riepilogo completo e accurato della richiesta in preparazione ed è pronto a confermare, modificare o annullare.

=== UC6.2: Conferma esplicita invio richiesta
#figure(image("Casi_Uso/out/UC6_2.svg", width: 70%), caption: [UC6.2 – Conferma esplicita invio richiesta])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* Il dipendente esprime una conferma esplicita e univoca sul riepilogo presentato, autorizzando il sistema a trasmettere la richiesta ai Servizi NEXUM.
- *Precondizioni:* Il sistema ha mostrato al dipendente il riepilogo completo e aggiornato della richiesta (`UC6.1`) e nessuna modifica successiva ha invalidato tale riepilogo.
- *Scenario Principale:*
  1. Il dipendente verifica i dettagli nel riepilogo e fornisce una conferma esplicita e inequivocabile all'invio.
  2. Il sistema registra l'avvenuta conferma esplicita e autorizza l'inoltro definitivo della richiesta verso i Servizi NEXUM.
- *Postcondizioni:* La conferma esplicita del dipendente è acquisita e la richiesta è pronta per la registrazione definitiva presso i Servizi NEXUM.

=== UC6.3: Modifica dati della richiesta in preparazione
#figure(image("Casi_Uso/out/UC6_3.svg", width: 75%), caption: [UC6.3 – Modifica dati della richiesta in preparazione])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il dipendente modifica uno o più dati della richiesta prima che venga inviata definitivamente, invalidando qualsiasi conferma precedente e imponendo un nuovo riepilogo.
- *Precondizioni:* Il dipendente sta visualizzando il riepilogo della richiesta in preparazione (`UC6.1`) e la richiesta non è ancora stata inoltrata ai Servizi NEXUM.
- *Trigger:* Il dipendente rileva un'imprecisione nei dati riepilogati o desidera cambiare periodo, orari o note prima dell'invio.
- *Condizione di estensione:* Il dipendente richiede di modificare uno o più campi della richiesta prima della conferma definitiva.
- *Scenario Principale:*
  1. Il dipendente indica in chat le variazioni da apportare ai dati della richiesta in preparazione.
  2. Il sistema aggiorna i parametri della richiesta con il supporto del Provider LLM e invalida qualsiasi eventuale conferma precedente.
  3. Il sistema ripresenta obbligatoriamente un nuovo riepilogo completo aggiornato (`UC6.1`) e richiede una nuova conferma esplicita (`UC6.2`).
- *Postcondizioni:* I dati della richiesta in preparazione sono aggiornati e la procedura richiede un nuovo ciclo di riepilogo e conferma prima di qualsiasi invio.

=== UC6.4: Visualizzazione errore validazione o sovrapposizione
#figure(image("Casi_Uso/out/UC6_4.svg", width: 75%), caption: [UC6.4 – Visualizzazione errore validazione o sovrapposizione])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* Il sistema informa in modo chiaro e non tecnico il dipendente quando i Servizi NEXUM rifiutano la registrazione per dati non validi o sovrapposizione temporale, oppure risultano persistentemente indisponibili.
- *Precondizioni:* Il dipendente ha confermato la richiesta (`UC6.2`), ma i Servizi NEXUM segnalano un errore di validazione/conflitto (es. sovrapposizione con una richiesta esistente) oppure falliscono in modo persistente dopo i tentativi automatici di ripetizione con attesa (debounce).
- *Condizione di estensione:* Rifiuto della registrazione da parte dei Servizi NEXUM per dati non validi/sovrapposizione oppure errore tecnico persistente durante l'invio.
- *Scenario Principale:*
  1. Il sistema riceve l'esito negativo dai Servizi NEXUM o rileva il fallimento persistente dell'invio dopo i tentativi di ripetizione automatica.
  2. Il sistema impedisce la registrazione parziale o duplicata, nasconde codici di errore tecnici e dettagli interni e mostra in chat un messaggio comprensibile che spiega il problema (es. sovrapposizione di date o temporanea indisponibilità del servizio).
- *Postcondizioni:* La richiesta non viene registrata su NEXUM e il dipendente riceve una spiegazione chiara e comprensibile dell'esito negativo.

=== UC6.5: Visualizzazione diniego per violazione regolamento aziendale
#figure(image("Casi_Uso/out/UC6_5.svg", width: 75%), caption: [UC6.5 – Visualizzazione diniego per violazione regolamento aziendale])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario), Servizi NEXUM (Secondario).
- *Descrizione:* Il sistema blocca la preparazione della richiesta quando questa viola un vincolo stabilito nel regolamento aziendale attivo e spiega il motivo del diniego al dipendente.
- *Precondizioni:* Il dipendente ha richiesto la registrazione di ferie o permessi (`UC6`), ma il confronto tra i parametri richiesti, i dati di saldo recuperati dai Servizi NEXUM e le regole del regolamento aziendale attivo evidenzia una violazione (es. giorni minimi di preavviso non rispettati o superamento della soglia massima di saldo negativo).
- *Condizione di estensione:* La richiesta viola una regola numerica o procedurale definita nel regolamento aziendale attivo.
- *Scenario Principale:*
  1. Il sistema rileva che la richiesta non rispetta uno o più vincoli previsti dal regolamento aziendale attivo.
  2. Il sistema interrompe la procedura di invio senza inoltrare la richiesta ai Servizi NEXUM.
  3. Il sistema formula in chat un diniego motivato e comprensibile, indicando la regola violata e citando il riferimento al regolamento aziendale applicato.
- *Postcondizioni:* Nessuna richiesta viene inoltrata ai Servizi NEXUM e il dipendente comprende chiaramente quale regola aziendale impedisce la richiesta.

=== UC6.6: Annullamento preparazione richiesta
#figure(image("Casi_Uso/out/UC6_6.svg", width: 75%), caption: [UC6.6 – Annullamento preparazione richiesta])
- *Attori:* Dipendente (Primario), Provider LLM (Secondario).
- *Descrizione:* Il dipendente annulla la preparazione di una richiesta di ferie o permesso prima dell'invio definitivo.
- *Precondizioni:* Il dipendente ha avviato `UC6` e si trova nella fase di preparazione o visualizzazione del riepilogo (`UC6.1`) prima della conferma definitiva.
- *Trigger:* Il dipendente decide di non procedere più con l'invio della richiesta in preparazione.
- *Condizione di estensione:* Il dipendente rifiuta la conferma o chiede esplicitamente di annullare la preparazione della richiesta.
- *Scenario Principale:*
  1. Il dipendente comunica in chat di voler annullare la richiesta in preparazione (o nega la conferma al riepilogo).
  2. Il sistema scarta i dati della bozza in preparazione senza effettuare alcun invio ai Servizi NEXUM.
  3. Il sistema conferma in chat che la procedura è stata annullata e nessuna richiesta è stata registrata.
- *Postcondizioni:* La preparazione della richiesta è annullata, nessuna operazione è stata eseguita sui Servizi NEXUM e il dipendente può continuare a usare la chat.

#pagebreak()

== Macroarea 5: Gestione Fonti e Knowledge Base (Backoffice)
Fornisce all'Amministratore HR (ruolo amministrativo unico per l'MVP nell'ambito della singola azienda) gli strumenti per governare la conoscenza aziendale:
- Creazione dei Bucket con assegnazione dei gruppi destinatari autorizzati (`UC7`) e segnalazione di dati non validi (`UC7.1`).
- Visualizzazione dell'elenco dei Bucket registrati (`UC8`).
- Modifica dei metadati e dei gruppi destinatari dei Bucket (`UC9`).
- Ritiro tramite archiviazione logica di un intero Bucket dalla consultazione (`UC10`).
- Caricamento di documenti in formato PDF, sia testuali sia scansionati con supporto OCR (`UC11`), e segnalazione di file non validi (`UC11.1`).
- Sostituzione di una fonte esistente con una nuova versione (`UC12`).
- Ritiro tramite archiviazione logica di una singola fonte dalla consultazione (`UC13`).
- Monitoraggio asincrono dello stato di elaborazione delle fonti (`UC14`), con dettaglio degli errori di elaborazione (`UC14.1`) e scaricamento opzionale del file originale (`UC14.2`).
- Visualizzazione dei log di audit delle operazioni e delle fonti citate nelle risposte (`UC15`).

#figure(image("Casi_Uso/out/macroarea5.svg", width: 85%), caption: [Diagramma panoramico – Macroarea 5])

=== UC7: Creazione Bucket di conoscenza
#figure(image("Casi_Uso/out/UC7.svg", width: 65%), caption: [UC7 – Creazione Bucket di conoscenza])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR crea un nuovo Bucket (contenitore configurabile di fonti documentali nell'ambito della singola azienda), specificandone nome, descrizione e gruppi destinatari autorizzati alla consultazione.
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi e accede alla sezione del Backoffice dedicata ai Bucket.
- *Trigger:* L'Amministratore HR desidera creare un nuovo Bucket di conoscenza.
- *Scenario Principale:*
  1. L'Amministratore HR richiede la creazione di un nuovo Bucket.
  2. Il sistema mostra il modulo di creazione con i campi nome, descrizione e gruppi destinatari selezionabili.
  3. L'Amministratore HR compila nome e descrizione, seleziona uno o più gruppi destinatari e conferma la creazione.
  4. Il sistema valida i dati inseriti e registra il nuovo Bucket in stato attivo, inizialmente privo di fonti.
  5. Il sistema notifica all'Amministratore HR l'esito positivo dell'operazione.
- *Scenari Alternativi:*
  - Se i dati inseriti non superano la validazione (es. nome mancante o duplicato, nessun gruppo destinatario selezionato), il sistema segnala l'errore (*UC7.1*).
- *Postcondizioni:* Il Bucket è registrato, attivo e visibile nell'elenco dei Bucket; non contiene ancora fonti ed è pronto ad accoglierne.
- *Estensioni:* UC7.1.

// Da confermare con Eggon: unicità del nome del Bucket e obbligatorietà di almeno un gruppo destinatario.
=== UC7.1: Visualizzazione errore validazione dati Bucket
#figure(image("Casi_Uso/out/UC7_1.svg", width: 70%), caption: [UC7.1 – Visualizzazione errore validazione dati Bucket])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* Il sistema segnala all'Amministratore HR che i dati inseriti per un Bucket non sono validi, indicando i campi da correggere senza registrare né modificare il Bucket.
- *Precondizioni:* L'Amministratore HR ha confermato la creazione (`UC7`) o la modifica (`UC9`) di un Bucket e almeno un controllo di validazione ha esito negativo (nome mancante, nome già utilizzato da un altro Bucket o nessun gruppo destinatario selezionato).
- *Condizione di estensione:* I dati inseriti durante la creazione o la modifica del Bucket non superano la validazione.
- *Scenario Principale:*
  1. Il sistema interrompe l'operazione in corso.
  2. Il sistema mostra, per ciascun campo non valido, un messaggio comprensibile che ne spiega il motivo, mantenendo nel modulo i dati già inseriti per agevolarne la correzione.
- *Postcondizioni:* Nessun Bucket è stato creato o modificato; il modulo resta disponibile per la correzione dei dati.

=== UC8: Visualizzazione elenco Bucket
#figure(image("Casi_Uso/out/UC8.svg", width: 65%), caption: [UC8 – Visualizzazione elenco Bucket])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR consulta l'elenco dei Bucket configurati con le relative informazioni di sintesi.
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi nel Backoffice.
- *Trigger:* L'Amministratore HR desidera consultare i Bucket di conoscenza configurati.
- *Scenario Principale:*
  1. L'Amministratore HR accede alla sezione dei Bucket nel Backoffice.
  2. Il sistema recupera i Bucket configurati e mostra l'elenco indicando, per ciascuno, nome, descrizione, gruppi destinatari, stato (*attivo* o *ritirato*) e numero di fonti contenute.
- *Scenari Alternativi:*
  - Se non è presente alcun Bucket configurato, il sistema lo segnala con un apposito messaggio informativo.
- *Postcondizioni:* L'elenco dei Bucket è visualizzato; nessun dato è stato modificato.

=== UC9: Modifica metadati Bucket
#figure(image("Casi_Uso/out/UC9.svg", width: 65%), caption: [UC9 – Modifica metadati Bucket])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR modifica nome, descrizione e/o gruppi destinatari di un Bucket esistente senza alterare le fonti in esso contenute.
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi nel Backoffice ed è presente almeno un Bucket.
- *Trigger:* L'Amministratore HR desidera aggiornare i metadati o i destinatari autorizzati di un Bucket esistente.
- *Scenario Principale:*
  1. L'Amministratore HR seleziona un Bucket dall'elenco (`UC8`) e richiede la modifica dei metadati.
  2. Il sistema mostra il modulo precompilato con i valori correnti.
  3. L'Amministratore HR modifica uno o più campi tra nome, descrizione e gruppi destinatari e conferma l'aggiornamento.
  4. Il sistema valida i dati, aggiorna i metadati del Bucket e notifica l'esito positivo.
- *Scenari Alternativi:*
  - Se i dati modificati non superano la validazione, il sistema interrompe l'aggiornamento e segnala i campi errati (*UC7.1*).
- *Postcondizioni:* I metadati del Bucket sono aggiornati e le nuove autorizzazioni dei gruppi destinatari si applicano alle interrogazioni successive del Concierge; le fonti del Bucket restano invariate.
- *Estensioni:* UC7.1.

=== UC10: Ritiro Bucket di conoscenza
#figure(image("Casi_Uso/out/UC10.svg", width: 65%), caption: [UC10 – Ritiro Bucket di conoscenza])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR ritira un intero Bucket dalla consultazione attiva tramite archiviazione logica; il Bucket e le sue fonti diventano immediatamente non utilizzabili dal Concierge ma restano conservati nello storico.
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi nel Backoffice ed è presente almeno un Bucket attivo.
- *Trigger:* L'Amministratore HR desidera escludere un intero Bucket dalla consultazione del Concierge.
- *Scenario Principale:*
  1. L'Amministratore HR seleziona un Bucket attivo dall'elenco (`UC8`) e richiede il ritiro del Bucket.
  2. Il sistema mostra il nome del Bucket e il numero di fonti interessate, richiedendo una conferma esplicita.
  3. L'Amministratore HR conferma il ritiro.
  4. Il sistema archivia logicamente il Bucket e tutte le sue fonti, escludendoli immediatamente dal recupero documentale, e notifica l'esito positivo.
- *Scenari Alternativi:*
  - Se l'Amministratore HR annulla alla richiesta di conferma, l'operazione termina senza alcuna modifica.
- *Postcondizioni:* Il Bucket e le relative fonti risultano ritirati e non sono più accessibili al Concierge né per nuove conversazioni né per il proseguimento di quelle in corso; i record restano conservati per la storicizzazione e il monitoraggio della qualità.

=== UC11: Caricamento nuova fonte documentale
#figure(image("Casi_Uso/out/UC11.svg", width: 65%), caption: [UC11 – Caricamento nuova fonte documentale])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR carica un documento in formato PDF (testuale o scansionato con supporto OCR) in un Bucket attivo; il sistema registra la nuova fonte e ne avvia l'elaborazione asincrona in unità di conoscenza consultabili.
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi nel Backoffice ed è presente almeno un Bucket attivo.
- *Trigger:* L'Amministratore HR desidera rendere consultabile dal Concierge un nuovo documento aziendale.
- *Scenario Principale:*
  1. L'Amministratore HR seleziona il Bucket attivo di destinazione, richiede il caricamento di una nuova fonte e sceglie il file PDF dal proprio dispositivo.
  2. L'Amministratore HR conferma il caricamento.
  3. Il sistema verifica la validità del file e registra la fonte nel Bucket assegnandole versione e data di caricamento.
  4. Il sistema avvia l'elaborazione asincrona del documento (includendo il riconoscimento ottico dei caratteri qualora il PDF sia una scansione), imposta lo stato della fonte su *in corso* e notifica l'avvio dell'operazione.
- *Scenari Alternativi:*
  - Se il file selezionato non è in un formato supportato, è vuoto o illeggibile, il sistema rifiuta il caricamento e mostra un errore (*UC11.1*).
- *Postcondizioni:* La fonte è registrata nel Bucket in stato *in corso* e diventa consultabile dal Concierge al termine positivo dell'elaborazione asincrona (`UC14`).
- *Estensioni:* UC11.1.

=== UC11.1: Visualizzazione errore file non valido
#figure(image("Casi_Uso/out/UC11_1.svg", width: 70%), caption: [UC11.1 – Visualizzazione errore file non valido])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* Il sistema segnala all'Amministratore HR che il file selezionato non può essere accettato come fonte, spiegandone il motivo senza registrare o modificare alcuna fonte.
- *Precondizioni:* L'Amministratore HR ha confermato il caricamento (`UC11`) o la sostituzione (`UC12`) di una fonte, ma il file selezionato non rispetta il formato supportato, risulta vuoto oppure danneggiato/illeggibile.
- *Condizione di estensione:* Il file selezionato durante il caricamento o la sostituzione non supera la verifica di validità.
- *Scenario Principale:*
  1. Il sistema interrompe l'operazione di caricamento o sostituzione.
  2. Il sistema mostra un messaggio chiaro che indica la causa del rifiuto del file, consentendo all'Amministratore HR di selezionarne un altro.
- *Postcondizioni:* Nessuna fonte è stata registrata o modificata; eventuali versioni già presenti restano invariate.

=== UC12: Sostituzione fonte documentale esistente
#figure(image("Casi_Uso/out/UC12.svg", width: 65%), caption: [UC12 – Sostituzione fonte documentale esistente])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR sostituisce una fonte esistente con una nuova versione del documento; a elaborazione completata, la nuova versione prevale esclusivamente e la precedente viene archiviata logicamente.
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi nel Backoffice ed è presente almeno una fonte attiva in un Bucket attivo.
- *Trigger:* L'Amministratore HR desidera aggiornare una fonte esistente con una versione più recente del documento (es. un regolamento aggiornato).
- *Scenario Principale:*
  1. L'Amministratore HR seleziona la fonte da sostituire nell'elenco (`UC14`), richiede la sostituzione e seleziona il nuovo file PDF.
  2. L'Amministratore HR conferma la sostituzione.
  3. Il sistema verifica la validità del file, lo registra come nuova versione della medesima fonte (con numero di versione incrementato e data di caricamento) e ne avvia l'elaborazione asincrona in stato *in corso*.
  4. Al termine positivo dell'elaborazione, il sistema rende consultabile la nuova versione e ritira tramite archiviazione logica la versione precedente.
- *Scenari Alternativi:*
  - Se il nuovo file non supera la validazione, il sistema interrompe la sostituzione e segnala l'errore (*UC11.1*), lasciando invariata la versione attuale.
  - Se l'elaborazione asincrona della nuova versione fallisce (`UC14.1`), la versione precedente resta consultabile fino al caricamento di un file valido.
- *Postcondizioni:* Solo la versione più recente è consultabile dal Concierge; la versione precedente è archiviata logicamente e resa inaccessibile sia per nuove conversazioni sia per quelle in corso.
- *Estensioni:* UC11.1.

// Da confermare con Eggon: la versione precedente resta attiva fino al termine positivo dell'elaborazione della nuova.
=== UC13: Ritiro fonte dalla consultazione
#figure(image("Casi_Uso/out/UC13.svg", width: 65%), caption: [UC13 – Ritiro fonte dalla consultazione])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR ritira una singola fonte documentale dalla consultazione attiva tramite archiviazione logica, conservandone lo storico ma impedendone l'uso da parte del Concierge.
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi nel Backoffice ed è presente almeno una fonte attiva in un Bucket attivo.
- *Trigger:* L'Amministratore HR desidera escludere una fonte deprecata o non più valida dalla consultazione del Concierge.
- *Scenario Principale:*
  1. L'Amministratore HR seleziona la fonte da ritirare nell'elenco (`UC14`) e richiede il ritiro.
  2. Il sistema richiede una conferma esplicita dell'operazione.
  3. L'Amministratore HR conferma il ritiro.
  4. Il sistema archivia logicamente la fonte, escludendola immediatamente dal recupero documentale, e notifica l'esito positivo.
- *Scenari Alternativi:*
  - Se l'Amministratore HR annulla alla richiesta di conferma, l'operazione termina senza alcuna modifica.
- *Postcondizioni:* La fonte risulta ritirata e non è più accessibile al Concierge né per nuove conversazioni né per quelle in corso; il record rimane conservato per la storicizzazione delle conversazioni che l'hanno citata.

=== UC14: Monitoraggio stato elaborazione fonti
#figure(image("Casi_Uso/out/UC14.svg", width: 65%), caption: [UC14 – Monitoraggio stato elaborazione fonti])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR consulta l'elenco delle fonti di un Bucket con il relativo stato di elaborazione asincrona e la disponibilità alla consultazione (vista da cui può anche accedere a `UC12`, `UC13`, `UC14.1` e `UC14.2`).
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi nel Backoffice ed è presente almeno un Bucket.
- *Trigger:* L'Amministratore HR desidera verificare lo stato di elaborazione e disponibilità delle fonti caricate.
- *Scenario Principale:*
  1. L'Amministratore HR accede alla sezione delle fonti e seleziona un Bucket.
  2. Il sistema mostra l'elenco delle fonti indicando, per ciascuna, nome, versione, data di caricamento, stato di elaborazione (*in corso*, *indicizzato*, *errore*) e disponibilità alla consultazione (*consultabile*, *non consultabile*, *ritirata*).
  3. Il sistema aggiorna gli stati man mano che le elaborazioni asincrone procedono.
- *Scenari Alternativi:*
  - Se il Bucket non contiene fonti, il sistema lo segnala con un apposito messaggio informativo.
  - Se l'Amministratore HR seleziona una fonte in stato *errore*, visualizza il dettaglio dell'errore (*UC14.1*).
  - Se l'Amministratore HR richiede una copia del documento originale di una fonte, può scaricarla (*UC14.2*, funzionalità opzionale).
- *Postcondizioni:* Gli stati di elaborazione e disponibilità delle fonti sono visualizzati; nessun dato è stato modificato.
- *Estensioni:* UC14.1, UC14.2.

=== UC14.1: Visualizzazione dettaglio errore di elaborazione
#figure(image("Casi_Uso/out/UC14_1.svg", width: 70%), caption: [UC14.1 – Visualizzazione dettaglio errore di elaborazione])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR visualizza la causa sintetica per cui l'elaborazione asincrona di una fonte non è andata a buon fine.
- *Precondizioni:* L'elenco delle fonti è visualizzato (`UC14`) ed esiste almeno una fonte in stato *errore*.
- *Trigger:* L'Amministratore HR seleziona una fonte in stato *errore* per comprenderne la causa.
- *Condizione di estensione:* L'Amministratore HR seleziona una fonte il cui stato di elaborazione è *errore*.
- *Scenario Principale:*
  1. L'Amministratore HR seleziona la fonte in stato *errore* nell'elenco.
  2. Il sistema mostra la causa dell'errore in termini comprensibili (es. testo non estraibile, file danneggiato o servizio di elaborazione temporaneamente non disponibile) e la data dell'errore, indicando la possibilità di sostituire il file (`UC12`).
- *Postcondizioni:* Il dettaglio dell'errore è visualizzato; la fonte resta in stato *errore* e non è consultabile dal Concierge.

=== UC14.2: Scaricamento file originale della fonte
#figure(image("Casi_Uso/out/UC14_2.svg", width: 70%), caption: [UC14.2 – Scaricamento file originale della fonte])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR scarica una copia del file originale associato a una fonte precedentemente caricata (funzionalità opzionale).
- *Precondizioni:* L'elenco delle fonti è visualizzato (`UC14`) e il file originale della fonte selezionata è conservato dal sistema.
- *Trigger:* L'Amministratore HR desidera ottenere una copia locale del file originale di una fonte.
- *Condizione di estensione:* L'Amministratore HR seleziona l'azione di scaricamento del file originale su una fonte dell'elenco.
- *Scenario Principale:*
  1. L'Amministratore HR seleziona una fonte dall'elenco (`UC14`) e richiede lo scaricamento del file originale.
  2. Il sistema mette a disposizione il file originale così come era stato caricato.
- *Postcondizioni:* L'Amministratore HR dispone di una copia del file originale; nessun dato nel sistema è stato modificato.

=== UC15: Consultazione log operazioni e fonti consultate
#figure(image("Casi_Uso/out/UC15.svg", width: 65%), caption: [UC15 – Consultazione log operazioni e fonti consultate])
- *Attori:* Amministratore HR (Primario).
- *Descrizione:* L'Amministratore HR consulta il registro di tracciamento delle fonti documentali citate dal Concierge e delle operazioni dispositive eseguite per conto dei dipendenti.
- *Precondizioni:* Il sistema è attivo; l'Amministratore HR è autenticato con privilegi amministrativi e accede alla sezione del Backoffice dedicata ai log di audit.
- *Trigger:* L'Amministratore HR desidera verificare quali fonti sono state consultate e quali operazioni sono state eseguite dal Concierge.
- *Scenario Principale:*
  1. L'Amministratore HR accede alla sezione dei log di audit nel Backoffice.
  2. Il sistema recupera le voci registrate e le mostra in ordine cronologico inverso indicando data e ora, utente, capacità invocata, fonti consultate (documento, versione e sezione) oppure operazione dispositiva con relativa conferma ed esito.
- *Scenari Alternativi:*
  - Se non sono presenti voci di log, il sistema lo segnala con un apposito messaggio informativo.
- *Postcondizioni:* Le voci di log sono visualizzate; nessun dato è stato modificato.

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
  [RF-002], [Obbligatorio], [Il sistema deve mantenere il contesto e la cronologia della conversazione all'interno della singola sessione anche in caso di ricaricamento della pagina o cambio schermata, restando stateless tra sessioni distinte.], [UC1], [RB-04, VE-2.3],
  [RF-003], [Obbligatorio], [Il sistema deve discriminare l'intento dell'utente tra: regole aziendali, istruzioni di prodotto, dati personali e operazioni.], [UC1], [RB-02],
  [RF-004], [Obbligatorio], [Il sistema deve consentire all'utente di alternare o combinare capacità informative e dispositive all'interno della medesima sessione di chat.], [UC1], [RB-03],
  [RF-005], [Obbligatorio], [Il sistema deve richiedere chiarimenti proattivi all'utente qualora l'input contenga informazioni ambigue o incomplete (es. date prive di anno).], [UC1.1], [RB-04],
  [RF-006], [Obbligatorio], [Il sistema deve notificare all'utente eventuali errori tecnici o timeout persistenti nella comunicazione con il Provider LLM tramite un messaggio sintetico e comprensibile.], [UC1.2], [RB-14, VE-2.4],
  [RF-007], [Obbligatorio], [Il sistema deve consentire la consultazione delle policy e dei regolamenti aziendali interni tramite RAG, rispondendo in linguaggio naturale.], [UC2], [RB-02, RB-08],
  [RF-008], [Obbligatorio], [Il sistema deve indicare esplicitamente i riferimenti delle fonti documentali utilizzate per formulare la risposta (documento e sezione).], [UC2, UC3], [RB-08],
  [RF-009], [Obbligatorio], [Il sistema deve astenersi formalmente dal formulare una risposta qualora le fonti documentali autorizzate risultino assenti, insufficienti o presentino contrasti non risolvibili tra documenti distinti.], [UC2.1], [RB-08, VE-2.2],
  [RF-010], [Obbligatorio], [Il sistema deve consentire la consultazione delle guide e dei manuali d'uso della piattaforma NEXUM.], [UC3], [RB-02, RB-07, RB-08],
  [RF-011], [Obbligatorio], [Il sistema deve gestire la base di conoscenza dei manuali NEXUM come fonte logicamente e operativamente distinta dai regolamenti interni.], [UC3], [RB-07],
  [RF-012], [Obbligatorio], [Il sistema deve notificare all'utente l'assenza di istruzioni operative qualora la funzionalità NEXUM richiesta non sia documentata nei manuali.], [UC3.1], [RB-08],
  [RF-013], [Obbligatorio], [Il sistema deve consentire al Dipendente di consultare i propri dati di ferie e permessi (maturati, fruiti, in attesa e residui) interrogando i Servizi NEXUM autorizzati.], [UC4], [RB-09, RB-10],
  [RF-014], [Obbligatorio], [Il sistema deve presentare i dati delle assenze specificando chiaramente l'intervallo temporale, l'unità di misura (giorni o ore) e la tipologia.], [UC4], [RB-10],
  [RF-015], [Obbligatorio], [Il sistema deve vietare la deduzione o il calcolo matematico arbitrario del saldo ferie da parte dell'LLM in assenza di dati applicativi certi.], [UC4], [RB-09],
  [RF-016], [Obbligatorio], [Il sistema deve notificare all'utente in modo non tecnico eventuali errori o indisponibilità persistenti nella comunicazione con i Servizi NEXUM per il recupero dati personali.], [UC4.1], [RB-14, VE-2.4],
  [RF-017], [Obbligatorio], [Il sistema deve consentire al Dipendente di visualizzare l'elenco e lo stato aggiornato delle proprie richieste di ferie e permessi presentate.], [UC5], [RB-13],
  [RF-018], [Obbligatorio], [Il sistema deve distinguere formalmente ed esclusivamente tra i tre stati delle richieste previsti da NEXUM: in attesa, approvata e rifiutata.], [UC5], [RB-13, VE-2.5],
  [RF-019], [Obbligatorio], [Il sistema deve consentire al Dipendente di avviare in linguaggio naturale la preparazione di una richiesta esclusivamente per le tipologie ferie o permesso (con campo note opzionale ed esclusione della malattia nell'MVP).], [UC6], [RB-11, VE-2.5],
  [RF-020], [Obbligatorio], [Il sistema deve raccogliere ed estrarre in modo strutturato i parametri della richiesta (tipologia, date complete di anno, eventuale fascia oraria per i permessi e note opzionali).], [UC6], [RB-11, VE-2.5],
  [RF-021], [Obbligatorio], [Il sistema deve presentare obbligatoriamente all'utente un riepilogo formale completo dei dati della richiesta prima di procedere all'invio.], [UC6.1], [RB-12],
  [RF-022], [Obbligatorio], [Il sistema deve richiedere una conferma esplicita all'utente per completare l'inoltro della richiesta verso i Servizi NEXUM.], [UC6.2], [RB-12],
  [RF-023], [Obbligatorio], [Il sistema deve consentire all'utente di modificare uno o più dati della richiesta durante la fase di preparazione prima dell'invio definitivo.], [UC6.3], [RB-12],
  [RF-024], [Obbligatorio], [In caso di modifica dei dati in preparazione, il sistema deve invalidare la conferma, generare un nuovo riepilogo e richiedere una nuova conferma esplicita.], [UC6.3], [RB-12],
  [RF-025], [Obbligatorio], [Il sistema deve demandare la validazione delle date e il controllo delle sovrapposizioni temporali ai Servizi NEXUM.], [UC6], [VE-1.4],
  [RF-026], [Obbligatorio], [Il sistema deve notificare all'utente in modo non tecnico il fallimento della registrazione qualora i Servizi NEXUM segnalino dati non validi, una sovrapposizione temporale o un'indisponibilità persistente.], [UC6.4], [RB-14, VE-1.4, VE-2.4],
  [RF-027], [Obbligatorio], [A seguito di conferma esplicita, il sistema deve registrare la richiesta presso i Servizi NEXUM nello stato "in attesa" e notificare l'esito al dipendente, senza prevedere modifica diretta o cancellazione post-invio dalla chat.], [UC6], [RB-13, VE-2.5],
  [RF-028], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di creare un nuovo Bucket di conoscenza specificando nome, descrizione e gruppi destinatari autorizzati nell'ambito della singola azienda.], [UC7], [RB-01, RB-05, VE-2.2],
  [RF-029], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di visualizzare l'elenco dei Bucket di conoscenza configurati con il relativo stato e numero di fonti.], [UC8], [RB-05],
  [RF-030], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di modificare i metadati di un Bucket esistente (nome, descrizione, gruppi destinatari autorizzati).], [UC9], [RB-05],
  [RF-031], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di ritirare un intero Bucket di conoscenza tramite archiviazione logica, escludendolo dalla consultazione attiva del Concierge.], [UC10], [RB-05, VE-2.2],
  [RF-032], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di caricare documenti informativi in formato PDF (sia testuali sia scansionati con supporto OCR) all'interno di uno specifico Bucket.], [UC11], [RB-05, VE-2.2],
  [RF-033], [Obbligatorio], [Il sistema deve scomporre i documenti caricati in unità di conoscenza (chunk) preservando metadati di provenienza, versione e data di caricamento.], [UC11], [RB-06],
  [RF-034], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di sostituire una fonte documentale esistente con una versione aggiornata.], [UC12], [RB-05],
  [RF-035], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di ritirare una singola fonte documentale mediante archiviazione logica, preservandone la storicizzazione ma escludendola dalla consultazione attiva.], [UC13], [RB-05, VE-2.2],
  [RF-036], [Obbligatorio], [Il sistema deve garantire che le fonti o i bucket ritirati siano immediatamente esclusi dal recupero sia per nuove conversazioni sia per il proseguimento di quelle correnti.], [UC10, UC12, UC13], [RB-05, RB-08, VE-2.2],
  [RF-037], [Obbligatorio], [Il sistema deve mostrare all'Amministratore HR lo stato di avanzamento dell'elaborazione delle fonti (in corso, indicizzato, errore di elaborazione).], [UC14], [RB-06, RB-14],
  [RF-038], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di consultare i log di tracciamento delle fonti citate e delle operazioni dispositive eseguite.], [UC15], [RB-15],
  [RF-039], [Desiderabile], [Il sistema dovrebbe consentire il caricamento di fonti documentali anche in formato Markdown (.md) o testo semplice (.txt) oltre ai PDF.], [UC11], [Capitolato C2, VE-2.2],
  [RF-040], [Desiderabile], [Il sistema dovrebbe consentire al Dipendente di filtrare la visualizzazione delle proprie richieste di assenza per anno solare o per stato della pratica.], [UC5], [AD],
  [RF-041], [Opzionale], [Il sistema potrebbe consentire all'Amministratore HR di scaricare il file originale associato a una fonte documentale precedentemente caricata.], [UC14.2], [AD],
  [RF-042], [Obbligatorio], [L'interfaccia utente deve rilevare e segnalare chiaramente al Dipendente eventuali errori di rete o disconnessioni lato client.], [UC1.3], [RB-14, VE-2.4],
  [RF-043], [Obbligatorio], [Il sistema deve consentire al Dipendente di avviare esplicitamente una nuova sessione di chat, chiudendo quella corrente e ripartendo da uno stato pulito.], [UC1.4], [RB-04, VE-2.3],
  [RF-044], [Obbligatorio], [In presenza di discrepanze tra versioni successive di uno stesso regolamento aziendale, il sistema deve considerare esclusivamente la versione più recente.], [UC2], [RB-08, VE-2.2],
  [RF-045], [Obbligatorio], [Il sistema deve notificare all'utente in modo non tecnico eventuali errori o indisponibilità persistenti dei Servizi NEXUM durante il recupero dello stato delle richieste.], [UC5.1], [RB-14, VE-2.4],
  [RF-046], [Obbligatorio], [Prima di inoltrare una richiesta di ferie o permesso, il sistema deve verificare il rispetto dei vincoli del regolamento aziendale attivo (es. preavviso minimo, soglie di saldo negativo) e, in caso di violazione, negare l'invio con un diniego motivato.], [UC6.5], [RB-08, VE-2.4, VE-2.5],
  [RF-047], [Obbligatorio], [Il sistema deve consentire al Dipendente di annullare la preparazione di una richiesta prima della conferma definitiva senza effettuare alcun invio ai Servizi NEXUM.], [UC6.6], [RB-12],
  [RF-048], [Obbligatorio], [In caso di errore transitorio di rete o fallimento nelle chiamate ai servizi esterni, il sistema deve eseguire un meccanismo di retry automatico con breve attesa (debounce) prima di segnalare l'errore all'utente.], [UC1.2, UC4.1, UC5.1, UC6.4], [RB-14, VE-2.4],
  [RF-049], [Opzionale], [Il sistema potrebbe consentire di specificare una categoria o sottotipo opzionale per le richieste di permesso (es. ROL, ex-festività) in vista di future estensioni.], [UC6], [AD],
  [RF-050], [Obbligatorio], [Il sistema deve validare i dati dei Bucket in fase di creazione e modifica, segnalando puntualmente i campi non validi senza applicare modifiche e mantenendo i dati già inseriti.], [UC7.1], [RB-14],
  [RF-051], [Obbligatorio], [Il sistema deve verificare la validità dei file selezionati in fase di caricamento o sostituzione (formato supportato, file non vuoto e leggibile), rifiutando quelli non validi con un messaggio esplicativo.], [UC11.1], [RB-14],
  [RF-052], [Obbligatorio], [Il sistema deve consentire all'Amministratore HR di visualizzare il dettaglio sintetico (causa comprensibile e data) relativo agli errori di elaborazione di una fonte.], [UC14.1], [RB-14],
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
  [RQ-003], [Opzionale], [In vista di future estensioni multi-azienda oltre il perimetro dell'MVP, il sistema potrebbe garantire la separazione logica dei dati e delle fonti tra aziende clienti differenti (isolamento multi-tenant).], [RB-01, VE-2.2, AD],
  [RQ-004], [Obbligatorio], [L'architettura del sistema deve essere modulare per consentire l'estensione verso nuovi domini operativi e fonti senza refactoring globale.], [RB-16],
  [RQ-005], [Obbligatorio], [Il sistema deve registrare nei log di audit l'identificativo utente, la data, l'abilità invocata e l'esito di ciascuna operazione dispositiva.], [RB-15],
  [RQ-006], [Obbligatorio], [Il sistema deve garantire che dettagli tecnici interni (quali codici di stato HTTP o payload JSON) non siano mai esposti all'utente finale nei messaggi della chat.], [RB-14, VE-2.4],
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
  [RV-002], [Obbligatorio], [Per la revisione RTB/PoC, il Concierge deve essere sviluppato come architettura autonoma e disaccoppiata, interfacciata con API reali o simulate di NEXUM.], [VE-1.1, VE-2.1],
  [RV-003], [Obbligatorio], [L'interfaccia utente per il personale deve essere fruibile tramite WebApp / Progressive Web App (PWA) compatibile con i principali browser desktop.], [Capitolato C2],
  [RV-004], [Obbligatorio], [Il backend applicativo del sistema deve essere sviluppato adottando la versione stabile più recente del framework Ruby on Rails.], [VE-1.3, VE §3.8],
  [RV-005], [Obbligatorio], [Il frontend dell'interfaccia utente deve essere sviluppato adottando il framework Angular v18.], [VE §3.8],
  [RV-006], [Obbligatorio], [L'integrazione con i modelli linguistici (LLM) deve avvenire tramite credenziali e API erogate su Amazon Web Services (AWS) Bedrock.], [VE-1.2, Capitolato C2],
  [RV-007], [Obbligatorio], [Il modello linguistico ospitato su AWS Bedrock non deve accedere direttamente al database; tutte le interrogazioni verso la base dati e i servizi esterni devono essere incapsulate e controllate tramite tool definiti in Ruby (`ruby_llm`).], [VE-2.1],
  [RV-008], [Obbligatorio], [Nel perimetro dell'MVP il sistema deve operare su una singola azienda, adottare un unico ruolo amministrativo (HR/Responsabile Fonti) e gestire la pipeline documentale internamente senza transitare attraverso le API di NEXUM.], [VE-2.1, VE-2.2],
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
  [RB-01], [Contesto persona autenticata e azienda di appartenenza], [RF-001, RF-028, RQ-003],
  [RB-02], [Discriminazione dell'intento dell'utente], [RF-001, RF-003, RF-007, RF-010],
  [RB-03], [Combinazione di capacità differenti nel dialogo], [RF-004],
  [RB-04], [Mantenimento del contesto e chiarimenti proattivi], [RF-002, RF-005, RF-043],
  [RB-05], [Caricamento, organizzazione, sostituzione e ritiro fonti da Backoffice], [RF-028, RF-029, RF-030, RF-031, RF-032, RF-034, RF-035, RF-036],
  [RB-06], [Trasformazione in unità di conoscenza (chunking, metadati, stato)], [RF-033, RF-037],
  [RB-07], [Distinzione della base di conoscenza dei manuali NEXUM], [RF-010, RF-011],
  [RB-08], [Citazione esplicita fonti e astensione formale per contrasto/carenza], [RF-007, RF-008, RF-009, RF-010, RF-012, RF-036, RF-044, RF-046],
  [RB-09], [Lettura dati personali solo via servizi autorizzati (nessun calcolo LLM)], [RF-013, RF-015],
  [RB-10], [Dati personali esposti con periodo, unità di misura e stati], [RF-013, RF-014],
  [RB-11], [Esecuzione operazioni tramite abilità definite e servizi applicativi], [RF-019, RF-020],
  [RB-12], [Riepilogo formale completo e conferma esplicita prima dell'invio], [RF-021, RF-022, RF-023, RF-024, RF-047],
  [RB-13], [Distinzione formale degli stati delle richieste], [RF-017, RF-018, RF-027],
  [RB-14], [Notifica trasparente di errori tecnici, validazioni fallite e indisponibilità], [RF-006, RF-016, RF-026, RF-037, RF-042, RF-045, RF-048, RF-050, RF-051, RF-052, RQ-006],
  [RB-15], [Tracciabilità completa delle fonti consultate e degli esiti operativi], [RF-038, RQ-005],
  [RB-16], [Architettura aperta ed estensibile verso nuove fonti e abilità], [RQ-004],
  [VE-1.1], [Disaccoppiamento architetturale PoC/MVP e API simulate NEXUM], [RV-002],
  [VE-1.2], [Credenziali AWS Bedrock e monitoraggio del vincolo di budget token], [RV-006, RP-001],
  [VE-1.3], [Adozione di PostgreSQL con estensione `pgvector` e Rails latest], [RV-001, RV-004],
  [VE-1.4], [Validazione e controlli sovrapposizione ferie delegati ai Servizi NEXUM], [RF-025, RF-026],
  [VE-1.5], [Sicurezza applicativa, anti-Prompt Injection e protezione dati sensibili (PII)], [RQ-001, RQ-002],
  [VE §3.8], [Standard tecnologici concordati: Angular v18 e Ruby on Rails], [RV-004, RV-005],
  [VE-2.1], [Disaccoppiamento DB/Bedrock, tool controllati in Ruby (`ruby_llm`) e gestione documentale interna], [RV-002, RV-007, RV-008],
  [VE-2.2], [PDF + OCR, archiviazione logica fonti, prevalenza ultima versione, ruolo HR unico e singola azienda], [RF-009, RF-028, RF-031, RF-032, RF-035, RF-036, RF-039, RF-044, RQ-003, RV-008],
  [VE-2.3], [Persistenza conversazione nella singola sessione e avvio nuova sessione stateless], [RF-002, RF-043],
  [VE-2.4], [Retry automatico con debounce (senza Idempotency-Key) e classificazione errori a 3 livelli], [RF-006, RF-016, RF-026, RF-042, RF-045, RF-046, RF-048, RQ-006],
  [VE-2.5], [Solo ferie/permessi con note opzionali (no malattia), 3 stati, no modifica/cancellazione post-invio, vincoli PDF controllati dall'agente], [RF-018, RF-019, RF-020, RF-027, RF-046],
  [Capitolato C2], [Fruibilità come PWA desktop e gestione asincrona elaborazioni], [RF-039, RV-003, RV-006, RP-002],
  [Analisi Dominio (AD)], [Usabilità, filtri avanzati, tempi di risposta, sicurezza d'uso ed estensioni opzionali], [RF-040, RF-041, RF-049, RQ-001, RQ-002, RQ-003, RP-002, RP-003],
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
  [UC1.2], [RF-006, RF-048],
  [UC1.3], [RF-042],
  [UC1.4], [RF-043],
  [UC2], [RF-007, RF-008, RF-044],
  [UC2.1], [RF-009],
  [UC3], [RF-008, RF-010, RF-011],
  [UC3.1], [RF-012],
  [UC4], [RF-013, RF-014, RF-015],
  [UC4.1], [RF-016, RF-048],
  [UC5], [RF-017, RF-018, RF-040],
  [UC5.1], [RF-045, RF-048],
  [UC6], [RF-019, RF-020, RF-025, RF-027, RF-049],
  [UC6.1], [RF-021],
  [UC6.2], [RF-022],
  [UC6.3], [RF-023, RF-024],
  [UC6.4], [RF-026, RF-048],
  [UC6.5], [RF-046],
  [UC6.6], [RF-047],
  [UC7], [RF-028],
  [UC7.1], [RF-050],
  [UC8], [RF-029],
  [UC9], [RF-030],
  [UC10], [RF-031, RF-036],
  [UC11], [RF-032, RF-033, RF-039],
  [UC11.1], [RF-051],
  [UC12], [RF-034, RF-036],
  [UC13], [RF-035, RF-036],
  [UC14], [RF-037],
  [UC14.1], [RF-052],
  [UC14.2], [RF-041],
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

  [RB-01], [Operare nel contesto della persona autenticata nell'ambito aziendale.], [F], [O], [Dipendente], [UC1, UC4, UC5, UC6],
  [RB-02], [Riconoscere e distinguere richieste su regole aziendali, istruzioni di prodotto, dati personali e operazioni.], [F], [O], [Dipendente, Provider LLM], [UC1, UC2, UC3, UC4, UC6],
  [RB-03], [Combinare capacità informative e operative differenti all'interno della medesima conversazione.], [F], [O], [Dipendente], [UC1],
  [RB-04], [Mantenere il contesto del dialogo e richiedere chiarimenti in caso di informazioni ambigue (es. date senza anno).], [F], [O], [Dipendente, Provider LLM], [UC1, UC1.1, UC1.4, UC6],
  [RB-05], [Caricamento, organizzazione in bucket, sostituzione e ritiro delle fonti aziendali da Backoffice.], [F], [O], [Amministratore HR], [UC7, UC8, UC9, UC10, UC11, UC12, UC13],
  [RB-06], [Trasformazione delle fonti in unità di conoscenza consultabili preservando provenienza, contesto e versione.], [F], [O], [Amministratore HR], [UC11, UC12, UC14],
  [RB-07], [Gestione dei manuali NEXUM come fonte distinta dai regolamenti aziendali interni.], [F], [O], [Dipendente, Provider LLM], [UC3],
  [RB-08], [Risposte documentali con citazione delle fonti; astensione formale se fonti insufficienti o in contrasto.], [F], [O], [Dipendente, Provider LLM], [UC2, UC2.1, UC3, UC3.1, UC6.5],
  [RB-09], [Recupero dei dati personali solo tramite servizi applicativi autorizzati (nessun dato inventato dall'LLM).], [F], [O], [Dipendente, Servizi NEXUM], [UC4, UC5],
  [RB-10], [Dati personali esposti con periodo esplicito, unità di misura e significato degli stati considerati.], [F], [O], [Dipendente, Servizi NEXUM], [UC4],
  [RB-11], [Esecuzione delle operazioni tramite abilità definite e invocazione di servizi applicativi autorizzati.], [F], [O], [Dipendente, Servizi NEXUM], [UC6],
  [RB-12], [Mostrare riepilogo formale completo e richiedere conferma esplicita prima dell'invio; nuovo riepilogo se i dati variano.], [F], [O], [Dipendente], [UC6, UC6.1, UC6.2, UC6.3, UC6.6],
  [RB-13], [Distinguere formalmente gli stati della richiesta di ferie/permesso (in attesa, approvata, rifiutata).], [F], [O], [Dipendente, Servizi NEXUM], [UC5, UC6],
  [RB-14], [Comunicazione chiara all'utente di errori tecnici, validazioni fallite, disconnessioni o indisponibilità dei servizi.], [F], [O], [Dipendente, Amministratore HR], [UC1.2, UC1.3, UC4.1, UC5.1, UC6.4, UC7.1, UC11.1, UC14, UC14.1],
  [RB-15], [Tracciabilità completa delle fonti consultate e degli esiti delle operazioni effettuate.], [Q], [O], [Amministratore HR], [UC15],
  [RB-16], [Architettura modulare ed estensibile per l'aggiunta di nuove fonti e abilità senza riprogettazione.], [Q], [O], [— (Vincolo architetturale)], [Requisiti di sistema],
  [VE-1.1], [Disaccoppiamento architetturale iniziale: Concierge autonomo interfacciato tramite simulatori/API NEXUM.], [V], [O], [Servizi NEXUM], [Requisiti di vincolo],
  [VE-1.2], [Accesso ad AWS Bedrock con monitoraggio del consumo di token e rispetto del budget prefissato.], [P], [O], [Provider LLM], [Requisiti prestazionali],
  [VE-1.3], [Adozione di PostgreSQL con estensione `pgvector` per la base di conoscenza vettoriale.], [V], [O], [— (Vincolo tecnologico)], [Requisiti di vincolo],
  [VE-1.4], [Controlli di validità e sovrapposizione ferie delegati deterministicamente ai Servizi NEXUM e non all'LLM.], [F], [O], [Servizi NEXUM], [UC6, UC6.4],
  [VE-1.5], [Prevenzione da Prompt Injection, filtri di sicurezza per input/output e tutela dei dati sensibili (PII).], [Q], [O], [— (Qualità di sicurezza)], [Requisiti di qualità],
  [VE-2.1], [Disaccoppiamento DB/Bedrock, tool controllati in Ruby (`ruby_llm`) e gestione documentale interna.], [V], [O], [Provider LLM, Servizi NEXUM], [Requisiti di vincolo],
  [VE-2.2], [PDF + OCR, archiviazione logica fonti, prevalenza ultima versione, ruolo HR unico e singola azienda.], [F/V], [O], [Dipendente, Amministratore HR], [UC2, UC2.1, UC7, UC10, UC11, UC12, UC13],
  [VE-2.3], [Persistenza conversazione nella singola sessione al reload/cambio pagina e nuova sessione stateless.], [F], [O], [Dipendente], [UC1, UC1.4],
  [VE-2.4], [Retry con debounce (senza Idempotency-Key), errori a 3 livelli e divieto esposizione codici HTTP/JSON.], [F/Q], [O], [Dipendente, Provider LLM, Servizi NEXUM], [UC1.2, UC1.3, UC4.1, UC5.1, UC6.1, UC6.2, UC6.4, UC6.5],
  [VE-2.5], [Perimetro MVP solo ferie/permessi con note opzionali, 3 stati, no modifica/cancellazione post-invio, vincoli PDF verificati dall'agente.], [F], [O], [Dipendente, Servizi NEXUM], [UC5, UC6, UC6.5],
  [AD], [Funzionalità aggiuntive e usabilità: filtri avanzati richieste, download file originale e sottotipi opzionali.], [F], [D/Op], [Dipendente, Amministratore HR], [UC5, UC6, UC14.2],
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
  [Funzionali (RF)], [48], [2], [2], [52],
  [Qualità (RQ)], [5], [0], [1], [6],
  [Vincolo (RV)], [8], [0], [0], [8],
  [Prestazionali (RP)], [2], [1], [0], [3],
  [*Totale Complessivo*], [*63*], [*3*], [*3*], [*69*],
)

#v(0.5cm)
#align(center)[
#table(
  columns: (4.0cm, 3.0cm, 3.0cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Importanza*], [*Numero Requisiti*], [*Percentuale*],
  [Obbligatori (O)], [63], [91.30%],
  [Desiderabili (D)], [3], [4.35%],
  [Opzionali (Op)], [3], [4.35%],
  [*Totale*], [*69*], [*100.00%*],
)
]
