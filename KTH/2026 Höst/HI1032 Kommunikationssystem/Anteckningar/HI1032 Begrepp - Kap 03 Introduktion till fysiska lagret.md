---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 3 – fysiska lagret: analoga/digitala signaler, bandbredd, transmissionsförsämring, datataktsgränser och prestanda."
---
# HI1032 Begrepp - Kap 03 Introduktion till fysiska lagret

Vad är fysiska lagrets huvuduppgift?::Att ==flytta data i form av (elektromagnetiska) signaler== över ett medium – det omvandlar data till signaler.

Vad skiljer en analog från en digital signal?
||
- **Analog:** ==oändligt många nivåer== som ändras mjukt och kontinuerligt.
- **Digital:** ett *fåtal diskreta nivåer* som ändras i steg (t.ex. 0 och 1).

**Bandbredd** (bandwidth, för en signal);;==Skillnaden mellan högsta och lägsta frekvens== i en signal (i Hz); mer bandbredd tillåter högre datatakt.

**Bithastighet** (bit rate);;==Antalet bitar som skickas per sekund== – måttet på en digital signal (motsvarar frekvens hos en analog).

Vilka tre saker kan försämra (impair) en signal på vägen? (3)
||
- **Dämpning** (attenuation) – signalen tappar energi/styrka
- **Distorsion** (distortion) – signalens form förändras
- **Brus** (noise) – oönskade signaler blandas in

**Dämpning** (attenuation);;Att en signal ==tappar energi och styrka== när den färdas genom mediet; motverkas med förstärkare.

Vad är skillnaden mellan Nyquists och Shannons formler för maximal datatakt?
||
- **Nyquist:** gäller en *brusfri* kanal – gränsen sätts av bandbredd och antal signalnivåer.
- **Shannon:** gäller en *brusig* kanal – gränsen sätts av bandbredd och ==signal-brus-förhållandet (SNR)==.

Vilka mått beskriver ett nätverks prestanda? (4)
||
- **Bandbredd** – kapaciteten (bit/s)
- **Genomströmning** (throughput) – hur mycket som *faktiskt* går igenom
- **Latens** (fördröjning) – tid från sändning till mottagning
- **Jitter** – variationen i fördröjning

**Genomströmning** (throughput);;Hur mycket data som ==faktiskt tar sig igenom== en länk per sekund – ofta *lägre* än bandbredden (den teoretiska kapaciteten).
