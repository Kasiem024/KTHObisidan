---
tags:
  - tenta
  - HI1032
  - nätverk
  - KTH
  - year2026
created: 2026-10-13
updated: 2026-10-19
description: "En teorifil för HI1032:s Del B, applikationsnivån, byggd på examinatorns föreläsningar om applikationslagret. Varje avsnitt börjar med vad begreppet är och bygger vidare: hur det fungerar, varför, och vad det kostar. Rubriken har en nivå inom parentes, Säker, Trolig eller Möjlig, för hur troligt ämnet är på tentan, satt efter hur ofta det förekommit i fyra gamla tentor och hur mycket läraren tagit upp det. Föreläsningskartan har hela bilden. De fetstilta orden är dispositionen, och egna slutsatser är märkta."
---

# HI1032 Tentasvar - Del B Applikationsnivån

En teorifil för HI1032:s Del B, applikationsnivån, byggd på examinatorns föreläsningar om applikationslagret. Varje avsnitt börjar med vad begreppet är och bygger vidare: hur det fungerar, varför, och vad det kostar. Rubriken har en nivå inom parentes, Säker, Trolig eller Möjlig, för hur troligt ämnet är på tentan, satt efter hur ofta det förekommit i fyra gamla tentor och hur mycket läraren tagit upp det. Föreläsningskartan har hela bilden. De fetstilta orden är dispositionen, och egna slutsatser är märkta.

## Varför vi övervakar nätet (Möjlig)

**Varför det behövs.** Man övervakar nätet för att ==hitta problem innan kunderna hör av sig==.

## FCAPS (Trolig)

**Vad det är.** FCAPS är en ==ISO-standard som delar in nätverkshantering i fem områden==: Fault, Configuration, Accounting, Performance och Security. (Alternativ finns, som ITIL och eTOM.)

**De fem områdena.** Fault är felhantering: reaktivt upptäcka, isolera, rätta och dokumentera fel, och proaktivt förebygga dem. Configuration är att ställa om hårdvara, mjukvara och konton och att dokumentera nätet. Accounting är att hålla reda på resursanvändning (debitering, kvoter) och se vem som slösar. Performance är kapacitet, trafik, genomströmning och svarstid. Security är kryptering, autentisering, loggning och intrångsdetektering. ==Allt som behöver skötas på ett nät faller inom något av de fem==.

**Så kan du tänka.** (egen slutsats) FCAPS är ingen produkt utan en ==checklista för vad "att hantera ett nät" ens betyder==.

## Network Operations Center, NOC (Möjlig)

**Vad det är.** Ett NOC är ==den centrala plats där nätet övervakas==.

## SNMP – manager, agent och meddelandetyper (Säker)

**Vad det är.** SNMP (Simple Network Management Protocol) är ==protokollet för att övervaka och styra nätverksenheter på distans==. En central dator frågar ut enheterna, läser värden och kan sätta värden. Det finns sedan 1988 i versionerna SNMPv1, SNMPv2c och SNMPv3.

**Manager och agent.** Rollerna är två: ==managern frågar, agenten svarar==. Managern kör klientprogrammet ("klient"); alla enheter kör en agent ("server") som håller enhetens värden och svarar, ofta routrar och switchar.

**Delarna i SNMP.** SNMP är flera delar som samverkar: ==ASN.1 för att beskriva data, SMI för hur ASN.1 används, MIB för själva datan och BER för hur datan kodas till bytes== — plus själva protokollet med sina pakettyper.

**Meddelandetyperna och deras riktning.** Trafiken går över UDP och varje meddelande har en riktning. Manager → agent: GetRequest, GetNextRequest, GetBulkRequest och SetRequest (hämta eller sätta värden). Agent → manager: Response (svaret på en fråga) och ==Trap, som agenten skickar självmant när något händer==. InformRequest och Report går mellan två managrar.

**PDU:n och portarna.** Ett SNMP-paket (en PDU) har typ, request-id, felstatusfält och sedan ==själva variabel-värde-paren== (variable bindings). GetBulkRequest har ett lite annat huvud, med max-repetitioner i stället för felfälten. Agenten lyssnar på UDP-port 161, managern på UDP-port 162; frågor går till agentens 161, trap-meddelanden in på managerns 162.

**Hur delarna jobbar ihop.** ==SMI säger hur ett heltalsvärde beskrivs, MIB säger att objektet heter udpInDatagrams, och SNMP paketerar frågan i en GetRequest==; agenten svarar med en Response, och managern läser ut svaret (i föreläsningens exempel "sex datagram mottagna").

**Svagheten.** ==SNMP är svagt på att ändra konfiguration==, dess MIB stämmer dåligt med hur enheter faktiskt konfigureras, och det blandar ihop konfiguration med övervakningsstatus. Att det går över UDP gör dessutom att en trap kan försvinna utan att någon märker det (egen slutsats).

## ASN.1 och TLV (Trolig)

**Vad det är.** ASN.1 är en ==standard för att beskriva hur data ser ut==, oberoende av maskin och språk. SNMP valde ASN.1 för att protokollet är från 1988.

**Hur det funkar: TLV.** Varje värde beskrivs som ==Type, Length, Value==. Exempel på ett heltal: Type = Integer, Length = 4 bytes, Value = 47. Det är den formen BER sedan kodar till riktiga bytes.

## SMI – Structure of Management Information (Trolig)

**Vad det är.** SMI är ==reglerna för hur ASN.1 används i SNMP==: hur objekt namnges, vilka datatyper som finns, hur enkla typer sätts ihop till sammansatta, och hur objekt och värden kodas.

**Namnträdet och OID.** Varje objekt har ett ==objekt-id (OID), en sökväg från roten ner till objektet==. Grenarna är numrerade, så iso → org → dod → internet → mgmt → mib-2 skrivs 1.3.6.1.2.1. Trädet är gemensamt och standardiserat, så samma objekt heter samma sak överallt.

## MIB-2 – Management Information Base (Trolig)

**Vad det är.** Om SMI är reglerna så är MIB:en ==själva samlingen av objekt som kan hanteras på en enhet==. MIB-2 är standarduppsättningen med grupper som system, gränssnitt, ip, tcp, udp med flera, och alla bygger på SMI.

**Hur det funkar: löv och tabeller.** Objekten sitter som noder i trädet, och ==bara löven går att komma åt med SNMP== — inre noder är bara grenar. Ett enkelt värde pekas ut med en nolla sist (instansen). Tabeller är kolumn-orienterade: varje kolumn är ett eget löv (i udpTable: udpLocalAddress och udpLocalPort), medan rader inte är egna löv, eftersom antalet rader kan variera från enhet till enhet.

## BER – Basic Encoding Rules (Trolig)

**Vad det är.** BER är ==reglerna för hur datan kodas till bytes för att skickas==. Där TLV säger formen säger BER exakt vilka bytes det blir på tråden.

**Hur det funkar.** Varje del blir bytes: en byte för typen, en för längden, sedan värdet. Specialfall OID: ==de två första talen slås ihop till en byte som $40 \cdot$ det första $+$ det andra== (så 1.3 blir $40 \cdot 1 + 3 = 43$), och resten av talen kodas en byte styck.

## NETCONF och YANG (Möjlig)

**Vad det är.** NETCONF (från 2006) är ==ett protokoll gjort för att konfigurera enheter== där SNMP är svagt, och YANG är dess sätt att beskriva datan (motsvarigheten till SMI/MIB).

## Prestandahantering (Möjlig)

**Vad det är.** Prestandahantering är att ==mäta hur bra nätet faktiskt presterar== — paketförlust, fördröjning (end-to-end delay), jitter och throughput.

## Digital representation av text – teckenkodning (Trolig)

**Problemet källkodning löser.** Vi vill skicka text, men en länk kan ==bara skicka ettor och nollor==, så varje tecken översätts först till ett bitmönster enligt en tabell som sändare och mottagare är överens om (källkodning).

**Det finns inte en tabell utan många.** ASCII, ISO-8859-1 (Latin1), Unicode/UTF-8 med flera — poängen är att ==samma byte kan betyda olika tecken i olika tabeller==.

**Varför det spelar roll.** Skriver sändaren i en tabell och läser mottagaren i en annan blir det fel tecken, så ==man måste komma överens om kodningen==. Unicode/UTF-8 rymmer alla tecken. (egen slutsats – slidet listar bara varianterna utan att förklara felet.)

## Sampling, kvantisering och PCM (Trolig)

**Från ljud till tal.** En mikrofon gör om ljud till en ==spänning som varierar med tiden== – en analog kurva. För att skicka den digitalt görs den om till tal i två steg: sampling och kvantisering.

**Sampling.** Att sampla är att ==mäta signalens nivå med jämna tidsmellanrum==. Hur ofta avgörs av samplingsteoremet.

**Kvantisering.** Varje mätvärde rundas sedan av till ==en av ett bestämt antal nivåer==; antalet bestäms av bit-djupet.

**PCM.** Sampling plus kvantisering är tillsammans ==PCM (Pulse Code Modulation)==. Fler sampel per sekund och fler bitar per sampel ger bättre kvalitet men fler bitar att skicka.

## µ-law och A-law (Trolig)

**Problemet med en rak skala.** Med jämnt fördelade kvantiseringsnivåer (linjär skala) går lika många nivåer åt för starka som svaga ljud, fast ==örat är känsligare för de svaga==.

**Lösningen är en icke-linjär skala.** µ-law och A-law använder i stället en ==icke-linjär skala== som lägger fler nivåer där ljudet är svagt och färre där det är starkt.

**Vinsten.** Då får man ett ==större dynamiskt omfång== utan fler kvantiseringsnivåer, alltså utan större bit-djup.

## Digital representation av bild – färg och tre tappar (Trolig)

**En bild är en pixelmatris.** En digital bild är ==uppdelad i en 2D-matris av pixlar==; fler pixlar (UHD, 5K) ger mer detalj och fler bitar.

**Färg kan beskrivas på flera sätt.** Varje pixel får en färg via en färgmodell: ==RGB (rött, grönt, blått, 3×0–255, en byte styck)==, YMC(K), HSV eller YCbCr (luminans plus två krominanskanaler).

**Varför just tre värden.** Young–Helmholtz-teorin säger att ==ögat har tre typer av receptorer (tappar)==, så färg och ljus kan delas upp i tre värden.

## Förlustfri kompression (Trolig)

**Vad förlustfri betyder.** Förlustfri (lossless) kompression gör datan mindre men ==exakt återställbar bit för bit==. Det krävs för text och datorprogram, där minsta fel förstör.

**Run-length.** Den ersätter ==en lång upprepning av samma symbol med symbolen plus ett antal==.

**Dictionary (LZW).** Den bygger ==en ordbok över återkommande sekvenser== medan den läser; LZW används i GIF-bilder.

**Arithmetic.** Den fjärde metoden slidet nämner, ==utan att gå in på hur den fungerar==.

**PNG kombinerar två.** ==PNG-bilder komprimeras med en kombination av dictionary (LZW) och Huffman==.

## Huffman (Trolig)

**Idén.** Huffman ger ==korta kodord till vanliga symboler och långa kodord till ovanliga==, tvärtom mot en fast kod där alla tecken tar lika många bitar.

**Varför det går att avkoda.** Koden byggs så att ==inget kodord är början på ett annat (prefixfri)==, så trots att kodorden är olika långa kan mottagaren läsa dem entydigt. (egen slutsats – slidet visar kodtabellen men säger inte prefix-regeln i ord.)

### Så gör du: bygg en Huffman-kod

**Utgå från symbolernas frekvenser.** I exemplet: A 5 %, B 10 %, C 15 %, D 28 %, E 42 %.

**Slå ihop de två minsta, om och om igen.**

1. Minst är A (5 %) och B (10 %) → slå ihop till en nod på 15 %.
2. Nu är minst den nya 15 %-noden och C (15 %) → slå ihop till 30 %.
3. Minst är 30 %-noden och D (28 %) → slå ihop till 58 %.
4. Kvar är 58 %-noden och E (42 %) → slå ihop till 100 %, trädets rot.

**Läs koden uppifrån.** Sätt 0 på den ena grenen och 1 på den andra i varje förgrening och läs från roten ut till varje symbol. Då blir det ==A=0000, B=0001, C=001, D=01, E=1== – den vanligaste symbolen (E) fick ett enda bit, den ovanligaste (A) fyra.

## Förstörande kompression – lossy (Trolig)

**Vad lossy betyder.** Förstörande (lossy) kompression ==kastar bort information för att spara mer plats==, så datan är inte exakt likadan efteråt.

**När den duger och inte duger.** Den duger inte ==när datan måste se likadan ut efter dekompression==, alltså text och datorprogram. Den bygger på att lite förluster är acceptabla, vilket gäller ljud och bild.

**Hur man får förlusten.** Ett enkelt sätt är att jämfört med PCM ta ==lägre samplingsrate, lägre bit-djup eller A-law== – kvalitet mot färre bitar.

## Predictive vs perceptual kodning (Trolig)

**Två sätt att välja vad man får kasta.** När man komprimerar med förlust måste man bestämma vilken information som får gå förlorad, och slidet ställer upp ==två principer: predictive och perceptual==.

**Predictive coding.** Predictive tittar på ==hur den okomprimerade datan beter sig== och minimerar felet objektivt: den förutsäger nästa värde ur de tidigare och skickar bara skillnaden.

**Perceptual coding.** Perceptual minimerar felet ==subjektivt== – den kastar det en människa ändå inte uppfattar. För ljud utnyttjas maskering: en stark ton höjer maskeringströskeln så att svagare ljud nära i frekvens inte hörs.

## Deltamodulering (Möjlig)

**Ett konkret exempel på predictive coding.** Deltamodulering (DM) är den enklaste predictive-metoden: i stället för hela värdet skickar den ==bara om signalen gått upp eller ner sedan förra steget==, alltså en bit per sampel.

## Ljudkompression (Trolig)

**Två nivåer av kompression.** Slidet ställer upp hur hårt ljud kan komprimeras med de två principerna, utöver den okomprimerade ==PCM:en (tal 64 kbps, CD 705,6 kbps/kanal)==.

**Predictive ~ 1:2.** Predictive coding (DM, ADPCM) ger ungefär ==1:2== och bygger på att "små fel inte gör så mycket".

**Perceptual ~ 1:10.** Perceptual coding (MP3, AAC) ger ungefär ==1:10== och bygger på maskering, att "små fel inte hörs/syns".

## DCT (2D) (Trolig)

**Verktyget bakom JPEG.** DCT (Discrete Cosine Transform) är det ==matematiska verktyg JPEG använder== för att göra om pixlar till frekvenser. Intuitionen kommer från Fourier: varje vågform kan byggas som en summa av sinusfunktioner med olika frekvens.

**Vad DCT gör med ett block.** DCT tar ett block av pixelvärden och ger tillbaka ==koefficienter för olika frekvenser==: det första värdet blir ett viktat medelvärde (den grova nivån) och resten beskriver allt finare detaljer.

**Den är matematiskt förlustfri.** Transformen i sig kastar ingenting – den är ==inverterbar== ($T^{-1} = T^\mathsf{T}$). Vinsten är att energin samlas i några få stora värden (låga frekvenser) medan de höga frekvenserna blir små och lätta att kasta i nästa steg.

## JPEG (Säker)

**Vad JPEG är.** JPEG är standarden för att komprimera ==stillbilder== med förlust, genom att kasta detaljer som ögat ändå inte ser.

**Kedjan har tre steg, och bara ett är förstörande.** Bilden körs igenom ==transform (förlustfri) → kvantisering (förstörande) → kodning (förlustfri)==. Avkodningen är samma kedja baklänges.

**Steg 1 – DCT på 8×8-block.** Bilden delas i ==8×8-pixelblock== och varje block DCT:as till frekvenskoefficienter. Energin hamnar i hörnet uppe till vänster, de höga frekvenserna ut mot motsatt hörn.

**Steg 2 – kvantisering.** Varje koefficient ==delas med motsvarande tal i en kvantiseringsmatris och avrundas==. Divisorerna växer mot de höga frekvenserna, så de flesta högfrekvenskoefficienterna blir 0. Det är här förlusten sker, och kvalitetsnivån (t.ex. Q50) styr hur stora divisorerna är.

**Steg 3 – zigzag och run-length.** Blocket läses i ==sicksack (zigzag)== så att nollorna hamnar sist i en lång svans, som packas förlustfritt med run-length (och entropikodning) till den färdiga JPEG-filen.

**Tradeoff och svaghet.** Lägre kvalitetsnivå ger ==större tal i matrisen, fler nollställda koefficienter och mindre fil== men sämre bild. (egen slutsats) Drivs kvantiseringen för hårt syns de enskilda 8×8-blocken, eftersom för mycket detalj i varje block har nollställts.

### Så gör du: kvantisera ett DCT-block (JPEG)

**Du har** ett 8×8-block med DCT-koefficienter M och en kvantiseringsmatris Qk (k = kvalitetsnivå).

**Räkna elementvis** $c(m,n) = \mathrm{round}(M(m,n) / Q_k(m,n))$ – dela varje koefficient med talet på samma plats i matrisen och avrunda till heltal.

**Resultatet** blir att de stora låga frekvenserna uppe till vänster överlever som små heltal medan de höga frekvenserna blir ==0==. Ju högre tal i Qk (lägre kvalitet), desto fler nollor – och desto mer kan run-length-steget sedan pressa ihop. Poängen med heltalen är att de tar mycket färre bitar att skicka än de ursprungliga decimaltalen.

**Så kan du tänka.** JPEG gör aldrig något godtyckligt: DCT flyttar informationen dit där ögat bryr sig minst (höga frekvenser), kvantiseringen kastar just den delen, och run-length tjänar på att det blev så många nollor. De tre stegen är byggda för att hjälpa varandra.

## MPEG – temporal och spatial kodning (Trolig)

**Video är stillbilder i följd.** En video är många bildrutor per sekund (en ruta var 1/25 s). Att JPEG-koda varje ruta för sig blir stort, så MPEG komprimerar ==i två riktningar: i rummet och i tiden==.

**Spatial (i rummet).** Inom en enskild ruta används ==samma idé som JPEG== – DCT, kvantisering och kodning av block.

**Temporal (i tiden).** Mellan rutor utnyttjas att ==närliggande rutor är nästan lika==: i stället för hela bilden skickas bara skillnaden mot grannrutorna. Därför finns olika rutetyper – en hel ruta (I) och rutor som bara beskriver förändringen (B/P).

**Varför inte bara en I-ruta.** Slidet pekar på ==delay== som skäl. (egen slutsats: med bara en I-ruta i början måste allt annat byggas som skillnader mot den, vilket ökar fördröjningen, så I-rutor återkommer med jämna mellanrum.)

## Paketering (Möjlig)

**Hur rutorna läggs i paket spelar roll.** Försvinner hela I-rutan vid en paketförlust blir B/P-rutorna meningslösa, eftersom de bara beskriver skillnaden mot den; dessutom är vi ==känsligare för ljudförsämringar än bildförsämringar==.

## Tre typer av multimediaöverföring och streaming (Trolig)

**Tre fall med olika krav på buffert.** Slidet delar in multimediaöverföring i ==tre typer efter hur mycket man kan buffra==.

**Typ A – lagrad multimedia (store and forward).** ==En användare hämtar en specifik fil== som redan finns färdig. Man kan buffra mycket, vilket kan ge intryck av streaming fast man egentligen hämtar en fil.

**Typ B – live-streaming.** ==Alla intresserade tittar på samma ström== samtidigt, och man kan fortfarande buffra någon sekund.

**Typ C – interaktiv (realtid) audio/video.** ==Två eller fler parter pratar med varandra==, så fördröjningen måste hållas nere – minimal buffert.

**Metafilen (typ A).** Ett vanligt knep för lagrad multimedia är att ==HTTP bara hämtar en liten metafil==, varefter en separat spelare laddar själva mediet, ofta över UDP/RTP.

## Isokron ström och playback-buffert (Trolig)

**Vad isokron betyder.** En isokron ström är en där ==varje paket ska spelas upp vid en bestämd tidpunkt==, i jämn takt. Nätet levererar inte jämnt, så något måste jämna ut det.

**Playback-bufferten.** Lösningen är en ==playback-buffert==: mottagaren samlar paket en stund innan uppspelning, så det alltid finns data även när nästa paket är sent. Priset är extra fördröjning.

**Vad transportströmmen måste klara.** Utöver bufferten behövs: tala om när ett paket ska spelas och vilket i ordningen det är, hellre felrätta än fråga om förlorade paket och undvika trafikstockning, synkronisera mellan källor, identifiera sändaren, och stödja en parameterdialog. Slutsatsen är rak: ==TCP är olämpligt, UDP saknar många förmågor – något nytt krävs==. Det nya är RTP.

## Multimedia och TCP (Trolig)

**Varför TCP passar dåligt.** TCP:s omsändningar och ==leverans i ordning== gör att ett saknat segment håller upp allt efter det, vilket realtid inte tål. (Övning: TCP styckar data så att en chunk kan hamna i olika segment, duger inte för multicast, och saknar fält för payload-typ och tidsstämpel.)

**Vad man gör i stället.** Slidets svar är ==UDP + smart paketering + FEC==. FEC betyder lite redundant data, så att enstaka bitfel eller paketförluster kan hanteras utan omsändning.

## RTP (Säker)

**Vad RTP är.** RTP (Real-time Transport Protocol) ==läggs ovanpå UDP== för att ge realtidsströmmar det UDP saknar. Det körs på en tillgänglig jämn UDP-port.

**Vad det tillför.** RTP märker varje paket så att mottagaren kan sätta ihop strömmen rätt i tid: ett ==sekvensnummer== som ökar med 1 per paket (så man ser att ett paket saknas), en tidsstämpel som säger ==när varje paket hör hemma i uppspelningen== (så flera källor, t.ex. ljud och bild, kan synkas), och en SSRC som identifierar källan.

**Sekvensnummer utan omsändning.** Till skillnad från TCP används RTP:s sekvensnummer ==bara för att upptäcka att ett paket fattas, inte för att begära om det==. Mottagaren får själv dölja luckan, för omsändning hinner ändå inte i realtid.

## RTCP (Trolig)

**RTP:s följeslagare.** RTCP (RTP Control Protocol) går bredvid RTP på ==den udda porten direkt efter RTP:s jämna port==. Det bär ingen media, bara kontrollinfo om strömmen.

**Vad det gör.** RTCP låter mottagarna ==rapportera nätverksprestanda== tillbaka till sändaren, synkroniserar strömmar från samma källa (C-name och wall clock) och bär extra info om sändaren. De två rapporttyperna är sender report och receiver report.

**Taket på 5 %.** För att kontrolltrafiken inte ska konkurrera med mediet är RTCP ==begränsat till 5 % av sessionens bandbredd==.

## SIP (Trolig)

**Vad SIP gör.** SIP (Session Initiation Protocol) är protokollet som ==sätter upp, styr och avslutar ett samtal== mellan användare: hittar var användaren finns, avgör om hon kan och vill svara, tar reda på kapabiliteter och sätter sessionens parametrar.

**Textbaserat som HTTP.** SIP är ett ==textbaserat request/response-protokoll byggt som HTTP==, med adresser på formen sip:user@address. Metoderna är INVITE, ACK, OPTIONS, CANCEL, REGISTER och BYE, och svarskoderna går 1xx–6xx precis som i HTTP.

**Samtalet steg för steg.** Flödet är ==INVITE → 200 OK → ACK==, sedan flödar ljudet/videon (över RTP) direkt mellan parterna, och BYE avslutar. I INVITE och svaret kommer parterna överens om vilka portar och kodningar mediet ska använda.

## OSI- och TCP/IP-modellen (Möjlig)

**Vad det handlar om.** En nätverksmodell delar upp kommunikationen i lager, och ==applikationslagret är det översta lagret==, där föreläsningens protokoll (FTP, HTTP, SMTP, DNS) bor.

## Protokoll och egna protokoll (Möjlig)

**Vad det är.** Ett protokoll är ==bara en uppsättning regler för hur två parter pratar==; de flesta applikationsprotokoll är öppna standarder (RFC), men företag gör också ==egna, ibland hemliga, protokoll==.

## Klient/server (Säker)

**Vad det är.** ==Klienten tar initiativet och skickar en request, servern svarar bara på requests== och tar aldrig egna initiativ. DNS är skolexemplet: datorn frågar, namnservern svarar.

**Det är ett av flera kommunikationsparadigm.** Föreläsningen ställer tre bredvid varandra: ==klient/server, peer-to-peer och publish/subscribe==. I peer-to-peer är parterna jämlikar och kan både fråga och svara; i publish/subscribe skickar en part ut material som andra prenumererar på.

**Servern måste alltid vara igång.** Eftersom klienten kan höra av sig när som helst måste ==servern vara på hela tiden och vänta på att klienter ansluter==. Klienten startas bara när den behövs.

## TCP och UDP för applikationer (Trolig)

**Valet som varje applikationsprotokoll måste göra.** ==TCP är strömbaserat och pålitligt==: det kopplar upp en förbindelse, ser till att allt kommer fram i rätt ordning och gör om det som tappas. ==UDP är paketbaserat och utan garantier==: det skickar iväg varje paket för sig utan uppkoppling.

**Hur man väljer.** TCP passar när allt måste komma fram rätt – en fil, ett mejl, en webbsida. UDP passar när man vill slippa fördröjningen av TCP:s uppkoppling och omsändningar, t.ex. realtidstrafik. Boken: ==UDP ofta är lämpligare när man vill undvika TCP:s overhead==. TCP:s stauhantering räcker inte alltid för realtid, vilket är en del av skälet till att strömmande media inte kör rakt på TCP.

## Host name database (Möjlig)

**Föregångaren till DNS.** Innan DNS fanns hade varje dator en lokal fil, `/etc/hosts`, som ==listade datornamn och deras IP-adresser rad för rad==.

## DNS – Domain Name System (Säker)

**Vad det gör.** DNS översätter namn till adresser. ==Du frågar efter ett datornamn som `www.kth.se` och får tillbaka dess IP-adress.== Systemet är från 1987 och definieras i RFC 1034 och 1035.

**Hur det fungerar i stort.** DNS är ett ==typiskt klient/server-protokoll==: din dator (klienten) frågar, en namnserver svarar. Det körs ==över UDP, men även TCP== – UDP för de vanliga små frågorna, TCP när svaret är större. Själva frågepaketet är binärt (fält som ID, flaggor och antal poster).

**Så gör du (en enkel uppslagning).** Du vill veta adressen till ett namn. Klienten skickar en fråga med namnet till en namnserver, och servern svarar med adressen. Vill du i stället veta vilken server som tar emot mejl för en domän frågar du efter domänens ==MX-post== (mail exchanger). Den fulla mekanismen — hur frågan vandrar mellan flera namnservrar — är nästa föreläsnings ämne; här räcker bilden fråga in, adress ut.

## Representation – text-baserad och binär (Trolig)

**Protokoll ser olika ut på tråden.** Två protokoll kan göra ungefär samma sak men ==representera sina meddelanden på helt olika sätt==.

**Text-baserade kontra binära.** Text-baserade skickar läsbar text, en rad i taget – ==SMTP, HTTP 1.1, FTP, IMAP, POP3 och SIP==. Binära packar fälten tätt i ettor och nollor – ==DNS, NTP, SSH och HTTP/2==. Text är lätt att läsa och felsöka för hand; binärt är kompakt och snabbt för maskinen (egen slutsats).

**Två grupper till.** Vissa protokoll ==bygger på ett eget representationsprotokoll==, som SNMP (med BER) och RPC. Andra ==bygger ovanpå HTTP==, till exempel IPP, CoAP och SOAP.

## FTP – File Transfer Protocol (Säker)

**Vad det är.** FTP flyttar filer mellan klient och server och ==använder två skilda förbindelser: en för kommandon och en för själva filen==. Kommandoförbindelsen går mot port 21, dataförbindelsen mot port 20.

**Hur de två förbindelserna används.** Kommandoförbindelsen (port 21) öppnas av klienten och ==hålls öppen hela sessionen== – där skickas textkommandon (byta katalog, lista, hämta) och serverns svarskoder. Dataförbindelsen (port 20) ==öppnas separat varje gång en fil faktiskt ska överföras== och stängs när den är klar.

**Aktivt och passivt läge.** I ==aktivt läge (kommandot PORT) talar klienten om en port som servern kopplar upp mot==; i ==passivt läge (kommandot PASV) väljer servern en port som klienten kopplar upp mot== i stället.

**Problemet med två portar.** Att servern i aktivt läge ska koppla tillbaka till klienten krockar ofta med brandväggar och NAT, som inte släpper igenom en uppkoppling utifrån och in – därför behövs passivt läge, så att klienten öppnar båda förbindelserna (egen slutsats).

**Filtyp, struktur och läge.** FTP kan också ställas in på hur filen skickas: ==filtyp A (ASCII), E (EBCDIC) eller I (image/binärt)==, struktur fil/post/sida, och överföringsläge ström/block/komprimerat. En ren binärfil måste gå som image, alltså en kopia bit för bit.

## SSH och multiplexing (Trolig)

**Vad det är.** SSH (Secure Shell) ger en ==säker förbindelse till en annan dator==, med fyra egenskaper: insyn skyddas (privacy), data kan inte ändras oupptäckt (integrity), parterna bevisar vilka de är (authentication) och trafiken kan komprimeras.

**Multiplexing – flera strömmar i en tunnel.** SSH är en ==multiplexer: den lägger flera kanaler i en och samma säkra tunnel==. Genom samma uppkoppling kan du samtidigt köra fjärrinloggning, filöverföring (SFTP) och port forwarding, allt krypterat, och du betalar bara för en uppkoppling.

**Kontrasten mot FTP.** ==SSH samlar allt i en förbindelse, medan FTP delar upp sig i flera skilda förbindelser== (kommando och data var för sig).

## E-post som ekosystem (Säker)

**Inte ett protokoll utan flera.** E-post är ett ==ekosystem av protokoll som samarbetar==: SMTP för att skicka, IMAP4 eller POP3 för att läsa, DNS (MX-posten) för att hitta rätt server, MIME för bilagor och RFC 822 för hur brevet ser ut.

**Brevlådan ligger på servern.** En viktig poäng är att ==mottagarens brevlåda inte ligger i hens dator utan på en server==. Skälet är att mottagaren kan vara avstängd eller offline när brevet kommer – servern tar emot och lagrar det tills mottagaren själv hämtar det (egen slutsats, stödd av att brevlådan i bilden sitter hos mottagarens server).

**Vägen ett brev tar.** Avsändaren skickar med ==SMTP till sin egen server (MTA)==, där brevet läggs i en utgående kö. Den servern skickar vidare med ==SMTP till mottagarens MTA==, där brevet hamnar i brevlådan. Till sist ==hämtar mottagaren brevet med IMAP eller POP==. MTA står för Message Transfer Agent.

**Att skicka och att läsa är skilda jobb.** ==För att skicka: SMTP== (eller webbmail, eller något proprietärt som Exchange). ==För att läsa: IMAP4 eller POP3== (eller webbmail, eller Exchange).

## SMTP – Simple Mail Transfer Protocol (Trolig)

**Vad det är.** SMTP är protokollet som ==lämnar e-post, både från klient till server och mellan servrar==. Det är text-baserat, en läsbar rad i taget, och går över TCP på port 25.

**Steg ett: hitta mottagarens server.** Innan brevet kan lämnas görs en ==DNS-fråga efter domänens MX-post== (mail exchanger), som pekar ut vilken server som tar emot mejl för domänen. Finns flera MX-poster har de prioritet (lägre tal först). Sedan kopplar servern upp mot port 25 på den mottagande servern.

**Steg två: de tre faserna.** Själva samtalet har tre delar. Först ==uppkoppling==: servern hälsar med `220`, klienten presenterar sig med `HELO`. Sedan ==överföring==: klienten anger avsändare och mottagare i "kuvertet" med `MAIL FROM` och `RCPT TO`, skriver `DATA` och skickar därefter huvud (From, To, Date, Subject), en blankrad och kroppen, som avslutas med ==en rad som bara innehåller en punkt==. Sist ==nedkoppling== med `QUIT`. Servern svarar på varje steg med en kod, till exempel `250` för OK.

## Brevets utformning (Trolig)

**Vad RFC 822 bestämmer, och dess gränser.** Standarden RFC 822 definierar hur ett brev ser ut: ett ==huvud (From, To, Date, Subject) och en kropp==. Men den gamla standarden har två hårda gränser: brevet kan ==bara innehålla en kropp (inga bilagor)== och ==bara US-ASCII (inga åäö)==.

**Kuvert kontra brev.** ==Kuvertet (MAIL FROM och RCPT TO) är det SMTP använder för att styra brevet rätt==; huvudet (From, To …) är det du som användare ser i brevet. De behöver inte ens stämma överens (egen slutsats).

**Hur man kommer runt gränserna.** Vill man ha andra tecken än ASCII kodar man dem med ==Base64 eller Quoted-Printable==. Vill man ha bilagor eller flera delar använder man ==MIME==.

## MIME (Säker)

**Vad det är.** MIME (Multipurpose Internet Mail Extensions) är tillägget som ==låter ett e-brev bära annat än ren ASCII-text — bilagor, bilder, flera delar och andra teckenuppsättningar==. Det river inte RFC 822 utan lägger till några huvudrader som beskriver innehållet.

**Hur det fungerar.** MIME lägger till rader som ==`Content-Type` (vilken sorts innehåll, som text/html eller image/jpeg) och `Content-Transfer-Encoding` (hur innehållet är kodat, till exempel base64)==. Mottagarens program läser raderna och vet då hur delen ska tolkas och packas upp. Det finns också `MIME-Version` och fält för att beskriva och identifiera delen.

**Flera delar i ett brev.** Med typen ==`multipart` kan ett brev innehålla flera delar== — till exempel en text och en bilaga, eller samma meddelande i både ren text och HTML. Flera MIME-delar efter varandra, var och en med sin egen Content-Type.

## Quoted-Printable (Trolig)

**Vad det är.** Quoted-Printable är ett sätt att ==koda enstaka icke-ASCII-tecken så att resten av texten förblir läsbar==. Det används bland annat i ämnesraden och i MIME-delar.

**Så gör du.** Ett tecken som inte är ASCII ==skrivs som ett likhetstecken följt av teckenets byte-värde i hexadecimal==. I föreläsningens exempel blir meningen "så vi kan glädja studenterna" till `s=E5 vi kan gl=E4dja studenterna` — `å` har värdet E5 och `ä` värdet E4 i teckenuppsättningen iso-8859-1, medan alla vanliga bokstäver står kvar som de är. I ämnesraden paketeras det dessutom in med en markering av vilken teckenuppsättning och metod som använts.

## Base64 (Trolig)

**Vad det är.** Base64 ==gör om vilka byte som helst till vanliga ASCII-tecken==, så att binär data (en bild, en bilaga) kan skickas genom en kanal som bara tål text. Priset är att datan växer: tre byte blir fyra tecken, alltså ungefär en tredjedel större (egen slutsats utifrån 3→4-förhållandet).

**Så gör du.** Principen är att ==räkna om från grupper av 8 bitar till grupper av 6 bitar==:
1. Ta tre byte (24 bitar) och ställ dem i rad.
2. Dela om de 24 bitarna i fyra grupper om 6 bitar.
3. Varje 6-bitarsgrupp är ett tal mellan 0 och 63 — slå upp talet i Base64-tabellen och få ett ASCII-tecken.

Föreläsningens exempel: `11001100 10000001 00111001` blir grupperna `110011 001000 000100 111001`, alltså talen 51, 8, 4 och 57, som i tabellen blir tecknen `z I E 5`. Vill du koda vanlig text tar du först fram varje teckens bitar via ASCII-tabellen och kör sedan samma steg.

## World Wide Web och HTTP (Säker)

**Tre grundstenar.** Webben vilar på tre delar: ==URL pekar ut en resurs, HTTP hämtar den, och HTML beskriver hur innehållet ska visas.== URL är adressen, HTTP är transporten, HTML är uppmärkningen. Webben är i övrigt ett helt ekosystem: HTTP 1.1 eller HTTP/2, TLS för https, URL/URI, HTML, MIME, CSS och JavaScript samt bildformat.

**Vad HTTP gör.** HTTP (Hypertext Transfer Protocol) beskriver ==hur en klient (webbläsaren) hämtar en specifik fil från en webbserver==. Det är text-baserat och går normalt över port 80. Gången är: slå först upp serverns namn i DNS för att få adressen, skicka sedan en HTTP-request till den adressen.

**Så gör du (enklaste requesten).** En minimal HTTP-request är tre rader:
1. En request-rad med metod, sökväg och version: `GET /katalog/fil.html HTTP/1.1`.
2. En `Host:`-rad som säger vilken server det gäller.
3. En blankrad som markerar slutet på requesten.

Servern svarar med en ==statusrad (t.ex. `HTTP/1.1 200 OK`), några huvudrader (metadata som Content-Type och Content-Length), en blankrad och sedan själva innehållet==. Svaret är alltså uppdelat i huvud och innehåll precis som ett brev.

**HTML är inget programmeringsspråk.** ==HTML bara märker upp innehåll== – talar om vad som är rubrik, stycke, länk och så vidare. Det styr struktur, inte beräkningar.

## HTTP/2 (Trolig)

**Vad det är.** HTTP/2 är en nyare version, en "proposed" standard sedan 2015 som i dag stöds av alla vanliga webbläsare och servrar. Den ändrar ==inte vad HTTP gör utan hur det görs på tråden== – samma metoder och statuskoder, men effektivare.

**Hur det blir snabbare.** De största skillnaderna mot HTTP 1.1 handlar om ==prestanda==. Representationen är ==binär och kompakt== i stället för text. Servern kan ==pusha material den vet att klienten behöver== utan att klienten frågar. Flera förfrågningar får ==dela på en och samma TCP-förbindelse==. Och förfrågningarna kan ==multiplexas och pipelinas==, så att klienten skickar många frågor parallellt. Dessutom är TLS i praktiken standard.

## Vad DNS är och domännamnets roll (Säker)

**Vad DNS är.** DNS står för Domain Name System. Det är den ==funktion, det protokoll och den standard som hanterar internetdomäner== (domännamn).

**Den primära uppgiften.** DNS huvuduppgift är att ==översätta ett domännamn till en IP-adress== – namn → IP-adress. IP-adressen behövs för kommunikationen på IP-nivån, över TCP eller UDP beroende på applikation. DNS kan även ge annan data än IP-adresser.

**Varför det behövs ett namn och inte bara en IP-adress.** På IP-nivån används bara IP-adressen för adressering – ==där finns ingen plats för namn==. Man kan se domännamnet som en namnsättning av IP-adressen: vi startar med domännamnet och får tillbaka IP-adressen, en adress på en annan nivå.

**Varför domännamn är praktiska.** Ett domännamn är ==lättare att komma ihåg== än en siffersträng, kan väljas fritt och användas för allt. Namnet gör det också lättare att känna igen en tjänst, och närliggande namn kan visa att tjänster hör ihop. Ett namn kan antyda typen av tjänst (www, mail, ns). IPv6-adresser är ännu svårare att minnas än IPv4.

**Adressbyte blir sömlöst.** Eftersom namnet pekar på IP-adressen och inte tvärtom kan ==IP-adressen bytas utan att domännamnet ändras==, utan att informera användarna och utan att någon märker det.

**Både IPv4 och IPv6.** Ett namn kan peka ut både en IPv4- och en IPv6-adress, eller bara det ena. Det ==underlättar övergången till IPv6==.

**Domännamnet är mer än en IP-adress.** Domändelen i en mailadress (delen efter `@`) visar domäntillhörighet, och ==mail dirigeras utifrån domändelen, inte utifrån en IP-adress==. Man kan också lägga in rena textsträngar i DNS, t.ex. sådant program behöver (ett exempel är att Let's Encrypt kräver en textsträng i DNS för att visa att man kontrollerar domänen).

## Domännamnsträdet (Säker)

**Ett hierarkiskt namnträd.** Domännamnen bygger upp ett ==hierarkiskt namnträd==. Trädet startar i en nod utan namn (rot); alla andra noder har ett namn; trädet kan grena sig i noderna; det är strikt hierarkiskt med en väg upp; och data kan läggas i varje nod.

**Domännamnets form.** Namnet `www.nada.kth.se` består av fyra namndelar, och ==punkten markerar gränsen mellan namndelarna==. Den minst signifikanta delen (`www`) står först och den mest signifikanta (`se`) sist – tvärtemot en IPv4- eller IPv6-adress.

**En distribuerad databas.** Domännamnsträdet finns i en ==distribuerad databas av DNS-data som vi har gemensamt på Internet==. Massor av namnservrar håller var sin lilla del av trädet men bygger tillsammans upp hela trädet.

**Data och träd hör ihop.** Datat lagras tillsammans med trädet: ==finns det ingen data finns det heller inget delträd==, och dataposten skapar själv det delträd den ligger i. Notera att `www.kth.se` och `kth.se` är olika domännamn, eftersom de startar i olika noder.

## DNS-data och posttyper: A, AAAA, TXT, MX, CNAME (Säker)

**DNS-datans form.** En DNS-post visas normalt som noden där datat finns (owner name), sedan typen av data och sist värdet. Det finns också ett klassfält (nästan alltid `IN`) och ett TTL-fält (som den här föreläsningen bortser från). Det viktiga är att ==posttypen avgör vilken data som kan och ska finnas== i posten.

**A och AAAA.** `A` står för "Address" och pekar ut en ==IPv4-adress==. `AAAA` är samma sak fast för en IPv6-adress.

**TXT.** En TXT-post innehåller ==bara en textsträng==. Den var tänkt för ren textinformation men används mer och mer av system och program för data som inte kan lagras i andra posttyper (t.ex. domänverifiering och e-postinställningar).

**MX.** MX ("mail exchange") har ==alltid två delfält: en prioritet och namnet på en mailserver==. Posten med lägst prioritetsvärde används i första hand. MX används av mailservrar för att hitta mottagande server (inte av mailklienten); sedan slås A och AAAA upp för det angivna namnet.

**CNAME.** En CNAME-post ==hänvisar ett domännamn vidare till ett annat domännamn==, alltså ett alias; det namnets A- eller AAAA-post ger själva IP-adressen.

## DNS-hosting och resolver (Säker)

**DNS är en nättjänst.** ==Klienten skickar en DNS-fråga till en namnserver, som skickar tillbaka ett DNS-svar==. Klienten kan vara en laptop, en mobil eller till exempel en mailserver.

**Två typer av namnservrar.** Det finns ==två typer av namnservrar==. DNS-hosting (auktoritativa) är den primära källan för datat och bygger tillsammans upp DNS-trädet. DNS-resolvrar sköter själva uppslagningen åt andra.

**Resolvern i praktiken.** En resolver tillhandahålls ofta av internet- eller mobiloperatören och ==konfigureras ofta automatiskt samtidigt som IP-adressen sätts== (`resolv.conf` uppdateras då). I en vanlig PC eller mobil är "DNS-server" samma sak som DNS-resolver.

**Val av resolver.** Man kan använda en lokal resolver från nätägaren eller internetleverantören – ==oftast automatiskt tilldelad via DHCP== eller satt manuellt – eller en öppen resolver på Internet, till exempel Google, Quad9 eller Cloudflare.

## Uppslagning: iterativ vs rekursiv (Säker)

**Vad en uppslagning är.** Alla applikationer som använder DNS gör uppslagningar av DNS-data, och ==nästan alla applikationer använder DNS==. När allt fungerar tänker vi knappt på det; det är först vid fel som det märks.

**Den rekursiva delen (klient → resolver).** Klienten ställer en fråga till resolvern, till exempel `www.kth.se A?`, och får det ==färdiga svaret tillbaka== (`www.kth.se A 130.237.28.40`). Klienten ställer alltså en enda fråga och resolvern gör hela jobbet. I kursboken kallas detta mönster rekursiv uppslagning.

**Den iterativa delen (resolver → hosting).** För att få fram datat skickar resolvern frågan vidare till hostingservrarna för trädets olika delar, ==i tur och ordning: först roten, sedan `.se`, sedan `kth.se`==. I kursboken kallas detta iterativ uppslagning, och där pekar varje server som inte själv har svaret vidare till nästa server att fråga.

**Hur de två hänger ihop.** Klientens sida mot resolvern är den rekursiva uppslagningen, och resolverns sida mot hostingservrarna är den iterativa — resolvern tar den tunga uppslagningen så att klienten slipper (egen slutsats, byggd på lektionens diagram och kursbokens termer).

**Vad som händer om resolvern tystnar.** Om DNS-resolvern inte svarar eller inte är tillgänglig är det ==likvärdigt med att inte ha någon nätåtkomst alls==, eftersom nästan all trafik börjar med en uppslagning.

**Så kan du tänka.** Dela upp en uppslagning i två halvor. Din dator ber resolvern om ett färdigt svar (rekursivt), och resolvern går själv ned genom trädet — rot, toppdomän, domän — tills den hittar datat (iterativt). Därför blir en trasig resolver lika illa som ett brutet nät: det är resolvern som gör arbetet, och utan den kommer du ingenstans.
