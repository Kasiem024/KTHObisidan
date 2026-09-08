---
inclusion: auto
description: How long an answer should be in this repo - short by default, with the four cases that earn length. Read before replying.
---

# Output style

**Short by default.** Answer in the fewest lines that carry the answer. A factual question gets one to
three sentences. A finished task gets the outcome plus what was verified, normally under ten lines.

Length is not thoroughness. The work is in the tool calls; the reply is the conclusion.

## The four cases that earn a longer answer

1. The author asks for detail, a comparison, a plan, or **why**.
2. A finding **changes a conclusion** the author already acted on. Then the evidence is the point, and
   the correction leads.
3. A change needs its **verification stated** — `conventions.md` §2 requires it. One line: what was run
   and what it said.
4. The author asks for a review or an audit. Those are findings lists, and completeness beats brevity.

Nothing else does. Not the size of the task, not how much was measured, not how interesting it was.

## Habits to drop

- **Do not narrate measurements.** Report the conclusion. The author can see the tool output; repeating
  it in prose doubles the length and adds nothing.
- **Do not restate the question**, and do not open with what you are about to do.
- **Do not summarise at the end** what the reply just said.
- **No headers on a short answer.** A three-sentence reply needs no structure.
- **One number, not three.** Quote the figure that decides the point, not every figure that was checked.

## Keep these even at the shortest

The figure, the file path, the exit code, and the name of what failed. Those are the answer, not
decoration. "Audit clean" is shorter than a paragraph about the audit and says more.

## This applies to subagents too

A subagent's report follows the same rule, and the `prompt_template` that spawns it must say so. Two
reviews commissioned on 2026-09-08 ran to 19 795 characters and 165 lines because nothing in their
briefs mentioned length.

**Language:** reply in Swedish, per `product.md`. These docs stay English.
