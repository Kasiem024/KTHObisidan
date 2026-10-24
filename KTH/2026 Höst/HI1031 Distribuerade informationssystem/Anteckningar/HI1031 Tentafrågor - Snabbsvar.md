---
tags:
  - tenta
  - HI1031
  - databaser
  - programmering
  - KTH
  - year2026
  - nosr
created: 2026-10-02
updated: 2026-10-17
description: Manus för den muntliga tentan i HI1031. Varje tentafråga står ordagrant, och korten under den säger vad du ska säga, i den ordning du säger det.
---

# HI1031 Tentafrågor - Snabbsvar

Ett manus för den muntliga tentan. Frågeraden är tentafrågan ordagrant som den står i kursens frågelista, så att du känner igen den, och raderna under är det du säger, i den ordning du säger det.

- **Så använder du det:** läs frågan, säg svaret högt och jämför sedan med kortet.
- **Del X av Y:** en fråga som är uppdelad på flera kort läses i följd, och korten är tillsammans hela svaret. Siffran inom parentes sist på frågeraden är antalet rader på kortet.
- **De fetstilta orden är dispositionen.** Läser du bara dem i ordning har du svarets struktur.
- **(egen slutsats)** betyder att raden inte står i boken. Där boken saknar svaret står det rakt ut på kortet.

Korten i kapitlens svarsnoter, `HI1031 Tentafrågor och Svar - Kap NN`, är egna versioner av samma svar och har din repetitionshistorik. De två synkas inte längre, men de säger inte emot varandra.

## Kapitel 1 – Distribuerade system

Ge några exempel på distribuerade system. (4)
||
- **Vardagstjänster vi tar för givna** – webben, webbsök, e-post, sociala nätverk och e-handel
- **Bokens tre genomgångna exempel** – webbsök, onlinespel med många spelare, och finanshandel
- **Spannet, det frågan egentligen är ute efter** – från ett system i en bil till globala system med miljoner noder, från små sensorer till kraftfulla datorer
- **Trenderna** – mobilt och ubiquitous, distribuerad multimedia, och molnet som en tjänst man köper i stället för att äga

Ange 5 olika hårdvaruresurser och 5 mjukvaruresurser som kan vara intressant att dela. — Del 1 av 2: hårdvaran (3)
||
- **De fem** – skrivare, diskar, processorer, videoströmmen från en digitalkamera och ljudförbindelsen i ett mobilsamtal
- **Varför hårdvara delas** – för att spara pengar; flera användare samsas om samma dyra pryl
- **Brasklappen** – boken har ingen färdig lista på fem plus fem, så säg att du sorterar bokens egna exempel

Ange 5 olika hårdvaruresurser och 5 mjukvaruresurser som kan vara intressant att dela. — Del 2 av 2: mjukvaran (3)
||
- **De fem** – filer, webbsidor, databaser, sökmotorer och en valutaomvandlare
- **Varför mjukvara delas** – användarna bryr sig om datan, inte om disken den ligger på; delningen kan vara allt från en sökmotor för hela världen till en liten grupp som jobbar ihop med samma dokument
- **Som en tjänst** – man använder en sökmotor eller valutaomvandlare utan att bry sig om vilken server som kör den

Vilka utmaningar finns enligt boken med att bygga ett distribuerat system? — Del 1 av 2: de fyra första (4)
||
- **Heterogenitet** – nät, hårdvara, operativsystem, språk och olika utvecklare varierar; middleware är lagret som döljer skillnaderna
- **Öppenhet** – om systemet går att bygga ut och göra om, vilket kräver att de viktiga gränssnitten publiceras
- **Säkerhet** – konfidentialitet, integritet och tillgänglighet; överbelastningsattacker och säkerheten hos mobil kod är ännu inte helt lösta
- **Skalbarhet** – fortsätter fungera bra när antalet resurser och användare ökar mycket, till exempel genom att decentralisera för att undvika flaskhalsar
<!--SR:!fsrs,2026-10-28T13:00:48.494Z,7,7.49448566,3.58131923,2,3,0,0,2026-10-21T13:00:48.494Z-->

Vilka utmaningar finns enligt boken med att bygga ett distribuerat system? — Del 2 av 2: de fyra sista (4)
||
- **Felhantering** – det svåra är att felen är partiella; teknikerna är upptäcka, maskera, tolerera, återhämta och redundans
- **Samtidighet** – flera klienter vill åt samma resurs samtidigt och kan krocka, som två auktionsbud som skriver över varandra
- **Transparens** – dölja att delarna är åtskilda; access och location är de två viktigaste
- **Tjänstekvalitet** – tillförlitlighet, säkerhet, prestanda och anpassningsförmåga, där prestanda betyder att hålla tidsgränser

Vilka arv från IP, HTTP och HTML måste man ta hänsyn till vid utveckling av distribuerade system? (3)
||
- **Från HTML** – byggdelarna är fasta och kopplade till hur saken ska visas, så man kan bara bläddra; därför behövs XML, som beskriver sig självt
- **Från HTTP** – de två tyngsta: en resurs per fråga, där nio bilder ger tio frågor, och öppet för alla som standard, så åtkomstkontroll måste läggas till
- **Från IP** – 32-bitarsadresserna valdes i slutet av 1970-talet och håller på att ta slut; bytet till 128 bitar kräver ändringar i massor av mjukvara

Vilken roll har IP och RFC för utvecklingen av distribuerade system? (3)
||
- **IP är tekniken** – ett gemensamt sätt att prata som döljer skillnaderna mellan näten, eftersom alla datorer kör internetprotokollen; resten av skillnaderna, i hårdvara, operativsystem och språk, tar middleware hand om
- **RFC är spelregeln** – öppenhet kräver att gränssnitten publiceras; protokollen kom som numrerade RFC i början av 1980-talet, och publiceringen går ofta förbi de officiella standardiseringsprocesserna, som brukar vara tröga
- **Webben är beviset** – den kunde byggas ovanpå utan att någon behövde ändra i internet
<!--SR:!fsrs,2026-10-19T15:58:41.190Z,0,0.212,6.4133,1,1,0,0,2026-10-19T15:57:41.190Z-->

## Kapitel 2 – Arkitektur

Beskriv hur en trelagersarkitektur är uppbyggd. (4)
||
- **De tre delarna** – presentationslogik (samspelet med användaren och vyn), applikationslogik (själva programmets logik, även kallad affärslogik) och datalogik (den varaktiga lagringen, oftast en databas)
- **En server per del** – en-till-en: skikt 1 är klientens vy, skikt 2 en applikationsserver, skikt 3 en databasserver
- **Vinsten** – applikationslogiken samlas på ett ställe, vilket kan göra mjukvaran lättare att underhålla; och skikt 1 kan vara ett rent gränssnitt, vilket ger tunna klienter
- **Priset mot tvåskikt** – tre servrar att sköta i stället för två, och mer nättrafik och högre fördröjning per operation

Beskriv hur en MVC-arkitektur är uppbyggd. (4)
||
- **De tre delarna** – Model (datan, reglerna och tillståndet, vet inget om gränssnittet), View (läser ur modellen och visar den) och Controller (tar inmatning och översätter den till operationer på modellen)
- **Flödet** – användaren agerar i vyn, controllern tolkar, modellen uppdateras och säger till att den ändrats, och vyn ritar om sig
- **Poängen** – presentationen skiljs från datan, så flera vyer kan visa samma modell och modellen kan testas helt utan gränssnitt
- **Står inte i boken** – svaret är allmän kunskap om mönstret, inte bokens text; säg det rakt ut om du pressas på var det står

Vad är Middleware? (3)
||
- **Vad det är** – ett lager av mjukvara som döljer heterogeniteten i nät, hårdvara, operativsystem och språk, och ger programmeraren en bekväm programmeringsmodell
- **Var det sitter** – ovanpå operativsystemet och under tillämpningarna; hårdvara plus operativsystem kallas plattformen
- **Vad det ger** – i stället för råa meddelanden höjer det nivån med fjärranrop, gruppkommunikation, händelsenotifieringar och replikering

Vad är fördelarna med en klient/server-lösning? (4)
||
- **Kärnfördelen** – ett direkt och relativt enkelt sätt att dela data och resurser: klienten frågar, servern sköter resursen och svarar; boken kallar den historiskt den viktigaste och fortfarande den mest använda arkitekturen
- **Går att bygga i lager** – en server kan själv vara klient: en webbserver är ofta klient hos en filserver och hos DNS, och en söktjänst är både server och klient
- **Går att förbättra med placering** – flera servrar med uppdelning eller replikering, caching i proxyservrar, och mobil kod för bra svarstider
- **Men den skalar dåligt** – en tjänst på en enda adress kan inte växa förbi värddatorns kapacitet och bandbredd; det är därför peer-to-peer finns

Vad är en mobil agent? (3)
||
- **Vad det är** – ett körande program med både kod och data som reser mellan datorer, utför en uppgift för någons räkning och kommer tillbaka med resultatet
- **Mekanismen och vinsten** – på varje plats gör den många lokala anrop i stället för fjärranrop, vilket ger lägre kommunikationskostnad och kortare tid
- **Bokens tvivel** – samma uppgifter går att lösa med vanliga fjärranrop, som web crawlers gör, så nyttan kan vara begränsad
<!--SR:!fsrs,2026-10-20T15:43:11.694Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T15:43:11.694Z-->

## Kapitel 4 – Interprocess Communication (IPC)

På vilka olika sätt kan man karakterisera ett IPC-anrop? (4)
||
- **Synkront eller asynkront** – synkront blockerar både send och receive; asynkront har en icke-blockerande send som fortsätter så snart meddelandet kopierats till en buffert, och med trådar har blockerande receive inga nackdelar, så dagens system erbjuder i regel inte den icke-blockerande varianten
- **Destinationen** – meddelandet går till ett par av internetadress och lokal port; en port har exakt en mottagare men kan ha många sändare
- **Tillförlitligheten** – giltighet, att meddelanden kommer fram trots ett rimligt antal tappade paket, och integritet, att de kommer fram oskadade och utan dubbletter
- **Ordningen** – vissa tillämpningar kräver sändarordning, och för dem räknas fel ordning som ett fel

Beskriv vad XML är och vad det kan användas till. — Del 1 av 2: vad XML är (3)
||
- **Vad det är** – ett märkspråk från W3C, alltså en textbaserad kodning som beskriver både en text och dess struktur eller utseende
- **Mot HTML** – XML:s taggar beskriver den logiska strukturen medan HTML:s säger hur en webbläsare ska visa texten, och XML är extensible så du får hitta på egna taggar
- **Självbeskrivande** – tänkt att användas av flera tillämpningar som inte känner varandra i förväg, och namnrymder gör att flera uppsättningar taggar kan samsas utan krockar

Beskriv vad XML är och vad det kan användas till. — Del 2 av 2: användningen och priset (2)
||
- **Används till** – webbtjänster och SOAP i första hand, sedan arkivering och återsökning, specifikation av användargränssnitt och kodning av konfigurationsfiler
- **Priset** – text med taggar ger stora meddelanden som tar längre tid att bearbeta och skicka och kräver mer lagring, men HTTP 1.1 kan komprimera
<!--SR:!fsrs,2026-10-25T12:48:12.101Z,4,4.37161444,5.20002037,2,2,0,0,2026-10-21T12:48:12.101Z-->

Beskriv tre olika typer av IPC. (4)
||
- **De tre** – UDP-datagram, TCP-strömmar och multicast
- **UDP-datagram** – enskilda meddelanden utan bekräftelse eller omsändning, så felmodellen är utelämnandefel och leverans i fel ordning; DNS och Voice over IP använder det för att slippa omkostnaderna för garanterad leverans
- **TCP-strömmar** – en tvåvägsström av bytes utan meddelandegränser som döljer storlekar, tappade meddelanden, flödeskontroll och ordning; men inte tillförlitlig kommunikation, för vid för stor paketförlust förklaras förbindelsen bruten och processen vet då inte om felet var nätet eller den andra processen
- **Multicast** – ett enda meddelande från en process till varje medlem i en grupp, normalt med medlemskapet transparent för sändaren; IP multicast byggs ovanpå IP och nås på programmeringsnivå bara via UDP

Är det speciellt bra att en port kan ha flera mottagare? Utveckla. — Del 1 av 2: premissen och fördelarna (2)
||
- **Räta ut premissen** – normalt har en port en mottagare men många sändare, och processer kan inte dela en port; undantaget är IP multicast, där en kopia går till alla lokala sockets som gått med, så frågan gäller multicast
- **Ja** – det ger feltolerans med replikerade tjänster, tjänsteupptäckt i spontana nät, bättre prestanda med replikerad data, och spridning av händelsenotifieringar
<!--SR:!fsrs,2026-10-19T16:32:37.571Z,0,0.212,6.4133,1,1,0,0,2026-10-19T16:31:37.571Z-->

Är det speciellt bra att en port kan ha flera mottagare? Utveckla. — Del 2 av 2: begränsningen och vad som behövs (3)
||
- **Men otillförlitlig** – IP multicast har samma utelämnandefel som UDP, så några men inte alla får meddelandet; tappas ett datagram mellan två routrar får ingen mottagare bortom den routern meddelandet, och medlemmar kan få meddelanden i olika ordning
- **Beror på bruket** – replikerade tjänster är hårda fallet, alla eller ingen måste få varje förfrågan och oftast i samma ordning, annars blir en server inkonsistent; tjänsteupptäckt är lätta fallet, för förfrågningar skickas med jämna mellanrum så en enstaka förlust gör inget
- **Vad som behövs** – starkare garantier ovanpå: tillförlitlig multicast, där alla eller ingen tar emot, och totalt ordnad multicast, där alla får meddelandena i samma ordning
<!--SR:!fsrs,2026-10-24T12:51:09.171Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-21T12:51:09.171Z-->

Vad är skillnaderna och likheterna mellan IPC och distribuerade objekt? — Del 1 av 2: skillnaderna (3)
||
- **Abstraktion och adress** – IPC är meddelandeöverföring med send och receive på bytes, adresserat med internetadress och port; distribuerade objekt ger metodanrop där detaljerna i regel döljs, adresserat med en fjärrobjektreferens som är unik i tid och rum
- **Inkapsling** – att klient och server ligger i olika processer tvingar fram inkapsling, så tillståndet nås bara via objektets metoder, och eftersom allt går via metoder kan olika platser använda olika dataformat obemärkt
- **Parametrar** – ett vanligt objekt kopieras och skickas med värde, medan ett fjärrobjekt skickas med referens, så det stannar och nås med nya anrop i stället för att hela värdet går över nätet

Vad är skillnaderna och likheterna mellan IPC och distribuerade objekt? — Del 2 av 2: likheterna (3)
||
- **Relationen** – de är inte alternativ utan lager: IPC är det undre middleware-lagret och distribuerade objekt byggs ovanpå det
- **Allt blir bytes** – båda måste marshalla, alltså platta data till en byte-sekvens och bygga upp den igen, och båda sköter byteordning och teckenkodning
- **Request-reply** – distribuerade objekt byggs på request-reply ovanpå IPC, så båda skickar en förfrågan och väntar på svar, med anropssemantik som at-least-once eller at-most-once

Vad vinner man på virtualisering? (4)
||
- **Nätverksvirtualisering** – ett av bokens två slag (det andra är system, och frågan säger inte vilket); många virtuella nät ovanpå ett befintligt, vart och ett med egen adressering, egna protokoll och egen routing för en bestämd tillämpning
- **Vinsten med nät** – nya nättjänster utan att ändra nätet under, det uppmuntrar experiment och flera overlays kan samexistera; det antyder också en väg runt Saltzers end-to-end-argument
- **Systemvirtualisering** – flera virtuella maskiner på en fysisk maskin, var och en med eget operativsystem, styrda av en hypervisor
- **Vinsten med system** – mot processer säkerhet, ren uppdelning och exakt debitering, och maskiner kan migreras ganska enkelt, vilket kan sänka hårdvara och energi och möjliggör infrastructure as a service

## Kapitel 5 – Distribuerade objekt

Beskriv generellt hur distribuerade objekt och speciellt hur RMI fungerar. — Del 1 av 2: distribuerade objekt (3)
||
- **Modellen** – tillståndet är redan uppdelat per objekt, så det är ett litet steg att lägga objekten i olika processer; ofta används klient-server, där servern håller objekten och klienten anropar metoderna, och anrop kan bilda kedjor
- **De två bärande begreppen** – fjärrobjektreferens, ett id som funkar i hela systemet och kan skickas som argument och resultat, och fjärrgränssnitt, som anger vilka metoder som får anropas på distans
- **Fabriksmetoder** – fjärrgränssnittet har ingen konstruktor så man kan inte skapa objekt med ett fjärranrop, därför finns fabriksmetoder vars jobb är just att skapa objekt

Beskriv generellt hur distribuerade objekt och speciellt hur RMI fungerar. — Del 2 av 2: RMI (3)
||
- **Kedjan** – proxyn hos klienten låtsas vara objektet och packar referens, operationId och argument i en förfrågan, dispatchern hos servern väljer metod med operationId, skelettet packar upp och anropar servanten som har koden och tillståndet, och svaret går tillbaka samma väg
- **Automatiskt** – proxy, dispatcher och skelett genereras av en gränssnittskompilator, medan kommunikationsmodulerna på båda sidor kör request-reply och ger anropssemantiken, till exempel at-most-once
- **Java RMI** – samma syntax som ett lokalt anrop men anroparen vet att det är distribuerat, och fjärrobjekt skickas som referens medan andra objekt kopieras och skickas som värde
<!--SR:!fsrs,2026-10-28T14:13:08.923Z,7,7.49448566,3.58131923,2,3,0,0,2026-10-21T14:13:08.923Z-->

När kan ren socket-kommunikation vara bättre än distribuerade objekt och tvärtom? — Del 1 av 2: när sockets vinner (3)
||
- **När det lönar sig** – ren socket-kommunikation med request-reply är lättviktig och minimal, och vinner där kommunikationens omkostnader måste hållas nere; boken nämner inbyggda system
- **Vad man sparar** – tre TCP-omkostnader man slipper genom att bygga eget över UDP: bekräftelser, eftersom svaret bekräftar förfrågan, förbindelseuppsättning, som kostar två extra par meddelanden, och flödeskontroll, onödig för små argument
- **Exemplet** – Sun NFS skickar filblock av fast storlek och har idempotenta operationer, så det klarar sig utan historik och kör ett eget effektivare protokoll över UDP

När kan ren socket-kommunikation vara bättre än distribuerade objekt och tvärtom? — Del 2 av 2: när objekten vinner (3)
||
- **Uttryckskraften** – distribuerade objekt vinner för stora, krångliga program: man får hela objektmodellen med klasser och arv och kan skicka en objektreferens i stället för ett stort värde, så mottagaren anropar objektet i stället för att allt går över nätet
- **Priset alltid** – fjärranrop är känsligare för fel än lokala, och man kan inte skilja ett nätfel från att serverprocessen dött
- **Latensen** – den är flera storleksordningar högre, vilket antyder att man kanske bör minimera antalet fjärranrop

Jämför sockets, RPC, RMI och webbtjänster. — Del 1 av 2: ram, abstraktion, namngivning (3)
||
- **Ramen** – de är lager, inte alternativ: sockets underst, RPC och RMI byggs med sockets över request-reply, och webbtjänster ligger ovanpå HTTP som självt är request-reply
- **Abstraktion** – sockets ger byte-sekvenser, RPC en procedur som om den vore lokal, RMI en metod på ett objekt, och en webbtjänst operationer på en resurs som pekas ut av en URI
- **Namngivning** – sockets använder internetadress och port, RMI en fjärrobjektreferens som kan skickas som parameter, och en webbtjänst en URI, oftast en URL som kallas endpoint

Jämför sockets, RPC, RMI och webbtjänster. — Del 2 av 2: gränssnitt, semantik, brandväggar (3)
||
- **Gränssnitt och dataformat** – sockets beskrivs inte alls och du marshallar själv, RPC och RMI använder ett IDL och binärt format, och en webbtjänst använder WSDL och XML paketerat med SOAP, som är skrymmande men läsbart
- **Anropssemantik** – lokalt gäller exactly once, på distans väljer man maybe, en gång eller inte alls, at-least-once, som kan köra om proceduren och därför bara passar idempotenta operationer, eller at-most-once, som ger exakt en gång
- **Brandväggar** – Java RMI:s och CORBAs transport kommer normalt inte igenom en brandvägg men HTTP och SMTP gör det, så SOAP transporteras över dem och webbtjänster fungerar mellan organisationer där RMI och CORBA inte gör det

Vad är skillnaderna och likheterna mellan distribuerade objekt och webbtjänster? — Del 1 av 2: skillnaderna (3)
||
- **Kärnskillnaden** – en webbtjänst kan inte skapa fjärrobjekt och returnera referenser till dem som objektmodellen kan, så en webbtjänst är i praktiken ett enda fjärrobjekt och både skräpsamling och fjärrobjektreferenser blir irrelevanta
- **Följderna** – newShape är inte längre en fabriksmetod, det finns inga servanter, och fjärrreferenser får inte skickas som argument eller returneras
- **Paradigm och transparens** – webbtjänster är oberoende av programmeringsparadigm medan distribuerade objekt vill att du gör på ett bestämt sätt, och webbtjänster ger ingen transparens, i enklaste fallet läser och skriver man direkt i SOAP och XML

Vad är skillnaderna och likheterna mellan distribuerade objekt och webbtjänster? — Del 2 av 2: likheterna (2)
||
- **Ytlig likhet** – på ytan är de lika: där RMI använder en fjärrobjektreferens använder webbtjänsten en URI för att anropa en operation i den resurs URI:n pekar ut
- **Vad de delar** – båda bygger på programmering mot gränssnitt, vilket ger lös koppling och döljer språk och plattform, och båda kan gömma marshallingen bakom en proxy

## Kapitel 6 – Indirekt kommunikation

Beskriv poängen med indirekt kommunikation och olika strategier för hur det kan göras. — Del 1 av 2: poängen (3)
||
- **Vad det är** – kommunikation genom en mellanhand, utan direkt koppling mellan sändare och mottagare, ofta en-till-många
- **Poängen** – direkt koppling gör systemet stelt; i stället får man rumslig frikoppling, ingen behöver veta vem den andra är, och tidsmässig frikoppling, de behöver inte finnas samtidigt
- **Priset** – det kostar alltid prestanda och kan göra systemet svårare att förvalta, och man får inte båda frikopplingarna automatiskt

Beskriv poängen med indirekt kommunikation och olika strategier för hur det kan göras. — Del 2 av 2: strategierna (2)
||
- **De fem** – gruppkommunikation, publish-subscribe, message queues, distribuerat delat minne och tuple spaces
- **Uppdelningen** – de tre första bygger på meddelanden, de två sista är en delad datayta; publish-subscribe och message queues kan skala stort med rätt routing, men gruppkommunikation och de databaserade skalar sämre (de databaserade för att alla måste se samma data)

Beskriv gruppkommunikation och hur det kan implementeras. — Del 1 av 2: vad det är (3)
||
- **Vad det är** – ett meddelande skickas till en grupp och levereras till alla medlemmar, utan att sändaren vet vilka de är
- **Abstraktion ovanpå multicast** – byggd på IP-multicast eller ett overlay-nät och lägger till medlemskapshantering, feldetektering och garantier om tillförlitlighet och ordning; boken säger att den är till IP-multicast vad TCP är till IP
- **Modellen** – processer går med eller lämnar gruppen, och sändaren gör ett enda multicast-anrop i stället för många send, vilket ger garantier för gruppen som helhet

Beskriv gruppkommunikation och hur det kan implementeras. — Del 2 av 2: hur det implementeras (4)
||
- **Tillförlitlighet** – integritet, samma meddelande levereras högst en gång, giltighet, det levereras så småningom, och överenskommelse, får en medlem det så får alla det
- **Ordning** – FIFO som är sändarens ordning, kausal som bevarar händer-före, och total där alla ser samma ordning
- **Medlemskap** – en tjänst som sköter medlemskapsändringar, feldetektering som utesluter den misstänkte, notifiering och gruppadressexpansion
- **Följden** – medlemskapshanteringen gör att gruppkommunikation passar bäst i små, statiska system och fungerar sämre storskaligt

Beskriv publish-subscribe-metoden och visa på hur den kan implementeras. — Del 1 av 2: vad det är (3)
||
- **Vad det är** – publishers publicerar strukturerade händelser, subscribers anmäler intresse med subscriptions som är mönster över händelserna, och systemet matchar och levererar notifieringar; i grunden en-till-många och den mest använda indirekta tekniken i kapitlet
- **Två egenskaper** – heterogenitet, så komponenter som inte byggts för att samverka ändå kan jobba ihop, och asynkronitet, så publishern aldrig behöver vänta in subscribern
- **Subskriptionsmodellen** – den bestämmer uttryckskraften: kanalbaserad, topic-baserad, innehållsbaserad och typbaserad, i stigande ordning av kraft och svårighet

Beskriv publish-subscribe-metoden och visa på hur den kan implementeras. — Del 2 av 2: hur det implementeras (2)
||
- **Var mäklaren sitter** – centralt, vilket är enkelt men ger en flaskhals och en möjlig enda felpunkt; som ett nätverk av samarbetande mäklare; eller helt peer-to-peer där alla noder är mäklare
- **Routing** – kanal och topic mappas enkelt på grupper och multicast, medan innehållsbaserat kräver content-based routing: flooding, filtering, advertisements, rendezvous med DHT, eller informed gossip
<!--SR:!fsrs,2026-10-25T12:54:08.697Z,4,4.37161444,5.20002037,2,2,0,0,2026-10-21T12:54:08.697Z-->

Beskriv message queuing och beskriv hur det implementeras på ett bra sätt. — Del 1 av 2: vad det är (3)
||
- **Vad det är** – en punkt-till-punkt-tjänst där sändaren lägger meddelandet i en kö och en enda process plockar bort det, till skillnad från grupper och publish-subscribe som är en-till-många
- **Den avgörande egenskapen** – meddelandena är persistenta: kön lagrar dem tills de konsumeras och skriver dem till disk
- **Vad persistensen ger** – giltighet, meddelandet tas emot så småningom, och integritet, det är identiskt och kommer aldrig två gånger, men systemet säger inget om när leveransen sker

Beskriv message queuing och beskriv hur det implementeras på ett bra sätt. — Del 2 av 2: hur det implementeras bra (3)
||
- **Problemet** – en central köhanterare är enkel men kan bli en tungviktig komponent, en flaskhals och en möjlig enda felpunkt
- **Lösningen** – federera köhanterarna med enkelriktade message channels och routingtabeller, så man kan bygga godtyckliga topologier
- **Hub-and-spoke** – klienten pratar RPC med en spoke nära sig och blockeras bara tills meddelandet ligger där, medan hoppet vidare till hubben är asynkront men garanterat tillförlitligt

Jämför gruppkommunikation, publish-subscribe och message queuing utifrån: Sändare, Mottagare, Implementatör — Del 1 av 3: sändaren (3)
||
- **Gruppkommunikation** – ett multicast till gruppen; sändaren vet inget om medlemmarna och måste själv vara medlem om gruppen är sluten
- **Publish-subscribe** – en strukturerad händelse till händelsetjänsten; sändaren vet inte vilka subscribers som finns och väntar inte in någon
- **Message queuing** – meddelandet läggs i en namngiven kö; sändaren vet att exakt en konsument tar det, och sändningen kan ligga i en transaktion

Jämför gruppkommunikation, publish-subscribe och message queuing utifrån: Sändare, Mottagare, Implementatör — Del 2 av 3: mottagaren (3)
||
- **Gruppkommunikation** – medlemmen får allt som skickas till gruppen utan filtrering och måste normalt finnas när meddelandet skickas
- **Publish-subscribe** – subscribern väljer själv med ett filter: kanal, topic, innehåll eller typ
- **Message queuing** – konsumenten konkurrerar med andra om samma kö, kan välja på metadata och hämta långt efteråt; bara här finns valet att blockera, polla eller bli notifierad

Jämför gruppkommunikation, publish-subscribe och message queuing utifrån: Sändare, Mottagare, Implementatör — Del 3 av 3: implementatören (3)
||
- **Gruppkommunikation** – svårast är gruppmedlemskapet, alltså vilka som är med, feldetektering, notifiering och adressexpansion, plus ordning, och just det begränsar skalbarheten
- **Publish-subscribe** – svårast är matchning och routing: central mäklare, nätverk av mäklare eller peer-to-peer
- **Message queuing** – svårast är persistensen och topologin: meddelandena måste till disk, och köhanterarna bör federeras i stället för att sitta centralt
<!--SR:!fsrs,2026-10-20T15:55:39.799Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T15:55:39.799Z-->

## Kapitel 9 – Webbtjänster

Vad är en webbtjänst och i vilka situationer används sådana? Vad innebär begreppet låg koppling i kontexten webbtjänst? Ge exempel på protokoll eller arkitekturer för webbtjänster. — Del 1 av 3: vad det är och när (4)
||
- **Vad det är** – i regel en samling operationer som nås över internet, identifierad av en URI, med meddelanden i XML; den kan inte nås direkt av en webbläsare
- **Varför de finns** – webbläsaren är en för allmän klient, så webbtjänster går tillbaka till den gamla modellen där både klient och tjänst har specialiserade gränssnitt
- **När** – mellan organisationer utan människa i loopen, och för att kombinera flera tjänster till en ny, som en resebyråtjänst
- **Brandväggar** – HTTP och SMTP släpps normalt igenom en brandvägg medan RMI:s och CORBA:s transport normalt inte gör det, så det blir vägen in

Vad är en webbtjänst och i vilka situationer används sådana? Vad innebär begreppet låg koppling i kontexten webbtjänst? Ge exempel på protokoll eller arkitekturer för webbtjänster. — Del 2 av 3: låg koppling (4)
||
- **Grundbetydelsen** – att hålla beroendena mellan tjänster så små som möjligt, så att en ändring i en tjänst inte välter de andra; boken påpekar att ordet ofta används luddigt
- **Programmering mot gränssnitt** – att skilja gränssnittet från implementationen, vilket ger en nivå av låg koppling och hanterar olika språk och plattformar
- **Enkla, generella gränssnitt** – minimala gränssnitt som webben och REST minskar beroendet av specifika operationsnamn, så data blir viktigare än operation
- **Valet av paradigm** – i request-reply är parterna i grunden kopplade, medan asynkrona meddelanden ger en synkroniseringsfrikoppling så avsändaren inte behöver vänta
<!--SR:!fsrs,2026-10-24T12:47:42.325Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-21T12:47:42.325Z-->

Vad är en webbtjänst och i vilka situationer används sådana? Vad innebär begreppet låg koppling i kontexten webbtjänst? Ge exempel på protokoll eller arkitekturer för webbtjänster. — Del 3 av 3: protokoll (4)
||
- **XML** – textformatet för datarepresentation och marshalling; skrymmande men valt för läsbarheten och enklare felsökning
- **SOAP** – reglerna för hur XML packar ihop meddelanden, och hur ett par enkelriktade meddelanden bildar request-reply, skickat över HTTP eller SMTP
- **REST** – alternativet till SOAP, en mer avskalad stil mot resurser; se fråga 2
- **WSDL** – tjänstebeskrivningen, som bär gränssnittet, hur meddelanden ska skickas och tjänstens URI, vilket gör en separat binder eller namntjänst onödig

Vad är REST och vilka principer ska en RESTful webbtjänst uppfylla? Hur accessas resurser i en REST-arkitektur? Vilken roll har hypermedia? — Del 1 av 3: vad REST är och principerna (3)
||
- **Vad REST är** – en arkitekturstil från Fieldings avhandling från 2000, varken ett protokoll eller en standard; boken beskriver den som URL:er plus GET, PUT, DELETE och POST mot resurser i XML, med tyngdpunkt på data i stället för gränssnitt
- **De sex principerna** – likformigt gränssnitt, klient-server, tillståndslöshet, cachebarhet, skiktat system, och kod på begäran som är valfri
- **Två källor** – boken beskriver REST som HTTP med fyra metoder, medan restfulapi.net säger att REST inte är bundet till HTTP och att Fielding aldrig band stilen till ett protokoll

Vad är REST och vilka principer ska en RESTful webbtjänst uppfylla? Hur accessas resurser i en REST-arkitektur? Vilken roll har hypermedia? — Del 2 av 3: hur resurser nås (2)
||
- **Hur resurser nås** – via en resursidentifierare, alltså en URI; det man får tillbaka är en representation av resursens tillstånd, som består av datat, metadata som beskriver datat, och hypermedialänkarna som tar klienten vidare
- **Resurs och representation** – de är skilda saker, så samma resurs kan levereras i olika format som JSON, XML eller HTML

Vad är REST och vilka principer ska en RESTful webbtjänst uppfylla? Hur accessas resurser i en REST-arkitektur? Vilken roll har hypermedia? — Del 3 av 3: hypermedia (2)
||
- **HATEOAS** – hypermedia är motorn: klienten ska bara ha resursens första URI och sedan driva alla andra resurser och samspel via hyperlänkar som servern lämnar i svaren
- **Kravet** – ett RESTful API ska se ut som hypertext, och går klienten vidare på något den inte fick i svaren är det inte hypertexten som styr och kravet är inte uppfyllt

Jämför distribuerade objekt (t.ex. RMI) med webbtjänster (t.ex. REST) för kommunikation mellan (del-)system. (4)
||
- **Ytligt lika** – klienten anropar en operation, med en fjärrobjektreferens i RMI och en URI i en webbtjänst; boken säger uttryckligen att likheten är ytlig
- **Kärnskillnaden** – en webbtjänst kan inte skapa nya fjärrobjekt och har inga servanter, så den är i praktiken ett enda fjärrobjekt och både skräpsamling och fjärrobjektreferenser blir irrelevanta
- **Två principskillnader** – webbtjänster är medvetet oberoende av programmeringsparadigm, och de ger ingen transparens på köpet: marshalling och känslan av ett lokalt anrop får läggas till med en proxy eller dynamisk invokering
- **Avvägningen** – priset är prestanda, för XML är text och CDR binärt, och en studie mätte ett SOAP-anrop som 14 gånger större och i snitt 882 gånger långsammare än CORBA, fast boken garderar att det beror på språk och implementation; vinsten är global räckvidd, för bara DNS behövs och HTTP går genom brandväggar
<!--SR:!fsrs,2026-10-24T13:03:24.548Z,3,2.3479313,7.84078413,2,4,0,0,2026-10-21T13:03:24.548Z-->

Vad innebär SOA (Service-Oriented Architecture)? (3)
||
- **Definitionen** – en uppsättning designprinciper: man bygger systemet av löst kopplade tjänster som kan upptäckas dynamiskt och sedan antingen pratar direkt med varandra eller koordineras genom koreografi
- **Hur det byggs** – det är ett abstrakt begrepp som går att bygga med distribuerade objekt eller komponenter, men det huvudsakliga sättet är webbtjänster, till stor del för den låga koppling som ligger i dem
- **Resultatet** – B2B-integration, där en organisation kan köra CORBA internt och en annan .NET men båda exponerar webbtjänster utåt, och en mashup-kultur där en tredjepartsutvecklare kombinerar två eller flera tjänster till en ny

Förklara relationen mellan Ajax och webbtjänster. (3)
||
- **Vad Ajax är** – en utbyggnad av webbens vanliga klient-serversamspel som skickar små databitar mellan ett Javascript-frontend i webbläsaren och ett backend-program på servern, så man slipper hämta en hel ny sida och blockera användaren
- **Relationen** – båda tar sig runt begränsningen i webbläsarens vanliga samspel och gör det över HTTP med XML: Ajax för att webbläsaren är för klumpig, webbtjänster för att den är för allmän; och backend som Ajax-anropet träffar kan i sin tur vara en webbtjänst (egen slutsats)
- **Markeringen** – boken kopplar dem aldrig själv, och Ajax beskrivs i kapitel 2, inte i kapitel 9, så säg det om examinatorn frågar var det står

## Kapitel 10 – Peer-to-Peer (P2P)

Vad skiljer P2P från klient/server-modellen? Vilka är de viktigaste fördelarna respektive nackdelarna med ett P2P-system? — Del 1 av 2: skillnaden (3)
||
- **Kärnan** – i klient-server ligger resurserna på en server eller ett litet kluster, i P2P ligger de spritt över nätet och alla noder har samma funktionella förmåga och ansvar
- **Klient-server** – få beslut behövs om var resurser läggs och hur hårdvaran sköts, men skalan begränsas av serverns kapacitet och nätanslutning
- **P2P** – varje användare bidrar med resurser och driften beror inte på något centralt administrerat system; målet är att dela i mycket stor skala utan separat skötta servrar

Vad skiljer P2P från klient/server-modellen? Vilka är de viktigaste fördelarna respektive nackdelarna med ett P2P-system? — Del 2 av 2: fördelar och nackdelar (4)
||
- **Fördelarna** – utnyttjar oanvända resurser i värddatorerna, skalar till många klienter och värdar med utmärkt lastbalansering, och självorganiserar så att supportkostnaden i stort är oberoende av antalet deltagare
- **Nackdel: data** – föränderlig data är relativt dyr att lagra jämfört med en betrodd, central tjänst, och grunden för anonymitet har ännu inte gett starka garantier
- **Nackdel: volatilitet** – ägarna lovar inte att hålla sina datorer påslagna, anslutna och felfria, så tillgängligheten är oförutsägbar
- **Vändningen** – just den replikering volatiliteten kräver kan utnyttjas för att ge en viss grad av motstånd mot manipulation från illvilliga noder

I vilka situationer och för vilken typ av data passar P2P-system? Varför har P2P-tekniken kopplats samman med piratkopiering och upphovsrätt? — Del 1 av 2: situationer och data (3)
||
- **Datatypen** – oföränderlig data, som musik- och videofiler; GUID:et räknas normalt ut som en säker hash av innehållet, så en ändring skulle ge ett annat GUID
- **Varför det funkar** – hashen gör filen självcertifierande: mottagaren räknar om den och ser att den stämmer, vilket skyddar mot manipulation från de obetrodda noder den kan ha lagrats på
- **Situationen** – stor skala där ingen enskild fil är kritisk; musikfiler uppdateras aldrig, och en tillfälligt onåbar fil kan hämtas senare

I vilka situationer och för vilken typ av data passar P2P-system? Varför har P2P-tekniken kopplats samman med piratkopiering och upphovsrätt? — Del 2 av 2: upphovsrätt (3)
||
- **Napster** – den första stora P2P-tillämpningen var Napsters musikfildelning, som stängdes efter en upphovsrättsprocess; arkitekturen hade centrala index, men användarna tillhandahöll filerna från sina egna datorer
- **Argumentet som föll** – utvecklarna hävdade att de inte deltog i kopieringen, som skedde mellan användarnas maskiner, men indexservrarna bedömdes vara en väsentlig del av processen
- **Följden** – indexservrarna låg på välkända adresser, så operatörerna kunde inte vara anonyma och kunde stämmas; en mer fullständigt distribuerad tjänst hade spritt ansvaret över alla och gjort rättsliga åtgärder mycket svåra, om inte omöjliga

Vilka icke-funktionella krav ställs på ett P2P-system? (2)
||
- **Tre för att systemet är stort** – global skalbarhet till miljoner objekt, lastbalansering med slumpmässig placering plus repliker av det hårt använda, och optimering för lokala interaktioner så resurser läggs nära dem som använder dem
- **Tre för att datorerna varken ägs eller litas på** – anpassning till att noder ansluter och lämnar fritt, säkerhet med autentisering och kryptering när värdarna har olika ägare, och anonymitet, förnekbarhet och motstånd mot censur

Hur hittar man en specifik resurs i ett P2P-nätverk? Vad är en "routing overlay"? Vad är skillnaden mellan strukturerade och ostrukturerade P2P-system? — Del 1 av 2: routing overlay (3)
||
- **Så hittar man resursen** – en routing overlay rutar förfrågan till en värd som har objektet: klienten skickar objektets GUID och överlägget rutar vidare till närmaste levande nod som har en kopia
- **Vad den är** – en distribuerad algoritm, ett lager i mellanprogrammet som lokaliserar noder och objekt; den rutar i applikationslagret, helt skilt från IP-rutningen
- **Varför den behövs** – ingen kan hålla hela katalogen över var allt finns, så kunskapen partitioneras och sprids över noderna, med hög replikering

Hur hittar man en specifik resurs i ett P2P-nätverk? Vad är en "routing overlay"? Vad är skillnaden mellan strukturerade och ostrukturerade P2P-system? — Del 2 av 2: strukturerat mot ostrukturerat (4)
||
- **Strukturerat** – en DHT där GUID:et bestämmer placeringen: objektet läggs på noden vars GUID är numeriskt närmast, och sökningen sker med prefixrutning som matchar en siffra mer av målet per hopp
- **Ostrukturerat** – ingen kontroll över topologi eller placering; nätet byggs ad hoc av lokala regler, och man hittar objekt genom att fråga sig fram genom grannarna, sannolikhetsbaserat och utan garantier
- **Avvägningen** – strukturerat garanterar att objektet hittas och ger tidsgränser men kräver dyrt underhåll av strukturen; ostrukturerat är tåligt mot nodfel men kan flöda nätet med förfrågningar
- **Det som förvånar** – ostrukturerat dominerar ändå på Internet, till exempel BitTorrent

Vad är skillnaden mellan IP och P2P på applikationsnivå? (4)
||
- **Ramen** – överlägget ersätter inte IP utan ligger ovanpå: varje hopp går normalt över UDP, och ett enda överläggshopp kan kräva många IP-hopp
- **Skarpaste skillnaden** – målidentifiering: en IP-adress pekar på exakt en nod, medan överlägget kan ruta till närmaste replik av ett objekt
- **Mest praktiska** – nätdynamik: IP:s tabeller uppdateras på timskala, överläggets på bråkdelar av en sekund, så det klarar ett nät som ändras hela tiden
- **Övriga axlar** – platt och stor GUID-rymd mot hierarkisk IP, slumpad placering ger lastbalansering, n-faldig replikering av rutter ger feltolerans, och säkerhet och en begränsad grad av anonymitet går även med begränsad tillit
<!--SR:!fsrs,2026-10-31T08:29:13.138Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-22T08:29:13.138Z-->

## Kapitel 11 – Säkerhet

Vilka är de viktigaste hoten och attackerna som ett distribuerat system måste skyddas mot? — Del 1 av 2: hoten (3)
||
- **Tre hotklasser** – läckage, att obehöriga får tag på information; manipulation, att information ändras utan lov; och vandalisering, att någon stör systemet utan att själv vinna något på det
- **Varför hoten finns** – säkerhet behövs för att vi vill dela resurser; det som inte delas kan i regel skyddas genom att isoleras från åtkomst utifrån
- **Två hot till, för vissa system** – kod som laddas ner och körs i en process kan angripa processens inre gränssnitt och objekt, och Java svarar med sin sandlåda; och vid informationsläckage kan redan det att ett meddelande syns avslöja något

Vilka är de viktigaste hoten och attackerna som ett distribuerat system måste skyddas mot? — Del 2 av 2: attackerna (3)
||
- **Fem attackmetoder** – de delas in efter hur en kanal missbrukas: avlyssning, att kopiera meddelanden utan lov; maskering, att skicka eller ta emot under någon annans identitet; meddelandemanipulation, att ändra innehållet på vägen; uppspelning, att skicka gamla meddelanden igen senare; och överbelastning, att dränka en kanal så att andra inte kommer fram
- **Man-in-the-middle** – en form av meddelandemanipulation: angriparen fångar första meddelandet i ett nyckelutbyte och byter in nycklar som han själv känner, så att han kan dekryptera allt som följer och kryptera om det innan han skickar det vidare
- **Uppspelning** – kan fungera även mot krypterade och autentiserade meddelanden, för angriparen behöver inte nyckeln: han kopierar bitmönstret och skickar det igen senare, så att mottagaren till exempel kan luras att betala två gånger

Beskriv vilken roll kryptering har för säkerhet, förutom att dölja innehållet i ett meddelande (konfidentialitet, autentisering, integritet, oförnekbarhet). — Del 1 av 2: ramen, sekretess och integritet (3)
||
- **Tre roller** – boken delar kryptografins roller i tre: sekretess och integritet, autentisering, och digitala signaturer; frågans fyra begrepp ryms i dem, och oförnekbarhet får man genom signaturerna
- **Konfidentialitet** – ett krypterat meddelande kan bara dekrypteras av den som har motsvarande dekrypteringsnyckel, så det hålls hemligt så länge nyckeln inte är röjd och algoritmen är stark nog
- **Integritet** – kommer inte gratis: kryptering skyddar mot ändringar bara om redundant information, till exempel en checksumma, läggs in och kontrolleras
<!--SR:!fsrs,2026-10-20T15:52:03.481Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-19T15:52:03.481Z-->

Beskriv vilken roll kryptering har för säkerhet, förutom att dölja innehållet i ett meddelande (konfidentialitet, autentisering, integritet, oförnekbarhet). — Del 2 av 2: autentisering och oförnekbarhet (4)
||
- **Autentisering** – lyckas du dekryptera med en nyckel som bara två parter känner, och meddelandet innehåller en riktig checksumma, så hade avsändaren nyckeln, och då vet du vem det var
- **Oförnekbarhet** – avsändaren ska inte kunna förneka att han deltog i en transaktion; mekanismen är den digitala signaturen, som intygar för en tredje part att meddelandet är en oförändrad kopia av det signeraren skapade
- **Bokens exempel** – fantomuttag i en bankomat: bankens bästa svar på en sådan anklagelse är en transaktion som kontohavaren har signerat digitalt, på ett sätt som en tredje part inte kan förfalska
- **Sammanfattningen** – kryptering döljer innehållet, men det är vem som kan kryptera och dekryptera som ger resten: kan bara du kryptera något blir det ett bevis på att det kom från dig (egen slutsats)

Förklara hur symmetrisk, asymmetrisk respektive hybridkryptering fungerar. I vilka situationer används respektive typ? Prestanda? — Del 1 av 3: hur de fungerar (3)
||
- **Symmetrisk** – samma nyckel krypterar och dekrypterar; den bygger på envägsfunktioner, och för en väl designad algoritm sitter styrkan mot att knäcka nyckeln i nyckellängden, eftersom den effektivaste allmänna attacken är att prova alla nycklar
- **Asymmetrisk** – ett nyckelpar där nyckeln som krypterar och nyckeln som dekrypterar är olika; den bygger på fälldörrsfunktioner, alltså envägsfunktioner med en hemlig utgång, och för RSA är det två mycket stora primtal som är lätta att multiplicera men vars produkt i praktiken inte går att faktorisera tillbaka
- **Hybrid** – asymmetrisk kryptering autentiserar parterna och krypterar ett utbyte av hemliga nycklar, och sedan används de hemliga nycklarna symmetriskt för all vidare kommunikation; TLS är bokens exempel
<!--SR:!fsrs,2026-10-19T16:02:03.772Z,0,0.212,6.4133,1,1,0,0,2026-10-19T16:01:03.772Z-->

Förklara hur symmetrisk, asymmetrisk respektive hybridkryptering fungerar. I vilka situationer används respektive typ? Prestanda? — Del 2 av 3: situationerna (3)
||
- **Symmetrisk** – för bulkkryptering, alltså den stora mängden data
- **Asymmetrisk** – för nyckelutbyte och digitala signaturer, och bara i de inledande stegen av en säker session; den används sällan för att kryptera själva datan, eftersom den kostar för mycket
- **Hybrid** – det som de flesta storskaliga distribuerade system väljer, till exempel för e-handel: publik nyckel slipper en säker nyckeldistribution men är för dyr ens för medelstora meddelanden, så den används bara för att autentisera parterna och byta en hemlig nyckel
<!--SR:!fsrs,2026-10-24T12:50:24.172Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-21T12:50:24.172Z-->

Förklara hur symmetrisk, asymmetrisk respektive hybridkryptering fungerar. I vilka situationer används respektive typ? Prestanda? — Del 3 av 3: prestanda (2)
||
- **Förhållandet** – asymmetrisk kryptering räknar med mycket stora tal, vilket ger stora beräkningskostnader, och den kräver typiskt 100 till 1000 gånger så mycket processorkraft som symmetrisk; bland de symmetriska är AES snabbast och Triple-DES långsammast i bokens jämförelse
- **I praktiken** – en webbsida är sällan större än 100 kB och kan krypteras symmetriskt på några millisekunder, och RSA-signeringen tar också några millisekunder, så algoritmernas prestanda påverkar knappt hur snabb https känns

Förklara hur asymmetriska nycklar (public/private) kan användas för att ge autenticitet. — Del 1 av 2: nyckelvändningen (3)
||
- **Kärnan** – krypterar du med din privata nyckel kan vem som helst dekryptera med din publika; det ger ingen sekretess, men det visar att det kommer från den som har den privata nyckeln
- **Varför det går** – nyckelparets två funktioner är varandras inverser; för RSA bevisade Rivest, Shamir och Adelman att de kan köras i vilken ordning som helst
- **Två riktningar** – för sekretess krypterar man med mottagarens publika nyckel, och för autenticitet, som vid en signatur, med sin egen privata
<!--SR:!fsrs,2026-10-24T12:49:19.892Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-21T12:49:19.892Z-->

Förklara hur asymmetriska nycklar (public/private) kan användas för att ge autenticitet. — Del 2 av 2: signaturen och förbehållet (3)
||
- **Så används det** – som digital signatur: avsändaren krypterar en sammanfattning av meddelandet, en digest, med sin privata nyckel, och vem som helst kontrollerar den med den publika
- **Förbehållet** – den som kontrollerar måste vara säker på att den publika nyckeln verkligen tillhör den som sägs ha signerat, och det löser man med publik-nyckelcertifikat
- **Annars man-in-the-middle** – Mallory kan fånga begäran om Bobs certifikat och svara med sin egen publika nyckel, och sedan fånga upp allt som följer; skyddet är att certifikatet är signerat med en nyckel som man har fått på ett helt säkert sätt

Vad är en digital signatur och vad bidrar den med gällande säkerhet? Hur genereras respektive kontrolleras en digital signatur? — Del 1 av 2: vad den är och bidrar med (3)
||
- **Vad det är** – den binder oåterkalleligt signerarens identitet till hela bitföljden i ett dokument, med en hemlighet som bara signeraren har
- **Tre egenskaper** – samma som för en handskriven signatur: autentisk, att signeraren medvetet signerade och att ingen annan ändrat dokumentet; oförfalskbar, att ingen annan kunde ha gjort den och att den inte kan flyttas till ett annat dokument; och oförnekbar, att signeraren inte trovärdigt kan förneka det
- **Vad den används till** – att intyga saker för en tredje part, till exempel att en användares identitet hör ihop med en publik nyckel; ett digitalt signerat dokument kan vara betydligt svårare att förfalska än ett handskrivet

Vad är en digital signatur och vad bidrar den med gällande säkerhet? Hur genereras respektive kontrolleras en digital signatur? — Del 2 av 2: hur den skapas och kontrolleras (3)
||
- **Skapas** – avsändaren räknar ut en sammanfattning av meddelandet med en överenskommen säker hashfunktion och krypterar den med sin privata nyckel; det är signaturen, och den skickas med meddelandet, som går i klartext
- **Kontrolleras** – mottagaren dekrypterar signaturen med avsändarens publika nyckel, räknar själv ut sammanfattningen av meddelandet han fick och jämför; stämmer de är signaturen giltig
- **Nyckelvändningen** – signerarens privata nyckel krypterar signaturen, medan sekretess använder mottagarens publika; en signatur måste skapas med en hemlighet bara signeraren har, men kunna kontrolleras av alla

Vad är en digest-funktion (säker hashfunktion) och vilka egenskaper har en sådan funktion? — Del 1 av 2: vad den är och egenskaperna (2)
||
- **Vad det är** – en funktion H(M) som gör ett meddelande av godtycklig längd till ett bitmönster av fast längd som kännetecknar det; den liknar en checksumma, men det är mycket osannolikt att två olika meddelanden får liknande värde
- **Tre egenskaper** – lätt att räkna fram hashen ur meddelandet; svårt att räkna fram meddelandet ur hashen; och svårt att hitta ett annat meddelande med samma hash; de två första ger namnet envägshashfunktion
<!--SR:!fsrs,2026-10-28T13:03:30.900Z,7,7.49448566,3.58131923,2,3,0,0,2026-10-21T13:03:30.900Z-->

Vad är en digest-funktion (säker hashfunktion) och vilka egenskaper har en sådan funktion? — Del 2 av 2: varför den tredje egenskapen avgör (4)
||
- **Den tredje avgör** – kollisioner måste finnas, eftersom en sammanfattning minskar informationen, så kravet är att en angripare inte ska kunna hitta dem
- **Annars förfalskning** – hittar angriparen ett annat meddelande med samma hash kan han flytta signaturen dit och förfalska utan att känna nyckeln
- **Födelsedagsattacken** – angriparen gör många nästan likadana versioner av två dokument och jämför alla mot alla; med en hash på 64 bitar räcker i snitt $2^{32}$ versioner, så hashvärden måste vara minst 128 bitar
- **I praktiken** – MD5 ger 128 bitar och SHA-1 160; båda kan betraktas som tillräckligt säkra för överskådlig tid, men publicerade attacker mot SHA-1:s föregångare antyder att SHA-1 är sårbar

Vad är TLS/SSL respektive HTTPS? Förklara hur handskakningen i TLS går till. — Del 1 av 3: vad de är (4)
||
- **TLS/SSL** – SSL utvecklades av Netscape, och en utökad version av SSL blev internetstandard under namnet TLS; det sätter upp en säker kanal med sekretess, integritet och autenticitet
- **HTTPS** – inget eget protokoll: prefixet https i en URL startar upprättandet av en TLS-kanal mellan webbläsaren och webbservern; att säkra HTTP är antagligen det TLS används mest till
- **Två lager** – record-protokollet är själva säkra kanalen, som krypterar och autentiserar meddelandena, och handskakningslagret sätter upp och underhåller sessionen
- **Byggd som hybrid** – kanalen startar okrypterat, går över till publik nyckel och sist till hemlig nyckel när en delad nyckel finns; varje byte är valfritt och förhandlas först

Vad är TLS/SSL respektive HTTPS? Förklara hur handskakningen i TLS går till. — Del 2 av 3: handskakningen (4)
||
- **ClientHello och ServerHello** – handskakningen körs över en befintlig anslutning och börjar i klartext; parterna enas om protokollversion, sessions-id, cipher suite och komprimering och byter slumpvärden, och servern erbjuder sina cipher suites medan klienten väljer en
- **Certifikat, valfritt** – parterna kan autentisera varandra med signerade publik-nyckelcertifikat i X.509-format, men minst en publik nyckel måste finnas till nästa steg
- **Pre-master secret** – den ena parten skapar ett stort slumpvärde och skickar det krypterat med den publika nyckeln; ur det räknar båda fram sessionsnycklarna, en per riktning, och hemligheterna för meddelandeautentisering
- **ChangeCipherSpec och Finished** – de meddelandena startar den säkra sessionen, och när Finished har utbytts är all vidare trafik krypterad och signerad enligt den valda cipher suiten

Vad är TLS/SSL respektive HTTPS? Förklara hur handskakningen i TLS går till. — Del 3 av 3: cipher suite (2)
||
- **Vad det är** – alla kryptografiska val samlas i en cipher suite, som har ett val för var och en av tre delar: metoden för nyckelutbyte, chiffret för själva datan och digest-funktionen för meddelandeautentiseringen
- **Varför den förhandlas** – i ett öppet nät kan man inte anta att alla har samma algoritmer, och vissa länders lagar försöker begränsa vilka som får användas; har parterna inte tillräckligt många gemensamt misslyckas anslutningen

Vad är ett certifikat? Vad innehåller det, vad ska det säkerställa och vad är en Certificate Authority (CA)? — Del 1 av 2: vad det är och ska säkerställa (3)
||
- **Vad det är** – ett dokument med ett påstående, oftast kort, som är signerat av en principal, alltså en användare eller en process; det kan intyga många slags påståenden, inte bara nycklar
- **Vad det ska säkerställa** – att mottagaren kan lita på påståendet: Alice kan visa med ett certifikat från sin bank att hon har ett konto där, och en säljare som kan kontrollera bankens signatur kan då debitera kontot
- **Men bara med äkta nyckel** – för att kontrollera signaturen behöver säljaren bankens publika nyckel och måste veta att den är äkta, annars kan Alice skapa ett eget nyckelpar och tillverka ett falskt certifikat som ser ut att komma från banken

Vad är ett certifikat? Vad innehåller det, vad ska det säkerställa och vad är en Certificate Authority (CA)? — Del 2 av 2: innehållet och CA (4)
||
- **Innehållet** – ett X.509-certifikat, det vanligaste formatet, har subject med namn och publik nyckel, issuer med namn och signatur, en giltighetsperiod med två datum, och administrativ information med version och serienummer; bindningen mellan nyckeln och namnet ligger i signaturen
- **CA** – en välkänd organisation som utfärdar certifikat till företag och personer som lämnar godtagbara bevis på sin identitet; bokens exempel är Verisign och CREN
- **Kontrollen i två steg** – hämta utfärdarens eget certifikat från en pålitlig källa och kontrollera sedan signaturen; varje certifikat beror alltså på att utfärdarens nyckel är äkta, och kedjan bryts först när man fått en nyckel på ett sätt man litar på
- **Problemen** – att välja var kedjan börjar, eftersom tillit sällan är absolut; att privata nycklar kan röjas; och att en längre kedja ger större risk för en svag länk; återkallning löses normalt med ett utgångsdatum

## Kapitel 16 – Transaktioner

Vad gör man åt deadlocks? (3)
||
- **Tre vägar** – en deadlock är när transaktioner i en grupp väntar på varandras lås, och mot den finns tre svar: förebygga, upptäcka eller timeout; den uppstår bara med låsning
- **Förebygga och upptäcka** – förebygga är att låsa allt redan vid start eller i en bestämd ordning, enligt boken skenbart enkelt men inte särskilt bra eftersom det stryper samtidigheten; upptäcka är att leta efter en cykel i väntegrafen och avbryta en transaktion i cykeln
- **Timeout** – ett vanligt sätt i praktiken: varje lås blir sårbart efter en tid och bryts om någon annan väntar på objektet, och värsta baksidan är att transaktioner ibland avbryts utan att det fanns någon deadlock alls

Är dirty reads ett problem? Hur kommer man åt det? — Del 1 av 2: problemet (3)
||
- **Ja** – en dirty read är när en transaktion läser ett värde som en annan har skrivit men inte bekräftat än
- **Varför allvarligt** – avbryter skrivaren sen har läsaren sett ett värde som aldrig funnits, och har läsaren redan bekräftat går det inte att ångra
- **Serialiserbarhet räcker inte** – en dirty read uppstår även i en körning som är serialiserbar, så problemet är avbrotten och inte flätningen av operationer

Är dirty reads ett problem? Hur kommer man åt det? — Del 2 av 2: botemedlet (3)
||
- **Skjut upp commit** – första steget: vänta med din egen commit tills varje transaktion vars obekräftade värde du läst själv har bekräftat; avbryter den måste du avbryta med
- **Läs bara bekräftat** – ett starkare villkor: läs bara objekt som skrivits av redan bekräftade transaktioner, så slipper man kaskadavbrott
- **Skjut upp allt** – det starkaste: skjut upp både läsning och skrivning på ett objekt tills alla som skrivit det har bekräftat eller avbrutit, en strikt körning, och det är den som ger isoleringen

Vad är optimistisk approach (optimistic concurrency control) och varför kan det vara att föredra? Vad är nackdelen? — Del 1 av 3: vad det är (2)
||
- **Grundidén** – chansen att två transaktioner rör samma objekt är låg i de flesta tillämpningar, så låt dem köra fritt utan lås och kontrollera först vid commit
- **Tre faser** – en arbetsfas där man jobbar på tentativa versioner, en valideringsfas vid commit som kollar krock mot överlappande transaktioner, och en uppdateringsfas som gör ändringarna permanenta

Vad är optimistisk approach (optimistic concurrency control) och varför kan det vara att föredra? Vad är nackdelen? — Del 2 av 3: varför föredra (3)
||
- **Låsning kostar alltid** – lås ger overhead, och även rena läsningar som inte kan skada datan måste i regel låsa, fast låsning kanske bara behövs i värsta fallet
- **Låsningens baksidor** – lås kan leda till deadlock, och de kan inte släppas förrän transaktionen är slut, vilket kan dra ner samtidigheten rejält
- **Två saker gratis** – optimistisk kontroll slipper deadlocks helt, och dirty reads kan inte uppstå eftersom all läsning sker på bekräftade versioner

Vad är optimistisk approach (optimistic concurrency control) och varför kan det vara att föredra? Vad är nackdelen? — Del 3 av 3: nackdelen (2)
||
- **Arbete görs om** – går valideringen inte igenom avbryts transaktionen och en hel del arbete kan behöva göras om; det är priset för att inte ha låst från början
- **Svält** – den kan krocka på nytt varje gång den startas om och aldrig komma igenom valideringen, men boken säger att svält antagligen är sällsynt

Varför ska man välja tidsstämpelmetoden (time-stamp ordering) snarare än tvåfaslåsning (2PL)? (3)
||
- **Ingen deadlock** – det starkaste skälet: transaktioner väntar bara på tidigare transaktioner, så ingen cykel kan bildas i väntegrafen, och då behövs varken deadlockdetektering, timeout eller förebyggande
- **Bra för lästunga** – bokens raka svar är att tidsstämpelordning är bättre när transaktionerna mest läser, medan låsning är bättre när de mest uppdaterar
- **Slipper vänta** – vid konflikt avbryter tidsstämpelordning transaktionen direkt, medan låsning låter den vänta och kan behöva avbryta den senare ändå för att slippa deadlock

Strict two-phase locking, Timestamp ordering och optimistisk approach är tre varianter för schemaläggning av transaktioner. Beskriv och jämför dem. — Del 1 av 2: beskriv (3)
||
- **Strikt 2PL** – skaffar lås i en växande fas och släpper i en krympande, och håller alla lås till commit eller abort; vid konflikt får transaktionen vänta, en begäran avslås aldrig
- **Tidsstämpelordning** – varje transaktion får en tidsstämpel vid start som bestämmer ordningen i förväg, och varje operation valideras när den utförs; vid konflikt avbryts transaktionen direkt, eller får vänta på en tidigare
- **Optimistisk** – kör fritt utan lås i en arbetsfas med tentativa versioner, valideras vid commit mot överlappande transaktioner, och uppdaterar om den går igenom; vid konflikt avbryts den och arbetet görs om

Strict two-phase locking, Timestamp ordering och optimistisk approach är tre varianter för schemaläggning av transaktioner. Beskriv och jämför dem. — Del 2 av 2: jämför (3)
||
- **När ordningen bestäms** – 2PL bestämmer den dynamiskt efter åtkomstordningen, tidsstämpelordning statiskt vid start, och optimistisk först vid valideringen
- **Vid konflikt** – 2PL låter transaktionen vänta, tidsstämpelordning avbryter direkt, och optimistisk avbryter och gör om arbetet
- **Deadlock och val** – bara låsning kan hamna i deadlock; välj låsning vid mest skrivningar, tidsstämpelordning vid mest läsningar, och optimistisk när konflikter är sällsynta
<!--SR:!fsrs,2026-10-28T12:54:51.985Z,7,7.49448566,3.58131923,2,3,0,0,2026-10-21T12:54:51.985Z-->

## Kapitel 17 – Distribuerade transaktioner

Beskriv vilka extra problem som distribuerade transaktioner medför jämfört med lokala transaktioner. — Del 1 av 2: roten, atomicitet och serialiserbarhet (3)
||
- **Roten** – varje server sköter bara sina egna objekt, så ingen enskild server har hela bilden av en transaktion som rör objekt på flera servrar
- **Atomicitet** – antingen bekräftar alla inblandade servrar eller avbryter alla; ingen kan bestämma själv, så en server blir koordinator och det krävs ett atomiskt commit-protokoll för ett gemensamt beslut
- **Global serialiserbarhet** – varje server serialiserar sina egna objekt lokalt, men ordningen måste bli densamma på alla servrar, och lokala beslut kan ge olika ordning på olika servrar
<!--SR:!fsrs,2026-10-25T13:04:01.652Z,4,4.37161444,5.20002037,2,2,0,0,2026-10-21T13:04:01.652Z-->

Beskriv vilka extra problem som distribuerade transaktioner medför jämfört med lokala transaktioner. — Del 2 av 2: deadlock, identifierare och recovery (3)
||
- **Distribuerad deadlock** – det kan finnas en cykel i den globala väntegrafen som inte finns i någon enda lokal graf, så ingen server kan upptäcka den på egen hand
- **Globalt unika identifierare** – både transaktions-id och tidsstämplar måste fungera över servergränser, och servrarna måste vara överens om ordningen
- **Recovery blir svårare** – varje server har sin egen recovery-fil, och protokollets tillstånd måste överleva en krasch mitt i

Beskriv Two-Phase Commit (2PC). — Del 1 av 2: vad det är och fas 1 (3)
||
- **Vad 2PC är** – ett commit-protokoll i två faser som är byggt för att låta vilken deltagare som helst avbryta sin del; ett enfasprotokoll, där koordinatorn bara beordrar commit och upprepar, tillåter inte det
- **Fas 1, röstning** – koordinatorn skickar canCommit? till varje deltagare, som svarar Yes eller No; innan en deltagare röstar Yes sparar den sina ändrade objekt och sin status i permanent lagring
- **Prepared** – har man röstat Yes får man inte avbryta längre, därför måste man först säkra att man kan hålla ordet även om man kraschar och ersätts under tiden

Beskriv Two-Phase Commit (2PC). — Del 2 av 2: fas 2, det svaga stället och kostnaden (3)
||
- **Fas 2, genomförande** – koordinatorn samlar rösterna, sin egen medräknad; är alla Yes skickar den doCommit till alla, är minst en röst No skickar den doAbort till dem som röstade Yes, och en enda No räcker för att allt avbryts
- **Det svaga stället** – en deltagare som röstat Yes men inte fått svar är uncertain, kan inte avgöra själv och håller kvar sina lås; den frågar koordinatorn med getDecision, och har koordinatorn kraschat kan väntan bli lång
- **Kostnad** – går allt bra kostar protokollet 3N meddelanden och tre rundor; timeouts finns vid varje steg där någon kan blockera, men ingen tidsgräns finns för när det blir klart

Hierarkisk kontra flat Two-Phase Commit: beskriv och förklara. — Del 1 av 2: de två varianterna (3)
||
- **Hierarkiskt** – protokollet blir flernivåigt: koordinatorn frågar bara sina närmaste barn, som skickar canCommit? vidare ner i trädet, och varje deltagare samlar in sina efterkommandes svar innan den svarar sin egen förälder
- **Flat** – koordinatorn skickar canCommit? direkt till alla deltagare i listan över provisoriskt bekräftade subtransaktioner, utan att gå via trädet
- **Ramen** – båda är sätt att köra fas 1 av 2PC för en nästlad transaktion; toppnivån är koordinator och deltagarna är de subtransaktioner som bekräftat provisoriskt utan någon avbruten förfader, och fas 2 är identisk i båda

Hierarkisk kontra flat Two-Phase Commit: beskriv och förklara. — Del 2 av 2: abortList och avvägningen (2)
||
- **Varför flat behöver abortList** – en och samma server kan vara koordinator för både provisoriskt bekräftade och avbrutna subtransaktioner, och lokalt ser de likadana ut, så utan en lista över de avbrutna skulle servern bekräfta en subtransaktion vars förälder har avbrutit
- **Avvägningen** – hierarkiskt slipper abortList men skickar meddelanden ner och upp genom trädet i steg, medan flat bär kunskapen i abortList och koordinatorn når alla direkt; Moss föredrog den flata av det skälet

Hur gör man recovery från Two-Phase Commit vid nod- eller nätverksfel? (3)
||
- **Grunden** – varje server har sin egen recovery-fil på disk och håller objekten i flyktigt minne; innan en deltagare röstar Yes måste prepared vara skrivet, rösten skrivs som uncertain med en tvingad skrivning, och i fas 2 skrivs committed eller aborted
- **Avgörandet** – efter kraschen avgör den senaste statusposten i loggen vad som gällde när felet inträffade, och sedan beror åtgärden på serverns roll och den statusen
- **Åtgärden** – koordinator med prepared har inget beslut fattat och avbryter och meddelar alla; koordinator med committed skickar doCommit igen; deltagare med uncertain frågar koordinatorn med getDecision; deltagare med prepared har inte röstat och får avbryta
<!--SR:!fsrs,2026-10-20T15:43:03.102Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-19T15:43:03.102Z-->
