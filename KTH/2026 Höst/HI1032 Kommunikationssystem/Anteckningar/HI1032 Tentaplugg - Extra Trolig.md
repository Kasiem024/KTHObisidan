---
tags:
  - tenta
  - HI1032
  - nätverk
  - KTH
  - year2026
created: 2026-10-20
updated: 2026-10-20
description: "Extra flashcards för HI1032:s ämnen på nivån Trolig, från både Del A och Del B. Korten prövar fakta ur teorifilerna Tentasvar Del A och Del B som de två ordinarie decken inte redan prövar. Rubrikerna följer teorifilernas ämnen, och ett kort märkt egen slutsats bygger på en slutsats i teorin och inte direkt på föreläsningen."
---

# HI1032 Tentaplugg - Extra Trolig

Extra flashcards för HI1032:s ämnen på nivån Trolig, från både Del A och Del B. Korten prövar fakta ur teorifilerna Tentasvar Del A och Del B som de två ordinarie decken inte redan prövar. Rubrikerna följer teorifilernas ämnen, och ett kort märkt egen slutsats bygger på en slutsats i teorin och inte direkt på föreläsningen.

## Transportlagret och vad det ska lösa (Trolig)

Vad menas med att transportlagret jobbar ände-till-ände?::De två värdarnas transportlager pratar ==logiskt direkt med varandra==, fast paketen fysiskt går genom routrar och switchar.

Vad säger IP inte om själva vägen, utöver att paket kan tappas eller komma i oordning?::Inget om ==vägens kapacitet eller MTU==.

Vilka krav ska transportlagret lösa åt applikationerna? (4)
||
- **Oförändrad data i ordning** – data ska komma fram hel och i rätt ordning
- **Dela nätet rättvist** – nyttja nätet väl utan att äta upp andras trafik
- **Litet meddelande** – kunna skicka ett kort meddelande utan för mycket overhead
- **Skilja på program** – rätt trafik till rätt program på samma värd

## UDP (Trolig)

Hur stort är UDP-huvudet?::UDP-huvudet är bara ==8 byte==.

Vilket protokollnummer har UDP i IP-huvudet?::UDP har protokollnummer ==17==.

Vad lägger UDP till ovanpå IP:s leverans?::==Process-till-process-leverans via portar== (multiplexing/demultiplexing), inget mer.

Vilket fält i UDP-huvudet är frivilligt att använda?::==Checksumman== — den räknas bara om den används.

Vilka fyra fält har UDP-huvudet? (4)
||
- **Källport** – porten hos avsändaren
- **Destinationsport** – porten hos mottagaren
- **Total längd** – hur långt datagrammet är
- **Checksumma** – för att upptäcka fel, frivillig i UDP

Varför har UDP ett så litet huvud?::För ==låg overhead== när man bara vill skicka ett kort meddelande.

## TCP-huvudet — fälten du tolkar (Trolig)

Vilket protokollnummer har TCP i IP-huvudet?::TCP har protokollnummer ==6==.

Vad markerar URG-flaggan i ett TCP-segment?::Att segmentet bär ==brådskande data== (pekas ut med en urgent pointer).

Vad betyder det att ACK-flaggan är satt i ett TCP-segment?::Att segmentets ==ack-nummer är giltigt== (bekräftelsenumret gäller).

## TCP-egenskaper (Trolig)

Vilka tre sorters kontroll lägger TCP till ovanpå IP? (3)
||
- **Felkontroll** – upptäcker och sänder om det som tappats eller blivit fel
- **Flödeskontroll** – hindrar att en snabb sändare dränker en långsam mottagare
- **Trängselkontroll** – drar ner takten när nätet är överbelastat

Vad betyder det att TCP är förbindelseorienterat?::Båda sidor ==kommer först överens om att prata== och stänger ner förbindelsen efteråt.

## Etablering — three-way handshake (Trolig)

Hur mycket fördröjning kostar TCP:s uppkoppling innan data kan börja skickas?::Ungefär ==en RTT==, eftersom tre segment ska skickas först. *(egen slutsats)*

Vad skiljer active open från passive open vid TCP-uppkoppling? (2)
||
- **Active open** – sidan som tar initiativet och öppnar förbindelsen, oftast klienten
- **Passive open** – sidan som väntar på att någon hör av sig, oftast servern

## Dataöverföring (Trolig)

Vad räknar TCP sina sekvensnummer på?::På ==varje byte==, inte på varje paket.

## Terminering — three-way och four-way (Trolig)

Vad skiljer den aktiva från den passiva sidan vid TCP-stängning? (2)
||
- **Aktiv sida** – börjar stänga genom att skicka det första FIN
- **Passiv sida** – följer med och svarar på stängningen

## Tillståndsdiagrammet — hur du följer det (Trolig)

Utöver att kunna sända om ett tappat slut-ACK, varför väntar TCP 2MSL i TIME-WAIT?::Så att ==gamla segment och dubbletter hinner dö ut== innan samma portpar återanvänds. *(egen slutsats)*

## Path MTU Discovery (Trolig)

Vad går fel i Path MTU discovery om DF är satt men ICMP-svaret aldrig når tillbaka?::Paketen ==försvinner tyst== och förbindelsen hänger sig. *(egen slutsats)*

## TCP som byteström och förbindelse (Trolig)

Vad menas med att en TCP-förbindelse är tvåvägs?::Varje riktning har ==sin egen byteström==, en åt vardera hållet.

## Numreringssystem: sekvens- och ACK-nummer (Trolig)

Hur väljs TCP:s initiala sekvensnummer (ISN)?::Varje sida väljer ett ==slumpmässigt startnummer== när förbindelsen sätts upp.

## Tillstånd: etablering, terminering och TIME-WAIT (Trolig)

Varför behöver en TCP-nedkoppling i grunden fyra segment?::Varje riktning stängs för sig med ==ett FIN och ett ACK per håll==, så det blir fyra.

Vad betyder MSL (maximum segment lifetime)?::Den ==längsta tid ett segment kan ligga kvar i nätet==.

## Felkontroll i TCP (Trolig)

Vad händer med ett TCP-segment som checksumman visar är skadat?::Det kastas, och eftersom kvittensen uteblir hanteras det ==som ett tappat segment==.

## Omsändning: timeout och fast retransmit (Trolig)

Vilka två saker får TCP att sända om ett segment? (2)
||
- **RTO-timern löper ut** – segmentet kvitterades inte i tid
- **Tre dubblett-ACK:er** – fast retransmit, utan att vänta på timern

Varför startar TCP ingen omsändningstimer för ett rent ACK-segment?::För att en ren kvittens ==aldrig kvitteras tillbaka==, så det finns inget att vänta på.

## TCP-timers (Trolig)

Vilka fyra timers använder TCP? (4)
||
- **Retransmission (RTO)** – längsta tid att vänta på ett ACK
- **Persistence** – sonderar när mottagarens fönster är noll
- **Keepalive** – upptäcker en död motpart
- **TIME-WAIT** – skyddar nedkopplingen

Vad gör keepalive-timern?::Den skickar ==prober== och stänger förbindelsen om motparten inte svarar (död efter tio obesvarade prober).

## SACK – selektiva kvittenser (Trolig)

Vad kan mottagaren rapportera med D-SACK som vanlig SACK inte täcker?::==Dubbletter== den redan har tagit emot.

Vilken ARQ-metod liknar SACK mest?::==Selective Repeat== — mottagaren rapporterar exakt vilka block den fått ur ordning.

Hur kommer två TCP-parter överens om att använda SACK?::Båda skickar en ==SACK-permitted-option== i SYN och SYN+ACK vid uppkopplingen; själva SACK-informationen bärs sedan i TCP-huvudets options-fält.

## ARQ: Stop-and-Wait, Go-Back-N och Selective Repeat (Trolig)

Vad betyder ARQ?::==Automatic Repeat reQuest== — att nå tillförlitlighet genom att kvittera och skicka om det som inte kom fram

Hur fungerar Stop-and-Wait-ARQ?::Sändaren ==väntar på kvittensen för varje segment== innan nästa skickas, så länken står mest oanvänd medan man väntar en hel rundtur

Varför ger ett större sändfönster snabbare överföring än Stop-and-Wait?::Flera segment är ute samtidigt, så ==mindre av länken står oanvänd== och väntar på kvittenser

Hur blandar TCP Go-Back-N och Selective Repeat?::Den använder ==kumulativa kvittenser som Go-Back-N==, men buffrar segment ur ordning och beter sig som Selective Repeat med SACK *(egen slutsats)*

## FCAPS (Trolig)

Vad slags standard är FCAPS?::En ==ISO-standard== som delar in nätverkshantering i fem områden.

Vad omfattar Configuration i FCAPS? (2)
||
- **Ställa om** – hårdvara, mjukvara och konton
- **Dokumentera** – själva nätet

Vad omfattar Accounting i FCAPS?::Att hålla reda på ==resursanvändning==, till exempel debitering och kvoter.

Vad omfattar Performance i FCAPS?::==Kapacitet, trafik, genomströmning och svarstid==.

Vad omfattar Security i FCAPS?::==Kryptering, autentisering, loggning och intrångsdetektering==.

Varför räcker det med fem områden i FCAPS?::För att ==allt som behöver skötas på ett nät faller inom något av de fem==.

## ASN.1 och TLV (Trolig)

Vad är ASN.1?::En ==standard för att beskriva hur data ser ut==, oberoende av maskin och språk.

## SMI – Structure of Management Information (Trolig)

Varför heter ett objekt samma sak överallt i SNMP?::För att ==OID-trädet är gemensamt och standardiserat==.

## MIB-2 – Management Information Base (Trolig)

Varför är rader inte egna löv i en MIB-tabell?::För att ==antalet rader kan variera från enhet till enhet== — bara kolumnerna är egna löv.

## BER – Basic Encoding Rules (Trolig)

Hur kodar BER de två första talen i en OID?::De slås ihop till en byte, ==$40 \cdot$ det första $+$ det andra==; resten av talen kodas en byte styck.

## Digital representation av text – teckenkodning (Trolig)

Varför kan samma byte bli olika tecken på olika datorer?::För att det finns ==flera teckentabeller== (ASCII, Latin1, UTF-8), och samma byte betyder olika tecken i olika tabeller.

Vilken teckenkodning rymmer alla tecken?::==Unicode/UTF-8==. *(egen slutsats)*

## Sampling, kvantisering och PCM (Trolig)

Vad avgör hur ofta en signal samplas?::==Samplingsteoremet==.

Vad bestämmer antalet kvantiseringsnivåer i PCM?::==Bit-djupet== – fler bitar per sampel ger fler nivåer.

Vad kostar högre kvalitet i PCM?::Fler sampel per sekund och fler bitar per sampel ger bättre kvalitet, men ==fler bitar att skicka==.

## µ-law och A-law (Trolig)

Varför lägger µ-law/A-law fler nivåer på svaga ljud?::För att ==örat är känsligare för svaga ljud==, så en rak skala skulle slösa nivåer på de starka.

## Digital representation av bild – färg och tre tappar (Trolig)

Vad är en digital bild uppbyggd av?::En ==2D-matris av pixlar==.

Vad ger fler pixlar i en digital bild?::Mer detalj, men ==fler bitar==.

Hur beskriver färgmodellen RGB en pixel?::Med tre kanaler – ==rött, grönt, blått== – på 0–255 var, en byte styck.

## Förlustfri kompression (Trolig)

Hur fungerar run-length-kodning?::Den ersätter en lång upprepning av samma symbol med ==symbolen plus ett antal==.

Hur fungerar dictionary-kompression (LZW)?::Den bygger ==en ordbok över återkommande sekvenser== medan den läser.

Vilken kompressionsmetod använder GIF-formatet?::==LZW== (dictionary-kompression).

## Huffman (Trolig)

Varför kan en Huffman-kod avkodas entydigt trots att kodorden är olika långa?::För att den är ==prefixfri== – inget kodord är början på ett annat. *(egen slutsats)*

## Förstörande kompression – lossy (Trolig)

Vad betyder förstörande (lossy) kompression?::Den ==kastar bort information== för att spara plats, så datan är inte exakt likadan efteråt.

Hur kan man enkelt skapa förlust jämfört med PCM? (3)
||
- **Lägre samplingsrate** – färre sampel per sekund
- **Lägre bit-djup** – färre bitar per sampel
- **A-law** – en icke-linjär skala i stället för en rak

## DCT (2D) (Trolig)

Vad är vinsten med DCT inför kvantiseringen?::==Energin samlas i några få stora lågfrekvensvärden==, medan de höga frekvenserna blir små och lätta att kasta.

## MPEG – temporal och spatial kodning (Trolig)

Varför räcker det inte att JPEG-koda varje videoruta för sig?::Då ==blir det för stort==, så MPEG komprimerar även i tiden och inte bara i rummet.

Varför återkommer I-rutor med jämna mellanrum i stället för bara en i början?::Annars måste allt byggas som skillnader mot den enda I-rutan, vilket ==ökar fördröjningen==. *(egen slutsats)*

## Multimedia och TCP (Trolig)

Vad klarar inte TCP som behövs för att skicka samma medieström till många mottagare samtidigt?::==Multicast==.

Vilka två fält som realtidsmedia behöver saknar TCP?::Fält för ==payload-typ och tidsstämpel==.

Vad är FEC, och vad ger det?::==Lite redundant data== som skickas med, så att enstaka bitfel eller förlorade paket kan rättas utan omsändning.

## RTCP (Trolig)

Vilken UDP-port använder RTCP i förhållande till RTP?::Den ==udda porten direkt efter RTP:s jämna port==.

Vilka är RTCP:s två rapporttyper?::==Sender report och receiver report==.

Varför är RTCP begränsat till 5 % av sessionens bandbredd?::Så att ==kontrolltrafiken inte konkurrerar med själva mediet==.

## SIP (Trolig)

Vad för slags protokoll är SIP?::Ett ==textbaserat request/response-protokoll byggt som HTTP==, med adresser på formen sip:user@address.

Vad kommer parterna överens om i SIP:s INVITE och svaret?::Vilka ==portar och kodningar== mediet (RTP) ska använda.

## Representation – text-baserad och binär (Trolig)

Vad menas med att ett protokoll bygger på ett eget representationsprotokoll?::Att det har ett ==eget sätt att representera datan==, som SNMP (med BER) eller RPC.

## SSH och multiplexing (Trolig)

Vad är SSH?::En ==säker förbindelse till en annan dator==.

Vilka tre säkerhetsegenskaper ger SSH? (3)
||
- **Privacy** – insyn skyddas
- **Integrity** – data kan inte ändras oupptäckt
- **Authentication** – parterna bevisar vilka de är

## SMTP – Simple Mail Transfer Protocol (Trolig)

Vilket transportprotokoll och vilken port använder SMTP?::SMTP går över ==TCP på port 25==.

Hur markeras slutet på brevkroppen i SMTP:s DATA-fas?::Med ==en rad som bara innehåller en punkt==.

Hur bekräftar SMTP-servern varje steg?::Med en ==numerisk svarskod==, till exempel 220 vid hälsningen och 250 för OK.

## Brevets utformning (Trolig)

Vad består ett brev av enligt RFC 822?::Ett ==huvud (From, To, Date, Subject) och en kropp==.

Hur förhåller sig avsändaren i kuvertet (MAIL FROM) och avsändaren i huvudet (From) till varandra?::De ==behöver inte stämma överens==. *(egen slutsats)*

## Base64 (Trolig)

Vad kostar Base64 i datastorlek?::Datan växer ==ungefär en tredjedel==, eftersom tre byte blir fyra tecken. *(egen slutsats)*
