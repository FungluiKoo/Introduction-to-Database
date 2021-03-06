-- MySQL Script generated by MySQL Workbench
-- Tue Oct 29 16:20:28 2019
-- Model: SchoolClubs    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Student` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `StudentNNumber` INT UNSIGNED NOT NULL,
  `StudentName` VARCHAR(45) NOT NULL DEFAULT 'N/A',
  `StudentNetID` VARCHAR(8) NOT NULL DEFAULT 'N/A',
  `Major` VARCHAR(45) NOT NULL DEFAULT 'Undecided',
  `StudyBegin` DATE NOT NULL DEFAULT 1831-04-18,
  `StudyGrad` DATE NULL DEFAULT 2099-12-31,
  `Mobile` INT NOT NULL DEFAULT 0,
  `secondEmail` VARCHAR(45) NULL,
  PRIMARY KEY (`StudentNNumber`),
  UNIQUE INDEX `idStudent_UNIQUE` (`StudentNNumber` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Club`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Club` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Club` (
  `idClub` INT UNSIGNED NOT NULL,
  `ClubName` VARCHAR(45) NOT NULL DEFAULT 'N/A',
  `MasterDepartment` VARCHAR(45) NOT NULL DEFAULT 'NYU',
  `EntryFee` FLOAT NOT NULL DEFAULT 0,
  `Description` TEXT NOT NULL DEFAULT 'N/A',
  `PresidentNNumber` INT NULL,
  `SecretaryNNumber` INT NULL,
  `TreasurerNNumber` INT NULL,
  `MeetingSpace` VARCHAR(45) NULL,
  `ClubEmail` VARCHAR(45) NULL,
  `ClubURL` VARCHAR(45) NULL,
  PRIMARY KEY (`idClub`),
  UNIQUE INDEX `idClubs_UNIQUE` (`idClub` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Matriculation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Matriculation` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`Matriculation` (
  `idMatriculation` INT UNSIGNED NOT NULL,
  `BeginDate` DATE NULL,
  `EndDate` DATE NULL,
  `StudentNNumber` INT UNSIGNED NOT NULL,
  `idClub` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idMatriculation`),
  INDEX `fk_Matriculation_Student_idx` (`StudentNNumber` ASC) VISIBLE,
  INDEX `fk_Matriculation_Club1_idx` (`idClub` ASC) VISIBLE,
  CONSTRAINT `fk_Matriculation_Student`
    FOREIGN KEY (`StudentNNumber`)
    REFERENCES `mydb`.`Student` (`StudentNNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matriculation_Club1`
    FOREIGN KEY (`idClub`)
    REFERENCES `mydb`.`Club` (`idClub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
