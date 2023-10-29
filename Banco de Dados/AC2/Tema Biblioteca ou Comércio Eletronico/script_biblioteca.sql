-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`editoras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`editoras` (
  `editora_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `endereco` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`editora_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`autores` (
  `autor_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `data_nasc` DATETIME NULL,
  `nacionalidade` VARCHAR(16) NULL,
  PRIMARY KEY (`autor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`clientes` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `endereco_de_entrega` VARCHAR(125) NULL,
  `infromacoes_contato` VARCHAR(125) NULL,
  PRIMARY KEY (`cliente_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`emprestimos` (
  `emprestimo_id` INT NOT NULL AUTO_INCREMENT,
  `data_de_emprestimo` DATETIME NULL,
  `data_de_devolucao` DATETIME NULL,
  `status` VARCHAR(8) NOT NULL,
  `clientes_cliente_id` INT NOT NULL,
  PRIMARY KEY (`emprestimo_id`, `clientes_cliente_id`),
  INDEX `fk_emprestimos_clientes1_idx` (`clientes_cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_emprestimos_clientes1`
    FOREIGN KEY (`clientes_cliente_id`)
    REFERENCES `biblioteca`.`clientes` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`livros` (
  `livro_id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(60) NOT NULL,
  `ISBN` VARCHAR(16) NOT NULL,
  `identificador_exclusivo` VARCHAR(16) NOT NULL,
  `ano_de_publicacao` DATETIME NULL,
  `autores_autor_id` INT NOT NULL,
  `editoras_editora_id` INT NOT NULL,
  `emprestimos_emprestimo_id` INT NOT NULL,
  PRIMARY KEY (`livro_id`, `autores_autor_id`, `editoras_editora_id`, `emprestimos_emprestimo_id`),
  INDEX `fk_livros_autores_idx` (`autores_autor_id` ASC) VISIBLE,
  INDEX `fk_livros_editoras1_idx` (`editoras_editora_id` ASC) VISIBLE,
  INDEX `fk_livros_emprestimos1_idx` (`emprestimos_emprestimo_id` ASC) VISIBLE,
  CONSTRAINT `fk_livros_autores`
    FOREIGN KEY (`autores_autor_id`)
    REFERENCES `biblioteca`.`autores` (`autor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livros_editoras1`
    FOREIGN KEY (`editoras_editora_id`)
    REFERENCES `biblioteca`.`editoras` (`editora_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livros_emprestimos1`
    FOREIGN KEY (`emprestimos_emprestimo_id`)
    REFERENCES `biblioteca`.`emprestimos` (`emprestimo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Populando a tabela `editoras`
INSERT INTO `editoras` (nome, endereco) VALUES
('Editora A', 'Rua da Editora A, 123'),
('Editora B', 'Avenida da Editora B, 456'),
('Editora C', 'Travessa da Editora C, 789');

-- Populando a tabela `autores`
INSERT INTO `autores` (nome, data_nasc, nacionalidade) VALUES
('Autor A', '1980-01-01', 'Brasileiro'),
('Autor B', '1975-05-05', 'Espanhol'),
('Autor C', '1990-12-12', 'Francês');

-- Populando a tabela `clientes`
INSERT INTO `clientes` (nome, endereco_de_entrega, infromacoes_contato) VALUES
('Cliente A', 'Rua do Cliente A, 111', 'clienteA@email.com'),
('Cliente B', 'Avenida do Cliente B, 222', 'clienteB@email.com'),
('Cliente C', 'Travessa do Cliente C, 333', 'clienteC@email.com');

-- Populando a tabela `emprestimos`
INSERT INTO `emprestimos` (data_de_emprestimo, data_de_devolucao, status, clientes_cliente_id) VALUES
('2023-10-15', '2023-11-15', 'ativo', 1),
('2023-10-20', '2023-11-20', 'ativo', 2),
('2023-10-25', '2023-11-25', 'ativo', 3);

-- Inserindo empréstimo disponível
INSERT INTO `emprestimos` (data_de_emprestimo, data_de_devolucao, status, clientes_cliente_id) VALUES ('2023-10-26', '2023-11-26', 'ativo', 4);

-- Populando a tabela `livros`
INSERT INTO `livros` (titulo, ISBN, identificador_exclusivo, ano_de_publicacao, autores_autor_id, editoras_editora_id, emprestimos_emprestimo_id) VALUES
('Livro A', '1234567890123', 'ABC123', '2020-01-01', 1, 1, 1),
('Livro B', '2345678901234', 'DEF456', '2015-01-01', 2, 2, 2),
('Livro C', '3456789012345', 'GHI789', '2018-01-01', 3, 3, 3);

-- Inserindo livro disnonível
INSERT INTO livros (livro_id, titulo, ISBN, identificador_exclusivo, ano_de_publicacao, autores_autor_id, editoras_editora_id) 
VALUES (4, 'Livro D', '4567890123456', 'JKL012', '2022-01-01', 2, 2);

CREATE VIEW livros_disponiveis AS
SELECT l.livro_id, l.titulo, l.ISBN, l.identificador_exclusivo, l.ano_de_publicacao, a.nome as nome_autor, e.nome as nome_editora
FROM livros l
JOIN autores a ON l.autores_autor_id = a.autor_id
JOIN editoras e ON l.editoras_editora_id = e.editora_id
WHERE l.livro_id NOT IN (SELECT livro_id FROM emprestimos);

SELECT * FROM livros_disponiveis;

CREATE VIEW lista_emprestimos AS
SELECT e.emprestimo_id, e.data_de_emprestimo, e.data_de_devolucao, e.status, c.nome as nome_cliente, l.titulo as titulo_livro
FROM emprestimos e
JOIN clientes c ON e.clientes_cliente_id = c.cliente_id
JOIN livros l ON e.emprestimo_id = l.livro_id;

SELECT * FROM lista_emprestimos;

DELIMITER //

CREATE PROCEDURE registrar_emprestimo(IN cliente_id INT, IN livro_id INT, IN data_emprestimo DATE, IN data_devolucao DATE)
BEGIN
    DECLARE disponivel INT;
    SELECT COUNT(*) INTO disponivel
    FROM livros
    WHERE livro_id = livro_id
    AND livro_id NOT IN (SELECT livro_id FROM emprestimos);

    IF disponivel = 1 THEN
        INSERT INTO emprestimos (data_de_emprestimo, data_de_devolucao, status, clientes_cliente_id)
        VALUES (data_emprestimo, data_devolucao, 'ativo', cliente_id);

        UPDATE livros
        SET emprestimos_emprestimo_id = LAST_INSERT_ID()
        WHERE livro_id = livro_id;

        SELECT 'Empréstimo registrado com sucesso' AS Result;
    ELSE
        SELECT 'Livro não disponível para empréstimo' AS Result;
    END IF;
END//

DELIMITER ;

CALL registrar_emprestimo(1, 4, '2023-10-28', '2023-11-28');

DELIMITER //

CREATE PROCEDURE livros_emprestados_por_cliente(IN cliente_id INT)
BEGIN
    SELECT l.titulo, e.data_de_emprestimo, e.data_de_devolucao, e.status
    FROM emprestimos e
    JOIN livros l ON e.emprestimo_id = l.livro_id
    WHERE e.clientes_cliente_id = cliente_id;
END//

DELIMITER ;

CALL livros_emprestados_por_cliente(1);

DELIMITER //

CREATE PROCEDURE calcular_multa()
BEGIN
    DECLARE multa DECIMAL(10, 2);
    DECLARE dias_atraso INT;

    SELECT DATEDIFF(CURDATE(), data_de_devolucao) INTO dias_atraso
    FROM emprestimos
    WHERE data_de_devolucao < CURDATE();

    IF dias_atraso > 0 THEN
        SET multa = dias_atraso * 0.50; -- Altere o valor da multa conforme necessário
        SELECT CONCAT('Multa para empréstimo atrasado de ', dias_atraso, ' dias é de R$', multa) AS Result;
    ELSE
        SELECT 'Não há multas pendentes' AS Result;
    END IF;
END//

DELIMITER ;

CALL calcular_multa();
