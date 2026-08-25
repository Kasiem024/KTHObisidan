---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 2 – systemmodeller: arkitekturmodeller, skiktning samt de fundamentala modellerna (interaktion, fel, säkerhet)."
---
# HI1031 Begrepp - Kap 02 Systemmodeller

## Arkitekturmodeller

**Arkitekturmodell**;;En beskrivning av ett system utifrån dess *komponenter*, deras ==roller== och hur de kommunicerar med varandra.

Vad skiljer klient–server-modellen från peer-to-peer?
||
- **Klient–server:** *asymmetriskt* – klienten frågar, servern svarar. Enkelt, men servern kan bli en ==flaskhals==.
- **Peer-to-peer (P2P):** *symmetriskt* – alla noder både använder och bidrar med resurser. Skalar bra, men svårare att styra och säkra.

**Peer-to-peer** (P2P);;En arkitektur där *alla noder är likvärdiga* och ==både använder och bidrar med resurser==, utan någon fast överordnad roll. Metafor: en fildelningsgemenskap där alla både laddar upp och ner.

Vad kännetecknar klient–server-modellen?::Rollerna är *asymmetriska*: ==klienten begär en tjänst och servern utför den och svarar==. Vanligast på webben, men servern kan bli en flaskhals.

**Proxyserver**;;En *mellanhand* som hanterar förfrågningar åt en server och ==cachar svar== för att öka prestanda och tillgänglighet; kan även fungera som brandvägg.

**Tunn klient** (thin client);;En enkel enhet som ==gör minimalt lokalt== och låter en fjärrserver sköta beräkning och program (t.ex. fjärrskrivbord).

## Struktur och lager

**Skiktning** (layering);;Att dela upp mjukvara i *lager* där varje lager ==bara bygger på tjänster från lagret under== och döljer sina inre detaljer.

**Flerskiktsarkitektur** (tiered);;Att fördela *presentation*, *logik* och *data* på ==olika nivåer eller servrar== (t.ex. webbläsare → applikationsserver → databas).

## De fundamentala modellerna

Vilka "fundamentala modeller" använder man för att resonera om ett distribuerat system? (3)
||
- **Interaktionsmodell** – tid, fördröjning och meddelanden
- **Felmodell** – vilka fel som kan uppstå
- **Säkerhetsmodell** – vilka hot som finns

**Interaktionsmodell**;;Ett sätt att resonera om *hur processer samspelar via meddelanden*, med fokus på ==fördröjning, bandbredd och klockor==.

Vad är skillnaden mellan ett synkront och ett asynkront distribuerat system?
||
- **Synkront:** det finns *kända gränser* för hur lång tid beräkningar, meddelanden och klockavvikelser kan ta.
- **Asynkront:** ==inga tidsgarantier alls== – allt kan ta godtyckligt länge (t.ex. *internet*).

**Asynkront distribuerat system**;;Ett system ==utan några garantier om tid== – beräkningar, meddelandefördröjningar och klockavvikelser kan vara godtyckligt stora. Det är modellen som beskriver *internet*.

Hur kan man avgöra ordningen mellan händelser när det saknas en gemensam klocka?::Genom ==kausal (logisk) ordning==: om händelse A kan ha påverkat B, räknas A ha skett "före" B. Ordningen bygger på orsak–verkan, inte på klocktid.

**Felmodell** (failure model);;En *klassificering* av vad som kan ==gå sönder== i processer och kanaler, så att man kan bygga system som tål det.

Vilka huvudtyper delar man in fel i? (3)
||
- **Utelämnandefel** (omission) – något som ska ske uteblir (tappat meddelande, krasch)
- **Godtyckliga / Byzantine fel** – oförutsägbart beteende, kan ge *felaktiga* svar
- **Tidsfel** (timing) – svar kommer för sent (endast i synkrona system)

**Utelämnandefel** (omission);;När en process eller kanal ==helt enkelt inte gör det den ska== – t.ex. ett meddelande som försvinner eller en process som kraschar (fail-stop).

**Godtyckligt fel** (Byzantine);;Den *värsta* feltypen: en komponent beter sig ==helt oförutsägbart== och kan skicka felaktiga värden eller "ljuga", inte bara sluta svara. Metafor: en förrädisk general som ger olika order till olika mottagare.

Varför är godtyckliga (Byzantine) fel svårast att hantera?::För att komponenten kan ==skicka felaktig information== eller bete sig illvilligt – man kan inte lita på *något* den säger, till skillnad från en krasch som bara innebär tystnad.

**Tidsfel** (timing failure);;När en åtgärd eller ett svar ==tar längre tid än tillåtet==; kan bara uppstå i *synkrona* system där tidsgränser finns.

**Säkerhetsmodell**;;Ett sätt att beskriva ==hot mot processer och kommunikationskanaler== genom att anta en *motståndare* som aktivt försöker störa systemet.

**Motståndaren** (the enemy);;I säkerhetsanalys en tänkt angripare som antas kunna ==läsa, kopiera, ändra och injicera valfria meddelanden== på nätet – skyddet designas för värsta fall.
