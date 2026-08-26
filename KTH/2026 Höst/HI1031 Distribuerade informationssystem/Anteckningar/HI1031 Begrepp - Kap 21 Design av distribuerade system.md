---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 21 – design av distribuerade system: Google-infrastrukturen (GFS, Chubby, Bigtable, MapReduce) och dess designprinciper."
---
# HI1031 Begrepp - Kap 21 Design av distribuerade system

Vad kännetecknar den fysiska arkitekturen bakom Googles infrastruktur?::==Enormt många billiga standarddatorer (commodity hardware)== i datacenter – man utgår från att komponenter *kommer* att fela och designar för det.

Vilka centrala designprinciper genomsyrar Googles infrastruktur? (3)
||
- **Enkelhet** – varje mjukvara ska göra *en* sak bra
- **Prestanda** – "every millisecond counts"
- **Testning & loggning** – hård testning och spårning för att hitta fel

**GFS** (Google File System);;Ett distribuerat filsystem ==optimerat för mycket stora filer== och sekventiella läsningar/tillägg, byggt för att tåla att billig hårdvara ständigt fallerar.

**Chubby**;;Googles ==lås- och koordineringstjänst== som även lagrar små datamängder; används av andra tjänster för t.ex. masterval och bygger på Paxos-konsensus.

**Bigtable**;;Googles ==distribuerade databas för semistrukturerad data== i tabellform (indexerbar på rad/kolumn); avstår från fulla relationsoperationer för att kunna skala.

**MapReduce**;;En programmeringsmodell för ==parallell bearbetning av enorma datamängder==, uttryckt med två funktioner (*map* och *reduce*), där systemet döljer parallellisering och felhantering.

**Protocol buffers**;;Googles ==format för att serialisera strukturerad data== (marshalling) för lagring och för kommunikation mellan tjänster.

Varför erbjuder Google tre olika lagringstjänster (GFS, Chubby, Bigtable)?::För att ==var och en är optimerad för sin sorts data==: GFS för stora filer, Chubby för små data plus koordinering, Bigtable för semistrukturerade tabeller.
