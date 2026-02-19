CREATE DATABASE IF NOT EXISTS firma;
use firma;
 
##Crearea tabelelor
 
CREATE TABLE IF NOT EXISTS departament
(id int unique auto_increment primary key,
nume char(20),
manager_id int);
 
CREATE TABLE IF NOT EXISTS angajat
(id int unique auto_increment primary key,
nume char(20),
prenume char(20),
departament_id int,
manager_id int ,
salariu int,
angajare date,
vechime date,
INDEX (departament_id),
-- 1. Se definesc două chei străine în tabela angajat: (a) departament_id pentru id din tabela departament; (b) manager_id - o pentru id din tabela angajat
FOREIGN KEY (departament_id) REFERENCES departament(id),
FOREIGN KEY(manager_id) REFERENCES angajat(id));



INSERT INTO departament (nume, manager_id) VALUES
('Achizitii', 1), ('QA', 2), ('IT', 3), ('Backend', 4), ('HR', 5), ('Suport', 6), ('Vanzari', 7);
 
 
INSERT INTO angajat
(nume, prenume, departament_id, manager_id, salariu, angajare)
VALUES
('Toma',    'Ion',    1, NULL, 9000, '2000-1-12'),
('Georgescu',     'Maria',   1, 1, 4000, '2003-5-6'),
('Marin',   'Vasile', 1, 1, 4500, '2004-6-3'),
('Ionescu',     'Andrei', 1, NULL, 3500, '2002-1-1'),
('Vasilescu',   'Ana',    2, NULL, 2500, '2006-3-3'),
('Albu',  'Dinu',   2, 5, 2000, '2004-11-12'),
('Adam',  'Adrian', 5, NULL, 3500, '2006-10-12'),
('Teodorescu',  'Matei',  3, NULL, 3000, '2005-1-12'),
('Popescu',     'Vasile', 3, 8, 4000, '2005-9-9'),
('Mateescu',    'Dumitru',3, 8, 3500, '2007-2-5'),
('Calinescu',   'Alin',   4, NULL, 3200, '2005-8-2'),
('Popescu',     'Mihaela',4, 12, 1800, '2005-4-8'),
('Gigi',    'Dan',7,13, 4500, '2005-02-25'),
('Damian',   'Alina',  6, NULL, 3200, '2005-8-2'),
('Achim',     'Calin',4, 12, 1800, '2005-4-8'),
('Ionescu',     'Diana',  5, NULL, 5500, '2001-1-12');



-- 2. Listați numele angajaților
SELECT * FROM angajat;
SELECT nume FROM angajat;
SELECT id, nume FROM angajat;

SELECT id, CONCAT(nume, ' ', prenume) FROM angajat;
SELECT id, CONCAT(nume, ' ', prenume) AS 'Angajat' FROM angajat;

-- 3. Listați numele angajaților, ordonate crescător 

## ASC - default
SELECT id, CONCAT(nume, ' ', prenume) AS 'Angajat' FROM angajat ORDER BY nume;
SELECT id, CONCAT(nume, ' ', prenume) AS 'Angajat' FROM angajat ORDER BY nume ASC;

-- 4. Selectați numele angajaților, ordonate descrescător 
SELECT id, CONCAT(nume, ' ', prenume) AS 'Angajat' FROM angajat ORDER BY nume DESC;

-- 5. Selectați numele angajaților: DESC după departament_id, ASC după salariu; 

SELECT id, CONCAT(nume, ' ', prenume) AS 'Angajat', salariu, departament_id FROM angajat ORDER BY departament_id DESC, salariu ASC;
