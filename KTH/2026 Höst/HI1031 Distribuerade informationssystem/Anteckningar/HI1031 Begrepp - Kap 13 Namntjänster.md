---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 13 – namntjänster: namnupplösning, namnrymd, DNS, iterativ/rekursiv navigering samt katalogtjänster."
---
# HI1031 Begrepp - Kap 13 Namntjänster

**Namntjänst** (name service);;En tjänst som ==översätter namn till data om den namngivna resursen== (t.ex. en adress), så att resurser kan pekas ut och nås.

**Namnupplösning** (name resolution);;Att ==översätta ett namn till information om objektet==, ofta i flera steg genom olika namnservrar.

**Namnrymd** (name space);;==Mängden av alla giltiga namn== som en tjänst känner igen, ofta med en *hierarkisk* struktur (som domännamn eller sökvägar).

Vilken är den stora fördelen med en *hierarkisk* namnrymd?::Den kan ==växa obegränsat och delas upp== så att olika delar (kontext) kan administreras av olika organisationer.

Vad är skillnaden mellan ett "rent namn" (pure name) och en adress?
||
- **Rent namn:** säger *inget* om objektet – måste ==slås upp== för att bli användbart.
- **Adress:** anger *var* objektet finns – effektivt att nå, men blir fel om objektet flyttas.

**DNS** (Domain Name System);;Internets namntjänst som ==översätter domännamn (t.ex. `www.kth.se`) till IP-adresser==, via en hierarkisk och replikerad struktur.

Vad skiljer iterativ från rekursiv namnupplösning?
||
- **Iterativ:** klienten frågar en server, får en ==hänvisning till nästa server== och frågar själv vidare.
- **Rekursiv:** servern ==frågar vidare åt klienten== och returnerar det slutgiltiga svaret.

**Katalogtjänst** (directory service);;En tjänst där man ==söker efter objekt utifrån attribut/egenskaper== i stället för via ett känt namn – "gula sidorna" jämfört med namntjänstens "vita sidor".

Varför använder namntjänster som DNS caching och replikering?::För ==hög tillgänglighet och snabba svar== – vanliga uppslag kan besvaras lokalt utan att belasta rotservrarna.
