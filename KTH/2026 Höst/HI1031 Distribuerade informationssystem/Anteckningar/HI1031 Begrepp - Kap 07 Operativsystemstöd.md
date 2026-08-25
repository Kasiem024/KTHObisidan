---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 7 – operativsystemstöd: kärna, processer och trådar, skydd, samt monolitisk kärna kontra mikrokärna och virtualisering."
---
# HI1031 Begrepp - Kap 07 Operativsystemstöd

## Kärnan och dess uppgifter

**Kärna** (kernel);;Den ==mest privilegierade delen av operativsystemet==, som alltid körs skyddat och hanterar processer, minne och kommunikation samt skyddar resurser.

Vilka kärnuppgifter sköter operativsystemslagret i en nod? (3)
||
- **Process- och trådhantering**
- **Minneshantering**
- **Kommunikation** mellan processer

**Skydd** (protection);;Att kärnan ==hindrar processer från otillåten åtkomst== till varandras minne och till hårdvaruresurser.

## Processer och trådar

**Process**;;Ett program under körning med ==eget skyddat adressutrymme==, egna resurser och en eller flera trådar.

**Tråd** (thread);;En ==exekveringsväg inuti en process== som delar processens adressutrymme med andra trådar men har egen stack och programräknare.

Vad skiljer en tråd från en process?
||
- **Process:** har ett *eget* skyddat adressutrymme – dyrt att skapa och byta mellan.
- **Tråd:** lever inuti en process och ==delar dess adressutrymme== – billig att skapa, snabb växling.

Varför använder servrar ofta flera trådar?::För att ==hantera flera klientförfrågningar samtidigt== – medan en tråd väntar (t.ex. på disk) kan andra arbeta, så att servern inte blir en flaskhals.

**Adressutrymme** (address space);;Det ==minnesområde en process får använda==, skyddat från andra processer av kärnan.

## OS-arkitektur

Vad skiljer en monolitisk kärna från en mikrokärna?
||
- **Monolitisk:** *alla* OS-tjänster körs inne i kärnan – snabbt, men stort och svårändrat.
- **Mikrokärna:** kärnan är *minimal*; övriga tjänster körs ==som separata processer i användarläge== – flexiblare och robustare, men mer overhead.

**Virtualisering** (på OS-nivå);;Att ==emulera hårdvaran== så att flera virtuella maskiner – och därmed flera operativsystem – kan köras samtidigt på samma fysiska dator.

**Null-RPC**;;Ett fjärranrop ==utan parametrar och utan arbete==, som används för att mäta *latensen* (den fasta grundkostnaden) hos en anropsmekanism.
