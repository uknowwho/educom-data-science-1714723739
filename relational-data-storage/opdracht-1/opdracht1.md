```mermaid
erDiagram
    leveranciers {
        int id PK
        string naam
        string woonstraatnaam
        int woonhuisnummer
        int woonpostcode FK
        int woonplaats_id FK
        int postbusnummer
        int postpostcode FK
        int postplaats_id FK
        string email
        string mobieltelnr
        string vasttelnr
    }

    hoofdrubriek {
        int id PK
        string naam
    }

    hoofdrubriek ||--o{ hoofdrubriek_leveranciers: Has
    leveranciers ||--o{ hoofdrubriek_leveranciers: IsPartOf
    hoofdrubriek_leveranciers {
        int id PK
        int hoofdrubriek_id FK
        int leverancier_id FK
    }

    hoofdrubriek ||--o{ subrubriek: Has
    subrubriek {
        int id PK
        string naam 
        int hoofdrubriek_id FK
    }

    leveranciers ||--o{ subrubriek_leveranciers: IsPartOf
    subrubriek ||--o{ subrubriek_leveranciers: Has
    subrubriek_leveranciers {
        int id PK
        int subrubriek_id FK
        int leverancier_id FK
    }

    leveranciers }|--|{ plaatsen: IsIn
    gemeentes ||--||plaatsen: Has
    plaatsen {
        int id PK
        string plaatsnaam
        int gemeente_id FK
    }

    landen {
        int id PK
        string naam
        string alphacode UK
    }

    provincies }o--|| landen: contains
    provincies {
        int id PK
        string naam
        int land_id FK
    }

    gemeentes }o--|| provincies: contains
    gemeentes {
        int id PK
        string naam
        int provincie_id FK
    }

    plaatsen ||--|| postcodes: Has
    postcodes {
        int id PK
        coordinate lat
        coordinate long
        int plaats_id FK
    }


    contactpersonen {
        int id PK
        string naam
        string email
        string telnr
    }

    contactpersonen }|--|{taken_contactpersonen: Has
    contactpersonenen_leveranciers {
        int id PK
        int contactpersoon_id FK
        int leverancier_id FK
    }

    leveranciers ||--o{contactpersonenen_leveranciers: Has
    contactpersonen ||--o{contactpersonenen_leveranciers: Has
    taken_contactpersonen {
        int id PK
        int contactpersoon_id FK
        string afdelingnaam
        string taaknaam
    }

    leveranciers ||--|| leveranciers_overig: Has
    leveranciers_overig {
        int id PK
        int leverancier_id FK
        text adressen
        text aanbiedingen
        text aangesloten_bij
        boolean advies
        text algemene_bedrijfsinfo
        string app
        etc etc
    }

```
