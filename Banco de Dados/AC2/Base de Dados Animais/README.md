# Facens - Banco de dados (AC2)

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

### 1ª Etapa

Crie a **tabela animais**, conforme o exemplo demonstrado, durante a aula do dia **11/09/23**;

Insira todos os valores disponíveis no slide 8;

Após a inserção execute cada uma das atividades a seguir:

1. Selecione todos os animais
2. Selecione todos os animais que pesam menos que 13.1
3. Selecione todos nasceram entre fevereiro e dezembro de 2015
4. Selecione todos os animais brancos que pesam menos que 15.0
5. Selecione nome, cor e peso de todos cujo nome comece com ’B’
6. Selecione nome, cor e peso de todos com cor vermelha, amarela, marrom e laranja
7. Selecione nome, cor, data de nascimento e peso de todos ordenados pelos mais jovens
8. Selecione todos os animais cujo nome comece com 'C' e não sejam brancos
9. Selecione todos os animais cujo nome contenha 'ba'
10. Selecione todos os animais com peso entre 13.0 à 15.0
11. Selecione todos os animais que o peso não seja maior que 30, com cor amarelo ou roxo e nascidos depois de 2012
12. (Desafio) Selecione todos os capricornianos
13. (Desafio) Selecione todos os animais com nome formado por mais de uma palavra.

<hr>

```SQL
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
```
<hr>

### 2ª Etapa

#### 1. Animais e Espécies

**1)** Crie um banco de dados para armazenar dados de Animais e Espécies. Um animal tem seu nome, data_nasc e peso. Uma espécie tem um nome e uma descrição.

Faça a modelagem relacional, DER.

Insira pelo menos 8 animais e 3 espécies.

```SQL
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

-- Populando tabela de Espécies
INSERT INTO Especies VALUES(01, 'Ave','criaturas com penas, que voam e botam ovos.');
INSERT INTO Especies VALUES(02, 'Mamifero', 'Geralmente quadrupedes ou bipedes...');
INSERT INTO Especies VALUES(03, 'Réptel', 'Tem escamas, tem sangue frio, estranhamente fofo??');

-- Populando tabela de Animais.
INSERT INTO Animais VALUES(01, 'Pica-pau', '2022-08-23', 0.2, 01);
INSERT INTO Animais VALUES(02, 'Papagaio', '2011-07-03', 0.3, 01);
INSERT INTO Animais VALUES(03, 'Pinguim', '2008-05-17', 4.7, 01);
INSERT INTO Animais VALUES(04, 'Arara', '2021-06-24', 0.2, 01);
INSERT INTO Animais VALUES(05, 'Cachorro', '2013-04-29', 11.9, 02);
INSERT INTO Animais VALUES(06, 'Vaca', '2009-01-11', 220.3, 02);
INSERT INTO Animais VALUES(07, 'Iguana', '2018-03-22', 1.7, 03);
INSERT INTO Animais VALUES(08, 'Jacaré', '2001-01-09', 180.8, 03);
);
```

#### 2. Produtos e Marcas

1) Crie um banco de dados para armazenar dados de Animais e Espécies. Um animal tem seu nome, data_nasc e peso. Uma espécie tem um nome e uma descrição.

Faça a modelagem relacional, DER.

Insira pelo menos 8 animais e 3 espécies.

```SQL

```

#### 3. Filmes e Categorias

3) Crie um banco de dados para registrar dados de Filmes e Categorias. Um filme tem seu título, sinopse, estudio e categoria. Uma categoria deve ter nome e público alvo.

Faça a modelagem relacional, DER.

Insira pelo menos 8 Filmes e 3 Categorias.

```SQL

```
