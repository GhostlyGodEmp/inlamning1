CREATE DATABASE Bokhandle;
USE Bokhandle;

CREATE TABLE Bocker (
    ISBN VARCHAR(20) PRIMARY KEY,
    Titel VARCHAR(255) NOT NULL,
    Forfattare VARCHAR(255) NOT NULL,
    Pris DECIMAL(10,2) NOT NULL,
    Lagerstatus INT NOT NULL
);

CREATE TABLE Kunder (
    KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Telefon VARCHAR(50) NOT NULL,
    Adress VARCHAR(255) NOT NULL
);

CREATE TABLE Bestallningar (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Datum DATE NOT NULL,
    Totalbelopp DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
);

CREATE TABLE Orderrader (
    OrderradID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    Antal INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Bestallningar(OrderID),
    FOREIGN KEY (ISBN) REFERENCES Bocker(ISBN)
);

INSERT INTO Bocker (ISBN, Titel, Forfattare, Pris, Lagerstatus)
VALUES ('9780441013593', 'Dune', 'Frank Herbert', 199.00, 15);

INSERT INTO Kunder (Namn, Email, Telefon, Adress)
VALUES ('Oskar Andersson', 'oskar@example.com', '0701234567', 'Storgatan 12, 12345 Stockholm');

-- Förutsätter att KundID = 1 (vår tidigare insatta kund)
INSERT INTO Bestallningar (KundID, Datum, Totalbelopp)
VALUES (1, '2025-12-05', 199.00);

-- Förutsätter att OrderID = 1 (beställningen vi precis skapade)
INSERT INTO Orderrader (OrderID, ISBN, Antal)
VALUES (1, '9780441013593', 1);




