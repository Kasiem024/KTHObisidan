---
name: query-notebooklm
description: How to get evidence-grade answers out of a NotebookLM corpus when the user is the messenger - one pasteable block per round, provenance demanded up front, an explicit "not covered" answer, and adversarial checking of what comes back. Use when a decision needs literature the user holds in NotebookLM, or for any tool reachable only by handing the user a prompt to paste.
---

# Querying a NotebookLM corpus through a human relay

You cannot see the corpus and you cannot ask a follow-up mid-answer. The user copies your block
into NotebookLM and brings the output back, which makes every round an expensive round trip and
makes an ambiguous question a wasted one.

The output you want is **not a summary**. It is claims with enough provenance attached that each one
can be tiered and later defended: what was measured, on whom, against what, with which number, from
which named source. A summary reads well and is useless the moment someone asks "how strong is that,
really?"

This skill produced `.kiro/skills/write-flashcards/references/evidence.md` (§1–§22) over five or six
rounds. Two numbers in it were over-claimed anyway and survived into a rule until an adversarial
review caught them, so read the Verify section as seriously as the rest.

## Stage 0 — the corpus is something you write

Sources reach the notebook through **Gemini Deep Research**: the author gives it a prompt, and the
sources its report *cites* are added automatically. So the acquisition prompt is not a request for a
report — it is a **request for a bibliography**, and it is the only lever that decides what the corpus
can ever answer. A prompt that asks "explain X" gets cited explainers; one that asks what the measured
evidence establishes, with effect sizes, gets cited studies. Ask for disconfirming evidence **here**
too, not only when querying: a report that never looked for a contradiction cites no source carrying
one, and no later question can recover it.

Three constraints govern the whole activity:

- **Sources per notebook is plan-dependent** — 300 on the author's plan, reported as 50/100/300/500/600
  across tiers — and each run returns **18–50**, so six to fifteen runs on this plan, and a badly aimed
  one eats up to a sixth of the budget.
- **Some sources never import** (ResearchGate, and one page each from `iet.ucdavis.edu` and `medium.com`),
  so a paper can be named in the report and absent from the corpus.
- **One notebook accumulates several projects' runs**, so an answer that wanders outside the subject is
  probably drawing on unrelated material.

Two mechanisms decide how much of that matters, and both are confirmed: the Deep Research **report is
added to the notebook automatically**, so specifying its structure gives the corpus a description of
itself; and **individual sources can be deselected**, so junk can be excluded from answering with one
click rather than by any wording in a prompt.

`references/corpus-acquisition.md` has the prompt skeleton, the run-set arithmetic, and the provenance
of these figures — which is one person's account of a changing product, not documentation.

**The author does not curate sources by hand.** Not adding a primary document, not pruning junk from the
source list — stated flatly on 2026-09-06, so a plan that needs either will not be executed. All the
quality control therefore lives in the acquisition prompt: instruct the report **not to cite** poor
sources (uncited means never added, so junk costs no slot), and specify the report's structure so that
it doubles as the notebook's own source inventory. `corpus-acquisition.md` carries both mechanisms.

## Procedure

1. **Decide whether the round is worth a round trip.** Anything you can settle by reading the vault,
   grepping, or running a script is not a NotebookLM question. Ask only what the corpus can settle
   and you cannot.

   **Never build a notebook out of material the vault already holds.** The course literature sits in
   `<course>/Filer/Litteraturlista/` as readable text, so routing it through a notebook adds a lossy
   paraphrase between the book and the card, and buys nothing. This skill is for literature nobody here
   holds — learning science, exam technique, a field's findings. For course content, read the file.
2. **Ask what is in the corpus before the first round** — how many of the 300 slots are used, what
   kinds of source, which other projects' material is in there, and whether anything the acquisition
   report cited failed to import. If the corpus cannot answer the question, the round to run is a
   Deep Research run, not a query. See *Stage 0*.
3. **Write the round as one pasteable block.** No text addressed to the user inside it, no "let me
   know if", no questions the tool would have to ask back. Keep your message to the user separate
   from the block they paste. English, matching the corpus language.
4. **Number the questions, and keep the block inside the limit.** The NotebookLM question box takes
   **3 800 characters** (hard maximum, measured; aim at 3 600 to leave room for counting differences).
   So **six to eight** specific questions per round. The output contract costs 1 365 characters, so set it
   once in the notebook's **custom instructions** (10 000-character ceiling) rather than pasting it into
   every session — `references/corpus-acquisition.md` has the wording. Twenty questions gets twenty
   shallow answers regardless of the limit. Ask for answers labelled by number so they can be matched
   back.
5. **Put the output contract in the block itself** — the shape below. The contract is what turns
   grounded prose into something tierable.
6. **Transcribe into a reference file with a tier per claim**, quoting the source's own words for
   anything that carries a number. Paraphrase is where a caveat goes to die.
7. **Read the answer adversarially, then aim the next round at what it exposed** — contradictions
   between sources, a number without a design, a claim you would have to act on. Later rounds should
   be narrow follow-ups, not a second broad sweep.

## What the output contract demands

Six things, per claim. `references/round-template.md` holds the pasteable wording and what each one
defends against; this is the checklist:

1. The **verbatim sentence** from the source.
2. **Effect size, n, and design** — what was compared against what, and on whom.
3. The **named source**, with section or page.
4. Whether it is a **meta-analysis, a single study, or a secondary claim**.
5. Explicitly: **"if the sources do not cover this, say so."**
6. Explicitly: **"does anything in the sources contradict this?"**

The last two are where the value is, and both are one line each. The `[OTÄCKT]` tier in `evidence.md` —
the honest list of what nothing in the corpus answers — exists only because every round asked for it.
And Adesope et al. contradicting Rowland on multiple-choice surfaced only because a round asked for
disconfirming evidence by name; without it, one rule in `write-flashcards` would still be asserted
instead of tagged `[contested]`.

## Tier what comes back

The vocabulary that worked, strongest to weakest:

| Tier | Means |
|---|---|
| `[META]` | Meta-analysis or systematic review with a pooled estimate |
| `[STUDIE]` | A single primary study, design and n known |
| `[ANDRAHAND]` | A secondary source citing a study you have not seen |
| `[BOK]` | A textbook or monograph — authoritative on consensus, not on a specific effect |
| `[HEURISTIK]` | Practitioner best practice, no measurement behind it |
| `[OKÄND PROVENIENS]` | The claim's source cannot be identified, or is an unattributed document |
| `[OTÄCKT]` | Asked, and nothing in the corpus answers it. **Three different things look identical here:** the literature has no answer; the acquisition report cited a paper that failed to import; or the paper imported as **metadata only** and holds none of its own results. Establish which before recording a gap |

Add a tier when the corpus needs one rather than forcing a claim into the nearest fit —
`[OKÄND PROVENIENS]` exists because six documents in that corpus had no author.

A rule built on `[HEURISTIK]` is still worth having — it is the field's best practice — but it must
be labelled, so nobody later defends it as a finding. Keep the tier next to the rule it supports, not
only in the evidence file: a reader of the rule alone must see how strong it is.

## Corpus hygiene

`references/corpus-acquisition.md` covers where the corpus comes from and its limits. What to check in
the answers themselves:

- **Registered count ≠ unique count.** 235 sources, 223 unique in that corpus. Ask for both, or the same
  paper counts as two votes.
- **A confident sentence from a content-marketing page reads exactly like one from a journal.** The
  named-source requirement is what separates them, which is why it is in every block.
- **Unattributed synthesis documents.** Six in that corpus looked AI-generated. Anything whose "source"
  is a document with no author is `[OKÄND PROVENIENS]`.
- **Tool metadata is unreliable.** One paper was dated 2027. Do not quote a date the tool supplied
  without checking it against the source itself.
- **An answer that reaches outside the subject** is probably drawing on another project's material in
  the same notebook.

## Anti-patterns

| Anti-pattern | Fix |
|---|---|
| "Summarise what the sources say about X" | Ask for claims with numbers, designs and named sources |
| A block containing questions to the user and questions to the tool | Two separate messages. The pasted block speaks only to the tool |
| Asking something you could grep | Grep it |
| Twenty questions in one round | Six to eight, then a follow-up round |
| Accepting a number without its design | Ask what was compared against what, on whom |
| Never asking what is *missing* | Require an explicit "not covered" answer every round |
| Recording "no sources contradict this" from a truncated or self-repeating answer | That answer is degraded and reported none of the contradictions two clean runs found. Check the shape, re-ask, then trust the silence |
| Quoting a figure from the Deep Research report when the primary paper is also in the corpus | Measured: the report reshaped 49.45 % into 49.7 %, and in one case stated a real paper's finding with **the sign reversed**. Query the corpus for the number; ask the primary for its own table |
| Letting a report's excluded sources back in | They are in the corpus anyway. Name them in the query, or deselect them |
| Accepting a ranking that puts the unquantified item last | That ranks by availability of a number, not by effect. Ask for unrankable items listed separately |
| Accepting a reconciliation of two contradicting sources | Ask what each source *says* first. A plausible mechanism nobody published is the answer's own synthesis |
| Quoting a credited source or a verbatim sentence from one run | Both varied run to run while the numbers held. Two asks before writing down provenance |
| Asking one broad question and assuming the answer is a sweep | It is a sample. Ask narrowly — one subsystem or one tier family per question |
| Recording "not covered" as a gap in the literature | Ask whether the acquisition report cited something that failed to import — **or imported as metadata only**, which looks like a source and holds no results |
| Building a follow-up round on an earlier answer without quoting it back | Measured: a wrong detail travelled answer → summary → next question. Paste the earlier claim in verbatim and invite its refutation |
| A Deep Research prompt that asks for an explanation | Ask for measured evidence with effect sizes and named studies — the citations are the point, not the report |
| A plan that needs the author to add or prune sources by hand | It will not be executed. Put the guardrail in the acquisition prompt instead |
| An acquisition prompt with no report structure | The report is kept as a source; specify its sections and the corpus describes itself |
| Trusting "cite only high-quality sources" to keep junk out | Measured: it produced *more* citations and a *lower* official share. Deselect the source instead, or name categories rather than quality |
| Commissioning a run, or several, without reading what the last one cited | 300 is the ceiling and each run costs 18–50. Run one's gaps are what run two is for |
| Two runs that differ only in wording | One run and a wasted 18–50 slots. Divide by facet, not by phrasing |
| Filling all 300 slots | Keep 30–50 free for papers that must be added by hand |
| Testing the Deep Research prompt limit in the working notebook | A submit runs a real report and adds 18–50 padding sources. Paste without submitting, or use a scratch notebook |
| Treating the answer as the finding | It is a lead. The finding is what survives checking |
| Quoting the corpus's own count of itself | Ask for registered *and* unique |

## Verify

Before any claim from a round is allowed to change a rule:

1. **Trust the number from one answer; never the provenance.** Measured over three runs of the same six
   questions, 2026-09-06: **every figure was identical every time**, while the credited source and the
   quoted verbatim sentence both varied between runs. So a figure needs one ask; "according to Google's own
   documentation" needs two. And **check the answer's shape before trusting its silence** — a truncated or
   self-repeating answer is degraded, and the one such run reported none of the three contradictions the
   two well-formed runs both found. Details in `references/notebook-setup.md`.
2. **Check the transcribed number against the quoted sentence.** Both over-claims that got through
   last time were transcription-level: two effect sizes attributed to two studies when both belonged
   to one, and a latency finding written up as a probability finding. The numbers were right and the
   claim around them was not.
3. **Check that the tier matches the design.** If the study manipulated colour in word lists, the
   rule about markdown emphasis is `[indirect]`, whatever the effect size says.
4. **State the population and the material next to the effect size** in the rule itself, not only in
   the evidence file.
5. **Keep the `[OTÄCKT]` list.** It is the cheapest defence against re-deriving an answer the corpus
   never gave, and the honest answer when someone asks why a rule is only a heuristic.

## References

- `references/notebook-setup.md` — the four per-notebook settings to get right before asking anything:
  custom instructions (which govern Studio output too), source deselection, response length, and what
  happens to a saved answer. Also what Studio can generate, the figures this skill owns, and the
  reproducibility result.
- `references/corpus-acquisition.md` — the Deep Research half: the prompt skeleton, the slot arithmetic,
  the six steering levers and what each run measured. Read before commissioning a run.
- `references/reading-a-report.md` — **how to distrust what came back.** An eleven-check list, and the eleven
  measured ways a report or an answer has misled us: echo, number drift, reconstructed titles,
  cross-attribution, the leaking quarantine, and two reasoning defects. Read before acting on any answer.
- `references/round-template.md` — the query block, the two input limits, a worked round with the
  wording that produced `write-flashcards`' evidence, and the shapes a follow-up round should take.
