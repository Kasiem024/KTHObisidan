---
title: "CM1005 Extern Redovisning"
tags: [index, CM1005, KTH, year2024]
---
# 📚 CM1005 Extern Redovisning

> [!info] Kursinformation
> - **Kurskod:** CM1005
> - **Termin:** 2024 Vår
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/CM1005

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "KTH/2024 Vår/CM1005 Extern Redovisning"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "KTH/2024 Vår/CM1005 Extern Redovisning"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "KTH/2024 Vår/CM1005 Extern Redovisning"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "KTH/2024 Vår/CM1005 Extern Redovisning"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "KTH/2024 Vår/CM1005 Extern Redovisning"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
