---
title: "HF1005 Informationsteknik och ingenjörsmetodik"
tags: [index, HF1005, KTH, year2024]
description: "Kursindex för HF1005 Informationsteknik och ingenjörsmetodik med föreläsningar, begrepp, anteckningar och kursmaterial."
---
# 📚 HF1005 Informationsteknik och ingenjörsmetodik

> [!info] Kursinformation
> - **Kurskod:** HF1005
> - **Termin:** 2024 Höst
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HF1005>

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "KTH/2024 Höst/HF1005 Informationsteknik och ingenjörsmetodik"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "KTH/2024 Höst/HF1005 Informationsteknik och ingenjörsmetodik"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "KTH/2024 Höst/HF1005 Informationsteknik och ingenjörsmetodik"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "KTH/2024 Höst/HF1005 Informationsteknik och ingenjörsmetodik"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "KTH/2024 Höst/HF1005 Informationsteknik och ingenjörsmetodik"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
