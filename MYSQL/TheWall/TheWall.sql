-- MySQL Script generated by MySQL Workbench
-- Thu Oct 12 11:22:06 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema TheWall
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TheWall
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TheWall` ;
USE `TheWall` ;

-- -----------------------------------------------------
-- Table `TheWall`.``
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheWall`.`` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TheWall`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheWall`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TheWall`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheWall`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TINYTEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_messages_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `TheWall`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TheWall`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TheWall`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TINYTEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `messages_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_messages_idx` (`messages_id` ASC),
  INDEX `fk_comments_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_comments_messages`
    FOREIGN KEY (`messages_id`)
    REFERENCES `TheWall`.`messages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `TheWall`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;