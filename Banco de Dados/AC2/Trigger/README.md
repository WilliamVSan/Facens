![image](https://github.com/WilliamVSan/Facens/assets/86013044/07b4bbc4-6f6d-4bd6-acbb-b5504d61aa94)# Atividade Individual - Tema: Trigger

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

## Trigger - Pedidos

### Etapa 1

Criação das Tabelas e Dados de Exemplo: Primeiro, crie a tabela "Pedidos" e insira alguns dados de exemplo.

```SQL
CREATE TABLE Pedidos (
IDPedido INT AUTO_INCREMENT PRIMARY KEY,
DataPedido DATETIME,
NomeCliente VARCHAR(100)
);

-- Inserção de dados de exemplo
INSERT INTO Pedidos (DataPedido, NomeCliente) VALUES
(NOW(), 'Josefa'),
(NOW (), 'Carlos'),
(NOW (), 'Joana');
```

### Etapa 2

Criação da Trigger: Agora crie a trigger que registrará a data e hora de criação de novos registros na tabela "Pedidos".

```SQL
DELIMITER $
CREATE TRIGGER RegistroDataCriacaoPedido
BEFORE INSERT ON Pedidos
FOR EACH ROW
BEGIN
SET NEW. DataPedido = NOW();
END;
$
DELIMITER ;
```

### Etapa 3

Teste da Trigger: Agora você pode testar a trigger inserindo um novo registro na tabela "Pedidos" sem fornecer um valor para "DataPedido". A trigger preencherá automaticamente o campo "DataPedido" com a data e hora atuais.

```SQL
INSERT INTO Pedidos (NomeCliente) VALUES ('Novo Cliente');
```

### Etapa 4

Verificação dos Resultados: Depois de executar o comando de inserção, você pode consultar a tabela "Pedidos" para verificar se a trigger funcionou corretamente e registrou a data de criação: 

```SQL
SELECT * FROM Pedidos;
```

## Trigger - Cinema 

1. Reproduza o segundo exemplo;

```SQL
create table Filmes(
id int primary key not null auto_increment,
titulo varchar(200),
minutos int
);

delimiter $

-- Criação de um Trigger
-- Este trigger será acionado antes de uma inserção na tabela "filmes"
-- "before insert" indica que o gatilho será executado antes de uma nova linha ser inserida na tabela
create trigger check_minutos before insert on filmes

-- O gatilho vai iterar por cada linha afetada pela inserção
for each row

-- Início do bloco do gatilho
begin
    -- Condição: Verificar se o valor da coluna "minutos" na nova linha ("new.minutos") é menor que 0
    if new.minutos < 0 then
        -- Se a condição for atendida, o gatilho será acionado
        -- Ele define o valor da coluna "minutos" como NULL
        set new.minutos = null;
    end if;
-- Fim do bloco do gatilho
end$

-- Restauração do Delimitador padrão
delimiter ;
```

2. Faça as etapas do segundo exemplo;

```SQL
INSERT INTO Filmes (titulo, minutos) VALUES ("The terrible trigger", 120);
INSERT INTO Filmes (titulo, minutos) VALUES ("O alto da compadecida", 135);
INSERT INTO Filmes (titulo, minutos) VALUES ("Faroeste caboclo", 246);
INSERT INTO Filmes (titulo, minutos) VALUES ("The matrix", 90);
INSERT INTO Filmes (titulo, minutos) VALUES ("Blade runner", -88);
INSERT INTO Filmes (titulo, minutos) VALUES ("O labirinto do fauno", 110);
INSERT INTO Filmes (titulo, minutos) VALUES ("Metropole", 0);
INSERT INTO Filmes (titulo, minutos) VALUES ("A lista", 120);
```

3. Trigger de Minutos;

```SQL
DELIMITER $
-- Criação do Trigger
CREATE TRIGGER chk_minutos BEFORE INSERT ON Filmes
FOR EACH ROW
BEGIN
    DECLARE custom_message VARCHAR(255);

    IF new.minutos <= 0 THEN
        -- Atribuir a mensagem de erro personalizada à variável
        SET custom_message = "Valor inválido para minutos";

        -- Lançar um Erro com mensagem personalizada e código de erro
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = custom_message;
    END IF;
END$
-- Restauração do Delimitador Padrão
DELIMITER ;
```

4. Trigger de deleção;

```SQL
create table Log_deletions (
id int primary key not null auto_increment,
titulo varchar(60),
quando datetime,
quem varchar(40)
);

delimiter $
create trigger log_deletions after delete on Filmes
	for each row 
    begin
		insert into log_deletions values (null, old.titulo, sysdate(), user());
	end$
delimiter ;

delete from filmes where id = 2;
delete from filmes where id = 3;

select * from log_deletions;
```

## Critérios do Exercício

[**Link**](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Tema%20Biblioteca%20ou%20Com%C3%A9rcio%20Eletronico/script_biblioteca.sql) para o Script da atividade.

- REPRODUZA O PRIMEIRO CÓDIGO SUGERIDO NO MYSQL WORKBENCH;
- EXECUTE AS ETAPAS E VERIFIQUE SEUS RESULTADOS;
- APÓS A EXECUÇÃO DO PRIMEIRO CÓDIGO REALIZE O SEGUNDO EXEMPLO;
- FAÇA AS ETAPAS INDICADAS DO SEGUNDO EXEMPLO;
- VEJA OS RESULTADOS OBTIDOS A CADA TAREFA REALIZADA E TIRE PRINT’S DOS RESULTADOS;
- POR FIM, MONTE UM REPOSITÓRIO REMOTO E PREENCHA O README.MD COM O MODELO SUGERIDO EM AULA, INSIRA AS IMAGENS OBTIDAS DURANTE PROCESSO ACIMA E IDENTIFIQUE AS MESMAS NO README.MD;
- INSIRA NO REPOSITÓRIO OS SCRIPT’S CRIADOS EM SQL;
- ENVIE NA ATIVIDADE SOMENTE O LINK DO REPOSITÓRIO REMOTO;
- ESTÁ ATIVIDADE É PARA AC2, SENDO A ENTREGA PARA PRÓXIMA AULA.

**Imagens:**

[**Link**](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Trigger/script_trigger.sql) para checar o Script.

![MySQL](https://github.com/WilliamVSan/Facens/assets/86013044/ddfdcae9-61e8-4594-ad86-3272dcbe952f)


