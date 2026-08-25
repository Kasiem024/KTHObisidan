---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 29 – peer-to-peer: centraliserat/decentraliserat, strukturerat/ostrukturerat, DHT, Chord, Kademlia och BitTorrent."
---
# HI1032 Begrepp - Kap 29 Peer-to-peer

Vad skiljer ett centraliserat från ett decentraliserat P2P-nät?
||
- **Centraliserat:** en *central katalog* (klient-server) håller reda på vem som har vad; filerna delas peer-to-peer (t.ex. Napster).
- **Decentraliserat:** ==både katalog och fildelning== sker peer-to-peer, utan central server.

Vad skiljer ett strukturerat från ett ostrukturerat decentraliserat P2P-nät?
||
- **Strukturerat:** noder och data placeras enligt en bestämd struktur (DHT) → ==garanterad uppslagning==.
- **Ostrukturerat:** ad hoc-koppling → uppslagning via sökning, ==utan garantier==.

**DHT** (Distributed Hash Table, i P2P);;Ett matematiskt sätt att ==sprida (nyckel, värde)-par över noderna och routa till rätt ansvarig nod==; grunden för decentraliserade P2P-nät.

**Chord**;;Ett DHT-baserat P2P-nät som ordnar noder i en *ring* och använder en ==finger table== för att hitta rätt nod på få steg.

**Kademlia**;;Ett DHT-baserat P2P-nät som routar med *k-buckets* och ett eget ==avståndsmått mellan identifierare==; används i trackerless BitTorrent.

**BitTorrent**;;Ett populärt P2P-nät för ==fildelning==, där en *tracker* (eller en Kademlia-DHT i trackerless-varianten) ger listan på peers i en "swarm".
