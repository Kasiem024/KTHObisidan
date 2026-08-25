---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 4 – interprocesskommunikation: sockets, UDP/TCP, marshalling, multicast och overlay-nät."
---
# HI1031 Begrepp - Kap 04 Interprocesskommunikation

## Sockets och portar

**Socket**;;En ==ändpunkt för kommunikation== mellan processer; binds till en IP-adress och ett *portnummer* och används för att skicka och ta emot meddelanden.

**Port** (i kommunikation);;Ett nummer som ==identifierar en specifik mottagarprocess== på en dator, så att inkommande meddelanden hamnar hos rätt program.

## UDP, TCP och meddelanden

Vad är den grundläggande skillnaden mellan UDP- och TCP-kommunikation för en programmerare?
||
- **UDP:** *meddelandeutbyte* – man skickar och tar emot enskilda ==datagram== (avgränsade meddelanden), utan garanti.
- **TCP:** en *tvåvägs ström* av bytes ==utan meddelandegränser==, levererad tillförlitligt och i rätt ordning.

**Datagram**;;Ett ==självständigt paket== som skickas utan uppkoppling eller bekräftelse; kan tappas eller komma i fel ordning.

Vilka fel kan drabba UDP-kommunikation?::==Utelämnandefel== (meddelanden kan tappas) och *ordningsfel* (de kan komma i en annan ordning än de skickades).

## Marshalling och datarepresentation

**Marshalling**;;Att ==omvandla data till en följd av bytes== som kan skickas över nätet; mottagaren gör tvärtom (*unmarshalling*).

Varför behövs marshalling och extern datarepresentation?::För att olika datorer lagrar data ==olika== (byteordning, teckenkodning); ett gemensamt format gör att mottagaren kan tolka datan korrekt.

**Extern datarepresentation** (external data representation);;En ==överenskommen standard för hur data kodas== för överföring (t.ex. CORBA CDR, XML, protocol buffers), oberoende av parternas interna format.

## Multicast och overlay

Vad innebär multicast?::Att ==ett meddelande skickas till en grupp mottagare== med en enda operation, i stället för separat till var och en.

**Overlay-nätverk** (overlay network);;Ett *virtuellt nät* som ==byggs ovanpå ett befintligt nätverk== (t.ex. TCP/IP) för att ge extra funktioner som multicast, fildelning eller ökad tillförlitlighet.

**MPI** (Message Passing Interface);;En *standard* för meddelandebaserad kommunikation mellan processer, med både ==synkrona och asynkrona== varianter; vanlig inom parallell beräkning.

Vad är skillnaden mellan blockerande (synkron) och icke-blockerande (asynkron) kommunikation?
||
- **Blockerande/synkron:** avsändaren ==väntar tills meddelandet tagits emot== innan den fortsätter.
- **Icke-blockerande/asynkron:** avsändaren ==fortsätter direkt== efter att ha skickat, utan att vänta på mottagaren.
