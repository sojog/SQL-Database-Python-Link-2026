-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sport
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sport
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `Universitate`;
-- -----------------------------------------------------
-- Schema Universitate
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Universitate
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Universitate` DEFAULT CHARACTER SET utf8mb3 ;



-- -----------------------------------------------------
-- Table `Universitate`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`student` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL DEFAULT NULL,
  `prenume` VARCHAR(45) NULL DEFAULT NULL,
  `gen` ENUM('F', 'M') NULL DEFAULT NULL,
  `an` INT NULL DEFAULT NULL,
  `grupa` VARCHAR(45) NULL DEFAULT NULL,
  `bursa` INT NULL DEFAULT NULL,
  `statut` ENUM('restantier', 'bursier', 'admis') NULL DEFAULT NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Universitate`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`note` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valoare` INT NULL DEFAULT NULL,
  `curs_id` INT NOT NULL,
  `student_idstudent` INT NOT NULL,
  `data_notarii` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_note_curs1_idx` (`curs_id` ASC) VISIBLE,
  INDEX `fk_note_student1_idx` (`student_idstudent` ASC) VISIBLE,
  CONSTRAINT `fk_note_curs1`
    FOREIGN KEY (`curs_id`)
    REFERENCES `Universitate`.`curs` (`id`),
  CONSTRAINT `fk_note_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `Universitate`.`student` (`idstudent`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Universitate`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`profesor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL DEFAULT NULL,
  `prenume` VARCHAR(45) NULL DEFAULT NULL,
  `adresa` VARCHAR(45) NULL DEFAULT NULL,
  `data_nasterii` DATE NULL DEFAULT NULL,
  `grad` ENUM('I', 'II', 'III') NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Universitate`.`predare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`predare` (
  `idpredare` INT NOT NULL AUTO_INCREMENT,
  `id_profesor` INT NOT NULL,
  `curs_id` INT NOT NULL,
  PRIMARY KEY (`idpredare`),
  INDEX `fk_profesor_idx` (`id_profesor` ASC) VISIBLE,
  INDEX `fk_predare_curs1_idx` (`curs_id` ASC) VISIBLE,
  CONSTRAINT `fk_predare_curs1`
    FOREIGN KEY (`curs_id`)
    REFERENCES `Universitate`.`curs` (`id`),
  CONSTRAINT `fk_profesor`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `Universitate`.`profesor` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Universitate`.`prezente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`prezente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `curs_id` INT NOT NULL,
  `student_idstudent` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_prezente_curs1_idx` (`curs_id` ASC) VISIBLE,
  INDEX `fk_prezente_student1_idx` (`student_idstudent` ASC) VISIBLE,
  CONSTRAINT `fk_prezente_curs1`
    FOREIGN KEY (`curs_id`)
    REFERENCES `Universitate`.`curs` (`id`),
  CONSTRAINT `fk_prezente_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `Universitate`.`student` (`idstudent`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `Universitate`.`student`
(`nume`, `prenume`, `gen`, `an`, `grupa`, `bursa`, `statut`)
VALUES
('Eminescu', 'Mihai', 'M', 1, '101A', 1200, 'bursier'),
('Creanga', 'Ion', 'M', 2, '102B', 0, 'admis'),
('Ionescu', 'Nadia', 'F', 1, '101B', 1500, 'bursier'),
('Enescu', 'George', 'M', 3, '103A', 1000, 'bursier'),
('Brancusi', 'Constantin', 'M', 2, '102A', 0, 'restantier'),
('Coanda', 'Henri', 'M', 3, '103B', 1800, 'bursier'),
('Cuza', 'Alexandru Ioan', 'M', 1, '101C', 0, 'admis'),
('Vuia', 'Traian', 'M', 2, '102C', 900, 'bursier'),
('Bacovia', 'George', 'M', 3, '103C', 0, 'restantier'),
('Teiuleanu', 'Ana', 'F', 1, '101D', 1100, 'bursier');
SELECT * FROM student;


