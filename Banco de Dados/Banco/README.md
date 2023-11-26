# Atividade individual - Tema: Locação de Automóveis (NORMALIZAÇÃO)

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

### Etapa 1

CONFORME APRENDIDO NA AULA 11, REALIZE A ATIVIDADE ABAIXO:

- Observe a tabela não normalizada de uma locadora de veículos e aplique a 3ª Forma normal;

![Tabela](https://github.com/WilliamVSan/Facens/assets/86013044/a2d9990d-c01c-4413-9832-1d08604958fc)

- Faça o modelo lógico de banco de dados relacional;

![Modelo lógico](https://github.com/WilliamVSan/Facens/assets/86013044/46af5c81-2c99-4a9b-811f-277522981436)

- Escreva o script que cria as tabelas;

```SQL
-- Tabela de Locações
CREATE TABLE Locacoes (
  CodLocacao INT AUTO_INCREMENT NOT NULL,
  Veiculo VARCHAR(255) NOT NULL,
  Cliente VARCHAR(11) NOT NULL,
  Diaria DECIMAL(10,2) NOT NULL,
  Total DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (CodLocacao),
  FOREIGN KEY (Veiculo) REFERENCES Veiculos (Veiculo),
  FOREIGN KEY (Cliente) REFERENCES Clientes (CPF)
);

-- Tabela de Veiculos
CREATE TABLE Veiculos (
  Veiculo VARCHAR(255) NOT NULL,
  Cor VARCHAR(255) NOT NULL,
  Placa VARCHAR(255) NOT NULL,
  PRIMARY KEY (Veiculo)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
  CPF VARCHAR(11) NOT NULL,
  Nome VARCHAR(255) NOT NULL,
  Nascimento DATE NOT NULL,
  PRIMARY KEY (CPF)
);
```

- Crie uma view que seleciona todas as locações e seus respectivos veículos e clientes.

```SQL
CREATE VIEW LocacoesVeiculosClientes AS
SELECT
  l.CodLocacao,
  v.Veiculo,
  c.Nome,
  c.CPF
FROM
  Locacoes l
INNER JOIN
  Veiculos v ON l.Veiculo = v.Veiculo
INNER JOIN
  Clientes c ON l.Cliente = c.CPF;

```



## Critérios do Exercício

**Imagens:**

[Script](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/Banco/Script.sql)

![MySQL](https://github.com/WilliamVSan/Facens/assets/86013044/d673250e-b3a2-42b1-87b8-69985d5acbe1)

![Select](https://github.com/WilliamVSan/Facens/assets/86013044/7fe185fa-d86b-4e84-90be-446cdbf18279)

