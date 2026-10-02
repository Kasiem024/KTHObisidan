---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-09
description: "Svar på tentafrågorna för kapitel 1: exempel på distribuerade system, hårdvaru- och mjukvaruresurser som är värda att dela, bokens åtta utmaningar, arven från IP, HTTP och HTML, samt vilken roll IP och RFC har spelat."
---

# HI1031 Tentafrågor och Svar - Kap 01 Karakterisering av distribuerade system

Fem tentafrågor. Allt utom en del av fråga 4 finns i kapitel 1.

## 1. Ge några exempel på distribuerade system

Bokens avsnitt: 1.2 och 1.3.

Boken börjar med att nät finns överallt och bär tjänster vi tar för givna: **internet och webben,
webbsök, onlinespel, e-post, sociala nätverk och e-handel**.

**Tre exempel går boken igenom ordentligt:**

- **Webbsök.** Uppgiften är att indexera hela webbens innehåll — webbsidor, multimedia och inscannade
  böcker. Antalet sökningar har passerat ==10 miljarder per månad==, och webben uppskattas ha över
  ==63 miljarder sidor==.
- **Onlinespel med väldigt många spelare** (MMOG).
- **Finanshandel.**

**Spannet är poängen med frågan.** Boken betonar att distribuerade system går från ==lokala system==, som i en bil eller ett flygplan, till ==globala system med miljoner noder==; från ==datacentrerade==
tjänster till ==processorintensiva== uppgifter; och från ==små, enkla sensorer== till system med
==kraftfulla beräkningsdelar==.

**Tre trender ger fler exempel** (1.3): **mobil och ubiquitous computing**, **distribuerade multimediasystem**, och **distribuerad databehandling som en tjänst man köper** — alltså molnet.

### Muntligt svar

1. Börja brett: nät finns överallt och bär tjänster vi tar för givna — webben, webbsök, e-post,
   sociala nätverk, e-handel.
2. Ge bokens tre genomgångna exempel: **webbsök**, **onlinespel med många spelare** och
   **finanshandel**.
3. Ta en siffra för att visa skalan: webbsök gör över **10 miljarder sökningar i månaden** och webben
   har över **63 miljarder sidor**.
4. Visa sedan spannet, för det är det frågan egentligen är ute efter: allt från ett system i en bil
   till globala system med miljoner noder, från små sensorer till kraftfulla datorer.
5. Avsluta med trenderna: **mobilt och ubiquitous**, **multimedia**, och **molnet** som en tjänst man
   köper i stället för att äga.

Ge några exempel på distribuerade system. (4)
||
- **Börja brett** – vardagstjänster vi tar för givna, som webben och e-post
- **Tre exempel boken går igenom** – webbsök, onlinespel, finanshandel
- **Spannet är poängen** – från en bil till miljoner noder, sensor till kraftfull dator
- **Trenderna** – mobilt, multimedia, molnet

## 2. Ange 5 olika hårdvaruresurser och 5 mjukvaruresurser som kan vara intressant att dela

Bokens avsnitt: 1.4.

**Läs detta först:** boken ger ingen färdig lista på fem plus fem. Den ger exempel spridda i texten,
så listorna nedan är bokens exempel sorterade i två grupper. Säg gärna det på tentan.

**Hårdvara:** ==skrivare==, ==diskar==, ==processorer==, ==minne==, ==nätets bandbredd==.

**Mjukvara och data:** ==filer==, ==webbsidor==, ==databaser==, ==sökmotorer==, ==en
valutaomvandlare==.

**Bokens egen poäng är viktigare än listorna.** Den finns i två steg:

- **Hårdvara delar vi för att spara pengar.** Boken namnger bara två: ==diskar och skrivare==. Den
  räknar också ==videoströmmen från en digitalkamera== och ==ljudförbindelsen i ett mobilsamtal== som
  resurser, plus processorerna som gör arbetet. Det är de fem du kan svara med.
- **Men användarna bryr sig om det som ligger högre upp.** De vill dela **data** i form av en delad
  databas eller webbsidor — ==inte diskarna och processorerna som datan ligger på==. På samma sätt
  tänker de på en sökmotor eller en valutaomvandlare, ==utan att bry sig om vilken server som kör
  den==.

**Begreppet som binder ihop det:** en **tjänst** är en avgränsad del av ett datorsystem som sköter en
samling resurser som hör ihop och ==gör att man kan använda dem==. Det enda sättet att komma åt en tjänst
är ==de operationer den erbjuder== — en filtjänst har `read`, `write` och `delete`. Skälet till att det
måste vara så: resurserna ==sitter inne i datorerna== och kan bara nås ==genom kommunikation==,
så varje resurs måste skötas av ett program med ett kommunikationsgränssnitt.

**Så kan du tänka.** Skillnaden mellan de två listorna är vem som bryr sig. Hårdvaran delas för att
hålla nere kostnaden. Mjukvaran och datan delas för att folk ska kunna jobba ihop. Det är därför bokens
exempel nästan alltid är en tjänst och inte en pryl.

### Muntligt svar

1. Säg först att boken inte ger en färdig lista på fem plus fem — du sorterar bokens exempel.
2. Hårdvara: **skrivare, diskar, processorer, digitalkamerans videoström, ljudförbindelsen i ett
   mobilsamtal**.
3. Mjukvara och data: **filer, webbsidor, databaser, sökmotorer, en valutaomvandlare**.
4. Ge sedan bokens poäng: hårdvara delas **för att spara pengar**, men användarna bryr sig om det som
   ligger högre upp — de vill dela databasen, **inte disken den ligger på**.
5. Knyt till begreppet **tjänst**: en avgränsad del som sköter en samling resurser och bara går att nå
   genom **de operationer den erbjuder**. Skälet är att resurserna sitter inne i datorer och bara kan
   nås **genom kommunikation**.

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

## 3. Vilka utmaningar finns enligt boken med att bygga ett distribuerat system?

Bokens avsnitt: 1.5. Boken har ==åtta== utmaningar, en per underavsnitt.

**1. Heterogenitet.** Variation och skillnad. ==Fem== saker varierar: **nät**, **hårdvara**,
**operativsystem**, **programmeringsspråk** och **olika utvecklares implementationer**. Nätens
skillnader döljs av att alla datorer använder ==internetprotokollen==; hårdvaran skiljer sig i hur data
lagras, som ==byteordning för heltal==; operativsystemen har olika API, där UNIX-anropen inte är samma
som Windows. **Middleware** är lagret som döljer skillnaderna och ger en programmeringsabstraktion, och
CORBA är exemplet. **Mobil kod** är ett eget problem, eftersom ett program är bundet till både
instruktionsuppsättning och operativsystem — lösningen är en ==virtuell maskin==, som Javas.

**2. Öppenhet.** Avgör om systemet kan **byggas ut och göras om**. Det kräver att de viktiga
gränssnitten ==publiceras==. Se fråga 5 om RFC.

**3. Säkerhet.** Har ==tre== delar: **konfidentialitet** (skydd mot att fel personer ser datan),
**integritet** (skydd mot att den ändras eller förstörs) och **tillgänglighet** (skydd mot att någon
stör åtkomsten). Kryptering löser två saker: att skicka känslig information säkert, och att ==säkert
veta vem== som skickade ett meddelande. **Två utmaningar är ännu inte lösta:**
==överbelastningsattacker== och ==säkerheten hos mobil kod==.

**4. Skalbarhet.** Ett system är skalbart om det ==fortsätter fungera bra när antalet resurser och
användare ökar mycket==. Fyra utmaningar: håll nere **kostnaden för hårdvaran**, där resursbehovet för
*n* användare ska vara högst ==O(n)==; håll nere **prestandaförlusten**, där hierarkisk data kostar
==O(log n)== och sämre får det inte bli; **låt inte mjukvaruresurser ta slut**, där IP-adresserna är
exemplet; och **undvik flaskhalsar** genom att ==decentralisera==, som DNS gjorde när det ersatte en
enda huvudfil med ett register delat mellan servrar.

**5. Felhantering.** Det som gör det svårt: fel i ett distribuerat system är ==partiella== — vissa
delar går sönder medan andra fortsätter fungera. Fem tekniker:

- **Upptäcka** fel, till exempel med checksummor. Men en kraschad server ute på internet går inte att
  upptäcka — ==utmaningen är att klara sig med fel man bara kan misstänka==.
- **Maskera** fel: skicka om ett meddelande, eller skriv data till två diskar.
- **Tolerera** fel: webbläsaren väntar inte för evigt, den säger till användaren.
- **Återhämta** sig: rulla tillbaka data till ett dugligt läge efter en krasch.
- **Redundans**: minst två vägar mellan två routrar, varje DNS-tabell på minst två servrar.

**6. Samtidighet.** Flera klienter kan vilja åt samma resurs samtidigt. Att ta en i taget
==begränsar genomströmningen==, så man kör flera samtidigt — och då kan operationerna krocka. Bokens
exempel är två bud på en auktion, `Smith: $122` och `Jones: $111`, som utan kontroll kan hamna som
`Smith: $111` och `Jones: $122`.

**7. Transparens.** Att ==dölja att delarna är åtskilda==, så att systemet upplevs som en helhet. Boken
listar åtta former, och säger att ==de två viktigaste är access och location==, som tillsammans kallas
**nätverkstransparens**.

**8. Tjänstekvalitet.** De egenskaper som avgör hur bra tjänsten upplevs: ==tillförlitlighet,
säkerhet och prestanda==, plus ==anpassningsförmåga==. Prestanda definieras numera som förmågan att
==hålla tidsgränser==, inte bara att vara snabb.

### Muntligt svar

1. Säg att boken har **åtta** utmaningar, och räkna dem i ordning.
2. **Heterogenitet** — nät, hårdvara, operativsystem, språk och olika utvecklare varierar.
   **Middleware** döljer skillnaderna.
3. **Öppenhet** — systemet kan byggas ut, och det kräver att gränssnitten publiceras.
4. **Säkerhet** — konfidentialitet, integritet, tillgänglighet. Kryptering löser två problem, men
   **överbelastningsattacker och mobil kod är inte lösta**.
5. **Skalbarhet** — håll kostnaden vid O(n), prestandaförlusten vid O(log n), låt inte
   mjukvaruresurser ta slut, och undvik flaskhalsar genom att decentralisera.
6. **Felhantering** — det svåra är att felen är **partiella**. Fem tekniker: upptäcka, maskera,
   tolerera, återhämta, redundans.
7. **Samtidighet** — auktionsexemplet med två bud som krockar. **Transparens** — dölja att delarna är
   åtskilda; access och location är de viktigaste. **Tjänstekvalitet** — tillförlitlighet, säkerhet,
   prestanda och anpassningsförmåga, där prestanda betyder att hålla tidsgränser.

Vilka utmaningar finns enligt boken med att bygga ett distribuerat system? (4)
||
- **Få olika delar att funka ihop**
- **Hålla det säkert och växande**
- **Klara fel och krockar**
- **Hur systemet upplevs**

## 4. Vilka arv från IP, HTTP och HTML måste man ta hänsyn till vid utveckling av distribuerade system?

Bokens avsnitt: 1.6 för HTTP och HTML, 1.5.4 för IP-adresserna.

### Arvet från HTML

**HTML räcker inte när program ska prata med varandra.** Skälet: HTML har en ==fast uppsättning
byggdelar==, som stycken, och de är ==hopkopplade med hur datan ska visas för användaren==. Det gör
det går bara att bläddra med, inget annat.

**Därför behövs XML**, som är gjort för att representera data i ==standardiserad, strukturerad och
applikationsspecifik== form. XML ==beskriver sig självt==: det bär med sig namn, typer och struktur på
dataelementen.

### Arvet från HTTP

Fyra saker, och de två sista är de som kostar dig mest:

- **Fråga och svar med få metoder.** Klienten skickar en fråga med resursens URL, servern svarar med
  innehållet eller ett fel som `404 Not Found`. Metoderna är få — ==GET== för att hämta och ==POST==
  för att lämna data.
- **Innehållstyper.** Servern anger typen i svaret så att webbläsaren vet hur den ska hantera det.
  Typerna kallas ==MIME-typer== och är standardiserade i ==RFC 1521==.
- **En resurs per fråga.** Klienten anger ==en resurs per HTTP-fråga==. En sida med nio bilder ger
  alltså ==tio== frågor. Webbläsare gör därför flera frågor samtidigt för att korta väntan.
- **Öppet för alla som standard.** Vem som helst med nätförbindelse kan nå en publicerad resurs. Vill
  man begränsa måste man ==ställa in att servern skickar en utmaning==, till exempel ett lösenord.

**Så kan du tänka.** De två arven från HTTP som kostar mest är *en resurs per fråga* och *öppet som
standard*. Det första gör att en innehållsrik sida kräver många rundturer, och det är därför så mycket
av webbprestanda går ut på att slippa dem. Det andra betyder att åtkomstkontroll är något du måste
**lägga till** — inget skyddar en publicerad resurs av sig själv.

### Arvet från IP

I kapitel 1 är IP:s roll positiv, se fråga 5. Arvet som är en **begränsning** står i 1.5.4:

**Adresserna tog slut.** I slutet av 1970-talet valdes ==32 bitar== för IP-adresser, och de håller på
att ta slut. Därför införs en version med ==128 bitar==, och det ==kräver ändringar i massor av
mjukvara==. Boken är samtidigt rättvis mot de tidiga designerna: det finns ==inget rätt svar== på
problemet, eftersom man inte kan veta hur stort behovet blir år framåt — och att ta till för mycket hade
också kostat, eftersom större adresser tar plats både i meddelanden och i lagring.

**Var noga här:** att IP är *best-effort* är sant, men det står i **kapitel 3**, inte i kapitel 1. Säg
gärna var det står — det visar att du vet skillnaden.

### Muntligt svar

1. **HTML-arvet:** HTML räcker inte när program ska prata med varandra, eftersom byggdelarna är fasta
   och hopkopplade med hur saken ska visas. Därför behövs **XML**, som beskriver sig självt.
2. **HTTP-arvet, fyra saker:** fråga och svar med bara några metoder, framför allt GET och POST;
   innehållstyper som MIME-typer; **en resurs per fråga**; och **öppet för alla som standard**.
3. Ge exemplet: nio bilder på en sida ger **tio** frågor. Det är därför webbläsare frågar parallellt.
4. Och: åtkomstkontroll måste **läggas till** — servern måste ställas in att skicka en utmaning.
5. **IP-arvet:** 32 bitar valdes i slutet av 1970-talet, adresserna tar slut, och bytet till 128 bitar
   kräver ändringar i massor av mjukvara.
6. Var rättvis som boken är: det fanns **inget rätt svar**, eftersom större adresser också kostar
   plats i meddelanden och lagring.

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

## 5. Vilken roll har IP och RFC för utvecklingen av distribuerade system?

Bokens avsnitt: 1.3.1 för protokollen, 1.5.1 för att de döljer skillnaderna, 1.5.2 för RFC.

### IP:s roll: det gemensamma som gör resten möjligt

- **Ett gemensamt sätt att prata.** Program på datorer som är kopplade till internet samarbetar genom
  att skicka meddelanden, och internetprotokollen är det ==gemensamma sättet== att göra det.
- **De döljer skillnaderna mellan näten.** Internet består av många olika sorters nät, men
  skillnaderna maskeras av att ==alla datorer använder internetprotokollen==. En dator på ett
  Ethernet har en implementation av protokollen över Ethernet, en dator på ett annat nät har en
  implementation för det nätet.
- **Det är därför heterogenitet går att hantera alls.** Utan ett gemensamt protokoll skulle varje
  kombination av nät behöva sin egen lösning.

### RFC:s roll: publicering är det som gör systemet öppet

- **Öppenhet kräver publicering.** Ett system kan inte vara öppet om inte ==specifikationerna och
  dokumentationen av de viktiga gränssnitten== finns att få för utvecklare.
- **RFC är hur det gjordes.** Internetprotokollens designers införde en serie dokument kallade
  ==Requests For Comments==, var och en känd genom ett nummer. Protokollen publicerades där i
  ==början av 1980-talet==, och specifikationerna för applikationer som körde över dem — filöverföring,
  e-post, telnet — i ==mitten av 1980-talet==. Serien innehåller både diskussioner och specifikationer.
- **Varför det spelade roll:** publiceringen av de ursprungliga protokollen ==gjorde det möjligt att
  bygga en mängd olika internetsystem och applikationer, webben inräknad==. Det är svaret på frågan.
- **Publiceringen gick medvetet runt de vanliga vägarna.** Boken påpekar att publicering av gränssnitt
  liknar standardisering, men ofta ==går förbi de officiella standardiseringsprocesserna==, som brukar
  vara ==tröga och långsamma==.
- **RFC är inte det enda sättet.** ==W3C== tar fram och publicerar standarderna för webben.

**Boken sammanfattar öppenhet i tre punkter:** öppna system har ==publicerade nyckelgränssnitt==; öppna
distribuerade system bygger på ett ==gemensamt kommunikationssätt== plus publicerade gränssnitt till de
delade resurserna; och de kan sättas ihop av ==delar från olika leverantörer==, men varje dels
följsamhet mot standarden måste ==testas och verifieras noga==.

**Så kan du tänka.** De två hänger ihop som teknik och spelregel. IP är den tekniska förutsättningen:
en gemensam väg som döljer att näten är olika. RFC är den sociala: att specifikationen ligger öppen så
att vem som helst kan bygga vidare utan att fråga om lov. Webben är beviset — den kunde byggas ovanpå
utan att någon behövde ändra i internet.

### Muntligt svar

1. **IP:s roll** är att ge ett **gemensamt sätt att prata**, så att program på olika datorer kan
   samarbeta genom meddelanden — och att **dölja skillnaderna mellan näten**, eftersom alla datorer
   använder internetprotokollen. Det är förutsättningen för att kunna hantera **heterogenitet** alls.
2. **RFC:s roll** är publicering, och publicering är det som gör ett system **öppet** — utvecklare
   måste komma åt specifikationerna av de viktiga gränssnitten.
3. Konkret: protokollen publicerades som RFC i **början av 1980-talet**, applikationerna i **mitten av
   1980-talet**, och det **gjorde det möjligt att bygga webben och en mängd andra system ovanpå**.
4. Nämn att RFC medvetet gick **förbi de officiella standardiseringsprocesserna**, som är tröga, och
   att **W3C** gör samma sak för webben.
5. Avsluta med sammanfattningen: öppna system har **publicerade gränssnitt** och ett **gemensamt
   kommunikationssätt**, och kan sättas ihop av delar från olika leverantörer — men följsamheten måste
   **testas noga**.

Vilken roll har IP och RFC för distribuerade system? (3)
||
- **IP är tekniken** – vad den döljer
- **RFC är spelregeln** – varför vem som helst får bygga på den
- **Webben är beviset** – byggdes ovanpå utan att ändra i internet

## Luckor och källor

**Fråga 2 har ingen färdig lista i boken.** Boken räknar inte upp fem hårdvaruresurser och fem
mjukvaruresurser. Den nämner exempel i löpande text — skrivare, diskar, filer, webbsidor, en delad
databas, en söktjänst, en valutaomvandlare — och jag har sorterat dem i två grupper och fyllt ut
hårdvarusidan med processorer, minne och bandbredd. **Grupperingen är min.** Säg på tentan att du
delar upp bokens exempel, inte att boken har en lista.

**Fråga 4 hämtar en del utanför kapitel 1.** HTML- och HTTP-arven står i 1.6, men IP-arvet med
32-bitarsadresserna står i **1.5.4**. Att IP är *best-effort* står i **kapitel 3** — noten säger det på
plats så att du inte tillskriver kapitel 1 något det inte säger.

**Medvetet utelämnat, eftersom ingen fråga behöver det:** URL:ernas uppbyggnad i detalj, hur man
publicerar en resurs, dynamiska sidor med CGI och formulär, webbens egna designproblem med trasiga
länkar, siffertabellen över internets tillväxt, och de åtta transparensformerna en och en — noten ger
bara de två viktigaste. Kommer en följdfråga finns svaret i angivet avsnitt.
