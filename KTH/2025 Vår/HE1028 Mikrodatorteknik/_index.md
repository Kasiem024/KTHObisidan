---
title: "HE1028 Mikrodatorteknik"
tags: [index, HE1028, KTH, year2025]
---
# 📚 HE1028 Mikrodatorteknik

> [!info] Kursinformation
> - **Kurskod:** HE1028
> - **Termin:** 2025 Vår
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/HE1028

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "KTH/2025 Vår/HE1028 Mikrodatorteknik"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "KTH/2025 Vår/HE1028 Mikrodatorteknik"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "KTH/2025 Vår/HE1028 Mikrodatorteknik"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "KTH/2025 Vår/HE1028 Mikrodatorteknik"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "KTH/2025 Vår/HE1028 Mikrodatorteknik"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
