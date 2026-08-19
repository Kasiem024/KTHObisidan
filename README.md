---
tags: [meta]
description: "A repo to store Obsidian vault for studying (KTH, Högskoleingenjör – Teknik och Ekonomi)."
---
# README

A repo to store Obsidian vault for studying (KTH, Högskoleingenjör – Teknik och Ekonomi).
Notes are written in Swedish.

Published site: <https://kasiem024.github.io/KTHObsidianQuartz/>

En push till `main` publicerar sidan automatiskt — Quartz-repot hämtar senaste
vault-commit själv, så ingen extra åtgärd behövs.

## Var man börjar

| Fil | Syfte |
| --- | --- |
| `llms.txt` | Ingång för AI-verktyg: struktur, taggar, kurskatalog och hur Obsidian-syntaxen ska tolkas |
| `Meta/Vault Standard.md` | Reglerna: taggar, frontmatter, mappstruktur, namngivning, notstruktur |
| `Meta/Vault Findings & Backlog.md` | Ändringslogg och spårning av avvikelser (F1–F48) |
| `Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1` | Kontrollerar hela vaultet mot standarden |
| `Meta/Obsidian Plugins/Templates/` | Mallar som följer standarden automatiskt |
| `Atlas/Dashboard.md` | Live-översikt (Dataview): MOC:er, terminer, kursindex |
| `Atlas/Vault Health Report.md` | Automatiska kontroller mot standarden |

## Kontrollera vaultet

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"
```

Lägg till `-Detail` för att lista filerna bakom varje avvikelse. Förväntat resultat:
`RESULT: clean - no deviations from the standard.`
