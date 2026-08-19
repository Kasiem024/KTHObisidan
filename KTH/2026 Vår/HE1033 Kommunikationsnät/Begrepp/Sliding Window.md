---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
description: "Tekniken som låter en sändare skicka flera paket innan ACK kommit på det första, för att utnyttja bandbredden och styra flödet."
created: 2026-08-18
updated: 2026-08-18
---
# Sliding Window

> **Lager:** OSI 2 & 4
> **Mål:** Utnyttja bandbredden och styra flödet.

---

## Definition
**Sliding Window (glidande fönster)** är tekniken som låter en sändare skicka flera paket innan den fått bekräftelse (ACK) på det första. Fönstret är antalet obekräftade paket som får vara "i luften" samtidigt.

- **Glider framåt:** När ett ACK kommer in flyttas fönstrets nedre kant fram, och sändaren får utrymme att skicka nya paket.
- **Flödeskontroll:** Mottagaren styr fönsterstorleken och kan därmed bromsa en sändare som är snabbare än mottagaren.
- **Stop-and-Wait** är specialfallet med fönsterstorlek 1 — sändaren står still och väntar på varje ACK, vilket ger dåligt utnyttjande av länken.

### Fönsterstorlek vid $k$ sekvensnummer-bitar
- **Go-Back-N:** $2^k-1$
- **Selective Repeat:** $2^{k-1}$

## Tenta-fokus
- **Varför inte $2^k$ i Go-Back-N?** Om fönstret vore lika stort som sekvensnummerrymden kan mottagaren inte skilja ett nytt paket från en omsändning av ett gammalt.
- **Varför halva rymden i Selective Repeat?** Mottagaren buffrar paket ur ordning, så fönstren för sändare och mottagare får inte kunna överlappa samma sekvensnummer.
- **Utnyttjande:** Med fönster $W$, paketstorlek $L$ och rundtid RTT blir genomströmningen ungefär $\frac{W \cdot L}{RTT}$. Fönstret bör täcka bandbredd-fördröjningsprodukten för att länken ska hållas full.
- **TCP:** Använder ett glidande fönster för flödeskontroll, där mottagaren annonserar sitt lediga buffertutrymme (*receive window*) i varje segment.

## Kopplat till
- **Mekanism:** [[ARQ-protokoll]]
- **Protokoll:** [[TCP]]

## Flashcards

Vad är ett glidande fönster (Sliding Window)?(Definition):: Antalet paket en sändare får ha obekräftade samtidigt, vilket gör att den kan fortsätta skicka utan att vänta på varje ACK.

Vilken fönsterstorlek gäller för Go-Back-N respektive Selective Repeat vid $k$ sekvensnummer-bitar?:: Go-Back-N: $2^k-1$. Selective Repeat: $2^{k-1}$.

Vilket ARQ-protokoll motsvarar fönsterstorlek 1?:: Stop-and-Wait.

Varför förbättrar ett större fönster utnyttjandet av länken?:: Sändaren slipper stå still och vänta på ACK, vilket håller länken full även när rundtiden (RTT) är lång.

Hur används glidande fönster i TCP?(Definition):: För flödeskontroll — mottagaren annonserar sitt lediga buffertutrymme (receive window) så att sändaren inte översvämmar den.
