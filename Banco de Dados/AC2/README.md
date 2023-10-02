# Facens - Banco de dados (AC2)

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

- [Facens - Banco de dados (AC2)](#facens---banco-de-dados-ac2)
    - [1ª Etapa](#1ª-etapa)
    - [2ª Etapa](#2ª-etapa)
    - [3ª Etapa](#3ª-etapa)
      - [Print do MySQL Workbench:](#print-do-mysql-workbench)

### 1ª Etapa

Crie uma tabela **Produtos** com os seguintes itens; 

`id_produto;` `nome;` `preço;`` estoque;` `perecível;` `marca;` `nacionalidade;`

Atribua a cada campo seu respectivo tipo;

Os itens: `nome;` `preço;` `estoque;` `perecível;` **não poderão receber valores nulos**.

O `id_produto` deve ser utilizado como **chave-primaria**;

Após a criação insira **cinco produtos**, todos devem ter seus respectivos campos
preenchidos;

Verifique se todos os dados foram inseridos;

Ao término inicie a segunda etapa.

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

### 2ª Etapa

1. Gere um relatório informando quantos produtos estão cadastrados;

2. Gere um relatório informando o preço médio dos produtos;

3. Selecione a média dos preços dos produtos em 2 grupos: perecíveis e não perecíveis;

4. Selecione a média dos preços dos produtos agrupados pelo nome do produto;

5. Selecione a média dos preços e total em estoque dos produtos;

6. Selecione o nome, marca e quantidade em estoque do produto mais caro;

7. Selecione os produtos com preço acima da média;

8. Selecione a quantidade de produtos de cada nacionalidade.
   
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

### 3ª Etapa

#### Print do MySQL Workbench:


