---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 15 – trådlösa LAN: IEEE 802.11 (BSS/ESS), CSMA/CA, dolda stationen, RTS/CTS och Bluetooth."
---
# HI1032 Begrepp - Kap 15 Trådlösa LAN

Vilka två byggstenar bygger IEEE 802.11 (WiFi) sitt nät av? (2)
||
- **BSS** (Basic Service Set) – en grupp stationer, oftast kring en accesspunkt (AP)
- **ESS** (Extended Service Set) – flera BSS ihopkopplade via ett distributionssystem

**BSS** (Basic Service Set);;Grundbyggstenen i ett WiFi-nät: ==en grupp trådlösa stationer==, oftast anslutna till en *accesspunkt (AP)*.

Varför använder trådlösa LAN CSMA/CA i stället för CSMA/CD?::För att en trådlös station ==inte kan lyssna och sända samtidigt== och därför inte kan upptäcka kollisioner – i stället försöker den *undvika* dem.

**Dolda stationen-problemet** (hidden station);;När två stationer ==inte hör varandra== (är utom räckhåll) men båda når accesspunkten, så att deras sändningar kolliderar där utan att de märker det.

Hur försöker WiFi lösa problemet med dolda stationer?::Med ==RTS/CTS-handskakning== – stationen ber om ordet (Request To Send) och får klartecken (Clear To Send) som hörs av alla nära accesspunkten.

**Bluetooth**;;En trådlös teknik för ==korta avstånd== som kopplar ihop enheter i små nät (*piconet*), t.ex. telefon och hörlurar.
