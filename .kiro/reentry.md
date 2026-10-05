# Re-entry prompt

**This is the only file you need to be pointed at.** It is rewritten immediately before `/compact`.
Read it fully before doing anything.

It is deliberately short. Everything under `.kiro/steering/` is `inclusion: auto` and is already in
your context — the hard rules, the environment traps, the script library, the output style. **Do not
re-read them looking for basics.** This file carries only what is task-specific plus the handful of
things that have actually bitten.

Last updated **2026-10-05, 11:20**. Live courses: HI1031 and HI1032.

---

## FIRST TASK AFTER RE-ENTRY: nothing is assigned — ask him

The work of 2026-09-26 to 10-05 is finished, verified and pushed, recorded as **F80 to F93**.

**No commit id is quoted here on purpose.** This file is rewritten *before* the commit that contains
it. Run `git log -1` and `git ls-remote origin refs/heads/main` and compare them yourself.

Two things are open, and both are his to decide, not yours to start:

1. **`HI1032 Labb 1 - Flashcards.md` carries card-form findings** from before the current conventions.
   Run `Test-DeckHygiene.ps1 -All` and read its lines. `-All` is a **survey, not a gate** — it reports
   thousands of legacy findings across finished courses, so filter to the file you care about.
2. **A handoff prompt for an outside agent exists only in the previous transcript.** He asked for a
   prompt that would let another agent review F93 and report on how to improve the agent workflow here.
   It was written, adversarially reviewed twice and revised, and then handed to him in chat — it was
   never saved to a file. `.kiro/sessions.md` has the row. If he wants it again, it has to be rebuilt
   or recovered from that transcript.

---

## THE THING THAT WILL MAKE YOU BUILD THE WRONG ARTEFACT

**F87 designed a flashcard form and F92 reversed it.** Read the backlog forwards and you will rebuild
something he discarded.

F87's cards put the exam question in the prompt and named *parts of the answer* in the rows without
stating them. F92 rewrote all of them to **carry the answer outright**, on his instruction — concise,
but a real answer, length accepted. `current-state.md` has the quote.

**Why it failed is the useful part:** a pointer card only works if the fact it points at sits in a deck
he actually drills, and five of HI1031's ten concept decks carry `nosr`. **Three adversarial rounds
approved the design**, every reviewer briefed with the rules, and none of them asked that question.
That is what the new `adversarial-reviewer` agent's second lens exists for.

---

## THE AUTHORING RULES THAT ARE NEWEST AND EASIEST TO BREAK

All are in `product.md` in full. Repeated here because each was discovered by getting it wrong.

- **No card whose answer is an address, a mask or an ID.** Protocol constants are vocabulary and stay —
  a well-known port, HSRP's multicast address. Lab addresses, subnet masks and router IDs do not. Write
  the **shape and the consequence** instead.
- **Do not memorise what the exam prints in front of him.** HI1032's exam hands out the TCP header, the
  six ACK rules and a state machine in the question text, so cards train *applying* them. This is the
  same rule as the one above, generalised.
- **The 40–60 cards per deck target is superseded.** "As few as possible, as concentrated on the exam
  questions as possible." 40 is **not a floor**.
- **The 150–250 line target for an exam-answer note cannot be met** by a chapter with five or six exam
  questions. Quote **lines per exam ask** (29 to 47 across HI1031's five) and treat a note over 250 as a
  finding only when some paragraph cannot be tied to a named exam question.

### Five things that must not be re-litigated

- **`nosr` is his rotation.** He drills HI1031 chapters 01, 02, 11, 16, 17. `Format-FrontmatterTags.ps1`
  preserves what is there and **does not restore a missing `nosr`**.
- **HI1031's exam-answer cards exist in two copies** — the ten chapter notes and `Snabbsvar`, which is
  `nosr`. **Edit one and you must edit the other.**
- **HI1031 chapter 9's hypermedia gap is closed** (F86). An older `current-state.md` said otherwise and
  a reviewer built its main objection on that sentence.
- **Multi-fact cards are his hardest form**, measured in his own review data. He has accepted that cost
  deliberately for the answer-bearing cards; do not reopen it.
- **HI1032's twelve chapter decks are deleted** (F89), not missing.

---

## WHAT TO RUN, AND THE THREE THAT ARE EASY TO GET WRONG

`steering/scripts.md` is the full list and is already loaded.

- **`Test-DeckHygiene.ps1` is the only check that sees a card's *shape*.** Nine checks now: `cueMismatch`
  was added in F93 because the `(N)` rule was half-checked — the gate confirmed a cue existed and never
  compared its number to the body. Default scope is the `* Begrepp - Kap *` decks, so anything else —
  a lab deck, `Tentaplugg`, `Tentafragor och Svar` — needs **`-All`**. Run `-SelfTest` before trusting a
  zero: it plants nine defects and holds ten controls.
- **`Get-SRIntegrity.ps1 -Save` writes one global file.** Pass **`-BaselinePath`** with your own path
  (T22). When you reword a card and keep its marker, `-Compare` reports the marker as *moved* — that is
  the placement check working, but you must then show each old prompt maps **one-to-one** to its new one.
  A **new file** makes `-Compare` exit 1 by design, so the criterion is attribution, not a clean exit.
- **Two scripts report on the information stream** — `Test-DeckHygiene.ps1` and `Test-DocHygiene.ps1` —
  so `| Out-String` captures nothing from them. **But `6>` on a child `powershell -File` call captures
  nothing either**: run them and read the terminal instead. That cost a wrong conclusion on 2026-10-03,
  and `traps.md` T23 already said so.

---

## STATE OF THE REPOSITORY

**Clean and pushed at the time of writing.** Verify by comparing `git rev-parse HEAD` with
`git ls-remote origin refs/heads/main`, not by reading push output — git on Drive prints a benign
`failed to perform geometric repack` either way.

**Stage by name, never a directory.** `git add -u` on `.kiro` or `Meta` swept a concurrent session's
documentation work into a flashcard commit on 2026-10-02; the correction is in the backlog under F91.
Read `git status` immediately before staging, every time.

Expect the working tree dirty: **he reviews daily and edits cards by hand.** A review changes only a
card's scheduling-marker line; on 2026-10-05 he also reworded a chapter 17 prompt himself. So classify
a diff before calling it review data, and **take the whole diff in one call** — `git diff --numstat`
with a Swedish pathspec matches nothing and exits 0 (T2).

One file stays untracked deliberately:
`.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`.

**Before any push:** a local `pre-push` hook runs markdownlint and `Vault-Audit.ps1 -ContentOnly` and
blocks the push if either fails. It is untracked, so it exists only in this clone. **Do not bypass it
with `--no-verify`.**

---

## WHEN YOU REVIEW, OR ARE ASKED TO BUILD SOMETHING

Use `.kiro/agents/adversarial-reviewer.*`, and use **both** lenses: one reviewer handed the
authoritative rules, one handed his situation and goal and **not** the rules.
`documentation-standard.md` now requires one of each, and the reason is in `lessons-learned.md`.

Two failure modes are recorded there and are worth knowing before you trust any review:

- **Conformance reported as review** — a reviewer with the rules checks conformance and never asks
  whether the thing is worth building.
- **Scope checked, source not** — every reviewer compares the work to the brief, so a brief that
  excluded part of the source is invisible to all of them. One pass must enumerate the **source** and
  diff it against what was produced.

And **do not ask a subagent to count anything.** Every form check a reviewer performed in these sessions
was already performed better by a script. If you catch yourself counting, the gate is missing a check.

---

## THE EXAM DATE IS UNKNOWN

The old archive says 21–23 September 2026. That is past and wrong. He confirmed on 2026-09-26 that the
exam was moved and **gave no new date**. Do not quote one, and do not plan against one.

---

**How to use this file:** rewrite `FIRST TASK` and `STATE OF THE REPOSITORY` before saying "run
compact", and leave the rest unless something new was learned. Finished work goes in the backlog, not
here. The table of where every durable fact belongs is in `.kiro/README.md`.
