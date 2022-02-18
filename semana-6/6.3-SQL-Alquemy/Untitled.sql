-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
  `genero` INT NOT NULL,
  `raza` VARCHAR(45) NOT NULL,
  `experiencia` VARCHAR(45) NOT NULL,
  `educacion` VARCHAR(45) NOT NULL,
  `estado_civil` VARCHAR(45) NOT NULL,
  `hijos` VARCHAR(45) NOT NULL,
  `clase` VARCHAR(45) NOT NULL,
  `codigo_postal` INT(5) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguros`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`vehiculos` (
  `idvehiculos` INT NOT NULL,
  `propietarios` INT NOT NULL,
  `año` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvehiculos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seguros`.`seguro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguros`.`seguro` (
  `idseguro` INT NOT NULL,
  `duis` INT(6) NOT NULL,
  `accidentes` INT NOT NULL,
  `score` DECIMAL(3) NOT NULL,
  `clientes_idcliente` INT NOT NULL,
  `vehiculos_idvehiculos` INT NOT NULL,
  PRIMARY KEY (`idseguro`),
  INDEX `fk_seguro_clientes_idx` (`clientes_idcliente` ASC) VISIBLE,
  INDEX `fk_seguro_vehiculos1_idx` (`vehiculos_idvehiculos` ASC) VISIBLE,
  CONSTRAINT `fk_seguro_clientes`
    FOREIGN KEY (`clientes_idcliente`)
    REFERENCES `seguros`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguro_vehiculos1`
    FOREIGN KEY (`vehiculos_idvehiculos`)
    REFERENCES `seguros`.`vehiculos` (`idvehiculos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
