# HE1033 Begrepp Föreläsning 1-3

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

Tags: #year2025 #KTH #HE1033 #begrepp

---

Datalänklagret(Lager 2)(Definition);; Det lager i OSI-modellen som ansvarar för **nod-till-nod**-kommunikation och tillhandahåller en (logiskt) felfri länk genom **inramning**, adressering samt flödes- och felkontroll.
<!--SR:!2026-02-28,1,181!2026-03-03,2,230-->

PDU(Lager 2)(Definition):: **Ram** (Frame).
<!--SR:!2026-03-05,4,211-->

Inkapsling(Encapsulation)(Definition);; Processen där data från ett högre lager (t.ex. ett IP-paket) placeras inuti en **ram** med tillhörande **header** och **trailer** för sändning på datalänksnivå.
<!--SR:!2026-03-02,1,170!2026-03-02,3,230-->

BDP(Bandwidth-Delay Product)(Definition);; Ett mått på det maximala antalet bitar som kan finnas "i röret" samtidigt. Beräknas som: $$RTT \times \text{Kanalens kapacitet (bps)}$$
<!--SR:!2026-02-28,1,191!2026-03-03,2,211-->

RTT(Round Trip Time)(Definition);; Den totala tiden det tar för ett meddelande att färdas från **sändare** till **mottagare** och tillbaka.
<!--SR:!2026-02-28,2,230!2026-03-01,2,211-->

Byte stuffing(Definition);; En metod i teckenorienterade protokoll där ett specialtecken, **ESC**, skjuts in i datalasten om flaggans bitmönster förekommer naturligt, för att undvika att det tolkas som slutet på ramen.
<!--SR:!2026-03-01,2,210!2026-03-01,3,250-->

Bit stuffing(Definition);; En metod i bitorienterade protokoll där sändaren skjuter in en **nolla** efter varje sekvens av **fem ettor** i rad för att särskilja data från flaggan (01111110).
<!--SR:!2026-03-06,5,230!2026-03-01,3,250-->

ARQ(Automatic Repeat Request)(Definition);; En samlingsbeteckning för protokoll som använder **bekräftelser** (ACK) och **timeout** för att automatiskt begära omsändning av förlorade eller skadade ramar.
<!--SR:!2026-03-01,2,201!2026-03-02,3,230-->

Stop-and-Wait ARQ(Definition);; Den enklaste ARQ-metoden där sändaren skickar **en ram** och måste vänta på en **ACK** innan nästa ram får skickas.
<!--SR:!2026-02-28,3,250!2026-03-01,3,250-->

Go-Back-N ARQ(Definition)(2)
??
- En metod där sändaren kan skicka upp till **N ramar** utan att vänta på ACK.
- Vid fel/timeout sänds den felaktiga ramen **och alla efterföljande ramar** i fönstret om.
<!--SR:!2026-02-28,2,230!2026-03-06,5,230-->

Selective-Repeat ARQ(Definition)(3)
??
- En metod där sändaren skickar upp till N ramar.
- Vid fel sänds **endast den specifika ram** som saknas eller är skadad om.
- Kräver mer **buffring** hos mottagaren.
<!--SR:!2026-02-28,2,230!2026-03-02,3,230-->

Fönsterstorlek i Go-Back-N(Definition);; Om sekvensnumret har $m$ bitar är den maximala fönsterstorleken: $$W_S = 2^m - 1$$
<!--SR:!2026-03-02,3,230!2026-03-01,3,250-->

Fönsterstorlek i Selective-Repeat(Definition);; Om sekvensnumret har $m$ bitar är den maximala fönsterstorleken för både sändare och mottagare: $$W_S = W_R = 2^{m-1}$$
<!--SR:!2026-02-28,2,230!2026-03-01,3,250-->

CSMA/CD(Carrier Sense Multiple Access with Collision Detection)(Definition);; En accessmetod som används i trådbundet Ethernet där stationen **lyssnar** (Carrier Sense) före sändning och **avbryter** direkt om en **kollision** upptäcks.
<!--SR:!2026-03-01,2,210!2026-02-28,2,230-->

Binary Exponential Backoff(Definition);; En algoritm för att välja en slumpmässig väntetid ($T_B$) efter en kollision, där intervallet för slumpnumret **fördubblas** för varje misslyckat försök (upp till 10 försök, max 16 totalt).
<!--SR:!2026-03-03,2,181!2026-03-01,2,210-->

MAC-adress(Fysisk adress)(Definition);; En unik **48-bitars** identifierare för ett nätverkskort, ofta skriven hexadecimalt (t.ex. 00:60:2F:3A:07:BC).
<!--SR:!2026-02-28,2,221!2026-03-03,2,221-->

Broadcast MAC-adress(Definition);; En adress bestående av enbart ettor: **FF:FF:FF:FF:FF:FF**.
<!--SR:!2026-02-28,2,230!2026-03-02,3,230-->

ARP(Address Resolution Protocol)(Definition);; Ett protokoll som används för att mappa en känd **IP-adress** till en okänd **MAC-adress** inom ett lokalt nätverk.
<!--SR:!2026-02-28,2,230!2026-03-01,3,250-->

Persistence methods(CSMA)(3)
||
- **1-persistent**: Sänder direkt när kanalen blir ledig.
- **Nonpersistent**: Väntar en slumpmässig tid om kanalen är upptagen.
- **P-persistent**: Sänder med sannolikheten *p* när kanalen blir ledig.
<!--SR:!2026-03-03,2,171-->

Standard Ethernet ramstorlek(2)
??
- **Minsta längd**: 64 bytes (512 bitar)
- **Maximal längd**: 1518 bytes (utan VLAN-tagg)
<!--SR:!2026-03-01,2,211!2026-03-01,3,231-->

LLC(Logical Link Control)(Definition);; Det övre dellagret i datalänkslagret som hanterar **flödeskontroll**, felkontroll och utgör gränssnittet mot nätverksskiktet.
<!--SR:!2026-03-01,2,210!2026-03-01,3,250-->

MAC Sublayer(Definition);; Det nedre dellagret i datalänkslagret som hanterar tillträde till mediet (**accessmetoder**) och fysisk adressering.
<!--SR:!2026-02-28,2,211!2026-03-02,3,230-->

Fråga: Vad är syftet med en jammingsignal i CSMA/CD?;; Att informera alla andra stationer på nätverket om att en **kollision** har inträffat så att de omedelbart avbryter sina sändningar och startar backoff-algoritmen.
<!--SR:!2026-03-05,4,211!2026-03-01,3,250-->

Fråga: Hur skiljer sig Full Duplex Ethernet från Half Duplex?;; I **Full Duplex** kan stationer sända och ta emot samtidigt via en switch, vilket gör att **kollisioner inte kan uppstå** och CSMA/CD deaktiveras.
<!--SR:!2026-03-01,2,191!2026-03-01,3,250-->

Fråga: Varför finns en minsta ramlängd (64 bytes) i Ethernet?;; För att garantera att sändaren fortfarande håller på att sända när en **kollisionssignal** hinner komma tillbaka från nätets mest avlägsna punkt.
<!--SR:!2026-03-02,3,230!2026-02-28,2,230-->

Fråga: Vilken formel beräknar länkutnyttjande (U) för Stop-and-Wait?(Definition);; $$U = \frac{t_{frame}}{t_{frame} + 2t_{prop}}$$ (där $t_{frame}$ är sändningstid och $t_{prop}$ är utbredningstid).
<!--SR:!2026-03-01,2,191!2026-03-01,3,241-->

Fråga: Vad är "Flow Control" (flödeskontroll)?(Definition);; En mekanism för att förhindra att en **snabb sändare** dränker en **långsam mottagare** med mer data än den kan buffra.
<!--SR:!2026-02-28,2,230!2026-03-01,3,250-->

Fråga: Vad är skillnaden mellan Unicast, Multicast och Broadcast?(3)
||
- **Unicast**: En till en.
- **Multicast**: En till en specifik grupp.
- **Broadcast**: En till alla på nätverket.
<!--SR:!2026-02-28,3,250-->

Fråga: Hur lång är en MAC-adress i bitar och bytes?(Definition):: **48 bitar**, vilket motsvarar **6 bytes**.
<!--SR:!2026-02-28,1,190-->

Fråga: Vad är syftet med FCS (Frame Check Sequence) i en Ethernet-ram?(Definition):: Att kontrollera om ramen har skadats under överföringen med hjälp av en **CRC** (Cyclic Redundancy Check).
<!--SR:!2026-03-01,2,211-->

Fråga: Vilken nätverkstopologi används främst i moderna Ethernet-LAN?(Definition);; **Stjärntopologi** (Star topology) där alla noder är anslutna till en central switch.
<!--SR:!2026-03-01,3,250!2026-03-02,1,171-->

Fråga: Vad är den huvudsakliga skillnaden mellan flödeskontroll och felkontroll?(2)
||
- **Flödeskontroll**: Reglerar mängden data så att sändaren inte dränker mottagaren.
- **Felkontroll**: Upptäcker och korrigerar bitfel eller förlorade ramar (t.ex. via CRC och ARQ).
<!--SR:!2026-03-02,3,211-->

Fråga: Vilka tre komponenter måste ett ARQ-protokoll alltid innehålla enligt tentan?(3)
??
- **Buffring** på sändarsidan (för omsändning).
- **Sekvensnummer** (för att identifiera ramar).
- **Timeout-klocka** (för att upptäcka förluster).
<!--SR:!2026-03-01,2,211!2026-03-01,3,250-->

Fråga: Beräkna minsta antal bitar ($k$) för sekvensnummer i Go-Back-N om fönsterstorleken är 15:: Använd formeln $W_S = 2^k - 1$. $15 = 2^k - 1 \implies 16 = 2^k \implies k = 4$ bitar.
<!--SR:!2026-03-01,3,250-->

Fråga: Varför är CSMA/CD mindre viktigt i moderna switchade nätverk?(Definition):: Moderna nätverk använder ofta **Full Duplex**-anslutningar till en switch, vilket innebär att sändning och mottagning sker på separata ledningar och därmed kan inga kollisioner uppstå.
<!--SR:!2026-02-28,2,230-->

Fråga: Vad händer med sändarfönstret i Go-Back-N när en ACK tas emot?(Definition):: Fönstret **glider framåt** (sliding window) så att nya ramar får skickas.
<!--SR:!2026-03-02,3,231-->

Fråga: Vilken nätverksenhet delar upp ett nätverk i olika kollisionsdomäner?(Definition):: En **Switch** (varje port är en egen kollisionsdomän).
<!--SR:!2026-02-28,1,190-->

Fråga: Vad händer i Selective-Repeat om en ACK för ram 2 går förlorad, men ACK för ram 3 tas emot?(Definition):: Sändaren sändar om **endast ram 2** när dess timer går ut. Till skillnad från Go-Back-N är ACK i Selective-Repeat ofta individuella.
<!--SR:!2026-03-01,3,250-->

Logical Link Control(LLC)(Definition)::Det övre underlagret i datalänklagret som hanterar flödeskontroll felkontroll och gränssnittet mot nätverkslagret.
<!--SR:!2026-03-01,2,210-->

Media Access Control(MAC)(Definition)::Det undre underlagret i datalänklagret som hanterar fysisk adressering och åtkomst till det fysiska mediet.
<!--SR:!2026-02-28,1,190-->

Vilket underlager i datalänklagret ansvarar för att bestämma vem som får sända på en delad kabel?::MAC underlagret.
<!--SR:!2026-02-28,2,230-->

Vad är den minsta tillåtna ramlängden i ett Ethernet nätverk?(Definition)::64 byte vilket är exakt 512 bitar.
<!--SR:!2026-02-28,2,230-->

Varför måste Ethernet ramar vara minst 64 byte långa?(Definition)::För att sändningen ska pågå tillräckligt länge så att sändaren säkert hinner upptäcka en eventuell kollision.
<!--SR:!2026-03-01,2,210-->

Address Resolution Protocol(ARP)(Definition)::Ett protokoll som används för att översätta en logisk IP adress till en fysisk MAC adress.
<!--SR:!2026-03-01,2,211-->

Vilken exakt MAC adress används för att skicka en Broadcast?(Definition)::Adressen FF:FF:FF:FF:FF:FF där alla 48 bitar är ettor.
<!--SR:!2026-02-28,2,230-->

Hur agerar Go Back N när en felaktig eller förlorad ram upptäcks hos mottagaren?(Definition)::Mottagaren kastar den felaktiga ramen och raderar alla efterföljande ramar. Sändaren tvingas sända om alla dessa.
<!--SR:!2026-02-28,2,230-->

Hur agerar Selective Repeat när en felaktig eller förlorad ram upptäcks hos mottagaren?(Definition)::Mottagaren kastar endast den specifikt skadade ramen och buffrar de korrekta efterföljande ramarna.
<!--SR:!2026-03-01,3,250-->

Vad är den maximala fönsterstorleken för både sändaren och mottagaren i protokollet Selective Repeat?(Definition)::Fönsterstorleken är $W = 2^{k - 1}$
<!--SR:!2026-02-28,2,230-->

Vilken formel används för att beräkna länkutnyttjande i protokollet Stop and Wait?(Definition)::Formeln är $U = \frac{t_{frame}}{2 \times t_{prop} + t_{frame}}$
<!--SR:!2026-03-01,3,250-->

Vad står begreppet $t_{frame}$ för?(Definition)::Det är sändningstiden. Tiden det tar för sändaren att mata ut ramens alla bitar på den fysiska länken.
<!--SR:!2026-02-28,1,181-->

Vilken matematisk formel används för att beräkna $t_{frame}$?(Definition)::$t_{frame} = \frac{\text{Ramens storlek i bitar}}{\text{Länkens överföringshastighet i bitar per sekund}}$
<!--SR:!2026-02-28,1,191-->

Vad står begreppet $t_{prop}$ för?(Definition)::Det är utbredningstiden. Tiden det tar för en enda bit att färdas genom det fysiska mediet från sändaren till mottagaren.
<!--SR:!2026-02-28,1,181-->

Vilken matematisk formel används för att beräkna $t_{prop}$?(Definition)::$t_{prop} = \frac{\text{Fysiskt avstånd i meter}}{\text{Utbredningshastigheten i mediet}}$
<!--SR:!2026-02-28,2,230-->

Vilken av variablerna t_frame och t_prop påverkas om du ökar storleken på filen du vill skicka?(Definition)::Endast $t_{frame}$ påverkas. Utbredningstiden $t_{prop}$ är konstant för en given länk och beror enbart på avstånd och fysiskt medium.
<!--SR:!2026-03-01,2,211-->

Hur beräknas den totala tiden för att skicka en ram och ta emot en kvittens i protokollet Stop and Wait?(Definition)::Den totala tiden är $t_{frame} + 2 \times t_{prop}$.
<!--SR:!2026-02-28,1,181-->

Vilka är de tre definierande egenskaperna för transportprotokollet TCP?(Definition)::Det är tillförlitligt, det är anslutningsorienterat och det garanterar att datan levereras i exakt rätt ordning.
<!--SR:!2026-02-28,1,191-->

Vilka är de definierande egenskaperna för transportprotokollet UDP?(Definition)::Det är förbindelselöst, det är inte tillförlitligt och det ger inga garantier för varken leverans eller ordningsföljd.
<!--SR:!2026-02-28,1,181-->

Enligt tentamensmatchningen vilket protokoll beskrivs som "Leverans av IP datagram som varken garanteras eller skickas i sekvens"?(Definition)::UDP
<!--SR:!2026-02-28,2,230-->

Varför används UDP istället för TCP i vissa applikationer trots att det inte är tillförlitligt?(Definition)::För att UDP saknar all overhead för felkontroll och omsändningar vilket gör det mycket snabbare för realtidsapplikationer.
<!--SR:!2026-03-05,4,211-->