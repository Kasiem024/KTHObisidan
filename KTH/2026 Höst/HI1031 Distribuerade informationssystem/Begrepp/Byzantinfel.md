---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Begrepp: godtyckligt (Byzantine) fel (HI1031)."
---
# Byzantinfel

## Definition

Den *värsta* feltypen: en komponent beter sig ==helt oförutsägbart== och kan skicka felaktiga värden eller "ljuga", inte bara sluta svara. Metafor: en förrädisk general som ger olika order till olika mottagare. Svårast att hantera eftersom man inte kan lita på något komponenten säger.

## Kopplat till

- [[Konsensus]]

## Flashcards

**Godtyckligt fel** (Byzantine);;Den *värsta* feltypen: en komponent beter sig ==helt oförutsägbart== och kan skicka felaktiga värden, inte bara sluta svara.

Varför är Byzantine-fel svårast att hantera?::För att komponenten kan ==skicka felaktig information== – man kan inte lita på *något* den säger, till skillnad från en krasch som bara är tystnad.
