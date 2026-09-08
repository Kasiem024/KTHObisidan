---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
description: "Svar på kursens tentafrågor för kapitel 2 med bokens avsnitt angivna: trelagersarkitektur, MVC, middleware, klient/server och mobila agenter."
created: 2026-09-08
updated: 2026-09-08
---
# HI1031 Tentafrågor och Svar - Kap 02 Systemmodeller

Allt här är avgränsat till kursens fem tentafrågor för kapitel 2. Fakta kommer från
*Distributed Systems: Concepts and Design* (5th ed) och avsnittsnumret står under varje fråga.
Står något inte i boken sägs det uttryckligen.

Examinationen är **muntlig och enskild**, så varje fråga har både faktapunkter att skriva av och
en talordning att öva högt.

---

## 1. Beskriv hur en trelagersarkitektur är uppbyggd

Bokens avsnitt: **2.3.2**

**Först: skiktning är inte samma sak som flerskikt.** Boken skiljer på två ord som låter lika:

- **Skiktning** (*layering*) är en ==vertikal== uppdelning i abstraktionslager, där varje lager
  använder tjänsterna i lagret under och är omedvetet om lagren nedanför.
- **Flerskikt** (*tiering*) är en teknik för att organisera funktionen i *ett* lager och placera
  den på lämpliga servrar, och i andra hand på fysiska noder.

De är komplementära. Trelagersarkitektur handlar om det andra.

**Den funktionella uppdelningen** av en tillämpning görs i tre delar:

1. **Presentationslogik** – hanterar användarens interaktion och uppdaterar den vy av
   tillämpningen som visas för användaren.
2. **Applikationslogik** – den detaljerade, tillämpningsspecifika behandlingen. Kallas också
   affärslogik, men begreppet är inte begränsat till affärstillämpningar.
3. **Datalogik** – den varaktiga lagringen, typiskt i ett databashanteringssystem.

**Tvåskikt** (jämförelsen examinatorn väntar på): de tre delarna måste delas upp på *två*
processer, klient och server. Det görs vanligen genom att ==applikationslogiken delas==, med en
del hos klienten och resten hos servern.

- **Fördel:** låg fördröjning – det räcker med ett enda meddelandeutbyte för att utföra en
  operation.
- **Nackdel:** applikationslogiken delas över en processgräns, vilket begränsar vilka delar av
  logiken som kan anropas direkt från vilka andra delar.

**Treskikt:** det finns en ==en-till-en-avbildning från logisk del till fysisk server==.

- Applikationslogiken ligger därmed **samlat på ett ställe**, vilket förbättrar
  underhållbarheten.
- Varje skikt har en väldefinierad roll. Tredje skiktet är helt enkelt en databas som erbjuder
  ett (potentiellt standardiserat) relationsgränssnitt.
- Första skiktet kan vara ett enkelt användargränssnitt, vilket ger inbyggt stöd för
  **tunna klienter**.
- **Nackdelar:** ökad komplexitet i att förvalta tre servrar, samt ökad nättrafik och
  fördröjning för varje operation.

**Generaliseringen:** samma resonemang ger *n*-skikt, där en tillämpningsdomän delas i *n*
logiska delar som var och en avbildas på ett serverelement. Bokens exempel är **Wikipedia**, som
använder flerskikt för att klara upp till **60 000 sidförfrågningar per sekund**.

Kopplat till [[Middleware]]: bokens kategori *application servers* ger direkt stöd för
treskiktsarkitektur, genom att strukturera upp separationen mellan applikationslogik och
datalagring.

### Muntligt svar

1. Tre funktionsdelar: presentation, applikationslogik, datalogik.
2. I treskikt avbildas varje del på sin egen server – klient, applikationsserver, databasserver.
3. Vinsten är att applikationslogiken ligger på ett ställe, vilket ger underhållbarhet.
4. Tredje skiktet är bara en databas med relationsgränssnitt; första skiktet kan vara ett tunt
   gränssnitt, vilket ger stöd för tunna klienter.
5. Priset är tre servrar att förvalta, mer nättrafik och högre fördröjning per operation.
6. Jämför med tvåskikt: där måste applikationslogiken delas över en processgräns – snabbare,
   men logiken hänger ihop sämre.
7. Skalar man vidare får man *n*-skikt, som Wikipedia.

---

## 2. Beskriv hur en MVC-arkitektur är uppbyggd

Bokens avsnitt: **finns inte**.

**Säg detta först på tentan.** MVC beskrivs inte i kursboken. En sökning i hela boken ger noll
träffar på *MVC*, *Model-View-Controller* och *Model/View*. Boken behandlar arkitektur i termer
av skiktning, flerskikt och tunna klienter (2.3.2) — inte MVC.

**Var MVC hör hemma i kursen i stället:**

- Den **tillämpade delen** enligt KursPM, vecka 41–43: *ASP.NET MVC, MVVM-mönstret samt
  Object-Relational Mapping med Entity Framework*. Det är där mönstret examineras.
- REST-källan (restfulapi.net) är kurslitteratur för kapitel 9. Den nämns som möjlig plats där
  MVC tas upp som exempel på ett *layered system* — **obekräftat**, den källan finns inte i det
  här vaultet, så verifiera i notebooken eller på sajten innan du använder det som argument.

**Mönstret, för att kunna svara ändå** (utanför boken, säg att det är det):

- **Model** – data och den logik som verkar på datan.
- **View** – presentationen av datan för användaren.
- **Controller** – tar emot användarens indata, uppdaterar modellen och väljer vy.

**Den distinktion som är värd poäng:** MVC är en uppdelning av *kod* inom en tillämpning, alltså
logisk. Trelagersarkitektur är en uppdelning över *maskiner*, alltså fysisk placering. Med bokens
ord är MVC närmast skiktning, inte flerskikt. Ett vanligt fel är att svara att MVC "är" en
trelagersarkitektur — de tre rollerna avbildas inte på tre servrar.

### Muntligt svar

1. Boken tar inte upp MVC – det ligger i kursens tillämpade del, ASP.NET MVC.
2. Model är data och logik, View är presentationen, Controller tar emot indata och styr.
3. Controllern uppdaterar modellen; vyn visar modellens tillstånd.
4. Skillnaden mot treskikt: MVC delar upp kod inom en tillämpning, treskikt delar upp funktion
   över servrar.
5. Med bokens begrepp är MVC alltså skiktning snarare än flerskikt.

---

## 3. Vad är Middleware?

Bokens avsnitt: **1.5.1** (definitionen), **2.3.2** (placeringen i lagermodellen), **2.3.3**
(kategorier och gränser)

**Definitionen, bokens egen:** ett lager av mjukvara vars syfte är att ==maskera heterogenitet==
och att erbjuda en bekväm programmeringsmodell för applikationsprogrammerare.

**Var det ligger** (figur 2.7, nedifrån och upp): datorer och nätverkshårdvara → operativsystem →
middleware → tillämpningar och tjänster. Lagret under middleware kallar boken *plattform*: de
lägsta hård- och mjukvarulagren, till exempel Intel x86/Linux eller ARM/Symbian.

**Hur det fungerar:** middleware representeras av processer eller objekt i en mängd datorer som
interagerar med varandra. Den höjer nivån på programmens kommunikation genom abstraktioner som:

- fjärrmetodanrop – se [[Fjärrmetodanrop (RMI)]]
- kommunikation inom en grupp av processer
- notifiering av händelser
- partitionering, placering och hämtning av delade dataobjekt mellan samverkande datorer
- replikering av delade dataobjekt
- överföring av multimediadata i realtid

**Kategorier** (figur 2.12) — indelningen styrs av valet av kommunicerande enheter och
kommunikationsparadigm, och följer fem av arkitekturmodellerna plus peer-to-peer:

| Kategori | Exempelsystem |
| --- | --- |
| Distribuerade objekt | CORBA, Java RMI |
| Distribuerade komponenter | EJB, JBoss |
| Publish-subscribe | CORBA Event Service |
| Meddelandeköer | WebSphere MQ |
| Webbtjänster | Apache Axis |
| Peer-to-peer | Pastry, Tapestry |

Två namn räcker per rad — CORBA och Java RMI är de enda du behöver kunna säkert. Boken understryker
att indelningen **inte är exakt** och att moderna plattformar är hybrider.

Middleware kan också erbjuda **infrastrukturtjänster**, inte bara programmeringsabstraktioner –
CORBA har till exempel tjänster för säkerhet och tillförlitlighet.

**Gränsen för vad middleware kan göra – *end-to-end*-argumentet** (Saltzer, Reed och Clarke 1984,
återgivet i 2.3.3). Detta är fallgropen i frågan:

- Vissa kommunikationsrelaterade funktioner kan bara implementeras fullständigt och tillförlitligt
  ==med hjälp av tillämpningen i ändpunkterna==. Att lägga funktionen i kommunikationssystemet
  självt är därför inte alltid vettigt.
- Argumentet går rakt emot uppfattningen att all kommunikation kan abstraheras bort med
  tillräckligt bra middleware.
- Kärnan: korrekt beteende beror på kontroller, felkorrigering och säkerhetsåtgärder på många
  nivåer, och vissa av dem kräver åtkomst till data inne i tillämpningens adressrum. Kontroller
  bara i kommunikationssystemet garanterar därför **en del** av den önskade korrektheten, och
  arbetet dubbleras troligen i tillämpningen.

### Muntligt svar

1. Ett mjukvarulager mellan operativsystemet och tillämpningarna.
2. Två uppgifter: maskera heterogenitet, och ge programmeraren en bekväm programmeringsmodell.
3. Konkret betyder det abstraktioner som fjärrmetodanrop, gruppkommunikation, händelser och
   replikering – i stället för råa sockets.
4. Exempel: CORBA och Java RMI för distribuerade objekt, EJB för komponenter, WebSphere MQ för
   meddelandeköer.
5. Men middleware kan inte ta över allt: *end-to-end*-argumentet säger att vissa kontroller bara
   kan göras i ändpunkterna, eftersom de kräver data inne i tillämpningen.
6. Därför gör man kontrollen i applikationslagret även om nätverket lovar tillförlitlighet.

---

## 4. Vad är fördelarna med en klient/server-lösning?

Bokens avsnitt: **1.4** (grundmodellen), **2.3.1** (rollerna och avvägningen)

Se även [[Klient-server-modellen]].

**Grundmekanismen (1.4):** en **server** är en process på en nätverksansluten dator som tar emot
förfrågningar från program på andra datorer, utför en tjänst och svarar. De begärande processerna
kallas **klienter**. En komplett interaktion från förfrågan till svar kallas ett **fjärranrop**
(*remote invocation*).

- **Klienter är aktiva** – de gör förfrågningar. **Servrar är passiva** – de vaknar bara när en
  förfrågan kommer.
- Servrar kör kontinuerligt; klienter lever bara så länge som tillämpningen de ingår i.
- Rollerna gäller **bara för en enskild förfrågan** – samma process kan vara både klient och
  server.

**Fördelarna, i den ordning boken ger dem:**

1. **Enkelhet.** Klient-server är "ett direkt och relativt enkelt sätt" att dela data och andra
   resurser. Det är historiskt den viktigaste arkitekturen och fortfarande den mest använda.
2. **Kontrollerad åtkomst.** En **tjänst** är en avgränsad del av systemet som förvaltar en
   samling relaterade resurser och exponerar dem *endast* genom en väldefinierad mängd
   operationer – en filtjänst har `read`, `write`, `delete`. Varje resurs måste förvaltas av ett
   program som erbjuder ett kommunikationsgränssnitt, så att resursen kan nås och uppdateras
   ==tillförlitligt och konsistent==.
3. **Konsistens och förvaltning.** Bokens EVE Online-exempel (1.2.2): den centraliserade
   arkitekturen hjälper avsevärt med att förvalta den virtuella världen, och den enda kopian av
   tillståndet gör konsistensfrågorna enklare.
4. **Sammansättbarhet.** Servrar kan i sin tur vara klienter hos andra servrar. En webbserver är
   ofta klient hos en lokal filserver; de flesta internettjänster är klienter hos DNS. En sökmotor
   är både server och klient – den svarar på frågor från webbläsare och kör *web crawlers* som är
   klienter hos andra webbservrar.
5. **Samtidighet.** En typisk sökmotor kör många samtidiga trådar, några som betjänar klienter och
   andra som kör crawlers, utan att de behöver synkroniseras.

**Nackdelen du måste nämna själv:** modellen ==skalar dåligt==. Centraliseringen av tjänsten på en
enda adress skalar inte bortom kapaciteten hos den dator som är värd för tjänsten och bandbredden
i dess nätverksanslutning. Se [[Skalbarhet]].

- Placeringsstrategier som flera servrar och cachning mildrar problemet, men adresserar inte
  grundfrågan: att delade resurser måste spridas mycket bredare.
- Det är just den insikten som leder till [[Peer-to-peer]], där resurserna som är tillgängliga för
  tjänsten *växer med antalet användare*.

### Muntligt svar

1. Servern förvaltar resursen och är passiv; klienten är aktiv och gör fjärranrop.
2. Första fördelen är enkelhet – det är det direktaste sättet att dela en resurs, och det mest
   använda.
3. Andra fördelen är kontrollerad åtkomst: tjänsten exponerar bara en väldefinierad mängd
   operationer, så resursen kan uppdateras tillförlitligt och konsistent.
4. Tredje fördelen är konsistens och förvaltning – en enda kopia av tillståndet, som i EVE Online.
5. Fjärde fördelen är att servrar kan vara klienter hos andra servrar, som en sökmotor som både
   svarar och crawlar.
6. Nackdelen är att den skalar dåligt: allt hänger på en adress, en dator och dess bandbredd.
7. Det är därför peer-to-peer finns – där växer resurserna med antalet användare.

---

## 5. Vad är en mobil agent?

Bokens avsnitt: **2.3.1**, under *Placement*

**Sammanhanget:** boken tar upp fyra placeringsstrategier – avbildning av tjänster på flera
servrar, cachning, mobil kod och mobila agenter. Agenten är den fjärde.

**Definitionen, bokens egen:** ett ==körande program, inklusive både kod och data==, som färdas
från en dator till en annan i ett nätverk och utför en uppgift för någons räkning, till exempel
att samla information, och till slut återvänder med resultatet.

**Mekanismen och vinsten:** agenten kan göra många anrop till **lokala** resurser på varje plats
den besöker, till exempel läsa enskilda databasposter. Jämför med en statisk klient som gör
fjärranrop och möjligen överför stora datamängder: vinsten är ==minskad kommunikationskostnad och
kortare tid==, genom att fjärranrop byts mot lokala anrop.

**Bokens exempel på användning:**

- installera och underhålla mjukvara på datorerna i en organisation
- jämföra priser hos flera leverantörer genom att besöka varje leverantörs plats och utföra en
  serie databasoperationer
- en tidig variant av samma idé är *worm*-programmet från Xerox PARC (Shoch och Hupp 1982), som
  skulle utnyttja lediga datorer för tunga beräkningar

**Skilj från mobil kod**, som är den tredje strategin: en applet vars kod ligger på en webbserver,
laddas ner till webbläsaren och körs där. Fördelen är god interaktiv respons, eftersom den inte
drabbas av nätets fördröjning eller varierande bandbredd. Mobil kod flyttas alltså *ut* till
klienten; en mobil agent flyttar sig själv *vidare* mellan värdar.

**Begränsningarna – detta är halva svaret:**

- Mobila agenter är, precis som mobil kod, ett **säkerhetshot mot resurserna** i de datorer de
  besöker. Den mottagande miljön måste avgöra vilka lokala resurser agenten får använda, baserat
  på identiteten hos den användare agenten agerar för – och den identiteten måste följa med kod
  och data på ett säkert sätt.
- Agenten är också själv **sårbar**: den kanske inte kan slutföra sin uppgift om den nekas åtkomst
  till den information den behöver.
- Uppgifterna kan utföras på andra sätt. Webbcrawlers som behöver komma åt resurser på webbservrar
  över hela internet fungerar utmärkt med vanliga fjärranrop.
- Bokens slutsats: **användbarheten för mobila agenter kan därför vara begränsad.**

### Muntligt svar

1. Ett körande program med både kod och data, som flyttar sig mellan datorer och utför en uppgift
   för någons räkning.
2. Den återvänder till slut med resultatet.
3. Vinsten är att den gör sina anrop lokalt på varje värd i stället för över nätet, vilket sänker
   kommunikationskostnaden och tiden.
4. Exempel: underhålla mjukvara i en organisation, eller jämföra priser genom att besöka varje
   leverantör.
5. Skilj från mobil kod, en applet som laddas ner till klienten och körs där.
6. Problemet är säkerhet i båda riktningarna: agenten hotar värdens resurser, och värden kan neka
   agenten det den behöver.
7. Och uppgiften kan oftast lösas med vanliga fjärranrop, som webbcrawlers gör – därför är
   användningen begränsad.

---

## Luckor och källor

- **Fråga 2 (MVC) är den enda luckan.** Mönstret finns inte i kursboken. Innehållet ovan kommer
  från kursens tillämpade del enligt KursPM och är markerat som utanför boken. Att REST-källan
  nämner MVC är **obekräftat** här.
- Allt övrigt är hämtat ur boken, avsnitt 1.2.2, 1.4, 1.5.1, 2.3.1, 2.3.2 och 2.3.3.
- Siffran 60 000 sidförfrågningar per sekund och årtalet 1982 står i boken. Inga andra tal
  förekommer i svaren, och inga formler – boken ger inga formler för det här kapitlets frågor.
- Utanför tentafrågorna, och därför medvetet utelämnat: fysiska modeller (2.2), fundamentala
  modeller (2.4) med interaktions-, fel- och säkerhetsmodell, samt kommunikationsparadigm och
  peer-to-peer i detalj. Kortformen av peer-to-peer finns bara som kontrast i fråga 4.
