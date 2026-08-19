---
title: "HI1024 Programmering, grundkurs"
tags: [index, HI1024, KTH, year2024]
description: "Kursindex för HI1024 Programmering, grundkurs med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 HI1024 Programmering, grundkurs

> [!info] Kursinformation
> - **Kurskod:** HI1024
> - **Termin:** 2024 Höst
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HI1024>

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2024 Höst/HI1024 Programmering, grundkurs"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2024 Höst/HI1024 Programmering, grundkurs"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2024 Höst/HI1024 Programmering, grundkurs"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2024 Höst/HI1024 Programmering, grundkurs"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2024 Höst/HI1024 Programmering, grundkurs"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
