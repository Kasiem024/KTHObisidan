# Building the corpus: the Deep Research half

Read this before commissioning a run. `SKILL.md` states the principle — the acquisition prompt is a
request for a bibliography, not for a report — and this file is the arithmetic and the wording.

## Where these facts come from

Everything below was reported by the vault's author from their own use, not read from Google's
documentation, and it held on 2026-09-06 in their setup. The two character limits were measured by
pasting test blocks, so they are observations. The rest — the auto-add behaviour, the 300-source cap,
the per-run source count, ResearchGate never importing — is one person's account of a product that changes
and whose caps may be plan-dependent.

**Ask rather than assume.** If a number turns out to be different, the advice built on it inverts:
"six to fifteen runs" and "keep 30–50 slots free" are arithmetic on the cap, not principles. This has
already happened once: the per-run figure was recorded as "20–50" from two runs, then a third returned
18, so the range and every slot calculation resting on it had to be redone. Treat a two-observation
range as a guess with error bars, not a constraint.

## The mechanism, and the three constraints it imposes

The author gives **Gemini Deep Research** a prompt, it produces a report, and **the sources that report
cites are added to the notebook automatically**. Uncited sources are visible but must be added by hand.

| Constraint | Consequence |
|---|---|
| **Sources per notebook is plan-dependent** — reported as 50 / 100 / 300 / 500 / 600 for Standard / Plus / Pro / Ultra tiers, 300 for Enterprise, and the author's own notebook caps at **300**. Each run has returned **18–50** | On this plan a notebook holds roughly **six to fifteen runs** — more headroom than the earlier estimate of three to six, which rested on a per-run figure of forty-to-a-hundred that no run has matched. Confirm the cap before doing the arithmetic; it is not a constant. **The tier labels are contested** — one third-party source puts Plus at 300 rather than 100 — but the author's observed 300 is not, and that is the only figure the arithmetic needs. |
| **Some sources cannot be imported** — see the log below | They are cited in the report, land in the notebook unusable, and get removed. So a paper can be *known to exist and named in the report* while being absent from the corpus. |
| **One notebook accumulates several projects' runs** | That corpus also held SVD, Mundell-Fleming, MESI and RAG material from unrelated work. One notebook per subject where possible; otherwise scope every question explicitly and treat an answer that reaches outside it as suspect. |

### Sources that failed to import

Kept as a **record, not a blocklist.** A failed import costs no slot — it lands unusable and is removed
— so instructing a prompt to avoid a domain buys almost nothing, and risks excluding the best source on
a topic. The reason to keep the log is different and better: it is what tells a later gap apart from a
real one. A claim named in the report but absent from the corpus makes a query answer "not covered"
when the truth is "named but not importable".

| Domain | Seen | Note |
|---|---|---|
| `researchgate.net` | repeatedly, before 2026-09-06; **again 2026-09-07** — 4 cited URLs in text run 1 and **8 in text run 2**, all twelve failed | Has never imported. Far past the three-strike threshold, but see the caveat below: it fails as a *mirror* |
| `iet.ucdavis.edu` | 2026-09-06, meta run 1 | The only failure of 41 cited sources |
| `medium.com` | 2026-09-06, meta run 2 | The only failure of 51 cited sources |
| `digitalcommons.montclair.edu` | 2026-09-07, text run 1 | University repository. Failed as a `viewcontent.cgi` query-string PDF link — the shape may matter more than the domain |
| `springerprofessional.de` | 2026-09-07, text run 2 | Publisher paywall portal. The same paper imported from `arxiv.org` in the same run |

**Why this is still not a blocklist, after twelve failures.** In both 2026-09-07 runs the ResearchGate URLs
were **mirrors of papers the report also cited from arXiv, ACL Anthology, MLR Proceedings or a university
repository**. The paper reached the corpus; only the duplicate copy failed. The same is true of
`springerprofessional.de`. Excluding either domain would not have added a single source, and might have
cost the one topic where ResearchGate holds something unique.

**The pattern worth naming: mirrors and portals fail, primary hosts do not.** Every failure across four
runs has been a secondary copy — a social-network mirror, a publisher paywall portal, a repository PDF
behind a query string. Nothing hosted on arXiv, ACL Anthology, MLR, OpenReview or PMC has failed. So read
an import failure as *"this copy failed, check whether the work is already in from its primary host"*,
not as *"the source is lost"*.

### A source can import successfully and still hold nothing

Failing to import is the visible problem. The invisible one is a source that lands, counts against the cap,
and carries only an abstract. Observed 2026-09-07, and the URL form is the suspect:

| Work | URL form cited | What the corpus can read |
|---|---|---|
| Milička benchmark | `arxiv.org/html/…v2` | full text — section 4.2 quoted back |
| AI Brown / AI Koditex | `arxiv.org/pdf/…` | full text |
| Czech feedback experiment | `arxiv.org/pdf/…` | full text — section 3.1 and figure 9 quoted back |
| Translationese | `arxiv.org/html/…v1` | full text — tables 1 and 7 quoted back |
| **Reinhart et al., PNAS** | **`arxiv.org/abs/…`**, plus a publisher DOI landing page and two failed mirrors | **abstract and metadata only** |

Four papers cited via `/pdf/` or `/html/` are readable in full. The one cited via `/abs/` is not, and no
full-text URL for it was ever cited in any run. **This is a hypothesis with one confirming case, not a
measured rule** — the cheap test is to add the `/pdf/` URL of the same paper by hand and see whether its
tables become readable.

Two consequences either way:

- **Ask whether the full text is present before quoting a paper's own numbers.** Five figures in one
  session had to be demoted a tier because a citation had landed and the paper had not. See
  `reading-a-report.md`, checklist item 5.
- **A known-missing paper is worth one manual source, not another run.** Adding a URL by hand costs a
  single slot and no research time; a run costs eighteen to fifty slots and returns mostly things you
  did not ask for.

**When to spend prompt characters on avoidance: still never, and the failure rate rising does not change
that.** Across five runs, 24 of 185 cited sources failed to import — **13.0 %**, up six-fold from the
2.2 % measured over the first two runs. The rise is entirely explained by subject matter rather than by
the tool getting worse: a question about research literature draws heavily on ResearchGate and publisher
portals, which never import, while a question about a commercial product draws on vendor documentation,
which does. So expect roughly a tenth of an academic run's citations to fail, expect nearly all of them to
be mirrors of works that arrived anyway, and check rather than instruct. Paywalled pages and sites blocking
scrapers via robots rules are bypassed during browsing anyway (Official Google /
University of Michigan IT docs, June 2026), which is a different stage from an import failure and needs no
instruction.

**What the second constraint does to the `[OTÄCKT]` tier.** "Not covered" has two very different
meanings and the tier cannot tell them apart: the literature does not answer it, or the paper that
answers it failed to import. Before recording a gap as an evidence gap, ask whether the Deep Research
report *cited* something on that point that never made it in. If it did, the honest label is
"named but not importable" — a lead to chase, not a gap in the field.

**And a third meaning, found 2026-09-07: the paper imported as metadata only.** Asked for a numeric
before-and-after for target-domain fine-tuning, the corpus answered "not covered" and explained why — the
paper that studies it is present "as a metadata-only abstract in this notebook". So the source is in the
source list, counts against the cap, and can be cited by name, while containing **none of its own
results**.

This is worse than a failed import, because a failed import is visible and this is not. A notebook can
show a paper you believe you have while holding only its title and abstract. Two habits follow:

- **Before treating a paper as evidence, ask whether its full text is in the notebook.** The contract's
  chain clause already asks whether the underlying paper is present; extend it to whether the *text* is.
- **Prefer a link to the full text over a link to a landing page.** Every metadata-only case so far has
  been an abstract page rather than a PDF, which is the same distinction that separates the imports that
  succeed from the mirrors and portals that fail.

## Two things the author will not do

Stated on 2026-09-06, and recorded here because both change what a workable plan looks like:

> i didnt do phase 1. dont count on me to add sources manually, i will never do that

> i want to minimize all manual work that i have to do like phase 3, i prefer not to go through
> sources myself, i would rather you have strict guardrails and better prompts for deep research

So **do not build a plan that needs a human to curate sources** — not to add a primary document by
hand, not to walk the source list pruning junk. A plan whose quality depends on either is a plan that
will not be executed. Do not propose it again, and do not treat the author's refusal as an oversight
to be worked around by asking a second time.

The whole burden therefore sits on the acquisition prompt, and the prompt has six levers that do
the work manual curation would have done:

1. **Deselect the source in the notebook.** Documented by Google, and it covers **chat and Studio both**:
   an inactive source is not referenced anywhere in the notebook. This is the strongest filter available
   and it costs one click on the handful that are obviously marketing. It beats every wording trick below
   because it is *certain* rather than probabilistic. **It does not free a slot** — inactive sources still
   count against the cap — so it is a quality filter, never a budget one. See
   `notebook-setup.md`.
2. **Make the report describe its own sources.** The report **is added to the notebook automatically**
   (confirmed 2026-09-06), so a specified structure turns it into the notebook's metadata (below).
   **Tested and it works** — see the run comparison.
3. **Filter at query time.** Because every claim carries its provenance, a question can say *"answer only
   from claims whose source is official documentation"*. Cheap, needs no human — but **untested**, so do
   not lean on it while deselection is available.
4. **Ask for fewer, better citations.** **Tested and it failed** — see below. The evaluative wording has
   been **removed from the skeleton entirely**, not merely deprecated: leaving it in beside the
   categorical replacement would mean the next run tests both at once and settles neither, which is how
   the first experiment was confounded. One steering instruction at a time.

Whatever the prompt cannot guarantee, **measure instead of asking someone to check**. The two input
limits in `round-template.md` came from pasting test blocks, and no curation step could have produced
them.

### What the three runs actually showed

Runs 1 and 2: same topic, same notebook, 2026-09-06. Run 1 asked for source prioritisation and per-claim
metadata. Run 2 added the five-section report structure **and** the instruction *"do not cite
low-quality sources at all … citing fewer and better sources is the goal"*. Run 3, 2026-09-07, is a
**different topic** — how LLM text differs measurably from human text — with the evaluative line replaced
by the categorical one and nothing else changed.

| | Run 1 | Run 2 | Run 3 | Run 4 | Run 5 |
|---|---|---|---|---|---|
| Subject | NotebookLM as a product | same | LLM text vs human text | AI-detector reliability | Nordic/Germanic LLM style |
| Sources cited | 41 | 51 | 23 | 35 | **35** |
| Imported | 40 | 50 | 18 | 26 | **27** |
| Failed to import | 1 | 1 | 5 | 9 | **8** — all ResearchGate mirrors |
| Peer-reviewed / preprint share | 23 of 40 **imported** — 57.5 % | 23 of 50 imported — 46.0 % | 13 of 23 **cited** — 56.5 % | 18 of 35 cited — 51.4 % | 19 of 35 cited — **54.3 %** |
| Five report sections | not requested | all five present | all five present | all five present | **all five present** |
| Sources read but discarded | not reported | not reported | 42, with reasons | 84, with reasons | **142, with reasons** |
| Steering line | prioritisation only | evaluative | categorical | categorical | categorical |
| Title clause | — | — | — | present | present |
| Named-works clause | — | — | — | — | **present** |

**The share row changes its denominator at run 3, so do not read it as a trend.** Runs 1 and 2 are counted
against sources *imported*; runs 3 to 5 against sources *cited*. For runs 1 and 2 the two bases are within
one (41 cited / 40 imported, 51 / 50), but for runs 3 to 5 they diverge sharply — run 3's 13 of 23 cited is
13 of 18 on an imported basis, which is **72.2 %**, not 56.5 %. Two honest counts of different populations
is exactly the failure that cost a day on the site's page count (F58). Quote the basis with the figure or
do not quote the figure.

### Naming specific works: tested 2026-09-07, and it works

Run 5 added a clause of a new kind — not a category to prefer or exclude, but three **named works to fetch**:

> Cite these specific works if they exist, and say so under "Not documented" if you cannot reach any of
> them: [a named paper with all seven authors, the journal and the year]; any replication of [a named
> benchmark] in a language other than Czech or English; any [named language] multi-genre reference corpus
> with a register or dimension model comparable to [a named corpus].

All three were answered, and the report closed with a dedicated *"Verification of Specific Requested
Works and Resources"* section addressing each by name. The paper's citation arrived **from its publisher of
record**, and the other two came back as documented absences — which is equally useful: "no such replication
was found" is a fact about the field, not a failure of the search.

**But measure what actually landed before crediting the lever.** Asked in the next round whether the paper's
full text was present, the answer was no: only its abstract, submission history and publisher metadata page
imported. Five figures that had been treated as coming from the paper — including the causal claim the whole
topic rested on — had to move back to resting on our own report.

So the lever's tested claim is narrower than it first looked: **naming a work gets its citation into the
corpus; it does not get the paper in.** Use it to close a provenance gap, then ask whether the full text is
present before quoting anything as the paper's own. See `reading-a-report.md`, checklist item 5.

### The discard log's most useful failure: homonyms

Run 5 discarded **142** sources, and the first reason given was not quality but ambiguity: much of the
material was about "Swedish **register**" in the sense of national healthcare registries and labour-market
databases, sharing the word with corpus-linguistic register and having nothing to do with the subject.

That is the same failure mode as a case-insensitive substring search matching `LLM` inside *Bellman* and
*allmänt* (see `steering/environment.md`). **When a run's discard count jumps, read the reasons before
concluding the topic is well covered** — a large discard pile can mean the query terms are ambiguous rather
than the field being crowded.

**The evaluative instruction backfired; the categorical one cannot be credited yet.** Run 2's absolute
number of official sources was identical to run 1 — 23 both times — so all ten extra citations were
third-party and the official share fell eleven points. Asking for "fewer and better" produced *more and
worse*. Run 3's share, 56.5 %, is statistically indistinguishable from run 1's 57.5 % and clearly better
than run 2's 46.0 %.

**But run 3 is confounded by topic, and the metric is not the same unit.** Run 3 asked a question with a
real academic literature behind it, so citing journals is what answering it *requires*; runs 1 and 2 asked
about a commercial product, where "official documentation" was the best available tier and peer review was
not on offer. Counting "official-or-arXiv" for a product question and "journal-or-arXiv" for a research
question are two different measures, and `documentation-standard.md`'s rule applies: establish what a
number counts before comparing it. So the categorical line is **not yet vindicated**; a clean test needs
it on a topic comparable to runs 1 and 2.

**What run 3 does establish, and it is the more useful finding.** The report discarded **42 sources and
said why**, naming "marketing blogs, SEO optimization checklists, and vendor-provided technical benchmarks"
— the categories the instruction listed. Neither earlier run produced a discard count at all. That is
direct evidence the categorical wording was *read and acted on*, which is more than the evaluative wording
ever showed. Fewer citations with an explicit rejection log is the behaviour the instruction was supposed
to produce.

**And the run count fell far below the recorded range**, which is the correction that matters most for
planning: 18 imported against a range recorded as forty-to-a-hundred. A narrow, well-specified question
spends a third of the slots a broad one does.

**So the next thing to try is a whitelist, not an adjective.** Google's own documentation says Deep
Research supports entity and constraint filtering, so naming the domains that may be cited is a
different kind of instruction from naming a quality bar. Until that is tested, assume the citation mix
is roughly out of your control and lean on lever 2.

### The whitelist was tested 2026-09-10, and it is unreliable in both directions

Tested on a clinical-literature facet in a separate notebook, outside this vault's subject. The prompt
carried both halves of the categorical form: a CITE list naming five specific sources, and a DO-NOT-CITE
list naming categories **plus one domain by name**.

**The exclusion list has no force.** It named ResearchGate explicitly. The report cited **seven
ResearchGate pages**. It also cited ten sites squarely inside the excluded "health-content marketing" and
"industry-sponsored symposium" categories — including a drug manufacturer's own promotional site, cited
for the efficacy of the very drug the facet existed to evaluate. The seven ResearchGate citations all
failed to import so they cost no slots, but the instruction plainly did not steer.

**The inclusion list is only half honoured.** Of five sources named to cite, two were cited and three
were not cited **at all** — zero mentions each. The named international guideline did arrive, from four
mirrors, none of which was the one named.

**Unit warning, per `documentation-standard.md`.** Of 76 unique URLs, 41 were guideline, journal,
institutional-repository or national guidance: **54 %**. Do **not** compare that with the 57.5 % / 46.0 %
/ 56.5 % above. Those counted official-or-arXiv on a product question and journal-or-arXiv on a research
question; this counts four categories on a clinical question. Three units, one file.

So the load-bearing claim below is still untested on a comparable topic, but a stronger and simpler
statement can now be made: **naming a domain, in either list, does not reliably control whether it is
cited.**

### The lever that did work: demand a datum only the wanted source carries

The contrast sits inside that one prompt. Everything asked for as **content** came back thoroughly — the
requested assessment instrument appears 43 times, the drug under evaluation 49, the named alternative 16,
and the "disagreements and disconfirming evidence" subsection was produced as specified. Everything asked
for as a **source** was ignored or half-met.

The inference: Deep Research selects sources to satisfy the **question**, not the bibliography
instruction. So the way to reach a particular source is to demand a fact only that source publishes.

| To force | Demand |
|---|---|
| A national drug monograph | the approved product name, the ATC code, and adverse-effect frequency bands **in the regulator's own category names**, with their percentage ranges |
| A clinical guideline | the recommendation strength and evidence grade attached to each numbered step |
| A systematic review | the pooled estimate with its 95 % CI and the GRADE certainty rating |
| A regional formulary | whether each drug appears on the regional list for that indication, and in which position |
| A primary trial | the randomisation unit, the comparator arm, and the per-arm n |

The same mechanism is the real defence against junk, and it is the one a prohibition failed to provide:
**a marketing page cannot supply a confidence interval, a GRADE rating or a per-arm n.** Demanding those
per claim makes such a page useless for answering, which excludes it more reliably than forbidding it.

#### Confirmed 2026-09-10 across three runs on one notebook

The third run demanded each datum **in the source's own vocabulary** — a national ATC code, the
regulator's own adverse-effect frequency category names, and a country-specific potency classification.
Same notebook, same account, same subject area:

| Datum demanded | Run 1 | Run 2 | Run 3 |
|---|---|---|---|
| National monograph site citations | 0 | 6 | **23** |
| ATC codes present | 0 | 0 | **3 distinct** |
| Regulator's frequency-category names | 0 | 0 | **14** |
| Country-specific potency class | 0 | 0 | **10** |
| Dose-quantity unit named in the guideline | not asked | not asked | **12** |
| National formulary named | 0 | 2 | **4** |

Run 1 named those sources in a CITE list and got none of them. Run 3 never named them and got the whole
layer: **35 of 69 citations** were national or EU official, against 8 of 76 in run 1, plus three regional
care programmes nobody asked for by name.

**The exclusion half is confirmed by absence.** Run 2 pulled in a retail-pharmacy cluster — five
consumer drug-information sites. Run 3 demanded ATC codes, frequency bands and a potency class, and
**every one of those five is absent**. No prohibition achieved that in three attempts; one data demand
did.

**Two limits, recorded so the lever is not oversold.** Demanding sensitivity and specificity for four
diagnostic tests produced almost nothing — one mention of each — so a data demand cannot conjure
evidence that does not exist, and a null result here is ambiguous between "not asked well" and "not
studied". And **the citation count stayed flat** at 76 / 60 / 69 despite run 3 being far more specific,
so specificity does not buy slots back; only fewer sections do.

#### Structure is obeyed; the copy path destroys it

Run 3 asked for the source list as one pipe-delimited line per source. The **category labels appeared**
— 14 of them, in the requested vocabulary — so the instruction was followed. But the archived file has
**23 lines and a longest line of 8 680 characters**: the newlines were gone. Runs 1 and 2 looked like the
format had been ignored, and it had not.

So the ambiguity recorded above is settled: **Deep Research follows structure instructions, and the route
out of the tool loses line breaks.** Do not spend another prompt clause on structure. Ask for delimiters
that survive as text — a pipe or a marker token — and reconstruct the lines when parsing.

#### A cumulative paste will silently contaminate a measurement

Run 3's file arrived containing **run 2 in full, with run 3 appended** — 69 727 characters then 40 677.
Measured whole, it reported junk domains as if run 3 had cited them. Before measuring any run, hash the
file against every archived run and check whether it *starts with* an earlier one. On the previous
attempt an unchanged file was measured twice and produced four confident false negatives — every lever
reading zero — caught only because the byte count was identical to the run before.

### Two recorded findings that together remove the deselection step

Neither is stated where the other is, so the combination has been missed. Query-time exclusion wording is
**tested and works** — it obeyed three times in one round (below). Custom instructions are **documented to
govern every Studio output as well as chat** (`notebook-setup.md`). Putting the exclusion list into the
custom instructions should therefore make it permanent and automatic, which is the only form that survives
an author who does no per-source curation at all.

**This is an inference from two measured facts, not itself a measurement.** Verify it by asking a round
something only an excluded source can answer, and checking the answer says so rather than answering.

### Ask for the inventory in a form that survives a paste

That run's report reached the vault as 62 KB on **67 lines**, longest line **14 408 characters**, **zero
markdown headings**, and every URL glued to the first word of its title (`...baylor_docsH1-antihistamines`).
The requested section structure and source inventory did not survive, and the two possible causes — never
produced, or destroyed in transit — are indistinguishable after the fact.

So do not ask for a markdown table. Ask for **one line per source, pipe-delimited**:
`CATEGORY | first author or organisation | year | title | URL`. A line list survives any copy path and
parses without repair.

### Why it probably backfired, and what to say instead

A query round against the meta-notebook (2026-09-06) turned up a mechanism that fits the result, and a
wording distinction that matters.

**The likely mechanism is triangulation.** *"In high-fidelity modes, claims are validated using a
triangulation protocol, where a specific fact is only cited if it is verified across at least 3 distinct
sources"* — third-party, observed, late 2025. If asking for rigour raises the number of sources needed
*per fact*, then a prompt demanding rigour mechanically raises the citation count, and the extra
citations are whatever else supports the same claims. Our two runs cited 40 and 50 against a reported
typical range of **15–30** (LobeHub, late 2025) or an average of **32.42** (CitedSpy, 2026-07-02) — both
above normal, in the direction that hypothesis predicts. It is a hypothesis, not a finding: the corpus
answers question "does asking for high quality change the count and the mix" with **not covered**.

**Name categories, not quality.** The one steering pattern any source describes concretely is
categorical, not evaluative: *"Prompting patterns that restrict the search space (e.g. 'focus on
enterprise pricing models, exclude marketing blogs, and prefer official API documentation') redirect
query generation, forcing the agent to filter out secondary market summaries and prioritize primary
documentation"* — third-party observed, May 2026. That is a different instruction from "do not cite
low-quality sources": it names a kind of site to exclude and a kind to prefer, rather than asking the
agent to judge quality. Our failed line was evaluative. **Try the categorical form next.**

**Structure control is officially documented**, so the five-section spec rests on more than hope:
*"You control the output via prompting, defining the structure, headers, and subheaders, or specifying
data table generation and formatting"* — Google Blog, 2026-04-21.

**One lever we have not used: edit the plan before it runs.** The API exposes
`collaborative_planning=True`, which lets the research questions be reviewed and modified *before web
exploration begins*, pruning search trajectories (Official Google API docs, 2026-04-21). The consumer
interface shows an editable research plan for the same reason. That is a few seconds of work, not
curation, and it acts earlier than any wording in the prompt.

**Our experiment was confounded, and the corpus cannot resolve it.** Run 2 changed two things at once —
the report structure and the quality line — so the ten extra citations cannot be attributed to either.
Asked directly whether output structure affects how many sources are browsed or cited, the corpus
answers **not covered**. To de-confound, a third run would keep the structure and drop the quality line;
whether that is worth 18–50 slots is a judgement about how much the answer would change future work.

## Runs 4 to 7: four more levers, three of them failures

Same notebook, 2026-09-10, seven runs total on one medical corpus. The content-demand lever above held
every time it was applied to a **single** datum, and the four findings here are about the ways a prompt
fails around it.

| Datum demanded | Run 3 | Run 4 | Run 6 |
|---|---|---|---|
| National monograph site citations | 23 | 0 | **60** |
| ATC codes | 3 | 0 | 5 |
| National lab-nomenclature codes | not asked | **11 distinct** | not asked |
| The patient's own laboratory cited | 0 | **5** | 0 |
| National interaction database cited | 0 | 0 | **7** |
| Share of citations from the target country | 51 % | 13 % | **97 %** |

Run 4 demanded a national laboratory code system and got the codes **plus the two hospital laboratories
that publish them** — an institution nobody named. Run 6 demanded a national interaction classification
and pulled in the national interaction database itself. **Demand the identifier and the institution
follows.**

### A demand does not survive being bundled with other demands

Run 5's worst section asked, in **one sentence**, for the ATC code, the national product name, the cure
rate, the per-arm sample size, the comparator and the recurrence rate at two timepoints, for **three
drugs**. It returned one mention of each drug and **zero ATC codes**, in a run that produced **no
citations at all** from the target country — against 23 in run 3 and 60 in run 6, both of which gave
each datum its own line.

**Write one demand per numbered line.** Run 7 used fourteen one-line demands and returned ten distinct
ATC codes, the most of any run.

### A format slot gets filled with a constant; a datum does not

After a generated source line was found to have dropped the study population (below), run 6 added a
`POPULATION` field with four permitted values. All **41** entries came back `mixed`. The field was
populated and discriminated nothing.

Run 7 replaced it with `N-AND-WHO`, asking for the actual participants, and got **six distinct values
across nine entries** — "235 non-pregnant women aged 18-50", "1585 women (684 cases, 901 controls)".

**Never add a field whose values are a closed set you supplied.** Ask for a number and a description
that must be read out of the source.

### The literal token solves the structure problem the copy path creates

The subsection above diagnosed newlines being lost in transit and recommended a marker token. Measured:
asking for every source-list entry to begin with the literal `###SRC###` produced **24, 40, 41 and 9
tokens** across runs 4 to 7, parsing 1:1 to distinct sources every time, with all pipe-delimited fields
intact.

**This is settled. Use a literal token, never a table and never line breaks.**

### Demanding an explicit absence works, and it is the cheapest honesty lever found

`If a source does not give the value asked for, write NOT FOUND rather than substituting a different
value` produced **39** explicit NOT FOUNDs in run 6 and **17** in run 7. Before this clause, an
unavailable value came back as a nearby value from a different source, indistinguishable from an answer.

Cost: one sentence. It is the highest-yield clause measured in seven runs.

### One prompt does one kind of work, and the crowding is symmetrical

Run 6 saturated its prompt with regulatory vocabulary and returned 97 % national-official citations —
and its two epidemiological questions came back empty (`vulvovaginal` 0, `candidiasis` 0). Run 7 asked
the epidemiological questions and got them, but its regulatory clause underdelivered: **8** national
monograph citations against run 6's 60.

**Do not mix a regulatory-vocabulary demand with a clinical-evidence question in one run.** Split them,
and expect the minority half to fail rather than merely thin out.

### The generated source line omits the fact that decides relevance

A source line read `OTHER PRIMARY STUDY | Utrecht University Repository | 2024 | WBC alterations
following repeated dexamethasone administration`. On that basis it was defended as the
corticosteroid-leucocytosis paper the corpus needed. The raw citation text for the **same URL** reads
*the effect of intravenous dexamethasone on the white blood cell parameters in healthy **horses***.

Three positions were taken on that one source in one day. Two of the three came from reading the
generated title.

**Never judge a source from the structured source line.** Cross-check the raw citation text, which
carries the source's own phrasing. The same run also cited a canine surgical study and a veterinary
clinical-pathology site; a veterinary cluster is a recognisable failure mode of a physiology question.

### Failed imports are usually harmless, and sometimes are a real loss

Stated too strongly three times before being corrected. What holds:

- When the failure is an **aggregator mirror** of a paper that also exists on a repository, the report
  cites the readable copy alongside it and nothing is lost. Verified for six papers across runs 4 and 6,
  including two that were reported as losses and were not.
- When the failure is the **publisher's own gated PDF**, there is no other route and the source is
  genuinely absent. Run 7 lost two primary studies this way, and they carried the effect sizes for three
  of its questions.

**Check, per failure, whether another URL in the same report reaches the same document.** Do not
generalise in either direction.

### Prompt length is load-dependent, so a rejection is not a ceiling

A 4 400-character prompt was rejected while 3 286, 3 298, 3 334 and 3 395 were accepted, which looked
like a ceiling near 3 500. The recorded maximum is **5 000**, with the input field shrinking under load
toward roughly 1 200 (`round-template.md`). So the rejection measured load, not a limit.

**Aim at 3 300.** It has been accepted four times and leaves room for the field to shrink.

### Exclusion instructions fail at query time exactly as they do at acquisition time

A query round opened with *do not cite any source whose title begins "Djup researchrapport"*, naming the
machine-written reports. **Four of five answers cited them anyway**, one relabelled as "Laboratory
handbook summary". Same shape as five consecutive acquisition runs citing a domain named as forbidden.

**Do not spend a clause on prohibition in either half.** Ask instead for the thing only an acceptable
source can supply — here, a quotation with a section number from a named monograph, which is what
exposed the four unverifiable claims.

### How to tell a full paper from an abstract or a landing page

Ask, for a named source: the per-group participant numbers as the table states them, one limitation the
authors state about their own work quoted, and the funding or competing-interests statement quoted. All
three are below-the-abstract content.

Measured on six sources: one returned a provincial grant number (full text), one answered *"the notebook
contains only the PubMed abstract snippet"* (abstract only, self-declared), one returned three "not
covered" (landing page or gated). **A `PubMed` label in the title predicts nothing** — one PubMed-labelled
entry held full text and another held only the abstract.

The probe also caught a substitution: asked for one paper's funding statement, the answer quoted a
different paper's. It was detectable only because the format requires naming the source actually used.

### Pruning a corpus: three grounds, and the review that catches the rest

Three prune rounds, 82 sources removed from a corpus that peaked at 232. Every list was reviewed by two
adversarial subagents — one briefed to stop good sources being deleted, one to find junk missed — before
the author saw it. **That review withdrew 15 proposals and added 11**, so roughly a third of every draft
list was wrong.

Only three grounds survived review:

1. **Duplicate** — the same document is present in another entry being kept.
2. **Superseded** — a newer edition of the same document is in the corpus.
3. **Off-topic by content** — the subject matter touches no condition, medicine, result or decision in
   the case.

**Judging by host or document type does not survive.** Casualties of doing so: two academic-centre drug
pages for drugs the patient takes, a university teaching resource dismissed as unidentifiable, a
mechanism paper dismissed because its cohort had a rare syndrome, and a systematic-review protocol
dismissed as containing "no results" whose introduction supplied the risk figure the corpus later quoted.

Two specific traps in national drug corpora:

- **A product's monograph, patient leaflet, summary view and full text are four different documents**,
  not four views of one. Treating them as duplicates would have deleted two current-medicine sources.
- **A national-source acquisition run floods the corpus with formulation and strength variants.** One run
  produced 8, 7, 10 and 7 entries for four drugs. Prune these against **the strength and formulation the
  record names** — and check first whether a retained entry still covers the sections that differ.

And a machine-written report in the corpus is not merely low-value: it **wins retrieval**, because it is
written in the shape a question asks for while a monograph buries the same fact in prose. Five of nine
answers in one round took their primary answer from such a report. Removing them was argued down on the
grounds that they surface facts the primaries bury — so the workable rule is to keep them, label them in
the notebook's standing instructions as machine-written, and verify anything load-bearing against a
primary source before acting on it. Of five such claims tested that way, **one verified**.

## The report is a source: specify how it is written

The author's observation, and it is the most useful mechanism in this file: **the report Deep Research
produces is itself added to the notebook.** So the acquisition prompt is not only a request for a
bibliography — it is also a request for a *document about that bibliography*, which lands in the corpus
alongside it and can be queried like anything else.

That is what replaces reading the source list by hand. Ask the report to end with:

| Section | What it buys |
|---|---|
| **Findings**, one claim per line, each with date, version, official-or-third-party, documented-or-observed | The provenance is attached at the point of the claim, so a later query returns it without a second round |
| **Single-source claims** | Names every claim resting on exactly one source — the ones to distrust first, identified without anyone auditing anything |
| **Not documented** | Separates a real gap from an unasked question, and says whether low-quality sources claimed an answer anyway |
| **Source inventory** — publisher, title, date, official or third-party, what it was used for | Makes the notebook **self-describing**: you can ask it which of its own sources are official and which are blogs, and get an answer from inside the corpus |
| **Discarded** — how many were read but not cited, and why | The only record that a rejected source ever existed, since uncited sources are not added |

The inventory is the one that compounds. Once a corpus contains a document describing its own sources,
every later query can be scoped — "answer only from claims whose source is official" — and `[OKÄND
PROVENIENS]` becomes a tier you can *detect* rather than one you guess at.

Do this in **every** acquisition prompt, not just for meta-research about the tools. It costs about
600 characters out of 5 000.

### The hazard this creates: confirmation by echo

Once a report is a source, the corpus contains a document that **quotes other documents**, so a claim can
arrive wearing one layer of authority it has not earned. That hazard, and the ten other ways a report or
an answer has misled us, are in **`reading-a-report.md`** — together with the eleven-check list to run over
any answer before it changes a rule.

Read that file before acting on anything a report says. The two findings that matter most when writing an
acquisition prompt are repeated here because they change the prompt itself:

- **Specify that titles be copied exactly**, with "title not verified" as the fallback. Without the clause,
  four of nineteen inventory titles were reconstructed and unfindable; with it, nine rows abstained openly
  and the rest were verbatim.
- **Never quote a figure from the report when the paper is also in the corpus.** Reports have been measured
  reshaping the numbers they cite.

## The output contract lives in the notebook, not in the round

Set it once in the notebook's **custom instructions** — 10 000-character ceiling, and it governs every
Studio output as well as every chat answer. `references/notebook-setup.md` has the wording, the
verification step, and the three other per-notebook settings that decide what a round costs.

### Two things the corpus says are undocumented, where our own measurements are the only evidence

Worth knowing before spending a round asking: the meta-notebook was asked both of these directly and
answered **not covered** for each.

- **Whether asking for high-quality sources changes the citation count or the mix.** No source carries
  any figure. Our two runs are the only data that exists on it, anywhere we can see.
- **Prompt-length limits and truncation thresholds** for either tool. Also unanswered by any source —
  which is exactly what the paste tests measured in ten minutes.

That is the pattern to expect for anything about a tool's behaviour rather than a field's findings.

## What is still untested

**One claim remains load-bearing and unverified**, down from four. Treat it as a hypothesis.

| Untested claim | How to settle it |
|---|---|
| **Categorical steering beats evaluative** — "exclude marketing blogs, prefer official documentation" instead of "do not cite low-quality sources" | It has been *acted on* — two runs produced explicit discard logs of 42 and 84 sources naming those categories — but never measured against a comparable topic. A clean test needs it on a product question like runs 1 and 2, where the official share can be compared against 57.5 % and 46.0 % |

**A 2026-09-10 run weakens this further without settling it.** The categorical form, applied to a clinical
question with a named domain in the exclusion list, was **disobeyed seven times on that one domain** and
cited ten sites from two excluded categories. It still needs the comparable-topic test, but do not assume
the categorical form controls the mix — see *The whitelist was tested 2026-09-10* above, and prefer the
content-demand lever recorded with it.

**Query-time filtering: tested 2026-09-07, and it works.** A round opened with *"do NOT use fast.io,
rewriteai.com, eyesift.com, gradpilot.com or proofreaderpro.ai as the basis for any answer. If a point
rests only on one of those five, say so explicitly and mark it excluded rather than reporting the
number."* The answer obeyed it three separate times: it identified a claim as resting on the excluded
Fastio page and marked it excluded, it withheld one specific figure — "the ending rate of 56.65 % is
excluded as it rests on the excluded GradPilot source" — and it closed the ranking section with an
exclusion note naming the two sources whose numbers it had therefore left out.

That closes the **quarantine leak** recorded above. The instruction is cheap, needs no clicking, and turns
a source that is physically in the corpus into one that cannot supply an answer. Deselection is still
stronger because it also covers Studio and cannot be forgotten, but for a single round the wording is
enough. **Name the exclusions in any round whose answer will change a rule.**

Two things are known **not** to be known, because the corpus was asked and answered "not covered": whether
asking for quality changes the citation mix, and what the input-length limits are. Our own measurements are
the only evidence on both.

**Settled on 2026-09-06.** Sources can be deselected and this excludes them from chat *and* Studio
(Official Google, documented) — though inactive sources still count against the source cap. The Deep
Research report is added to the notebook automatically. Custom instructions are **documented** to govern
every Studio output, not
only chat. All three are in `notebook-setup.md`. **Reproducibility is settled too**, and it was measured
rather than read: three runs of the same six questions gave **zero numeric drift**, while the credited
source and the quoted sentence both varied. A figure needs one ask; provenance needs two. Full result in
`notebook-setup.md`.

## Budget the run set before the first run

Six to fifteen runs is not unlimited, and they are not independent: a rephrased question returns largely the
same sources, which registers duplicates and spends slots twice. That corpus had 235 registered against
223 unique.

- **Divide by facet, not by phrasing.** One run per genuinely different question: the effect and its
  size, the boundary conditions and failures, the protocol, the competing explanations. Two runs that
  differ only in wording are one run and a wasted 18–50 slots.
- **Fire the broad one first, then read what it cited** before writing the next. The gaps and
  contradictions in run one are what run two should be aimed at. Firing all of them blind wastes the
  only feedback available.
- **Keep 30–50 slots free.** Named-but-not-importable papers, and anything a later query exposes, have
  to go in by hand — and a full notebook has no room for the paper you most want.
- **Ask for the slot count between runs.** It is the only number that says how many attempts are left.

## The acquisition prompt

Hard limit **5 000 characters** — but treat that as a best case, not a budget. Google's own support
material reports that during resource-heavy sessions the typable input **shrinks as you work**, dropping
a few hundred characters per request down to a floor of roughly **1 200 characters** (Official Google
Support, observed behaviour, 2026-02-01). A prompt that fits at the start of a session may be refused
later in it. So the skeleton below is 1 513 characters and that is close to the practical ceiling; if a
paste is refused, the field has squeezed, not the prompt grown.

What you are buying is the citation list *plus* a document describing it, so specify both the kind of
source you want cited and the shape of the report.

````text
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
4. "Source inventory" - a table of every source you cited: authors, title, year, kind of source
   (meta-analysis, primary study, secondary, book, other), and the one thing it was used for. Copy
   each title EXACTLY as printed on the source itself; never paraphrase, shorten or reconstruct a
   title, and write "title not verified" if you cannot see it.
5. "Discarded" - how many sources you read but chose not to cite, and the main reasons.

Cite these specific works if they exist, and say so under "Not documented" if you cannot reach any of
them: <named paper with authors, venue and year>; <a named replication or comparable dataset>.

Cover: <three or four specific sub-questions, each answerable from a study>.
````

That skeleton is 1 513 characters, leaving nearly 3 500 for a genuinely specific "Cover:" list. Use them —
specificity in the sub-questions is what makes the citations specific.

Why each line is there:

| Line | Effect on the corpus |
|---|---|
| "prioritise meta-analyses and peer-reviewed primary studies" | Shifts the citation mix away from SEO pages, which otherwise spend slots out of the 300 |
| "effect size, sample, design" | A report written this way cites the papers that report those, rather than explainers |
| "name authors and years" | Makes the corpus tierable later; an unattributed synthesis document is `[ANDRAHAND]` at best |
| "include studies that found no effect or the opposite" | **The important one.** A report that never looked for a contradiction cites no source carrying one, and no later question can recover it |
| "state where the evidence is thin" | Distinguishes a real gap from an unasked question before the corpus even exists |
| "exclude marketing blogs … prefer official documentation" | **Categorical, not evaluative.** The evaluative form was measured and backfired; this names kinds of site instead of asking the agent to judge quality. Untested — it is the one steering instruction in the skeleton, kept alone so the next run can measure it |
| The five report sections | Turns the report into the notebook's own metadata — see above |

## Never fire a run while a query round is open

A Deep Research run takes minutes to tens of minutes and lands without warning. If it lands **during** a
query round, the corpus has changed underneath the round: answers before and after the landing were drawn
from different source sets, and nothing in either answer says so. A contradiction that appears between
question 3 and question 5 may be two sources disagreeing, or may be one source having arrived in between.

This is the same trap as the vault mutating mid-session — see `steering/environment.md`, where an
`<!--SR:-->` count moved by 19 between two measurements because a phone review synced in the middle. The
rule there applies here: **do not prove anything with a total taken across a change you did not control.**

So: **query first, then fire the run — or wait the run out.** Never both at once. And when a run lands
mid-session, note the boundary, because any comparison spanning it is measuring two corpora.

## After the run

Ask three things, and record all three:

1. **How many of the 300 slots are now used.** It sets how many runs are left.
2. **Did anything the report cited fail to import?** A named-but-missing paper is a lead to chase by
   hand, not an evidence gap — and it is the difference between the two readings of `[OTÄCKT]`.
3. **The report itself.** Without a local copy the citation mix cannot be counted and no claim can be
   audited later. Store it in `.kiro/research/` with a date; a report pasted into the vault root fails
   the audit and publishes to the public site.

### The count the interface shows is not the count that lands

Measured 2026-09-07, run 2. The interface reported **35 sources**; the report cited 35 URLs; **9 failed**
(8 ResearchGate mirrors and 1 `springerprofessional.de`); so **26 imported**, plus the report itself,
against a previous total of 19 — and the notebook showed **46**. The arithmetic closes exactly:
19 + 26 + 1 = 46.

So the visible figure was the **citation** count, and a third of it never arrived. Two things follow:

- **Reconcile the numbers rather than accepting one.** Cited, failed, imported and notebook total are four
  different quantities, and only the last is the slot budget. This is the same lesson as
  `documentation-standard.md`'s page-count argument: establish what a number counts before using it.
- **Do not size the next run from the interface figure.** Imported counts across five runs are 40, 50,
  18, 26 and 27 — so plan on roughly 18–50 landing, and confirm against the notebook total afterwards.

Then query the corpus: `round-template.md` holds the query block, the worked round and the input limits.
