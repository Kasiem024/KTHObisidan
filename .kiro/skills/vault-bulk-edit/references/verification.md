# Verification after a bulk edit

Run all four. A change is not finished until every one passes.

## 1. Spaced-repetition fingerprint — must be identical

The deck is live review data. Count these before and after; any difference that you cannot
explain is data loss.

**The absolute values matter far less than the fact that they are unchanged.** They are
method-dependent — a slightly different regex gives a different, equally "correct" number —
so always use the exact patterns below, and treat a mismatch against the snapshot as a
prompt to re-measure rather than as proof of damage.

| Measure | Pattern | Snapshot (2026-08-31) |
|---|---|---|
| scheduling markers | `<!--SR:` | **1262** |
| single-line | `(?m)^[^\|\r\n]+?::` | 1378 |
| single-line reversed | `(?m)^[^\|\r\n]+?;;` | 458 |
| multi-line | `(?m)^\s*\|\|\s*$` | 170 |
| multi-line reversed | `(?m)^\s*\?\?\s*$` | 225 |
| disabled | `DISABLEDFLASHCARD` | 0 |

Updated 2026-08-31 (F64-F66): the `==DISABLEDFLASHCARD==` marker was retired vault-wide. F64 added the
`nosr` tag; F65 re-enabled the 23 HI1031/HI1032 duplicates and excluded them via the tag (`;;` 440 ->
458, `||` 165 -> 170); F66 re-enabled the 10 ME1003/CM1005 cards **without** a tag, keeping them in
review (`??` 219 -> 225 for the 6 own-line reversed cards, `::` 1374 -> 1378 for the 4 inline definition
cards). `DISABLEDFLASHCARD` 33 -> 10 -> **0**. `<!--SR:-->` unchanged at **1262** throughout — every
schedule comment preserved (F66's 22 economics markers verified before/after). The `::` base re-measured
1374 (25 below the 2026-08-27 figure of 1399 — a pre-existing method/scope drift), recorded per the
"re-measure, don't assume damage" rule.

The two single-line patterns count **card lines**, one per line, and exclude table rows (a
`|` anywhere before the separator). They were changed on 2026-08-26: the previous versions
required whitespace *after* the separator (`::\s`), and the HI1031/HI1032 notes added in
August write cards as `**RMI** (Remote Method Invocation);;Att ett objekt...` with none. The
old patterns therefore reported `;;` as 269 both before and after 292 new reversed cards
appeared — a measurement that could not see a third of the deck. If you tighten these
patterns again, re-derive the numbers a second way and compare.

**Scope for every row: study notes only** — exclude `\\Meta\\` *and* `\\.kiro\\`. A naive
count reports the docs that *describe* `<!--SR:-->` and `DISABLEDFLASHCARD` alongside the real
ones. That produced a false "1273 vs 1270" mismatch and a minute of unnecessary panic, and this
very table used to say `13` disabled — the count with `Meta/` included — while the row above it
was scoped to study notes. Mixed scopes in one table is the same bug in miniature.

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

Expected `Linting: 538 file(s)` / `Summary: 0 error(s)`. Ignores live in
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
