# Re-entry prompt

**This is the only file you need to be pointed at.** It is rewritten immediately before `/compact`.
Read it fully before doing anything.

It is deliberately short. Everything under `.kiro/steering/` is `inclusion: auto` and is already in
your context — the hard rules, the environment traps, the script library, the output style. **Do not
re-read them looking for basics, and do not restate them here.** This file carries only what is
task-specific plus the handful of things that have actually bitten.

Last updated **2026-10-02, 14:15**. Course-neutral by design; the live courses are HI1031 and HI1032.

---

## FIRST TASK AFTER RE-ENTRY: commit this session's work, then ask him

**Ten modified files and two untracked files are written, verified and NOT COMMITTED.**
`steering/current-state.md` lists them by name and carries the verification figures. Read it first —
nothing is half-finished, the only open action is the commit.

Three things make the commit safe but need care:

- **`HEAD` is `236bf1f`, the concurrent flashcard session's F89 commit.** F85 through F89 are already
  committed, so a commit cannot sweep up another session's backlog entries. This was verified, not
  assumed.
- **Stage by name, never `git add -A`.** A second session works on flashcards and may write at any
  moment. Re-read `git status` immediately before staging.
- **Do not commit** `.obsidian/plugins/obsidian-spaced-repetition/data (conflict …).json`. It is a
  Drive sync artefact; removing it is his call.

**No commit id for the new commit is quoted here on purpose.** This file is rewritten *before* the
commit that contains it, so any id it named would be stale. Run `git log -1` and
`git ls-remote origin refs/heads/main` and compare them yourself.

After the commit, **nothing is assigned.** The work of 2026-09-26 to 10-02 is finished and recorded as
**F80 to F90**. Four things wait on his decision, not on work — put them to him and let him choose:

1. **Chapter 9's HI1031 deck has no card for the hypermedia part of exam question 2, and the cards
   that answered it should come back.** The 2012 book never uses the word, which is why four reviewers
   found no coverage — but **`restfulapi.net` is required course literature**, named on line 58 of
   KursPM (*What is REST*, *REST Constraints*, *Naming REST resources*), with a saved copy in the vault
   at `REST - restfulapi.net.md`. An earlier report of mine framed this as "accepting a non-book
   source" and was wrong. Still never fill the gap from memory — use the saved article.
2. **HI1032's twelve chapter decks and its Labb 1 deck carry card-form findings** from before these
   conventions. HI1031's ten and HI1032's Labb 5 are clean.
3. **Two untracked files are the author's and are awaiting commit** —
   `.kiro/skills/write-flashcards/SYNTHESIS.md` and `.kiro/skills/query-notebooklm/SYNTHESIS.md`.
   This file, `current-state.md` and backlog F85 all called them "not mine and not attributable";
   that was wrong. They were written by the 2026-10-01 evening session, which was asked to synthesise
   those two skills for use outside this vault, and the author confirmed on 2026-10-02 that they are
   his and should be committed next time. A timestamp shows when a file appeared, never who wrote it.
4. **The identifier-leak rule has no check**, which breaches `documentation-standard.md`'s own law
   that a rule without a check will drift. The rule says material carried in from a work repository
   must be scanned for internal identifiers — hostnames, codenames, customer and tool names, repo
   paths — before it reaches this public repo. `.kiro/hooks/block-secrets.sh` matches credential
   patterns only. Extending it needs an author-maintained list of forbidden strings and a write-time
   scan; it is a change to a **security hook**, so **ask before implementing it.**

---

## SKILLS FOR THE GEMINI WEB APP LIVE OUTSIDE THIS VAULT

Built 2026-10-01 to 10-02 at `Jag/Gemini/Skills/` on the author's Drive, from this vault's material
plus two of his other repositories. **They are outside git and outside Drive's version history**, so
treat that path as machine-specific: it may simply be absent on another machine, and a stale path is a
finding against the doc that names it.

**List the folder rather than trusting a count anywhere.** Eight were built; the author deleted
`cite-network-protocol-rfcs` and `write-toon-format` on 2026-10-02, saying he did not need them. The
set is his to change.

Two of them are method rather than subject matter and are the ones worth knowing about:
`author-gemini-skills` carries the platform constraints and a catalogue of defects that look
like success, and `review-adversarially` carries the review method. **Do not copy their content into
this repo** — `.kiro/README.md` records where they are, deliberately not what they say.

---

## THE TWO AUTHORING RULES THAT ARE NEWEST AND EASIEST TO BREAK

Both are in `product.md` in full. They are repeated here because each was discovered by getting it
wrong first.

- **No card whose answer is an address, a mask or an ID.** Stated 2026-10-01: *"jag är inte
  intresserad av att memorisera specifika adresser"*. Protocol constants are vocabulary and stay — a
  well-known port, HSRP's multicast address. Lab addresses, subnet masks, wildcard masks and router IDs
  do not. Write the **shape and the consequence** instead: what an interface faces rather than its
  number, why two gateways share a segment, what breaks if a client points at the wrong one. Applying
  this to a deck written earlier means **removals and rewordings**, not just new cards — it took five
  and five out of Labb 5.
- **The 40–60 cards per deck target is superseded.** "As few as possible, as concentrated on the exam
  questions as possible." 40 is **not a floor**. HI1031 chapter 17 is the one deliberate exception.

And the one that governs the exam-answer notes:

- **The 150–250 line target cannot be met by a chapter with five or six exam questions.** Measured
  2026-10-01. Quote **lines per exam ask** (29 to 47 across HI1031's five notes) and treat a note over
  250 as a finding only when some paragraph cannot be tied to a named exam question. `### Muntligt
  svar` is a measured 24 % of every note and its structure is the author's own decision — do not
  shorten it to reach a number.

### Four things that must not be re-litigated

- **`nosr` is his rotation.** He has said so twice. `Format-FrontmatterTags.ps1` preserves what is
  there and **does not restore a missing `nosr`**.
- **HI1031 chapter 5 question 4 and chapter 9 question 3 teach the same comparison, and that is
  correct.** The exam asks it twice.
- **Shorter cards did not make them shallower.** 0 of 20 of the most-shortened cards had lost their
  mechanism (F81). The gap that mattered was **tradeoffs and downsides**.
- **Multi-fact cards are the hard form**, measured in his own review data, five decks of five (F80).

---

## WHAT TO RUN, AND THE TWO THAT ARE EASY TO GET WRONG

`steering/scripts.md` is the full list and is already loaded.

- **`Test-DeckHygiene.ps1` is the only check that sees a card's *shape*.** Its default scope is the
  `* Begrepp - Kap *` decks, so a lab deck like `HI1032 Labb 5` needs **`-All`** — which is a survey,
  not a gate, and prints thousands of legacy findings. Filter its output to the file you care about.
  Run `-SelfTest` before trusting a zero. A scope resolving to nothing exits **2**, not 0.
- **`Get-SRIntegrity.ps1 -Save` writes one global file.** Pass **`-BaselinePath`** with your own path,
  and read the `baseline taken at` line to check the snapshot is yours (T22).

**When you reword a card and keep its marker, `-Compare` reports the marker as *moved*.** That is the
placement check doing its job, not a defect — but you must then show that each old front line maps
**one-to-one** to its new one, or you cannot tell a deliberate rewording from a transplanted schedule.
The claim that has to hold for deletions is *markers removed equals cards deleted that had markers*,
per file.

**Two scripts report on the information stream** — `Test-DeckHygiene.ps1` and `Test-DocHygiene.ps1` —
so `| Out-String` captures nothing from them; redirect stream 6 and decode the file as UTF-16LE. The
other twelve use `Write-Output`, where `6>` captures nothing instead (T23).

---

## STATE OF THE REPOSITORY

**Clean and pushed at the time of writing.** Verify by comparing `git rev-parse HEAD` with
`git ls-remote origin refs/heads/main`, not by reading push output — git on Drive prints a benign
`failed to perform geometric repack` either way.

**Never trust a commit id written in a doc**, including this one.

Expect the working tree to be dirty: **he reviews daily, on his phone and in Obsidian, and both write
to the vault.** A review changes only a card's scheduling-marker line and no card text. **Editing a
note's tags in Obsidian's own UI rewrites the frontmatter into YAML list form**, which the audit
reports as `listStyleTags`; `Format-FrontmatterTags.ps1` is the repair.

**To prove a file holds only review data, never pass its path to git.** `git diff --numstat -- '<path
with å ä ö>'` is a pathspec, matches nothing and exits 0, and the empty result reads as "nothing
changed". It produced a false clean reading on 2026-10-01. Take the whole diff in one call and split it
per file in PowerShell (T2).

One file stays untracked deliberately:
`.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`.

**Before any push:** a local `pre-push` hook runs markdownlint and `Vault-Audit.ps1 -ContentOnly` and
blocks the push if either fails. It is untracked, so it exists only in this clone. **Do not bypass it
with `--no-verify`.**

---

## THE EXAM DATE IS UNKNOWN

The old archive says 21–23 September 2026. That is past and wrong. He confirmed on 2026-09-26 that the
exam was moved and **gave no new date**. Do not quote one, and do not plan against one.

---

**How to use this file:** rewrite `FIRST TASK` and `STATE OF THE REPOSITORY` before saying "run
compact", and leave the rest unless something new was learned. The table of where every durable fact
belongs is in `.kiro/README.md` and `steering/documentation-standard.md`. Finished work goes in the
backlog, not here.
