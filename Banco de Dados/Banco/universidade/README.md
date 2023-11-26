# Atividade individual - Tema: Sistema Universidade (FUNCTIONS)

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

### Etapa 1

CONFORME A AULA 11 SIGA OS ITENS ABAIXO PARA REALIZAÇÃO DA ATIVIDADE:

- Crie um banco de dados para armazenar alunos e cursos de uma universidade;
- Cada curso pode pertencer a somente uma área;

- 1. Utilize Stored Procedures para automatizar a inserção e seleção dos cursos;

```SQL
delimiter $
create procedure insert_cursos(
disciplina varchar(100)
)
begin
    insert into cursos (disciplina) values (disciplina);
end$
delimiter ;
```

Seleção de cursos:

```SQL
delimiter $
create procedure consulta_cursos()
begin
    select *
    from Cursos;
end$
delimiter ;
```

![Seleção](https://github.com/WilliamVSan/Facens/assets/86013044/0b7a3a2d-b183-4eb5-92a5-b4ac4d824f4c)

- 2. O aluno possui um e-mail que deve ter seu endereço gerado automaticamente no seguinte formato: nome.sobrenome@dominio.com

```SQL
DELIMITER $

CREATE TRIGGER gerar_email_aluno
BEFORE INSERT ON Alunos
FOR EACH ROW
BEGIN
  SET NEW.email = CONCAT(NEW.nome, '.', NEW.sobrenome, '@dominio.com');
END$

DELIMITER ;
```
Email:

![email](https://github.com/WilliamVSan/Facens/assets/86013044/f535a257-8ccf-4af7-9c2a-479f76e57afc)

- 3. Crie uma rotina que recebe os dados de um novo curso e o insere no banco de dados;

```SQL
DELIMITER $

CREATE PROCEDURE inserir_curso(
  IN p_disciplina VARCHAR(100)
)
BEGIN
  INSERT INTO Cursos (disciplina) VALUES (p_disciplina);
END;

$

DELIMITER ;
```

- 4. Crie uma função que recebe o nome de um curso e sua área, em seguida retorna o id do curso;

```SQL
DELIMITER $

CREATE FUNCTION obter_id_curso(
  p_nome_curso VARCHAR(100),
  p_area_curso VARCHAR(100)
)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE curso_id INT;
  
  SELECT idCursos INTO curso_id
  FROM Cursos
  WHERE disciplina = p_nome_curso AND area = p_area_curso;
  
  RETURN curso_id;
END;
$

DELIMITER ;
```

- 4. Crie uma procedure que recebe os dados do aluno e de um curso e faz sua matrícula;

```SQL
DELIMITER $

CREATE PROCEDURE matricular_aluno(
  IN p_nome_aluno VARCHAR(100),
  IN p_ra_aluno VARCHAR(100),
  IN p_email_aluno VARCHAR(100),
  IN p_nome_curso VARCHAR(100)
)
BEGIN
  DECLARE curso_id INT;

  -- Obtém o ID do curso com base no nome do curso
  SELECT idCursos INTO curso_id
  FROM Cursos
  WHERE disciplina = p_nome_curso;

  -- Insere o aluno na tabela Alunos
  INSERT INTO Alunos (nome, ra, email, Cursos_idCursos)
  VALUES (p_nome_aluno, p_ra_aluno, p_email_aluno, curso_id);
END;

$

DELIMITER ;
```

- 5. Caso o aluno já esteja matriculado em um curso, essa matrícula não pode ser realizada;

```SQL
DELIMITER $

CREATE PROCEDURE matricular_aluno(
  IN p_nome_aluno VARCHAR(100),
  IN p_ra_aluno VARCHAR(100),
  IN p_email_aluno VARCHAR(100),
  IN p_nome_curso VARCHAR(100)
)
BEGIN
  DECLARE curso_id INT;

  -- Obtém o ID do curso com base no nome do curso
  SELECT idCursos INTO curso_id
  FROM Cursos
  WHERE disciplina = p_nome_curso;

  -- Verifica se o aluno já está matriculado no curso
  IF EXISTS (SELECT 1 FROM Alunos WHERE ra = p_ra_aluno AND Cursos_idCursos = curso_id) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Aluno já matriculado neste curso.';
  ELSE
    -- Insere o aluno na tabela Alunos
    INSERT INTO Alunos (nome, ra, email, Cursos_idCursos)
    VALUES (p_nome_aluno, p_ra_aluno, p_email_aluno, curso_id);
  END IF;
END;

$

DELIMITER ;
```

- 6. Crie o modelo lógico do exercício.

```SQL
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Faculdade
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Faculdade
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Faculdade` DEFAULT CHARACTER SET utf8 ;
USE `Faculdade` ;

-- -----------------------------------------------------
-- Table `Faculdade`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`Cursos` (
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `disciplina` VARCHAR(100) NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Faculdade`.`Alunos` (
  `idAlunos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `sobrenome` VARCHAR(100) NULL,
  `ra` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `Cursos_idCursos` INT NOT NULL,
  PRIMARY KEY (`idAlunos`, `Cursos_idCursos`),
  INDEX `fk_Alunos_Cursos_idx` (`Cursos_idCursos` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Cursos`
    FOREIGN KEY (`Cursos_idCursos`)
    REFERENCES `Faculdade`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
```

![Modelo](https://github.com/WilliamVSan/Facens/assets/86013044/2ee103d4-9a85-4050-a904-a463ba8f725e)


