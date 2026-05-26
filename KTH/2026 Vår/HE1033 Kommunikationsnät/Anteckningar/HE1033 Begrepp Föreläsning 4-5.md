---
tags:
  - begrepp
  - föreläsning
  - HE1033
  - KTH
  - nätverk
  - year2026
---
# HE1033 Begrepp Föreläsning 4-5

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`


---

IP (Internet Protocol) (Definition);; Ett **förbindelselöst** (connectionless) protokoll som arbetar enligt **"best-effort"**-principen utan garanterad leverans.
<!--SR:!2026-03-17,5,186!2026-03-16,4,186-->

IPv4 (Leveransmodell) (Definition);; **Best-effort** leverans. Det innebär att leveransen är **opålitlig** (ingen garanti för att paket kommer fram, ingen felkontroll av data, kan komma i oordning).
<!--SR:!2026-03-14,2,186!2026-03-18,6,212-->

Förbindelselös (Connectionless) nätverkstjänst (Definition);; Varje paket (datagram) hanteras **oberoende** av andra. Paket kan ta olika vägar till destinationen och ingen uppkoppling sker före sändning.
<!--SR:!2026-03-19,7,181!2026-03-16,4,186-->

MTU (Maximum Transmission Unit) (Definition);; Den största paketstorleken som ett specifikt lager 2-protokoll (t.ex. **Ethernet**) kan överföra (oftast **1500 bytes**).
<!--SR:!2026-03-13,4,186!2026-03-13,4,192-->

IPv4-huvud: HLEN (Header Length) (Definition);; Anger huvudets längd i enheter om **4 bytes**. Minsta värde är 5 ($5 \times 4 = 20$ bytes).
<!--SR:!2026-03-18,6,221!2026-03-13,7,226-->

IPv4-huvud: Total Length (Definition);; Det totala antalet bytes i datagrammet (**Header + Data**). Fältet är 16 bitar långt.
<!--SR:!2026-03-13,4,186!2026-03-18,6,212-->

TTL (Time To Live) (Definition);; Ett fält (8 bitar) som förhindrar att paket snurrar för evigt i loopar genom att värdet minskas med **1** av varje router. Vid 0 kastas paketet.
<!--SR:!2026-04-01,20,250!2026-04-05,24,252-->

Vilken del av ett IPv4-paket skyddas av Header Checksum?:: Endast **IP-huvudet** (ej datalasten/payload).
<!--SR:!2026-03-13,4,177-->

Fragmentering (IP) (Definition);; Processen att dela upp ett IP-datagram i mindre delar om det är större än länkens **MTU**. Sker i routrar (IPv4) eller sändare.
<!--SR:!2026-03-20,8,230!2026-03-15,9,250-->



IPv4-huvud: Flags (3)
??
- Reserverad (alltid 0)
- **DF** (Don't Fragment): Om satt till 1 får paketet inte fragmenteras
- **MF** (More Fragments): Om satt till 1 finns fler fragment efter detta; 0 betyder sista fragmentet
<!--SR:!2026-03-13,7,226!2026-03-13,4,186-->

Fragmentation Offset (Definition);; Anger var i det ursprungliga datagrammet detta fragments data hör hemma, mätt i enheter om **8 byte**.
<!--SR:!2026-04-10,29,270!2026-03-28,16,250-->

IPv4-adress (storlek) (Definition);; **32 bitar** (4 byte). Skrivs oftast i "dotted decimal" notation (t.ex. 192.168.0.1).
<!--SR:!2026-03-13,9,250!2026-03-13,9,250-->

Nätverksadress (Network Address) (Definition);; Den första adressen i ett block. Alla bitar i **värddelen** (host ID) är satta till **0**. Används för routing.
<!--SR:!2026-03-17,5,192!2026-03-27,15,226-->

Broadcast-adress (Riktad/Direct) (Definition);; Den sista adressen i ett block. Alla bitar i **värddelen** (host ID) är satta till **1**.
<!--SR:!2026-03-17,5,206!2026-03-20,8,230-->

Subnätmask (Subnet Mask) / Prefixlängd (/n) (Definition);; En 32-bitars sekvens (eller tal /n) som anger vilka bitar i IP-adressen som definierar **nätverket**.
<!--SR:!2026-03-25,13,230!2026-03-21,9,210-->

CIDR (Classless Inter-Domain Routing) (Definition);; Adresseringsmetod där nätverksdelen kan vara av **variabel längd** (snedstrecksnotation, t.ex. /26).
<!--SR:!2026-03-10,1,138!2026-03-20,8,197-->

VLSM (Variable Length Subnet Mask) (Definition);; Tekniken att dela upp ett nätverk i undernät med **olika stora** subnätmasker för att optimera adressutnyttjandet.
<!--SR:!2026-03-17,5,206!2026-03-13,4,186-->

Hur beräknas antalet användbara värdar (hosts) i ett subnät med prefixlängd /n?:: $2^{(32 - n)} - 2$ (Minus 2 för nätverksadress och broadcastadress).
<!--SR:!2026-03-13,7,241-->

ACL (Access Control List) (Definition);; En lista med regler (**permit/deny**) konfigurerade på en router för att filtrera trafik baserat på IP-adress, portar och protokoll.
<!--SR:!2026-03-21,9,230!2026-04-08,27,270-->

Standard ACL (Definition);; Filtrerar trafik endast baserat på **källans IP-adress** (Source IP).
<!--SR:!2026-03-13,4,186!2026-03-14,8,250-->

Extended ACL (Definition);; Filtrerar trafik baserat på käll-IP, destination-IP, **protokoll** (TCP/UDP) och **portnummer**.
<!--SR:!2026-03-18,6,210!2026-03-13,4,192-->

Implicit Deny Any (Definition);; Alla ACL:er avslutas osynligt med en regel som **kastar all trafik** som inte matchat tidigare rader.
<!--SR:!2026-03-20,8,230!2026-03-18,6,210-->

Wildcard Mask (Definition);; En mask där **0** betyder "måste matcha" och **1** betyder "bryr mig inte" (motsatsen till en subnätmask).
<!--SR:!2026-03-20,8,230!2026-04-09,28,270-->

Wildcard Mask - Princip (2)
||
- **0** = Bitarna måste matcha exakt
- **1** = "Don't care" (ignorera biten)
<!--SR:!2026-04-02,21,246-->

Vad är Wildcard Mask för en enskild värd (t.ex. 192.168.1.5)?:: **0.0.0.0** (Alla bitar måste matcha).
<!--SR:!2026-03-14,8,250-->

Vad är Wildcard Mask för ett /24-nätverk?:: **0.0.0.255** (Matcha första 24 bitarna, ignorera sista 8).
<!--SR:!2026-03-17,5,192-->

Hur beräknas en Wildcard Mask utifrån en subnätmask?:: **255.255.255.255** minus **Subnätmasken**.
<!--SR:!2026-03-13,7,226-->

ARP (Address Resolution Protocol) (Definition);; Mappar en känd **logisk adress (IP)** till en okänd **fysisk adress (MAC)** på det lokala nätverket.
<!--SR:!2026-03-13,4,186!2026-03-22,10,230-->

ICMP (Internet Control Message Protocol) (Definition);; Ett hjälpprotokoll till IP som hanterar **felrapportering** och **diagnostik** (t.ex. Ping). Kapslas in i IP-datagram. Används för IP-relaterade felrapporter och frågor.
<!--SR:!2026-03-17,5,206!2026-03-21,9,206-->

ICMP:s två huvudtyper av meddelanden (2)
||
- **Error-reporting** (t.ex. TTL expired)
- **Query** (t.ex. Echo Request/Reply)
- Används för IP-relaterade felrapporter och frågor.
<!--SR:!2026-03-17,5,186-->

Varför skickar inte ICMP felmeddelanden om felmeddelanden?:: För att undvika **oändliga loopar** av felrapportering och nätverksbelastning.
<!--SR:!2026-03-20,7,186-->

IPv6-adress (storlek) (Definition);; **128 bitar** (16 byte). Skrivs hexadecimalt med kolon (ex: 2001:db8:1).
<!--SR:!2026-03-13,7,226!2026-04-02,21,246-->

Förbättringar i IPv6 jämfört med IPv4 (4)
||
- Större adressrymd (128 bitar)
- Förenklat huvud (fast längd 40 bytes)
- Inbyggd säkerhet (IPSec) och stöd för Anycast
- Ingen fragmentering i routrar
<!--SR:!2026-03-13,4,181-->

IPv6 vs IPv4: Fragmentering (Definition):: I IPv6 fragmenterar **endast sändaren** (hosten), aldrig routrar längs vägen.
<!--SR:!2026-03-27,15,250-->

Autokonfigurering (IPv6) (Definition);; En mekanism (**SLAAC**) där en värd automatiskt skapar sin adress genom att kombinera nätverksprefixet med sin MAC-adress.
<!--SR:!2026-03-17,5,177!2026-03-21,9,230-->

Datagram-nätverk (Packet Switching) (Definition);; Varje paket innehåller fullständig destinationsadress och routrar fattar beslut individuellt för varje paket.
<!--SR:!2026-03-20,8,201!2026-03-26,14,241-->

Virtuell krets (Virtual Circuit Switching) (Definition);; En logisk förbindelse upprättas före sändning; paket identifieras med **VCI** och följer samma väg.
<!--SR:!2026-03-24,12,221!2026-03-21,10,221-->

Skillnad mellan Forwarding och Routing (2)
||
- **Forwarding**: Processen att flytta ett paket från ingång till utgång i en router (lokalt).
- **Routing**: Processen att bestämma vägen genom hela nätverket och bygga tabeller (globalt).
<!--SR:!2026-03-24,12,220-->

Var sker hopsättning (reassembly) av fragmenterade paket?:: Endast hos **slutdestinationen**.
<!--SR:!2026-03-22,10,230-->

Om HLEN har värdet 10, hur stort är IP-huvudet?:: $10 \times 4 = \mathbf{40}$ **bytes**.
<!--SR:!2026-03-25,12,206-->

Om Fragment Offset är 100, vilken byte-position börjar datan på?:: $100 \times 8 = \mathbf{800}$ **bytes**.
<!--SR:!2026-03-15,4,177-->

DHCPv4 - Metoder för tilldelning (3)
||
- **Manuell**: Låser specifik IP till en MAC.
- **Automatisk**: Permanent statisk adress från pool.
- **Dynamisk**: Adressen "leasas" ut under begränsad tid.
<!--SR:!2026-03-17,5,179-->

DHCP DORA-processen (Steg) (4)
??
- **Discover** (Klient -> Server, Broadcast)
- **Offer** (Server -> Klient)
- **Request** (Klient -> Server)
- **Acknowledge (ACK)** (Server -> Klient)
<!--SR:!2026-04-04,22,246!2026-03-28,16,232-->

DHCP Relay Agent (Definition);; En funktion i en router som vidarebefordrar **DHCP-broadcasts** till en server i ett annat subnät.
<!--SR:!2026-03-13,4,186!2026-03-13,7,226-->

Syftet med NAT (Definition):: Att spara på publika IPv4-adresser genom att tillåta många enheter att dela på en eller få publika adresser.
<!--SR:!2026-03-18,7,186-->

NAT: Inside Local Address (Definition);; Den **privata** IP-adressen som en enhet har på det interna nätverket.
<!--SR:!2026-03-23,11,220!2026-03-23,11,220-->

NAT: Inside Global Address (Definition);; Den **publika** IP-adressen som representerar den interna enheten mot internet.
<!--SR:!2026-03-17,5,200!2026-03-17,5,201-->

PAT (Port Address Translation) (Definition);; Kallas även **NAT Overloading**. Använder unika **portnummer** för att skilja mellan interna enheter.
<!--SR:!2026-03-16,4,186!2026-03-20,8,230-->

VLSM - Grundregel (Definition):: Vid adressplanering ska man alltid börja med att tilldela adresser till det **största subnätet** först.
<!--SR:!2026-04-03,22,246-->

Varför drar man bort 2 när man räknar ut antal hosts?:: En adress reserveras för **Nätverksadressen** och en för **Broadcastadressen**.
<!--SR:!2026-04-03,22,246-->

Skillnad i adressrymd mellan IPv4 och IPv6(Definition)::IPv4 använder 32 bitar, IPv6 använder 128 bitar.
<!--SR:!2026-03-22,10,230-->

Varför har IPv6 slopat Header Checksum?(Definition);;För att öka nätverkets effektivitet, då felkontroll redan hanteras av andra lager (t.ex. Datalänklagret och Transportlagret).
<!--SR:!2026-03-19,7,200!2026-03-13,4,180-->

Hur hanteras fragmentering i IPv4 jämfört med IPv6?(Definition)::I IPv4 kan routrar längs vägen fragmentera paket. I IPv6 får routrar inte fragmentera; fragmentering sker endast av avsändaren (source node).
<!--SR:!2026-03-20,8,230-->

Protokoll för automatisk konfiguration: IPv4 vs IPv6(Definition)::IPv4 använder DHCP. IPv6 stödjer inbyggd SLAAC (Stateless Address Autoconfiguration).
<!--SR:!2026-03-18,6,210-->

Sändning till alla noder: IPv4 vs IPv6(Definition::IPv4 använder Broadcast. IPv6 saknar Broadcast och använder istället Multicast och Anycast.
<!--SR:!2026-03-24,12,212-->

Vilket fält i IPv4-huvudet minskas alltid av en router och varför?(Definition)::TTL (Time-To-Live). Det dekrementeras (minskas med 1) för att förhindra att paket snurrar i nätverket för evigt vid routing-loopar.
<!--SR:!2026-03-13,4,192-->

Varför måste en router alltid räkna om IPv4 Header Checksum?(Definition)::Eftersom ett annat fält i huvudet, TTL (Time-To-Live), alltid ändras (minskas) när paketet passerar routern.
<!--SR:!2026-04-05,24,252-->

Vilka tre fält i IPv4-huvudet ändras om en router måste fragmentera ett paket?(3)
??
- **Total Length:** Varje fragment får sin egen längd.
- **Flags:** Exempelvis sätts "More Fragments" till 1.
- **Fragmentation Offset:** Indikerar var fragmentet hör hemma i originaldatat.
<!--SR:!2026-03-13,4,186!2026-03-13,7,232-->

När ändras fältet HLEN (Header Length) i en router?(Definition);;Endast i de ovanliga fall där IP Options läggs till eller tas bort. Normalt är detta värde oförändrat.
<!--SR:!2026-04-05,23,246!2026-03-18,6,212-->

Hur beräknas det totala antalet IP-adresser i ett CIDR-block?(Definition)::Genom formeln $2^{32-n}$, där $n$ är prefixet (t.ex. ger /26 exakt $2^{32-26} = 64$ adresser).
<!--SR:!2026-04-04,22,246-->

Hur identifierar du Nätverksadressen i ett subnät?(Definition);;Det är alltid den första adressen i blocket, där alla host-bitar är 0. Den används i routingtabeller för att identifiera hela nätet.
<!--SR:!2026-03-13,4,186!2026-03-13,9,250-->

Hur identifierar du Broadcastadressen i ett subnät?(Definition);;Det är alltid den sista adressen i blocket, där alla host-bitar är 1. Den används för att skicka data till alla värdar i subnätet.
<!--SR:!2026-03-20,16,226!2026-03-25,13,226-->

MAC-adressen för Broadcast(Definition);;FF:FF:FF:FF:FF:FF.
<!--SR:!2026-04-10,29,270!2026-03-14,8,250-->

Vad används IP-adresser i Klass D till?(Definition);;Multicast (att skicka till en specifik grupp av mottagare).
<!--SR:!2026-03-20,8,199!2026-03-19,8,199-->

Vilken nätverksadress används som Loopback i IPv4?(Definition);;127.0.0.0/8 (där 127.0.0.1 är den vanligaste värdadressen).
<!--SR:!2026-03-24,12,220!2026-03-19,7,200-->

Vilka fyra steg utgör DORA-processen i DHCP?(4)
??
- **Discover:** Klient söker.
- **Offer:** Server erbjuder.
- **Request:** Klient begär.
- **Acknowledge:** Server bekräftar.
<!--SR:!2026-04-03,21,246!2026-03-27,15,250-->

Skillnaden mellan NAT och PAT(Definition)::NAT översätter privata IP-adresser till publika. PAT (NAT Overload) tillåter flera privata adresser att dela på en enda publik IP genom att använda unika TCP/UDP-portnummer.
<!--SR:!2026-03-17,5,186-->

Standard ACL (Access Control List)(Definition);;En paketfiltreringsregel som godkänner/nekar trafik enbart baserat på käll-IP-adress.
<!--SR:!2026-03-13,4,186!2026-03-18,6,212-->

Var bör en Standard ACL placeras i nätverket?(Definition);;Så nära destinationen som möjligt (för att inte av misstag blockera legitim trafik till andra nätverk längs vägen).
<!--SR:!2026-03-18,6,210!2026-03-21,9,230-->

Extended ACL(Definition);;Filtrerar baserat på käll- och destinations-IP, samt specifika protokoll/portar. Bör placeras så nära källan som möjligt för att stoppa oönskad trafik tidigt.
<!--SR:!2026-03-16,4,186!2026-03-21,9,232-->

Hur fungerar Wildcard-maskering i en ACL?(Definition)::Den anger vilka bitar i en IP-adress som ACL:en ska bry sig om. En 0 betyder "måste matcha exakt", en 1 betyder "ignorera/bry dig inte".
<!--SR:!2026-03-20,8,230-->

IPv4-huvud: Options(Definition);;Valfria fält (0–40 bytes) som används för t.ex. Source Routing, Record Route eller Timestamp.
<!--SR:!2026-03-13,4,177!2026-03-20,8,230-->

HLEN-värde för ett IPv4-huvud med 20 bytes options(Definition)::10 (Eftersom $(20 + 20) / 4 = 10$).
<!--SR:!2026-04-04,23,252-->

Vad händer om en router tar emot ett paket som är större än länkens MTU och DF-biten är satt till 1?(Definition)::Routern kastar paketet och skickar ett ICMP Destination Unreachable (Fragmentation Needed) till sändaren.
<!--SR:!2026-03-13,4,186-->

Reassembly Timer(Hopsättningstimer)(Definition);;En mekanism hos mottagaren som startar när första fragmentet anländer; om inte alla fragment kommit innan tiden går ut slängs alla inkomna fragment.
<!--SR:!2026-03-17,5,206!2026-03-25,12,206-->

NAT: Outside Global Address(Definition);;Den publika IP-adressen som tillhör en extern värd (t.ex. en webbserver på internet).
<!--SR:!2026-03-24,12,210!2026-03-18,6,221-->

NAT: Outside Local Address(Definition);;Den adress som den interna klienten "ser" som den externa värdens adress (oftast samma som Outside Global).
<!--SR:!2026-03-13,1,140!2026-03-17,5,180-->

Skillnaden mellan Statisk NAT och Dynamisk NAT(2)
??
- **Statisk:** En-till-en mappning (manuell), bra för servrar.
- **Dynamisk:** Pool av publika adresser, tilldelas "först till kvarn".
<!--SR:!2026-03-22,10,220!2026-03-13,7,217-->

Var bör en Extended ACL placeras för bäst effektivitet?(Definition)::Så nära källan som möjligt för att spara bandbredd genom att filtrera trafik tidigt.
<!--SR:!2026-03-18,6,210-->

Var bör en Standard ACL placeras?(Definition)::Så nära destinationen som möjligt (eftersom den bara kan filtrera på käll-IP och annars riskerar att blockera giltig trafik till andra nät).
<!--SR:!2026-04-03,21,246-->

Inbound vs. Outbound ACL(2)
??
- **Inbound:** Paketen filtreras innan de routas.
- **Outbound:** Paketen filtreras efter att de har routats till utgångsgränssnittet.
<!--SR:!2026-03-23,11,218!2026-03-23,11,219-->

Wildcard Mask för att matcha endast jämna IP-adresser i ett nätverk?(Definition)::Sista biten i masken måste vara 0 (eftersom sista biten i en jämn IP alltid är 0). Exempel: 0.0.0.254.
<!--SR:!2026-03-13,4,177-->

Extension Headers(IPv6)(Definition);;Valfria huvuden som placeras mellan bas-huvudet och payload; minskar belastningen på routrar då de (oftast) endast läses av destinationen.
<!--SR:!2026-03-17,5,197!2026-03-21,9,221-->

IPv6 Anycast-adress(Definition);;En adress som tilldelas flera gränssnitt; ett paket till denna adress levereras till närmaste interface (enligt routingprotokollet).
<!--SR:!2026-03-16,4,180!2026-03-23,11,200-->

Vilka är de tre huvudstrategierna för samexistens mellan IPv4 och IPv6?(Definition)::Dual Stack, Tunneling och NAT64.
<!--SR:!2026-03-13,7,217-->



Vilka fält i en IPv4 header ändras alltid när ett paket passerar en router?(Definition)::Fälten Time To Live och Header Checksum ändras alltid.
<!--SR:!2026-03-27,15,250-->

Varför ändras fältet Time To Live i en IPv4 header av en router?(Definition)::Routern minskar värdet med ett för att förhindra att paketet snurrar i nätverket för evigt.
<!--SR:!2026-03-31,19,250-->

Varför måste fältet Header Checksum i en IPv4 header beräknas om av en router?(Definition)::Eftersom routern har ändrat värdet i fältet Time To Live måste checksumman uppdateras för att reflektera den nya datan.
<!--SR:!2026-03-15,9,250-->

Vilka fält i en IPv4 header kan ändras av en router utöver Time To Live och Header Checksum ifall paketet är för stort?(Definition)::Fälten Total Length samt Flags och Fragmentation Offset ändras om paketet måste fragmenteras.
<!--SR:!2026-03-17,5,206-->

Vilket IP protokoll tillåter att routrar fragmenterar paket längs vägen?(Definition)::Endast IPv4 tillåter detta. I IPv6 får endast avsändaren fragmentera paketen.
<!--SR:!2026-03-21,9,230-->

Hur skiljer sig hanteringen av felkontroll i headern mellan IPv4 och IPv6?(Definition)::IPv4 har en Header Checksum medan IPv6 har tagit bort checksumman helt för att öka effektiviteten vid routing.
<!--SR:!2026-03-13,4,186-->

Vad är den exakta skillnaden i adresslängd mellan IPv4 och IPv6?(Definition)::IPv4 använder 32 bitar medan IPv6 använder 128 bitar.
<!--SR:!2026-03-22,10,230-->

Vilken typ av sändning saknas helt i IPv6 men finns i IPv4?(Definition)::Broadcast finns inte i IPv6 utan ersätts av Multicast och Anycast.
<!--SR:!2026-03-17,5,206-->

Vad kallas funktionen i IPv6 som låter enheter automatiskt konfigurera sin egen IP adress utan en DHCP server?(Definition)::SLAAC vilket står för Stateless Address Autoconfiguration.
<!--SR:!2026-03-13,7,226-->

Vilka fyra meddelanden ingår i sekvensen när en klient hämtar en IP adress via DHCP?(Definition)::Sekvensen är Discover sedan Offer sedan Request och slutligen Ack.
<!--SR:!2026-03-13,4,186-->

Skickas ett DHCP Discover meddelande som Unicast eller Broadcast?(Definition)::Det skickas som Broadcast eftersom klienten ännu inte vet var DHCP servern finns i nätverket.
<!--SR:!2026-03-20,8,230-->

Vilken princip använder en router när en destinationsadress matchar flera rader i routingtabellen?(Definition)::Routern använder Longest Prefix Match och väljer den väg som har flest matchande nätverksbitar.
<!--SR:!2026-03-17,5,206-->

Vad kallas tekniken där man delar upp ett nätverk i flera mindre subnät med olika stora nätmasker för att spara IP adresser?(Definition)::Det kallas VLSM vilket står för Variable Length Subnet Masking.
<!--SR:!2026-03-24,11,212-->

Vad är skillnaden mellan traditionell NAT och PAT?(Definition)::Traditionell NAT översätter endast IP adresser medan PAT översätter både IP adresser och portnummer.
<!--SR:!2026-03-20,8,221-->

Vad är det primära syftet med PAT i ett hemnätverk?(Definition)::Att låta flera lokala enheter dela på en enda publik IP adress mot Internet.
<!--SR:!2026-03-21,9,230-->
