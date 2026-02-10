
SHOW DATABASES;

# SQL este case-insensitive
# Conventie : 1. Instructiunile cu litere mari (CAPITALCASE) 
#             2. Nume de tabele/db/variabile cu litere mici (lower_case)

CREATE DATABASE IF NOT EXISTS scoala; 

-- DROP DATABASE IF EXISTS scoala;

USE scoala;

CREATE TABLE IF NOT EXISTS specializari (nume VARCHAR(255));

CREATE TABLE IF NOT EXISTS profesori (nume VARCHAR(255), prenume VARCHAR(255));

SHOW TABLES;

SELECT * FROM specializari;

SELECT * FROM profesori;

INSERT INTO specializari SET nume = 'AI & Python';

SELECT * FROM specializari;

INSERT INTO specializari  VALUES ('Web Design');

SELECT * FROM specializari;

INSERT INTO specializari SET nume = 'Java';

SELECT * FROM specializari;

DROP TABLE specializari;

SELECT * FROM specializari;


CREATE TABLE IF NOT EXISTS specializari (nume VARCHAR(255));

INSERT INTO specializari SET nume = 'AI & Python';
INSERT INTO specializari  VALUES ('Web Design');
INSERT INTO specializari SET nume = 'Java';

SELECT * FROM specializari;

DELETE FROM specializari WHERE nume = 'Java';


DROP TABLE IF EXISTS specializari;
CREATE TABLE IF NOT EXISTS specializari ( id INT, nume VARCHAR(255));
SELECT * FROM specializari;

INSERT INTO specializari SET id=1, nume = 'AI & Python';
INSERT INTO specializari  VALUES (2, 'Web Design');
INSERT INTO specializari SET   id=3,  nume = 'Java';
INSERT INTO specializari SET   id=4,  nume = 'Java';
SELECT * FROM specializari;

## !!!!!! ATENTIE ACEST FLAG Trebuie sa ramana pe 1 !!!!
SET SQL_SAFE_UPDATES = 0;
DELETE FROM specializari WHERE id = 4;


DELETE FROM specializari WHERE nume = 'Web Design';
SELECT * FROM specializari;

DELETE FROM specializari ;
SELECT * FROM specializari;

SET SQL_SAFE_UPDATES = 1;

INSERT INTO specializari SET id=1, nume = 'AI & Python';
INSERT INTO specializari  VALUES (2, 'Web Design');
INSERT INTO specializari SET   id=3,  nume = 'Java';
INSERT INTO specializari SET   id=4,  nume = 'Java';
SELECT * FROM specializari;

DELETE FROM specializari WHERE id = 4;


DROP TABLE IF EXISTS specializari;
## !!! PRIMARY KEY - identificator unic
CREATE TABLE IF NOT EXISTS specializari ( id INT PRIMARY KEY, nume VARCHAR(255));

SELECT * FROM specializari;

INSERT INTO specializari SET id=1, nume = 'AI & Python';
INSERT INTO specializari  VALUES (2, 'Web Design');
INSERT INTO specializari SET   id=3,  nume = 'Java';
INSERT INTO specializari SET   id=4,  nume = 'Java';
SELECT * FROM specializari;

DELETE FROM specializari WHERE id = 4;

SELECT * FROM specializari;

INSERT INTO specializari SET   id=5,  nume = 'C++';
SELECT * FROM specializari;
INSERT INTO specializari SET   id=6,  nume = 'Swift';
SELECT * FROM specializari;



DROP TABLE IF EXISTS specializari;
## !!! AUTO_INCREMENT
CREATE TABLE IF NOT EXISTS specializari ( id INT PRIMARY KEY AUTO_INCREMENT, nume VARCHAR(255));

SELECT * FROM specializari;

INSERT INTO specializari SET id=1, nume = 'AI & Python';
INSERT INTO specializari  VALUES (2, 'Web Design');
INSERT INTO specializari SET   id=3,  nume = 'Java';
INSERT INTO specializari SET   id=4,  nume = 'Java';
SELECT * FROM specializari;

INSERT INTO specializari SET  nume = 'C++';
SELECT * FROM specializari;


DELETE FROM specializari WHERE id = 4;
SELECT * FROM specializari;

INSERT INTO specializari SET  nume = 'Swift';
SELECT * FROM specializari;

