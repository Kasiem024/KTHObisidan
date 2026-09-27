---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 17 – de fyra tentafrågorna: extra problem med distribuerade transaktioner, tvåfas-commit, hierarkisk kontra flat 2PC, och recovery efter nod- eller nätverksfel."
---
# HI1031 Begrepp - Kap 17 Distribuerade transaktioner

## 1. Extra problem med distribuerade transaktioner

Vilka extra problem får en distribuerad transaktion jämfört med en lokal? (3)
||
- **Alla eller ingen** – flera servrar måste enas om att commit:a eller abort:a, så någon måste samordna dem
- **Global ordning** – varje server ordnar sina egna objekt, men samma ordning måste gälla på alla servrar
- **Distribuerad deadlock** – en väntecykel som ligger utspridd över servrar och som ingen ser ensam

## 2. Tvåfas-commit (2PC)

Varför räcker inte ett enfas-protokoll för commit?::Ett enfas-protokoll låter ingen server säga nej. Men det kan en server behöva, t.ex. efter en ==deadlock eller krasch==.

Vad händer i fas 1 av 2PC, röstningsfasen? (2)
||
- Koordinatorn frågar alla deltagare: **canCommit?**
- Varje deltagare **röstar Yes eller No** – och sparar sina ändringar i permanent lagring innan den röstar Yes

Vad händer i fas 2 av 2PC, genomförandefasen? (2)
||
- Koordinatorn räknar rösterna: **alla Yes ger doCommit**, annars **doAbort**
- Deltagarna gör som de blir tillsagda och **bekräftar** att de commit:at

Vad är problemet för en deltagare som röstat Yes men inte fått veta utfallet?::Den måste ==vänta och hålla kvar sina lås== tills koordinatorn svarar. Har koordinatorn kraschat kan väntan bli lång.

## 3. Hierarkiskt kontra flat 2PC

Vad menas med att en subtransaktion "commit:ar provisoriskt"?::Att den ==blev klar korrekt men inte sparat något i permanent lagring==. Kraschar servern kan ersättaren därför inte commit:a den – till skillnad från "prepared".

Vilka subtransaktioner är med i 2PC för en nästlad transaktion?::De som ==committat provisoriskt och inte har någon aborterad förälder högre upp==.

Hur fungerar hierarkiskt 2PC? (2)
||
- **Nedåt** – koordinatorn skickar canCommit? bara till sina närmaste barn, som skickar vidare nedåt i trädet
- **Uppåt** – varje deltagare samlar ihop barnens svar innan den svarar sin egen förälder

Hur fungerar flat 2PC?::Koordinatorn skickar canCommit? ==direkt till alla deltagare== på en gång, i stället för nedåt genom trädet.

Varför behöver flat 2PC en abortList?::För att en server kan ha ==både provisoriskt commit:ade och abort:ade subtransaktioner==. Utan listan skulle den råka commit:a en vars förälder egentligen abort:at.

## 4. Recovery från 2PC

Vad ska transaktionsrecovery garantera efter en krasch? (2)
||
- Att commit:ade ändringar **finns kvar** i permanent lagring (durability)
- Att en transaktion blir **antingen helt av eller inte alls**, även om servern kraschar (failure atomicity)

Hur vet en server efter en krasch var i 2PC den befann sig?::Den läser den ==senaste statusposten i loggen== (den närmast slutet), och den avgör vad servern ska göra härnäst.

Varför måste "committed" skrivas till loggen direkt, som en forced write?::Saknas "committed" i loggen ==avbryts transaktionen efter en krasch==. Skrivs den för sent blir en färdig transaktion felaktigt avbruten.

Vad gör recovery efter en krasch om servern var koordinator? (2)
||
- **prepared** – inget beslut hade tagits, så servern aborterar och säger åt deltagarna att abortera
- **committed** – beslutet var redan taget, så servern skickar doCommit igen och slutför

Vad gör recovery efter en krasch om servern var deltagare? (3)
||
- **uncertain** – den vet inte utfallet, så den frågar koordinatorn (getDecision) och gör som svaret säger
- **prepared** – den hade inte röstat än, så den får abortera
- **committed** – den bekräftar (haveCommitted) ifall det inte hanns med före kraschen

Varför måste recovery vara idempotent?::Eftersom servern kan ==krascha igen mitt i recoveryn==, så proceduren måste ge samma resultat hur många gånger den än körs.
