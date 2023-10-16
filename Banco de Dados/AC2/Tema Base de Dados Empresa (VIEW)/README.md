# Base de Dados Empresa (VIEW) (AC2)

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

- [Base de Dados Empresa (VIEW) (AC2)](#base-de-dados-empresa-view-ac2)
  - [Etapa 1](#etapa-1)
  - [Etapa 2](#etapa-2)

## Etapa 1

**Criando tabelas:**

```SQL
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

```

**Populando tabelas:**

```SQL
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
```

## Etapa 2

1. Crie uma view que mostra todos os produtos e suas respectivas marcas;

```SQL
CREATE VIEW produtos_marcas_view AS
SELECT p.prd_id, p.prd_nome, m.mrc_nome
FROM produtos p
JOIN marcas m ON p.marcas_mrc_id = m.mrc_id;
```

2. Crie uma view que mostra todos os produtos e seus respectivos fornecedores;

```SQL
CREATE VIEW produtos_fornecedores_view AS
SELECT p.prd_id, p.prd_nome, f.frn_nome
FROM produtos p
JOIN produtos_has_fornecedores pf ON p.prd_id = pf.produtos_prd_id
JOIN fornecedores f ON pf.fornecedores_frn_id = f.frn_id;
```

3. Crie uma view que mostra todos os produtos e seus respectivos fornecedores e marcas;

```SQL
CREATE VIEW produtos_fornecedores_marcas_view AS
SELECT p.prd_id, p.prd_nome, m.mrc_nome, f.frn_nome
FROM produtos p
JOIN marcas m ON p.marcas_mrc_id = m.mrc_id
JOIN produtos_has_fornecedores pf ON p.prd_id = pf.produtos_prd_id
JOIN fornecedores f ON pf.fornecedores_frn_id = f.frn_id;
```

4. Crie uma view que mostra todos os produtos com estoque abaixo do mínimo;

```SQL
CREATE VIEW produtos_estoque_baixo_view AS
SELECT *
FROM produtos
WHERE prd_qtd_estoque < prd_estoque_mim;
```

5. Adicione o campo data de validade. Insira novos produtos com essa informação;

```SQL
ALTER TABLE produtos
ADD prd_data_validade DATE;

INSERT INTO produtos (prd_nome, prd_qtd_estoque, prd_estoque_mim, prd_data_fabricacao, prd_perecivel, prd_valor, marcas_mrc_id, prd_data_validade) VALUES
('Produto A', 100, 50, '2023-10-15 10:00:00', 1, 20.50, 1, '2024-03-15'),
('Produto B', 150, 60, '2023-09-20 14:30:00', 0, 30.00, 2, '2024-04-20'),
('Produto C', 80, 40, '2023-08-25 12:00:00', 1, 15.00, 3, '2023-12-25');
```

6. Crie uma view que mostra todos os produtos e suas respectivas marcas com validade vencida;

```SQL
CREATE VIEW produtos_validade_vencida_view AS
SELECT p.prd_id, p.prd_nome, m.mrc_nome, p.prd_data_validade
FROM produtos p
JOIN marcas m ON p.marcas_mrc_id = m.mrc_id
WHERE p.prd_data_validade < CURDATE();
```

7. Selecionar os produtos com preço acima da média.

```SQL
CREATE VIEW produtos_preco_acima_media_view AS
SELECT *
FROM produtos
WHERE prd_valor > (SELECT AVG(prd_valor) FROM produtos);
```

## Critérios de Avaliação

Este é o [LINK](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Tema%20Base%20de%20Dados%20Empresa%20(VIEW)/script_view_empresa.sql) para o Script.

**Imagens:**

![image](https://github.com/WilliamVSan/Facens/assets/86013044/3117c0d4-307f-47fc-afdf-60cc3890430e)

![image](https://github.com/WilliamVSan/Facens/assets/86013044/d69caa50-263f-4fc8-b9ea-54fa92d38034)

![image](https://github.com/WilliamVSan/Facens/assets/86013044/76d95411-b097-4e93-913a-38aa548f9740)
