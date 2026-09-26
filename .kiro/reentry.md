# Re-entry prompt

**This is the only file you need to be pointed at.** It is rewritten at the end of every context
window, immediately before `/compact`. Read it fully before doing anything.

It is deliberately short. Everything under `.kiro/steering/` is `inclusion: auto` and has already
been loaded into your context — the hard rules, the environment traps, the script library, the
output style. **Do not re-read them looking for basics, and do not restate them here.** This file
carries only what is task-specific plus the handful of things that have actually bitten.

Last updated **2026-09-15, 20:45**. Course-neutral by design; right now the live work is HI1031.

---

## THE CLOCK THAT GOVERNS EVERYTHING

**HI1031's oral exam is 21–23 September 2026.** Today is the 15th. Six days. Every decision about
that course is now a study-time decision, not a completeness decision. Do not start work that
cannot be finished and verified in one context window.

## FIRST TASK AFTER RE-ENTRY: nothing is assigned — ask him

The task he gave on 2026-09-15 is **finished and reviewed**. There is no queued instruction. Four
things are waiting on *his* decision, not on work. Put them to him and let him choose:

1. **Fifteen undefined terms** across the four concentrated chapters — marshalling, middleware,
   socket, IDL, `operationId`, CDR, proxy, CORBA, mellanprogram, *separation of concerns* and more.
   Ten adversarial reviewers named them as the single most valuable remaining fix. **The catch:**
   glossing them adds roughly 15 lines, which pulls against the concentration he just asked for.
   Three of the most load-bearing are already glossed. His call, not yours.
2. **Ten remaining language spots** the language reviewer named. The five worst are fixed.
3. **Nothing is committed.** The working tree holds all eight edited files plus one new report. He
   has not asked for a commit. Do not commit unprompted, and never push to `main` unasked.
4. **The `Begrepp/` folder question from an earlier session is still unanswered:** 14 concept notes
   covering only the course's early material, nothing for chapters 9 or 11. The recommendation given
   was to leave the folder as reference and add one line saying what it is, rather than expanding it.

**Parked, not cancelled:** the previous re-entry file's task was *"get familiar with HI1032 lab 3,
ACL and HSRP"*. He pivoted to HI1031 before it started. If he returns to it, the material is at
`KTH/2026 Höst/HI1032 Kommunikationssystem/Filer/Canvas/Laborationer/Labb 3 ACL HSRP.md` plus the
student and instructor manuals under `Filer/Canvas/AI-optimerad Markdown/Laborationer/`. The
established output pattern for a lab is a deck named `HI1032 Labb N - Flashcards (<topic>).md` in
`Anteckningar/`. The required reading is NetAcad CCNA3 8.1, 9 and 10.1, which is **not in the
vault** — do not silently substitute Forouzan for it.

---

## WHAT WAS DONE 2026-09-15, and the state it left

His teacher named **chapters 6, 11, 16 and 17 as the most important to practise**, so those stay
untouched. Chapters **1 and 2** also stay untouched because he has already started learning them.
The remaining four — **04, 05, 09 and 10** — were concentrated down to the direct exam questions,
both the `Tentafrågor och Svar` note and the `Begrepp` deck per chapter.

| Kapitel | Not | Deck |
|---|---|---|
| 04 Interprocesskommunikation | 361 → **314** | 58 → **41** |
| 05 Fjärranrop | 285 → **237** | 42 → **32** |
| 09 Web services | 392 → **335** | 50 → **38** |
| 10 Peer-to-peer-system | 437 → **347** | 58 → **35** |
| **Summa** | **1475 → 1233 (−16 %)** | **208 → 146 (−30 %)** |

**The full record — plan, cut lists, decisions, the ten reviewers' findings and every fix — is in
`.kiro/reports/hi1031-koncentrering-2026-09-15.md`.** Read that before touching these four chapters
again. It is the only place the reasoning survives.

**Verified at the end:** `Get-SRIntegrity.ps1 -Compare` named exactly those four decks and no others;
`excludedCards` 533 → 471, which is −62 and equals 208 − 146 exactly; `markers placed on cards`
**1477** unchanged and no marker moved; CR 0 and no double blank lines in any of the eight files;
`Vault-Audit.ps1` clean; markdownlint **549 files, 0 issues**; `Test-DocHygiene.ps1` clean.

### The mandate that made this different, and its boundary

He said on 2026-09-15: *"jag tror inte att jag behöver lära mig väldigt mycket utanför de direkta
tentafrågorna för de kapitlen."* That **cancelled the "an oral examiner might ask a follow-up"
argument** which had protected a lot of material in the September review — **but only for chapters
04, 05, 09 and 10.** For 01, 02, 06, 11, 16 and 17 the old decisions stand. Do not generalise it.

### Two things that must not be re-litigated

- **Chapter 5 fråga 4 and chapter 9 fråga 3 teach the same comparison, and that is correct.** Two
  reviewers found five duplicate card pairs and called it waste within one course. They are right
  about the observation and wrong about the cause: **the exam asks the same comparison twice.**
  Removing it from either chapter makes one exam question unanswerable from its own chapter.
- **`nosr` has already been raised with him and he said he has it under control.** Do not bring it
  up again, and do not change the tag.

---

## FIVE THINGS THIS SESSION LEARNED THAT NO DOC PREDICTED

**These have no durable home yet. Giving them one is a legitimate small task if he wants it** —
`documentation-standard.md` says a finding that fits none of the five homes is a finding against
that file. Suggested homes in brackets.

1. **A hedge check on the note is not enough — run it on the deck too.** Two of the book's hedges
   were flattened in chapter 4's *deck* (`usually` → dropped, `has the potential to reduce` →
   "sparar") while the note kept both. I grepped only the notes, so both survived my verification
   and were caught by a reviewer. [`write-flashcards/SKILL.md`]
2. **Merging cards is where overload appears.** Three of my five deliberate merges were judged
   overloaded by the card reviewer. Read a merged card back and count the facts on it, as if it were
   newly written. [`write-flashcards/SKILL.md` — it already says this about *fixes*, not merges]
3. **Nothing in the script library checks the highlight rules.** Neither the audit, the linter,
   `Get-DeckPairCensus.ps1` nor `Get-SRIntegrity.ps1` can see a card carrying two `==…==` pairs or a
   highlight inside a `||` body. I wrote a throwaway check in `%TEMP%` and deleted it. It found four
   real violations. **If this is needed a second time, promote it into a script** — that is rule 6 in
   `steering/scripts.md`, and it would be the first checker for card *formatting* rather than card
   *counts*. [a new script in `Meta/Obsidian Plugins/Scripts/`, listed in `steering/scripts.md`]
4. **My estimates of note length were 20–35 % low four times in a row.** 175→236, 255→312, 275→334,
   285→347. A ×1.2 correction written into the plan after the first miss did not stop the next three.
   **Stop estimating totals. The stable unit is lines per exam question:** ~52 when the questions are
   single-part, ~68 when they have three or four parts. Multiply by the question count.
   [`hi1031-koncentrering-2026-09-15.md` already records this]
5. **A locked `### Muntligt svar` is the thing that breaks when you cut facts.** Eleven talking
   points across the four chapters referenced material that had been deleted — nine found while
   cutting, one by a reviewer, one pre-existing. **Whenever a fact paragraph goes, read the talking
   points under the same question before moving on.** [`hi1031-tenta-reentry.md` states the rule;
   what is new is that it fails silently and needs an explicit per-question check]

---

## STATE OF THE REPOSITORIES

**The working tree is dirty and that is expected.** `git status` at 20:45 showed, besides the eight
files above and the new report:

- **`HI1031 Begrepp - Kap 01` (56 changed lines) and `Kap 02` (15)** — these numbers equal those
  decks' marker counts exactly, so they are **his own reviews landing**, not damage. Leave them.
- **Four HE1033 concept notes** (DNS, HTTP, TCP, UDP), changed by something that was not this
  session. Leave them; ask before touching.
- `.obsidian/workspace.json`, normal app state.
- One deliberately untracked file: `.obsidian/plugins/obsidian-spaced-repetition/data (conflict
  2026-09-07-10-27-11).json`, a Drive sync artefact. Deleting it is his call.

**Before any push:** there is a local `pre-push` hook that runs markdownlint and
`Vault-Audit.ps1 -ContentOnly` and blocks the push if either fails. It is untracked, so it exists
only in this clone. **Do not bypass it with `--no-verify`** — fix what it found.

---

**How to use this file:** rewrite `FIRST TASK` and `STATE` before saying "run compact", and leave
the rest unless something new was learned. The table of where every durable fact belongs is in
`.kiro/README.md` and `steering/documentation-standard.md`.
