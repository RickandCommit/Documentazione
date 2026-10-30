#import "../.github/template/template.typ": *

#show: documento.with(
  titolo: "Dichiarazione degli Impegni",
  sottotitolo: "Preventivo dei costi e assunzione degli impegni per la realizzazione del capitolato C2 – NEXUM Concierge",
  versione: "v1.0.0",
  data: "2026-10-30",
  stato: "Approvato",
  uso: "Esterno",
  redattori: ("Luka Lacic", "Francesco Furin"),
  verificatori: ("Alessandro Rasia dal Polo",),
  destinatari: [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
)

// ============================================================
// REGISTRO DELLE MODIFICHE
// ============================================================
= Registro delle modifiche

#text(size: 10pt)[
#table(
  columns: (1.9cm, 2.0cm, 2.0cm, 2.5cm, 1fr),
  align: (
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
  table.cell(align: center + horizon)[*Descrizione*],

  [1.0.0],
  [2026-10-30],
  [Luka Lacic],
  [Alessandro Rasia dal Polo],
  [Rilascio e approvazione della baseline con preventivo a 12.845,00 €, impegno a 90h/persona, matrice di rotazione e analisi rischi],

  [0.3.0],
  [2026-10-29],
  [Francesco Furin],
  [Alessandro Rasia dal Polo],
  [Ottimizzazione del preventivo economico su 630 ore e stesura della motivazione della suddivisione oraria],

  [0.2.0],
  [2026-10-29],
  [Francesco Furin],
  [Sara Stefani],
  [Definizione dell'impegno orario per componente, analisi dei ruoli e criteri di rotazione],

  [0.1.0],
  [2026-10-28],
  [Luka Lacic],
  [Alessandro Rasia dal Polo],
  [Prima stesura della struttura del documento, introduzione, macro-fasi e analisi rischi],
)
]

#pagebreak()
#outline(title: "Indice")
#pagebreak()

= Introduzione

== Finalità del documento

Il presente documento costituisce la *Dichiarazione degli Impegni* formale presentata dal gruppo *RickandCommit* per la candidatura alla realizzazione del capitolato d'appalto *C2 – NEXUM: Concierge per Richieste Operative*, proposto dall'azienda *Eggon S.r.l.* nell'ambito del corso di Ingegneria del Software dell'*Università di Padova* (Anno Accademico 2026/2027).

Il documento ha lo scopo di:
- Definire l'impegno orario preventivato per ciascun componente del team nel rispetto dei vincoli didattici;
- Illustrare le responsabilità e i criteri di rotazione dei ruoli di progetto;
- Esporre le motivazioni metodologiche che hanno guidato la ripartizione delle ore tra i diversi ruoli;
- Quantificare il preventivo economico complessivo basato sulle tariffe orarie ufficiali;
- Articolare la pianificazione di massima in macro-periodi evolutivi;
- Individuare i principali fattori di rischio e le contromisure operative pianificate;
- Sancire formalmente l'assunzione degli impegni economici e la data ultima di consegna del prodotto.

= Impegno orario e Ruoli

== Distribuzione ore per ruolo

Il monte ore complessivo è fissato a *630 ore produttive*, calcolato assegnando a ciascuno dei sette componenti del gruppo un carico di lavoro individuale pari a *90 ore*, corrispondente all'impegno medio atteso prescritto dal regolamento didattico.

La seguente tabella riporta la distribuzione analitica delle ore di ciascun componente nei sei ruoli previsti dal processo di sviluppo:

#text(size: 9.5pt)[
#table(
  columns: (3.8cm, 1.3cm, 1.3cm, 1.3cm, 1.3cm, 1.3cm, 1.3cm, 1.6cm),
  align: (
    left + horizon,
    center + horizon,
    center + horizon,
    center + horizon,
    center + horizon,
    center + horizon,
    center + horizon,
    center + horizon,
  ),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 5.5pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else if row == 8 { rgb("#f1f5f9") } else { none },

  table.cell(align: left + horizon)[*Componente*],
  [*Re*], [*Am*], [*An*], [*Pj*], [*Pr*], [*Ve*], [*Totale*],

  [Bajaj Jatin], [8], [9], [12], [20], [20], [21], [*90*],
  [Blagojevic Dorde], [8], [9], [12], [20], [19], [22], [*90*],
  [Bonetto Nicola], [8], [9], [12], [20], [20], [21], [*90*],
  [Furin Francesco], [8], [9], [12], [20], [20], [21], [*90*],
  [Lacic Luka], [8], [9], [12], [20], [19], [22], [*90*],
  [Rasia dal Polo Alessandro], [8], [9], [12], [20], [20], [21], [*90*],
  [Stefani Sara], [8], [9], [12], [20], [19], [22], [*90*],

  [*Totale ore ruolo*], [*56*], [*63*], [*84*], [*140*], [*137*], [*150*], [*630*],
)
]

_Legenda ruoli:_ *Re:* Responsabile, *Am:* Amministratore, *An:* Analista, *Pj:* Progettista, *Pr:* Programmatore, *Ve:* Verificatore.

== Analisi dei Ruoli

I componenti ricopriranno, a rotazione, tutti i ruoli previsti dal modello di processo:

=== Responsabile
Il Responsabile coordina le attività complessive del team e presiede le comunicazioni istituzionali con il Committente e l'azienda proponente (*Eggon S.r.l.*). Cura la pianificazione temporale, vigila sul rispetto delle scadenze e controlla che la rotazione dei ruoli si svolga regolarmente. È titolare dell'approvazione formale dei rilasci di baseline (documenti e codice). Il suo impegno è costante lungo l'intero ciclo di vita del progetto, con un'intensità maggiore nelle fasi di avvio e in prossimità delle revisioni formali.

=== Amministratore
L'Amministratore progetta, gestisce e mantiene l'ambiente tecnologico di supporto al team, garantendo l'efficienza dei sistemi di versionamento (Git/GitHub), la configurazione e manutenzione delle pipeline di automazione (CI/CD per la compilazione dei documenti Typst e deploy su GitHub Pages) e l'infrastruttura di tracciamento dei task nel backlog. Trattandosi di un ruolo concentrato prioritariamente sul setup iniziale e sulla manutenzione dei flussi automatici, il suo monte ore risulta tra i più contenuti.

=== Analista
L'Analista studia nel dettaglio il dominio applicativo e il capitolato d'appalto, interfacciandosi con i referenti aziendali per estrarre, formalizzare e classificare i requisiti software (funzionali, non funzionali, di vincolo e prestazionali). Produce la modellazione dei casi d'uso e garantisce che i requisiti costituiscano una base solida, chiara e verificabile per la progettazione architetturale.

=== Progettista
Il Progettista definisce l'architettura logica e di deployment del sistema a partire dai requisiti concordati, selezionando i design pattern, modellando i dati (schemi relazionali e basi vettoriali con `pgvector`) e dettagliando i contratti di interfaccia API con i servizi NEXUM. Poiché eventuali imperfezioni o lacune a livello architetturale si ripercuoterebbero pesantemente sulla codifica, a questo ruolo è stata destinata una quota oraria cospicua per garantire la massima solidità strutturale.

=== Programmatore
Il Programmatore traduce la progettazione architetturale e le specifiche tecniche in codice sorgente conforme agli standard qualitativi definiti nelle Norme di Progetto. Si occupa dell'integrazione dei modelli linguistici (Amazon Bedrock e `ruby_llm`), dello sviluppo delle funzionalità operative su ferie e permessi e della stesura contestuale dei test unitari e di integrazione a corredo del codice prodotto.

=== Verificatore
Il Verificatore certifica in modo indipendente la conformità, correttezza e qualità di ogni prodotto prima del suo rilascio formale. Esegue controlli statici (Walkthrough e Inspection su documenti e codice) e dinamici (esecuzione e monitoraggio delle suite di test automatici), accertando il soddisfacimento dei requisiti e la conformità alle metriche di qualità definite.

== Criteri di rotazione e indipendenza della verifica

Per favorire la crescita professionale di tutti i componenti e garantire la massima trasparenza operativa, il gruppo adotta i seguenti criteri stringenti:
- *Rotazione periodica per sprint:* la rotazione dei ruoli è pianificata a cadenza bisettimanale (in corrispondenza di ciascuno sprint operativo), assicurando che ogni studente sperimenti tutti i ruoli nel corso del progetto;
- *Indipendenza assoluta della verifica:* vige la regola inderogabile per cui nessun componente può verificare artefatti (sezioni documentali, classi software o configurazioni) di cui sia stato autore o contributore diretto;
- *Unicità di ruolo:* durante una specifica sessione di lavoro o task del backlog, ogni componente opera sotto un unico ruolo formalmente registrato.

== Motivazione della suddivisione oraria

Il monte ore complessivo di 630 ore è stato distribuito seguendo un rigoroso criterio di ottimizzazione qualitativa ed economica:

- *Attenzione al controllo qualità e sviluppo (Pr 137h, 21,75% e Ve 150h, 23,81%):* la scelta di riservare alla verifica un monte ore leggermente superiore a quello di programmazione scaturisce dalla volontà metodologica di prevenire l'accumulo di debito tecnico e garantire che ogni componente di codice e documento sia sottoposto a verifica puntuale e indipendente;
- *Centralità della Progettazione (140h, 22,22%):* la natura ibrida del capitolato C2 (che unisce componenti generativi LLM, architetture RAG e integrazioni transazionali su dati aziendali) richiede un'architettura modulare, manutenibile e sicura. Investire oltre il 22% delle ore totali nella progettazione dettagliata consente di definire contratti di interfaccia chiari e stabili, riducendo drasticamente il rischio di rifacimenti in fase di codifica;
- *Potenziamento di Analisi e Amministrazione (Re 56h, Am 63h, An 84h):* l'Analisi dei Requisiti (84 ore, 13,33%) è stata significativamente potenziata per garantire una modellazione rigorosa dei casi d'uso e dei requisiti nell'RTB. L'Amministrazione (63 ore, 10,00%) assicura il mantenimento continuo degli standard di qualità e dell'infrastruttura CI/CD, mentre il Responsabile (56 ore, 8,89%) garantisce un coordinamento costante ed efficiente.

= Preventivo dei costi

== Costo per ruolo

Il costo preventivato è calcolato applicando le tariffe orarie ufficiali stabilite dal regolamento del progetto didattico per ciascun ruolo al monte ore preventivato:

#text(size: 10pt)[
#table(
  columns: (3.5cm, 2.5cm, 2.5cm, 3.0cm, 2.0cm),
  align: (
    left + horizon,
    center + horizon,
    center + horizon,
    right + horizon,
    center + horizon,
  ),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else if row == 7 { rgb("#f1f5f9") } else { none },

  table.cell(align: left + horizon)[*Ruolo*],
  table.cell(align: center + horizon)[*Costo orario*],
  table.cell(align: center + horizon)[*Ore preventivate*],
  table.cell(align: right + horizon)[*Importo parziale*],
  table.cell(align: center + horizon)[*Quota ore*],

  [Responsabile], [30,00 €/h], [56], [1.680,00 €], [8,89%],
  [Amministratore], [20,00 €/h], [63], [1.260,00 €], [10,00%],
  [Analista], [25,00 €/h], [84], [2.100,00 €], [13,33%],
  [Progettista], [25,00 €/h], [140], [3.500,00 €], [22,22%],
  [Programmatore], [15,00 €/h], [137], [2.055,00 €], [21,75%],
  [Verificatore], [15,00 €/h], [150], [2.250,00 €], [23,81%],

  [*Totale complessivo*], [—], [*630*], [*12.845,00 €*], [*100,00%*],
)
]

== Costo totale preventivato e conformità al budget

Il costo complessivo stimato per la realizzazione del progetto è pari a *12.845,00 €* (dodicimilaottocentoquarantacinque euro/00).

Tale preventivo risulta *pienamente conforme* alla soglia minima didattica: per un gruppo di sette componenti, il regolamento impone un costo minimo obbligatorio di 12.000,00 €.

L'importo di 12.845,00 € costituirà il *limite massimo di spesa invalicabile* per l'intero ciclo di fornitura del software.

== Ripartizione percentuale del monte ore totale

La distribuzione percentuale dell'impegno orario evidenzia la forte impronta realizzativa e qualitativa del piano operativo:
- *Attività di sviluppo e verifica (Programmatore + Verificatore):* assorbono complessivamente il *45,56%* del monte ore (287 ore su 630), assicurando la produzione e il collaudo approfondito del codice;
- *Attività architetturale (Progettista):* rappresenta il *22,22%* delle ore (140 ore), a garanzia di scelte tecnologiche e strutturali ponderate;
- *Attività di coordinamento e specifica (Responsabile + Amministratore + Analista):* costituiscono il restante *32,22%* delle risorse (203 ore), garantendo una solida base di requisiti e un'amministrazione rigorosa dei processi.

= Pianificazione di massima e macro-periodi

Il gruppo articola lo svolgimento dei lavori in tre macro-periodi sequenziali, concordati con l'azienda *Eggon S.r.l.* e allineati alle scadenze del corso:

#text(size: 10pt)[
#table(
  columns: (2.8cm, 1fr, 3.2cm),
  align: (
    center + horizon,
    left + horizon,
    center + horizon,
  ),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Macro-periodo*], [*Obiettivi e deliverable attesi*], [*Finestra temporale*],

  [Fase 1: \ *PoC e Baseline Requisiti (RTB)*],
  [Analisi di dettaglio dei requisiti e dei casi d'uso con il proponente. Realizzazione di un Proof of Concept (PoC) verticale per validare la consultazione documentale (RAG su `pgvector`), le chiamate a modelli linguistici (AWS Bedrock e `ruby_llm`) e il setup infrastrutturale.],
  [Novembre 2026 – Febbraio 2027],

  [Fase 2: \ *Sviluppo dell'MVP*],
  [Implementazione completa del flusso conversazionale e delle operazioni relative all'ambito ferie e permessi: integrazione delle fonti documentali, connessione con i servizi NEXUM e implementazione dei pattern di conferma esplicita e autorizzazioni.],
  [Febbraio 2027 – Marzo 2027],

  [Fase 3: \ *Validazione, Collaudo e Rilascio (PB)*],
  [Campagne di test di sistema, regressione e sicurezza, rifinitura prestazionale, stesura dei manuali utente e manutentore, preparazione dell'ambiente di collaudo finale e consegna della Product Baseline.],
  [Marzo 2027 – Fine Marzo 2027],
)
]

= Analisi e mitigazione dei rischi

Per prevenire scostamenti rispetto al preventivo economico di 12.845,00 € e alla pianificazione temporale, il gruppo ha mappato i fattori di rischio critici e definito le rispettive strategie di mitigazione:

#text(size: 10pt)[
#table(
  columns: (3.8cm, 1fr),
  align: (
    center + horizon,
    left + horizon,
  ),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Fattore di rischio*], [*Strategia di mitigazione concordata*],

  [*Adozione di tecnologie poco note* \ (Ruby on Rails, pgvector, Bedrock)],
  [Realizzazione precoce di spike tecnici e del prototipo verticale (PoC) in Fase 1 per padroneggiare la toolchain prima di procedere con la codifica intensiva dell'MVP.],

  [*Integrazione e firme API con servizi NEXUM*],
  [Formalizzazione tempestiva dei contratti di interfaccia e dei payload JSON in collaborazione con i tecnici di Eggon; utilizzo di mock conformi durante lo sviluppo locale per evitare dipendenze bloccanti.],

  [*Allucinazioni e accuratezza dell'assistente LLM*],
  [Adozione di un'architettura RAG grounded: ogni risposta deve riportare i riferimenti espliciti alle fonti documentali aziendali, con gestione deterministica e fallback nei casi in cui l'informazione sia assente o ambigua.],

  [*Integrità e sicurezza delle operazioni transazionali*],
  [Adozione di transazioni a due fasi con riepilogo e richiesta di conferma esplicita all'utente prima dell'invio definitivo di richieste di ferie/permessi; impiego di chiavi di idempotenza e verifica autorizzazioni.],

  [*Scostamenti rispetto al monte ore preventivato*],
  [Tracciamento settimanale delle ore effettive rispetto alle ore preventivate nel backlog; rigorosa delimitazione del perimetro operativo dell'MVP al solo ambito ferie e permessi, evitando estensioni fuori ambito.],
)
]

= Assunzione formale degli impegni e Consegna

Il gruppo *RickandCommit* si impegna formalmente a realizzare il capitolato d'appalto *C2 – NEXUM: Concierge per Richieste Operative*, proposto da *Eggon S.r.l.*, nel rispetto rigoroso dei vincoli didattici, qualitativi ed economici enunciati nel presente documento.

In particolare, il gruppo dichiara e assume i seguenti impegni contrattuali:
- *Monte ore complessivo:* **630 ore** produttive totali, garantendo un apporto equamente distribuito di **90 ore per ciascun componente** del team;
- *Preventivo economico vincolante:* **12.845,00 €** (dodicimilaottocentoquarantacinque euro/00), inteso come tetto massimo insuperabile per la realizzazione della fornitura;
- *Data ultima di consegna (Product Baseline - PB):* fissata improrogabilmente entro il **26 marzo 2027** (con completamento della revisione entro la prima metà di aprile 2027, garantendo la conclusione del progetto prima dell'avvio dei tirocini curriculari).
