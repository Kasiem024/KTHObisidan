---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
description: "Används av routingprotokoll (som OSPF) för att räkna ut den billigaste vägen från en router till alla andra punkter i nätverket."
created: 2026-05-28
updated: 2026-05-28
---
# Dijkstras algoritm

> **Lager:** OSI 3 (Routing)
> **Mål:** Hitta kortaste vägen i en graf.

---

## Definition
Används av routingprotokoll (som [[OSPF]]) för att räkna ut den billigaste vägen från en router till alla andra punkter i nätverket.

### Stegen (Praktiskt för tentan)
1. Markera startnoden som permanent (kostnad 0).
2. Uppdatera kostnaden till alla dess grannar.
3. Välj den nod i hela grafen som har **lägst tillfällig kostnad**.
4. Markera den som permanent.
5. Upprepa tills alla noder är permanenta.

## Tenta-fokus
- **Vanlig uppgift:** Du får en ritad graf och ska fylla i en tabell steg-för-steg. 
- **Tips:** Glöm inte att räkna den *ackumulerade* kostnaden från startnoden, inte bara vikten på den senaste länken.

## Kopplat till
- **Protokoll:** [[OSPF]]
- **Teori:** [[Graf-representationer]] (HI1029)

## Flashcards

Vilken nod väljer man alltid att permanenta härnäst i Dijkstras algoritm?:: Den nod som för tillfället har den allra lägsta totala kostnaden från startnoden.

Vad är startvärdet för kostnaden till alla noder utom startnoden?:: Oändligheten ($\infty$).
