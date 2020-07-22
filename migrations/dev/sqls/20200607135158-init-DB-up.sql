-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema best_boogeyman
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `best_boogeyman` ;

-- -----------------------------------------------------
-- Schema best_boogeyman
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `best_boogeyman` ;
USE `best_boogeyman` ;

-- -----------------------------------------------------
-- Table `best_boogeyman`.`boogeyman`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `best_boogeyman`.`boogeyman` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `avatar` VARCHAR(255) NOT NULL,
  `bio` VARCHAR(45) NULL,
  `votes` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `best_boogeyman`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `best_boogeyman`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `is_admin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `best_boogeyman`.`boogeyman_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `best_boogeyman`.`boogeyman_has_user` (
  `boogeyman_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `vote` INT NOT NULL,
  PRIMARY KEY (`boogeyman_id`, `user_id`),
  INDEX `fk_boogeyman_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_boogeyman_has_user_boogeyman_idx` (`boogeyman_id` ASC),
  CONSTRAINT `fk_boogeyman_has_user_boogeyman`
    FOREIGN KEY (`boogeyman_id`)
    REFERENCES `best_boogeyman`.`boogeyman` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boogeyman_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `best_boogeyman`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `best_boogeyman`.`migrations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `run_on` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
