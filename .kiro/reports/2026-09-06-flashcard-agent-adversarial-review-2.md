# Second adversarial review — what it found that the first did not (2026-09-06)

Two reviewers ran the same brief concurrently and **both wrote to the same deliverable path**, each
overwriting the other once. `…-adversarial-review.md` holds the first reviewer's report; the second
delivered in chat, per the brief's fallback. This file records only the findings that were **unique
to the second review**, transcribed from that chat delivery, so they are not lost.

Process lesson, worth more than any single finding: the brief named one output path, so two honest
reviewers silently destroyed each other's work. A brief that may be run more than once must name a
per-run path — reviewer name or a timestamp.

## Findings unique to the second review

| # | Finding | Status |
|---|---|---|
| C6 | **The rewrite deleted 15 of the 22 cards the note already had.** `numstat 249/38`. Nine removals are defensible de-duplication (`Begrepp/Klient-server-modellen.md:21`, `Begrepp/Peer-to-peer.md`); `**Arkitekturmodell**` had no successor anywhere | Confirmed independently; card restored, `SKILL.md` rule 12 added (F69) |
| C1 | `nosr` **contradicts F64 specifically**, which records "HI1031 (keep Kap 1, 2, 4, 5)" — the first review only noted the divergence from `HEAD` and from Kap 01 | Confirmed; hook added, tag left for the author |
| C5 | **Every write hook fails open.** Reproduced with a missing interpreter: exit 255, and any code other than 2 allows the tool | Confirmed; wrapper verified in a shell but not against the hook runner, so not deployed |
| S2 | **Two AJAX cards restate `Kap 09 Web services.md:30`** — both facts, and AJAX was not among the declared deferrals | Confirmed; replaced by one card on the chapter-2 point Kap 09 does not cover |
| M | `"var statiska"` overstates the book's *relatively* static (line 1061); the asynchronous-solution card adds reasoning the book does not contain (1562); the benign-failure card is compound (1642); one list card mixes Swedish and English labels; `Cachning` vs Kap 01's `Caching` | All six corrected |
| Doc | Rule 5 attributes `d = 0.27–0.31` to two studies when both numbers are Siefke; Geraci & Rajaram report `t(51) = 2.85`. Rule 9 claims retrieval *probability* falls but quotes only latencies, and "three or more" was merely the highest fan level tested | Both tags downgraded `[measured]` → `[indirect]` |
| Doc | `evidence.md` §20's compensation list does not net out the `d = 0.45` penalty — the levers are available in both conditions | Rewritten to say so plainly |

## Reported but not upheld

- **F64's "14 notes tagged" against 31 today.** Not a stale figure: **F65** documents the growth to
  31 in the same session. The reviewer had not read the following entry.
- **`Meta/Vault Standard.md` §4 requiring `## Flashcards` on concept collections** while no
  collection note has that heading. Left open — this is a pre-existing question against the standard,
  not something this work introduced, and changing a convention needs the `add-a-convention` pipeline
  rather than a drive-by edit.

## Where the two reviews agreed

Both falsified claims 1, 2, 5 and 6; both confirmed claim 8 outright; both found the write-scope hook
bypassable by path traversal and by a decoy path in the payload content, and the SR guard resolving to
the wrong file. Both concluded the separate agent is only weakly justified, that `write` should not sit
in `allowedTools`, and that `denyByDefault` should be `true`. Both verified the 87 cards' grounding in
chapter 2 independently — the second traced all 87 to line numbers — and neither found a card that
misstates the source.
