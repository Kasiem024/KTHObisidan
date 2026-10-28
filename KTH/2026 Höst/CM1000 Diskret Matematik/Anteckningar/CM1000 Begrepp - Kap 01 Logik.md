---
tags:
  - begrepp
  - CM1000
  - matematik
  - KTH
  - year2026
  - nosr
created: 2026-10-26
updated: 2026-10-26
description: "Flashcards CM1000 kap 1, inriktade på de vanligaste logikuppgifterna: ekvivalensutredning, härledningsbedömning, giltighetsbevis och begrepp som formelbladet saknar."
---
# CM1000 Begrepp - Kap 01 Logik

## Ekvivalensutredning

Vilka två sätt finns att avgöra om två utsagor är logiskt ekvivalenta? (2)
||
- **Sanningstabell** – en kolumn per utsaga, jämför kolumnerna
- **Omskrivning** – använd logiska lagar tills ena ledet blir det andra

Vad visar en sanningstabell om ekvivalens? (2)
||
- **Identiska kolumner** – utsagorna är ekvivalenta
- **En skiljande rad** – de är inte ekvivalenta

Hur bevisar du en ekvivalens med omskrivning? (3)
||
- **Implikationer** – skriv först om dem som disjunktioner
- **Lagar** – använd DeMorgan och distributiva lagen
- **Mål** – fortsätt tills ena ledet blir lika det andra

Hur motbevisar du en ekvivalens som inte gäller?::Ge en ==tilldelning som gör ena ledet sant och det andra falskt==.

## Härledningsbedömning

Vad är första steget när du ska bedöma om en härledning är giltig?::Försök ==härleda slutsatsen==, och sök ett motexempel om det inte lyckas.

Vad är hypotetisk härledning?;;Att ==anta slutsatsens förled== och härleda efterledet, för att bevisa en implikation.

Vad är indirekt härledning (motsägelsebevis)?;;Att ==anta motsatsen till slutsatsen== och härleda en motsägelse.

Vad är bevis genom falluppdelning?;;Att dela upp en disjunktion i fall och ==visa slutsatsen i varje fall==.

Hur hittar du ett motexempel till en härledning? (3)
||
- **Sätt slutsatsen falsk** – utgå från att den inte gäller
- **Arbeta baklänges** – välj sanningsvärden så att alla premisser blir sanna
- **Redovisa** – skriv ut hela tilldelningen

Slutsatsen är en implikation och du vill göra den falsk – hur?::Sätt ==förledet sant och efterledet falskt==.

Vad är konjunktiv förenkling?;;Att ur en konjunktion $p \land q$ ==dra ut ett av leden==.

Vad är sammanslagning i en härledning?;;Att ==slå ihop två rader== $p$ och $q$ till konjunktionen $p \land q$.

## Giltighetsbevis

Vilka två sätt kan du bevisa att en slutledning är giltig? (2)
||
- **Formell härledning** – numrera premisserna och härled slutsatsen med namngivna regler
- **Sanningstabell** – fungerar när utsagorna är få

Du har fastnat i en härledning – vilket knep tar dig vidare?::Skriv om ==implikationer som disjunktioner==, eller använd kontraposition.

Hur bevisar du en regel med en sanningstabell? (3)
||
- **Alla rader** – ställ upp hela tabellen
- **Premissrader** – peka ut raderna där alla premisser är sanna
- **Slutsats** – visa att den är sann just på de raderna

Vad måste alltid följa med en sanningstabell i en inlämnad lösning?::==Text som förklarar hur tabellen används== – annars underkänt.

## Utsagans giltighet

Vad betyder tautologi, kontradiktion och kontingent? (3)
||
- **Tautologi** – alltid sann
- **Kontradiktion** – alltid falsk
- **Kontingent** – ibland sann, ibland falsk

Hur visar du att en utsaga är en tautologi?::Skriv om den med logiska lagar tills den ==alltid blir sann==.

Hur visar du att en utsaga är kontingent?::Ge ==en tilldelning som gör den sann och en annan som gör den falsk==.

Vad skiljer att visa "alltid sann" från "inte alltid sann"? (2)
||
- **Alltid sann** – kräver bevis för alla tilldelningar
- **Inte alltid sann** – ett enda motexempel räcker

När är en implikation automatiskt sann?::När ==förledet är falskt eller efterledet sant==.

## Kryssuppgift

Hur löser du en kryssuppgift? (3)
||
- **Rad för rad** – avgör varje rad med en snabb omskrivning
- **Ett kryss per rad** – en rad utan kryss räknas som fel
- **Inga motiveringar** – sikta på alla rätt utan slarv

## Konnektivomskrivning

Hur skriver du om en utsaga med bara ett konnektiv (NAND/NOR)? (3)
||
- **Grundbyggstenarna** – uttryck negation, konjunktion och disjunktion i det nya konnektivet
- **Normalform först** – skriv om hela utsagan till negation, konjunktion och disjunktion
- **Byt stegvis** – ersätt varje del med sin konnektiv-form

## Begrepp som inte står på formelbladet

Vad betyder exklusivt eller $p \oplus q$?;;Sant när ==precis ett== av $p$ och $q$ är sant: $(p \lor q) \land \neg(p \land q)$.

Hur hänger biimplikationen $p \leftrightarrow q$ ihop med exklusivt eller?;;Den är ==negationen av $p \oplus q$== – sann när $p$ och $q$ har samma sanningsvärde.

Vad betyder Scheffers streck $p \mid q$ (NAND)?;;$\neg(p \land q)$ – ==falskt bara när båda är sanna==.

Vad betyder Pierces pil $p \downarrow q$ (NOR)?;;$\neg(p \lor q)$ – ==sant bara när båda är falska==.
