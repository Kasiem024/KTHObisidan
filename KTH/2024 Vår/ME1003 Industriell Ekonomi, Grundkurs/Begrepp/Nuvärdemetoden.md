---
tags: [begrepp, ekonomi, HH1802/HH1802KS1, KTH, ME1003, ME1003/ME1003KS2, year2024]
description: "Nuvärdemetoden är en ränteräkningsmetod som med hjälp av Kalkylränta räknar om de olika investeringsalternativens betalningar till en och samma tidpunkt, till början av det år då grundinvesteringen…"
created: 2024-02-07
updated: 2026-05-26
---
# Nuvärdemetoden

## Definition

Nuvärdemetoden är en ränteräkningsmetod som med hjälp av [[Kalkylränta]] räknar om de olika investeringsalternativens betalningar till en och samma tidpunkt, till början av det år då ==grundinvesteringen== görs.

Nuvärdemetodens beslutsregler säger att en [[Investering]] där nuvärdet av de framtida betalningarna är större än grundinvesteringen är lönsam. Differensen kallas ==nettonuvärde== eller kapitalvärde och ska vara större än noll. Investeringsalternativet med störst nettonuvärde har mest [[Lönsamhet]].

Alltså, med Nuvärdesmetoden kan vi exempelvis veta hur mycket avkastningen skulle varit om vi satte in pengarna i banken istället för att göra investeringen.

### Omräkningsfaktorer

#### Slutvärdefaktor

$$
{ \text{Slutvärdefaktor} = ( 1 + \text{Kalkylränta} )^{\text{Ekonomisk} \, \text{Livslängd} (\text{Antal} \, \text{År})}}
$$

$$
{ \text{SLV} = ( 1 + r )^{n}}
$$

Om man vill få veta värdet av ett nutida belopp i framtiden ska man multiplicera det beloppet med ==slutvärdefaktorn==.

Exempel: $1000 * \text{SLV} = 1000 * (1+0.2)^{1}=1200$

Alltså om kalkylräntan är 20% är 1000 kr idag värda 1200 kr om 1 år.

==Räntetabell A==

#### Nuvärdefaktor

$$
{ \text{Nuvärdefaktor} =
\frac{1}{( 1 + \text{Kalkylränta} )^{\text{Ekonomisk} \, \text{Livslängd} (\text{Antal} \, \text{År})}}}
$$

$$
{ \text{NUV} =
\frac{1}{( 1 + r )^{n}}}
$$

Om man vill få ett framtida belopp i nutidens värde ska man dela det beloppet med ==nuvärdefaktorn==.

Exempel: $1200*\text{NUV}=1200*\frac{1}{(1+0.2)^{1}}=1000$

Alltså om kalkylräntan är 20% är 1200 kr idag värda 1000 kr 1 år sen.

==Räntetabell B==

#### Nusummefaktor

$$
{ \text{Nusummefaktor} =
\frac{1 - ( 1 + \text{Kalkylränta} )^{-\text{Ekonomisk} \, \text{Livslängd} (\text{Antal} \, \text{År})}}{\text{Kalkylränta}}}
$$

$$
{ \text{NUS} =
\frac{1 - ( 1 + r )^{-n}}{r}}
$$

Om man ska betala ett lika stort belopp varje år i flera år ska man använda ==nusummefaktorn==. Alltså summerar den nuvärdefaktorn.

==Räntetabell C==

### Formel för Nuvärdekalkyl (Nettonuvärde)

$$
{ \text{Nettonuvärde} = \text{Grundinvestering} + \text{Inbetalningsöverskott} * \text{Nusummefaktor} + \text{Restvärde} * \text{Nuvärdefaktor} }
$$

$$
{ \text{NNV} = G + a * \text{NUS} + R * \text{NUV} }
$$

### Nuvärdekvoten

När man vill veta hur olika investeringsalternativ kommer utnyttja det satsade kapitalet, grundinvesteringen, kan man beräkna ==nuvärdekvoten==. Ju högre kvoten är ju bättre.

$$
{ \text{Nuvärdekvot}=
\frac
{\text{Netoonuvärd}}{\text{Grundinvestering}}}
$$

$$
{ \text{Nuvärdekvot}=
\frac{\text{NNV}}{G}}
$$

## Kopplat till

- [[Investeringskalkylering]]

## Flashcards

Nuvärdemetoden (Definition):: En ränteräkningsmetod som med hjälp av [[Kalkylränta]] räknar om de olika investeringsalternativens betalningar till en och samma tidpunkt, till början av det år då ==grundinvesteringen== görs, hur mycket skulle avkastningen varit om vi satte in pengarna i banken istället för att göra investeringen
<!--SR:!2024-05-06,30,225!2024-05-06,30,297-->

Nuvärde (Definition):: Värdet av framtida betalningar idag
<!--SR:!2024-05-06,30,300!2024-05-06,30,300-->

Nuvärdesumma (Definition):: Värdet av framtida betalningar som är lika stora varje år idag
<!--SR:!2024-05-06,30,300!2024-05-06,30,297-->

Omräkningsfaktorer (3) (Formel)
||
$$
{ \text{Slutvärdefaktor} = ( 1 + \text{Kalkylränta} )^{\text{Ekonomisk} \, \text{Livslängd} (\text{Antal} \, \text{År})}}
$$
$$
{ \text{SLV} = ( 1 + r )^{n}}
$$
---
$$
{ \text{Nuvärdefaktor} =
\frac{1}{( 1 + \text{Kalkylränta} )^{\text{Ekonomisk} \, \text{Livslängd} (\text{Antal} \, \text{År})}}}
$$
$$
{ \text{NUV} =
\frac{1}{\text{SLV}}}
$$
---
$$
{ \text{Nusummefaktor} =
\frac{1 - ( 1 + \text{Kalkylränta} )^{-\text{Ekonomisk} \, \text{Livslängd} (\text{Antal} \, \text{År})}}{\text{Kalkylränta}}}
$$
$$
{ \text{NUS} =
\frac{1 - ( 1 + r )^{-n}}{r}}
$$
<!--SR:!2024-05-06,30,250-->

Nettonuvärde (Formel)
||
$$
{ \text{Nettonuvärde} = \text{Grundinvestering} + \text{Inbetalningsöverskott} * \text{Nusummefaktor} + \text{Restvärde} * \text{Nuvärdefaktor} }
$$
$$
{ \text{NNV} = G + a * \text{NUS} + R * \text{NUV} }
$$
<!--SR:!2024-05-06,30,270-->

Nuvärdekvot (Formel)
||
$$
{ \text{Nuvärdekvot}=
\frac
{\text{Nettonuvärde}}{\text{Grundinvestering}}}
$$
$$
{ \text{Nuvärdekvot}=
\frac
{\text{NNV}}{G}}
$$
<!--SR:!2024-05-15,30,230-->
