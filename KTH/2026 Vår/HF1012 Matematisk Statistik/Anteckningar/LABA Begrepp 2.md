---
tags: [begrepp, HF1012, KTH, labb, matematik, year2026]
created: 2026-05-14
updated: 2026-05-26
description: "Grafisk relation mellan diskret sannolikhetsfunktion (stem) och fördelningsfunktion (stairs): Höjden av en specifik stolpe motsvarar exakt höjden av trappsteget vid..."
---
# LABA Begrepp 2

Grafisk relation mellan diskret sannolikhetsfunktion (stem) och fördelningsfunktion (stairs) ;; Höjden av en specifik stolpe motsvarar exakt höjden av trappsteget vid exakt samma x-värde.
Ett absorberande tillstånd i en Markovkedja ;; Ett tillstånd systemet aldrig kan lämna (raden i övergångsmatrisen P har en 1:a på diagonalen och 0 i övrigt).
Kärnkonceptet "Gamblers ruin" i labbkursen ;; Ett Markovkedje-problem med två absorberande tillstånd i ändarna (som representerar extremutfallen: vinst eller förlust av hela kapitalet).
Övergångssannolikheten $p_{ij}$ i en övergångsmatris $P$ ;; Sannolikheten att systemet rör sig från tillstånd $i$ till tillstånd $j$ i exakt ett framtida steg.
Innebörden av att ett element $p_{ij} = 0$ i en övergångsmatris ;; Det är matematiskt omöjligt för systemet att hoppa direkt från tillstånd $i$ till $j$ på exakt ett enda steg.
Ekvationen för att identifiera en stationär sannolikhetsvektor $\mathbf{p}$ ;; $\mathbf{p} \cdot P = \mathbf{p}$ (vilket betyder att fördelningen förblir helt oförändrad efter en övergång).
Littles formel för medelantalet kunder totalt i systemet ($N$) ;; $N = \lambda_{eff} \cdot T$.
Littles formel för medelantalet kunder väntande i kön ($N_q$) ;; $N_q = \lambda_{eff} \cdot W$.
Sambandet mellan total tid i systemet ($T$), väntetid i kö ($W$) och betjäningstid ($\overline{x}$) ;; $T = W + \overline{x}$.
Visuell lokalisering av väntevärdet i ett stolpdiagram ;; Tyngdpunkten, som generellt ligger vid det x-värde där grafens stolpe är som allra högst.
Formellt grafiskt fel: Att rita en diskret sannolikhetsfunktion med kommandot `plot()` ;; Resultatet drar felaktiga streck mellan heltalen, vilket vilseledande antyder att det finns sannolikheter mellan utfallen.
Formellt grafiskt fel: Att rita en kontinuerlig fördelning med kommandot `stem()` ;; En stolpe antyder att det finns en punktsannolikhet, vilket enligt matematisk definition är exakt 0 för kontinuerliga variabler.
Standardfördelningen för antalet ankomster under en given tidsperiod till ett M/M/1-system ;; Poissonfördelningen.
Standardfördelningen för tidsavståndet mellan ankomster i ett M/M/1-system ;; Exponentialfördelningen.
Standardfördelningen för den faktiska betjäningstiden i ett M/M/1-system ;; Exponentialfördelningen.
Formellt teoretiskt fel gällande betjäningstiden i ett M/M/1-kösystem ;; Att felaktigt ansätta betjäningstiden som Poissonfördelad istället för Exponentialfördelad.
Matlab-uttrycket `p * P^n` (där p är horisontell radvektor och P är övergångsmatris) ;; Beräknar den totala sannolikhetsfördelningen efter exakt $n$ steg i en Markovkedja.
Algebraiskt Matlab-fel: Att skriva `P^n * p` vid beräkning av en Markovkedja ;; Ett dimensionsfel då matrismultiplikation inte är kommutativ (en horisontell radvektor måste alltid stå till vänster om kvadratiska matrisen).
Matlab-händelsen: Att köra kommandot `plot()` och direkt därefter `stem()` utan att ange `hold on` ;; Det första diagrammet raderas fullständigt och figuren kommer enbart att visa stolpdiagrammet.
Ekvationen för sannolikheten för tomt system i M/M/1 ($p_0$) ;; $p_0 = 1 - \rho$.
