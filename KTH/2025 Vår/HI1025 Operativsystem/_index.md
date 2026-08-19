---
title: "HI1025 Operativsystem"
tags: [index, HI1025, KTH, year2025]
description: "Kursindex för HI1025 Operativsystem med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 HI1025 Operativsystem

> [!info] Kursinformation
> - **Kurskod:** HI1025
> - **Termin:** 2025 Vår
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HI1025>

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2025 Vår/HI1025 Operativsystem"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2025 Vår/HI1025 Operativsystem"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2025 Vår/HI1025 Operativsystem"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2025 Vår/HI1025 Operativsystem"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2025 Vår/HI1025 Operativsystem"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
