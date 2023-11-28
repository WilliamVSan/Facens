# Atividade individual - Tema: Sistema de Gerenciamento de Pedidos

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

## Etapa 1

**Criação de Tabelas e Inserção de Dados**

Crie as tabelas "Clientes" e "Pedidos" com campos apropriados. Insira dados de exemplo nas tabelas para simular clientes e pedidos. Certifique-se de incluir uma chave primária em cada tabela.

![Tabela](https://github.com/WilliamVSan/Facens/assets/86013044/29f814b4-c18b-4ae5-a367-9c0a56831e6f)

## Etapa 2

**Criação de Stored Procedure**

Crie uma stored procedure chamada "InserirPedido" que permite inserir um novo pedido na tabela "Pedidos" com as informações apropriadas. A stored procedure deve receber parâmetros como o ID do cliente e os detalhes do pedido. Ao término teste o funcionamento da stored procedure criada inserindo um pedido.

```SQL
DELIMITER $$

CREATE PROCEDURE InserirPedido(
  IN cliente_nome VARCHAR(255),
  IN descricao VARCHAR(255),
  IN dataPedido DATE,
  IN valor DECIMAL(10, 2)
)
BEGIN
  DECLARE cliente_id INT;

  -- Obtenha o ID do cliente com base no nome fornecido
  SELECT idClientes INTO cliente_id FROM clientes WHERE nome = cliente_nome;

  -- Insira o novo pedido na tabela Pedidos
  INSERT INTO pedidos (cliente, descricao, dataPedido, valor, Clientes_idClientes)
  VALUES (cliente_nome, descricao, dataPedido, valor, cliente_id);
END $$

DELIMITER ;
```

## Etapa 3

**Trigger**

Crie uma trigger que seja acionada APÓS a inserção de um novo pedido na tabela "Pedidos". A trigger deve calcular o valor total dos pedidos para o cliente correspondente e atualizar um campo "TotalPedidos" na tabela "Clientes" com o valor total. Teste a Trigger inserindo um novo pedido na tabela "Pedidos“.

```SQL
DELIMITER $$

CREATE TRIGGER AfterInsertPedido
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
  UPDATE clientes
  SET TotalPedidos = TotalPedidos + NEW.valor
  WHERE idClientes = NEW.Clientes_idClientes;
END $$

DELIMITER ;
```

## Etapa 4

**View**

Crie uma view chamada "PedidosClientes" que combina informações das tabelas "Clientes" e "Pedidos" usando JOIN para mostrar os detalhes dos pedidos e os nomes dos clientes.

```SQL
CREATE VIEW PedidosClientes AS
SELECT
  p.Clientes_idClientes AS ClienteID,
  c.nome AS ClienteNome,
  p.descricao AS DescricaoPedido,
  p.dataPedido AS DataPedido,
  p.valor AS ValorPedido
FROM pedidos p
INNER JOIN clientes c ON p.Clientes_idClientes = c.idClientes;
```

## Etapa 5

**Consulta com JOIN**

Escreva uma consulta SQL que utiliza JOIN para listar os detalhes dos pedidos de cada cliente, incluindo o nome do cliente e o valor total de seus pedidos. Utilize a view "PedidosClientes" para essa consulta.

```SQL
ALTER TABLE clientes
ADD COLUMN TotalPedidos DECIMAL(10, 2) DEFAULT 0.00;
```

```SQL
SELECT
  pc.ClienteNome,
  pc.DescricaoPedido,
  pc.DataPedido,
  pc.ValorPedido,
  c.TotalPedidos AS ValorTotalPedidos
FROM PedidosClientes pc
INNER JOIN clientes c ON pc.ClienteID = c.idClientes;
```

## Critérios de Avaliação


