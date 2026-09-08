# Reading what comes back, adversarially

`corpus-acquisition.md` is how a corpus is commissioned. This file is how it is distrusted.

Everything here was measured on this vault's own notebooks on 2026-09-06 and 2026-09-07, over four Deep
Research runs and two query rounds. None of it is a warning about what *could* go wrong: each entry is a
failure that did occur, and most of them looked exactly like a correct answer at the time.

## The checklist

Eleven checks, in the order they are cheapest to apply. Each is here because it caught something.

1. **Is the answer well-formed?** A truncated answer, or one that repeats a section with different field
   labels, is degraded. The one degraded answer measured reported **none** of the three contradictions the
   two clean answers to the same questions both found. Discard and re-ask before reading further.
2. **Before planning what to acquire, ask what the corpus already holds.** Never infer its coverage from
   its reports — a report indexes the one finding it needed per paper, not the papers. This overturned two
   of three gaps I had asserted, and saved an entire acquisition run.
3. **Is this claim inherited from an earlier answer in this session?** If so, paste the earlier claim back
   verbatim and invite its refutation. A wrong detail travelled answer → summary → next question, and only
   an exact quote killed it.
4. **Is the source in the corpus, or is a report the only witness?** Ask directly. Eight headline claims in
   one answer turned out to rest only on our own reports.
5. **If the paper is named, is its full text in the notebook?** A source can import as **metadata only** —
   present in the list, counting against the cap, holding none of its own results. Ask this *before* asking
   what the paper says: one such question moved five figures down a tier, including a causal claim the whole
   picture rested on. **A citation landing in the corpus is not the paper landing in the corpus.**
6. **Does the number come from the report, a secondary summary, or the paper?** Prefer the paper, and
   re-ask for the figure if a secondary was quoted while the primary sits in the corpus. A report has been
   caught stating a real paper's finding with **the sign reversed** and error bars sixty-five times too
   wide. **If a figure carries an argument, check its direction against the primary before building on it.**
7. **If a table is the evidence, ask for its rows in the source's own order, including any baseline row.**
   A report has been caught reproducing a correct value column against labels shifted by one position,
   because it dropped the source's human-vs-human baseline row and did not shift the labels with it. Every
   number was real; every pairing was wrong. Spot-checking individual figures cannot detect this — only the
   row order can. And a table quoted without its baseline row has lost the thing that makes its numbers mean
   anything.
8. **Is the source one the report itself excluded?** Excluded sources are still in the corpus, and answers
   have quietly promoted them back into evidence.
9. **Does the attribution hold?** A number may be taken from one document; an attribution may not. Both
   reports and chat answers have credited the wrong paper.
10. **If the answer ranks things, is it ranking by effect or by availability of a number?** An unquantified
    item placed last is not a weak effect; it is a missing measurement wearing a low score.
11. **If the answer reconciles two contradicting sources, is the reconciliation quoted or invented?** A
    plausible mechanism nobody published is the answer's own synthesis in the same register as the data.

## Confirmation by echo

Once a report is a source, the corpus contains a document that **quotes other documents**. A later answer
can then present a claim as coming from "the report", when the report is quoting a blog — a chain two
links long that reads like one authoritative source. Worse, two reports on the same topic will cite many
of the same underlying pages, so "two sources agree" can mean *one blog, echoed twice*.

Two defences, both cheap:

- **Ask for the chain, not the citation.** The custom instructions require the source name *and* whether
  it is official or third-party; extend that to "if your source is itself quoting another source, name
  both." A claim whose chain ends at a marketing blog is `[ANDRAHAND]` no matter how many reports repeat
  it.
- **Never count agreement across reports as corroboration** unless the underlying pages differ. Run 1 and
  run 2 of the meta-notebook cite overlapping domains, so agreement between them is close to worthless as
  evidence.

**The clause that turns this from a warning into a measurement.** Added to the custom instructions on
2026-09-07: *"Two of the sources in this notebook are research reports that quote other papers; when a
claim comes from one of them, say whether the underlying paper is also in this notebook."*

It worked, and it is the highest-value line in the contract. The answer closed with a traceability map
naming **eight claims that only the reports support** — including the headline detector-comparison figure,
the Czech exception, the persistence of nominalisation under informal prompting, and the fine-tuning
result. Every one of those is a claim whose primary paper failed to import or was never cited directly,
and none of them was distinguishable from a first-hand finding until the question was asked.

Put this clause in any notebook that contains a Deep Research report. Without it, a corpus that quotes
itself is indistinguishable from a corpus of primary sources.

## Citation fidelity: the one thing that holds

**Audit 1, 2026-09-06.** A query answer was audited against local copies of the two reports it quoted.
**17 quoted sentences: 11 attributed to one of the two reports, and all 11 appear in it verbatim, in the
right one** — including one attributed to run 2's title that appears only in run 2. Zero cross-attribution
errors, zero invented quotes. The other six were attributed to original web pages we do not hold locally,
so their absence is expected rather than a failure.

**Audit 2, 2026-09-07**, against both text-corpus reports. Nine quotes were attributed to a report;
**eight are verbatim and in the correct report, zero in the wrong one, zero invented.** The ninth was
attributed to a primary paper rather than to a report, and that paper is in the notebook but not on disk —
unverifiable here, not wrong. Two audits, **nineteen checkable quotes, nineteen correct.**

Quoting *from documents in the corpus* is therefore the most reliable behaviour measured so far — more
reliable than the source attributions in a report's own inventory, and more reliable than a chat answer's
choice of which document to credit.

**The limit of that reassurance.** It says the tool quotes faithfully from documents *in the corpus*. It
says nothing about whether the underlying web page said what the report claims it said. That link in the
chain is still unaudited, and it is where the two `write-flashcards` over-claims came from. Spot-check a
quote against its **original** source before a claim is allowed to change a rule.

## The report's numbers drift from the paper's — and sometimes invert

The finding that changes how a report should be used. Measured mechanically against the local copies,
2026-09-07:

| | The report's figure | The answer's figure, quoted from the primary paper |
|---|---|---|
| False-positive drop after a diversity-raising prompt | "an absolute 49.7 % (from 61.3 % to 11.6 %)" | "decreasing by 49.45 % (from 61.22 % to 11.77 %)" |
| Detection drop after a literary-language prompt | "from up to 100 % to an average of 3 %" | "from 100 % to 13 %", with a 3 % average across detectors |

The strings `49.45` and `11.77` appear **nowhere** in the report, and `61.3% to 11.6%` appears only in the
report. So the report **rounded and reshaped** figures from a paper that is itself in the corpus, and
querying the corpus recovered the paper's own numbers.

**The drift is not a one-off: it recurred inside a single session.** Round 1 of the same conversation gave
the paper's `61.22 % → 11.77 %`; round 2 gave the report's `61.3 % → 11.6 %`. So which version you get is
not stable even with the corpus and the contract unchanged.

### The worst case: a fabricated statistic with the sign reversed

Found 2026-09-07 by asking a full-text primary paper for its own table. The local report states, attributed
by name to a real paper that is in the notebook in full text:

> "Average syntactic complexity, measured through dependency tree height, is **deeper and more uniform in
> model-generated texts**. Metric: Average parse tree depth. Effect size: Mean depth of 6.1 ± 1.1 for
> ChatGPT versus 4.8 ± 1.1 for humans."

That paper's own Table 1, on 467 985 texts:

| Dependency tree depth | Human | ChatGPT greedy | ChatGPT sampling | GPT-4 |
|---|---|---|---|---|
| | **6.83 ± 0.017** | 6.70 ± 0.012 | 6.75 ± 0.011 | 6.56 ± 0.011 |

Four things are wrong at once. **The direction is reversed** — humans are deeper, not shallower. The values
are wrong. The error bars are wrong by a factor of about sixty-five. And the summarising sentence asserts
the opposite of the data. None of `6.83`, `6.70`, `6.56` or `0.017` appears anywhere in either local report,
so this is not a transcription of anything in the paper.

**This is fabrication, not paraphrase.** It has the shape of a real finding — a plausible mean, a plausible
spread, a named source, a stated design — and it survived every check except one: asking the primary source
for its own numbers.

It also travelled. The figure was repeated by an AI-generated topic-summary page in the corpus, then by a
chat answer quoting that page, then written into a session summary as established fact. Four hops, no
contradiction raised at any of them, because each hop was faithfully quoting the previous one.

**So: never quote the report. Query the corpus for the number, and if the answer credits a secondary
source, ask the primary for its own table.** The report is a finding aid and a rejection log; the primary
paper, if its full text imported, is the source. Where it did not, a figure taken from the report is
`[ANDRAHAND]` at best, and must be written down with **the report** named as the source rather than the
paper.

**And the general lesson about direction.** A wrong magnitude is usually visible — it looks odd against
neighbouring figures. A wrong *sign* is invisible, because a reversed finding is exactly as coherent as the
real one and fits any narrative built around it. The reversed tree-depth claim was load-bearing for a
conclusion about deep structure being un-humanlike; the real table shows most features nearly identical and
the largest gap somewhere else entirely. **When a claim carries an argument, check its direction against the
primary source before the argument is built on it.**

## Bibliographic metadata is reconstructed, not copied

A distinct failure from quote fidelity: in the first text-corpus report the *claims* carried real
statistics, while the **source inventory reconstructed titles rather than copying them**. Four of nineteen
entries named a paper by a plausible paraphrase of its subject, and one put a PubMed Central accession
number — `PMC11422446` — in the **author** column, with a title that did not match the title in the
report's own URL list.

Why this matters more than it looks. The inventory's whole value is that a claim can be traced to a
findable paper. A paraphrased title is **not findable**: searching for it returns nothing, and a reader
cannot tell a real title from a reconstructed one without checking every entry. The five-section structure
therefore delivered a usable rejection log and an unusable bibliography in the same document.

**Trust the report's numbers over the report's citations**, and treat the URL list at the bottom as the
only trustworthy index of what the corpus holds.

### The title clause, tested

Added to the next run's inventory section, the same day:

> Copy each title EXACTLY as printed on the source itself; never paraphrase, shorten or reconstruct a
> title, and if you cannot see the exact title, write "title not verified" instead of guessing.

Across the 19 inventory rows of that run: **9 rows wrote "title not verified"**, and the other 10 carried
real titles, verbatim and correctly attributed — *GPT detectors are biased against non-native English
writers*, *RAID: A Shared Benchmark for Robust Evaluation of Machine-Generated Text Detectors*, *A
Watermark for Large Language Models*, *Can AI-Generated Text be Reliably Detected?*, *The Misclassification
of Autistic Writing as AI-Generated*, *Testing of detection tools for AI-generated text*.

**The clause did not make the tool better informed; it made the tool's ignorance visible.** The earlier run
reconstructed four titles with no signal that it was guessing; this one abstained nine times and said so.
That is the ideal shape for a guardrail — a silent fabrication becomes a loud gap, and a loud gap is
something a later round can chase. Keep the clause in every acquisition prompt, and in the notebook's
custom instructions so it applies to answers too.

## The index-shifted table: every number real, every pairing wrong

Found 2026-09-07, in a run where the title clause was active. A report reproduced a primary database's
shift-vector table like this, set against the source's own row order:

| Report's label | Report's value | What the value actually belongs to |
|---|---|---|
| gemini-2.0-flash-exp 1.0 | 7.1 | `llama-3.1-405b complete 1.0` |
| davinci-002 (complete) 1.0 | 7.2 | *Original corpus: first vs. second part* — the human baseline |
| llama-3.1-405b 1.0 | 33.5 | `gemini-1.5-pro-002 1.0` |
| llama-3.1-405b 0.0 | 33.8 | `gpt-4-turbo 1.0` |

The value column is correct and in the source's order. The report **dropped the source's first row — a
human-vs-human baseline — and did not shift the labels with it.** The result presents a baseline as a model
score and the worst instruction-tuned configuration as the best available, reversing the paper's own
conclusion.

**Why this is worse than the sign reversal.** A reversed sign is implausible to anyone who knows the field.
A transposed table is internally consistent, arithmetically sound, and every individual figure survives a
spot-check against the source. Only the *pairing* is false — and pairing is exactly what checking numbers one
at a time cannot test.

What caught it: quoting **both** conflicting claims back verbatim in one question, naming their numbers, and
forbidding reconciliation. The answer returned the source's own row order, which is the only view in which a
shift is visible. Confirmed mechanically afterwards — three of the corrected values, and the string
`Original corpus`, appear in none of our reports, so the correction came from the primary rather than from
re-reading our own text.

**So: when a table carries the argument, ask for its rows in the source's order and demand any baseline or
reference row.** A table quoted without its baseline has lost the thing that makes its numbers mean anything
— here, that the best model configuration sits inside the range a human corpus differs from itself.

One further lesson from the same inventory row: it gave the study a **confident fabricated title** and
labelled an arXiv preprint a *"peer-reviewed journal article"*, in the run where seven other rows correctly
wrote `"title not verified"`. The title clause reduces confident invention; it does not eliminate it. Where
the source *kind* decides how much weight a claim gets, verify it separately from the title.

## Cross-attribution, in both directions

**Inside a report.** A false-positive-rate claim about detectors flagging non-native English writers was
attributed to a paper whose own subject is register dimensions, and the named source disagreed with the
inline citation index in the same sentence.

**Inside a chat answer.** A round-1 answer reported a detector's accuracy rising "on the Reddit domain".
The string appears in **neither** local report; what the reports contain is an unrelated study of ~60 000
**Reddit posts** about autistic writing. The answer had taken a token that was in its context for one
reason and attached it to numbers from another source. Round 2, asked with the claim quoted verbatim,
identified it as a *"conversational deictic mischaracterization from the previous chat turn"* and gave the
correct reading: the rise is an overall figure across all domains.

So the rule generalises in both directions: **a number may be taken from one document, an attribution may
not.** And two unrelated facts sharing a word is enough for one to inherit the other's detail.

## The exclusion quarantine, and how it leaks

**It works in the report.** One run cited eight domains of exactly the kind the categorical line excludes.
That looks like the filter failing until you read where they appear: the report **named five of them as
excluded** and used them only to say which claims rest on them alone, under "Not documented". A vendor
benchmark was cited *as an example of an unreplicated vendor benchmark*.

So a junk domain in the URL list is not by itself evidence the instruction failed. Check whether the claim
it supports sits in "Findings" or in "Not documented" — opposite outcomes that look identical to a domain
count.

**It leaks at query time.** Every excluded source is still in the corpus, because a cited URL is imported
regardless of *why* it was cited. Asked to rank interventions by measured effect, an answer's second and
third ranks came from the quarantined sources, presented in the same table as a peer-reviewed result and
labelled only "citing secondary/unverified sources". The report had done the sorting; the answer undid it.

**The fix is tested.** Naming the excluded domains in the round itself worked three times over in one
answer: it marked one claim excluded, withheld a specific figure — *"the ending rate of 56.65 % is excluded
as it rests on the excluded GradPilot source"* — and closed the ranking with an exclusion note. Deselecting
them in the notebook is stronger still, because it also covers Studio and cannot be forgotten. See
`notebook-setup.md` §2.

## The report is a lossy index of the corpus

The mistake I made on 2026-09-07, and it is worth more than any of the defects above because it was mine
rather than the tool's.

Asked what the corpus covered, I answered by measuring the **reports** — grepping the two local copies for
model names and languages. On that basis I told the author that Claude appeared **zero** times, that Gemini
appeared once, and that the whole corpus was therefore about OpenAI models. Then a round asked the corpus
directly, and the corpus answered: one full-text primary paper alone measures **sixteen frontier models**
across four vendors, including four Claude versions and four Gemini variants, and a second measures Claude,
Gemini and GPT side by side.

Measured against the local copies, here is why the inference failed:

| Present in the corpus | Mentioned in either report |
|---|---|
| Claude (four versions, two papers) | **no** |
| Mistral, Cohere, MPT-30B, davinci, LLaMA base models | **no** |
| A 1 970-article German news subcorpus with per-detector accuracies | only the word "German" |
| 391 Hungarian reviewers delivering 741 evaluations | only the word "Hungarian" |
| Base-model-versus-instruction-tuned comparisons | **no** |

**The mechanism is structural, not a fault in the report.** A report cites papers and summarises the one
finding it needed from each. Everything else in those papers — their model lists, their subcorpora, their
raters, their per-language breakdowns — is in the corpus and invisible in the report. A 25 KB report cannot
index 20 papers.

Three consequences:

1. **Never characterise a corpus from its reports.** Ask the corpus. "Which models has each source actually
   measured?" and "does any source measure <language>?" are one round, cost nothing, and in this case
   overturned two of three claims I had made confidently.
2. **A gap you inferred is not a gap.** The one gap that survived contact with the corpus was Swedish, and
   it survived because the answer said "not covered" explicitly. The other two were artefacts of my method.
3. **Ask before commissioning.** I was about to spend 18–50 slots on a run to acquire Claude and Gemini
   coverage that the corpus already had. One free query round replaced an entire acquisition run.

The general form: **the corpus knows what it contains and will say so.** Every question of the shape "what
does this notebook actually hold about X" is cheap, and it is the first question to ask when planning what
to acquire next.

## Quoting the secondary when the primary is present

A smaller instance of the same family, found in the same answer. The tree-depth figure — machine text at
6.1 ± 1.1 against human 4.8 ± 1.1 — was quoted from an **AI-generated topic-summary page** that cites the
study, while the study's own ACL paper is in the notebook **in full text**. The answer labelled the summary
honestly as a "secondary curation source", so nothing was hidden; it simply reached for the nearest quote
rather than the best one.

So the number-drift rule needs a companion: **when a figure is attributed to a secondary source, ask
whether the primary is also in the corpus, and re-ask for the figure from the primary.** Every layer
between the measurement and the quote is a place where a number has already been observed to move.

## Two reasoning defects worth naming

Neither is a fabrication, and both survive every check above.

**A ranking by availability of a number, presented as a ranking by effect.** Asked to rank interventions by
measured effect, an answer put target-domain fine-tuning **last** while stating in the same paragraph that
its effect "is described qualitatively as a dramatic drop" and "the precise mathematical effect is not
fully quantified". Fine-tuning is the one intervention another source in the same corpus calls the most
systematic threat to detection. The honest output was "cannot be ranked — no number", and the format
quietly converted a missing measurement into a low score.

**Ask for the unrankable items in a separate list.** Tested, and it worked: the next round returned nine
interventions with numbers and three explicitly without, and named the paper for each.

**A reconciliation invented to dissolve a real contradiction.** Two peer-reviewed papers in one notebook
disagree about the *direction* of an effect, and one of them attributes to the other the opposite of what
it found. The answer labelled the section "conflicting findings" and then produced a two-mechanism
explanation, neither mechanism quoted from any source. Plausible — and the answer's own synthesis, in the
same register as the measurements.

**When the contradiction clause fires, the next question is "what does each source actually say", not "how
can both be true".** Asked that way, with reconciliation explicitly forbidden, the next round stated the
miscitation plainly and gave both papers' own numbers, designs and sample sizes.
