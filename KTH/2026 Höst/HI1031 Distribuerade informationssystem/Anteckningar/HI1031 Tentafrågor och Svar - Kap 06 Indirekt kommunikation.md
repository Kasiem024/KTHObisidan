---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-09-08
updated: 2026-09-09
description: "Svar på kursens fem tentafrågor om indirekt kommunikation: poängen med indirektion och strategierna, gruppkommunikation, publish-subscribe, message queuing, samt en jämförelse av de tre ur sändarens, mottagarens och implementatörens perspektiv."
---
# HI1031 Tentafrågor och Svar - Kap 06 Indirekt kommunikation

Noten täcker de fem tentafrågorna för kapitel 6 och ingenting annat. Där jag lagt till en egen
förklaring står det **Så kan du tänka** — det är mina ord, inte bokens.

## Fråga 1 – Poängen med indirekt kommunikation, och strategierna

Bokens avsnitt: §6.1 och §6.6.

**Definitionen.** Indirekt kommunikation är kommunikation mellan entiteter ==genom en mellanhand, utan
direkt koppling mellan sändaren och mottagaren==. Mottagare står i plural med flit: många indirekta
paradigm stöder uttryckligen ==en-till-många==.

**Problemet den löser.** Allt i kapitel 4 och 5 bygger på direkt koppling, och det gör systemet
==stelt inför förändring==. Två följder i en vanlig klient-server-interaktion: det är svårare att
==byta ut servern== mot en annan med samma funktion, och fallerar servern ==drabbas klienten direkt==
och måste hantera felet själv.

**De två egenskaperna man får i stället:**

- **Rumslig frikoppling** (*space uncoupling*): sändaren ==vet inte och behöver inte veta== vilka
  mottagarna är, och omvänt. Deltagare kan därför ==bytas ut, uppdateras, replikeras eller flyttas==.
- **Tidsmässig frikoppling** (*time uncoupling*): sändare och mottagare kan ha ==oberoende livstider==
  och behöver alltså inte finnas samtidigt för att kommunicera.

Boken säger att indirekt kommunikation **ofta** används där förändring är väntad — mobila miljöer där
användare kopplar upp och ner sig — och för ==händelsespridning== där mottagarna kan vara okända.

**Nackdelen.** Indirektionen ==kostar alltid lite prestanda==, och systemen blir
==svårare att förvalta== just därför att det inte finns någon direkt koppling att följa. Man får inte
heller automatiskt båda egenskaperna: ==IP-multicast är rumsligt frikopplat men tidskopplat==, eftersom
tidsmässig frikoppling kräver ==persistens== och IP-multicast inte lagrar meddelandet.

**De fem strategierna**, med sin mellanhand: **gruppkommunikation** (en grupp), **publish-subscribe**
(en kanal eller ett topic), **message queues** (en kö), **distribuerat delat minne** (ett delat minne)
och **tuple spaces** (ett tuple space). De ==tre första betonar kommunikation== genom meddelanden eller
händelser, de ==två sista är en gemensam datayta man läser och skriver i==. Det har följder för
skalbarheten: de kommunikationsbaserade kan skala mycket stort med rätt routing, medan de databaserade
==bromsas av att alla måste se samma data==.

**Så kan du tänka:** mellanhanden är hela poängen. Så fort du sätter något emellan slutar sändaren och
mottagaren att känna varandra, och då kan du byta ut, flytta eller starta om dem var för sig. Priset är
ett extra hopp och att du inte längre kan följa ett anrop från ände till ände.

### Muntligt svar

1. Indirekt kommunikation är kommunikation genom en mellanhand, utan direkt koppling mellan sändare
   och mottagare — till skillnad från allt i kapitel 4 och 5.
2. Poängen är att direkt koppling gör systemet stelt: svårt att byta ut en server, och kraschar den
   måste klienten hantera felet själv.
3. Man får två egenskaper: rumslig frikoppling, där ingen behöver veta vem den andra är, och
   tidsmässig frikoppling, där de inte behöver finnas samtidigt.
4. Priset är prestanda och att systemet blir svårare att förvalta. Man får inte heller automatiskt båda
   egenskaperna — IP-multicast är rumsligt frikopplat men tidskopplat, eftersom det inte lagrar.
5. Boken tar upp fem strategier: gruppkommunikation, publish-subscribe, message queues, distribuerat
   delat minne och tuple spaces. De tre första handlar om kommunikation, de två sista om delat
   tillstånd, och de sista skalar sämre.

## Fråga 2 – Gruppkommunikation och hur det kan implementeras

Bokens avsnitt: §6.2, §6.2.1, §6.2.2 och §6.2.3.

**Vad det är.** Ett meddelande skickas ==till en grupp== och levereras sedan ==till alla medlemmar==.
Sändaren känner inte mottagarnas identiteter.

**Det är en abstraktion ovanpå multicast.** Den kan byggas på IP-multicast eller ett overlay-nät och
lägger till ==hantering av gruppmedlemskap, feldetektering, samt garantier om tillförlitlighet och
ordning==. Bokens liknelse: gruppkommunikation är till IP-multicast vad ==TCP är till IP:s
punkt-till-punkt-tjänst==. Den används särskilt för ==feltolerans== — konsekvent uppdatering av
replikerad data och högtillgängliga servrar — samt tillförlitlig informationsspridning och övervakning.

**Programmeringsmodellen.** Det centrala är en **grupp** med **gruppmedlemskap**: processer kan
==join== eller ==leave==. En process skickar sedan ==ett enda multicast-anrop== i stället för många
separata send. **Multicast** går till alla i gruppen. En grupp är **sluten** om bara medlemmar får
multicasta till den, **öppen** om processer utanför får skicka.

**Varför ett anrop och inte många.** Även om bandbredden blir bättre är det viktigaste
==garantierna==: med många oberoende send går det inte att garantera något för gruppen som helhet —
kraschar sändaren halvvägs får några medlemmar meddelandet och andra inte, och ordningen mellan två
meddelanden är odefinierad.

**Implementation, del 1: tillförlitlighet.** Tillförlitlig multicast bygger på tre egenskaper:

- **Integritet:** meddelandet som tas emot är ==detsamma som skickades== och levereras ==högst en gång==.
- **Giltighet:** ett skickat meddelande ==levereras så småningom==.
- **Överenskommelse:** den egenskap som tillkommer för flera mottagare — levereras meddelandet till
  ==en== process så levereras det till ==alla== i gruppen.

**Implementation, del 2: ordning.** Ordning garanteras inte av de underliggande primitiverna, så
gruppkommunikation erbjuder **ordnad multicast** i tre varianter, som också kan kombineras:

- **FIFO-ordning**, även kallad källordning: skickar en process ett meddelande före ett annat
  ==levereras de i den ordningen hos alla==.
- **Kausal ordning:** *händer före* ett meddelande ett annat bevaras det sambandet vid leverans hos alla.
- **Total ordning:** levereras ett meddelande före ett annat ==hos en process== gäller ==samma ordning
  hos alla==.

**Implementation, del 3: gruppmedlemskap.** Medlemskapstjänsten har fyra uppgifter:

1. **Ett gränssnitt för medlemskapsändringar** — skapa och förstöra grupper, lägga till och ta bort
   processer.
2. **Feldetektering** — övervaka medlemmarna för både krasch och ==oåtkomlighet==. Tjänsten
   ==utesluter== den som misstänks.
3. **Notifiera medlemmarna** när en process läggs till eller utesluts.
4. **Gruppadressexpansion** — sändaren anger bara ==gruppidentifieraren==, och tjänsten expanderar den
   till det aktuella medlemskapet.

**Priset för medlemskapshanteringen.** Boken är tydlig: gruppkommunikation är ==mest effektiv i
småskaliga och statiska system== och ==fungerar inte lika bra== i storskaliga eller flyktiga miljöer.
IP-multicast är för övrigt bara ett ==svagt fall== av en medlemskapstjänst: den gör adressexpansion, men
ger inte medlemmarna information om aktuellt medlemskap.

**JGroups som exempel** (§6.2.3) har tre delar: **channels**, det primitiva gränssnittet med connect,
disconnect, send och receive; **building blocks** ovanpå kanalerna; och **protokollstacken** av
ihopsättbara lager. Lagren har samma gränssnitt så de kan kombineras fritt, och ==alla i gruppen måste
ha samma stack==.

### Muntligt svar

1. Gruppkommunikation betyder att ett meddelande skickas till en grupp och levereras till alla
   medlemmar, utan att sändaren vet vilka de är.
2. Det är en abstraktion ovanpå multicast som lägger till medlemskapshantering, feldetektering samt
   garantier om tillförlitlighet och ordning. Boken säger att gruppkommunikation är till IP-multicast
   vad TCP är till IP.
3. Modellen är en grupp man går in i och ut ur, och ett enda multicast-anrop i stället för många send.
   Det ger bättre bandbredd, men framför allt garantier för gruppen som helhet.
4. Implementationen måste ge tillförlitlighet: integritet, giltighet och överenskommelse, alltså att
   får en medlem meddelandet får alla det.
5. Den måste ge ordning i tre varianter: FIFO från sändarens perspektiv, kausal som bevarar
   händer-före, och total där alla ser samma ordning.
6. Och den måste sköta gruppmedlemskap — ändringar, feldetektering, notifiering och adressexpansion.
   Just det gör att gruppkommunikation passar bäst i små och stabila system. JGroups är bokens exempel,
   med kanaler, byggblock och en protokollstack av utbytbara lager.

## Fråga 3 – Publish-subscribe och hur det kan implementeras

Bokens avsnitt: §6.3, §6.3.1 och §6.3.2.

**Vad det är.** ==Publishers== publicerar strukturerade ==händelser== till en händelsetjänst, och
==subscribers== uttrycker intresse genom ==subscriptions==, som kan vara godtyckliga mönster över
händelserna. Systemets uppgift är att ==matcha subscriptions mot publicerade händelser== och se till att
==notifieringar== levereras rätt. En händelse kan gå till många mottagare, så det är i grunden
==en-till-många==. Boken kallar dem också *distribuerade händelsebaserade system* och säger att de är de
==mest använda== av alla indirekta tekniker i kapitlet — typiskt för finansiella informationssystem,
live-flöden som RSS, samarbete och övervakning.

**Två huvudegenskaper:**

- **Heterogenitet.** Komponenter som ==inte konstruerats för att samverka== kan fås att fungera ihop.
  Det räcker att producenterna publicerar ==vilka typer av händelser de erbjuder== och att andra
  subskriberar på mönster och kan ta emot notifieringarna.
- **Asynkronitet.** Notifieringar skickas ==asynkront==, så att publishers inte behöver
  ==synkronisera med subscribers==.

**Programmeringsmodellen** är fyra operationer: `publish(e)` sprider en händelse, `subscribe(f)` anmäler
intresse där `f` är ett ==filter== — ett mönster över alla möjliga händelser — `unsubscribe(f)` återkallar
det, och `notify(e)` är hur händelser levereras.

**Subskriptionsmodellen bestämmer uttryckskraften.** Fyra modeller, från enklast till mest kraftfull:

- **Kanalbaserad:** publishers publicerar till ==namngivna kanaler== och subscribers får allt som skickas
  dit. Primitivt, och den ==enda modellen som definierar en fysisk kanal==.
- **Topic-baserad** (ämnesbaserad): ==ett fält i notifieringen anger topic==. Likvärdig med kanalbaserad.
- **Innehållsbaserad:** filtret är en ==fråga uttryckt som villkor över värdena i händelsens attribut==,
  över flera fält. Klart mer uttrycksfullt, men ==betydligt svårare att implementera==.
- **Typbaserad:** hör samman med objektbaserade ansatser, och matchning sker på ==typ eller subtyp==.

**Implementation, del 1: var mäklaren sitter.**

- **Centraliserat:** en enda nod med en server som ==händelsemäklare== (*event broker*). ==Enkelt att
  bygga==, men ==saknar motståndskraft och skalbarhet== — mäklaren är en ==möjlig== enda felpunkt och en
  prestandaflaskhals.
- **Nätverk av mäklare:** flera mäklare som ==samarbetar==. Kan ==överleva nodfel== och har visats
  fungera i internetskala.
- **Peer-to-peer:** ingen skillnad mellan publishers, subscribers och mäklare — ==alla noder är
  mäklare==. Boken kallar det en mycket populär strategi i nyare system.

**Implementation, del 2: svårighetsgraden beror på modellen.** Kanal- och topic-baserade system är
==relativt enkla==: mappa varje kanal eller topic på en ==grupp== och använd multicast under.
Innehållsbaserade är svårare, och problemet kallas ==content-based routing== (CBR):

- **Flooding:** skicka notifieringen till ==alla noder== och matcha hos subscribern, eller flooda
  ==subscriptions bakåt== till alla publishers och matcha där. Enkelt, men ==mycket onödig nättrafik==.
- **Filtering:** mäklarna vidarebefordrar bara ==där det finns en väg till en giltig subscriber==. Det
  kräver att subscriptions sprids mot publishers och att varje nod håller ==grannlista,
  subskriptionslista och routingtabell==, plus en `match`-funktion.
- **Advertisements:** minskar filteringens trafik genom att ==advertisements sprids framåt mot
  subscribers==, symmetriskt mot hur subscriptions sprids bakåt.
- **Rendezvous:** dela upp ==händelserymden== mellan mäklarna så att varje ==rendezvous-nod== ansvarar för
  en delmängd. `SN(s)` ger noderna som ansvarar för en subscription och `EN(e)` de som matchar en
  händelse; det fungerar bara om ==de två mängderna skär varandra==. Kan mappas på en ==DHT==.
- **Informed gossip:** noder utbyter händelser ==periodiskt och slumpvis med grannarna==. Ren gossip är i
  praktiken en annan väg till flooding, men tar man hänsyn till innehållet blir det *informerat*.
  Attraktivt i ==mycket dynamiska miljöer==.

### Muntligt svar

1. Publishers publicerar strukturerade händelser, subscribers anmäler intresse med subscriptions som
   är mönster över händelserna, och systemet matchar och levererar notifieringar. Det är i grunden
   en-till-många.
2. Boken säger att det är den mest använda av alla indirekta tekniker i kapitlet — finansdata,
   RSS-flöden, samarbete och övervakning.
3. Två egenskaper bär modellen: heterogenitet, så komponenter som inte byggts för varandra kan
   samverka, och asynkronitet, så publishern aldrig behöver vänta in subscribern.
4. Operationerna är publish, subscribe, unsubscribe och notify.
5. Uttryckskraften bestäms av subskriptionsmodellen: kanalbaserad, topic-baserad, innehållsbaserad och
   typbaserad, i den ordningen mer uttrycksfulla och svårare att implementera.
6. Implementationen kan vara en central mäklare, som är enkel men blir flaskhals och enda felpunkt, ett
   nätverk av mäklare, eller helt peer-to-peer. Kanal och topic mappas enkelt på grupper, medan
   innehållsbaserat kräver content-based routing: flooding, filtering, advertisements, rendezvous med
   DHT, eller informed gossip.

## Fråga 4 – Message queuing och hur det implementeras bra

Bokens avsnitt: §6.4, §6.4.1, §6.4.2 och §6.4.3.

**Vad det är.** Där grupper och publish-subscribe är en-till-många ger message queues en
==punkt-till-punkt-tjänst== med ==kön som indirektion==: sändaren lägger meddelandet i kön och det
==plockas bort av en enda process==.

**Vad det används till.** Kallas också ==Message-Oriented Middleware==, och är en stor kommersiell klass.
Huvudanvändningen är
==Enterprise Application Integration== (EAI), att integrera tillämpningar inom ett och samma företag,
vilket möjliggörs av köernas ==inbyggda lösa koppling==. De används också mycket som grund för
==kommersiella transaktionssystem==, tack vare det inbyggda transaktionsstödet.

**Programmeringsmodellen.** Producenter `send` till en bestämd kö och konsumenter `receive` från den.
Det finns **normalt** ==tre sorters receive==: **blockerande**, **icke-blockerande** pollning och
**notify**. Kön är **normalt** ==FIFO==, men de flesta implementationer stöder också ==prioritet==.
Eftersom meddelandets kropp **normalt** är ==opak och orörd== av kösystemet uttrycks urval som
==predikat över metadata==.

**Den avgörande egenskapen: meddelanden är persistenta.** Kön ==lagrar dem obestämt== tills de
konsumeras och ==skriver dem till disk== för att möjliggöra tillförlitlig leverans. Det ger
==giltighet== — ett skickat meddelande tas så småningom emot — och ==integritet== — det som tas emot är
identiskt med det skickade och inget levereras två gånger. Men systemet ==kan inte säga något om NÄR==
leveransen sker.

**Transaktioner ovanpå det.** De flesta kommersiella system låter en send eller receive ==ingå i en
transaktion==, allt-eller-inget, vilket kräver en extern transaktionstjänst. Det är därför message
queues används så mycket för transaktionssystem. Systemen kan dessutom erbjuda
==meddelandetransformation== för att hantera olika dataformat, och säkerhet.

**Hur det implementeras bra (§6.4.2).** Nyckelfrågan är ==centraliserat eller distribuerat==. Centralt
sköts köerna av en ==köhanterare på en given nod==: fördelen är ==enkelhet==, men hanteraren kan bli en
==tungviktig komponent==, en ==flaskhals== och en ==enda felpunkt==. Bokens exempel på det distribuerade
alternativet är **WebSphere MQ**:

- Köer sköts av ==köhanterare== (*queue managers*), som tillämpningar når genom
  ==Message Queue Interface== (MQI) med operationer som `MQPUT` och `MQGET`.
- Ligger klienten på en annan maskin går den via en ==client channel==, som använder ==proxy-idén==:
  MQI-kommandon ställs till proxyn och skickas transparent till köhanteraren ==med RPC==.
- I praktiken är det **vanligare** att köhanterarna länkas ihop i en ==federerad struktur==, precis som
  publish-subscribe använder nätverk av mäklare. Det görs med **message channels** — en ==enkelriktad
  förbindelse mellan två köhanterare== som vidarebefordrar meddelanden ==asynkront==. Med routingtabeller
  i varje köhanterare går det att bygga ==godtyckliga topologier==.

**Hub-and-spoke, den topologi boken lyfter fram som mycket använd.** En köhanterare utses till ==hub==
och har tjänsterna. Klienterna kopplar ==inte upp direkt mot hubben== utan mot köhanterare som utsetts
till ==spokes==, placerade nära klienterna. Två skäl till att det är bra: klienten når sin lokala spoke
==över hög bandbredd==, typiskt ett LAN, och spoken kan till och med ligga på ==samma maskin==. Och
eftersom klient till köhanterare använder ==RPC== medan köhanterare till köhanterare är ==asynkron==,
blockeras klienten ==bara tills meddelandet ligger i den lokala köhanteraren==; resten av vägen är
asynkron men ==garanterat tillförlitlig==. Nackdelen är att ==hubben kan bli flaskhals och enda
felpunkt==, och mot det finns ==queue manager clusters== med ==implicit lastbalansering==.

**Så kan du tänka:** "implementeras bra" handlar här nästan bara om att slippa den centrala
köhanteraren. Federera köhanterarna, lägg en spoke nära varje klient så den bara blockeras en kort
stund lokalt, och låt mellanprogrammet ta det långa hoppet asynkront men garanterat.

### Muntligt svar

1. Message queues är punkt-till-punkt: sändaren lägger meddelandet i en kö och en enda process plockar
   ut det. Det skiljer dem från grupper och publish-subscribe, som är en-till-många.
2. De kallas Message-Oriented Middleware och används mest till Enterprise Application Integration och
   som grund för kommersiella transaktionssystem.
3. Modellen är send till en kö och receive från den, i tre varianter: blockerande, icke-blockerande
   pollning och notify. Kön är normalt FIFO men stöder oftast prioritet.
4. Det avgörande är att meddelanden är persistenta — de skrivs till disk och lagras tills de
   konsumeras. Det ger giltighet och integritet, men ingenting om när leveransen sker. Ovanpå det finns
   transaktioner, meddelandetransformation och säkerhet.
5. Implementeras det centralt blir köhanteraren enkel men en flaskhals och en enda felpunkt. Bra
   implementationer federerar i stället köhanterarna med enkelriktade message channels och
   routingtabeller, så man kan bygga vilken topologi man vill.
6. Hub-and-spoke är bokens exempel: klienten pratar RPC med en spoke nära sig och blockeras bara tills
   meddelandet ligger där, medan hoppet vidare till hubben är asynkront men garanterat tillförlitligt.
   Hubben kan bli flaskhals, och mot det finns kluster av köhanterare med lastbalansering.

## Fråga 5 – Jämför gruppkommunikation, publish-subscribe och message queuing

Bokens avsnitt: §6.6, figur 6.27.

**Bokens egen tabell först.** Figur 6.27 jämför alla fem stilarna. Här är de tre kolumner frågan gäller:

| Vad som jämförs | Gruppkommunikation | Publish-subscribe | Message queues |
|---|---|---|---|
| Tidsmässigt frikopplat | Möjligt | Möjligt | **Ja** |
| Kommunikationsmönster | 1-till-många | 1-till-många | **1-till-1** |
| Huvudsyfte | Tillförlitlig distribuerad beräkning | Informationsspridning eller EAI; mobila och ubikvitära system | Informationsspridning eller EAI; kommersiell transaktionsbehandling |
| Skalbarhet | Begränsad | Möjlig | Möjlig |
| Associativ | Nej | Bara innehållsbaserad publish-subscribe | Nej |

**Raden "möjligt" behöver förklaras.** Tidsmässig frikoppling beror på persistens, och bara message
queues garanterar den. I gruppkommunikation kan en mottagare i ==vissa implementationer== gå in i gruppen
när som helst och hämta upp tidigare meddelanden — ett valfritt inslag i JGroups. ==Många
publish-subscribe-system lagrar inte händelser== och är därför inte tidsmässigt frikopplade, men JMS är
ett undantag. Boken lägger också till att algoritmerna för tillförlitlighet och ==särskilt ordning== drar
ner gruppkommunikationens skalbarhet, utöver medlemskapshanteringen.

**Så kan du tänka — omgrupperingen frågan ber om.** Tentan vill ha jämförelsen ur sändarens,
mottagarens och implementatörens perspektiv, medan figur 6.27 använder sju andra axlar. Uppdelningen
nedan är därför **min**, men varje enskild uppgift i den är bokens.

**Ur sändarens perspektiv.** Alla tre skickar till en mellanhand, aldrig till en mottagare — skillnaden är
==vad sändaren kan räkna med==.

- **Gruppkommunikation:** ett multicast till gruppen, och sändaren ==vet inget om medlemmarna==. Är
  gruppen sluten måste sändaren själv vara medlem.
- **Publish-subscribe:** en strukturerad händelse, och sändaren kan ==inte veta om någon lyssnar==.
- **Message queuing:** meddelandet läggs i en namngiven kö, och sändaren vet att ==exakt en== konsument
  tar det. Sändningen kan ligga i en transaktion.

**Ur mottagarens perspektiv.** Skillnaden är ==hur mycket mottagaren får välja==.

- **Gruppmedlemmen** får ==allt== som skickas till gruppen, utan filtrering, och måste normalt finnas när
  meddelandet skickas.
- **Subscribern** ==väljer själv== med ett filter — kanal, topic, innehåll eller typ.
- **Kökonsumenten** ==konkurrerar med andra== om samma kö, kan välja på metadata, och kan hämta långt
  efteråt eftersom meddelandena är persistenta. ==Bara i kön== finns valet mellan att blockera, polla
  eller bli notifierad.

**Ur implementatörens perspektiv.** Det svåraste är olika i de tre.

- **Gruppkommunikation:** ==gruppmedlemskapet== — en korrekt bild av vilka som är med, feldetektering,
  notifiering och adressexpansion, plus tillförlitlighet och ordning. Det är detta som ==begränsar
  skalbarheten==.
- **Publish-subscribe:** ==matchning och routing== — central mäklare, nätverk av mäklare eller
  peer-to-peer.
- **Message queuing:** ==persistensen och topologin== — meddelandena måste till disk för att leveransen
  ska vara garanterad, och köhanterarna bör federeras i stället för att sitta centralt.

### Muntligt svar

1. Alla tre är indirekta och rumsligt frikopplade — man adresserar en mellanhand, inte en mottagare.
2. Det tydligaste skiljetecknet är mönstret: grupper och publish-subscribe är en-till-många, medan
   message queues är punkt-till-punkt, ett meddelande till exakt en konsument.
3. Tidsmässig frikoppling har bara message queues fullt ut, eftersom bara de garanterar persistens. För
   de andra två står det "möjligt" i boken och beror på implementationen.
4. Ur sändarens perspektiv: gruppen skickar ett multicast blint, publishern vet inte om någon lyssnar,
   och köproducenten vet att exakt en konsument tar meddelandet och kan lägga det i en transaktion.
5. Ur mottagarens perspektiv: gruppmedlemmen får allt utan filtrering, subscribern väljer själv med ett
   filter, och kökonsumenten konkurrerar med andra om samma kö men kan hämta långt efteråt.
6. Ur implementatörens perspektiv: gruppkommunikation kämpar med medlemskap och ordning, vilket
   begränsar dess skalbarhet; publish-subscribe med matchning och routing; message queuing med
   persistens och topologi. Och associativ adressering finns bara i innehållsbaserad publish-subscribe.

## Luckor och källor

**Inga luckor mot tentafrågorna.** Alla fem besvaras ur boken. Tabellen i fråga 5 är översatt ur
PDF-versionen av figur 6.27, eftersom textversionen var stympad, och varje värde är dubbelkontrollerat mot
löptexten i §6.6.

**Fråga 5:s uppdelning är min.** Boken jämför de fem stilarna på sju axlar, men aldrig ur sändarens,
mottagarens och implementatörens perspektiv. Bokens tabell står därför först, och omgrupperingen är
märkt **Så kan du tänka**.

**Medvetet utanför noten**, eftersom ingen tentafråga rör det: §6.5 om distribuerat delat minne och
tuple spaces utöver att de namnges i fråga 1, kodexemplen med brandlarmet, process- mot objektgrupper,
Electra och de andra CORBA-systemen, och de exakta algoritmerna.
