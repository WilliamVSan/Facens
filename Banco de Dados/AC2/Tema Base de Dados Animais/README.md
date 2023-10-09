![image](https://github.com/WilliamVSan/Facens/assets/86013044/5731df75-b014-45ad-b013-2d7970b77b63)# Facens - Banco de dados (AC2)

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

- [Facens - Banco de dados (AC2)](#facens---banco-de-dados-ac2)
  - [Atividade individual - Tema: Base de Dados Animais (DELETE, ALTER, UPDATE E DROP)](#atividade-individual---tema-base-de-dados-animais-delete-alter-update-e-drop)
    - [Atividade - (DELETE, ALTER, UPDATE E DROP)](#atividade---delete-alter-update-e-drop)
  - [Critérios Para Correção](#critérios-para-correção)

## Atividade individual - Tema: Base de Dados Animais (DELETE, ALTER, UPDATE E DROP)

Para está atividade duplique a base de dados utilizada na ATIVIDADE INDIVIDUAL – TEMA: BASE DE DADOS ANIMAIS;

Após a criação de uma nova base, execute os códigos abaixo:

1. Altere o nome do Pateta para Goofy;
2. Altere o peso do Garfield para 10 quilogramas;
3. Altere a cor de todos os gatos para laranja;
4. Crie um campo altura para os animais;
5. Crie um campo observação para os animais;
6. Remova todos os animais que pesam mais que 200 quilogramas.
7. Remova todos os animais que o nome inicie com a letra ‘C’.
8. Remova o campo cor dos animais;
9. Aumente o tamanho do campo nome dos animais para 80 caracteres;
10. Remova todos os gatos e cachorros.
11. Remova o campo data de nascimento dos animais.
12. Remova todos os animais.
13. Remova a tabela especies.

### Atividade - (DELETE, ALTER, UPDATE E DROP)

```SQL
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
```

## Critérios Para Correção

### Script:

[Script](https://github.com/WilliamVSan/Facens/blob/main/Banco%20de%20Dados/AC2/Tema%20Base%20de%20Dados%20Animais/script_base_animais.sql)

**Imagem:**
![MySQL](https://github.com/WilliamVSan/Facens/assets/86013044/0dffa1ce-03d6-4086-91db-965664c111f8)
