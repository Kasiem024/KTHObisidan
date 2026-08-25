---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 1 – introduktion: datakommunikationens komponenter, dataflöde, nätverkskriterier, topologier och nätverkstyper."
---
# HI1032 Begrepp - Kap 01 Introduktion

## Datakommunikation

Vilka fem komponenter ingår i datakommunikation? (5)
||
- **Meddelande** (message) – informationen som skickas
- **Avsändare** (sender)
- **Mottagare** (receiver)
- **Överföringsmedium** (transmission medium)
- **Protokoll** (protocol) – reglerna för utbytet

**Protokoll** (i datakommunikation);;En uppsättning ==regler som styr kommunikationen== – en överenskommelse mellan enheterna om *vad*, *hur* och *när* något skickas.

Vilka tre riktningar kan dataflöde (data flow) ha? (3)
||
- **Simplex** – enkelriktat (t.ex. tangentbord → skärm)
- **Halv duplex** – åt båda håll men *växelvis* (t.ex. walkie-talkie)
- **Full duplex** – åt båda håll *samtidigt* (t.ex. telefonsamtal)

**Simplex**;;Dataflöde som är ==helt enkelriktat== – bara en av parterna kan sända.

**Full duplex**;;Dataflöde där båda parter kan ==sända och ta emot samtidigt==.

## Nätverk

Vilka tre kriterier bedömer man ett nätverk efter? (3)
||
- **Prestanda** (performance) – t.ex. genomströmning och fördröjning
- **Tillförlitlighet** (reliability) – hur ofta och länge det fallerar
- **Säkerhet** (security) – skydd mot obehörig åtkomst

Vilka fyra fysiska topologier finns? (4)
||
- **Mesh** (masknät)
- **Stjärna** (star)
- **Buss** (bus)
- **Ring**

**Mesh-topologi**;;Ett nät där ==varje enhet har en egen länk till varje annan== – mycket robust, men kräver väldigt många kablar.

**Stjärntopologi** (star);;Ett nät där varje enhet har en länk till en ==central hubb/switch==; enkelt att felsöka men beroende av den centrala noden.

Vad skiljer ett LAN från ett WAN?
||
- **LAN** (Local Area Network): ==begränsat område== (t.ex. byggnad), hög hastighet, oftast privat ägt.
- **WAN** (Wide Area Network): ==stora avstånd== (städer/länder), lägre hastighet, ofta hyrt eller delat.

Vad skiljer kretskoppling från paketförmedling?
||
- **Kretskoppling:** en *dedikerad väg* reserveras under hela samtalet (klassisk telefoni).
- **Paketförmedling:** data delas i ==paket som skickas oberoende== och delar nätet (internet).
