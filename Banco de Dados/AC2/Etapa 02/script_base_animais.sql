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

-- Selecione todos os animais
SELECT * FROM Animais;
-- Selecione todos os animais que pesam menos que 13.1
SELECT * FROM Animais WHERE peso < 13.1;
-- Selecione todos nasceram entre fevereiro e dezembro de 2015
SELECT * FROM Animais WHERE nasc BETWEEN '2015-02-01' AND '2015-12-31';
-- Selecione todos os animais brancos que pesam menos que 15.0
SELECT * FROM Animais WHERE cor = 'branco' AND peso < 15.0;
-- Selecione nome, cor e peso de todos cujo nome comece com ’B’
SELECT nome, cor, peso FROM Animais WHERE nome LIKE 'B%';
-- Selecione nome, cor e peso de todos com cor vermelha, amarela, marrom e laranja
SELECT nome, cor, peso FROM Animais WHERE cor IN ('vermelho', 'amarelo', 'marrom', 'laranja');
-- Selecione nome, cor, data de nascimento e peso de todos ordenados pelos mais jovens
SELECT nome, cor, nasc, peso FROM Animais ORDER BY nasc ASC;
-- Selecione todos os animais cujo nome comece com 'C' e não sejam brancos
SELECT * FROM Animais WHERE nome LIKE 'C%' AND cor != 'branco';
-- Selecione todos os animais cujo nome contenha 'ba'
SELECT * FROM Animais WHERE nome LIKE '%ba%';
-- Selecione todos os animais com peso entre 13.0 à 15.0
SELECT * FROM Animais WHERE peso BETWEEN 13.0 AND 15.0;
-- Selecione todos os animais que o peso não seja maior que 30, com cor amarelo ou roxo e nascidos depois de 2012
SELECT * FROM Animais WHERE peso <= 30.0 AND cor IN ('amarelo', 'roxo') AND nasc > '2012-01-01';
-- (Desafio) Selecione todos os capricornianos
SELECT * FROM Animais WHERE MONTH(nasc) IN (12, 1) AND DAY(nasc) BETWEEN 22 AND 19;
-- (Desafio) Selecione todos os animais com nome formado por mais de uma palavra.
SELECT * FROM Animais WHERE nome LIKE '% %' OR nome LIKE '%-%';