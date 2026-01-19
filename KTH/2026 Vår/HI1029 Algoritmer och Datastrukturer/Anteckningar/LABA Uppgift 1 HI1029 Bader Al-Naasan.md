## Inledning

Syftet med denna laboration är att genom numerisk analys fastställa tidskomplexiteten för en algoritm. Vi söker dels den specifika funktionen $T(n)$, som beskriver antalet instruktionsexekveringar, och dels algoritmens tillväxttakt uttryckt som $O(n)$. Den kod som ligger till grund för undersökningen visas nedan:

```
for(int i=1; i<=n; i++)
    for(int j=1; j<=i; j++)
        for(int k=j; k<=i+j; k++)
            for(int m=1; m<=i+j-k; m++)
                r++;
```

## Metodbeskrivning

Jag har genomfört analysen i tre distinkta faser för att säkerställa ett tillförlitligt resultat. Inledningsvis utvecklade jag ett program i Java för att räkna det exakta antalet gånger som variabeln `r` inkrementeras för olika värden på $n$.

I det första experimentet samlade jag in data för $n$ i intervallet $1$ till $20$. Genom att använda kurvanpassning testade jag polynom med successivt högre gradtal. Jag studerade residualerna för varje anpassning för att identifiera vid vilken grad som modellen stämde överens med mätdata utan signifikanta avvikelser.

Under den andra fasen utökade jag datamängden till att omfatta $n$ upp till $40$. Syftet med detta var att kontrollera stabiliteten i de koefficienter jag fått fram i den första fasen. Om koefficienterna förblir i princip oförändrade när mer data läggs till, stärker det modellens trovärdighet för större indatastorlekar.

I den sista fasen analyserade jag de numeriska värdena för att finna exakta bråktal som motsvarar de decimala koefficienterna. Jag sammanställde därefter den teoretiska formeln för $T(n)$. För att verifiera att min härledda funktion stämmer överens med verkligheten utförde jag en kontrollberäkning för ett högt värde ($n=100$) och jämförde det beräknade resultatet med en faktisk programkörning. Slutligen förenklade jag funktionen till dess ordo-notation genom att extrahera den mest betydande termen.

## Resultat och diskussion

Genom körningar av programmet erhölls de mätvärden som presenteras i urval i Tabell 1. Dessa värden utgör basen för hela den efterföljande beräkningsmodellen.

**Tabell 1: Uppmätta värden för exekveringar vid olika indatastorlekar.**

|   |   |   |   |   |   |
|---|---|---|---|---|---|
|**n**|**T(n)**|**n**|**T(n)**|**n**|**T(n)**|
|$1$|$1$|$11$|$2\,431$|$21$|$28\,336$|
|$2$|$7$|$15$|$7\,820$|$30$|$112\,840$|
|$5$|$140$|$20$|$23\,485$|$40$|$347\,270$|

Under mitt första försök med kurvanpassning prövade jag olika polynomgrader. Resultaten visade tydligt att lägre grader inte var tillräckliga:

- **Andragradsanpassning:** Gav en modell med stora felmarginaler, där residualerna uppgick till flera tusen, vilket utesluter $O(n^2)$.
    
- **Tredjegradsanpassning:** Förbättrade passformen något, men gav fortfarande systematiska avvikelser som inte kunde ignoreras.
    
- Fjärdegradsanpassning: Resulterade i följande funktion:
    
    $$T(n) = 0,125n^4 + 0,416667n^3 + 0,375n^2 + 0,083333n$$
    
    Här sjönk felen till nära noll ($< 10^{-11}$), vilket indikerar att en fjärdegradskonstruktion är korrekt för denna algoritm.
    

I det andra försöket, där jag använde värden upp till $n=40$, bekräftades att koefficienterna var konstanta och inte ändrades av den ökade datamängden.

I det tredje försöket tolkade jag koefficienterna som bråk för att erhålla den exakta matematiska modellen:

$$a = \frac{1}{8}, \quad b = \frac{5}{12}, \quad c = \frac{3}{8}, \quad d = \frac{1}{12}$$

Detta ger den kompletta komplexitetsfunktionen:

$$T(n) = \frac{1}{8}n^4 + \frac{5}{12}n^3 + \frac{3}{8}n^2 + \frac{1}{12}n$$

För att validera modellen beräknade jag värdet för $T(100)$ manuellt med formeln:

$$T(100) = \frac{100^4}{8} + \frac{5 \cdot 100^3}{12} + \frac{3 \cdot 100^2}{8} + \frac{100}{12} = $$
$$=12\,500\,000 + 416\,666,66... + 3\,750 + 8,33... = 12\,920\,425$$

En kontrollkörning i mitt Java-program för $n=100$ gav exakt $12\,920\,425$, vilket styrker att formeln är helt korrekt. Då termen med högst exponent är $n^4$ kan vi dra slutsatsen att algoritmens ordo är:

$$O(n^4)$$