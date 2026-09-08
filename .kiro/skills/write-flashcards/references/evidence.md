# Evidence base — what is actually measured, and what is not

Companion to `formulation.md`, which gives the reasoning. This file records **which claims
have empirical support, how strong it is, and what each one changes in a card**. A claim that
changes no decision does not belong here.

Gathered 2026-09-05 from a NotebookLM corpus of ~200 sources, queried through the vault's
author. Every figure below came back with a quoted sentence from the source.

## The corpus this came from

235 registered sources, **223 unique** — ten works are duplicated, one of them four times. Mapped
2026-09-05 from the notebook's own index. Three things about it matter when reading the sections
below:

- **It is shared with unrelated projects.** Singular value decomposition, the Mundell–Fleming
  model, MESI cache coherence, chip multiprocessors, formal verification of Raft, and PDF parsing
  for RAG pipelines are all in there. That is why a Raft/Paxos monograph and an arXiv paper about
  retrieval in RAG systems were once returned as sources about studying. They are not.
- **Roughly half is blog, wiki, forum and SEO content**, plus a large neurobiology strand (LTP,
  NMDA receptors, sharp-wave ripples, sleep consolidation) that says nothing about how to word a
  card.
- **Six documents are synthesis papers with no author, year or publisher** — titles like
  *Cogno-Pedagogical Diagnostics of Flashcard Failure* and *Cognitive Geometry in Spaced
  Repetition*. They read as LLM output. Nothing here rests on them; citing them would mean citing
  a model's guess as evidence.

The tool's own metadata is unreliable in detail: it dates one paper to 2027, labels a CS
dissertation a pedagogical primary study, and its index positions do not match between reports.
Author–year labels in the sections below often correspond to differently-titled index entries
(Siefke et al. 2019 is indexed as *A context-change account of temporal distinctiveness*).

## Tiers

| Tag | Meaning |
|---|---|
| `[META]` | Meta-analysis, uploaded to the corpus and quoted directly |
| `[STUDIE]` | Primary study, uploaded and quoted directly |
| `[ANDRAHAND]` | Real study, but only **cited inside** an uploaded source. Numbers not verified against the paper |
| `[HEURISTIK]` | Practitioner text (Wozniak, RemNote, Anki forums). No empirical backing in the corpus |
| `[OTÄCKT]` | The corpus does not address it. Treat as an open question, never as settled |

The corpus contains 16 documents with no named author, year or publisher, plus several
AI-generated-looking synthesis documents. Nothing in this file rests on those.

## 1. Retrieval practice does transfer — but only under conditions

**Pan & Rickard 2018** `[META]`, transfer to new contexts versus a restudy control:
`d = 0.40, 95% CI [0.31, 0.50]`.

The load-bearing caveat, from the same meta-analysis: corrected for publication bias
(PET-PEESE), *"the intercept predictions were substantially reduced, often indicating no
positive transfer when none of the aforementioned moderators are present."*

The moderators that decide whether transfer happens at all:

- **response congruency** — the practised response resembles the response later required;
- **elaborated retrieval practice**;
- **high initial test performance**.

Transfer was weakest or absent for rearranged stimulus–response items, for untested material
from the same session, and for problems based on worked examples.

**What this changes:** card format is not a matter of taste. A deck of definition cards
practises producing definitions, and that is the response it transfers to. If the exam asks
what happens when a server fails, at least some cards must ask that.

**Butler 2010** `[STUDIE]`, prose passages, short-answer retrieval, one-week delay: far
transfer to a new domain `d = 0.99` versus restudy. This is the strongest single result in the
corpus and the closest in format to a flashcard — a question with a short produced answer.

## 2. A failed card still gets learned, but it does not transfer

**Butler 2010** `[STUDIE]`, conditional analysis: concepts successfully retrieved at least once
during practice transferred at `d = 0.73` (.72 vs .49 correct on the final test). For concepts
never successfully retrieved, transfer was at or below the restudy control.

Read this together with §7: a lapse followed immediately by the answer *does* build memory for the
item (Grimaldi & Karpicke 2012). What the failure costs is **transfer to new questions**.

**What this changes:** a card you keep failing is still teaching you the card — but it is not
buying you the exam question. That is the reason to reformulate or split it rather than grind it,
even though the repair itself is unmeasured (§14).

## 3. The reverse direction has to be practised

Three uploaded studies, one disagreement, and one clear practical consequence.

- **Kahana 2002** `[ANDRAHAND]` — unrelated word pairs are stored as one bidirectional unit;
  forward and backward recall correlate near unity (associative symmetry).
- **Popov et al. 2019** `[STUDIE]` — that holds for *unrelated* pairs only. **Semantically
  related** pairs (`teacher–classroom`) behave asymmetrically: testing one direction does not
  improve the other. 60 pairs, immediate testing, N = 32 / 30.
- **Yang et al. 2013** `[STUDIE]` — symmetry appears in cued recall, asymmetry in recognition.
  Chinese two-syllable nouns, immediate testing, N = 20–32 per experiment.
- **Rickard & Pan 2020** `[STUDIE]` — transfer across a direction change, versus restudy:
  `d = 0.41` and `d = 0.55` for the two direction-changed conditions on **pairs**, and **no
  transfer at all** for rearranged **triplets**. Failed items during practice transferred not
  at all.

A term and its definition are semantically related, which is the case where the backward
direction is *not* free.

**What this changes:** `;;` is the right tool when you must be able to *produce* the term, not
merely recognise it — and it is genuinely two cards of work, not a free extra. `::` remains the
default when only one direction is needed. Note the caveat: all four studies use word pairs at
immediate or short delay, so this is directional support, not a measured cost for concept cards.

`[OTÄCKT]`: no study in the corpus measures the **total practice time** needed to reach the
same level in both directions.

## 4. A gap-filling prompt secures the words, not the understanding

**Hinze & Wiley 2011** `[STUDIE]`, now uploaded — science texts (e.g. plate tectonics), 2-day delay:

- On **verbatim** questions, fill-in-the-blank practice gave good retention of the exact terms it
  had tested.
- On **transfer** questions worded differently from the material, fill-in-the-blank gave **no
  advantage**, while paragraph free recall did: *"the paragraph recall condition outperformed the
  fill-in-the-blank condition on the final transfer test, demonstrating another advantage of initial
  retrieval practice with relatively less support."*

Participant counts and effect sizes are not in the available extracts.

**What this changes:** a card that leaves a gap teaches the gap. That is fine when the words *are*
the target — a term, a separator's meaning, a protocol's name — and insufficient when the point is to
apply the idea. Prefer a prompt that forces the whole answer out for anything conceptual. Note that
this compares free recall of prose against a completion test, not two flashcard formats; the stronger
anti-cloze claims in the corpus come from a Reddit thread and an unattributed document and are ignored
here.

## 5. Explanation prompts: contested

- **Hinze et al. 2013** `[ANDRAHAND]` — instructing students to explain during retrieval added
  a benefit on final inference questions, beyond free recall.
- **Smith et al. 2016b** `[ANDRAHAND]` — prompting students to describe and explain gave **no**
  benefit beyond free recall.
- **Motz et al. 2025** `[ANDRAHAND]` — pre-testing helped memory; self-explanation helped
  inference and application.

**What this changes:** nothing yet. Writing a *why* card is well motivated by §1 (response
congruency), not by this. Do not present explanation prompts as established.

## 6. Delay helps, cramming does not

**Rowland 2014** `[ANDRAHAND]`, 159 effect sizes: retrieval practice effects were larger at
retention intervals greater than one day (`g = 0.69`) than under one day (`g = 0.41`).

**What this changes:** nothing about wording — FSRS owns the schedule. It is the reason not to
mass-review a course's deck the night before, and the reason honest grading matters:
**Sigayret et al. 2026** `[STUDIE]` found the testing effect **absent** in an online population
with low engagement, using texts with definition *and* application questions.

## 7. Feedback rescues a failed retrieval — if it is immediate

This corrects the impression left by §2. Failing a card is not wasted effort; failing it **and not
seeing the answer** is.

- **Grimaldi & Karpicke 2012** `[STUDIE]` — *"Unsuccessful retrieval attempts can enhance
  subsequent encoding and learning."* With a boundary condition: *"this enhancement only occurred
  when the study trial occurred immediately after the pretest trial."*
- **Butler et al. 2007 / Butler & Roediger 2008** `[ANDRAHAND]` — feedback halved wrong-answer
  intrusions on later short-answer tests, from ~20 % to ~10 %.
- **Metcalfe et al. 2009** `[ANDRAHAND]` — for initially *incorrect* responses, final performance
  was **better with delayed than immediate** feedback.
- **Mullet et al. 2014** `[ANDRAHAND]` — in a university engineering course, delayed feedback
  promoted transfer even though students preferred immediate feedback.

The last two sit in tension with Grimaldi & Karpicke; they use different paradigms (test-then-
feedback versus pretest-then-study). Do not resolve it in either direction.

**What this changes:** the plugin's behaviour — reveal the answer immediately, grade yourself — is
the supported arrangement. Never dismiss a card without reading the answer, and do not treat a
lapse as a wasted review. What §2 shows is narrower than it first appears: a failed item still
gets learned, but it does not *transfer* to new questions.

## 8. Keep testing a card; restudying it adds nothing

**Karpicke & Roediger 2008** `[STUDIE]` — 40 Swahili–English pairs, four conditions defined by what
happened to a pair *after* it was first recalled correctly, tested one week later:

| Condition | After first correct recall | Recall at 1 week |
|---|---|---|
| ST | kept in both study and test periods | ~80 % |
| SNT | dropped from **study**, kept in testing | ~80 % |
| STN | dropped from **testing**, kept in study | ~36 % |
| SNTN | dropped from both | ~33–36 % |

The paper's own summary: *"Repeated studying after learning had no effect on delayed recall, but
repeated testing produced a large positive effect."*

Supporting figures, all `[ANDRAHAND]`: practising until an item was recalled four to five times beat
stopping at one (Vaughn & Rawson 2011); performance rises with the number of correct recalls with
diminishing returns (Pyc & Rawson 2009/2012a); successive relearning of psychology definitions
across three or more sessions gained ~10 % on real course exams and held over 60 % recall 24 days
later versus under 20 % (Rawson et al. 2013); three spaced sessions took eighth graders to ~60 %
versus ~20 % after a month (Rawson et al. 2021).

**What this changes:** the sharp version of the rule is not "keep the card" but "keep *testing* it".
Re-reading a note you already know is the dispensable half — SNT dropped restudy entirely and still
scored 80 %. So do not suspend, delete or `nosr` a card because it now feels known, and do not
substitute re-reading the note for reviewing the card. Scoping a deck to a course's relevant
material is a different decision from retiring a learned card; the second is the 36 % condition.

## 9. Practice format: the evidence does not settle it

- **Adesope, Trevisan & Sundararajan 2017** `[META]`, now uploaded: testing versus restudy
  `d = 0.51`; versus doing nothing `d = 0.93`; overall `g = 0.61–0.70`. Stronger in **classrooms**
  than in laboratories (`g = 0.67`). Effects larger with **two or more** practice tests than one.
  Best results came from **combining** short-answer and multiple-choice **with corrective feedback**.
- **And it found multiple-choice stronger than short-answer**, which contradicts the direction in
  Rowland 2014 and in the Karpicke handbook chapter. The corpus does not resolve this.
- **Smith & Karpicke 2014** `[ANDRAHAND]`: `d = 0.07` between the two formats across four experiments.
- **Kang et al. 2007** and **Little et al. 2012** `[ANDRAHAND]`: multiple-choice better *without*
  feedback, short-answer better once feedback is given. **Butler & Roediger 2007** `[ANDRAHAND]`:
  short-answer best at one month.
- The ordering "free recall > cued recall > recognition" appears only in a practitioner text
  `[HEURISTIK]`.

**What this changes:** stop arguing for the production format from a format effect — there isn't a
stable one. What the evidence does support is **feedback**, **more than one test**, and **response
congruency** (§1). One plausible reading of Adesope's multiple-choice advantage is that many of its
criterion tests were themselves multiple-choice, which is congruency rather than format — but that is
my inference, not something the corpus states.

This vault's cards remain production-type with the answer revealed immediately, and that is a
defensible arrangement. It is not the *proven superior* one.

## 10. Interleaving beats blocking, and it feels worse

- **Rohrer & Taylor 2007** `[ANDRAHAND]`, volume formulas for four solids: blocked practice scored
  98–99 % correct *during practice* versus 68–79 % interleaved — and on a test one week later,
  interleaved practice scored **63 % versus 20 %** on new problems.
- **Kornell & Bjork 2008** `[ANDRAHAND]`, identifying artists' styles: interleaved presentation
  improved later identification of *new* paintings, while most participants believed blocking had
  taught them more.
- **Shea & Morgan 1979** `[ANDRAHAND]` — the same reversal in motor learning, tested 10 days later.

**What this changes:** nothing about wording; something about reviewing. A due-based review session
interleaves by itself, which is an argument for reviewing what the plugin schedules rather than
sitting down to drill one chapter. And fluency during a blocked session is not evidence of
learning — participants consistently misjudged this.

## 11. Where retrieval practice fails: procedural problem solving

**van Gog & Kester 2012** `[STUDIE]` — 40 Dutch university students without upper-secondary science,
learning to troubleshoot electrical circuits. One group studied worked examples only (SSSS), the other
alternated worked examples with solving isomorphic problems (STST).

| Test | Worked examples only | Alternating with practice problems |
|---|---|---|
| after 5 minutes | 72.81 % | 64.37 % |
| after 1 week | **70.07 %** | **51.25 %** |

`t(37) = 2.06, p < .05, d = 0.66` — **in favour of not testing.** A reverse testing effect at the
delay where the effect is normally largest.

The authors' account: problem solving requires sequential calculation and answer construction at each
step, which is a different operation from recalling a memorised answer, and it interferes with
retrieving the solution procedure. Worked examples act as scaffolding that reduces cognitive load for
novices — and the advantage reverses as prior knowledge grows (expertise reversal).

**This converges with §1.** Pan & Rickard's meta-analysis independently found transfer weakest for
*problems based on worked examples*. Two sources, one experimental and one meta-analytic, put the
failure in the same place.

**What this changes — the scope of the whole skill.** Cards are for facts, definitions, mechanisms,
distinctions and classifications. They are **not** the tool for multi-step calculation procedures:
subnet arithmetic, throughput and delay calculations, complexity derivations, the exact step sequence
of a protocol worked as a problem. For those, study a worked example and then solve real problems —
which is what a KTH exam asks anyway. A card can hold *when* to apply a method and *why* it works; it
cannot practise carrying it out.

Caveats: one study, n = 39 analysed, novices, one-week delay. It is a boundary condition to respect,
not a reason to distrust §1.

## 12. Images on a card: only when the image is the content

**Mayer** `[BOK]`, median effect sizes across the multimedia-learning programme:

| Principle | Median d |
|---|---|
| Multimedia — words *and* pictures beat words alone | 1.39 |
| Coherence — removing decorative graphics | 0.97 (up to 1.66 on paper) |
| Coherence — removing background music or sounds | 1.11 |
| Redundancy — avoiding identical on-screen and spoken text | 0.72 |
| Spatial contiguity — text placed next to the graphic it explains | 1.12 |
| Temporal contiguity — visual and verbal presented together | 1.31 |

And the same expertise reversal as above: these principles are decisive for novices and null or
negative for people who already hold the schema (`d = 0.80` difference).

**What this changes:** a diagram belongs on a card when the diagram *is* what has to be recalled — a
protocol's message sequence, a layer stack, a state machine. A decorative or merely interesting image
is not neutral; removing such graphics is one of the larger effects in the table. Keep the label next
to the part it names rather than in a separate legend.

Caveat: all of this measures multimedia *lessons*, not flashcards. The vault has Excalidraw diagrams
and the site renders them, so the principles are the best available guidance — not a measured result
for cards.

## 13. Does this generalise to a KTH exam?

The uploaded studies do not: word pairs, Chinese nouns, adjective–picture pairs, N = 18–200,
retention intervals from 30 seconds to at most two weeks. That is a real limit on everything
above.

The long-horizon and technical-material evidence exists but is `[ANDRAHAND]` throughout, cited
inside the Karpicke handbook chapter and Dunlosky et al. 2013:

- 6 months, clinical neurology (Larsen et al. 2013); 9 months, history facts (Carpenter et al.
  2009); 42 and 68 days (Rawson & Dunlosky 2011); up to 350 days (Cepeda et al. 2008); 8 years,
  Spanish vocabulary (Bahrick & Phelps 1987).
- University technical material: geometry volume formulas (Rohrer & Taylor 2007), algebra
  (Mayfield & Chase 2002), **engineering fault diagnosis in a distillation system** (de Croock
  et al. 1998), ECG interpretation (Hatala et al. 2003), statistics (Budé et al. 2011).

**What this changes:** the effect has been demonstrated at exam-relevant horizons and on
technical university material, including troubleshooting tasks — the closest analogue to an
application question in HI1031. Cite these as second-hand until the papers are read.

## 14. Rules that remain pure heuristic

The corpus contains **no** empirical study on any of these, and they are load-bearing in
`../SKILL.md`. They are kept because they are the field's best practice, not because they are
measured. Say so when quoting them.

- **Atomicity / minimum information principle.** No study compares total review time or
  retention for one compound card versus several atomic cards on the same content. The only
  support is Wozniak's own assertion `[HEURISTIK]`. The indirect argument is §2: failed cards
  do not transfer, and a compound card fails more often — but that chain is an inference, not
  a measurement. One empirical hook does exist: retrieval-practice effects grow more robust as
  initial success rises, especially above 75 % (Rowland 2014, §15), and atomising is how you
  raise a card's success rate.
- **How lists and ordered sequences are best learned.** Advice to break enumerations into
  causal chains or per-item items is `[HEURISTIK]` only. The related empirical datum is that
  rearranged stimulus–response sets showed no transfer (§1, §3), which argues for per-item
  cards rather than relying on one list card.
- **What to do with a card that keeps failing.** No empirical study at all — not on
  reformulating, splitting, restudying or suspending. What exists: Anki suspends a card as a
  leech after 8 lapses (a tool default, not a finding), and Wozniak advises acting *at the moment
  of forgetting* rather than pre-emptively — *"you should take postpone, reformulate or delete
  actions only at the moment of forgetting the leech"* `[HEURISTIK]`.

## 15. Difficulty: no optimal success rate is known

No source gives a measured optimum for how often you should succeed during practice. The one
directional finding, via the handbook chapter quoting **Rowland 2014** `[ANDRAHAND]`:
*"retrieval practice effects become more robust as initial retrieval success increases, especially
when initial retrieval is greater than 75%."*

FSRS's desired-retention setting and SuperMemo's forgetting index are described in the corpus only
by unattributed documents `[OKÄND PROVENIENS]`; their effects are not measured anywhere in it.

**What this changes:** do not manufacture difficulty by writing harder cards. Write cards you can
actually answer, and let the scheduler supply the difficulty. If a card sits below roughly a
three-in-four success rate, treat that as a wording problem.

## 16. Distinctiveness: marking one phrase helps it and costs the rest

This closes what §21 previously listed as unknown — the `==…==` convention. The corpus does
address it, under the von Restorff / isolation effect rather than under flashcards.

- Making one element visually or structurally distinctive **improves memory for that element**:
  `d = 0.27` and `d = 0.31` for colour changes in word lists (Siefke et al. 2019) `[STUDIE]`;
  higher recognition accuracy for semantically isolated words, `t(51) = 2.85`, plus a reaction-time
  advantage in implicit testing, 71 ms versus 12 ms priming (Geraci & Rajaram 2004) `[STUDIE]`;
  faster categorisation of words in rare frame colours (Oker & Versace 2010) `[STUDIE]`.
- **It costs the surrounding material.** The distinctive item captures attention, and the
  homogeneous items around it fall back to a lower baseline.

**What this changes:** the highlight is defensible, and the existing rule "exactly one highlighted
core per card" is exactly the right shape — highlighting everything destroys the effect, and
highlighting one phrase means the unmarked remainder is remembered *less* well. So the unmarked
part of an answer must be genuinely supporting context you do not need verbatim. If two things in
an answer must both be recalled, that is two cards.

Caveat: effect sizes are small, and every study manipulates colour or semantic category in word
lists, not markdown emphasis inside a flashcard answer. Direction, not magnitude.

## 17. Interference is about cue count, not cue similarity

I had been asking the wrong question. There is no threshold for how similar two prompts may be,
because the mechanism is **cue overload**: the probability of retrieving a given item falls as the
number of items associated with the same cue rises.

**Radvansky & Copeland 2006** `[STUDIE]`, response times under interference, by fan level:

| Fan | Correct responses | Lures |
|---|---|---|
| 1 | 1367 ms | 1461 ms |
| 2 | 1465 ms | 1644 ms |
| 3 | 1501 ms | 1710 ms |

Precision declines logarithmically as the fan of connections from a concept grows, with latency
rising to match.

**What this changes:** the operational rule is countable. Each distinct answer needs a distinct
cue. If three cards open with the same phrase — "Vad kännetecknar…", or the same bolded term — that
phrase is an overloaded cue and every card hanging off it gets slower and less reliable. Grep for a
prompt's opening before adding a fourth card that shares it.

## 18. Successive relearning: the protocol, with numbers

The APA and University of New Hampshire practitioner guides `[HEURISTIK, but summarising Rawson &
Dunlosky's own studies]` state it operationally:

- **At least three** practice-and-relearning sessions.
- **Criterion per session:** test yourself and study the ones you got wrong, until **every item has
  been recalled correctly at least once in that session**.
- **Spacing:** sessions at least one day apart, with the gap set to **10–20 % of the retention
  interval** you are aiming at.

**What this changes:** it turns the exam date into a scheduling constraint on *authoring*. For an
exam three months out, 10–20 % is a 9–18 day gap, which is what FSRS produces for a maturing card
anyway — but only if the card exists early enough to get three of those gaps. A card written the
week before the exam cannot reach the protocol that produced the results in §8. Write cards as the
course runs, not before the exam.

## 19. A confident mistake is the most valuable one

The hypercorrection effect: errors made with **high** confidence are corrected more easily than
errors made with low confidence.

- **Metcalfe & Finn 2011** `[STUDIE]`, schoolchildren grades 3–6: `d = 0.46`, and children needed
  significantly fewer letter cues to correct high-confidence errors than low-confidence ones
  (M = 3.86 vs 5.01, `t(13) = 2.85, p < .05`).
- Robust in young adults; **absent in older adults**, attributed to reduced prefrontal resources
  for registering surprise.

**What this changes:** review behaviour, not wording. The moment you are certain and wrong is the
highest-value moment in a session — read the answer properly instead of clicking past it. It is
also an argument against suspending a card you just got confidently wrong: that card is about to
be learned.

## 20. Cards the author wrote beat cards handed to them

This is the finding that judges the workflow producing this file.

**Pan et al. 2022** `[STUDIE]`, user-generated versus premade digital flashcards:

- definition questions: `d = 0.45, 95% CI [0.25, 0.66]`
- application questions: `d = 0.29, 95% CI [0.12, 0.45]`

And how the content was generated mattered: *"Paraphrasing and copying-and-pasting enhanced overall
performance, generating examples enhanced definition recall only, and word-for-word transcription was
the least effective."*

Supporting context:

- **Slamecka & Graf 1978** `[STUDIE]`, the original generation effect: generating beat reading across
  five experiments and 96 students, though *"the effect was specific to the response items under
  recognition testing but not under cued recall."*
- **Bertsch et al. 2007** `[ANDRAHAND]` — meta-analysis, mean `d = 0.40` favouring generating over
  reading.
- **Karpicke & Zaromb 2010** `[STUDIE]` — generation is *worse* than plain retrieval practice when
  the generation attempt fails: *"People who studied by trying to generating targets ended up with
  poorer recall than people who study by attempting to recall."*
- Generating your own questions beats restudying, but **not** retrieval practice on its own
  (Ebersbach et al. 2020; Weinstein et al. 2010) `[ANDRAHAND]`.
- **Denny et al., PeerWise** `[STUDIE]`, a CS101 cohort required to both write and answer
  multiple-choice questions, correlated against **written** exam questions: number of questions
  *written* `r = 0.067` (ns), number *answered* `r = 0.046` (ns), comments written `r = 0.106`
  (p = .012), **days active** `r = 0.168` (p = .0001), combined engagement measure `r = 0.331`.
  Correlational, not causal — but the two things that predicted deeper written performance were
  discussion and **work spread across days**, not authorship volume.

**What this changes — the division of labour between agent and author.** An agent-authored deck is
the *premade* condition, and premade lost by a moderate margin on both memory and application.

**The author of this vault has decided not to write cards.** That is a deliberate, documented
trade-off, not an oversight: the cost is roughly the effect sizes above, and it buys coverage,
consistency and the time not spent. Do not re-litigate it in every session, and do not hand over
cards with a request to reword them.

What compensates — and what it does **not** do. The list below does not cancel the penalty. These
levers are available in both conditions, so a reader of premade cards who uses them is comparing
against an author who could use them too; they raise the floor rather than offset a
between-conditions difference. Two honest statements:

1. The `d = 0.45` / `d = 0.29` penalty stands, unoffset. Nothing here buys it back.
2. It is a *moderate* penalty against a deck that would otherwise not exist, and the levers below
   are larger in absolute terms than the authorship difference — which is an argument about where to
   spend effort, not an argument that authorship is free.

- **Retrieval practice outranks generation.** Generating your own questions beats restudying but not
  retrieval practice on its own (Ebersbach et al. 2020; Weinstein et al. 2010), and generation is
  *worse* than retrieval when the generation attempt fails (Karpicke & Zaromb 2010).
- **The largest levers need no authorship from the student**: response congruency (§1), feedback on
  every lapse (§7), continued testing rather than retirement (§8), interleaved due-based review (§10),
  three or more spaced sessions (§18).
- **PeerWise points the same way, weakly.** The number of questions a student *wrote* did not
  correlate with performance on written exam questions (`r = 0.067`, ns), while days active did
  (`r = 0.168`) and overall engagement did (`r = 0.331`). Note what it measured: writing
  multiple-choice questions for peers, not authoring one's own flashcards (§21). Treat it as
  consistent with the conclusion, not as support for it.

The residual risk shifts to the agent: a premade deck is only as good as its grounding, which is why
the skill's first procedural step is that every card must be traceable to a passage in the course
literature.

## 21. Not covered by any source

- **The effect of marking the target phrase in the answer** — now partly answered, see §16. It
  helps the marked phrase and costs the unmarked remainder. What is still unknown is whether that
  transfers from coloured word lists to markdown emphasis on a card.
- **Whether the person who writes a question learns more than the person who answers it.** The
  premade-versus-user-generated question is answered (§20), but the one direct look at authorship
  volume found no correlation with deeper written exam performance (PeerWise, §20) — correlational,
  and about writing multiple-choice questions for peers rather than making one's own cards.
- **Adding a concrete example to an abstract concept.** No study of the effect on the concept itself.
  The corpus's concreteness source (ter Doest & Semin 2005) is about memory for concrete versus
  abstract *words*. The one adjacent datum is in §20: generating your own examples improved
  definition recall only, not application.
- **Steering a desired-retention setting toward a fixed exam date.** The FSRS documentation is now
  uploaded and defines the parameter — 0.9 by default, meaning a card is scheduled for the moment its
  predicted recall probability falls to 90 % — but the corpus contains *"no empirical studies,
  quantitative data or specific rules"* for adapting it to a deadline. Neither Settles & Meeder 2016
  nor Ye, Su & Cao 2022 addresses it either, despite both being uploaded. §18's protocol is the
  practical substitute.
- **The complexity boundary, as a general claim.** van Gog & Sweller 2015 and Karpicke & Aue 2015 are
  both still only cited inside other sources. What we do have first-hand is the primary study behind
  van Gog's position (§11) plus Pan & Rickard's converging moderator — enough to justify the scope
  limit in §11, not enough to say how far it extends beyond worked-example problem solving.
- **How similar two prompts may be** — there is no such threshold, and asking for one was the wrong
  question. See §17: the mechanism is cue overload, which counts items per cue.

## 22. Adding to this file

One claim per entry: what it says, **what it changes in a card**, the source, the tier, and the
caveat that limits it. If a new claim contradicts a rule in `../SKILL.md`, change the rule in
the same edit — a documented rule that the evidence file contradicts is worse than no rule.
Never promote `[ANDRAHAND]` to `[STUDIE]` without reading the paper.
