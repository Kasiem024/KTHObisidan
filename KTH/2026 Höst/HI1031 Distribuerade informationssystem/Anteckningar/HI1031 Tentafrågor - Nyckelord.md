---
tags:
  - tenta
  - HI1031
  - databaser
  - programmering
  - KTH
  - year2026
created: 2026-10-22
updated: 2026-10-22
description: Nyckelordskort för den muntliga tentan i HI1031, ett kort per tentafråga. Svaret är bara stickord som drar fram hela svaret ur minnet, destillerade ur Snabbsvar-manuset. Filen bär nosr och ligger utanför repetitionen; den är till för snabb genomgång av frågelistan inför muntan.
---

# HI1031 Tentafrågor - Nyckelord

Nyckelordskort för den muntliga tentan: ett kort per tentafråga, med frågan ordagrant och svaret bara som stickord. Orden ska dra fram hela svaret ur minnet — säg svaret högt och fyll i resten själv. Stickorden kommer från Snabbsvar-manuset, som är granskat mot boken och frågelistan. `(egen slutsats)` betyder att raden inte står i boken.

## Kapitel 1 – Distribuerade system

Ge några exempel på distribuerade system. (4)
||
- **Vardagstjänster** – webben, webbsök, e-post, sociala nät, e-handel
- **Bokens tre** – webbsök, onlinespel med många spelare, finanshandel
- **Spannet** – från ett system i en bil till globala system med miljoner noder
- **Trenderna** – mobilt/ubiquitous, distribuerad multimedia, moln som tjänst

Ange 5 olika hårdvaruresurser och 5 mjukvaruresurser som kan vara intressant att dela. (2)
||
- **Hårdvara** – skrivare, diskar, processorer, videoström, ljudförbindelse; delas för att spara pengar
- **Mjukvara** – filer, webbsidor, databaser, sökmotorer, valutaomvandlare; datan är poängen, inte disken

Vilka utmaningar finns enligt boken med att bygga ett distribuerat system? (2)
||
- **De fyra första** – heterogenitet (middleware döljer), öppenhet (publicera gränssnitt), säkerhet (konfidentialitet/integritet/tillgänglighet), skalbarhet (decentralisera)
- **De fyra sista** – felhantering (partiella fel: upptäcka/maskera/tolerera/återhämta/redundans), samtidighet (krock), transparens (access + location viktigast), tjänstekvalitet (QoS)
<!--SR:!fsrs,2026-10-22T10:54:53.895Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:53:53.895Z-->

Vilka arv från IP, HTTP och HTML måste man ta hänsyn till vid utveckling av distribuerade system? (3)
||
- **HTML** – fasta byggdelar kopplade till visning, bara bläddra → därför XML, självbeskrivande
- **HTTP** – en resurs per fråga (9 bilder → 10 frågor), öppet som standard → lägg till åtkomstkontroll
- **IP** – 32-bitarsadresser tar slut, byte till 128 bitar kräver ändringar i massor av mjukvara

Vilken roll har IP och RFC för utvecklingen av distribuerade system? (3)
||
- **IP är tekniken** – gemensamt språk som döljer nätskillnader, resten tar middleware
- **RFC är spelregeln** – öppenhet kräver publicerade gränssnitt; numrerade RFC, går förbi tröga standardprocesser
- **Webben är beviset** – byggd ovanpå utan att ändra internet

## Kapitel 2 – Arkitektur

Beskriv hur en trelagersarkitektur är uppbyggd. (4)
||
- **De tre delarna** – presentationslogik, applikationslogik (affärslogik), datalogik (databas)
- **En server per del** – skikt 1 klientvy, skikt 2 applikationsserver, skikt 3 databasserver
- **Vinsten** – logiken samlad på ett ställe → lättare underhåll; tunna klienter
- **Priset** – tre servrar i stället för två, mer nättrafik och högre fördröjning

Beskriv hur en MVC-arkitektur är uppbyggd. (4)
||
- **De tre delarna** – Model (data/regler/tillstånd), View (visar modellen), Controller (tar inmatning → operationer)
- **Flödet** – användare agerar i vyn → controller tolkar → modell uppdateras → vyn ritar om
- **Poängen** – presentation skild från data, flera vyer per modell, modellen testbar utan GUI
- **Står inte i boken** – allmän mönsterkunskap *(egen slutsats)*

Vad är Middleware? (4)
||
- **Vad det är** – mjukvarulager som döljer heterogenitet (nät/hårdvara/OS/språk), bekväm programmeringsmodell
- **Var det sitter** – ovanpå OS, under tillämpningarna; hårdvara + OS = plattformen
- **Vad det ger** – fjärranrop, gruppkommunikation, händelsenotifieringar, replikering i stället för råa meddelanden
- **Gränsen (end-to-end-argumentet)** – kan inte abstrahera bort allt: dependability/fel/säkerhet behöver appen i ändpunkterna, hör på applikationsnivå (Saltzer)
<!--SR:!fsrs,2026-10-22T10:53:15.616Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:52:15.616Z-->

Vad är fördelarna med en klient/server-lösning? (4)
||
- **Kärnfördelen** – enkelt sätt att dela resurser; historiskt viktigaste och mest använda
- **Lager** – en server kan vara klient (webbserver → filserver/DNS)
- **Förbättras med placering** – flera servrar, replikering, caching i proxy, mobil kod
- **Men skalar dåligt** – en adress begränsas av värdens kapacitet → därför P2P
<!--SR:!fsrs,2026-10-22T10:13:47.837Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:12:47.837Z-->

Vad är en mobil agent? (4)
||
- **Vad det är** – körande program med kod + data som reser mellan datorer, utför uppgift, återvänder med resultat
- **Mekanism och vinst** – lokala anrop i stället för fjärranrop → lägre kommunikationskostnad
- **Bokens tvivel** – samma sak går med vanliga fjärranrop (web crawlers), så nyttan kan vara begränsad
- **Säkerhet** – tveeggat hot: mot värden (begränsa resurser via användarens identitet, som måste följa med säkert) och agenten själv (kan nekas, slutför ej uppgiften)
<!--SR:!fsrs,2026-10-22T10:12:08.590Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:11:08.590Z-->

## Kapitel 4 – Interprocess Communication (IPC)

På vilka olika sätt kan man karakterisera ett IPC-anrop? (4)
||
- **Synkront/asynkront** – synkront blockerar send + receive; asynkront icke-blockerande send
- **Destinationen** – internetadress + port; en port: en mottagare, många sändare
- **Tillförlitligheten** – giltighet (kommer fram) och integritet (oskadat, inga dubbletter)
- **Ordningen** – vissa kräver sändarordning, annars fel

Beskriv vad XML är och vad det kan användas till. (2)
||
- **Vad XML är** – textbaserat märkspråk (W3C), beskriver text + struktur; extensible, egna taggar; självbeskrivande, namnrymder
- **Används till och priset** – webbtjänster/SOAP, arkivering, GUI-spec, konfig; priset: stora meddelanden (HTTP 1.1 kan komprimera)

Beskriv tre olika typer av IPC. (4)
||
- **De tre** – UDP-datagram, TCP-strömmar, multicast
- **UDP** – enskilda meddelanden utan bekräftelse/omsändning; utelämnande + fel ordning; DNS, VoIP
- **TCP** – tvåvägs byteström utan gränser; döljer storlek/förlust/flöde/ordning; bruten vid för stor förlust
- **Multicast** – ett meddelande till varje gruppmedlem; IP multicast ovanpå IP, nås via UDP
<!--SR:!fsrs,2026-10-22T10:48:32.891Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:47:32.891Z-->

Är det speciellt bra att en port kan ha flera mottagare? Utveckla. (2)
||
- **Premissen + fördelarna** – normalt en mottagare/många sändare; undantaget är IP multicast → feltolerans (replikerade tjänster), tjänsteupptäckt, bättre prestanda, händelsespridning
- **Begränsningen + vad som behövs** – multicast otillförlitligt (utelämnande som UDP, olika ordning); replikerade tjänster = hårda fallet; behövs tillförlitlig och totalt ordnad multicast

Vad är skillnaderna och likheterna mellan IPC och distribuerade objekt? (2)
||
- **Skillnaderna** – IPC: meddelanden (send/receive på bytes), adress + port; distribuerade objekt: metodanrop, fjärrobjektreferens; inkapsling (olika processer); parametrar värde vs referens
- **Likheterna** – lager, inte alternativ (objekt ovanpå IPC); båda marshallar; båda request-reply med at-least-once/at-most-once

Vad vinner man på virtualisering? (4)
||
- **Nätverksvirtualisering** – virtuella nät ovanpå ett befintligt, egen adressering/protokoll/routing
- **Vinsten med nät** – nya nättjänster utan att ändra nätet, uppmuntrar experiment, flera overlays samtidigt; väg runt Saltzers end-to-end-argument (= vissa funktioner måste ligga i ändpunkternas app, inte i nätet)
- **Systemvirtualisering** – flera virtuella maskiner på en fysisk, egna OS, hypervisor
- **Vinsten med system** – säkerhet/uppdelning/debitering, migrering → lägre hårdvara/energi, infrastructure as a service
<!--SR:!fsrs,2026-10-22T10:04:25.914Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:03:25.914Z-->

## Kapitel 5 – Distribuerade objekt

Beskriv generellt hur distribuerade objekt och speciellt hur RMI fungerar. (2)
||
- **Distribuerade objekt** – tillstånd per objekt → lätt lägga i olika processer, klient-server, anrop i kedjor; fjärrobjektreferens + fjärrgränssnitt; fabriksmetoder (ingen fjärrkonstruktor)
- **RMI** – proxy (packar) → dispatcher (väljer metod) → skelett (packar upp) → servant; proxy/dispatcher/skelett genereras; request-reply ger at-most-once; fjärrobjekt per referens, annars värde; första referensen fås via binder/RMIregistry (Naming.lookup)

När kan ren socket-kommunikation vara bättre än distribuerade objekt och tvärtom? (2)
||
- **Sockets vinner** – lättvikt/minimal overhead (inbyggda system); slipper tre TCP-kostnader (bekräftelser, uppkoppling, flödeskontroll); Sun NFS över UDP
- **Objekten vinner** – stora krångliga program: hela objektmodellen, skicka referens i stället för värde; priset: känsligare för fel, nätfel ≠ död process, hög latens → minimera fjärranrop
<!--SR:!fsrs,2026-10-22T10:53:57.959Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:52:57.959Z-->

Jämför sockets, RPC, RMI och webbtjänster. (2)
||
- **Ram, abstraktion, namngivning** – lager (sockets underst, RPC/RMI över request-reply, webbtjänst över HTTP); abstraktion: bytes / procedur / metod / resurs-URI; namn: adress+port / fjärrreferens / URI
- **Gränssnitt, semantik, brandväggar** – sockets själv-marshall, RPC/RMI IDL+binärt, webbtjänst WSDL+XML/SOAP; semantik maybe/at-least-once/at-most-once; RMI/CORBA stoppas av brandvägg, HTTP/SMTP går igenom
<!--SR:!fsrs,2026-10-22T09:26:26.776Z,0,0.212,6.4133,1,1,0,0,2026-10-22T09:25:26.776Z-->

Vad är skillnaderna och likheterna mellan distribuerade objekt och webbtjänster? (2)
||
- **Skillnaderna** – webbtjänst kan inte skapa fjärrobjekt/returnera referenser → i praktiken ett enda fjärrobjekt, ingen skräpsamling/servant; oberoende av paradigm; ingen transparens (SOAP/XML rakt av)
- **Likheterna** – ytligt lika (URI i stället för fjärrreferens); båda programmering mot gränssnitt (lös koppling, döljer språk/plattform), marshalling bakom proxy
<!--SR:!fsrs,2026-10-22T10:11:47.862Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:10:47.862Z-->

## Kapitel 6 – Indirekt kommunikation

Beskriv poängen med indirekt kommunikation och olika strategier för hur det kan göras. (2)
||
- **Poängen** – kommunikation via mellanhand, ingen direkt koppling, ofta en-till-många; rumslig + tidsmässig frikoppling; priset: prestanda och svårare förvaltning
- **Strategierna** – gruppkommunikation, publish-subscribe, message queues, distribuerat delat minne, tuple spaces; tre meddelandebaserade + två delad datayta

Beskriv gruppkommunikation och hur det kan implementeras. (2)
||
- **Vad det är** – ett meddelande till en grupp, levereras till alla medlemmar, sändaren vet inte vilka; ovanpå multicast + medlemskap/feldetektering/garantier; "som TCP är till IP"
- **Hur det implementeras** – tillförlitlighet (integritet/giltighet/överenskommelse), ordning (FIFO/kausal/total), medlemskap (feldetektering/notifiering/adressexpansion) → passar små statiska system

Beskriv publish-subscribe-metoden och visa på hur den kan implementeras. (2)
||
- **Vad det är** – publishers publicerar händelser, subscribers anmäler mönster, systemet matchar och levererar; en-till-många; heterogenitet + asynkronitet; modeller kanal/topic/innehåll/typ (stigande kraft)
- **Hur det implementeras** – mäklare centralt / nätverk / peer-to-peer; routing: kanal+topic på multicast, innehåll kräver content-based routing (flooding/filtering/advertisements/rendezvous-DHT/gossip)
<!--SR:!fsrs,2026-10-22T09:25:11.072Z,0,0.212,6.4133,1,1,0,0,2026-10-22T09:24:11.072Z-->

Beskriv message queuing och beskriv hur det implementeras på ett bra sätt. (2)
||
- **Vad det är** – punkt-till-punkt, sändaren lägger i kö, en process plockar; persistenta meddelanden (till disk) → giltighet + integritet, men inget om när
- **Hur det implementeras bra** – central köhanterare = flaskhals/felpunkt; federera med enkelriktade message channels + routingtabeller; hub-and-spoke (RPC till spoke, asynkront vidare till hub)

Jämför gruppkommunikation, publish-subscribe och message queuing utifrån: Sändare, Mottagare, Implementatör. (3)
||
- **Sändaren** – grupp: multicast, vet inget om medlemmar; pub-sub: händelse, väntar inte in någon; MQ: lägg i namngiven kö, exakt en konsument
- **Mottagaren** – grupp: får allt ofiltrerat, måste finnas; pub-sub: väljer med filter; MQ: konkurrerar om kön, kan hämta långt efteråt, blockera/polla/notifieras
- **Implementatören** – grupp: medlemskap + ordning (begränsar skalbarhet); pub-sub: matchning + routing; MQ: persistens + topologi (disk, federera)
<!--SR:!fsrs,2026-10-22T10:03:52.467Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:02:52.467Z-->

## Kapitel 9 – Webbtjänster

Vad är en webbtjänst och i vilka situationer används sådana? Vad innebär begreppet låg koppling i kontexten webbtjänst? Ge exempel på protokoll eller arkitekturer för webbtjänster. (3)
||
- **Vad det är och när** – operationer över internet, URI, XML-meddelanden, nås ej direkt av webbläsare; webbläsaren för allmän → specialiserade gränssnitt; mellan organisationer, kombinera tjänster; HTTP/SMTP genom brandvägg
- **Låg koppling** – små beroenden så en ändring inte välter andra (ofta luddigt); programmering mot gränssnitt; enkla generella gränssnitt (data > operation); asynkrona meddelanden ger synkroniseringsfrikoppling
- **Protokoll** – XML (textformat, läsbart), SOAP (packar XML, request-reply över HTTP/SMTP), REST (avskalat mot resurser), WSDL (tjänstebeskrivning → ingen separat binder)

Vad är REST och vilka principer ska en RESTful webbtjänst uppfylla? Hur accessas resurser i en REST-arkitektur? Vilken roll har hypermedia? (3)
||
- **Vad REST är och principerna** – arkitekturstil (Fielding 2000), ej protokoll/standard; URL + GET/PUT/DELETE/POST mot resurser i XML; sex principer: likformigt gränssnitt, klient-server, tillståndslöshet, cachebarhet, skiktat, kod på begäran (valfri)
- **Hur resurser nås** – via URI; får en representation av resursens tillstånd (data + metadata + hypermedialänkar); resurs ≠ representation (JSON/XML/HTML)
- **Hypermedia (HATEOAS)** – klienten har bara första URI:n, driver resten via länkar i svaren; API ska se ut som hypertext
<!--SR:!fsrs,2026-10-22T10:10:58.119Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:09:58.119Z-->

Jämför distribuerade objekt (t.ex. RMI) med webbtjänster (t.ex. REST) för kommunikation mellan (del-)system. (4)
||
- **Ytligt lika** – anrop av operation, fjärrreferens (RMI) vs URI (webbtjänst); boken säger ytlig likhet
- **Kärnskillnaden** – webbtjänst skapar inga fjärrobjekt, inga servanter → ett enda fjärrobjekt, skräpsamling/referenser irrelevanta
- **Två principskillnader** – oberoende av paradigm; ingen transparens (marshalling/lokalkänsla via proxy)
- **Avvägningen** – priset prestanda (XML text vs CDR binärt; SOAP 14× större, 882× långsammare än CORBA, men beror på språk); vinsten global räckvidd (DNS + HTTP genom brandvägg)

Vad innebär SOA (Service-Oriented Architecture)? (3)
||
- **Definitionen** – designprinciper: löst kopplade tjänster, dynamiskt upptäckbara, direkt eller via koreografi
- **Hur det byggs** – abstrakt, går med objekt/komponenter men främst webbtjänster (deras låga koppling)
- **Resultatet** – B2B-integration (CORBA internt, .NET internt, webbtjänster utåt), mashup-kultur
<!--SR:!fsrs,2026-10-22T10:54:18.383Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:53:18.383Z-->

Förklara relationen mellan Ajax och webbtjänster. (3)
||
- **Vad Ajax är** – utbyggnad av klient-serversamspelet, små databitar mellan JS-frontend och backend, slipper hämta hel sida
- **Relationen** – båda runt webbläsarens begränsning över HTTP/XML (Ajax: för klumpig, webbtjänst: för allmän); backend kan vara en webbtjänst *(egen slutsats)*
- **Markeringen** – boken kopplar dem aldrig, Ajax i kapitel 2 inte 9 *(egen slutsats)*
<!--SR:!fsrs,2026-10-22T10:49:46.426Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:48:46.426Z-->

## Kapitel 10 – Peer-to-Peer (P2P)

Vad skiljer P2P från klient/server-modellen? Vilka är de viktigaste fördelarna respektive nackdelarna med ett P2P-system? (2)
||
- **Skillnaden** – klient-server: resurser på server/kluster; P2P: spritt, alla noder samma förmåga/ansvar; klient-server begränsas av serverkapacitet, P2P: varje användare bidrar, inget centralt
- **Fördelar och nackdelar** – fördelar: utnyttjar oanvända resurser, skalar med lastbalansering, självorganiserar; nackdelar: föränderlig data dyr, svag anonymitet, volatilitet (oförutsägbar tillgänglighet); replikering ger manipulationsmotstånd

I vilka situationer och för vilken typ av data passar P2P-system? Varför har P2P-tekniken kopplats samman med piratkopiering och upphovsrätt? (2)
||
- **Situationer och data** – oföränderlig data (musik/video); GUID = säker hash av innehållet → självcertifierande; stor skala, ingen fil kritisk
- **Upphovsrätt** – Napster (centrala index, filer från användarnas datorer) stängdes; argumentet "deltar inte" föll (indexservrar väsentliga); kända adresser → ej anonyma → stämdes; fullt distribuerat hade spritt ansvaret
<!--SR:!fsrs,2026-10-22T10:55:23.775Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:54:23.775Z-->

Vilka icke-funktionella krav ställs på ett P2P-system? (2)
||
- **För att systemet är stort** – global skalbarhet, lastbalansering (slumpad placering + repliker), optimering för lokala interaktioner
- **För att datorerna varken ägs eller litas på** – anpassning till att noder kommer/går, säkerhet (autentisering/kryptering), anonymitet/förnekbarhet/censurmotstånd

Hur hittar man en specifik resurs i ett P2P-nätverk? Vad är en "routing overlay"? Vad är skillnaden mellan strukturerade och ostrukturerade P2P-system? (2)
||
- **Routing overlay** – rutar förfrågan (objektets GUID) till närmaste levande nod med en kopia; distribuerad algoritm i mellanprogrammet, rutar i applikationslagret skilt från IP; kunskapen partitionerad/replikerad
- **Strukturerat vs ostrukturerat** – strukturerat: DHT, GUID bestämmer placering, prefixrutning, garanti + tidsgräns men dyrt underhåll; ostrukturerat: ad hoc, fråga grannar, utan garanti men tåligt; ostrukturerat dominerar (BitTorrent)
<!--SR:!fsrs,2026-10-22T10:55:29.734Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:54:29.734Z-->

Vad är skillnaden mellan IP och P2P på applikationsnivå? (4)
||
- **Ramen** – överlägget ovanpå IP, varje hopp över UDP, ett överläggshopp = många IP-hopp
- **Skarpaste skillnaden** – målidentifiering: IP-adress = en nod, överlägg = närmaste replik
- **Mest praktiska** – nätdynamik: IP-tabeller timskala, överlägg bråkdels sekund
- **Övriga axlar** – platt stor GUID-rymd vs hierarkisk IP, slumpad placering = lastbalansering, replikerade rutter = feltolerans, säkerhet + begränsad anonymitet
<!--SR:!fsrs,2026-10-22T10:31:12.180Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:30:12.180Z-->

## Kapitel 11 – Säkerhet

Vilka är de viktigaste hoten och attackerna som ett distribuerat system måste skyddas mot? (2)
||
- **Hoten** – tre klasser: läckage, manipulation, vandalisering; säkerhet behövs för att vi delar; dessutom nerladdad kod (Java-sandlåda) och att ett meddelande syns
- **Attackerna** – avlyssning, maskering, meddelandemanipulation, uppspelning, överbelastning; man-in-the-middle (byter nycklar i nyckelutbyte); uppspelning funkar utan nyckel (kopierar bitmönstret)

Beskriv vilken roll kryptering har för säkerhet, förutom att dölja innehållet i ett meddelande (konfidentialitet, autentisering, integritet, oförnekbarhet). (2)
||
- **Ramen, sekretess, integritet** – tre roller: sekretess+integritet, autentisering, signaturer; konfidentialitet (bara rätt nyckel dekrypterar); integritet kräver redundans (checksumma)
- **Autentisering och oförnekbarhet** – dekryptering med delad nyckel + rätt checksumma bevisar avsändaren; oförnekbarhet via digital signatur (bankomat-fantomuttag); vem som kan kryptera ger resten *(egen slutsats)*

Förklara hur symmetrisk, asymmetrisk respektive hybridkryptering fungerar. I vilka situationer används respektive typ? Prestanda? (3)
||
- **Hur de fungerar** – symmetrisk: samma nyckel, envägsfunktion, styrka = nyckellängd; asymmetrisk: nyckelpar, fälldörrsfunktion (RSA: två primtal); hybrid: asymmetrisk byter hemlig nyckel, sedan symmetriskt (TLS)
- **Situationerna** – symmetrisk: bulkkryptering; asymmetrisk: nyckelutbyte + signaturer, bara inledningsvis; hybrid: storskaliga system, e-handel
- **Prestanda** – asymmetrisk 100–1000× dyrare (stora tal); AES snabbast, Triple-DES långsammast; webbsida < 100 kB → millisekunder, påverkar knappt https
<!--SR:!fsrs,2026-10-22T10:31:36.892Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:30:36.892Z-->

Förklara hur asymmetriska nycklar (public/private) kan användas för att ge autenticitet. (2)
||
- **Nyckelvändningen** – kryptera med privat → alla dekrypterar med publik: ingen sekretess, men visar vem det kom från; funktionerna är inverser (RSA valfri ordning); sekretess = mottagarens publika, autenticitet = egen privat
- **Signaturen och förbehållet** – signatur = kryptera en digest med privat nyckel, kontrolleras med publik; den publika nyckeln måste bevisligen tillhöra rätt person (certifikat), annars man-in-the-middle

Vad är en digital signatur och vad bidrar den med gällande säkerhet? Hur genereras respektive kontrolleras en digital signatur? (2)
||
- **Vad den är och bidrar med** – binder signerarens identitet till hela bitföljden med en hemlighet bara signeraren har; tre egenskaper: autentisk, oförfalskbar, oförnekbar; intygar för tredje part
- **Hur den skapas och kontrolleras** – skapas: hash av meddelandet, krypterad med privat nyckel, skickas med (klartext); kontrolleras: dekryptera med publik, räkna om hashen, jämför
<!--SR:!fsrs,2026-10-22T10:06:38.153Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:05:38.153Z-->

Vad är en digest-funktion (säker hashfunktion) och vilka egenskaper har en sådan funktion? (2)
||
- **Vad den är och egenskaperna** – H(M): godtycklig längd → fast bitmönster; tre egenskaper: lätt framåt, svårt bakåt, svårt hitta kollision; de två första ger "envägshashfunktion"
- **Varför den tredje avgör** – kollisioner måste finnas, kravet är att de inte går att hitta; annars flytta signatur och förfalska; födelsedagsattack (64 bitar → $2^{32}$ versioner, därför ≥ 128 bitar); MD5 128, SHA-1 160 (sårbar)
<!--SR:!fsrs,2026-10-22T10:48:15.443Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:47:15.443Z-->

Vad är TLS/SSL respektive HTTPS? Förklara hur handskakningen i TLS går till. (3)
||
- **Vad de är** – SSL (Netscape) → TLS (standard), säker kanal (sekretess/integritet/autenticitet); HTTPS = https-prefix startar TLS, inget eget protokoll; två lager: record + handskakning; byggd som hybrid
- **Handskakningen** – ClientHello/ServerHello (version, cipher suite, slumpvärden, servern erbjuder/klienten väljer); certifikat (valfritt, X.509); pre-master secret (krypterat med publik → sessionsnycklar); ChangeCipherSpec + Finished startar den säkra sessionen
- **Cipher suite** – alla kryptoval: nyckelutbyte, chiffer, digest-funktion; förhandlas för att alla inte har samma algoritmer (+ lagar), för få gemensamma → misslyckas

Vad är ett certifikat? Vad innehåller det, vad ska det säkerställa och vad är en Certificate Authority (CA)? (2)
||
- **Vad det är och ska säkerställa** – dokument med ett påstående signerat av en principal; intygar fler slags påståenden än nycklar; mottagaren kan lita (Alice → bankkonto); bara med äkta nyckel (annars falskt certifikat)
- **Innehållet och CA** – X.509: subject (namn + publik nyckel), issuer (namn + signatur), giltighetsperiod, admin-info; bindningen i signaturen; CA = välkänd utfärdare (Verisign, CREN); kontroll i två steg, återkallning via utgångsdatum

## Kapitel 16 – Transaktioner

Vad gör man åt deadlocks? (3)
||
- **Tre vägar** – deadlock = transaktioner väntar på varandras lås (bara med låsning): förebygga, upptäcka, timeout
- **Förebygga och upptäcka** – förebygga: lås allt vid start / i ordning (stryper samtidighet); upptäcka: cykel i väntegrafen → avbryt en
- **Timeout** – lås bryts efter en tid om någon väntar; baksidan: avbryter ibland utan att deadlock fanns
<!--SR:!fsrs,2026-10-22T10:54:27.527Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:53:27.527Z-->

Är dirty reads ett problem? Hur kommer man åt det? (2)
||
- **Problemet** – dirty read = läsa obekräftat värde; allvarligt: skrivaren avbryter → läst värde som aldrig fanns; serialiserbarhet räcker inte (problemet är avbrotten)
- **Botemedlet** – skjut upp commit tills skrivaren bekräftat; läs bara bekräftat (slipper kaskadavbrott = avbryt-kedja: U avbryter när läst T avbryter, och alla som sett U med); skjut upp allt = strikt körning, ger isoleringen

Vad är optimistisk approach (optimistic concurrency control) och varför kan det vara att föredra? Vad är nackdelen? (3)
||
- **Vad det är** – låg krockchans → kör fritt utan lås, kontrollera vid commit; tre faser: arbete (tentativa versioner), validering (jämför transaktionens read set/write set mot överlappandes, avbryt vid överlapp), uppdatering
- **Varför föredra** – lås kostar alltid (även läsningar), ger deadlock, hålls till slutet; optimistisk: inga deadlocks, inga dirty reads
- **Nackdelen** – arbete görs om vid misslyckad validering; svält (krockar om och om), men boken: sällsynt
<!--SR:!fsrs,2026-10-22T10:53:30.576Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:52:30.576Z-->

Varför ska man välja tidsstämpelmetoden (time-stamp ordering) snarare än tvåfaslåsning (2PL)? (3)
||
- **Ingen deadlock** – transaktioner väntar bara på tidigare → ingen cykel, ingen detektering/timeout behövs
- **Bra för lästunga** – tidsstämpel bättre vid mest läsning, låsning vid mest uppdatering
- **Slipper vänta** – vid konflikt avbryter tidsstämpel direkt, låsning väntar och kan avbryta ändå
<!--SR:!fsrs,2026-10-22T10:12:32.222Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:11:32.222Z-->

Strict two-phase locking, Timestamp ordering och optimistisk approach är tre varianter för schemaläggning av transaktioner. Beskriv och jämför dem. (2)
||
- **Beskriv** – strikt 2PL: växande/krympande fas, håller lås till slut, konflikt → vänta; tidsstämpel: ordning vid start, valideras per operation, konflikt → avbryt direkt; optimistisk: fritt + validera vid commit
- **Jämför** – ordning bestäms dynamiskt (2PL) / statiskt (tidsstämpel) / vid validering (optimistisk); konflikt: vänta / avbryt direkt / avbryt + gör om; bara låsning ger deadlock; välj låsning vid skrivning, tidsstämpel vid läsning, optimistisk vid sällsynta konflikter
<!--SR:!fsrs,2026-10-22T10:54:22.695Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:53:22.695Z-->

## Kapitel 17 – Distribuerade transaktioner

Beskriv vilka extra problem som distribuerade transaktioner medför jämfört med lokala transaktioner. (2)
||
- **Roten, atomicitet, serialiserbarhet** – varje server ser bara sina objekt; atomicitet: alla bekräftar eller alla avbryter → koordinator + atomiskt commit-protokoll; global serialiserbarhet: samma ordning på alla servrar
- **Deadlock, identifierare, recovery** – distribuerad deadlock (cykel bara i globala grafen); globalt unika id + tidsstämplar; recovery svårare (egen recovery-fil, överleva krasch)
<!--SR:!fsrs,2026-10-22T10:48:22.026Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:47:22.026Z-->

Beskriv Two-Phase Commit (2PC). (2)
||
- **Vad det är och fas 1** – commit i två faser, låter vem som helst avbryta (enfas gör inte det); fas 1 röstning: canCommit? → Yes/No, spara objekt + status innan Yes; prepared = får ej avbryta längre
- **Fas 2, svaga stället, kostnaden** – alla Yes → doCommit, en No → doAbort; uncertain (röstat Yes, inget svar) håller lås, frågar getDecision; kostnad 3N meddelanden/tre rundor, timeouts men ingen tidsgräns

Hierarkisk kontra flat Two-Phase Commit: beskriv och förklara. (2)
||
- **De två varianterna** – deltagarna = subtransaktioner som bekräftat provisoriskt (klar men inget sparat i permanent lagring, till skillnad från prepared); hierarkiskt: koordinatorn frågar sina barn, canCommit? ner i trädet, samla barnens svar; flat: koordinatorn frågar alla direkt i listan; båda = fas 1 för nästlad transaktion, fas 2 identisk
- **abortList och avvägningen** – flat: en server kan vara koordinator för både bekräftade och avbrutna → abortList skiljer dem; hierarkiskt slipper listan men skickar upp/ner i steg; Moss föredrog flat
<!--SR:!fsrs,2026-10-22T10:49:22.226Z,0,0.212,6.4133,1,1,0,0,2026-10-22T10:48:22.226Z-->

Hur gör man recovery från Two-Phase Commit vid nod- eller nätverksfel? (3)
||
- **Grunden** – egen recovery-fil på disk; prepared skrivs före Yes, uncertain med tvingad skrivning, sedan committed/aborted
- **Avgörandet** – senaste statusposten i loggen avgör läget vid kraschen; åtgärd beror på roll + status
- **Åtgärden** – koordinator/prepared: avbryt + meddela; koordinator/committed: doCommit igen; deltagare/uncertain: getDecision; deltagare/prepared: har ej röstat → avbryt
