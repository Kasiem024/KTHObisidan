---
tags: [MOC, meta]
description: "Vilka begrepp som återkommer oftast i vaultets frågeuppsättningar, som underlag för vad Tenta-fokus bör skrivas för först."
created: 2026-08-19
updated: 2026-08-19
---
# 🎯 Tenta-prioritering

Vilka begrepp som återkommer i flest **frågeuppsättningar** (instuderingsfrågor, KS- och
tentanoteringar). Tanken är att ge en prioriteringsordning för vilka begrepp som är värda
att skriva ett `## Tenta-fokus` till först.

Just nu har **42 av 352** begreppsnoter ett `## Tenta-fokus`, medan **225** begrepp som
faktiskt refereras från frågeuppsättningar saknar ett.

## Så räknas det — och vad siffran inte betyder

Läs siffran som *"hur brett begreppet är täckt av frågematerialet"*, inte som
*"hur många poäng det ger på tentan"*.

- Räknar antalet **distinkta** noter som länkar till begreppet och som är taggade `tenta`
  eller heter `Instuderingsfrågor…` / innehåller `KS1–KS4`, `TENA` eller `Ten Del`.
- Spannet är litet, **1 till 7**, så det skiljer trubbigt: 94 begrepp har exakt 1 och 114
  har exakt 2. Skillnaden mellan 6 och 7 är inte meningsfull, men skillnaden mellan 1 och
  6 är det.
- Räknar **länkar**, inte innehåll. Ett begrepp som diskuteras i en frågeuppsättning utan
  att länkas syns inte här.
- Begrepp går på tvären mellan kurser: flera CM1005-begrepp räknas upp av ME1003:s
  frågeuppsättningar, eftersom redovisning examineras även där.
- Tabellerna är en **ögonblicksbild från 2026-08-19**. Dataview-listan längst ner är den
  levande varianten.

> [!tip] Vilka frågeuppsättningar det gäller
> Öppna begreppet och titta på **inlänkarna** (Backlinks i Obsidian, och i högerspalten på
> den publicerade sidan). Där listas exakt vilka noter som refererar begreppet, så den
> informationen upprepas inte här.

## CM1005 Extern Redovisning

70 begrepp saknar `Tenta-fokus`; dessa 32 refereras av minst tre frågeuppsättningar.

| Begrepp | Frågeuppsättningar |
| --- | --- |
| [[Intäkt]] | 7 |
| [[Kostnad]] | 7 |
| [[Resultaträkning]] | 7 |
| [[Aktiebolag]] | 6 |
| [[Balansräkning]] | 4 |
| [[Eget Kapital]] | 4 |
| [[Inbetalning]] | 4 |
| [[Inkomst]] | 4 |
| [[Räkenskapsår]] | 4 |
| [[Tillgångar]] | 4 |
| [[Utbetalning]] | 4 |
| [[Utgift]] | 4 |
| [[Affärshändelse]] | 3 |
| [[Anläggningstillgångar]] | 3 |
| [[Årsbokslut]] | 3 |
| [[Årsredovisning]] | 3 |
| [[Årsredovisningslagen]] | 3 |
| [[Bokföringslagen]] | 3 |
| [[Bundet Eget Kapital]] | 3 |
| [[Ekonomisk Förening]] | 3 |
| [[Factoring]] | 3 |
| [[Försiktighetsprincipen]] | 3 |
| [[Förvaltningsberättelse]] | 3 |
| [[Grundbok]] | 3 |
| [[Handelsbolag]] | 3 |
| [[Huvudbok]] | 3 |
| [[Koncernredovisning]] | 3 |
| [[Leasing]] | 3 |
| [[Likviditet]] | 3 |
| [[Omsättningstillgångar]] | 3 |
| [[Räntabilitet]] | 3 |
| [[Verifikation]] | 3 |

## ME1003 Industriell Ekonomi

122 begrepp saknar `Tenta-fokus`; dessa 24 refereras av minst tre frågeuppsättningar.

| Begrepp | Frågeuppsättningar |
| --- | --- |
| [[Kassaflödesanalys]] | 6 |
| [[Kalkylränta]] | 5 |
| [[Lönsamhet]] | 5 |
| [[Värdeerbjudandet]] | 5 |
| [[Ekonomisk Livslängd]] | 4 |
| [[Internräntemetoden]] | 4 |
| [[Nuvärdemetoden]] | 4 |
| [[Nyemission]] | 4 |
| [[Värdeskapandet]] | 4 |
| [[Affärsidé]] | 3 |
| [[Annuitetsmetoden]] | 3 |
| [[Återbetalningsmetoden]] | 3 |
| [[Bokslutsdisposition]] | 3 |
| [[DuPont-Schema]] | 3 |
| [[Fondemission]] | 3 |
| [[Grundinvestering]] | 3 |
| [[Investering]] | 3 |
| [[Investeringskalkylering]] | 3 |
| [[Marknadsföring]] | 3 |
| [[Nyckeltal]] | 3 |
| [[Överavskrivning]] | 3 |
| [[Resurstransformation]] | 3 |
| [[Soliditet]] | 3 |
| [[Värdefångsten]] | 3 |

## Övriga kurser

- **HH1802 Finansiering och Organisationsteori** — 29 begrepp saknar `Tenta-fokus`, men
  inget når tre frågeuppsättningar. De högsta ligger på två:
  [[Resultatprognos]], [[PE-Tal]], [[Rörelsekapital]], [[Riktad Emission]],
  [[Finansiell Plan]].
- **HI1029 Algoritmer och Datastrukturer** (23) och **HE1033 Kommunikationsnät** (20) har
  begrepp som refereras från tentamaterial, men bara enstaka gånger var — dessa kurser har
  studieguider snarare än frågeuppsättningar.

## Levande lista (Obsidian)

Ögonblicksbilden ovan blir inaktuell. Den här frågan visar i stället begreppsnoter utan
`Tenta-fokus` sorterade på antal inlänkar just nu. Observera att den räknar **alla**
inlänkar, inte bara frågeuppsättningar, så ordningen skiljer sig från tabellerna.

```dataview
TABLE WITHOUT ID file.link AS "Begrepp", length(file.inlinks) AS "Inlänkar"
FROM #begrepp AND !#excalidraw
WHERE !contains(file.headings.heading, "Tenta-fokus")
SORT length(file.inlinks) DESC
LIMIT 40
```

## Att göra

Skriv `## Tenta-fokus` i begreppen ovanifrån och nedåt. Placeringen är efter
`## Definition` och före `## Kopplat till`, enligt `Meta/Vault Standard.md`. Ett tomt
avsnitt är helt i sin ordning — det döljs automatiskt på den publicerade sidan.
