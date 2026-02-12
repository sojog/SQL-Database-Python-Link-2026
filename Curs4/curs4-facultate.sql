-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Universitate
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Universitate
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Universitate` DEFAULT CHARACTER SET utf8 ;
USE `Universitate` ;

-- -----------------------------------------------------
-- Table `Universitate`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`profesor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL,
  `prenume` VARCHAR(45) NULL,
  `adresa` VARCHAR(45) NULL,
  `data_nasterii` DATE NULL,
  `grad` ENUM('I', 'II', 'III') NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universitate`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`student` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL,
  `prenume` VARCHAR(45) NULL,
  `gen` ENUM('F', 'M') NULL,
  `an` INT NULL,
  `grupa` VARCHAR(45) NULL,
  `bursa` INT NULL,
  `statut` ENUM('restantier', 'bursier', 'admis') NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universitate`.`curs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`curs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titlu` VARCHAR(45) NULL,
  `an` INT NULL,
  `semestru` INT NULL,
  `credite` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


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
  CONSTRAINT `fk_profesor`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `Universitate`.`profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_predare_curs1`
    FOREIGN KEY (`curs_id`)
    REFERENCES `Universitate`.`curs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universitate`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`note` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valoare` INT NULL,
  `curs_id` INT NOT NULL,
  `student_idstudent` INT NOT NULL,
  `data_notarii` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_note_curs1_idx` (`curs_id` ASC) VISIBLE,
  INDEX `fk_note_student1_idx` (`student_idstudent` ASC) VISIBLE,
  CONSTRAINT `fk_note_curs1`
    FOREIGN KEY (`curs_id`)
    REFERENCES `Universitate`.`curs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_note_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `Universitate`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universitate`.`prezente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universitate`.`prezente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NULL DEFAULT current_timestamp,
  `curs_id` INT NOT NULL,
  `student_idstudent` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_prezente_curs1_idx` (`curs_id` ASC) VISIBLE,
  INDEX `fk_prezente_student1_idx` (`student_idstudent` ASC) VISIBLE,
  CONSTRAINT `fk_prezente_curs1`
    FOREIGN KEY (`curs_id`)
    REFERENCES `Universitate`.`curs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prezente_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `Universitate`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
