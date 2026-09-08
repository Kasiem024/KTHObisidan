---
inclusion: auto
description: The reusable scripts in Meta/Obsidian Plugins/Scripts/ - what each one measures and when to run it. Read BEFORE writing a new script against this vault, and before quoting any number about it.
---

# Script library — KTH Obsidian Study Vault

**Check this list before writing a script.** Every entry below was written because the same
question came up twice. Re-deriving a measurement by hand is how two honest measurements end
up disagreeing: the site's page count was argued over for a day because `1270` and `693`
were both correct counts of different things (F58). A script is a measurement whose
**definition is recorded**, which is the part that keeps getting lost.

All of them live in `Meta/Obsidian Plugins/Scripts/`, find the vault root themselves, and take
`-Root <path>` to run against a different vault. Two of the four `Test-*` scripts are **harnesses**:
`Test-VaultAudit.ps1` and `Test-SRIntegrity.ps1` build their own throwaway vault under `%TEMP%`, never
open this one, and therefore ignore `-Root`. The other two, `Test-DocHygiene.ps1` and
`Test-ScriptHygiene.ps1`, read the real repository like the `Get-*` scripts do.

| Script | Answers | Exit code |
|---|---|---|
| `Vault-Audit.ps1` | Does the vault follow `Meta/Vault Standard.md`? | 0 clean / 1 deviations |
| `Test-VaultAudit.ps1` | Does the audit still fire on every rule it claims? | 0 all pass / 1 |
| `Get-ObsidianExcludes.ps1` | What does Obsidian's "Excluded files" actually match? | 0 clean / 1 |
| `Get-TagInventory.ps1` | What tags does Obsidian think exist, and who put them there? | always 0 |
| `Get-SRIntegrity.ps1` | Did a bulk edit change any flashcard marker, move one to another card, or empty a deck? | 0 unchanged / 1 drift |
| `Test-SRIntegrity.ps1` | Does `Get-SRIntegrity.ps1` still fire on every defect it claims? | 0 all pass / 1 |
| `Get-NoteStructureCensus.ps1` | How many concept notes actually have each section? | always 0 |
| `Test-DocHygiene.ps1` | Is the Markdown that nothing else checks still intact? | 0 clean / 1 findings |
| `Test-ScriptHygiene.ps1` | Does this folder still follow the rules below? | 0 clean / 1 findings |

`kursinfo.js`, `nastaNummer.js` and `nyKurs.js` in the same folder are **Templater user
scripts**, called from the note templates. They are not run from a shell.

`sr-baseline.json` is `Get-SRIntegrity.ps1`'s snapshot. It is gitignored on purpose: it is
taken immediately before a sweep and consumed immediately after, so a committed copy would be
stale the moment it landed.

## Which one to reach for

- **Finished any change to the vault** → `Vault-Audit.ps1`. A change is not done until it
  prints `RESULT: clean`. Add `-Detail` for the offending files, `-ContentOnly` for CI.
- **Changed `Vault-Audit.ps1`** → `Test-VaultAudit.ps1`, in the same change. It builds a
  throwaway vault under `%TEMP%`, proves the audit calls it clean, then plants one
  deliberate violation per check and requires every check to fire. ~9 seconds.
- **About to run a sweep over many notes**, or any `markdownlint --fix`, or about to rewrite a
  deck → `Get-SRIntegrity.ps1 -Save` **before**, `-Compare` **after**. Non-zero exit means one
  of four things, and only the first was checked before F70:
  1. a card separator or an `<!--SR:-->` comment changed **count**;
  2. a **named file** gained or lost cards or markers — a vault total cannot tell your edit
     from a phone review arriving mid-session, so read the per-file lines, not the totals;
  3. **deck scope** moved: a note gained or lost `nosr`, which removes its whole card set from
     review while every count above stays identical (F64);
  4. a marker **moved to a different card** — the same schedule text now under a different
     question, which is the one edit `write-flashcards` rule 11 forbids. An ordinary review
     never trips this, because a review rewrites the marker.
  See `conventions.md` §1 for why the four separators are not interchangeable.
- **Changed `Get-SRIntegrity.ps1`** → `Test-SRIntegrity.ps1`, in the same change. Ten
  assertions, ~9 seconds, one planted defect each; it also asserts that a plain review does
  **not** fire the placement check, because a guard with false positives gets switched off.
- **Added or edited anything under `.kiro/`** → `Test-DocHygiene.ps1`. Nothing else looks there:
  `.kiro/**` is in the linter's ignore list and outside the audit's scope, so
  `npx markdownlint-cli2 ".kiro/**/*.md"` prints `Linting: 0 files` and then `Summary: 0 issues in
  0 files`, which reads as a pass. This script checks BOM, trailing whitespace, blank-line runs, the
  **corruption signature of a botched bulk replacement** (adjacent en/em dashes, mojibake), and any
  doc that names a `Scripts/*.ps1` file which does not exist. It separates *authored* docs from the
  verbatim research artifacts under `.kiro/research/`, which are kept byte-exact and are only checked
  for corruption. It exists because on 2026-09-07 a bulk replacement corrupted nine passages across
  four skill files and both the audit and the linter reported clean.
- **Added or edited anything in the Scripts folder** → `Test-ScriptHygiene.ps1`. It checks the
  six "Rules for adding one" below that can be checked mechanically: pure ASCII, LF and no BOM,
  a header that declares what the numbers mean, `-Root` on anything that scans the vault, an
  exit convention matching this file's table, and that the folder and this file still name the
  same set of scripts. It lists each file's write calls rather than claiming to verify rule 3 —
  static analysis cannot prove a write sits behind a switch.
- **Junk in the tag pane**, or after editing `userIgnoreFilters` →
  `Get-ObsidianExcludes.ps1`. It reports what each filter matches and flags any filter
  matching **nothing**, which is the failure mode that hid a dead `Obsidian Plugins/` entry
  for months.
- **Before widening or narrowing a scope exclusion** → `Get-TagInventory.ps1`. It separates
  tags that exist only in out-of-scope files from tags real notes use, and lists any tag
  appearing in both. A non-empty "in both" list means the exclusion you are about to add
  would hide a real tag.
- **About to quote a figure about note structure** → `Get-NoteStructureCensus.ps1`. It owns
  the numbers `Meta/Vault Standard.md`, `llms.txt` and `steering/product.md` all repeat —
  concept notes, `## Definition`, `## Flashcards`, `## Kopplat till`, `## Tenta-fokus`,
  concept collections. Its `notesInScope` must equal the audit's; if it does not, its
  `Test-InScope` has drifted from the audit's `InScope` and every other figure it prints is
  measuring a different population.

## Figures these scripts own

**Quote the script, not the prose.** No figure is reproduced here, deliberately: a value copied into
this file is stale the moment the vault changes, and a stale number gets quoted instead of checked.
Run the script.

| Figure family | Owned by |
|---|---|
| notes in scope | `Vault-Audit.ps1`, `Get-NoteStructureCensus.ps1` — the two must agree |
| concept notes, section coverage, concept collections, cards outside `## Flashcards` | `Get-NoteStructureCensus.ps1` |
| `.md` excluded from the tag index | `Get-ObsidianExcludes.ps1` |
| distinct inline tags, junk vs real | `Get-TagInventory.ps1` |
| `<!--SR:` markers, cards per deck, notes tagged `nosr` | `Get-SRIntegrity.ps1` |

**The spaced-repetition rows are a dated reading, not an invariant.** Every review adds markers and
every authoring session adds cards, so a mismatch there is not a defect — re-run the script. The
structural rows only move when the vault's structure does. Historical movements and what caused each
are in `Meta/Vault Findings & Backlog.md`; F71 is the example of a `nosr` change that looked like
review drift and was not.

`Get-SRIntegrity.ps1` reports **two families** of measure, and mixing them is how a wrong figure
spreads. `raw_*` counts a literal anywhere in the file, including prose and table rows — a blunt
fingerprint, meaningful only as a before/after pair. `card_*` counts one per card *line* using the
patterns tuned for this vault's syntax, and those are the figures the backlog quotes. Both are
reported in both scopes, and quoting one without naming its scope is the failure this split exists
to prevent.

## Rules for adding one

1. **Pure ASCII source.** PowerShell 5.1 reads `.ps1` as ANSI, so a literal `å ä ö` in the
   script silently fails to match. Match Swedish with a letter class or `.`, or read the
   strings from a UTF-8 data file.
2. **Declare what it counts, in a header comment.** Not what it does — what its numbers
   mean, and which files are in and out. `Get-SRIntegrity.ps1` reports two scopes side by
   side precisely because quoting one of them without its name is how a wrong figure
   spreads.
3. **Read-only by default.** Anything that writes takes an explicit switch, defaults to a
   dry run that prints what it would change, backs up each file first, and preserves the
   BOM and line endings. See `conventions.md` §3.
4. **Exit 0 for clean, 1 for a finding**, so it can be wired into CI. Pure reporting
   scripts always exit 0 and say so in the table above.
5. **Add it to the table above in the same change.** A script nobody knows about gets
   rewritten from scratch, which is the problem this file exists to solve.
6. **Only promote a script once it has been useful twice.** One-off exploration belongs in
   `%TEMP%`. A stale script is worse than no script, because it gets trusted.

Rules 1, 2, 4 and 5 are now **checked**: run `Test-ScriptHygiene.ps1` after touching anything in
that folder. They were unenforced until 2026-09-06, and rule 1 had already been broken — line 1
of `Vault-Audit.ps1` carried an em dash for as long as the file existed (F70). Rule 3 is
deliberately *reported* rather than checked, because static analysis cannot prove a write sits
behind a switch, and a check that claims more than it verified is worse than none.

If a script grows a rule of its own, that rule belongs in `Meta/Vault Standard.md` and needs
a check in `Vault-Audit.ps1` — see `.kiro/skills/add-a-convention/SKILL.md`.
