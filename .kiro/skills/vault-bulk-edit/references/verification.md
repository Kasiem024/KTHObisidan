# Verification after a bulk edit

Run all four. A change is not finished until every one passes.

## 1. Spaced-repetition fingerprint — must be identical

The deck is live review data. **Do not re-derive the patterns; run the script that owns them:**

```powershell
$s = "Meta\Obsidian Plugins\Scripts\Get-SRIntegrity.ps1"
powershell -NoProfile -ExecutionPolicy Bypass -File $s -Save     # immediately BEFORE the sweep
powershell -NoProfile -ExecutionPolicy Bypass -File $s -Compare  # immediately AFTER
```

`-Compare` exits **1** and names every measure that moved, so it can be gated on. It reports
two families and two scopes, because the same marker has several legitimate totals:

- `raw_*` — the literal anywhere in the file, including prose and table rows. A blunt
  fingerprint; meaningful only as a before/after pair.
- `card_*` — one per card **line**, excluding table rows. These are the figures the backlog
  quotes when it says a sweep took `;;` from 440 to 458.
- scopes `studyNotes` (excludes `Meta/`, `.kiro/`, `README.md`, `index.md`) and `wholeVault`.

**Take the `-Save` snapshot immediately before your own edit, not at the start of the session.**
This vault mutates underneath you — Google Drive syncs reviews from mobile, and a second agent
may be authoring cards at the same time. On 2026-09-05 a count moved by 19 markers mid-session
for exactly that reason. **A whole-vault total cannot prove *you* changed nothing**; prove that
with `git diff --numstat`, which names the files you touched. See
`.kiro/steering/environment.md`.

`sr-baseline.json` is gitignored on purpose: it is consumed minutes after it is written.

The absolute values matter far less than the fact that they are unchanged. For reference, on
2026-09-05 `studyNotes` read `raw_srComments` 1358, `card_single` 1446, `card_reversed` 477,
`card_multi` 190, `card_multiRev` 225, `raw_disabled` 0 — but **treat a mismatch as a prompt to
re-measure, not as proof of damage**, and quote a figure only together with its family and
scope name.

Scope matters more than it looks. A naive whole-vault count includes the docs that *describe*
`<!--SR:-->` and `DISABLEDFLASHCARD`; that produced a false "1273 vs 1270" mismatch and a
minute of unnecessary panic, and this table used to mix a `Meta/`-inclusive `disabled` count
with study-note-scoped rows above it. `raw_disabled` is **0** in study notes and 14 in `Meta/`
today, which is the same bug in miniature.

If you tighten the `card_*` patterns, re-derive the numbers a second way and compare. The
previous versions required whitespace after the separator, so they reported `;;` as 269 both
before and after 292 new reversed cards appeared — a measurement that could not see a third of
the deck.

## 2. Audit — must be clean

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"
```

Expected `RESULT: clean - no deviations from the standard.` with `notesInScope=516`, exit
code **0**. Add `-Detail` to list offenders. It exits **1** when not clean, so it can be
gated on.

`-ContentOnly` is for CI only: it skips `courseMissingFolder` and `brokenWikilinks`, which
depend on state git does not store. Locally, run with no switches.

## 3. Markdown lint — must be 0

```powershell
npx markdownlint-cli2 "**/*.md"
```

Expected `Linting: 539 file(s)` / `Summary: 0 error(s)`. Ignores live in
`.markdownlint-cli2.jsonc`; **`.markdownlintignore` is inert** in cli2 and silently linted
36 extra files when it was tried.

Never run `--fix` over the Templater templates — MD034's fix split a `<% %>` expression out
of a URL and broke the course template. They are excluded for that reason.

## 4. Build the live vault and compare

The site's `content/` is a pinned submodule, so a plain build shows the last *pushed* commit,
not your working tree:

```
npx quartz build -d "G:\My Drive\KTHObsidian" -o C:\Temp\out
node tools/check-site.mjs C:\Temp\out
```

Expected: exit 0, and every metric matching `site-baseline.json` — 648 pages, 397 with
callouts, 2233 callouts, 183 images, 0 alt-less, 0 KaTeX errors, 0 card leaks, 44 broken
links (almost all PDF links; PDFs are deliberately unpublished).

Build into an **empty** directory. `check-site.mjs` refuses `--update` when the pages were
written over more than 300 seconds, because that means the directory holds two builds' output
and every count is inflated. `pages` counts DISTINCT CASE-INSENSITIVE routes, not raw `.html`
files: Quartz emits a redirect stub at each note's original-cased path, so Linux holds 1269
files where Windows holds 693. Every metric now matches CI exactly. See F59.

Counts may grow; a drop over 5% fails. That asymmetry is what catches a transformer silently
stopping work.

## Two traps when writing your own checks

**`-match` is case-insensitive.** Searching `NaN` matched "nan" inside fi**nan**siering and
reported 243 corrupted pages when the true count was zero. Use `-cmatch` or
`[regex]::Matches`. Be suspicious of any surprisingly large number.

**State the scope of what you checked.** A "0 pages show raw card syntax" result was wrong
for weeks because it only inspected pages containing `id="flashcards"`, missing 34 notes that
keep cards elsewhere. When grepping built HTML, strip `<script>`, `<pre>` and `<code>` first —
inline JS contains `||` and the Meta docs quote card syntax.
