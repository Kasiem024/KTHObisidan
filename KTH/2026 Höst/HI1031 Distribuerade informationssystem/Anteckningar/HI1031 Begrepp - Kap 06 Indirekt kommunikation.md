---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 6, ordnade efter kursens fem tentafrågor: poängen med indirekt kommunikation, gruppkommunikation, publish-subscribe, message queuing och jämförelsen mellan de tre."
---
# HI1031 Begrepp - Kap 06 Indirekt kommunikation

## Fråga 1 – Poängen med indirekt kommunikation, och strategierna

**Indirekt kommunikation**;;Kommunikation mellan entiteter ==genom en mellanhand==, utan direkt koppling mellan sändaren och mottagaren.

Vad gör direkt koppling till ett problem?::Systemet blir ==stelt inför förändring== – svårt att byta ut servern, och fallerar den drabbas klienten direkt och måste hantera felet själv.

**Rumslig frikoppling**;;Sändaren ==vet inte och behöver inte veta== vilka mottagarna är, och omvänt.

**Tidsmässig frikoppling**;;Sändare och mottagare kan ha ==oberoende livstider== – de behöver inte finnas samtidigt för att kommunicera.

Vad krävs för att få tidsmässig frikoppling?::==Persistens== – mellanhanden måste lagra meddelandet så att det kan levereras när mottagaren är redo.

Varför är IP-multicast rumsligt frikopplat men inte tidsmässigt?::Meddelandet riktas mot gruppen, men ==alla mottagare måste finnas när det skickas==, eftersom IP-multicast inte lagrar något.

Vad är nackdelen med indirekt kommunikation?::En ==oundviklig prestandakostnad== för indirektionen, och systemen blir svårare att förvalta eftersom det inte finns någon direkt koppling att följa.

Vilka fem strategier för indirekt kommunikation tar boken upp? (5)
||
- Gruppkommunikation
- Publish-subscribe
- Message queues
- Distribuerat delat minne (DSM)
- Tuple spaces

Vilken grundläggande skillnad finns mellan de fem strategierna?::De tre första ==skickar meddelanden==. DSM och tuple spaces ger i stället en ==gemensam datayta man läser och skriver i==.

Varför skalar DSM och tuple spaces sämre?::Alla måste hela tiden ==se samma data==, och det blir dyrt när många läser och skriver samtidigt.

## Fråga 2 – Gruppkommunikation och hur det kan implementeras

**Gruppkommunikation**;;Ett meddelande skickas ==till en grupp== och levereras till ==alla medlemmar==, utan att sändaren känner deras identiteter.

Vad lägger gruppkommunikation till ovanpå ren multicast?::==Hantering av gruppmedlemskap, feldetektering, samt garantier om tillförlitlighet och ordning.==

Vilken liknelse använder boken om gruppkommunikation och IP-multicast?::Gruppkommunikation är till IP-multicast ==vad TCP är till IP:s punkt-till-punkt-tjänst==.

Varför ett enda multicast-anrop i stället för många separata send?::Framför allt för ==garantierna==: med många send kan sändaren krascha halvvägs så att bara några får meddelandet, och ordningen mellan två meddelanden blir odefinierad.

Vilka tre egenskaper bygger tillförlitlig multicast på? (3)
||
- **Integritet** – meddelandet som tas emot är detsamma som skickades, och levereras högst en gång
- **Giltighet** – ett skickat meddelande levereras så småningom
- **Överenskommelse** – levereras det till en process i gruppen levereras det till alla

Vad ger **FIFO-ordning**?::Skickar en process ett meddelande före ett annat ==levereras de i den ordningen hos alla== i gruppen. Kallas också källordning.

Vad ger **kausal ordning**?::Händer ett meddelande före ett annat i systemet ==bevaras det sambandet== när meddelandena levereras hos alla processer.

Vad ger **total ordning**?::Levereras ett meddelande före ett annat ==hos en process== gäller ==samma ordning hos alla== processer.

Vilka fyra uppgifter har en gruppmedlemskapstjänst? (4)
||
- Ge ett gränssnitt för medlemskapsändringar
- Feldetektering – både krasch och oåtkomlighet
- Notifiera medlemmarna om ändringar
- Gruppadressexpansion – utöka gruppidentifieraren till aktuellt medlemskap

Vilka tre delar består JGroups av? (3)
||
- **Channels** – det primitiva gränssnittet: connect, disconnect, send, receive
- **Building blocks** – högre abstraktioner, t.ex. `MessageDispatcher` som väntar in n svar
- **Protokollstacken** – ihopsättbara lager, och alla i gruppen måste ha samma stack

## Fråga 3 – Publish-subscribe och hur det kan implementeras

**Publish-subscribe**;;Publishers publicerar strukturerade ==händelser==, subscribers anmäler intresse med ==subscriptions==, och systemet matchar och levererar ==notifieringar==.

Vad kallar boken publish-subscribe-system också?::==Distribuerade händelsebaserade system.==

Hur vanliga är publish-subscribe-system enligt boken?::De ==mest använda== av alla indirekta tekniker i kapitlet.

Vilka två huvudegenskaper har publish-subscribe?::==Heterogenitet== – komponenter som inte byggts för att samverka kan fungera ihop – och ==asynkronitet==, så publishern inte behöver synkronisera med subscribern.

Vilka fyra operationer har programmeringsmodellen? (4)
||
- `publish(e)` – sprid en händelse
- `subscribe(f)` – anmäl intresse, där `f` är ett filter
- `unsubscribe(f)` – återkalla intresset
- `notify(e)` – så levereras händelser till subscribern

Vad är ett **advertisement** i publish-subscribe?::Publishern ==deklarerar i förväg vilka slags händelser den kommer att generera==.

Vilka fyra subskriptionsmodeller finns, i ökande uttryckskraft? (4)
||
- **Kanalbaserad** – publicera till namngivna kanaler
- **Topic-baserad** – ett fält i notifieringen anger topic
- **Innehållsbaserad** – villkor över värdena i händelsens attribut
- **Typbaserad** – matchning på händelsens typ eller subtyp

Vilka tre sätt kan man placera mäklaren på? (3)
||
- **Centraliserat** – en nod med en händelsemäklare
- **Nätverk av mäklare** – flera som samarbetar
- **Peer-to-peer** – alla noder är mäklare

Vad är problemet med en enda central händelsemäklare?::Den är en ==möjlig enda felpunkt== och en ==prestandaflaskhals==, så designen saknar motståndskraft och skalbarhet.

Vilka fem strategier för content-based routing tar boken upp? (5)
||
- **Flooding** – skicka till alla och matcha hos mottagaren
- **Filtering** – vidarebefordra bara där en subscriber finns
- **Advertisements** – sprid publisherns förhandsbesked framåt
- **Rendezvous** – dela händelserymden mellan ansvariga noder, kan mappas på en DHT
- **Informed gossip** – utbyt händelser slumpvis med grannarna, med hänsyn till innehåll

Hur fungerar **filtering-based routing**?::Mäklarna vidarebefordrar bara ==där det finns en väg till en giltig subscriber==. Varje nod håller grannlista, subskriptionslista och routingtabell.

## Fråga 4 – Message queuing och hur det implementeras bra

**Message queue**;;En ==punkt-till-punkt-tjänst== där sändaren lägger meddelandet i en kö och det plockas bort av ==en enda process==.

Vad kallas message queues också?::==Message-Oriented Middleware.==

Vad används message queues mest till?::==Enterprise Application Integration== (EAI) – att integrera tillämpningar inom ett företag – och som grund för ==kommersiella transaktionssystem==.

Vilka tre sorters receive stöds normalt? (3)
||
- **Blockerande** – väntar tills ett lämpligt meddelande finns
- **Icke-blockerande** – en pollning som returnerar ett meddelande eller ett besked om att inget finns
- **Notify** – ger en händelsenotifiering när ett meddelande dyker upp

Vad är den avgörande egenskapen hos message queues?::Meddelanden är ==persistenta== – kön lagrar dem tills de konsumeras och skriver dem till disk.

Vad garanterar persistensen, och vad garanterar den inte?::Den ger ==giltighet och integritet==, men systemet kan ==inte säga något om när== leveransen sker.

Vilken ordning har kön normalt, och vad stöds oftast dessutom?::Normalt ==FIFO==, men de flesta implementationer stöder också ==prioritet==, så högre prioritet levereras först.

Vad är problemet med en central köhanterare?::Den kan bli en ==tungviktig komponent==, en ==flaskhals== och en ==enda felpunkt==.

Vad är en **message channel** i WebSphere MQ?::En ==enkelriktad förbindelse mellan två köhanterare== som vidarebefordrar meddelanden ==asynkront== från en kö till en annan.

Hur fungerar topologin **hub-and-spoke**?::En köhanterare utses till ==hub== och har tjänsterna. Klienterna kopplar mot ==spokes== nära sig, som vidarebefordrar meddelandena till hubbens kö.

Varför är hub-and-spoke bra för latensen?::Klienten pratar ==RPC med en lokal spoke== och blockeras ==bara tills meddelandet ligger där==. Resten av vägen är asynkron men garanterat tillförlitlig.

Vad förenar JMS, och hur väl?::==Publish-subscribe och message queues==, genom att stödja både topics och queues. Men bara ==ytligt== – man kan inte blanda de två stilarna i samma förbindelse.

## Fråga 5 – Jämför gruppkommunikation, publish-subscribe och message queuing

Vilken av de tre är säkert tidsmässigt frikopplad, och varför?::==Message queues==, eftersom bara de garanterar persistens. För de andra två står ==möjligt== i figur 6.27 och beror på implementationen.

Vilken av de tre har begränsad skalbarhet, och varför?::==Gruppkommunikation==, eftersom gruppmedlemskapet måste underhållas. Boken tillägger att algoritmerna för tillförlitlighet och särskilt ordning också drar ner skalbarheten.

Var finns associativ adressering enligt figur 6.27?::Bara i ==innehållsbaserad publish-subscribe==. Gruppkommunikation och message queues har det inte.

Vad anger figur 6.27 som huvudsyfte för de tre? (3)
||
- **Grupper** – tillförlitlig distribuerad beräkning
- **Publish-subscribe** – informationsspridning eller EAI; mobila och ubikvitära system
- **Message queues** – informationsspridning eller EAI; kommersiell transaktionsbehandling

Vad skiljer de tre ur **sändarens** perspektiv? (egen slutsats)::Gruppen ==multicastar blint==, publishern ==vet inte om någon lyssnar==, och köproducenten vet att ==exakt en konsument== tar meddelandet och kan lägga sändningen i en transaktion.

Vad skiljer de tre ur **mottagarens** perspektiv? (egen slutsats)::Gruppmedlemmen får ==allt utan filtrering==, subscribern ==väljer själv med ett filter==, och kökonsumenten ==konkurrerar med andra== om samma kö men kan hämta långt efteråt.

Vad skiljer de tre ur **implementatörens** perspektiv? (egen slutsats)::Gruppkommunikation kämpar med ==medlemskap och ordning==, publish-subscribe med ==matchning och routing==, och message queuing med ==persistens och topologi==.
