/*1 Klassen aanmaken
Voeg 3 records toe aan de tabel klassen met de volgende eisen:
/*

klas_code: lo9e-amo1 t/m lo9e-amo3
slb_code: elk een eigen slb-docent
cohort: 2019
opleiding_code 'amo'/*

INSERT INTO klassen (klas_code, slb_code, cohort, opleiding_code) 
VALUES ("lo9e-amo1", "vlt03", "2019", "amo"),
	   ("lo9e-amo2", "rs001", "2019", "amo"),
	   ("lo9e-amo3", "bkr02", "2019", "amo");

#opdracht2:
INSERT INTO studenten (ov_nummer, achternaam, tussenvoegsel, voorletters, voornaam, geboortedatum, postcode, plaats, gewicht, lengte, actief, inschrijvings_datum) 
VALUES (9000, "Puk", "", "P","Pietje", "1992-02-01", "1000AA", "Amsterdam", "70,4", "1.60", 0, "2019-06-01"),
(90001, "Puk", "", "P","Pietje", "1992-02-02", "1000AA", "Amsterdam", "70,4", "1.61", 0, "2019-06-01"),
(90002, "Puk", "", "P","Pietjed", "1992-02-03", "1000AA", "Amsterdam", "70,4", "1.62", 0, "2019-06-01"),
(90003, "Puk", "", "P","Pietjec", "1992-02-04", "1000AA", "Amsterdam", "70,4", "1.63", 0, "2019-06-01");

#Opdracht3:
#INSERT INTO klassen_studenten(klas_code, ov_nummer)
VALUES("lo9e-amo3", 90000),
	  ("lo9e-amo1", 90001),
	  ("lo9e-amo2", 90002),
	  ("lo9e-amo3", 90003);

#opdracht4:
UPDATE studenten SET geboortedatum='1992-02-02'
WHERE ov_nummer = '90001';

#Opgelost: Workbench versie: 5.6.30
EDIT -> SQL EDITOR -<(unchecked Safe Updates)-restarWorkbench

#opdracht5
UPDATE studenten
SET actief = 0
WHERE studenten.inschrijvings_datum <= 01-01-2017;

#todo edit
#aantal char van TABLE "studenten" -> gewicht
# char applicatie ontwikkelaar -> van 10 naar 30


