-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Restaurante
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Restaurante
-- -----------------------------------------------------
DROP SCHEMA `Restaurante`;
CREATE SCHEMA IF NOT EXISTS `Restaurante` DEFAULT CHARACTER SET utf8 ;
USE `Restaurante` ;

-- -----------------------------------------------------
-- Table `Restaurante`.`Sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Sede` (
  `NIF` INT NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  `Nome_diretor` VARCHAR(50) NOT NULL,
  `Rua` VARCHAR(75) NOT NULL,
  `Codigo_postal` VARCHAR(20) NOT NULL,
  `Localidade` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`NIF`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Telefone_UNIQUE` (`Telefone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Restaurante` (
  `NIF` INT NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  `Nome_gerente` VARCHAR(50) NOT NULL,
  `Rua` VARCHAR(75) NOT NULL,
  `Codigo_postal` VARCHAR(20) NOT NULL,
  `Localidade` VARCHAR(50) NOT NULL,
  `Sede_NIF` INT NOT NULL,
  `Capacidade` INT NOT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `fk_Restaurante_Sede_idx` (`Sede_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurante_Sede`
    FOREIGN KEY (`Sede_NIF`)
    REFERENCES `Restaurante`.`Sede` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`ItemMenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`ItemMenu` (
  `Numero` INT NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Categoria` VARCHAR(20) NOT NULL,
  `Descricao` VARCHAR(200) NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  `Tipo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Fornecedor` (
  `NIF` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  `Tipo` VARCHAR(20) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Funcionario` (
  `Numero` INT NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Data_nascimento` DATE NOT NULL,
  `Função` VARCHAR(20) NOT NULL,
  `Restaurante_NIF` INT NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  `Nacionalidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Funcionario_Restaurante1_idx` (`Restaurante_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Restaurante1`
    FOREIGN KEY (`Restaurante_NIF`)
    REFERENCES `Restaurante`.`Restaurante` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Fatura` (
  `Numero` INT NOT NULL,
  `Preco_sem_IVA` DECIMAL(6,2) NOT NULL,
  `NIF_Cliente` INT NULL,
  `Nome_Cliente` VARCHAR(50) NULL,
  `IVA` DECIMAL(3,2) NOT NULL,
  `Funcionario_Numero` INT NOT NULL,
  `Tipo_Pagamento` VARCHAR(45) NOT NULL,
  `Data_Emissao` DATETIME NOT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Fatura_Funcionario1_idx` (`Funcionario_Numero` ASC) VISIBLE,
  UNIQUE INDEX `NIF_Cliente_UNIQUE` (`NIF_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Fatura_Funcionario1`
    FOREIGN KEY (`Funcionario_Numero`)
    REFERENCES `Restaurante`.`Funcionario` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Fatura_has_ItemMenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Fatura_has_ItemMenu` (
  `Fatura_Numero` INT NOT NULL,
  `ItemMenu_Numero` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Fatura_Numero`, `ItemMenu_Numero`),
  INDEX `fk_Fatura_has_ItemMenu_ItemMenu1_idx` (`ItemMenu_Numero` ASC) VISIBLE,
  INDEX `fk_Fatura_has_ItemMenu_Fatura1_idx` (`Fatura_Numero` ASC) VISIBLE,
  CONSTRAINT `fk_Fatura_has_ItemMenu_Fatura1`
    FOREIGN KEY (`Fatura_Numero`)
    REFERENCES `Restaurante`.`Fatura` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fatura_has_ItemMenu_ItemMenu1`
    FOREIGN KEY (`ItemMenu_Numero`)
    REFERENCES `Restaurante`.`ItemMenu` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Restaurante_has_Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Restaurante_has_Fornecedor` (
  `Restaurante_NIF` INT NOT NULL,
  `Fornecedor_NIF` INT NOT NULL,
  PRIMARY KEY (`Restaurante_NIF`, `Fornecedor_NIF`),
  INDEX `fk_Restaurante_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_NIF` ASC) VISIBLE,
  INDEX `fk_Restaurante_has_Fornecedor_Restaurante1_idx` (`Restaurante_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurante_has_Fornecedor_Restaurante1`
    FOREIGN KEY (`Restaurante_NIF`)
    REFERENCES `Restaurante`.`Restaurante` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurante_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_NIF`)
    REFERENCES `Restaurante`.`Fornecedor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurante`.`Restaurante_has_ItemMenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurante`.`Restaurante_has_ItemMenu` (
  `Restaurante_NIF` INT NOT NULL,
  `ItemMenu_Numero` INT NOT NULL,
  PRIMARY KEY (`Restaurante_NIF`, `ItemMenu_Numero`),
  INDEX `fk_Restaurante_has_ItemMenu_ItemMenu1_idx` (`ItemMenu_Numero` ASC) VISIBLE,
  INDEX `fk_Restaurante_has_ItemMenu_Restaurante1_idx` (`Restaurante_NIF` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurante_has_ItemMenu_Restaurante1`
    FOREIGN KEY (`Restaurante_NIF`)
    REFERENCES `Restaurante`.`Restaurante` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurante_has_ItemMenu_ItemMenu1`
    FOREIGN KEY (`ItemMenu_Numero`)
    REFERENCES `Restaurante`.`ItemMenu` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
