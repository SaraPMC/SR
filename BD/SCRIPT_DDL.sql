-- MySQL Script generated by MySQL Workbench
-- Sun May 22 22:04:36 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DINDINAGORA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DINDINAGORA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DINDINAGORA` DEFAULT CHARACTER SET utf8 ;
USE `DINDINAGORA` ;

-- -----------------------------------------------------
-- Table `DINDINAGORA`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DINDINAGORA`.`CLIENTE` (
  `ID` INT NOT NULL,
  `NOME` VARCHAR(100) NOT NULL,
  `TIPO_PESSOA` VARCHAR(1) NOT NULL COMMENT '(F)ÍSICA / (J)URÍDICA',
  `DOCUMENTO` VARCHAR(14) NOT NULL,
  `DATA_NASCIMENTO` DATETIME NULL,
  `TELEFONE` BIGINT NULL,
  `CELULAR` BIGINT NULL,
  `EMAIL` VARCHAR(100) NULL,
  `STATUS` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DINDINAGORA`.`ENDERECO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DINDINAGORA`.`ENDERECO` (
  `ID` INT NOT NULL,
  `ID_CLIENTE` INT NOT NULL,
  `LOGRADOURO` VARCHAR(100) NOT NULL,
  `NUMERO` INT NOT NULL,
  `COMPLEMENTO` VARCHAR(45) NULL,
  `BAIRRO` VARCHAR(100) NOT NULL,
  `CIDADE` VARCHAR(100) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `CEP` INT NOT NULL,
  `OBSERVACAO` VARCHAR(100) NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_CLIENTE_idx` (`ID_CLIENTE` ASC) VISIBLE,
  CONSTRAINT `ID_CLIENTE`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `DINDINAGORA`.`CLIENTE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DINDINAGORA`.`PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DINDINAGORA`.`PRODUTO` (
  `ID` INT NOT NULL,
  `TIPO` VARCHAR(45) NOT NULL,
  `DESCRICAO` VARCHAR(100) NOT NULL,
  `VALOR` DECIMAL NOT NULL,
  `STATUS` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DINDINAGORA`.`TRANSACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DINDINAGORA`.`TRANSACAO` (
  `ID` INT NOT NULL,
  `ID_CLIENTE` INT NULL,
  `ID_PRODUTO` INT NULL COMMENT 'PODE SER NULO... SERÁ PREENCHIDO APENAS QUANDO ENTRAR CREDITO DEVIDO A UM NOVO PEDIDO...',
  `TIPO_TRANSACAO` VARCHAR(10) NULL,
  `TIPO_CD` VARCHAR(1) NULL COMMENT '(C)RÉDITO / (D)ÉBITO',
  `VALOR` DECIMAL NULL,
  `DATA` DATETIME NULL DEFAULT SYSDATE,
  `STATUS` VARCHAR(10) NULL,
  `ORIGEM` VARCHAR(100) NULL,
  `DESTINO` VARCHAR(100) NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_PRODUTO_idx` (`ID_PRODUTO` ASC) VISIBLE,
  INDEX `ID_CLIENTE_idx` (`ID_CLIENTE` ASC) VISIBLE,
  CONSTRAINT `ID_PRODUTO`
    FOREIGN KEY (`ID_PRODUTO`)
    REFERENCES `DINDINAGORA`.`PRODUTO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ID_CLIENTE`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `DINDINAGORA`.`CLIENTE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DINDINAGORA`.`SIMILARIDADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DINDINAGORA`.`SIMILARIDADE` (
  `ID` INT NOT NULL,
  `ID_CLIENTE_ORIGEM` INT NULL,
  `ID_CLIENTE_DESTINO` INT NULL,
  `SIMILARIDADE` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_CLIENTE_ORIGEM_idx` (`ID_CLIENTE_ORIGEM` ASC) VISIBLE,
  INDEX `FK_CLIENTE_DESTINO_idx` (`ID_CLIENTE_DESTINO` ASC) VISIBLE,
  CONSTRAINT `FK_CLIENTE_ORIGEM`
    FOREIGN KEY (`ID_CLIENTE_ORIGEM`)
    REFERENCES `DINDINAGORA`.`CLIENTE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CLIENTE_DESTINO`
    FOREIGN KEY (`ID_CLIENTE_DESTINO`)
    REFERENCES `DINDINAGORA`.`CLIENTE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;