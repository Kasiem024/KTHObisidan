---
title: "HT100X Examensarbete"
tags: [index, HT100X, KTH, year2026]
description: "Kursindex för HT100X Examensarbete med seminarier, anteckningar och kursmaterial."
---
# 📚 HT100X Examensarbete

> [!info] Kursinformation
> - **Kurskod:** HT100X
> - **Termin:** 2026 Höst
> - **Program:** Teknik och Ekonomi, inriktning datateknik (TITEH-TIDA)
> - **Examinator:** Anders Lindström (`anderslm@kth.se`)
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HT100X>
> - **Särskild behörighet:** minst **150 hp** ur programmets utbildningsplan, bestående av
>   helt avslutade kurser, samt kurser som anses relevanta för examensarbetet. Om
>   uppgiftsförslaget är godkänt innan slutet av period 1 under den sjätte terminen gäller
>   minst **135 hp**.

## 📋 Kursmaterial

Kursens Canvas-material ligger i `Filer/Canvas/` och är avsiktligt utanför git och den
publicerade sidan: mappen innehåller andra studenters examensrapporter och KTH-personals
kontaktuppgifter. Där finns bland annat rapportmall, betygskriterier, detaljplan,
oppositionsprotokoll, kontrollista för rapporten och seminariematerial.

## 🔗 Länkar

- [[Atlas/2026 MOC|2026 MOC]]

## 📅 Seminarier & föreläsningar

```dataview
LIST
FROM "KTH/2026 Höst/HT100X Examensarbete"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion") OR contains(tags, "seminarium")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2026 Höst/HT100X Examensarbete"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2026 Höst/HT100X Examensarbete"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2026 Höst/HT100X Examensarbete"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2026 Höst/HT100X Examensarbete"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
