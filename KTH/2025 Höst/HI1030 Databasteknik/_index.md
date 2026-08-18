---
title: "HI1030 Databasteknik"
tags: [index, HI1030, KTH, year2025]
---
# 📚 HI1030 Databasteknik

> [!info] Kursinformation
> - **Kurskod:** HI1030
> - **Termin:** 2025 Höst
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/HI1030

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "KTH/2025 Höst/HI1030 Databasteknik"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "KTH/2025 Höst/HI1030 Databasteknik"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "KTH/2025 Höst/HI1030 Databasteknik"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "KTH/2025 Höst/HI1030 Databasteknik"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "KTH/2025 Höst/HI1030 Databasteknik"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
