#OPDRACHTEN vanaf regel 36

#0.1
#Voorkomen toekomstige error: Data truncated "opleidingen.opleiding_code"

INSERT INTO opleidingen('opleiding_code')
VALUES(opleiding_code VARCHAR(32) NOT NUll);

#0.2
INSERT INTO opleidingen('opleiding_code')
VALUES(opleiding_code VARCHAR(32) NOT NUll);

#of
    CREATE TABLE `opleidingen` (
	`opleiding_code` VARCHAR(3) NOT NULL,
	`titel` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`opleiding_code`)
);
#want applicatie en mediaontwikkeling bevat 32 characters, waarvoorheen 10 en dat zal zorgen voor data truncated


#0.3 -> vraag
#huidige waarde `lengte` decimal(3,2) DEFAULT NULL;

#vraag aan docent: wanneer de maximale lengte van een persoon nooit een decimaal wordt en de cijfer er achter constatnt twee zijn, waarom kan deze tabel niet worden aangepast naar 
#ALTER TABLE studenten MODIFY lengte decimal(1,2) DEFAULT NULL;  //want 1 cijfer vóór de punt en twee erna is de bedoeling.
	#Error Code: 1427. For float(M,D), double(M,D) or decimal(M,D), M must be >= D (column 'lengte').	0.000 sec

#met de bovenste error code, wanneer (m), groter is dan of gelijk aan (D), moet het wel lukken (en dat klopt),
#Is de reden omdat 1 eigenlijk een 10 is?




#OPDRACHTEN
#OPDRACHTEN
#OPDRACHTEN
#OPDRACHTEN
#OPDRACHTEN
#OPDRACHTEN
#OPDRACHTEN
#OPDRACHTEN

#Opdracht 1: Klassen aanmaken


#* -> klas_code: lo9e-amo1 t/m lo9e-amo3
#* -> slb_code: elk een eigen slb-docent
#* -> cohort: 2019
#* -> opleiding_code 'amo'

INSERT INTO klassen (klas_code, slb_code, cohort, opleiding_code) 
VALUES ("lo9e-amo1", "vlt03", "2019", "amo"),
	   ("lo9e-amo2", "brc01", "2019", "amo"),
	   ("lo9e-amo3", "akr02", "2019", "amo");

#opdracht 2:
#Voeg 4 records toe aan de tabel studenten.
#* -> ov_nummer: tussen 90000 en 99999.
#* -> Verzin zelf de rest van de velden       
       
INSERT INTO studenten (ov_nummer, achternaam, tussenvoegsel, voorletters, voornaam, geboortedatum, postcode, plaats, gewicht, lengte, actief, inschrijvings_datum) 
VALUES (90000, "Puk", "", "P","Pietje", "1992-02-01", "1000AA", "Amsterdam", "70,4", "1.60", 0, "2019-06-01"),
(90001, "Puk", "", "P","Pietje", "1992-02-02", "1000AA", "Amsterdam", "70,4", "1.61", 0, "2019-06-01"),
(90002, "Puk", "", "P","Pietjed", "1992-02-03", "1000AA", "Amsterdam", "70,4", "1.62", 0, "2019-06-01"),
(90003, "Puk", "", "P","Pietjec", "1992-02-04", "1000AA", "Amsterdam", "70,4", "1.63", 0, "2019-06-01");     




#opdracht 3 Koppelen student klas
#Voeg 4 records toe aan de tabel klassen_studenten.
#* ->- Zorg dat de studenten die je net hebt toegevoegd elk aan een klas toegevoegd worden.
#* -> Alle klassen moeten tenminste 1 student bevatten

INSERT INTO klassen_studenten(klas_code, ov_nummer)
VALUES("lo9e-amo3", 90000),
	  ("lo9e-amo1", 90001),
	  ("lo9e-amo2", 90002),
	  ("lo9e-amo3", 90003);

#Opdracht 4: Wijzigen student (ov_nummer 90001)
#* ->Een van de net ingeschreven studenten heeft zijn/haar geboortedatum verkeerd opgegeven.
#Wijzig dit d.m.v. een UPDATE statement.

UPDATE studenten SET geboortedatum='1992-02-02'
WHERE studenten.ov_nummer = '90001';

#4.1
#Error Code: 1175. - Safe-Mode-ON
#Studenten ingeschreven voor 1-1-2017 dienen inactief gezet te worden. Wijzig dit d.m.v een UPDATE statement.

#Opgelost: Workbench versie: 5.6.30
#EDIT -> SQL EDITOR -<(unchecked Safe Updates)-herstart workbench


#5: Oude studenten inactief
# Studenten ingeschreven voor 1-1-2017 dienen inactief gezet te worden.
#* -> Wijzig dit d.m.v een UPDATE statement.UPDATE studenten

UPDATE studenten 
SET actief = 0 WHERE inschrijvings_datum <= '2017-1-1';

#6: Overzicht inschrijvingen

#Toon van alle studenten die actief zijn:
#- het ov_nummer, de volledige naam
#- van hun klassen: de klas_code en cohort
#- van hun slb-er: de volledige naam
#- gesorteerd op klas_code en achternaam

SELECT studenten.ov_nummer, studenten.actief,CONCAT(studenten.voornaam, " ", studenten.tussenvoegsel, " ", studenten.achternaam)
AS volledigenaam, klassen.klas_code, 
klassen.cohort, CONCAT(docenten.voorletters," ", docenten.achternaam) AS volledigeDocentenNaam
FROM studenten

INNER JOIN klassen_studenten
ON klassen_studenten.ov_nummer = studenten.ov_nummer

INNER JOIN klassen
ON klassen.klas_code = klassen_studenten.klas_code

INNER JOIN docenten
on docenten.docent_code = klassen.slb_code
WHERE studenten.actief="0"

ORDER BY klassen.klas_code ASC, studenten.achternaam ASC;
#bijzonder:  wanneer een student op actief wordt geplaatst studenten.actief(1),

#UPDATE studenten 
#SET actief = 1 WHERE ov_nummer=90002;
#is hij niet terug te vinden via de bovenstaande code waar studenten.actief wordt aangepast van 0 naar 1


#Wat wel wordt getoond:
#Tijdelijk oplossing:
#SELECT * FROM studenten WHERE studenten.actief = 1;