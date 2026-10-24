# Plan - HI1031 + HI1032: make the math render as LaTeX, matching the vault's own convention

Date: 2026-10-20. Status: REVIEWED (premise GO, conformance NOT OK -> fixes folded in below). Nothing
in the vault changed yet. The exponents in HI1031 are STILL the Unicode form `2³²`/`2¹²⁸` and are
UNCONVERTED - an earlier draft of this plan wrongly said they were already done.

## Multi-letter identifiers: wrap in \text{} (both reviewers)

KaTeX renders a bare multi-letter identifier as an italic PRODUCT of single letters - `RTT` becomes
R·T·T, `cwnd` becomes c·w·n·d - which is a new flavour of the same ugliness. So every multi-letter
name inside math gets `\text{}` (or `\mathrm{}` for a function): `\text{RTT}_\text{M}`, `\text{RTO}`,
`\text{cwnd}`, `\mathrm{round}`. Single-letter Greek stays bare (`\alpha`, `\beta`).

## Flashcards use inline $...$ ONLY, never $$ (conformance MAJOR, T20)

The HI1032 Tentaplugg decks and HI1031 Snabbsvar carry review markers. A `$$` block puts its
delimiters on their own lines, which inside a card line splits the card and orphans its marker (T20).
In a flashcard, all math is inline `$...$`. The `$$...$$` display block is only ever in a theory
note's body prose, never on or adjacent to a card line.

## Why

The author called the recent HI1031/HI1032 math "ugly". Two concrete defects, both rendering bugs in
Obsidian and on the Quartz site:

1. **Bare caret exponents** `2^32` render as literal `2^32` (already fixed in HI1031 to the Unicode
   `2^32` superscript form, but that is inconsistent with the rest of the vault - see below).
2. **Underscore variable names** `RTT_M`, `RTT_S`, `RTT_D` pair their underscores into Markdown
   *italics*, so a formula line renders as a mess of italicised fragments. In HI1032's RTO material.

## The decisive evidence

The author ALREADY uses LaTeX math across the vault, published through the same Quartz site:
`$R_{E}$`, `$O(n^2)$`, `$T(n) \le c \cdot n^2$`, and full `$$...$$` blocks with `\frac`/`\text` in
ME1003, HH1802, CM1005, HI1029, HF1012. Quartz's own docs: "Quartz uses KaTeX by default to typeset
both inline and block math expressions at build time." So LaTeX is enabled AND is the house style.
The right fix is therefore LaTeX, not Unicode.

## Scope - exactly what becomes LaTeX

Convert only GENUINE math. Leave prose variables that are not in a formula (cwnd, rwnd, MSS, ISN,
"32 bitar") as plain text - wrapping those in `$...$` would hurt the copy-by-hand workflow and is not
what the vault does either (it wraps symbols that appear in formulas, like `$R_{E}$`, not every noun).

Inline `$...$` for a variable or short formula in a sentence; a `$$...$$` block (delimiters on their
own lines, per remark-math) only for a standalone display formula.

### HI1032 - RTO/RTT (4 files: theory Del A, Svaga-file, deck Del A, Forelasningskarta)
- Variable names in prose: `RTT_M -> $RTT_M$`, `RTT_S -> $RTT_S$`, `RTT_D -> $RTT_D$`.
- EWMA lines inline: `$RTT_S = (1-\alpha) \cdot RTT_S + \alpha \cdot RTT_M$`, `\alpha = 1/8`;
  `$RTT_D = (1-\beta) \cdot RTT_D + \beta \cdot |RTT_S - RTT_M|$`, `\beta = 1/4`.
- The main formula as a display block: `$$RTO = RTT_S + 4 \cdot RTT_D$$`.
- Worked-example numbers inline where they are formulas: `$RTO = 1{,}5 + 3 = 4{,}5$` s etc. Keep the
  Swedish decimal comma via `{,}` so KaTeX does not add a thin space. DO NOT change the numbers.

### HI1032 - other genuine formulas (theory, maybe deck)
- Slow start / congestion avoidance: `$cwnd = cwnd + 1$`, `$cwnd = cwnd + 1/cwnd$`.
- JPEG: `round(M/Qk)` already prose; render `$c(m,n) = \mathrm{round}(M(m,n) / Q_k(m,n))$`.
- BER: `40*1 + 3 = 43` -> `$40 \cdot 1 + 3 = 43$`.

### HI1031 - exponents (3 files)
- The Unicode `2³²`/`2¹²⁸` superscripts (currently in the files, unconverted) become `$2^{32}$` and
  `$2^{128}$`, so the whole vault uses one convention. Lines: Kap 10 (two), Begrepp Kap 10 (one),
  Kap 11 (two), Snabbsvar (one). Check each: only convert where it is a power, not "32 bitar".

## Hazards (from traps.md / environment.md / Quartz docs)
- **A stray `$` triggers math.** Kap 01 has `` `Smith: $122` `` and `` `Jones: $111` `` - inside
  backticks, so safe, but after my edits grep each changed paragraph for an odd number of unescaped `$`.
- **Block `$$` must be on their own lines** (remark-math), or it will not render on the site.
- **These are review-bearing decks.** Editing a card's answer text must keep the whole card block intact
  (T20); run Get-SRIntegrity -Compare after and require markers unchanged.
- **Never conclude site behaviour from a local build** - but here the site convention is proven by 80+
  existing notes that already ship `$...$`, so the risk is low. Still: do not invent KaTeX macros.
- **.ps1 must be pure ASCII** if a script is used; prefer direct edits via the editor for a handful of
  lines, since the targets are few and exact.

## Verify
Take `Get-SRIntegrity.ps1 -Save -BaselinePath <own temp file>` immediately BEFORE editing any
card-bearing file, then lint (0 issues), Vault-Audit (clean), Test-DeckHygiene -Course HI1031 and -All
for the HI1032 decks, Get-SRIntegrity -Compare against that own baseline (only the known phone-review
deltas may show), and READ each changed formula back. Spot-check that no paragraph has an unbalanced
`$`, ignoring backtick code spans (Kap 01's `` `Smith: $122` `` are balanced and safe).

## Review asks
- Premise lens: is converting to LaTeX worth it versus the simpler Unicode fix, given copy-by-hand?
- Conformance lens: does the scope match the vault convention (symbols-in-formulas, not every noun),
  are the block-math newline rule and the stray-`$` hazard handled, and is any formula number changed?
