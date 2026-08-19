---
title: "HE1033 Kommunikationsnät"
tags: [index, HE1033, KTH, year2026]
description: "Kursindex för HE1033 Kommunikationsnät med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 HE1033 Kommunikationsnät

> [!info] Kursinformation
> - **Kurskod:** HE1033
> - **Termin:** 2026 Vår
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HE1033>

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2026 Vår/HE1033 Kommunikationsnät"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2026 Vår/HE1033 Kommunikationsnät"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2026 Vår/HE1033 Kommunikationsnät"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2026 Vår/HE1033 Kommunikationsnät"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2026 Vår/HE1033 Kommunikationsnät"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
