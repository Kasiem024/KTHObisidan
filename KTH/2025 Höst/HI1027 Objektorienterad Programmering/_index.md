---
tags: [index, HI1027, KTH, year2025]
---
# 📚 HI1027 Objektorienterad Programmering

> [!info] Kursinformation
> - **Kurskod:** HI1027
> - **Termin:** 2025 Höst
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/HI1027

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "KTH/2025 Höst/HI1027 Objektorienterad Programmering"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "KTH/2025 Höst/HI1027 Objektorienterad Programmering"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "KTH/2025 Höst/HI1027 Objektorienterad Programmering"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "KTH/2025 Höst/HI1027 Objektorienterad Programmering"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "KTH/2025 Höst/HI1027 Objektorienterad Programmering"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
