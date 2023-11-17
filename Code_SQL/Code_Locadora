-- Criação da Tabela Genero de Filme
CREATE TABLE genero_filme (
	cod_genero_filme INTEGER NOT NULL,
  	nome_genero_filme VARCHAR(45) not NULL,
  CONSTRAINT pk_genero_filme
  	PRIMARY KEY (cod_genero_filme)
);

-- Criação da Tabela Filme
CREATE table filme (
	cod_filme INTEGER not NULL,
  	nome_filme VARCHAR(40) NOT NULL,
  	cod_genero_filme INTEGER not NULL,
  	valor_compra NUMERIC(10, 2) not NULL,
  CONSTRAINT pk_filme
  	PRIMARY KEY (cod_filme),
  CONSTRAINT fk_filme_generos_filme
  	FOREIGN KEY (cod_genero_filme)
  	REFERENCES genero_filme (cod_genero_filme)
);

-- Criação da Tabela UF
CREATE table uf (
  	sigla_uf CHAR(2) NOT NULL,
  	nome_uf VARCHAR(45) NOT NULL,
  CONSTRAINT pk_uf
  	PRIMARY KEY (sigla_uf)
);

-- Criação da Tabela Cidade
create table cidade (
	cod_cidade INTEGER not NULL,
  	nome_cidade VARCHAR(45) not NULL,
  	sigla_uf CHAR(2) not NULL,
  	CONSTRAINT pk_cidade
  		PRIMARY KEY (cod_cidade),
  	CONSTRAINT fk_cidade_uf
  		FOREIGN key (sigla_uf)
  		REFERENCES uf (sigla_uf)
);

-- Criação da Tabela Cliente
CREATE TABLE cliente (
	cod_cliente INTEGER NOT NULL,
  	nome_cliente VARCHAR(45) NOT NULL,
  	rua_cliente VARCHAR(45) NOT NULL,
  	cod_cidade INTEGER NOT NULL,
  	telefone_cliente CHAR(15) NULL,
  	CONSTRAINT pk_cliente
  		PRIMARY KEY (cod_cliente),
  	CONSTRAINT fk_cliente_cidades
  		FOREIGN key (cod_cidade)
  		REFERENCES cidade (cod_cidade)
);

-- Criação da Tabela Locação
create table locacao (
	cod_cliente INTEGER NOT NULL,
  	cod_filme INTEGER not NULL,
  	data_locacao DATE NOT NULL,
  	valor_locacao NUMERIC(10, 2) NOT NULL,
  	CONSTRAINT pk_locacao
  		PRIMARY key (cod_cliente, cod_filme, data_locacao),
  	CONSTRAINT fk_locacao_filme
  		foreign key (cod_filme)
  		REFERENCES filme(cod_filme),
  	CONSTRAINT fk_locacaos_cliente
  		FOREIGN KEY (cod_cliente)
  		REFERENCES cliente(cod_cliente)
);


-- Inserção de dados na tabela genero_filme
INSERT INTO genero_filme (cod_genero_filme, nome_genero_filme)
VALUES
    (1, 'Ação'),
    (2, 'Animação'),
    (3, 'Aventura'),
    (4, 'Comédia'),
    (5, 'Crime'),
    (6, 'Documentário'),
    (7, 'Drama'),
    (8, 'Ficção Científica'),
    (9, 'Fantasia'),
    (10, 'Horror'),
    (11, 'Musical'),
    (12, 'Mistério'),
    (13, 'Romance'),
    (14, 'Suspense'),
    (15, 'Western');

-- Inserção de dados na tabela filme
INSERT INTO filme (cod_filme, nome_filme, cod_genero_filme, valor_compra)
VALUES
    -- Filmes de Ação
    (1, 'Vingança Implacável', 1, 19.99),
    (2, 'Fronteira Perigosa', 1, 24.99),

    -- Filmes de Animação
    (3, 'Frozen 2', 2, 29.99),
    (4, 'Festa no Céu', 2, 22.99),

    -- Filmes de Aventura
    (5, 'O segredo da Ilha Misteriosa', 3, 21.99),
    (6, 'Jornada ao Centro da Terra', 3, 26.99),

    -- Filmes de Comédia
    (7, 'Risos e Confusões', 4, 25.99),
    (8, 'Rir é o melhor Remédio', 4, 23.99),

    -- Filmes de Crime
    (9, 'À Sombra da Lei', 5, 20.99),
    (10, 'Jogo de Sombras', 5, 27.99),

    -- Filmes de Documentário
    (11, 'Nos Bastidores da Natureza', 6, 28.99),
    (12, 'Vidas Desconhecidas', 6, 30.99),

    -- Filmes de Drama
    (13, 'Corações Despedaçados', 7, 31.99),
    (14, 'Caminho da Redenção', 7, 18.99),

    -- Filmes de Ficção Científica
    (15, 'Interestelar', 8, 32.99),
    (16, 'O Último Horizonte', 8, 33.99),

    -- Filmes de Fantasia
    (17, 'O Tesouro Esquecido', 9, 34.99),
    (18, 'Cidade das Fadas', 9, 35.99),

    -- Filmes de Horror
    (19, 'Pesadelo Noturno', 10, 36.99),
    (20, 'Freira 2', 10, 37.99),

    -- Filmes de Musical
    (21, 'Melodias do Coração', 11, 38.99),
    (22, 'Harmonia do Destino', 11, 39.99),

    -- Filmes de Mistério
    (23, 'Códigos e Segredos', 12, 40.99),
    (24, 'O Mistério da Noite', 12, 41.99),

    -- Filmes de Romance
    (25, 'Paixão Proibida', 13, 42.99),
    (26, 'O Beijo Inesquecível', 13, 43.99),

    -- Filmes de Suspense
    (27, 'Alvo em Movimento', 14, 44.99),
    (28, 'O Enigma da Trama', 14, 45.99),

    -- Filmes de Western
    (29, 'Pistoleiros da Fronteira', 15, 46.99),
    (30, 'Trilha da Vingança', 15, 47.99);


-- Inserção de dados na tabela uf
INSERT INTO uf (sigla_uf, nome_uf)
VALUES
    ('SP', 'São Paulo'),
    ('RJ', 'Rio de Janeiro'),
    ('MG', 'Minas Gerais'),
    ('BA', 'Bahia'),
    ('RS', 'Rio Grande do Sul'),
    ('ES', 'Espirito Santos'),
    ('PE', 'Pernambuco');

-- Inserção de dados na tabela cidade
INSERT INTO cidade (cod_cidade, nome_cidade, sigla_uf)
VALUES
    (1, 'São Paulo', 'SP'),
    (2, 'Rio de Janeiro', 'RJ'),
    (3, 'Belo Horizonte', 'MG'),
    (4, 'Salvador', 'BA'),
    (5, 'Porto Alegre', 'RS'),
    (6, 'Cachoeiro de Itapemirim', 'ES'),
    (7, 'Recife', 'PE');

-- Inserção de dados na tabela cliente
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cod_cidade, telefone_cliente)
VALUES
    (101, 'Ana Silva', 'Rua das Flores, 123', 1, '(11) 1234-5678'),
    (102, 'João Oliveira', 'Rua Primavera, 456', 2, '(21) 9876-5432'),
    (103, 'Maria Santos', 'Rua Travessa do Sol, 789', 3, '(31) 1111-2222'),
    (104, 'Pedro Costa', 'Rua dos Pinheiros, 1011', 4, '(71) 3333-4444'),
    (105, 'Laura Pereira', 'Rua Alameda das Palmeiras, 1213', 5, '(54) 9999-8888'),
    (106, 'Marcos Lima', 'Rua Praça da Liberdade, 1415', 6, '(27) 4545-8787'),
    (107, 'Fernanda Souza', 'Rua das Águias, 1617', 7, '(87) 2332-7676');

-- Inserção de dados na tabela locacao
INSERT INTO locacao (cod_cliente, cod_filme, data_locacao, valor_locacao)
VALUES
    (101, 1, '2023-01-05', 7.99),
    (102, 3, '2023-02-10', 9.99),
    (103, 5, '2023-03-15', 6.99),
    (104, 7, '2023-04-20', 8.99),
    (105, 9, '2023-05-25', 10.99),
    (106, 11, '2023-06-30', 5.99),
    (107, 13, '2023-07-05', 11.99);
