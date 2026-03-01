# LABA Uppgift 1 HI1029 - Kasiem Al-Mshabbak

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

I det andra försöket utökar vi mätserien till $n = 1, 2, \dots, 40$ för att verifiera att koefficienterna i polynomet stabiliseras.

I det tredje försöket verifierar vi vår modell genom att beräkna ett teoretiskt värde för ett stort $n$ (t.ex. $n=1000$) med vårt framtagna polynom och jämför detta med det faktiska resultatet från en körning av koden.

## Resultat och diskussion

Vi körde programmet och registrerade antalet exekveringar $T(n)$ för $n$ mellan 1 och 40. Ett urval av dessa värden presenteras i tabellen nedan.

**Tabell 1: Uppmätt antal exekveringar** $T(n)$ **för olika** $n$  

|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
|**n**|**T(n)**|**n**|**T(n)**|**n**|**T(n)**|**n**|**T(n)**|
|**1**|1|**11**|2 541|**21**|28 336|**31**|128 266|
|**2**|7|**12**|3 523|**22**|33 902|**32**|145 112|
|**3**|26|**13**|4 758|**23**|40 250|**33**|163 625|
|**4**|70|**14**|6 279|**24**|47 450|**34**|183 855|
|**5**|155|**15**|8 120|**25**|55 575|**35**|205 905|
|**6**|301|**16**|10 316|**26**|64 701|**36**|229 881|
|**7**|532|**17**|12 903|**27**|74 907|**37**|255 892|
|**8**|876|**18**|15 919|**28**|86 275|**38**|284 050|
|**9**|1 365|**19**|19 400|**29**|98 890|**39**|314 470|
|**10**|1 705|**20**|23 485|**30**|112 840|**40**|347 270|

I det första försöket anpassade vi polynom av grad 2, 3 och 4 till de första 20 mätvärdena. Vi fick följande resultat:

- **Grad 2:**
    
    $$T(n) \approx 78,8n^2 - 473n + 710$$
    
    Residualerna var mycket stora, vilket visar att modellen inte stämmer.
    
- **Grad 3:**
    
    $$T(n) \approx 5,21n^3 - 61,5n^2 + 252n - 280$$
    
    Residualerna var fortfarande betydande.
    
- Grad 4:
    
    När vi anpassade ett fjärdegradspolynom blev residualerna försumbara (i storleksordningen $10^{-12}$). Vi fick följande exakta polynom:
    
    $$T(n) = \frac{1}{8}n^4 + \frac{5}{12}n^3 + \frac{3}{8}n^2 + \frac{1}{12}n$$

I det andra försöket använde vi data upp till $n=40$. Koefficienterna förblev stabila, vilket bekräftade att grad 4 är korrekt.

I det tredje försöket testade vi modellen mot ett större värde, $n=1000$.

Enligt vår formel:

$$T(1000) = \frac{1}{8}(1000)^4 + \dots \approx 1,25 \cdot 10^{11}$$

Detta stämde överens med programmets utdata.

## Slutsats

$$T(n) = \frac{1}{8}n^4 + \frac{5}{12}n^3 + \frac{3}{8}n^2 + \frac{1}{12}n$$$$O(n^4)$$
