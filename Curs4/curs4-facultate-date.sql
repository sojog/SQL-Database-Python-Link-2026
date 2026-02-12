USE universitate;

INSERT INTO curs set titlu='SQL',an='3',semestru='1',credite='5';

SELECT * FROM curs;

INSERT INTO profesor set nume='Mihai',prenume='George',data_nasterii='1985-01-25',grad='III';

SELECT * FROM profesor;

INSERT INTO student set nume='Alex',prenume='Cristian',gen='M',an='2',grupa='2',statut='admis';

SELECT * FROM student;

SELECT * FROM predare;

INSERT INTO predare set id_profesor='1',curs_id='1';

SELECT * FROM predare;


## VARIANTA 1
INSERT INTO curs SET titlu = "OOP", an=4, semestru=1, credite=6;
SELECT * FROM curs;

## VARIANTA 2
INSERT INTO curs VALUES (3, 'Blockchain', 3, 2, 1);
SELECT * FROM curs;

## VARIANTA 3
INSERT INTO curs VALUES (4, 'Machine Learning', 1, 1, 1), (5, 'R - Programming', 3, 2, 1);
SELECT * FROM curs;


## VARIANTA 4 - INSRT INTO VALUES (specificate)
INSERT INTO curs (titlu, an, semestru, credite) VALUES ( 'HTML CSS', 1, 1, 1);
SELECT * FROM curs;

## VARIANTA 5 - INTO(nu este obligatoriu, dar este de preferat)
INSERT curs (titlu, an) VALUES ( 'Python Fundamentals', 1);
SELECT * FROM curs;


SELECT * FROM student;
SELECT * FROM profesor; 

INSERT INTO student set nume='George',prenume='Georgescu',gen='M',an='2',grupa='2',statut='admis';
INSERT INTO student set nume='Florin',prenume='Florinescu',gen='M',an='2',grupa='2',statut='admis';

SELECT idstudent, nume, prenume FROM student WHERE idstudent = 1;


## VARIANTA 6 - SELECT + INSERT
INSERT INTO profesor (nume, prenume) SELECT nume, prenume FROM student WHERE idstudent = 2;
SELECT * FROM profesor;



SELECT * FROM predare;
SELECT * FROM profesor;


DELETE FROM profesor WHERE id = 1;
SELECT * FROM profesor;

SELECT * FROM predare;

## TRUNCATE -> sterge toate intrarile din tabel fara a sterge si tabel
TRUNCATE predare;
SELECT * FROM predare;


TRUNCATE profesor;
SELECT * FROM profesor;


INSERT INTO profesor (prenume, nume) VALUES
	('Gica', 'Hagi'), ('Simona', 'Halep'),
    ('Ilie', 'Nastare'), ('Marius', 'Urzica'); 
SELECT * FROM profesor;
    
    
INSERT INTO profesor (prenume, nume) VALUES
	('Ilie', 'Dumitrescu'), ('Elisabeta', 'Lipa');
    
    SELECT * FROM profesor;
    SELECT * FROM curs;
    
    
SELECT * FROM predare;
INSERT INTO predare (id_profesor, curs_id)
	VALUES(4, 2), (5,1), (6,3), (7, 3), (4, 6), (5, 2);
    SELECT * FROM predare;
    
   SELECT * FROM profesor JOIN predare ON profesor.id = predare.id_profesor
   JOIN curs ON predare.curs_id = curs.id; 

 SELECT nume, prenume, titlu FROM profesor JOIN predare ON profesor.id = predare.id_profesor
   JOIN curs ON predare.curs_id = curs.id; 

