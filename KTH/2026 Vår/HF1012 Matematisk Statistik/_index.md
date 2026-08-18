---
tags: [index, HF1012, KTH, year2026]
---
# 📚 HF1012 Matematisk Statistik

> [!info] Kursinformation
> - **Kurskod:** HF1012
> - **Termin:** 2026 Vår
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/HF1012

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "KTH/2026 Vår/HF1012 Matematisk Statistik"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "KTH/2026 Vår/HF1012 Matematisk Statistik"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "KTH/2026 Vår/HF1012 Matematisk Statistik"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "KTH/2026 Vår/HF1012 Matematisk Statistik"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "KTH/2026 Vår/HF1012 Matematisk Statistik"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
