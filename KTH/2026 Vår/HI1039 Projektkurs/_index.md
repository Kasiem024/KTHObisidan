---
title: "HI1039 Projektkurs"
tags: [index, HI1039, KTH, year2026]
description: "Kursindex för HI1039 Projektkurs med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 HI1039 Projektkurs

> [!info] Kursinformation
> - **Kurskod:** HI1039
> - **Termin:** 2026 Vår
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/HI1039

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "KTH/2026 Vår/HI1039 Projektkurs"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "KTH/2026 Vår/HI1039 Projektkurs"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "KTH/2026 Vår/HI1039 Projektkurs"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "KTH/2026 Vår/HI1039 Projektkurs"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "KTH/2026 Vår/HI1039 Projektkurs"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
