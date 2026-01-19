# HE1033 Begrepp Föreläsning 4-5

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

Tags: #year2025 #KTH #HE1033 #begrepp

---

IP (Internet Protocol) (Definition);; Ett **förbindelselöst** (connectionless) protokoll som arbetar enligt **"best-effort"**-principen utan garanterad leverans.

IPv4 (Leveransmodell) (Definition);; **Best-effort** leverans. Det innebär att leveransen är **opålitlig** (ingen garanti för att paket kommer fram, ingen felkontroll av data, kan komma i oordning).

Förbindelselös (Connectionless) nätverkstjänst (Definition);; Varje paket (datagram) hanteras **oberoende** av andra. Paket kan ta olika vägar till destinationen och ingen uppkoppling sker före sändning.

MTU (Maximum Transmission Unit) (Definition);; Den största paketstorleken som ett specifikt lager 2-protokoll (t.ex. **Ethernet**) kan överföra (oftast **1500 bytes**).

IPv4-huvud: HLEN (Header Length) (Definition);; Anger huvudets längd i enheter om **4 bytes**. Minsta värde är 5 ($5 \times 4 = 20$ bytes).

IPv4-huvud: Total Length (Definition);; Det totala antalet bytes i datagrammet (**Header + Data**). Fältet är 16 bitar långt.

TTL (Time To Live) (Definition);; Ett fält (8 bitar) som förhindrar att paket snurrar för evigt i loopar genom att värdet minskas med **1** av varje router. Vid 0 kastas paketet.

Protocol-fältet (8 bitar) (Definition);; Anger vilket protokoll på överliggande lager (transportlagret) som datan tillhör. Möjliggör **multiplexering/demultiplexering**.

IPv4-huvud: Protocol (3)
??
- ICMP=1
- TCP=6
- UDP=17

Vilken del av ett IPv4-paket skyddas av Header Checksum?:: Endast **IP-huvudet** (ej datalasten/payload).

Fragmentering (IP) (Definition);; Processen att dela upp ett IP-datagram i mindre delar om det är större än länkens **MTU**. Sker i routrar (IPv4) eller sändare.

Identifier (IP-huvud) (Definition);; Ett 16-bitars fält som identifierar vilket ursprungligt datagram ett fragment tillhör (alla fragment har samma ID).

IPv4-huvud: Flags (3)
??
- Reserverad (alltid 0)
- **DF** (Don't Fragment): Om satt till 1 får paketet inte fragmenteras
- **MF** (More Fragments): Om satt till 1 finns fler fragment efter detta; 0 betyder sista fragmentet

Fragmentation Offset (Definition);; Anger var i det ursprungliga datagrammet detta fragments data hör hemma, mätt i enheter om **8 byte**.

IPv4-adress (storlek) (Definition);; **32 bitar** (4 byte). Skrivs oftast i "dotted decimal" notation (t.ex. 192.168.0.1).

Nätverksadress (Network Address) (Definition);; Den första adressen i ett block. Alla bitar i **värddelen** (host ID) är satta till **0**. Används för routing.

Broadcast-adress (Riktad/Direct) (Definition);; Den sista adressen i ett block. Alla bitar i **värddelen** (host ID) är satta till **1**.

Subnätmask (Subnet Mask) / Prefixlängd (/n) (Definition);; En 32-bitars sekvens (eller tal /n) som anger vilka bitar i IP-adressen som definierar **nätverket**.

CIDR (Classless Inter-Domain Routing) (Definition);; Adresseringsmetod där nätverksdelen kan vara av **variabel längd** (snedstrecksnotation, t.ex. /26).

VLSM (Variable Length Subnet Mask) (Definition);; Tekniken att dela upp ett nätverk i undernät med **olika stora** subnätmasker för att optimera adressutnyttjandet.

Hur beräknas antalet användbara värdar (hosts) i ett subnät med prefixlängd /n?:: $2^{(32 - n)} - 2$ (Minus 2 för nätverksadress och broadcastadress).

ACL (Access Control List) (Definition);; En lista med regler (**permit/deny**) konfigurerade på en router för att filtrera trafik baserat på IP-adress, portar och protokoll.

Standard ACL (Definition);; Filtrerar trafik endast baserat på **källans IP-adress** (Source IP).

Extended ACL (Definition);; Filtrerar trafik baserat på käll-IP, destination-IP, **protokoll** (TCP/UDP) och **portnummer**.

Implicit Deny Any (Definition);; Alla ACL:er avslutas osynligt med en regel som **kastar all trafik** som inte matchat tidigare rader.

Wildcard Mask (Definition);; En mask där **0** betyder "måste matcha" och **1** betyder "bryr mig inte" (motsatsen till en subnätmask).

Wildcard Mask - Princip (2)
??
- **0** = Bitarna måste matcha exakt
- **1** = "Don't care" (ignorera biten)

Vad är Wildcard Mask för en enskild värd (t.ex. 192.168.1.5)?;; **0.0.0.0** (Alla bitar måste matcha).

Vad är Wildcard Mask för ett /24-nätverk?:: **0.0.0.255** (Matcha första 24 bitarna, ignorera sista 8).

Hur beräknas en Wildcard Mask utifrån en subnätmask?:: **255.255.255.255** minus **Subnätmasken**.

ARP (Address Resolution Protocol) (Definition);; Mappar en känd **logisk adress (IP)** till en okänd **fysisk adress (MAC)** på det lokala nätverket.

ICMP (Internet Control Message Protocol) (Definition);; Ett hjälpprotokoll till IP som hanterar **felrapportering** och **diagnostik** (t.ex. Ping). Kapslas in i IP-datagram.

ICMP:s två huvudtyper av meddelanden (2)
||
- **Error-reporting** (t.ex. TTL expired)
- **Query** (t.ex. Echo Request/Reply)

Varför skickar inte ICMP felmeddelanden om felmeddelanden?:: För att undvika **oändliga loopar** av felrapportering och nätverksbelastning.

IPv6-adress (storlek) (Definition);; **128 bitar** (16 byte). Skrivs hexadecimalt med kolon (ex: 2001:db8::1).

Förbättringar i IPv6 jämfört med IPv4 (4)
||
- Större adressrymd (128 bitar)
- Förenklat huvud (fast längd 40 bytes)
- Inbyggd säkerhet (IPSec) och stöd för Anycast
- Ingen fragmentering i routrar

IPv6 vs IPv4: Fragmentering (Definition);; I IPv6 fragmenterar **endast sändaren** (hosten), aldrig routrar längs vägen.

Autokonfigurering (IPv6) (Definition);; En mekanism (**SLAAC**) där en värd automatiskt skapar sin adress genom att kombinera nätverksprefixet med sin MAC-adress.

Datagram-nätverk (Packet Switching) (Definition);; Varje paket innehåller fullständig destinationsadress och routrar fattar beslut individuellt för varje paket.

Virtuell krets (Virtual Circuit Switching) (Definition);; En logisk förbindelse upprättas före sändning; paket identifieras med **VCI** och följer samma väg.

Skillnad mellan Forwarding och Routing (2)
??
- **Forwarding**: Processen att flytta ett paket från ingång till utgång i en router (lokalt).
- **Routing**: Processen att bestämma vägen genom hela nätverket och bygga tabeller (globalt).

Var sker hopsättning (reassembly) av fragmenterade paket?:: Endast hos **slutdestinationen**.

Om HLEN har värdet 10, hur stort är IP-huvudet?:: $10 \times 4 = \mathbf{40}$ **bytes**.

Om Fragment Offset är 100, vilken byte-position börjar datan på?:: $100 \times 8 = \mathbf{800}$ **bytes**.

DHCPv4 - Metoder för tilldelning (3)
||
- **Manuell**: Låser specifik IP till en MAC.
- **Automatisk**: Permanent statisk adress från pool.
- **Dynamisk**: Adressen "leasas" ut under begränsad tid.

DHCP DORA-processen (Steg) (4)
??
- **Discover** (Klient -> Server, Broadcast)
- **Offer** (Server -> Klient)
- **Request** (Klient -> Server)
- **Acknowledge (ACK)** (Server -> Klient)

DHCP Relay Agent (Definition);; En funktion i en router som vidarebefordrar **DHCP-broadcasts** till en server i ett annat subnät.

Syftet med NAT (Definition);; Att spara på publika IPv4-adresser genom att tillåta många enheter att dela på en eller få publika adresser.

NAT: Inside Local Address (Definition);; Den **privata** IP-adressen som en enhet har på det interna nätverket.

NAT: Inside Global Address (Definition);; Den **publika** IP-adressen som representerar den interna enheten mot internet.

PAT (Port Address Translation) (Definition);; Kallas även **NAT Overloading**. Använder unika **portnummer** för att skilja mellan interna enheter.

VLSM - Grundregel (Definition);; Vid adressplanering ska man alltid börja med att tilldela adresser till det **största subnätet** först.

Varför drar man bort 2 när man räknar ut antal hosts?:: En adress reserveras för **Nätverksadressen** och en för **Broadcastadressen**.
