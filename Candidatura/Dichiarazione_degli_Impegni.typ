// Progetto di Ingegneria del Software (a.a. 2026/2027) — Università di Padova

#let data-verbale = ""
#let tipo-verbale = "Dichiarazione degli impegni"

#set document(title: tipo-verbale + "" + data-verbale + " — RickandCommit", author: "RickandCommit")
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
      [#text(size: 9pt)[#tipo-verbale #data-verbale]],
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

#let issue(n) = link("https://github.com/RickandCommit/Documentazione/issues/" + str(n))[#text(fill: rgb("#0969da"))[#underline[\##n]]]
#let nessuna = [Nessuna azione operativa.]

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
  #text(size: 26pt, weight: "bold")[Dichiarazione degli Impegni]
  #v(0.25cm)
  #text(size: 10pt, style: "italic")[Versione v0.1.0 · Ultima modifica: 2026-10-28]
]

#v(0.5cm)

// ==================== INFORMAZIONI GENERALI ====================
#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 7pt,
  [*Data ultima modifica*], [2026-10-28],
  [*Redattore*], [Luka Lacic],
  [*Verificatore*], [],
  [*Destinatari*], [Prof. Tullio Vardanega \ Prof. Riccardo Cardin],
)

#v(0.4cm)

// ==================== 1. REGISTRO DELLE MODIFICHE ====================
= Registro delle modifiche

#text(size: 10pt)[
#table(
  columns: (2cm, 2.2cm, 2.8cm, 2.8cm, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  table.cell(align: center)[*Versione*],
  table.cell(align: center)[*Data*],
  table.cell(align: center)[*Autore*],
  table.cell(align: center)[*Verificatore*],
  [*Descrizione*],
  [0.1.0], [2026-10-28], [Luka Lacic], [-], [Bozza iniziale della dichiarazione degli \ impegni],
)
]

#pagebreak()
#outline(title: "Indice")
#pagebreak()

= Scopo del documento

Il presente documento definisce gli impegni preventivati dal gruppo RickandCommit nell'ambito del progetto didattico di Ingegneria del Software dell'Università di Padova, per l'anno accademico 2026/2027. Sono riportate le responsabilità dei ruoli di progetto, la ripartizione delle ore produttive tra i componenti, la stima dei costi e la scadenza prevista per la consegna finale.

La pianificazione si riferisce al capitolato proposto dall'azienda *Eggon S.r.l.* dal titolo: *C2 – NEXUM Concierge*.

= Ruoli e responsabilità

I componenti del gruppo ricopriranno, a rotazione, i sei ruoli previsti per il progetto didattico. Ciascun ruolo comporta responsabilità distinte, descritte di seguito.

== Responsabile

Il Responsabile coordina le attività del gruppo, pianifica le risorse e le scadenze e controlla l'avanzamento del progetto. Rappresenta il gruppo nei rapporti con il committente e il proponente, valuta i rischi e le possibili alternative e approva il rilascio dei prodotti, sia documentali sia software, nelle forme previste dal processo adottato. Il suo coinvolgimento si estende all'intera durata del progetto.

== Amministratore

L'Amministratore definisce, predispone e mantiene l'ambiente informatico di lavoro. Assicura l'efficienza degli strumenti e delle procedure che supportano il metodo di lavoro del gruppo, curando la configurazione delle risorse e intervenendo sulle eventuali segnalazioni di malfunzionamento. Favorisce un utilizzo coerente degli ambienti condivisi durante lo sviluppo.

== Analista

L'Analista approfondisce il dominio del problema e le esigenze espresse dal proponente, individuando e documentando i requisiti del sistema. Chiarisce eventuali ambiguità e fornisce ai Progettisti una base verificabile per definire la soluzione. Il suo impegno è concentrato soprattutto nelle attività di analisi e può essere ripreso quando emergono modifiche o chiarimenti sui requisiti.

== Progettista

Il Progettista definisce l'architettura e l'organizzazione delle componenti software sulla base dei requisiti individuati. Valuta le alternative tecniche, determina le principali scelte realizzative e documenta le soluzioni necessarie a guidare la codifica. Collabora con gli altri ruoli per mantenere coerenti progettazione e implementazione.

== Programmatore

Il Programmatore realizza il prodotto software mediante attività di codifica, seguendo le specifiche e le scelte progettuali definite. Implementa e integra le componenti assegnate, contribuendo anche alla manutenzione del codice. Opera in coordinamento con i Progettisti e con gli altri membri del gruppo per ottenere un sistema funzionante.

== Verificatore

Il Verificatore controlla in modo sistematico la correttezza e la qualità dei prodotti di progetto, comprendendo sia la documentazione sia il software. Svolge revisioni, controlli e test per individuare difetti e verificare la conformità ai requisiti e alle procedure adottate. La verifica accompagna tutte le fasi del progetto e richiede conoscenza del metodo di lavoro del gruppo.

= Impegni orari

La dichiarazione prevede l'assegnazione di un monte ore produttive a ciascun componente, nel rispetto dell'intervallo da 80 a 95 ore per persona stabilito dal regolamento didattico. Le ore saranno rendicontate a partire dall'aggiudicazione del progetto.

== Ripartizione delle ore per componente

La seguente tabella riporta la ripartizione preventiva delle ore per componente e per ruolo, con i relativi totali individuali e complessivi.

#text(size: 9pt)[
#align(center)[
#table(
  columns: (3.6cm, 1.4cm, 1.4cm, 1.4cm, 1.4cm, 1.4cm, 1.4cm, 1.4cm),
  align: (col, row) => if col == 0 { left + horizon } else { center + horizon },
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Componente*],
  table.cell(align: center + horizon)[*Res.*],
  table.cell(align: center + horizon)[*Amm.*],
  table.cell(align: center + horizon)[*Ana.*],
  table.cell(align: center + horizon)[*Pgt.*],
  table.cell(align: center + horizon)[*Prg.*],
  table.cell(align: center + horizon)[*Ver.*],
  table.cell(align: center + horizon)[*Totale*],
  [Jatin Bajaj], [—], [—], [—], [—], [—], [—], [—],
  [Dorde Blagojevic], [—], [—], [—], [—], [—], [—], [—],
  [Nicola Bonetto], [—], [—], [—], [—], [—], [—], [—],
  [Francesco Furin], [—], [—], [—], [—], [—], [—], [—],
  [Luka Lacic], [—], [—], [—], [—], [—], [—], [—],
  [Alessandro Rasia dal Polo], [—], [—], [—], [—], [—], [—], [—],
  [Sara Stefani], [—], [—], [—], [—], [—], [—], [—],
  [*Totale*], [—], [—], [—], [—], [—], [—], [—],
)
]
]
#align(center)[
#text(size: 9pt, style: "italic")[Legenda: Res. = Responsabile; Amm. = Amministratore; Ana. = Analista; Pgt. = Progettista; \
 Prg. = Programmatore; Ver. = Verificatore.]
]

== Criteri di ripartizione

Le ore saranno distribuite tenendo conto delle attività previste e della necessità di coprire tutti i ruoli nel corso del progetto. La rotazione avrà finalità formative e sarà organizzata in relazione all'avanzamento del lavoro.


Per il capitolato C2 – NEXUM Concierge, la ripartizione terrà conto del tempo necessario per comprendere i requisiti, progettare le diverse parti del sistema, sviluppare le funzionalità richieste e verificarne il corretto funzionamento. Sarà considerato anche il lavoro di coordinamento e di gestione degli strumenti del gruppo.

== Rotazione dei ruoli e indipendenza della verifica

La distribuzione delle attività sarà organizzata in modo che ciascun componente possa ricoprire tutti e sei i ruoli nel corso del progetto, per un numero di ore congruo alle rispettive responsabilità.

Ogni componente assumerà un solo ruolo alla volta. Le assegnazioni saranno inoltre definite rispettando il principio di indipendenza della verifica, evitando che un membro verifichi prodotti o attività di cui è stato autore.



= Pianificazione di massima

Il gruppo prevede di suddividere il lavoro in tre fasi, seguendo il percorso proposto da Eggon per NEXUM Concierge. La pianificazione partirà dopo l'aggiudicazione dell'appalto e sarà organizzata in base alle ore produttive preventivate e alle disponibilità dei componenti.

#text(size: 10pt)[
#table(
  columns: (3.1cm, 1fr, 2.6cm),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Fase*], [*Attività e risultato atteso*], [*Periodo \ previsto*],
  [POC e interfacce], [Prime prove sulla consultazione dei documenti e sull'accesso ai servizi, con definizione delle interfacce necessarie. Risultato: prototipo iniziale.], [Da concordare],
  [Realizzazione dell'MVP], [Sviluppo della chat, della base di conoscenza, delle funzioni di gestione delle fonti e delle operazioni relative a ferie e permessi. Risultato: percorso completo funzionante.], [Da concordare],
  [Verifica e \ consegna], [Controllo delle risposte e delle operazioni, correzione dei problemi, completamento della documentazione e preparazione della dimostrazione finale. Risultato: MVP verificato e documentato.], [Da concordare],
)
]


= Rischi attesi e misure previste

Durante lo svolgimento del progetto potrebbero presentarsi difficoltà tecniche e organizzative. Il gruppo terrà conto soprattutto dei seguenti rischi:

#text(size: 10pt)[
#table(
  columns: (4cm, 1fr),
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Rischio*], [*Misura prevista*],
  [Difficoltà con tecnologie poco conosciute], [Svolgere prime prove pratiche e confrontarsi con Eggon sulle scelte più importanti prima di sviluppare tutte le funzionalità.],
  [Ritardi nell'integrazione con i servizi NEXUM], [Definire presto i dati e le interfacce necessari e utilizzare, quando previsto e concordato, simulatori conformi.],
  [Risposte inesatte o informazioni non aggiornate], [Verificare le risposte rispetto alle fonti, controllare la gestione dei documenti e prevedere casi in cui l'assistente non possa rispondere con sicurezza.],
  [Errori nelle richieste di ferie e permessi], [Controllare autorizzazioni, dati inseriti e conferma dell'utente prima dell'invio; verificare anche gli esiti delle operazioni.],
  [Ritardi rispetto alle ore disponibili], [Suddividere il lavoro in attività gestibili, controllare regolarmente l'avanzamento e mantenere l'MVP limitato all'ambito ferie e permessi.],
)
]

I rischi saranno rivalutati durante il progetto, in modo da intervenire se dovessero influire sui tempi, sui costi o sulla qualità del prodotto.


= Preventivo dei costi

Il costo preventivato è calcolato moltiplicando le ore assegnate a ciascun ruolo per la relativa tariffa oraria, secondo i valori previsti dal regolamento del progetto didattico per l'anno accademico 2026/2027.

#text(size: 10pt)[
#table(
  columns: (1fr, 3cm, 2.5cm, 2.8cm),
  align: (col, row) => if col == 0 { left + horizon } else { center + horizon },
  stroke: 0.5pt + rgb("#b5b5b5"),
  inset: 6pt,
  fill: (col, row) => if row == 0 { rgb("#e5e7eb") } else { none },
  [*Ruolo*],
  table.cell(align: center + horizon)[*Costo orario*],
  table.cell(align: center + horizon)[*Ore totali*],
  table.cell(align: center + horizon)[*Costo totale*],
  [Responsabile], [30 €/h], [—], [—],
  [Amministratore], [20 €/h], [—], [—],
  [Analista], [25 €/h], [—], [—],
  [Progettista], [25 €/h], [—], [—],
  [Programmatore], [15 €/h], [—], [—],
  [Verificatore], [15 €/h], [—], [—],
  [*Totale*], [—], [—], [—],
)
]

Per un gruppo di sette componenti, il regolamento richiede un costo minimo di 12.000 €. L'importo accettato all'aggiudicazione costituirà il limite massimo di spesa per lo svolgimento del progetto.


= Assunzione degli impegni

Il gruppo RickandCommit si impegna a svolgere le attività necessarie alla realizzazione del progetto C2 – NEXUM Concierge, proposto da Eggon S.r.l., nel rispetto degli impegni orari individuali e del preventivo economico riportati nel presente documento.

Ogni componente si impegna a svolgere il monte ore produttive preventivato nella tabella di ripartizione, nel rispetto dei ruoli e delle responsabilità assegnati. Le attività saranno pianificate e rendicontate durante lo sviluppo del progetto, a partire dall'aggiudicazione dell'appalto.

Il monte ore complessivo preventivato è pari a *[TOTALE ORE]* ore produttive.

Il costo complessivo preventivato per la realizzazione del progetto è pari a *[IMPORTO] €*.

La data ultima prevista per la consegna del prodotto finale è fissata al *[DATA CONCORDATA]*.

