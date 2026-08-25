---
title: "Kvalitetskoll"
tags: [meta, KTH]
description: "Automatisk översikt över anteckningar som saknar enhetlig metadata."
created: 2026-08-24
updated: 2026-08-24
---
# ✅ Kvalitetskoll — enhetlighet

> [!note] Automatisk lista
> Visar anteckningar under `KTH/` som saknar enhetlig metadata. Åtgärda posterna så håller sig valvet uniformt. (Kräver Dataview.)

## 📝 Saknar beskrivning (description)

```dataview
TABLE file.folder AS "Mapp", tags AS "Taggar"
FROM "KTH"
WHERE file.name != "_index" AND file.name != this.file.name AND (!description OR description = "")
SORT file.folder ASC, file.name ASC
```

## 🏷️ Saknar taggar

```dataview
TABLE file.folder AS "Mapp"
FROM "KTH"
WHERE file.name != "_index" AND file.name != this.file.name AND (!tags OR length(tags) = 0)
SORT file.folder ASC, file.name ASC
```

## 🕓 Saknar created eller updated

```dataview
TABLE created, updated
FROM "KTH"
WHERE file.name != "_index" AND file.name != this.file.name AND (!created OR !updated)
SORT file.folder ASC, file.name ASC
```

## 🔢 Antal anteckningar per kurs

```dataview
TABLE length(rows) AS "Antal noter"
FROM "KTH"
WHERE file.name != "_index" AND file.name != this.file.name
GROUP BY file.folder
SORT file.folder ASC
```
