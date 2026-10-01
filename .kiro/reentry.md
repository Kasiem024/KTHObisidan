# Re-entry prompt

**This is the only file you need to be pointed at.** It is rewritten immediately before `/compact`.
Read it fully before doing anything.

It is deliberately short. Everything under `.kiro/steering/` is `inclusion: auto` and is already in
your context — the hard rules, the environment traps, the script library, the output style. **Do not
re-read them looking for basics, and do not restate them here.** This file carries only what is
task-specific plus the handful of things that have actually bitten.

Last updated **2026-10-01, 15:30**. Course-neutral by design; the live course is HI1031.

---

## FIRST TASK AFTER RE-ENTRY: nothing is assigned — ask him

The work of 2026-09-26 to 10-01 is **finished, verified, committed and pushed**. Everything is
recorded in `Meta/Vault Findings & Backlog.md` as **F80 to F83**; nothing is in flight.
`steering/current-state.md` says the same.

**No commit id is quoted here on purpose.** This file is rewritten *before* the commit that contains
it, so any id it named would be one commit stale the moment it was written — which is exactly how the
previous version came to assert a figure three commits behind. Run `git log -1` and
`git ls-remote origin refs/heads/main` and compare them yourself; that takes one call and cannot rot.

**Two things are waiting on his decision, not on work.** Put them to him and let him choose:

1. **Chapter 9's deck has no card for the hypermedia part of exam question 2.** The 2012 book never
   uses the word, which is why four reviewers found no coverage — but **`restfulapi.net` is required
   course literature**, named on line 58 of KursPM (*What is REST*, *REST Constraints*, *Naming REST
   resources*), and the vault holds a saved copy at `REST - restfulapi.net.md`. So this is a plain
   coverage gap against a named exam question, not a question of accepting an outside source. An
   earlier report framed it as the latter and was wrong. Still never fill it from memory — use the
   saved article.
2. **HI1032's twelve chapter decks and its Labb 1 deck carry card-form findings** — run
   `Test-DeckHygiene.ps1` with no `-Course`. Those decks predate these conventions. HI1031's ten and
   HI1032's Labb 5 are clean.

---

## THE SHAPE OF THE COURSE WORK, so you do not re-derive it

**His goal is to pass the exam, not to cover the book** (`steering/product.md`). Where a course
publishes exam questions, those questions are the specification and the book is the source of
grounded answers. HI1031's are at
`KTH/2026 Höst/HI1031 .../Filer/Canvas/Tentor/Tentafrågor HI1031 Distribuerade informationssystem.md`
— read-only, and the complete one. **Two files in that folder look like exam material and are not;**
`product.md` names both. The examination is a **muntlig enskild examination**.

**Card counts now**, per chapter: 01 26, 02 19, 04 29, 05 24, 06 25, 09 18, 10 22, 11 30, 16 28,
17 **33** — 254 cards and 115 markers across the ten decks. HI1032's Labb 5 holds 57 and 56.

**The 40–60 cards per deck target is superseded.** The rule is "as few as possible, as concentrated on
the exam questions as possible", and **40 is not a floor**. Chapter 17 is the one deliberate exception,
widened from 18 to 33 on his explicit request on 2026-10-01.

### Four things that must not be re-litigated

- **`nosr` is his rotation and is not an agent's to change.** He has said so twice. Chapters 01, 02 and
  17 had it removed between 09-27 and 10-01. `Format-FrontmatterTags.ps1` preserves whatever is there
  and **does not restore a missing `nosr`** — check deliberately before running it.
- **Chapter 5 question 4 and chapter 9 question 3 teach the same comparison, and that is correct.**
  The exam asks it twice. Removing it from either chapter makes one question unanswerable from its own
  chapter.
- **Shorter cards did not make them shallower.** A depth calibration on the twenty most-shortened
  cards found **0 of 20** had lost their mechanism (F81). The gap that mattered was **tradeoffs and
  downsides**, which a coverage check cannot see because every written question still had cards.
- **Multi-fact cards are the hard form, measured in his own review data** within each deck, five decks
  of five (F80). A prose card that hides two facts is worse still, because it is easy to pass on half
  the answer. `write-flashcards/SKILL.md` rule 8 has the figures.

---

## WHAT TO RUN, AND IN WHAT ORDER

`steering/scripts.md` is the full list and is already loaded. The only things worth repeating here are
the two that are easy to get wrong:

- **`Test-DeckHygiene.ps1` is the only check that sees a card's *shape*.** Its default scope is the
  `* Begrepp - Kap *` decks, so a lab deck like `HI1032 Labb 5` needs **`-All`**. Run `-SelfTest`
  before trusting a zero from it. A scope that resolves to nothing exits **2**, not 0.
- **`Get-SRIntegrity.ps1 -Save` writes one global file.** Pass **`-BaselinePath`** with your own path
  if anything else might touch the vault while you work, and read the `baseline taken at` line it
  prints to check the snapshot is yours (T22).

**Two scripts report on the information stream** — `Test-DeckHygiene.ps1` and `Test-DocHygiene.ps1` —
so `| Out-String` captures nothing from them; redirect stream 6 and decode the file as UTF-16LE. The
other twelve use `Write-Output`, where `6>` captures nothing instead (T23).

---

## STATE OF THE REPOSITORY

**Clean and pushed at the time of writing.** Verify by comparing `git rev-parse HEAD` with
`git ls-remote origin refs/heads/main` rather than by reading push output — git on Drive prints a
benign `failed to perform geometric repack` whether the push succeeded or not.

**Never trust a commit id written in a doc**, including this one. `current-state.md` has carried a
stale id three times and a reviewer caught it again on 2026-10-01; this file asserted one that was
stale before it was even committed, because it is written before the commit containing it.

Expect the working tree to be dirty again by the time you read this: **he reviews on his phone and in
Obsidian, and both write to the vault.** A review adds or rewrites `<!--SR:-->` lines and touches no
card text. **Editing a note's tags in Obsidian's own UI rewrites the frontmatter into YAML list form**,
which the audit reports as `listStyleTags` — that is the identified cause of the recurring drift, and
`Format-FrontmatterTags.ps1` is the repair.

One file stays untracked deliberately:
`.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`, a Drive sync
artefact. Deleting it is his call.

**Before any push:** a local `pre-push` hook runs markdownlint and `Vault-Audit.ps1 -ContentOnly` and
blocks the push if either fails. It is untracked, so it exists only in this clone. **Do not bypass it
with `--no-verify`** — fix what it found.

---

## THE EXAM DATE IS UNKNOWN

The old archive file says 21–23 September 2026. That is past and wrong. He confirmed on 2026-09-26
that the exam was moved and **gave no new date**. Do not quote one, and do not plan against one.

---

**How to use this file:** rewrite `FIRST TASK` and `STATE OF THE REPOSITORY` before saying "run
compact", and leave the rest unless something new was learned. The table of where every durable fact
belongs is in `.kiro/README.md` and `steering/documentation-standard.md`. Finished work goes in the
backlog, not here.
