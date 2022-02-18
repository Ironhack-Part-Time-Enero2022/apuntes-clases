-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema seguros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema seguros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `seguros` DEFAULT CHARACTER SET utf8 ;
USE `seguros` ;

-- -----------------------------------------------------
-- Table `seguros`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`clientes` (
  `idcliente` INT NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `raza` VARCHAR(45) NOT NULL,
  `experiencia` VARCHAR(45) NOT NULL,
  `educacion` VARCHAR(45) NOT NULL,
  `estado_civil` VARCHAR(45) NOT NULL,
  `hijos` VARCHAR(45) NOT NULL,
  `clase` VARCHAR(45) NOT NULL,
  `codigo_postal` INT NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `seguros`.`seguro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`seguro` (
  `idseguro` INT NOT NULL,
  `duis` INT NOT NULL,
  `accidentes` INT NOT NULL,
  `score` FLOAT NOT NULL,
  `clientes_idcliente` INT NOT NULL,
  PRIMARY KEY (`idseguro`),
  INDEX `fk_seguro_clientes_idx` (`clientes_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_seguro_clientes`
    FOREIGN KEY (`clientes_idcliente`)
    REFERENCES `seguros`.`clientes` (`idcliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `seguros`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`vehiculos` (
  `idvehiculos` VARCHAR(10) NOT NULL,
  `propietarios` INT NOT NULL,
  `año` VARCHAR(45) NOT NULL,
  `clientes_idcliente` INT NOT NULL,
  PRIMARY KEY (`idvehiculos`),
  INDEX `fk_vehiculos_clientes1_idx` (`clientes_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_vehiculos_clientes1`
    FOREIGN KEY (`clientes_idcliente`)
    REFERENCES `seguros`.`clientes` (`idcliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
