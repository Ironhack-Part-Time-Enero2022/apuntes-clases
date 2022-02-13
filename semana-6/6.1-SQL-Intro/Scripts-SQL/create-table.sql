-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches` DEFAULT CHARACTER SET utf8 ;
USE `coches` ;

-- -----------------------------------------------------
-- Table `coches`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`clientes` (
  `idclientes` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `provincia` VARCHAR(45) NULL,
  `telefono` INT(9) NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`vendedor` (
  `idvendedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `sucursal` VARCHAR(45) NOT NULL,
  `incorporacion` DATE NOT NULL,
  PRIMARY KEY (`idvendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`fecha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`fecha` (
  `idfecha` INT NOT NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`idfecha`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`factura` (
  `idfactura` INT NOT NULL,
  `total` VARCHAR(45) NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  `fecha_idfecha` INT NOT NULL,
  `vendedor_idvendedor` INT NOT NULL,
  PRIMARY KEY (`idfactura`),
  INDEX `fk_factura_clientes_idx` (`clientes_idclientes` ASC) VISIBLE,
  INDEX `fk_factura_fecha1_idx` (`fecha_idfecha` ASC) VISIBLE,
  INDEX `fk_factura_vendedor1_idx` (`vendedor_idvendedor` ASC) VISIBLE,
  CONSTRAINT `fk_factura_clientes`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `coches`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_fecha1`
    FOREIGN KEY (`fecha_idfecha`)
    REFERENCES `coches`.`fecha` (`idfecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_vendedor1`
    FOREIGN KEY (`vendedor_idvendedor`)
    REFERENCES `coches`.`vendedor` (`idvendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`producto` (
  `idproducto` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `factura_idfactura` INT NOT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `fk_producto_factura1_idx` (`factura_idfactura` ASC) VISIBLE,
  CONSTRAINT `fk_producto_factura1`
    FOREIGN KEY (`factura_idfactura`)
    REFERENCES `coches`.`factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
