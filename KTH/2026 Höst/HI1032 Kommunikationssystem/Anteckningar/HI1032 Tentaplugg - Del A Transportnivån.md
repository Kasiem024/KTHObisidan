---
tags: [tenta, HI1032, nätverk, KTH, year2026]
created: 2026-10-02
updated: 2026-10-02
description: "Flashcards för HI1032:s tenta, Del A Transportnivån, prioriterade efter tentaanalysen av fyra gamla tentor. Fråga 1-poolen i sin helhet, plus att tillämpa ACK-reglerna, fylla i RTO-tabellen, läsa en cwnd-graf och räkna numren i trevägshandskakningen."
---

# HI1032 Tentaplugg - Del A Transportnivån

Urvalet styrs av [[HI1032 Tentaanalys - Ranking och poängstrategi]]. Godkänt kräver 9 av 22 poäng
i den här delen. Fråga 1-poolen nedan ger 6–7 av dem och låg inom poolen i alla fyra gamla tentor,
så den är viktigast.

Det som tentan trycker i frågelydelsen — TCP-huvudet, de sex ACK-reglerna, tillståndsmaskinerna —
finns medvetet inte här. Korten tränar att använda det materialet, inte att minnas det.

## Fråga 1-poolen

Vilka fyra värden (utöver protokollet) identifierar en förbindelse?::==Käll- och destinationsadress, käll- och destinationsport==

Hur kombineras flow control och congestion control hos sändaren?::Sändarfönstret blir det ==minsta av cwnd och rwnd==

Kan två processer lyssna på samma portnummer med olika protokoll?::==Ja==

När används dynamic/private-portarna?::Som ==klientens källport==, när det inte spelar roll vilken port det blir

Hur skiljer datorn TCP-segment från UDP-datagram?::==Protocol-fältet i IP-huvudet==

Vad är MTU eller MSS, och varför behöver TCP veta det?::Största enhet respektive största segmentdata; annars börjar ==IP fragmentera==, vilket kostar prestanda

Hur hanteras ett UDP-datagram som är för stort för ett IP-paket?::==Fragmentering på IP-nivån==, med fältet fragment offset

Vilken roll har ICMP för segmentstorleken?::DF-flaggan sätts; en länk som inte kan skicka vidare svarar med ==ICMP Fragmentation Needed==

Vad säger Karns algoritm?::==Använd inte RTTM från segment som har skickats om==

Vad tillför SACK en vanlig ACK?::==Exakt vilka out-of-order-segment som tagits emot==, vilket ger färre omsändningar

Vad är silly window syndrome?::Segment med ==1 byte data och 40+ byte huvuden==, alltså slöseri med bandbredd

Vad står i fältet window size?::==Hur mycket data andra änden får skicka utan att invänta en ACK==

Vad är speciellt med ISN?::Det är ett ==slumptal==

Varför behövs TIME-WAIT i 2 MSL?::Så att inga ==gamla segment från förra förbindelsen== tolkas in i en ny med samma portpar

Vad är syftet med PSH-flaggan?::==Skicka direkt utan att vänta på ett fullt segment==, t.ex. vid interaktiv terminal

Nämn ännu en congestion control-algoritm::==Vegas, Westwood, BIC eller CUBIC==

Vad är SCTP-multihoming?::En association får använda ==flera IP-adresser== och byta mellan dem utan ny etablering; ingen lastbalansering

Vad gör stream sequence number i SCTP?::==Sätter ihop en enskild ströms chunks i rätt ordning==

Vad är en chunk i SCTP?::Antingen ==data från en ström eller ett kontrollmeddelande==; flera chunks kan ligga i ett paket

Vad innebär piggybacking, och varför är det bra?::Skicka ACK:en i ett paket du ändå skickar data i. ==Sparar bandbredd och motverkar att ACK:ar tappas==

Vilken flödeskontrollprincip gäller mellan mottagarbuffert och process?::==Pull== — processen hämtar med recv()

## Att läsa UDP-huvudet ur hex

I ett UDP-huvud, i vilken ordning kommer fälten (två byte vardera)?::==Källport, destinationsport, längd, checksumma==

## Att tillämpa ACK-reglerna

Vad blir ACK-numret när ett segment kommer i ordning?::==Nästa väntade sekvensnummer==

Vad gör mottagaren med ett segment som kommer out-of-order?::==Lagrar det och skickar direkt en ACK med det väntade sekvensnumret==

Vad gör mottagaren när ett duplikat av ett segment kommer?::Skickar ==omedelbart en ACK== med det väntade sekvensnumret

När får en ACK fördröjas, och hur länge?::När segmentet kom i ordning utan egen data och föregående redan kvitterats — fördröj i ==500 ms== eller tills nästa segment kommer

Hur räknas sekvensnumret framåt över databytes?::Varje databyte räknas, så nästa väntade nummer blir ==sekvensnummer plus antal byte==

Hur uppstår 3 dupACK?::När ett segment ==försvinner och de tre följande ger samma ACK==

## RTO-tabellen

I vilken ordning fyller du i RTO-tabellen, rad för rad?::==RTTS, RTTD, RTO1, RTO2== för varje ny RTTM

Hur avgör du om ett segment skickas om?::Jämför RTO mot RTTM — ==är RTTM större än RTO skickas segmentet om==

Vad skiljer de två RTO-varianterna åt?::Variant 1 tar bara RTO = 2 × RTTS; variant 2 ==lägger till avvikelsen, RTO = RTTS + 4 × RTTD==

## Congestion control

Vad är det minsta värde cwnd kan ha?::==1, aldrig 0== — efter en timeout startar fönstret om på 1

Vilket fel är lätt att göra när du ritar övergången till congestion avoidance?::Att rita den ==ett steg för sent==

## Etablering

Vilka nummer bär det första SYN-segmentet i trevägshandskakningen?::seq är klientens ISN, och ==ingen ACK== — ACK-flaggan är inte satt

Vilka nummer bär serverns SYN+ACK?::seq är serverns eget ISN, ACK är ==klientens ISN plus 1==

Vilka nummer bär klientens avslutande ACK i handskakningen?::seq är klientens ISN plus 1, ACK är ==serverns ISN plus 1==
