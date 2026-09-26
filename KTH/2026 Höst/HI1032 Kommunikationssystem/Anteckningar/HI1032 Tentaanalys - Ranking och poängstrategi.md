---
tags: [tenta, HI1032, nätverk, KTH, year2026]
created: 2026-09-23
updated: 2026-09-23
description: "Ranking av HI1032:s tentaämnen efter hur många poäng de varit värda i de fyra gamla tentorna från 2024 och 2025, med en poängstrategi för att nå de 9 poäng per del som krävs för godkänt, en lista över ordagrant återkommande frågor och en lista över vad som är säkrast att hoppa över."
---

# HI1032 Tentaanalys - Ranking och poängstrategi

Underlaget är fyra tentor med lösningsförslag: oktober 2024, december 2024, oktober 2025 och
december 2025. Varje delfråga är klassad på ämne och poäng, så tabellerna nedan summerar
**88 poäng per del** (22 poäng gånger fyra tentor).

**Läs kolumnen Tentor tillsammans med poängen.** Fyra tentor är ett litet underlag, och ett ämne
kan få hög rang av ett enda stort block i ett enda år. Två exempel att ha i huvudet:
flödeskontroll har 11 poäng men 6 av dem kommer från ett block i oktober 2024, och congestion
control är rank 2 men fanns inte alls i december 2024. Ett ämne med "4 av 4" är ett säkrare kort
än ett ämne med fler poäng och "3 av 4".

## Tentans fasta struktur

Poängfördelningen är identisk i alla fyra tentor, och det är det mest användbara du kan veta om
tentan:

- **Del A Transportnivån**, 4 frågor, max 22p. **9p krävs för godkänt.**
- **Del B Applikationsnivån**, 4 frågor, max 22p. **9p krävs för godkänt.**
- Godkänt kräver ==båda== delarna. Du kan inte kompensera en svag del med en stark.
- 9p av 22 är **40 procent**. Det är ett lågt krav och går att träffa selektivt.
- **Fråga 1 och fråga 5 är alltid "några blandade frågor"** — fem till sju fristående
  1-poängsfrågor i Del A (6–7p), sex till sju 1- och 2-poängsfrågor i Del B (7–8p). Tillsammans
  är de 13–15 av tentans 44 poäng, i de minsta bitarna som finns.
- Fråga 2, 3 och 4 samt 6, 7 och 8 är block på 4–6p vardera, oftast 5p.
- **Fråga 0** ger **0p** och besvaras bara av den som har ett godkänt delresultat sedan tidigare.
  Den finns i de två 2025-tentorna men inte i 2024-tentorna. Första gången du skriver hoppar du
  över den.
- 4 timmar, 8 frågor. Tid är inte den knappa resursen — urval är.

### Det här delar tentan ut, så memorera det inte

Bakgrundsmaterialet står i tentalydelsen, men **inte samma material varje år** — examinator
delar ut det som årets frågor kräver. Det gör att listan nedan är två listor.

**Varje gång, alla fyra tentorna:** **TCP-huvudet**, **de sex ACK-reglerna** i sin helhet, minst en
**tillståndsmaskin** (klient/server, Reno, eller båda), och **IP-huvudet** (uttryckligen
namngivet i tre av fyra; oktober 2024 har en figur på samma plats vars bildtext föll bort i
PDF-konverteringen, så där kan jag inte visa det svart på vitt).

**Bara när en fråga kräver det:** **UDP-huvudet** (namngivet i de två 2025-tentorna), **båda
RTO-formlerna** med konstanter (oktober 2024 och december 2025 — exakt de två tentor som hade en
RTO-uppgift), **Tahoe-tillståndsmaskinen** (bara oktober 2025), och **Base64- respektive
ISO-8859-1-tabellen** (bara oktober 2024, den enda tenta som krävde kodning för hand).

Praktiskt betyder det: du ska kunna ==använda== ACK-reglerna, huvudena och tillståndsmaskinerna,
inte kunna dem utantill. Men räkna inte med att RTO-formlerna eller kodningstabellerna ligger
framför dig — de dyker bara upp tillsammans med sin egen fråga.

## Del A — ranking, Transportnivån

| Rang | Ämne | Poäng av 88 | Tentor | Typisk form |
| --- | --- | --- | --- | --- |
| 1 | **ACK-reglerna och sekvens-/ACK-nummer** | 17 | 4 av 4 | 5p-block i tre tentor: applicera reglerna på en figur |
| 2 | **Congestion control, cwnd och ssthresh** | 16 | 3 av 4 | 5p-block: rita, rita om, eller hitta fel i grafen |
| 3 | **RTO- och RTT-beräkning** | 11 | 3 av 4 | 5p-block i två tentor: fyll i tabell, avgör omsändning |
| 3 | **Flödeskontroll och fönster** | 11 | 3 av 4 | ett 6p-block, annars 1p-frågor |
| 5 | **Etablering och terminering** | 10 | 4 av 4 | 5p-block i en tenta, annars 1–3p |
| 6 | **MTU, MSS, fragmentering, ICMP och DF** | 8 | 3 av 4 | ett 5p-block, annars 1p-frågor |
| 7 | **Portnummer och multiplexing** | 7 | 4 av 4 | nästan alltid 1p i fråga 1 |
| 8 | **SCTP** | 3 | 3 av 4 | alltid exakt 1p i fråga 1 |
| 9 | **SACK** | 2 | 2 av 4 | 1p i fråga 1 |
| 9 | **UDP-huvudet i hex** | 2 | 2 av 4 | 1p, ==identisk hexsträng båda gångerna== |
| 11 | **TCP-flaggor (PSH)** | 1 | 1 av 4 | 1p |

### Fråga 1-poolen i Del A, med facit

Alla dessa har faktiskt ställts, och de är värda 1p var. Poolen är liten nog att lära sig hel.

| Fråga | Svaret som gav poäng |
| --- | --- |
| Vilka fyra värden (utöver protokollet) identifierar en förbindelse? | Käll- och destinationsadress, käll- och destinationsport |
| Hur kombineras flow control och congestion control hos sändaren? | Sändarfönstret blir det minsta av cwnd och rwnd |
| Kan två processer lyssna på samma portnummer med olika protokoll? | Ja |
| När används dynamic/private-portarna? | Som klientens källport, när det inte spelar roll vilken port det blir |
| Hur skiljer datorn TCP-segment från UDP-datagram? | Protocol-fältet i IP-huvudet |
| Vad är MTU eller MSS, och varför behöver TCP veta det? | Största enhet respektive största segmentdata; annars börjar IP fragmentera, vilket kostar prestanda |
| Hur hanteras ett UDP-datagram som är för stort för ett IP-paket? | Fragmentering på IP-nivån, med fältet fragment offset |
| Vilken roll har ICMP för segmentstorleken? | DF-flaggan sätts; en länk som inte kan skicka vidare svarar med ICMP Fragmentation Needed |
| Vad säger Karns algoritm? | Använd inte RTTM från segment som har skickats om |
| Vad tillför SACK en vanlig ACK? | Exakt vilka out-of-order-segment som tagits emot, vilket ger färre omsändningar |
| Vad är silly window syndrome? | Segment med 1 byte data och 40+ byte huvuden, alltså slöseri med bandbredd |
| Vad står i fältet window size? | Hur mycket data andra änden får skicka utan att invänta en ACK |
| Vad är speciellt med ISN? | Det är ett slumptal |
| Varför behövs TIME-WAIT i 2 MSL? | Så att inga gamla segment från förra förbindelsen tolkas in i en ny med samma portpar |
| Vad är syftet med PSH-flaggan? | Skicka direkt utan att vänta på ett fullt segment, t.ex. vid interaktiv terminal |
| Nämn ännu en congestion control-algoritm | Vegas, Westwood, BIC eller CUBIC |
| Vad är SCTP-multihoming? | En association får använda flera IP-adresser och byta mellan dem utan ny etablering; ingen lastbalansering |
| Vad gör stream sequence number i SCTP? | Sätter ihop en enskild ströms chunks i rätt ordning |
| Vad är en chunk i SCTP? | Antingen data från en ström eller ett kontrollmeddelande; flera chunks kan ligga i ett paket |
| Vad innebär piggybacking, och varför är det bra? | Skicka ACK:en i ett paket du ändå skickar data i. Sparar bandbredd och motverkar att ACK:ar tappas |
| Vilken flödeskontrollprincip gäller mellan mottagarbuffert och process? | Pull — processen hämtar med recv() |

Hexfrågan är värd sin egen rad. Strängen **DF01 0045 0004 238C 7F10 0001** förekom ordagrant i
både oktober- och decembertentan 2025. Fälten i UDP-huvudet kommer i ordningen källport,
destinationsport, längd, checksumma. Destinationsporten är 0x0045, alltså **69**, och längden är
0x0004, alltså **4 bytes**. Två tentor, två olika delfrågor, samma sträng.

## Del B — ranking, Applikationsnivån

| Rang | Ämne | Poäng av 88 | Tentor | Typisk form |
| --- | --- | --- | --- | --- |
| 1 | **SNMP, MIB, OID och FCAPS** | 15 | 4 av 4 | 4–5p-block i två tentor, annars 1–2p |
| 2 | **Bild- och videokomprimering** | 14 | 4 av 4 | JPEG, DCT, makroblock, MPEG, ett Huffman-block på 4p |
| 3 | **DNS** | 13 | 4 av 4 | 5p-block i två tentor: iterativ mot rekursiv uppslagning |
| 4 | **FTP** | 11 | 3 av 4 | 5p-block i två tentor |
| 5 | **E-post, SMTP och MIME** | 9 | 4 av 4 | 3p inom fråga 8, annars 1–2p-frågor |
| 5 | **RTP, RTCP, SIP och streaming** | 9 | 3 av 4 | ett 5p-block, annars 1–2p |
| 7 | **Teckenkodning, QP och Base64** | 7 | 2 av 4 | ett 5p-block med handräkning, annars 1p |
| 8 | **Klient-server mot peer-to-peer** | 3 | 3 av 4 | alltid 1p, alltid först i fråga 5 |
| 8 | **HTTP** | 3 | 3 av 4 | alltid exakt 1p |
| 8 | **Ljud och PCM** | 3 | 2 av 4 | 1–2p |
| 11 | **SSH** | 1 | 1 av 4 | 1p |

### Fråga 5-poolen i Del B, med facit

| Fråga | Svaret som gav poäng |
| --- | --- |
| Vad är huvudalternativet till klient-server? | Peer-to-peer |
| Vad är serverns roll enligt klient/server-modellen? | Att svara på och utföra klienternas instruktioner |
| Vilken teckenkodning klarar å ä ö? | ISO-8859-1 (Latin1), UTF-8, windows-1252 |
| Vad faller under C i FCAPS? | Configuration — hur enheter är kopplade, hårdvara, mjukvara, inställningar |
| Vad faller under A i FCAPS? | Accounting — t.ex. debitering och surfpott |
| Hur är en OID uppbyggd? | En sekvens heltal som pekar ut en gren i ett träd, t.ex. 1.3.6.1.2.1 |
| Vad gör BER i SNMP? | Kodar datat till binärformat |
| Varför räcker tre värden för färg? | Ögat har tre typer av tappar |
| Vad är spatial komprimering i MPEG? | Varje bildruta komprimeras för sig som en stillbild, t.ex. med JPEG |
| Är det DCT-steget som är lossy i JPEG? | Nej |
| Vad är makroblock i JPEG? | Fyra intilliggande 8x8-block, används för att downsampla Cb och Cr |
| Vad innebär PCM? | Amplituden lagras som ett heltal med viss precision, ett värde var x:e millisekund |
| Vad anger Content-Type i MIME? | Filtypen, hierarkiskt i två nivåer, t.ex. text/plain eller image/png |
| Vad är syftet med POP och IMAP? | Hämta mottagen e-post från sin egen e-postserver |
| Vad anger DNS-posttypen AAAA? | En IPv6-adress |
| Varför tar ett byte av A-posten timmar att slå igenom? | Caching, framför allt i DNS-resolvern |
| Varför duger TCP för streaming av lagrad media? | Vi kan buffra en bit först och sedan använda flödeskontroll |
| Vilket protokoll bär ljud och bild i ett videosamtal? | RTP |
| Varför skickas serverns DNS-namn i HTTP-anropet? | Ett webbhotell med en IP-adress kan ha flera webbservrar |
| Vad är fördelen med server push i HTTP/2? | Lägre latens, klienten får css och js innan den frågar |
| Varför behövs MIME när vi skickar e-post? Två skäl | RFC822 klarar bara 7-bitars US-ASCII och ingen rik text; MIME ger andra teckenuppsättningar, filtyper och bilagor |
| Vad kan en RTP-sändare göra vid congestion, och hur får den veta? | Ändra kodning, upplösning eller fps, alltså komprimera hårdare. Informationen kommer i RTCP-meddelanden från mottagarna |
| Vad kan SSH användas till utöver terminal? | Säker filöverföring och tunnling av osäkra protokoll |

## Billigaste vägen till 9p per del

Rankingen ovan mäter poäng och frekvens. Den här ordningen mäter något annat: poäng per
pluggtimme. Följ den om målet bara är E.

**Tre ämnen per del, inte två.** Jag testade planen mot varje gammal tenta för sig, och det är
därför det står tre: med bara de två första posterna hade du fått **6p på Del A och 7p på Del B**
i oktober 2024, alltså underkänt på båda. Den tentan saknade både SNMP-blocket och DNS-blocket, och
dess stora Del A-block låg i congestion control och flödeskontroll. Ett aggregat över fyra tentor
döljer den sortens år. Den tredje posten är det som gör planen robust.

**Del A, i ordning:**

1. **Fråga 1-poolen.** 21 fakta i tabellen ovan, en rad var. Ger 6–7p, och i alla fyra tentorna
   låg varje delfråga i fråga 1 inom poolen.
2. **ACK-reglerna.** De sex reglerna står i tentan, så jobbet är att kunna applicera dem på en
   figur och räkna ut sekvens- och ACK-nummer. Förekom i alla fyra tentor, som 5p-block i tre.
3. **RTO-tabellen.** Formlerna delas ut de år frågan ställs, miniräknare är tillåten, och
   uppgiften är mekanisk: fyll i RTTS, RTTD, RTO1, RTO2 rad för rad och jämför RTO mot RTTM för
   att avgöra vilka segment som skickas om. 5p i två av fyra tentor. **Hoppa inte över den** — den
   är billigast av alla stora poster och det är den som räddar en tenta som oktober 2024.

**Del B, i ordning:**

1. **Fråga 5-poolen.** 23 fakta ovan. Ger 7–8p, och även här låg varje delfråga inom poolen i
   alla fyra tentorna.
2. **SNMP.** Litet ämne, återkom i alla fyra. Manager skickar GetRequest, SetRequest och
   GetNextRequest till Agent; Agent skickar Trap till Manager. OID är en väg i MIB-trädet,
   GetNext ger nästa variabel i trädet, och Counter, Gauge och INTEGER är alla 32-bitars men
   Counter räknar bara uppåt och slår runt, Gauge går upp och ner.
3. **FTP.** Två förbindelser, båda över TCP, kontrollförbindelsen bär fyrbokstavskommandon som
   CWD och RETR, dataförbindelsen öppnas av servern från port 20 för varje fil och stängs när
   filen är slut. 5p-block i två av fyra och nästan gratis att lära. **Välj FTP före DNS** som
   tredje post: DNS gav 0p utöver fråga 5 i oktober 2024, FTP gav 5p.
4. **DNS** om du vill ha marginal ovanpå det. Iterativ mot rekursiv uppslagning, UDP och varför,
   root-hints, och varför caching fördröjer ett A-postbyte.

### Vad planen hade gett på varje gammal tenta

Siffrorna är vad du hade kunnat få **om du svarat rätt på allt du pluggat** enligt planen ovan,
räknat delfråga för delfråga. Godkäntgränsen är 9.

| Tenta | Del A med de tre posterna | Del B med de tre posterna |
| --- | --- | --- |
| Oktober 2024 | 11p | 12p |
| December 2024 | 12p | 9p |
| Oktober 2025 | 12p | 13p |
| December 2025 | 17p | 17p |

December 2024:s Del B är det tunnaste utfallet, 9p exakt, eftersom den tentan saknade FTP helt.
Lägg DNS till som fjärde post och samma tenta ger 15p. Det är den marginal jag rekommenderar om du
har tid kvar.

## Vad du kan hoppa över

Lägst poäng per pluggtimme, om du bara siktar på E:

- **Huffmanträd** (4p, 1 av 4 tentor). Bara december 2024. Räkneintensivt.
- **Quoted-Printable och Base64 för hand** (5p, 1 av 4). Bara oktober 2024. Tabellen delas ut,
  men bitpetningen tar tid och ger inga delpoäng om den spårar ur.
- **SSH** (1p, 1 av 4), **PSH-flaggan** (1p, 1 av 4).
- **Att rita congestion-grafen från grunden.** Ämnet är rank 2 och ska inte ignoreras, men de tre
  varianterna skiljer sig i svårighet: "hitta tre fel i grafen" och "rita om Tahoe som Reno" är
  billigare än att rita hela förloppet till t=20 från en händelselista. Öva felsökningsvarianten
  först, hela grafen sist.
- **Att räkna arean under en graf för att få kbps** (3p, 1 av 4). Kräver att du summerar cwnd
  över alla rundor och multiplicerar med MSS delat med total tid. Gör den sist.

## Ordagranna återkommanden

Det starkaste mönstret i underlaget. Dessa har ställts mer än en gång med i praktiken samma svar.
Antalet är antalet tentor där ==samma fråga med samma svar== förekom, inte antalet gånger ämnet
nämndes:

- **cwnd- och ssthresh-grafen** — tre tentor, tre olika varianter.
- **Klient-server-frågan som fråga 5a** — tre tentor, varav svaret var peer-to-peer i två
  (oktober 2024 och oktober 2025). December 2025 frågade i stället om serverns roll.
- **Dynamic/private-portarnas syfte** — två tentor, nästan identisk formulering.
- **Sändarfönstret som minimum av cwnd och rwnd** — två tentor.
- **SACK:s nytta** — två tentor.
- **UDP-datagrammet i hex, identisk sträng** — två tentor.
- **FCAPS**, olika bokstav varje gång (A respektive C) — två tentor.
- **DCT uttryckligen i frågetexten** — två tentor (oktober 2024 och december 2025). Räknar man
  bildkomprimering som ämne är det däremot fyra av fyra.
- **Varför MIME behövs** — två tentor.
- **RTO-tabellen** — två tentor, identisk uppbyggnad, andra siffror.
- **DNS iterativ mot rekursiv med figur** — två tentor.
- **FTP:s två förbindelser** — två tentor.

## Osäkerheter i det här underlaget

Tre saker att känna till, och en sak som var oklar men nu är avgjord.

**Avgjort: miniräknare är tillåten, och bara miniräknare.** Kurs-PM:et säger det rakt ut:
"Tentamen är skriftlig. Hjälpmedel som får medtas är endast miniräknare." December 2024-tentans
förstasida upprepar det. De andra tre tentornas headertabeller är skadade av PDF-konverteringen,
så att raden saknas där betyder ingenting. Räkna alltså med miniräknare men inget annat — ingen
formelsamling och ingen bok.

- **Datumet i oktobertentan 2025.** Dess header säger "22:e oktober 2024" medan oktobertentan
  2024 säger "18:e oktober 2024". Troligen ett kvarlämnat fel från förra årets fil. Påverkar
  inte rankningen, men gör att filnamnet är mer tillförlitligt än headern.
- **Kurslitteraturen.** Kurs-PM:et anger Forouzan 6:e upplagan (2022) och lösningsförslagen
  hänvisar till figurnummer i den (t.ex. Fig. 9.32, 9.50 och 10.44). Vaultets bok är 5:e
  upplagan, där numreringen skiljer sig. Därför är den här analysen byggd på ämne, inte på
  kapitelhänvisningar.
- **Fyra tentor är fyra observationer.** Ett ämne med "2 av 4" kan vara en slump. Kolumnen
  Tentor finns för att du ska kunna se skillnaden mellan ett mönster och ett sammanträffande.

**Och en sak som kurs-PM:et lovar men tentan inte levererar.** Kurs-PM:et listar STP,
EtherChannel, länkaggregering, OSPF och HSRP som kursinnehåll. ==Ingen av de fyra tentorna
innehåller en enda fråga om dem.== OSPF examineras i labb 2 och HSRP i labb 3; STP och
EtherChannel nämns inte ens i labbeskrivningarna. Plugga dem inte för tentans skull.

## Källor

Fyra tentor med lösningsförslag, i
`Filer/Canvas/AI-optimerad Markdown/Gamla Tentor/`: `TentaKommSys_2024okt`,
`TentaKommSys_2024dec`, `TentaKommSys_2025okt` och `TentaKommSys_2025dec`, var och en med en
`_svar`-fil. Kursens upplägg och examinationsform från
`Filer/Canvas/AI-optimerad Markdown/Kursinformation/KTH _ About course HI1032.md`.
En självständig version av den här analysen, avsedd att matas till AI-verktyg, ligger i
`HI1032 Tentaanalys - AI-kontext.md`.
