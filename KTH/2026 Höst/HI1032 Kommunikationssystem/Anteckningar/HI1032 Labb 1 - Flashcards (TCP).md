---
tags: [studieguide, HI1032, nätverk, KTH, year2026]
description: "Samlade flashcards för HI1032 Labb 1 (TCP och Wireshark) – teori inför redovisningen: skiktning och portar, TCP-headern och flaggorna, handskakning och nedkoppling, sekvens- och ACK-nummer, flödes- och trängselkontroll, ICMP, ARP, HTTP, FTP samt tcpdump, tcptrace och xplot."
created: 2026-09-01
updated: 2026-09-01
---
# HI1032 Labb 1 - Flashcards (TCP)

*Teori-deck inför redovisningen av Labb 1 (TCP + Wireshark). Empiriska mätvärden (dina egna IP/MAC, throughput, antal paket) ingår inte – dem läser du av i labben.*

## Sniffning och Wireshark

Vad menas med promiscuous mode?::Att nätverkskortet ==tar emot alla ramar på länken==, även de som är adresserade till andra noder (normalt släpper NIC:en bara vidare ramar med rätt MAC-adress).
<!--SR:!fsrs,2026-09-08T14:51:09.534Z,3,2.31708213,9.22200298,2,7,0,0,2026-09-05T14:51:09.534Z-->

Vad är en sniffer?::Ett program som ==avlyssnar och visar nätverkstrafik==; det sätter nätverkskortet i promiscuous mode och presenterar de fångade ramarna läsbart.
<!--SR:!fsrs,2026-09-08T19:03:01.916Z,3,2.61039994,8.90617252,2,5,0,0,2026-09-05T19:03:01.916Z-->

När använder man ett capture-filter kontra ett display-filter i Wireshark?
||
- **Capture-filter:** väljer ==vilka ramar som spelas in== (sätts före fångst, går inte att ändra efteråt) och minskar datamängden.
- **Display-filter:** väljer ==vad som visas== av redan infångad trafik (kan ändras fritt i efterhand).
<!--SR:!fsrs,2026-09-12T17:34:57.958Z,6,5.91224917,7.84257413,2,5,0,0,2026-09-06T17:34:57.958Z-->

Hur skriver du ett display-filter för all IP-trafik till/från din dator?::`ip.addr == x.x.x.x` (på länknivå i stället: `eth.addr == <MAC>`).
<!--SR:!fsrs,2026-09-06T19:03:16.916Z,1,0.34382265,9.88391287,2,9,0,0,2026-09-05T19:03:16.916Z-->

Hur skriver du ett capture-filter som bara fångar trafik till/från en värd?::`host x.x.x.x` (pcap-syntax; t.ex. `port 53` fångar bara DNS).
<!--SR:!fsrs,2026-09-07T18:59:29.957Z,2,0.42621562,9.85288818,2,11,0,0,2026-09-05T18:59:29.957Z-->

Vilket kommando visar datorns IP-adress, MAC-adress och DNS-server (Windows respektive Linux)?::Windows: ==`ipconfig`== (`/all` för MAC och DNS); Linux: ==`ifconfig`== (eller `ip addr`).
<!--SR:!fsrs,2026-09-10T14:51:16.725Z,5,5.26721114,5.17514122,2,4,0,0,2026-09-05T14:51:16.725Z-->

## Skiktning, OSI och TCP/IP

Vilka fem lager har TCP/IP-modellen? (5)
||
- Applikation
- Transport
- Nätverk
- Datalänk
- Fysiskt
<!--SR:!fsrs,2026-09-08T17:34:25.302Z,2,1.42467042,9.46435886,2,8,1,0,2026-09-06T17:34:25.302Z-->

Vad heter dataenheten (PDU) i respektive lager? (5)
||
- Applikation: **meddelande**
- Transport: **segment** (TCP) / user datagram (UDP)
- Nätverk: **datagram** (paket)
- Datalänk: **ram**
- Fysiskt: **bitar**
<!--SR:!fsrs,2026-09-06T18:04:00.750Z,0,0.001,9.97799569,1,18,0,0,2026-09-06T18:03:00.750Z-->

Vilken adress hör till respektive lager?::Datalänk = ==MAC (fysisk)==, nätverk = ==IP (logisk)==, transport = ==portnummer==, applikation = namn (t.ex. URL).
<!--SR:!fsrs,2026-09-06T19:18:06.045Z,1,0.04814825,9.92320036,2,9,0,0,2026-09-05T19:18:06.045Z-->

Vilken leveransomfattning har datalänk-, nätverks- respektive transportlagret?::Datalänk = ==nod-till-nod==, nätverk = ==värd-till-värd==, transport = ==process-till-process==.
<!--SR:!fsrs,2026-09-06T19:19:28.046Z,1,0.05093436,9.94448519,2,11,1,0,2026-09-05T19:19:28.046Z-->

Placera protokollen i OSI-lager: ethernet, arp, ip, icmp, tcp, udp, http, ftp, dns, smtp, telnet, snmp. (4)
||
- **L2 datalänk:** ethernet (arp/rarp ligger på gränsen L2/L3)
- **L3 nätverk:** ip, icmp
- **L4 transport:** tcp, udp
- **L7 applikation:** http, ftp, dns, smtp, telnet, snmp
<!--SR:!fsrs,2026-09-08T18:02:58.870Z,2,0.42299785,9.89889925,2,9,0,0,2026-09-06T18:02:58.870Z-->

Vilka protokoll används på varje nivå när du hämtar en HTML-sida?::L2 = ==Ethernet==, L3 = ==IP==, L4 = ==TCP==, L7 = ==HTTP==.
<!--SR:!fsrs,2026-09-08T17:28:32.570Z,2,0.20257506,9.92546039,2,12,0,0,2026-09-06T17:28:32.570Z-->

## Portar och multiplexering

**Portnummer** (port number);;Ett ==16-bitars tal (0–65535)== som identifierar en process på en värd, så att transportlagret vet vilket program datan ska till.
<!--SR:!fsrs,2026-09-06T19:25:36.075Z,1,0.09875382,9.61904069,2,6,1,0,2026-09-05T19:25:36.075Z!fsrs,2026-09-12T17:33:31.943Z,6,6.08884306,7.84257413,2,5,0,0,2026-09-06T17:33:31.943Z-->

Vad skiljer ett well-known- från ett ephemeral-portnummer?
||
- **Well-known:** ==fast== nummer för en serverprocess (t.ex. 80 HTTP, 21 FTP, 53 DNS).
- **Ephemeral:** ==tillfälligt== nummer (oftast > 1023) som klienten tilldelas.
<!--SR:!fsrs,2026-09-07T15:26:58.241Z,2,2.05744508,8.54207069,2,6,0,0,2026-09-05T15:26:58.241Z-->

**Socket-adress**;;Kombinationen ==IP-adress + portnummer== som fullständigt identifierar en process-ändpunkt.
<!--SR:!fsrs,2026-09-07T07:02:39.214Z,4,3.57068973,5.18509795,2,3,0,0,2026-09-03T07:02:39.214Z!fsrs,2026-09-12T17:28:36.913Z,6,6.08884306,7.84257413,2,5,0,0,2026-09-06T17:28:36.913Z-->

Vad gör multiplexering/demultiplexering i transportlagret?::Låter ==flera processer dela transportlagret==: portnummer buntar ut data (mux) hos sändaren och levererar till rätt process (demux) hos mottagaren.
<!--SR:!fsrs,2026-09-06T19:18:37.629Z,1,0.02668088,9.94052415,2,9,1,0,2026-09-05T19:18:37.629Z-->

## TCP och UDP

Vad skiljer UDP från TCP?
||
- **UDP:** ==förbindelselös, otillförlitlig, meddelandeorienterad== med låg overhead.
- **TCP:** ==förbindelseorienterad, tillförlitlig, byteström== med flödes-, fel- och trängselkontroll.
<!--SR:!fsrs,2026-09-08T14:52:58.389Z,3,3.28200146,9.01372467,2,7,0,0,2026-09-05T14:52:58.389Z-->

Vilka egenskaper kännetecknar TCP? (5)
||
- Byteström (octets) skickad i **segment**
- **Förbindelseorienterad**
- **Felkontroll** (omsändningar)
- **Flödeskontroll**
- **Trängselkontroll**
<!--SR:!fsrs,2026-09-07T17:28:18.043Z,1,0.25955902,9.87673514,2,9,1,0,2026-09-06T17:28:18.043Z-->

## TCP-headern och flaggorna

Vilka är de viktigaste fälten i TCP-headern? (7)
||
- **Käll- och destinationsport**
- **Sekvensnummer** och **ACK-nummer**
- **HLEN** (headerlängd / data offset)
- **Kontrollflaggor** (URG, ACK, PSH, RST, SYN, FIN)
- **Fönsterstorlek** (rwnd)
- **Checksumma** och **urgent pointer**
- **Options** (t.ex. MSS, window scale, timestamp, SACK)
<!--SR:!fsrs,2026-09-06T19:04:24.181Z,1,0.0891545,9.91313836,2,10,0,0,2026-09-05T19:04:24.181Z-->

Vad betyder de sex TCP-kontrollflaggorna? (6)
||
- **URG** – urgent pointer giltig
- **ACK** – ACK-numret giltigt
- **PSH** – leverera data direkt (push)
- **RST** – återställ/avbryt förbindelsen
- **SYN** – synkronisera sekvensnummer (uppkoppling)
- **FIN** – avsluta förbindelsen
<!--SR:!fsrs,2026-09-10T15:26:48.849Z,5,4.6360948,7.56711937,2,5,0,0,2026-09-05T15:26:48.849Z-->

I tcpdump/tcptrace: vad står flaggorna S, A, P, F, R och "." för?::S = ==SYN==, A och "." = ==ACK== ("." = enbart ACK, ingen annan flagga), P = ==PSH==, F = ==FIN==, R = ==RST==.
<!--SR:!fsrs,2026-09-10T15:32:29.710Z,5,4.68587642,7.58936704,2,4,0,0,2026-09-05T15:32:29.710Z-->

## Uppkoppling och nedkoppling

**Trevägshandskakning** (three-way handshake);;Så här ==upprättar TCP en förbindelse== i tre steg: SYN → SYN+ACK → ACK.
<!--SR:!fsrs,2026-09-13T16:26:19.183Z,8,8.28325797,5.63764906,2,4,0,0,2026-09-05T16:26:19.183Z!fsrs,2026-09-10T07:08:14.627Z,7,7.38551145,3.4641143,2,2,0,0,2026-09-03T07:08:14.627Z-->

Vad utbyts i trevägshandskakningen och varför?::Parterna ==utbyter sina initiala sekvensnummer (ISN) och bekräftar varandras==: SYN (klientens ISN) → SYN+ACK (serverns ISN + ACK) → ACK. Först därefter kan data skickas.
<!--SR:!fsrs,2026-09-10T15:26:15.777Z,5,4.68587642,7.58936704,2,4,0,0,2026-09-05T15:26:15.777Z-->

Hur avslutas en TCP-förbindelse ordnat (graceful close)?::Med en ==fyrvägshandskakning==: varje part skickar ett **FIN** som andra parten bekräftar med **ACK** (FIN → ACK, FIN → ACK). Vid *half-close* stängs ena riktningen medan den andra kan fortsätta.
<!--SR:!fsrs,2026-09-07T16:26:39.271Z,2,1.28445007,9.59055895,2,6,0,0,2026-09-05T16:26:39.271Z-->

Vad är TIME-WAIT och varför finns det?::Efter sista ACK väntar den stängande parten ==2 × MSL== innan förbindelsen tas bort – ifall sista ACK tappas (då kan FIN sändas om) och så att gamla segment hinner dö ut (MSL ≈ 60 s).
<!--SR:!fsrs,2026-09-06T19:25:22.435Z,1,0.26582274,9.25877193,2,6,1,0,2026-09-05T19:25:22.435Z-->

Vad menas i labben med att en överföring var "komplett"?::Att förbindelsen ==stängdes ordnat med FIN/ACK== (inte avbröts med RST eller bara tog slut) och att hela byteströmmen bekräftades.
<!--SR:!fsrs,2026-09-09T15:26:37.289Z,4,3.44384458,8.36139419,2,5,0,0,2026-09-05T15:26:37.289Z-->

## Sekvens- och ACK-nummer

Hur numrerar TCP data?::Varje ==byte (octet) numreras== från ett slumpat ISN; sekvensnumret i headern är numret på ==första byten i segmentets data==.
<!--SR:!fsrs,2026-09-09T18:59:38.956Z,4,3.96290288,6.76082142,2,5,0,0,2026-09-05T18:59:38.956Z-->

Vad betyder ett ACK-nummer i TCP?::==Nästa förväntade byte== (kumulativ ACK) – alla byte före det numret är bekräftade.
<!--SR:!fsrs,2026-09-06T18:12:41.302Z,0,0.73673908,8.40750771,3,3,1,0,2026-09-06T18:02:41.302Z-->

I en tcpdump-rad ökar tal som 1449:2897 för varje rad – vad är de?::Segmentets ==byte-intervall i sekvensnummerrymden== (första:sista+1 byte); de ökar i takt med hur mycket data som skickats.
<!--SR:!fsrs,2026-09-09T15:25:29.042Z,4,3.96290288,6.76082142,2,5,0,0,2026-09-05T15:25:29.042Z-->

Varför skiljer sig mängden data kraftigt mellan riktningarna vid en nedladdning, fast antalet paket är ungefär lika?::Ena hållet bär ==stora datasegment==, andra hållet bara ==små ACK:er== – ungefär lika många paket men mycket olika mängd byte.
<!--SR:!fsrs,2026-09-10T19:02:51.834Z,5,4.68587642,7.58936704,2,4,0,0,2026-09-05T19:02:51.834Z-->

## Fel- och flödeskontroll

Vad är flödeskontroll i TCP och hur fungerar fönstret?::Skyddar mottagaren från överflöd: mottagaren annonserar ett ==mottagarfönster (rwnd)== och sändaren håller sitt glidande fönster inom det. Fönstret öppnas när processen hämtar data och stängs när nya byte anländer.
<!--SR:!fsrs,2026-09-12T18:03:11.653Z,6,6.08884306,7.84257413,2,5,0,0,2026-09-06T18:03:11.653Z-->

**Glidande fönster** (sliding window);;Låter sändaren ha ==flera obekräftade byte "i luften" samtidigt== (pipelining) i stället för en i taget, vilket ger högre genomströmning.
<!--SR:!fsrs,2026-09-12T17:34:38.206Z,6,6.08884306,7.84257413,2,5,0,0,2026-09-06T17:34:38.206Z!fsrs,2026-09-10T15:29:27.232Z,5,5.02262884,7.83101829,2,5,0,0,2026-09-05T15:29:27.232Z-->

Hur bestäms TCP:s faktiska sändarfönster?::Som ==min(rwnd, cwnd)== – det minsta av mottagarfönstret (flödeskontroll) och trängselfönstret (trängselkontroll).
<!--SR:!fsrs,2026-09-08T06:57:13.641Z,5,4.60224642,5.09241299,2,3,0,0,2026-09-03T06:57:13.641Z-->

Hur åstadkommer TCP tillförlitlighet (felkontroll)? (4)
||
- **Checksumma** (upptäcker bitfel)
- **ACK** (bekräftelser)
- **Timeout + omsändning** (RTO)
- **Omsändning vid 3 dubbel-ACK** (fast retransmit)
<!--SR:!fsrs,2026-09-07T18:03:29.861Z,1,0.12999373,9.95277734,2,12,1,0,2026-09-06T18:03:29.861Z-->

Hur beräknas RTO (retransmission timeout)?::Ur utjämnad RTT och dess avvikelse: ==RTO = RTTS + 4 × RTTD==. Vid en omsändning fördubblas RTO (exponential backoff).
<!--SR:!fsrs,2026-09-06T22:11:55.464Z,2,0.6525999,9.40869387,2,6,0,0,2026-09-04T22:11:55.464Z-->

Vad säger Karns algoritm?::==Mät inte RTT på ett omsänt segment== – annars vet man inte om ACK:en gäller originalet eller omsändningen.
<!--SR:!fsrs,2026-09-13T18:46:28.365Z,8,8.28325797,5.63764906,2,4,0,0,2026-09-05T18:46:28.365Z-->

Vad är fast retransmit?::Att sändaren ==sänder om ett segment direkt vid 3 dubbel-ACK==, utan att vänta på timeout (dubbel-ACK signalerar att ett segment saknas men att senare segment kommit fram).
<!--SR:!fsrs,2026-09-08T07:01:46.934Z,5,4.60224642,5.09241299,2,3,0,0,2026-09-03T07:01:46.934Z-->

**SACK** (Selective Acknowledgment);;TCP-option där mottagaren ==rapporterar exakt vilka out-of-order-block som tagits emot==, så att sändaren slipper sända om redan mottagna segment (D-SACK rapporterar även dubbletter).
<!--SR:!fsrs,2026-09-07T14:51:54.773Z,2,0.40172088,9.75293415,2,7,0,0,2026-09-05T14:51:54.773Z!fsrs,2026-09-10T14:50:53.494Z,5,4.68587642,7.58936704,2,4,0,0,2026-09-05T14:50:53.494Z-->

## Trängselkontroll

Vad skiljer flödeskontroll från trängselkontroll?
||
- **Flödeskontroll:** skyddar ==mottagaren== från överflöd (rwnd).
- **Trängselkontroll:** skyddar ==nätet== från överbelastning (cwnd).
<!--SR:!fsrs,2026-09-06T18:58:25.083Z,1,1.13690263,8.04527283,2,6,1,0,2026-09-05T18:58:25.083Z-->

Hur upptäcker TCP trängsel? (2)
||
- **Timeout** – stark signal (segment antas förlorat).
- **3 dubbel-ACK** – svagare signal (ett segment saknas men andra kommer fram).
<!--SR:!fsrs,2026-09-08T15:29:59.967Z,3,3.12316787,6.79877821,2,3,0,0,2026-09-05T15:29:59.967Z-->

Vad skiljer slow start från congestion avoidance?
||
- **Slow start:** cwnd startar på 1 MSS och ==ökar exponentiellt== (1 MSS per ACK) tills tröskeln *ssthresh*.
- **Congestion avoidance:** därefter ==additiv (linjär) ökning==, ca 1 MSS per RTT.
<!--SR:!fsrs,2026-09-10T15:30:10.519Z,5,4.71072386,7.83101829,2,5,0,0,2026-09-05T15:30:10.519Z-->

Vad gör TCP vid trängsel, och hur skiljer sig Tahoe och Reno?
||
- Båda: ==ssthresh sätts till cwnd/2== (multiplicative decrease).
- **Tahoe:** cwnd → 1 MSS + slow start vid *både* timeout och 3 dubbel-ACK.
- **Reno:** vid 3 dubbel-ACK görs fast retransmit + ==fast recovery== (cwnd = ssthresh, inte 1); bara timeout ger cwnd = 1.
<!--SR:!fsrs,2026-09-06T19:05:14.766Z,1,0.73083188,9.25271257,2,6,1,0,2026-09-05T19:05:14.766Z-->

Varför är genomströmningen nära noll ibland, och varför uppstår "platåer" i sekvensnummergrafen?::För att ==inga nya data skickas just då== – sändaren väntar på ACK, fönstret är fullt/stängt, eller så pågår omsändning efter paketförlust/trängsel.
<!--SR:!fsrs,2026-09-08T18:46:18.964Z,3,2.40450492,8.76561138,2,5,0,0,2026-09-05T18:46:18.964Z-->

## Stora segment och options

**MSS** (Maximum Segment Size);;Den största datamängd ett TCP-segment får bära, satt så att segmentet ryms i ett IP-paket ==utan fragmentering==; utgår från länkens MTU.
<!--SR:!fsrs,2026-09-06T18:57:28.753Z,1,0.73083188,9.25271257,2,6,1,0,2026-09-05T18:57:28.753Z!fsrs,2026-09-12T19:03:26.956Z,7,6.5830602,7.07833868,2,5,0,0,2026-09-05T19:03:26.956Z-->

Hur fungerar Path MTU Discovery?::Sändaren sätter ==Don't Fragment (DF)==; klarar en länk inte storleken kastas paketet och en ==ICMP "Fragmentation Needed" (typ 3, kod 4)== skickas tillbaka med länkens MTU – då sänks MSS.
<!--SR:!fsrs,2026-09-06T19:02:38.034Z,1,0.33014335,9.78096854,2,7,1,0,2026-09-05T19:02:38.034Z-->

Vad gör window scale-option och varför behövs den?::Headerns fönsterfält är bara 16 bitar (max 65535 byte). Window scale ==skiftar fönstret vänster (upp till 14 steg)== så att större fönster ryms: ==2^16 × 2^14 = 2^30 < 2^32== (håller sig under sekvensrymden).
<!--SR:!fsrs,2026-09-06T18:04:02.493Z,0,0.001,9.9779957,1,19,0,0,2026-09-06T18:03:02.493Z-->

Kan sekvensnumren ta slut, och vad skyddar mot det?::Ja – de är 32 bitar och =="wrappar" runt== vid stora överföringar. **Timestamp**-option (PAWS) skiljer gamla, wrappade sekvensnummer från nya.
<!--SR:!fsrs,2026-09-07T14:51:41.101Z,2,1.73517902,8.3564991,2,6,0,0,2026-09-05T14:51:41.101Z-->

## ICMP, ping och traceroute

**ICMP** (Internet Control Message Protocol);;Nätverkslagerprotokoll som ==rapporterar fel och skickar frågor== om IP-nätet; används av ping och traceroute.
<!--SR:!fsrs,2026-09-08T17:33:51.206Z,2,1.6657816,8.77182771,2,6,1,0,2026-09-06T17:33:51.206Z!fsrs,2026-09-13T18:57:38.889Z,8,8.28325797,5.63764906,2,4,0,0,2026-09-05T18:57:38.889Z-->

Hur fungerar ping?::Skickar ICMP ==echo request== och väntar på ==echo reply== – testar om en värd är nåbar och mäter RTT.
<!--SR:!fsrs,2026-09-07T14:53:23.420Z,2,0.6296255,9.42783916,2,5,0,0,2026-09-05T14:53:23.420Z-->

**TTL** (Time To Live);;Fält i IP-huvudet som ==minskar med 1 vid varje router==; när det når 0 kastas paketet (hindrar paket från att cirkla för evigt).
<!--SR:!fsrs,2026-09-10T07:10:21.074Z,7,7.45344042,3.4509278,2,3,0,0,2026-09-03T07:10:21.074Z!fsrs,2026-09-06T22:43:13.392Z,4,3.94605407,1,2,2,0,0,2026-09-02T22:43:13.392Z-->

Hur fungerar traceroute/tracert i detalj?::Skickar paket med ==stegvis ökande TTL (1, 2, 3 …)==; routern där TTL når 0 skickar tillbaka ==ICMP "Time Exceeded"== och avslöjar sig – så kartläggs vägen hopp för hopp.
<!--SR:!fsrs,2026-09-06T19:02:03.506Z,1,0.07424672,9.93486201,2,8,0,0,2026-09-05T19:02:03.506Z-->

Varför skiljer sig svarstid och TTL när du pingar olika adresser?::Fler ==hopp/längre väg== ger högre RTT och lägre kvarvarande TTL; en närmare värd (färre hopp) svarar snabbare och har högre TTL kvar.
<!--SR:!fsrs,2026-09-12T17:28:47.857Z,6,6.08884306,7.84257413,2,5,0,0,2026-09-06T17:28:47.857Z-->

## ARP och cacher

**ARP** (Address Resolution Protocol);;Protokoll som ==översätter en IP-adress till MAC-adress== på det lokala nätet (via request/reply); ligger på gränsen mellan datalänk- och nätverkslagret.
<!--SR:!fsrs,2026-09-07T06:59:18.936Z,4,3.57068973,5.18509795,2,3,0,0,2026-09-03T06:59:18.936Z!fsrs,2026-09-12T17:33:26.751Z,6,5.86750909,7.85353508,2,4,0,0,2026-09-06T17:33:26.751Z-->

Varför måste du tömma ARP- och DNS-cachen innan du fångar viss trafik?::Annars finns svaren redan cachade och ==ARP- respektive DNS-utbytet skickas inte== – då syns de inte i infångningen.
<!--SR:!fsrs,2026-09-07T14:50:46.430Z,2,1.28577247,9.57784944,2,7,0,0,2026-09-05T14:50:46.430Z-->

Vad skulle saknas i infångningen om du inte tömmer cacherna först?::==ARP request/reply== (IP→MAC) och ==DNS-fråga/svar== (namn→IP) – bara själva ping-/data-paketen syns.
<!--SR:!fsrs,2026-09-07T17:34:06.702Z,1,0.88420644,9.91423082,2,9,0,0,2026-09-06T17:34:06.702Z-->

Vad gör kommandona `arp -d *` och `ipconfig /flushdns`?::==Tömmer ARP-cachen== respektive ==DNS-cachen== i Windows (`arp -a` och `ipconfig /displaydns` visar dem).
<!--SR:!fsrs,2026-09-07T15:25:43.498Z,2,1.6913479,8.36139419,2,5,0,0,2026-09-05T15:25:43.498Z-->

## HTTP och FTP

**HTTP** (HyperText Transfer Protocol);;Applikationsprotokoll för att ==hämta webbresurser==; klienten (webbläsaren) begär resurser från en server, oftast över ==TCP port 80==.
<!--SR:!fsrs,2026-09-08T18:34:01.027Z,3,2.31151468,9.22283258,2,8,0,0,2026-09-05T18:34:01.027Z!fsrs,2026-09-12T17:33:37.510Z,6,6.08884306,7.84257413,2,5,0,0,2026-09-06T17:33:37.510Z-->

Vad betyder "GET", "200 OK" och "301" i HTTP-trafik?::**GET** = ==begär en resurs==; **200 OK** = ==lyckad== begäran; **301** = ==permanent omdirigering== (Moved Permanently).
<!--SR:!fsrs,2026-09-08T07:06:27.884Z,5,4.60224642,5.09241299,2,3,0,0,2026-09-03T07:06:27.884Z-->

Vad står HTTP-statuskodernas klasser 2xx, 3xx, 4xx och 5xx för? (4)
||
- **2xx** – lyckat (t.ex. 200 OK)
- **3xx** – omdirigering (t.ex. 301)
- **4xx** – klientfel (t.ex. 404)
- **5xx** – serverfel (t.ex. 500)
<!--SR:!fsrs,2026-09-10T16:22:59.233Z,5,4.68587642,7.58936704,2,4,0,0,2026-09-05T16:22:59.233Z-->

Vad gör "Follow TCP Stream", och varför öppnas ofta flera TCP-strömmar för en webbsida?::Sorterar ut ==en enda TCP-ström== ur infångningen. En sida hämtar många objekt (bilder, css …), så webbläsaren ==öppnar flera parallella TCP-förbindelser==.
<!--SR:!fsrs,2026-09-06T22:18:28.516Z,2,1.2376767,9.40869387,2,6,0,0,2026-09-04T22:18:28.516Z-->

Varför använder FTP två förbindelser?::En ==kontrollförbindelse (port 21)== för kommandon och en separat ==dataförbindelse (port 20)== för filöverföringen; lösenordet skickas i klartext och syns i Wireshark.
<!--SR:!fsrs,2026-09-06T18:04:13.541Z,0,0.001,9.97797846,1,12,0,0,2026-09-06T18:03:13.541Z-->

## tcpdump, tcptrace och xplot

Vad gör tcpdump respektive tcptrace?::**tcpdump** ==fångar/loggar paket== (till en .dmp-fil med `-w`). **tcptrace** ==analyserar== sådana dumpfiler och ger statistik (byte, segment, omsändningar, RTT, fönster, throughput) samt grafer.
<!--SR:!fsrs,2026-09-07T15:28:05.080Z,2,1.61499178,9.40869387,2,6,0,0,2026-09-05T15:28:05.080Z-->

Vad visar en time/sequence-graf (`tcptrace -S`, `*_tsg.xpl`)?::==Sekvensnummer (Y) mot tid (X)==; kurvans lutning motsvarar genomströmningen.
<!--SR:!fsrs,2026-09-07T18:58:15.179Z,2,1.61499178,9.40869387,2,6,0,0,2026-09-05T18:58:15.179Z-->

Vad betyder linjerna och pilarna i en time/sequence-graf (xplot)?
||
- **Grön linje:** mottagna ==ACK-nummer==
- **Gul linje:** annonserat ==mottagarfönster==
- **Gröna ticks:** ==dubbel-ACK==
- **Svarta pilar:** skickade ==segment== (upp/ned = sista/första byte)
- **Röda pilar (R):** ==omsända segment==
- **SYN/FIN-markörer:** upp- och nedkoppling
<!--SR:!fsrs,2026-09-06T19:19:10.550Z,1,0.04608527,9.94405786,2,11,0,0,2026-09-05T19:19:10.550Z-->

Vad visar en throughput-graf (`tcptrace -T`, `*_tput.xpl`)?::==Genomströmning i byte/s (Y) mot tid (X)==.
<!--SR:!fsrs,2026-09-08T15:25:20.634Z,3,2.61039994,8.90617252,2,5,0,0,2026-09-05T15:25:20.634Z-->

Vad betyder prickarna och linjerna i en throughput-graf (xplot)?
||
- **Gula prickar:** ==ögonblicklig== genomströmning (segmentets storlek / tid sedan förra segmentet)
- **Blå linje:** ==kumulativt medel== (totala byte / total tid hittills)
- **Röd linje:** medel av de ==senaste N = 10 prickarna==
<!--SR:!fsrs,2026-09-06T22:11:28.792Z,2,1.82854379,8.76561138,2,5,0,0,2026-09-04T22:11:28.792Z-->
