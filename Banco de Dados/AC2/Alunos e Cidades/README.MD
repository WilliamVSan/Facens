# Facens - Banco de dados (AC2)

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

- [Facens - Banco de dados (AC2)](#facens---banco-de-dados-ac2)
  - [Atividade individual - Tema: Alunos e Cidades (INNER JOIN E ALIASES)](#atividade-individual---tema-alunos-e-cidades-inner-join-e-aliases)
  - [Critérios de Avaliação](#critérios-de-avaliação)

## Atividade individual - Tema: Alunos e Cidades (INNER JOIN E ALIASES)

Crie duas tabelas conforme o modelo apresentado nos slides 61 e 62, no material da AULA 7;

Preste atenção aos campos que estão no exemplo;

Insira os valores conforme os slides;

Aplique o exemplo sobre inner join dado no slide 67, do material indicado acima;

Execute essas atividades dentro o Oracle Workbench;

Crie um repositório remoto e envie o script em SQL;

Produza o Readme do repositório remoto e tire um print da tela após o término da atividade;

Coloque comentários em seu código.

```SQL
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
```

## Critérios de Avaliação

[Script](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Alunos%20e%20Cidades/script_cidades.sql)


