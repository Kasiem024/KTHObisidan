## Inledning

I denna rapport genomför vi en numerisk analys av en specifik algoritm för att bestämma dess exakta komplexitetsfunktion $T(n)$ och dess tillväxttakt i form av $O(n)$. Den kod som analyseras består av fyra nästlade loopar där en enkel sats, `r++`, exekveras ett antal gånger beroende på indatastorleken $n$:

```
for(int i=1; i<=n; i++)
    for(int j=1; j<=i; j++)
        for(int k=j; k<=i+j; k++)
            for(int m=1; m<=i+j-k; m++)
                r++;
```

## Metodbeskrivning

Vi använder en numerisk metod i tre steg (försök) för att härleda funktionerna. Först skriver vi ett program som kör den givna koden och mäter det exakta antalet exekveringar av den enkla satsen för olika värden på $n$.

I det första försöket samlar vi in mätvärden för $n = 1, 2, \dots, 20$. Vi använder sedan ett matematikprogram för att anpassa polynom av allt högre grad till dessa mätvärden. Vi undersöker residualerna (skillnaden mellan mätning och modell) för att se när felet blir försumbart, vilket indikerar att rätt polynomgrad har hittats.

I det andra försöket utökar vi mätserien till $n = 1, 2, \dots, 40$. Vi använder den polynomgrad vi identifierade i det första försöket för att se om koefficienterna stabiliseras med en större mängd data. Detta säkerställer att vår modell inte bara är lokalt anpassad utan faktiskt beskriver algoritmens generella beteende.

I det tredje och sista försöket analyserar vi de erhållna decimala koefficienterna och omvandlar dessa till exakta bråktal. Vi sammanställer därefter den slutgiltiga teoretiska funktionen $T(n)$. För att verifiera att vår funktion är korrekt utför vi en kontrollberäkning där vi jämför ett beräknat värde för ett stort $n$ (exempelvis $n=1000$) mot ett faktiskt mätvärde från programmet. Slutligen förenklar vi funktionen till dess ordo $O(n)$ genom att identifiera den dominerande termen.

## Resultat och diskussion

Vi samlade in mätvärden för $T(n)$ genom att köra koden för $n$ mellan $1$ och $40$. Ett urval av dessa värden presenteras i tabellen nedan.

**Tabell 1: Uppmätt antal exekveringar** $T(n)$ **för olika** $n$**.**

|   |   |   |   |   |   |
|---|---|---|---|---|---|
|**n**|**T(n)**|**n**|**T(n)**|**n**|**T(n)**|
|$1$|$1$|$11$|$2\,431$|$31$|$128\,216$|
|$2$|$7$|$12$|$3\,367$|$32$|$145\,112$|
|$5$|$140$|$15$|$7\,820$|$35$|$205\,905$|
|$10$|$1\,705$|$20$|$23\,485$|$40$|$347\,270$|

I det första försöket anpassade vi polynom av grad $2$, $3$ och $4$ till de första $20$ mätvärdena. Vi fick följande resultat:

- Grad 2:
    
    $$T(n) \approx 78,8n^2 - 473n + 710$$
    
    Residualerna var mycket stora (maxfel $> 1000$), vilket visar att modellen inte stämmer.
    
- Grad 3:
    
    $$T(n) \approx 5,21n^3 - 61,5n^2 + 252n - 280$$
    
    Residualerna var fortfarande betydande.
    
- Grad 4:
    
    $$T(n) = 0,125n^4 + 0,416666666667n^3 + 0,375n^2 + 0,083333333333n$$
    
    Här blev residualerna i storleksordningen $10^{-12}$, vilket i praktiken innebär noll. Vi drog slutsatsen att $T(n)$ är ett polynom av grad $4$.
    

I det andra försöket använde vi data upp till $n=40$. Koefficienterna förblev stabila, vilket bekräftade att grad $4$ är korrekt.

I det tredje försöket omvandlade vi de decimala koefficienterna till exakta bråk. Vi fick då den slutgiltiga komplexitetsfunktionen:

$$T(n) = \frac{1}{8}n^4 + \frac{5}{12}n^3 + \frac{3}{8}n^2 + \frac{1}{12}n$$

För att verifiera funktionen räknade vi ut $T(100)$ teoretiskt:

$$T(100) = \frac{1}{8}(100^4) + \frac{5}{12}(100^3) + \frac{3}{8}(100^2) + \frac{1}{12}(100) = 12\,920\,425$$

När vi körde programmet för $n=100$ fick vi exakt $12\,920\,425$, vilket bevisar att funktionen är korrekt.

Eftersom den dominerande termen i $T(n)$ är $n^4$ och lägre potenser samt konstanta faktorer kan försummas vid stora $n$, blir algoritmens ordo:

$$O(n^4)$$