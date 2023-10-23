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
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `ra` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`id_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_professor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`curso` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `disciplina` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professor_has_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor_has_curso` (
  `professor_id_professor` INT NOT NULL,
  `curso_id_curso` INT NOT NULL,
  PRIMARY KEY (`professor_id_professor`, `curso_id_curso`),
  INDEX `fk_professor_has_curso_curso1_idx` (`curso_id_curso` ASC) VISIBLE,
  INDEX `fk_professor_has_curso_professor1_idx` (`professor_id_professor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_curso_professor1`
    FOREIGN KEY (`professor_id_professor`)
    REFERENCES `mydb`.`professor` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_curso_curso1`
    FOREIGN KEY (`curso_id_curso`)
    REFERENCES `mydb`.`curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aluno_has_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno_has_curso` (
  `aluno_id_aluno` INT NOT NULL,
  `curso_id_curso` INT NOT NULL,
  PRIMARY KEY (`aluno_id_aluno`, `curso_id_curso`),
  INDEX `fk_aluno_has_curso_curso1_idx` (`curso_id_curso` ASC) VISIBLE,
  INDEX `fk_aluno_has_curso_aluno1_idx` (`aluno_id_aluno` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_has_curso_aluno1`
    FOREIGN KEY (`aluno_id_aluno`)
    REFERENCES `mydb`.`aluno` (`id_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_curso_curso1`
    FOREIGN KEY (`curso_id_curso`)
    REFERENCES `mydb`.`curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

DELIMITER $
create procedure Insert_Curso(
disciplina varchar(100)
)
begin 
	insert into curso (disciplina) values (disciplina);
end $
DELIMITER;

DELIMITER $
create procedure Select_Cursos()
begin
	select * from curso;
end $
DELIMITER ;

call Insert_Curso ('Administração');
call Insert_Curso ('Artes');
call Insert_Curso ('Teatro');
call Insert_Curso  ('Game Design');
