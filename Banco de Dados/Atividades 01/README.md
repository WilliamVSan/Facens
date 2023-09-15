# Facens - Banco de dados (AC1)

<div align="center">
	
![Facens](https://mlogu6g7z5ex.i.optimole.com/cb:RF8R~518a6/w:500/h:159/q:90/ig:avif/https://facens.br/wp-content/uploads/2021/03/logo-f-b.png)

</div>

## Exercicios Diagrama

### 1. PetShop

![PetShop](https://github.com/WilliamVSan/Facens/assets/86013044/71867579-32b2-4847-983a-a7d9dbc8316b)

#### Tabela:

    CREATE TABLE pets{
    id INT,
    nome VARCHAR(65),
    especie VARCHAR(65),
    nadaDeNascimento DATE
    };

    CREATE TABLE clientes{
    id INT,
    nome VARCHAR(65),
    email VARCHAR(85),
    cpf VARCHAR(13),
    telefone VARCHAR(16)
    };

    INSERT INTO pets VALUES (01, "Neko", "Gato", "03-08-2000");
    INSERT INTO clientes VALUES (01, "Uiu", "uiu@gmail.com", "98392831309", "15 998230372");

### 2. Games

![Games](https://github.com/WilliamVSan/Facens/assets/86013044/4131e8a9-9fcb-4c45-a90a-7738d4405c9d)

#### Tabela:

    CREATE TABLE devs{
    id INT,
    nome VARCHAR(65),
    cpf VARCHAR(13),
    dataDeNascimento DATE
    };
    
    CREATE TABLE projetos{
    id INT,
    nome VARCHAR(65),
    genero VARCHAR(65),
    dataDeLancamento DATE,
    faixaEtaria VARCHAR(3)
    };

    INSERT INTO devs VALUES (01, "Uiu", "09812374609", "03-08-2000");
    INSERT INTO projetos VALUES (01, "Baldur's Gate 3", "RPG", "03-08-2023", "15+");
    
### 3. Biblioteca

![Biblioteca](https://github.com/WilliamVSan/Facens/assets/86013044/8ca80700-7d57-4077-896e-36874e2471c2)

#### Tabela:

    CREATE TABLE autores{
    id INT,
    nome VARCHAR(65),
    email VARCHAR(85),
    nacionalidade VARCHAR(16),
    dataDeNascimento DATE
    };

    CREATE TABLE livros{
    id INT,
    titulo VARCHAR(65),
    qtdePaginas INT,
    acabamento VARCHAR(16),
    editora VARCHAR(32)
    };

    INSERT INTO autores VALUES (01, "Uiu", "uiu@email.com", "Brasileiro", "03-08-2000");
    INSERT INTO livros VALUES (01, "LENDAS DE DRAGONLANCE VOL. 1", 416, "Capa Mole", "Jambo Editora");

### 4. Locadora

![Locadora](https://github.com/WilliamVSan/Facens/assets/86013044/36b88bce-49ac-4424-97e3-5c0b883973e5)

#### Tabela:

    CREATE TABLE automoveis{
    id INT,
    modelo VARCHAR(32),
    placa VARCHAR(65),
    nomeMontadora VARCHAR(65),
    logotipo VARCHAR(65),
    site VARCHAR(85),
    anoDeLancamento DATE
    };

    INSERT INTO automoveis VALUES(01, "Cruze", "02931923", "Chevrolet", "Logo Chevrolet", "https://chevrolet.com.br", "01-01-2012");

### 5. Supermercado

![Supermercado](https://github.com/WilliamVSan/Facens/assets/86013044/431d4fe2-0fef-48ef-a134-c210b17840e1)

#### Tabela:

    CREATE TABLE produtos{
    id INT,
    nome VARCHAR (65),
    sac VARCHAR(16),
    marca VARCHAR(32),
    preco DECIMAL(10, 2),
    qtdeEstoque INT,
    nacionalidade VARCHAR(16)
    };

    INSERT INTO produto VALUES(01, "Bolacha", "SAC", "Marca", 100.0, 9, "Brasileiro");

## 6. Videoteca

![Videoteca](https://github.com/WilliamVSan/Facens/assets/86013044/86951970-d8ca-4b8d-b209-ef5ea17854a3)

#### Tabela:

    CREATE TABLE filmes{
    id INT,
    titulo VARCHAR(65),
    idiomaOriginal VARCHAR(16),
    duracao VARCHAR(10, 2),
    preco DECIMAL(10, 2)
    };

    CREATE TABLE elencos{
    id INT,
    nome VARCHAR(65),
    nacionalidade VARCHAR(16),
    dataDeNascimento DATE
    };

    INSERT INTO filmes VALUES(01, "Mission: Impossible – Dead Reckoning Part Two", "Inglês", "01:50:00", 9.99);
    INSERT INTO elencos VALUES(01, "Tom Cruise", "Norte-Americano", "03-07-1962");

## Tabelas relacionadas aos diagramas dos exercicios:

### 1.

    CREATE TABLE alunos{
    id INT,
    ra VARCHAR(6),
    nome VARCHAR(65),
    dataDeNascimento DATE,
    email VARCHAR(85),
    };

    INSERT INTO alunos VALUES(01, "236032", "Afonso", "10-06-2000", "afonso@email.com");
    INSERT INTO alunos VALUES(02, "236058", "Maria", "07-05-1999", "maria@email.com");
    INSERT INTO alunos VALUES(03, "236034", "William", "20-03-2011", "will@email.com");
    INSERT INTO alunos VALUES(04, "236056", "Clayton", "11-07-1997", "clayton@email.com");

### 2.

    CREATE TABLE colaboradores{
    id INT,
    codigo VARCHAR(16),
    nome VARCHAR(65),
    cpf VARCHAR(13),
    cargo VARCHAR(16),
    salario DECIMAL(10, 2)
    };

    INSERT INTO colaboradores VALUES(01, "236059", "Afonso", "46401141848", "Assistente de TI", 1900.00 );
    INSERT INTO colaboradores VALUES(02, "236059", "Ana", "46401141847", "Assistente de TI", 1900.00 );  
    INSERT INTO colaboradores values(03, "236059", "Clayton", "46401141846", "Assistente de TI", 1900.0 ); 
    INSERT INTO colaboradores VALUES(04, "236059", "Isabela", "46401141845", "Assistente de TI", 1900.0 );  
    INSERT INTO colaboradores VALUES(05, "236059", "William", "46401141844", "Assistente de TI", 1900.0 );  
