---
inclusion: auto
description: Windows, PowerShell, Google Drive and encoding pitfalls specific to this vault. Read before running any script or shell command against it.
---

# Environment — KTH Obsidian Study Vault

The vault lives on **Google Drive** at `G:\My Drive\KTHObsidian`, on **Windows**, edited
through **PowerShell 5.1**. Each of the following has already caused a wrong result or a
silent no-op here.

**What fails *silently* lives in `traps.md`, not here** — this file is the environment, that one is
the catalogue of wrong answers. Where the two touch, `traps.md` owns the fact and this file points at
it. Do not restate a trap here; the last time three facts lived in both, they drifted.

## Long inline commands get mangled — or refused outright

A multi-line command passed inline to the shell can arrive corrupted and then match nothing
— failing silently rather than erroring. Write a `.ps1` and run it:

```
powershell -NoProfile -ExecutionPolicy Bypass -File "<script>"
```

The louder variant: the shell refuses to launch it at all, with

```
Failed to spawn command '<the whole script>': Access is denied. (os error 5)
```

Nothing about the message names length as the cause, and the same text runs fine from a file.
Treat any `os error 5` on a long command as "write it to `%TEMP%` and use `-File`".

## Three PowerShell 5.1 details that cost a run each

All three throw, so they are not traps — but none of the error messages names its cause.

- **Variable names are case-insensitive.** `$R` and `$r` are the same variable. Assigning
  `$r = @()` as a result list silently wiped a `$R` holding a folder path, and every read after
  it returned null. Use names that differ by more than case.
- **A built-in alias beats a function you define.** `function Rd { ... }` then `Rd "x.md"` runs
  **`Remove-Item`**, because `rd` is an alias for it. The only clue is `[Remove-Item]` buried in
  the error. Name helpers `Verb-Noun`, which is PowerShell's own convention.
- **`if` is not an expression.** `("a" + (if ($x) {"y"} else {"z"}))` will not parse. Assign in a
  statement first.

## Capture output to a file, not to stdout

Shell stdout capture truncates on Swedish characters. Write results to a file under `%TEMP%`
and read that file instead.

**And do not filter the output down to the line you expect.** Every `markdownlint-cli2` run against
`.kiro/` was once piped through `Select-String "Summary"`, which printed `Summary: 0 issues in 0 files`
and hid the line above it: `Linting: 0 files`. See *What is not checked* below, and `traps.md` T11.

## Writing scripts here: three things `traps.md` owns

Read those entries before writing a script; they are not repeated here because a fact in two
always-on files drifts.

- **`.ps1` files must be pure ASCII** — PowerShell 5.1 reads them as ANSI and Swedish literals match
  nothing. `traps.md` **T1** has the mechanism and the three ways to work with Swedish text anyway.
- **`-match` is case-insensitive**, so an acronym search hits ordinary words. `traps.md` **T3**.
- **A BOM is one character after decoding, not three bytes.** `traps.md` **T9**.

## Always read and write UTF-8, preserving the BOM

```powershell
$raw = [System.IO.File]::ReadAllText($path)
$hadBom = ($raw.Length -gt 0 -and [int][char]$raw[0] -eq 0xFEFF)
[System.IO.File]::WriteAllText($path, $new, (New-Object System.Text.UTF8Encoding($hadBom)))
```

## git on Google Drive prints a benign error

`git push` from the vault emits:

```
error: failed to perform geometric repack
packed-refs: Function not implemented
```

**The push still succeeds.** It is a Drive filesystem quirk. Confirm with
`git ls-remote origin refs/heads/main` rather than trusting the message.

## The vault changes under you, mid-session

Two different things mutate this vault while you are working in it, and neither is your edit:

1. **Google Drive syncs from another device.** A review done in Obsidian on the phone lands
   as new `<!--SR:-->` comments minutes later.
2. **A second agent may be working at the same time**, typically authoring flashcards into a
   course's `Anteckningar/` notes.

On 2026-09-05 an `<!--SR:-->` count went 1372 → 1391 between two measurements in the same
session. The 19 new markers were a review arriving at 16:32, not the change under test.

Tell them apart from the diff, not from the timestamp:

- A **review** adds *only* `<!--SR:!fsrs,...-->` lines — card text is untouched. The FSRS
  timestamps inside are UTC, so 14:31Z is 16:31 local.
- An **authoring agent** adds question/answer text and separators.
- A **mobile** sync also shows `.obsidian/workspace-mobile.json` as modified.

Consequences for how you verify:

- **Do not prove "nothing changed" with a whole-vault total.** Prove it with
  `git diff --numstat`, which names the files *you* touched. A total cannot distinguish your
  edit from someone else's.
- Take `Get-SRIntegrity.ps1 -Save` immediately before your own edit, not at the start of the
  session, and read `-Compare` as a guard against your sweep rather than an absolute figure.
- **Re-run `Vault-Audit.ps1` last, after all your edits**, not in the middle. Content that
  arrived while you were working still has to pass the standard, and if it does not, you want
  to know before you report clean.
- Never edit a note another agent is holding. Check `git status` for study notes you did not
  open before writing anything under `KTH/`.

## Deletions go to Drive's cloud trash

Not the Windows Recycle Bin. Recovery is via drive.google.com. Prefer moving files over
deleting them, and ask before deleting anything.

## Dataview is frozen, and `.obsidian/` is in git

`blacksmithgu/obsidian-dataview`'s last upstream release is **0.5.70, 2025-04-07**; this vault runs
**0.5.68**. Nothing is coming, so a surprise auto-update is not the risk — an Obsidian API change
with no maintainer to answer it is. There is also no auto-update setting to turn off inside the
vault: it is absent from every `.obsidian/*.json` and from `%APPDATA%\obsidian\obsidian.json`, so it
is a UI toggle no script can set.

The dependency is wider than the two `Atlas/` notes it looks like. **31 notes hold 147 `dataview`
blocks**, including all 24 course `_index.md` files at five each and
`Meta/Obsidian Plugins/Templates/Kurs Index Template.md` — so every new course inherits it.

It is survivable because `.obsidian/` is **tracked**: 217 files, plugin `main.js` included. A broken
plugin is one command from the build that worked:

```
git checkout -- .obsidian/plugins/dataview/
```

Verified 2026-09-08: `git cat-file -s HEAD:.obsidian/plugins/dataview/main.js` and the file on disk
are both **1 302 069 bytes**.

And nothing load-bearing depends on it. Every figure the standard quotes is owned by
`Vault-Audit.ps1` and the `Get-*` scripts, in PowerShell, run in CI — Dataview powers navigation
views only, so losing it costs browsing comfort, not correctness. Do not migrate to escape it:
Datacore is `0.1.29`, and core Bases is `"bases": false` in `core-plugins.json` and cannot express
these queries. See F75.

## What is not checked

Two exclusions are deliberate and both are easy to mistake for coverage.

**`.kiro/**` is in the linter's ignore list** (`.markdownlint-cli2.jsonc`, "agent context, tooling"), and
`.kiro/` is outside `Vault-Audit.ps1`'s scope as well. So **nothing checks Markdown or encoding under
`.kiro/`** — not syntax, not BOM, not line endings, not blank-line runs. Running
`npx markdownlint-cli2 ".kiro/**/*.md"` prints `Linting: 0 files` and then `Summary: 0 issues in 0 files`,
which reads as a pass.

This is not hypothetical. On 2026-09-07 a bulk replacement corrupted **nine** passages across four files in
`.kiro/skills/query-notebooklm/`, leaving text like `across tiers — ––50**, so six to fifteen runs`. The
audit reported clean and the linter reported zero issues, because neither looked. It was found the next day
by reading the file.

So for anything under `.kiro/`: **verify by reading the changed passage**, and run
`Meta\Obsidian Plugins\Scripts\Test-DocHygiene.ps1`, which is the only thing that checks encoding and
blank-line runs there. A green audit says nothing about `.kiro/`.

**`Filer/`, `Litteraturlista/` and the Templater templates** are excluded for reasons recorded in the
linter config itself. Read that file before assuming a folder is linted.

## npm needs `cmd /c`

PowerShell's execution policy blocks `npm.ps1`. Run npm and npx through `cmd /c`.
