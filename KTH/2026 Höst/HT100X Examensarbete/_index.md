---
title: "HT100X Examensarbete"
tags: [index, HT100X, programmering, KTH, year2026]
description: "Kursindex för HT100X Examensarbete med tidsplan, obligatoriska moment, seminarier och kursmaterial."
---
# 📚 HT100X Examensarbete

> [!info] Kursinformation
> - **Kurskod:** HT100X
> - **Termin:** 2026 Höst · Period 2 (start 2026-10-26)
> - **Program:** Teknik och Ekonomi, inriktning datateknik (TITEH-TIDA)
> - **Examinator:** Anders Lindström (`anderslm@kth.se`)
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/HT100X>
> - **Särskild behörighet:** minst **150 hp** ur programmets utbildningsplan, bestående av
>   helt avslutade kurser, samt kurser som anses relevanta för examensarbetet. Om
>   uppgiftsförslaget är godkänt innan slutet av period 1 under den sjätte terminen gäller
>   minst **135 hp**.
> - **Ämnestagg för kursens noter:** `programmering`

## ⚠️ Generativ AI

> [!warning] Reglerna gäller från första dagen
> - Rapportens text ska vara **skriven av dig**, utifrån egna kunskaper. Språkmodeller får
>   endast användas för **språklig förbättring av text du själv skrivit**.
> - Generativ AI får **inte** användas för den nya tekniska lösningen eller arbetets
>   huvudmål, och **inte** för att ta fram uppgiften. Stödverktyg för sekundära moment
>   (t.ex. testbädd) *kan* tillåtas.
> - All användning måste **godkännas i förväg** av handledare, och redovisas **explicit i
>   rapporten**. Du ansvarar fullt ut för att verifierad genererad kod är korrekt.
> - Odeklarerad eller otillåten användning kan anmälas som **vilseledande vid examination**
>   och leda till underkännande.
> - Det är **förbjudet** att ladda upp andra studenters rapporter till externa
>   språkmodeller — gäller även kamratgranskning och opposition.
>
> Källa: `Filer/Canvas/Generativ AI i examensarbetet.md`. Ta upp din planerade
> AI-användning med Anders Lindström **innan** arbetet börjar.

## 🗓️ Tidsplan och obligatoriska moment

Exakta datum står på kursens Canvas-sida och i `Filer/Canvas/Detaljplan Examensarbete
HE111X, HI111X, HT100X, HT101X.pdf` — fyll i dem här när de är kända. Ordningen nedan är
hämtad från kursmaterialet.

| # | Moment | Krav | Datum |
| --- | --- | --- | --- |
| 1 | Söka uppgift | Rekommenderat i par om två, på uppdrag av företag eller forskargrupp | |
| 2 | Förstudie | Krävs alltid, för att kartlägga kunskapsläget | |
| 3 | Förslag godkänt | Blankett till Anders Lindström; examinator registrerar kursen | |
| 4 | Seminarium 1 | Vetenskaplig metod (digitalt) | |
| 5 | Seminarium 2 | Hitta källor och referenshantering — **skapa Zotero-konto i förväg** | |
| 6 | Seminarium 3 + 4 | Rapportskrivning och gensvarsseminarium (kamratgranskning) | |
| 7 | Handledning | Löpande, **minst en gång i veckan** | |
| 8 | Steg 1: handledare | Handledaren avgör om rapporten håller nivå för examinator — räkna med **flera revideringar** | |
| 9 | Steg 2: examinator | Formell bedömning; ytterligare revideringar kan krävas | |
| 10 | Opposition | Kamratgranskning av annan students rapport | |
| 11 | Inlämning + DiVA | Slutdatum meddelas på kursens hemsida | |

> [!tip] Formkrav på rapporten
> - **Max 60 sidor** totalt (försättsblad till sista sida), **max 40 sidor** huvudkapitel
>   (inledning till och med slutsats). Fler sidor kräver handledarens godkännande.
> - Måste följa kursens **mall** för struktur och grafisk profil (`Filer/Canvas/Mallexamensarbete2026.docx`).
> - Referenssystem: **Vancouver**.
> - Skriven på god svenska eller engelska, med referenser till aktuell forskning och en
>   diskussion om teknikens samhälleliga, miljömässiga och mänskliga konsekvenser.

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
