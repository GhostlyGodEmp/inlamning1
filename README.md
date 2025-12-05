# inlamning1

Detta är en enkel databasdesign för en bokhandel. Systemet hanterar böcker, kunder, beställningar och orders.

## Tabeller

1. **Böcker**

   * `ISBN` (PK)
   * `Titel`
   * `Författare`
   * `Pris`
   * `Lagerstatus`

2. **Kunder**

   * `KundID` (PK)
   * `Namn`
   * `Email`
   * `Telefon`
   * `Adress`

3. **Beställningar**

   * `OrderID` (PK)
   * `KundID` (FK → Kunder)
   * `Datum`
   * `Totalbelopp`

4. **Orderrader**

   * `OrderradID` (PK)
   * `OrderID` (FK → Beställningar)
   * `ISBN` (FK → Böcker)
   * `Antal`

## Relationer

* En kund kan göra flera beställningar.
* En beställning kan innehålla en eller flera böcker.
* En bok kan förekomma i flera orderrader.
