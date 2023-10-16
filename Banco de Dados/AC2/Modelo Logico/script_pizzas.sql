-- Criando tabela de pizzas
CREATE TABLE pizzas (
  id INT NOT NULL AUTO_INCREMENT,
  tamanho VARCHAR(45) NOT NULL,
  descricao VARCHAR(125) NOT NULL,
  preco DECIMAL(5,2) NOT NULL,
  sabor VARCHAR(45) NOT NULL,
  embalagem_material VARCHAR(50),
  embalagem_tamanho VARCHAR(10),
  embalagem_preco DECIMAL(4, 2),
  receita_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (receita_id) REFERENCES receitas (id)
);

-- Criando tabela de ingredientes
CREATE TABLE ingredientes (
  id INT NOT NULL AUTO_INCREMENT,
  ingrediente VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Criando tabela de pizzaiolos
CREATE TABLE pizzaiolos (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(64) NOT NULL,
  salario DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);

-- Criando tabela de receitas
CREATE TABLE receitas (
  id INT NOT NULL AUTO_INCREMENT,
  autor VARCHAR(64) NOT NULL,
  instrucoes VARCHAR(555) NOT NULL,
  PRIMARY KEY (id)
);

-- Cria a tabela de relacionamentos entre pizzas e ingredientes
CREATE TABLE ingredientes_has_pizzas (
  ingrediente_id INT NOT NULL,
  pizza_id INT NOT NULL,
  PRIMARY KEY (ingrediente_id, pizza_id),
  FOREIGN KEY (ingrediente_id) REFERENCES ingredientes (id),
  FOREIGN KEY (pizza_id) REFERENCES pizzas (id)
);

-- Cria a tabela de relacionamentos entre pizzas e pizzaiolos
CREATE TABLE pizzas_has_pizzaiolos (
  pizza_id INT NOT NULL,
  pizzaiolo_id INT NOT NULL,
  PRIMARY KEY (pizza_id, pizzaiolo_id),
  FOREIGN KEY (pizza_id) REFERENCES pizzas (id),
  FOREIGN KEY (pizzaiolo_id) REFERENCES pizzaiolos (id)
);

-- Inserir dados fictícios na tabela pizzaiolos
INSERT INTO pizzaiolos (nome, salario) VALUES
('João Silva', 2500.00),
('Maria Santos', 2700.00),
('Carlos Oliveira', 2300.00),
('Ana Souza', 2600.00);

-- Inserir dados fictícios na tabela receitas
INSERT INTO receitas (autor, instrucoes) VALUES
('Rafaela Mendes', 'Misture a farinha com água e fermento e deixe descansar por 1 hora.'),
('Marcos Oliveira', 'Bata os tomates para fazer o molho e adicione orégano e manjericão.'),
('Julia Castro', 'Corte os ingredientes em fatias finas e reserve.');

-- Inserir dados fictícios na tabela ingredientes
INSERT INTO ingredientes (ingrediente) VALUES
('Queijo Mozarela'),
('Tomate'),
('Orégano'),
('Manjericão'),
('Pepperoni'),
('Calabresa'),
('Cebola'),
('Pimentão'),
('Azeitona');

-- Inserir dados fictícios na tabela pizzas
INSERT INTO pizzas (tamanho, descricao, preco, sabor, embalagem_material, embalagem_tamanho, embalagem_preco, receita_id) VALUES
('Grande', 'Pizza de pepperoni com queijo', 25.50, 'Pepperoni', 'Papelão', 'Grande', 1.50, 1),
('Média', 'Pizza calabresa com cebola e azeitona', 18.00, 'Calabresa', 'Papel', 'Média', 1.00, 3),
('Grande', 'Pizza vegetariana com pimentão e cebola', 22.00, 'Vegetariana', 'Plástico', 'Grande', 2.00, 3);

-- Inserir dados fictícios na tabela ingredientes_has_pizzas
INSERT INTO ingredientes_has_pizzas (ingrediente_id, pizza_id) VALUES
(1, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 3),
(9, 3);

-- Inserir dados fictícios na tabela pizzas_has_pizzaiolos
INSERT INTO pizzas_has_pizzaiolos (pizza_id, pizzaiolo_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- Relatório com todas as pizzas e os pizzaiolos aptos a produzi-las
SELECT p.id as pizza_id, p.sabor, piz.nome as pizzaiolo_nome
FROM pizzas p
JOIN pizzas_has_pizzaiolos pp ON p.id = pp.pizza_id
JOIN pizzaiolos piz ON pp.pizzaiolo_id = piz.id;

-- Relatório com todas as pizzas e seus ingredientes
SELECT p.id as pizza_id, p.sabor, i.ingrediente
FROM pizzas p
JOIN ingredientes_has_pizzas ip ON p.id = ip.pizza_id
JOIN ingredientes i ON ip.ingrediente_id = i.id;

-- Relatório com todos os ingredientes e as pizzas onde são utilizados
SELECT i.id as ingrediente_id, i.ingrediente, p.sabor
FROM ingredientes i
JOIN ingredientes_has_pizzas ip ON i.id = ip.ingrediente_id
JOIN pizzas p ON ip.pizza_id = p.id;

-- Relatório com os sabores de todas as pizzas, o nome dos pizzaiolos que as fazem e as instruções para produzi-las
SELECT p.sabor, piz.nome as pizzaiolo_nome, r.instrucoes
FROM pizzas p
JOIN pizzas_has_pizzaiolos pp ON p.id = pp.pizza_id
JOIN pizzaiolos piz ON pp.pizzaiolo_id = piz.id
JOIN receitas r ON p.receita_id = r.id;
