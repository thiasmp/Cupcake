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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cup_cake_top`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cup_cake_top` (
  `name` VARCHAR(45) NULL,
  `cup_cake_top_id` INT NOT NULL,
  `price` INT NULL,
  PRIMARY KEY (`cup_cake_top_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cup_cake_bund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cup_cake_bund` (
  `name` VARCHAR(45) NULL,
  `cup_cake_bund_id` INT NOT NULL,
  `price` INT NULL,
  PRIMARY KEY (`cup_cake_bund_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `e-mail` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `user_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`indkøbskurv`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`indkøbskurv` (
  `indkøbskurv_id` INT NOT NULL,
  `order_id` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`indkøbskurv_id`),
  INDEX `fk_indkøbskurv_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_indkøbskurv_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ordre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`ordre` (
  `cup_cake_top_id` INT NULL,
  `cup_cake_bund_id` INT NULL,
  `quantity` INT NULL,
  `ordre_id` INT NOT NULL AUTO_INCREMENT,
  `indkøbskurv_id` INT NOT NULL,
  INDEX `fk_ordre_cup_cake_bund1_idx` (`cup_cake_bund_id` ASC) VISIBLE,
  INDEX `fk_ordre_cup_cake_top1_idx` (`cup_cake_top_id` ASC) VISIBLE,
  PRIMARY KEY (`ordre_id`),
  INDEX `fk_ordre_indkøbskurv1_idx` (`indkøbskurv_id` ASC) VISIBLE,
  CONSTRAINT `fk_ordre_cup_cake_bund1`
    FOREIGN KEY (`cup_cake_bund_id`)
    REFERENCES `mydb`.`cup_cake_bund` (`cup_cake_bund_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordre_cup_cake_top1`
    FOREIGN KEY (`cup_cake_top_id`)
    REFERENCES `mydb`.`cup_cake_top` (`cup_cake_top_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordre_indkøbskurv1`
    FOREIGN KEY (`indkøbskurv_id`)
    REFERENCES `mydb`.`indkøbskurv` (`indkøbskurv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

