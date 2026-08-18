---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# CSMA-CD och CSMA-CA

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

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

Vad står CA för i CSMA/CA?:: Collision Avoidance.
