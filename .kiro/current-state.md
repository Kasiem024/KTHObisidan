---
inclusion: auto
description: In-flight state for work that is currently unfinished. Read at the start of any session; update it when pausing mid-task. Empty means nothing is in progress.
---

# Current state

**Status: in progress — an open question, no unfinished code.**

Paused: 2026-08-20. Both repos are clean and pushed (vault `7f97793`, site `8ab233f`).
Nothing is half-applied; the only thing outstanding is a decision.

## The open question

Whether the reference `.kiro` in `Kana-App` has anything usable in its **parallel-wave and
subagent-DAG** machinery, which F55 deliberately skipped as "does not apply to sequential
single-repo work". That dismissal was made from a summary, not from the source.

## What is already known

From `Kana-App/.kiro/steering/agent-standards.md`:

- The delegation tree is **intentionally two levels**. Leaves never sub-delegate; iteration is an
  orchestrator loop (`loop_to`: target / trigger / max_iterations), not deeper nesting.
- **Read-only fan-out is cheap and parallel-safe** — soft ceiling ~6, not counted against the
  write cap. **Write fan-out is capped at 4** and bounded by disjoint zones.
- **Nested write-dispatch is fragile**; a write-dispatching stage must fall back to doing the work
  directly if its dispatch fails or times out.
- A subagent's result reaches the parent **only if its `summary` call completes**. They measured
  **~22.6%** of dispatches silently returning nothing — ~53% for one coder role, near-zero for
  read-only roles. `Pipeline completed: N stages finished` counts stages that *ran*, not stages
  that *delivered*.
- Their mitigation is a **unique marker token** per stage: the stage must begin its output with
  it, so a missing marker is an unambiguous "lost", distinguishable from "found nothing".

## Why this is worth a real look rather than a dismissal

The lost-stage failure mode is the same class this vault has fought all session: a plausible
result that is actually the absence of a result. "Returned nothing" and "found nothing" are
byte-identical from the caller's side — see `.kiro/lessons-learned.md`.

And there were genuine read-only fan-out moments recently: reading ~30 files across another
repository, auditing 500 notes, inspecting 601 built pages. Read-only fan-out is precisely the
category they call safe.

## Not yet read — start here

- `Kana-App/.kiro/steering/parallel-workflow.md`
- `Kana-App/.kiro/skills/dev-workflows/technical/parallel-workflow-dispatch/SKILL.md`
- `Kana-App/.kiro/skills/dev-workflows/technical/parallel-workflow-ops/SKILL.md`
- `Kana-App/.kiro/plans/kana/subagent-dag-pilot.md`
- `Kana-App/.kiro/docs/subagent-optimization-research-{brief,report}.md`
- `Kana-App/.kiro/docs/subagent-usage-assessment.md`

## Constraint worth checking first

Neither `vault-auditor` nor `site-builder` has the `subagent` tool, so today neither can fan out
at all. Any adoption starts by deciding whether to grant it — and their standard warns that
giving a read-only leaf the `subagent` tool lets it spawn writers.

## Clear this file when the decision is made

Record the outcome in `Meta/Vault Findings & Backlog.md` and reset this file to
"nothing in flight".
