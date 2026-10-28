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
description: "Flashcards CM1000 kap 4, byggstenarna för talteoriuppgifterna: kongruensekvationer med multiplikativ invers, delbarhetsbevis, gcd och Bézout, restklassgenomgång och kongruensräknande."
---
# CM1000 Begrepp - Kap 04 Talteori

## Delbarhetsbevis

Hur faktoriserar du $n^{3} - n$ i ett delbarhetsbevis?;;Till ==$(n-1)\,n\,(n+1)$==, tre på varandra följande heltal.

Vad vet du om produkten av tre på varandra följande heltal?;;Den är delbar med ==$6$==, eftersom ett av talen är delbart med $2$ och ett med $3$.

Hur skriver du ett udda heltal när du ska bevisa delbarhet för dess kvadrat?;;Som ==$2k + 1$==; kvadrering visar då delbarhet med $4$ eller $8$.

Om ett uttryck är delbart med två relativt prima tal $a$ och $b$, vad följer då?;;Att det är delbart med ==produkten $ab$==.

Varför räcker det inte med ett exempel för att visa att $t$ delar ett uttryck för alla heltal?::Ett exempel kan bara ==motbevisa==; en allmän delbarhet måste visas för alla $n$ (även negativa).

## Kongruensekvation

Hur löser du en linjär kongruens $ax \equiv b \pmod{m}$ när $a$ och $m$ är relativt prima? (3)
||
- **Invers** – finn den multiplikativa inversen till $a$ modulo $m$ med Euklides utvidgade algoritm
- **Multiplicera** – multiplicera båda led med inversen så att $x$ blir ensamt
- **Reducera** – ange svaret som en rest mellan $0$ och $m-1$

Vad menas med den multiplikativa inversen till $a$ modulo $m$?;;Ett tal $\bar{a}$ med ==$a \cdot \bar{a} \equiv 1 \pmod{m}$==.

Hur får du fram den multiplikativa inversen till $a$ modulo $m$ ur Euklides utvidgade algoritm? (2)
||
- **Skriv 1 som kombination** – gå baklänges genom likheterna och skriv $1 = xa + ym$
- **Läs av inversen** – koefficienten $x$ framför $a$ är inversen (addera $m$ om den blev negativ)

Vad gör du om den multiplikativa inversen blir negativ när du löser en kongruens?::==Adderar $m$== tills resten ligger mellan $0$ och $m-1$.

Hur skriver du om villkoret att $m$ delar $ax + c$ till en kongruens?::Som ==$ax \equiv -c \pmod{m}$==.

## gcd och allmän delbarhet

Vad får du genom att gå baklänges i Euklides algoritm?;;$\gcd(a, b)$ skrivet som en ==linjärkombination $ax + by$==.

Hur bevisar du en identitet mellan två gcd-uttryck? (2)
||
- **Visa båda håll** – ett tal $d$ är gemensam delare till det ena uttrycket precis när det är det till det andra
- **Dra slutsatsen** – samma gemensamma delare ger samma största gemensamma delare

## Bézout och relativt prima

Hur använder du att $a$ och $b$ är relativt prima i ett bevis?;;Du vet att det finns heltal med ==$ax + by = 1$==, vilket ger en invers eller låter dig förkorta.

Om $a$ och $b$ är relativt prima och $a \mid bc$, vad följer då?;;Att ==$a \mid c$==.

När får du förkorta bort $c$ i kongruensen $ac \equiv bc \pmod{n}$?;;När ==$\gcd(c, n) = 1$==, för då har $c$ en invers modulo $n$ (annulleringslagen).

## Restklassgenomgång

Hur avgör du genom restklassgenomgång om en kongruens har någon lösning? (3)
||
- **Lista klasserna** – pröva varje rest $x = 0, 1, \dots, m-1$ modulo $m$
- **Räkna ut uttrycket** – värdet är detsamma för alla tal i samma restklass
- **Jämför** – finns den sökta resten i någon klass finns lösning, annars inte

Varför räcker det att testa ett enda tal ur varje restklass modulo $m$?::Alla tal i samma klass ger ==samma rest i uttrycket==.

Hur visar du att en ekvation som $3x^{2} + 2 = y^{2}$ saknar heltalslösningar?::Visa att ==varje restklass== (t.ex. modulo $3$) leder till en motsägelse.

## Kongruensbevis

Om ett primtal $p$ delar en produkt $mn$, vad kan du dra för slutsats?;;Att ==$p \mid m$ eller $p \mid n$==; detta gäller bara för primtal.

Vilken faktorisering använder du på $a^{2} - b^{2}$ i ett kongruensbevis?;;Konjugatregeln: ==$(a + b)(a - b)$==.

## Sant eller falskt

Hur angriper du en uppgift med ett sant och ett falskt påstående? (2)
||
- **Det sanna** – bevisa det direkt med kongruensräkning eller algebra
- **Det falska** – motbevisa det med ett konkret motexempel i heltal
