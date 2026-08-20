---
inclusion: auto
description: In-flight state for work that is currently unfinished. Read at the start of any session; update it when pausing mid-task. Empty means nothing is in progress.
---

# Current state

**Status: nothing in flight.**

Everything is committed, both remotes match, and there is no partially-finished work.

Settled 2026-08-20: the `description` harvest residue is fixed and checked (F56), and the
parallel-wave question is decided — read-only fan-out is kept for semantic discovery only, the
wave/DAG machinery is rejected. Both outcomes are recorded in
`Meta/Vault Findings & Backlog.md` and `.kiro/lessons-learned.md`.

---

## What this file is for

A long task can outlive the conversation it started in. When that happens, the useful facts are
not in the chat any more: which step we reached, what has already been verified, which decisions
were made and why. Twice that had to be reconstructed by hand.

This is the smallest thing that fixes it — one short file, in the repo, updated when work pauses
mid-task.

## When to write it

- Before a long-running operation, so an interruption is recoverable.
- When pausing a multi-step task that is not finished.
- **Not** for finished work. That belongs in `Meta/Vault Findings & Backlog.md`.

## When to clear it

As soon as the task is done and pushed, reset this file to "nothing in flight". A stale state
file is worse than none, because it describes a situation that no longer exists.

## Template

```markdown
# Current state

**Status: in progress — <one line: what is being done>**

Started: YYYY-MM-DD

## Done so far
- <step>, verified by <evidence>

## Next step
<the single next action>

## Decisions made
- <decision> — because <reason>

## Verified numbers at this point
- audit: clean / N deviations
- lint: N errors
- build: pages / callouts / leaks

## Do not redo
- <things already tried that did not work, so they are not repeated>
```

## Where the durable facts live

This file is deliberately thin, because most of what a new session needs is already permanent:

| Need | Where |
|---|---|
| The rules | `Meta/Vault Standard.md` |
| What changed and how it was verified | `Meta/Vault Findings & Backlog.md` |
| How to do a recurring job | `.kiro/skills/` |
| What fails silently | `.kiro/traps.md` |
| Why a check exists | `.kiro/lessons-learned.md` |
| What is unfinished right now | this file |
