---
tags: [tenta, HI1032, nätverk, KTH, year2026]
created: 2026-09-23
updated: 2026-09-23
description: "Självständig kontextfil om HI1032:s tenta för AI-verktyg: examinationsregler, komplett inventering av alla delfrågor med poäng och ämne från de fyra tentorna 2024 och 2025, aggregerad ranking per del, facit i korthet, poängstrategi för godkänt och vad som är verifierat respektive osäkert."
---

# HI1032 Tentaanalys - AI-kontext

## 0. Hur den här filen ska användas

Den här filen är avsiktligt självständig. En AI-assistent ska kunna hjälpa användaren plugga
till HI1032:s tenta utan att läsa någon annan fil. Allt nedan är hämtat ur fyra gamla tentor
med lösningsförslag och ur kursens kurs-PM. En läsbar version för människor finns i
`HI1032 Tentaanalys - Ranking och poängstrategi.md`; den här filen har samma innehåll plus den
fullständiga delfrågeinventeringen.

**Regler för den som använder filen:**

1. Svara på svenska, i vardagligt språk. Fackterm är bra, akademisk ton är det inte.
2. Användarens mål är **godkänt (E)**, inte högt betyg. Prioritera alltid billiga poäng.
3. **Hitta inte på tentafrågor och inte på facit.** Allt i avsnitt 3 och 4 är verbatimnära
   återgivet från examinators egna lösningsförslag. Saknas något, säg att det saknas.
4. Kursboken finns i två upplagor. Lösningsförslagen hänvisar till Forouzan **6:e** upplagan;
   användaren äger **5:e**. Ge därför aldrig kapitel- eller figurhänvisningar som fakta —
   arbeta på ämnesnivå.
5. Underlaget är **fyra** tentor. Skilj alltid mellan "förekom i alla fyra" och "förekom i två".

## 1. Kursen och examinationen

| Fält | Värde |
| --- | --- |
| Kurs | HI1032 Kommunikationssystem, 7,5 hp, KTH CBH |
| Examinator | Martin Jacobsson |
| Moment | RED1 Tentamen 3,5 hp (betyg A–F), LAB1 Laborationer 4,0 hp (P/F) |
| Kursbok | Forouzan, Data Communications and Networking with TCP/IP Protocol Suite |
| Innehåll enligt kurs-PM | UDP och TCP, flödes- och felkontroll, DNS, STP och länkaggregering, HSRP, OSPF, applikationsprotokoll, realtidskommunikation, nätverkshantering, trafikmätning, sockets |
| Tentans längd | 4 timmar |
| Tillåtna hjälpmedel | **Endast miniräknare.** Kurs-PM: "Tentamen är skriftlig. Hjälpmedel som får medtas är endast miniräknare." |
| Tentaperiod | Ordinarie i oktober, omtenta i december |

**Viktigt:** kurs-PM:et listar STP, EtherChannel, länkaggregering, HSRP och OSPF som kursinnehåll,
men **ingen av de fyra tentorna innehåller en enda fråga om dem.** Kurs-PM:et kopplar OSPF till
laboration 2 och HSRP till laboration 3; STP och EtherChannel nämns inte i någon labbeskrivning
alls. En agent som pluggar "hela kursinnehållet" lägger tid på fel saker.

### Poängreglerna

- Två delar. **Del A Transportnivån**, fråga 1–4, max 22p. **Del B Applikationsnivån**,
  fråga 5–8, max 22p.
- **9p per del krävs för godkänt, och båda delarna måste vara godkända.** 9 av 22 är 40 procent.
- Godkänd del tas med från tidigare tentor (2022 eller senare). Plussning tillåten.
- Fråga 0 ger 0p och besvaras bara av den som har ett tidigare delresultat.
- Betygsgränser: E och D och C och B kräver alla 9p per del. A kräver 15,5p per del.
  D kräver dessutom 26,5p totalt, B kräver 31p totalt, C kräver 15,5p på en av delarna.

### Bakgrundsmaterial som trycks i tentalydelsen

Ska inte memoreras — men det är **inte samma material varje år**. Examinator delar ut det som
årets frågor kräver, vilket ger två listor.

**I alla fyra tentorna:** TCP-huvudet, de sex ACK-reglerna i sin helhet, minst en tillståndsmaskin
(klient/server, Reno, eller båda), och IP-huvudet — namngivet i tre av fyra, medan oktober 2024 har
en figur på samma plats vars bildtext föll bort i PDF-konverteringen, så där går det inte att
visa svart på vitt.

**Bara när en fråga kräver det:** UDP-huvudet (namngivet i de två 2025-tentorna), båda
RTO-varianterna med konstanter (oktober 2024 och december 2025, exakt de två tentor som hade en
RTO-uppgift), Tahoe-tillståndsmaskinen (bara oktober 2025), Base64-tabellen och
ISO-8859-1-tabellen (bara oktober 2024, den enda tenta som krävde kodning för hand).

De sex ACK-reglerna, ordagrant som de står i tentan:

1. Segment to send include an ACK (piggybacking)
   a. Next expected sequence number
2. Segment received in-order but no data to send
   a. If previous segment has been acknowledged then delay an ACK 500ms or until another segment
   arrives
3. A segment arrives and previous is not acknowledged
   a. Send ACK immediately no more than two outstanding segments
4. A segment arrives out-of order
   a. Immediately send an ACK with the expected sequence number
5. A missing segment arrives send an ACK
6. A duplicate segment arrives send an ACK

RTO-formlerna, ordagrant som de står i tentan:

- **Variant 1.** Startvärde RTTS = RTTM. RTTS(n) = (1-a) × RTTS(n-1) + a × RTTM(n), a = 1/8.
  RTO1 = k × RTTS, k = 2.
- **Variant 2.** Som variant 1, plus RTTD-startvärde RTTM/2.
  RTTD(n) = (1-b) × RTTD(n-1) + b × abs(RTTS(n) - RTTM(n)), b = 1/4. RTO2 = RTTS + 4 × RTTD.

## 2. Tentans fasta form

Poängfördelningen är identisk i alla fyra tentor:

| Fråga | Del | Poäng | Form |
| --- | --- | --- | --- |
| 0 | — | 0 | Tidigare delresultat. Finns bara i de två 2025-tentorna. Hoppas över vid första försöket |
| 1 | A | 6–7 | "Några blandade frågor om transportnivåprotokoll", 5–7 fristående 1p-frågor |
| 2 | A | 5 | Beräkning eller graf. RTO-tabell, eller congestion window |
| 3 | A | 5 | Figur att rita färdigt. Handskakning, terminering, eller cwnd-graf |
| 4 | A | 5–6 | Figur med ACK-regler, MTU-kedja, eller flödeskontroll |
| 5 | B | 7–8 | "Några blandade frågor om applikationsnivåprotokoll", 6–7 fristående 1–2p-frågor |
| 6 | B | 4–5 | Komprimering eller kodning. Base64/QP, Huffman, JPEG, SNMP-MIB |
| 7 | B | 4–5 | DNS, SNMP eller RTP |
| 8 | B | 5–6 | FTP eller e-post |

**Fråga 1 och 5 är tillsammans 13–15 av 44 poäng, i 1p- och 2p-bitar.** Det är tentans billigaste
poäng och de utgör i praktiken hela vägen till godkänt.

## 3. Komplett delfrågeinventering

Kolumnen Poäng är delfrågans poäng. Varje tenta summerar till 22 + 22.

### 3.1 Oktober 2024

| Del | Fråga | Poäng | Ämne | Innehåll och svar i korthet |
| --- | --- | --- | --- | --- |
| A | 1a | 1 | Portar | Fyra värden utöver protokollet. Käll- och destinationsadress, käll- och destinationsport |
| A | 1b | 1 | Fönster | Flow och congestion control kombineras som minimum av cwnd och rwnd |
| A | 1c | 2 | ACK-regler | Piggybacking. Skicka ACK när du ändå skickar data, sparar bandbredd och motverkar ACK-förlust |
| A | 1d | 1 | SCTP | SSN ordnar en enskild ströms chunks |
| A | 1e | 1 | Terminering | TIME-WAIT 2 MSL så gamla segment inte tolkas in i en ny förbindelse |
| A | 2a | 3 | RTO | Fyll i RTTS, RTTD, RTO1, RTO2 för RTTM 75, 100, 200 ms från RTTS 100 och RTTD 50 |
| A | 2b | 1 | RTO | Vid t+1,5s med variant 1 sker timeout (200 > 194,5) och omsändning |
| A | 2c | 1 | RTO | Med variant 2 händer inget (RTO2 298,7) |
| A | 3 | 5 | Congestion control | Rita cwnd och ssthresh för Reno till t=20, givet timeout vid t=4 och t=13, 3 dupACK vid t=16 |
| A | 4a | 3 | Flödeskontroll | Push på A och B/C, pull på D |
| A | 4b | 1 | Flödeskontroll | Window size skickas på kanal C |
| A | 4c | 1 | Flödeskontroll | Tom buffert ger window size lika med maxvärdet |
| A | 4d | 1 | Flödeskontroll | recv() blockerar, eller returnerar fel att inget finns |
| B | 5a | 1 | Klient-server | Huvudalternativet är peer-to-peer |
| B | 5b | 1 | HTTP | HTTP/2 server push minskar latensen genom att skicka css och js i förväg |
| B | 5c | 2 | MIME | Behövs för filtyper och annan teckenkodning, och för bilagor |
| B | 5d | 1 | SNMP | BER kodar datat till binärformat |
| B | 5e | 1 | DNS | AAAA är en IPv6-adress |
| B | 5f | 1 | JPEG | Nej, DCT-steget är inte det som är lossy |
| B | 6a | 2 | Teckenkodning | Quoted-Printable av "Älvsjö" ger =C4lvsj=F6 |
| B | 6b | 3 | Teckenkodning | Base64 av samma sträng ger xGx2c2r2 |
| B | 7a | 2 | RTP | Två funktioner: tidsstämpel, paketordning, flera källor, ange källkodning |
| B | 7b | 1 | RTP | UDP eftersom TCP:s omsändningar tar för lång tid och stör allt efter |
| B | 7c | 2 | SIP | SIP ger sessionsetablering och terminering, hitta motparten, förhandla kodning med SDP |
| B | 8a | 1 | FTP | FTP går över TCP |
| B | 8b | 2 | FTP | Klientens rader är de som börjar med USER, PASS, PORT, LIST, CWD, TYPE, RETR, QUIT |
| B | 8c | 2 | FTP | Fillistan och filen går över en ny TCP-förbindelse som servern öppnar från port 20 |

### 3.2 December 2024

| Del | Fråga | Poäng | Ämne | Innehåll och svar i korthet |
| --- | --- | --- | --- | --- |
| A | 1a | 1 | Portar | Ja, två processer kan lyssna på samma port med olika transportprotokoll |
| A | 1b | 1 | Portar | Dynamic/private används som klientens källport |
| A | 1c | 1 | Fragmentering | För stora UDP-datagram fragmenteras på IP-nivån med fragment offset |
| A | 1d | 1 | RTO | Karns algoritm: använd inte RTTM från omsända segment |
| A | 1e | 1 | SACK | Nyttigt när vissa segment tappas men andra kommer fram; ger färre omsändningar |
| A | 1f | 1 | Flödeskontroll | Silly window syndrome, 1 byte data mot 40+ byte huvuden |
| A | 1g | 1 | Fönster | Sändarfönstret är minimum av cwnd och rwnd |
| A | 2a | 1 | ACK-regler | Sekvensnummer 18001 är duplikat. ACK 19001 omedelbart, regel 6 |
| A | 2b | 1 | ACK-regler | 19501 är out-of-order. Lagra och skicka ACK 19001 direkt (examinator anger ingen regel här) |
| A | 2c | 1 | ACK-regler | 19001 med data att skicka. ACK 20001 piggybackad, regel 1 |
| A | 2d | 2 | ACK-regler | 19001 utan data. Vänta 500 ms, ACK 20001, regel 2. Eller direkt vid utstående ACK, regel 3 |
| A | 3 | 5 | Terminering | Rita active close med alla segment och tillstånd på båda sidor |
| A | 4a | 3 | MTU | Rita paketkedjan över länkar med olika MTU, med ICMP Fragmentation Needed |
| A | 4b | 1 | MSS | Med MSS-option blir första segmentet 1460 i stället för 1480 |
| A | 4c | 1 | Fragmentering | Flaggan är Don't Fragment (DF) |
| B | 5a | 1 | SNMP | OID är en sekvens heltal som pekar ut en gren i ett träd |
| B | 5b | 1 | HTTP | DNS-namnet behövs för webbhotell med en IP-adress och flera servrar |
| B | 5c | 1 | PCM | Lagra amplituden linjärt var x:e millisekund |
| B | 5d | 1 | FCAPS | A är Accounting, t.ex. debitering och surfpott |
| B | 5e | 1 | SSH | Även säker filöverföring och tunnling av osäkra protokoll |
| B | 5f | 2 | JPEG | Makroblock är fyra 8x8-block, används för downsampling av Cb och Cr |
| B | 6a | 3 | Huffman | Rita Huffmanträd för frekvenserna 64, 8, 7, 21 procent |
| B | 6b | 1 | Huffman | 1,51 bitar per symbol mot 2, alltså 24,5 procent mindre |
| B | 7a | 1 | DNS | Klienten får resolverns adress oftast via DHCP |
| B | 7b | 1 | DNS | Root-servrarnas adresser är förprogrammerade i resolvern |
| B | 7c | 1 | DNS | Nästa servers adress kommer i svaret från nivån ovanför |
| B | 7d | 2 | DNS | UDP, eftersom TCP skulle kräva handskakning per förfrågan, massiv overhead |
| B | 8a | 1 | E-post | E-postprotokollen använder TCP |
| B | 8b | 1 | DNS | MX-posten pekar ut mottagarens MTA |
| B | 8c | 2 | SNMP | E-postfunktioner måste övervakas också, och specifikationen kallas MIB |
| B | 8d | 2 | MIME | RFC822 saknar rik text och andra teckenuppsättningar än US-ASCII; S/MIME ger kryptering |

### 3.3 Oktober 2025

| Del | Fråga | Poäng | Ämne | Innehåll och svar i korthet |
| --- | --- | --- | --- | --- |
| A | 1a | 1 | UDP-hex | DF01 0045 0004 238C 7F10 0001. Destinationsport 0x0045 är 69 |
| A | 1b | 1 | MTU | MTU och MSS. Större segment tvingar IP att fragmentera, vilket kostar prestanda |
| A | 1c | 1 | Portar | TCP skiljs från UDP med Protocol-fältet i IP-huvudet |
| A | 1d | 1 | TCP-flaggor | PSH skickar direkt utan att vänta på fullt segment, t.ex. interaktiv terminal |
| A | 1e | 1 | SACK | SACK anger exakt vilka out-of-order-segment som tagits emot |
| A | 1f | 1 | Congestion control | Ännu en algoritm: Vegas, Westwood, BIC, CUBIC |
| A | 1g | 1 | SCTP | Multihoming ger flera IP-adresser per association, utan lastbalansering |
| A | 2a | 3 | Congestion control | Summera cwnd under Tahoe-grafen (137 segment), 137 × 1460 / 2 s ger 800 kbps |
| A | 2b | 2 | Congestion control | Rita om samma förlopp som Reno |
| A | 3a | 1,5 | Etablering | SYN har ISN som slumptal, SYN+ACK eget ISN, ACK har ISN plus 1 |
| A | 3b | 1,5 | Etablering | SYN har ingen ACK, SYN+ACK har ACK lika med klientens ISN plus 1, sista ACK serverns plus 1 |
| A | 3c | 2 | Portar | Klientporten är ett slumptal i det dynamiska intervallet, serverporten kommer från bind() |
| A | 4a | 2 | ACK-regler | Identifiera regel 1, 2, 3 och 4 i de markerade lägena A till D |
| A | 4b | 3 | ACK-regler | Rita färdigt förloppet och ange alla tillämpade ACK-regler |
| B | 5a | 1 | Klient-server | Peer-to-peer |
| B | 5b | 1 | Teckenkodning | ISO-8859-1, UTF-8, windows-1252 klarar å ä ö |
| B | 5c | 1 | FCAPS | C är Configuration, t.ex. koppling, hårdvara, mjukvara, inställningar |
| B | 5d | 1 | Färg | Tre värden räcker eftersom ögat har tre typer av tappar |
| B | 5e | 1 | MPEG | Spatial komprimering är att varje bildruta komprimeras som stillbild |
| B | 5f | 2 | RTP | Vid congestion kan sändaren ändra kodning, upplösning, fps. Info kommer via RTCP |
| B | 6a | 2 | SNMP | udpInDatagrams har OID 1.3.6.1.2.1.7.1.0 |
| B | 6b | 1 | SNMP | GetNextRequest ger 1.3.6.1.2.1.7.2.0, alltså udpNoPorts.0 |
| B | 6c | 2 | SNMP | Alla är 32-bitars unsigned. Counter räknar bara upp och slår runt, Gauge går upp och ner |
| B | 7a | 1 | DNS | UDP används, TCP bara vid svar över 512 bytes |
| B | 7b | 1 | DNS | Ännu en posttyp: AAAA, CNAME, MX eller TXT, med syfte |
| B | 7c | 3 | DNS | Rita om figuren som rekursiv uppslagning, med numrerade pilar |
| B | 8a | 1 | E-post | SMTP avslutar meddelandet med en punkt på egen rad |
| B | 8b | 1 | FTP | FTP stänger dataförbindelsen när filen är slut |
| B | 8c | 1 | HTTP | HTTP/1.1 anger Content-Length i huvudet |
| B | 8d | 1 | MIME | Flera bilagor i ett meddelande löses med MIME |
| B | 8e | 1 | Base64 | Base64 gör 3 bytes till 4 ASCII-tecken, alltså 4/3 minus 1 lika med 33 procent |

### 3.4 December 2025

| Del | Fråga | Poäng | Ämne | Innehåll och svar i korthet |
| --- | --- | --- | --- | --- |
| A | 1a | 1 | UDP-hex | Samma hexsträng som oktober 2025. Längdfältet 0x0004 ger 4 bytes |
| A | 1b | 1 | Portar | Dynamic/private används som klientens källport |
| A | 1c | 1 | Flödeskontroll | Mellan mottagarbuffert och process används pull, via recv() |
| A | 1d | 1 | Fönster | Window size anger hur mycket andra änden får skicka utan ACK |
| A | 1e | 1 | Etablering | ISN är ett slumptal |
| A | 1f | 1 | MTU | DF sätts, och en länk som inte kan skicka vidare svarar med ICMP |
| A | 1g | 1 | SCTP | En chunk är data från en ström eller ett kontrollmeddelande; flera per paket |
| A | 2a | 3 | RTO | Fyll i tabellen från RTTS 1 och RTTD 0,5 när RTT blir 3 s. Ger RTTS 1,25 och 1,47 och 1,66 |
| A | 2b | 1 | RTO | Med variant 1 skickas k+1 och k+2 om |
| A | 2c | 1 | RTO | Med variant 2 skickas inget om |
| A | 3a | 3 | Congestion control | Hitta felen i Reno-grafen. Frågan säger tre fel, lösningsförslaget listar fyra: cwnd 1 inte 0 vid t=3, övergång till CA borde skett vid t=7 i stället för ett steg senare, cwnd 9 inte 0 vid t=11, och CA redan vid t=14 |
| A | 3b | 2 | Congestion control | 3 dupACK uppstår när ett segment försvinner och tre följande ger samma ACK, regel 4 |
| A | 4a | 3 | ACK-regler | Konstruera ett förlopp som ger regel 3, sedan 2, sedan 3, sedan 6, med MTU 100 |
| A | 4b | 2 | ACK-regler | Ange alla sekvens- och ACK-nummer i samma figur |
| B | 5a | 1 | Klient-server | Serverns roll är att svara på och utföra klienternas instruktioner |
| B | 5b | 2 | PCM | Okomprimerat ljud lagras som heltalsamplitud, t.ex. 16 bitar med jämn samplingstakt |
| B | 5c | 1 | MIME | Content-Type anger filtyp, hierarkiskt i två nivåer |
| B | 5d | 1 | E-post | POP och IMAP hämtar mottagen post från den egna servern |
| B | 5e | 1 | Streaming | TCP duger eftersom vi kan buffra först och sedan använda flödeskontroll |
| B | 5f | 1 | DNS | Caching, framför allt i resolvern, fördröjer ett A-postbyte |
| B | 5g | 1 | RTP | RTP bär ljud och bild |
| B | 6a | 1 | Komprimering | Lossless format: PNG, GIF, TIFF |
| B | 6b | 1 | Komprimering | Lossy format: JPEG, HEIC |
| B | 6c | 2 | JPEG | DCT flyttar de viktiga värdena till övre vänstra hörnet och gör resten små |
| B | 6d | 1 | JPEG | Efter DCT kommer kvantisering och zigzag-kodning |
| B | 7a | 1 | SNMP | GetRequest och SetRequest går Manager till Agent |
| B | 7b | 1 | SNMP | GetNextRequest går Manager till Agent |
| B | 7c | 1 | SNMP | Trap går Agent till Manager |
| B | 7d | 1 | SNMP | En OID pekar ut en övervakningsbar variabel, i en GetRequest den som efterfrågas |
| B | 8a | 1 | FTP | Den andra förbindelsen överför själva filen |
| B | 8b | 1 | FTP | Båda förbindelserna går över TCP |
| B | 8c | 1 | FTP | Kommandon är fyra bokstäver, argument och radbrytning, t.ex. CWD /home/martin |
| B | 8d | 1 | FTP | Bara kontrollförbindelsen räcker för att skapa tom mapp eller ta bort filer |
| B | 8e | 1 | FTP | HTTP är det snabbare alternativet för filnedladdning |

## 4. Aggregerad ranking

Poäng är summan över fyra tentor. Maxsumman per del är 88 poäng, alltså 22 gånger fyra.
Kolumnen Tentor säger i hur många av de fyra tentorna ämnet förekom alls.

### 4.1 Del A, Transportnivån

| Rang | Ämne | Poäng av 88 | Tentor | Största enskilda block |
| --- | --- | --- | --- | --- |
| 1 | ACK-reglerna och sekvens-/ACK-nummer | 17 | 4 | 5p |
| 2 | Congestion control, cwnd och ssthresh | 16 | 3 | 5p |
| 3 | RTO- och RTT-beräkning | 11 | 3 | 5p |
| 3 | Flödeskontroll och fönster | 11 | 3 | 6p |
| 5 | Etablering och terminering | 10 | 4 | 5p |
| 6 | MTU, MSS, fragmentering, ICMP, DF | 8 | 3 | 5p |
| 7 | Portnummer och multiplexing | 7 | 4 | 2p |
| 8 | SCTP | 3 | 3 | 1p |
| 9 | SACK | 2 | 2 | 1p |
| 9 | UDP-huvudet i hex | 2 | 2 | 1p |
| 11 | TCP-flaggor, PSH | 1 | 1 | 1p |

### 4.2 Del B, Applikationsnivån

| Rang | Ämne | Poäng av 88 | Tentor | Största enskilda block |
| --- | --- | --- | --- | --- |
| 1 | SNMP, MIB, OID och FCAPS | 15 | 4 | 5p |
| 2 | Bild- och videokomprimering | 14 | 4 | 5p |
| 3 | DNS | 13 | 4 | 5p |
| 4 | FTP | 11 | 3 | 5p |
| 5 | E-post, SMTP och MIME | 9 | 4 | 3p |
| 5 | RTP, RTCP, SIP och streaming | 9 | 3 | 5p |
| 7 | Teckenkodning, QP och Base64 | 7 | 2 | 5p |
| 8 | Klient-server mot peer-to-peer | 3 | 3 | 1p |
| 8 | HTTP | 3 | 3 | 1p |
| 8 | Ljud och PCM | 3 | 2 | 2p |
| 11 | SSH | 1 | 1 | 1p |

DNS-raden inkluderar december 2024 fråga 8b om MX-posten, som ställdes inuti e-postfrågan men
handlar om en DNS-posttyp. Streaming-raden inkluderar december 2025 fråga 5e om varför TCP duger
för lagrad media. Komprimeringsraden inkluderar oktober 2025 fråga 5d om varför tre färgvärden
räcker, som är färguppfattning snarare än komprimering men hör till samma block i boken.

**Rangordningen är sorterad på poäng, och det döljer en sak:** ett ämne kan få hög rang av ett
enda stort block i ett enda år. I Del A gäller det flödeskontroll (6 av 11 poäng kommer från ett
block i oktober 2024) och congestion control (rank 2, men saknas helt i december 2024). Ett ämne
med Tentor lika med 4 är ett säkrare kort än ett ämne med fler poäng och Tentor lika med 3.

### 4.3 Frågor som återkommit nästan ordagrant

Starkaste signalen i underlaget. Antalet är antalet tentor där samma fråga med samma svar
förekom, inte antalet gånger ämnet nämndes.

| Frågan | Antal tentor |
| --- | --- |
| cwnd- och ssthresh-grafen, tre olika varianter | 3 |
| Klient-server-frågan som 5a (svaret peer-to-peer i två av dem) | 3 |
| Dynamic/private-portarnas syfte | 2 |
| Sändarfönstret som minimum av cwnd och rwnd | 2 |
| SACK:s nytta | 2 |
| UDP-datagrammet i hex, identisk sträng | 2 |
| FCAPS, olika bokstav | 2 |
| DCT uttryckligen i frågetexten | 2 |
| Varför MIME behövs | 2 |
| RTO-tabellen, identisk uppbyggnad | 2 |
| DNS iterativ mot rekursiv med figur | 2 |
| FTP:s två förbindelser | 2 |

## 5. Poängstrategi för godkänt

Ordningen nedan är sorterad på poäng per pluggtimme, inte på poäng. Den skiljer sig därför från
rankingen i avsnitt 4, och det är avsiktligt.

**Tre ämnen per del, inte två.** Planen är testad mot varje tenta för sig. Med bara de två första
posterna hade studenten fått 6p på Del A och 7p på Del B i oktober 2024, alltså underkänt på
båda: den tentan saknade både SNMP-block och DNS-block, och dess stora Del A-block låg i
congestion control och flödeskontroll. Ett aggregat över fyra tentor döljer ett sådant år.

**Del A, till 9p:**

1. **Fråga 1-poolen**, 21 fakta. Ger 6–7p. I alla fyra tentorna låg varje delfråga i fråga 1
   inom poolen.
2. **ACK-reglerna.** Reglerna delas ut, så arbetet är att applicera dem på en figur och räkna
   sekvens- och ACK-nummer. Förekom i alla fyra, som 5p-block i tre.
3. **RTO-tabellen.** Formlerna delas ut de år frågan ställs, miniräknare är tillåten, uppgiften är
   mekanisk. 5p i två av fyra. Inte valfri — det är den som räddar en tenta som oktober 2024.

**Del B, till 9p:**

1. **Fråga 5-poolen**, 23 fakta. Ger 7–8p. Även här låg varje delfråga inom poolen i alla fyra.
2. **SNMP.** Manager skickar Get, GetNext och Set till Agent; Agent skickar Trap till Manager.
   OID är en väg i MIB-trädet. Counter räknar bara upp och slår runt, Gauge går upp och ner,
   alla är 32-bitars unsigned.
3. **FTP** före DNS. DNS gav 0p utöver fråga 5 i oktober 2024, FTP gav 5p.
4. **DNS** som fjärde post om det finns tid. Den räddar december 2024, som saknade FTP helt.

### 5.1 Vad planen hade gett på varje gammal tenta

Räknat delfråga för delfråga, under antagandet att studenten svarar rätt på allt hen pluggat
enligt de tre posterna per del. Godkäntgränsen är 9p.

| Tenta | Del A | Del B |
| --- | --- | --- |
| Oktober 2024 | 11p | 12p |
| December 2024 | 12p | 9p |
| Oktober 2025 | 12p | 13p |
| December 2025 | 17p | 17p |

December 2024:s Del B är tunnaste utfallet, exakt 9p, eftersom tentan saknade FTP. Med DNS som
fjärde post blir samma tenta 15p.

**Lägst prioritet, objektivt:** Huffmanträd (1 av 4), Quoted-Printable och Base64 för hand
(1 av 4), SSH (1 av 4), PSH (1 av 4), att beräkna kbps ur grafens area (1 av 4), och att rita
hela congestion-grafen från en händelselista (svårast av de tre grafvarianterna).

## 6. Vad som är verifierat och vad som inte är det

**Verifierat direkt ur filerna:** poängen per delfråga, tvådelningen med 9p-kravet per del,
betygstabellen, att poängfördelningen är identisk i alla fyra tentor, vilket bakgrundsmaterial
varje enskild tenta trycker, att endast miniräknare är tillåten (kurs-PM plus december
2024-tentans förstasida), och samtliga svar i avsnitt 3 (de kommer ur examinators egna
lösningsförslag).

**Inte verifierat, tre saker:**

1. **Datumet i oktober 2025-filen** säger "22:e oktober 2024", medan oktober 2024-filen säger
   "18:e oktober 2024". Troligen kvarlämnat fel från föregående års mall. Filnamnet är mer
   tillförlitligt än headern. Påverkar inte rankningen.
2. **Bokupplagan.** Lösningsförslagen hänvisar till figurnummer i Forouzan 6:e upplagan.
   Användaren har 5:e. Ge inga kapitelhänvisningar som fakta.
3. **Fyra tentor är fyra observationer.** Ett "2 av 4" kan vara slump.

**En konverteringsartefakt att känna till:** headertabellen på förstasidan är skadad i sex av de
åtta filerna, så uppgifter som stod där (t.ex. hjälpmedelsraden) kan ha fallit bort. Att något
saknas i en av dessa sex filer är därför inte bevis för att det saknades på tentan.

**Två ämnen som inte gick att bedöma alls, eftersom ingen tenta rör dem:** STP och
länkaggregering, samt OSPF och HSRP. De står i kurs-PM:et; OSPF hör till laboration 2 och HSRP
till laboration 3, medan STP och EtherChannel inte nämns i någon labbeskrivning.

## 7. Källfiler

Alla under `KTH/2026 Höst/HI1032 Kommunikationssystem/Filer/Canvas/`, som är
tredjepartsmaterial hämtat från Canvas. **Läs det, redigera det aldrig.**

| Fil | Innehåll |
| --- | --- |
| `AI-optimerad Markdown/Gamla Tentor/TentaKommSys_2024okt.md` | Tenta oktober 2024 |
| `AI-optimerad Markdown/Gamla Tentor/TentaKommSys_2024okt_svar.md` | Lösningsförslag |
| `AI-optimerad Markdown/Gamla Tentor/TentaKommSys_2024dec.md` | Tenta december 2024 |
| `AI-optimerad Markdown/Gamla Tentor/TentaKommSys_2024dec_svar.md` | Lösningsförslag |
| `AI-optimerad Markdown/Gamla Tentor/TentaKommSys_2025okt.md` | Tenta oktober 2025 |
| `AI-optimerad Markdown/Gamla Tentor/TentaKommSys_2025okt_svar.md` | Lösningsförslag |
| `AI-optimerad Markdown/Gamla Tentor/TentaKommSys_2025dec.md` | Tenta december 2025 |
| `AI-optimerad Markdown/Gamla Tentor/TentaKommSys_2025dec_svar.md` | Lösningsförslag |
| `AI-optimerad Markdown/Kursinformation/KTH _ About course HI1032.md` | Kurs-PM HT 2026 |

Motsvarande PDF:er ligger i `Gamla Tentor/` och `Kursinformation/` i samma Canvas-mapp. Figurerna
i tentorna finns bara som bilder under `AI-optimerad Markdown/assets/`, så figurberoende
delfrågor kan inte läsas som text.
