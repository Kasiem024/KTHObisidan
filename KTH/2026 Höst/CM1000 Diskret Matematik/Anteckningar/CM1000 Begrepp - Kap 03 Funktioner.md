---
tags:
  - begrepp
  - CM1000
  - matematik
  - KTH
  - year2026
created: 2026-10-26
updated: 2026-10-26
description: "Flashcards CM1000 kap 3, inriktade på de vanligaste funktionsuppgifterna: bevisa och motbevisa injektiv, surjektiv och bijektiv, bijektion och invers, sammansättning och allmänna funktionslag."
---
# CM1000 Begrepp - Kap 03 Funktioner

## Egenskapsbestämning

*Metoderna, inte definitionerna — injektiv, surjektiv och bijektiv står redan på formelsamlingen.*

Hur bevisar man att en funktion är injektiv?;;Anta att ==$f(a)=f(b)$== och härled att $a=b$.

Hur bevisar man att en funktion är surjektiv?;;Ta ett ==godtyckligt $y$ i målmängden== och hitta ett $x$ med $f(x)=y$.

Hur motbevisar man att en funktion är injektiv?;;Ge ett motexempel: ==två skilda argument med samma värde==.

Hur motbevisar man att en funktion är surjektiv?;;Peka ut ett ==värde i målmängden som aldrig antas==.

Hur visar man med derivatan att en reell funktion är injektiv?;;Visa att den är ==strängt växande== (t.ex. derivatan $>0$ överallt).

Hur visar man med derivatan att en reell funktion är surjektiv?;;Visa att den är ==kontinuerlig och går mot både $+\infty$ och $-\infty$==.

Varför måste man alltid ange målmängden när man avgör surjektivitet?::För att surjektivitet ==beror på vilken målmängd som valts== — samma formel kan vara surjektiv mot en mängd men inte en annan.

För en funktion från en ändlig mängd till sig själv — hur förhåller sig injektiv, surjektiv och bijektiv?;;De blir ==samma sak==: har funktionen en av egenskaperna har den alla tre.

## Bijektion och invers

Hur visar man att en funktion är bijektiv via inversen?;;Lös ekvationen $y=f(x)$ för $x$; ==går det entydigt== är funktionen inverterbar och du har samtidigt inversen.

Vad krävs av antalet element för att en bijektion mellan två ändliga mängder ska finnas?;;Mängderna måste ha ==lika många element==; olika antal gör bijektion omöjlig.

Vad tvingar en injektiv funktion fram om mängderna är ändliga?;;Att ==målmängden har minst lika många element som definitionsmängden== ($\vert A\vert \le \vert B\vert$).

Vad betyder det att en funktion är sin egen invers, och vad följer?;;Att ==$f\circ f=\iota$==; då är funktionen automatiskt bijektiv.

Varför måste man pröva både injektiv och surjektiv innan man säger bijektiv?::En funktion kan vara ==surjektiv utan att vara injektiv (och tvärtom)==, så den ena följer inte av den andra.

## Sammansättning

Hur beräknar man en sammansatt funktion i praktiken?;;==Följ varje element steg för steg==, eller sätt in den inre funktionens formel i den yttre.

Hur löser man en ekvation med sammansättningar, t.ex. $f\circ g=g\circ f$?;;Skriv ut ==båda leden som uttryck i $x$== och lös ekvationen som uppstår.

Hur hittar man parametrar som gör en linjär sammansättning bijektiv?;;Räkna ut sammansättningen och kräv att ==determinanten är skild från noll==.

Vad följer om en funktion sammansatt med sig själv några gånger blir identiteten?;;Den har en ==invers== (den nästsista sammansättningen), så den är bijektiv.

Varför är $f\circ g$ och $g\circ f$ oftast olika funktioner?::Sammansättning är ==inte kommutativ i allmänhet==; ordningen avgör vilken funktion som verkar först.

## Funktionslag

Ett allmänt funktionslag utan konkreta tal — hur bevisar man det?;;Arbeta med ==godtyckliga element och definitionerna== av injektiv och surjektiv.

På en uppgift med ett sant och ett falskt påstående — hur hanterar man vart och ett? (2)
||
- **Det sanna** – bevisa direkt med godtyckliga element
- **Det falska** – ge konkreta funktioner och mängder som motexempel

En ekvivalens (omm) om funktioner — hur bevisar man den?;;Visa ==båda riktningarna== var för sig; ta gärna kontrapositionen i den jobbiga riktningen.

Om $g\circ f$ är injektiv — vilken av $f$ och $g$ måste då vara injektiv?::Den ==inre funktionen $f$==.

Om $g\circ f$ är surjektiv — vilken av $f$ och $g$ måste då vara surjektiv?::Den ==yttre funktionen $g$==.

Om både $f$ och $g$ är bijektiva — vad gäller då för $g\circ f$?::Den är ==också bijektiv==.

Vad kan ett enda exempel göra för ett allmänt funktionspåstående — och inte göra?::Det kan ==motbevisa== påståendet, men aldrig bevisa det.

Om det ena av två påståenden är falskt — vad vet man då om det andra?::==Ingenting==; vart och ett måste avgöras för sig.

## Uppräkning

Hur räknar man upp alla funktioner som uppfyller givna villkor?;;Avgör vad villkoren ==låser fast och vilka värden som är fria==, och gå sedan igenom alla val av de fria.

## Mängdbild

En identitet om bildmängder, t.ex. $f(E\cap F)=f(E)\cap f(F)$ — hur bevisar man den?;;Visa de ==två inklusionerna var för sig== med elementjakt.

Varför gäller i allmänhet bara en inklusion för bildmängden av ett snitt?::$f(E\cap F)\subseteq f(E)\cap f(F)$ alltid, men ==likhet kräver att $f$ är injektiv==.

En identitet med karakteristiska funktioner — hur bevisar man den?;;==Dela upp i fall== efter om elementet ligger i mängderna och kontrollera likheten i varje fall.

## Funktionskontroll

Hur avgör man om en mängd av par verkligen är en funktion?;;Kontrollera att ==varje argument ger exakt ett värde==.
