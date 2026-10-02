# Writing spaced-repetition flashcards — complete synthesis

> **What this file is.** A single, self-contained synthesis of everything one project learned about
> authoring spaced-repetition flashcards: the procedure, every rule with its evidence tier and effect
> size, the worked examples, the anti-patterns, and the mechanics. It is written to be read by an AI
> agent that has none of the surrounding context. It was distilled from a working skill, its two
> evidence references, and the adversarial reviews that corrected both. Where a claim is only a
> heuristic, it says so; do not present a heuristic as a finding, and do not silently drop one either —
> they are the field's best practice.

---

## 0. The frame

Two things decide whether a deck works, and they are independent:

1. **The scheduler** — *when* a card is shown. Modern tools (FSRS in the obsidian-spaced-repetition
   plugin, or Anki's schedulers) have solved this. Never touch a card's scheduling state. In the
   Obsidian plugin that state is an HTML comment, e.g.
   `<!--SR:!2026-03-17,5,186!2026-03-16,4,186-->`; it was *earned* by the exact question above it, and
   editing the question silently applies an old schedule to a new item.
2. **The wording of each card** — *what* the card says. This is the only lever left, and it decides how
   much every future review costs. A badly worded card fails repeatedly, so the scheduler shows it more
   often, so it eats the review time that correctly worded cards would have had.

Everything below is about problem 2.

**Evidence tiers used throughout:**

| Tag | Means |
|---|---|
| `[measured]` | Direct empirical support with an effect size, quoted here |
| `[indirect]` | Supported by a measured effect in an adjacent paradigm (e.g. word lists, not cards) |
| `[contested]` | Studies in the literature disagree; do not assert a direction |
| `[heuristic]` | Practitioner best practice, no measurement behind it. Still worth following |
| `[rule]` | A project/convention rule, not an empirical claim |

---

## 1. Procedure

1. **Read the exam questions (or the real target) first, then the source, and card only what the source
   says.** Where a course publishes its exam questions, they are the *specification*; the chapter is the
   source of grounded answers, not the scope. Check the examination form — an oral exam and a written
   one need differently shaped cards. Every card must be traceable to a specific passage: if you cannot
   point at the sentence it came from, it does not go in. **Nothing from your own memory of the subject,
   no matter how confident** — that is how a plausible falsehood enters a deck that is then memorised on
   purpose. A line number handed to you by another agent or a report is **a lead, not a citation**:
   re-derive it before writing the card. (Measured failure: two of 22 card additions once arrived with
   line references from a review; both were wrong — one would have asserted the book says a deadlock
   victim is "often the youngest" when the word appears nowhere in it.) Where the book and your
   recollection disagree, the book wins; where the book is silent, the card does not exist — report the
   gap, never fill it.
2. **Check for duplicates within the same deck scope before writing.** Grep the deck family for the term
   (`**Term**` and the bare word). Duplication *within one self-contained deck* is waste — one fact
   reviewed twice per cycle for nothing. Duplication *across independent decks* (different courses, or a
   shared reference note) is acceptable and often required when each deck must stand alone. Decide which
   case you are in before skipping a card.
3. **Decide what each card tests** — one fact, one direction (see §2 for separator choice).
4. **Write in the deck's language**, matching surrounding cards, deriving content from the source rather
   than paraphrasing your own summary. Keep technical terms in their original language; giving the
   English term in parentheses is good house style for a concept whose literature is English.
5. **Place the card** in the section it belongs to. If a note has a dedicated flashcards section it is
   usually required to stay last — follow the note's existing shape.
6. **Verify** (see §7): marker and separator counts before and after, then the structural/shape check,
   then the lint/convention check. When a deck is *finished* rather than merely edited, also run a
   **readiness test** — coverage is not readiness (see the anti-pattern table).
7. **Report what each card came from** — not in the note (cards carry no citations), but in the summary
   to the author/owner: which sections are now covered, which are deliberately not, and any place the
   source was ambiguous. That report is the only thing standing between a wrong card and a memorised
   wrong fact.

---

## 2. Which separator

(Separators shown are the obsidian-spaced-repetition conventions; the *choice logic* is general.)

| Separator | Meaning | Use when |
|---|---|---|
| `::` | single-line, one-directional | **Default.** A "why/what-breaks" question whose reverse is meaningless |
| `;;` | single-line, **reversed** (also generates a back-to-front card) | You must be able to **produce** the term, not just recognise it |
| `\|\|` | multi-line, one-directional | A short list of 2–4 items; put the count in the prompt, e.g. `… ? (3)` |
| `??` | multi-line, **reversed** | Rare — prefer splitting into separate cards |

**The reverse direction is not free.** For *semantically related* pairs (a term and its definition are
exactly this), testing one direction barely helps the other: direction-changed transfer measured
`d = 0.41–0.55` on pairs and **none on triplets** (Rickard & Pan 2020). So `;;` is genuinely two cards
of work — justify it. Default to `::`.

**The four separators are never interchangeable.** `;;` and `??` carry a second schedule; "normalising"
`;;` to `::` silently deletes half the deck. Never rewrite one separator into another, and never strip a
scheduling comment.

---

## 3. What cards are for — and what they cannot do

Cards carry **facts, definitions, mechanisms, distinctions and classifications.** They do **not** teach
a **multi-step calculation procedure**, and trying is measurably worse than the alternative:

- Students who only studied worked examples of circuit troubleshooting scored **70 %** a week later;
  those who alternated worked examples with practice problems scored **51 %** — `d = 0.66` *against*
  testing (van Gog & Kester 2012, n = 39, novices, 1-week delay).
- Pan & Rickard's meta-analysis independently found transfer weakest for worked-example problems.

So for subnet arithmetic, throughput/delay calculations, complexity derivations, or a protocol worked as
an exercise: **study a worked example, then solve real problems.** A card can hold *when* to apply a
method and *why* it works — it cannot practise carrying it out. (Boundary: one primary study plus one
converging meta-analytic moderator. Respect the limit; do not over-extend it.)

---

## 4. Rules for the card itself

Rule 1 is the only one with strong direct backing, and it is the one most often skipped.

**1. `[measured]` Practise the response the exam will ask for.** Retrieval practice transfers to new
questions at `d = 0.40` (Pan & Rickard 2018, meta-analysis) — but corrected for publication bias
(PET-PEESE) that falls to roughly **zero unless the practised response resembles the required one**. The
moderators that decide whether transfer happens at all: response congruency, elaborated retrieval, and
high initial success. A deck of definition cards trains producing definitions. If the exam asks what
happens, what breaks, and which mechanism applies, the deck needs *why* and *what-if* cards, not only
terminology. (Butler 2010: short-answer retrieval of prose, far transfer `d = 0.99` vs restudy at
1 week — the closest format to a flashcard in the corpus.)

**2. `[heuristic]` One fact per card.** If a card can fail for two independent reasons, split it. Nothing
directly measures compound vs atomic cards, so this is best practice. Indirect anchors: a card failed
during practice still gets learned but does **not transfer** (Butler 2010), and effects grow more robust
as success rises above ~75 % (Rowland 2014) — atomising is how you raise a card's success rate.

**3. `[heuristic]` The prompt must uniquely determine the answer.** If two answers are defensible,
self-grading becomes noise and the scheduler is fed noise with it. Ambiguity usually comes from a prompt
that names a *topic* instead of asking a *question*.

**4. `[contested]` Produce the answer when the point is understanding; a gap is enough when the words are
the point.** Fill-in-the-blank retained the exact terms it tested but gave no advantage on reworded
transfer questions, where free recall did (Hinze & Wiley 2011). Claim no more: short-answer vs
multiple-choice measured only `d = 0.07` in one controlled comparison, and Adesope et al.'s
meta-analysis found multiple-choice *stronger*. What is supported is **feedback, more than one test, and
matching the response form** (rule 1) — not a stable format superiority.

**5. `[indirect]` Mark exactly one phrase as the recall target** (here `==…==`). An isolated element is
remembered better (`d = 0.27–0.31`, Siefke et al. 2019) **and the unmarked material around it is
remembered worse** because it captures attention (Geraci & Rajaram 2004, `t(51) = 2.85`). Both studies
manipulate colour/semantic category in **word lists**, not markdown emphasis — take the direction, not
the magnitude. So the highlight sits on the one phrase that must be produced, and the rest must be
context you do not need verbatim. Two things that both must be recalled are two cards. Highlighting
everything destroys the effect. **On a multi-line list card use no highlight at all** — every item is a
recall target, so a bold label per item is the equivalent, and marking one would suppress the others.

**6. `[heuristic]` Answers stay one to two sentences.** A long answer cannot be graded honestly, and
grading is what the whole mechanism rests on — the testing effect vanished entirely in a low-engagement
population (Sigayret et al. 2026).

**7. `[heuristic]` No yes/no or binary prompts.** A 50 % guess rate teaches nothing.

**8. `[measured]` Avoid big enumerations, and never hide several facts in prose.** "Name all eight forms
of X" is eight facts, an ordering, and a completeness check graded as one item. Where a list is genuinely
the unit of knowledge, keep it to **2–4 items** with `(N)` in the prompt, and add separate cards for the
individual items.

Measured against one learner's own FSRS review data, comparing card forms **within each deck** so deck
age cannot explain the result (difficulty is clamped 1–10, higher = harder):

| Deck | 3+ list rows | single fact |
|---|---|---|
| chapter 11 | 9.7 | 6.8 |
| chapter 16 | 8.4 | 3.5 |
| chapter 01 | 9.8 | 8.6 |
| lab deck | 9.9 | 8.6 |

Four decks, same direction. **Five-row lists are the worst form measured anywhere** (9.88). The cards
left unlearned in chapter 11 were its four largest list cards, one shown **21 times** without being
learned.

*Methodological warning that is worth more than the result:* the first pooled version of this
measurement gave prose cards difficulty 5.2 against lists at 9.6 — prose looking *easier* — because 29 of
59 prose-multi-fact cards lived in a deck first drilled the previous evening, so FSRS had not raised
their difficulty yet. **Pooling decks of different ages lets deck age masquerade as card form. Compare
within a deck, always.**

**The subtler case is a prose card that hides two facts.** A card that announces *"Two things."* and then
buries both in one sentence. 98 of 401 cards in one course had this shape. Their measured difficulty was
*low* — which is the trap: you recall one fact, feel right, press Good, and the scheduler is told the
card is learned while it teaches one of two things. Making the two facts two visible rows removes the
false pass. (That reading is a hypothesis the data cannot settle — no pair of cards exists carrying the
same content in both forms — but it is the reason to convert anyway; the argument is about honest
grading, not the difficulty number.)

**Apply this order, first step first:**
1. No exam question needs the card → **delete it.** Most hidden multi-fact cards die here.
2. Both facts are needed → one list card, `(N)` in the prompt, a bold label per row, no highlight in the
   body.
3. Only one fact is needed → cut the other, single-fact card with one highlight.
4. Never more than four rows.

**9. `[indirect]` Count how many cards share a cue.** There is no threshold for how *similar* two prompts
may be — the mechanism is **cue overload**: the more answers hang off one cue, the slower retrieval gets
(latency 1367 → 1465 → 1501 ms across fan levels 1–3, Radvansky & Copeland 2006; latency, not accuracy,
and fan 3 was simply the highest level tested). The rule is cheap: before adding a card that opens like
an existing one, or leads with an already-used bolded term, grep for it and make the prompts diverge on
the word that decides the answer. (Worked example: split `Availability` into its security-property sense
and its "share of time usable" sense by putting the sense in the prompt.) The rule binds **within one
deck scope**; cross-scope cue sharing is accepted where self-containment requires the card in both.

**10. `[heuristic]` Understanding comes first.** Cards consolidate what is already understood; they teach
a concept poorly. The definition belongs in the note, then the card.

**11. `[rule]` Never rewrite the meaning of a card that has scheduling history.** The schedule was earned
by the old question. Add a new card and leave the old one alone; keep the scheduling comment on its line,
byte-identical. Typos and formatting are fine; meaning is not.

**12. `[rule]` Never delete or reword an existing card, and never change a note's review-scope tag,
without the owner's explicit authorisation.** This rule exists because it was broken: a "rewrite from
scratch" once silently removed 15 of 22 existing cards (one with no replacement anywhere) and added a
scope-exclusion tag that pulled 87 new cards out of review — neither declared, both found by an outside
reviewer diffing against the prior commit. A note "rewritten from scratch" is a deletion of everything in
it. **Rework a deck by adding cards; list what you would remove in the report instead of removing it.**
The owner *may* lift this rule and authorise a deletion or a reword-with-marker-kept — what the rule
protects is *who decided*, not the edit itself. If you are not quoting an instruction, you do not have
one. When an authorised deletion happens, delete the **whole card block, marker included**: a marker left
behind attaches to the next card (the one edit rule 11 forbids). Prove the arithmetic — the count of
scheduling comments must fall by *exactly* the number of cards removed.

**13. `[measured]` Keep testing a card; do not retire it and do not settle for re-reading it.** After the
first correct recall, items kept in *testing* scored ~80 % a week later whether or not also restudied,
while items kept in *study* but dropped from testing scored ~36 % (Karpicke & Roediger 2008). Suspending
or deleting a card you have started to remember is the losing condition; re-reading the note instead of
reviewing the card is the same mistake in another form. (Scoping a whole deck out of review for a
finished course is a different, deliberate decision.)

**14. `[indirect]` Put a diagram on a card only when the diagram is what must be recalled** — a message
sequence, a layer stack, a state machine. Words + a relevant picture beat words alone (`d = 1.39`,
Mayer), but *removing decorative graphics* is itself a large effect (`d = 0.97`), so a merely interesting
image makes the card worse. Keep the label beside the part it names. (Evidence is from multimedia
lessons, not cards.)

**15. `[rule]` Everyday language, and few cards.** Three things follow, and they override any instinct to
be complete:
- **Write the card the way you would say it out loud.** Technical terms stay — they are the exam's
  vocabulary. Academic register around them goes (*the difference* not *the distinction*, *builds on*
  not *rests upon*, *makes* not *entails*). A card you would not read aloud to a classmate is badly
  worded.
- **A small deck the owner drills beats a complete one they abandon.** Card count is a **cost**, not a
  coverage score. Before adding a card, name the exam question it serves; if you cannot, it does not go
  in.
- **Cut, do not pad.** Decks that reached 184 and 144 cards per chapter were rejected as "far too many".
  The rule is "as few as possible, as concentrated on the exam questions as possible" — one project's
  ten decks were cut from 401 cards to 219 (15–29 each) on that basis. **A card that is correct, in the
  chapter, and needed by no exam question is waste** — cut it, do not merely shorten it.

This rule and rule 8 point the same way, and this one is stronger: where they conflict, cut.

---

## 5. Beyond the card: what decides whether the deck pays off

Wording is half of it. These are the highest-value findings and none are about authoring:

- **Always read the answer, even after a lapse.** A failed retrieval followed *immediately* by the
  answer builds memory better than studying alone; the benefit disappears if the answer is not seen
  right away (Grimaldi & Karpicke 2012). A failed card still gets learned — what the failure costs is
  *transfer* to new questions (Butler 2010).
- **Review what is due; do not drill one chapter.** Interleaved practice scored **63 % vs 20 %** a week
  later on new problems, while blocked practice scored higher *during* the session (Rohrer & Taylor
  2007). Fluency in a blocked session is not learning, and learners consistently misjudge this. A
  due-based review session interleaves by itself.
- **Three or more spaced sessions per concept — which sets an authoring deadline.** Protocol behind the
  results above: ≥3 sessions, each continued until every item is recalled correctly once, sessions ≥1
  day apart, spaced at **10–20 % of the interval to the exam**. For an exam three months out that is a
  9–18 day gap — which FSRS produces on its own, but only if the card exists early enough to get three
  of them. **Write cards as the course runs, not the week before.**
- **A confident mistake is the most valuable review of the session.** High-confidence errors are
  corrected more easily than low-confidence ones (hypercorrection, `d = 0.46`, Metcalfe & Finn 2011;
  robust in young adults, absent in older adults). When you were sure and wrong, read the answer
  properly — and do not suspend that card, it is about to be learned.
- **Grade honestly.** The testing effect vanished entirely in a low-engagement online population
  (Sigayret et al. 2026). Reveal the answer, grade yourself truthfully.
- **Cards the learner wrote beat cards handed to them** — the finding that judges an agent-authoring
  workflow. User-generated vs premade digital flashcards: definition questions `d = 0.45`, application
  `d = 0.29` (Pan et al. 2022), and copy-paste/paraphrase beat word-for-word transcription. If an agent
  authors the deck, that is the *premade* condition and the penalty stands, unoffset. What compensates
  (and raises the floor rather than cancelling the penalty): response congruency, feedback on every
  lapse, continued testing, interleaved review, three spaced sessions. The residual risk is grounding —
  which is why procedure step 1 (every card traceable to a passage) is first.

---

## 6. Worked examples

**A term-list entry turned into a card.** Source: *"Caching: local storage of recently used data objects
near the client to minimise latency and reduce load on network and servers."* Copied verbatim that is a
definition to read, not a prompt to answer. As a card (production needed, so `;;`):

```markdown
**Caching**;;Att ==spara en kopia av nyligen använda data nära klienten== så att nästa åtkomst
inte behöver gå hela vägen till servern – minskar *fördröjning* och *belastning* på nät och server.
```

**A concept worth only a reasoning card** (one-directional `::`, the reverse question does not exist):

```markdown
Varför är samtidighet en utmaning och inte bara en egenskap?::Flera klienter kan ==använda samma
resurs samtidigt==, och utan synkronisering kan operationerna flätas in i varandra och lämna data
*inkonsistent*. Varje delad resurs måste själv skydda sig, t.ex. med semaforer.
```

**A short list where the list is the unit** (two items, count in the prompt, multi-line, no highlight in
the body — a bold label per row instead):

```markdown
Vilka två tekniker används för att avlasta resurser som efterfrågas mycket ofta?
||
- **Caching** – spara en kopia av det nyligen använda nära klienten
- **Replikering** – hålla flera kopior på olika servrar
```

Then a separate single-fact card per item, so a slip on one does not re-review the other.

---

## 7. Anti-patterns

| Anti-pattern | Fix |
|---|---|
| Definition copied verbatim from a term list | Reformulate as a prompt whose answer is the key phrase, with the recall target highlighted |
| One card carrying a definition *and* an example *and* a consequence | Split into two or three |
| Two cards whose prompts read almost the same | Add the distinguishing context to each prompt |
| A list card of 8+ items | Keep it only if it is a real unit (≤4 rows); add per-item cards |
| `;;` used by default | Switch to `::` unless the reverse direction is genuinely needed |
| A new card duplicating one already in the same deck scope | Do not add it; note where it already lives |
| A card the exam needs, left out because another *independent* deck already has it | Add it — that deck may be dropped later, so the only copy would be one never reviewed again |
| A card that keeps failing is left as it is | It is producing no transfer — split it, add a distinguishing cue, or rewrite it as a new card |
| A topic covered only by definition cards | Add at least one card that asks what happens / what breaks, so the practised response matches the exam's |
| Every exam question has a card, so the deck looks finished | **Coverage is not readiness.** Put three follow-ups to each question — *why does it work, what breaks, when would you choose the other thing* — and see whether the deck answers them. One such test found 26 thin and 11 unanswerable out of 147 follow-ups, all of them **tradeoffs and downsides**, while every written question still had a card |
| A card states a mechanism but never its cost | Add the downside as its own short card. Cutting a deck removes *tradeoff* cards first, unnoticed, because no written question names them directly |
| A card stating something the source does not say | Delete it. Plausibility is not grounding |
| A card that teaches a calculation procedure | Not a card — study a worked example, then solve problems (§3) |
| A card worded in academic register | Rewrite it the way you would say it out loud; keep the technical term, drop the register (rule 15) |
| A prose card that announces "two things" then buries both in a sentence | Make it a list card with `(2)` and one bold label per row — or cut the fact no exam question needs (rule 8) |
| A list card with five or more rows | Split it or cut to four rows — the hardest form measured (rule 8) |
| A card that is true and in the chapter but serves no exam question | Cut it, do not shorten it. Card count is a cost (rule 15) |
| Auto-generated cards (e.g. NotebookLM Studio) pasted into a deck | They follow none of these conventions and cannot be exported cleanly. Use them only as a *coverage check*: generate questions from the chapter and see which the deck cannot answer |

---

## 8. Verify

Count scheduling markers and each separator **before** editing and again after. Only counts you
deliberately changed may move; the scheduling-comment count must be identical unless you authorised a
deletion:

```powershell
$p = "<file>"
$enc = New-Object System.Text.UTF8Encoding($false)
$t = $enc.GetString([System.IO.File]::ReadAllBytes($p))
foreach($m in '<!--SR:', '::', ';;', '\|\|', '\?\?'){ "$m = " + ([regex]::Matches($t,$m)).Count }
```

Then, in order:

1. **A card-shape check.** The only check that sees an *orphaned separator*, a list with <2 or >4 rows, a
   highlight inside a list body, a missing `(N)` cue, a marker not sitting under a complete card, or an
   answer without exactly one highlight. A card *count* cannot see any of these — delete one card and add
   one and the total is unchanged while the deck holds a question with no answer.
2. **A per-file diff**, not a whole-vault total — another agent or a device sync can change the vault
   mid-session, so a total cannot prove you touched only what you meant to.
3. **Line endings and BOM unchanged.** Editing tools can inject a stray CRLF into an LF file; count
   carriage returns in the decoded text before and after.
4. **A Markdown lint pass**, confirming the number of files actually linted is non-zero and matches what
   you meant to check. (A quoted glob can lint zero files and still exit 0 — a clean-looking pass that
   checked nothing. Confirm the file count, not just the exit code.)
5. **A convention/standard audit last**, after every edit.

**For a sweep across many notes this card-level procedure is not enough** — use a bulk-edit procedure that
adds dry runs, backups, and a before/after fingerprint of every scheduling marker, because a bulk
operation (especially `markdownlint --fix`) can insert a blank line inside a card and orphan its answer.

---

## 9. Mechanics (obsidian-spaced-repetition specifics, for grounding)

- A card runs from its separator to the **next blank line**. An inserted blank line splits the card and
  orphans the answer — the reason a blanket auto-fix is dangerous near cards.
- Whole-note exclusion from review is a tag (here `nosr`), which must also be listed in the plugin's
  ignore setting. Changing it silently removes a note's entire card set from review.
- The scheduling comment's FSRS fields, in order after `!fsrs,`: `due` (ISO/UTC), `interval`, `stability`
  (days), `difficulty` (1–10, higher harder), `state` (0 New / 1 Learning / 2 Review / 3 Relearning),
  `reps` (every showing, not only successes), `lapses`, `learning_steps`, `last_review` (ISO/UTC).

---

## 10. What is *not* established (so no future session re-derives it as fact)

- Whether highlighting the target phrase transfers from coloured word lists to markdown emphasis on a
  card — direction known, magnitude not.
- Whether writing a question teaches more than answering it — one direct look found no correlation
  between questions *written* and written-exam performance.
- Whether adding a concrete example helps the abstract concept itself — no study.
- How to steer a desired-retention setting toward a fixed exam date — undocumented; the 3-spaced-sessions
  protocol is the practical substitute.
- A measured optimal success rate during practice — none known; the one directional finding is that
  effects grow more robust above ~75 % success. Do not manufacture difficulty by writing harder cards;
  write cards you can answer and let the scheduler supply difficulty.
- Atomicity (one fact per card), how to break up lists, and what to do with a chronically failing card —
  all pure heuristic, no study in the corpus.
