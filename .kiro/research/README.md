# Research artifacts

Raw output from tools that cannot export cleanly — chiefly Gemini Deep Research reports, pasted here
because there is no download that preserves them. Kept verbatim: these are **sources**, not notes, so
nothing in this folder is edited, reformatted or linted.

It lives under `.kiro/` deliberately. A pasted report in the vault proper fails the audit
(`noFrontmatter`, `noH1`), counts toward `notesInScope`, and publishes to the public site — all three
happened on 2026-09-06 before the file was moved here.

Naming: `<YYYY-MM-DD>-<notebook or topic>-<what it is>.md`.

| File | What it is |
| --- | --- |
| `2026-09-06-nblm-meta-run1-deep-research-report.md` | Run 1 of the meta-notebook about how NotebookLM and Deep Research work. Written from the v1 acquisition prompt: source prioritisation and per-claim metadata, but **no** report structure. 40 sources cited and imported, 1 failed (`iet.ucdavis.edu`), 23 of 40 domains official Google or arXiv. |
| `2026-09-06-nblm-meta-run2-deep-research-report.md` | Run 2, same topic and notebook, from the v2 prompt: the five-section report structure **plus** "do not cite low-quality sources". 50 cited and imported, 1 failed (`medium.com`), 23 of 50 official — so ten more citations, all third-party, and the official share fell from 57.5 % to 46 %. All five sections present. The structure instruction worked; the quality instruction backfired. |

| `2026-09-07-llm-vs-human-text-run1-deep-research-report.md` | First run of a **second notebook**, on how LLM text differs measurably from human text. Categorical exclusion instead of the evaluative line. 23 cited, 18 imported, 5 failed (4 ResearchGate mirrors, 1 repository PDF), 13 of 23 journal or arXiv, 42 discarded with reasons. **Contains a fabricated statistic** — see the distilled file below. |
| `2026-09-07-ai-text-detector-reliability-run2-deep-research-report.md` | Second run of that notebook, on how reliably AI-text detectors work. First run with the title clause. 35 cited, 26 imported, 9 failed, 18 of 35 journal or arXiv, 84 discarded with reasons. 9 of 19 inventory rows wrote "title not verified" — the clause turning silent fabrication into an open gap. |
| `2026-09-07-nordic-germanic-llm-style-run3-deep-research-report.md` | Third run, on Nordic and Germanic languages. First run with the named-works clause, which brought in the PNAS paper's **citation** — but only as an abstract and metadata page, not the full text. 35 cited, 27 imported, 8 failed (all ResearchGate), 19 of 35 peer-reviewed or preprint, **142 discarded** — many of them false matches on "Swedish register" meaning healthcare registries. Also the source of an **index-shifted table** in which every number is real and every pairing is wrong. |
| `2026-09-07-llm-style-what-survived-checking.md` | **Not a report — the distillation.** Every figure worth keeping from the four reports and five query rounds, sorted into tiers by how hard it was checked, plus the documented Swedish absence, the contradictions left open, and the four claims that had to be corrected. Read this instead of the reports. |

Together: **90 of the meta-notebook's 300 slots** across two runs, and **74 of the text notebook's 300**
across three.

**The reports are sources, not records.** They carry three separate fabrications found so far: a real
paper's finding with the sign reversed and invented error bars, an index-shifted table in which every
number is real and every pairing is wrong, and a confident fabricated title beside a wrong source kind.
Quote the distilled file, or the primary paper — never a report.

The point of keeping them: a report Deep Research writes is itself added to the notebook as a source, so
its structure is queryable later. Holding a local copy means the same text can be read directly, without
spending a NotebookLM question on it. See `.kiro/skills/query-notebooklm/references/corpus-acquisition.md`.
