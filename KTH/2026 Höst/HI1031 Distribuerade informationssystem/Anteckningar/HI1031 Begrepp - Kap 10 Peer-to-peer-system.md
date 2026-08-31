---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-08-31
description: "Flashcards HI1031 kap 10 – peer-to-peer: overlay-nät, routing overlay, DHT samt strukturerade kontra ostrukturerade nät."
---
# HI1031 Begrepp - Kap 10 Peer-to-peer-system

Vad är målet med peer-to-peer-system?::Att dela data och resurser i ==mycket stor skala genom att utnyttja vanliga datorer "vid nätets kanter"==, utan separat hanterade servrar.

**Overlay-nätverk** (i P2P);;Ett *virtuellt nät* av noder ==byggt ovanpå internet==, med egna regler för hur noder kopplas ihop och hur meddelanden vägleds.

**Routing overlay**;;Ett overlay som ==vägleder en förfrågan till den nod som ansvarar för ett visst objekt==, utifrån objektets identifierare.

**DHT** (Distributed Hash Table);;En struktur som ==sprider (nyckel, värde)-par över många noder== och låter vilken nod som helst hitta rätt ansvarig nod på få steg.

**GUID** (Globally Unique Identifier);;En ==platsoberoende, unik identifierare== för ett objekt eller en nod, ofta framtagen genom att hasha innehållet.

Vad skiljer strukturerade från ostrukturerade peer-to-peer-nät?
||
- **Strukturerat:** noder och data placeras enligt en bestämd struktur (t.ex. DHT) → ==garanterad och effektiv uppslagning==, men dyrt att underhålla.
- **Ostrukturerat:** noder kopplas ad hoc → enkelt och robust, men uppslagning sker via *sökning/flooding* ==utan garantier==.

Vad var utmärkande för Napster som tidigt P2P-system?::Filerna delades direkt mellan användarna, men ==ett centralt index== höll reda på vem som hade vad – vilket blev dess svaga punkt.

Vilken typ av data passar P2P-system bäst för?::Stora mängder ==oföränderlig (immutable) data==; de passar sämre för data som ändras ofta, på grund av konsistensproblemen.
