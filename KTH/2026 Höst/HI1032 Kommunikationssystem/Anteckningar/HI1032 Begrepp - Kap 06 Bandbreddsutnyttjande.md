---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 6 – bandbreddsutnyttjande: multiplexering (FDM, WDM, TDM) och spektrumspridning (FHSS, DSSS)."
---
# HI1032 Begrepp - Kap 06 Bandbreddsutnyttjande

## Multiplexering

**Multiplexering** (multiplexing);;Tekniker som låter ==flera signaler dela en enda länk samtidigt==; en MUX buntar ihop dem och en DEMUX delar upp dem igen.

Vilka tre grundläggande multiplexeringstekniker finns? (3)
||
- **FDM** (frekvensdelning) – dela upp *frekvensband* (analogt)
- **WDM** (våglängdsdelning) – som FDM men för *ljus* i fiber
- **TDM** (tidsdelning) – dela upp *tiden* i tidsluckor (digitalt)

**FDM** (Frequency-Division Multiplexing);;Multiplexering där länkens bandbredd delas i ==olika frekvensband==, ett per signal (analog teknik, t.ex. radio/TV).

**TDM** (Time-Division Multiplexing);;Multiplexering där länken delas i ==tidsluckor==, så att varje anslutning får sända i tur och ordning (digital teknik).

**WDM** (Wavelength-Division Multiplexing);;I princip FDM fast för ==optiska signaler (ljus) i fiber==; olika våglängder kombineras med hjälp av ett prisma.

Vad delar FDM respektive TDM upp länken efter?
||
- **FDM:** delar upp ==frekvensen== – varje kanal får sitt eget frekvensband (alla sänder samtidigt).
- **TDM:** delar upp ==tiden== – varje kanal får sina tidsluckor (de turas om).

## Spektrumspridning

**Spread spectrum** (spektrumspridning);;Att medvetet ==sprida en signal över mer bandbredd än nödvändigt== för att göra den robustare och svårare att avlyssna eller störa.

Vilka två metoder för spektrumspridning finns? (2)
||
- **FHSS** (frequency hopping) – hoppar mellan olika frekvenser över tid
- **DSSS** (direct sequence) – varje bit ersätts med en längre kodsekvens
