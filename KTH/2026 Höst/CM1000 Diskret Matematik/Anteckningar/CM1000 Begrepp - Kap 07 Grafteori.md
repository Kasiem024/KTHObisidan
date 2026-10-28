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
description: "Flashcards CM1000 kap 7, inriktade på de vanligaste grafteoriuppgifterna: kortaste väg med Dijkstra, uppspännande träd, Euler och Hamilton samt begrepp som formelbladet saknar."
---
# CM1000 Begrepp - Kap 07 Grafteori

## Kortaste väg (Dijkstra)

När använder du Dijkstras algoritm?::För att hitta den ==billigaste vägen mellan två hörn== i en viktad graf.

Hur läser du av själva vägen när sluthörnet fått sin etikett?::Följ ==föregångarna baklänges== från sluthörnet till start; kostnaden står i sluthörnets etikett.

Vad är fallgropen med en kandidatetikett i Dijkstra?::Den är inte slutgiltig – en ==billigare kandidat kan ersätta den== i ett senare steg innan hörnet blir fast.

Varför kan en graf ha flera olika kortaste vägar?::För att ==flera hörn kan få lika billiga etiketter==, så mer än en väg ger samma lägsta kostnad.

Hur väljer du okända kantvikter så att flera vägar blir lika korta?::Skriv varje cykelfri väg som en ==summa av vikterna==, sätt summorna lika med det önskade värdet och lös ekvationerna.

## Uppspännande träd

Hur många kanter har ett uppspännande träd med $n$ hörn?::Alltid ==$n-1$ kanter==, en kant färre än antalet hörn.

När vet du att ett uppspännande träd är klart?::När det ==binder samman alla hörn== med $n-1$ kanter utan någon cykel.

Hur räknar du antalet olika minsta uppspännande träd?::Leta där det finns ==flera lika billiga kanter att välja mellan== och multiplicera antalet oberoende val.

Vad måste du läsa noga i en uppgift om minsta uppspännande träd?::Om en ==bestämd algoritm krävs== (till exempel Prim i stället för Kruskal).

## Euler och Hamilton

Vad krävs för att en graf ska vara eulersk? (2)
||
- **Sammanhängande** – man kan nå varje hörn från varje annat
- **Jämna gradtal** – varje hörn har jämn grad

Hur bevisar du att en graf är hamiltonsk?::Ange en ==konkret Hamiltoncykel==, till exempel genom att gå yttervarvet.

Hur bevisar du att en graf saknar Hamiltoncykel?::Med ett ==motsägelsebevis== – anta en cykel, följ de tvingade kanterna och visa att ett hörn måste missas.

Hur motbevisar du ett allmänt påstående om eulerska eller hamiltonska grafer?::Ge en ==konkret graf som motexempel==, ofta en komplett graf $K_n$.

## Gradtal och handskakning

Hur avgör du snabbt om en talföljd kan vara en gradtalssekvens?::Kolla att ==summan är jämn== – den måste vara dubbla antalet kanter, så en udda summa är omöjlig.

Vad gäller alltid för antalet hörn med udda gradtal?::Det är ==alltid ett jämnt antal== (följer av handskakningslemmat).

Vad skiljer en pseudograf från en vanlig graf?::En pseudograf tillåter ==dubbelkanter och öglor (loopar)==, vilket gör fler gradtalssekvenser möjliga.

## Trädbevis

Vad är standardgreppet i ett trädbevis?::==Anta motsatsen== och utnyttja att ett träd saknar cykler.

Varför måste en väg av olika hörn i ett träd sluta i ett löv?::Grafen är ==ändlig och saknar cykler==, så vägen kan inte fortsätta hur länge som helst eller vända tillbaka.

## Isomorfi och delgraf

Hur visar du att två grafer är isomorfa?::Börja med att ==para ihop hörnen i båda graferna== och ange en bijektion som bevarar kanterna.

Hur visar du att två grafer inte är isomorfa?::Peka ut en ==egenskap som en isomorfi bevarar== (t.ex. antal hörn med ett visst gradtal) som bara den ena grafen har.

Varför räcker inte samma gradtalssekvens för att visa att två grafer är isomorfa?::Samma gradtalssekvens är ==nödvändigt men inte tillräckligt== – graferna kan ändå ha olika struktur.

## Begrepp som inte står på formelbladet

Vad är en väg (path) i en graf?;;En promenad där ==inga hörn upprepas==.

Vad är en cykel i en graf?;;En krets där start- och sluthörn sammanfaller men ==inga andra hörn upprepas==.

Vad betyder det att en graf är sammanhängande?;;Det finns ==en promenad mellan varje par== av hörn.

Vad är en delgraf?;;En graf vars hörn och kanter ==alla ryms i== en större graf.

Vad är ett träd?;;En ==sammanhängande graf utan cykler==.

Vad är ett löv i ett träd?;;Ett hörn av ==grad 1==.

Vad är den kompletta grafen $K_n$?;;Grafen med en ==kant mellan varje par== av de $n$ hörnen.

Hur många kanter har den kompletta grafen $K_n$?::==$\frac{n(n-1)}{2}$== kanter, en för varje par av hörn.

Vad är en isomorfi mellan två grafer?;;En ==bijektion mellan hörnmängderna som bevarar kanterna==.

Vad betyder det att en graf är eulersk?;;Den har en ==krets som går längs varje kant exakt en gång==.

Vad betyder det att en graf är hamiltonsk?;;Den har en ==cykel som besöker varje hörn exakt en gång==.

Vad är en komplett tvådelad graf $K_{m,n}$?;;Hörnen delas i ==två klasser där varje par från olika klasser== har en kant.
