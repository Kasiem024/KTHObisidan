---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 4 – digital transmission: linjekodning, PCM (analog→digital), Nyquists samplingsteorem och överföringslägen."
---
# HI1032 Begrepp - Kap 04 Digital transmission

## Digital-till-digital

**Linjekodning** (line coding);;Att ==omvandla digital data (bitar) till en digital signal==; behövs alltid vid digital överföring.

Vad är skillnaden mellan ett dataelement och ett signalelement?
||
- **Dataelement:** den minsta *informationsenheten* – en ==bit== (det vi vill skicka).
- **Signalelement:** den kortaste delen av *signalen* – bäraren (det vi kan skicka).

## Analog-till-digital

**PCM** (Pulse Code Modulation);;Den vanligaste metoden att ==omvandla en analog signal till digital data==, i tre steg.

Vilka tre steg består PCM (analog → digital) av? (3)
||
- **Sampling** – mät signalen med jämna tidsmellanrum
- **Kvantisering** (quantization) – avrunda varje sampel till en nivå
- **Kodning** (encoding) – representera nivån som bitar

**Nyquists samplingsteorem**;;För att kunna återskapa en analog signal måste man ==sampla med minst dubbla den högsta frekvensen== i signalen.

## Överföringslägen

Vad skiljer parallell från seriell överföring?
||
- **Parallell:** ==flera bitar samtidigt== över flera ledningar – snabbt men dyrt, bara korta avstånd.
- **Seriell:** ==en bit i taget== över en ledning – billigare och används för längre avstånd.

Vilka tre former av seriell överföring finns? (3)
||
- **Asynkron** – start- och stoppbitar runt varje byte
- **Synkron** – bitar skickas i en jämn ström som mottagaren själv grupperar
- **Isokron** – garanterar en *fast* takt (för realtid, t.ex. video)
