#set document(
  title: "Valutazione dei capitolati — RickandCommit",
  author: "RickandCommit",
)


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
      [#text(size: 9pt)[Valutazione dei capitolati]],
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
#show heading.where(level: 3): it => block(above: 1.3em, below: 0.7em)[
  #text(size: 12pt, weight: "bold")[#it]
]


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
  #text(size: 26pt, weight: "bold")[Valutazione dei capitolati]
  #v(0.25cm)
  #text(size: 10pt, style: "italic")[Versione v0.1.0 · Ultima modifica: 2026-10-25]
]

#v(0.5cm)

// ==================== INFORMAZIONI GENERALI ====================
#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 7pt,
  [*Data creazione*], [2026-10-23],
  [*Stato*], [In redazione],
  [*Destinatari*], [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
)

#v(0.4cm)

// ==================== REGISTRO DELLE MODIFICHE ====================
= Registro delle modifiche


#text(size: 10pt)[
#table(
  columns: (1.9cm, 2.0cm, 2.0cm, 2.5cm, 2.5cm, 1fr),
  align: (
    center + horizon,
    center + horizon,
    center + horizon,
    center + horizon,
    center + horizon,
    left + horizon,
  ),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },

  table.cell(align: center + horizon)[*Versione*],
  table.cell(align: center + horizon)[*Data*],
  table.cell(align: center + horizon)[*Autore*],
  table.cell(align: center + horizon)[*Verificatore*],
  table.cell(align: center + horizon)[*Approvatore*],
  table.cell(align: center + horizon)[*Descrizione*],

  [0.1.0],
  [2026-10-23],
  [Luka Lacic],
  [Alessandro Rasia dal Polo],
  [Dorde \ Blagojevic],
  [Prima stesura del documento],
)
]

#pagebreak()
#outline(title: "Indice")
#pagebreak()

= Introduzione


== Finalità del documento

Il presente documento raccoglie l'analisi dei capitolati d'appalto effettuata dal gruppo RickandCommit nell'ambito di Ingegneria del Software.
L'obiettivo è individuare la proposta più adatta agli interessi, alla possibilità di acquisire nuove competenze e alle possibilità organizzative del gruppo.
La valutazione prende in esame diversi elementi tecnici e progettuali, in modo da confrontare le alternative con criteri condivisi.
Per ogni capitolato vengono illustrati lo scopo del progetto e le principali considerazioni che ne evidenziano le opportunità e le difficoltà. Tali elementi costituiranno il riferimento per motivare la scelta conclusiva del gruppo.


= Fattori considerati nella selezione del progetto

Per esaminare le proposte in modo omogeneo, il gruppo ha individuato sette fattori di valutazione, applicabili a ciascun capitolato:

#v(0.45em)

- *Complessità tecnica:* considera l'impegno necessario per sviluppare il prodotto, dalla definizione dell'architettura all'integrazione dei componenti. Una sfida tecnica può essere formativa, ma deve rimanere sostenibile rispetto al tempo disponibile e ai requisiti obbligatori.

- *Tecnologie interessate:* prende in esame linguaggi, framework, strumenti e servizi previsti dal progetto, distinguendo quelli richiesti da quelli suggeriti. La loro scelta può incidere sulle attività iniziali e sull'organizzazione del lavoro.

- *Opportunità di apprendimento:* riguarda la possibilità di approfondire conoscenze già acquisite e sviluppare nuove competenze. Sono considerate interessanti le esperienze che permettono di utilizzare strumenti e metodologie diffusi nello sviluppo software.

- *Chiarezza progettuale:* valuta quanto siano comprensibili e ben definiti gli obiettivi, i requisiti e i risultati attesi. Indicazioni precise aiutano a stimare le attività e a ripartirle tra i componenti del gruppo.

- *Supporto del proponente:* considera la disponibilità di referenti tecnici, incontri di confronto e materiali utili allo sviluppo. Un'assistenza adeguata facilita la risoluzione dei dubbi e riduce i rischi legati a problemi non previsti.

- *Criticità e fattori di rischio:* individua gli elementi che potrebbero rallentare o compromettere il progetto, come requisiti poco circoscritti, dipendenze da servizi esterni o difficoltà nel reperire le risorse necessarie. Tali aspetti vengono distinti dalla difficoltà tecnica.

- *Interesse del gruppo:* esprime il grado di motivazione condiviso verso il tema e gli obiettivi del progetto. Siccome un interesse comune può favorire la collaborazione e la continuità dell'impegno durante lo sviluppo, questo fattore assume una importanza significativa.

#v(0.55em)

I fattori saranno considerati nel loro insieme, con pari attenzione, per individuare la proposta più coerente con le caratteristiche del gruppo.

#pagebreak()

= Valutazione del capitolato selezionato

== C7 – SmartDashboard: piattaforma di Business Intelligence self-service potenziata da AI

*Proponente:* Ergon Informatica S.r.l.

=== Obiettivo

Il progetto prevede la realizzazione di SmartDashboard, una piattaforma di Business Intelligence che permetta agli utenti aziendali di analizzare autonomamente i dati provenienti dai propri sistemi gestionali. Le informazioni dovranno essere raccolte, trasformate e organizzate in un archivio ottimizzato per l'analisi, per poi essere visualizzate attraverso un'applicazione web. Gli utenti potranno creare dashboard personalizzate tramite un'interfaccia drag & drop, utilizzando grafici, tabelle e indicatori, e applicare filtri per esplorare i dati. La piattaforma dovrà inoltre integrare un assistente basato sull'intelligenza artificiale, capace di generare visualizzazioni a partire da richieste in linguaggio naturale.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, poiché richiede lo sviluppo di componenti differenti e la loro integrazione. È necessario gestire il recupero e la trasformazione dei dati, realizzare un archivio adatto all'analisi e sviluppare un'applicazione web con dashboard interattive. A queste attività si aggiunge l'integrazione dell'intelligenza artificiale. Il proponente suggerisce tuttavia un approccio graduale, che permetta di completare prima la piattaforma di Business Intelligence e successivamente introdurre le funzionalità AI.

*Tecnologie interessate:* Ergon lascia al gruppo libertà nella scelta delle tecnologie, proponendo alcune soluzioni di riferimento. Per il data warehouse viene consigliato DuckDB, mentre per la raccolta dei dati sono suggeriti database relazionali come PostgreSQL e strumenti Python per la loro trasformazione, come Polars. Per il frontend vengono indicati React, Angular o Vue, mentre per l'intelligenza artificiale si suggerisce l'integrazione con modelli linguistici accessibili tramite API, come GPT o Claude. L'architettura proposta costituisce un riferimento e non un vincolo.

*Opportunità di apprendimento:* Il progetto offre numerose possibilità di acquisire nuove competenze, combinando lo sviluppo di applicazioni web con la gestione e l'analisi dei dati. In particolare, permette di approfondire il funzionamento dei data warehouse, i processi di trasformazione dei dati e la realizzazione di dashboard interattive. L'integrazione dell'intelligenza artificiale rappresenta inoltre un'occasione per conoscere le modalità con cui i modelli linguistici possono essere utilizzati all'interno di applicazioni software.

*Chiarezza progettuale:* Il capitolato descrive in modo dettagliato gli obiettivi, le funzionalità principali e l'architettura di riferimento. Sono inoltre presenti esempi grafici delle interfacce e indicazioni sulle tecnologie utilizzabili. Il proponente riconosce l'ampiezza del progetto e suggerisce di suddividere i requisiti in obbligatori, desiderabili e facoltativi, lasciando al gruppo il compito di stabilire le priorità durante l'analisi.

*Supporto del proponente:* Ergon prevede incontri di allineamento ogni quindici giorni per verificare l'avanzamento del progetto, discutere le difficoltà e riesaminare le priorità. Il referente aziendale rimane inoltre disponibile per ulteriori chiarimenti e incontri. Su richiesta del gruppo, l'azienda può anche fornire dati di un caso di studio reale da utilizzare durante lo sviluppo e i test.

*Criticità e fattori di rischio:* La principale difficoltà riguarda l'ampiezza del progetto, che comprende sia la gestione completa dei dati sia lo sviluppo delle funzionalità di intelligenza artificiale. Un ulteriore aspetto critico è garantire che l'assistente interpreti correttamente le richieste degli utenti e produca risultati coerenti con i dati disponibili, evitando errori nelle analisi. Sarà inoltre necessario prestare attenzione ai tempi di risposta e alla protezione delle informazioni.

*Interesse del gruppo:* Il capitolato ha suscitato un particolare interesse nel gruppo per l'obiettivo di realizzare una piattaforma che renda l'analisi dei dati più semplice e accessibile attraverso l'intelligenza artificiale. Un ulteriore elemento determinante è rappresentato dalla possibilità di conoscere e utilizzare tecnologie nuove, approfondendo diversi ambiti dello sviluppo software. Pur considerando la complessità del progetto, la varietà delle competenze acquisibili e la possibilità di procedere per fasi hanno contribuito a rendere SmartDashboard la proposta scelta da RickandCommit.


= Valutazione degli altri capitolati

== C0 – AIRA: AI Requests Automation

*Proponente:* Sanmarco Informatica S.p.A.

=== Obiettivo

Il progetto prevede la realizzazione di un sistema che automatizzi la gestione delle richieste aziendali provenienti da diversi canali, come e-mail, messaggi, immagini e registrazioni vocali. Attraverso l'intelligenza artificiale, il sistema dovrà interpretare le richieste, estrarre le informazioni rilevanti e convertirle in dati strutturati. Questi verranno poi utilizzati per eseguire operazioni automatiche tramite API REST verso piattaforme gestionali, come ERP, CRM e portali B2B. È inoltre richiesta un'interfaccia amministrativa per la configurazione dei canali e la consultazione dei dati e dei log.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, dovuta alla necessità di integrare l'acquisizione da più canali, l'elaborazione di contenuti diversi, l'interpretazione tramite intelligenza artificiale e la comunicazione con sistemi esterni. Sono inoltre richieste funzionalità per la gestione dei dati e il controllo degli accessi.

*Tecnologie interessate:* Il proponente consiglia Java con Spring Boot per il backend, Angular e TypeScript per l'interfaccia amministrativa e LangChain4j per l'utilizzo dei modelli linguistici. Vengono inoltre suggeriti database relazionali e strumenti come Whisper e Tesseract per l'elaborazione di audio e immagini.

*Opportunità di apprendimento:* Il progetto permette di approfondire l'utilizzo dell'intelligenza artificiale, l'elaborazione di informazioni provenienti da formati differenti e l'integrazione di applicazioni attraverso API REST.

*Chiarezza progettuale:* Il capitolato descrive gli obiettivi e presenta un'architettura di riferimento, distinguendo le funzionalità richieste da quelle opzionali. Non viene tuttavia precisato il numero minimo di canali e integrazioni da realizzare.

*Supporto del proponente:* Sanmarco Informatica prevede l'affiancamento di figure professionali dedicate, offrendo assistenza tecnica e supporto nella configurazione degli ambienti. È inoltre prevista una collaborazione basata sulla metodologia Agile, senza indicazioni precise sulla frequenza degli incontri.

*Criticità e fattori di rischio:* Le principali difficoltà riguardano la gestione di dati provenienti da fonti differenti, la loro corretta interpretazione e la protezione delle informazioni. La presenza di numerose funzionalità richieste potrebbe inoltre rendere impegnativa la realizzazione del progetto nei tempi disponibili.

*Interesse del gruppo:* Il capitolato affronta un problema concreto e offre diverse opportunità formative. Tuttavia, l'ampiezza delle funzionalità e delle integrazioni previste rappresenta un elemento di difficoltà nella valutazione della sua fattibilità. Il gruppo non ha selezionato questa proposta.


== C1 – AURA: AI for Understanding, Reasoning and Automation

*Proponente:* Vimar S.p.A.

=== Obiettivo

Il progetto prevede la realizzazione di un sistema che permetta di controllare gli impianti domotici Vimar attraverso servizi esterni di intelligenza artificiale, come ChatGPT, Claude o Gemini. L'obiettivo è consentire agli utenti di interrogare e gestire i dispositivi della propria abitazione tramite linguaggio naturale, ad esempio per controllare l'illuminazione, regolare la temperatura o consultare lo stato dei sensori. La soluzione richiede lo sviluppo di un'infrastruttura Cloud-ready e di un server e client MCP, che permettano la comunicazione tra i servizi AI e gli impianti Vimar attraverso le API KNX IoT.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, dovuta alla necessità di integrare un'infrastruttura Cloud-ready, un server e client MCP e un servizio di intelligenza artificiale esterno. Sono inoltre richiesti meccanismi di autenticazione e la gestione delle operazioni di lettura e scrittura sui dispositivi domotici.

*Tecnologie interessate:* Il capitolato richiede l'utilizzo di Docker con docker-compose, dello standard MCP, delle API KNX IoT e di OAuth2 per l'autenticazione. Per lo sviluppo del server e client MCP vengono suggeriti Python con FastMCP oppure, in alternativa, TypeScript o Java. L'infrastruttura deve essere compatibile con AWS, mentre il rilascio effettivo sul Cloud è opzionale.

*Opportunità di apprendimento:* Il progetto permette di approfondire l'integrazione tra intelligenza artificiale e dispositivi IoT, lo sviluppo di servizi Cloud e l'utilizzo di API e protocolli standard. Offre inoltre la possibilità di lavorare con dispositivi domotici reali.

*Chiarezza progettuale:* La documentazione è dettagliata e ben organizzata, con una distinzione chiara tra requisiti obbligatori, opzionali e nice-to-have. Sono inoltre descritti numerosi esempi di interazione con l'assistente AI, i prodotti da consegnare e i criteri di completamento.

*Supporto del proponente:* Vimar mette a disposizione un kit fisico di dispositivi domotici, l'accesso alle API e la relativa documentazione. Sono previsti incontri periodici per verificare l'avanzamento del progetto, almeno due incontri in presenza e la possibilità di richiedere approfondimenti tecnici.

*Criticità e fattori di rischio:* L'implementazione delle numerose funzionalità richieste dalle API KNX IoT e la loro integrazione con un servizio AI esterno potrebbero richiedere un impegno considerevole. Il capitolato prevede inoltre una copertura minima dei test del 75% per unità e integrazione e dell'80% per i test End-to-End.

*Interesse del gruppo:* Il progetto offre opportunità formative interessanti, soprattutto nell'ambito dell'intelligenza artificiale e della domotica. Tuttavia, considerando l'ampiezza dei requisiti e l'impegno necessario per soddisfarli, il gruppo ha preferito orientarsi verso altri capitolati.


== C2 – NEXUM Concierge

*Proponente:* Eggon S.r.l.

=== Obiettivo

Il progetto prevede la realizzazione di un assistente conversazionale integrato nella piattaforma NEXUM, dedicata alla comunicazione e alla gestione dei servizi aziendali. Attraverso una chat, il personale potrà consultare regolamenti, ricevere istruzioni sull'utilizzo della piattaforma, accedere ai propri dati ed effettuare operazioni tramite linguaggio naturale. Il prodotto minimo richiesto si concentra sulla gestione di ferie e permessi e comprende un'interfaccia conversazionale, un sistema per la consultazione dei documenti aziendali e le funzionalità necessarie per leggere i dati personali e registrare richieste.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, poiché richiede di integrare diverse funzionalità in un unico sistema. Oltre alla chat e alla gestione del contesto delle conversazioni, sono necessari un sistema di consultazione dei documenti, un'interfaccia amministrativa e il collegamento ai servizi per la lettura e la registrazione delle richieste.

*Tecnologie interessate:* La piattaforma NEXUM utilizza Angular per le interfacce, Ruby on Rails per il backend e tecnologie come PostgreSQL e Redis per la gestione dei dati. Per il Concierge, invece, la scelta dello stack tecnologico, dei modelli linguistici e dei servizi AI sarà concordata con il proponente durante la fase iniziale.

*Opportunità di apprendimento:* Il progetto offre la possibilità di approfondire l'utilizzo dei modelli linguistici, la gestione della conoscenza aziendale e l'integrazione dell'intelligenza artificiale con servizi applicativi. Permette inoltre di lavorare su un prodotto destinato a rispondere a esigenze aziendali concrete.

*Chiarezza progettuale:* Il capitolato è dettagliato e definisce chiaramente il perimetro dell'MVP, limitandolo all'area ferie e permessi. Sono inoltre descritti i requisiti, le fasi di sviluppo e i criteri di accettazione. Alcuni aspetti tecnici, come le interfacce di integrazione e le soglie di prestazione, devono invece essere definiti insieme al proponente.

*Supporto del proponente:* Eggon prevede incontri settimanali o bisettimanali da concordare con il gruppo, oltre a un canale Telegram per le comunicazioni rapide. L'azienda si impegna inoltre a fornire documentazione, dati di prova e API documentate o simulatori necessari allo sviluppo.

*Criticità e fattori di rischio:* Le principali difficoltà riguardano la correttezza delle risposte generate, la gestione delle autorizzazioni e l'affidabilità delle operazioni sui dati personali. Un ulteriore elemento da considerare è la dipendenza dalle interfacce di integrazione, che dovranno essere concordate con Eggon durante il progetto.

*Interesse del gruppo:* Il capitolato ha suscitato un elevato interesse nel gruppo, soprattutto per l'applicazione dell'intelligenza artificiale a un servizio aziendale concreto. La proposta è stata infatti inserita tra le tre alternative finali maggiormente considerate. Tuttavia, a seguito del confronto conclusivo, il gruppo ha deciso di orientarsi verso un altro capitolato (C7 - SmartDashboard).


== C3 – FossDot

*Proponente:* Uranion EMEA Ltd.

=== Obiettivo

Il progetto prevede la realizzazione di uno smart speaker open source, progettato per offrire maggiore controllo sui dati personali e libertà nella scelta del servizio di intelligenza artificiale. Il dispositivo dovrà acquisire i comandi vocali dell'utente, inviarli a un server che li elabori attraverso un modello AI configurabile e riprodurre la risposta generata. L'MVP comprende la selezione e la validazione dell'hardware, lo sviluppo del firmware, un servizio di elaborazione vocale e un'interfaccia per registrare e configurare il dispositivo. La soluzione dovrà essere dimostrata attraverso un prototipo fisico funzionante.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità elevata, poiché richiede lo sviluppo e l'integrazione di componenti hardware e software. Oltre alla realizzazione del firmware, sono necessari un server per l'elaborazione delle richieste vocali e un'interfaccia di gestione. Il corretto funzionamento dovrà inoltre essere verificato su un dispositivo fisico.

*Tecnologie interessate:* Il proponente lascia libertà nella scelta delle tecnologie, suggerendo strumenti come Raspberry Pi, openWakeWord, Whisper e Piper per la gestione del dispositivo e dell'audio. L'utilizzo di Rust per il firmware è preferenziale, ma non obbligatorio. Il progetto deve invece essere pubblicato come open source con licenza permissiva, come MIT o Apache 2.0.

*Opportunità di apprendimento:* Il progetto offre la possibilità di approfondire lo sviluppo di sistemi embedded, l'elaborazione audio e l'integrazione con modelli di intelligenza artificiale. Permette inoltre di acquisire esperienza nella realizzazione di un prodotto che combina componenti fisici e servizi software.

*Chiarezza progettuale:* Il capitolato descrive le componenti principali e distingue chiaramente le funzionalità minime da quelle previste per il prodotto completo. Sono inoltre indicati i criteri di completamento, mentre la scelta delle tecnologie e dell'hardware viene lasciata al gruppo.

*Supporto del proponente:* Uranion prevede incontri di avanzamento, formazione e approfondimento tecnico con i propri esperti. Le comunicazioni avverranno principalmente da remoto. Nella presentazione viene inoltre indicata la fornitura dei componenti hardware necessari, mentre il montaggio e la documentazione della configurazione scelta rimangono a carico del gruppo.

*Criticità e fattori di rischio:* Le principali difficoltà riguardano l'integrazione tra hardware, firmware e servizi di elaborazione vocale. È inoltre necessario considerare la gestione dei dati audio personali, per i quali il capitolato richiama l'attenzione al rispetto del GDPR. La verifica dell'intero sistema su un dispositivo fisico rappresenta un ulteriore impegno progettuale.

*Interesse del gruppo:* La proposta presenta aspetti interessanti, in particolare per la realizzazione di un prodotto open source che combina intelligenza artificiale e componenti hardware. Tuttavia, l'ampiezza delle attività necessarie e la presenza di sviluppo embedded rappresentano elementi impegnativi. Il gruppo ha preferito orientarsi verso altre proposte.


== C4 – Piattaforma per la gestione dei veicoli e dei servizi post-vendita

*Proponente:* M31 S.r.l.

=== Obiettivo

Il progetto prevede la realizzazione di una piattaforma software distribuita per la gestione delle informazioni relative ai veicoli e ai servizi post-vendita. Il sistema dovrà facilitare la collaborazione tra case automobilistiche, concessionarie, centri di assistenza e proprietari dei veicoli. Le funzionalità principali comprendono la registrazione dei veicoli, la gestione delle vendite, delle manutenzioni e degli appuntamenti, oltre alle campagne di richiamo e alle relative notifiche. Sono inoltre previsti accessi differenziati in base al ruolo degli utenti.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, dovuta alla realizzazione di una piattaforma distribuita che deve gestire diversi tipi di utenti e funzionalità. È necessario coordinare le operazioni tra i vari soggetti coinvolti, garantendo un accesso sicuro e una gestione coerente delle informazioni.

*Tecnologie interessate:* Il proponente indica come riferimenti tecnologie quali Node.js, NestJS, TypeScript, Angular, PostgreSQL e Redis, oltre a Go, NATS, Kubernetes e MongoDB. Viene inoltre menzionata un'architettura a microservizi, senza specificare quali tecnologie siano obbligatorie.

*Opportunità di apprendimento:* Il progetto offre la possibilità di approfondire lo sviluppo di applicazioni distribuite, la gestione dei dati e la comunicazione tra componenti software. Permette inoltre di acquisire esperienza nella progettazione di sistemi con diversi ruoli e funzionalità.

*Chiarezza progettuale:* La documentazione presenta gli obiettivi, le funzionalità principali e un'architettura suddivisa in tre livelli. Sono inoltre indicate le fasi di realizzazione, ma non vengono precisati tutti i requisiti del prodotto minimo, i cui flussi principali dovranno essere concordati con il proponente.

*Supporto del proponente:* M31 evidenzia opportunità di formazione, collaborazione interdisciplinare e crescita professionale. La documentazione non specifica tuttavia le modalità di assistenza tecnica o la frequenza degli incontri durante lo sviluppo.

*Criticità e fattori di rischio:* L'ampiezza delle funzionalità e la presenza di diversi soggetti coinvolti potrebbero rendere impegnativa la definizione e la realizzazione del prodotto minimo. La necessità di concordare i principali flussi dell'MVP rappresenta inoltre un aspetto da chiarire per pianificare correttamente il lavoro.

*Interesse del gruppo:* Il capitolato affronta un problema concreto e offre opportunità formative nell'ambito dei sistemi distribuiti. Tuttavia, il gruppo ha infine deciso di orientarsi verso un'altra proposta (C7 - SmartDashboard).


== C5 – RareCare Navigator

*Proponente:* Miriade S.r.l.

=== Obiettivo

Il progetto prevede la realizzazione di una piattaforma digitale per supportare le famiglie e i professionisti coinvolti nella gestione delle malattie rare, concentrandosi inizialmente sulla Sindrome di Sanfilippo. L'obiettivo è facilitare il coordinamento tra familiari, medici, terapisti e strutture scolastiche attraverso un sistema condiviso. Le funzionalità principali comprendono un assistente virtuale basato sull'intelligenza artificiale, la gestione di scadenze e promemoria, il controllo degli accessi e la condivisione sicura della documentazione sanitaria. La piattaforma dovrà inoltre essere progettata per poter essere estesa ad altre patologie.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, dovuta all'integrazione di diverse funzionalità e alla necessità di gestire informazioni sanitarie riservate. Particolare attenzione deve essere dedicata alla sicurezza degli accessi, alla gestione dei documenti e all'affidabilità delle risposte fornite dall'assistente AI.

*Tecnologie interessate:* Il proponente raccomanda Flutter o React Native per lo sviluppo dell'interfaccia e propone l'utilizzo di servizi AI come Amazon Bedrock, OpenAI o modelli open source. Viene inoltre suggerita un'architettura cloud serverless, senza imporre una soluzione specifica. Sono invece richiesti meccanismi di autenticazione sicura, protezione dei dati e conformità al GDPR.

*Opportunità di apprendimento:* Il progetto offre la possibilità di approfondire l'intelligenza artificiale applicata alla consultazione di documenti, lo sviluppo di applicazioni multipiattaforma e la sicurezza dei dati. Permette inoltre di lavorare su una soluzione con un concreto valore sociale.

*Chiarezza progettuale:* Il capitolato distingue le funzionalità obbligatorie da quelle opzionali e presenta un'architettura di riferimento dettagliata. L'allegato tecnico fornisce ulteriori indicazioni, specificando che si tratta di suggerimenti e che il perimetro del progetto può essere concordato con il proponente.

*Supporto del proponente:* Miriade offre affiancamento tecnico sullo sviluppo software, sull'intelligenza artificiale e sulla progettazione delle interfacce. È inoltre prevista una formazione iniziale sulle malattie rare e sulla gestione dei dati sanitari, con la possibilità di confrontarsi con referenti specializzati.

*Criticità e fattori di rischio:* Le principali difficoltà riguardano la protezione dei dati sanitari, la gestione delle autorizzazioni e la necessità di fornire risposte AI basate su informazioni verificate. Anche la definizione di un perimetro di sviluppo sostenibile rappresenta un aspetto importante, considerando le numerose funzionalità previste.

*Interesse del gruppo:* Il progetto presenta una finalità sociale significativa e offre interessanti opportunità formative. Tuttavia, la delicatezza delle informazioni trattate e le responsabilità legate alla sicurezza e all'affidabilità del sistema ne aumentano l'impegno progettuale. Il capitolato non è rientrato tra le proposte approfondite dal gruppo per la scelta finale.


== C6 – Sistema IA di Caching Semantico e Dashboard FinOps

*Proponente:* Var Group

=== Obiettivo

Il progetto prevede l'estensione di LiteLLM, un sistema open source utilizzato per gestire le richieste verso diversi modelli di intelligenza artificiale. L'obiettivo è sviluppare due componenti: un sistema di caching semantico, capace di riconoscere domande con significato simile e riutilizzare risposte già disponibili, e una dashboard FinOps per monitorare i costi dei servizi AI. Quest'ultima dovrà permettere di analizzare i consumi per utente, team e progetto, gestire budget e avvisi e prevedere le spese mensili.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, legata all'integrazione dei nuovi componenti con LiteLLM. Il sistema di caching deve confrontare il significato delle richieste e gestire la validità delle risposte memorizzate, mentre la dashboard deve raccogliere e organizzare i dati relativi ai consumi.

*Tecnologie interessate:* Il progetto richiede l'utilizzo di LiteLLM come base. Tra le tecnologie consigliate figurano Python, FastAPI o Flask per il backend, Redis e Qdrant o pgvector per la cache e la ricerca semantica, e PostgreSQL per le metriche economiche. Per la dashboard vengono suggeriti React con Chart.js oppure Streamlit.

*Opportunità di apprendimento:* Il progetto offre la possibilità di approfondire il funzionamento dei modelli linguistici, la ricerca semantica e l'ottimizzazione delle chiamate ai servizi AI. Permette inoltre di acquisire esperienza nella gestione dei costi e nello sviluppo di strumenti di monitoraggio.

*Chiarezza progettuale:* La documentazione definisce i due componenti principali, i risultati attesi e i vincoli di sviluppo. Sono richiesti un prototipo funzionante, documentazione tecnica e test automatici con copertura minima del 70%. I requisiti di dettaglio dovranno essere approfonditi attraverso una sessione di design thinking con il committente.

*Supporto del proponente:* Var Group prevede incontri periodici di allineamento, sessioni di revisione e formazione sulle tecnologie coinvolte. Sono inoltre previste attività dedicate a LiteLLM, al caching semantico e alla dashboard FinOps, con la disponibilità di un repository Git condiviso.

*Criticità e fattori di rischio:* Le principali difficoltà riguardano la corretta valutazione della somiglianza tra richieste e la verifica dell'affidabilità del sistema di caching. È inoltre necessario garantire la separazione dei dati tra team e progetti e distinguere i test tradizionali dalla valutazione dei risultati probabilistici.

*Interesse del gruppo:* Il capitolato offre opportunità formative nell'ambito dell'intelligenza artificiale e dell'ottimizzazione dei servizi software. Tuttavia, l'integrazione con un sistema esistente e la necessità di verificare il comportamento del caching semantico costituiscono aspetti impegnativi. Il gruppo ha infine deciso di orientarsi verso altre proposte.


== C8 – Sonar: Documentazione vivente di uno store Shopify

*Proponente:* Halue S.r.l. Società Benefit

=== Obiettivo

Il progetto prevede la realizzazione di un'applicazione web capace di analizzare automaticamente la struttura e le configurazioni di un negozio online Shopify. Attraverso le API della piattaforma e l'analisi dei file del tema, il sistema dovrà raccogliere informazioni su applicazioni installate, automazioni, campi personalizzati e altri componenti dello store. I dati ottenuti verranno organizzati in un grafo che rappresenti le dipendenze tra gli elementi, permettendo di individuare configurazioni inutilizzate e parti di codice non più necessarie. Sonar dovrà inoltre consentire il confronto tra scansioni successive e la generazione di documentazione esportabile.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, dovuta alla necessità di raccogliere e collegare informazioni provenienti da fonti differenti. Le scansioni devono gestire eventuali interruzioni e rispettare i limiti delle API Shopify. Sono inoltre richiesti l'analisi del codice dei temi e un sistema di regole capace di individuare elementi inutilizzati, distinguendo le informazioni certe da quelle soltanto ipotizzate.

*Tecnologie interessate:* Il capitolato richiede l'utilizzo di Next.js con TypeScript su Vercel, Vercel Workflows per la gestione delle scansioni e Supabase con PostgreSQL per la persistenza dei dati. Sono inoltre vincolanti l'autenticazione tramite Google e l'utilizzo delle API GraphQL di Shopify. Tra gli strumenti consigliati figurano Vercel Sandbox, Tailwind CSS e librerie per la visualizzazione dei grafi.

*Opportunità di apprendimento:* Il progetto offre la possibilità di approfondire lo sviluppo di applicazioni web, l'integrazione con API esterne e l'analisi automatica del codice. Permette inoltre di conoscere tecnologie legate all'esecuzione di processi complessi, alla rappresentazione delle dipendenze e alla sicurezza dei dati. L'applicazione a un contesto aziendale reale costituisce un ulteriore elemento di interesse.

*Chiarezza progettuale:* La documentazione è dettagliata e distingue chiaramente i requisiti obbligatori, desiderabili e opzionali. Sono inoltre descritti i prodotti da consegnare e i criteri di accettazione, tra cui una copertura minima dei test del 70%. Il capitolato prevede anche la possibilità di concordare con l'azienda una riduzione motivata dei requisiti obbligatori, qualora risultassero eccessivi rispetto alle risorse disponibili.

*Supporto del proponente:* Halue prevede incontri di allineamento ogni due settimane, della durata di circa 45 minuti, e una casella di posta dedicata con risposta entro un giorno lavorativo. L'azienda mette inoltre a disposizione competenze tecniche su Shopify e supporto nella valutazione delle scelte progettuali e dei consumi delle piattaforme utilizzate.

*Criticità e fattori di rischio:* Le principali difficoltà riguardano l'affidabilità delle scansioni e la correttezza delle segnalazioni prodotte dal sistema. Il progetto richiede inoltre al gruppo di creare autonomamente uno store Shopify di prova, da utilizzare anche per verificare i risultati. Un ulteriore aspetto da considerare è la gestione dei limiti dei servizi gratuiti di Vercel e Supabase.

*Interesse del gruppo:* Il capitolato ha suscitato un notevole interesse per il suo obiettivo concreto e per le opportunità di apprendimento offerte dalle tecnologie coinvolte. La proposta è stata infatti inclusa tra le tre alternative finali maggiormente considerate. Nonostante gli aspetti positivi, a seguito del confronto conclusivo il gruppo ha deciso di selezionare un altro capitolato (C7 - SmartDashboard).


== C9 – SpecCheck

*Proponente:* Zucchetti S.p.A.

=== Obiettivo

Il progetto prevede lo sviluppo di estensioni per OpenCode, uno strumento che supporta la realizzazione di software attraverso l'intelligenza artificiale. L'obiettivo è verificare la corrispondenza tra i casi d'uso, i requisiti di progetto e il codice sorgente, individuando eventuali funzionalità mancanti o non conformi alle specifiche. Il sistema dovrà leggere e confrontare la documentazione e il codice, presentando i risultati attraverso una dashboard, anche testuale. Il prodotto finale comprenderà un insieme coordinato di skill, tool e plugin integrabili in OpenCode.

=== Considerazioni

*Complessità tecnica:* Il progetto presenta una complessità significativa, legata alla necessità di interpretare documentazione e codice sorgente, verificandone la coerenza. Le operazioni di confronto richiedono l'utilizzo di modelli linguistici, i cui risultati potrebbero non essere sempre affidabili. È inoltre necessario integrare diversi componenti all'interno di OpenCode e garantirne il corretto funzionamento.

*Tecnologie interessate:* Il capitolato richiede l'utilizzo di OpenCode, attraverso lo sviluppo di skill, comandi, tool e almeno un plugin. Per la lettura dei casi d'uso vengono suggeriti formati come Mermaid e XMI, mentre per la documentazione testuale viene indicato Markdown. Il prodotto dovrà inoltre comprendere uno script di installazione, realizzabile in Bash o PowerShell.

*Opportunità di apprendimento:* Il progetto permette di approfondire l'utilizzo dei modelli linguistici nello sviluppo software, con particolare attenzione alla verifica del codice e dei requisiti. Offre inoltre la possibilità di acquisire esperienza nell'estensione di strumenti esistenti e nell'automazione delle attività di controllo della qualità.

*Chiarezza progettuale:* Il capitolato descrive le funzionalità obbligatorie e distingue le possibili estensioni, come una dashboard grafica e la lettura di documenti PDF. Sono inoltre indicate le attività da affrontare nelle fasi di PoC e MVP. Alcuni dettagli implementativi rimangono aperti, considerando la natura esplorativa del progetto.

*Supporto del proponente:* Zucchetti dichiara la possibilità di mettere a disposizione modelli linguistici di grandi dimensioni, con un limite massimo di costo, e modelli più piccoli per le attività di sperimentazione. Viene inoltre indicato un referente aziendale per eventuali chiarimenti, senza specificare una frequenza degli incontri o ulteriori modalità di affiancamento.

*Criticità e fattori di rischio:* La principale difficoltà riguarda l'affidabilità delle verifiche effettuate attraverso i modelli linguistici, soprattutto nel confronto tra il comportamento del codice e le specifiche. Il carattere esplorativo del progetto potrebbe inoltre richiedere numerose revisioni durante lo sviluppo. I requisiti obbligatori non potranno essere modificati in corso d'opera.

*Interesse del gruppo:* Le incertezze legate ai risultati dei modelli linguistici rappresentano elementi di difficoltà. Il gruppo ha infine deciso di orientarsi verso un'altra proposta.
