CREATE SCHEMA IF NOT EXISTS `sport` DEFAULT CHARACTER SET utf8mb3 ;

USE `sport` ;

-- -----------------------------------------------------
-- Table `sport`.`Echipa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sport`.`Echipa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sport`.`Jucator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sport`.`Jucator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL,
  `Echipa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Jucator_Echipa_idx` (`Echipa_id` ASC) VISIBLE,
  CONSTRAINT `fk_Jucator_Echipa`
    FOREIGN KEY (`Echipa_id`)
    REFERENCES `sport`.`Echipa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `Universitate` ;

-- -----------------------------------------------------
-- Table `Universitate`.`curs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`curs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titlu` VARCHAR(45) NULL DEFAULT NULL,
  `an` INT NULL DEFAULT NULL,
  `semestru` INT NULL DEFAULT NULL,
  `credite` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


USE sport;
SHOW TABLES;

SELECT * FROM echipa;

INSERT INTO echipa (nume) VALUES ("Real Madrid"), ("Barcelona"), ("Milan"), ("Inter"), ("Juventus"), ("Bayern");

SELECT * FROM echipa;


INSERT INTO jucator (nume, Echipa_id) VALUES ("Vinicius", 1);
SELECT * FROM jucator;

INSERT INTO jucator (nume, Echipa_id) VALUES ("Yamal", (SELECT id FROM echipa WHERE nume = "Barcelona"));
SELECT * FROM jucator;

SELECT COUNT(*) FROM echipa;
SELECT COUNT(*) FROM jucator;


INSERT INTO jucator (nume, Echipa_id) VALUES ("Rafa Leao", (SELECT id FROM echipa WHERE nume = "Milan"));

## JOIN fara conditie este un UNION - le combina fiecare cu fiecare
SELECT COUNT(*) FROM jucator JOIN echipa;

## Join cu conditie  - primary(dintr-o tabela) si foreign (din alta tabela) sunt aceleasi
SELECT * FROM jucator JOIN echipa ON   jucator.Echipa_id = echipa.id ;

## Inversez tabelele
SELECT * FROM echipa JOIN jucator ON   jucator.Echipa_id = echipa.id ;

## Selectarea doar a unor coloane
SELECT echipa.nume, jucator.nume FROM echipa JOIN jucator ON   jucator.Echipa_id = echipa.id ;

SELECT echipa.nume AS 'echipa', jucator.nume as 'jucator' FROM echipa JOIN jucator ON   jucator.Echipa_id = echipa.id ;


## DEFAULT - JOIN este INNER JOIN
SELECT * FROM jucator JOIN echipa ON   jucator.Echipa_id = echipa.id ;
SELECT * FROM jucator INNER JOIN echipa ON   jucator.Echipa_id = echipa.id ;


SELECT * FROM echipa;

INSERT INTO jucator SET nume = "Ronaldinho";
SELECT * FROM jucator;


## Coloana Foreign key poate fi nula
ALTER TABLE `sport`.`Jucator` 
DROP FOREIGN KEY `fk_Jucator_Echipa`;
ALTER TABLE `sport`.`Jucator` 
CHANGE COLUMN `Echipa_id` `Echipa_id` INT NULL ;
ALTER TABLE `sport`.`Jucator` 
ADD CONSTRAINT `fk_Jucator_Echipa`
  FOREIGN KEY (`Echipa_id`)
  REFERENCES `sport`.`Echipa` (`id`);


INSERT INTO jucator SET nume = "Ronaldinho";
SELECT * FROM jucator;


## DEFAULT - JOIN este INNER JOIN
SELECT * FROM jucator JOIN echipa ON   jucator.Echipa_id = echipa.id ;
SELECT * FROM jucator INNER JOIN echipa ON   jucator.Echipa_id = echipa.id ;

## LEFT JOIN - Include tabela din stanga, si anume intrarile care nu au echivalent in dreapta
SELECT * FROM jucator LEFT JOIN echipa ON   jucator.Echipa_id = echipa.id ;

## RIGHT JOIN - Include tabela din dreapta, si anume intrarile care nu au echivalent in stanga
SELECT * FROM jucator RIGHT JOIN echipa ON   jucator.Echipa_id = echipa.id ;


## LEFT JOIN - Include tabela din stanga, si anume intrarile care nu au echivalent in dreapta
SELECT * FROM echipa LEFT JOIN jucator ON   jucator.Echipa_id = echipa.id ;

## RIGHT JOIN - Include tabela din dreapta, si anume intrarile care nu au echivalent in stanga
SELECT * FROM echipa RIGHT JOIN  jucator ON   jucator.Echipa_id = echipa.id ;


CREATE TABLE Tara (id INT PRIMARY KEY AUTO_INCREMENT, nume VARCHAR(100) UNIQUE);
INSERT INTO Tara (nume) VALUES ("Spania"), ("Italia"), ("Germania"), ("Brazilia"), ("Romania"), ("Portugalia");

SELECT * FROM Tara; 

ALTER TABLE `Echipa` ADD COLUMN  Tara_id INT;
SELECT * FROM echipa;

ALTER TABLE `Echipa`
ADD CONSTRAINT `fk_Tara_Echipa` FOREIGN KEY (`Tara_id`) REFERENCES `Tara` (`id`);
SELECT * FROM echipa;


UPDATE  Echipa SET Tara_id = 1 Where id < 3;

SELECT * FROM echipa;

UPDATE  Echipa SET Tara_id = (SELECT id FROM Tara WHERE nume = "Italia") Where id BETWEEN 3 AND 5;
SELECT * FROM echipa;


UPDATE  Echipa SET Tara_id = (SELECT id FROM Tara WHERE nume = "Germania") Where id  = 6;
SELECT * FROM echipa;


## RIGHT JOIN - Include tabela din dreapta, si anume intrarile care nu au echivalent in stanga
SELECT * FROM echipa JOIN Tara ON  echipa.tara_id = tara.id
			   RIGHT JOIN jucator ON   jucator.Echipa_id = echipa.id ;
               

SELECT echipa.nume AS 'Echipa', 
		 tara.nume as 'Tara Echipa',
         jucator.nume as 'Jucator'
	
		FROM echipa JOIN Tara ON  echipa.tara_id = tara.id
			   RIGHT JOIN jucator ON   jucator.Echipa_id = echipa.id ;
               
               

ALTER TABLE `Jucator` ADD COLUMN  Tara_id INT;
SELECT * FROM Jucator;

ALTER TABLE `Jucator`
ADD CONSTRAINT `fk_Tara_Jucator` FOREIGN KEY (`Tara_id`) REFERENCES `Tara` (`id`);
SELECT * FROM Jucator;

SELECT id FROM Tara WHERE nume = "Brazilia";
UPDATE Jucator SET Tara_id = 4 WHERE id = 1 OR id = 4;
SELECT * FROM jucator;



UPDATE Jucator SET Tara_id = (SELECT id FROM Tara WHERE nume = "Spania") WHERE id = 2;
SELECT * FROM jucator;

SET @id_portugalia = (SELECT id FROM Tara WHERE nume = "Portugalia");
SELECT @id_portugalia;


UPDATE Jucator SET Tara_id = @id_portugalia WHERE id = 3;
SELECT * FROM jucator;


SELECT * FROM echipa JOIN tara AS tara_echipei ON echipa.tara_id = tara_echipei.id 
					 JOIN jucator ON echipa.id = jucator.Echipa_id
                     JOIN tara AS tara_jucatorului ON  jucator.Tara_id = tara_jucatorului.id ; 

SELECT echipa.nume AS 'Echipa', tara_echipei.nume AS 'Tara Echipei',
	jucator.nume as 'Jucator', tara_jucatorului.nume AS 'Tara Jucatorului'
    FROM echipa JOIN tara AS tara_echipei ON echipa.tara_id = tara_echipei.id 
					 JOIN jucator ON echipa.id = jucator.Echipa_id
                     JOIN tara AS tara_jucatorului ON  jucator.Tara_id = tara_jucatorului.id ; 


# View (vedere) - un fel de tabel mai usor de vizualizat;
CREATE VIEW Echipa_Tara_Jucator_Tara AS
	SELECT echipa.nume AS 'Echipa', tara_echipei.nume AS 'Tara Echipei',
		jucator.nume as 'Jucator', tara_jucatorului.nume AS 'Tara Jucatorului'
		FROM echipa JOIN tara AS tara_echipei ON echipa.tara_id = tara_echipei.id 
						 JOIN jucator ON echipa.id = jucator.Echipa_id
						 JOIN tara AS tara_jucatorului ON  jucator.Tara_id = tara_jucatorului.id ; 


SELECT * FROM Echipa_Tara_Jucator_Tara;

SELECT * FROM Echipa_Tara_Jucator_Tara WHERE `Tara Echipei` = 'Spania';