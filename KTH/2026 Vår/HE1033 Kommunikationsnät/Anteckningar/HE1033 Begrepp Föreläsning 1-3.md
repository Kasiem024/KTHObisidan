# HE1033 Begrepp Föreläsning 1-3

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

Tags: #year2025 #KTH #HE1033 #begrepp

---

Datalänklagret(Lager 2)(Definition);; Det lager i OSI-modellen som ansvarar för **nod-till-nod**-kommunikation och tillhandahåller en (logiskt) felfri länk genom **inramning**, adressering samt flödes- och felkontroll.

PDU(Lager 2)(Definition):: **Ram** (Frame).

Inkapsling(Encapsulation)(Definition);; Processen där data från ett högre lager (t.ex. ett IP-paket) placeras inuti en **ram** med tillhörande **header** och **trailer** för sändning på datalänksnivå.

BDP(Bandwidth-Delay Product)(Definition);; Ett mått på det maximala antalet bitar som kan finnas "i röret" samtidigt. Beräknas som: $$BDP = RTT \times \text{Kanalens kapacitet (bps)}$$

RTT(Round Trip Time)(Definition);; Den totala tiden det tar för ett meddelande att färdas från **sändare** till **mottagare** och tillbaka.

Byte stuffing(Definition);; En metod i teckenorienterade protokoll där ett specialtecken, **ESC**, skjuts in i datalasten om flaggans bitmönster förekommer naturligt, för att undvika att det tolkas som slutet på ramen.

Bit stuffing(Definition);; En metod i bitorienterade protokoll där sändaren skjuter in en **nolla** efter varje sekvens av **fem ettor** i rad för att särskilja data från flaggan (01111110).

ARQ(Automatic Repeat Request)(Definition);; En samlingsbeteckning för protokoll som använder **bekräftelser** (ACK) och **timeout** för att automatiskt begära omsändning av förlorade eller skadade ramar.

Stop-and-Wait ARQ(Definition);; Den enklaste ARQ-metoden där sändaren skickar **en ram** och måste vänta på en **ACK** innan nästa ram får skickas.

Go-Back-N ARQ(Definition)(2)
??
- En metod där sändaren kan skicka upp till **N ramar** utan att vänta på ACK.
- Vid fel/timeout sänds den felaktiga ramen **och alla efterföljande ramar** i fönstret om.

Selective-Repeat ARQ(Definition)(3)
??
- En metod där sändaren skickar upp till N ramar.
- Vid fel sänds **endast den specifika ram** som saknas eller är skadad om.
- Kräver mer **buffring** hos mottagaren.

Fönsterstorlek i Go-Back-N(Definition);; Om sekvensnumret har $m$ bitar är den maximala fönsterstorleken: $$W_S = 2^m - 1$$

Fönsterstorlek i Selective-Repeat(Definition);; Om sekvensnumret har $m$ bitar är den maximala fönsterstorleken för både sändare och mottagare: $$W_S = W_R = 2^{m-1}$$

CSMA/CD(Carrier Sense Multiple Access with Collision Detection)(Definition);; En accessmetod som används i trådbundet Ethernet där stationen **lyssnar** (Carrier Sense) före sändning och **avbryter** direkt om en **kollision** upptäcks.

Binary Exponential Backoff(Definition);; En algoritm för att välja en slumpmässig väntetid ($T_B$) efter en kollision, där intervallet för slumpnumret **fördubblas** för varje misslyckat försök (upp till 10 försök, max 16 totalt).

MAC-adress(Fysisk adress)(Definition);; En unik **48-bitars** identifierare för ett nätverkskort, ofta skriven hexadecimalt (t.ex. 00:60:2F:3A:07:BC).

Broadcast MAC-adress(Definition);; En adress bestående av enbart ettor: **FF:FF:FF:FF:FF:FF**.

ARP(Address Resolution Protocol)(Definition);; Ett protokoll som används för att mappa en känd **IP-adress** till en okänd **MAC-adress** inom ett lokalt nätverk.

Persistence methods(CSMA)(3)
||
- **1-persistent**: Sänder direkt när kanalen blir ledig.
- **Nonpersistent**: Väntar en slumpmässig tid om kanalen är upptagen.
- **P-persistent**: Sänder med sannolikheten *p* när kanalen blir ledig.

Standard Ethernet ramstorlek(2)
??
- **Minsta längd**: 64 bytes (512 bitar)
- **Maximal längd**: 1518 bytes (utan VLAN-tagg)

Ethernet Payload(Datalast)(2)
??
- **Minimum**: 46 bytes (kräver padding om mindre)
- **Maximum**: 1500 bytes (MTU)

LLC(Logical Link Control)(Definition);; Det övre dellagret i datalänkslagret som hanterar **flödeskontroll**, felkontroll och utgör gränssnittet mot nätverksskiktet.

MAC Sublayer(Definition);; Det nedre dellagret i datalänkslagret som hanterar tillträde till mediet (**accessmetoder**) och fysisk adressering.

Fråga: Vad är syftet med en jammingsignal i CSMA/CD?;; Att informera alla andra stationer på nätverket om att en **kollision** har inträffat så att de omedelbart avbryter sina sändningar och startar backoff-algoritmen.

Fråga: Hur skiljer sig Full Duplex Ethernet från Half Duplex?;; I **Full Duplex** kan stationer sända och ta emot samtidigt via en switch, vilket gör att **kollisioner inte kan uppstå** och CSMA/CD deaktiveras.

Fråga: Vad är skillnaden mellan en Hub och en Switch på Lager 2?
??
- **Hub**: Skickar vidare inkommande signaler till alla portar (Layer 1-enhet egentligen). Delad bandbredd.
- **Switch**: Skickar ramar selektivt till målporten baserat på MAC-tabellen. Dedikerad bandbredd.

Fråga: Varför finns en minsta ramlängd (64 bytes) i Ethernet?;; För att garantera att sändaren fortfarande håller på att sända när en **kollisionssignal** hinner komma tillbaka från nätets mest avlägsna punkt.

Fråga: Vilken formel beräknar länkutnyttjande (U) för Stop-and-Wait?(Definition);; $$U = \frac{t_{frame}}{t_{frame} + 2t_{prop}}$$ (där $t_{frame}$ är sändningstid och $t_{prop}$ är utbredningstid).

Fråga: Vad händer i Go-Back-N om ett ACK går förlorat men nästa ACK tas emot korrekt?:: Ingenting negativt. ACK i Go-Back-N är **kumulativa**, så en senare ACK bekräftar alla tidigare ramar.

Fråga: Vad är "Flow Control" (flödeskontroll)?(Definition);; En mekanism för att förhindra att en **snabb sändare** dränker en **långsam mottagare** med mer data än den kan buffra.

Fråga: Vad är skillnaden mellan Unicast, Multicast och Broadcast?(3)
||
- **Unicast**: En till en.
- **Multicast**: En till en specifik grupp.
- **Broadcast**: En till alla på nätverket.

Fråga: Hur lång är en MAC-adress i bitar och bytes?(Definition):: **48 bitar**, vilket motsvarar **6 bytes**.

Fråga: Vad är syftet med FCS (Frame Check Sequence) i en Ethernet-ram?(Definition):: Att kontrollera om ramen har skadats under överföringen med hjälp av en **CRC** (Cyclic Redundancy Check).

Fråga: Vilken nätverkstopologi används främst i moderna Ethernet-LAN?(Definition);; **Stjärntopologi** (Star topology) där alla noder är anslutna till en central switch.

Fråga: Vad är den huvudsakliga skillnaden mellan flödeskontroll och felkontroll?(2)
||
- **Flödeskontroll**: Reglerar mängden data så att sändaren inte dränker mottagaren.
- **Felkontroll**: Upptäcker och korrigerar bitfel eller förlorade ramar (t.ex. via CRC och ARQ).

Fråga: Vilka tre komponenter måste ett ARQ-protokoll alltid innehålla enligt tentan?(3)
??
- **Buffring** på sändarsidan (för omsändning).
- **Sekvensnummer** (för att identifiera ramar).
- **Timeout-klocka** (för att upptäcka förluster).

Fråga: Beräkna minsta antal bitar ($k$) för sekvensnummer i Go-Back-N om fönsterstorleken är 15.(Definition):: Använd formeln $W_S = 2^k - 1$. $15 = 2^k - 1 \implies 16 = 2^k \implies k = 4$ bitar.

Fråga: Varför är CSMA/CD mindre viktigt i moderna switchade nätverk?(Definition):: Moderna nätverk använder ofta **Full Duplex**-anslutningar till en switch, vilket innebär att sändning och mottagning sker på separata ledningar och därmed kan inga kollisioner uppstå.

Fråga: Vad händer med sändarfönstret i Go-Back-N när en ACK tas emot?(Definition):: Fönstret **glider framåt** (sliding window) så att nya ramar får skickas.

Fråga: Vilken nätverksenhet delar upp ett nätverk i olika kollisionsdomäner?(Definition):: En **Switch** (varje port är en egen kollisionsdomän).

Fråga: Vad händer i Selective-Repeat om en ACK för ram 2 går förlorad, men ACK för ram 3 tas emot?(Definition):: Sändaren sändar om **endast ram 2** när dess timer går ut. Till skillnad från Go-Back-N är ACK i Selective-Repeat ofta individuella.
