---
description: Which chat transcripts still hold state that is written down nowhere else, and how to reopen one. Empty means everything has been distilled.
---

# Sessions worth returning to

**Pointers, not knowledge.** The durable facts live in `Meta/Vault Findings & Backlog.md`,
`.kiro/steering/traps.md`, `.kiro/lessons-learned.md`, `.kiro/skills/` and the scripts under
`Meta/Obsidian Plugins/Scripts/`. This file records only which chat transcripts still hold
something that never reached one of them. It is a debt list against those five, not a sixth kind
of knowledge.

**A row is deleted once it is distilled.** Empty is the healthy state, exactly as in
`current-state.md`: an empty table means every session's output sits in the file where it belongs.
More than about ten rows means this file is being used to defer distillation instead of doing it.

This file is **not** loaded automatically — only `.kiro/steering/**` is. It is referenced from
`steering/documentation-standard.md`, which is.

## The ledger

| Date | Session id | Topic | Why reopen | Distilled into |
|---|---|---|---|---|
| 2026-09-07 | `7278c413-91b1-4259-9c5c-2c317ec11703` | Whether to keep a session ledger at all; measured how `kiro-cli` resume really behaves | Holds the raw measurements behind T15 — the engine matrix, the 44-session resumability census, the portability test — and none of that is in a script | T15, this file |

## Reopening one

```powershell
kiro-cli chat --agent-engine v2 --resume-id <id>
```

Run it from the vault root, so steering loads. `--agent-engine v2` is not optional: without it,
`--resume-id` is silently ignored and you get a fresh conversation with exit code 0 (T15). A dead
id *does* fail loudly under v2 — `error: ACP load_session failed` — so a stale row is cheap to
detect.

### What a resumed session actually gets

Not the whole conversation. The engine restores everything after the last `Compaction` or `Clear`
record, plus that compaction's summary (~22 KB, about 5–6k tokens). Measured across the 44
vault-cwd sessions on 2026-09-07: **30** restore the full transcript (all of them small), **11**
restore a summary plus a tail, **3** restore nothing. The tail can be short — 56 lines of 1242 in
one case, 54 of 319 in another. A session whose last record is a `/clear` restores **nothing**,
verified on a 14.7 MB, 3516-line transcript that reopened to an empty context.

So the long sessions most worth reopening are precisely the ones that retain the least, and
reopening is worth most while a session is still fresh.

**To recover a fact or an argument, grep the transcript instead of resuming it.** Each
`Compaction` record keeps a `messages_snapshot` of the messages it replaced, so the file still
holds pre-compaction detail that resume will never load. Grepping costs nothing, needs no engine
flag, and cannot append to the session by accident.

## Getting the session id

Ask the agent — with shell access it can find its own, by matching a phrase only this
conversation has used:

```powershell
Get-ChildItem "$env:USERPROFILE\.kiro\sessions\cli" -Filter *.jsonl |
  Sort-Object LastWriteTime -Descending | Select-Object -First 4 |
  Where-Object { Select-String $_.FullName -Pattern "<phrase from this chat>" -SimpleMatch -List }
```

`kiro-cli chat --list-sessions` also lists this directory's sessions with their ids, but it is
scoped to the exact cwd: 11 vault sessions were started from `KTH\2026 Höst\` and are invisible
from the vault root. `--all-cwds` spans every workspace.

Write the row at the **end** of a session, which is the first moment you can tell whether anything
was left undistilled. Usually the better move at that moment is to distil it and write no row.

## What makes a row worthless

- **The transcripts are not backed up.** They live in
  `C:\Users\ekasalm\.kiro\sessions\cli\<id>.{json,jsonl}`, outside the vault, outside git and
  outside Drive sync — 790 MB on 2026-09-07, with nothing pruning them by age, count or size
  today. A reinstall or a disk cleanup takes every id in this table with it. If a row genuinely
  matters, copy that pair somewhere private first: both files are required (`.jsonl` alone fails
  to load), and a copied pair resumes under any id.
- **Resume rides on the legacy engine.** v2 resumes in place; v3 imports the session as a copy
  under a new key instead. When v2 is retired these ids stop being reopenable, though the
  transcripts stay greppable.

**Never paste a transcript, a prompt, or a `--list-sessions` title into this repo.** `.kiro/` is
public, and the store's `title` field is the raw, truncated first prompt of the session. The Topic
column is written by hand for that reason — and because the stored title is often wrong anyway: a
`/clear` or a change of subject leaves it describing work the session no longer contains.
