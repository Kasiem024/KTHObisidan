---
tags:
  - begrepp
  - CM1000
  - matematik
  - KTH
  - year2026
created: 2026-10-26
updated: 2026-10-26
description: Flashcards CM1000 kap 2 Mängdlära, inriktade på de vanligaste uppgiftstyperna sanningshaltsutredning, identitetsbevis och kartesisk produkt samt bevismetoder och begrepp som formelsamlingen inte ger.
---
# CM1000 Begrepp - Kap 02 Mängdlära

## Sanningshaltsutredning

Hur angriper du en "bevisa eller motbevisa"-uppgift i mängdlära? (3)
||
- **Gissa först** – testa med små mängder eller ett privat Venndiagram om formeln verkar sann
- **Verkar sann** – bevisa med formelmanipulation eller elementargument, precis som ett identitetsbevis
- **Verkar falsk** – ge ett litet motexempel och räkna ut VL och HL var för sig

Varför räcker det inte att motbevisa det ena av två mängdpåståenden för att visa att det andra gäller?::Varje påstående har sin egen sanningshalt, så du måste ==bevisa det sanna fristående och motbevisa det falska var för sig==.

Hur motbevisar du en mängdformel du tror är falsk?::Välj ==små konkreta mängder==, räkna ut vänster- och högerledet var för sig och visa att de skiljer sig.

## Identitetsbevis

Vad är grundformen för ett identitetsbevis med formelmanipulation? (3)
||
- **Skriv om differenser** – byt $A - B$ mot $A \cap B^{c}$ och symmetrisk differens mot snitt, union och komplement
- **Bearbeta ena ledet** – använd distributiva lagen, DeMorgan och dubbla komplementet tills det blir lika det andra ledet
- **Inför kortnamn** – beteckna ett återkommande deluttryck för att slippa räknefel

Elementargument för en mängdlikhet — vad går metoden ut på?::Du skriver om "==ett element ligger i vänsterledet==" till en ren logisk utsaga och visar att den är ekvivalent med att elementet ligger i högerledet.

Bevis med två inklusioner — hur visar du att $A = B$?::Visa ==$A \subset B$ och $B \subset A$==, alltså att vartdera ledet är en delmängd av det andra.

Mängdteoretisk sanningstabell — hur använder du den för att bevisa en likhet?::Inför utsagor som $p \Leftrightarrow x \in A$, ställ upp kolumner för vänster- och högerledet och visa att ==kolumnerna blir identiska==.

Vad kräver examinatorn av en mängdteoretisk sanningstabell? (2)
||
- **Skilj utsaga från mängd** – blanda inte ihop vad som är en utsaga ($x \in A$) och vad som är en mängd
- **Förklara i text** – bara tabellen räcker inte, resonemanget måste motiveras i ord

Hur förenklar du ett led som snittas med sitt eget komplement?::Det blir ==tomma mängden== och faller bort, till exempel $A \cup (Z \cap Z^{c}) = A$.

Vad gäller för Venndiagram som bevismetod i mängdlära på KS?::Det ==duger inte som bevis==; du får rita privat kladd, men själva lösningen måste vara ett logiskt hållbart argument.

## Kartesisk produkt

Hur visar du en identitet mellan kryssprodukter med elementargument?::Visa ekvivalensen att ett par $(x, y)$ ligger i vänsterledet ==precis när det ligger i högerledet==, via villkoret att förstakoordinaten ligger i första mängden och andrakoordinaten i andra.

Varför måste du vara extra försiktig med en kryssproduktlikhet som ser rimlig ut?::Många produktlikheter är ==falska trots att de ser symmetriska ut==, till exempel $(A \times B) \cup (C \times D) \neq (A \cup C) \times (B \cup D)$; kontrollera med konkreta mängder.

## Potensmängd

Vilka två potensmängdslikheter ska du hålla isär? (2)
||
- **Snitt** – $\mathcal{P}(A \cap B) = \mathcal{P}(A) \cap \mathcal{P}(B)$ gäller alltid
- **Union** – $\mathcal{P}(A \cup B) = \mathcal{P}(A) \cup \mathcal{P}(B)$ gäller inte

Vad är elementen i en potensmängd $\mathcal{P}(X)$?::Elementen är ==själva delmängderna av $X$==, som i sin tur är mängder, så blanda inte ihop element och delmängd.

Potensmängdslikhet du tror är falsk — vad är den enklaste motbevismetoden?::Jämför ==antalet element== i de två leden för små mängder; olika antal betyder att de inte kan vara lika.

## Konkret mängdräkning

Hur räknar du ut en konkret mängd ur givna mängder?::Bygg uttrycket ==utifrån och in, en operation i taget==, och skriv ut varje delmängd som en uppräkning av element.

Vad måste du hålla reda på när du tar komplement i en konkret mängduträkning?::Vilket ==universum $U$== du arbetar i, eftersom komplementet $A^{c}$ är allt i $U$ som inte ligger i $A$.

Hur visar du att det finns mängder som uppfyller en lista med villkor?::Konstruera ett ==konkret exempel== och verifiera varje villkor för sig.

## Begrepp och metoder som inte står i formelsamlingen

Kontraposition för mängder;;En inklusion gäller precis när inklusionen mellan komplementen gäller åt andra hållet: ==$E \subset F \Leftrightarrow F^{c} \subset E^{c}$==.

Vad gäller alltid för tomma mängden som delmängd?::Tomma mängden är en ==delmängd av varje mängd==, alltså $\emptyset \subset A$ för alla $A$.

Vad är skillnaden mellan $x \in M$ och $x \subset M$? (2)
||
- **Element** – $x \in M$ betyder att $x$ står med i uppräkningen av $M$:s medlemmar
- **Delmängd** – $x \subset M$ betyder att allt som finns i $x$ också ligger i $M$, så $x$ måste själv vara en mängd

Hur skrivs symmetrisk differens $A \oplus B$ med hjälp av mängddifferenser?;;==$(A - B) \cup (B - A)$== — de element som ligger i precis en av mängderna.

Vilka element ligger i den symmetriska differensen $A \oplus B \oplus C$ av flera mängder?::De som ligger i ett ==udda antal== av mängderna.
