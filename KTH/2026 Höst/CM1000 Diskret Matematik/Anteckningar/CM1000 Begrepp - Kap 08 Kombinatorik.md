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
description: "Flashcards CM1000 kap 8 Kombinatorik, inriktade på räkneprinciperna och de sex vanligaste uppgiftstyperna på KS2: urval, inklusion och exklusion, anagram, kulor i urnor, binomialbevis och binomialutveckling."
---
# CM1000 Begrepp - Kap 08 Kombinatorik

## Räkneprinciper och grepp

När använder man multiplikationsprincipen och när additionsprincipen? (2)
||
- **Multiplikationsprincipen** – när valet görs i flera steg efter varandra, antalet sätt multipliceras
- **Additionsprincipen** – när man delar upp i fall som utesluter varandra, antalet sätt adderas

Vad är komplementgreppet i en räkneuppgift?;;Räkna ==alla möjligheter och dra bort de förbjudna== när det är lättare än att räkna de tillåtna direkt.

När lönar det sig att dela upp en kombinatorikuppgift i fall?::När villkoret gör att olika situationer räknas på olika sätt; då räknar man varje fall för sig och ==adderar fallen==.

Hur många av talen $1$ till $N$ är delbara med $d$?;;Det är ==heltalsdivisionen av $N$ med $d$==, alltså $\lfloor N/d \rfloor$.

När svarar snittet "delbart med både $a$ och $b$" mot delbarhet med produkten $ab$?;;När $a$ och $b$ är ==relativt prima==.

## Urval och räkneprinciper

I ett "välj $k$ av $n$"-steg: vad avgör om du räknar med $\binom{n}{k}$ eller med en produkt?::Om ==ordningen spelar roll== blir det en produkt (eller $n!$); spelar den ingen roll blir det $\binom{n}{k}$.

Vad är standardmetoden för en urvalsuppgift med villkor? (3)
||
- **Dela upp i fall** – efter villkoret, så fallen utesluter varandra
- **Räkna varje fall** – välj varje delmängd med ett binomialtal och multiplicera stegen
- **Addera fallen** – summera fallens antal till totalen

Hur räknar man antalet icke-negativa heltalslösningar till en ekvation med falluppdelning?::==Begränsa variablernas möjliga värden==, dela upp i fall efter en variabel och räkna lösningarna i varje fall.

Varför räcker det inte att svara "tre färgpar" när man väljer två olikfärgade kulor?::Kulorna ska ses som ==olika==, så man räknar konkreta par (alla par minus de enfärgade), inte antalet färgkombinationer.

## Inklusion och exklusion

Hur räknar man antalet delmängder som har minst ett element av varje slag (t.ex. både udda och jämnt)? (3)
||
- **Alla** – ta totala antalet delmängder, $2^{n}$
- **Dra bort** – de som saknar ena slaget och de som saknar andra slaget
- **Lägg tillbaka** – den som saknar båda, eftersom den dragits bort två gånger

Varför måste man lägga tillbaka snittet $\vert A \cap B \vert$ i inklusion–exklusion?::Elementen i snittet har ==räknats två gånger==, en gång i $\vert A \vert$ och en gång i $\vert B \vert$, så de ska dras bort en gång.

Hur sätter man upp uppgiften "hur många av $1$ till $N$ är delbara med $a$ eller $b$"?;;Låt $A$ vara multiplerna av $a$ och $B$ multiplerna av $b$; sökt antal är ==$\vert A \cup B \vert$== via inklusion–exklusion.

Hur visar man att en uppsättning mängdstorlekar är omöjlig med inklusion–exklusion?::==Räkna fram alla storlekar== ur villkoren, sätt in i formeln och visa att resultatet motsäger ett givet värde.

## Anagram och omordning

Hur räknar man omordningar av ett ord med upprepade bokstäver? (3)
||
- **En sort i taget** – se det som en process, steg för steg per bokstavssort
- **Välj platser** – för varje sort med flera lika bokstäver, välj deras platser med ett binomialtal
- **Multiplicera** – multiplikationsprincipen ger det totala antalet

Hur hanterar man villkoret att ett tal inte får börja med 0 vid omordning av siffror?;;Räkna ==alla omordningar minus de som börjar med 0==.

Hur räknar man omordningar där inga två lika bokstäver får stå intill varandra? (3)
||
- **Ordna de övriga** – placera först alla andra bokstäver
- **Räkna luckorna** – mellanrummen mellan och runt dem
- **Välj platser** – lägg de lika bokstäverna i luckorna, högst en per lucka

Varför får man inte räkna en upprepad bokstav som om alla vore olika vid omordning?::Då blir antalet ==för stort==, eftersom byten av plats mellan lika bokstäver inte ger några nya ord.

## Kulor i urnor och fördelning

Hur hanterar man villkoret "minst en kula i varje urna" vid fördelning av identiska kulor?::==Lägg först en kula i varje urna== (ett enda sätt), och fördela sedan de kvarvarande fritt med samma formel.

Gäller formeln $\binom{n+k-1}{k}$ för identiska eller olika kulor i urnor?;;För ==identiska== kulor; är kulorna olika väljer i stället varje kula sin urna.

Varför kan samma fördelning ge olika svar beroende på om urnorna är olika?::Om urnorna (grupperna) är ==olika== räknas vem som hamnar var; räknas bara storleksmönstret blir antalet färre.

Hur räknar man en fördelning av kulor i flera färger i urnor?;;Se det som en ==process i oberoende steg==, ett steg per färg, och multiplicera stegens antal.

## Binomialidentitet och bevis

Hur bevisar man en summaidentitet med binomialtal algebraiskt?::Utgå från binomialsatsen och ==välj $a$ och $b$== så att utvecklingen blir just den sökta summan.

Vilket val av $a$ och $b$ i binomialsatsen delar en summa i udda och jämna termer?;;Sätt ==$a=1$ och $b=-1$==, så att tecknen växlar och utvecklingen blir noll.

Vad går ett kombinatoriskt bevis av en binomialidentitet ut på?;;==Räkna samma mängd på två sätt== — det ena sättet ger vänsterledet, det andra högerledet.

Vad är summan av alla binomialtal $\sum_{k=0}^{n}\binom{n}{k}$?;;Den är ==$2^{n}$==, vilket fås ur binomialsatsen med $a=b=1$.

## Binomialutveckling och konstantterm

Hur hittar man konstanttermen i en binomialutveckling? (3)
||
- **Allmän term** – skriv den allmänna termen med binomialsatsen
- **Exponenten** – uttryck $x$-potensens exponent i summationsindexet $k$
- **Sätt till noll** – konstantterm finns precis när exponenten blir noll för ett heltal $k$ i intervallet

Vad drar man för slutsats om exponentekvationen för en viss term saknar heltalslösning?::Då ==finns ingen sådan term== — det ska sägas uttryckligen och motiveras.

Hur tar man fram koefficienten framför en viss $x$-potens i en binomialutveckling?::==Lös exponentekvationen för $k$== och sätt in det $k$-värdet i den allmänna termen.

Vilka värden kan summationsindexet $k$ i en binomialutveckling anta?;;Bara ==heltal mellan $0$ och exponenten==; annars är termen inte med.
