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



-- 6. Selectați numele angajatilor care lucreaza la HR 

# V1 - pe bucati
select * from angajat;
SELECT * FROM departament;
select * from angajat where departament_id=5;

## V2 - SELECT - merge in cazul in care exista o singura valoare returnata
select * from angajat where departament_id=(select id from departament where nume="HR");

## Aici returneaza mai multe valori si nu mai functioneaza
# select * from angajat where departament_id=(select id from departament where nume="HR" OR nume ="IT");


## V3 - folosind o variabila
SELECT @variabila; # initial este NULL

SET @variabila  = 20; 
SELECT @variabila;

SELECT @o_alta_variabila = 100;

SELECT @o_alta_variabila;

## SETAREA unei variabile poate fi facuta cu SET sau SELECT := 
SELECT @o_alta_variabila := 100;
SELECT @o_alta_variabila;

SET @dep_HR := (SELECT id FROM departament WHERE nume="HR");
select * from angajat where departament_id=@dep_HR ;


## V4 - join 
SELECT angajat.nume,angajat.prenume,departament.nume 
	FROM angajat JOIN departament 
    ON angajat.departament_id=departament.id 
    WHERE departament.nume="HR";

-- 7. Listati angajatii care nu lucreaza la HR 
select * from angajat where departament_id<>5;
select count(*) from angajat where departament_id IS NULL;
select * from angajat where departament_id != 5;

-- 8. Listati angajatii care au salariu mai mare de 3000 lei
select * from angajat where salariu>3000;

-- 9. Selectati angajatii care au salariul 3000 lei
select * from angajat where salariu=3000;

-- 10. Selectați angajații care au salariul intre 3000 si 5000 de lei 
select * from angajat where salariu between 3000 and 5000;
select * from angajat where salariu > 3000 and salariu < 5000;


-- 11 Selectați angajații care nu au manager
select * from angajat;
select * from angajat where manager_id IS NULL;


-- 12. Listați angajații ai caror manager are ID-ul 1
select * from angajat where manager_id=1;

-- 13. Enumerați angajații ai căror manager este Toma Ion 
select * from angajat;
select * from angajat where manager_id=1;
SELECT * FROM angajat as Salariat
		 JOIN angajat as  Manager  ON Salariat.manager_id=Manager.id where (Manager.nume="Toma" or Manager.prenume="Ion");

SELECT Salariat.nume, Salariat.prenume, Manager.nume, Manager.prenume FROM angajat as Salariat
		 JOIN angajat as  Manager  ON Salariat.manager_id=Manager.id where (Manager.nume="Toma" or Manager.prenume="Ion");

-- 14. Listati angajații care au salariu mai mare de 2500 lei si lucrează pe Backend 
SELECT* FROM departament;
SELECT COUNT(*) FROM angajat;
select * from departament where nume="Backend";
select * from angajat where salariu>2500 and departament_id=(select id from departament where nume="Backend");

-- 15. Selectati angajatii ai căror manager NU este Toma Ion și care au salariu mai mare de 4000 lei 
select count(*) from angajat where manager_id>1 or  manager_id is null;
select count(*) from angajat;
select * from angajat;
select * from angajat where salariu>4000 and (manager_id>1 or  manager_id is null);
SELECT * FROM angajat as Manager JOIN angajat as Salariat ON Salariat.manager_id=Manager.id where (Manager.nume!="Toma" or Manager.prenume!="Ion") and Salariat.salariu>4000;

SELECT COUNT(*) FROM angajat as Manager LEFT JOIN angajat as Salariat ON Salariat.manager_id=Manager.id;
SELECT COUNT(*) FROM angajat as Manager RIGHT JOIN angajat as Salariat ON Salariat.manager_id=Manager.id;
SELECT * FROM angajat as Manager RIGHT JOIN angajat as Salariat ON Salariat.manager_id=Manager.id where (Manager.nume!="Toma" or Manager.prenume!="Ion" or Salariat.manager_id is null) and Salariat.salariu>4000;

SELECT * FROM angajat join departament on angajat.departament_id=departament.id where departament.nume="HR";



