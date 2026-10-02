# Querying a NotebookLM corpus through a human relay — complete synthesis

> **What this file is.** A single, self-contained synthesis of everything one project learned about
> getting evidence-grade answers out of a NotebookLM corpus when an AI agent cannot see the tool and
> must hand a human a block to paste. It covers building the corpus (Deep Research), setting the
> notebook up, writing a query round, tiering what comes back, and — at the greatest length, because it
> is where the value is — distrusting the answer. It is written to be read by an AI agent with none of
> the surrounding context. Every failure described here actually occurred during 2026-09-06 to 09-10
> across multiple Deep Research runs and query rounds; most of them looked exactly like a correct answer
> at the time.
>
> **Caveat on all product figures.** NotebookLM and Gemini Deep Research are moving targets. Every
> numeric limit, cap, and tier below was a *dated reading* of one person's setup, not an invariant.
> Re-verify before relying on any of them. The reasoning and the failure modes are durable; the numbers
> are not.

---

## 0. The situation

You cannot see the corpus and you cannot ask a follow-up mid-answer. A human copies your block into
NotebookLM and brings the output back, which makes every round an expensive round trip and an ambiguous
question a wasted one.

The output you want is **not a summary.** It is claims with enough provenance attached that each can be
tiered and later defended: what was measured, on whom, against what, with which number, from which named
source. A summary reads well and is useless the moment someone asks "how strong is that, really?"

**Treat the answer as a lead, not a finding.** The finding is what survives the checking in §7.

---

## 1. The corpus is something you write (Deep Research)

Sources reach the notebook through **Gemini Deep Research**: you give it a prompt, it writes a report,
and **the sources that report *cites* are added to the notebook automatically** (uncited sources are
visible but must be added by hand). So the acquisition prompt is **a request for a bibliography, not a
report** — it is the only lever that decides what the corpus can ever answer. A prompt that asks "explain
X" gets cited explainers; one that asks what the measured evidence establishes, with effect sizes, gets
cited studies.

**Ask for disconfirming evidence at acquisition time, not only when querying.** A report that never
looked for a contradiction cites no source carrying one, and no later question can recover it.

### Three hard constraints

| Constraint | Consequence |
|---|---|
| **Sources per notebook is plan-dependent** (observed 300 on one plan; reported 50/100/300/500/600 across tiers) | A notebook holds roughly **6–15 Deep Research runs**. Confirm the cap before doing arithmetic on it |
| **Some sources never import** — aggregator *mirrors* (ResearchGate) and publisher *portals* fail; primary hosts (arXiv, ACL Anthology, MLR, OpenReview, PMC) do not | A paper can be *named in the report and absent from the corpus*. Each run imports **18–50** sources; ~13 % of an academic run's citations fail, nearly all mirrors of works that arrived anyway |
| **One notebook accumulates several projects' runs** | An answer that wanders outside the subject is probably drawing on unrelated material. One notebook per subject where possible; otherwise scope every question explicitly |

### A source can import and still hold nothing

The invisible failure: a source lands, counts against the cap, and carries **only an abstract** (observed
with arXiv `/abs/` URLs, where `/pdf/` and `/html/` URLs of the same paper import in full). A notebook can
show a paper you believe you have while holding only its title and abstract. **Before treating a paper as
evidence, ask whether its *full text* is in the notebook** — not just whether it is listed. A known-missing
paper is worth one manual source-add, not another 18–50-slot run.

### The levers that actually steer acquisition (measured)

Human curation is often unavailable (the owner may refuse to add or prune sources by hand). Put all
quality control in the prompt:

- **Deselect junk sources in the notebook** (one checkbox each). Documented to exclude a source from
  **chat and Studio both**. Strongest filter, but it does **not free a slot** — inactive sources still
  count against the cap.
- **Demand a datum only the wanted source carries** — *the single most reliable lever found.* Deep
  Research selects sources to satisfy the **question**, not the bibliography instruction. So to reach a
  particular class of source, demand a fact only it publishes. Confirmed across three runs on one
  notebook: demanding national drug-regulator vocabulary (ATC codes, the regulator's own
  adverse-effect frequency category names, a country-specific potency class) took official-source
  citations from 0 → 6 → **23**, and pulled national-official share to 35 of 69 citations. A marketing
  page cannot supply a confidence interval, a GRADE rating or a per-arm n — demanding those per claim
  excludes junk **more reliably than forbidding it**.
- **Make the report describe its own sources** — because the report is itself added to the corpus, a
  specified structure turns it into the notebook's own metadata (see §1 report skeleton). Costs ~600
  characters, pays off on every later query.
- **One demand per numbered line.** A demand bundled with five others in one sentence returns almost
  nothing; the same demands on separate lines return everything.
- **Ask for an explicit absence** — `If a source does not give the value asked for, write NOT FOUND
  rather than substituting a different value`. Produced 39 and 17 explicit NOT FOUNDs in two runs;
  before it, an unavailable value came back as a nearby value from a different source, indistinguishable
  from an answer. One sentence, highest-yield honesty clause measured.
- **Name specific works to fetch** — gets their *citation* into the corpus (and documents an absence if
  not found), but does **not** get the paper's full text in. Use it to close a provenance gap, then ask
  whether the text is present.

### The levers that FAILED (measured — do not retry blind)

- **"Cite only high-quality sources" / evaluative wording.** Backfired: produced *more* citations and a
  *lower* official share (triangulation likely raises sources-per-fact). Removed from the skeleton
  entirely.
- **Naming a domain to exclude.** No force. A prompt that named ResearchGate in a DO-NOT-CITE list drew
  seven ResearchGate citations and ten sites from the excluded categories, including a drug maker's own
  promotional site for the very drug under evaluation.
- **Naming domains to *include* (a whitelist).** Only half honoured: of five named sources, two cited,
  three cited zero times.
- **A format field with a closed value set you supplied.** A `POPULATION` field with four permitted
  values came back `mixed` on all 41 entries — populated, discriminating nothing. Ask for a number and a
  description that must be *read out of the source* instead.

### Structure survives; the copy path destroys it

Deep Research *does* follow structure instructions, but newlines are lost in transit, so a requested
table arrives as one 8,680-character line and looks ignored. **Ask for one line per source prefixed with
a literal token** (e.g. `###SRC###`) and pipe-delimited fields — confirmed to parse 1:1 every time.
Never ask for a markdown table or rely on line breaks.

### Operational cautions

- **Never fire a run while a query round is open**, and never both at once. A run lands without warning
  (minutes to tens of minutes) and changes the corpus underneath the round — answers before and after
  are drawn from different source sets and nothing says so. Query first, then fire; or wait the run out.
- **A cumulative paste silently contaminates a measurement.** A run's exported file has arrived
  containing the *previous* run in full with the new one appended. Before measuring any run, check
  whether the file *starts with* an earlier run.
- **The count the interface shows is the *citation* count, not what landed.** Reconcile four different
  quantities: cited, failed-to-import, imported, and notebook total. Only the last is the slot budget.
- **Budget the run set.** Divide by *facet*, not by phrasing (two runs differing only in wording are one
  run and a wasted 18–50 slots). Fire the broad one first, read what it cited, then aim the next.
  Keep 30–50 slots free for manual adds. Ask for the slot count between runs.
- **Store every report** (with a date), or the citation mix cannot be counted and no claim audited later.

### The acquisition prompt skeleton (~1,500 chars; hard limit ~5,000 but shrinks under load toward ~1,200)

```text
Write a research report on <narrow question>, based on empirical research literature.

Requirements for the sources you cite:
- prioritise meta-analyses and peer-reviewed primary studies over summaries and practitioner blogs;
- for each finding, give the effect size, the sample, and the study design;
- name authors and years;
- include studies that FOUND NO EFFECT or the OPPOSITE effect, and studies that disagree with each
  other, and say what each measured;
- state where the evidence is thin or absent rather than filling the gap.

Exclude marketing blogs, SEO listicles, affiliate content and undated tutorials. Prefer official
documentation, peer-reviewed papers and primary studies. Where a point rests only on an excluded kind
of source, put it under "Not documented" and say how many such sources you found.

Write the report in exactly this structure, because the report itself will be kept as a source:
1. "Findings", one claim per line, each with its effect size, sample, design and named source.
2. "Single-source claims" - every claim resting on exactly one source, naming it.
3. "Not documented" - every point no acceptable source answers.
4. "Source inventory" - one line per source prefixed with the literal token ###SRC###, pipe-delimited:
   authors | title | year | kind of source | the one thing it was used for. Copy each title EXACTLY
   as printed on the source; never paraphrase or reconstruct a title, and write "title not verified"
   if you cannot see it.
5. "Discarded" - how many sources you read but chose not to cite, and the main reasons.

Cite these specific works if they exist, and say so under "Not documented" if you cannot reach any of
them: <named paper with authors, venue and year>; <a named replication or comparable dataset>.

Cover: <three or four specific sub-questions, each answerable from a study>.
```

---

## 2. Set the notebook up before querying (four per-notebook settings)

1. **Custom instructions — set the output contract once** (ceiling ~10,000 chars; the contract below is
   ~1,365). Documented to govern **chat and every Studio output**. This is where the per-claim provenance
   demand lives so it does not have to be pasted into every round:

   ```text
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
   ```

   **Verify it took effect**: ask one question whose answer shape you know, and check the response carries
   the date, source name and "contradicts" line unprompted.

2. **Deselect sources you do not trust** — checkbox per source, covers chat and Studio, certain rather
   than probabilistic. Still counts against the cap.
3. **Response length** — set to **Longer** for evidence rounds; a shortened answer is where the verbatim
   sentence and provenance chain get dropped.
4. **Know what a saved answer is.** A chat answer can be pinned and then *converted to a source* — at
   which point the notebook may cite its own earlier output as if independent. A saved answer is a
   convenience, not a source. If you convert one, label it so a later round can tell a corpus from a hall
   of mirrors.

**Studio outputs, judged for worth:** Quizzes/Flashcards are retrieval practice but **cannot be
downloaded** — use them as a *diagnostic* (generate questions, see which the existing deck cannot answer),
not as a source. Reports/Data tables are exportable. Mind maps/infographics/slides help decide what a
chapter contains. Audio/video overviews are *restudy*, and the evidence is against restudy.

---

## 3. Decide whether a round is worth a round trip

Anything you can settle by reading the material yourself, grepping, or running a script is **not** a
NotebookLM question. **Never build a notebook out of material you already hold** — routing a book you have
through a notebook adds a lossy paraphrase and buys nothing. This tool is for literature nobody holds
(learning science, a field's findings), not for content you can read directly.

Before the first round, **ask what is in the corpus** — how many slots used, what kinds of source, which
other projects' material is present, and whether anything the acquisition report cited failed to import.
If the corpus cannot answer the question, the next move is a Deep Research run (or a manual add), not a
query.

---

## 4. Write the round as one pasteable block

Hard limit **~3,800 characters** (verified: a 3,800-char block arrives whole, end code returns — the
boundary is a clean rejection, not silent truncation). Aim at **3,600** for counting slack. Two messages
per round, always: one to the human explaining why the round exists, and the block, which speaks **only to
the tool** — no "let me know if", no questions the tool would ask back.

The contract (per-claim provenance) lives in custom instructions; later rounds open with "use the format I
gave earlier". So a block is **6–8 numbered questions**. Twenty questions gets twenty shallow answers
regardless of the limit.

### Query block skeleton

```text
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
...
8. <question>
```

### What each element defends against

| Element | Failure it prevents |
|---|---|
| "Answer only from the sources in this notebook" | Answers drifting into general model knowledge, indistinguishable from grounded ones |
| Verbatim sentence | A paraphrase that drops the qualifier the whole claim depends on |
| Design and n | A bare `d = 0.40` cannot be weighted; a reverse effect gets misread as a mistake |
| Named source | No way to tier the claim or re-find it |
| Kind of source | Meta-analysis and blog post quoted with equal confidence |
| "not covered" | Fluent invention, with nothing marking it as invention |
| "what contradicts this" | Manufactured agreement — the corpus is not consulted for disconfirmation unless asked |
| Numbered answers | Answers that cannot be matched back to questions, making transcription guesswork |

### Aim questions at boundaries, not confirmation

The round that produced the most value asked about *boundaries and failures*, not whether the technique
works. Example question that surfaced a key boundary: *"Is there any study in which testing performed
WORSE than an alternative? If so, what was the task, the comparison, and the effect size and direction?"*
— it returned a reverse testing effect nothing else in the round would have surfaced. Another question
returned "not covered", which is why a rule stayed tagged heuristic instead of being asserted.

### Follow-up rounds

Aim each at something the previous answer exposed: a contradiction, a number without a design, a protocol,
or a claim you are about to act on (ask the corpus to argue against it). **Quote the previous answer back
verbatim** — a precisely quoted claim can be falsified; a paraphrased one cannot. (Measured: a wrong
detail — a figure wrongly attributed to "the Reddit domain" — travelled answer → summary → next question,
and was killed only because the next question quoted its numbers, the method name and the domain back
exactly.)
**Stop when a round returns mostly "not covered"** — the corpus telling you its edge — *provided* you have
checked the gaps are real gaps and not failed imports.

---

## 5. Tier what comes back

| Tier | Means |
|---|---|
| `[META]` | Meta-analysis or systematic review with a pooled estimate |
| `[STUDY]` | A single primary study, design and n known |
| `[SECONDHAND]` | A secondary source citing a study you have not seen |
| `[BOOK]` | A textbook/monograph — authoritative on consensus, not on a specific effect |
| `[HEURISTIC]` | Practitioner best practice, no measurement behind it |
| `[UNKNOWN PROVENANCE]` | The claim's source cannot be identified, or is an unattributed document |
| `[UNCOVERED]` | Asked, and nothing in the corpus answers it |

**`[UNCOVERED]` has three different meanings that look identical** — establish which before recording a
gap: (a) the literature has no answer; (b) the acquisition report cited a paper that failed to import;
(c) the paper imported as **metadata only** and holds none of its own results.

A rule built on `[HEURISTIC]` is still worth having, but it must be **labelled next to the rule it
supports**, not only in an evidence file — a reader of the rule alone must see how strong it is. Add a
tier when the corpus needs one rather than forcing a claim into the nearest fit.

### Corpus hygiene checks on the answers themselves

- **Registered count ≠ unique count** (one corpus: 235 registered, 223 unique). Ask for both, or the same
  paper counts as two votes.
- **A confident sentence from a content-marketing page reads exactly like one from a journal** — the
  named-source requirement is what separates them.
- **Unattributed synthesis documents** (AI-generated-looking, no author) are `[UNKNOWN PROVENANCE]`.
- **Tool metadata is unreliable** — one paper was dated 2027. Do not quote a tool-supplied date without
  checking the source.
- **An answer that reaches outside the subject** is probably drawing on another project's material.

---

## 6. Anti-patterns (acquisition + query)

| Anti-pattern | Fix |
|---|---|
| "Summarise what the sources say about X" | Ask for claims with numbers, designs and named sources |
| A block mixing questions to the human and questions to the tool | Two separate messages; the block speaks only to the tool |
| Asking something you could grep / already hold | Grep it / read it |
| Twenty questions in one round | Six to eight, then a follow-up round |
| Accepting a number without its design | Ask what was compared against what, on whom |
| Never asking what is *missing* | Require an explicit "not covered" answer every round |
| Recording "no sources contradict this" from a truncated/self-repeating answer | That answer is degraded and the one such run reported none of the contradictions two clean runs found. Check shape, re-ask, then trust the silence |
| Quoting a figure from the Deep Research report when the primary paper is also in the corpus | Reports reshape numbers and have reversed a sign. Query the corpus; ask the primary for its own table |
| Letting a report's excluded sources back in | They are in the corpus anyway. Name them in the query, or deselect them |
| Accepting a ranking that puts the unquantified item last | That ranks by availability of a number, not by effect. Ask for unrankable items listed separately |
| Accepting a reconciliation of two contradicting sources | Ask what each source *says* first. A plausible mechanism nobody published is the answer's own synthesis |
| Quoting a credited source or verbatim sentence from one run | Both varied run to run while the numbers held. Two asks before writing down provenance |
| Assuming one broad answer is a sweep | It is a sample. Ask narrowly — one subsystem or tier family per question |
| Recording "not covered" as a gap in the literature | Ask whether something failed to import, or imported as metadata only |
| Building a follow-up on an earlier answer without quoting it back | Paste the earlier claim verbatim and invite its refutation |
| A Deep Research prompt that asks for an explanation | Ask for measured evidence with effect sizes and named studies — the citations are the point |
| A plan that needs a human to add or prune sources by hand | It may not happen. Put the guardrail in the acquisition prompt |
| An acquisition prompt with no report structure | The report is kept as a source; specify its sections so the corpus describes itself |
| Trusting "cite only high-quality sources" to keep junk out | It produced *more* citations and a *lower* official share. Deselect, or demand a datum only a good source carries |
| Naming a domain to include or exclude | Unreliable in both directions. Demand the fact only the wanted source publishes |
| A format field with a closed value set you supplied | It gets filled with a constant. Ask for a value read out of the source |
| Asking for a markdown table or relying on line breaks | The copy path destroys newlines. Use a literal token prefix + pipe delimiters |
| Commissioning a run without reading what the last one cited | 300 is the ceiling and each run costs 18–50. Run one's gaps are what run two is for |
| Two runs differing only in wording | One run and a wasted 18–50 slots. Divide by facet |
| Filling all slots | Keep 30–50 free for manual adds |
| Testing the Deep Research prompt limit in the working notebook | A submit runs a real report and adds 18–50 padding sources. Use a scratch notebook |
| Firing a run while a query round is open | The corpus changes mid-round. Query first, then fire |
| Treating the answer as the finding | It is a lead. The finding is what survives checking |

---

## 7. Verify — reading the answer adversarially

This is where the value is. Every item below is a failure that occurred and looked like a correct answer.
Run the checks in roughly this order (cheapest first) before any claim is allowed to change a decision.

1. **Is the answer well-formed?** A truncated answer, or one repeating a section with different field
   labels, is degraded. The one degraded answer measured reported **none** of the three contradictions
   the two clean answers to the same questions both found. Discard and re-ask before reading further.
2. **Ask what the corpus already holds before planning to acquire more** — never infer coverage from the
   reports. A report indexes the one finding it needed per paper, not the papers. Grepping the *reports*
   once "proved" a corpus contained zero Claude mentions; asking the *corpus* showed one paper alone
   measured sixteen frontier models including four Claude versions. This overturned two of three asserted
   gaps and saved an entire acquisition run.
3. **Is this claim inherited from an earlier answer in this session?** Paste it back verbatim and invite
   refutation (see §4 follow-ups).
4. **Is the source in the corpus, or is a report the only witness?** Ask directly. Eight headline claims
   in one answer rested only on the project's own reports. The custom-instruction clause *"when a claim
   comes from a report that quotes another paper, say whether the underlying paper is also in this
   notebook"* is the highest-value line in the contract — it produced a traceability map naming exactly
   those eight.
5. **If the paper is named, is its *full text* in the notebook, or metadata only?** Ask this *before*
   asking what the paper says. One such question moved five figures down a tier, including the causal
   claim a whole picture rested on. **A citation landing is not the paper landing.**
6. **Does the number come from the report, a secondary summary, or the paper?** Prefer the paper; re-ask
   if a secondary was quoted while the primary is in the corpus. A report has been caught stating a real
   paper's finding with **the sign reversed** and error bars ~65× too wide — a fabricated statistic with
   the shape of a real one (`6.1 ± 1.1` where the paper's table said `6.83 ± 0.017`, direction inverted).
   **A wrong magnitude looks odd against neighbours; a wrong sign is invisible, because a reversed finding
   is exactly as coherent as the real one.** When a claim carries an argument, check its *direction*
   against the primary before building on it.
7. **If a table is the evidence, ask for its rows in the source's own order, including any baseline row.**
   A report reproduced a correct value column against labels shifted by one position, because it dropped
   the source's human-vs-human baseline row without shifting the labels — every number real, every
   pairing wrong, presenting a baseline as the best model score and reversing the paper's conclusion.
   Spot-checking individual figures cannot detect this; only row order can.
8. **Is the source one the report itself excluded?** Excluded sources are still in the corpus; answers
   have quietly promoted them back into evidence. (The fix — naming the excluded domains in the round —
   worked three times in one answer: it withheld a specific figure as "excluded as it rests on the
   excluded GradPilot source".)
9. **Does the attribution hold?** A number may be taken from one document; its attribution may not. Both
   reports and chat answers have credited the wrong paper, and two unrelated facts sharing a *word* is
   enough for one to inherit the other's detail.
10. **If the answer ranks things, is it ranking by effect or by availability of a number?** An item placed
    last while described as "a dramatic drop, not fully quantified" is a *missing measurement wearing a
    low score*, not a weak effect. Ask for unrankable items in a separate list.
11. **If the answer reconciles two contradicting sources, is the reconciliation quoted or invented?** When
    the contradiction clause fires, the next question is "what does each source actually say", not "how
    can both be true" — with reconciliation explicitly forbidden.

### Two things that hold up

- **Citation fidelity from documents in the corpus is the most reliable behaviour measured** — two audits,
  nineteen checkable quotes, nineteen verbatim and correctly attributed, zero cross-attribution, zero
  invented. *But this says nothing about whether the underlying web page said what the report claims.*
  That link in the chain is still unaudited and is where over-claims have come from — spot-check a quote
  against its **original** source before a claim changes a rule.
- **Numbers are reproducible; provenance is not.** Three runs of the same six questions: **every figure
  identical every time**, while the credited source and the quoted verbatim sentence both varied. So **a
  figure needs one ask; "according to the official docs" needs two.** And a confirmed-before-the-result
  prediction was wrong once (conflating two adjacent facts), which is itself the lesson — a degraded run
  (run A) produced a false generalisation that two clean runs corrected.

### Confirmation by echo

Once a report is a source, the corpus contains a document that **quotes other documents**, so a claim can
arrive wearing one layer of authority it has not earned, and two reports on one topic cite overlapping
pages — "two sources agree" can mean *one blog echoed twice*. Defences: ask for the *chain* not the
citation (a claim whose chain ends at a marketing blog is `[SECONDHAND]` however many reports repeat it),
and never count agreement across reports as corroboration unless the underlying pages differ.

### Transcription is where over-claims entered

Both over-claims that once got through were transcription-level, not tool-level: two effect sizes
attributed to two studies when both belonged to one, and a latency finding written up as a probability
finding. The numbers were right and the claim around them was not. So, before a claim changes a rule:
check the transcribed number against the quoted sentence; check that the tier matches the design (if the
study manipulated colour in word lists, a rule about markdown emphasis is `[indirect]` whatever the effect
size); state the population and material next to the effect size in the rule itself; and keep the
`[UNCOVERED]` list — it is the cheapest defence against re-deriving an answer the corpus never gave.

---

## 8. Dated reference figures (re-verify before relying)

| Figure | Value (one setup, 2026-09) |
|---|---|
| NotebookLM chat input limit | 3,800 characters (end-code verified; aim 3,600) |
| Deep Research prompt limit | 5,000 characters, shrinking under load toward ~1,200 |
| Custom instructions ceiling | 10,000 characters |
| Sources per notebook | 300 on this plan (tiers reported 50/100/300/500/600) |
| Sources imported per Deep Research run | 18–50 (five runs: 40, 50, 18, 26, 27) |
| Import failure rate | ~13 % of cited sources (mostly mirrors of works that arrived anyway) |
| Max per source | 500,000 words / 200 MB |
| Numeric reproducibility | zero drift over 6 questions × 3 runs |

Two things are known **not** to be documented anywhere (the corpus answered "not covered"), so your own
measurements are the only evidence: whether asking for high-quality sources changes the citation mix, and
the input-length limits. Both took ten minutes to measure — do not assume an undocumented limit is
unknowable.
