---
tags:
  - begrepp
  - HI1031
  - databaser
  - programmering
  - KTH
  - year2026
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 6, ordnade efter kursens fem tentafrågor: poängen med indirekt kommunikation, gruppkommunikation, publish-subscribe, message queuing och jämförelsen mellan de tre."
---
# HI1031 Begrepp - Kap 06 Indirekt kommunikation

## Fråga 1 – Poängen med indirekt kommunikation, och strategierna

**Indirekt kommunikation**;;Kommunikation mellan två parter ==via en mellanhand==, utan direkt koppling mellan sändaren och mottagaren.
<!--SR:!fsrs,2026-11-13T17:01:49.817Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T17:01:49.817Z!fsrs,2026-11-13T14:22:53.652Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T14:22:53.652Z-->

Vad är problemet med direkt koppling mellan sändare och mottagare?::Systemet blir ==stelt==. Servern är svår att byta ut, och kraschar den måste klienten själv märka det och laga felet.
<!--SR:!fsrs,2026-11-13T16:56:48.051Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:56:48.051Z-->

**Rumslig frikoppling**;;Sändaren ==vet inte vilka mottagarna är==, och behöver inte veta det – och tvärtom.
<!--SR:!fsrs,2026-10-29T15:15:28.073Z,8,7.98654845,7.82322095,2,5,0,0,2026-10-21T15:15:28.073Z!fsrs,2026-11-13T16:46:12.784Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:46:12.784Z-->

**Tidsmässig frikoppling**;;Sändare och mottagare ==behöver inte finnas samtidigt== – de kan ha oberoende livslängder.
<!--SR:!fsrs,2026-11-13T16:59:22.106Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:59:22.106Z!fsrs,2026-11-13T16:40:41.202Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:40:41.202Z-->

Vad är nackdelarna med indirekt kommunikation? (2)
||
- **Kostar prestanda** – den extra mellanhanden gör det långsammare
- **Svårare att förvalta** – ingen direkt koppling att följa när man felsöker
<!--SR:!fsrs,2026-10-22T20:02:39.758Z,1,0.01656289,9.95183446,2,12,2,0,2026-10-21T20:02:39.758Z-->

Vilka tre strategier för indirekt kommunikation tar kursen upp? (3)
||
- Gruppkommunikation
- Publish-subscribe
- Message queues (meddelandeköer)
<!--SR:!fsrs,2026-11-13T20:02:12.311Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T20:02:12.311Z-->

## Fråga 2 – Gruppkommunikation och hur det kan implementeras

**Gruppkommunikation**;;Ett meddelande skickas till en grupp och ==levereras till alla medlemmar==, utan att sändaren vet vilka de är.
<!--SR:!fsrs,2026-10-24T00:06:54.446Z,4,4.36645858,8.36634001,2,5,0,0,2026-10-20T00:06:54.446Z!fsrs,2026-11-13T16:59:16.594Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:59:16.594Z-->

Vad lägger gruppkommunikation till ovanpå enkel IP-multicast? (3)
||
- **Tillförlitlighet** – garantier att medlemmarna får meddelandet
- **Ordning** – meddelanden levereras i en bestämd ordning
- **Medlemshantering** – håller reda på vilka som är med och upptäcker krascher
<!--SR:!fsrs,2026-10-22T14:18:12.250Z,1,0.41690351,9.93816747,2,9,1,0,2026-10-21T14:18:12.250Z-->

Vad menar man med tillförlitlig (reliable) multicast? (3)
||
- **Integritet** – meddelandet kommer fram oförändrat och bara en gång
- **Giltighet** – ett skickat meddelande kommer fram till slut
- **Överenskommelse** – får en i gruppen meddelandet, får alla det
<!--SR:!fsrs,2026-10-22T20:04:20.357Z,1,0.00395065,9.95265153,2,14,1,0,2026-10-21T20:04:20.357Z-->

Vilka tre sorters ordning kan gruppkommunikation garantera? (3)
||
- **FIFO** – skickar en process A före B, så får alla dem i den ordningen
- **Kausal** – hänger ett meddelande ihop med ett tidigare, så bevaras den ordningen
- **Total** – alla processer får meddelandena i exakt samma ordning
<!--SR:!fsrs,2026-10-24T19:53:31.867Z,3,3.33510051,9.22187804,2,6,0,0,2026-10-21T19:53:31.867Z-->

Vilka tre delar består verktyget JGroups av? (3)
||
- **Channels** – det enklaste gränssnittet: gå med, lämna, skicka, ta emot
- **Building blocks** – färdiga byggblock på högre nivå
- **Protokollstacken** – ihopsättbara lager, och alla i gruppen måste ha samma
<!--SR:!fsrs,2026-10-22T20:02:04.455Z,1,0.00616657,9.95239808,2,12,1,0,2026-10-21T20:02:04.455Z-->

Hur når ett meddelande alla när avsändaren bara anger ett grupp-id?::==Medlemstjänsten översätter grupp-id till en aktuell medlemslista== vid leveransen.
<!--SR:!fsrs,2026-11-13T19:55:45.130Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T19:55:45.130Z-->

## Fråga 3 – Publish-subscribe och hur det kan implementeras

Hur fungerar publish-subscribe?::Utgivare (publishers) skickar ut händelser, prenumeranter (subscribers) anmäler vad de vill ha, och systemet ==matchar och levererar bara det som passar==.
<!--SR:!fsrs,2026-11-13T16:27:19.782Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:27:19.782Z-->

Vilka fyra sätt kan man uttrycka en prenumeration på? (4)
||
- **Kanalbaserad** – prenumerera på en namngiven kanal
- **Topic-baserad** – ett fält i meddelandet anger ämnet (topic)
- **Innehållsbaserad** – villkor på värdena i händelsen
- **Typbaserad** – matchar på händelsens typ
<!--SR:!fsrs,2026-10-24T16:49:21.455Z,3,3.33510051,9.22187804,2,6,0,0,2026-10-21T16:49:21.455Z-->

Var kan man placera händelsemäklaren i publish-subscribe? (3)
||
- **Centralt** – en enda nod är mäklare
- **Nät av mäklare** – flera mäklare samarbetar
- **Peer-to-peer** – alla noder är mäklare
<!--SR:!fsrs,2026-11-13T16:40:48.649Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:40:48.649Z-->

Varför räcker det inte med en enda central mäklare? (2)
||
- **Enda felpunkt** – går den ner slutar allt fungera
- **Flaskhals** – all trafik måste passera en nod
<!--SR:!fsrs,2026-11-13T16:57:03.027Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:57:03.027Z-->

Hur hittar en händelse rätt prenumerant i ett nät av mäklare?::==Prenumerationerna sprids ut mot utgivarna==, så varje mäklare skickar bara vidare dit det finns någon som vill ha den.
<!--SR:!fsrs,2026-10-24T16:27:59.502Z,3,1.57235016,9.89871149,2,10,0,0,2026-10-21T16:27:59.502Z-->

## Fråga 4 – Message queuing och hur det implementeras bra

**Message queue** (meddelandekö);;En punkt-till-punkt-tjänst där sändaren lägger meddelandet i en kö och ==en enda process plockar bort det==.
<!--SR:!fsrs,2026-10-30T08:20:45.436Z,12,12.06690043,3.45587856,2,3,0,0,2026-10-18T08:20:45.436Z!fsrs,2026-11-13T16:50:22.766Z,23,22.91755081,3.56801552,2,4,0,0,2026-10-21T16:50:22.766Z-->

Vad är den avgörande egenskapen hos message queues?::Att meddelandena är ==persistenta== – kön lagrar dem tills någon hämtar dem.
<!--SR:!fsrs,2026-10-27T08:15:38.785Z,5,4.68699522,9.20293377,2,7,0,0,2026-10-22T08:15:38.785Z-->

Vad innebär persistensen för leveransen?::Meddelandet ==levereras garanterat till slut==, men man vet inte när.
<!--SR:!fsrs,2026-10-29T16:46:54.143Z,8,7.98654845,7.82322095,2,5,0,0,2026-10-21T16:46:54.143Z-->

Hur implementerar man message queues på ett bra sätt?::Man sprider ut köhanterarna, t.ex. hub-and-spoke: klienten kopplar mot en ==lokal spoke== och väntar tills meddelandet ligger där. Sedan går det vidare till hubben.
<!--SR:!fsrs,2026-10-27T14:18:52.020Z,6,5.90514163,8.97191322,2,6,0,0,2026-10-21T14:18:52.020Z-->

## Fråga 5 – Jämför gruppkommunikation, publish-subscribe och message queuing

Hur skiljer sig sändaren mellan de tre metoderna? (3)
||
- **Grupp** – skickar till alla i gruppen, utan att veta vilka de är
- **Publish-subscribe** – skickar ut händelser, utan att veta om någon lyssnar
- **Message queue** – lägger meddelandet i en kö; exakt en mottagare tar det
<!--SR:!fsrs,2026-10-24T20:02:26.222Z,3,1.80971211,9.6816071,2,7,0,0,2026-10-21T20:02:26.222Z-->

Hur skiljer sig mottagaren mellan de tre metoderna? (3)
||
- **Grupp** – får allt som skickas till gruppen, utan filter
- **Publish-subscribe** – väljer själv vad man vill ha med ett filter
- **Message queue** – konkurrerar med andra om kön, men kan hämta långt efteråt
<!--SR:!fsrs,2026-10-23T13:37:02.165Z,3,1.58834233,9.8823857,2,9,0,0,2026-10-20T13:37:02.165Z-->

Vad är svårast att bygga i de tre metoderna? (3)
||
- **Grupp** – medlemshantering och ordning
- **Publish-subscribe** – matchning och routing av händelser
- **Message queue** – persistens och att välja rätt topologi
<!--SR:!fsrs,2026-10-24T14:24:08.886Z,3,0.07085977,9.92606973,2,12,0,0,2026-10-21T14:24:08.886Z-->

Vilken av de tre skalar sämst, och varför?::==Gruppkommunikation== – alla medlemmar måste hållas reda på, så det blir tyngre för varje ny medlem.
<!--SR:!fsrs,2026-10-24T16:41:06.097Z,3,1.80971211,9.6816071,2,7,0,0,2026-10-21T16:41:06.097Z-->
