---
tags: [meta]
description: "Live checks against Meta/Vault Standard.md. Anything listed below is drift that needs"
---
# 🚩 Vault Health Report

Live checks against `Meta/Vault Standard.md`. Anything listed below is drift that needs
fixing — an empty section means healthy. Known open issues live in
`Meta/Vault Findings & Backlog.md`.

**Out of scope** (excluded from every query below, per the standard):
`_index.md` (generated), `**/Litteraturlista/**` (course literature + conversions),
`*.ai.md` / `*.opt.md` (book text dumps), **Excalidraw-ritningar** (`#excalidraw` —
specialfiler som inte är egna anteckningar), and `Ericsson/` (work notes, not studies).

> Samma kontroller kan köras utanför Obsidian med
> `Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1`.

## 🏷️ Kursanteckningar utan ämnestagg
Ska ha minst en av: programmering, nätverk, matematik, ekonomi, hårdvara, databaser,
samhälle, säkerhet.
```dataview
LIST
FROM "KTH" AND !#excalidraw
WHERE file.name != "_index"
  AND !contains(file.folder, "Litteraturlista")
  AND !contains(file.name, ".ai")
  AND !contains(file.name, ".opt")
  AND !contains(file.name, ".excalidraw")
  AND !any(list("programmering", "nätverk", "matematik", "ekonomi", "hårdvara", "databaser", "samhälle", "säkerhet"), (s) => contains(tags, s))
SORT file.folder ASC
```

## 🧩 Kursanteckningar utan typtagg
Ska ha en av: begrepp, föreläsning, lektion, övning, labb, seminarium, studieguide,
tenta, övrigt.
```dataview
LIST
FROM "KTH" AND !#excalidraw
WHERE file.name != "_index"
  AND !contains(file.folder, "Litteraturlista")
  AND !contains(file.name, ".ai")
  AND !contains(file.name, ".opt")
  AND !contains(file.name, ".excalidraw")
  AND !any(list("begrepp", "föreläsning", "lektion", "övning", "labb", "seminarium", "studieguide", "tenta", "övrigt"), (t) => contains(tags, t))
SORT file.folder ASC
```

## 🎓 Anteckningar utan KTH-tagg
```dataview
LIST
FROM "KTH" AND !#excalidraw
WHERE !contains(tags, "KTH")
  AND !contains(file.folder, "Litteraturlista")
  AND !contains(file.name, ".ai")
  AND !contains(file.name, ".opt")
  AND !contains(file.name, ".excalidraw")
SORT file.folder ASC
```

## 📅 Studieanteckningar utan created/updated
Navigationsfiler (`_index`, MOC:er, Dashboard) ska medvetet **inte** ha datum.
```dataview
LIST
FROM "KTH" AND !#excalidraw
WHERE (!created OR !updated)
  AND file.name != "_index"
  AND !contains(file.folder, "Litteraturlista")
  AND !contains(file.name, ".ai")
  AND !contains(file.name, ".opt")
  AND !contains(file.name, ".excalidraw")
SORT file.folder ASC
```

## 🧱 Anteckningar utan H1-rubrik
```dataview
LIST
FROM "KTH" AND !#excalidraw
WHERE file.name != "_index"
  AND !contains(file.folder, "Litteraturlista")
  AND !contains(file.name, ".ai")
  AND !contains(file.name, ".opt")
  AND !contains(file.name, ".excalidraw")
  AND !any(file.headings, (h) => h.level = 1)
SORT file.folder ASC
```

## 🕸️ Orphans — anteckningar utan inlänkar
Kandidater för att länkas in i en MOC eller ett kursindex.
```dataview
LIST
FROM "KTH" AND !#excalidraw
WHERE length(file.inlinks) = 0
  AND file.name != "_index"
  AND !contains(file.folder, "Litteraturlista")
  AND !contains(file.name, ".ai")
  AND !contains(file.name, ".opt")
  AND !contains(file.name, ".excalidraw")
SORT file.folder ASC
LIMIT 50
```

## 🔗 Trasiga länkar
```dataview
TABLE WITHOUT ID file.link AS "Anteckning", length(filter(file.outlinks, (l) => !l.file)) AS "Trasiga"
FROM ("KTH" OR "Atlas") AND !#excalidraw
WHERE any(file.outlinks, (l) => !l.file)
  AND !contains(file.name, ".excalidraw")
SORT file.folder ASC
```

## 📊 Antal anteckningar per kurs
```dataview
TABLE WITHOUT ID Kurs, length(rows) AS "Antal"
FROM "KTH" AND !#excalidraw
WHERE file.name != "_index"
  AND !contains(file.name, ".excalidraw")
GROUP BY regexreplace(file.folder, "^KTH/[^/]+/([^/]+).*", "$1") AS Kurs
SORT length(rows) DESC
```
