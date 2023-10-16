-- Criando Banco de Dados
CREATE DATABASE Empresa;

-- Selecionando banco de dados
USE Empresa;

-- Tabela de produtos
CREATE TABLE produtos (
  prd_id INT NOT NULL AUTO_INCREMENT,
  prd_nome VARCHAR(50) NOT NULL,
  prd_qtd_estoque INT(11) NOT NULL,
  prd_estoque_mim INT(11) NOT NULL,
  prd_data_fabricacao TIMESTAMP NOT NULL,
  prd_perecivel TINYINT(1) NOT NULL,
  prd_valor DECIMAL(10,2) NOT NULL,
  marcas_mrc_id INT NOT NULL,
  PRIMARY KEY (prd_id),
  FOREIGN KEY (marcas_mrc_id) REFERENCES marcas (mrc_id)
);

-- Tabela de marcas
CREATE TABLE marcas (
  mrc_id INT NOT NULL AUTO_INCREMENT,
  mrc_nome VARCHAR(50) NOT NULL,
  mrc_nacionalidade VARCHAR(50) NOT NULL,
  PRIMARY KEY (mrc_id)
);

-- Tabela de fornecedores
CREATE TABLE fornecedores (
  frn_id INT NOT NULL AUTO_INCREMENT,
  frn_nome VARCHAR(50) NOT NULL,
  frn_email VARCHAR(50) NOT NULL,
  PRIMARY KEY (frn_id)
);

-- Tabela de produtos_has_fornecedores
CREATE TABLE produtos_has_fornecedores (
  produtos_prd_id INT NOT NULL,
  fornecedores_frn_id INT NOT NULL,
  PRIMARY KEY (produtos_prd_id, fornecedores_frn_id),
  FOREIGN KEY (produtos_prd_id) REFERENCES produtos (prd_id),
  FOREIGN KEY (fornecedores_frn_id) REFERENCES fornecedores (frn_id)
);

-- Populando a tabela marcas
INSERT INTO marcas (mrc_nome, mrc_nacionalidade) VALUES
('Marca A', 'País A'),
('Marca B', 'País B'),
('Marca C', 'País C');

-- Populando a tabela fornecedores
INSERT INTO fornecedores (frn_nome, frn_email) VALUES
('Fornecedor A', 'fornecedorA@exemplo.com'),
('Fornecedor B', 'fornecedorB@exemplo.com'),
('Fornecedor C', 'fornecedorC@exemplo.com');

-- Populando a tabela produtos
INSERT INTO produtos (prd_nome, prd_qtd_estoque, prd_estoque_mim, prd_data_fabricacao, prd_perecivel, prd_valor, marcas_mrc_id) VALUES
('Produto 1', 100, 50, '2023-10-01 10:00:00', 1, 25.00, 1),
('Produto 2', 150, 60, '2023-09-15 14:30:00', 0, 30.50, 2),
('Produto 3', 80, 40, '2023-08-20 12:00:00', 1, 15.00, 3);

-- Populando a tabela produtos_has_fornecedores
INSERT INTO produtos_has_fornecedores (produtos_prd_id, fornecedores_frn_id) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(3, 3);

-- Crie uma view que mostra todos os produtos e suas respectivas marcas
CREATE VIEW produtos_marcas_view AS
SELECT p.prd_id, p.prd_nome, m.mrc_nome
FROM produtos p
JOIN marcas m ON p.marcas_mrc_id = m.mrc_id;

SELECT * FROM produtos_marcas_view;

-- Crie uma view que mostra todos os produtos e seus respectivos fornecedores
CREATE VIEW produtos_fornecedores_view AS
SELECT p.prd_id, p.prd_nome, f.frn_nome
FROM produtos p
JOIN produtos_has_fornecedores pf ON p.prd_id = pf.produtos_prd_id
JOIN fornecedores f ON pf.fornecedores_frn_id = f.frn_id;

SELECT * FROM produtos_fornecedores_view;

-- Crie uma view que mostra todos os produtos e seus respectivos fornecedores e marcas
CREATE VIEW produtos_fornecedores_marcas_view AS
SELECT p.prd_id, p.prd_nome, m.mrc_nome, f.frn_nome
FROM produtos p
JOIN marcas m ON p.marcas_mrc_id = m.mrc_id
JOIN produtos_has_fornecedores pf ON p.prd_id = pf.produtos_prd_id
JOIN fornecedores f ON pf.fornecedores_frn_id = f.frn_id;

SELECT * FROM produtos_fornecedores_marcas_view;

-- Adicione o campo data de validade. Insira novos produtos com essa informação
CREATE VIEW produtos_estoque_baixo_view AS
SELECT *
FROM produtos
WHERE prd_qtd_estoque < prd_estoque_mim;

SELECT * FROM produtos_estoque_baixo_view;

-- Crie uma view que mostra todos os produtos e suas respectivas marcas com validade vencida
CREATE VIEW produtos_validade_vencida_view AS
SELECT p.prd_id, p.prd_nome, m.mrc_nome, p.prd_data_validade
FROM produtos p
JOIN marcas m ON p.marcas_mrc_id = m.mrc_id
WHERE p.prd_data_validade < CURDATE();

SELECT * FROM produtos_validade_vencida_view;

-- Selecionar os produtos com preço acima da média
CREATE VIEW produtos_preco_acima_media_view AS
SELECT *
FROM produtos
WHERE prd_valor > (SELECT AVG(prd_valor) FROM produtos);