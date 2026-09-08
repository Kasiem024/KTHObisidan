# Flashcard formulation — reasoning, evidence and worked examples

Detail behind `../SKILL.md`. Read this when a card is hard to word, when deciding whether a
rule can be bent, or when judging cards someone else wrote.

## Two independent problems

| Problem | Owned by | Status |
|---|---|---|
| *When* to show a card | FSRS in `obsidian-spaced-repetition` | Solved. Never touch `<!--SR:-->`. |
| *What the card says* | The author | The only lever left, and it decides the deck's cost |

A badly worded card is not a small loss. It fails repeatedly, so the scheduler shows it more
often, so it consumes review time that correctly worded cards would have used.

## How strong is the evidence

**`evidence.md` in this folder is the authority.** It records each claim with a tier, an effect
size where one exists, and the caveat that limits it. Do not re-derive evidence strength here —
two lists of the same claims will drift apart.

The short version, for orientation:

- **Measured, with numbers:** that retrieval practice transfers to new questions at all, and the
  conditions under which it does not; that a card failed during practice transfers nothing; that
  the backward direction of a related pair must be practised separately; that effects grow with
  delay; that the effect disappears without genuine effort.
- **Well replicated in the wider literature but not verified first-hand here:** the testing
  effect itself, the spacing effect, the generation effect, desirable difficulties, interference
  between competing cues.
- **Practitioner heuristic, unmeasured:** atomicity / the minimum information principle, how
  lists and sequences are best broken up, and most of Wozniak's *Twenty rules of formulating
  knowledge*. Sound advice. Not findings, and must not be quoted as such.
- **Not addressed by any source:** whether adding a concrete example to an abstract concept helps
  the concept, and how to steer a desired-retention setting toward a fixed exam date. Two questions
  that looked unanswerable turned out to be answered under other names — marking a phrase falls
  under the von Restorff / distinctiveness literature, and "how similar may two prompts be" is the
  wrong question, since the mechanism is cue overload. Both are in `evidence.md` §16 and §17.

## The rules, with the reasoning

### One fact per card

A card carrying five facts fails if any single one slips, and then all five are re-reviewed.
Atomic cards also localise the failure: you learn *which* fact you did not know.

Practical test: can this card fail for two independent reasons? Then split it.

Be honest about the standing of this rule: it is the field's most repeated advice and **nothing
in the corpus measures it** (`evidence.md` §14). Its empirical anchor is indirect — a card failed
during practice produces no transfer, so reducing a card's failure rate is what the rule is
really buying.

### The prompt must uniquely determine the answer

Otherwise self-grading becomes inconsistent, and the scheduler is fed noise instead of signal.
Ambiguity usually comes from a prompt that names a *topic* rather than asking a *question*.

### `==…==` is this vault's cloze marker

The vault's cards are not literal cloze items, but the highlight does the same job: it declares
which phrase the card is testing, so grading is unambiguous and the eye is trained on the part
that matters. Every card should have exactly one highlighted core — occasionally two when the
answer is genuinely a pair.

**And that "exactly one" turns out to be the load-bearing part.** Distinctiveness is measured: an
isolated element is remembered better, at the cost of the homogeneous material around it
(`evidence.md` §16). So highlighting everything removes the effect, and highlighting one phrase
means the rest of the answer is remembered *less* well — which is only acceptable if the rest is
genuinely context you do not need verbatim. Two things that must both be recalled are two cards.

The measured effect sizes are small (`d = 0.27–0.31`) and come from coloured word lists, not from
markdown emphasis on a card. Direction, not magnitude.

### Reversed cards are two cards, and the reverse is not free

`;;` and `??` generate a back-to-front card as well. The old wording of this rule assumed the
backward direction rides along for free; the corpus says otherwise for *semantically related*
pairs, which is exactly what a term and its definition are (`evidence.md` §3). Testing one
direction gave `d = 0.41–0.55` transfer to a changed direction on pairs and none at all on
triplets.

So: use `;;` when you must be able to **produce** the term, and accept that you are buying two
cards' worth of practice because you need both directions. Use `::` when only one direction
matters — a *why* question has no meaningful reverse.

### Enumerations

"List all eight" bundles eight facts, an ordering, and a completeness check into one grade.
The standard fix is **overlapping cloze**: one card per item with the others visible, so each
review tests one item in the context of the list.

Observed in this vault on 2026-09-05, in
`KTH/2026 Höst/HI1031 Distribuerade informationssystem/Anteckningar/HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system.md`:
4 of the 25 cards then in the note were in relearning after that day's session — the two
eight-item list cards (`huvudutmaningarna (8)`, `former av transparens (8)`), plus `Öppenhet`
(both directions) and `Replikeringstransparens` (one direction).

How that was read, so it can be re-derived: a card in relearning has a `due` timestamp minutes
after its `lastReview` timestamp inside `<!--SR:!fsrs,…-->`, instead of the next day. The field
positions are inferred from the data, not from plugin documentation, so re-check the pattern
rather than trusting the field order. **This is weak evidence** — those cards were days old and
each had one or two reviews. It is consistent with the anti-enumeration heuristic, not proof of
it.

### Interference is a matter of how many answers share a cue

`Tillgänglighet` appears in HI1031 kap 1 in two legitimate senses: the security property (nobody
is locked out) and the measure (the share of time the system is usable). Left as two bare
`**Tillgänglighet**` cards they would compete — one cue, two answers. The fix used was to put the
sense into the prompt: `**Tillgänglighet** (availability, som mått);;…`.

The mechanism is cue overload, and it is countable rather than a matter of judging similarity:
retrieval slows and degrades as more items hang off the same cue (`evidence.md` §17). So the check
is a grep, not an impression — how many existing cards already lead with this term or this opening
phrase.

Same pattern applies to `Replikering` (technique) versus `Replikeringstransparens` (transparency
form) — both inside HI1031, which is where the rule bites. `Caching` here versus cache memory in
HI1024/HI1025 is **not** a case to fix: those sit in different courses' decks, and since each
course's deck must stand alone the overlap is accepted (SKILL.md rule 9).

### Never rewrite a card that has history

The `<!--SR:-->` schedule was earned by the *old* question. Editing the question keeps the
schedule and silently applies it to a different item. Typos and formatting are fine; meaning is
not. Add a new card instead.

## Worked examples from this vault

Before → after, taken from real edits.

**A term list entry turned into a card.** The source list said:

> Caching: Lokal lagring av nyligen använda dataobjekt nära klienten för att minimera latens och
> minska belastningen på nätverk och servrar.

Copied verbatim that is a definition to read, not a prompt to answer. As a card:

```markdown
**Caching**;;Att ==spara en kopia av nyligen använda data nära klienten== så att nästa åtkomst
inte behöver gå hela vägen till servern – minskar *fördröjning* och *belastning* på nät och server.
```

The recall target is highlighted, the rest is supporting context, and the reverse direction is
useful ("what is the word for…"), so `;;` is justified.

**A concept that is only worth a reasoning card.** Concurrency is already named in a list card,
so a second definition card would interfere. What was missing was *why it is a challenge*:

```markdown
Varför är samtidighet en utmaning och inte bara en egenskap?::Flera klienter kan ==använda samma
resurs samtidigt==, och utan synkronisering kan operationerna flätas in i varandra och lämna data
*inkonsistent*. Varje delad resurs måste själv skydda sig, t.ex. med semaforer.
```

One-directional `::`, because the reverse question does not exist.

**A short list where the list is the unit.** Two items, count in the prompt, `||`:

```markdown
Vilka två tekniker används för att avlasta resurser som efterfrågas mycket ofta?
||
- **Caching** – spara en kopia av det nyligen använda ==nära klienten==
- **Replikering** – hålla ==flera kopior på olika servrar==
```

Then a separate card per item, so a slip on one does not re-review the other.

## Mechanics specific to this vault

- A card runs from its separator to the **next blank line**. An inserted blank line splits the
  card and orphans the answer — the reason `markdownlint --fix` is dangerous near cards
  (`vault-bulk-edit` §7).
- Concept notes put cards under `## Flashcards`, which must be the **last** section.
  **Concept-collection notes** (`HI1031 Begrepp - Kap 01 …`, `SEM4 Begrepp HF1201`) are the
  recognised exception: cards sit directly under topical `##` sections with no `## Flashcards`
  heading. Follow whichever shape the note already uses.
- The published site rewrites cards into collapsible callouts at build time, anywhere in a note.
  The vault is never modified for the site's benefit.
- Whole-note exclusion from review is the `nosr` tag, which must also be listed in
  `flashcardTagsToIgnore` in the plugin's `data.json`. `==DISABLEDFLASHCARD==` is legacy and no
  longer used here.
- Swedish, in the author's voice; technical terms may stay English. Never invent exam guidance.

## Per-card checklist

Run this over each new card before saving:

1. Does it test exactly one fact?
2. Does the prompt admit exactly one correct answer?
3. Is the recall target highlighted with `==…==`?
4. Is the answer at most two sentences?
5. Is the separator the weakest one that does the job (`::` unless the reverse is needed)?
6. Does a card for this fact already exist in **this course's own** `Anteckningar/` decks? A hit in
   another course's notes or in a `Begrepp/` note is **not** a reason to skip it — each course's
   decks must stand alone, because the author drops a deck when the course ends
   (`.kiro/steering/product.md`, SKILL.md step 2).
7. Could it be confused with a neighbouring card **in this course**? Count how many of this
   course's existing cards share its opening phrase or leading term; if that is three or more, the
   cue is overloaded. Cross-course cue sharing is accepted where self-containment requires the card
   in both decks (SKILL.md rule 9).
8. Is every claim in it traceable to the course material, with nothing invented?
