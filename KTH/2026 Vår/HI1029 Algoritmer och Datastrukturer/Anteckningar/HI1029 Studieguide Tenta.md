---
tags: [KTH, year2026, HI1029, studieguide, tenta, programmering]
created: 2026-05-28
updated: 2026-05-28
---
# 🎓 Studieguide: HI1029 Algoritmer och Datastrukturer

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

Denna guide är sammanställd för att hjälpa dig navigera genom de viktigaste delarna inför tentamen.

## 📊 Tidskomplexitet (Big O) - Snabbguide

| Datastruktur | Sökning | Insättning | Borttagning | Kommentar |
| :--- | :--- | :--- | :--- | :--- |
| **Array-lista** | $O(1)$* / $O(n)$ | $O(n)$ | $O(n)$ | *Indexering är $O(1)$, sökning efter värde $O(n)$. |
| **Länkad lista** | $O(n)$ | $O(1)$* | $O(1)$* | *Om du redan har referensen/iteratorn. |
| **Hashtabell** | $O(1)$ | $O(1)$ | $O(1)$ | Förväntad tid vid bra hashfunktion. |
| **BST (Balanserat)** | $O(\log n)$ | $O(\log n)$ | $O(\log n)$ | Värsta fall $O(n)$ om obalanserat. |
| **Heap** | $O(1)$ (findMin/Max) | $O(\log n)$ | $O(\log n)$ | Används för prioritetsköer. |

## 🔄 Sorteringsalgoritmer

- **Urvalssortering (Selection):** $O(n^2)$ jämförelser, $O(n)$ byten. Stabil: Nej.
- **Instickssortering (Insertion):** $O(n^2)$ värsta fall, $O(n)$ vid nästan sorterad data. Stabil: Ja.
- **Quicksort:** $O(n \log n)$ medel, $O(n^2)$ värsta fall. Stabil: Nej.
- **Mergesort:** Alltid $O(n \log n)$. Kräver $O(n)$ extra minne. Stabil: Ja.

## 💡 Strategier för plugg
1. **Rita strukturerna:** Kan du rita hur en Heap ser ut efter `remove()`?
2. **Implementera ADTs:** Testa att skriva en enkel `Stack` eller `Kön` från grunden.
3. **Analysera kod:** Öva på att se om en loop-struktur är $O(n)$ eller $O(n^2)$.

---
**Se även:**
- [[HI1029 Begrepp Tenta]]
- [[HI1029 Begrepp Föreläsning 1-4]]
