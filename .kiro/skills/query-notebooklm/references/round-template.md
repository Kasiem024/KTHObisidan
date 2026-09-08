# The query block, and a worked round

Two messages per round, always. The first is to the user and explains why the round exists. The
second is the block, and it speaks only to the tool.

This file is the **querying** half. The acquisition half — writing a Deep Research prompt so that what
it cites becomes a usable corpus — is `corpus-acquisition.md`, and it comes first in time.

The NotebookLM question box has a hard limit of **3 800 characters**, measured 2026-09-06; aim at
**3 600**. A block at exactly 3 800 was verified to arrive whole, its end code coming back, so the
boundary is a clean rejection rather than silent truncation. Details and method under
*The two input limits* below.

## Query block skeleton

````text
I am researching <subject>, and I need to know what the sources actually establish rather than
what sounds reasonable. Answer only from the sources in this notebook.

For every claim, give me:
- the verbatim sentence from the source, in quotation marks;
- the effect size, sample size and study design - what was compared against what, and on whom;
- the name of the source, with section or page if available;
- whether it is a meta-analysis, a single primary study, or a source citing someone else's study.

Two rules that matter more than the answers:
1. If the sources do not cover a question, answer that question with "not covered". Do not fill
   the gap from general knowledge. An explicit gap is more useful to me than a plausible answer.
2. For each question, tell me whether anything in the sources contradicts the answer, and name it.

Answer each question separately, labelled with its number.

1. <question>
2. <question>
...
8. <question>
````

## What each element is defending against

| Element | Failure it prevents |
|---|---|
| "Answer only from the sources in this notebook" | Answers drifting into general model knowledge, indistinguishable from grounded ones |
| Verbatim sentence | A paraphrase that drops the qualifier the whole claim depends on |
| Design and n | A bare `d = 0.40` cannot be weighted, and a reverse effect gets misread as a mistake |
| Named source | No way to tier the claim or re-find it |
| Kind of source | Meta-analysis and blog post quoted with equal confidence |
| "not covered" | Fluent invention, with nothing marking it as invention |
| "what contradicts this" | Manufactured agreement — the corpus is not consulted for disconfirmation unless asked |
| Numbered answers | Answers that cannot be matched back to questions, which makes transcription guesswork |

## Worked round

The round that changed the most in `write-flashcards`. Note that the questions are about
**boundaries and failures**, not about whether the technique works — asking whether retrieval
practice works would have returned a wall of confirmation.

````text
I am designing spaced-repetition flashcards and need the boundaries of the evidence, not the
case for it. Answer only from the sources in this notebook, and use the format I gave earlier.

1. Does retrieval practice transfer to questions that differ from the practised ones? Give the
   pooled estimate, and whether it survives correction for publication bias.
2. Under what conditions does that transfer fall to zero or near zero?
3. Is there any study in which testing performed WORSE than an alternative? If so, what was the
   task, what was the comparison, and what was the effect size and direction?
4. What does the evidence say about carding a multi-step procedure or calculation, as opposed to
   a definition or a mechanism?
5. After an item has been recalled correctly once, what happens if it is dropped from testing but
   kept in study? Give the conditions and the retention numbers.
6. Is there evidence comparing cards a learner wrote against cards handed to them? Give effect
   sizes and how the cards were generated.
7. Does anything in the sources measure how much material should go on one card, or compare one
   compound card against several atomic ones?
8. For each of the above, what does no source in this notebook answer?
````

Question 3 is the one to copy. It returned van Gog & Kester 2012 — worked examples beating practice
problems on circuit troubleshooting, 70.07 % against 51.25 % at one week, `d = 0.66` *against*
testing — which became the "what cards are for" boundary and the rule that no card teaches a
calculation procedure. Nothing else in the round would have surfaced it, because every other question
was pointed at where the technique works.

Question 7 returned "not covered", which is why atomicity is tagged `[heuristic]` and not asserted.
That answer cost one line of a prompt and prevents a future session from defending a rule the corpus
never supported.

## Follow-up rounds

Aim each one at something the previous answer exposed. The productive shapes:

- **A contradiction.** "Source A reports X and source B reports the opposite. What does each actually
  measure, and are they answering the same question?" This is what downgraded the short-answer rule
  to `[contested]`.
- **A number without a design.** "You gave `d = <n>` for <claim>. What was the material, the
  population and the comparison condition?" Answers here are what decide `[measured]` versus
  `[indirect]`.
- **A protocol.** "What does the source say about how many sessions, how far apart, and to what
  criterion?" Findings are easier to act on as a procedure than as an effect size.
- **A claim you are about to act on.** Before writing a rule, ask the corpus to argue against it.

### Quote the previous answer back, exactly

Measured 2026-09-07, and it is the most useful habit in this file.

A round-1 answer reported that one detector's accuracy "rose from 85.0 % to 96.7 % under a DIPPER
paraphrase attack at a 5 % false positive rate **on the Reddit domain**". That was written up and passed on
as fact. The round-2 question quoted it back verbatim, including the domain — and the answer refused it:
the rise is the **overall** figure across all domains, and the domain attribution was, in its own words, a
*"conversational deictic mischaracterization from the previous chat turn"*.

The string "Reddit domain" appears in **neither** local report. What the reports do contain is an unrelated
study of ~60 000 **Reddit posts** about autistic writing. So the first answer took a word that was in its
context for one reason and attached it to numbers from another source — two unrelated facts sharing a
token.

Three lessons, in order of importance:

1. **An error in one answer becomes an assumption in the next question.** The chain here was answer →
   summary → next question, and nothing in it was dishonest; the wrong detail simply travelled.
2. **A precisely quoted claim can be falsified; a paraphrased one cannot.** Because the question named
   85.0, 96.7, DIPPER, 5 % and the domain, the answer could check each part and reject one. Had it asked
   "tell me more about that detector's paraphrase robustness", the error would have survived.
3. **Ask for the table, not the finding.** The answer that corrected the record cited a specific row of a
   specific table, which is what made it checkable. None of those numbers appear in either report — they
   came from the primary paper, which is the outcome the whole pipeline exists to produce.

So: when a follow-up round builds on an earlier answer, **paste the earlier claim in verbatim and invite
its refutation**. It costs one sentence and it is the only mechanism that has caught a propagated error.

Stop when a round returns mostly "not covered". That is the corpus telling you its edge, and it is a
better stopping signal than your own sense of completeness — **provided** you have checked that the
gaps are real gaps and not failed imports. If they are failed imports, the next move is a targeted
Deep Research run or a manual add, not another query.

## The two input limits

### Results

Measured 2026-09-06. **Both maxima are now established.**

| Tool | Maximum input | How it was pinned down |
|---|---|---|
| NotebookLM question box | **3 800 characters** | Probed 1 000 → 3 800 accepted, above it rejected. At exactly 3 800 the end code `Z3800Q` came back, so a block at the maximum arrives **whole** — no silent truncation at the boundary |
| Deep Research prompt | **5 000 characters** | Probed 1 000 → 5 000 accepted, above it rejected |

The NotebookLM figure carries the stronger evidence, and the difference matters. "No error" only means
the tool did not complain; a returned end code means the *last characters of the block arrived*. Those
come apart exactly when it hurts — a silently truncated round drops its final questions and looks
identical to a corpus that had nothing to say about them. At 3 800 that failure mode is ruled out.

**Leave a small margin anyway: aim at 3 600 and 4 800.** Not for truncation, but because you cannot
count characters the way the tool does — a newline, a non-ASCII character or a trailing space may or may
not be counted the same, and being one character over costs a round trip for nothing.

**What this does to round design.** The skeleton without questions measures 952 characters — a quarter
of the NotebookLM budget, and a one-time cost:

- **Send the contract once, in the session's first round**, then open later rounds with "use the format
  I gave earlier". The worked round below does this; it is load-bearing rather than stylistic.
- **Six to eight questions per round.** The ceiling is not the binding constraint at this size — answer
  depth is. Twenty questions still gets twenty shallow answers.
- **Keep the "not covered" and "what contradicts this" rules in every round.** They cost roughly 200
  characters and they are the two lines that make a round evidence rather than prose.
- Deep Research's 5 000 is roomier, but an acquisition prompt should stay narrow anyway — the limit is
  not the reason to keep it short, the 18–50 slots it spends are.

Pre-measurement I estimated 1 500 for acquisition and 3 000 for queries. Both were safe; the first was
unnecessarily so, at 30 % of what the tool accepts.

### Measured against what the corpus claims

**The measurement was right and the literature was wrong**, which is the whole argument for testing a
tool rather than reading about it. Meta-notebook run 1 asked what the documented input limits are and
returned:

- The NotebookLM chat limit is **not documented** by Google at all. The only figure any source carried
  was **"approximately 2 000 characters"** from third-party Reddit user testing, dated late 2024/2025.
  Our measurement is **3 800**, verified by an end code returning. Had we trusted the corpus, every
  round would have been capped at half the usable budget.
- The Deep Research prompt limit is also **not documented**. Ours is 5 000 — with the caveat that the
  input field shrinks under load toward a floor of ~1 200 characters (Official Google Support, observed,
  2026-02-01), so 5 000 is a best case rather than a budget.

Two lessons, and the second is the useful one. Do not assume an undocumented limit is unknowable — it
took ten minutes to measure. And when a corpus answer and a measurement disagree, **check which one is
dated and which one is observed** before deciding who is wrong.

### How the measurement worked

Blocks of prose padding, each built to an **exact** total character count and ending with a fixed
instruction plus a unique end code — for the 3 800 block, the literal tail was:

```text
Disregard every padding line above. Reply with nothing but the end code that follows this sentence,
exactly as written. END-CODE: Z3800Q
```

The end code is what makes three outcomes distinguishable:

| Outcome | Means |
|---|---|
| The paste is refused or the submit errors | Over a hard limit |
| The reply is the end code | Received in full |
| The reply cannot find the end code | **Silently truncated** |

### Rebuilding the blocks, if the measurement needs redoing

The generator script and its blocks were deleted once the two numbers were known. To rebuild:

- The count includes **everything** — the header line, the padding, the tail and the trailing newline.
  Build to the target and assert the length before pasting; an off-by-one makes a boundary test
  meaningless.
- Padding must be inert prose that asks for nothing, or the tool answers the padding instead of
  returning the code. Numbered filler lines work: *"Padding line 7: this sentence exists only to occupy
  characters and carries no meaning, no claim and no request."*
- Probe upward in coarse steps, then build **off-grid blocks** at the boundary. The two numbers here
  needed 3 800 and 5 000, neither of which is on a doubling ladder — expect to generate specific
  lengths once the bracket is narrow.
- **NotebookLM is safe to probe:** a question adds no sources.
- **Never submit a length test to Deep Research in a working notebook** — a submit runs a real report
  and adds 18–50 padding sources. Paste without submitting, or use a scratch notebook and delete it.
