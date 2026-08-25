---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 21 – multicast routing: unicast/multicast/broadcast, multicast-adresser, source-based/group-shared träd, RPF och IGMP."
---
# HI1032 Begrepp - Kap 21 Multicast routing

Vad skiljer unicast, multicast och broadcast åt? (3)
||
- **Unicast:** en avsändare → *en* mottagare (en-till-en)
- **Multicast:** en avsändare → *en grupp* utvalda mottagare (en-till-många)
- **Broadcast:** en avsändare → *alla* på nätet

Varför är multicast bättre än att skicka många separata unicast?::Med multicast skickas ==bara en kopia== som routrarna duplicerar först där vägarna delar sig – multipel unicast slösar bandbredd genom att skicka samma data om och om igen.

**Multicast-adress**;;En ==gruppadress== (IPv4-blocket 224.0.0.0/4) som mottagare kan ansluta sig till för att ta emot en multicast-ström.

Vad skiljer ett source-based tree från ett group-shared tree?
||
- **Source-based:** ett *eget träd per (källa, grupp)* med källan som rot – många träd.
- **Group-shared:** ==en central router (rendezvous point)== bygger *ett* träd per grupp – färre träd.

**RPF** (Reverse Path Forwarding);;En teknik som ==bara vidarebefordrar ett multicast-paket om det kom in via den kortaste vägen tillbaka till källan==; hindrar loopar och dubbletter.

**IGMP** (i multicast);;Protokollet som ==samlar in vilka värdar som är med i en multicast-grupp==, så att multicast-routrar vet vart strömmen ska skickas.
