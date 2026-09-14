# Re-entry prompt

**This is the only file you need to be pointed at.** It is rewritten at the end of every context
window, immediately before `/compact`. Read it fully before doing anything.

It is deliberately short. Everything under `.kiro/steering/` is `inclusion: auto` and has already
been loaded into your context — the hard rules, the environment traps, the script library, the
output style. **Do not re-read them looking for basics, and do not restate them here.** This file
carries only what is task-specific plus the handful of things that have actually bitten.

Last updated **2026-09-14**. Course-neutral: it replaced `.kiro/hi1031-tenta-reentry.md`, which is
now an archive of the finished HI1031 exam-prep project and still worth reading if that course
comes back.

---

## FIRST TASK AFTER RE-ENTRY

**Get familiar with lab 3 for HI1032 Kommunikationssystem.** The lab is **ACL and HSRP**.

This is a *familiarisation* task. Read the material, understand what the lab asks, and report back.
Do not produce study material, notes or a flashcard deck until the author says what he wants.

### You do not need to open a single PDF

Everything is already converted to Markdown under `Filer/Canvas/AI-optimerad Markdown/`. Read these,
in this order:

```text
KTH/2026 Höst/HI1032 Kommunikationssystem/Filer/Canvas/Laborationer/Labb 3 ACL HSRP.md
KTH/2026 Höst/HI1032 Kommunikationssystem/Filer/Canvas/AI-optimerad Markdown/Laborationer/Labb3_student-2.md
KTH/2026 Höst/HI1032 Kommunikationssystem/Filer/Canvas/AI-optimerad Markdown/Laborationer/Labb3_instructor-2.md
```

The first is the Canvas page, ~40 lines, and is the fastest way in. The second is the student lab
manual (~19 KB). The third is the **instructor version, which contains the answers** — the Canvas
page says outright it is provided "för verifiering". Read it, but understand the difference between
knowing the answer and being able to configure it in room T64.

`Filer/` is gitignored and outside the audit's scope. **Read it, never modify it.**

### What the lab is, from the Canvas page

Three stated goals: configure **standard and extended Access Control Lists**, retrieve information
about neighbouring network devices, and build **default-gateway redundancy with HSRP** (Hot Standby
Router Protocol).

- **Where:** room T64, done physically on site. Booking is via the Canvas calendar under *Hitta möte*.
- **Examination:** oral and practical, on the spot in T64. So the goal is being able to *do it and
  explain it at a router prompt*, not recognise it on paper.
- **Preparation the course asks for:** CCNA3 chapters **8.1, 9 and 10.1** on NetAcad, plus two
  videos — the whole *Access Control Lists | Cisco CCNA 200-301*, and *First Hop Redundancy Protocol
  Explained* for **00:00–07:25** only. Neither is in the vault; they are external links in the
  Canvas page.

**A gap worth naming early:** the required reading is NetAcad CCNA3, which is **not** in the vault.
The course textbook that *is* here is Forouzan, *Data Communications and Networking*, 5th ed., at
`Filer/Litteraturlista/`, 2.9 MB of Markdown. It covers ACL-adjacent material but is not the
CCNA3 chapters the lab names. Do not silently substitute one for the other — if you ground an
explanation in Forouzan, say so, and say what CCNA3 would have added.

### Precedent: what lab 1 turned into

`KTH/2026 Höst/HI1032 Kommunikationssystem/Anteckningar/HI1032 Labb 1 - Flashcards (TCP).md`, 22 KB.
So the established pattern for a lab is a flashcard deck in `Anteckningar/`, named
`HI1032 Labb N - Flashcards (<topic>).md`. **That is context, not an instruction** — wait for him.

Other labs, for orientation: 1 TCP, 2 OSPF, 3 ACL+HSRP, 4 Network Management, 5 Nätverksdel, plus a
`Slutuppgift`. Labs 2 and 3 have `.pkt` Packet Tracer files; lab 3's are not among them.

### If it does become an authoring task

`product.md` and `.kiro/skills/write-flashcards/SKILL.md` already govern this and are loaded. The
two things most often got wrong: **everyday Swedish with the technical terms kept**, and **card
count is a cost, not a coverage score** — 40–60 per deck. HI1032's decks are tagged `nosr`, which
is never touched and never raised.

---

## STATE OF THE REPOSITORIES — both clean as of 2026-09-14 11:45

Nothing is in flight. Both repos are committed and pushed, and every check is green.

| | |
|---|---|
| Vault `main` | `80c9cc8`, matches `origin/main` |
| Site repo `v5` | `7de1cbd`, matches `origin/v5` |
| `Vault-Audit.ps1` | **clean** — first green audit since 2026-09-10 |
| markdownlint | 549 files, 0 issues |
| `Test-ScriptHygiene.ps1` | clean, 17 files, 85 checks |
| `Test-DocHygiene.ps1` | clean |

Two things to know before you push anything:

1. **There is a local `pre-push` hook** that runs markdownlint and `Vault-Audit.ps1 -ContentOnly`
   and **blocks the push** if either fails. It is not tracked by git, so it exists only in this
   clone. It is documented in `Meta/Vault Findings & Backlog.md` under F58. **Do not bypass it with
   `--no-verify`** — fix what it found. It caught a red audit on 11 files this session and was
   right to.
2. **One file is deliberately left untracked:**
   `.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`, a Drive
   sync conflict artefact. It should be deleted, but that is the author's call.

### The HI1031 exam-prep project is finished

Ten chapters — 1, 2, 4, 5, 6, 9, 10, 11, 16, 17 — each with an exam-answer note and a flashcard deck
in `HI1031 .../Anteckningar/`, reviewed and verified. The oral exam is **21–23 September 2026**. The
review pass is recorded in `.kiro/reports/hi1031-genomgang-2026-09-10.md`; the project's calibration
knowledge is in `.kiro/hi1031-tenta-reentry.md`. **Do not write more HI1031 chapters.**

One open question he has not answered, from an inspection of `HI1031 .../Begrepp/`: the 14 concept
notes there are a partial glossary of the course's early material, with nothing for chapters 9 or
11, and all tagged `nosr` so they are never drilled. The recommendation given was to leave them and
add one line saying what the folder is, rather than expanding it. He has not replied.

---

## THINGS THAT COST TIME THIS SESSION, beyond what steering already says

- **A local build proves nothing about CI.** A Quartz build crashed on a vault note and was reported
  to him as *the site is broken*. It was not. `core.autocrlf=true` at system level means the site
  repo's `content` submodule checks out CRLF here while CI on Linux gets LF, and the crash needs
  CRLF. Now in `environment.md` with the measured numbers, and in the site repo's `PROJECT-NOTES.md`
  with the reproducer.
- **I made the same `strReplace` mistake three times** in `.kiro/lessons-learned.md`: anchoring on
  `---\n\n## heading` to insert *before* it, and not reproducing that heading in the replacement, so
  it was consumed each time. Caught each time only by counting headings afterwards. **When inserting
  before an anchor, the anchor must appear in the replacement text.** Related to T20's rule about
  putting the whole block in `oldStr`.
- **The docs were right and I was not, three times out of four.** Before adding anything to
  `traps.md` or `lessons-learned.md`, grep for it first: the pre-push hook, the mixed line endings
  and the `Test-Path` path-decoding failure were all already documented. Only one candidate in four
  survived the check.

---

**How to use this file:** rewrite the `FIRST TASK` and `STATE` sections before saying "run compact",
and leave the rest unless something new was learned. The table of where every durable fact belongs
is in `.kiro/README.md` and `steering/documentation-standard.md`.
