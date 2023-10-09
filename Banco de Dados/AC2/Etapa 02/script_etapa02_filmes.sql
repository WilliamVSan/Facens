-- Criando Banco de Dados.
CREATE DATABASE Atividade02;

-- Selecionando o Banco de Dados.
USE Atividade02;

-- Criando tabela de Categorias
CREATE TABLE Categorias(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(64) NOT NULL,
publico_alvo VARCHAR(32)
);

-- Criando tabela de Filmes
CREATE TABLE Filmes(
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(64),
sinopse VARCHAR(255),
estudio VARCHAR(32),
id_categoria INT NOT NULL,
FOREIGN KEY(id_categoria) REFERENCES Categorias(id)
);

-- Populando tabela de Categorias.
INSERT INTO Categorias (nome, publico_alvo) VALUES
('Ação', 'A partir de 18 anos'),
('Comédia', 'Todas as idades'),
('Drama', 'A partir de 12 anos');

-- Populando tabela de Filmes.
INSERT INTO Filmes (titulo, sinopse, estudio, id_categoria) VALUES
('O Poderoso Chefão', 'A história da família Corleone, uma das mais poderosas famílias da máfia italiana em Nova York.', 'Paramount Pictures', 1),
('Pulp Fiction', 'Uma série de histórias interligadas que exploram temas de violência, moralidade e redenção.', 'Miramax Films', 1),
('O Senhor dos Anéis: A Sociedade do Anel', 'Um hobbit é recrutado para uma jornada épica para destruir o Um Anel, uma poderosa joia que ameaça a Terra-média.', 'Warner Bros. Pictures', 1),
('O Rei Leão', 'A história de Simba, um jovem leão que deve assumir o trono de seu pai, Mufasa.', 'Walt Disney Pictures', 2),
('Toy Story', 'Os brinquedos de uma criança ganham vida quando ela não está por perto.', 'Pixar Animation Studios', 2),
('O Esquadrão Suicida', 'Um grupo de supervilões é recrutado para uma missão suicida.', 'Warner Bros. Pictures', 1),
('Vingadores: Ultimato', 'Os Vingadores se reúnem para derrotar Thanos e restaurar a paz no universo.', 'Marvel Studios', 1),
('Homem-Aranha: Sem Volta para Casa', 'Peter Parker pede a ajuda do Doutor Estranho para apagar a memória de todos sobre sua identidade secreta.', 'Sony Pictures', 1);
