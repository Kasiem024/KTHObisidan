---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 22 – IPv6: 128-bitars adressering, kolon-hex-notation, förbättringar mot IPv4 och övergångsstrategier."
---
# HI1032 Begrepp - Kap 22 Nästa generations IP (IPv6)

Vad är huvudskälet till övergången från IPv4 till IPv6?::==IPv4:s adressrymd tar slut== – IPv6 använder 128-bitars adresser och ger praktiskt taget obegränsat med adresser.

**IPv6-adress**;;En ==128-bitars (16 byte) adress==, fyra gånger så lång som IPv4; skrivs i *kolon-hexadecimal* notation.

Hur lång är en IPv6-adress jämfört med en IPv4-adress?::IPv6 = ==128 bitar== (16 byte); IPv4 = 32 bitar (4 byte) – alltså fyra gånger så lång.

**Kolon-hexadecimal notation**;;Sättet att skriva IPv6-adresser för människor: ==åtta grupper om fyra hexadecimala siffror åtskilda av kolon==; kan förkortas (utelämna inledande nollor och komprimera en följd av nollgrupper till dubbelkolon).

Vilka tre strategier finns för övergången från IPv4 till IPv6? (3)
||
- **Dual stack** – kör *båda* protokollen parallellt
- **Tunneling** – kapsla in IPv6-paket i IPv4 genom ett IPv4-område
- **Header translation** – översätt mellan IPv4- och IPv6-huvuden

Nämn en förbättring i IPv6-huvudet jämfört med IPv4.::IPv6 har ett ==enklare huvud med fast längd (40 byte)==, slopar fragmentering i routrarna och lägger till ett *flow label* för särskild behandling av dataströmmar.
