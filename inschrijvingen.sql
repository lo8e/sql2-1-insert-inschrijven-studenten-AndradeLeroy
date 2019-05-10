#Code werkt wel als volgd
UPDATE studenten set actief="1" WHERE studenten.ov_nummer ="90002";
SELECT * FROM studenten WHERE actief = 1;

#Code werkt niet via:
SELECT studenten.ov_nummer, CONCAT(studenten.voornaam, " ", studenten.tussenvoegsel, " ", studenten.achternaam)
AS volledigenaam, klassen.klas_code, 
klassen.cohort, CONCAT(docenten.voorletters," ", docenten.achternaam) AS volledigeDocentenNaam

FROM studenten 

SELECT studenten.ov_nummer, CONCAT(studenten.voornaam, " ", studenten.tussenvoegsel, " ", studenten.achternaam)
AS volledigenaam, klassen.klas_code, 
klassen.cohort, CONCAT(docenten.voorletters," ", docenten.achternaam) AS volledigeDocentenNaam

FROM studenten

INNER JOIN klassen_studenten
ON klassen_studenten.ov_nummer = studenten.ov_nummer

INNER JOIN klassen
ON klassen.klas_code = klassen_studenten.klas_code

INNER JOIN docenten
on docenten.docent_code = klassen.slb_code

WHERE studenten.actief = "1"

ORDER BY  klassen.klas_code ASC, studenten.achternaam ASC;