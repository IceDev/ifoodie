SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `ifoodie` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ifoodie` ;

-- -----------------------------------------------------
-- Table `ifoodie`.`category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`category` (
  `categoryId` INT NOT NULL AUTO_INCREMENT ,
  `categoryName` VARCHAR(128) NOT NULL ,
  `priority` INT NOT NULL ,
  PRIMARY KEY (`categoryId`) ,
  UNIQUE INDEX `categoryName_UNIQUE` (`categoryName` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodie`.`itemDetails`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`itemDetails` (
  `itemId` INT NOT NULL AUTO_INCREMENT ,
  `name` TEXT NOT NULL ,
  `description` TEXT NOT NULL ,
  `cost` FLOAT NOT NULL ,
  `cookingTime` INT NOT NULL ,
  `calorieCount` FLOAT NOT NULL ,
  `categoryId` INT NOT NULL ,
  PRIMARY KEY (`itemId`) ,
  INDEX `fk_itemDetails_category` (`categoryId` ASC) ,
  CONSTRAINT `fk_itemDetails_category`
    FOREIGN KEY (`categoryId` )
    REFERENCES `ifoodie`.`category` (`categoryId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodie`.`images`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`images` (
  `imageId` INT NOT NULL AUTO_INCREMENT ,
  `link` TEXT NOT NULL ,
  `itemId` INT NOT NULL ,
  PRIMARY KEY (`imageId`) ,
  INDEX `fk_images_itemDetails` (`itemId` ASC) ,
  CONSTRAINT `fk_images_itemDetails`
    FOREIGN KEY (`itemId` )
    REFERENCES `ifoodie`.`itemDetails` (`itemId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodie`.`ratings`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`ratings` (
  `rid` INT NOT NULL AUTO_INCREMENT ,
  `rating` INT NOT NULL ,
  `count` INT NOT NULL ,
  `itemId` INT NOT NULL ,
  PRIMARY KEY (`rid`) ,
  INDEX `fk_ratings_itemDetails` (`itemId` ASC) ,
  CONSTRAINT `fk_ratings_itemDetails`
    FOREIGN KEY (`itemId` )
    REFERENCES `ifoodie`.`itemDetails` (`itemId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodie`.`order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`order` (
  `orderId` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `paymentMethod` TEXT NOT NULL ,
  `discount` FLOAT NULL ,
  `totalCost` FLOAT NOT NULL ,
  PRIMARY KEY (`orderId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodie`.`itemOrder`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`itemOrder` (
  `itemOrderId` INT NOT NULL AUTO_INCREMENT ,
  `itemId` INT NOT NULL ,
  `orderId` INT NOT NULL ,
  `instructions` TEXT NULL ,
  `quantity` INT NOT NULL DEFAULT 1 ,
  `cost` FLOAT NOT NULL ,
  PRIMARY KEY (`itemOrderId`) ,
  INDEX `fk_itemOrder_itemDetails1` (`itemId` ASC) ,
  INDEX `fk_itemOrder_order1` (`orderId` ASC) ,
  CONSTRAINT `fk_itemOrder_itemDetails1`
    FOREIGN KEY (`itemId` )
    REFERENCES `ifoodie`.`itemDetails` (`itemId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itemOrder_order1`
    FOREIGN KEY (`orderId` )
    REFERENCES `ifoodie`.`order` (`orderId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodie`.`masters`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`masters` (
  `mastersId` INT NOT NULL AUTO_INCREMENT ,
  `keyname` VARCHAR(45) NOT NULL ,
  `valuename` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`mastersId`) ,
  UNIQUE INDEX `keyname_UNIQUE` (`keyname` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodie`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`users` (
  `userId` INT NOT NULL AUTO_INCREMENT ,
  `uname` VARCHAR(32) NOT NULL ,
  `password` TEXT NOT NULL ,
  `fName` TEXT NOT NULL ,
  `lName` TEXT NOT NULL ,
  `role` TEXT NOT NULL ,
  PRIMARY KEY (`userId`) ,
  UNIQUE INDEX `uname_UNIQUE` (`uname` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodie`.`queue`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ifoodie`.`queue` (
  `queueId` INT NOT NULL AUTO_INCREMENT ,
  `itemOrderId` INT NOT NULL ,
  `eta` TIME NULL ,
  PRIMARY KEY (`queueId`) ,
  INDEX `fk_queue_itemOrder1` (`itemOrderId` ASC) ,
  CONSTRAINT `fk_queue_itemOrder1`
    FOREIGN KEY (`itemOrderId` )
    REFERENCES `ifoodie`.`itemOrder` (`itemOrderId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE USER 'db_admin_ifoodie'@'localhost' IDENTIFIED BY 'ifoodiePwds12';

GRANT ALL PRIVILEGES ON * . * TO 'db_admin_ifoodie'@'localhost' IDENTIFIED BY 'ifoodiePwds12' WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0 ;
GRANT ALL PRIVILEGES ON `ifoodie` . * TO 'db_admin_ifoodie'@'localhost' WITH GRANT OPTION ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
