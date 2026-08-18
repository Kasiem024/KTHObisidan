---
tags: [begrepp, HF1012, KTH, labb, matematik, year2026]
created: 2026-05-14
updated: 2026-05-26
---
# LABA Begrepp 1

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

## LABA Begrepp - Kategori 1 (Grundläggande)

Matlab-kommandot `binopdf(x, n, p)` ;; Beräknar punktsannolikheten $P(X=x)$ för en binomialfördelning. 
Matlab-kommandot `binocdf(x, n, p)` ;; Beräknar den kumulativa fördelningsfunktionen $P(X \le x)$ för en binomialfördelning.
Matlab-ändelsen `cdf` (Cumulative Distribution Function) ;; Används i Matlab för att beräkna den kumulativa sannolikheten att en variabel är "högst x" ($P(X \le x)$).
Matlab-ändelsen `pdf` (Probability Density Function) ;; Används i Matlab för att beräkna punktsannolikheten (diskreta) eller täthetsfunktionen (kontinuerliga) i exakt punkten x.
Matlab-kommandot `poisspdf(x, lambda)` ;; Beräknar punktsannolikheten $P(X=x)$ för en poissonfördelning.
Matlab-kommandot `poisscdf(x, lambda)` ;; Beräknar den kumulativa fördelningsfunktionen $P(X \le x)$ för en poissonfördelning.
Matlab-kommandot `normpdf(x, mu, sigma)` ;; Beräknar värdet på täthetsfunktionen för en normalfördelning i punkten x.
Matlab-kommandot `normcdf(x, mu, sigma)` ;; Beräknar den kumulativa fördelningsfunktionen $P(X \le x)$ för en normalfördelning.
Matlab-kommandot `exppdf(x, mu)` ;; Beräknar täthetsfunktionen för exponentialfördelningen, där parametern måste vara väntevärdet ($1/\lambda$), INTE intensiteten ($\lambda$).
Matlab-kommandot `stem(x, y)` ;; Ritar ett stolpdiagram, vilket är ett formellt grafiskt krav för att visualisera diskreta sannolikhetsfunktioner.
Matlab-kommandot `stairs(x, y)` ;; Ritar ett trappstegsdiagram, vilket är ett formellt grafiskt krav för att visualisera diskreta fördelningsfunktioner.
Matlab-kommandot `plot(x, y)` ;; Ritar en mjuk kontinuerlig kurva, vilket är ett formellt grafiskt krav för kontinuerliga fördelningar.
Matlab-kommandot `hold on` ;; Håller kvar en befintlig kurva i figuren så att nästa diagram ritas in över samma axlar, istället för att raderas.
De fyra sannolikhetsfördelningar man förväntas känna till det grafiska utseendet på inför labprovet ;; Binomialfördelningen, Poissonfördelningen, Exponentialfördelningen och Normalfördelningen.
De två DISKRETA fördelningarna i kursen (ritas med stem/stairs) ;; Binomialfördelningen och Poissonfördelningen.
De två KONTINUERLIGA fördelningarna i kursen (ritas med plot) ;; Exponentialfördelningen och Normalfördelningen.
Väntevärde ($E(X)$) och standardavvikelse ($\sigma$) för Binomialfördelningen ;; $E(X) = n \cdot p$ samt $\sigma = \sqrt{n \cdot p \cdot (1 - p)}$.
Väntevärde ($E(X)$) och standardavvikelse ($\sigma$) för Poissonfördelningen ;; $E(X) = \lambda$ samt $\sigma = \sqrt{\lambda}$.
Väntevärde ($E(X)$) för Exponentialfördelningen ;; $E(X) = \frac{1}{\lambda}$.
Fördelningsfunktionen ($F(x)$) för Exponentialfördelningen ;; $F(x) = 1 - e^{-\lambda x}$.
Matlab-syntaxen `x = 0:1:16;` ;; Skapar en vektor med heltalssteg (0, 1, 2... 16), vilket oftast används som x-axel för diskreta fördelningar.
Matlab-syntaxen `x = 0:0.1:10;` ;; Skapar en tät numerisk vektor med steglängd 0.1, vilket används för att få en mjuk x-axel till kontinuerliga fördelningar.
Ett semikolon (`;`) placerat i slutet av en kodrad i Matlab ;; Undertrycker utskriften så att radens beräkningsresultat döljs i kommandofönstret.
Ett semikolon (`;`) inuti en matrisdefinition (t.ex. `[1 2 ; 3 4]`) i Matlab ;; Talar om för Matlab att skapa en ny rad i matrisen.
Erbjuden trafik $\rho$ (även kallad betjäningsfaktor) ;; Förhållandet beräknat genom ekvationen $\rho = \frac{\lambda}{\mu}$.
Matlab-uttrycket `sqrt(V)` ;; Beräknar kvadratroten ur $V$ (används primärt för att räkna fram standardavvikelsen om variansen är känd).
Formellt krav på elementen i en sannolikhetsvektor (startvektor) ;; Summan av alla ingående element måste bli exakt 1.
Formellt krav på elementen i en övergångsmatris $P$ ;; Summan av elementen på varje enskild horisontell rad måste bli exakt 1 (och inga element får vara negativa).
Matlab-syntaxen `P(2,3)` ;; Plockar fram och indexerar specifikt elementet som befinner sig på rad 2, kolumn 3 i matrisen P.
Kravet för säkert godkänt på labprovet ;; Att svara rätt på minst 4 av de 7 möjliga flervalsfrågorna.
