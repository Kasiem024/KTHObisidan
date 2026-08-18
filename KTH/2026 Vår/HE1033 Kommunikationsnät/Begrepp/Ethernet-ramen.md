---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
description: "Den standardiserade PDU (Protocol Data Unit) som används i trådbundna lokalnät."
created: 2026-05-28
updated: 2026-05-28
---
# Ethernet-ramen

> **Lager:** OSI 2 (Datalänk)
> **Storlek:** 64 till 1518 byte.

---

## Definition
Den standardiserade PDU (Protocol Data Unit) som används i trådbundna lokalnät.

## Tenta-fokus
- **Minimistorlek:** 64 byte. Varför? För att sändningen ska ta tillräckligt lång tid så att sändaren hinner upptäcka en kollision i andra änden av kabeln ([[CSMA-CD och CSMA-CA]]).
- **Beståndsdelar:** Preamble (synk), Dest/Source [[MAC-adress]], Typ/Längd, Data och FCS (felkontroll).

## Kopplat till
- **Adressering:** [[MAC-adress]]
- **Metod:** [[CSMA-CD och CSMA-CA]]

## Flashcards

Vad är den minsta tillåtna storleken på en Ethernet-ram?:: 64 byte.

Vad händer om data som ska skickas är mindre än 46 byte?:: Den "paddas" (fylls ut) med extra bitar för att nå minimigränsen för ramen.
