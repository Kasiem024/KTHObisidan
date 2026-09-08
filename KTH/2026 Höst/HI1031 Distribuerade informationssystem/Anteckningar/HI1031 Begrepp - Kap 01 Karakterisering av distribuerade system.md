---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-06
description: "Flashcards HI1031 kap 1, avgränsade till tentafrågorna: exempel på distribuerade system, resursdelning, de åtta utmaningarna, arvet från IP, HTTP och HTML samt internetprotokollens och RFC-seriens roll."
---
# HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system

## Vad ett distribuerat system är

**Distribuerat system** (bokens definition);;Hård- eller mjukvarukomponenter på ==nätverksanslutna datorer som samordnar sina handlingar enbart genom att skicka meddelanden==.
<!--SR:!2000-01-01,1,250!fsrs,2026-09-09T10:37:13.028Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:37:13.028Z-->

Vilka tre konsekvenser följer direkt ur definitionen av ett distribuerat system? (3)
||
- **Samtidighet** – parallell programkörning är normalfallet
- **Ingen global klocka** – ingen gemensam uppfattning om vad som är rätt tid
- **Oberoende fel** – varje komponent kan fela för sig medan de övriga kör vidare
<!--SR:!fsrs,2026-09-09T10:36:48.660Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:36:48.660Z-->

Varför kan datorerna i ett nät aldrig enas om exakt samma tid?::Den ==enda kommunikationen sker genom meddelanden== över nätet, och det sätter en gräns för hur noga klockorna kan synkroniseras.

Vad gör fel i ett distribuerat system svåra att upptäcka? (2)
||
- **Nätfel isolerar datorerna** utan att stoppa dem, och programmen kan inte avgöra om nätet fallerat eller bara blivit ovanligt långsamt
- **En krasch meddelas inte** omedelbart till de komponenter som kommunicerade med den

Vad är enligt boken den främsta drivkraften bakom att bygga distribuerade system?::==Viljan att dela resurser== – där *resurs* är ett medvetet abstrakt ord som täcker allt som är värt att dela i ett nät av datorer.

## Exempel på distribuerade system

Vilka tre distribuerade system använder kapitel 1 som fallstudier? (3)
||
- **Websökning** – Google
- **Massiva flerspelarspel** (MMOG) – EVE Online, EverQuest II
- **Finansiell handel** – händelseströmmar och automatisk aktiehandel

Vilka tre slags system pekar bokens sammanfattning ut som distribuerade? (3)
||
- **Internet** – ger användare var de än finns åtkomst till sina tjänster
- **Intranät** – varje organisation förvaltar ett, med lokala tjänster och internettjänster
- **Små system av mobila datorer** och andra små enheter på ett trådlöst nät

Vad gör websökning till ett svårt distribuerat problem?::Hela webbens innehåll ska indexeras – boken anger ==över 63 miljarder sidor== – och sedan bearbetas i en enorm databas.

Varför är MMOG-spel en svår distribuerad tillämpning?::Kravet på ==snabba svarstider==, samtidigt som många spelare ska se en konsistent värld i realtid.

**Molntjänster** (cloud computing);;Synen på ==databehandling som en nyttotjänst==: internetbaserade tjänster för program, lagring och beräkning hyrs i stället för att ägas, ofta betalt per användning.

**Klusterdator** (cluster computer);;En uppsättning ==sammankopplade datorer som samverkar tätt och framträder som en enda högpresterande resurs==, oftast byggd av standardhårdvara.
<!--SR:!fsrs,2026-09-09T09:39:01.253Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T09:39:01.253Z!2000-01-01,1,250-->

## Resursdelning: vad som delas

Vilka hårdvaruresurser nämner boken som exempel på delade resurser? (5)
||
- **Skrivare**
- **Diskar och lagringsutrymme**
- **Processorer och beräkningsnoder**
- **Digitalkamera**
- **Projektor**

Vilka mjukvaruresurser nämner boken som exempel på delade resurser? (5)
||
- **Filer**
- **Databaser** och enskilda databasposter
- **Webbsidor**
- **Söktjänst** eller valutaomvandlare
- **E-post och distribuerade kalendrar**
<!--SR:!fsrs,2026-09-08T10:50:21.005Z,0,0.04623152,9.59286876,1,3,0,0,2026-09-08T10:49:21.005Z-->

Vad är det användarna egentligen bryr sig om att dela?::==Data och tjänster på högre nivå== – en delad databas, webbsidor, en söktjänst – snarare än diskarna och processorerna som de är byggda på.
<!--SR:!fsrs,2026-09-09T09:34:51.448Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T09:34:51.448Z-->

Vilka två ytterligheter av resursdelning ställer boken mot varandra? (2)
||
- **En söktjänst på webben** – öppen för användare över hela världen som aldrig behöver ha kontakt med varandra
- **Datorstött samarbete** (CSCW) – en liten, sluten grupp som delar till exempel dokument direkt med varandra

## Resursdelning: tjänster, klienter och servrar

**Tjänst** (service);;En ==avgränsad del av ett system som förvaltar en samling relaterade resurser och erbjuder deras funktionalitet== till användare och applikationer – en filtjänst genom read, write och delete.
<!--SR:!fsrs,2026-09-08T10:49:54.253Z,0,0.00922569,9.93638689,1,5,0,0,2026-09-08T10:48:54.253Z!2000-01-01,1,250-->

Varför kan en resurs bara nås genom en bestämd uppsättning operationer?::De är ==fysiskt inkapslade i datorer== och nås bara genom kommunikation.

Varför är "klient" och "server" roller snarare än datorer?::Termerna gäller ==bara för ett enskilt anrop== – samma process kan svara som server i ett anrop och själv vara klient i nästa.
<!--SR:!fsrs,2026-09-08T10:30:17.040Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T10:29:17.040Z-->

Vad skiljer klientens och serverns beteende? (2)
||
- **Klienten är aktiv** – den gör förfrågningar, och lever bara så länge applikationen den ingår i
- **Servern är passiv** – den vaknar först när en förfrågan kommer, och körs kontinuerligt
<!--SR:!fsrs,2026-09-08T09:40:27.293Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T09:39:27.293Z-->

## De åtta utmaningarna

Vilka åtta utmaningar vid konstruktion av distribuerade system räknar boken upp? (8)
||
- **Heterogenitet**
- **Öppenhet**
- **Säkerhet**
- **Skalbarhet**
- **Felhantering**
- **Samtidighet**
- **Transparens**
- **Tjänstekvalitet**

## Heterogenitet

**Heterogenitet** (heterogeneity);;Att delarna i ett system är ==olika sinsemellan och ändå måste kunna samverka== – variation och skillnad i nät, hårdvara, operativsystem och språk.

Vilka fem slag av heterogenitet räknar boken upp? (5)
||
- **Nätverk**
- **Datorhårdvara**
- **Operativsystem**
- **Programmeringsspråk**
- **Implementationer gjorda av olika utvecklare**

Hur kan internet bestå av många olika nättyper utan att programmen märker det?::Varje ansluten dator har en ==implementation av internetprotokollen för sitt slags nät==, så skillnaderna maskeras.
<!--SR:!fsrs,2026-09-08T09:36:05.143Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T09:35:05.143Z-->

Vilket krav ställer heterogena programmeringsspråk på kommunikationen?::De har ==olika representationer av tecken och datastrukturer== som arrayer och poster.
<!--SR:!fsrs,2026-09-08T10:50:05.501Z,0,0.04623152,9.59286876,1,3,0,0,2026-09-08T10:49:05.501Z-->

Vad är middlewares roll när det gäller heterogenitet?::Ett ==mjukvarulager som maskerar skillnaderna i nät, hårdvara, operativsystem och språk== – CORBA är exemplet.
<!--SR:!fsrs,2026-09-08T10:39:32.019Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T10:38:32.019Z-->

Vilken del av heterogeniteten hanterar middleware själv?::==Skillnaderna i operativsystem och hårdvara==.

Vilken del av heterogeniteten är redan maskerad innan middleware kommer in?::==Skillnaderna mellan nätverken==, av internetprotokollen som middleware oftast är byggt ovanpå.

**Mobil kod** (mobile code);;Programkod som ==överförs från en dator till en annan och körs på mottagaren== – Java-applets är bokens exempel, och JavaScript i webbsidor den vanligaste formen idag.
<!--SR:!fsrs,2026-09-09T09:37:41.502Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T09:37:41.502Z!2000-01-01,1,250-->

Varför kan körbar kod inte flyttas rakt av mellan datorer?::Program är bundna till ==instruktionsuppsättning och operativsystem==.

Hur gör en virtuell maskin kod körbar på många slags datorer?::==Kompilatorn genererar kod för den virtuella maskinen== i stället för för en bestämd hårdvara.
<!--SR:!fsrs,2026-09-08T10:31:08.840Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T10:30:08.840Z-->

## Öppenhet

**Öppenhet** (openness);;Egenskapen som avgör ==om ett system kan utökas och omimplementeras på olika sätt==; för distribuerade system avgörs den av hur lätt nya resursdelande tjänster kan läggas till.

Vad är förutsättningen för öppenhet?::Att ==nyckelgränssnitten publiceras== – specifikation och dokumentation av komponenternas viktiga mjukvarugränssnitt görs tillgänglig för utvecklare.
<!--SR:!fsrs,2026-09-09T10:27:24.601Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:27:24.601Z-->

På vilka två nivåer kan ett öppet distribuerat system utökas? (2)
||
- **Hårdvarunivån** – fler datorer läggs till nätet
- **Mjukvarunivån** – nya tjänster införs och gamla implementeras om

Vilken risk följer med att bygga ett öppet system av komponenter från olika leverantörer?::Varje komponents ==överensstämmelse med den publicerade standarden måste testas och verifieras==.
<!--SR:!fsrs,2026-09-08T10:29:50.464Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T10:28:50.464Z-->

## Säkerhet

Vilka tre komponenter har säkerhet för informationsresurser? (3)
||
- **Konfidentialitet** – skydd mot att röjas för obehöriga
- **Integritet** – skydd mot ändring och förvanskning
- **Tillgänglighet** – skydd mot störningar av möjligheten att komma åt resurserna

Utöver att dölja innehållet i ett meddelande – vad mer måste säkerheten ge?::Att ==säkert veta identiteten== på den som meddelandet skickades för.
<!--SR:!fsrs,2026-09-08T10:29:42.185Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T10:28:42.185Z-->

Vilka två säkerhetsutmaningar är enligt boken ännu inte lösta? (2)
||
- **Överbelastningsattacker** – bemöts idag mest genom att fånga och straffa förövaren efteråt, vilket inte är någon generell lösning
- **Säkerhet för mobil kod** – effekterna av att köra ett nedladdat program är oförutsägbara

**Överbelastningsattack** (denial of service);;En attack där tjänsten ==dränks i så många meningslösa förfrågningar att seriösa användare inte kan använda den==.
<!--SR:!2000-01-01,1,250!fsrs,2026-09-09T10:48:52.029Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:48:52.029Z-->

## Skalbarhet

**Skalbar** (scalable);;Ett system som ==förblir effektivt när antalet resurser och antalet användare ökar kraftigt==.
<!--SR:!2000-01-01,1,250!fsrs,2026-09-08T09:34:19.097Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T09:33:19.097Z-->

Vilka fyra utmaningar innebär design av skalbara system? (4)
||
- **Hålla kostnaden för fysiska resurser nere**
- **Begränsa prestandaförlusten**
- **Hindra att mjukvaruresurser tar slut**
- **Undvika prestandaflaskhalsar**

Vilket krav ställer boken på resursbehovet i ett skalbart system?::Mängden fysiska resurser för *n* användare ska vara ==högst O(n)==, alltså proportionell mot n – klarar en filserver 20 användare ska två klara 40.

Hur avskaffade DNS sin föregångares flaskhals?::Namntabellen ==partitionerades mellan servrar spridda över internet== och administreras lokalt, i stället för en enda huvudfil.

Vilka två tekniker används för resurser som efterfrågas mycket ofta? (2)
||
- **Caching** – en kopia av det nyligen använda hålls nära klienten
- **Replikering** – flera kopior hålls på olika servrar
<!--SR:!fsrs,2026-09-09T10:49:36.517Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:49:36.517Z-->

**Replikering** (som skalbarhets- och feltoleransteknik);;Att ==hålla kopior av samma data på flera servrar==, så att data förblir åtkomliga även efter att en enskild server havererat.
<!--SR:!fsrs,2026-09-09T10:26:28.850Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:26:28.850Z!2000-01-01,1,250-->

## Felhantering

Varför är felhantering särskilt svårt i distribuerade system?::Felen är ==partiella== – vissa komponenter havererar medan andra fortsätter fungera.
<!--SR:!fsrs,2026-09-09T09:38:35.789Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T09:38:35.789Z-->

Vilka fem tekniker för att hantera fel räknar boken upp? (5)
||
- **Upptäcka** felet
- **Maskera** felet
- **Tolerera** felet
- **Återhämta** från felet
- **Redundans**
<!--SR:!fsrs,2026-09-09T10:28:24.505Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:28:24.505Z-->

Vad är svårigheten med att upptäcka fel?::Vissa hittas med ==checksummor==, men andra – som en kraschad fjärrserver – kan inte upptäckas alls, bara misstänkas.
<!--SR:!fsrs,2026-09-08T10:40:05.459Z,0,0.04623152,9.59286876,1,3,0,0,2026-09-08T10:39:05.459Z-->

Ge två exempel på att maskera ett fel. (2)
||
- **Skicka om** ett meddelande som inte kom fram
- **Skriva data till två diskar**, så att den andra kan vara korrekt om den ena blir förvanskad

Vad innebär det att en klient *tolererar* fel?::Den ==informerar användaren i stället för att försöka i all evighet== – som webbläsaren som inte når webbservern och låter användaren försöka igen senare.
<!--SR:!fsrs,2026-09-06T18:22:44.339Z,0,0.212,6.4133,1,1,0,0,2026-09-06T18:21:44.339Z-->

Ge två exempel på redundans i internet. (2)
||
- **Minst två olika vägar** mellan varje par av routrar
- **Varje namntabell i DNS** replikerad på minst två olika servrar

**Tillgänglighet** (availability, som mått);;==Andelen av tiden som ett system går att använda==. Distribuerade system får hög tillgänglighet av att bara det arbete som använde den trasiga komponenten drabbas.
<!--SR:!fsrs,2026-09-09T09:38:09.958Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T09:38:09.958Z!2000-01-01,1,250-->

## Samtidighet

Varför är samtidighet en utmaning och inte bara en egenskap?::Utan kontroll kan flera klienters operationer på samma resurs ==flätas in i varandra och ge inkonsistenta resultat==.

Vilket exempel på interferens ger boken vid samtidiga budgivningar?::Buden "Smith: $122" och "Jones: $111" kan flätas in i varandra och ==lagras som "Smith: $111" och "Jones: $122"==.

Hur görs ett objekt säkert i en samtidig miljö?::Dess operationer ==synkroniseras så att dess data förblir konsistenta==, med standardtekniker som semaforer.

## Transparens

**Transparens** (transparency);;Att ==dölja komponenternas separation== för användaren och applikationsprogrammeraren, så att systemet upplevs som en helhet i stället för en samling oberoende delar.

Vilka åtta former av transparens identifieras i ANSA och RM-ODP? (8)
||
- **Åtkomst** (access)
- **Lokalisering** (location)
- **Samtidighet** (concurrency)
- **Replikering** (replication)
- **Fel** (failure)
- **Mobilitet** (mobility)
- **Prestanda** (performance)
- **Skalning** (scaling)

Vilka två former av transparens är viktigast?::==Åtkomst- och lokaliseringstransparens== – deras närvaro eller frånvaro påverkar starkast hur distribuerade resurser utnyttjas.

**Nätverkstransparens**;;Det gemensamma namnet på ==åtkomst- och lokaliseringstransparens== tillsammans.
<!--SR:!fsrs,2026-09-09T10:35:29.701Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:35:29.701Z!2000-01-01,1,250-->

**Åtkomsttransparens** (access);;När ==lokala och avlägsna resurser nås med identiska operationer==.

**Lokaliseringstransparens** (location);;När en resurs kan nås ==utan kunskap om var den fysiskt eller nätverksmässigt finns== – vilken byggnad eller IP-adress.
<!--SR:!2000-01-01,1,250!fsrs,2026-09-08T10:27:54.586Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T10:26:54.586Z-->

**Feltransparens** (failure);;När ==fel döljs så att användare och program kan slutföra sina uppgifter== trots att hårdvara eller mjukvara havererat.
<!--SR:!2000-01-01,1,250!fsrs,2026-09-12T10:38:40.027Z,4,4.37161444,5.20002037,2,2,0,0,2026-09-08T10:38:40.027Z-->

**Mobilitetstransparens** (mobility);;När ==resurser och klienter kan flyttas inom systemet utan att det påverkar== användarnas eller programmens arbete.
<!--SR:!fsrs,2026-09-08T10:36:53.428Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T10:35:53.428Z!fsrs,2026-09-12T10:49:00.445Z,4,4.37161444,5.20002037,2,2,0,0,2026-09-08T10:49:00.445Z-->

Varför är en URL lokaliseringstransparent men inte mobilitetstransparent?::Den pekar ut ett ==domännamn i stället för en IP-adress==, men sidan kan inte byta domän – länkarna pekar kvar.

Hur illustrerar e-post feltransparens?::Posten ==levereras till slut även när servrar eller länkar felar== – felen maskeras genom omsändning, om det så tar flera dagar.
<!--SR:!fsrs,2026-09-09T10:36:24.572Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:36:24.572Z-->

När är transparens *inte* önskvärt?::När resursens identitet spelar roll – ett dokument skrivs normalt ut på ==en namngiven skrivare nära användaren==.
<!--SR:!fsrs,2026-09-08T10:30:00.872Z,0,0.04623152,9.59286876,1,3,0,0,2026-09-08T10:29:00.872Z-->

## Tjänstekvalitet

Vilka egenskaper avgör en tjänsts kvalitet (QoS)? (4)
||
- **Tillförlitlighet**
- **Säkerhet**
- **Prestanda**
- **Anpassningsförmåga** – till ändrade konfigurationer och varierande resurstillgång
<!--SR:!fsrs,2026-09-06T18:27:43.984Z,0,0.212,6.4133,1,1,0,0,2026-09-06T18:26:43.984Z-->

Hur har prestandadelen av QoS omdefinierats?::Från ==svarstid och beräkningsgenomströmning== till förmågan att klara *tidsgarantier*.
<!--SR:!fsrs,2026-09-08T10:37:04.012Z,0,0.04623152,9.59286876,1,3,0,0,2026-09-08T10:36:04.012Z-->

**Tidskritiska data** (time-critical data);;Dataströmmar som måste ==bearbetas eller överföras mellan processer med en fast hastighet==, till exempel videobilder som ska visas inom bestämda tidsgränser.

Vad krävs för att QoS ska kunna garanteras?::Varje kritisk resurs måste ==reserveras i förväg== av applikationen och förvaltas av en resurshanterare som ger garantier.

Vad händer med en QoS-reservation som inte kan garanteras?::Den ==avvisas==.

## Webben som fallstudie

Vilka tre standardtekniska komponenter bygger webben på? (3)
||
- **HTML** – anger sidans innehåll och layout
- **URL:er** – identifierar dokument och andra resurser
- **Klient-server-arkitektur med HTTP** – reglerna för hur webbläsare hämtar resurser från webbservrar

I vilka två avseenden är webben ett öppet system? (2)
||
- **Standarderna är fritt publicerade** och brett implementerade, så vilken läsare som helst kan hämta resurser från vilken server som helst
- **Nya slags resurser** kan publiceras och delas; nya innehållstyper hanteras med hjälpprogram och plugin-moduler
<!--SR:!fsrs,2026-09-08T10:50:32.381Z,0,0.04623152,9.59286876,1,3,0,0,2026-09-08T10:49:32.381Z-->

Varför har webben kunnat växa så mycket utan att ändra sin grundarkitektur?::Standarderna den bygger på är ==enkla och publicerades tidigt==.
<!--SR:!fsrs,2026-09-09T10:37:06.948Z,1,0.10230036,9.44205284,2,4,0,0,2026-09-08T10:37:06.948Z-->

## Arvet från HTML

Vilket arv från HTML begränsar samverkan mellan program?::En ==statisk uppsättning strukturer, bundna till hur data ska presenteras för användaren==.

Vad löser XML som HTML inte klarar?::XML är ==självbeskrivande== – det bär namnen, typerna och strukturen hos dataelementen – och representerar därför data i standardiserad, applikationsspecifik form.

Vilka två brister i webbens hypertextmodell nämner boken? (2)
||
- **Hängande länkar** – tas en resurs bort eller flyttas pekar länkarna kvar på den
- **"Lost in hyperspace"** – användaren följer många spridda länkar och tappar orienteringen
<!--SR:!fsrs,2026-09-09T10:27:16.386Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:27:16.386Z-->

Varför laddas JavaScript ned till webbläsaren i stället för att allt körs på servern?::För ==bättre interaktion med användaren== – t.ex. omedelbar återkoppling på felaktiga fält.
<!--SR:!fsrs,2026-09-06T18:14:32.687Z,0,0.212,6.4133,1,1,0,0,2026-09-06T18:13:32.687Z-->

**CGI-program** (Common Gateway Interface);;Ett program som ==webbservern kör för att generera innehåll till klienten==; det tolkar klientens argument och producerar innehåll av rätt typ, oftast HTML.

## Arvet från HTTP

Vilka fyra drag hos HTTP räknar boken upp? (4)
||
- **Begäran-svar** – klienten skickar en begäran, servern svarar med innehållet eller ett fel som 404
- **Innehållstyper** – servern anger vilken typ svaret har
- **En resurs per begäran**
- **Enkel åtkomstkontroll**
<!--SR:!fsrs,2026-09-08T10:39:45.195Z,0,0.02009384,9.85140709,1,4,0,0,2026-09-08T10:38:45.195Z-->

Vilket arv från HTTP gör att en sida med nio bilder kostar tio anrop?::==En resurs per begäran== – klienten anger exakt en resurs per HTTP-anrop.
<!--SR:!fsrs,2026-09-07T07:15:06.582Z,0,0.10088579,8.80630447,1,2,0,0,2026-09-07T07:14:06.582Z-->

Hur vet webbläsaren hur den ska behandla det servern skickar tillbaka?::Servern anger ==innehållstypen (MIME-typ)== i svaret – text/html, image/GIF, application/zip – och typerna är standardiserade i RFC 1521.

Vad är HTTP:s förvalda åtkomstkontroll?::Ingen – ==vem som helst med nätåtkomst kan nå alla publicerade resurser==.

Hur begränsar man åtkomsten till en HTTP-resurs?::Servern konfigureras att skicka en ==utmaning== som klienten måste svara på, till exempel med ett lösenord.
<!--SR:!fsrs,2026-09-09T10:26:47.122Z,1,0.23537071,8.39265542,2,3,0,0,2026-09-08T10:26:47.122Z-->

Vilka två uppgifter har en HTTP-URL? (2)
||
- **Identifiera vilken webbserver** som förvaltar resursen
- **Identifiera vilken av serverns resurser** som efterfrågas

Vad gör webben öppen med avseende på vilka slags resurser den kan nå?::==Schemabeteckningen i URL:en== – vem som helst kan införa ett nytt schema med eget protokoll, och webbläsaren utökas med en plugin för det.

Vilket arkitekturproblem får webben av sin skala?::Populära servrar får ==så många träffar per sekund att svaren blir långsamma==; motmedlen är caching och att fördela lasten över kluster.

## Arvet från IP

Vilket arv från IP måste man ta hänsyn till vid utveckling av distribuerade system?::Adressrymden sattes till ==32 bitar== och tar slut; övergången till 128 bitar kräver ändringar i många mjukvarukomponenter.
<!--SR:!fsrs,2026-09-09T10:26:40.154Z,1,0.89569643,8.38775053,2,4,0,0,2026-09-08T10:26:40.154Z-->

Varför säger boken att det inte finns någon *korrekt* lösning på IP-adressproblemet?::Det är ==svårt att förutse efterfrågan år framåt==, och att överkompensera kostar plats i meddelanden och lagring.
<!--SR:!fsrs,2026-09-08T10:37:16.236Z,0,0.11279815,8.80630447,1,2,0,0,2026-09-08T10:36:16.236Z-->

## Internetprotokollens och RFC-seriens roll

Vilken roll har internetprotokollen (IP) haft för utvecklingen av distribuerade system?::De blev den ==gemensamma standard som enades om och antogs==, så att program var som helst kan adressera varandra.

**RFC** (Request For Comments);;Serien av dokument, ==vart och ett känt genom sitt nummer==, som internetprotokollens konstruktörer införde och som utgör internets tekniska dokumentation.

Vad publicerades när i RFC-serien? (2)
||
- **Internets kommunikationsprotokoll** – i början av 1980-talet
- **Specifikationer för applikationer** ovanpå dem – filöverföring, e-post och telnet, i mitten av 1980-talet

Varför går publicering via RFC förbi den officiella standardiseringen?::Att publicera gränssnitt ==liknar standardisering men kringgår de officiella procedurerna==, som brukar vara tungrodda och långsamma.

Vilken följd har publiceringen av de ursprungliga internetprotokollen haft?::Den ==möjliggjorde att en mängd olika internetsystem och tillämpningar kunde byggas==, inklusive webben.
