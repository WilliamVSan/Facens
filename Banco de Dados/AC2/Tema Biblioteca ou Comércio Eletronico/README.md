# Tema: Biblioteca ou Comércio Eletrônico

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

## Etapa 1

BIBLIOTECA

Você foi designado para criar um sistema de biblioteca. Aqui estão os detalhes adicionais:

**Tabelas:**
Livros: Armazene informações sobre cada livro, incluindo título, ISBN, ano de publicação e um identificador exclusivo.

```SQL
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

```

Autores: Registre informações sobre os autores, como nome, data de nascimento e nacionalidade.

```SQL
CREATE TABLE IF NOT EXISTS `biblioteca`.`autores` (
  `autor_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `data_nasc` DATETIME NULL,
  `nacionalidade` VARCHAR(16) NULL,
  PRIMARY KEY (`autor_id`))
ENGINE = InnoDB;
```

Editoras: Mantenha detalhes sobre as editoras, como nome e endereço.

```SQL
CREATE TABLE IF NOT EXISTS `biblioteca`.`editoras` (
  `editora_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `endereco` VARCHAR(125) NOT NULL,
  PRIMARY KEY (`editora_id`))
ENGINE = InnoDB;
```

Empréstimos: Controle os empréstimos de livros, incluindo a data de empréstimo e de devolução, bem como o status do empréstimo (pendente, devolvido, atrasado).

```SQL
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
```

**Stored Procedures:**

Crie uma stored procedure para registrar um novo empréstimo, verificando a disponibilidade do livro e atualizando o estoque.

```SQL
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
```

Crie outra stored procedure para recuperar a lista de livros emprestados por um cliente específico.

```SQL
DELIMITER //

CREATE PROCEDURE livros_emprestados_por_cliente(IN cliente_id INT)
BEGIN
    SELECT l.titulo, e.data_de_emprestimo, e.data_de_devolucao, e.status
    FROM emprestimos e
    JOIN livros l ON e.emprestimo_id = l.livro_id
    WHERE e.clientes_cliente_id = cliente_id;
END//

DELIMITER ;
```

Implemente uma stored procedure que calcule multas para empréstimos atrasados.

```SQL
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
```

**Views:**

Crie uma view que mostre os livros disponíveis para empréstimo, excluindo aqueles que já foram emprestados.

```SQL
CREATE VIEW livros_disponiveis AS
SELECT l.livro_id, l.titulo, l.ISBN, l.identificador_exclusivo, l.ano_de_publicacao, a.nome as nome_autor, e.nome as nome_editora
FROM livros l
JOIN autores a ON l.autores_autor_id = a.autor_id
JOIN editoras e ON l.editoras_editora_id = e.editora_id
WHERE l.livro_id NOT IN (SELECT livro_id FROM emprestimos);
```

Implemente uma view que forneça uma lista de todos os empréstimos atuais, incluindo os detalhes dos livros emprestados e dos clientes.

```SQL
CREATE VIEW lista_emprestimos AS
SELECT e.emprestimo_id, e.data_de_emprestimo, e.data_de_devolucao, e.status, c.nome as nome_cliente, l.titulo as titulo_livro
FROM emprestimos e
JOIN clientes c ON e.clientes_cliente_id = c.cliente_id
JOIN livros l ON e.emprestimo_id = l.livro_id;
```

## Critérios do Exercício

[**Link**](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Tema%20Biblioteca%20ou%20Com%C3%A9rcio%20Eletronico/script_biblioteca.sql) para o Script da atividade.

- Ao término do projeto, crie um repositório remoto e envie todo projeto;
- O exercício é individual e sua entrega é para o 30/10/23 até as 23:00h;
- Envie somente o link de acesso ao repositório;
- Para a criação do readme.md siga o modelo disponibilizado em aula;
- Inclua uma imagem do modelo lógico criado no Workbench;
- Insira no mínimo 20 dados em cada tabela criada para o exercício;
- Os alunos com final do número impar no RA ficaram com o exercício da biblioteca, os demais ficaram com o exercício do correio eletrônico;
- Este exercício faz parte das atividades complementares 2;
- Caso tenha dúvidas entre em contato pelo e-mail daniel.ohata@facens.br

**Imagens:**

![image](https://github.com/WilliamVSan/Facens/assets/86013044/8cc41895-7122-4dd3-80a2-e113505bf02f)
