-- Criando Banco de Dados.
CREATE DATABASE Atividade02;

-- Selecionando o Banco de Dados.
USE Atividade02;

-- Criando tabela de Animais.
CREATE  TABLE Animais(
id    INT, 
nome  VARCHAR(50),
nasc  DATE, 
peso  DECIMAL(10,2),
cor   VARCHAR(50)
);

-- Populando a tabela de Animais
INSERT INTO Animais VALUES (01, 'Ágata', DATE '2015-04-09', 13.9, 'branco');
INSERT INTO Animais VALUES (02, 'Félix', DATE '2016-06-06', 14.3, 'preto');
INSERT INTO Animais VALUES (03, 'Tom', DATE '2013-02-08', 11.2, 'azul');
INSERT INTO Animais VALUES (04, 'Garfield', DATE '2015-07-06', 17.1, 'laranja');
INSERT INTO Animais VALUES (05, 'Frajola', DATE '2013-08-01', 13.7, 'preto');
INSERT INTO Animais VALUES (06, 'Manda-chuva', DATE '2012-02-03', 12.3, 'amarelo');
INSERT INTO Animais VALUES (07, 'Snowball', DATE '2014-04-06', 13.2, 'preto');
INSERT INTO Animais VALUES (10, 'Agata', DATE '2015-08-03', 11.9, 'azul');
INSERT INTO Animais VALUES (11, 'Gato de Botas', DATE '2012-12-10', 11.6, 'amarelo');
INSERT INTO Animais VALUES (12, 'Kitty', DATE '2020-04-06', 11.6, 'amarelo');
INSERT INTO Animais VALUES (13, 'Milu', DATE '2012-01-03', 12.3, 'amarelo');
INSERT INTO Animais VALUES (14, 'Pluto', DATE '2013-02-04', 17.9, 'branco');
INSERT INTO Animais VALUES (15, 'Pateta', DATE '2015-05-01', 17.7, 'preto');
INSERT INTO Animais VALUES (16, 'Snoopy', DATE '2013-07-02', 18.2, 'branco');
INSERT INTO Animais VALUES (17, 'Rex', DATE '2019-11-03', 19.7, 'bege');
INSERT INTO Animais VALUES (20, 'Bidu', DATE '2012-09-08', 12.4, 'azul');
INSERT INTO Animais VALUES (21, 'Dum Dum', DATE '2015-04-06', 11.2, 'laranja');
INSERT INTO Animais VALUES (22, 'Muttley', DATE '2011-02-03', 14.3, 'laranja');
INSERT INTO Animais VALUES (23, 'Scooby', DATE '2012-01-02', 19.9, 'marrom');
INSERT INTO Animais VALUES (24, 'Rufus', DATE '2014-04-05', 19.7, 'branco');
INSERT INTO Animais VALUES (25, 'Rex', DATE '2021-08-19', 19.7, 'branco');

INSERT INTO Animais VALUES(26, 'Pateta', DATE '2011-01-02', 17.1, 'preto');

-- Altere o nome do Pateta para Goofy
UPDATE Animais SET nome = 'Goofy' WHERE nome = 'Pateta';
-- Altere o peso do Garfield para 10 quilogramas
UPDATE Animais SET peso = 10 WHERE nome = 'Garfield';
-- Altere a cor de todos os gatos para laranja
UPDATE Animais SET cor = 'laranja' WHERE especie = 'gato';
-- Crie o campo de altura para os animais ALTER TABLE animais
ALTER TABLE Animais ADD altura DECIMAL(5,2) NULL;
-- Crie um campo de Observação para os animais.
ALTER TABLE Animais ADD observacao VARCHAR(255) NULL;
-- Remova todos os animais que pesam mais que 200 quilogramas
DELETE FROM Animais WHERE peso > 200;
-- Remova todos os animais que o nome inicie com a letra 'C'
DELETE FROM Animais WHERE nome LIKE 'C%';
--  Remova o campo cor dos animais
ALTER TABLE Animais DROP COLUMN cor;
-- Aumente o tamanho do campo nome dos animais para 80 caracteres
ALTER TABLE Animais MODIFY nome VARCHAR(80) NOT NULL;
-- Remova todos os gatos e cachorros
DELETE FROM Animais WHERE especie IN ('gato', 'cachorro');
-- Remova o campo data de nascimento dos animais
ALTER TABLE Animais DROP COLUMN nasc;
-- Remova todos os animais
DELETE FROM animais;
-- Remova a tabela especies
DROP TABLE especies;