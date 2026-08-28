---
title: "HU1801 Industriell Marknadsföring"
tags: [index, HU1801, KTH, year2024]
description: "Kursindex för HU1801 Industriell Marknadsföring med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 HU1801 Industriell Marknadsföring

> [!info] Kursinformation
> - **Kurskod:** HU1801
> - **Termin:** 2024 Vår
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HU1801>

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2024 Vår/HU1801 Industriell Marknadsföring"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2024 Vår/HU1801 Industriell Marknadsföring" OR #HU1801
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2024 Vår/HU1801 Industriell Marknadsföring"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2024 Vår/HU1801 Industriell Marknadsföring"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2024 Vår/HU1801 Industriell Marknadsföring"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
