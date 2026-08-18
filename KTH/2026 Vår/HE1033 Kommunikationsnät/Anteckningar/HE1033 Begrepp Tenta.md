---
tags: [begrepp, HE1033, KTH, nätverk, tenta, year2026]
created: 2026-03-01
updated: 2026-05-28
---
# HE1033 Begrepp Tenta (Index)

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

## 🌐 Individuella Begrepp (Länkat nätverk)

Detta nav innehåller fördjupad information om kommunikationsnät, kategoriserat efter OSI-lager och funktion.

### Modeller & Grundpelare
- [[OSI-modellen]] - De sju lagren.
- [[LLC och MAC]] - Datalänklagret (L2) uppdelning.
- [[ARQ-protokoll]] - Felhantering (Stop-and-Wait, GBN, SR).
- [[CSMA-CD och CSMA-CA]] - Åtkomstmetoder för trådburet/trådlöst.

### Adressering & Subnät
- [[MAC-adress]] - Fysisk adressering (L2).
- [[IPv4 och IPv6]] - Logisk adressering (L3) och skillnader.
- [[Subnätning och CIDR]] - Beräkningar, prefix och nätmasker.

### Protokoll
- [[ARP]] - Kopplingen mellan IP och MAC.
- [[ICMP]] - Felmeddelanden, Ping och Traceroute.
- [[DHCP]] - Automatisk tilldelning (DORA).
- [[DNS]] - Namnuppslagning (L7).
- [[TCP]] - Pålitlig och anslutningsorienterad transport.
- [[UDP]] - Snabb och anslutningslös transport.

### Routing & Algoritmer
- [[Routing-principer]] - Longest Prefix Match och Default Route.
- [[OSPF]] - Internt routingprotokoll (Link State).
- [[BGP]] - Internetets huvudprotokoll (Path Vector).
- [[Dijkstras algoritm]] - Beräkning av kortaste vägen.

### Format
- [[Ethernet-ramen]] - Header-fält och minimistorlek.

---

## 📝 Ursprungliga Flashcards (Snabbkoll)

Vilka två underlager ingår i datalänklagret och vad gör de?(2)
??
- **LLC:** Hanterar flödeskontroll och felkontroll.
- **MAC:** Hanterar fysisk adressering och åtkomst till mediet.
<!--SR:!2026-03-28,16,250!2026-03-23,11,250-->

Vad är den minsta tillåtna storleken på en Ethernet ram och varför?(Definition)::64 byte. Det krävs för att sändningen ska ta tillräckligt lång tid så att kollisioner hinner upptäckas av sändaren.
<!--SR:!2026-03-15,9,268-->

Vilka tre komponenter måste finnas i ett ARQ protokoll?(3)
??
- Buffring av meddelanden på sändarsidan.
- Sekvensnummer.
- En timeout klocka.
<!--SR:!2026-03-24,12,248!2026-03-22,10,250-->

Vad är maximal sändarfönsterstorlek för Go Back N respektive Selective Repeat?(Definition)::För Go Back N är den $2^k - 1$. För Selective Repeat är den $2^{k-1}$.
<!--SR:!2026-03-24,12,248-->

Vad skiljer CSMA CD från CSMA CA?(2)
||
- **CD:** Används i trådbundna nätverk och avbryter sändning direkt vid kollision.
- **CA:** Används i trådlösa nätverk och försöker proaktivt undvika kollisioner helt.
<!--SR:!2026-03-22,11,228-->

Vilka fält ändras alltid i en IPv4 header när paketet passerar en router?(Definition)::Time To Live minskas med 1 och Header Checksum beräknas om.
<!--SR:!2026-03-16,10,270-->

Vilka fält ändras i en IPv4 header om routern måste fragmentera paketet?(Definition)::Total Length samt Flags och Fragmentation Offset ändras.
<!--SR:!2026-03-23,11,270-->

Nämn de stora skillnaderna mellan IPv4 och IPv6.(2)
||
- **IPv4:** Har 32 bitar och tillåter routerfragmentering samt har broadcast.
- **IPv6:** Har 128 bitar och saknar checksumma samt saknar broadcast.
<!--SR:!2026-03-17,5,208-->

Vilken regel använder en router när flera rader i routingtabellen matchar destinationsadressen?(Definition)::Den använder Longest Prefix Match och väljer den mest specifika nätmasken.
<!--SR:!2026-03-28,16,250-->

Vilken IP adress representerar en Default Route i en routingtabell?(Definition)::Adressen 0.0.0.0/0.
<!--SR:!2026-03-27,15,250-->

Vilken MAC adress används alltid för en Broadcast?(Definition)::Adressen FF:FF:FF:FF:FF:FF.
<!--SR:!2026-03-17,11,270-->

Vilket protokoll beskrivs som ett internt protokoll baserat på Link State?(Definition)::OSPF.
<!--SR:!2026-03-27,15,248-->

Vilket protokoll beskrivs som ett gammalt routingprotokoll där oändligheten definieras som 16 hopp?(Definition)::RIP.
<!--SR:!2026-03-27,15,250-->

Vilket protokoll används för att koppla samman olika autonoma system på Internet?(Definition)::BGP.
<!--SR:!2026-03-22,10,228-->

Vilket protokoll översätter IP adresser till MAC adresser?(Definition)::ARP.
<!--SR:!2026-03-28,16,268-->

Vilket protokoll är en distribuerad tjänst som översätter värdnamn till IP adresser?(Definition)::DNS.
<!--SR:!2026-03-11,5,228-->

Vilket protokoll används för IP relaterade felrapporter och frågor?(Definition)::ICMP.
<!--SR:!2026-03-30,18,268-->

Vilket protokoll tilldelar dynamiskt IP adresser till klienter?(Definition)::DHCP.
<!--SR:!2026-03-30,18,268-->

Vilket transportprotokoll saknar garantier och skickar data ur sekvens?(Definition)::UDP.
<!--SR:!2026-03-30,18,268-->

Vilket transportprotokoll är tillförlitligt och anslutningsorienterat?(Definition)::TCP.
<!--SR:!2026-03-14,8,250-->

Hur många totala IP adresser ryms i ett nätverk med nätmasken /24?(Definition)::Det ryms exakt 256 adresser.
<!--SR:!2026-03-23,12,248-->

Hur många totala IP adresser ryms i ett nätverk med nätmasken /25?(Definition)::Det ryms exakt 128 adresser.
<!--SR:!2026-03-14,8,250-->

Hur många totala IP adresser ryms i ett nätverk med nätmasken /26?(Definition)::Det ryms exakt 64 adresser.
<!--SR:!2026-03-14,8,268-->

Hur många totala IP adresser ryms i ett nätverk med nätmasken /27?(Definition)::Det ryms exakt 32 adresser.
<!--SR:!2026-03-15,9,268-->

Hur räknar du ut antalet användbara värdadresser i ett subnät?(Definition)::Du tar totala antalet adresser och subtraherar med två.
<!--SR:!2026-03-29,17,268-->

Varför måste du alltid subtrahera två adresser för att få fram antalet användbara värdadresser i ett subnät?(Definition)::För att den första adressen alltid är reserverad som nätverksadress och den sista adressen alltid är reserverad som broadcastadress.
<!--SR:!2026-03-15,9,250-->

Vilken binär struktur har alltid en nätverksadress i värddelen?(Definition)::Alla bitar i värddelen är enbart nollor.
<!--SR:!2026-03-15,9,268-->

Vilken binär struktur har alltid en broadcastadress i värddelen?(Definition)::Alla bitar i värddelen är enbart ettor.
<!--SR:!2026-03-14,8,268-->

Vilken logisk matematisk operation används av en router för att få fram nätverksadressen från en IP adress och en subnätmask?(Definition)::En bitvis AND operation.
<!--SR:!2026-03-27,15,248-->

Vilken specifik IP adress kallas för Loopback och används för att en dator ska kunna testa nätverksfunktioner internt mot sig själv?(Definition)::Adressen 127.0.0.1 används för detta.
<!--SR:!2026-03-27,15,248-->

Hur många bitar lång är en MAC adress?(Definition)::Den är exakt 48 bitar lång.
<!--SR:!2026-03-22,10,250-->

Vad är alltid startvärdet för kostnaden till startnoden innan första iterationen i Dijkstras algoritm påbörjas?(Definition)::Värdet är noll.
<!--SR:!2026-03-29,17,268-->

Vad är startvärdet för kostnaden till alla andra noder utom startnoden innan Dijkstras algoritm påbörjas?(Definition)::Värdet är oändligheten.
<!--SR:!2026-03-29,17,268-->

Vilken nod väljer man alltid att permanenta och flytta ner till en ny rad i Dijkstras algoritm?(Definition)::Man väljer den nod som för tillfället har den allra lägsta totala kostnaden från startnoden.
<!--SR:!2026-03-27,15,250-->

Hur beräknas den nya potentiella kostnaden till en granne i Dijkstras algoritm?(Definition)::Du adderar kostnaden till den nyss permanentade noden med kostnaden för själva länken till grannen.
<!--SR:!2026-03-23,11,228-->
