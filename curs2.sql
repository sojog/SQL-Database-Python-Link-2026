
SHOW DATABASES;

USE scoala;

SHOW TABLES;

CREATE DATABASE IF NOT EXISTS vacanta;

USE vacanta;

-- Creați o tabelă: teme
-- Creați două coloane: titlu, descriere
-- Cele vouă valori trebuie să fie: VARCHAR de 100 de bytes, respectiv 200

CREATE TABLE teme (titlu VARCHAR(100), descriere VARCHAR(200));

SELECT * FROM teme;

SELECT titlu FROM teme;

SELECT titlu, descriere FROM teme;

SELECT descriere, titlu  FROM teme;

INSERT INTO teme VALUES ("SQL", "Comenzile cele mai intalnite"); 
SELECT * FROM teme;


INSERT INTO teme SET titlu = "Python", descriere = "Prmitive"; 
SELECT * FROM teme;


INSERT INTO teme SET titlu = "HTML"; 
SELECT * FROM teme;

SET SQL_SAFE_UPDATES = 0;
UPDATE teme SET descriere = "orice" WHERE titlu = "HTML";
SET SQL_SAFE_UPDATES = 1;


SELECT * FROM teme;

CREATE TABLE teme_cu_pk ( id INT PRIMARY KEY AUTO_INCREMENT, titlu VARCHAR(100), descriere VARCHAR(200));

INSERT INTO teme_cu_pk VALUES (1, "SQL", "Comenzile cele mai intalnite"); 
SELECT * FROM teme_cu_pk;


INSERT INTO teme_cu_pk SET titlu = "Python", descriere = "Prmitive"; 
SELECT * FROM teme_cu_pk;


INSERT INTO teme_cu_pk SET titlu = "HTML"; 
SELECT * FROM teme_cu_pk;

UPDATE teme_cu_pk SET descriere = "orice" WHERE id = 3;
SELECT * FROM teme_cu_pk;




CREATE TABLE destinatii (id INT PRIMARY KEY AUTO_INCREMENT, oras VARCHAR(100), tara VARCHAR(100));

INSERT INTO destinatii SET oras = "Alexandria", tara = "Romania";
INSERT INTO destinatii SET oras = "Alexandria", tara = "Egipt";
SELECT * FROM destinatii;


INSERT INTO destinatii SET id=3, oras = "Iasi", tara = "Romania";
SELECT * FROM destinatii;

DROP TABLE destinatii;


DROP TABLE destinatii_unice;

# Unique - coloana este unica
# Primary Key - 1 singura data per tabel
CREATE TABLE destinatii_unice (id INT PRIMARY KEY AUTO_INCREMENT, oras VARCHAR(100) UNIQUE , tara VARCHAR(100));
INSERT INTO destinatii_unice SET oras = "Alexandria", tara = "Romania";
SELECT * FROM destinatii_unice;

INSERT INTO destinatii_unice SET oras = "Alexandria", tara = "Egipt";
SELECT * FROM destinatii_unice;

INSERT INTO destinatii_unice SET id=3, oras = "Iasi", tara = "Romania";
SELECT * FROM destinatii_unice;


## COMBINATIA oras, tara este unica - UNIQUE(oras, tara)
CREATE TABLE locuri_unice (id INT PRIMARY KEY AUTO_INCREMENT,
						oras VARCHAR(100), 
						tara VARCHAR(100), 
                        UNIQUE(oras, tara));
                        

INSERT INTO locuri_unice SET oras = "Alexandria", tara = "Romania";
SELECT * FROM locuri_unice;
INSERT INTO locuri_unice SET oras = "Alexandria", tara = "Egipt";
SELECT * FROM locuri_unice;

INSERT INTO locuri_unice SET id=3, oras = "Iasi", tara = "Romania";
SELECT * FROM locuri_unice;

INSERT INTO locuri_unice SET oras = "Egipt", tara = "Alexandria";
SELECT * FROM locuri_unice;


INSERT INTO locuri_unice  SET oras = "Milano";
SELECT * FROM locuri_unice;


INSERT INTO locuri_unice  SET tara = "China";
SELECT * FROM locuri_unice;



CREATE TABLE bilete (id INT PRIMARY KEY AUTO_INCREMENT, plecare VARCHAR(100) DEFAULT 'Bucuresti', destinatie VARCHAR(100) NOT NULL);

SELECT * FROM bilete;

INSERT INTO bilete SET plecare = 'Timisoara', destinatie = 'Paris';
SELECT * FROM bilete;

INSERT INTO bilete SET destinatie = 'Londra';
SELECT * FROM bilete;

INSERT INTO bilete SET plecare = 'Madrid', destinatie = "Istanbul";
SELECT * FROM bilete;


CREATE TABLE concediu (id INT PRIMARY KEY AUTO_INCREMENT, nume VARCHAR(100) NOT NULL UNIQUE, total INT CHECK (total >= 21), disponibile INT DEFAULT 21);

SELECT * FROM concediu;
INSERT INTO concediu SET nume = "Andrei", total = 22;
SELECT * FROM concediu;


INSERT INTO concediu SET nume="Bogdan", disponibile = 20, total = 21;
SELECT * FROM concediu;

