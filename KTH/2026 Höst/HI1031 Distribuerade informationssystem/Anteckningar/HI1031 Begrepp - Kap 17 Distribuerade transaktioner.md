---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-08-31
description: "Flashcards HI1031 kap 17 – distribuerade transaktioner: platta/nästlade, atomiskt commit, tvåfas-commit och distribuerad deadlock."
---
# HI1031 Begrepp - Kap 17 Distribuerade transaktioner

**Distribuerad transaktion**;;En transaktion som ==berör objekt på flera olika servrar==; alla inblandade måste enas om att antingen commit:a eller abort:a tillsammans.

Vad skiljer en platt (flat) från en nästlad (nested) distribuerad transaktion?
||
- **Platt:** klienten gör sina förfrågningar till servrarna *sekventiellt*, en i taget.
- **Nästlad:** transaktionen delas i ==subtransaktioner== som kan köra *parallellt* på olika servrar.

**Atomiskt commit-protokoll**;;Ett protokoll som ser till att alla inblandade servrar ==commit:ar eller abort:ar tillsammans== – aldrig en blandning.

**Tvåfas-commit** (2PC);;Det vanligaste atomiska commit-protokollet: i *fas 1* frågar koordinatorn om alla kan commit:a (röstning), i *fas 2* meddelas det ==gemensamma beslutet==.

**Koordinator** (i 2PC);;Den server som ==leder tvåfas-commit==: samlar in deltagarnas röster och fattar och sprider det slutgiltiga beslutet.

Hur upptäcks en *distribuerad* deadlock?::Genom att leta efter ==cykler i den globala wait-for-grafen==; en decentraliserad teknik är *edge chasing* (kantjakt).
