#import "../.github/template/template.typ": *

#show: documento.with(
  titolo: "Norme di Progetto",
  sottotitolo: "Modalità di lavoro del gruppo per la realizzazione \ndel capitolato C2 – NEXUM Concierge",
  versione: "v0.1.0",
  data: "2026-11-11",
  stato: "In redazione",
  uso: "Interno",
  redattori: ("Luka Lacic",),
  verificatori: ("Sara Stefani",),
  esito-verifica: "In attesa",
  destinatari: [Prof. Tullio Vardanega \ Prof. Riccardo Cardin \ Eggon S.r.l.],
)

#pagebreak()

// ==================== REGISTRO DELLE MODIFICHE ====================
#registro-modifiche(
  table.cell(align: center)[0.1.0],
  table.cell(align: center)[2026-11-11],
  [Prima stesura dell'introduzione, del tailoring e delle procedure relative ai processi di supporto
e organizzativi],
  [Luka Lacic],
  [Sara Stefani],
)

#counter(heading).update(0)

#pagebreak()
#outline(title: "Indice")
#pagebreak()


= Introduzione

== Scopo del documento

Il presente documento definisce le norme e le modalità di lavoro che il gruppo RickandCommit adotta per lo svolgimento del progetto didattico di Ingegneria del Software, nell'anno accademico 2026/2027 presso l'Università di Padova.

Le norme disciplinano le attività del gruppo, le procedure da seguire e gli strumenti utilizzati, con l'obiettivo di garantire un'organizzazione del lavoro uniforme, efficace e verificabile.

Il documento prende come riferimento lo standard ISO/IEC 12207:1995, che distingue i processi del ciclo di vita del software in primari, di supporto e organizzativi. I processi vengono adattati alle caratteristiche e alle necessità del progetto, nel rispetto del Regolamento del Progetto Didattico.

Le Norme di Progetto vengono sviluppate in modo incrementale e aggiornate durante l'avanzamento del progetto. Ogni nuova attività deve essere normata prima della sua esecuzione, mentre le procedure già adottate possono essere riviste per migliorare il modo di lavorare del gruppo.

Tutti i componenti di RickandCommit sono tenuti a conoscere e rispettare le norme contenute nella versione vigente del documento.

== Scopo del prodotto

Il capitolato C2 — NEXUM Concierge, proposto dall'azienda Eggon S.r.l., prevede la realizzazione di un assistente conversazionale basato sull'intelligenza artificiale, destinato a supportare gli utenti della piattaforma NEXUM.

L'obiettivo è consentire agli utenti di interagire con il sistema attraverso il linguaggio naturale, per consultare informazioni e regolamenti aziendali, ottenere indicazioni sulle funzionalità della piattaforma, accedere ai propri dati personali autorizzati ed eseguire operazioni tramite i servizi disponibili.

Il perimetro iniziale del prodotto riguarda la gestione
di ferie e permessi, comprendendo la consultazione delle
informazioni, l'accesso ai dati personali autorizzati e
la preparazione e l'invio delle richieste, previa conferma
esplicita dell'utente. L'approvazione delle richieste
rimane affidata ai processi esistenti della piattaforma NEXUM.

== Glossario

Per evitare ambiguità nell'interpretazione dei termini utilizzati nella documentazione, il gruppo RickandCommit adotta un Glossario contenente le definizioni dei termini tecnici, degli acronimi e delle espressioni di significato non immediato.

La prima occorrenza di un termine presente nel Glossario viene contrassegnata dalla lettera G ad apice, secondo la seguente convenzione:

#align(center)[termine#super[G]]

Il Glossario viene aggiornato durante lo svolgimento del progetto, in modo da includere i nuovi termini introdotti e mantenere coerenti le definizioni utilizzate nei documenti.

== Riferimenti

=== Riferimenti normativi

- #link("https://www.math.unipd.it/~tullio/IS-1/2026/Dispense/PD1.pdf")[#text(fill: rgb("#2563EB"))[*Regolamento del Progetto Didattico*]] — Ingegneria del Software, A.A. 2026/2027. \
  Ultimo accesso: 2026-11-06.

- #link("https://www.math.unipd.it/~tullio/IS-1/2026/Progetto/C2-Concierge.pdf")[#text(fill: rgb("#2563EB"))[*Capitolato C2 — NEXUM Concierge*]] —  Eggon S.r.l. \
  Ultimo accesso: 2026-11-06.
  
- #link("https://www.math.unipd.it/~tullio/IS-1/2009/Approfondimenti/ISO_12207-1995.pdf")[#text(fill: rgb("#2563EB"))[*Standard ISO/IEC 12207:1995*]] — Software Life Cycle Processes. \
  Ultimo accesso: 2026-11-06.

=== Riferimenti informativi

- Materiale didattico del corso di Ingegneria del Software, A.A. 2026/2027.

- #link("https://www.math.unipd.it/~tullio/IS-1/2026/Progetto/C2p.pdf")[#text(fill: rgb("#2563EB"))[*Presentazione del capitolato C2 — NEXUM Concierge*]], Eggon S.r.l. \
  Ultimo accesso: 2026-11-06.

- *Glossario* — RickandCommit.

- #link("https://github.com/RickandCommit/Documentazione")[#text(fill: rgb("#2563EB"))[*Repository della documentazione*]] — RickandCommit.


== Organizzazione del documento

Il documento è strutturato secondo la classificazione dei processi del ciclo di vita del software. Le sezioni vengono sviluppate progressivamente, in relazione alle attività effettivamente svolte e alle procedure adottate dal gruppo.

- *Adozione e adattamento dei processi (Tailoring)*: illustra i criteri di adattamento dei processi e la loro introduzione nelle diverse fasi del progetto.

- *Processi primari*: comprende le norme relative alla fornitura e allo sviluppo del prodotto software.

- *Processi di supporto*: raccoglie le norme per la documentazione, la gestione della configurazione, la verifica e l'accertamento della qualità.

- *Processi organizzativi*: riguarda la gestione del progetto, la comunicazione, le infrastrutture e il miglioramento dei processi.


= Adozione e adattamento dei processi (Tailoring)

Il gruppo RickandCommit prende come riferimento la classificazione dei processi dello standard ISO/IEC 12207:1995, adattandola alle esigenze del capitolato C2 e ai vincoli del Regolamento del Progetto Didattico.

L'adozione delle norme avviene progressivamente: le procedure necessarie vengono definite prima di svolgere le relative attività e possono essere aggiornate in seguito alle esigenze emerse durante il progetto.

== Processi della fase di candidatura (CC)

La fase di candidatura si è conclusa con l'assegnazione del capitolato C2 — NEXUM Concierge. Le attività svolte hanno riguardato principalmente:

- *Fornitura*: valutazione dei capitolati e preparazione della documentazione di candidatura e degli impegni assunti;
- *Documentazione*: redazione dei documenti e dei verbali relativi agli incontri svolti;
- *Gestione della configurazione*: organizzazione della repository documentale e gestione delle versioni dei file.

Queste attività costituiscono il punto di partenza per la definizione delle norme, senza implicare che tutte le relative procedure siano già state formalizzate o approvate.

== Processi in preparazione alla RTB

In vista della Requirements and Technology Baseline (RTB), il gruppo dovrà definire le modalità di svolgimento delle attività di analisi dei requisiti, valutazione delle tecnologie e realizzazione del Proof of Concept.

Le relative norme saranno introdotte prima dell'esecuzione delle attività e integrate nei processi pertinenti, insieme alle necessarie procedure di verifica e controllo della qualità. Le modalità operative non ancora concordate non vengono anticipate in questa versione del documento.


= Processi primari

== Fornitura

=== Attività

Durante la candidatura il gruppo ha esaminato i capitolati disponibili, raccolto chiarimenti dai proponenti e predisposto la documentazione necessaria alla candidatura per il capitolato C2 — NEXUM Concierge, successivamente assegnato a RickandCommit.

=== Documentazione prodotta

Gli artefatti della fase di candidatura comprendono la Valutazione dei Capitolati, la Dichiarazione degli Impegni, la Lettera di Presentazione e i relativi verbali. Sono conservati nella directory `Candidatura/` e nelle sue sottodirectory, secondo le convenzioni documentali adottate.

== Sviluppo


= Processi di supporto

== Documentazione

=== Attività

Il processo di Documentazione disciplina la redazione, l'aggiornamento, la verifica, l'approvazione e la pubblicazione dei documenti prodotti dal gruppo. I documenti sono organizzati nelle directory corrispondenti alle fasi di candidatura, Requirements and Technology Baseline (RTB) e Product Baseline (PB). I verbali interni ed esterni sono collocati in directory distinte.

=== Procedure

*Redazione e struttura.* I documenti formali e i verbali sono redatti in Typst e utilizzano il template condiviso collocato in `.github/template/template.typ`. Frontespizio, font, margini, intestazioni, piè di pagina e impostazioni tipografiche sono definiti dal template, senza duplicarne la configurazione nei singoli documenti.

*Nomenclatura e organizzazione.* I nomi dei file impiegano il carattere underscore per separare le parole. Le risorse associate a una data specifica riportano la data all'inizio del nome nel formato `AAAA-MM-GG`; per i verbali si utilizzano denominazioni come `AAAA-MM-GG_Verbale_Interno.typ` e `AAAA-MM-GG_Verbale_Esterno_Azienda.typ`. I nomi delle cartelle non contengono spazi, lettere accentate o altri caratteri non ASCII. Le directory degli artefatti sono organizzate secondo le fasi del progetto, evitando cartelle ridondanti destinate a un unico file omonimo.

*Registro delle modifiche.* I documenti soggetti a versionamento riportano, prima dell'indice, il Registro delle modifiche, escluso dall'indice stesso. Le registrazioni sono ordinate dalla più recente alla meno recente e contengono versione, data, descrizione, autore e verificatore. Una nuova revisione viene registrata a seguito della verifica positiva da parte di un componente diverso dall'autore.

*Verifica, approvazione e rilascio.* Il ciclo documentale prevede redazione, verifica indipendente, approvazione del Responsabile di Progetto per il rilascio formale e pubblicazione. La verifica del contenuto è distinta dall'approvazione del rilascio. Le modifiche sono sottoposte a pull request secondo il processo di Gestione della configurazione.

*Produzione e pubblicazione.* I sorgenti Typst sono conservati nella repository, mentre i PDF ricavabili dai sorgenti vengono generati mediante la procedura automatizzata di compilazione e pubblicazione. Le copie firmate dei verbali esterni possono essere conservate come PDF, poiché non sono riproducibili a partire dai file sorgente.

=== Strumenti

Il gruppo utilizza Typst per la composizione dei documenti, Git e GitHub per il controllo delle modifiche, GitHub Actions per la generazione automatizzata degli artefatti e GitHub Pages per la loro consultazione.


== Gestione della configurazione

=== Attività

Il processo riguarda l'identificazione e il controllo delle versioni degli artefatti, la gestione delle modifiche e la tracciabilità delle attività svolte nella repository documentale.

=== Procedure

*Identificazione e versionamento.* I documenti formali adottano la numerazione `vX.Y.Z`: `X` identifica un rilascio formale di baseline, `Y` un aggiornamento significativo del contenuto e `Z` una correzione minore. La versione indicata sul frontespizio deve essere coerente con il Registro delle modifiche e con la denominazione del PDF pubblicato, che segue lo schema `Nome_Documento_vX.Y.Z.pdf`.

*Preparazione delle modifiche.* Ogni attività viene tracciata mediante una issue GitHub. Per modificare i documenti, l'autore crea un branch dedicato a partire dal ramo `main` aggiornato. Non è consentito eseguire push diretti su `main`; le modifiche vengono integrate soltanto tramite pull request.

*Denominazione dei branch.* I branch seguono le convenzioni del gruppo: `doc/nome-documento` per i documenti, `verbale/interno-AAAA-MM-GG` per i verbali interni, `verbale/esterno-azienda-AAAA-MM-GG` per quelli esterni, `template/descrizione` per il template, `ci/descrizione` per l'automazione e `fix/descrizione` per le correzioni. Le versioni dei documenti non vengono inserite nel nome del branch.

*Commit e pull request.* I messaggi di commit adottano la convenzione Conventional Commits. La pull request viene aperta verso `main`, descrive il contributo e riporta il collegamento all'issue corrispondente tramite una parola chiave di chiusura, ad esempio `Closes #14`. L'autore richiede la verifica a un componente che non ha redatto la modifica. L'integrazione richiede almeno un'approvazione della pull request; dopo il merge, il branch sorgente viene eliminato.

*Chiusura delle issue.* Quando una pull request collegata tramite `Closes #14` viene integrata nel branch predefinito `main`, GitHub chiude automaticamente l'issue, purché la funzione di chiusura automatica della repository sia abilitata. La Project Board aggiorna lo stato della scheda a `Done` mediante il workflow previsto per la chiusura delle issue, quando questo è attivo. Il completamento viene comunque verificato e, se necessario, lo stato viene corretto manualmente.

*Tracciabilità dei contributi.* I commit devono consentire di identificare il componente responsabile delle modifiche e rispettano le convenzioni adottate dal gruppo per i messaggi e le attribuzioni di autorialità.

=== Strumenti

Sono utilizzati Git per il controllo di versione e GitHub per la gestione di repository, branch, issue, pull request e revisioni.


== Verifica

=== Attività

Il processo comprende i controlli sulla correttezza e sulla conformità degli artefatti prodotti alle norme applicabili. Durante la fase attuale tali controlli riguardano principalmente i documenti e le modifiche alla repository.

=== Procedure

*Indipendenza della verifica.* La verifica è assegnata a un componente diverso dall'autore dell'attività. Il verificatore esamina la modifica nella pull request e segnala gli eventuali problemi prima di approvarne l'integrazione.

*Controlli documentali.* Per i documenti Typst sono verificati il contenuto, la chiarezza, la conformità alle convenzioni redazionali, la correttezza dei riferimenti, l'aggiornamento del Registro delle modifiche e la compilazione senza errori. L'autore e il verificatore controllano la compilazione locale prima dell'integrazione.

*Esito della verifica.* Le non conformità vengono segnalate e corrette prima dell'approvazione. La revisione della pull request non sostituisce l'approvazione formale del rilascio da parte del Responsabile di Progetto.

*Contenuti assistiti dall'intelligenza artificiale.* L'utilizzo di strumenti di intelligenza artificiale non solleva il redattore dalla responsabilità dei contenuti. Ogni contributo deve essere compreso e verificato; affermazioni tecniche, stime, costi e vincoli contrattuali devono essere riscontrabili nelle fonti pertinenti.

=== Strumenti

La verifica è supportata dalle funzionalità di revisione delle pull request di GitHub, da Typst e dai controlli automatizzati previsti per la repository.


== Accertamento della qualità


= Processi organizzativi

== Gestione del progetto

=== Attività

Il processo comprende la pianificazione, l'assegnazione e il monitoraggio del lavoro del gruppo. La definizione dei ruoli, la loro rotazione, la pianificazione dei periodi e la rendicontazione delle risorse vengono sviluppate nel rispetto del Regolamento del Progetto Didattico e documentate nel Piano di Progetto.

=== Procedure

*Tracciamento delle attività.* Ogni attività operativa viene registrata mediante una issue GitHub, alla quale sono associati il componente incaricato e le informazioni utili alla sua esecuzione. Le decisioni che generano attività vengono collegate alle corrispondenti issue.

*Stati della Project Board.* Le attività sono organizzate negli stati `Backlog`, `Ready` e `Done`. `Backlog` raccoglie le attività non ancora prese in carico. Il passaggio a `Ready` avviene alla presa in carico, con la creazione del branch dedicato e il collegamento all'issue. `Done` identifica il completamento dell'attività a seguito della relativa integrazione o chiusura.

*Conclusione delle attività.* La pull request include il riferimento all'issue tramite una keyword come `Closes #14`. Dopo il merge viene controllato che l'issue risulti chiusa e che la relativa scheda sia nello stato `Done`, secondo le automazioni effettivamente abilitate nella Project Board.

*Ruoli e responsabilità.* I componenti devono ruotare sui ruoli previsti dal Regolamento, senza assumere più di un ruolo contemporaneamente. La distribuzione dei compiti deve garantire l'indipendenza della verifica. La modalità di rotazione e la pianificazione delle assegnazioni saranno definite prima dell'applicazione delle relative attività.

=== Strumenti

Il gruppo utilizza GitHub Issues e GitHub Projects per il tracciamento del lavoro e il Piano di Progetto per la pianificazione e la rendicontazione.


== Comunicazione e coordinamento

=== Attività

Il processo riguarda la registrazione delle riunioni, la condivisione delle decisioni e la tracciabilità delle attività concordate.

=== Procedure

*Verbali.* Gli incontri ufficiali sono documentati mediante verbali interni o esterni, conservati nelle rispettive directory e redatti tramite il template condiviso.

*Decisioni e azioni.* I verbali registrano le decisioni e le conseguenti azioni operative. Per ciascuna attività derivante da una decisione sono riportati il riferimento all'issue, il componente incaricato e la scadenza concordata. Le issue consentono di monitorarne l'esecuzione.

*Comunicazioni esterne.* Gli scambi con il proponente e con i committenti seguono gli accordi specifici e i vincoli del progetto. Le modalità e i canali utilizzati saranno formalizzati quando definiti dal gruppo.

=== Strumenti

Sono utilizzati i verbali redatti in Typst e le issue GitHub. I canali di comunicazione operativi verranno descritti quando formalizzati.


== Gestione dell'infrastruttura

=== Attività

Il processo comprende la predisposizione, il mantenimento e l'utilizzo degli strumenti per la produzione, il controllo e la pubblicazione della documentazione.

=== Procedure

*Template e risorse condivise.* Il template ufficiale è conservato in `.github/template/template.typ` con i relativi asset grafici. Le procedure automatizzate sono collocate in `.github/workflows/` e gli script di supporto in `.github/scripts/`.

*Compilazione locale.* Prima dell'apertura di una pull request, il documento Typst viene compilato dalla radice della repository indicando esplicitamente `--root .`, per esempio con `typst compile --root . RTB/Norme_di_Progetto.typ`. È disponibile inoltre il controllo di conformità mediante `python .github/scripts/validate_structure.py --root-dir .`.

*Pubblicazione automatica.* Il workflow di GitHub Actions esegue la compilazione dei documenti previsti e aggiorna il sito GitHub Pages dopo l'integrazione delle modifiche nel ramo `main`. I PDF generati vengono prodotti durante la build, mentre nella repository rimangono i sorgenti Typst e le risorse necessarie; fanno eccezione gli artefatti firmati non riproducibili dai sorgenti.

=== Strumenti

L'infrastruttura comprende Typst, il template condiviso, gli script di validazione, GitHub Actions e GitHub Pages.


== Miglioramento dei processi
