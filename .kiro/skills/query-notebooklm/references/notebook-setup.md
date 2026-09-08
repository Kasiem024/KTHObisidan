# Setting up a notebook before you query it

Four settings decide how much every later round costs and how much you can trust it. All four are
per-notebook, so a new notebook starts from nothing. Everything here was reported by the meta-notebook
on 2026-09-06 with its provenance attached; the labels below say which claims are Google's own.

## 1. Custom instructions — set the output contract once

A meta-prompt field at the top of the chat panel, ceiling **10 000 characters** (raised from 500 on
2025-12-05). The contract below is 1 365, so it fits three times over.

It governs **more than chat**: *"Whatever you write there shapes every response and also every Studio
output until you change it"* (third-party, documented, 2026-06-07). So one paste also constrains any
report, flashcard set or overview the notebook generates.

Adapt the fields to the subject — effect size and design for research literature, date and version for a
product:

````text
For every claim you make, always give: the verbatim sentence from the source in quotation marks; the
effect size, sample size and study design; the name of the source with section or page; and whether it
is a meta-analysis, a single primary study, or a source citing someone else's study.

If the sources do not cover something I ask, answer "not covered" for that point. Never fill a gap
from general knowledge - an explicit gap is more useful to me than a plausible answer.

For every answer, also tell me whether anything in the sources contradicts it, and name what does.

If your source is itself quoting another source, name both. Some of the sources in this notebook are
research reports that quote other papers; when a claim comes from one of those, say whether the
underlying paper is also in this notebook.

When you name a source, copy its title exactly as printed on the source itself. If you cannot see the
title, write "title not verified" rather than reconstructing one, and say whether the source is
peer-reviewed, a preprint, or something else.

If a paper is named in the question, say first whether its full text is in this notebook or only its
abstract and metadata.

If a table is your evidence, give its rows in the source's own order, including any baseline or
reference row.

Answer numbered questions separately, labelled with their number.
````

**Verify it took effect** rather than assuming: ask one question whose answer shape you already know, and
check that the response carries the date, the source name and the "contradicts" line without being asked.

**Verified once, 2026-09-06.** Set in the meta-notebook, the next round's answers carried every field —
verbatim sentence, date, version, source name, official-or-third-party, documented-or-observed — plus
unprompted "not covered" answers and a contradictions line per question, none of which the round asked
for.

## 2. Deselect the sources you do not trust

Every source has a checkbox and is active by default. Google's own help centre: *"you can use the checkbox
on each source to include or exclude certain sources the model should use to answer your question"*, and
*"Inactive sources will count towards source limits but will not be referenced throughout your notebook…
Chats will not reference the inaccessible file; The studio will not reference the inaccessible file when
generating images or slides"* (Official Google, documented, 2026-07-16).

Three consequences, and the third is the one that surprises:

- It covers **chat and Studio both**, so a deselected marketing blog cannot reach any output.
- It is **certain**, unlike every wording trick in `corpus-acquisition.md`. Deselect first, then stop
  worrying about the citation mix.
- **It does not free a slot.** Inactive sources still count against the notebook's cap, so deselection is
  a quality filter, never a budget one. Nothing recovers a slot except deleting the source.

## 3. Response length

A Configure Chat toggle — Default / Shorter / Longer — which steers chat answers *and* Studio outputs such
as reports (Official Google help centre, documented, 2026-07-16). Prefer **Longer** for evidence rounds:
the contract demands a verbatim sentence and a provenance chain per claim, and a shortened answer is where
those get dropped.

## 4. Know what happens to a saved answer

Chat answers can be pinned with **Save to note**, keeping their tables and inline citations, and a note can
then be turned into a source with **Convert to source** (Official Google + third-party, documented, 2026).
A converted note is cited like any other source.

**This is a trap as much as a feature.** Combined with the Deep Research report being added automatically,
a notebook can end up citing its own earlier output as though it were independent evidence — see
*confirmation by echo* in `corpus-acquisition.md`. A saved answer is a **convenience**, not a source. If
you convert one, say so in the note itself, so a later round can tell the difference between a corpus and
a hall of mirrors.

## What Studio can generate, and what it is worth to us

Ten output types, all steerable through a caret next to each tile — length, format, language, and a custom
prompt (third-party, documented, 2026-06-07). Quizzes and flashcards additionally take **difficulty**
(Easy / Medium / Hard) and a card or question count.

Judged against the evidence in `.kiro/skills/write-flashcards/references/evidence.md`, they split cleanly:

| Studio output | Worth |
|---|---|
| **Quizzes**, **Flashcards** | Retrieval practice — the half that works. But **they cannot be downloaded**, only copied out of the interface by hand, so they are a *diagnostic*, not a source of vault cards. Best use: generate questions from a chapter and see which ones the existing deck cannot answer |
| **Reports**, **Data tables** | Exportable (Docs, Sheets, and csv/json among the newer formats), so these are the outputs that can actually leave the tool |
| **Mind maps**, **Infographics**, **Slide decks** | Structure at a glance. Useful for deciding what a chapter contains before carding it; not study material |
| **Audio and video overviews** | **Restudy, and the evidence is against it.** Karpicke & Roediger 2008: after one correct recall, items kept in testing scored ~80 % a week later, items kept in study but dropped from testing ~36 %. A podcast about a chapter is the second condition, however good it feels |

First-add artifacts — whatever is generated automatically when sources are first added — do not count
against the daily quotas.

## The meta-notebook is closed

Two runs and four query rounds, 2026-09-06, 90 of 300 slots used. Everything worth having is in the
figures table and the rules above. **Do not commission further runs about how these tools work** — the
returns fell off sharply, and the reasons are worth stating so nobody re-litigates it:

- **Product facts expire.** Every figure here is a dated reading of a moving target, sourced largely to
  blogs and Wikipedia. Re-verify on use, not on a schedule, and never treat one as an invariant.
- **Model versions are the least useful category.** Which Gemini backs which feature changed four times in
  the material we gathered, is sourced to third parties, and changed nothing we do. The one figure that
  looked actionable — context window size — has no bearing on writing a card or passing an exam.
- **Behaviour beats documentation for this subject.** The two input limits, the citation-count comparison
  and the reproducibility profile all came from experiments, and each took minutes. The corpus answered
  "not covered" on the first two.

Three things remain untested, and all three should be settled **as a by-product of real work** rather than
as another exercise:

| Test | When it happens |
|---|---|
| Whether categorical exclusion beats an evaluative one | Automatically, on the next real corpus. The measurement is counting official domains afterwards, against 57.5 % and 46.0 % |
| Whether a report's quote matches the **original web page** — the one link in the chain never checked, and the link where two earlier over-claims came from | One URL, one comparison. Needs net access |
| Whether custom instructions govern Studio output as documented | Generate one report and look for the provenance fields |

## Figures this skill owns

Measured or documented on **2026-09-06**, in the author's setup. Quote this table rather than re-deriving,
and re-verify anything about the product before relying on it — these are dated readings of a moving target,
not invariants.

| Figure | Value | How it is known |
|---|---|---|
| NotebookLM chat input limit | **3 800 characters** | Measured, end-code verified |
| Deep Research prompt limit | **5 000 characters** | Measured |
| Deep Research input floor under load | **~1 200 characters** | Official Google support, observed |
| Custom instructions ceiling | **10 000 characters**, raised from 500 on 2025-12-05 | Third-party, stable across three runs |
| Query skeleton length | **952 characters** | Counted locally |
| Acquisition skeleton length | **1 513 characters** | Counted locally, 2026-09-07 after the evaluative line was removed |
| Sources per notebook | **300** on this plan; 50/100/300/500/600 across tiers, Enterprise 300 | Observed by the author; tier labels third-party and contested |
| Sources per Deep Research run | **18–50 imported**, 23–51 cited — five runs: 40, 50, 18, 26, 27 | Observed. The earlier figure of forty-to-a-hundred is **withdrawn**: its lower bound is falsified and its upper bound was never observed in any run |
| Typical citations per report elsewhere | 15–30, or 32.42 average | Third-party |
| Import failure rate | **24 of 185** cited sources across five runs, 13.0 % | Observed |
| Max words / file size per source | **500 000 words**, **200 MB** (Enterprise 500 MB) | Official Google, stable across runs |
| Deep Research browsing budget | 30–60 URLs in standard mode | Third-party, observed |
| Official-domain share of citations | **57.5 %** run 1, **46.0 %** run 2 | Counted locally from the reports |
| Numeric reproducibility | **zero drift** over 6 questions × 3 runs | Measured |

## Reproducibility: asked, undocumented, then measured

**No source documents it.** Asked directly, the corpus answers **not covered**: nothing says whether the
same question against the same sources returns the same text, and the interface exposes no temperature or
randomness control. So this was measured instead — the result is below, and it is the reason a figure here
may rest on a single response while a provenance claim may not.

### The test, registered before the result

Run on 2026-09-06. Six questions whose answers are already recorded from earlier rounds, so the comparison
is three-way: the original answer plus two fresh ones.

Protocol, and every clause matters:

1. **A new chat session for each run**, or the second answer is reading the first one out of its own
   context rather than out of the corpus.
2. **Do not change the source selection between runs.** Deselecting anything mid-test changes the
   population and the test measures nothing.
3. **Paste the block character-for-character identically.** A reworded question is a different question.
4. Compare three things separately: **the numbers**, **which sources are cited**, and **which points come
   back "not covered"**.

**Prediction, recorded in advance:** numbers mostly stable, cited sources partly unstable, the
"not covered" set mostly stable. The reasoning is that a fixed corpus in a long context should let the
model re-derive the same content, while which page it credits for a claim has more freedom.

**How to read the outcome — decided before seeing it:**

| Result | What it means for this skill |
|---|---|
| Same numbers, same sources | A single answer is adequate evidence. Nothing changes |
| Same numbers, different sources | Conclusions are reproducible, provenance is not. Then a claim may be quoted, but the **source attribution** for it needs two asks before it is written down |
| Different numbers | A single answer is not evidence. Every load-bearing figure needs two independent asks, and the ones already recorded here need re-checking |
| Contradictions appear in one run but not the other | The contradiction-reporting clause is unreliable, which weakens the strongest part of the output contract |

### The result: numbers hold, provenance does not

Three runs of the same six questions, 2026-09-06. Run A came back covering **only question 1**, and
rendered it twice with different field labels — a malformed response. Runs B and C were complete.

**Every number was identical in every run that answered the question.** Six questions, two complete runs
plus one partial: zero numeric drift. Source caps 50/100/300/500/600 and Enterprise 300; custom
instructions 10 000 raised from 500 on 2025-12-05; audio overviews 3/6/20/100/200 and Enterprise 20;
four Deep Research model versions with the same four dates; 500 000 words and 200 MB, Enterprise 500 MB;
flashcards not downloadable. Nothing moved.

**Four things did move.**

| What | Behaviour across runs |
|---|---|
| **Which source is credited** | Unstable. B credited Google Cloud's Enterprise documentation and a GitHub quota file for figures that C credited to the Deep Research report "citing Google Enterprise specifications" |
| **The verbatim sentence quoted** | Unstable. For the same audio-overview numbers, B quoted *"Audio Overviews per day: 3"* from one document and C quoted *"Daily Audio Overviews \| 3 generations"* from another |
| **Coverage** | Unstable. B volunteered Workspace/EDU audio limits that C omitted; C and B both gave Workspace/EDU source tiers that A omitted |
| **Contradiction reporting** | Stable **between the two well-formed runs** — B and C each found the same three contradictions, on the Plus source cap, the Plus audio limit, and words-versus-characters. Absent entirely from the malformed run A |

**The correction this forced.** After comparing only A and B, this file said the contradiction clause was
unreliable. Run C shows the more likely reading: **A was a degraded response**, and contradiction
reporting is dependable when the answer is well-formed. The generalisation was drawn from a bad sample —
which is the failure this whole skill exists to prevent, committed inside the skill itself.

**A prediction that was wrong, and why.** I expected question 4 to expose a model-version contradiction,
since an earlier round had reported Wikipedia and MindStudio disagreeing about which Gemini model powers
NotebookLM. Both runs correctly reported **no contradiction** — because question 4 asks about *Deep
Research's* model, not NotebookLM's. Two adjacent facts, one of them contested, and I conflated them.

## What to do with an answer, given all that

1. **A figure from one answer is good enough.** Numbers were the most stable thing measured. Do not spend
   a second round confirming a number.
2. **Provenance from one answer is not.** Never write "according to Google's own documentation" — or quote
   a verbatim sentence as *the* source sentence — on the strength of one run. Both the credited document
   and the quoted sentence vary.
3. **Check the answer's shape before trusting its silence.** A truncated answer, or one that repeats a
   section with different field labels, is degraded: discard it and re-ask. Run A's missing contradictions
   were a symptom of that, not a property of the tool.
4. **Ask narrowly for completeness.** Every run omitted something another volunteered. An answer is a
   sample of the corpus; if coverage matters, ask one subsystem or one tier family per question.
