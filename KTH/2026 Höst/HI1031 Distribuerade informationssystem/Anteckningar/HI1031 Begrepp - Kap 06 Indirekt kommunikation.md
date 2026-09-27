---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 6, ordnade efter kursens fem tentafrågor: poängen med indirekt kommunikation, gruppkommunikation, publish-subscribe, message queuing och jämförelsen mellan de tre."
---
# HI1031 Begrepp - Kap 06 Indirekt kommunikation

## Fråga 1 – Poängen med indirekt kommunikation, och strategierna

**Indirekt kommunikation**;;Kommunikation mellan två parter ==via en mellanhand==, utan direkt koppling mellan sändaren och mottagaren.

Vad är problemet med direkt koppling mellan sändare och mottagare?::Systemet blir ==stelt==. Servern är svår att byta ut, och kraschar den måste klienten själv märka det och laga felet.

**Rumslig frikoppling**;;Sändaren ==vet inte vilka mottagarna är==, och behöver inte veta det – och tvärtom.

**Tidsmässig frikoppling**;;Sändare och mottagare ==behöver inte finnas samtidigt== – de kan ha oberoende livslängder.

Vad är nackdelarna med indirekt kommunikation? (2)
||
- **Kostar prestanda** – den extra mellanhanden gör det långsammare
- **Svårare att förvalta** – ingen direkt koppling att följa när man felsöker

Vilka tre strategier för indirekt kommunikation tar kursen upp? (3)
||
- Gruppkommunikation
- Publish-subscribe
- Message queues (meddelandeköer)

## Fråga 2 – Gruppkommunikation och hur det kan implementeras

**Gruppkommunikation**;;Ett meddelande skickas till en grupp och ==levereras till alla medlemmar==, utan att sändaren vet vilka de är.

Vad lägger gruppkommunikation till ovanpå enkel IP-multicast? (3)
||
- **Tillförlitlighet** – garantier att medlemmarna får meddelandet
- **Ordning** – meddelanden levereras i en bestämd ordning
- **Medlemshantering** – håller reda på vilka som är med och upptäcker krascher

Vad menar man med tillförlitlig (reliable) multicast? (3)
||
- **Integritet** – meddelandet kommer fram oförändrat och bara en gång
- **Giltighet** – ett skickat meddelande kommer fram till slut
- **Överenskommelse** – får en i gruppen meddelandet, får alla det

Vilka tre sorters ordning kan gruppkommunikation garantera? (3)
||
- **FIFO** – skickar en process A före B, så får alla dem i den ordningen
- **Kausal** – hänger ett meddelande ihop med ett tidigare, så bevaras den ordningen
- **Total** – alla processer får meddelandena i exakt samma ordning

Vilka tre delar består verktyget JGroups av? (3)
||
- **Channels** – det enklaste gränssnittet: gå med, lämna, skicka, ta emot
- **Building blocks** – färdiga byggblock på högre nivå
- **Protokollstacken** – ihopsättbara lager, och alla i gruppen måste ha samma

## Fråga 3 – Publish-subscribe och hur det kan implementeras

Hur fungerar publish-subscribe?::Utgivare (publishers) skickar ut händelser, prenumeranter (subscribers) anmäler vad de vill ha, och systemet ==matchar och levererar bara det som passar==.

Vilka fyra sätt kan man uttrycka en prenumeration på? (4)
||
- **Kanalbaserad** – prenumerera på en namngiven kanal
- **Topic-baserad** – ett fält i meddelandet anger ämnet (topic)
- **Innehållsbaserad** – villkor på värdena i händelsen
- **Typbaserad** – matchar på händelsens typ

Var kan man placera händelsemäklaren i publish-subscribe? (3)
||
- **Centralt** – en enda nod är mäklare
- **Nät av mäklare** – flera mäklare samarbetar
- **Peer-to-peer** – alla noder är mäklare

Varför räcker det inte med en enda central mäklare? (2)
||
- **Enda felpunkt** – går den ner slutar allt fungera
- **Flaskhals** – all trafik måste passera en nod

## Fråga 4 – Message queuing och hur det implementeras bra

**Message queue** (meddelandekö);;En punkt-till-punkt-tjänst där sändaren lägger meddelandet i en kö och ==en enda process plockar bort det==.

Vad är den avgörande egenskapen hos message queues?::Att meddelandena är ==persistenta== – kön lagrar dem tills någon hämtar dem.

Vad innebär persistensen för leveransen?::Meddelandet ==levereras garanterat till slut==, men man vet inte när.

Hur implementerar man message queues på ett bra sätt?::Man sprider ut köhanterarna, t.ex. hub-and-spoke: klienten kopplar mot en ==lokal spoke== och väntar tills meddelandet ligger där. Sedan går det vidare till hubben.

## Fråga 5 – Jämför gruppkommunikation, publish-subscribe och message queuing

Hur skiljer sig sändaren mellan de tre metoderna? (3)
||
- **Grupp** – skickar till alla i gruppen, utan att veta vilka de är
- **Publish-subscribe** – skickar ut händelser, utan att veta om någon lyssnar
- **Message queue** – lägger meddelandet i en kö; exakt en mottagare tar det

Hur skiljer sig mottagaren mellan de tre metoderna? (3)
||
- **Grupp** – får allt som skickas till gruppen, utan filter
- **Publish-subscribe** – väljer själv vad man vill ha med ett filter
- **Message queue** – konkurrerar med andra om kön, men kan hämta långt efteråt

Vad är svårast att bygga i de tre metoderna? (3)
||
- **Grupp** – medlemshantering och ordning
- **Publish-subscribe** – matchning och routing av händelser
- **Message queue** – persistens och att välja rätt topologi
