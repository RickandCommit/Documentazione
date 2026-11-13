#import "../../../.github/template/template.typ": *

#show: verbale.with(
  titolo: "Verbale del Quarto Incontro",
  tipo: "Verbale Interno",
  data: "2026-11-04",
  versione: "v0.2.0",
  ultima-modifica: "2026-11-12",
  ora-inizio: "15.00",
  ora-fine: "16.00",
  modalita: "Discord",
  stato: "In redazione",
  redattore: "Nicola Bonetto",
  verificatore: "Sara Stefani",
  esito-verifica: "In attesa"
)

// ==================== REGISTRO DELLE MODIFICHE ====================
#registro-modifiche(
  table.cell(align: center)[0.2.0], table.cell(align: center)[2026-11-12], [Modificate "Normativa di Progetto" in "Norme di Progetto"], [Nicola Bonetto], [Sara Stefani],
  table.cell(align: center)[0.1.0], table.cell(align: center)[2026-11-04], [Stesura iniziale del verbale], [Nicola Bonetto], [Sara Stefani],
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

+ Contatti con Eggon: operazioni preliminari e canale Telegram
+ Revisione della valutazione della candidatura
+ Glossario e Norme di Progetto (_Way of Working_)
+ Aggiornamento dei README del repository e del progetto
+ Divisione ufficiale dei ruoli e politica di rotazione
+ Sistemazione della firma e-mail e mail di test al professore

// ==================== 3. SVOLGIMENTO DELLA RIUNIONE ====================
= Svolgimento della riunione

== Contatti con Eggon

Il gruppo ha stabilito di contattare Eggon per fissare un *incontro conoscitivo* con l'obiettivo di iniziare formalmente la collaborazione ed aprire i canali di comunicazione (Telegram).

Il referente ha dato la disponibilità per incontri periodici, settimanali o bisettimanali, purché fissati in un momento stabile: il gruppo proporrà alcune fasce orarie e ne discuterà durante l'incontro.

Eggon ha già chiarito nel precedente incontro che intende lasciare ampia libertà di scelta al gruppo sulle specifiche tecniche che non siano già state definite nel capitolato; anche questo sarà oggetto di confronto nella riunione.

== Revisione della candidatura e versionamento

Il gruppo ha riesaminato le valutazioni ricevute sulla candidatura. La priorità tassativa è correggere il *versionamento* prima di caricare altri documenti, perché la persistenza dell'errore alla prima revisione comprometterebbe l'esito della stessa. Dall'analisi del registro delle modifiche è emerso che la riga finale di _verifica e approvazione_, con il verificatore come unico nome, fa apparire il documento come se fosse stato verificato e approvato dalla stessa persona, senza l'approvazione del responsabile. Si è quindi deciso che l'avanzamento alla versione di rilascio _x.0.0_ sia accompagnato da una riga di approvazione con il *responsabile* come autore e nessun verificatore.

Si è inoltre deciso di aggiungere il campo *Responsabile* all'inizio dei documenti, per indicare chi ricopre tale ruolo nello sprint, e di togliere il registro delle modifiche dall'indice; entrambe sono modifiche al template. Il gruppo chiederà al docente se le correzioni vadano applicate anche ai verbali interni già prodotti.

È infine emerso che nella Dichiarazione degli Impegni la suddivisione delle ore per singolo componente risulta superflua, essendo sufficiente indicare le ore per ruolo.

== Ruoli e rotazione

Sono stati confermati gli sprint bisettimanali e la *rotazione dei ruoli con la stessa cadenza*, allineata alla fine di ogni sprint. La riunione resta settimanale, anche in forma rapida, per controllare l'avanzamento del lavoro. Le ore effettive, conteggiate a partire dall'assegnazione del capitolato, vengono registrate da ciascuno sul foglio di calcolo.

I ruoli del primo sprint della fase RTB sono:

- *Responsabile:* Francesco Furin
- *Verificatore:* Sara Stefani
- *Amministratore:* Dorde Blagojevic, che aggiorna anche il sito su GitHub Pages con la sezione RTB
- *Analista (Norme di Progetto):* Luka Lacic, per una prima stesura, anche solo interna
- *Analista (BRD e use case):* Alessandro Rasia dal Polo, per l'individuazione degli attori e dei primi use case
- *Glossario:* Jatin Bajaj, per la stesura iniziale dei termini
- *README e verbale:* Nicola Bonetto

Le scadenze provvisorie sono fissate all'11 novembre, ma si attende la revisione della candidatura prima di dare avvio ai lavori.

== Firma e-mail e flusso di verifica

La nuova firma, priva del logo e con i riferimenti al sito su GitHub Pages e alla repository, ha ottenuto un punteggio molto basso nel test antispam ed è stata recapitata correttamente nel dominio dell'Università di Padova. Verrà inviata una mail di test al professore per confermare che non finisca più nello spam.

Per le Pull Request si è ribadito che l'autore la apre solo quando ritiene il lavoro concluso; il verificatore, se trova errori, la rifiuta indicando cosa correggere. È preferibile rifiutare più volte una PR piuttosto che aprirne altre per le correzioni, e la compilazione locale di Typst aiuta a individuare problemi come le pagine bianche.

// ==================== 4. CONCLUSIONI ====================
= Conclusioni

La riunione ha ufficializzato i ruoli del primo sprint della fase RTB e confermato la rotazione bisettimanale. Le priorità sono il primo contatto con Eggon e la correzione del versionamento, a cui seguiranno le prime bozze di Glossario, Norme di Progetto e Analisi dei Requisiti.

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
  [VI\_2026-11-04.D1], [Contattare Eggon per un primo incontro conoscitivo.], [Scrivere a Eggon per proporre l'incontro.], [Francesco Furin], [2026-11-05], [—],
  [VI\_2026-11-04.D2], [Invio di una mail di test al professore con la nuova firma.], [Inviare la mail e verificare che non finisca nello spam.], [Francesco Furin], [2026-11-05], [—],
  [VI\_2026-11-04.D3], [Avvio del Glossario.], [Redigere la stesura iniziale dei termini.], [Jatin Bajaj], [2026-11-11], [#issue(58)],
  [VI\_2026-11-04.D4], [Avvio delle Norme di Progetto.], [Redigere una prima stesura delle norme.], [Luka Lacic], [2026-11-11], [#issue(61)],
  [VI\_2026-11-04.D5], [Avvio dell'analisi dei requisiti.], [Studiare il capitolato, individuare gli attori e strutturare i primi use case.], [Alessandro Rasia dal Polo], [2026-11-11], [#issue(62)],
  [VI\_2026-11-04.D6], [Aggiunta della sezione RTB al sito.], [Aggiornare GitHub Pages.], [Dorde Blagojevic], [2026-11-11], [#issue(63)],
  [VI\_2026-11-04.D7], [Aggiornamento dei README.], [Aggiornare il README del repository.], [Nicola Bonetto], [2026-11-11], [—],
  [VI\_2026-11-04.D8], [Aggiunta del campo Responsabile e rimozione del registro delle modifiche dall'indice.], [Modificare il template Typst di conseguenza.], [Dorde Blagojevic], [2026-11-11], [#issue(63)],
  [VI\_2026-11-04.D9], [Riga di approvazione con il responsabile come autore alla versione x.0.0.], [Applicare la regola ai documenti dopo la revisione della candidatura.], [Intero gruppo], [—], [—],
)
]