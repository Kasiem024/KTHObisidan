---
tags: [begrepp, föreläsning, HE1033, KTH, nätverk, year2026]
created: 2026-03-01
updated: 2026-08-17
description: "Vad är skillnaden mellan en statisk och dynamisk rutt gällande nätverkets anpassningsförmåga? En statisk rutt har ingen anpassningsförmåga vid förändringar i nätverket..."
---
# HE1033 Begrepp Föreläsning 9

Vad är skillnaden mellan en statisk och dynamisk rutt gällande nätverkets anpassningsförmåga?(Definition)::En statisk rutt har ingen anpassningsförmåga vid förändringar i nätverket (och belastar routern mindre), medan en dynamisk rutt är anpassningsbar och hittar automatiskt nya vägar.
<!--SR:!2026-03-23,11,250-->

Vad är syftet med Administrative Distance (AD)?(Definition)::Det används av routern för att avgöra vilken routingkälla som ska prioriteras när den har lärt sig flera vägar till samma destination. (Lägre värde är bättre, t.ex. Connected=0, Static=1, OSPF=110).
<!--SR:!2026-03-15,3,204-->

Vad kännetecknar ett Distance Vector-protokoll gällande hur det delar routinginformation?(Definition)::Routern skickar hela sin routingtabell, men gör det enbart till sina närmaste grannar (ofta periodvis). Den saknar en helhetsbild av nättopologin.
<!--SR:!2026-03-15,3,230-->

Vad kännetecknar ett Link-State-protokoll?(Definition)::Routern skickar enbart information om sina egna länkar, men skickar denna information till alla routrar i nätverket. Detta ger varje router en exakt bild av hela nätets topologi.
<!--SR:!2026-03-13,4,210-->

Vilken specifik mätvariabel (metric) använder RIP för att bestämma bästa vägen?(Definition)::Enbart Antal hopp (Hop count).
<!--SR:!2026-03-15,3,230-->

Vilket är det maximala antalet hopp i RIP och vad händer därefter?(Definition)::Maximala antalet hopp är 15. En rutt med 16 hopp anses oåtkomlig (oändligheten) och paketet kastas.
<!--SR:!2026-03-14,5,230-->

Vad innebär routingproblemet "Count to infinity"?(Definition)::Det är en routingloop i Distance Vector-nätverk där felaktig information studsar mellan routrar, vilket får dem att räkna upp hoppen i oändligheten (eller tills det slår i taket på 16 hopp).
<!--SR:!2026-03-15,3,204-->

Hur löser RIP problemet med routing-loopar via "Split Horizon"?(Definition)::En router får aldrig skicka tillbaka routinginformation ut på exakt samma gränssnitt som den tog emot informationen ifrån. Detta förhindrar att routrar lurar varandra.
<!--SR:!2026-03-10,1,198-->

Hur löser routrar problem med loopar via "Hold down timers"?(Definition)::När en rutt markeras som otillgänglig startas en timer (t.ex. 180 seku€nder). Under denna tid ignoreras sämre uppdateringar för det nätverket, vilket förhindrar spridning av gammal felaktig information.
<!--SR:!2026-03-14,2,198-->

Vad är syftet med "Triggered Updates" i RIP?(Definition)::Normalt skickar RIP tabellen var 30:e sekund. En triggered update skickas omedelbart vid förändringar (t.ex. en länk går ner) för att nätverket ska konvergera snabbare.
<!--SR:!2026-03-15,3,205-->

Nämn de avgörande tekniska skillnaderna mellan RIPv1 och RIPv2.(Definition)::RIPv1 skickar inte subnätmasken (stöder därmed ej VLSM/CIDR) och använder Broadcast. RIPv2 skickar subnätmasken (stöder VLSM), använder Multicast och stödjer autentisering.
<!--SR:!2026-03-15,3,205-->

Hur beräknas standardkostnaden (metric) för en länk i OSPF?(Definition)::Kostnaden är omvänt proportionell mot länkens bandbredd och beräknas enligt formeln: $Cost = \frac{100\,000\,000}{\text{Bandbredd i bps}}$. (t.ex. 100Mbps Ethernet = kostnad 1).
<!--SR:!2026-03-13,4,205-->

Vad är en Designated Router (DR) och Backup Designated Router (BDR) i OSPF?(Definition)::De väljs för att förenkla utbytet av routinginformation på ett delat nätverk (som ett LAN). Övriga routrar utbyter routinginformation endast med DR och BDR för att spara bandbredd.
<!--SR:!2026-03-15,3,218-->

Vilken specifik algoritm använder OSPF (och andra Link-State protokoll) för att räkna ut den optimala vägen?(Definition)::SPF-algoritmen (Dijkstras algoritm).
<!--SR:!2026-03-15,3,230-->

Vad definierar ett Autonomt System (AS)?(Definition)::En samling nätverk (t.ex. en internetleverantör, företag eller universitet) under en gemensam administration som har en gemensam routingstrategi.
<!--SR:!2026-03-18,6,230-->

Vad är skillnaden mellan IGP (Interior Gateway Protocol) och EGP (Exterior Gateway Protocol)?(Definition)::IGP (som RIP, OSPF) används för routing inom ett AS. EGP (som BGP) används för kommunikation mellan olika AS.
<!--SR:!2026-03-15,3,230-->

Vilket protokoll är standard för kommunikation mellan olika Autonoma System på internet?(Definition)::BGP (Border Gateway Protocol).
<!--SR:!2026-03-15,3,230-->

Vad är skillnaden mellan Unicast och Multicast?(Definition)::I Unicast finns det exakt en avsändare och en specifik mottagare. I Multicast skickas paket från en avsändare till en grupp av mottagare som har valt att ansluta sig till den specifika gruppen.
<!--SR:!2026-03-15,3,230-->

Vilket IP-adressintervall (klass) används för IPv4 Multicast?(Definition)::Klass D-adresser (224.0.0.0 till 239.255.255.255).
<!--SR:!2026-03-13,4,210-->

Vilka regler gäller för en router som hanterar Multicast-trafik?(Definition)::Den ska se till att varje medlem endast får ett exemplar av meddelandet, att inga routingloopar uppstår, och att icke-medlemmar inte får trafiken.
<!--SR:!2026-03-26,13,242-->

Vad är IGMP (Internet Group Management Protocol) och vilken roll spelar det?(Definition)::Det är protokollet som används mellan datorer och deras lokala router på ett LAN. Det tillåter datorer (mottagare) att meddela routern att de vill gå med i eller lämna en multicast-grupp.
<!--SR:!2026-03-18,6,225-->

Vilka typer av meddelanden skickas typiskt i IGMP?(Definition)::Query (routern frågar ut i nätverket om det finns ett fortsatt intresse för gruppen) och Report (datorn svarar vilka grupper den vill ta emot trafik från).
<!--SR:!2026-03-22,10,250-->

Vilken matematisk algoritm använder protokollet OSPF för att hitta den kortaste vägen i ett nätverk?(Definition)::Dijkstras algoritm.
<!--SR:!2026-03-15,3,230-->

Vilket specifikt routingprotokoll använder Dijkstras algoritm för att bygga sin routingtabell?(Definition)::Protokollet OSPF.
<!--SR:!2026-03-15,3,230-->

Vilket mätvärde används av OSPF för att avgöra vilken väg som är bäst?(Definition)::Kostnad vilket är direkt baserat på länkens bandbredd.
<!--SR:!2026-03-21,9,250-->

Hur beräknas standardkostnaden för ett gränssnitt i ett OSPF nätverk?(Definition)::Man tar 100 miljoner och dividerar det med länkens bandbredd i bitar per sekund.
<!--SR:!2026-03-26,13,242-->

Vilket routingprotokoll använder antal hopp som sitt enda mätvärde för att hitta den bästa vägen?(Definition)::Protokollet RIP.
<!--SR:!2026-03-14,5,230-->

Vad är det maximala antalet hopp en rutt får ha i protokollet RIP för att anses vara giltig?(Definition)::Maximalt 15 hopp.
<!--SR:!2026-03-15,3,230-->

Vilket värde definierar oändligheten och därmed en onåbar destination i protokollet RIP?(Definition)::Värdet 16 hopp.
<!--SR:!2026-03-14,5,230-->

Enligt tentamensfrågorna vilket protokoll beskrivs som ett internt routingprotokoll baserat på Link State?(Definition)::Protokollet OSPF.
<!--SR:!2026-03-13,2,210-->

Enligt tentamensfrågorna vilket protokoll beskrivs som ett gammalt routingprotokoll där oändligheten är 16?(Definition)::Protokollet RIP.
<!--SR:!2026-03-15,3,230-->

Vilken kategori av routingprotokoll tillhör RIP?(Definition)::Distance Vector.
<!--SR:!2026-03-15,3,230-->

Vilken kategori av routingprotokoll tillhör OSPF?(Definition)::Link State.
<!--SR:!2026-03-15,3,230-->

Vilken kategori av routingprotokoll tillhör BGP?(Definition)::Path Vector.
<!--SR:!2026-03-14,5,230-->

Vilket protokoll används för att koppla samman helt olika autonoma system på Internet?(Definition)::Protokollet BGP.
<!--SR:!2026-03-15,3,230-->

Är protokollet BGP ett internt eller externt routingprotokoll?(Definition)::Det är ett externt routingprotokoll.
<!--SR:!2026-03-15,3,230-->

Vilket transportprotokoll och portnummer förlitar sig BGP på för att skicka sina meddelanden?(Definition)::BGP använder TCP på port 179.
<!--SR:!2026-03-23,10,249-->

Vad är Area 0 i ett OSPF nätverk?(Definition)::Det är den centrala ryggraden som alla andra OSPF areor måste vara direkt anslutna till.
<!--SR:!2026-03-15,3,230-->

Vad kallas kommunikationstypen där en enda sändare skickar data till en specifik utvald grupp av mottagare?(Definition)::Multicast.
<!--SR:!2026-03-14,5,230-->

Vilken specifik IP klass används exklusivt för att tilldela Multicast adresser?(Definition)::Klass D.
<!--SR:!2026-03-14,5,230-->

Inom vilket exakt adressintervall hittar man alla IPv4 adresser för Multicast?(Definition)::Adresserna sträcker sig från 224.0.0.0 till 239.255.255.255.
<!--SR:!2026-03-22,10,250-->

Vilka sex tecken inleder alltid en Multicast MAC adress hexadecimalt?(Definition)::De inleds alltid med 01:00:5E.
<!--SR:!2026-03-11,2,204-->

Hur många bitar kopieras direkt från en Multicast IP adress för att skapa dess motsvarande MAC adress?(Definition)::Exakt 23 bitar kopieras.
<!--SR:!2026-03-22,10,245-->

Vilket protokoll används av datorer på ett lokalt nätverk för att meddela en router att de vill ta emot Multicast trafik?(Definition)::Protokollet IGMP.
<!--SR:!2026-03-22,10,250-->

Vad är det primära syftet med protokollet IGMP?(Definition)::Att hantera prenumerationer på olika Multicast grupper lokalt på ett LAN.
<!--SR:!2026-03-20,8,225-->

Vilken är den nuvarande och mest använda versionen av protokollet IGMP?(Definition)::Version 3.
<!--SR:!2026-03-18,6,222-->

Vad gör ett IGMP Membership Report meddelande?(Definition)::Det skickas av en klient för att tala om för routern att klienten vill gå med i en specifik Multicast grupp.
<!--SR:!2026-03-23,11,250-->
