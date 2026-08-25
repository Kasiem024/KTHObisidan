---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 20 – distribuerad multimedia: kontinuerliga strömmar, QoS-parametrar, QoS-hantering och strömanpassning."
---
# HI1031 Begrepp - Kap 20 Distribuerad multimedia

**Kontinuerliga media** (continuous media);;Data som ==måste levereras i en jämn ström i realtid== (ljud, video) – ett element som kommer för sent är värdelöst.

**Ström** (stream, i multimedia);;En ==kontinuerlig följd av mediaelement== (videobildrutor, ljudsampel) som flödar från en källa till en mottagare.

Vilka egenskaper specificerar tjänstekvaliteten (QoS) för en mediaström? (3)
||
- **Bandbredd** – hur mycket data per sekund som kan flöda
- **Latens** (fördröjning) – hur lång tid ett element tar på sig
- **Förlust/jitter** – hur många element som tappas och hur ojämnt de anländer

**Jitter**;;==Variationen i fördröjning== mellan mediaelement i en ström; hög jitter gör uppspelningen ryckig och kräver buffring för att jämnas ut.

Vad gör en QoS-hanterare (quality of service manager)?::Den ==reserverar och schemalägger resurser== (CPU, bandbredd, minne) så att en mediaström hinner levereras i tid.

**Admission control** (tillträdeskontroll);;Att systemet ==tackar nej till nya strömmar== som det inte kan garantera resurser åt, för att skydda kvaliteten på dem som redan körs.

**Strömanpassning** (stream adaptation);;Att ==sänka kvaliteten== (t.ex. lägre upplösning eller bithastighet) när resurserna inte räcker, i stället för att strömmen bryts helt.
