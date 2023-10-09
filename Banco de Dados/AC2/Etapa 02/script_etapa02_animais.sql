-- Criando Banco de Dados.
CREATE DATABASE Atividade02;

-- Selecionando o Banco de Dados.
USE Atividade02;

-- Criando tabela de espécies.
CREATE TABLE Especies(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(125)
);

-- Criando tabela de Animais.
CREATE TABLE Animais(
id INT AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(50) NOT NULL,
data_nasc  DATE, 
peso  DECIMAL(10,2),
id_especie INT NOT NULL,
FOREIGN KEY(id_especie) REFERENCES Especies(id)
);

-- Populando tabela de Espécies
INSERT INTO Especies VALUES(01, 'Ave','criaturas com penas, que voam e botam ovos.');
INSERT INTO Especies VALUES(02, 'Mamifero', 'Geralmente quadrupedes ou bipedes...');
INSERT INTO Especies VALUES(03, 'Réptel', 'Tem escamas, tem sangue frio, estranhamente fofo??');

-- Populando tabela de Animais
INSERT INTO Animais VALUES(01, 'Pica-pau', '2022-08-23', 0.2, 01);
INSERT INTO Animais VALUES(02, 'Papagaio', '2011-07-03', 0.3, 01);
INSERT INTO Animais VALUES(03, 'Pinguim', '2008-05-17', 4.7, 01);
INSERT INTO Animais VALUES(04, 'Arara', '2021-06-24', 0.2, 01);
INSERT INTO Animais VALUES(05, 'Cachorro', '2013-04-29', 11.9, 02);
INSERT INTO Animais VALUES(06, 'Vaca', '2009-01-11', 220.3, 02);
INSERT INTO Animais VALUES(07, 'Iguana', '2018-03-22', 1.7, 03);
INSERT INTO Animais VALUES(08, 'Jacaré', '2001-01-09', 180.8, 03);