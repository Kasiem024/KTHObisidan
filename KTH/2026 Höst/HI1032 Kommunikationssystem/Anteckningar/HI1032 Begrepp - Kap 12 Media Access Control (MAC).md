---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 12 – MAC: slumpmässig åtkomst (ALOHA/CSMA/CD/CA), kontrollerad åtkomst (token) och kanalisering (FDMA/TDMA/CDMA)."
---
# HI1032 Begrepp - Kap 12 Media Access Control (MAC)

Vilka tre kategorier av åtkomstmetoder (multiple access) finns? (3)
||
- **Slumpmässig åtkomst** (random access) – stationer tävlar (t.ex. CSMA/CD)
- **Kontrollerad åtkomst** (controlled) – turordningen bestäms (polling, token)
- **Kanalisering** (channelization) – dela på frekvens/tid/kod (FDMA/TDMA/CDMA)

## Slumpmässig åtkomst

**Slumpmässig åtkomst** (random access);;Åtkomstmetod där ==ingen station styr över någon annan== – var och en sänder när den vill (efter en procedur), vilket kan leda till *kollisioner*.

**ALOHA**;;Den tidigaste slumpmässiga åtkomstmetoden: ==sänd så snart du har data== och hantera kollisioner i efterhand genom att sända om.

**CSMA** (Carrier Sense Multiple Access);;En metod där en station ==lyssnar om mediet är ledigt innan den sänder== ("lyssna innan du talar").

Vad skiljer CSMA/CD från CSMA/CA?
||
- **CSMA/CD** (collision *detection*): lyssna först och ==upptäck kollisioner under sändning== (avbryt då). Används i trådbunden Ethernet.
- **CSMA/CA** (collision *avoidance*): lyssna först och försök ==undvika kollisioner== (de är svåra att upptäcka trådlöst). Används i WiFi.

## Kontrollerad åtkomst & kanalisering

**Token passing** (tokenöverföring);;Kontrollerad åtkomst där en ==särskild token cirkulerar i en logisk ring==; bara stationen som håller token får sända.

Vilka tre kanaliseringsmetoder finns? (3)
||
- **FDMA** – varje station får ett eget *frekvensband*
- **TDMA** – varje station får en egen *tidslucka*
- **CDMA** – stationer skiljs åt med olika *koder* (chips)
