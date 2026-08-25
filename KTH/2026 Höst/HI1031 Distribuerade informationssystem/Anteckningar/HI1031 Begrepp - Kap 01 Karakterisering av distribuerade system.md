---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 1 – vad ett distribuerat system är, dess konsekvenser, de åtta utmaningarna, transparens och tjänstekvalitet."
---
# HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system

## Vad ett distribuerat system är

**Distribuerat system**;;Datorer och komponenter på *skilda, nätverksanslutna* maskiner som samordnar sig ==enbart genom att skicka meddelanden== – de delar varken minne eller klocka.

Hur utbyter och samordnar komponenterna i ett distribuerat system information?::==Enbart genom att skicka meddelanden== över nätverket – det finns inget delat minne och ingen delad klocka.

Vad är den grundläggande drivkraften bakom att bygga ett distribuerat system?::Att kunna ==dela resurser== – hårdvara, data och tjänster – mellan många användare och program.

Vilka egenskaper gäller alltid för ett distribuerat system? (3)
||
- **Samtidighet** – många saker sker parallellt på olika datorer
- **Ingen global klocka** – maskinerna kan inte enas om en exakt gemensam tid
- **Oberoende fel** – en del kan sluta fungera medan resten fortsätter

**Ingen global klocka**;;Att datorer i ett nät ==aldrig kan enas om exakt samma tid==, eftersom de bara kan jämföra klockor via meddelanden som tar olika lång tid att nå fram.

## De centrala utmaningarna

Vilka är huvudutmaningarna man måste hantera i ett distribuerat system? (8)
||
- **Heterogenitet**
- **Öppenhet**
- **Säkerhet**
- **Skalbarhet**
- **Felhantering**
- **Samtidighet**
- **Transparens**
- **Tjänstekvalitet (QoS)**

**Heterogenitet**;;Att delarna i ett system är *olika sinsemellan* – skilda nätverk, hårdvara, operativsystem och språk – men ändå måste kunna ==samarbeta==.

**Öppenhet** (openness);;Hur lätt ett system går att ==utöka och bygga om==, vilket kräver att nyckelgränssnitten är *publicerade och standardiserade*.

**Skalbarhet** (scalability);;Ett systems förmåga att ==förbli effektivt när det växer==, dvs. när antalet användare eller resurser ökar kraftigt.

Vad är den viktigaste designregeln för att ett system ska skala bra?::==Undvik flaskhalsar== – inga centraliserade komponenter, data eller algoritmer som all trafik måste passera.

Vad menas med att fel i ett distribuerat system oftast är *partiella*?::Att ==vissa delar kan haverera medan andra fortsätter köra== – ingen enskild dator har full överblick, vilket gör felen svåra att upptäcka.

Vilka strategier finns för att hantera fel i ett distribuerat system? (5)
||
- **Upptäcka** – t.ex. checksummor och timeouts
- **Maskera** – dölja felet, t.ex. genom att skicka om
- **Tolerera** – leva med felet, t.ex. visa ett tydligt felmeddelande
- **Återhämta** – rulla tillbaka till ett korrekt tillstånd
- **Redundans** – dubblera komponenter så tjänsten överlever

Vilka egenskaper skyddar man inom informationssäkerhet? (3)
||
- **Konfidentialitet** – ingen obehörig kan *läsa* informationen
- **Integritet** – ingen obehörig kan *ändra* informationen
- **Tillgänglighet** – behöriga kommer *åt* tjänsten när de behöver den

## Middleware och mobil kod

**Middleware**;;Ett *mjukvarulager* mellan operativsystem och applikation som ==döljer skillnaderna mellan olika datorer== och ger en enhetlig programmeringsmodell. Fungerar som en *universaltolk* mellan system som "talar olika språk".

Vilket problem löser middleware framför allt?::Det ==maskerar heterogenitet== – program kan samverka trots olika operativsystem, språk och hårdvara, utan att programmeraren behöver hantera skillnaderna.

**Mobil kod** (mobile code);;Program som ==skickas över nätet och körs på mottagarens dator== (t.ex. en applet); en virtuell maskin gör att koden fungerar oavsett plattform.

## Transparens

**Transparens** (i distribuerade system);;Att ==dölja att systemet är utspritt== så att det upplevs och används som *en enda sammanhållen helhet*.

Vilka former av transparens brukar man skilja på? (8)
||
- **Åtkomst** (access)
- **Lokalisering** (location)
- **Samtidighet** (concurrency)
- **Replikering** (replication)
- **Fel** (failure)
- **Mobilitet** (mobility)
- **Prestanda** (performance)
- **Skalning** (scaling)

**Åtkomsttransparens** (access);;När ==lokala och avlägsna resurser används med exakt samma operationer==, utan att man märker någon skillnad.

**Lokaliseringstransparens** (location);;När man kan nå en resurs ==utan att känna till var den fysiskt finns== eller dess nätverksadress.

**Feltransparens** (failure);;När systemet ==döljer att något havererat== så att användaren ändå kan slutföra sitt arbete (t.ex. e-post som skickas om tills den kommer fram).

**Replikeringstransparens** (replication);;När flera *kopior* av en resurs används för prestanda och tillförlitlighet, ==utan att användaren vet att kopiorna finns==.

Du kan flytta en fil till en annan server utan att program som använder den behöver ändras – vilken transparens är det?::==Mobilitetstransparens== – resurser (och klienter) kan flyttas utan att påverka pågående arbete.

**Nätverkstransparens**;;Det gemensamma namnet på *åtkomst-* och *lokaliseringstransparens* tillsammans – de två viktigaste formerna, som döljer både var en resurs finns och hur den nås.

**Tjänstekvalitet** (QoS);;Garantier om en tjänsts *icke-funktionella* egenskaper – framför allt ==tillförlitlighet, säkerhet och prestanda== (t.ex. att svaret hinner fram i tid).
