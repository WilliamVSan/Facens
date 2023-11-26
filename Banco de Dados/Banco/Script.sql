USE mydb;

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

-- Populando tabela de locações

INSERT INTO Locacoes (Veiculo, Cliente, Diaria, Total) VALUES
('Fusca', '12345678901', 30.00, 90.00),
('Variante', '54376598723', 60.00, 420.00),
('Comodoro', '98765423190', 20.00, 20.00),
('Delorian', '43276567867', 80.00, 240.00),
('Brasília', '92738428444', 45.00, 315.00);

-- Populando tabela de veiculos

INSERT INTO Veiculos (Veiculo, Cor, Placa) VALUES
('Fusca', 'Preto', 'WER-3456'),
('Variante', 'Rosa', 'FDS-8384'),
('Comodoro', 'Preto', 'CVB-9933'),
('Delorian', 'Azul', 'FGH-2256'),
('Brasília', 'Amarela', 'DDI-3948');

-- Populando tabela de clientes

INSERT INTO Clientes (CPF, Nome, Nascimento) VALUES
('12345678901', 'Ariano Suassuna', '2022-05-21'),
('54376598723', 'Grace Hopper', '2002-04-29'),
('98765423190', 'Richard Feynman', '2001-12-10'),
('43276567867', 'Edgar Poe', '1998-12-14'),
('92738428444', 'Gordon Freeman', '1984-11-26');

-- Criando View

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

SELECT * FROM LocacoesVeiculosClientes;

SELECT * FROM LocacoesVeiculosClientes WHERE Veiculo = 'Fusca';
