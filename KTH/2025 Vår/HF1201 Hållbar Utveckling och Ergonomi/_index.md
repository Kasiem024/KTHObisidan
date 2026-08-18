---
title: "HF1201 Hållbar Utveckling och Ergonomi"
tags: [index, HF1201, KTH, year2025]
---
# 📚 HF1201 Hållbar Utveckling och Ergonomi

> [!info] Kursinformation
> - **Kurskod:** HF1201
> - **Termin:** 2025 Vår
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/HF1201

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "KTH/2025 Vår/HF1201 Hållbar Utveckling och Ergonomi"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "KTH/2025 Vår/HF1201 Hållbar Utveckling och Ergonomi"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "KTH/2025 Vår/HF1201 Hållbar Utveckling och Ergonomi"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "KTH/2025 Vår/HF1201 Hållbar Utveckling och Ergonomi"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "KTH/2025 Vår/HF1201 Hållbar Utveckling och Ergonomi"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
