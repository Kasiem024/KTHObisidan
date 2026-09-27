---
name: write-flashcards
description: How to author spaced-repetition flashcards in this vault so they are actually memorable - practise the response the exam asks for, one fact per card, the right separator, no duplicates, no damage to existing review data. Use when adding or improving flashcards in a course note, filling a gap against a concept list, or reviewing cards someone else wrote.
---

# Writing flashcards

Two things decide whether a deck works. The **scheduler** (FSRS, in
`obsidian-spaced-repetition`) is already solved and must never be touched. The **wording of each
card** is what is left, and it decides how much every future review costs. In this vault the cards
are authored by an agent, not by the student — see `references/evidence.md` §20 for what that costs
and why it is accepted.

This skill is the wording part, plus the mechanics specific to this vault.

Read first, do not re-derive:

- `Meta/Vault Standard.md` §4 — card syntax, `## Flashcards` placement, concept-collection notes.
- `.kiro/steering/conventions.md` §1 — the four separators are **not interchangeable**, and
  `<!--SR:-->` is live review data. Rewriting either silently destroys a deck.
- `references/formulation.md` (this skill) — the reasoning, worked Swedish examples, and the
  observed failure data from this vault.
- `references/evidence.md` (this skill) — which of the rules below are **measured** and which
  are practitioner heuristic, with effect sizes and the caveats that limit them. Read it before
  defending a rule to the author.

Each rule below is tagged `[measured]`, `[indirect]`, `[contested]`, `[heuristic]` or `[vault rule]`.
Do not present a `[heuristic]` as a finding, and do not quietly drop one either — they are the field's
best practice.

## Procedure

1. **Read the exam questions first, then the source, and card only what the source says.** Where
   the course publishes its exam questions — `<course>/Filer/Canvas/`, read-only — read them
   *before* the chapter and scope the deck to them. They are the specification; the chapter is the
   source of grounded answers, not the scope. Check the KursPM in the same folder for the
   examination form, because an oral exam and a written one need differently shaped cards. The
   reasoning is in `.kiro/steering/product.md` — do not re-derive it. Then name the chapter and
   read it in full before writing anything. Course literature lives in
   `<course>/Filer/Litteraturlista/` — readable, never
   editable. Every card must be traceable to a specific passage: if you cannot point at the sentence
   it came from, it does not go in. Nothing from your own memory of the subject, no matter how
   confident — that is how a plausible falsehood enters a deck that is then memorised on purpose.
   Never invent exam guidance (`conventions.md` §5). Where the book and your recollection disagree,
   the book wins; where the book is silent, the card does not exist.
2. **Check for duplicates in this course's own decks before writing.** Grep the course's
   `Anteckningar/` flashcard notes for the term — `**Term**` and the bare word — rather than the
   whole vault. A hit in **another course's** notes or in a `Begrepp/` note is **not** a reason to
   skip the card: each course's `Anteckningar/` decks must answer that course's exam questions
   without depending on any other course's notes, because the author drops a deck when the course
   ends (`.kiro/steering/product.md`). Duplication across courses is acceptable and often required;
   duplication **inside the same course's decks** is still waste, one fact reviewed twice per cycle
   for nothing. F61 undid duplication among **concept notes**, where one shared copy is still the
   right shape, and 23 duplicates that sat inside a single note; it does not govern flashcard decks
   and its precedent must not be extended to them.
3. **Decide what each card tests** — one fact, one direction. See the tables below.
4. **Write in Swedish**, matching the surrounding notes, deriving the content from the source
   rather than paraphrasing your own summary of it. Technical terms may stay English, and giving the
   English term in parentheses is the house style for a concept whose literature is English.
5. **Place the cards** in the section they belong to, or add a new `##` section if the topic is
   new. Cards go after the existing cards of that section. If the note has a `## Flashcards`
   heading it must stay **last** — the audit checks this (`flashcardsNotLastSection`).
6. **Verify.** Counts before and after, then the audit. Commands at the bottom.
7. **Report what each card came from.** Not in the note — the vault's cards carry no citations — but
   in the summary to the author: which chapter sections are now covered, which are deliberately not,
   and any place the source was ambiguous. That report is the only thing standing between a wrong card
   and a memorised wrong fact.

## Which separator

The meanings are in `conventions.md` §1. This is the *choice*:

| Card intent | Separator | Why |
|---|---|---|
| Term → definition, where you must be able to **produce** the term, not just recognise it | `;;` | Reversed: generates a back-to-front card too. The backward direction is **not** free for semantically related pairs — testing one direction barely helps the other (Popov et al. 2019; direction-changed transfer `d = 0.41–0.55` on pairs, none on triplets, Rickard & Pan 2020). So this is genuinely two cards of work, and worth it only when production is required. |
| A question with reasoning in the answer ("Varför…", "Vad skiljer…") | `::` | One-directional. The reverse of a *why* question is meaningless. |
| A short list, 2–4 items, answer needs multiple lines | `\|\|` | Multi-line, one-directional. Put the item count in the prompt as a completeness cue: `... ? (3)`. |
| Both directions **and** multi-line | `??` | Rare here. Prefer splitting into separate cards. |

Default to `::`. A `;;` card is two cards of work — justify it.

## What cards are for — and what they cannot do

Cards carry **facts, definitions, mechanisms, distinctions and classifications**. They do not teach a
**multi-step calculation procedure**, and trying is measurably worse than the alternative: students who
only studied worked examples of circuit troubleshooting scored 70 % a week later, while those who
alternated examples with practice problems scored 51 % (`d = 0.66` *against* testing, van Gog & Kester
2012). Pan & Rickard's meta-analysis independently found transfer weakest for worked-example problems.

So for subnet arithmetic, throughput and delay calculations, complexity derivations or a protocol
worked as an exercise: study a worked example, then solve real problems. A card can hold *when* to
apply a method and *why* it works — it cannot practise carrying it out. See `references/evidence.md`
§11 for the boundary and its caveats.

## Rules for the card itself

Rule 1 is the only one with strong direct backing, and it is the one most often skipped.

1. `[measured]` **Practise the response the exam will ask for.** Retrieval practice transfers to new
   questions at `d = 0.40`, but corrected for publication bias that falls to roughly zero unless the
   practised response resembles the required one (Pan & Rickard 2018, meta-analysis). A deck of
   definition cards trains producing definitions. KTH exams ask what happens, what breaks and which
   mechanism applies — so a topic needs *why* and *what-if* cards, not only terminology.
2. `[heuristic]` **One fact per card.** If a card can fail for two independent reasons, split it.
   Nothing in the corpus compares one compound card against several atomic ones, so this is best
   practice rather than a finding. Its indirect anchors: a card failed during practice still gets
   learned but does not transfer (Butler 2010), and effects grow more robust as success rises above
   ~75 % (Rowland 2014) — atomising is how you raise a card's success rate.
3. `[heuristic]` **The prompt must uniquely determine the answer.** If two answers are defensible,
   grading becomes noise and the scheduler is fed noise with it.
4. `[contested]` **Make the answer be produced when the point is understanding; a gap is enough when
   the words are the point.** Fill-in-the-blank practice retained the exact terms it tested but gave
   no advantage on reworded transfer questions, where free recall did (Hinze & Wiley 2011). Claim no
   more than that: short-answer versus multiple-choice measured `d = 0.07` in one controlled
   comparison, and Adesope et al.'s meta-analysis found multiple-choice *stronger*. What is supported
   is feedback, more than one test, and matching the response form (rule 1).
5. `[indirect]` **Mark exactly one phrase with `==…==`.** An isolated element is remembered better
   (`d = 0.27–0.31`, Siefke et al. 2019) **and the unmarked material around it is remembered worse**,
   because it captures attention (Geraci & Rajaram 2004, `t(51) = 2.85` on the priming difference).
   Both studies manipulate colour or semantic category in **word lists**, not markdown emphasis, so
   take the direction and not the magnitude — `references/evidence.md` §21 still lists markdown
   emphasis as unmeasured. The highlight sits on the one phrase that must be produced, and the rest
   of the answer must be context you do not need verbatim. Two things that both have to be recalled
   are two cards. Highlighting everything destroys the effect.
   **On a `||` list card, use no highlight at all** — every item is a recall target, so a bold label
   per item is the equivalent, and marking one item would suppress the others.
6. `[heuristic]` **Answers stay one to two sentences.** A long answer cannot be graded honestly, and
   grading is what the whole mechanism rests on — the testing effect vanished entirely in a
   low-engagement population (Sigayret et al. 2026).
7. `[heuristic]` **No yes/no or binary prompts** — a 50 % guess rate teaches nothing.
8. `[measured]` **Avoid big enumerations, and never hide several facts in prose.** "Nämn alla åtta
   former av X" is eight facts, an ordering and a completeness check graded as one item. Where a list
   is genuinely the unit of knowledge, keep it to 2–4 items with `(N)` in the prompt, and add separate
   cards for the individual items. Rearranged stimulus–response sets showed no transfer at all, which
   argues for per-item cards.

   **This rule moved from `[heuristic]` to `[measured]` on 2026-09-26**, against the author's own review
   data. Within each deck — so deck age cannot explain it — cards with three or more list rows scored
   higher FSRS difficulty than single-fact cards in the same deck: HI1031 chapter 11 9.7 against 6.8,
   chapter 16 8.4 against 3.5, chapter 1 9.8 against 8.6, and HI1032's lab deck 9.9 against 8.6. Four
   decks of four, same direction, with chapter 2 pointing the same way on a sample too small to quote.
   Five-row lists are the worst form measured anywhere in the vault (chapter 1: 9.88). The four cards
   left unlearned in chapter 11 were its four largest list cards, one of them shown **21 times**.

   **The subtler case is a prose card that hides two facts**, and the author named it himself:

   > Kolla också på kort som kan omvandlas till listkort men som inte är det. Exempelvis kortet "vad är
   > problemet med att låsa alla objekt när transaktionen startar" den borde vara ett list kort med 2
   > rader, men den är inte det.

   That card announced *"Två saker."* and then buried both in a sentence. **98 of HI1031's 401 cards had
   that shape.** Their difficulty was *low*, which is the trap: a hidden multi-fact card is easy to pass
   on half the answer — you recall one fact, feel right, press Good — so the number says healthy while
   the card teaches one of two things. Making the two facts two visible rows removes the false pass.
   That reading is a hypothesis the data cannot settle, and it is the reason to follow the instruction
   anyway.

   **So apply this order, and the first step comes first:**
   1. No exam question needs the card → delete it. Most hidden multi-fact cards die here.
   2. Both facts are needed → one `||` list card, `(N)` in the prompt, a bold label per row, no
      `==highlight==` anywhere in the body.
   3. Only one fact is needed → cut the other and leave a single-fact `::` card with one highlight.
   4. Never more than four rows. `Test-DeckHygiene.ps1` checks 1 through 4 mechanically except the
      judgement in step 1.
9. `[indirect]` **Count how many cards share a cue.** There is no threshold for how *similar* two
   prompts may be — the mechanism is cue overload: the more answers hang off one cue, the slower
   retrieval gets, measured as latency rising by fan level (1367 → 1465 → 1501 ms, Radvansky &
   Copeland 2006). That study reports **latencies, not accuracy**, and fan 3 was simply the highest
   level it tested, so "three or more" is a working threshold rather than a measured cliff. What the
   rule asks for is cheap regardless: before adding a card that opens like an existing one, or that
   leads with an already-used bolded term, grep for it and make sure the prompts diverge on the word
   that decides the answer. `**Tillgänglighet** (availability, som mått);;` versus the
   security-property sense is this vault's worked example of splitting an overloaded cue.
   **The rule binds within one course.** Two prompts sharing a cue in *different* courses' decks
   are accepted where self-containment requires the card in both (step 2). Where those courses run
   in the same term the fan cost is real, and the author has taken it deliberately rather than
   leave the only copy in a deck he will drop.
10. `[heuristic]` **Understanding comes first.** Cards consolidate what is already understood; they
    teach a concept poorly. The definition belongs in the note, then the card.
11. `[vault rule]` **Never rewrite the meaning of a card that has `<!--SR:-->` history.** The schedule
    was earned by the old question. Add a new card and leave the old one alone; keep the marker on the
    line it belongs to, byte-identical.
12. `[vault rule]` **Never delete or reword an existing card, with or without history, and never
    change a note's `nosr` tag.** Both are the author's decisions. This rule exists because it was
    broken: on 2026-09-06 a rewrite of HI1031 Kap 02 silently removed 15 of the 22 cards the note
    already had — one of them, `**Arkitekturmodell**`, with no replacement anywhere in the vault — and
    added `nosr`, taking all 87 new cards out of review against the author's recorded decision in F64.
    Neither was declared; both were found by an outside reviewer diffing the file against `HEAD`.
    A note that is "rewritten from scratch" is a deletion of everything in it. Rework a deck by
    **adding** cards, and list what you would remove in the report instead of removing it. Two hooks
    now enforce the `nosr` half and the marker half; nothing enforces the rest, so it is on you.
    **The author may lift this rule, and did.** On 2026-09-06 he instructed a full rewrite of
    HI1031 Kap 02 and the removal of its `nosr` tag, in as many words. What the rule protects is
    **who decided**, not the edit itself — so an author-authorised deletion is fine and gets
    recorded in the report; an agent deciding for itself is what F69 is about. If you are not
    quoting an instruction, you do not have one.
13. `[measured]` **Keep testing a card; do not retire it and do not settle for re-reading it.**
    Karpicke & Roediger 2008: after the first correct recall, items kept in *testing* scored ~80 % a
    week later whether or not they were restudied, while items kept in *study* but dropped from
    testing scored ~36 %. Suspending or deleting a card you have started to remember is the losing
    condition of that experiment; re-reading the note instead of reviewing the card is the same
    mistake in another form. Scoping a deck to a course's relevant material with `nosr` is a different
    decision, and not one to make silently.
14. `[indirect]` **Put a diagram on a card only when the diagram is what must be recalled** — a
    message sequence, a layer stack, a state machine. Words plus a relevant picture beat words alone
    (`d = 1.39`, Mayer), but *removing* decorative graphics is itself one of the larger effects
    (`d = 0.97`), so an image that is merely interesting makes the card worse. Keep the label beside
    the part it names, and follow the alt-text rule in `Meta/Vault Standard.md` §4. The evidence is
    from multimedia lessons, not cards.
15. `[vault rule]` **Everyday Swedish, and few cards.** Stated by the author on 2026-09-09 after
    reading seven chapters of generated material: the language was "för komplicerat och vetenskapligt",
    there were "alldeles för många kort", and the scope was probably "för brett". Three things follow,
    and they override any instinct to be complete:
    - **Write the card the way you would say it.** Technical terms stay — they are the exam's
      vocabulary. Academic register around them goes: *skillnaden* not *distinktionen*, *bygger på*
      not *vilar på*, *gör att* not *medför att*. A card he would not read aloud to a classmate is
      badly worded.
    - **A small deck he drills beats a complete one he abandons.** Card count is a **cost**. Before
      adding a card, name the exam question it serves; if you cannot, it does not go in. Two cards
      that both help a bit are worse than one that helps.
    - **Calibration.** Chapter 9 reached 184 cards and chapter 10 144 before this instruction; those
      are the numbers he objected to. Chapter 5's 102 was accepted earlier but is not a target
      either. The target agreed on 2026-09-09 was **40–60 cards per chapter deck**, and it was
      **superseded on 2026-09-26** — see `product.md`. The rule is now "as few as possible, as
      concentrated on the exam questions as possible", and **40 is not a floor**. HI1031's ten decks
      were reworked on that basis and landed at 15 to 29 cards each, 219 in total against 401. Cut
      every card no exam question needs and then report the number; do not pad to reach a range.

    This rule and rule 8 point the same way, and this one is stronger: where they conflict, cut.

## Beyond the card: what decides whether the deck pays off

Wording is only half of it. These four are the highest-value findings in
`references/evidence.md`, and none of them are about authoring:

- **Always read the answer, even after a lapse.** A failed retrieval followed immediately by the
  answer builds memory better than studying alone; the benefit disappears if the answer is not
  seen right away (Grimaldi & Karpicke 2012).
- **Review what is due, do not drill one chapter.** Interleaved practice scored 63 % versus 20 %
  a week later on new problems, while blocked practice scored higher *during* the session
  (Rohrer & Taylor 2007). Fluency in a blocked session is not learning, and learners
  consistently misjudge this.
- **Three or more spaced sessions per concept, and that sets a deadline for authoring.** The
  protocol behind the results above is: at least three sessions, each continued until every item has
  been recalled correctly once, sessions at least a day apart and spaced at **10–20 % of the
  interval to the exam** (APA and UNH guides). For an exam three months out that is a 9–18 day gap —
  which FSRS produces on its own, but only if the card exists early enough to get three of them. A
  card written the week before the exam cannot reach the protocol. Write cards as the course runs.
- **A confident mistake is the most valuable review of the session.** High-confidence errors are
  corrected more easily than low-confidence ones (`d = 0.46`, Metcalfe & Finn 2011). When you were
  sure and wrong, read the answer properly — and do not suspend that card, it is about to be
  learned.
- **Grade honestly.** The testing effect vanished entirely in a low-engagement online population
  (Sigayret et al. 2026).

## Anti-patterns

| Anti-pattern | Fix |
|---|---|
| Definition copied verbatim from a term list | Reformulate as a prompt whose answer is the key phrase, with `==…==` on it |
| One card carrying a definition *and* an example *and* a consequence | Split into two or three |
| Two cards whose prompts read almost the same | Add the distinguishing context to each prompt |
| A list card of 8+ items | Keep the list card if it is a real unit, and add per-item cards |
| `;;` used by default | Switch to `::` unless the reverse direction is genuinely needed |
| A new card duplicating one in another deck of the **same course** | Do not add it; note where it already lives |
| A card this course's exam needs, left out because another course's deck already has it | Add it. That deck is dropped when its course ends, so the only copy would be one the author never reviews again |
| A card that keeps failing is left as it is | It is producing no transfer at all — split it, add a distinguishing cue, or rewrite it as a new card |
| A topic covered only by definition cards | Add at least one card that asks what happens / what breaks, so the practised response matches the exam's |
| A card stating something the source does not say | Delete it. Plausibility is not grounding, and a wrong card gets memorised on purpose |
| A card that teaches a calculation procedure | Not a card — see "What cards are for" |
| A card worded in academic register — *distinktionen*, *vilar på*, *medför att*, *således* | Rewrite it the way you would say it out loud. Keep the technical term, drop the register (rule 15) |
| A prose card that announces "två saker" and then buries both in a sentence | Make it a `\|\|` list card with `(2)` and one bold label per row — or cut the fact no exam question needs. 98 of HI1031's 401 cards had this shape (rule 8) |
| A list card with five or more rows | Split it or cut rows to four. Five-row lists are the hardest form measured in this vault, FSRS difficulty 9.88 (rule 8) |
| A card that is true and in the chapter but serves no exam question | Cut it. Not shorten it — cut it. Card count is a cost the author pays in review time (rule 15) |
| A deck that grew past ~100 cards for one chapter | Name the exam question behind every card and delete the ones with no answer. 184 and 144 were both rejected by the author |
| Cards generated by NotebookLM's Studio pasted into a note | They follow none of this vault's conventions — separator choice, one `==…==`, exam-shaped prompts — and cannot be exported anyway. Use them as a *coverage check*: generate questions from the chapter and see which ones the deck cannot answer |

## Verify

Count the markers in the file **before** editing and again after. Only the counts you
deliberately changed may move, and `<!--SR:` must be identical:

```powershell
$p = "<file>"
$enc = New-Object System.Text.UTF8Encoding($false)
$t = $enc.GetString([System.IO.File]::ReadAllBytes($p))
foreach($m in '<!--SR:', '::', ';;', '\|\|', '\?\?'){ "$m = " + ([regex]::Matches($t,$m)).Count }
```

Then, in order:

- `Test-DeckHygiene.ps1 -Course <CODE>` → `RESULT: clean`. This is the only check that looks at a
  card's **shape**: an orphaned separator, a list with fewer than 2 or more than 4 rows, a
  `==highlight==` inside a list body, a missing `(N)` cue, a marker not sitting under a complete card,
  an answer without exactly one highlight. A card count cannot see any of them — delete one card and
  add one and the total is unchanged while the deck holds a question with no answer. Run `-SelfTest`
  once if you have not seen it fire; a zero from a blind check is not a pass.
- `git diff --numstat -- "<file>"` — proves you touched only what you meant to. A whole-vault
  total cannot: another agent or a phone review changes this vault mid-session
  (`.kiro/steering/environment.md`). **Set `[Console]::OutputEncoding` to UTF-8 first** or the path
  comes back mis-decoded and the diff reports nothing at all (traps T2).
- Line endings and BOM unchanged. Editing tools may introduce a stray `CRLF` into an LF file;
  count carriage returns in the decoded text before and after:

  ```powershell
  ([regex]::Matches($t, "`r")).Count
  ```
- `cmd /c "npx markdownlint-cli2 **/*.md"` → 0 issues. Pass the glob **unquoted** through
  `cmd /c` and read the `Linting: N files` line: `N` must be non-zero and match the file or files
  you meant to check. A quoted glob globs the quotes, prints `Linting: 0 files` and exits **0** —
  a clean-looking pass that checked nothing (traps T11). Exit code alone is not proof.
- `powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"`
  → `RESULT: clean`. Run it **last**, after every edit.

For a sweep across many notes, this skill is not enough — use `vault-bulk-edit`, which adds
dry runs, backups and `Get-SRIntegrity.ps1` fingerprints.
