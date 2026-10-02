---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-10-02
updated: 2026-10-02
description: "Agendakort för tentafrågorna i HI1031. Varje kort ger frågan och vilka delar ett komplett svar ska innehålla, som stöd för den muntliga examinationen."
---

# HI1031 Tentafrågor - Snabbsvar

Frågeraden är tentafrågan. Svaret är en agenda över vilka delar svaret ska innehålla, inte svaret
självt — faktan finns i begreppsdecken.

## Kapitel 1 – Distribuerade system

Ge några exempel på distribuerade system. (4)
||
- **Börja brett** – vardagstjänster vi tar för givna, som webben och e-post
- **Tre exempel boken går igenom** – webbsök, onlinespel, finanshandel
- **Spannet är poängen** – från en bil till miljoner noder, sensor till kraftfull dator
- **Trenderna** – mobilt, multimedia, molnet

Ange 5 hårdvaruresurser som är värda att dela. (3)
||
- **Bokens två** – diskar och skrivare
- **Bokens övriga exempel** – videoströmmen från en digitalkamera, ljudförbindelsen i ett mobilsamtal
- **Brasklappen** – boken har ingen färdig lista på fem; säg att du delar upp bokens exempel

Ange 5 mjukvaruresurser som är värda att dela. (3)
||
- **Innehåll** – filer, webbsidor
- **Delad data** – databaser
- **Färdiga tjänster** – sökmotor, valutaomvandlare

Vilka utmaningar finns enligt boken med att bygga ett distribuerat system? (4)
||
- **Få olika delar att funka ihop**
- **Hålla det säkert och växande**
- **Klara fel och krockar**
- **Hur systemet upplevs**

Vilka arv från IP, HTTP och HTML måste man ta hänsyn till? (3)
||
- **Från HTML** – vad taggarna är gjorda för
- **Från HTTP** – de två tyngsta arven
- **Från IP** – adressproblemet

Vilka arv från HTTP måste man ta hänsyn till? (4)
||
- **Få metoder** – fråga och svar, mest GET och POST
- **Innehållstyper** – MIME-typer säger hur svaret ska tolkas
- **En resurs per fråga**
- **Öppet som standard**

Vilken roll har IP och RFC för distribuerade system? (3)
||
- **IP är tekniken** – vad den döljer
- **RFC är spelregeln** – varför vem som helst får bygga på den
- **Webben är beviset** – byggdes ovanpå utan att ändra i internet

## Kapitel 2 – Arkitektur

Beskriv hur en trelagersarkitektur är uppbyggd. (3)
||
- **De tre delarna** – vilka tre lager, och en server per lager
- **Vinsten** – var logiken samlas
- **Priset** – vad tre lager kostar mot två

Beskriv hur en MVC-arkitektur är uppbyggd. (4)
||
- **De tre delarna**
- **Flödet** – hur ett klick går genom M, V och C
- **Poängen** – presentationen skild från datan
- **Säg var det står** – inte i boken, du svarar på allmän grund

Vad är Middleware?::Säg ==vad det döljer==, var det sitter, och ge exempel.

Vad är fördelarna med en klient/server-lösning? (4)
||
- **Kärnfördelen** – vad den gör enkelt
- **Enkla roller** – vem gör vad
- **Går att bygga i lager** – en server kan själv vara klient (webbserver, DNS)
- **Går att förbättra** – flera servrar, caching, mobil kod drar mer last

Vad är en mobil agent?::Säg ==vad den gör==, vinsten, och att boken tvivlar på nyttan.

## Kapitel 4 – Interprocess Communication (IPC)

På vilka sätt kan man karakterisera ett IPC-anrop? (3)
||
- **Ramen** – IPC är send och receive, och boken har fyra sätt
- **De fyra axlarna** – ta dem i tur och ordning
- **Bokens poäng** – med trådar har blockerande receive inga nackdelar

Beskriv vad XML är. (3)
||
- **Vad det är** – vilket slags språk
- **Mot HTML** – vad taggarna beskriver
- **Självbeskrivande** – så att okända tillämpningar kan läsa det, därav namnrymder

Vad kan XML användas till, och vad kostar det? (2)
||
- **Används till** – de fyra användningarna
- **Priset** – vad text-med-taggar kostar

Är det bra att en port kan ha flera mottagare? Lägg upp argumentet. (3)
||
- **Räta ut premissen** – normalt en mottagare, så frågan gäller IP multicast
- **Ja** – och räkna upp användningarna, t.ex. feltolerans
- **Men** – IP multicast är otillförlitlig, samma utelämnandefel som UDP

En port med flera mottagare: utveckla varför svaret beror på användningen. (2)
||
- **Beror på bruket** – replikerade tjänster kräver alla-eller-ingen, tjänsteupptäckt klarar en förlust
- **Vad som behövs** – tillförlitlig multicast och totalt ordnad multicast ovanpå

Vilka är likheterna mellan IPC och distribuerade objekt? (3)
||
- **Relationen** – hur de förhåller sig
- **Allt blir bytes** – båda marshallar, båda sköter byteordning
- **Request-reply** – båda bygger på förfrågan och svar

Vilka är skillnaderna mellan IPC och distribuerade objekt? (3)
||
- **Abstraktion och adress** – de två kontrasterna
- **Inkapsling** – skilda processer tvingar fram den
- **Parametrar** – referens i stället för värde

Vad vinner man på virtualisering - nätverksvirtualisering? (3)
||
- **Vad det är** – vad man bygger ovanpå vad
- **Varför det behövs** – slipper ändra internetprotokollen för alla
- **Overlays** – vinsten och priset

Vad vinner man på virtualisering - systemvirtualisering? (2)
||
- **Vad det är** – flera VM med egna OS, styrda av en hypervisor
- **Vinsten** – fördelarna mot processer, och att det möjliggör IaaS

## Kapitel 5 – Distribuerade objekt

Beskriv generellt hur distribuerade objekt fungerar. (3)
||
- **Modellen** – tillståndet är redan uppdelat per objekt, lägg objekten i olika processer
- **De två bärande begreppen**
- **Fabriksmetoder** – varför de behövs

Beskriv speciellt hur RMI fungerar. (3)
||
- **Kedjan** – de fyra delarna i rätt ordning
- **Automatiskt** – de tre genereras, kommunikationsmodulen ger anropssemantiken
- **Java RMI** – samma syntax som lokalt, men du vet att det är distribuerat

När är ren socket-kommunikation bättre än distribuerade objekt? (3)
||
- **Ramen** – en avvägning mellan kontroll och omkostnad
- **Vad man sparar** – bekräftelser, förbindelseuppsättning, flödeskontroll
- **Exemplet** – NFS med fasta block och idempotenta anrop slipper historik

När är distribuerade objekt bättre än rena sockets? (3)
||
- **Uttryckskraften** – vad objektmodellen ger
- **Priset alltid** – varför fjärranrop är känsligare
- **Latensen** – hur mycket, och följden

Jämför sockets, RPC, RMI och webbtjänster: ram, abstraktion, namngivning. (3)
||
- **Rama in** – hur de fyra förhåller sig
- **Abstraktion** – vad var och en låter dig anropa
- **Namngivning** – hur målet pekas ut

Jämför sockets, RPC, RMI och webbtjänster: gränssnitt, semantik, brandväggar. (3)
||
- **Gränssnitt och dataformat** – hur de beskrivs och kodas
- **Anropssemantik** – de tre nivåerna
- **Brandväggar** – det som avgör mellan organisationer

Vilka är likheterna mellan distribuerade objekt och webbtjänster? (2)
||
- **Ytlig likhet** – hur anropet ser ut
- **Vad de delar** – den djupare likheten

Vilka är skillnaderna mellan distribuerade objekt och webbtjänster? (3)
||
- **Kärnskillnaden** – vad en webbtjänst inte kan
- **Följderna** – ingen fabriksmetod, inga servanter
- **Paradigm och transparens** – de två principskillnaderna

## Kapitel 6 – Indirekt kommunikation

Beskriv poängen med indirekt kommunikation och strategierna. (4)
||
- **Vad det är** – vad som sitter emellan
- **Poängen** – problemet, och de två frikopplingarna
- **Priset** – vad det kostar
- **Strategierna** – de tre kursen tar upp

Beskriv gruppkommunikation. (3)
||
- **Vad det är** – grundmodellen
- **Abstraktion ovanpå multicast** – lägger till garantier, som TCP ovanpå IP
- **Modellen** – gå med eller lämna, ett multicast-anrop i stället för många send

Hur implementeras gruppkommunikation? (4)
||
- **Tillförlitlighet** – de tre garantierna
- **Ordning** – de tre sorterna
- **Medlemskap** – ändringar, feldetektering, notifiering, adressexpansion
- **Följden** – medlemskapet gör att det passar små, stabila system

Beskriv publish-subscribe och visa hur det kan implementeras. (3)
||
- **Vad det är** – de tre rollerna och matchningen
- **Hur man prenumererar** – de fyra sätten
- **Hur det byggs** – var mäklaren kan sitta

Beskriv message queuing. (3)
||
- **Vad det är** – kön och vem som plockar
- **Den avgörande egenskapen** – vad meddelandena är
- **Vad persistensen ger** – vilken garanti, och vad den inte lovar

Hur implementeras message queuing på ett bra sätt? (3)
||
- **Problemet** – en central köhanterare blir flaskhals och enda felpunkt
- **Lösningen** – federera köhanterarna med enkelriktade message channels
- **Hub-and-spoke** – hur det fungerar

Jämför gruppkommunikation, publish-subscribe och message queues. (4)
||
- **Börja med** – alla tre är indirekta och rumsligt frikopplade
- **Skarpaste skillnaden** – mönstret: grupp och publish-subscribe är en-till-många, kön är en-till-en
- **Gå igenom tre perspektiv** – sändare, mottagare, implementatör
- **Avsluta med** – bara message queues är tidsmässigt frikopplad, för den har persistens

## Kapitel 9 – Webbtjänster

Vad är en webbtjänst, när används den, och vilka protokoll finns? (3)
||
- **Vad och varför** – hur ett program når den, och varför inte via en webbläsare
- **När** – vilka två parter som pratar, och vad trafiken passerar
- **Protokoll** – XML, SOAP, REST, WSDL

Vad innebär låg koppling för en webbtjänst? (4)
||
- **Grundbetydelsen** – vad man håller så litet som möjligt
- **Programmering mot gränssnitt** – skilj gränssnittet från implementationen
- **Enkla, generella gränssnitt** – minimala gränssnitt som webben och REST
- **Valet av paradigm** – request-reply kopplar, asynkront frikopplar

Vad är REST och vilka principer ska en RESTful tjänst uppfylla? (3)
||
- **Vad REST är** – arkitekturstil från Fielding, inte ett protokoll eller en standard
- **De sex principerna** – likformigt gränssnitt, klient-server, tillståndslöshet, cache, lager, kod på begäran
- **Två källor** – boken ser REST som HTTP med fyra metoder, restfulapi.net säger att det inte är bundet till HTTP

Hur accessas resurser i REST och vilken roll har hypermedia? (3)
||
- **Hur resurser nås** – via en URI; man får en representation: data, metadata, länkar
- **Resurs mot representation** – skilda, så samma resurs kan ges som JSON, XML eller HTML
- **Hypermedia (HATEOAS)** – vad servern skickar med, och vad klienten då behöver

Jämför distribuerade objekt (RMI) med webbtjänster (REST). (4)
||
- **Börja med** – ytligt lika: båda anropar en operation, med fjärrreferens eller URI
- **Kärnskillnaden** – webbtjänsten är ett enda objekt: inga nya fjärrobjekt, inga servanter
- **Två principskillnader** – paradigmoberoende, och ingen transparens på köpet
- **Avvägningen** – priset är prestanda, vinsten är global räckvidd genom brandväggar

Vad innebär SOA (Service-Oriented Architecture)? (4)
||
- **Definitionen** – vilken sorts princip, och tjänsternas två kännetecken
- **Hur det byggs** – med vad, och varför just det
- **Var det används** – främst på internet i stort, inte bara internt
- **Resultatet** – B2B-integration och mashups

Förklara relationen mellan Ajax och webbtjänster. (4)
||
- **Vad Ajax är** – vad som pratar med servern, och vad man slipper
- **Bryggan** – båda går runt webbläsarens gräns, över HTTP med XML
- **Hur de kompletterar** – Ajax går mellan skikt 1 och 2; backend kan själv vara en webbtjänst
- **Markeringen** – boken kopplar dem aldrig själv, och Ajax står i kapitel 2

## Kapitel 10 – Peer-to-Peer (P2P)

Vad skiljer P2P från klient-server? (3)
||
- **Målet** – dela i stor skala utan separat skötta servrar
- **Klient-server** – var resurserna ligger och vad som sätter gränsen
- **P2P** – hur resurserna och noderna förhåller sig

Vilka är P2P:s viktigaste fördelar och nackdelar? (4)
||
- **Fördelarna** – de tre styckena
- **Nackdel: data** – de två svagheterna
- **Nackdel: volatilitet** – vad ägarna inte kan lova
- **Vändningen** – replikeringen som volatiliteten kräver ger manipulationsmotstånd

I vilka situationer och för vilken data passar P2P? (3)
||
- **Datatypen** – vilken sorts fil, och kopplingen till GUID:et
- **Varför det funkar** – hashen gör filen självcertifierande mot manipulation
- **Situationen** – stor skala där ingen enskild fil är kritisk just nu

Varför har P2P kopplats samman med piratkopiering och upphovsrätt? (3)
||
- **Napster** – dess arkitektur, indexet kontra filerna
- **Argumentet som föll** – vad de hävdade, och varför det inte höll
- **Följden** – vad de kända adresserna ledde till

Vilka icke-funktionella krav ställs på ett P2P-system?::Sex krav i två grupper: ==tre för att systemet är stort, tre för att datorerna varken ägs eller litas på==.

Vad är en routing overlay och hur hittar den en resurs? (3)
||
- **Grundproblemet** – ingen kan hålla hela katalogen; kunskapen partitioneras och replikeras
- **Vad den är** – i vilket lager den rutar, och i förhållande till IP
- **Hur den hittar** – vad klienten skickar, och vart det rutas

Vad är skillnaden mellan strukturerade och ostrukturerade P2P-system? (4)
||
- **Strukturerat** – DHT: GUID bestämmer placeringen, prefixrutning hittar objektet
- **Ostrukturerat** – ingen kontroll, byggs ad hoc, man frågar sig fram genom grannarna
- **Avvägningen** – strukturerat garanterar men kostar underhåll; ostrukturerat är tåligt men utan garantier
- **Det som förvånar** – ostrukturerat dominerar ändå på Internet, t.ex. BitTorrent

Vad är skillnaden mellan IP och P2P-routning på applikationsnivå? (4)
||
- **Ramen** – överlägget ersätter inte IP; det ligger ovanpå, oftast över UDP
- **Skarpaste skillnaden** – IP pekar ut en maskin, överlägget närmaste repliken av ett objekt
- **Mest praktiska** – nätdynamik: IP uppdateras på timskala, överlägget på bråkdelar av en sekund
- **Övriga axlar** – skala, lastbalansering, feltolerans, säkerhet och anonymitet

## Kapitel 11 – Säkerhet

Vilka är de viktigaste hoten och attackerna som ett distribuerat system måste skyddas mot? (3)
||
- **Varför** – delning av resurser skapar problemet
- **Tre hotklasser**
- **Fem attackmetoder** – avlyssning, maskering, manipulation, uppspelning, överbelastning

Vilken roll har kryptering för säkerhet, utöver att dölja innehållet? (4)
||
- **Konfidentialitet** – villkoret för att få läsa
- **Integritet** – vad som krävs, och att det inte är gratis
- **Autentisering** – vad en delad nyckel röjer
- **Oförnekbarhet** – hur den uppnås

Hur fungerar symmetrisk, asymmetrisk och hybridkryptering? (3)
||
- **Symmetrisk** – nyckelrelationen, och att den bygger på envägsfunktioner
- **Asymmetrisk** – nyckelrelationen, och att den bygger på fälldörrsfunktioner
- **Hybrid** – vad vardera krypteringen gör

I vilka situationer används symmetrisk, asymmetrisk och hybridkryptering? (3)
||
- **Symmetrisk** – bulkkryptering av själva datan
- **Asymmetrisk** – nyckelutbyte och signering, sällan för data
- **Hybrid** – storskaliga system och e-handel, som TLS

Prestanda: hur skiljer sig symmetrisk och asymmetrisk kryptering? (2)
||
- **Förhållandet** – storleksordningen dyrare
- **I praktiken** – en webbsida krypteras på millisekunder, så https känns knappt

Hur kan asymmetriska nycklar (public/private) användas för att ge autenticitet? (3)
||
- **Grunden** – vilken relation nycklarna har
- **Vändningen** – vilken nyckel man krypterar med, vilken alla verifierar med
- **Förbehållet** – mottagaren måste veta att publika nyckeln är din, annars MITM

Vad är en digital signatur, vad bidrar den med, och hur skapas och kontrolleras den? (4)
||
- **Vad det är** – vad en signatur binder ihop
- **Vad den ger** – de tre egenskaperna
- **Skapas** – vad man hashar, och med vilken nyckel
- **Kontrolleras** – med vilken nyckel, och vad man jämför mot

Vad är en digest-funktion (säker hashfunktion) och vilka egenskaper har den? (2)
||
- **Vad det är** – vad den gör med meddelandets längd
- **Egenskaperna** – de tre

Vad är TLS/SSL respektive HTTPS? (2)
||
- **TLS/SSL** – vad det skapar, och relationen mellan SSL och TLS
- **HTTPS** – vad det egentligen är

Vad är ett certifikat, vad innehåller det, vad ska det säkerställa, och vad är en CA? (4)
||
- **Vad det är** – vad slags intyg
- **Innehåll** – de tre delarna
- **Säkerställer** – vilken koppling som ska stämma
- **CA** – vem det är, och att verifieringen sker i två steg

## Kapitel 16 – Transaktioner

Vad gör man åt deadlocks? (3)
||
- **Vad det är** – var cykeln syns, och när den uppstår
- **Tre vägar** – de tre strategierna
- **I praktiken** – vanligaste vägen och dess baksida

Är dirty reads ett problem? (3)
||
- **Vad det är** – vad man läser, och i vilket läge
- **Varför allvarligt** – vad skrivaren kan göra, och varför det inte går att laga
- **Nyckelpoäng** – serialiserbarhet skyddar inte, problemet är avbrotten

Hur kommer man åt dirty reads? (3)
||
- **Skjut upp commit** – vänta på vem
- **Läs bara bekräftat** – då slipper man kaskadavbrott
- **Skjut upp allt** – vad som skjuts upp, och vad det kallas

Vad är optimistisk samtidighetskontroll, varför kan den föredras, och vad är nackdelen? (3)
||
- **Vad det är** – när man kör fritt, och när man kontrollerar
- **Varför föredra** – vad lås kostar, plus en deadlock-poäng
- **Nackdelen** – vad som händer vid avbrott, och risken för svält

Varför ska man välja tidsstämpelmetoden snarare än tvåfaslåsning? (3)
||
- **Ingen deadlock** – vem man bara väntar på
- **Bra för lästunga** – vilken metod vinner vid vilken last
- **Slipper vänta** – vad den gör vid konflikt i stället

Beskriv de tre metoderna: strikt 2PL, tidsstämpelordning och optimistisk kontroll. (3)
||
- **Strikt 2PL** – när låsen släpps, och vad man gör vid konflikt
- **Tidsstämpelordning** – vad som bestämmer ordningen, och vad som sker vid konflikt
- **Optimistisk** – de tre faserna

Jämför strikt 2PL, tidsstämpelordning och optimistisk kontroll. (3)
||
- **När ordningen bestäms** – 2PL dynamiskt, tidsstämpel vid start, optimistisk vid validering
- **Vid konflikt** – vänta, avbryt direkt, eller avbryt och gör om
- **Deadlock och val** – bara låsning kan deadlocka, välj efter om lasten mest läser eller skriver

## Kapitel 17 – Distribuerade transaktioner

Vilka extra problem medför distribuerade transaktioner jämfört med lokala? (4)
||
- **Roten** – varje server ser bara sin egen del
- **Atomicitet** – vad alla måste göra ihop, och vad det kräver
- **Global ordning** – vad som måste gälla överallt
- **Distribuerad deadlock** – var cykeln ligger, och vem som ser den

Beskriv Two-Phase Commit (2PC). (3)
||
- **Varför** – vad en server måste kunna
- **Fas 1, röstning** – vad koordinatorn frågar, och vad som sker före ett Yes
- **Fas 2, genomförande** – vad som avgör doCommit kontra doAbort

Beskriv hierarkiskt kontra flat 2PC. (2)
||
- **Hierarkiskt** – koordinatorn frågar bara närmaste barn, svaren samlas uppåt i trädet
- **Flat** – koordinatorn frågar alla deltagare direkt

Varför behöver flat 2PC en abortList, och vad är avvägningen mot hierarkiskt? (2)
||
- **Varför abortList** – vilka två sorters subtransaktioner en server kan ha
- **Avvägningen** – trädet bär kunskapen om formen, eller koordinatorn via listan

Hur gör man recovery från 2PC vid nod- eller nätverksfel? (3)
||
- **Grunden** – vad som skrivs till loggen, och när
- **Avgörandet** – vad i loggen som avgör
- **Åtgärden** – beror på roll och status: koordinator eller deltagare, prepared, committed eller uncertain
