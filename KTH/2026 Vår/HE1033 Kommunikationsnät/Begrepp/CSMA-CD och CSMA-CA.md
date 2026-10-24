---
tags:
  - begrepp
  - HE1033
  - HI1032
  - KTH
  - nätverk
  - year2026
  - nosr
description: Metoder för att bestämma när en enhet får sända data.
created: 2026-05-28
updated: 2026-05-28
---
# CSMA-CD och CSMA-CA

> **Lager:** OSI 2 (MAC)
> **Mål:** Hantera åtkomst till ett delat medium (kollisionshantering).

---

## Definition

Metoder för att bestämma när en enhet får sända data.

- **CSMA/CD (Collision Detection):** Används i trådbundet Ethernet. Lyssnar medan den sänder. Vid kollision: avbryt, skicka "jam signal", vänta slumpmässig tid.
- **CSMA/CA (Collision Avoidance):** Används i trådlöst Wifi. Försöker undvika kollisioner helt genom att lyssna (Carrier Sense) och använda tidsluckor (IFS). Kan använda RTS/CTS.

## Tenta-fokus

- **Varför inte CD i Wifi?** Trådlösa sändare kan sällan höra en kollision samtidigt som de sänder ("Half-duplex" begränsning och Hidden Node Problem).

## Kopplat till

- **Underlager:** [[LLC och MAC]]
- **Format:** [[Ethernet-ramen]]

## Flashcards

Vad gör en enhet vid en kollision i CSMA/CD?:: Den avbryter sändningen direkt och väntar en slumpmässig tid (Binary Exponential Backoff) innan nytt försök.
<!--SR:!fsrs,2026-10-15T16:18:22.721Z,0,1.2931,5.11217071,1,1,0,0,2026-10-15T16:12:22.721Z-->

Vad står CA för i CSMA/CA?:: Collision Avoidance.
