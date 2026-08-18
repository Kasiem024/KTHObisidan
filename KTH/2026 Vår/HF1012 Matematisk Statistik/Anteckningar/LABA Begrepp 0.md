---
tags: [begrepp, HF1012, KTH, labb, matematik, year2026]
created: 2026-05-14
updated: 2026-05-26
---
# LABA Begrepp 0

Stokastisk variabel ($X$) ;; Ett tal vars exakta värde bestäms av slumpen (t.ex. antalet prickar vid ett tärningskast eller väntetid i kö).
Väntevärde ($E(X)$ eller $\mu$) ;; Det teoretiska medelvärdet om man skulle upprepa ett slumpmässigt försök oändligt många gånger. (Det värde man "förväntar" sig i snitt).
Varians ($V(X)$ eller $\sigma^2$) ;; Ett statistiskt mått på hur mycket värdena i en fördelning sprider sig (varierar) kring väntevärdet.
Standardavvikelse ($\sigma$) ;; Kvadratroten ur variansen. Anger den genomsnittliga spridningen i samma enhet som den stokastiska variabeln.
Sannolikhetsfunktion (diskreta variabler) ;; Funktionen som ger chansen att en diskret stokastisk variabel antar ett *exakt* värde (t.ex. $P(X=3)$).
Täthetsfunktion (kontinuerliga variabler) ;; Funktionen som beskriver hur tätt sannolikhetsmassan är fördelad längs x-axeln. Arean under kurvan över ett intervall motsvarar sannolikheten.
Fördelningsfunktion / Kumulativ fördelning ($F(x)$) ;; Funktionen som anger sannolikheten att en variabel antar ett värde som är *mindre än eller lika med* x (alltså $P(X \le x)$).
<!--SR:!2026-05-17,3,250!2000-01-01,1,250-->
Binomialfördelning, $Bin(n,p)$ ;; Fördelningen som beskriver antalet lyckade utfall i ett förbestämt antal försök ($n$), där chansen att lyckas ($p$) är konstant.
Poissonfördelning, $Po(\lambda)$ ;; Fördelningen som beskriver *antalet gånger* en händelse inträffar under en given tidsperiod eller yta.
Exponentialfördelning, $Exp(\lambda)$ ;; Fördelningen som beskriver *tiden mellan* två händelser som inträffar slumpmässigt.
Normalfördelning, $N(\mu, \sigma)$ ;; Den klassiska, symmetriska "klockkurvan" som beskriver fenomen där många små, oberoende slumpfaktorer samverkar.
Parametern $\lambda$ (Lambda) i köteori ;; Ankomstintensiteten (förväntat antal kunder som anländer till systemet per tidsenhet).
<!--SR:!2000-01-01,1,250!2026-05-15,1,230-->
Parametern $\mu$ (Mu) i köteori ;; Betjäningsintensiteten (förväntat antal kunder en enskild betjänare hinner expediera per tidsenhet).
Tillstånd $E_k$ i ett kösystem/Markovkedja ;; Systemets nuvarande status (ofta representerat som att det finns exakt $k$ stycken kunder i systemet totalt).
"Minneslöshet" i en Markovkedja ;; Egenskapen att nästa tillstånd i systemet *endast* beror på nuvarande tillstånd, inte på hur systemet hamnade där.
Utfall ;; Ett enskilt, specifikt resultat av ett slumpmässigt försök (exempelvis att få en 4:a när du kastar en tärning).
Utfallsrum ($\Omega$) ;; Mängden av *alla* möjliga utfall i ett specifikt slumpförsök.
Händelse (inom sannolikhetslära) ;; En specifik delmängd av utfallsrummet (exempelvis "att slå ett jämnt tal").
Komplementhändelse ($A^*$) ;; Händelsen att ursprungshändelsen $A$ *inte* inträffar. Sannolikheten beräknas som $1 - P(A)$.
Disjunkta (oförenliga) händelser ;; Två händelser som är helt omöjliga att inträffa samtidigt, vilket innebär att $P(A \cap B) = 0$.
Oberoende händelser ;; Händelser där utfallet av den ena inte alls påverkar sannolikheten för den andra, vilket ger regeln $P(A \cap B) = P(A) \cdot P(B)$.
Betingad sannolikhet, $P(A|B)$ ;; Sannolikheten för händelse A, *givet* att vi redan vet med säkerhet att händelse B har inträffat.
Stickprovsmedelvärde ($\bar{x}$) ;; Genomsnittet av faktiskt observerade värden i en fysisk mätning (ett stickprov), i motsats till det teoretiska väntevärdet.
Median ;; Det mittersta värdet när en datamängd sorteras i storleksordning (ett lägesmått som är okänsligt för extrema avvikelser).
Typvärde ;; Det utfall eller värde i en datamängd som förekommer flest antal gånger.
Fakultet ($n!$) ;; Produkten av alla positiva heltal från 1 till $n$, vilket visar hur många sätt man kan ställa unika objekt i rad.
Binomialkoefficient ($\binom{n}{k}$) ;; Anger antalet sätt man kan välja ut $k$ element från en grupp på totalt $n$ element, *utan* hänsyn till dragningsordningen.
Betjänare (Server) i köteori ;; Den resurs i ett kösystem som utför själva arbetet för kunden (t.ex. en kassa i en butik).
Köplatser ($K$) i köteori ;; Det maximala antalet kunder som tillåts vänta på sin tur innan systemet blir helt fullt.
Spärrad kund (inom köteori) ;; En kund som anländer precis när systemets kapacitet är full, och därför omedelbart avvisas utan betjäning.
Effektiv ankomstintensitet ($\lambda_{eff}$) ;; Intensiteten av de kunder som *faktiskt släpps in* i systemet (totala $\lambda$ minus spärrade kunder).
