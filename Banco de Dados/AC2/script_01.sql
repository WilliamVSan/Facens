-- Criando banco de dados.
CREATE DATABASE Atividade01;

-- Selecionando banco de dados.
USE Atividade01;

-- Criando tabela de produtos.
CREATE TABLE Produtos (
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
preco DECIMAL(10, 2) NOT NULL,
estoque INT NOT NULL,
perecivel CHAR NOT NULL,
marca VARCHAR(16),
nacionalidade VARCHAR(16)
);

-- Populando a tabela de Produtos.
INSERT INTO Produtos VALUES(01, "Creme Nutella 650g", 42.80, 98, 'S', "Nutella", "Brazilian");
INSERT INTO Produtos VALUES(02, "Detergente para lava-louças", 36.59, 51, 'S', "Unik", "Brazilian");
INSERT INTO Produtos VALUES(03, "Kit Sabonete hidratante em barra", 24.99, 34, 'S', "Dove", "Brazilian");
INSERT INTO Produtos VALUES(04, "Azeite de Oliva Extra Virgem", 29.50, 87, 'S', "Andorinha", "Brazilian");
INSERT INTO Produtos VALUES(05, "Sabão em Pó Profissional", 80.09, 57, 'S', "Omo", "Brazilian");

-- Total de produtos cadastrados
SELECT COUNT(id_produto) AS total FROM Produtos;

-- Selecionando preço médio dos produtos.
SELECT FORMAT(AVG(preco), 2) AS preco_medio FROM Produtos;

-- Selecionando a média dos preços dos produtos em 2 grupos: perecíveis e não perecíveis
SELECT perecivel, FORMAT(AVG(preco), 2) AS preco_medio FROM Produtos GROUP BY perecivel;

-- Selecionando a média dos preços dos produtos agrupados pelo nome do produto
SELECT nome, FORMAT(AVG(preco), 2) AS preco_medio FROM Produtos GROUP BY nome;

-- Selecionando a média dos preços e total em estoque dos produtos
SELECT FORMAT(AVG(preco), 2) AS preco_medio, SUM(estoque) AS total_estoque FROM Produtos;

-- Selecionando o nome, marca e quantidade em estoque do produto mais caro
SELECT nome, marca, estoque FROM Produtos WHERE preco = (SELECT MAX(preco) FROM Produtos);

-- Selecionando os produtos com preço acima da média
SELECT * FROM produtos HAVING preco > (SELECT AVG(preco) FROM Produtos);

-- Selecionando a quantidade de produtos de cada nacionalidade
SELECT nacionalidade, SUM(estoque) FROM produtos GROUP BY nacionalidade;