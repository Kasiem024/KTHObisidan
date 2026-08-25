---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 9 – datalänklagret: nod-till-nod, delskikten DLC/MAC, MAC-adress, ARP och länktyper."
---
# HI1032 Begrepp - Kap 09 Introduktion till datalänklagret

Vilken leveransomfattning har datalänklagret?::==Nod-till-nod== – det levererar en ram till *nästa* nod (värd eller router) längs vägen.

Vilka två delskikt (sublayers) delas datalänklagret in i? (2)
||
- **DLC** (Data Link Control) – ramning samt flödes- och felkontroll
- **MAC** (Media Access Control) – styr *hur* noder delar på mediet

**Ram** (frame);;Datalänklagrets dataenhet – ett ==paket från nätverkslagret inkapslat med adressinformation== (avsändare och mottagare) och ofta felkontroll.

**MAC-adress** (fysisk adress);;En ==unik, fast adress som identifierar ett nätverkskort== (48 bitar i Ethernet); används för nod-till-nod-leverans inom en länk.

**ARP** (Address Resolution Protocol);;Ett protokoll som ==översätter en IP-adress till motsvarande MAC-adress== inom ett lokalt nät.

Vad skiljer en punkt-till-punkt-länk från en broadcast-länk?
||
- **Punkt-till-punkt:** en *dedikerad* länk mellan exakt två noder.
- **Broadcast:** ==flera noder delar samma medium== – därför behövs MAC för att avgöra vem som får sända.
