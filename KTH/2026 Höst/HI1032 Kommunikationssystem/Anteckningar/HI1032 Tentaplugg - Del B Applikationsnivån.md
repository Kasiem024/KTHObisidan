---
tags:
  - tenta
  - HI1032
  - nätverk
  - KTH
  - year2026
created: 2026-10-02
updated: 2026-10-19
description: "Flashcards för HI1032:s Del B, applikationsnivån, ordnade efter samma begrepp som teorifilen Tentasvar Del B. Varje avsnittsrubrik har ämnets tentasannolikhet inom parentes. Säkra ämnen har flest kort, möjliga bara något enstaka."
---

# HI1032 Tentaplugg - Del B Applikationsnivån

Flashcards för HI1032:s Del B, applikationsnivån, ordnade efter samma begrepp som teorifilen Tentasvar Del B. Varje avsnittsrubrik har ämnets tentasannolikhet inom parentes. Säkra ämnen har flest kort, möjliga bara något enstaka.

## FCAPS (Trolig)

Vad står FCAPS för?::De fem områdena i nätverkshantering: ==Fault, Configuration, Accounting, Performance och Security==
<!--SR:!fsrs,2026-10-25T04:24:11.426Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:24:11.426Z-->

Vad är skillnaden på reaktiv och proaktiv felhantering i FCAPS? (2)
||
- **Reaktiv** – hanterar fel när de redan inträffat: upptäcka, isolera, rätta och dokumentera dem
- **Proaktiv** – försöker hindra att vissa fel alls uppstår
<!--SR:!fsrs,2026-10-23T20:10:20.538Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:10:20.538Z-->

## SNMP – manager, agent och meddelandetyper (Säker)

Vad är SNMP och vad används det till?::==Ett protokoll för att övervaka och konfigurera nätverksenheter på distans==, där en manager frågar agenter som sitter på enheterna
<!--SR:!fsrs,2026-10-25T04:28:38.309Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:28:38.309Z-->

Vilka två roller finns i SNMP, och vad gör de? (2)
||
- **Manager** – sitter på en host, ställer frågorna och tar emot svar och trap-meddelanden
- **Agent** – sitter på varje nätverksenhet, håller enhetens värden och svarar managern
<!--SR:!fsrs,2026-10-25T04:25:23.805Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:25:23.805Z-->

Åt vilket håll går SNMP:s meddelanden? (2)
||
- **Manager → agent** – GetRequest, GetNextRequest, GetBulkRequest och SetRequest, för att hämta eller sätta värden
- **Agent → manager** – Response som svar på en fråga, och Trap som agenten skickar självmant
<!--SR:!fsrs,2026-10-23T20:05:00.981Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:05:00.981Z-->

Vilka UDP-portar använder SNMP? (2)
||
- **Agent** – lyssnar på port 161, dit managern skickar sina frågor
- **Manager** – lyssnar på port 162, dit agentens trap-meddelanden kommer
<!--SR:!fsrs,2026-10-21T05:47:17.856Z,0,0.19206666,8.40750771,3,3,1,0,2026-10-21T05:37:17.856Z-->

## ASN.1 och TLV (Trolig)

I vilken form beskrivs varje värde i ASN.1/TLV?::==Type, Length, Value== – alltså typ, längd och sedan själva värdet
<!--SR:!fsrs,2026-10-21T11:49:28.523Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:49:28.523Z-->

## SMI – Structure of Management Information (Trolig)

Vad är ett objekt-id (OID) i SNMP?::==En sökväg genom namnträdet som unikt pekar ut ett objekt==
<!--SR:!fsrs,2026-10-25T04:25:33.229Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:25:33.229Z-->

Vad är skillnaden mellan SMI och MIB? (2)
||
- **SMI** – reglerna: hur objekt namnges, vilka datatyper som finns och hur de kodas
- **MIB** – de faktiska objekten som ska hanteras, definierade med SMI:s regler
<!--SR:!fsrs,2026-10-21T11:43:57.368Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:43:57.368Z-->

## MIB-2 – Management Information Base (Trolig)

Vad innehåller en MIB?::==Alla förvaltningsobjekt som kan läsas eller sättas på en enhet==, ordnade i ett träd
<!--SR:!fsrs,2026-10-25T05:09:54.194Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:09:54.194Z-->

Vilka noder i MIB-trädet kan SNMP komma åt?::==Bara löven==, inte de inre noderna som bara är grenar
<!--SR:!fsrs,2026-10-21T11:38:53.286Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:38:53.286Z-->

## BER – Basic Encoding Rules (Trolig)

Vad gör BER i SNMP?::==Kodar värdena till bytes för överföring==, enligt TLV-formen
<!--SR:!fsrs,2026-10-23T20:03:25.438Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:03:25.438Z-->

## NETCONF och YANG (Möjlig)

Varför skapades NETCONF när SNMP redan fanns?::==SNMP är svagt på att ändra konfiguration==; NETCONF är byggt för konfiguration med transaktioner och roll-back
<!--SR:!fsrs,2026-10-21T05:15:48.376Z,0,0.19206666,8.40750771,3,3,1,0,2026-10-21T05:05:48.376Z-->

## Prestandahantering (Möjlig)

Vad betyder jitter i ett nät?::==Variationen i fördröjning== mellan paketen i samma session
<!--SR:!fsrs,2026-10-21T11:59:17.546Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:59:17.546Z-->

## Digital representation av text – teckenkodning (Trolig)

Varför måste text källkodas innan den skickas?::För att en länk ==bara kan skicka ettor och nollor==, så varje tecken måste översättas till ett bitmönster enligt en överenskommen tabell.
<!--SR:!fsrs,2026-10-25T05:09:29.959Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:09:29.959Z-->

## Sampling, kvantisering och PCM (Trolig)

Vad är sampling av en ljudsignal?::Att ==mäta signalens nivå med jämna tidsmellanrum== i stället för kontinuerligt.
<!--SR:!fsrs,2026-10-21T11:59:10.970Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:59:10.970Z-->

Vad är PCM?::Pulse Code Modulation – ==sampling (mäta nivån med jämna mellanrum) plus kvantisering (runda varje sampel till fasta nivåer)==.
<!--SR:!fsrs,2026-10-21T11:46:09.566Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:46:09.566Z-->

## µ-law och A-law (Trolig)

Vad är poängen med µ-law/A-law jämfört med en rak kvantiseringsskala?::En ==icke-linjär skala== lägger fler nivåer på tysta ljud, så man får större dynamiskt omfång utan fler kvantiseringsnivåer.

## Digital representation av bild – färg och tre tappar (Trolig)

Enligt Young–Helmholtz, varför kan färg beskrivas med tre värden?::För att ==ögat har tre typer av receptorer (tappar)==.
<!--SR:!fsrs,2026-10-25T05:05:07.083Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:05:07.083Z-->

## Förlustfri kompression (Trolig)

Vad kännetecknar förlustfri (lossless) kompression?::Datan blir mindre men ==exakt återställbar bit för bit==, vilket krävs för text och datorprogram.
<!--SR:!fsrs,2026-10-20T21:42:02.647Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:42:02.647Z-->

Hur komprimeras en PNG-bild?::Med en ==kombination av dictionary (LZW) och Huffman==.
<!--SR:!fsrs,2026-10-21T11:54:20.839Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:54:20.839Z-->

## Huffman (Trolig)

Vilken grundidé bygger Huffman-kodning på?::==Korta kodord till vanliga symboler och långa kodord till ovanliga==.
<!--SR:!fsrs,2026-10-21T11:38:29.966Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:38:29.966Z-->

Hur bygger man ett Huffman-träd?::Man ==slår ihop de två minsta frekvenserna till en nod, om och om igen tills allt är en rot==, och läser 0/1 på grenarna från roten ut till varje symbol.
<!--SR:!fsrs,2026-10-21T11:54:49.798Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:54:49.798Z-->

## Förstörande kompression – lossy (Trolig)

När får man använda förstörande (lossy) kompression och när inte?::Bara ==när lite förluster är acceptabla (ljud och bild)==, aldrig för text eller datorprogram som måste se likadana ut efteråt.
<!--SR:!fsrs,2026-10-20T22:12:43.630Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T22:12:43.630Z-->

## Predictive vs perceptual kodning (Trolig)

Vad är skillnaden mellan predictive och perceptual kodning? (2)
||
- **Predictive** – minimerar felet objektivt; tittar på hur den okomprimerade datan beter sig och skickar skillnaden mot en förutsägelse
- **Perceptual** – minimerar felet subjektivt; kastar det en människa ändå inte uppfattar, till exempel ljud under maskeringströskeln
<!--SR:!fsrs,2026-10-21T11:51:31.122Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:51:31.122Z-->

Vad menas med maskering i perceptual ljudkodning?::En ==stark ton höjer maskeringströskeln== så att svagare ljud nära i frekvens inte hörs och kan kastas.
<!--SR:!fsrs,2026-10-21T11:48:57.772Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:48:57.772Z-->

## Deltamodulering (Möjlig)

Vad skickar deltamodulering (DM) i stället för hela sampelvärdet?::==Bara om signalen gått upp eller ner sedan förra steget== – en bit per sampel.
<!--SR:!fsrs,2026-10-21T11:39:37.693Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:39:37.693Z-->

## Ljudkompression (Trolig)

Ungefär hur mycket komprimerar predictive respektive perceptual ljudkodning? (2)
||
- **Predictive (DM, ADPCM)** – ungefär 1:2; bygger på att små fel inte gör så mycket
- **Perceptual (MP3, AAC)** – ungefär 1:10; bygger på att små fel inte hörs

## DCT (2D) (Trolig)

Vad gör DCT med ett block pixlar?::Omvandlar det till ==koefficienter för olika frekvenser==, där första värdet är den grova nivån och resten allt finare detaljer.
<!--SR:!fsrs,2026-10-20T22:14:41.461Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T22:14:41.461Z-->

Varför kallas DCT matematiskt förlustfri?::Transformen är ==inverterbar (T⁻¹ = Tᵀ)==, så man kan räkna tillbaka exakt; förlusten kommer först i kvantiseringen.
<!--SR:!fsrs,2026-10-23T20:16:20.119Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:16:20.119Z-->

## JPEG (Säker)

Vilka tre steg går en JPEG-bild igenom, och vilket är förstörande? (3)
||
- **Transform (DCT)** – förlustfri; gör varje 8×8-block till frekvenskoefficienter
- **Kvantisering** – det förstörande steget; delar koefficienterna med en kvantiseringsmatris och avrundar
- **Kodning** – förlustfri; zigzag plus run-length/entropikodning till JPEG-filen
<!--SR:!fsrs,2026-10-25T04:24:52.546Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:24:52.546Z-->

I vilket steg sker förlusten i JPEG, och hur?::I ==kvantiseringen==, där varje DCT-koefficient delas med ett tal ur kvantiseringsmatrisen och avrundas, så de flesta höga frekvenserna blir 0.
<!--SR:!fsrs,2026-10-25T05:35:05.451Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:35:05.451Z-->

Varför läses ett kvantiserat JPEG-block i sicksack (zigzag)?::För att samla ==den långa svansen av nollor sist==, så run-length-steget kan packa ihop dem effektivt.
<!--SR:!fsrs,2026-10-25T04:30:50.155Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:30:50.155Z-->

## MPEG – temporal och spatial kodning (Trolig)

Vad är skillnaden mellan spatial och temporal kodning i MPEG? (2)
||
- **Spatial** – komprimerar inom en ruta, med samma idé som JPEG
- **Temporal** – komprimerar mellan rutor; skickar bara skillnaden mot närliggande rutor
<!--SR:!fsrs,2026-10-23T20:08:12.467Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:08:12.467Z-->

Vad är en I-ruta jämfört med B/P-rutor i MPEG?::En ==I-ruta är en hel bild==, medan B/P-rutor bara beskriver skillnaden mot närliggande rutor.

## Paketering (Möjlig)

Vad händer med B/P-rutorna i ett paket om I-rutan går förlorad?::De blir ==meningslösa==, eftersom de bara beskriver skillnaden mot I-rutan.

## Tre typer av multimediaöverföring och streaming (Trolig)

Vilka tre typer av multimediaöverföring finns, efter hur mycket man kan buffra? (3)
||
- **Lagrad (store and forward)** – hämtar en färdig fil; kan buffra mycket
- **Live-streaming** – alla ser samma ström; kan buffra någon sekund
- **Interaktiv (realtid)** – parter pratar med varandra; minimal buffert
<!--SR:!fsrs,2026-10-21T11:45:38.303Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:45:38.303Z-->

Hur används HTTP vid streaming av lagrad multimedia med metafil?::HTTP hämtar ==bara en liten metafil==, sedan laddar en separat spelare själva mediet, ofta över UDP/RTP.
<!--SR:!fsrs,2026-10-21T11:46:25.366Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:46:25.366Z-->

## Isokron ström och playback-buffert (Trolig)

Vad är en isokron ström?::En ström där ==varje paket ska spelas upp vid en bestämd tidpunkt==, i jämn takt.
<!--SR:!fsrs,2026-10-21T05:47:41.452Z,0,0.19206666,8.40750771,3,3,1,0,2026-10-21T05:37:41.452Z-->

Vad gör en playback-buffert, och vad kostar den?::Den ==samlar paket en stund före uppspelning== så det alltid finns data trots ojämn ankomst – priset är extra fördröjning.
<!--SR:!fsrs,2026-10-21T11:58:57.826Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:58:57.826Z-->

## Multimedia och TCP (Trolig)

Varför passar TCP dåligt för realtidsmultimedia?::TCP:s ==leverans i ordning och omsändningar== gör att ett saknat segment håller upp allt efter det, vilket realtid inte tål.
<!--SR:!fsrs,2026-10-25T05:04:38.011Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:04:38.011Z-->

Vad använder man i stället för TCP för realtidsmultimedia?::==UDP + smart paketering + FEC== (och anpassning av kompressionsgraden).
<!--SR:!fsrs,2026-10-25T05:12:11.908Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:12:11.908Z-->

## RTP (Säker)

Vad är RTP och var körs det?::Ett protokoll ==ovanpå UDP== som ger realtidsströmmar det UDP saknar, som sekvensnummer, tidsstämpel och källidentitet.
<!--SR:!fsrs,2026-10-20T22:13:05.206Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T22:13:05.206Z-->

Vad används RTP:s sekvensnummer till, och hur skiljer det sig från TCP:s?::Till att ==upptäcka att ett paket saknas men inte begära om det==; mottagaren får dölja luckan, för omsändning hinner inte i realtid.
<!--SR:!fsrs,2026-10-23T05:12:23.403Z,2,1.3363301,8.37949113,2,4,0,0,2026-10-21T05:12:23.403Z-->

Varför behöver RTP en tidsstämpel i varje paket?::Den säger ==när paketet ska spelas upp==, så strömmen kan återskapas jämnt trots ojämn fördröjning och flera källor synkroniseras.
<!--SR:!fsrs,2026-10-25T05:35:26.485Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:35:26.485Z-->

## RTCP (Trolig)

Vad är RTCP:s uppgift bredvid RTP?::Att bära ==kontrollinfo== – mottagarna rapporterar nätverksprestanda, strömmar från samma källa synkroniseras, och extra info om sändaren skickas.
<!--SR:!fsrs,2026-10-23T04:26:09.328Z,2,1.3363301,8.37949113,2,4,0,0,2026-10-21T04:26:09.328Z-->

Hur stor del av sessionens bandbredd får RTCP använda?::Högst ==5 %==.
<!--SR:!fsrs,2026-10-21T11:58:44.947Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:58:44.947Z-->

## SIP (Trolig)

Vad är SIP till för?::Att ==sätta upp, styra och avsluta ett samtal== mellan användare – hitta användaren, se om hon kan svara och komma överens om parametrar.
<!--SR:!fsrs,2026-10-21T11:49:42.795Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:49:42.795Z-->

Hur ser ett SIP-samtal ut steg för steg?::==INVITE → 200 OK → ACK==, sedan flödar mediet (RTP) direkt mellan parterna, och BYE avslutar.
<!--SR:!fsrs,2026-10-21T11:58:42.147Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:58:42.147Z-->

## OSI- och TCP/IP-modellen (Möjlig)

Vilket lager är applikationslagret i nätverksmodellen?::Det ==översta lagret==, som använder transportlagret (TCP/UDP) under sig.
<!--SR:!fsrs,2026-10-21T11:40:11.085Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:40:11.085Z-->

## Protokoll och egna protokoll (Möjlig)

Vad menas med ett "eget" eller hemligt protokoll?::Ett protokoll vars regler ==inte är öppna==, så att bara tillverkarens egna program kan prata med varandra.
<!--SR:!fsrs,2026-10-21T11:39:05.797Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:39:05.797Z-->

## Klient/server (Säker)

Vem tar initiativet i klient/server?::==Klienten== skickar requests; servern svarar bara och tar inga egna initiativ.
<!--SR:!fsrs,2026-10-25T05:12:14.708Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:12:14.708Z-->

Varför måste en server alltid vara igång?::För att ==klienten kan höra av sig när som helst==, så servern måste stå och vänta på anslutningar.
<!--SR:!fsrs,2026-10-20T21:38:45.969Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:38:45.969Z-->

Vilka tre kommunikationsparadigm ställer föreläsningen upp? (3)
||
- **Klient/server** – klienten frågar, servern svarar bara
- **Peer-to-peer** – parterna är jämlikar och kan både fråga och svara
- **Publish/subscribe** – en part sänder ut material som andra prenumererar på
<!--SR:!fsrs,2026-10-25T04:29:37.048Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:29:37.048Z-->

## TCP och UDP för applikationer (Trolig)

Hur skiljer sig TCP och UDP för en applikation? (2)
||
- **TCP** – strömbaserat och pålitligt: kopplar upp, håller ordning, sänder om det som tappas
- **UDP** – paketbaserat utan garantier: skickar varje paket för sig utan uppkoppling
<!--SR:!fsrs,2026-10-20T21:43:03.591Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-19T21:43:03.591Z-->

När passar UDP bättre än TCP för en applikation?::När man vill ==slippa TCP:s overhead== för upp- och nedkoppling, till exempel i realtidstrafik.
<!--SR:!fsrs,2026-10-23T20:10:45.930Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:10:45.930Z-->

## Host name database (Möjlig)

Vad var host name database (/etc/hosts)?::En lokal fil som ==listade datornamn och deras IP-adresser== rad för rad, föregångaren till DNS.
<!--SR:!fsrs,2026-10-21T11:56:38.685Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:56:38.685Z-->

## DNS – Domain Name System (Säker)

Vad gör DNS?::Översätter ==datornamn till IP-adresser==, så att du slipper kunna adresserna utantill.
<!--SR:!fsrs,2026-10-25T05:05:01.531Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:05:01.531Z-->

Vilket transportprotokoll använder DNS?::Främst ==UDP, men även TCP== för större svar.
<!--SR:!fsrs,2026-10-25T05:05:35.129Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:05:35.129Z-->

Vad är en MX-post i DNS?::Den post som ==pekar ut vilken server som tar emot mejl== för en domän.
<!--SR:!fsrs,2026-10-25T04:24:04.594Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:24:04.594Z-->

## Representation – text-baserad och binär (Trolig)

Vad är skillnaden mellan text-baserade och binära protokoll? (2)
||
- **Text-baserade** – skickar läsbar text rad för rad, lätt att felsöka för hand (SMTP, HTTP 1.1, FTP)
- **Binära** – packar fälten tätt i ettor och nollor, kompakt och snabbt för maskinen (DNS, SSH, HTTP/2)
<!--SR:!fsrs,2026-10-21T05:23:42.640Z,0,0.19206666,8.40750771,3,3,1,0,2026-10-21T05:13:42.640Z-->

Vad menas med att ett protokoll "bygger på HTTP"?::Det ==använder HTTP som transport== i stället för att hitta på ett eget format, t.ex. SOAP, CoAP och IPP.
<!--SR:!fsrs,2026-10-21T05:23:52.644Z,0,0.19206666,8.40750771,3,3,1,0,2026-10-21T05:13:52.644Z-->

## FTP – File Transfer Protocol (Säker)

Hur använder FTP sina två förbindelser? (2)
||
- **Kommandoförbindelse (port 21)** – öppnas av klienten och hålls öppen hela sessionen för kommandon och svar
- **Dataförbindelse (port 20)** – öppnas separat för varje filöverföring och stängs sedan
<!--SR:!fsrs,2026-10-23T04:26:21.008Z,2,1.3363301,8.37949113,2,4,0,0,2026-10-21T04:26:21.008Z-->

Vad är skillnaden mellan aktivt och passivt läge i FTP? (2)
||
- **Aktivt läge (PORT)** – klienten anger porten som servern kopplar upp dataförbindelsen mot
- **Passivt läge (PASV)** – servern väljer porten som klienten kopplar upp mot i stället
<!--SR:!fsrs,2026-10-20T21:46:47.533Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-19T21:46:47.533Z-->

Varför kan FTP:s uppdelning på två portar bli ett problem?::I aktivt läge måste servern koppla tillbaka till klienten, vilket ==brandväggar och NAT ofta blockerar==.
<!--SR:!fsrs,2026-10-21T11:58:10.315Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:58:10.315Z-->

Varför måste en binärfil skickas som "image" i FTP?::För att den ska bli en ==exakt kopia bit för bit==; ASCII-läget är bara för ren text.
<!--SR:!fsrs,2026-10-21T11:44:04.808Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:44:04.808Z-->

## SSH och multiplexing (Trolig)

Vad menas med att SSH är en multiplexer?::Den lägger ==flera kanaler i en och samma säkra tunnel== — t.ex. fjärrinloggning, SFTP och port forwarding samtidigt.
<!--SR:!fsrs,2026-10-23T05:38:05.216Z,2,1.3363301,8.37949113,2,4,0,0,2026-10-21T05:38:05.216Z-->

Hur skiljer sig SSH och FTP i hur de hanterar flera strömmar? (2)
||
- **SSH** – samlar allt i en enda säker förbindelse (multiplexing)
- **FTP** – delar upp sig i skilda förbindelser, en för kommandon och en för data
<!--SR:!fsrs,2026-10-24T05:04:56.113Z,3,2.3479313,7.84078413,2,4,0,0,2026-10-21T05:04:56.113Z-->

## E-post som ekosystem (Säker)

Varför ligger mottagarens brevlåda på en server och inte i hens dator?::För att mottagaren kan vara ==offline när brevet kommer== — servern lagrar det tills hen hämtar det.
<!--SR:!fsrs,2026-10-23T20:02:45.558Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:02:45.558Z-->

Vilka protokoll används för att skicka respektive läsa e-post? (2)
||
- **Skicka** – SMTP
- **Läsa** – IMAP4 eller POP3
<!--SR:!fsrs,2026-10-25T05:13:20.722Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:13:20.722Z-->

Vilken väg tar ett e-brev från avsändare till mottagare? (3)
||
- **Avsändare → egen MTA** – med SMTP, där brevet läggs i en utgående kö
- **MTA → mottagarens MTA** – med SMTP, där brevet hamnar i brevlådan
- **Mottagarens MTA → mottagare** – mottagaren hämtar med IMAP eller POP
<!--SR:!fsrs,2026-10-21T11:47:47.861Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:47:47.861Z-->

## SMTP – Simple Mail Transfer Protocol (Trolig)

Vilken uppgift har SMTP i e-postkedjan?::Det ==lämnar brevet==, både från klient till server och mellan servrar.
<!--SR:!fsrs,2026-10-23T20:15:52.679Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:15:52.679Z-->

Vilka tre faser har en SMTP-överföring? (3)
||
- **Uppkoppling** – servern hälsar, klienten presenterar sig med HELO
- **Överföring** – MAIL FROM och RCPT TO anger kuvertet, DATA följs av huvud, blankrad och kropp
- **Nedkoppling** – klienten avslutar med QUIT
<!--SR:!fsrs,2026-10-21T11:56:19.261Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:56:19.261Z-->

## Brevets utformning (Trolig)

Vilka två hårda gränser har RFC 822 för ett brev? (2)
||
- **Bara en kropp** – inga bilagor
- **Bara US-ASCII** – inga åäö eller andra tecken
<!--SR:!fsrs,2026-10-20T21:38:31.865Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:38:31.865Z-->

Vad är skillnaden mellan brevets kuvert och dess huvud? (2)
||
- **Kuvert (MAIL FROM, RCPT TO)** – det SMTP använder för att styra brevet rätt
- **Huvud (From, To, Subject …)** – det du som användare ser i brevet
<!--SR:!fsrs,2026-10-21T11:54:33.479Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:54:33.479Z-->

## MIME (Säker)

Vad löser MIME i e-post?::Det låter ett brev ==bära annat än ren ASCII== — bilagor, bilder och flera delar — utan att bryta RFC 822.
<!--SR:!fsrs,2026-10-25T04:25:41.853Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:25:41.853Z-->

Vilka två huvudrader beskriver en MIME-del? (2)
||
- **Content-Type** – vilken sorts innehåll, t.ex. text/html eller image/jpeg
- **Content-Transfer-Encoding** – hur innehållet är kodat, t.ex. base64
<!--SR:!fsrs,2026-10-20T19:15:24.768Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T19:15:24.768Z-->

Hur får man in en bilaga eller flera delar i ett brev med MIME?::Med typen ==multipart==, där varje del har sin egen Content-Type efter varandra.
<!--SR:!fsrs,2026-10-23T05:35:44.288Z,2,1.3363301,8.37949113,2,4,0,0,2026-10-21T05:35:44.288Z-->

## Quoted-Printable (Trolig)

Hur kodar Quoted-Printable ett icke-ASCII-tecken?::Som ett ==likhetstecken följt av teckenets byte-värde i hex== (t.ex. ä blir =E4), medan vanliga tecken står kvar.
<!--SR:!fsrs,2026-10-25T04:29:51.760Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:29:51.760Z-->

## Base64 (Trolig)

Vad är syftet med Base64?::Att göra om ==godtyckliga byte till vanliga ASCII-tecken==, så binär data kan skickas genom en kanal som bara tål text.
<!--SR:!fsrs,2026-10-25T04:25:53.717Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:25:53.717Z-->

Hur räknar Base64 om bitarna?::Det tar ==tre byte (24 bitar) och delar om dem i fyra 6-bitarsgrupper==, där varje grupp blir ett ASCII-tecken via tabellen.
<!--SR:!fsrs,2026-10-25T04:25:08.805Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:25:08.805Z-->

## World Wide Web och HTTP (Säker)

Vilka tre grundstenar vilar webben på? (3)
||
- **URL** – pekar ut och adresserar resursen
- **HTTP** – hämtar resursen från servern
- **HTML** – beskriver hur innehållet ska visas
<!--SR:!fsrs,2026-10-25T05:35:33.862Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:35:33.862Z-->

Vad beskriver HTTP?::Hur en klient (webbläsaren) ==hämtar en specifik fil från en webbserver==; text-baserat, normalt port 80.
<!--SR:!fsrs,2026-10-23T04:24:29.298Z,2,1.3363301,8.37949113,2,4,0,0,2026-10-21T04:24:29.298Z-->

Vilka delar har ett HTTP-svar? (3)
||
- **Statusrad** – t.ex. HTTP/1.1 200 OK
- **Huvudrader** – metadata som Content-Type och Content-Length
- **Innehåll** – själva filen, efter en blankrad
<!--SR:!fsrs,2026-10-25T05:05:23.377Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:05:23.377Z-->

Varför säger man att HTML inte är ett programmeringsspråk?::För att det bara ==märker upp innehåll== — rubrik, stycke, länk — och inte gör några beräkningar.
<!--SR:!fsrs,2026-10-23T20:17:59.112Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:17:59.112Z-->

## HTTP/2 (Trolig)

Vad är den största skillnaden mellan HTTP/2 och HTTP 1.1?::HTTP/2 ändrar inte vad HTTP gör utan hur det görs på tråden, allt för ==prestanda==.
<!--SR:!fsrs,2026-10-21T11:57:15.076Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:57:15.076Z-->

Hur gör HTTP/2 webben snabbare? (4)
||
- **Binär representation** – kompakt och snabb att skapa och tolka
- **Server push** – servern skickar material den vet att klienten behöver, ofrågat
- **En TCP-förbindelse** – flera förfrågningar delar på samma förbindelse
- **Multiplexing/pipelining** – klienten skickar många förfrågningar parallellt
<!--SR:!fsrs,2026-10-21T11:57:08.260Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-20T11:57:08.260Z-->

## Vad DNS är och domännamnets roll (Säker)

Vad är den primära uppgiften för DNS?::Att ==översätta ett domännamn till en IP-adress==.
<!--SR:!fsrs,2026-10-23T20:17:13.977Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:17:13.977Z-->

Varför använder vi domännamn i stället för att skriva IP-adressen direkt?::Ett domännamn är ==lättare att komma ihåg== än en siffersträng, och kan betyda något vi associerar till.
<!--SR:!fsrs,2026-10-25T04:24:34.130Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T04:24:34.130Z-->

Vad gör DNS möjligt när en tjänst behöver byta IP-adress?::Att ==IP-adressen kan bytas utan att domännamnet ändras==, sömlöst och utan att användarna märker det.
<!--SR:!fsrs,2026-10-25T05:36:10.804Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:36:10.804Z-->

## Domännamnsträdet (Säker)

Hur hänger domännamnen ihop strukturellt?::De bygger upp ett ==hierarkiskt namnträd== med en namnlös rot högst upp.
<!--SR:!fsrs,2026-10-25T05:05:30.184Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:05:30.184Z-->

Var lagras hela domännamnsträdet?::I en ==distribuerad databas== där många namnservrar var och en håller en liten del av trädet.
<!--SR:!fsrs,2026-10-25T05:35:54.196Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:35:54.196Z-->

## DNS-data och posttyper: A, AAAA, TXT, MX, CNAME (Säker)

Vad är skillnaden mellan posttyp A och AAAA?::A ger en IPv4-adress, medan AAAA ger samma sak fast en ==IPv6-adress==.
<!--SR:!fsrs,2026-10-25T05:13:27.945Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:13:27.945Z-->

Vad används en TXT-post till?::Att lagra en ==fri textsträng==, numera ofta även data som system och program behöver, till exempel domänverifiering.
<!--SR:!fsrs,2026-10-23T20:02:50.438Z,3,3.07506611,5.19004872,2,3,0,0,2026-10-20T20:02:50.438Z-->

Vad används en MX-post till?::För att hitta ==mailservern som ska ta emot mail== till en domän.
<!--SR:!fsrs,2026-10-25T05:12:05.944Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:12:05.944Z-->

Vad gör en CNAME-post?::Den ==hänvisar ett domännamn vidare till ett annat domännamn== (ett alias).
<!--SR:!fsrs,2026-10-20T22:38:59.632Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-19T22:38:59.632Z-->

## DNS-hosting och resolver (Säker)

Vilka två typer av namnservrar finns det i DNS? (2)
||
- **DNS-hosting (auktoritativa)** – den primära källan för DNS-datat; håller datat för sin del av domännamnsträdet
- **DNS-resolver** – sköter uppslagningen åt andra, till exempel en laptop, en mobil eller en mailserver
<!--SR:!fsrs,2026-10-25T05:35:16.003Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-21T05:35:16.003Z-->

Vad är "DNS-servern" som är inställd i en vanlig PC eller mobil?::Det är datorns ==resolver==, alltså den namnserver som sköter uppslagningarna åt den.
<!--SR:!fsrs,2026-10-20T21:41:25.599Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:41:25.599Z-->

## Uppslagning: iterativ vs rekursiv (Säker)

Vad är skillnaden mellan rekursiv och iterativ uppslagning? (2)
||
- **Rekursiv** – klienten ställer sin fråga till resolvern och får det färdiga svaret tillbaka; resolvern gör hela jobbet
- **Iterativ** – resolvern frågar hostingservrarna i tur och ordning (rot, sedan .se, sedan kth.se), och varje server pekar vidare till nästa
<!--SR:!fsrs,2026-10-20T21:42:57.135Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T21:42:57.135Z-->

Vad innebär det för dig om din DNS-resolver inte svarar eller inte är tillgänglig?::Det är i praktiken ==likvärdigt med att inte ha någon nätåtkomst==.
<!--SR:!fsrs,2026-10-21T11:38:59.941Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T11:38:59.941Z-->
