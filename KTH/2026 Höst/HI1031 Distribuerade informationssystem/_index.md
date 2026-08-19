---
title: "HI1031 Distribuerade informationssystem"
tags: [index, HI1031, KTH, databaser, programmering, year2026]
description: "Kursindex för HI1031 Distribuerade informationssystem med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 HI1031 Distribuerade informationssystem

> [!info] Kursinformation
> - **Kurskod:** HI1031
> - **Termin:** 2026 Höst · Period 1 (start 2026-08-24)
> - **Omfattning:** 7,5 hp
> - **Examination:** RED1 (3,0 hp), LABA (4,5 hp)
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HI1031>

## 📚 Litteratur

- *Distributed Systems: Concepts and Design* (5:e uppl.), Coulouris, Dollimore, Kindberg & Blair
	- **ISBN-13:** 978-0273760597

## 🔗 Länkar

- [[Atlas/2026 MOC|2026 MOC]]
- [[Atlas/Databaser MOC|Databaser MOC]]
- [[Atlas/Programmering MOC|Programmering MOC]]

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2026 Höst/HI1031 Distribuerade informationssystem"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2026 Höst/HI1031 Distribuerade informationssystem"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2026 Höst/HI1031 Distribuerade informationssystem"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2026 Höst/HI1031 Distribuerade informationssystem"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2026 Höst/HI1031 Distribuerade informationssystem"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
