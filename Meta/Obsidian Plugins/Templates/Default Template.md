<%*
const k = tp.user.kursinfo(tp);
const datum = tp.date.now("YYYY-MM-DD");
const amneArr = k.hasSubjects ? k.subjects : (k.hasCourse ? [await tp.system.prompt("Ämne (t.ex. programmering / nätverk)")] : []);
const taggar = ["övrigt", k.kurskod, ...amneArr, "KTH", "year" + k.year].filter(Boolean);
const bas = [k.kurskod, k.kursnamn].filter(Boolean).join(" ");
const beskrivning = bas ? `${bas} – ${tp.file.title}` : tp.file.title;
-%>
---
tags: [<% taggar.join(", ") %>]
description: "<% beskrivning %>"
created: <% datum %>
updated: <% datum %>
---
# <% tp.file.title %>
