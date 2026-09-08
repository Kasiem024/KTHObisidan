---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-06
description: "Flashcards HI1031 kap 2, avgränsade till tentafrågorna om arkitektur: trelagersarkitektur, MVC, middleware, fördelarna med klient/server och mobila agenter."
---
# HI1031 Begrepp - Kap 02 Systemmodeller

## Trelagersarkitektur

Vilka tre funktionsdelar delas en tillämpning upp i vid flerskiktsarkitektur? (3)
||
- **Presentationslogik** – användarens interaktion och vyn som visas
- **Applikationslogik** – den tillämpningsspecifika behandlingen, även kallad affärslogik
- **Datalogik** – den varaktiga lagringen, normalt i ett databashanteringssystem

I en trelagerslösning finns en *en-till-en-avbildning* från logisk del till fysisk server – vilka är de tre skikten? (3)
||
- **Skikt 1** – klientens användargränssnitt och kontroller
- **Skikt 2** – en applikationsserver med applikationslogiken
- **Skikt 3** – en databasserver som erbjuder ett relationsgränssnitt

Hur fördelas de tre funktionsdelarna i en tvåskiktslösning?::De måste delas upp på två processer, vilket normalt görs genom att ==applikationslogiken delas mellan klienten och servern==.

Vad är fördelen med tvåskikt?::==Låg fördröjning== – det räcker med ett enda meddelandeutbyte för att utföra en operation.

Vad är nackdelen med tvåskikt?::Applikationslogiken ==delas över en processgräns==, vilket begränsar vilka delar av logiken som kan anropas direkt från vilka andra delar.

Vilken är den största vinsten med treskikt?::Applikationslogiken ligger ==samlad på ett enda ställe==, vilket gör mjukvaran lättare att underhålla.

Vad kostar treskikt jämfört med tvåskikt? (2)
||
- **Förvaltning** – tre servrar att hålla i drift i stället för två
- **Prestanda** – mer nättrafik och högre fördröjning för varje operation

Varför kan skikt 1 göras mycket enkelt i en trelagerslösning?::Det är ==bara ett användargränssnitt==, utan applikationslogik, vilket ger inbyggt stöd för tunna klienter.

Vad menas med n-skiktsarkitektur?::Att applikationsdomänen delas i ==n logiska delar, var och en avbildad på en egen server==.

Varför använder Wikipedia en n-skiktsarkitektur?::För att klara den höga volymen webbförfrågningar – ==upp till 60 000 sidförfrågningar per sekund==.

Vad skiljer skiktning (layering) från flerskikt (tiering)? (2)
||
- **Skiktning** – *vertikal* uppdelning i abstraktionslager, där varje lager bara använder tjänsterna i lagret under
- **Flerskikt** – fördelar *ett* lagers funktion över lämpliga servrar och, i andra hand, fysiska noder

**Tunn klient** (thin client);;Ett mjukvarulager som ger ==fönstergränssnittet lokalt medan programmen körs på en fjärrdator==, så att även enkla enheter kan använda avancerade nättjänster.

Var fungerar en tunn klient dåligt?::Vid ==högt interaktiv grafik== som CAD och bildbehandling, där bild- och vektordata måste överföras och fördröjningen blir oacceptabel.

Vad gör en applikationsserver?::Den skiljer ==applikationslogiken från datalagringen==, och ger dessutom stöd för säkerhet och tillförlitlighet.

Vilken arkitektur stöder en applikationsserver direkt?::==Treskiktsarkitekturen==.

## MVC-arkitektur

Vilka tre delar består MVC-mönstret av? (3)
||
- **Model** – data, affärslogik och systemets tillstånd
- **View** – presentationen av data för användaren, gränssnittet
- **Controller** – tar emot användarens indata och styr Model och View

Hur går en förfrågan genom en MVC-applikation?::==Controllern tar emot användarens indata==, anropar Model för data och affärslogik, och väljer sedan den View som presenterar resultatet.

Vad skiljer MVC från en trelagersarkitektur?::MVC delar upp ==ansvaret inuti ett program==, medan flerskikt fördelar funktionen på skilda servrar – MVC:s tre delar kan alla ligga i ett och samma skikt.

## Middleware

Vilka lager har ett distribuerat system, underifrån och upp? (4)
||
- **Dator- och nätverkshårdvara**
- **Operativsystem** – tillsammans med hårdvaran utgör det *plattformen*
- **Middleware**
- **Applikationer och tjänster**

Vad menas med *plattform* i ett distribuerat system?::De ==lägsta hård- och mjukvarulagren==, t.ex. x86/Linux eller ARM/Symbian, som lyfter programmeringsgränssnittet till en nivå där processer kan samverka.

Vilka abstraktioner lyfter middleware upp till programmeraren? (4)
||
- **Fjärrmetodanrop**
- **Gruppkommunikation** mellan en mängd processer
- **Händelsenotifiering**
- **Placering och replikering** av delade dataobjekt

Vad styr indelningen av middleware i huvudklasser?::==Valet av kommunicerande enheter och kommunikationsparadigm==.

Vilka huvudklasser av middleware räknar boken upp, med exempel? (5)
||
- **Distribuerade objekt** – CORBA, Java RMI
- **Distribuerade komponenter** – EJB, JBoss, övriga applikationsservrar
- **Publish-subscribe** – CORBA Event Service
- **Meddelandeköer** – Websphere MQ
- **Web services** – Apache Axis, Globus Toolkit

Vilken gräns har middleware enligt ände-till-ände-argumentet?::Vissa kommunikationsfunktioner kan ==bara implementeras fullständigt med hjälp av applikationen i ändpunkterna==.

Varför räcker inte TCP för att överföra ett mycket stort mejl?::TCP rättar vissa fel men ==klarar inte större nätavbrott==; mejltjänsten håller själv reda på hur långt överföringen kommit.

Vad ger middleware utöver programmeringsabstraktioner?::==Infrastrukturtjänster== för applikationer och andra tjänster – CORBA erbjuder t.ex. tjänster för säkerhet och tillförlitlighet.

## Fördelar med klient/server

Vilka fördelar har en klient/server-lösning? (4)
||
- **Enkelhet** – en direkt och förhållandevis enkel väg att dela data och andra resurser
- **Samlad förvaltning** – servern äger och förvaltar de delade resurserna på ett ställe
- **Tydliga roller** – klienten begär, servern utför och svarar
- **Spridning** – den mest använda modellen; webben, FTP, e-post, DNS och web services bygger på den

Varför skalar klient-server-modellen dåligt?::Tjänsten ligger på ==en enda adress==, så den begränsas av värddatorns kapacitet och bandbredden i dess nätanslutning.

Vad är skillnaden mellan partitionering och replikering när en tjänst läggs på flera servrar? (2)
||
- **Partitionering** – varje server hanterar sin egen del av objekten, som webbens servrar
- **Replikering** – varje server har en kopia av samma data, som Suns NIS med lösenordsfilen

Vad gör en webbproxyserver för prestandan?::Den ger en ==delad cache av webbresurser== för flera klienter och sänker därmed lasten på fjärrnätet och webbservrarna; den kan också ge åtkomst genom en brandvägg.

Hur kan en server samtidigt vara klient?::Servrar anropar andra servrar – ==en webbserver är klient hos filservern och hos DNS==.

Vilken ställning har klient/server-modellen enligt boken?::Den är den ==arkitektur som oftast nämns när distribuerade system diskuteras== – historiskt den viktigaste och fortfarande den mest använda.

Vilken grundläggande begränsning hos klient-server är det peer-to-peer svarar på?::Behovet av att ==sprida de delade resurserna mycket bredare==, så att lasten fördelas över många fler datorer och nätlänkar.

Vad kostar peer-to-peer jämfört med klient-server?::Behovet av att ==placera och hitta enskilda objekt och hålla replikor aktuella över många datorer== gör arkitekturen väsentligt mer komplex.

## Mobila agenter

**Mobil agent**;;Ett körande program – ==både kod och data== – som förflyttar sig mellan datorer i ett nät och utför en uppgift åt någon, t.ex. hämtar information och återvänder med resultatet.

Vad skiljer en mobil agent från mobil kod?::Mobil kod ==laddas ner och körs hos mottagaren== och stannar där, medan den mobila agenten reser vidare mellan flera datorer och bär med sig både sin kod och sitt data.

Vad vinner en mobil agent jämfört med en klient som gör fjärranrop?::==Fjärranropen byts mot lokala anrop== på varje besökt plats, vilket sänker både kommunikationskostnad och tid.

Varför är nyttan av mobila agenter ändå begränsad? (2)
||
- De är ett **säkerhetshot** mot värden, som måste avgöra vilka lokala resurser agenten får använda utifrån vems uppdrag den utför
- De är själva **sårbara** – nekas de åtkomst kan de inte slutföra uppgiften, och samma sak går ofta att göra med vanliga fjärranrop

Vilka konkreta uppgifter kan en mobil agent utföra? (2)
||
- **Installera och underhålla programvara** på datorerna inom en organisation
- **Jämföra priser** på produkter från flera leverantörer, genom att besöka varje leverantörs plats och utföra en serie databasoperationer
