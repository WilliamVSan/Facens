# Facens - Stored Procedures

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

## Etapa 1

1. **Crie um banco de dados para armazenar alunos, cursos e professores de uma
universidade**;

Criando Banco de Dados:

```SQL
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
```

Criando Tabela de Alunos:

```SQL
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `ra` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`id_aluno`))
ENGINE = InnoDB;
```

Criando Tabela de Cursos:

```SQL
CREATE TABLE IF NOT EXISTS `mydb`.`curso` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `disciplina` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;
```

Criando tabela de Professores

```SQL
CREATE TABLE IF NOT EXISTS `mydb`.`professor` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_professor`))
ENGINE = InnoDB;
```

Tabelas de Relacionamentos:

```SQL
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
```

2. **Faça a modelagem do banco e identifique as entidades, seus atributos e relacionamentos**;

![Modelo do Banco](https://github.com/WilliamVSan/Facens/assets/86013044/f2c3c80a-c762-4267-aa49-0f693e4868f2)

3. **Crie o modelo físico do banco de dados (script SQL)**;

O Script pode ser acessado pelo seguinte [**LINK**](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Stored%20Procedures/stored_procedures.sql)

![Tabelas](https://github.com/WilliamVSan/Facens/assets/86013044/f5581314-bd96-4482-a8b2-5dd6d23cd90d)

4. **Utilize Stored Procedures para automatizar a inserção e seleção dos cursos**;
   
  O aluno possui um email que deve ter seu endereço gerado automaticamente no seguinte formato:
  nome.sobrenome@dominio.com
  Como fica o email se duas pessoas tiverem o mesmo nome e sobrenome?

A. Inserção

```SQL
DELIMITER $
create procedure Insert_Curso(
disciplina varchar(100)
)
begin 
	insert into curso (disciplina) values (disciplina);
end $
DELIMITER;
```

B. Seleção

```SQL
DELIMITER $
create procedure Select_Cursos()
begin
	select * from curso;
end $
DELIMITER ;
```

5. **Tratamento de E-mails**;

```SQL
DELIMITER $$
CREATE TRIGGER GenerateEmail
BEFORE INSERT ON mydb.aluno
FOR EACH ROW
BEGIN
  DECLARE email_count INT;
  SET email_count = 0;
  
  -- Verifique se já existe um e-mail com o mesmo nome e sobrenome
  SELECT COUNT(*) INTO email_count FROM Aula10.aluno WHERE email = CONCAT(NEW.nome, '.', NEW.sobrenome, '@dominio.com');
  
  -- Se houver um conflito, adicione um número incremental ao e-mail
  IF email_count > 0 THEN
    SET NEW.email = CONCAT(NEW.nome, '.', NEW.sobrenome, email_count, '@dominio.com');
  ELSE
    SET NEW.email = CONCAT(NEW.nome, '.', NEW.sobrenome, '@dominio.com');
  END IF;
END;
$$
DELIMITER ;
```

## Critérios de Avaliação

[Script](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Alunos%20e%20Cidades/script_cidades.sql](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Stored%20Procedures/stored_procedures.sql)https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Stored%20Procedures/stored_procedures.sql)

[Model](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Stored%20Procedures/stored_model.mwb)

![MySQL](https://github.com/WilliamVSan/Facens/assets/86013044/7e396c8b-cbab-4beb-9c72-82fb586e0c53)

)
