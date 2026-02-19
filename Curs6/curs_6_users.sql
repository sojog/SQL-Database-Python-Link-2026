
SHOW DATABASES;

USE mysql;
SHOW TABLES;

SELECT * FROM user;

CREATE USER 'user_demo' IDENTIFIED BY 'parola1234';

SELECT * FROM user;

CREATE USER 'user_local_demo'@'localhost' IDENTIFIED BY 'parola1234';
SELECT * FROM user;

## Aloca privilegiu de select catre tabelul departament din baza de date firma utilizatorului 'user_local_demo'@'localhost'
GRANT SELECT ON firma.departament TO  'user_local_demo'@'localhost' ;

GRANT SELECT ON sport.* TO 'user_local_demo'@'localhost' ;

GRANT SELECT ON firma.* TO  'user_local_demo'@'localhost' ;
REVOKE SELECT ON firma.* FROM  'user_local_demo'@'localhost' ;


GRANT ALL PRIVILEGES ON sport.echipa TO 'user_local_demo'@'localhost' ;

USE firma;
SELECT * FROM firma.angajat;

CREATE VIEW angajat_manager AS
	SELECT Salariat.id, Concat(Salariat.nume, " ", Salariat.prenume) AS 'Angajat',
		Concat(Manager.nume, " ", Manager.prenume) AS 'Manager' FROM angajat as Salariat LEFT JOIN angajat as Manager ON Salariat.manager_id=Manager.id;


SELECT * FROM angajat_manager;

GRANT SELECT ON firma.angajat_manager TO  'user_demo'@'%' ;

