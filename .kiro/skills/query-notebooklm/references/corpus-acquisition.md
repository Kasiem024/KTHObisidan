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
