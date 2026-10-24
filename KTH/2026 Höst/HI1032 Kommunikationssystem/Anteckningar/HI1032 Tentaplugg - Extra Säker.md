---
tags:
  - tenta
  - HI1032
  - nätverk
  - KTH
  - year2026
created: 2026-10-20
updated: 2026-10-20
description: "Extra flashcards för HI1032:s ämnen på nivån Säker, från både Del A och Del B. Korten prövar fakta ur teorifilerna Tentasvar Del A och Del B som de två ordinarie decken inte redan prövar. Rubrikerna följer teorifilernas ämnen, och ett kort märkt egen slutsats bygger på en slutsats i teorin och inte direkt på föreläsningen."
---

# HI1032 Tentaplugg - Extra Säker

Extra flashcards för HI1032:s ämnen på nivån Säker, från både Del A och Del B. Korten prövar fakta ur teorifilerna Tentasvar Del A och Del B som de två ordinarie decken inte redan prövar. Rubrikerna följer teorifilernas ämnen, och ett kort märkt egen slutsats bygger på en slutsats i teorin och inte direkt på föreläsningen.

## Portar och multiplexing (Säker)

Hur stort tal är ett portnummer?::Ett ==16-bitars== osignerat heltal.
<!--SR:!fsrs,2026-10-24T04:30:30.371Z,3,3.34870974,5.20002037,2,2,0,0,2026-10-21T04:30:30.371Z-->

Vad skiljer nätlagrets leveransdomän från transportlagrets? (2)
||
- **Nätlagret** – levererar från värd till värd
- **Transportlagret** – går ett steg längre, från process till process

Varför kan två olika värdar använda samma portnummer samtidigt?::För att ==portnumret bara gäller lokalt== på varje värd, inte globalt.
<!--SR:!fsrs,2026-10-20T20:40:49.972Z,0,0.212,6.4133,1,1,0,0,2026-10-20T20:39:49.972Z-->

## MSS och MTU (Säker)

Hur kommer de två TCP-sidorna överens om vilken MSS som ska gälla?::Genom en ==MSS-option i TCP-huvudet== som skickas vid uppkopplingen.

Hur måste MSS och huvudena förhålla sig till länkens MTU?::==MSS plus IP- och TCP-huvudena måste få plats i MTU:n==, annars delas paketet upp. *(egen slutsats)*
<!--SR:!fsrs,2026-10-21T20:37:48.541Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:48.541Z-->

## ACK-reglerna och hur man tillämpar dem (Säker)

Hur många segment får stå okvitterade innan mottagaren måste kvittera direkt?::==Aldrig fler än två== — kommer ett andra segment medan det första är okvitterat, kvitteras det direkt.
<!--SR:!fsrs,2026-10-21T20:37:32.669Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:32.669Z-->

## RTO: hur länge TCP väntar på en ACK (Säker)

Vad är RTO (retransmission timeout)?::Den ==tid TCP väntar på en kvittens innan det sänder om== segmentet.

Vad blir följden om RTO sätts för kort respektive för lång? (2)
||
- **För kort** – TCP sänder om i onödan
- **För lång** – TCP blir långsamt på att upptäcka förluster
<!--SR:!fsrs,2026-10-20T20:36:50.462Z,0,0.212,6.4133,1,1,0,0,2026-10-20T20:35:50.462Z-->

Vilken vikt ($\beta$) används när $\text{RTT}_\text{D}$ utjämnas?::$\beta$ sätts till ==$1/4$==.
<!--SR:!fsrs,2026-10-21T04:38:51.109Z,0,1.88678762,6.40211507,1,2,0,1,2026-10-21T04:28:51.109Z-->

I vilken ordning uppdaterar TCP $\text{RTT}_\text{D}$, RTO och $\text{RTT}_\text{S}$ efter en ny mätning?::Först ==$\text{RTT}_\text{S}$, sedan $\text{RTT}_\text{D}$, sedan RTO==.
<!--SR:!fsrs,2026-10-21T20:37:40.877Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:40.877Z-->

## Flödeskontroll: pull och push (Säker)

Vad skiljer en push-modell från en pull-modell? (2)
||
- **Push** – producenten skickar så fort den har data
- **Pull** – konsumenten frågar först och får sedan svaret levererat
<!--SR:!fsrs,2026-10-21T20:36:58.174Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:36:58.174Z-->

Vad går fel utan flödeskontroll, trots att nätet är friskt?::En snabb sändare fyller mottagarens buffert så att ==data kastas i mottagaränden== — felet sitter där, inte på vägen
<!--SR:!fsrs,2026-10-21T20:37:30.358Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:30.358Z-->

Hur hämtar applikationen sina byte ur TCP:s mottagarbuffert?::Den hämtar själv med ett ==recv()-anrop== — pull mellan buffert och process *(egen slutsats)*

## Send window och receive window (Säker)

Vad är TCP:s sändfönster (send window)?::Hur många byte sändaren får ha ==ute okvitterade samtidigt==

Hur får sändaren reda på mottagarens aktuella rwnd?::==Varje ACK bär med sig== det aktuella rwnd-värdet
<!--SR:!fsrs,2026-10-21T20:37:57.413Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:57.413Z-->

## Congestion: vad händer vid för stort fönster (Säker)

Vad betyder congestion (trängsel) i ett nät?::Att det kommer ==mer trafik än en länk eller router hinner med==

Vilken fråga uppstår när flera flöden delar samma flaskhalslänk?::==Rättvisa== — hur den delade kapaciteten ska fördelas mellan flödena
<!--SR:!fsrs,2026-10-21T20:37:20.814Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:20.814Z-->

Vad är det "rätta" sändfönstret vid congestion?::Det som ==fyller röret utan att svämma över routerns buffert== *(egen slutsats)*

## Throughput probing (AIMD) och det faktiska fönstret (Säker)

Varför ökar TCP fönstret långsamt men skär ner det kraftigt (AIMD)? (2)
||
- **Additiv ökning** – den försiktiga ökningen överskjuter inte taket
- **Multiplikativ nedskärning** – den kraftiga nedskärningen lättar trängseln snabbt
<!--SR:!fsrs,2026-10-21T04:39:25.872Z,0,1.88678762,6.40211507,1,2,0,1,2026-10-21T04:29:25.872Z-->

Vad är cwnd (congestion window)?::TCP:s egen gräns för ==hur mycket den vågar ha ute==, alltså vad nätet verkar tåla
<!--SR:!fsrs,2026-10-20T20:37:30.126Z,0,0.212,6.4133,1,1,0,0,2026-10-20T20:36:30.126Z-->

Vad gör AIMD med rättvisan mellan flöden som delar en flaskhals?::Flödena ==närmar sig en rättvis fördelning== av kapaciteten *(egen slutsats)*

## Slow start och congestion avoidance (Säker)

Varför har TCP två tillväxtfaser (slow start och congestion avoidance)?::Slow start hittar ==det grova taket snabbt==, sedan kryper congestion avoidance försiktigt så TCP inte far förbi det *(egen slutsats)*

## Vid paketförlust: multiplicative decrease, Tahoe och Reno (Säker)

Vad vinner Reno på att skilja tre dubbel-ACK:ar från en timeout?::Den ==slipper krascha till 1 vid en lindrig förlust== och återhämtar sig snabbare, medan Tahoe slänger bort genomströmning varje gång *(egen slutsats)*
<!--SR:!fsrs,2026-10-21T20:37:54.557Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:54.557Z-->

## SCTP (Säker)

Hur skiljer sig SCTP från TCP i synen på data?::SCTP är ==meddelandeorienterat (chunks)==, medan TCP är en byteström
<!--SR:!fsrs,2026-10-21T20:37:06.422Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:06.422Z-->

Vad används SCTP till?::==Signalering==, till exempel SS7 och SIP

Vad kan en enda SCTP-association bära samtidigt?::==Flera oberoende strömmar== av datachunks mellan samma två processer

Vad är en chunk i SCTP?::En bit ==data eller kontrollinfo== som SCTP-paketet bär

Hur många chunks får ligga i ett SCTP-paket?::==Flera chunks== kan rymmas i samma paket
<!--SR:!fsrs,2026-10-24T05:05:11.281Z,3,3.27093831,5.18509795,2,3,0,0,2026-10-21T05:05:11.281Z-->

Vad anger SI (stream identifier) i SCTP?::==Vilken ström en chunk tillhör==
<!--SR:!fsrs,2026-10-21T20:37:27.094Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:27.094Z-->

Varför blockerar inte ett tappat segment i en SCTP-ström de andra strömmarna?::Strömmarna är ==oberoende==, så bara den drabbade strömmen får vänta *(egen slutsats)*
<!--SR:!fsrs,2026-10-21T20:37:10.158Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:10.158Z-->

Varför ingår en cookie i SCTP:s uppkoppling?::Servern ==allokerar inga resurser förrän klienten skickat tillbaka cookien==, vilket skyddar mot översvämningsattacker *(egen slutsats)*
<!--SR:!fsrs,2026-10-21T05:44:44.280Z,0,1.88678762,6.40211507,1,2,0,1,2026-10-21T05:34:44.280Z-->

## SNMP – manager, agent och meddelandetyper (Säker)

Vilka fyra delar bygger SNMP på, och vad gör de? (4)
||
- **ASN.1** – beskriver hur datan ser ut
- **SMI** – bestämmer hur ASN.1 används
- **MIB** – själva datan, objekten som kan hanteras
- **BER** – kodar datan till bytes
<!--SR:!fsrs,2026-10-21T20:38:17.037Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:38:17.037Z-->

Varför är SNMP svagt på att ändra konfiguration? (2)
||
- **Dålig MIB** – MIB:en stämmer dåligt med hur enheter faktiskt konfigureras
- **Blandar ihop** – den blandar ihop konfiguration med övervakningsstatus

Varför kan ett SNMP-trap försvinna obemärkt?::SNMP går över ==UDP==, som inte garanterar leverans. *(egen slutsats)*

## JPEG (Säker)

Vad är JPEG?::Standarden för att komprimera ==stillbilder med förlust==, genom att kasta detaljer som ögat ändå inte ser.

Hur avkodas en JPEG-bild?::Genom ==samma tre steg baklänges==: kodning, kvantisering och transform.
<!--SR:!fsrs,2026-10-21T20:37:13.150Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:37:13.150Z-->

Var i ett DCT:at 8×8-block hamnar energin?::==Uppe till vänster==, medan de höga frekvenserna ligger ut mot motsatt hörn.
<!--SR:!fsrs,2026-10-20T20:37:00.702Z,0,0.212,6.4133,1,1,0,0,2026-10-20T20:36:00.702Z-->

Varför blir det just de höga frekvenserna som nollställs i JPEG-kvantiseringen?::För att ==divisorerna i kvantiseringsmatrisen växer mot de höga frekvenserna==, så de avrundas till noll.

Vad händer med filen och bilden när man sänker JPEG:s kvalitetsnivå?::Det blir fler nollställda koefficienter, så filen blir ==mindre men bilden sämre==.

Varför är det en vinst att kvantiseringen i JPEG ger heltal?::Heltalen tar ==mycket färre bitar== att skicka än de ursprungliga decimaltalen.

Vad händer med bilden om JPEG-kvantiseringen drivs för hårt?::Då ==syns de enskilda 8×8-blocken==, eftersom för mycket detalj i varje block har nollställts. *(egen slutsats)*

## FTP – File Transfer Protocol (Säker)

Varför löser passivt läge FTP:s problem med brandväggar och NAT?::För att ==klienten då öppnar båda förbindelserna utåt==, och brandväggar och NAT släpper igenom utgående uppkopplingar. *(egen slutsats)*
<!--SR:!fsrs,2026-10-21T20:38:01.109Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-20T20:38:01.109Z-->

## E-post som ekosystem (Säker)

Vad står MTA för?::==Message Transfer Agent== — mejlservern som skickar vidare och tar emot brev.

## MIME (Säker)

Vad står MIME för?::==Multipurpose Internet Mail Extensions==.

## World Wide Web och HTTP (Säker)

Vad är skillnaden mellan http och https?::https är HTTP som körs över ==TLS==.
<!--SR:!fsrs,2026-10-24T05:04:23.910Z,3,3.34870974,5.20002037,2,2,0,0,2026-10-21T05:04:23.910Z-->

Vilka tre delar har en minimal HTTP-request? (3)
||
- **Request-rad** – metod, sökväg och version
- **Host-rad** – talar om vilken server requesten gäller
- **Blankrad** – markerar slutet på requesten

## Vad DNS är och domännamnets roll (Säker)

Vad betyder förkortningen DNS?::==Domain Name System==, alltså funktionen och protokollet som hanterar internetdomäner (domännamn).
<!--SR:!fsrs,2026-10-24T04:31:17.526Z,3,3.34870974,5.20002037,2,2,0,0,2026-10-21T04:31:17.526Z-->

Hur underlättar DNS övergången till IPv6?::Samma domännamn kan peka ut ==både en IPv4- och en IPv6-adress==.

## Domännamnsträdet (Säker)

I vilken ordning står delarna i ett domännamn?::==Minst signifikant först, mest signifikant sist== – tvärtemot en IP-adress.

Vad avgör om ett delträd finns i DNS?::==Datat== – finns det ingen data finns det inget delträd, eftersom dataposten själv skapar det delträd den ligger i.
<!--SR:!fsrs,2026-10-28T20:38:22.389Z,8,8.2956,1,2,1,0,0,2026-10-20T20:38:22.389Z-->

Varför räknas `www.kth.se` och `kth.se` som olika domännamn?::De startar i ==olika noder== i trädet, så de är olika namn.

## DNS-data och posttyper: A, AAAA, TXT, MX, CNAME (Säker)

Hur visas en DNS-post normalt?::Noden där datat finns (==owner name==), sedan typen av data och sist värdet.

Vilka två delfält har en MX-post? (2)
||
- **Prioritet** – ett tal som styr i vilken ordning servrarna väljs
- **Mailserverns namn** – namnet på servern som tar emot mejlen

Vilken MX-post används i första hand?::Den med ==lägst prioritetsvärde==.

Vad gör en mailserver efter att ha hämtat MX-posten?::Den ==slår upp A/AAAA== för det mailservernamn MX pekar ut.

Hur får man fram IP-adressen bakom en CNAME-post?::CNAME pekar vidare till ett annat domännamn, och ==det namnets A/AAAA-post== ger själva IP-adressen.

## DNS-hosting och resolver (Säker)

Vilka två sorters resolver kan en klient använda? (2)
||
- **Lokal resolver** – från nätägaren eller internetleverantören, oftast tilldelad via DHCP
- **Öppen resolver** – en publik resolver ute på internet, t.ex. Google eller Quad9
