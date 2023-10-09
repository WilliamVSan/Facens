-- Criando Banco de Dados.
CREATE DATABASE Atividade02;

-- Selecionando o Banco de Dados.
USE Atividade02;

-- Criando tabela de Marcas.
CREATE TABLE Marcas(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
site_oficial VARCHAR(125),
telefone VARCHAR(16)
);

-- Criando tabela de Produtos.
CREATE TABLE Produtos(
id INT AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(50) NOT NULL,
data_de_validade DATE, 
preco_de_custo DECIMAL(10,2),
preco_de_venda DECIMAL(10,2),
id_marca INT NOT NULL,
FOREIGN KEY(id_marca) REFERENCES Marcas(id)
);

-- Populando tabela de Mrcas
INSERT INTO Marcas (nome, site_oficial, telefone) VALUES
('Nike', 'https://www.nike.com/', '0800-055-5555'),
('Adidas', 'https://www.adidas.com.br/', '0800-551-5515'),
('Puma', 'https://www.puma.com.br/', '0800-704-5544');

-- Populando tabela de Produtos
INSERT INTO Produtos (nome, data_de_validade, preco_de_custo, preco_de_venda, id_marca) VALUES
('Tênis Nike Air Max 90', '2025-07-01', 500.00, 750.00, 1),
('Tênis Adidas Superstar', '2025-08-01', 400.00, 600.00, 2),
('Tênis Puma Suede', '2025-09-01', 300.00, 450.00, 3),
('Camisa Nike Jordan', '2025-10-01', 200.00, 300.00, 1),
('Calça Adidas Tiro', '2025-11-01', 150.00, 225.00, 2),
('Boné Puma Trucker', '2025-12-01', 100.00, 150.00, 3),
('Tenis Nike Air Jordan 1', '2026-01-01', 600.00, 900.00, 1),
('Tênis Adidas NMD', '2026-02-01', 500.00, 750.00, 2);