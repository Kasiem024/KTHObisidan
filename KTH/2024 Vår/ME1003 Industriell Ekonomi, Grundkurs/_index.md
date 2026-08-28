---
title: "ME1003 Industriell Ekonomi, Grundkurs"
tags: [index, ME1003, KTH, year2024]
description: "Kursindex för ME1003 Industriell Ekonomi, Grundkurs med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 ME1003 Industriell Ekonomi, Grundkurs

> [!info] Kursinformation
> - **Kurskod:** ME1003
> - **Termin:** 2024 Vår
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/ME1003>

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2024 Vår/ME1003 Industriell Ekonomi, Grundkurs"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2024 Vår/ME1003 Industriell Ekonomi, Grundkurs" OR #ME1003
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2024 Vår/ME1003 Industriell Ekonomi, Grundkurs"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2024 Vår/ME1003 Industriell Ekonomi, Grundkurs"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2024 Vår/ME1003 Industriell Ekonomi, Grundkurs"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
