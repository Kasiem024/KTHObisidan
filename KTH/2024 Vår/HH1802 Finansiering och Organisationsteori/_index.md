---
title: "HH1802 Finansiering och Organisationsteori"
tags: [index, HH1802, KTH, year2024]
description: "Kursindex för HH1802 Finansiering och Organisationsteori med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 HH1802 Finansiering och Organisationsteori

> [!info] Kursinformation
> - **Kurskod:** HH1802
> - **Termin:** 2024 Vår
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HH1802>

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2024 Vår/HH1802 Finansiering och Organisationsteori"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2024 Vår/HH1802 Finansiering och Organisationsteori" OR #HH1802
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2024 Vår/HH1802 Finansiering och Organisationsteori"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2024 Vår/HH1802 Finansiering och Organisationsteori"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2024 Vår/HH1802 Finansiering och Organisationsteori"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
