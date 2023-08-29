-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `Starters` VARCHAR(255) NULL,
  `Courses` VARCHAR(255) NULL,
  `Desserts` VARCHAR(255) NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(255) NULL,
  `Cuisine` VARCHAR(255) NULL,
  `MenuItemID` INT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuItemsID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `MenuItemsID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `little_lemon_db`.`MenuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Staff` (
  `StaffID` INT NOT NULL,
  `StaffName` VARCHAR(255) NULL,
  `StaffRole` VARCHAR(255) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NULL,
  `CustomerID` INT NULL,
  `MenuID` INT NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL(10,2) NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `StaffID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_db`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon_db`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `little_lemon_db`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NULL,
  `TableNumber` INT NULL,
  `CustomerID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_db`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`DeliveryStatus` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` TINYINT NULL,
  `OrderID` INT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `little_lemon_db`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
