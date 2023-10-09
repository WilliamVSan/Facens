-- Criando Banco de Dados.
CREATE DATABASE Atividade02;

-- Selecionando o Banco de Dados.
USE Atividade02;

-- Criando tabela de Cidades
CREATE TABLE Cidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    populacao INT
);

-- Criando tabela de Alunos
CREATE TABLE Alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    data_nasc DATE,
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES Cidades(id)
);

-- Selecionando todos os dados da tabela Alunos e utilizando Inner Join para unir a tabela de Cidades.
SELECT * FROM Alunos INNER JOIN Cidades ON cidades.id = alunos.cidade_id;