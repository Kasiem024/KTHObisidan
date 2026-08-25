---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 23 – transportlagret: process-till-process, portnummer, förbindelse(lös), sliding window och Stop-and-Wait/Go-Back-N/Selective-Repeat."
---
# HI1032 Begrepp - Kap 23 Introduktion till transportlagret

Vilken leveransomfattning har transportlagret?::==Process-till-process== – det levererar meddelandet till rätt *program/process*, medan nätverkslagret bara når rätt värd.

**Portnummer** (port number);;Ett ==16-bitars nummer (0–65535) som identifierar en specifik process== på en värd, så att transportlagret vet vilket program datan ska till.

Vad skiljer ett well-known- från ett ephemeral-portnummer?
||
- **Well-known:** *fast* nummer för en serverprocess (t.ex. 80 för HTTP), känt i förväg.
- **Ephemeral:** ==tillfälligt, kortlivat== nummer som klienten tilldelas (oftast > 1023).

Vad skiljer förbindelselös från förbindelseorienterad transporttjänst?
||
- **Förbindelselös:** paket skickas ==utan uppkoppling== (t.ex. UDP).
- **Förbindelseorienterad:** en *logisk förbindelse upprättas först* mellan parterna (t.ex. TCP).

Vilka tre grundprotokoll för tillförlitlig leverans tas upp? (3)
||
- **Stop-and-Wait** – en ram i taget; enkelt men ineffektivt
- **Go-Back-N** – *pipelining*; sänd om från och med den felaktiga ramen
- **Selective-Repeat** – sänd om *bara* den förlorade ramen

Vad skiljer Go-Back-N från Selective-Repeat?
||
- **Go-Back-N:** vid förlust ==sänds allt om från den felaktiga ramen== och framåt.
- **Selective-Repeat:** ==bara den förlorade ramen== sänds om – effektivare men mer komplext.

**Glidande fönster** (sliding window);;En mekanism som låter sändaren ha ==flera obekräftade ramar "i luften" samtidigt== (pipelining), vilket ger bättre genomströmning än Stop-and-Wait.
