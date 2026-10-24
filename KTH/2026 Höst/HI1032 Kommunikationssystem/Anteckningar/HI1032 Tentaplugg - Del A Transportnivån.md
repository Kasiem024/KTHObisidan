---
tags:
  - tenta
  - HI1032
  - nätverk
  - KTH
  - year2026
created: 2026-10-02
updated: 2026-10-19
description: "Flashcards för HI1032:s Del A, transportnivån, ordnade efter samma begrepp som teorifilen Tentasvar Del A. Varje avsnittsrubrik har ämnets tentasannolikhet inom parentes. Säkra ämnen har flest kort, möjliga bara något enstaka. Korten tränar att tillämpa det tentan delar ut, som ACK-reglerna, RTO och cwnd-grafen, inte att rabbla det."
---

# HI1032 Tentaplugg - Del A Transportnivån

Flashcards för HI1032:s Del A, transportnivån, ordnade efter samma begrepp som teorifilen Tentasvar Del A. Varje avsnittsrubrik har ämnets tentasannolikhet inom parentes. Säkra ämnen har flest kort, möjliga bara något enstaka. Korten tränar att tillämpa det tentan delar ut, som ACK-reglerna, RTO och cwnd-grafen, inte att rabbla det.

## Transportlagret och vad det ska lösa (Trolig)

Vilka enheter på vägen mellan två värdar har ett eget transportlager?::Bara ==ändpunkterna (värdarna)== — en router jobbar upp till nätlagret (IP) och en switch bara på länklagret.
<!--SR:!fsrs,2026-10-25T04:27:22.579Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:27:22.579Z-->

Vad ger IP *inte* för garantier, som transportlagret måste fylla igen? (3)
||
- **Tappade paket** – paket kan försvinna på vägen
- **Omkastad ordning** – två paket kan komma fram i omvänd ordning
- **Bitfel** – bitar kan bli förvanskade, och IP fångar det på sin höjd i IPv4
<!--SR:!fsrs,2026-10-21T11:50:46.234Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:50:46.234Z-->

## Portar och multiplexing (Säker)

Vad består en socketadress av?::==IP-adress + portnummer== — IP-adressen pekar ut värden, porten pekar ut programmet på den värden.
<!--SR:!fsrs,2026-10-23T20:03:13.542Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:03:13.542Z-->

Vad gör transportlagret med multiplexing respektive demultiplexing? (2)
||
- **Multiplexing** – tar data från många processer och skickar ner allt över samma IP
- **Demultiplexing** – läser destinationsporten på inkommande paket och lämnar var och en till rätt process
<!--SR:!fsrs,2026-10-21T11:42:13.986Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:42:13.986Z-->

Vad skiljer en well-known-port från en efemär port?::En ==well-known-port är ett lågt, fast nummer som IANA tilldelar en servertjänst==, medan en efemär port är ett tillfälligt nummer en klient tar för stunden.
<!--SR:!fsrs,2026-10-20T22:38:43.104Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T22:38:43.104Z-->

## UDP (Trolig)

Vad kännetecknar UDP som transporttjänst?::En ==förbindelselös och opålitlig== ren datagramtjänst — ingen uppkoppling, ingen bekräftelse och ingen omsändning.
<!--SR:!fsrs,2026-10-25T04:29:16.385Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:29:16.385Z-->

Varför tar UDP:s checksumma med några fält ur IP-huvudet (ett pseudohuvud)?::För att kunna upptäcka om paketet ==levererats till fel värd== — annars kan ett datagram komma fram helt men till fel mottagare om IP-huvudet förvanskats.
<!--SR:!fsrs,2026-10-21T11:45:48.239Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:45:48.239Z-->

## Inkapsling (Möjlig)

I vilken ordning kapslas ett meddelande in på väg ner genom lagren?::Det får först ett ==TCP-/UDP-huvud==, blir sedan data i ett IP-paket, och till sist data i en länkram.
<!--SR:!fsrs,2026-10-21T11:55:52.429Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:55:52.429Z-->

## TCP-huvudet — fälten du tolkar (Trolig)

Vad innebär det att RST-flaggan är satt i ett TCP-segment?::Att förbindelsen ==återställs, alltså rivs abrupt==.
<!--SR:!fsrs,2026-10-25T04:23:53.079Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:23:53.079Z-->

Varför behöver TCP-huvudet ett HLEN-fält (huvudlängd)?::För att huvudet är ==olika långt (20–60 byte)== beroende på hur mycket options som finns med, så mottagaren måste få veta var datan börjar.
<!--SR:!fsrs,2026-10-23T20:16:11.551Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:16:11.551Z-->

## TCP-egenskaper (Trolig)

Hur ser applikationen TCP:s dataström, till skillnad från UDP:s?::Som en ==ström av byte== utan paketgränser — TCP självt delar upp strömmen i segment.
<!--SR:!fsrs,2026-10-25T04:31:08.910Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:31:08.910Z-->

Hur ger TCP pålitlig överföring trots att IP kan tappa paket?::Med ==felkontroll genom bekräftelser och omsändning== — det som inte bekräftas skickas om.
<!--SR:!fsrs,2026-10-23T20:03:57.461Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:03:57.461Z-->

## Etablering — three-way handshake (Trolig)

Vilka tre segment utgör TCP:s three-way handshake vid uppkoppling? (3)
||
- **SYN** – klienten (active open) skickar SYN med sitt initiala sekvensnummer (ISN)
- **SYN + ACK** – servern bekräftar klientens ISN och skickar sitt eget
- **ACK** – klienten bekräftar serverns ISN, och förbindelsen står
<!--SR:!fsrs,2026-10-20T21:43:46.590Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:43:46.590Z-->

Varför är bekräftelsenumret i handskakningen ett steg högre än motpartens sekvensnummer (t.ex. ack 8001 på seq 8000)?::För att ==ett SYN förbrukar ett sekvensnummer==, så nästa väntade byte blir ISN + 1.
<!--SR:!fsrs,2026-10-21T11:55:07.662Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:55:07.662Z-->

## Dataöverföring (Trolig)

Vad betyder sekvensnumret respektive ack-numret på ett TCP-datasegment? (2)
||
- **Sekvensnummer** – numret på den första byten i segmentet
- **Ack-nummer** – numret på nästa byte mottagaren väntar sig (allt före det är mottaget)
<!--SR:!fsrs,2026-10-23T20:17:39.904Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:17:39.904Z-->

## Terminering — three-way och four-way (Trolig)

Varför räcker ibland tre segment för att stänga en TCP-förbindelse (three-way)?::För att den passiva sidan hinner ==slå ihop sitt ACK och sitt FIN== till ett enda segment.
<!--SR:!fsrs,2026-10-21T11:54:44.478Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:54:44.478Z-->

Vad menas med half-close vid TCP-terminering?::Att den ena sidan ==slutar skicka data men fortsätter ta emot== — dess ena riktning stängs medan den andra står öppen.
<!--SR:!fsrs,2026-10-23T04:30:40.147Z,2,1.3363301,8.37949113,2,4,0,0,2026-10-21T04:30:40.147Z-->

## Tillståndsdiagrammet — hur du följer det (Trolig)

Vad gör den aktivt stängande TCP-änden i tillståndet TIME-WAIT?::Den ==väntar 2MSL== (MSL "standard" 60 s) innan den går till CLOSED, så att ett tappat slut-ACK hinner skickas om.
<!--SR:!fsrs,2026-10-25T05:34:18.774Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:34:18.774Z-->

## MSS och MTU (Säker)

Vad är skillnaden mellan MTU och MSS?::==MTU är den största ram en länk kan bära==, medan MSS är den största nyttolast TCP lägger i ett segment för att få plats utan fragmentering.
<!--SR:!fsrs,2026-10-25T04:28:14.854Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:28:14.854Z-->

IP kan fragmentera för stora paket — vilka skäl ger föreläsaren att ändå undvika det? (3)
||
- **Overhead** – ett andra fragment kan bära bara någon enstaka byte data, resten blir huvuden
- **Omsändning** – tappas ett enda fragment måste hela paketet skickas om
- **RTT-mätning** – blir oklar när paket fragmenteras, vilket TCP behöver för sina timers
<!--SR:!fsrs,2026-10-21T11:56:31.109Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:56:31.109Z-->

Hur hittar TCP den största segmentstorleken (MSS) som får plats på vägen? (2)
||
- **Först** – fråga den anslutna länken vilken MTU den stöder
- **Sedan** – kör Path MTU discovery för att hitta minsta MTU längs hela vägen
<!--SR:!fsrs,2026-10-20T21:41:53.759Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:41:53.759Z-->

## Path MTU Discovery (Trolig)

Vilken roll spelar Don't Fragment (DF)-flaggan i Path MTU discovery?::Den ==förbjuder routrarna att fragmentera paketet==, så ett för stort paket slängs i stället och ger ett ICMP-svar att lära sig MTU:n av.
<!--SR:!fsrs,2026-10-23T20:06:40.876Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:06:40.876Z-->

Vad händer i Path MTU discovery när en länk inte kan bära ett paket som har DF satt?::Paketet ==slängs och en ICMP "Fragmentation Needed" skickas tillbaka== med länkens MTU, så avsändaren kan sänka MSS och försöka igen.
<!--SR:!fsrs,2026-10-23T20:16:03.143Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:16:03.143Z-->

## TCP som byteström och förbindelse (Trolig)

Vad menas med att TCP ser datan som en "ström av byte"?::Appen lämnar en ==byteström== som TCP själv delar upp i segment och sätter ihop i rätt ordning hos mottagaren
<!--SR:!fsrs,2026-10-25T04:27:14.619Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:27:14.619Z-->

## Kontrollflaggorna (Trolig)

Vad gör RST-flaggan?::Begär att förbindelsen ==avbryts direkt==, t.ex. vid försök att nå en port som inte lyssnar
<!--SR:!fsrs,2026-10-25T04:28:02.690Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:28:02.690Z-->

Vad är syftet med PSH-flaggan?::==Skicka det som finns direkt== i stället för att vänta på ett fullt segment, t.ex. vid interaktiv terminal
<!--SR:!fsrs,2026-10-25T04:28:46.118Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:28:46.118Z-->

## Numreringssystem: sekvens- och ACK-nummer (Trolig)

Vad står sekvensnumret för i ett datasegment?::Numret på segmentets ==första databyte==
<!--SR:!fsrs,2026-10-23T20:20:07.919Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:20:07.919Z-->

Hur får man nästa segments sekvensnummer?::==Sekvensnumret plus antalet byte== i det här segmentet
<!--SR:!fsrs,2026-10-20T21:42:11.535Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:42:11.535Z-->

## Tillstånd: etablering, terminering och TIME-WAIT (Trolig)

Vad uppnår trevägshandskakningen vid etablering?::Att båda sidor ==lär sig varandras startnummer== innan data skickas
<!--SR:!fsrs,2026-10-25T04:24:44.018Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:24:44.018Z-->

Vad betyder det att ett FIN bara gör en "half-close"?::Den som skickar FIN ==slutar skicka data men kan fortfarande kvittera== det som kommer åt andra hållet
<!--SR:!fsrs,2026-10-20T22:37:44.385Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T22:37:44.385Z-->

## Felkontroll i TCP (Trolig)

Vilka tre verktyg bygger TCP:s felkontroll på? (3)
||
- **Kvittenser (ACK)** – mottagaren bekräftar vad som kommit fram
- **Omsändning** – det som inte kvitteras skickas igen
- **Omsändningstimers** – avgör hur länge sändaren väntar innan omsändning
<!--SR:!fsrs,2026-10-25T05:12:39.746Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:12:39.746Z-->

## ACK-reglerna och hur man tillämpar dem (Säker)

**Kumulativ ACK**;;Ett ACK kvitterar ==allt till och med numret minus 1==, inte bara segmentet som just kom
<!--SR:!fsrs,2026-10-23T04:29:21.281Z,2,1.3363301,8.37949113,2,4,0,0,2026-10-21T04:29:21.281Z!fsrs,2026-10-25T04:29:30.377Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:29:30.377Z-->

Vad gör mottagaren med ett segment som kommer i oordning?::==Buffrar det== men kvitterar det inte — skickar direkt en dubblett-ACK med samma väntade nummer tills hålet fyllts
<!--SR:!fsrs,2026-10-23T20:10:52.306Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:10:52.306Z-->

När får en ACK fördröjas, och hur länge?::När allt kommit i ordning och mottagaren inget eget har att skicka — ==upp till 500 ms== eller tills nästa segment kommer
<!--SR:!fsrs,2026-10-25T05:37:27.038Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:37:27.038Z-->

Varför gör en tappad ACK oftast ingen skada?::Nästa ==kumulativa ACK== täcker ändå allt dessförinnan, så inget behöver sändas om
<!--SR:!fsrs,2026-10-25T04:29:03.093Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:29:03.093Z-->

## Omsändning: timeout och fast retransmit (Trolig)

Vad är fast retransmit?::Sändaren sänder om ett segment ==efter tre dubblett-ACK:er==, utan att vänta på att timern löper ut
<!--SR:!fsrs,2026-10-23T20:03:01.558Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:03:01.558Z-->

För vilka segment startar TCP en omsändningstimer?::För ==varje skickat datasegment==, inte för rena ACK-segment
<!--SR:!fsrs,2026-10-20T21:40:50.184Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:40:50.184Z-->

## RTO: hur länge TCP väntar på en ACK (Säker)

Vad är $\text{RTT}_\text{S}$, och hur räknas det fram?::Den ==utjämnade rundturstiden==, ett glidande medelvärde (EWMA) av den mätta $\text{RTT}_\text{M}$ med vikten $\alpha = 1/8$
<!--SR:!fsrs,2026-10-21T11:49:20.907Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:49:20.907Z-->

Vad mäter $\text{RTT}_\text{D}$?::Hur mycket den ==mätta rundturstiden avviker== från den utjämnade (även det utjämnat över tid)
<!--SR:!fsrs,2026-10-21T11:51:41.497Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:51:41.497Z-->

Varför är $\text{RTO} = \text{RTT}_\text{S} + 4 \cdot \text{RTT}_\text{D}$ i stället för bara $k \cdot \text{RTT}_\text{S}$?::Tillägget ger en ==marginal som växer när rundturstiden varierar==, så en enstaka topp inte utlöser en onödig omsändning
<!--SR:!fsrs,2026-10-21T11:57:31.596Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:57:31.596Z-->

## Karns algoritm (Möjlig)

Vad säger Karns algoritm om RTT-mätning vid en omsändning?::Använd ==inte rundturstiden från ett omsänt segment==, eftersom man inte vet vilken sändning kvittensen gäller
<!--SR:!fsrs,2026-10-25T04:25:18.429Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:25:18.429Z-->

## TCP-timers (Trolig)

Vad gör persistence-timern?::Om rwnd = 0 ==sonderar sändaren var 60:e sekund== ifall fönstret öppnats, så ett tappat fönster-ACK inte låser båda sidor
<!--SR:!fsrs,2026-10-23T20:08:19.907Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:08:19.907Z-->

Varför behövs TIME-WAIT i 2 × MSL?::Ifall det sista ==FIN-ACK:et tappas== måste sidan kunna sända om sitt FIN
<!--SR:!fsrs,2026-10-21T11:52:52.672Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:52:52.672Z-->

## SACK – selektiva kvittenser (Trolig)

Vad lägger SACK till en vanlig kumulativ kvittens?::==Exakt vilka segment utanför ordning mottagaren redan har==, så sändaren slipper skicka om dem i onödan
<!--SR:!fsrs,2026-10-20T21:45:00.229Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:45:00.229Z-->

## Snabb omsändning och dubbel-ACK (Säker)

Vad skickar mottagaren när ett segment kommer i fel ordning?::En kvittens som pekar på ==det byte som fortfarande saknas== (en dubbel-ACK)
<!--SR:!fsrs,2026-10-23T20:10:25.906Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:10:25.906Z-->

Varför lägger TCP ibland kvittensen i ett datapaket man ändå skickar (piggybacking)?::För att ==spara bandbredd== — ACK:en kostar inget eget paket
<!--SR:!fsrs,2026-10-20T22:14:24.837Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T22:14:24.837Z-->

Varför väntar mottagaren ibland upp till 500 ms innan den kvitterar (fördröjd ACK)?::För att slippa ==översvämma nätet med rena ACK-paket== när den inget eget har att skicka
<!--SR:!fsrs,2026-10-25T05:09:40.447Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:09:40.447Z-->

Vad gör sändaren vid tre dubbel-ACK:ar på samma nummer?::==Snabb omsändning== av det saknade segmentet direkt, utan att vänta ut RTO-timern
<!--SR:!fsrs,2026-10-23T20:05:26.229Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:05:26.229Z-->

## ARQ: Stop-and-Wait, Go-Back-N och Selective Repeat (Trolig)

Vad är skillnaden mellan Go-Back-N och Selective Repeat vid en förlust?::GBN skickar om det tappade segmentet ==och allt efter det==, SR skickar om bara det som saknas
<!--SR:!fsrs,2026-10-25T04:30:12.532Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:30:12.532Z-->

## Flödeskontroll: pull och push (Säker)

Vad skyddar flödeskontroll mot, till skillnad från congestion control?::Den skyddar ==mottagaren från att översvämmas==, medan congestion control skyddar nätet
<!--SR:!fsrs,2026-10-23T20:10:31.762Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:10:31.762Z-->

Hur styrs TCP:s flödeskontroll, och av vem?::Mottagaren ==annonserar sin rwnd== och sändaren får inte skicka mer än så — alltså mottagarstyrt (pull-likt, egen slutsats)
<!--SR:!fsrs,2026-10-20T21:37:44.505Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:37:44.505Z-->

## Send window och receive window (Säker)

Vad betyder mottagarfönstret rwnd?::==Hur många byte till mottagaren kan ta emot== just nu
<!--SR:!fsrs,2026-10-25T04:27:40.186Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:27:40.186Z-->

Vad får mottagarfönstret (rwnd) att krympa respektive växa? (2)
||
- **Krymper** – när data kommer in snabbare än programmet hämtar det
- **Växer** – när programmet hämtar data ur bufferten och gör plats
<!--SR:!fsrs,2026-10-23T20:03:09.702Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:03:09.702Z-->

## Congestion: vad händer vid för stort fönster (Säker)

Vad händer i en router när sändfönstret är för stort?::Bufferten fylls, och när den är full ==kastas paket== (dessutom fördröjs de i kön)
<!--SR:!fsrs,2026-10-20T21:43:35.510Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:43:35.510Z-->

Vilka tecken på congestion använder TCP? (2)
||
- **Paketförlust** – paket som kastats när en buffert blev full
- **Ökad fördröjning** – paket som köat längre på vägen
<!--SR:!fsrs,2026-10-25T05:34:53.222Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:34:53.222Z-->

## Throughput probing (AIMD) och det faktiska fönstret (Säker)

Vad betyder AIMD i TCP:s congestion control?::==Öka fönstret lite varje rundtur, skär ner det kraftigt vid förlust== — den klassiska sågtanden
<!--SR:!fsrs,2026-10-21T11:38:45.718Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:38:45.718Z-->

Hur mycket får TCP skicka när cwnd och rwnd skiljer sig åt?::==Det minsta av cwnd och rwnd== — det snävaste taket vinner
<!--SR:!fsrs,2026-10-23T20:05:14.565Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:05:14.565Z-->

## Slow start och congestion avoidance (Säker)

Hur snabbt växer cwnd i slow start?::Det ==fördubblas varje rundtur== — +1 MSS för varje kvitterad MSS
<!--SR:!fsrs,2026-10-23T20:16:56.446Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:16:56.446Z-->

Hur växer cwnd i congestion avoidance, och varför långsammare?::==+1 MSS per helt kvitterat fönster== i stället för per kvittens, så det kryper linjärt
<!--SR:!fsrs,2026-10-20T21:44:08.222Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:44:08.222Z-->

Vad avgör när TCP byter från slow start till congestion avoidance?::När cwnd når ==ssthresh== (slow start threshold)
<!--SR:!fsrs,2026-10-23T20:05:10.517Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:05:10.517Z-->

## Vid paketförlust: multiplicative decrease, Tahoe och Reno (Säker)

Vad gör både Tahoe och Reno vid en timeout?::cwnd går ==ner till 1 segment== och slow start börjar om, ssthresh sätts till halva fönstret
<!--SR:!fsrs,2026-10-23T20:03:35.006Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:03:35.006Z-->

Vad gör Tahoe respektive Reno vid tre dubbel-ACK:ar? (2)
||
- **Tahoe** – samma som vid timeout: cwnd ner till 1 och slow start
- **Reno** – halverar till ssthresh och gör fast recovery, kraschar inte till 1
<!--SR:!fsrs,2026-10-25T05:37:51.995Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:37:51.995Z-->

Varför behandlar Reno tre dubbel-ACK:ar mildare än en timeout?::För att dubbel-ACK:arna visar att ==senare segment kom fram==, så bara ett saknas
<!--SR:!fsrs,2026-10-20T21:38:40.025Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:38:40.025Z-->

## TCP-versioner, modern TCP och CUBIC (Möjlig)

Vilket antagande i klassisk TCP ställer till problem på t.ex. WiFi?::Att ==varje förlust betyder congestion== — på trådlösa länkar är förlust ofta bara brus, inte trängsel
<!--SR:!fsrs,2026-10-21T11:50:24.410Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:50:24.410Z-->

## SCTP (Säker)

Vad skiljer TSN från SSN i SCTP? (2)
||
- **TSN** – numrerar alla datachunks i hela associationen, sköter global ordning och tillförlitlighet
- **SSN** – håller ordningen inom en enskild ström
<!--SR:!fsrs,2026-10-21T11:40:03.901Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:40:03.901Z-->

Vad är multi-homing i SCTP?::En ändpunkt kan använda ==flera IP-adresser== för samma association, så trafiken kan fortsätta en annan väg om en går ner
<!--SR:!fsrs,2026-10-21T11:42:26.874Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:42:26.874Z-->

Hur etablerar SCTP en association?::Med en ==fyrvägshandskakning== (INIT, INIT ACK, COOKIE ECHO, COOKIE ACK)
<!--SR:!fsrs,2026-10-21T11:50:55.834Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:50:55.834Z-->
