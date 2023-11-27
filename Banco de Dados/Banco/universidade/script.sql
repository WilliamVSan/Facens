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
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `CPF` VARCHAR(11) NOT NULL,
  `Nome` VARCHAR(255) NOT NULL,
  `Nascimento` DATE NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculos` (
  `Veiculo` VARCHAR(255) NOT NULL,
  `Cor` VARCHAR(255) NOT NULL,
  `Placa` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Veiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`locacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`locacoes` (
  `CodLocacao` INT NOT NULL AUTO_INCREMENT,
  `Diaria` DECIMAL(10,2) NOT NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  `veiculos_Veiculo` VARCHAR(255) NOT NULL,
  `clientes_CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`CodLocacao`),
  INDEX `fk_locadoras_veiculos_idx` (`veiculos_Veiculo` ASC) VISIBLE,
  INDEX `fk_locadoras_clientes1_idx` (`clientes_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_locadoras_veiculos`
    FOREIGN KEY (`veiculos_Veiculo`)
    REFERENCES `mydb`.`veiculos` (`Veiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locadoras_clientes1`
    FOREIGN KEY (`clientes_CPF`)
    REFERENCES `mydb`.`clientes` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cursos` (
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `disciplina` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alunos` (
  `idAlunos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(125) NOT NULL,
  `ra` VARCHAR(12) NOT NULL,
  `email` VARCHAR(125) NOT NULL,
  `Cursos_idCursos` INT NOT NULL,
  PRIMARY KEY (`idAlunos`, `Cursos_idCursos`),
  INDEX `fk_Alunos_Cursos1_idx` (`Cursos_idCursos` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Cursos1`
    FOREIGN KEY (`Cursos_idCursos`)
    REFERENCES `mydb`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
