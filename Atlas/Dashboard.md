---
tags: [MOC, meta]
description: "Welcome to your structured KTH Vault. This dashboard uses the Dataview plugin to provide live updates of your notes."
---
# 🏛️ Vault Dashboard

Welcome to your structured KTH Vault. This dashboard uses the **Dataview** plugin to provide live updates of your notes.

---

## 🗺️ Maps of Content (MOCs)

- [[Atlas/Programmering MOC|💻 Programmering]]
- [[Atlas/Nätverk MOC|🌐 Nätverk]]
- [[Atlas/Matematik MOC|🔢 Matematik]]
- [[Atlas/Ekonomi MOC|📉 Ekonomi]]
- [[Atlas/Hårdvara MOC|🔌 Hårdvara]]
- [[Atlas/Databaser MOC|🗄️ Databaser]]
- [[Atlas/Samhälle MOC|🌍 Samhälle]]
- [[Atlas/Tenta-prioritering|🎯 Tenta-prioritering]]

---

## 📅 Terminer

- [[Atlas/2026 MOC|📅 2026]]
- [[Atlas/2025 MOC|📅 2025]]
- [[Atlas/2024 MOC|📅 2024]]

---

## 📚 Kursindex

```dataview
TABLE WITHOUT ID link(file.path, regexreplace(file.folder, "^.*/", "")) AS "Kurs", regexreplace(file.folder, "^KTH/([^/]+)/.*", "$1") AS "Termin"
FROM #index AND "KTH"
SORT file.folder DESC
```

---

## 📅 Denna Termin (2026)

```dataview
LIST FROM #year2026
SORT file.mtime DESC
LIMIT 10
```

---

## 📝 Nyligen Uppdaterade

```dataview
TABLE tags, file.mtime AS "Senast ändrad"
SORT file.mtime DESC
LIMIT 10
```

---

## 🎓 Exam Prep (#tenta)

```dataview
LIST FROM #tenta
```

---

## 🛠️ Vault Health

- [[Vault Health Report|🚩 Health Report]]
- **Orphans:** Check the report for notes that need linking!
