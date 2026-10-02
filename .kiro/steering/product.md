---
inclusion: auto
description: What this vault is, who it serves, and what the author is optimising for. Read before generating any study material - the goal is passing the exam, not covering the book, and that changes what "good" means.
---

# Product — KTH Obsidian Study Vault

## What it is

A personal Obsidian vault of university coursework for one student on KTH's
**Högskoleingenjör – Teknik och Ekonomi** programme (IT/computer engineering with an
economics track). Around 516 interlinked Markdown notes across 23 courses and six terms.

It is two things at once, and both matter:

1. **A study tool in Obsidian** — concept notes, lecture notes, exam-question sets, and an
   active spaced-repetition deck reviewed with the obsidian-spaced-repetition plugin.
2. **A published website**, built with Quartz from these same files and served at
   <https://kasiem024.github.io/KTHObsidianQuartz/>. The site repo is separate; this vault
   is its `content/` submodule.

**The note content is written in Swedish.** Technical terms are often English. Answer in
Swedish when discussing the study material.

## Who uses it

One student, as the sole author. There is no collaboration workflow, no review process and
no multi-user concept. The published site is public but is a by-product of studying, not a
blog with an audience to serve.

## What the author is optimising for

**Passing the exam, not covering the book.** Stated by the author on 2026-09-06 and recorded
here because it changes what "good" means for study material generated in this vault:

> my goal isn't to learn the chapters and coursebook as a whole, it's to pass the exam.

So where a course publishes its exam questions, **those questions are the specification** and
the course literature is a source of grounded answers to them, not the scope. Content that is
correct, in the chapter, and not needed for any exam question is waste — it costs review time
that the examinable material should be getting.

The concrete test for anything you generate: *if the author practised only this, could they
answer the exam questions cold?* Aim for exactly that, and no wider.

**A finished course's deck is dropped, not reviewed.** Also stated on 2026-09-06:

> i dont actually mind duplicate cards that much. i dont practice old decks at all, once i'm
> done with a course then i drop that whole deck. therefore each deck for a course needs to be
> self contained.

So each course's `Anteckningar/` flashcard decks — the `<CODE> Begrepp - Kap NN ...` notes he
drills during exam prep — must between them answer that course's exam questions **without
depending on any other course's notes**. Duplication across courses is therefore acceptable and
often required, and duplication with a `Begrepp/` concept note is acceptable too: `Begrepp/` is
reference material that happens to carry a card, is shared across courses, and counts toward
self-containment in neither direction. Duplication **within one course's decks** is still waste.
Where two courses run in the same term — HI1031 and HI1032 both do in 2026 Höst — a cross-course
duplicate genuinely is reviewed twice; that cost is accepted, so do not optimise it away. The
authoring consequence is in `.kiro/skills/write-flashcards/SKILL.md` (step 2, rule 9 and the
anti-pattern table).

Where the exam questions live, per course, when they exist at all:

| Course | Exam questions |
|---|---|
| HI1031 | `KTH/2026 Höst/HI1031 .../Filer/Canvas/Tentor/Tentafrågor HI1031 Distribuerade informationssystem.md` (per chapter). That file is the complete one, and it is the specification. |

**Two files in that folder look like more exam material and are not.** Checked on 2026-09-26 because
this table used to claim an old exam existed:

- `Filer/Canvas/AI-optimerad Markdown/Tentor/HI1031-20192.md` is the **kursplan** from HT19 — the
  syllabus, with `Lärandemål`, `Kursinnehåll` and the examination form. Its own frontmatter says
  `Born-digital official kursplan`. It is filed under `Tentor/` and named like an exam, which is why
  this doc asserted for weeks that the course had a past paper to practise against. **It has none.**
  The file is still worth reading: one of its learning objectives is *"Kunna kritiskt analysera,
  diskutera och jämföra olika distribuerade metoder och modeller"*, so comparison is examinable in its
  own right, which is why the decks carry comparison cards and not only definitions.
- `Filer/Canvas/AI-optimerad Markdown/Tentor/Tentafrågor_ HI1031 HT26 ... (10321).md` is a **truncated
  duplicate** of the question list. It stops mid-way through chapter 4 question 2 while its own
  frontmatter claims *"Body text checked complete against the PDF text layer"*. Use the other file.

That folder is `Filer/Canvas/` — third-party Canvas downloads, gitignored and out of the
audit's scope (`Meta/Vault Standard.md` §4). **Read it; never edit it.** It also holds the
KursPM, which states the examination form: HI1031's is a **muntlig enskild examination**, so
cards for it must train speaking an answer, not recognising one.

Two consequences worth stating, because both have already been got wrong:

- **Narrow does not mean shallow — but short is the default.** A question worth real marks needs the
  mechanism, the tradeoff and the failure mode, because an oral examiner asks the follow-up. Cutting
  scope is cutting *topics*, not cutting depth within a topic. Read this together with the section
  below, which the author added later and which sets the default to **short**: depth is for the
  mechanism that answers the question, not for everything true about it.
- **A gap is reported, never filled from memory.** When an exam question has no source in the
  course material, say so and name what is missing. Inventing a plausible answer to close the
  gap puts a possible falsehood into a deck that is then memorised on purpose. See
  `.kiro/skills/write-flashcards/SKILL.md`.

### Everyday Swedish, fewer cards, shorter notes

Stated by the author on 2026-09-09, after reading seven chapters of generated exam-prep material:

> jag tycker att språket du använder är för komplicerat och vetenskapligt. jag vill att språket du
> använder ska vara mer vardagligt. det är okej att använda facktermer. […] jag tycker både att det är
> alldeles för många kort, jag föredrar ett litet antal kort och att varje kort ska vara kort och
> formulerat vardagligt. det kan vara så att vårt scope är för brett.

Four instructions, all binding on generated study material:

1. **Everyday Swedish.** Short words, short sentences, the way you would say it out loud.
   **Technical terms are fine** — they are the vocabulary of the exam. What is not fine is academic
   register around them: prefer *skillnaden* over *distinktionen*, *bygger på* over *vilar på*, *så*
   over *således*, *gör att* over *medför att*, *visar* over *påvisar*. If a plainer word exists, use
   it. Do not write a sentence you would not say to a classmate.
2. **Few cards.** A small deck the author actually drills beats a complete one he abandons. Card
   count is a cost, not a coverage score.
3. **Short cards, worded plainly.** One fact, one or two lines, everyday phrasing.
4. **Narrower scope.** In his words: *"om det inte är direkt relaterat till [tentafrågorna] så är det
   irrelevant."* Content that is correct, in the chapter, and not needed for an exam question is
   **waste** — cut it, do not merely shorten it.

For calibration on what counted as too much: the decks produced before this instruction reached **184**
cards for chapter 9 and **144** for chapter 10, against 102 for chapter 5. Those are the numbers the
author called "alldeles för många". Aim well below them.

**The agreed targets, confirmed by the author on 2026-09-09:**

| | Target | What it replaced |
|---|---|---|
| Cards per chapter deck | **40–60** | 100–184 |
| Lines per exam-answer note | **150–250** | 600–750 |

**The line figure is not reachable for a chapter with five or six exam questions, measured
2026-10-01.** It is kept above because it is what was agreed, but do not cut mechanism to reach it.
HI1031's five reviewed notes were cleaned of everything no exam question needed — product names, API
names, company lists, case-study internals, cross-chapter side-tracks — and still landed at 308, 232,
375, 317 and 343 lines. Expressed per exam question that is **51 to 75 lines**, and per separate
*ask* within a question **29 to 47**. Chapter 4 sits at 51 lines per question, below the ~52 that an
earlier project measured as the stable minimum for a single-part question, so it is already as tight
as a question can be answered. Six questions times that minimum is 312 lines before a word of
padding.

So **quote lines per exam ask, not lines per note**, and treat a note above 250 as a finding only if
some paragraph in it cannot be tied to a named exam question. The three things that make up the
remainder are all protected: `### Muntligt svar` is a quarter of every note and its structure is the
author's own decision; the book's comparison figures *are* the answers to the "jämför" and "skillnad"
questions; and mechanism, tradeoff and failure mode have to survive because the examination is oral.

**The card figure was superseded on 2026-09-26.** The author narrowed it further, and the new rule is
not a range:

> min prioritet är att lära mig det som finns i tentafrågorna. jag har inte tid att lära mig saker som
> är orelaterade och väldigt komplicerade koncept. därför är det viktigt att du försöker hålla antalet
> kort så lågt som möjligt och så koncenterat till tentafrågorna som möjligt.

So **40 is not a floor to fill up to.** Cut every card no exam question needs, then report the number.
HI1031's ten decks were reworked on that basis and landed at 219 cards against 401 — between 15 and 29
per chapter, all ten below the old range, and every remaining card traceable to a named exam question.
Do not pad a deck to reach 40; do not quote 40–60 as a requirement.

**And the author's own diagnosis of what makes a card hard, same day:**

> jag har svårt att komma ihåg djupa detaljer och termer, men det är enklare att komma ihåg om det är
> mer översiktligt.

Measured against his review data and confirmed within every deck that had enough of one, a card carrying
several facts is the hard form: HI1031 chapter 11 scored FSRS difficulty 9.7 on cards with three or more
list rows against 6.8 on single-fact cards, chapter 16 scored 8.4 against 3.5, and the same direction
held in four decks of four. His worst card in the vault — cipher suite's three components with an example
each, so six facts — had been shown **21 times without being learned**. The authoring consequence is in
`.kiro/skills/write-flashcards/SKILL.md` rule 8 and rule 15, and `Test-DeckHygiene.ps1` now checks the
countable part.

### No card whose answer is an address, a mask or an ID

Stated on 2026-10-01, when asked for more cards about HI1032's lab 5 topology:

> jag är inte intresserad av att memorisera specifika adresser

This is the previous instruction made specific, and it is binding on every deck. **A card whose answer
is an IP address, a subnet mask, a wildcard mask, a router ID or an interface address should not exist.**
Protocol constants are fine — a well-known port, HSRP's multicast address, OSPF's protocol number — they
are vocabulary, not lab trivia.

What to write instead is the **shape and the consequence**: which devices exist and what role each plays,
what an interface faces rather than what it is numbered, why two gateways share one segment, what breaks
if a client points at the wrong gateway. For a lab, the richest material is usually the lab's own
acceptance criterion — which tests must fail, and why.

This is not only a rule for new cards. Applying it to HI1032's lab 5 deck on the day it was stated
**removed five existing cards and reworded five more**, because the deck predated the instruction. Expect
the same in any deck written earlier, and check whether a removal orphans a concept: the method for
calculating a wildcard mask has to survive even when that lab's particular masks go.

**Keep the note structure as it is: facts first, `### Muntligt svar` last.** This was queried and the
author rejected changing it, and the reason is his study method, so do not "improve" it later:

> gällande strukturen så tror jag att den nuvarande är bra, jag kommer ändå skriva ner faktan först,
> det är hela poängen med hur jag lär mig jag skriver ner det du skriver och jag strukturerar det jag
> skriver ner baserat på viktiga begrepp

He copies the facts out by hand and organises **his own** notes around the key concepts as he goes. So
the note is raw material for that pass, not a script to read aloud. Leading with talking points would
break the thing that makes it work. The shortening therefore comes out of **scope and wording**, never
out of the structure.

The authoring consequences are in `.kiro/skills/write-flashcards/SKILL.md` — rule 15 and the
anti-pattern table.

## What is in it

| Path | Contents |
|---|---|
| `KTH/<Year Season>/<CODE Course>/` | All coursework, four fixed category folders per course |
| `Atlas/` | Subject MOCs, `Dashboard`, `Vault Health Report`, `Tenta-prioritering` |
| `Meta/` | The standard, the change log, templates, the audit script. Not study content |
| `llms.txt` | Entry point for AI tools: structure, tags, and how to read Obsidian syntax |
| `index.md` | Landing page for the published site |

## What matters most

**Uniformity.** This vault is deliberately, aggressively consistent: one tag vocabulary,
one frontmatter shape, one folder layout per course, one concept-note structure, one
literature naming scheme. That consistency is the point — it is what makes ~516 notes
navigable and machine-readable. A change that introduces a second way of doing something
is a regression even if it looks locally reasonable.

The rules live in `Meta/Vault Standard.md` and are enforced by
`Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1`, which must report
`RESULT: clean` after any change.

## Status

Conventions are settled and the vault is clean against them. The change log in
`Meta/Vault Findings & Backlog.md` runs F1–F87: all closed except F10 (parked). Both the audit and
the linter run automatically on every push via `.github/workflows/vault-checks.yml`.

Remaining work is content the author must write — chiefly `## Tenta-fokus` sections, present on
42 of the 396 concept notes, prioritised in `Atlas/Tenta-prioritering.md`.

## What it is not

- Not a shared or collaborative knowledge base.
- Not a blog or a publication with an editorial calendar.
- Not a place for work notes. `Ericsson/` exists but is empty and out of scope.
- Not a general note-taking system — it is coursework for one degree programme.
