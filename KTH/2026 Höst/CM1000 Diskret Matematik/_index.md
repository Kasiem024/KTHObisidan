---
title: "CM1000 Diskret Matematik"
tags:
  - index
  - CM1000
  - KTH
  - matematik
  - year2026
description: "Kursindex för CM1000 Diskret Matematik med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 CM1000 Diskret Matematik

> [!info] Kursinformation
> - **Kurskod:** CM1000
> - **Termin:** 2026 Höst · Period 2 (start 2026-10-26)
> - **Omfattning:** 8,0 hp
> - **Examination:** TEN1 (5,0 hp), RED1 (3,0 hp)
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/CM1000>

## 📚 Litteratur

- Specialskriven kurslitteratur, kapitel 1–9 (pdf från Canvas), i `Filer/Litteraturlista/`

## 📋 Kursmaterial

Kursens Canvas-material ligger i `Filer/Canvas/` och är avsiktligt utanför git och den
publicerade sidan (upphovsrättsskyddat material). Det är organiserat i `Kursinformation/`
(KursPM, detaljplanering och formelsamling) och `Gamla Tentor/` (kontrollskrivningar,
Fx-skrivningar, tentor och omtentor med lösningar, en mapp per läsår HT2019–HT2025).
Kursboken ligger kapitelvis i `Filer/Litteraturlista/`, som också är gitignorerad.

## 🔗 Länkar

- [[Atlas/2026 MOC|2026 MOC]]
- [[Atlas/Matematik MOC|Matematik MOC]]

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2026 Höst/CM1000 Diskret Matematik"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2026 Höst/CM1000 Diskret Matematik" OR #CM1000
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2026 Höst/CM1000 Diskret Matematik"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2026 Höst/CM1000 Diskret Matematik"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2026 Höst/CM1000 Diskret Matematik"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
