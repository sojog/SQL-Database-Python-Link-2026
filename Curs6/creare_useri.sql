SHOW DATABASES;

USE information_schema;
SHOW TABLES;

USE firma;
SHOW TABLES;
SELECT * FROM departament;
SELECT * FROM angajat;

DELETE FROM departament WHERE id = 7;

SELECT * FROM sport.echipa;

USE sport;
DELETE FROM echipa WHERE id = 4;
SELECT * FROM echipa;

SELECT * FROM echipa_tara_jucator_tara;
