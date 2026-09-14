---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-09
description: "Svar på tentafrågorna för HI1031 kapitel 2: trelagersarkitektur, MVC, middleware, fördelarna med klient/server och mobila agenter, med muntliga svar och en lucka där boken inte täcker MVC."
---
# HI1031 Tentafrågor och Svar - Kap 02 Systemmodeller

Fem frågor. Boken svarar på fyra. **MVC finns inte i boken alls** — se fråga 2.

## Fråga 1 — Beskriv hur en trelagersarkitektur är uppbyggd

Bokens avsnitt: 2.3.2 (Tiered architecture)

**Börja med de tre funktionsdelarna.** Boken delar en tillämpning i tre:

- **Presentationslogik** — samspelet med användaren, och vyn som visas.
- **Applikationslogik** — den tillämpningsspecifika behandlingen. Kallas också **affärslogik**, men
  boken påpekar att begreppet inte bara gäller affärssystem.
- **Datalogik** — den varaktiga lagringen, normalt i ett databashanteringssystem.

**Trelager betyder att varje del får en egen server** — en ==en-till-en-avbildning från logisk del till
fysisk server==. Skikt 1 är klientens vy och kontroller, skikt 2 en applikationsserver med
applikationslogiken, skikt 3 en databasserver med ett (ofta standardiserat) relationsgränssnitt.

**Vinsterna:**

- Applikationslogiken ligger ==samlad på ett ställe==, så mjukvaran blir ==lättare att underhålla==.
  Det är den vinst boken nämner först.
- Varje skikt har en ==väldefinierad roll==.
- Skikt 1 kan vara ==bara ett användargränssnitt==, vilket ger inbyggt stöd för **tunna klienter**.

**Kostnaderna:** ==tre servrar att hålla i drift== i stället för två, och ==mer nättrafik och högre
fördröjning== för varje operation.

**Jämför med tvåskikt, det är där poängen syns.** Där måste de tre delarna klämmas in i två processer,
normalt genom att ==applikationslogiken delas mellan klient och server==. Fördelen är ==låg
fördröjning== — ett enda meddelandeutbyte räcker för en operation. Nackdelen är att logiken ==delas
över en processgräns==, vilket begränsar vilka delar som kan anropas direkt från vilka andra.

**Det generaliserar till n-skikt:** tillämpningsområdet delas i *n* logiska delar, var och en på en
egen server. Bokens exempel är **Wikipedia**, som klarar ==upp till 60 000 sidförfrågningar per
sekund==.

**Skiktning är inte samma sak som flerskikt.** De kompletterar varandra. **Skiktning** (layering) är
==vertikal==: systemet delas i abstraktionslager, och varje lager använder bara tjänsterna i lagret
under. **Flerskikt** (tiering) ==fördelar ett enda lagers funktion== över lämpliga servrar, och i
andra hand över fysiska noder.

### Muntligt svar

1. Börja med **de tre funktionsdelarna**: presentationslogik, applikationslogik, datalogik.
2. Säg att trelager är en **en-till-en-avbildning** — klient, applikationsserver, databasserver.
3. Ge **huvudvinsten**: applikationslogiken på ett ställe, alltså lättare att underhålla. Och skikt 1
   kan vara ett rent gränssnitt, vilket ger stöd för tunna klienter.
4. Ge **priset**: tre servrar att sköta, mer nättrafik, högre fördröjning per operation.
5. Jämför med **tvåskikt**: snabbare, ett meddelandeutbyte, men applikationslogiken hamnar på två
   sidor av en processgräns. Avsluta med att det generaliserar till **n-skikt** — Wikipedia, 60 000
   sidförfrågningar per sekund.

## Fråga 2 — Beskriv hur en MVC-arkitektur är uppbyggd

Bokens avsnitt: **inget. MVC finns inte i boken.**

Svaret nedan är ==allmän kunskap om mönstret, inte bokens text==. Säg det rakt ut om du blir pressad på
var det står.

**De tre delarna:**

- **Model** — datan, reglerna för den och systemets tillstånd. Modellen vet ==inget om gränssnittet==.
- **View** — presentationen: läser ur modellen och visar den för användaren.
- **Controller** — tar emot användarens inmatning och ==översätter den till operationer på modellen==.

**Flödet:** användaren gör något i vyn → controllern tolkar det → modellen uppdateras → modellen säger
till att den ändrats → vyn läser om och ritar upp igen.

**Poängen** är att presentationen skiljs från datan. Det ger två saker: ==flera vyer kan visa samma
modell==, och modellen kan ==testas utan något gränssnitt alls==.

**Så kan du tänka.** MVC och trelager låter likt men svarar på olika frågor, och det är den enda
jämförelsen du behöver: **MVC delar upp kod efter roll inne i en tillämpning**, **trelager fördelar
funktion över servrar**. De krockar inte — View och Controller kan ligga i skikt 1, modellens logik i
skikt 2, datan i skikt 3. Kopplingen är min, inte bokens.

### Muntligt svar

1. Säg först att MVC är ett **designmönster för att strukturera en tillämpning**, och att boken inte
   tar upp det — du svarar på allmän grund.
2. **Model**: data, regler och tillstånd, utan kännedom om gränssnittet.
3. **View**: läser ur modellen och visar den. **Controller**: tar inmatning och omvandlar den till
   operationer på modellen.
4. Beskriv **flödet**: användaren agerar i vyn, controllern tolkar, modellen uppdateras, vyn ritas om.
5. Ge **poängen**: flera vyer kan visa samma modell, och modellen går att testa utan gränssnitt. Får du
   följdfrågan om trelager: MVC delar upp **kod efter roll**, trelager fördelar **funktion över
   servrar**.

## Fråga 3 — Vad är Middleware?

Bokens avsnitt: 2.3.2 (definitionen i skiktningsavsnittet), 2.3.3, samt 1.5.1

**Definitionen**, från 1.5.1 och upprepad i 2.3.2: ett ==lager av mjukvara vars syfte är att dölja
heterogenitet och ge programmerarna en bekväm programmeringsmodell==.

**Konkret** är det ==processer eller objekt på en uppsättning datorer== som pratar med varandra för att
åstadkomma kommunikation och resursdelning för distribuerade tillämpningar.

**Var det sitter.** Fyra lager, nedifrån och upp: ==hårdvara → operativsystem → middleware →
tillämpningar och tjänster==. Hårdvara plus operativsystem kallas **plattform**, och boken ger fem
exempel — bland dem Intel x86/Windows, Intel x86/Linux och ARM/Symbian.

**Vad det höjer nivån på**, i stället för råa meddelanden: **fjärranrop**, **gruppkommunikation**,
**händelsenotifieringar**, **uppdelning, placering och hämtning** av delade dataobjekt,
**replikering**, och **överföring av multimediadata i realtid**. **Uppgiften, som boken formulerar den
i 2.3.3:** ge en ==högre programmeringsabstraktion==, och genom skiktning ==abstrahera bort
heterogeniteten== för att främja **interoperabilitet** och **portabilitet**.

**Sex kategorier**, med exempelsystem: **distribuerade objekt** (CORBA, Java RMI, standarden RM-ODP),
**distribuerade komponenter** (Fractal, OpenCOM, EJB, JBoss), **publish-subscribe** (CORBA Event
Service), **meddelandeköer** (Websphere MQ), **webbtjänster** (Apache Axis, Globus Toolkit),
**peer-to-peer** (Pastry, Tapestry, Gnutella). Indelningen styrs av ==vilka enheter som kommunicerar
och vilket kommunikationsmönster== de använder, och kategorierna är ==inte exakta== — moderna
plattformar är hybrider. Middleware ger också **infrastrukturtjänster**: CORBA har tjänster för
säkerhet och tillförlitlighet.

**Gränsen för vad middleware kan lösa: end-to-end-argumentet.** Det är följdfrågan att vara beredd på.
Saltzer, Reed och Clarke (1984), som boken skriver om med egna ord: vissa funktioner som rör
kommunikation kan ==bara göras helt och tillförlitligt med hjälp från tillämpningen i ändpunkterna==, så
att lägga en sådan funktion i själva kommunikationssystemet är ==inte alltid rimligt==. Bokens exempel är
**e-post med stora bilagor**: TCP hittar och rättar en del fel men ==klarar inte större nätavbrott==, så
posttjänsten lägger på egen feltolerans — den ==håller reda på hur långt överföringen kommit och
fortsätter över en ny TCP-förbindelse== om den gamla bryts.

Slutsatsen: argumentet ==går emot idén att all kommunikation kan abstraheras bort== med tillräckligt
bra middleware. Vissa kontroller behöver komma åt data ==inne i tillämpningens eget adressrum==; görs
de bara i kommunikationssystemet blir de ofullständiga och arbetet dubbleras.

### Muntligt svar

1. Ge **definitionen**: ett mjukvarulager som döljer heterogenitet och ger programmeraren en bekväm
   programmeringsmodell.
2. Placera det: **ovanpå operativsystemet, under tillämpningarna**. Hårdvara plus operativsystem är
   plattformen.
3. Säg **vad det ger**: fjärranrop, gruppkommunikation, händelsenotifieringar, replikering — i stället
   för att man skickar råa meddelanden själv. Syftet i två ord: interoperabilitet och portabilitet.
4. Ge **två eller tre kategorier med exempel**: distribuerade objekt med CORBA och Java RMI,
   meddelandeköer med Websphere MQ, webbtjänster med Apache Axis.
5. Avsluta med **gränsen**: end-to-end-argumentet. Vissa funktioner kan bara göras rätt i
   ändpunkterna — e-post måste lägga på egen feltolerans ovanpå TCP, som inte klarar längre avbrott.

## Fråga 4 — Vad är fördelarna med en klient/server-lösning?

Bokens avsnitt: 2.3.1 (Roles and responsibilities, samt Placement)

Boken har ==ingen punktlista över fördelar==. Den säger fördelen i en mening och ägnar resten åt
svagheten.

**Fördelen, med bokens ord:** ett ==direkt och relativt enkelt sätt att dela data och andra resurser==.
Därför kallar boken den ==historiskt viktigaste==, ==mest citerade== och ==mest använda== arkitekturen.
Rollerna är enkla att resonera om: klientprocesser vänder sig till enskilda serverprocesser, som kan
ligga på andra datorer, för att komma åt de resurser servern sköter.

**Den går att bygga i lager: en server kan själv vara klient.** Det ger flest följdfrågor, och boken
har tre exempel — en **webbserver** är ofta klient hos en lokal filserver som lagrar sidorna;
webbservrar är **klienter hos DNS**; en **söktjänst är både server och klient**, den svarar på frågor
från webbläsare och kör samtidigt *web crawlers* som är klienter hos andra webbservrar.

**Den drar nytta av samtidighet.** I söktjänstexemplet är serveruppgiften och crawler-uppgiften ==helt
oberoende==: de behöver knappt synkroniseras och kan köra samtidigt i egna trådar. **Och nämn
transparensen:** RPC och RMI, de vanliga sätten att bygga klient/server, ger ==minst åtkomst- och
lokaliseringstransparens== — programmeraren anropar som om operationen låg lokalt.

**Den går att förbättra med placering.** Fyra strategier, som i praktiken är fördelar eftersom de låter
grundmodellen bära mer last. **Flera servrar**: objekten kan ==delas upp== eller ==replikeras== —
webben delar upp, varje server sköter sina egna resurser, medan Sun NIS replikerar och varje server har
en kopia av lösenordsfilen. **Caching**: ett ==lager av nyligen använda objekt närmare klienten==, och
proxyservrar ger en delad cache som ==ökar tillgänglighet och prestanda genom att minska lasten== på
nätet och webbservrarna. **Mobil kod**: körs lokalt hos klienten och ger ==bra svarstider==, eftersom
man slipper nätets fördröjning och varierande bandbredd. **Mobila agenter**: se fråga 5.

**Svagheten måste med.** Klient/server ==skalar dåligt==: en tjänst på en enda adress kan ==inte växa
förbi kapaciteten hos värddatorn och bandbredden i dess nätanslutning==. Placeringsstrategierna hjälper
men löser inte grundproblemet — det gör **peer-to-peer**, som hör till kapitel 10.

### Muntligt svar

1. Ge **kärnfördelen** med bokens formulering: ett direkt och relativt enkelt sätt att dela data och
   resurser. Därför är den den mest använda arkitekturen.
2. Säg att **rollerna är enkla**: klienten frågar, servern sköter resursen och svarar.
3. Ge **komponerbarheten**: en server kan själv vara klient. Webbservern är klient hos filservern och
   hos DNS, och en söktjänst är både server och klient.
4. Ge **placeringsstrategierna** som gör den uthållig: flera servrar med uppdelning eller replikering,
   caching i proxyservrar, mobil kod. Nämn att RPC och RMI ger åtkomst- och lokaliseringstransparens.
5. Avsluta med **svagheten**: den skalar dåligt, eftersom en tjänst på en adress inte kan växa förbi
   värddatorns kapacitet och bandbredd. Det är skälet till att peer-to-peer finns.

## Fråga 5 — Vad är en mobil agent?

Bokens avsnitt: 2.3.1 (Placement, Mobile agents)

**Definitionen:** ett ==körande program, både kod och data==, som ==reser från dator till dator i ett
nät== och utför en uppgift ==för någons räkning== — till exempel samlar information — och ==till slut
kommer tillbaka med resultatet==.

**Mekanismen, och hela vinsten:** agenten gör ==många anrop mot lokala resurser på varje plats den
besöker==, till exempel läser enskilda databasposter. Jämfört med en ==stillasittande klient som gör
fjärranrop== och kanske flyttar stora mängder data blir vinsten ==lägre kommunikationskostnad och
kortare tid, eftersom fjärranrop byts mot lokala anrop==.

**Bokens två exempel:** att ==installera och underhålla mjukvara== på datorerna i en organisation, och
att ==jämföra priser== hos flera leverantörer genom att besöka varje plats och köra databasoperationer.

**Två säkerhetsproblem, i olika riktningar. Ha båda.**

- **Agenten är ett hot mot värden**, precis som mobil kod. Miljön som tar emot den måste ==bestämma
  vilka lokala resurser den får använda==, och det avgörs av ==vem agenten agerar för==. Därför måste
  identiteten följa med ==säkert tillsammans med agentens kod och data==. (Hur begränsningen görs i
  praktiken står i 11.1.1, utanför det här kapitlet.)
- **Agenten är själv utsatt.** Den kan ==misslyckas med uppgiften om den nekas åtkomst== till
  information den behöver.

**Boken tvivlar på nyttan, och det är poängen som imponerar.** Uppgifterna kan göras på andra sätt:
*web crawlers* som behöver komma åt resurser på webbservrar över hela internet fungerar ==bra med
vanliga fjärranrop==. Bokens slutsats är att ==användbarheten hos mobila agenter kan vara begränsad==.

**Skilj mobil agent från mobil kod.** Mobil kod ==laddas ned och körs hos mottagaren== — appleten är
exemplet, och en variant är *push*-modellen där servern tar initiativet, som mäklaren vars applet visar
aktiekurser. En mobil agent ==bär med sig sin data, flyttar sig vidare och arbetar för någons räkning==.

### Muntligt svar

1. Ge **definitionen**: ett körande program med både kod och data, som reser mellan datorer, utför en
   uppgift för någons räkning och kommer tillbaka med resultatet.
2. Ge **mekanismen och vinsten**: på varje plats gör den många **lokala** anrop i stället för
   fjärranrop, vilket ger lägre kommunikationskostnad och kortare tid.
3. Ge ett **exempel**: jämföra priser hos flera leverantörer, eller installera mjukvara i en
   organisation.
4. Ge **båda säkerhetsproblemen**: agenten är ett hot mot värden, som måste veta vem den agerar för —
   och agenten är själv utsatt, den kan nekas information den behöver.
5. Avsluta med **bokens tvivel**: samma uppgifter går att lösa med vanliga fjärranrop, som web
   crawlers gör, så nyttan kan vara begränsad.

## Luckor och källor

**MVC finns inte i boken — den enda riktiga luckan i kapitel 2.** Verifierat med fyra olika sökningar.
Svaret på fråga 2 är därför ==allmän kunskap, inte bokens==, och jämförelsen mellan MVC och trelager är
min egen. Säg det om examinatorn frågar var du läst det.

**Fråga 4 har inget listat svar i boken.** Fördelen står i en enda mening — "ett direkt och relativt
enkelt sätt att dela data och andra resurser" — och sedan ägnas mer plats åt att modellen skalar
dåligt. Allt annat i svaret är hämtat ur boken, men **sammanställningen till en fördelslista är min**.

**Två följdfrågor materialet inte kan svara på.** Boken ger ==inget namngivet treskiktssystem== —
Wikipedia nämns som n-skikt, inte som treskikt. Och ==hur middleware tekniskt döljer heterogeniteten==
(stubbar, marshalling) hör till kapitel 5, inte hit.

**Det som inte är utskrivet här** frågas inte av någon tentafråga: fysiska modeller och de tre
generationerna, de fundamentala modellerna, peer-to-peer som hör till kapitel 10, virtual network
computing, mönstren *proxy*, *brokerage* och *reflection*, samt Ajax-kodexemplet.
