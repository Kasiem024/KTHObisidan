---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-10-02
updated: 2026-10-02
description: "Flashcards för tentafrågorna i HI1031. Varje kort ger frågan och ett koncist men fullständigt svar, som stöd för den muntliga examinationen. Samma kort finns också i respektive kapitels svarsnot."
---

# HI1031 Tentafrågor - Snabbsvar

Frågeraden är tentafrågan och svaret är ett koncist men fullständigt svar på den, sammanfattat ur
kapitlets svarsnot. Samma kort ligger också sist i varje frågesektion i `HI1031 Tentafrågor och Svar -
Kap NN`, så den här filen är en samlad kopia.

## Kapitel 1 – Distribuerade system

Ge några exempel på distribuerade system. (4)
||
- **Vardagstjänster vi tar för givna** – webben, webbsök, e-post, sociala nätverk och e-handel
- **Bokens tre genomgångna exempel** – webbsök, onlinespel med många spelare, och finanshandel
- **Spannet, det frågan egentligen är ute efter** – från ett system i en bil till globala system med miljoner noder, från små sensorer till kraftfulla datorer
- **Trenderna** – mobilt och ubiquitous, distribuerad multimedia, och molnet som en tjänst man köper i stället för att äga

Ange 5 hårdvaruresurser som är värda att dela. (3)
||
- **De fem** – skrivare, diskar, processorer, videoströmmen från en digitalkamera och ljudförbindelsen i ett mobilsamtal
- **Varför hårdvara delas** – för att spara pengar; flera användare samsas om samma dyra pryl
- **Brasklappen** – boken har ingen färdig lista på fem plus fem, så säg att du sorterar bokens egna exempel

Ange 5 mjukvaruresurser som är värda att dela. (3)
||
- **De fem** – filer, webbsidor, databaser, sökmotorer och en valutaomvandlare
- **Varför mjukvara delas** – för att folk ska kunna jobba ihop; de vill dela datan, inte disken den ligger på
- **Som en tjänst** – man använder en sökmotor eller valutaomvandlare utan att bry sig om vilken server som kör den

Vilka utmaningar finns med att bygga ett distribuerat system? Boken har åtta; de fyra första. (4)
||
- **Heterogenitet** – nät, hårdvara, operativsystem, språk och olika utvecklare varierar; middleware är lagret som döljer skillnaderna
- **Öppenhet** – om systemet går att bygga ut och göra om, vilket kräver att de viktiga gränssnitten publiceras
- **Säkerhet** – konfidentialitet, integritet och tillgänglighet; överbelastningsattacker och säkerheten hos mobil kod är ännu olösta
- **Skalbarhet** – systemet fortsätter fungera bra när antalet resurser och användare ökar mycket, till exempel genom att decentralisera för att undvika flaskhalsar

Vilka utmaningar finns med att bygga ett distribuerat system? Boken har åtta; de fyra sista. (4)
||
- **Felhantering** – det svåra är att felen är partiella; teknikerna är upptäcka, maskera, tolerera, återhämta och redundans
- **Samtidighet** – flera klienter vill åt samma resurs samtidigt och kan krocka, som två auktionsbud som skriver över varandra
- **Transparens** – dölja att delarna är åtskilda; access och location är de två viktigaste
- **Tjänstekvalitet** – tillförlitlighet, säkerhet, prestanda och anpassningsförmåga, där prestanda betyder att hålla tidsgränser

Vilka arv från IP, HTTP och HTML måste man ta hänsyn till? (3)
||
- **Från HTML** – byggdelarna är fasta och kopplade till hur saken ska visas, så man kan bara bläddra; därför behövs XML, som beskriver sig självt
- **Från HTTP** – de två tyngsta: en resurs per fråga, där nio bilder ger tio frågor, och öppet för alla som standard, så åtkomstkontroll måste läggas till
- **Från IP** – 32-bitarsadresserna valdes i slutet av 1970-talet och håller på att ta slut; bytet till 128 bitar kräver ändringar i massor av mjukvara

Vilka arv från HTTP måste man ta hänsyn till? (4)
||
- **Få metoder** – klienten frågar med en URL och servern svarar med innehållet eller ett fel; mest GET för att hämta och POST för att lämna data
- **Innehållstyper** – servern anger typen som en MIME-typ så att webbläsaren vet hur svaret ska hanteras
- **En resurs per fråga** – en sida med nio bilder ger tio frågor, så webbläsare frågar parallellt för att korta väntan
- **Öppet som standard** – vem som helst når en publicerad resurs; vill man begränsa måste servern ställas in att skicka en utmaning, till exempel ett lösenord

Vilken roll har IP och RFC för distribuerade system? (3)
||
- **IP är tekniken** – ett gemensamt sätt att prata som döljer skillnaderna mellan näten, eftersom alla datorer kör internetprotokollen; det är därför heterogenitet går att hantera alls
- **RFC är spelregeln** – öppenhet kräver att gränssnitten publiceras; protokollen kom som numrerade RFC i början av 1980-talet och gick medvetet förbi de tröga standardiseringsprocesserna
- **Webben är beviset** – den kunde byggas ovanpå utan att någon behövde ändra i internet

## Kapitel 2 – Arkitektur

Beskriv hur en trelagersarkitektur är uppbyggd. (4)
||
- **De tre delarna** – presentationslogik (samspelet med användaren och vyn), applikationslogik (själva programmets logik, även kallad affärslogik) och datalogik (den varaktiga lagringen, oftast en databas)
- **En server per del** – en-till-en: skikt 1 är klientens vy, skikt 2 en applikationsserver, skikt 3 en databasserver
- **Vinsten** – applikationslogiken samlas på ett ställe, så det blir lättare att underhålla; och skikt 1 kan vara ett rent gränssnitt, vilket ger tunna klienter
- **Priset mot tvåskikt** – tre servrar att sköta i stället för två, och mer nättrafik och högre fördröjning per operation

Beskriv hur en MVC-arkitektur är uppbyggd. (4)
||
- **De tre delarna** – Model (datan, reglerna och tillståndet, vet inget om gränssnittet), View (läser ur modellen och visar den) och Controller (tar inmatning och översätter den till operationer på modellen)
- **Flödet** – användaren agerar i vyn, controllern tolkar, modellen uppdateras och säger till att den ändrats, och vyn ritar om sig
- **Poängen** – presentationen skiljs från datan, så flera vyer kan visa samma modell och modellen kan testas helt utan gränssnitt
- **Står inte i boken** – svaret är allmän kunskap om mönstret, inte bokens text; säg det rakt ut om du pressas på var det står

Vad är Middleware?::Ett lager av mjukvara som ==döljer heterogenitet== och ger programmeraren en bekväm programmeringsmodell; det sitter ovanpå operativsystemet och under tillämpningarna.

Vad är fördelarna med en klient/server-lösning? (4)
||
- **Kärnfördelen** – ett direkt och enkelt sätt att dela data och resurser: klienten frågar, servern sköter resursen och svarar; det är därför boken kallar den sin mest använda arkitektur
- **Går att bygga i lager** – en server kan själv vara klient: en webbserver är klient hos filservern och hos DNS, och en söktjänst är både server och klient
- **Går att förbättra med placering** – flera servrar med uppdelning eller replikering, caching i proxyservrar, och mobil kod för bra svarstider
- **Men den skalar dåligt** – en tjänst på en enda adress kan inte växa förbi värddatorns kapacitet och bandbredd; det är därför peer-to-peer finns

Vad är en mobil agent?::Ett ==körande program med både kod och data== som reser mellan datorer, gör många lokala anrop i stället för fjärranrop och kommer tillbaka med resultatet; boken tvivlar på nyttan, för vanliga fjärranrop räcker ofta.

## Kapitel 4 – Interprocess Communication (IPC)

På vilka sätt kan man karakterisera ett IPC-anrop? (4)
||
- **Synkront eller asynkront** – synkront blockerar både send och receive, asynkront har en icke-blockerande send som fortsätter så snart meddelandet kopierats till en buffert; med trådar har blockerande receive inga nackdelar, så det är det vanliga valet
- **Destinationen** – meddelandet går till ett par av internetadress och port, där en port har exakt en mottagare men kan ha många sändare
- **Tillförlitligheten** – giltighet, att meddelanden kommer fram trots en del tappade paket, och integritet, att de kommer fram hela och utan dubbletter
- **Ordningen** – vissa tillämpningar kräver sändarordning, och för dem räknas fel ordning som ett fel

Beskriv vad XML är. (3)
||
- **Vad det är** – ett märkspråk från W3C, alltså en textbaserad kodning som beskriver både en text och dess struktur
- **Mot HTML** – XML:s taggar beskriver den logiska strukturen medan HTML:s säger hur webbläsaren ska visa texten, och XML är extensible så du får hitta på egna taggar
- **Självbeskrivande** – så att tillämpningar som inte känner varandra i förväg kan läsa det, och namnrymder gör att flera uppsättningar taggar kan samsas utan krockar

Vad kan XML användas till, och vad kostar det? (2)
||
- **Används till** – webbtjänster och SOAP i första hand, sedan arkivering och återsökning, specifikation av användargränssnitt och kodning av konfigurationsfiler
- **Priset** – text med taggar ger stora meddelanden som tar längre tid att bearbeta och skicka och kräver mer lagring, men HTTP 1.1 kan komprimera

Beskriv tre olika typer av IPC. UDP och TCP. (3)
||
- **De tre** – UDP-datagram, TCP-strömmar och multicast
- **UDP-datagram** – enskilda meddelanden utan bekräftelse och utan omsändning, så felmodellen är utelämnandefel och leverans i fel ordning; DNS och Voice over IP använder det just för att slippa omkostnaderna för garanterad leverans
- **TCP-strömmar** – en tvåvägsström av bytes utan meddelandegränser, som döljer storlekar, tappade meddelanden, flödeskontroll och ordning; man kopplar upp först med connect och accept och sedan bara läser och skriver i strömmen

Beskriv tre olika typer av IPC. TCP:s begränsning och multicast. (2)
||
- **TCP är inte tillförlitlig kommunikation** – passerar paketförlusten en gräns förklarar TCP förbindelsen bruten, och då kan processen varken skilja ett nätfel från att den andra processen dött eller veta om det den nyss skickade kom fram
- **Multicast** – ett enda meddelande från en process till varje medlem i en grupp, normalt med medlemskapet transparent för sändaren; IP multicast byggs ovanpå IP och nås på programmeringsnivå bara via UDP

Är det bra att en port kan ha flera mottagare? Lägg upp argumentet. (3)
||
- **Räta ut premissen** – normalt har en port en mottagare men många sändare och processer kan inte dela en port; undantaget är IP multicast, där en kopia går till alla lokala sockets som gått med, så frågan gäller multicast
- **Ja** – det ger feltolerans med replikerade tjänster, tjänsteupptäckt i spontana nät, bättre prestanda med replikerad data, och spridning av händelsenotifieringar
- **Men** – IP multicast är otillförlitlig med samma utelämnandefel som UDP, så några men inte alla får meddelandet, och tappas ett datagram mellan två routrar får ingen bortom den det

En port med flera mottagare: utveckla varför svaret beror på användningen. (2)
||
- **Beror på bruket** – replikerade tjänster är hårda fallet, för alla eller ingen måste få varje förfrågan och oftast i samma ordning, annars blir en server inkonsistent; tjänsteupptäckt är lätta fallet, för förfrågningar skickas med jämna mellanrum så en enstaka förlust gör inget
- **Vad som behövs** – starkare garantier ovanpå: tillförlitlig multicast, där alla eller ingen tar emot, och totalt ordnad multicast, där alla får meddelandena i samma ordning

Vilka är likheterna mellan IPC och distribuerade objekt? (3)
||
- **Relationen** – de är inte alternativ utan lager: IPC är det undre middleware-lagret och distribuerade objekt byggs ovanpå det
- **Allt blir bytes** – båda måste marshalla, alltså platta data till en byte-sekvens och bygga upp den igen, och båda sköter byteordning och teckenkodning
- **Request-reply** – båda bygger på att skicka en förfrågan och vänta på svar, och kan ge at-least-once och at-most-once

Vilka är skillnaderna mellan IPC och distribuerade objekt? (3)
||
- **Abstraktion och adress** – IPC är meddelandeöverföring med send och receive på bytes och adresseras med internetadress och port, distribuerade objekt ger metodanrop där detaljerna döljs och adresseras med en fjärrobjektreferens som är unik i tid och rum
- **Inkapsling** – att klient och server ligger i olika processer gör att tillståndet bara nås via objektets metoder, och eftersom allt går via metoder kan olika platser dessutom använda olika dataformat obemärkt
- **Parametrar** – du kan skicka en objektreferens i stället för värdet, vilket vinner när parametern är stor, för då når mottagaren objektet med ett nytt anrop i stället för att hela värdet går över nätet

Vad vinner man på virtualisering - nätverksvirtualisering? (3)
||
- **Vad det är** – många virtuella nät ovanpå ett befintligt nät som internet, vart och ett med egen adressering, egna protokoll och egen routing och utformat för en bestämd tillämpning
- **Varför det behövs** – man kan inte ändra internetprotokollen för allas skull eftersom det som hjälper en tillämpning skadar en annan, och ett tillämpningsspecifikt nät antyder en väg runt problemet i Saltzers end-to-end-argument
- **Overlays** – ett overlay ger nya tjänster utan att ändra nätet under, uppmuntrar experiment och låter flera samexistera, men kostar ett extra lager indirektion och mer komplexitet

Vad vinner man på virtualisering - systemvirtualisering? (2)
||
- **Vad det är** – flera virtuella maskiner på en fysisk maskin, där varje maskin kör sitt eget operativsystem, styrda av en hypervisor
- **Vinsten** – mot processer ger det säkerhet, ren uppdelning och exakt debitering, och maskiner kan migreras enkelt vilket sänker hårdvara och energi och möjliggör infrastructure as a service

## Kapitel 5 – Distribuerade objekt

Beskriv generellt hur distribuerade objekt fungerar. (3)
||
- **Modellen** – tillståndet är redan uppdelat per objekt, så det är ett litet steg att lägga objekten i olika processer; vanligast är klient-server där servern håller objekten och klienten anropar metoderna, och anrop kan bilda kedjor
- **De två bärande begreppen** – fjärrobjektreferens, ett id som funkar i hela systemet och kan skickas som argument och resultat, och fjärrgränssnitt, som anger vilka metoder som får anropas på distans
- **Fabriksmetoder** – fjärrgränssnittet har ingen konstruktor så man kan inte skapa objekt med ett fjärranrop, därför finns fabriksmetoder vars jobb är just att skapa objekt

Beskriv speciellt hur RMI fungerar. (3)
||
- **Kedjan** – proxyn hos klienten låtsas vara objektet och packar referens, operationId och argument i en förfrågan, dispatchern hos servern väljer metod med operationId, skelettet packar upp och anropar servanten som har koden och tillståndet, och svaret går tillbaka samma väg
- **Automatiskt** – proxy, dispatcher och skelett genereras av en gränssnittskompilator, medan kommunikationsmodulerna på båda sidor kör request-reply och ger anropssemantiken som at-most-once
- **Java RMI** – samma syntax som ett lokalt anrop men anroparen vet att det är distribuerat, och fjärrobjekt skickas som referens medan andra objekt kopieras och skickas som värde

När är ren socket-kommunikation bättre än distribuerade objekt? (3)
||
- **Ramen** – en avvägning mellan kontroll och omkostnad: request-reply är lättviktigt och minimalt och används där omkostnaderna måste hållas nere, boken nämner inbyggda system
- **Vad man sparar** – tre TCP-omkostnader man slipper över UDP: bekräftelser, eftersom svaret bekräftar förfrågan, förbindelseuppsättning, som kostar två extra par meddelanden, och flödeskontroll, onödig för små argument
- **Exemplet** – Sun NFS skickar filblock av fast storlek och har idempotenta operationer, så det klarar sig utan historik och kör ett eget effektivare protokoll över UDP

När är distribuerade objekt bättre än rena sockets? (3)
||
- **Uttryckskraften** – de gör det lättare att skriva stora, krångliga program, för man får hela objektmodellen med klasser och arv och kan skicka en objektreferens i stället för ett stort värde så mottagaren anropar objektet i stället för att allt går över nätet
- **Priset alltid** – fjärranrop är känsligare för fel än lokala, och man kan inte skilja ett nätfel från att serverprocessen dött
- **Latensen** – den är flera storleksordningar högre, vilket antyder att man bör minimera antalet fjärranrop

Jämför sockets, RPC, RMI och webbtjänster: ram, abstraktion, namngivning. (3)
||
- **Rama in** – de är lager, inte alternativ: sockets underst, RPC och RMI byggs med sockets över request-reply, och webbtjänster ligger ovanpå HTTP som självt är request-reply
- **Abstraktion** – sockets ger byte-sekvenser, RPC en procedur som om den vore lokal, RMI en metod på ett objekt, och en webbtjänst operationer på en resurs som pekas ut av en URI
- **Namngivning** – sockets använder internetadress och port, RMI en fjärrobjektreferens som kan skickas som parameter, och en webbtjänst en URI, oftast en URL som kallas endpoint

Jämför sockets, RPC, RMI och webbtjänster: gränssnitt, semantik, brandväggar. (3)
||
- **Gränssnitt och dataformat** – sockets beskrivs inte alls och du marshallar själv, RPC och RMI använder ett IDL och binärt format, och en webbtjänst använder WSDL och XML paketerat med SOAP, som är skrymmande men läsbart
- **Anropssemantik** – lokalt gäller exactly once, på distans väljer man maybe, en gång eller inte alls, at-least-once, som kan köra om proceduren och därför bara passar idempotenta operationer, eller at-most-once, som ger exakt en gång
- **Brandväggar** – Java RMI:s och CORBAs transport kommer normalt inte igenom en brandvägg men HTTP och SMTP gör det, så SOAP transporteras över dem och webbtjänster fungerar mellan organisationer där RMI och CORBA inte gör det

Vilka är likheterna mellan distribuerade objekt och webbtjänster? (2)
||
- **Ytlig likhet** – på ytan är de lika: där RMI använder en fjärrobjektreferens använder webbtjänsten en URI för att anropa en operation i den resurs URI:n pekar ut
- **Vad de delar** – båda bygger på programmering mot gränssnitt, vilket ger lös koppling och döljer språk och plattform, och båda kan gömma marshallingen bakom en proxy

Vilka är skillnaderna mellan distribuerade objekt och webbtjänster? (3)
||
- **Kärnskillnaden** – en webbtjänst kan inte skapa fjärrobjekt och returnera referenser till dem som objektmodellen kan, så en webbtjänst är i praktiken ett enda fjärrobjekt och både skräpsamling och fjärrobjektreferenser blir irrelevanta
- **Följderna** – newShape är inte längre en fabriksmetod, det finns inga servanter, och fjärrreferenser får inte skickas som argument eller returneras
- **Paradigm och transparens** – webbtjänster är oberoende av programmeringsparadigm medan distribuerade objekt vill att du gör på ett bestämt sätt, och webbtjänster ger ingen transparens, i enklaste fallet läser och skriver man direkt i SOAP och XML

## Kapitel 6 – Indirekt kommunikation

Beskriv poängen med indirekt kommunikation och strategierna. (4)
||
- **Vad det är** – kommunikation genom en mellanhand, utan direkt koppling mellan sändare och mottagare, ofta en-till-många
- **Poängen** – direkt koppling gör systemet stelt; i stället får man rumslig frikoppling, ingen behöver veta vem den andra är, och tidsmässig frikoppling, de behöver inte finnas samtidigt
- **Priset** – det kostar alltid lite prestanda och gör systemet svårare att förvalta, och man får inte båda frikopplingarna automatiskt
- **Strategierna** – gruppkommunikation, publish-subscribe och message queues bygger på meddelanden, medan distribuerat delat minne och tuple spaces är en delad datayta som skalar sämre

Beskriv gruppkommunikation. (3)
||
- **Vad det är** – ett meddelande skickas till en grupp och levereras till alla medlemmar, utan att sändaren vet vilka de är
- **Abstraktion ovanpå multicast** – byggd på IP-multicast eller overlay och lägger till medlemskapshantering, feldetektering och garantier; boken säger att den är till IP-multicast vad TCP är till IP
- **Modellen** – processer går med eller lämnar, och sändaren gör ett enda multicast-anrop i stället för många send, vilket ger garantier för gruppen som helhet

Hur implementeras gruppkommunikation? (4)
||
- **Tillförlitlighet** – integritet, samma meddelande högst en gång, giltighet, det levereras så småningom, och överenskommelse, får en medlem det så får alla det
- **Ordning** – FIFO som är källordning, kausal som bevarar händer-före, och total där alla ser samma ordning
- **Medlemskap** – en tjänst som sköter medlemskapsändringar, feldetektering som utesluter den misstänkte, notifiering och gruppadressexpansion
- **Följden** – medlemskapshanteringen gör att gruppkommunikation passar bäst i små, statiska system och fungerar sämre storskaligt

Beskriv publish-subscribe och visa hur det kan implementeras. (3)
||
- **Vad det är** – publishers publicerar händelser, subscribers anmäler intresse med subscriptions som är mönster, och systemet matchar och levererar notifieringar; i grunden en-till-många
- **Hur man prenumererar** – subskriptionsmodellen bestämmer uttryckskraften: kanalbaserad, topic-baserad, innehållsbaserad och typbaserad, i stigande ordning av kraft och svårighet
- **Hur det byggs** – mäklaren kan sitta centralt, vilket är enkelt men ger flaskhals och enda felpunkt, som ett nätverk av samarbetande mäklare, eller helt peer-to-peer där alla noder är mäklare

Beskriv message queuing. (3)
||
- **Vad det är** – en punkt-till-punkt-tjänst där sändaren lägger meddelandet i en kö och en enda process plockar bort det
- **Den avgörande egenskapen** – meddelandena är persistenta: kön lagrar dem tills de konsumeras och skriver dem till disk
- **Vad persistensen ger** – giltighet, meddelandet tas emot så småningom, och integritet, det är identiskt och kommer aldrig två gånger, men inget om när leveransen sker

Hur implementeras message queuing på ett bra sätt? (3)
||
- **Problemet** – en central köhanterare blir en tungviktig komponent, en flaskhals och en enda felpunkt
- **Lösningen** – federera köhanterarna med enkelriktade message channels och routingtabeller, så man kan bygga godtyckliga topologier
- **Hub-and-spoke** – klienten pratar RPC med en spoke nära sig och blockeras bara tills meddelandet ligger där, medan hoppet vidare till hubben är asynkront men garanterat tillförlitligt

Jämför gruppkommunikation, publish-subscribe och message queues ur sändarens perspektiv. (3)
||
- **Gruppkommunikation** – ett multicast till gruppen; sändaren vet inget om medlemmarna och måste själv vara medlem om gruppen är sluten
- **Publish-subscribe** – en strukturerad händelse; sändaren kan inte veta om någon lyssnar
- **Message queuing** – meddelandet läggs i en namngiven kö; sändaren vet att exakt en konsument tar det, och sändningen kan ligga i en transaktion

Jämför gruppkommunikation, publish-subscribe och message queues ur mottagarens perspektiv. (3)
||
- **Gruppkommunikation** – medlemmen får allt som skickas till gruppen utan filtrering och måste normalt finnas när meddelandet skickas
- **Publish-subscribe** – subscribern väljer själv med ett filter: kanal, topic, innehåll eller typ
- **Message queuing** – konsumenten konkurrerar med andra om samma kö, kan välja på metadata och hämta långt efteråt; bara här finns valet att blockera, polla eller bli notifierad

Jämför gruppkommunikation, publish-subscribe och message queues ur implementatörens perspektiv. (3)
||
- **Gruppkommunikation** – svårast är gruppmedlemskapet, alltså vilka som är med, feldetektering, notifiering och adressexpansion, plus ordning, och det begränsar skalbarheten
- **Publish-subscribe** – svårast är matchning och routing: central mäklare, nätverk av mäklare eller peer-to-peer
- **Message queuing** – svårast är persistensen och topologin: meddelandena måste till disk, och köhanterarna bör federeras i stället för att sitta centralt

## Kapitel 9 – Webbtjänster

Vad är en webbtjänst, när används den, och vilka protokoll finns? (3)
||
- **Vad och varför** – en samling operationer som nås över internet via en URI med meddelanden i XML; den kan inte nås direkt av en webbläsare, eftersom webbläsaren är en för allmän klient och poängen är specialiserade gränssnitt
- **När** – mellan organisationer utan människa i loopen, och för att kombinera flera tjänster till en ny; HTTP och SMTP släpps normalt genom brandväggar medan RMI och CORBA inte gör det
- **Protokoll** – XML som dataformat, SOAP som packar meddelanden till request-reply, REST som alternativet till SOAP, och WSDL som tjänstebeskrivning vilket gör en separat namntjänst onödig

Vad innebär låg koppling för en webbtjänst? (4)
||
- **Grundbetydelsen** – att hålla beroendena mellan tjänster så små som möjligt, så att en ändring i en tjänst inte välter de andra
- **Programmering mot gränssnitt** – skilja gränssnittet från implementationen, vilket ger låg koppling och hanterar olika språk och plattformar
- **Enkla, generella gränssnitt** – minimala gränssnitt som webben och REST minskar beroendet av specifika operationsnamn, så data blir viktigare än operation
- **Valet av paradigm** – i request-reply är parterna kopplade, medan asynkrona meddelanden ger synkroniseringsfrikoppling så avsändaren inte behöver vänta

Vad är REST och vilka principer ska en RESTful tjänst uppfylla? (3)
||
- **Vad REST är** – en arkitekturstil från Fieldings avhandling, varken ett protokoll eller en standard; boken beskriver den som URL:er plus GET, PUT, DELETE och POST mot resurser, med tyngdpunkt på data i stället för gränssnitt
- **De sex principerna** – likformigt gränssnitt, klient-server, tillståndslöshet, cachebarhet, skiktat system, och kod på begäran som är valfri
- **Två källor** – boken beskriver REST som HTTP med fyra metoder, medan restfulapi.net säger att REST inte är bundet till HTTP och att Fielding aldrig band stilen till ett protokoll

Hur accessas resurser i REST och vilken roll har hypermedia? (3)
||
- **Hur resurser nås** – via en resursidentifierare, alltså en URI; det man får är en representation av resursens tillstånd, bestående av data, metadata och hypermedialänkar
- **Resurs mot representation** – resurs och representation är skilda saker, så samma resurs kan levereras i olika format som JSON, XML eller HTML
- **Hypermedia och HATEOAS** – klienten får bara resursens första URI och driver sedan allt vidare via länkar som servern lämnar i svaren; följer klienten en väg den inte fick i svaren är kravet inte uppfyllt

Jämför distribuerade objekt (RMI) med webbtjänster (REST). (4)
||
- **Börja med** – ytligt är de lika: klienten anropar en operation, med en fjärrobjektreferens i RMI och en URI i en webbtjänst
- **Kärnskillnaden** – en webbtjänst är i praktiken ett enda fjärrobjekt: den kan inte skapa nya fjärrobjekt och har inga servanter, så skräpsamling och fjärrreferenser blir irrelevanta
- **Två principskillnader** – webbtjänster är medvetet paradigmoberoende, och de ger ingen transparens på köpet: marshalling och känslan av ett lokalt anrop får läggas till med proxy eller dynamisk invokering
- **Avvägningen** – priset är prestanda, för XML är text, och en studie boken refererar mätte SOAP mot CORBA som mycket större och långsammare; vinsten är global räckvidd, bara DNS behövs och HTTP går genom brandväggar

Vad innebär SOA (Service-Oriented Architecture)? (4)
||
- **Definitionen** – en uppsättning designprinciper: bygg systemet av löst kopplade tjänster som kan upptäckas dynamiskt och antingen prata direkt med varandra eller koordineras genom koreografi
- **Hur det byggs** – abstrakt, går att bygga med distribuerade objekt eller komponenter, men huvudsakligen med webbtjänster just för deras låga koppling
- **Var det används** – ger flexibilitet och interoperabilitet internt, men den främsta användningen är på det bredare internet
- **Resultatet** – B2B-integration, där en organisation kör CORBA internt och en annan .NET men båda exponerar webbtjänster, och en mashup-kultur där en tredje part kombinerar flera tjänster till en ny

Förklara relationen mellan Ajax och webbtjänster. (4)
||
- **Vad Ajax är** – en utbyggnad av webbens klient-serversamspel som skickar små databitar mellan Javascript i webbläsaren och ett serverprogram, så man slipper hämta en hel sida och blockera användaren
- **Bryggan** – båda tar sig runt begränsningen i webbläsarens vanliga samspel, och båda gör det över HTTP med XML: Ajax för att webbläsaren är för klumpig, webbtjänster för att den är för allmän
- **Hur de kompletterar** – Ajax är kommunikation mellan skikt 1, gränssnittet, och skikt 2, logiken, och backend som Ajax-anropet träffar kan i sin tur vara en webbtjänst
- **Markeringen** – boken kopplar dem aldrig själv; Ajax beskrivs i kapitel 2, inte i kapitel 9

## Kapitel 10 – Peer-to-Peer (P2P)

Vad skiljer P2P från klient-server? (3)
||
- **Målet** – dela data och resurser i mycket stor skala utan servrar som måste skötas var för sig
- **Klient-server** – resurserna ligger på en server eller ett litet kluster; få beslut behövs, men skalan begränsas av serverns kapacitet och nätanslutning
- **P2P** – resurserna ligger spritt över nätet, alla noder har samma förmåga och ansvar, varje användare bidrar, och driften beror inte på något centralt system

Vilka är P2P:s viktigaste fördelar och nackdelar? (4)
||
- **Fördelarna** – utnyttjar oanvända resurser, skalar med bra lastbalansering, och självorganiserar så supportkostnaden i stort är oberoende av antalet deltagare
- **Nackdel: data** – föränderlig data är dyr att lagra jämfört med en betrodd central tjänst, och anonymiteten har aldrig blivit starka garantier
- **Nackdel: volatilitet** – ägarna lovar inte att hålla sina datorer påslagna, anslutna och felfria, så tillgängligheten är oförutsägbar
- **Vändningen** – just den replikering volatiliteten tvingar fram ger också motstånd mot manipulation från illvilliga noder

I vilka situationer och för vilken data passar P2P? (3)
||
- **Datatypen** – oföränderliga filer som musik och video; GUID:et är en säker hash av innehållet, så en ändring ger ett annat GUID
- **Varför det funkar** – hashen gör filen självcertifierande: mottagaren räknar om den och ser att den stämmer, vilket skyddar mot manipulation från obetrodda noder
- **Situationen** – stor skala där ingen enskild fil är kritisk; musikfiler uppdateras aldrig, och en onåbar fil kan hämtas senare

Varför har P2P kopplats samman med piratkopiering och upphovsrätt? (3)
||
- **Napster** – arkitekturen hade centrala index, men användarna tillhandahöll filerna, som låg på deras egna datorer
- **Argumentet som föll** – utvecklarna hävdade att de inte deltog i kopieringen, men indexservrarna bedömdes vara en väsentlig del av processen
- **Följden** – indexservrarna låg på välkända adresser, så operatörerna kunde inte vara anonyma och kunde stämmas; en helt distribuerad tjänst hade spritt ansvaret över alla

Vilka icke-funktionella krav ställs på ett P2P-system? (2)
||
- **Tre för att systemet är stort** – global skalbarhet till miljoner objekt, lastbalansering med slumpmässig placering plus repliker av det hårt använda, och optimering för lokala interaktioner så resurser läggs nära dem som använder dem
- **Tre för att datorerna varken ägs eller litas på** – anpassning till att noder ansluter och lämnar fritt, säkerhet med autentisering och kryptering när värdarna har olika ägare, och anonymitet, förnekbarhet och censurmotstånd

Vad är en routing overlay och hur hittar den en resurs? (3)
||
- **Grundproblemet** – ingen kan hålla hela katalogen över var allt finns, så kunskapen partitioneras och sprids över noderna, med hög replikering
- **Vad den är** – en distribuerad algoritm, ett lager i mellanprogrammet som rutar en förfrågan från klienten till en värd som har objektet; den rutar i applikationslagret, skilt från IP-rutningen
- **Hur den hittar** – klienten skickar objektets GUID till överlägget, som rutar förfrågan vidare till närmaste levande nod som har en kopia

Vad är skillnaden mellan strukturerade och ostrukturerade P2P-system? (4)
||
- **Strukturerat** – en DHT där GUID:et bestämmer placeringen: objektet läggs på noden vars GUID är närmast, och sökningen sker med prefixrutning som matchar en siffra mer av målet per hopp
- **Ostrukturerat** – ingen kontroll över topologi eller placering; nätet byggs ad hoc av lokala regler och man hittar objekt genom att fråga sig fram genom grannarna, sannolikhetsbaserat och utan garantier
- **Avvägningen** – strukturerat garanterar att objektet hittas och ger tidsgränser men kräver dyrt underhåll av strukturen; ostrukturerat är tåligt mot nodfel men kan flöda nätet med förfrågningar
- **Det som förvånar** – ostrukturerat dominerar ändå på Internet, till exempel BitTorrent

Vad är skillnaden mellan IP och P2P-routning på applikationsnivå? (4)
||
- **Ramen** – överlägget ersätter inte IP utan ligger ovanpå: varje hopp går normalt över UDP, och ett överläggshopp kan kräva många IP-hopp
- **Skarpaste skillnaden** – målidentifiering: en IP-adress pekar på exakt en nod, medan överlägget rutar till närmaste replik av ett objekt
- **Mest praktiska** – nätdynamik: IP:s tabeller uppdateras på timskala, överläggets på bråkdelar av en sekund, så det klarar ett nät som ändras hela tiden
- **Övriga axlar** – platt GUID-rymd mot hierarkisk IP, slumpad placering ger lastbalansering, n-faldig replikering av rutter ger feltolerans, och säkerhet och viss anonymitet går även med begränsad tillit

## Kapitel 11 – Säkerhet

Vilka är de viktigaste hoten och attackerna som ett distribuerat system måste skyddas mot? (3)
||
- **Varför** – det är delningen av resurser som skapar problemet; det som inte delas kan skyddas genom att stängas av från nätet
- **Tre hotklasser** – läckage, att obehöriga får information, manipulation, obehörig ändring, och vandalisering, att störa systemet utan egen vinst
- **Fem attackmetoder** – avlyssning, maskering, meddelandemanipulation, uppspelning och överbelastning

Vilken roll har kryptering för säkerhet, utöver att dölja innehållet? (4)
||
- **Konfidentialitet** – bara den som har motsvarande dekrypteringsnyckel kan läsa, och det håller så länge nyckeln inte är röjd
- **Integritet** – fås inte gratis: det krävs att redundant information som en checksumma läggs in och kontrolleras, annars märks inte en ändring
- **Autentisering** – lyckas man dekryptera med en nyckel som bara två parter känner, så vet man vem avsändaren är
- **Oförnekbarhet** – avsändaren kan inte förneka att han deltog; det uppnås med en digital signatur som intygar meddelandet för tredje part

Hur fungerar symmetrisk, asymmetrisk och hybridkryptering? (3)
||
- **Symmetrisk** – samma nyckel krypterar och dekrypterar; bygger på envägsfunktioner, och styrkan sitter i nyckellängden eftersom bästa attacken är att prova alla nycklar
- **Asymmetrisk** – olika nycklar för kryptering och dekryptering; bygger på fälldörrsfunktioner, för RSA två stora primtal vars produkt inte går att faktorisera tillbaka
- **Hybrid** – asymmetrisk kryptering autentiserar parterna och byter en hemlig nyckel, sedan sköter den symmetriska nyckeln all vidare trafik, som i TLS

I vilka situationer används symmetrisk, asymmetrisk och hybridkryptering? (3)
||
- **Symmetrisk** – bulkkryptering av själva datan, alltså den stora mängden innehåll
- **Asymmetrisk** – nyckelutbyte och signering i de inledande stegen; används sällan för att kryptera data alls, eftersom det kostar för mycket
- **Hybrid** – storskaliga distribuerade system och e-handel, där TLS är exemplet

Prestanda: hur skiljer sig symmetrisk och asymmetrisk kryptering? (2)
||
- **Förhållandet** – asymmetrisk kryptering kräver typiskt 100 till 1000 gånger mer processorkraft än symmetrisk, och av de symmetriska är AES snabbast och Triple-DES långsammast
- **I praktiken** – en webbsida är sällan större än 100 kB och krypteras på några millisekunder, så algoritmernas prestanda påverkar knappt hur snabb https känns

Hur kan asymmetriska nycklar (public/private) användas för att ge autenticitet? (3)
||
- **Grunden** – nyckelparets två funktioner är varandras inverser; för RSA är det bevisat att de kan köras i vilken ordning som helst
- **Vändningen** – krypterar man med den privata nyckeln kan alla dekryptera med den publika; det ger ingen sekretess, men bevisar att bara innehavaren av den privata nyckeln kunde ha skapat det
- **Förbehållet** – verifieraren måste veta att den publika nyckeln verkligen är avsändarens, annars kan en man-in-the-middle svara med sin egen nyckel; därför certifikat

Vad är en digital signatur, vad bidrar den med, och hur skapas och kontrolleras den? (4)
||
- **Vad det är** – den binder oåterkalleligt signerarens identitet till hela bitföljden i dokumentet, med en hemlighet bara signeraren har
- **Vad den ger** – tre egenskaper: autentisk, den signerades medvetet och är oändrad, oförfalskbar, ingen annan kunde ha gjort den och den kan inte flyttas till ett annat dokument, och oförnekbar
- **Skapas** – avsändaren räknar ut en sammanfattning av meddelandet och krypterar den med sin privata nyckel; meddelandet självt skickas i klartext
- **Kontrolleras** – mottagaren dekrypterar signaturen med avsändarens publika nyckel, räknar själv ut sammanfattningen, och jämför; stämmer de är signaturen giltig

Vad är en digest-funktion (säker hashfunktion) och vilka egenskaper har den? (2)
||
- **Vad det är** – den gör ett meddelande av godtycklig längd till ett kort värde av fast längd som beskriver det, ett slags fingeravtryck
- **Egenskaperna** – tre: lätt att räkna fram hashen ur meddelandet, svårt att gå från hashen tillbaka till meddelandet, och svårt att hitta ett annat meddelande med samma hash

Vad är TLS/SSL respektive HTTPS? (2)
||
- **TLS/SSL** – SSL kom från Netscape, och en utökad version blev internetstandard under namnet TLS; det bygger en säker kanal med sekretess, integritet och autenticitet
- **HTTPS** – inget eget protokoll: prefixet https i en URL startar upprättandet av en TLS-kanal mellan webbläsare och webbserver

Hur går TLS-handskakningen till, steg för steg? (4)
||
- **ClientHello och ServerHello** – parterna enas om protokollversion, sessions-id, cipher suite och komprimering och utbyter slumpvärden; servern erbjuder en lista av cipher suites och klienten väljer en
- **Certifikat, valfritt** – parterna autentiserar varandra genom att utbyta signerade publik-nyckelcertifikat i X.509-format, och minst en publik nyckel måste finnas för nästa steg
- **Pre-master secret** – en part skapar ett stort slumpvärde och skickar det krypterat med den publika nyckeln; ur det räknar båda fram sessionsnycklarna, en per riktning, plus MAC-hemligheterna
- **ChangeCipherSpec och Finished** – dessa meddelanden avslutar handskakningen, och därefter är all vidare trafik krypterad och signerad enligt den valda cipher suiten

Vad är ett certifikat, vad innehåller det, vad ska det säkerställa, och vad är en CA? (4)
||
- **Vad det är** – ett dokument med ett påstående, oftast kort, signerat av en principal; det kan intyga vad som helst, inte bara nycklar
- **Innehåll** – ett X.509-certifikat har subject med namn och publik nyckel, issuer med namn och signatur, en giltighetsperiod med två datum, och administrativ information; bindningen ligger i signaturen
- **Säkerställer** – att man kan lita på ett påstående utan att känna motparten; men man måste ha utfärdarens äkta publika nyckel, annars kan vem som helst tillverka ett falskt certifikat
- **CA** – en välkänd organisation som utfärdar certifikat mot bevis på identitet; verifieringen sker i två steg, hämta utfärdarens certifikat från en pålitlig källa och validera signaturen

## Kapitel 16 – Transaktioner

Vad gör man åt deadlocks? (3)
||
- **Vad det är** – en deadlock är när varje transaktion i en grupp väntar på att någon annan i gruppen ska släppa ett lås, och den uppstår bara med låsning; den syns som en cykel i väntegrafen, där noder är transaktioner och bågar betyder väntar på
- **Tre vägar** – förebygga, upptäcka eller timeout; förebygga är att låsa allt redan vid start eller i bestämd ordning, enkelt men dåligt för det stryper samtidigheten, och upptäcka är att leta cykler i väntegrafen och avbryta en transaktion i cykeln
- **I praktiken** – timeout är vanligast: varje lås blir sårbart efter en tid och bryts om någon väntar på objektet, och baksidan är att transaktioner då avbryts ibland fast det inte fanns någon deadlock alls

Är dirty reads ett problem? (3)
||
- **Vad det är** – ja; en dirty read är när en transaktion läser ett värde som en annan har skrivit men inte bekräftat än
- **Varför allvarligt** – avbryter skrivaren sen har läsaren sett ett värde som aldrig funnits, och har läsaren redan bekräftat går det inte att ångra
- **Nyckelpoäng** – serialiserbarhet skyddar inte, för en dirty read uppstår även i en serialiserbar körning; problemet är avbrotten, inte flätningen

Hur kommer man åt dirty reads? (3)
||
- **Skjut upp commit** – vänta med din egen commit tills varje transaktion vars obekräftade värde du läst själv har bekräftat; avbryter den måste du avbryta med
- **Läs bara bekräftat** – läs bara objekt som skrivits av redan bekräftade transaktioner, så slipper man kaskadavbrott; det är ett starkare villkor än det förra
- **Skjut upp allt** – skjut upp både läsning och skrivning på ett objekt tills alla som skrivit det har bekräftat eller avbrutit; det kallas en strikt körning och är det som ger isoleringen

Vad är optimistisk samtidighetskontroll, varför kan den föredras, och vad är nackdelen? (3)
||
- **Vad det är** – idén är att chansen att två transaktioner rör samma objekt är låg, så låt dem köra fritt utan lås och kontrollera först vid commit; den har tre faser, arbetsfas, valideringsfas och uppdateringsfas
- **Varför föredra** – låsning kostar även när den inte behövs: lås ger overhead, kan ge deadlock, och hålls kvar tills transaktionen är slut; dessutom slipper man både deadlocks och dirty reads, eftersom all läsning sker på bekräftade versioner
- **Nackdelen** – går valideringen inte igenom avbryts transaktionen och arbetet måste göras om; den kan också svälta, alltså krocka varje gång och aldrig komma igenom valideringen

Varför ska man välja tidsstämpelmetoden snarare än tvåfaslåsning? (3)
||
- **Ingen deadlock** – det starkaste skälet: transaktioner väntar bara på tidigare transaktioner, så ingen cykel kan bildas i väntegrafen, och då behövs varken deadlockdetektering, timeout eller förebyggande
- **Bra för lästunga** – bokens raka svar är att tidsstämpelordning är bättre när transaktionerna mest läser, medan låsning är bättre när de mest uppdaterar
- **Slipper vänta** – vid konflikt avbryter tidsstämpelordning transaktionen direkt, medan låsning låter den vänta och kan behöva avbryta den senare ändå för att bryta en deadlock

Beskriv de tre metoderna: strikt 2PL, tidsstämpelordning och optimistisk kontroll. (3)
||
- **Strikt 2PL** – skaffar lås i en växande fas och släpper i en krympande, och håller alla lås till commit eller avbrott; vid konflikt får transaktionen vänta, en begäran avslås aldrig
- **Tidsstämpelordning** – varje transaktion får en tidsstämpel vid start som bestämmer ordningen i förväg, och varje operation valideras när den utförs; vid konflikt avbryts transaktionen direkt, eller får vänta på en tidigare
- **Optimistisk** – kör fritt utan lås i en arbetsfas med tentativa versioner, valideras vid commit mot överlappande transaktioner, och uppdaterar om den går igenom; vid konflikt avbryts den och arbetet görs om

Jämför strikt 2PL, tidsstämpelordning och optimistisk kontroll. (3)
||
- **När ordningen bestäms** – 2PL bestämmer den dynamiskt av åtkomstordningen, tidsstämpelordning statiskt vid start, och optimistisk vid valideringen
- **Vid konflikt** – 2PL låter transaktionen vänta, tidsstämpelordning avbryter direkt, och optimistisk avbryter och gör om arbetet
- **Deadlock och val** – bara låsning kan hamna i deadlock; välj låsning vid mest skrivningar, tidsstämpelordning vid mest läsningar, och optimistisk när konflikter är sällsynta

## Kapitel 17 – Distribuerade transaktioner

Vilka extra problem medför distribuerade transaktioner jämfört med lokala? Roten och de två första. (3)
||
- **Roten** – varje server ser bara sin egen del, så ingen har hela bilden av en transaktion som rör objekt på flera servrar
- **Atomicitet** – antingen bekräftar alla servrar eller avbryter alla; ingen kan bestämma själv, så en server blir koordinator och det krävs ett atomiskt commit-protokoll för ett gemensamt beslut
- **Global serialiserbarhet** – varje server serialiserar sina egna objekt lokalt, men ordningen måste bli densamma på alla servrar, och lokala beslut kan ge olika ordning på olika servrar

Vilka extra problem medför distribuerade transaktioner jämfört med lokala? De tre sista. (3)
||
- **Distribuerad deadlock** – det kan finnas en cykel i den globala väntegrafen som inte finns i någon enda lokal graf, så ingen server kan upptäcka den på egen hand
- **Globalt unika identifierare** – både transaktions-id och tidsstämplar måste fungera över servergränser, och servrarna måste vara överens om ordningen
- **Recovery blir svårare** – varje server har sin egen recovery-fil, och protokollets tillstånd måste överleva en krasch mitt i

Beskriv 2PC, del 1: varför enfas inte duger, och fas 1. (3)
||
- **Varför** – att koordinatorn bara skickar commit och upprepar räcker inte, för då får ingen server avbryta på eget initiativ; en server kan behöva det vid deadlock, misslyckad validering, eller om den kraschat och bytts ut
- **Fas 1, röstning** – koordinatorn skickar canCommit till varje deltagare, som svarar Yes eller No; innan en deltagare röstar Yes sparar den sina ändrade objekt och sin status i permanent lagring
- **Prepared** – har man röstat Yes får man inte avbryta längre, därför måste man först säkra att man kan hålla ordet även om man kraschar och ersätts under tiden

Beskriv 2PC, del 2: fas 2, det svaga stället och kostnaden. (3)
||
- **Fas 2, genomförande** – koordinatorn samlar rösterna, sin egen medräknad; är alla Yes skickar den doCommit till alla, är minst en röst No skickar den doAbort till dem som röstade Yes, och en enda No räcker för att allt avbryts
- **Det svaga stället** – en deltagare som röstat Yes men inte fått svar är uncertain, kan inte avgöra själv, och håller kvar sina lås; den frågar koordinatorn med getDecision, och har koordinatorn kraschat kan väntan bli lång
- **Kostnad** – går allt bra kostar protokollet 3N meddelanden och tre rundor; timeouts finns vid varje steg där någon kan blockera, men ingen tidsgräns finns för när protokollet blir klart

Beskriv hierarkiskt kontra flat 2PC. (2)
||
- **Hierarkiskt** – protokollet blir flernivåigt: koordinatorn frågar bara sina närmaste barn, som skickar canCommit vidare ner i trädet, och varje deltagare samlar in sina efterkommandes svar innan den svarar sin egen förälder
- **Flat** – koordinatorn skickar canCommit direkt till alla deltagare i listan över provisoriskt bekräftade subtransaktioner, utan att gå via trädet

Varför behöver flat 2PC en abortList, och vad är avvägningen mot hierarkiskt? (2)
||
- **Varför abortList** – en och samma server kan vara koordinator för både provisoriskt bekräftade och avbrutna subtransaktioner, och lokalt ser de likadana ut, så utan en lista över de avbrutna skulle servern bekräfta en subtransaktion vars förälder har avbrutit
- **Avvägningen** – i hierarkiskt bär trädet kunskapen om formen och var och en frågar sina barn, men det kostar många rundor; i flat bär koordinatorn kunskapen via abortList och når alla direkt, och Moss föredrog flat av det skälet

Hur gör man recovery från 2PC vid nod- eller nätverksfel? (3)
||
- **Grunden** – objekten ligger i flyktigt minne, men varje server skriver status till en recovery-fil på disk; innan en deltagare röstar Yes måste prepared redan vara skrivet, rösten skrivs som uncertain med en tvingad skrivning, och i fas 2 skrivs committed eller aborted
- **Avgörandet** – efter kraschen avgör den senaste statusposten i loggen vad som gällde när felet inträffade, och sedan beror åtgärden på serverns roll och den statusen
- **Åtgärden** – koordinator med prepared har inget beslut fattat och avbryter och meddelar alla; koordinator med committed skickar doCommit igen; deltagare med uncertain frågar koordinatorn med getDecision; deltagare med prepared har inte röstat och får avbryta
