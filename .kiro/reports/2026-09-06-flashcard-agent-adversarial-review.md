# Adversarial review — the flashcard-author agent (2026-09-06)

Read-only review. Nothing in the vault, `.kiro/`, the agent config or the hooks was modified.
Scratch scripts were written under `%TEMP%` and are listed at the end. All numbers below are
tool output, re-run where the environment is known to miscount.

Environment note: the vault changed under me during the session — `git status` shows
`.obsidian/workspace-mobile.json` and the SR plugin's `data.json` modified, i.e. a phone review
synced in. I therefore proved "no data destroyed" with `git diff --numstat` on named files, never
with a whole-vault total (per `.kiro/steering/environment.md`).

---

## 1. Verdict table

| # | Claim | Verdict | One-line evidence |
|---|---|---|---|
| 1 | Agent **cannot** write outside `KTH/**/Anteckningar/*.md` and `KTH/**/Begrepp/*.md` | **Falsified** | `allowedPaths` is *auto-approval*, not confinement (kiro docs); the only hard block is the hook, which allows path-traversal (A8, exit 0) and content-spoof (A9, exit 0). |
| 2 | Agent **cannot** write under `Filer/`, `Meta/`, `.kiro/`, `.obsidian/`, `Atlas/` | **Falsified** | `deniedPaths` "require approval", not hard-block (kiro docs); hook blocks direct forms (A1/A4–A7/A10/A11/A14 exit 2) but A9 lets a `Meta/…` path through (exit 0). |
| 3 | A whole-file rewrite that would drop a `<!--SR:-->` marker is blocked | **Confirmed (narrow)** | Create with fewer markers → hook exit 2 (B1). But bypassed by `strReplace`/`insert` (B3/B4 exit 0), by content-spoof create (B5 exit 0), and 0-marker files unprotected (B6). |
| 4 | Both hooks actually fire for this agent, with the JSON hook syntax | **Confirmed (execution)** | Both hooks run via the exact `"C:\Program Files\Git\bin\bash.exe" .kiro/hooks/…` invocation and return correct codes; both registered `preToolUse`/matcher `write`. Live-engine trigger not observable from outside. |
| 5 | The deck contains **88** cards, every card traceable to chapter 2 | **Falsified (count)** | Count is **87**, re-run two ways (43 `::` + 21 `;;` + 23 `||` + 0 `??`). Traceability holds: 19 sampled cards all accurately grounded in ch2. |
| 6 | Marker on `**Utelämnandefel** (omission)` preserved byte-identically | **Falsified** | No such card exists (only a `\|\|` bullet "Utelämnandefel"); the deck has **0** `<!--SR:` markers; the exact marker string occurs **only** in the brief. |
| 7 | No card duplicates one elsewhere; the six deferrals really exist | **Confirmed** | All six verified in Kap 01/05/06/10/11, HI1032 Kap 30 and `Begrepp/`. Kap 02 uses distinct cues; no exact duplicate found, incl. the networking terms. |
| 8 | Audit clean, markdownlint 0 issues, deck LF + no BOM | **Confirmed** | `RESULT: clean` (exit 0); `Linting: 1 file` / `0 issues` (exit 0); `hasBom=False`, `crAll=0`. |

---

## 2. Critical findings

> Definition used (from the brief): a critical finding is one that **can** destroy review data or
> **can** let the agent write outside its area. No *realised* damage was found — the deck destroyed
> no data (it never had any) and Kap 01 lost zero markers — but two mechanisms **can** be defeated.

### C1 — Write confinement is not what the design believes, and the only hard block is bypassable

**What I did.** Piped simulated write payloads to `.kiro/hooks/block-write-outside-course-notes.sh`
(exit 2 = block, 0 = allow), building the Swedish paths from the filesystem so the `ö` bytes were
real. Then I checked the kiro-cli documentation for what `allowedPaths`/`deniedPaths` actually do.

**What I observed.**

```
A1 create Meta/Vault Standard.md                                   ==> exit=2  (block)
A8 TRAVERSAL KTH/x/Anteckningar/../../../Meta/Vault Standard.md    ==> exit=0  (ALLOW)
A9 SPOOF path=Meta content mentions KTH/x/Anteckningar/y.md        ==> exit=0  (ALLOW)
A10 ABSOLUTE path to Meta (G:/...)                                 ==> exit=2  (block)
A14 backslash .kiro\hooks\evil.sh                                  ==> exit=2  (block)
```

The Trust-Configuration doc states plainly: `allowedPaths` are "Glob patterns for **auto-approved**
paths" and `deniedPaths` are "Glob patterns that **always require approval** (overrides
allowedPaths)". So the agent-config layer is a *trust / auto-approval* mechanism, **not** a hard
sandbox. The only mechanism that hard-blocks (exit 2, no approval possible) is the preToolUse hook.

**Why it is wrong.** `.kiro/README.md` states the opposite: *"Where a hard guarantee is needed,
restrict the tool instead … its write tool is confined by `toolsSettings.write.allowedPaths`"* and
calls the hook "only a second line of defence." The roles are inverted: `allowedPaths` cannot
confine anything, and the hook — the actual hard block — has two holes:

- **A8 (path traversal).** The allow-regex `KTH/[^"]*/(Anteckningar|Begrepp)/[^"]*\.md`
  (`block-write-outside-course-notes.sh:29`) lets `[^"]*` swallow `../../../Meta/Vault Standard`,
  so a traversal path out of the allowed tree matches and is allowed. The hook never rejects `..`.
- **A9 (content injection).** The hook greps the **whole payload** (`NORM`, built at line 16),
  not the extracted path field. A write whose `path` is `Meta/Vault Standard.md` is allowed if the
  payload's `content` merely contains the substring `KTH/x/Anteckningar/y.md`. The same flaw fires
  the other way (A13 below).

**Residual gate / what I could not run.** For a `deniedPaths` target such as `Meta/**`, the config
would still force a human approval prompt in an interactive session, so an attentive user could
decline. I did **not** run the live `flashcard-author` agent, and trust-all is documented to be
*inherited by subagents at spawn time* — in a trust-all / headless context the bypassable hook is
the sole barrier. I therefore cannot show an end-to-end file landing in `Meta/`; I can show the
documented hard block does not exist and the backstop that replaces it is defeatable.

**Fix (words, not applied).** In `block-write-outside-course-notes.sh`, parse the JSON and test
**only** the `path` field, not the whole payload; reject any path containing `..`; resolve the
path to an absolute form and assert it is inside `KTH/*/*/Anteckningar|Begrepp/`. Correct
`.kiro/README.md` (and the `vault-auditor` note beside it) to say `allowedPaths` auto-approves and
the hook is the actual block — the reverse of what it says now.

### C2 — The SR-write guard can be defeated on a marker-bearing file

**What I did.** Piped create/insert/strReplace payloads to `.kiro/hooks/protect-sr-data-write.sh`
against the real Kap 01 note, which carries **41** `<!--SR:` markers (`grep -c` = 41).

**What I observed.**

```
B1 create Kap01(41 markers), payload 0 markers   ==> exit=2  (block)   <- the case it is built for
B3 strReplace Kap01, drop markers                ==> exit=0  (ALLOW)
B4 insert Kap01, drop markers                    ==> exit=0  (ALLOW)
B5 create path=Kap01, content names Kap02 first  ==> exit=0  (ALLOW)   <- whole-file create, still bypassed
B2 create Kap01, payload 41 dummy markers        ==> exit=0  (ALLOW)   <- count-only, positions ignored
B6 create Kap02(0 markers), payload 0 markers    ==> exit=0  (ALLOW)   <- 0-marker files unprotected
```

**Why it is wrong.** B3/B4 confirm the header's own admission (`protect-sr-data-write.sh:12-18`):
only `create` is checked, so any incremental edit strips markers undetected. **B5 is the sharper
one and is not acknowledged:** the target is chosen by `grep -oE 'KTH/[^"]*\.md' | head -n 1`
(line 30), so a `create` that names a 0-marker note in its `content` before the real `path`
resolves the check to the wrong file (`HAVE=0`) and a genuine whole-file rewrite of a 41-marker
note passes. B2 shows the check is count-only — 41 markers reshuffled onto different cards passes,
which is exactly the history-theft `SKILL.md` rule 11 exists to prevent.

**Realised damage: none.** The deck under review has 0 markers, and `git diff HEAD` on Kap 01 shows
`SR lines removed(-)=0 added(+)=41` — no marker was destroyed anywhere. This is a latent capability,
not an incident.

**Fix (words).** Extract the `path` field by JSON key, not by first-match regex; refuse to fail
open when a `create` targets any note that has markers (block strReplace/insert whole-note deletes
too, or compare by marker *identity*, not count). Better: make the agent run
`Get-SRIntegrity.ps1 -Save`/`-Compare` around every edit (see design, S-below) — a count fingerprint
of named files is stronger than an in-hook heuristic.

---

## 3. Serious findings

### S1 — Claim 6 is false: the card and its marker do not exist

The deck has **no** `<!--SR:` markers at all (`grep` → 0 matches; script `SRmarkers=0`), and the
committed `HEAD` blob also had 0 (`git show HEAD:…` → 0), so the rewrite dropped nothing. There is
no card `**Utelämnandefel** (omission)` — only a bullet inside the `\|\|` list card *"Vilka tre
klasser delar Hadzilacos och Toueg in fel i? (3)"*: `- **Utelämnandefel** – något som ska ske
uteblir`. The exact marker string in the brief occurs **once in the entire vault — in the brief
file itself** (`grep "2026-08-31T15:26:55.891Z"` → 1 match, `…-review-prompt.md:89`). Claim 6 is
not merely unmet; the object it describes was never present.

### S2 — The deck has 87 cards, not 88

Two independent counts agree. `grep -c`: `::`=43, `;;`=21, `^\|\|$`=23, `^\?\?$`=0. A separate
script that walks the lines and de-duplicates any line bearing two separators returns
`TOTAL_CARDS=87` and enumerates 87 distinct prompts. (I re-ran because an off-by-one is exactly the
kind of silent miscount this environment produces; both methods give 87.) Claim 5's count is wrong
by one.

### S3 — The rewrite added `nosr`, taking all 87 cards out of the review schedule

`git diff HEAD` on the deck:

```
-tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
+tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
```

`#nosr` is in the plugin's `flashcardTagsToIgnore`, so every one of the 87 cards is now excluded
from review. The sibling deck **Kap 01 is *not* `nosr`** and is actively reviewed (41 markers), so
within one course two chapters are now treated oppositely. The agent's own prompt, rule 4, says
*"Ask before changing a deck's scope. The `nosr` tag decides whether a note's cards are reviewed at
all … the author's decision, not yours."* If the agent added `nosr` unprompted, the produced
artifact violates rule 4; if the author asked for it, the change is fine but is invisible in the
deck's own history. Either way it deserves an explicit line in the hand-off, because the practical
effect is that 87 well-grounded cards will never be seen again. (Note: six other HI1031 chapters —
06/09/10/11/16/17 — are also `nosr`, so a per-chapter scoping policy plausibly exists; that is the
author's call to confirm.)

### S4 — `.kiro/README.md` overstates `allowedPaths` as a hard guarantee

Detailed under C1. The doc's "hard guarantee … confined by `toolsSettings.write.allowedPaths`" is
contradicted by the kiro-cli Trust-Configuration doc (auto-approval + require-approval). This same
sentence is the stated rationale for `vault-auditor`'s confinement, so the misconception is
load-bearing in two places.

### S5 — A legitimate card can be blocked by its own content (A13)

```
A13 valid Anteckningar path, content mentions "/Filer/"   ==> exit=2  (BLOCK)
```

Because the `/Filer/` test (line 20) greps the whole payload, the agent cannot author a card whose
answer text mentions a `/Filer/` path — a false positive that will look like a mysterious hook
failure. Same root cause as A9; fixing the path-field extraction fixes both.

---

## 4. Minor findings (documentation, wording, consistency)

- **M1 — `[measured]` on the highlight rule omits its caveat.** `SKILL.md` rule 5 cites
  `d = 0.27–0.31` as `[measured]`. `evidence.md` §16 carries the limiting caveat that *"every study
  manipulates colour or semantic category in word lists, not markdown emphasis … Direction, not
  magnitude."* The number is faithfully transcribed, but a reader of `SKILL.md` alone sees a
  `[measured]` effect size with no hint that it is an extrapolation from colour word-lists. Rule 13
  (Mayer, `d=1.39/0.97`) handles this better — it is tagged `[indirect]` and names "multimedia
  lessons, not cards." Consider carrying one clause of the §16 caveat into rule 5.
- **M2 — cue density in the list-card openings.** 9 cards open `Vilka tre …? (3)` and 4 open
  `Vilka två …? (2)`. By the letter of `SKILL.md` rule 9 ("three cards open with the same phrase …
  that phrase is an overloaded cue") this trips the check; by the mechanism (cue overload) it does
  not, because the distinguishing topic follows immediately and each prompt resolves to a unique
  answer. Worth the author's eye, not a defect.
- **M3 — `evidence.md` §20 slightly understates the authorship penalty it cites.** The section
  argues "authorship is not where the largest effects live," yet the premade penalty it quotes for
  definition questions (`d = 0.45`) is on par with the retrieval-transfer lever it leans on
  (`d = 0.40`, §1). The reasoning is still internally consistent — it explicitly calls the penalty
  "real" and rests the compensation on levers (feedback, continued testing, interleaving) that a
  reader of premade cards genuinely gets — but the "not where the largest effects live" phrasing is
  a touch generous to the workflow it is defending.
- **M4 — a pre-existing duplicate, not introduced here.** `**Middleware**;;` is defined twice —
  `Kap 01:122` and `Begrepp/Middleware.md:21`. Kap 02 does not add a third, but the vault's
  no-duplicate goal is already breached here independently of this deck.
- **M5 — cross-course concept overlap.** `latens`/`bandbredd`/`fördröjning` appear in both HI1031
  Kap 02 and HI1032 (Kap 30, Kap 18), but as context-specific **list bullets**, not competing
  standalone cards (`**Latens**` exists only in Kap 02 vault-wide). Acceptable under the vault's own
  cue-overload guidance; flagged only for awareness.
- **M6 — positives worth recording.** Every numeric value in `SKILL.md` matches `evidence.md`
  (`0.40, 0.41–0.55, 0.27–0.31, 0.66, 70/51 %, 1367/1465/1501 ms, 75 %, 80/36 %, 1.39, 0.97, 0.46,
  63/20 %, 10–20 %, 9–18 d, 0.07`). The `§`-cross-references between the three files resolve
  correctly (SKILL→evidence §11/§20; formulation→§3/§14/§16/§17/§21; evidence internal §16↔§21) —
  despite the brief's warning about renumbering, I found no broken reference. The agent prompt does
  not contradict the skill; its "six non-negotiables" map cleanly onto the skill's steps and rules.

---

## 5. Section C in detail — the cards against chapter 2

Checked against `…/Filer/Litteraturlista/Distributed Systems Concepts and Design 2012 Edition 5.md`,
lines 1013–1843. Highlight discipline was machine-checked: 128 `==` occurrences = exactly one
highlight on each of the 64 inline cards, and **no `\|\|` list body contains a highlight**
(`adv_hl.ps1` → `NO ANOMALIES`). All `\|\|` cards carry 2–4 items with `(N)` in the prompt; there
are no yes/no prompts, and no card teaches a calculation procedure (chapter 2 contains none).

**The four distinctions the brief singled out are all correct — no conflation:**

| Pair | Card | Book |
|---|---|---|
| krasch vs fail-stop | "Vad krävs för att en krasch ska kallas fail-stop?::…==säkert kan avgöra att processen har kraschat==…" | "A process crash is called *fail-stop* if other processes can detect certainly that the process has crashed" (§2.4.2) |
| validitet vs integritet | `**Validitet**;;…till slut levereras…` / `**Integritet**;;…identiskt… inget levereras två gånger` | Validity / Integrity, **line 1700** ff. |
| skiktning vs flerskikt | "Skiktning – vertikal…; Flerskikt (tiering) – fördelar *ett* lagers funktion över servrar" | "tiering is a technique to organize functionality of a given layer", **line 1289** |
| partitionering vs replikering | "Partitionering – egen del av objekten…; Replikering – kopia av samma data (NIS)" | "partition the set of objects … or maintain replicated copies", **line 1217** |

**15+ cards spot-checked, all accurately grounded (sample):**

1. `**Fysisk modell**;;…hårdvara och nät, utan detaljer om teknik` — §2.2, "abstracts away from
   specific details of the computer and networking technologies."
2. "minimala fysiska modellen (baseline)…utökningsbar mängd datornoder…" — **line 1053**.
3. "Vad skiljer en komponent från ett objekt?::…vilka andra komponenter och gränssnitt den kräver" —
   §2.3.1, "components specify … the assumptions they make in terms of other components/interfaces …
   making all dependencies explicit."
4. "Varför skalar klient-server-modellen dåligt?::…en enda adress…" — §2.3.1, "placing a service at
   a single address does not scale well beyond the capacity of the computer that hosts the service."
5. "Var kan en cache ligga?::Antingen hos varje klient eller i en proxyserver…" — §2.3.1, "Caches
   may be co-located with each client or … located in a proxy server."
6. "…VNC-protokollet…placera en rektangel av pixeldata…" — §2.3.2, "one operation: the placement of
   a rectangle of pixel data at a given position on the screen."
7. `**Ände-till-ände-argumentet** (Saltzer et al.);;…bara kan implementeras fullständigt med hjälp
   av applikationen i ändpunkterna` — §2.3.3, the paraphrased Saltzer statement.
8. "Varför räcker inte TCP…::…klarar inte större nätavbrott…" — §2.3.3, "TCP provides some error
   detection and correction, but it cannot recover from major network interruptions."
9. `**Latens**;;Fördröjningen från att ett meddelande börjar sändas till att mottagaren börjar ta
   emot det` — §2.4.1, verbatim sense of the latency definition (~line 1531).
10. `**Klockdriftshastighet**;;…avviker från en perfekt referensklocka` — §2.4.1, "clock drift rate
    refers to the rate at which a computer clock deviates from a perfect reference clock."
11. `**Asynkront distribuerat system**;;…utan några gränser…vilket är just vad internet är` — §2.4.1,
    the three "no bounds on" items + "This exactly models the Internet."
12. "Vad gäller för en lösning som fungerar i ett asynkront system?::…också giltig i ett synkront
    system…" — §2.4.1, "Any solution that is valid for an asynchronous distributed system is also
    valid for a synchronous one."
13. `**Godtyckligt fel** (bysantinskt);;…vilket fel som helst kan inträffa…` — **line 1646**.
14. "Varför är godtyckliga fel i kanaler sällsynta?::…känner igen och förkastar felaktiga
    meddelanden – checksummor… sekvensnummer…" — §2.4.2, "the communication software is able to
    recognize them … checksums … message sequence numbers."
15. `**Principal**;;Den auktoritet som ett anrop eller ett resultat utfärdas på – användare eller
    process` — §2.4.3, "an authority … is called a *principal*. A principal may be a user or a
    process."
16. `**Motståndaren** (the enemy);;…skicka valfritt meddelande till valfri process och läsa eller
    kopiera valfritt meddelande…` — §2.4.3, "an enemy … capable of sending any message to any
    process and reading or copying any message sent between a pair of processes."
17. "Hur ser grundtekniken för autentisering ut?::…krypterad del med tillräckligt av innehållet…" —
    §2.4.3, "include in a message an encrypted portion that contains enough of the contents … to
    guarantee its authenticity."

No card asserts anything the chapter does not, and none carries two independent facts. The
`(kurs)uppdateringar från mäklarens server` example (Push-modell card) reads correctly as
*share-price* updates from a *broker* — matching the book's stockbroker example — not "course"
updates.

**Claim 7 — every deferral verified, no exact duplicate slipped through:**

| Deferred fact | Claimed home | Verified |
|---|---|---|
| Jitter definition | HI1032 Kap 30 | `**Jitter** (i QoS);;` at `Kap 30:16`. Kap 02 lists jitter only as one bullet of a 3-item ch2 list — no standalone card. |
| Space/time frikoppling | Kap 06 + `Begrepp/Indirekt kommunikation.md` | `Kap 06:15-18`, `Begrepp:11`. Kap 02 does not use the term at all. |
| Caching / Mobil kod / Maskera fel / Överbelastningsattack / Middleware | Kap 01 | `Kap 01:77 / :128 / :95 / :111 / :122`. Kap 02 has only ch2-specific *aspect* cards (different cues), no definition cards. |
| Goal of peer-to-peer | Kap 10 | `Kap 10:9` "Vad är målet med peer-to-peer-system?". Kap 02 cards P2P *complexity*, not its goal. |
| Proxy (remote-invocation sense) | Kap 05 | `**Proxy** (i fjärranrop);;` at `Kap 05:44`. Kap 02's "webbproxyserver" is the caching sense — correctly distinct. |
| Autentisering definition | Kap 11 | `**Autentisering** (authentication);;` at `Kap 11:32`. Kap 02 cards the *technique* (how), a different cue. |

I checked the highest-risk cross-note terms for a duplicate that "slipped through" — `**Latens**`,
`**Bandbredd**`, `**Skiktning**`, `**Middleware**`, `**Mobil kod**`, jitter/fördröjning — and found
no exact duplicate card introduced by Kap 02. (I did not exhaustively grep all 87 prompts.)

---

## 6. Design assessment (Section E)

**Is a separate agent justified?** Only weakly. `.kiro/README.md`'s own principle is *"'make the
agent know about X' is a skill, not a new agent"*, and the `write-flashcards` skill already existed
and had been used twice. The single thing an agent adds over the skill is a sandbox —
`toolsSettings` tool-scoping plus preToolUse hooks. But this review shows that sandbox is softer
than believed: `allowedPaths` is auto-approval, not confinement (C1/S4), and the hooks that do hard-
block are bypassable (C1/C2). Meanwhile the agent **prompt restates the skill** — its "six
non-negotiables" duplicate the skill's rules — which is precisely the drift risk the README warns
about. Net: the agent is defensible **only** as an auto-approval-plus-hook convenience for
unattended runs; if that is the goal, keep it but (a) slim the prompt to defer entirely to the
skill, and (b) harden the two hooks per C1/C2 so the sandbox is real. If unattended running is not
needed, the skill alone is the more honest choice.

**Is the tool set too broad?** Two concerns.

- `write` is in `allowedTools`, so writes are auto-approved within the path rules. Acceptable *if*
  the path rules confined anything — but they only auto-approve, and the hard block is the hook.
  So auto-approved `write` + bypassable hook is the weak combination behind C1.
- `shell` has `autoAllowReadonly: true` and **`denyByDefault: false`**. `denyByDefault: false`
  means `allowedCommands` is not an allowlist — commands outside the list are not denied. For an
  agent whose only shell need is the four verification commands, this is broader than necessary.
  Recommend `denyByDefault: true` with the verification commands explicitly listed (they already
  are), so anything else is refused rather than merely un-auto-approved.

**What is missing?** The agent should be **required** to run
`Meta\Obsidian Plugins\Scripts\Get-SRIntegrity.ps1 -Save` before editing and `-Compare` after — it
is already in the shell allowlist but the prompt's rule 6 lists only marker counts + `git diff`.
Given the SR-write hook's gaps (C2), a named-file fingerprint is the stronger backstop. Nothing at
all enforces rule 4 (no silent scope change): a small preToolUse hook that blocks a `create` which
*adds* `nosr` to a note that lacked it would have caught S3.

---

## 7. What I could not verify, and what it would take

- **End-to-end write escape.** I exercised the hooks directly (they execute and return the codes
  above) and read the kiro trust semantics, but did **not** run the live `flashcard-author` agent's
  `write` tool. So I cannot show a file actually landing in `Meta/` via the A9/B5 payloads under a
  given trust configuration — only that the documented hard block is absent and the backstop is
  defeatable. To verify: run the agent headless with `--trust-all-tools`, submit an A9-style
  content-spoof `create` targeting `Meta/…`, and observe whether the file is written or the
  `deniedPaths` approval gate stops it.
- **Whether the engine fires the preToolUse hooks per write.** Registration (matcher `write`, both
  hooks present) and executability are confirmed; the actual per-call invocation is engine behaviour
  not observable from outside a real agent run. To verify: run the agent and watch a blocked write.
- **Glob semantics of `KTH/**/Anteckningar/*.md` in this engine.** The docs say `**` matches
  recursively; the config also carries the explicit two-level `KTH/*/*/Anteckningar/*.md`, which
  covers the real path `KTH/2026 Höst/HI1031 …/Anteckningar/…` regardless — and the deck was in fact
  written there, so the allow side works. I did not run the engine to watch a glob match/miss.
- **Whether `nosr` on Kap 02 was authorised.** Observable only as a working-tree change diverging
  from `HEAD` and from sibling Kap 01. The author confirming is the only way to close S3.

## 8. Honest bottom line

No review data was destroyed and no card misstates the source — the cards are accurate, well-formed
and correctly de-duplicated, and claims 7 and 8 hold outright. The real problems are: two of the
handover claims are simply untrue (claim 6 describes a non-existent card/marker; claim 5's count is
87, not 88); the deck was quietly taken out of the review schedule (`nosr`, S3); and the security
story is inverted from what the docs say — `allowedPaths` does not confine, and the hooks that do
block can be walked past with `..` or a decoy path in the payload (C1/C2). None of the hook gaps had
been exploited, but they are real and the fixes are small.

---

### Scratch files (under %TEMP%, to be removed)
`adv_cards.ps1`, `adv_cards_out.txt`, `adv_hooks.ps1`, `adv_hooks_out.txt`, `adv_hl.ps1`,
`adv_hl_out.txt`, `adv_head2.txt`, `adv_diff2.txt`, `adv_diff1.txt`, `adv_numstat1.txt`,
`adv_audit.txt`, `adv_mdl.txt`, `adv_gitlog1.txt`, `adv_gitlog2.txt`, `adv_gitstatus.txt`.
