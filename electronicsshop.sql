-- MySQL Script generated by MySQL Workbench
-- Sun Jan  8 19:47:11 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `ElectronicShop` DEFAULT CHARACTER SET utf8 ;
USE `ElectronicShop` ;

-- -----------------------------------------------------
-- Table `ElectronicShop`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectronicShop`.`Admin` (
  `id_adm` SMALLINT UNSIGNED NOT NULL,
  `name_adm` VARCHAR(64) NOT NULL,
  `workexperience_adm` TINYINT UNSIGNED NOT NULL,
  `salary_adm` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_adm`),
  UNIQUE INDEX `id_adm_UNIQUE` (`id_adm` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectronicShop`.`Seller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectronicShop`.`Seller` (
  `id_sl` SMALLINT UNSIGNED NOT NULL,
  `name_sl` VARCHAR(64) NOT NULL,
  `workexperience_sl` TINYINT UNSIGNED NOT NULL,
  `salary_sl` SMALLINT UNSIGNED NOT NULL,
  `id_adm` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_sl`),
  UNIQUE INDEX `id_sl_UNIQUE` (`id_sl` ASC),
  INDEX `worker_rel1` (`id_adm` ASC),
  CONSTRAINT `worker_rel1`
    FOREIGN KEY (`id_adm`)
    REFERENCES `ElectronicShop`.`Admin` (`id_adm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectronicShop`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectronicShop`.`Customer` (
  `id_cst` SMALLINT UNSIGNED NOT NULL,
  `name_cst` VARCHAR(64) NOT NULL,
  `email` VARCHAR(128) NULL,
  `login` VARCHAR(32) NULL,
  `password` VARCHAR(12) NULL,
  `phone` VARCHAR(10) NULL,
  `id_sl` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_cst`),
  UNIQUE INDEX `id_cst_UNIQUE` (`id_cst` ASC),
  INDEX `to_buy` (`id_sl` ASC),
  CONSTRAINT `to_buy`
    FOREIGN KEY (`id_sl`)
    REFERENCES `ElectronicShop`.`Seller` (`id_sl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectronicShop`.`Manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectronicShop`.`Manager` (
  `id_mg` SMALLINT UNSIGNED NOT NULL,
  `name_mg` VARCHAR(64) NOT NULL,
  `workexperience_mg` TINYINT UNSIGNED NOT NULL,
  `salary_mg` SMALLINT UNSIGNED NOT NULL,
  `id_adm` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_mg`),
  UNIQUE INDEX `id_mg_UNIQUE` (`id_mg` ASC),
  INDEX `worker_rel2` (`id_adm` ASC),
  CONSTRAINT `worker_rel2`
    FOREIGN KEY (`id_adm`)
    REFERENCES `ElectronicShop`.`Admin` (`id_adm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectronicShop`.`Arranger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectronicShop`.`Arranger` (
  `id_arr` SMALLINT UNSIGNED NOT NULL,
  `name_arr` VARCHAR(64) NOT NULL,
  `workexperience_arr` TINYINT UNSIGNED NOT NULL,
  `salary_arr` SMALLINT UNSIGNED NOT NULL,
  `id_adm` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_arr`),
  UNIQUE INDEX `id_arr_UNIQUE` (`id_arr` ASC),
  INDEX `worker_rel3` (`id_adm` ASC),
  CONSTRAINT `worker_rel3`
    FOREIGN KEY (`id_adm`)
    REFERENCES `ElectronicShop`.`Admin` (`id_adm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ElectronicShop`.`Goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ElectronicShop`.`Goods` (
  `id_gd` SMALLINT UNSIGNED NOT NULL,
  `name_gd` VARCHAR(64) NOT NULL,
  `type` VARCHAR(64) NOT NULL,
  `cost` MEDIUMINT UNSIGNED NOT NULL,
  `age` TINYINT UNSIGNED NOT NULL,
  `delivery_data` DATETIME NOT NULL,
  `id_arr` SMALLINT UNSIGNED NOT NULL,
  `id_sl` SMALLINT UNSIGNED NOT NULL,
  `id_cst` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_gd`),
  UNIQUE INDEX `id_gd_UNIQUE` (`id_gd` ASC),
  INDEX `to_get` (`id_arr` ASC),
  INDEX `to_sell` (`id_sl` ASC),
  INDEX `end_point` (`id_cst` ASC),
  CONSTRAINT `to_get`
    FOREIGN KEY (`id_arr`)
    REFERENCES `ElectronicShop`.`Arranger` (`id_arr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `to_sell`
    FOREIGN KEY (`id_sl`)
    REFERENCES `ElectronicShop`.`Seller` (`id_sl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `end_point`
    FOREIGN KEY (`id_cst`)
    REFERENCES `ElectronicShop`.`Customer` (`id_cst`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

REPLACE INTO Goods (id_gd, name_gd, type, cost, age, delivery_data, id_arr, id_sl, id_cst) 
VALUES(1283, 'Asus PCI-Ex GeForce RTX 3060 Dual OC V2 LHR 12GB GDDR6','video card', 16700, 1,'2022-11-02 09:00:00', 007, 005, 100);
REPLACE INTO Goods (id_gd, name_gd, type, cost, age, delivery_data, id_arr, id_sl, id_cst) 
VALUES(3621, 'Grunhelm EKS-7518','electric kettle', 400, 2,'2022-11-12 12:30:00', 008, 006, 321);
REPLACE INTO Goods (id_gd, name_gd, type, cost, age, delivery_data, id_arr, id_sl, id_cst) 
VALUES(2462, 'Xiaomi Redmi 10C','smartphone', 7000, 2,'2022-09-30 08:30:00',007,005,287);
REPLACE INTO Goods (id_gd, name_gd, type, cost, age, delivery_data, id_arr, id_sl, id_cst) 
VALUES(2094, 'Philips Daily Collection HD2581/00','toaster', 1200, 0.5,'2022-11-02 14:45:00',008, 005,444);

REPLACE INTO Customer (id_cst, name_cst, email, login, password, phone, id_slcustomer) 
VALUES(100, 'Evheniy','evhenii787@gmail.com','evh98','akudjgfcl', '0984512399', 005);
REPLACE INTO Customer (id_cst, name_cst, email, login, password,phone, id_sl) 
VALUES(287, 'Artem','ar999tem@gmail.com','artemii','etsjzeua35', '0960097621',005);
REPLACE INTO Customer (id_cst, name_cst, email, login, password,phone, id_sl) 
VALUES(321, 'Yana','yanichkaww@gmail.com','yanich_k4','2385789fyv', '0954632211', 006);
REPLACE INTO Customer (id_cst, name_cst, email, login, password,phone, id_sl) 
VALUES(444, 'Mykyta','taetae123@gmail.com','aeae678','bobobowepikj', '0990874563', 005);

REPLACE INTO Admin (id_adm, name_adm, workexperience_adm, salary_adm) 
VALUES(001, 'Dmytro', 6 ,55000);
REPLACE INTO Admin (id_adm, name_adm, workexperience_adm, salary_adm) 
VALUES(002, 'Maksym', 7 ,55000);

REPLACE INTO Manager (id_mg, name_mg, workexperience_mg, salary_mg, id_adm) 
VALUES(003, 'Viktoriya',2 ,25000, 001);
REPLACE INTO Manager (id_mg, name_mg, workexperience_mg, salary_mg, id_adm) 
VALUES(004, 'Ruslan',1 ,20000, 002);

REPLACE INTO Seller (id_sl, name_sl, workexperience_sl, salary_sl, id_adm) 
VALUES(005, 'Olexandr', 4 ,14000, 002);
REPLACE INTO Seller (id_sl, name_sl, workexperience_sl, salary_sl, id_adm) 
VALUES(006, 'Polina', 2 ,14000, 001);

REPLACE INTO Arranger (id_arr, name_arr, workexperience_arr, salary_arr, id_adm) 
VALUES(007, 'Rostyslav', 1 ,12000, 002);
REPLACE INTO Arranger (id_arr, name_arr, workexperience_arr, salary_arr, id_adm) 
VALUES(008, 'Mykhailo', 3 ,12000, 001);





SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
