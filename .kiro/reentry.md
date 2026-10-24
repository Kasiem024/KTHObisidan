# Re-entry prompt

**This is the only file you need to be pointed at.** It is rewritten immediately before `/compact`.
Read it fully before doing anything.

It is deliberately short. Everything under `.kiro/steering/` is `inclusion: auto` and is already in
your context — the hard rules, the environment traps, the script library, the output style. **Do not
re-read them looking for basics.** This file carries only what is task-specific plus the handful of
things that have actually bitten.

Last updated **2026-10-24, 12:00**. Live courses: HI1031 and HI1032.

---

## FIRST TASK AFTER RE-ENTRY: nothing is assigned — ask him

**The tag conversion is done (F105, run 2026-10-24 13:49).** 536 notes converted; SR compare clean,
audit clean, lint 550/0, deck hygiene clean. Backup in
`%USERPROFILE%\KTHObsidian-backups\tags-to-list-2026-10-24-135010\`.

- **CM1000 and SF1686 were excluded**, because a second agent is converting the CM1000 PDFs. CM1000's
  `_index.md` is therefore still inline. The audit does not see it (`_index.md` is outside the audit's
  scope), so a plain `Convert-TagsToList.ps1 -Apply` can convert it whenever that agent is finished.
- **Never "repair" tags with `Format-FrontmatterTags.ps1`.** It is superseded and converts the wrong way.
- **Never pass an array to `powershell -File`.** It arrives as N arguments and the surplus binds
  positionally — that is how 536 backups went into an employer-synced OneDrive folder on 2026-10-24
  (`lessons-learned.md`).

**On subagents:** on 2026-10-24 three single-stage pipelines in a row completed without error. One stage
per pipeline remains the rule, because a failed stage loses everything in its batch
(`lessons-learned.md`, 2026-10-22).

### Finished since the last compact (F101-F105, nothing committed)

- **F101** — LaTeX for genuine math in HI1031/HI1032, plus a new audit check, `rawMathNotLatex`.
- **F102** — three HI1032 Extra decks with 147 cards. **Do not prune them** under the few-cards rule: he
  set the rule aside for them without changing it.
- **F103** — the `HI1032 Tentasvar - Svaga ämnen.md` reading file. It holds the topics whose cards are
  still unmarked, ranked worst first, and a fixed Räkna själv list. The build script lives in `%TEMP%`
  and is not durable; the method is in F103.
- **F104** — the HI1031 `Tentafrågor - Nyckelord` keyword deck for the oral exam: 52 cards, one per
  question. The seven medium depth gaps from the manuscript audit have trigger keywords in it.
- **F105** — the tag convention flipped to YAML list form. The new `Convert-TagsToList.ps1` waits for him
  to run it; see FIRST TASK.

**Unapplied findings from two audits** are in `.kiro/reports/parked-findings-2026-10-22.md`: HI1032
lecture coverage gaps and the HI1031 manuscript's low depth gaps. **They are his to decide. Do not start
them.**

### Parked, his to decide — do not start these

1. **`HI1032 Labb 1 - Flashcards.md` carries card-form findings** from before the current conventions.
   Run `Test-DeckHygiene.ps1 -All` and read its lines. `-All` is a **survey, not a gate**.
2. **A handoff prompt for an outside agent exists only in an older transcript.** `.kiro/sessions.md`
   has the row. If he wants it again it has to be rebuilt.
3. **The tag conversion (F105) is his to run**, with the commands in the plan. Do not run it for him and
   do not touch the old `Format-FrontmatterTags.ps1`.

---

## THE THING THAT WILL MAKE YOU BUILD THE WRONG ARTEFACT

**F87 designed a flashcard form and F92 reversed it.** Read the backlog forwards and you will rebuild
something he discarded.

F87's cards put the exam question in the prompt and named *parts of the answer* in the rows without
stating them. F92 rewrote all of them to **carry the answer outright**, on his instruction — concise,
but a real answer, length accepted. `current-state.md` has the quote.

**This matters for the manuscript too.** A manuscript row that says *"nämn fördelarna"* is the agenda
form again. Every row must state the thing to say, not name it.

**Why it failed is the useful part:** a pointer card only works if the fact it points at sits in a deck
he actually drills, and several of HI1031's concept decks carry `nosr`. **Three adversarial rounds
approved the design**, every reviewer briefed with the rules, and none of them asked that question.
That is what the premise reviewer exists for.

---

## THE AUTHORING RULES THAT ARE NEWEST AND EASIEST TO BREAK

All are in `product.md` in full. Repeated here because each was discovered by getting it wrong.

- **No card whose answer is an address, a mask or an ID.** Protocol constants are vocabulary and stay —
  a well-known port, HSRP's multicast address. Lab addresses, subnet masks and router IDs do not.
- **Do not memorise what the exam prints in front of him.** HI1032's exam hands out the TCP header, the
  six ACK rules and a state machine in the question text, so cards train *applying* them.
- **The 40–60 cards per deck target is superseded.** "As few as possible, as concentrated on the exam
  questions as possible." 40 is **not a floor**. The Snabbsvar manuscript is the exception he chose:
  splitting a question into several cards is preferred there.
- **Never quote an in-sample coverage figure** for material built from past exams (F97,
  `lessons-learned.md`). It is 100 % by construction. Measure held-out.

### Things that must not be re-litigated

- **`nosr` is his rotation.** Every tag tool, `Convert-TagsToList.ps1` included, preserves what is there
  and **does not restore a missing `nosr`**.
- **The two-copy contract between Snabbsvar and the ten chapter notes ended on 2026-10-17.** Older docs
  say "edit one and you must edit the other" — that is no longer true. Only Snabbsvar changes now, and
  it must never contradict the chapter-note cards.
- **HI1031 chapter 9's hypermedia gap is closed** (F86).
- **Multi-fact cards are his hardest form**, measured in his own review data. He has accepted that cost
  deliberately for the answer-bearing cards; do not reopen it.
- **HI1032's twelve chapter decks are deleted** (F89), not missing.

---

## WHAT TO RUN, AND THE THREE THAT ARE EASY TO GET WRONG

`steering/scripts.md` is the full list and is already loaded.

- **`Test-DeckHygiene.ps1` is the only check that sees a card's *shape*.** Default scope is the
  `* Begrepp - Kap *` decks, so **Snabbsvar needs `-All`** — then read only its lines. `-Course HI1031`
  does not reach it. Run `-SelfTest` before trusting a zero.
- **`Get-SRIntegrity.ps1 -Save` writes one global file.** Pass **`-BaselinePath`** with your own path
  (T22). Snabbsvar is `nosr`, so its card count moves under *cards excluded by nosr*, not *activeCards*.
- **Two scripts report on the information stream** — `Test-DeckHygiene.ps1` and `Test-DocHygiene.ps1` —
  so `| Out-String` captures nothing from them. Wrap them in `Start-Job` and read `Receive-Job`.

**And one step per shell call, with a timeout.** Chaining scripts hung a session on 2026-10-13. Use
`Start-Job` + `Wait-Job -Timeout`, write output to `%TEMP%`, and read the file.

---

## STATE OF THE REPOSITORY

**Not committed since 2026-10-05.** `HEAD` and `origin/main` are both at the F96 commit. Everything
since — F97-F105's HI1032 and HI1031 work, the new decks and files, the tag-convention change, and these
docs — sits uncommitted in the working tree. Several new files are untracked: the HI1032 theory notes,
Föreläsningskarta, Svaga ämnen and the three Extra decks, HI1031's Nyckelord, `Convert-TagsToList.ps1`,
and the new `.kiro/reports/` plans. **A commit must include the flipped audit and the converted notes
together**, so it only makes sense after he has run the conversion.

**He has not asked for a commit.** Do not commit unless he does. If he asks, check with
`git rev-parse HEAD` against `git ls-remote origin refs/heads/main` first.

**Stage by name, never a directory.** `git add -u` on `.kiro` or `Meta` swept a concurrent session's
work into a flashcard commit on 2026-10-02 (F91). Read `git status` immediately before staging.

Expect the working tree dirty from him as well: **he reviews daily**, which rewrites marker lines only.
Obsidian's tag UI writes frontmatter tags in list form, which is the standard since F105. **Take a whole diff in one
call**; `git diff --numstat` with a Swedish pathspec matches nothing and exits 0 (T2).

One file stays untracked deliberately:
`.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`.

**Before any push:** a local `pre-push` hook runs markdownlint and `Vault-Audit.ps1 -ContentOnly` and
blocks the push if either fails. **Do not bypass it with `--no-verify`.**

---

## WHEN YOU REVIEW, OR ARE ASKED TO BUILD SOMETHING

`documentation-standard.md` requires two lenses: one reviewer handed the authoritative rules, and one
handed his situation and goal and **not** the rules, asking only whether the thing is worth building.

**`conformance-reviewer` has been cancelled by the idle deadline three times out of three** (F97), each
after an hour with no visible progress. The same brief to `kiro_default` told to use read and grep
only completed every time. **Use `kiro_default` for both lenses** until that is diagnosed, and run the
gates yourself. `premise-reviewer` has completed every time and may still be used for the premise lens.

Two failure modes are recorded in `lessons-learned.md` and are worth knowing before you trust any
review:

- **Conformance reported as review** — a reviewer with the rules checks conformance and never asks
  whether the thing is worth building.
- **Scope checked, source not** — every reviewer compares the work to the brief, so a brief that
  excluded part of the source is invisible to all of them. One pass must enumerate the **source** — here,
  the official exam question list — and diff it against what was produced.

And **do not ask a subagent to count anything.** If you catch yourself counting, the gate is missing a
check.

**The pattern that worked for bulk authoring (F98, F99, F100):** write one shared brief file in `%TEMP%`
for drafters and one for reviewers, then run one `kiro_default` drafter per independent unit (chapter,
lecture, file) **in parallel**, each paired with its own `kiro_default` reviewer (read and grep only)
that loops back with `loop_to` on a trigger such as `VERDICT: ÄNDRINGAR KRÄVS`. Drafters write only to
`%TEMP%`; you assemble and write to the vault by guarded script. Seven lecture pairs finished in about
40 minutes. Reviewers should be told to be adversarial against the **original source**, not the brief.
Then run the gates yourself and read the result.

**Three things that bit in this work, all now in `lessons-learned.md`:** an "absent from the source"
claim made without grepping (2026-10-17); a calibration figure computed by hand and scored in-sample
(2026-10-19); `staleFRange` firing on HI1032's lecture ranges written in F-range form (2026-10-19 — write lecture ranges
as "föreläsning 1 till 3", and never put a wikilink in a `description`).

---

## THE EXAM DATE IS UNKNOWN

The old archive says 21–23 September 2026. That is past and wrong. He confirmed on 2026-09-26 that the
exam was moved and **gave no new date**. Do not quote one, and do not plan against one.

---

**How to use this file:** rewrite `FIRST TASK` and `STATE OF THE REPOSITORY` before saying "run
compact", and leave the rest unless something new was learned. Finished work goes in the backlog, not
here. The table of where every durable fact belongs is in `.kiro/README.md`.
