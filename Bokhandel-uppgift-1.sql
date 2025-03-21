CREATE DATABASE Bokhandel; -- Skapar Bokhandel databas
USE Bokhandel; -- Sätter Bokhandel databasen som använd databas

CREATE TABLE Böcker ( -- Skapar en tabell för böcker
	ISBN INT AUTO_INCREMENT PRIMARY KEY, -- Sätter ISBN till primär nyckel (Unik identifiering för internationell standard)
	Titel VARCHAR(255) NOT NULL, -- Sätter Böckernas titelgräns till 255 karaktärer och får inte lämnas blank (Null)
	Författare VARCHAR(255) NOT NULL, -- Samma som Titel fast för Författarens namn
    Pris INT NOT NULL, -- Sätter pris som en INT som inte kan vara Null
    Lagerstatus VARCHAR(255) NOT NULL -- Sätter Lagerstatus som INT, kan inte vara Null
);


CREATE TABLE Kunder ( -- Skapar tabell för Kunder
	KundID INT AUTO_INCREMENT PRIMARY KEY, -- Sätter KundID som Primär Nyckel (Unik identifiering)
	Namn VARCHAR(255) NOT NULL, -- Namn kan vara upp till 255 karaktärer långa men måste skriva ett namn
    Email VARCHAR (255) UNIQUE NOT NULL, -- Email måste vara unik och inte lämnas blankt.
    Telefon VARCHAR(255), -- Telefonnummer kan vara upp till 255 siffror långt.
    Adress VARCHAR(255) NOT NULL -- Kunden skriver in sin adress, får inte lämnas blank.

);


CREATE TABLE Beställningar (
	Ordernummer INT AUTO_INCREMENT PRIMARY KEY, -- Sätter ordernummer som primär nyckel (Då alla beställningar har unikt ordernummer)
    KundID INT NOT NULL, -- Sätter KundID som INT, får inte lämnas blank eller Null.
    Datum DATE NOT NULL, -- 
	Totalbelopp INT NOT NULL,
	FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
);


CREATE TABLE Orderrader (
	OrderradID INT AUTO_INCREMENT PRIMARY KEY,
	Ordernummer INT,
	ISBN VARCHAR(255),
	Antal INT NOT NULL,
    Pris INT NOT NULL,
	FOREIGN KEY (Ordernummer) REFERENCES Beställningar(Ordernummer),
    FOREIGN KEY (ISBN) REFERENCES Böcker(ISBN)
);

INSERT INTO Böcker (Titel, Författare, Pris, Lagerstatus) VALUES
("Ark", "Fredrik Florensson", "199.99", "Finns i Lager"),
("Hur man kör BMW", "Kevin Kosner", "4999.99", "Slut i lager");

INSERT INTO Kunder (Namn, Email, Telefon, Adress) VALUES
("Per Eriksson", "Per@email.com", "0727455800", "Jakobsgatan 26, 111 52 Stockholm"),
("Steffe boi", "Steffe@email.com," "072578634", "Stagneliusgatan 55, 388 30 Kalmar");

INSERT INTO Beställningar (KundID, Datum, Totalbelopp) VALUES
(1, "2025-03-20", 4999.99),
(2, "2025-03-17", 199.99);


INSERT INTO Orderrader (Ordernummer, Antal, Pris) VALUES
(1, 1, 4999.99),
(1, 1, 199.99);

SELECT * FROM Böcker;
SELECT * FROM Kunder;b
SELECT * FROM Beställningar;
SELECT * FROM Orderrader;
