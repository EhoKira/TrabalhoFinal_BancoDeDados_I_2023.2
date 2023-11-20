-- Banco de Dados da Locadora Preguiça

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
  	nome_cidade VARCHAR(40) not NULL,
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
  	nome_cliente VARCHAR(40) NOT NULL,
  	rua_cliente VARCHAR(40) NOT NULL,
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
    (2, 'Fronteira Perigosa', 1, 150.99),

    -- Filmes de Animação
    (3, 'Frozen 2', 2, 29.99),
    (4, 'Festa no Céu', 2, 203.99),

    -- Filmes de Aventura
    (5, 'O segredo da Ilha Misteriosa', 3, 21.99),
    (6, 'Jornada ao Centro da Terra', 3, 298.99),

    -- Filmes de Comédia
    (7, 'Risos e Confusões', 4, 25.99),
    (8, 'Rir é o melhor Remédio', 4, 179.99),

    -- Filmes de Crime
    (9, 'À Sombra da Lei', 5, 20.99),
    (10, 'Jogo de Sombras', 5, 134.99),

    -- Filmes de Documentário
    (11, 'Nos Bastidores da Natureza', 6, 28.99),
    (12, 'Vidas Desconhecidas', 6, 267.99),

    -- Filmes de Drama
    (13, 'Corações Despedaçados', 7, 31.99),
    (14, 'Caminho da Redenção', 7, 128.99),

    -- Filmes de Ficção Científica
    (15, 'Interestelar', 8, 32.99),
    (16, 'O Último Horizonte', 8, 134.99),

    -- Filmes de Fantasia
    (17, 'O Tesouro Esquecido', 9, 34.99),
    (18, 'Cidade das Fadas', 9, 154.99),

    -- Filmes de Horror
    (19, 'Pesadelo Noturno', 10, 61.99),
    (20, 'Freira 2', 10, 261.99),

    -- Filmes de Musical
    (21, 'Melodias do Coração', 11, 38.99),
    (22, 'Harmonia do Destino', 11, 132.99),

    -- Filmes de Mistério
    (23, 'Códigos e Segredos', 12, 40.99),
    (24, 'O Mistério da Noite', 12, 141.99),

    -- Filmes de Romance
    (25, 'Paixão Proibida', 13, 42.99),
    (26, 'O Beijo Inesquecível', 13, 143.99),

    -- Filmes de Suspense
    (27, 'Alvo em Movimento', 14, 44.99),
    (28, 'O Enigma da Trama', 14, 145.99),

    -- Filmes de Western
    (29, 'Pistoleiros da Fronteira', 15, 46.99),
    (30, 'Trilha da Vingança', 15, 147.99);


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
    (7, 'Recife', 'PE'),
    (8, 'Caruaru', 'PE'),
    (9, 'Cruz das Almas', 'BA'),
    (10, 'Curvelo', 'MG');

-- Inserção de dados na tabela cliente
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cod_cidade, telefone_cliente)
VALUES
    (1, 'Ana Silva', 'Rua das Flores, 123', 1, '(11) 1234-5678'),
    (2, 'João Oliveira', 'Rua Primavera, 456', 2, '(21) 9876-5432'),
    (3, 'Maria Santos', 'Rua Travessa do Sol, 789', 3, '(31) 1111-2222'),
    (4, 'Pedro Costa', 'Rua dos Pinheiros, 1011', 4, '(71) 3333-4444'),
    (5, 'Laura Pereira', 'Rua Alameda das Palmeiras, 1213', 5, '(54) 9999-8888'),
    (6, 'Marcos Lima', 'Rua Praça da Liberdade, 1415', 6, '(27) 4545-8787'),
    (7, 'Fernanda Souza', 'Rua das Águias, 1617', 7, '(87) 2332-7676'),
    (8, 'Lucas Oliveira', 'Rua das Oliveiras, 221', 6, '(27) 7654-3210'),
    (9, 'Julia Pereira', 'Rua das Palmeiras, 332', 6, '(27) 8765-4321'),
    (10, 'Ricardo Santos', 'Rua dos Coqueiros, 443', 6, '(27) 9876-5432'),
    (11, 'Camila Costa', 'Rua das Acácias, 554', 6, '(27) 1098-7654'),
    (12, 'Gabriel Lima', 'Rua dos Lírios, 665', 6, '(27) 2109-8765'),
    (13, 'Larissa Souza', 'Rua das Rosas, 776', 8, '(87) 3210-9876'),
    (14, 'Felipe Silva', 'Rua dos Girassóis, 887', 9, '(71) 4321-1098'),
    (15, 'Amanda Oliveira', 'Rua das Hortênsias, 998', 10, '(31) 5432-2109'),
    (16, 'Lucas Lima', 'Rua das Orquídeas, 1109', 8, '(87) 6543-3210'),
    (17, 'Júnior Batista', 'Rua Travessa do Sol, 1245', 9, '(71) 5326-9584'),
    (18, 'Ricardo Abreu', 'Rua Asa Vermelha, 499', 10, '(31) 5215-6324'),
    (19, 'Jaqueline Almeida', 'Rua Getulio Borges, 599', 9, '(71) 6235-7548'),
    (20, 'Angelo Ferro', 'Rua das Flores, 123', 8, '(87) 3015-0214'),
    (21, 'João Oliveira', 'Rua Primavera, 456', 10, '(31) 9876-5432');
    
-- Inserção de dados na tabela locacao
INSERT INTO locacao (cod_cliente, cod_filme, data_locacao, valor_locacao)
VALUES
    (1, 1, '2023-01-05', 7.99),
    (2, 3, '2023-02-10', 9.99),
    (3, 5, '2023-03-15', 6.99),
    (4, 7, '2023-04-20', 8.99),
    (5, 9, '2023-05-25', 10.99),
    (6, 11, '2023-06-30', 5.99),
    (7, 13, '2023-07-05', 11.99),
    
     -- Locações para o cliente 8
    (8, 2, '2023-08-10', 11.99),
    (8, 3, '2023-08-10', 12.99),
    (8, 4, '2023-09-15', 14.99),
    (8, 6, '2023-10-20', 9.99),
    (8, 8, '2023-11-25', 12.99),
    (8, 10, '2023-12-30', 15.99),
    (8, 12, '2024-01-05', 8.99),
    (8, 14, '2024-02-10', 13.99),
    (8, 16, '2024-03-15', 16.99),
    (8, 18, '2024-04-20', 10.99),
    (8, 20, '2024-05-25', 17.99),
    (8, 21, '2024-05-25', 18.99),
    
    -- Locações para o cliente 9
    (9, 2, '2023-08-10', 11.99),
    (9, 3, '2023-08-10', 12.99),
    (9, 5, '2023-09-15', 15.99),
    (9, 7, '2023-10-20', 10.99),
    (9, 9, '2023-11-25', 13.99),
    (9, 11, '2023-12-30', 16.99),
    (9, 13, '2024-01-05', 9.99),
    (9, 15, '2024-02-10', 14.99),
    (9, 16, '2024-03-15', 16.99),
    (9, 17, '2024-03-15', 17.99),
    (9, 18, '2024-04-20', 10.99),
    (9, 19, '2024-04-20', 11.99),
    (9, 21, '2024-05-25', 18.99),
    
    -- Locações para o cliente 10
    (10, 2, '2023-08-10', 11.99),
    (10, 4, '2023-08-10', 13.99),
    (10, 6, '2023-09-15', 16.99),
    (10, 8, '2023-10-20', 11.99),
    (10, 10, '2023-11-25', 14.99),
    (10, 12, '2023-12-30', 17.99),
    (10, 14, '2024-01-05', 10.99),
    (10, 16, '2024-02-10', 15.99),
    (10, 18, '2024-03-15', 18.99),
    (10, 20, '2024-04-20', 12.99),
    (10, 22, '2024-05-25', 19.99),
    
    -- Locações para o cliente 11
    (11, 1, '2023-01-05', 7.99),
    (11, 2, '2023-08-10', 11.99),
    (11, 3, '2023-08-10', 12.99),
    (11, 5, '2023-08-10', 14.99),
    (11, 7, '2023-09-15', 17.99),
    (11, 9, '2023-10-20', 12.99),
    (11, 11, '2023-11-25', 15.99),
    (11, 13, '2023-12-30', 18.99),
    (11, 15, '2024-01-05', 11.99),
    (11, 17, '2024-02-10', 16.99),
    (11, 19, '2024-03-15', 19.99),
    (11, 20, '2024-04-20', 12.99),
    (11, 21, '2024-04-20', 13.99),
    (11, 23, '2024-05-25', 20.99),
    
    -- Locações para o cliente 12
    (12, 1, '2023-01-05', 7.99),
    (12, 2, '2023-08-10', 11.99),
    (12, 3, '2023-08-10', 12.99),
    (12, 6, '2023-08-10', 15.99),
    (12, 8, '2023-09-15', 18.99),
    (12, 9, '2023-09-15', 19.99),
    (12, 10, '2023-10-20', 13.99),
    (12, 12, '2023-11-25', 16.99),
    (12, 15, '2023-12-30', 20.99),
    (12, 14, '2023-12-30', 19.99),
    (12, 16, '2024-01-05', 12.99),
    (12, 18, '2024-02-10', 17.99),
    (12, 20, '2024-03-15', 20.99),
    (12, 22, '2024-04-20', 14.99),
    (12, 24, '2024-05-25', 21.99),
    (12, 25, '2024-05-25', 22.99),
    
    -- Locações para o cliente 13
    (13, 7, '2023-08-10', 16.99),
    (13, 9, '2023-09-15', 19.99),
    (13, 11, '2023-10-20', 14.99),
    (13, 13, '2023-11-25', 17.99),
    (13, 15, '2023-12-30', 20.99),
    (13, 17, '2024-01-05', 13.99),
    (13, 19, '2024-02-10', 18.99),
    (13, 21, '2024-03-15', 21.99),
    (13, 23, '2024-04-20', 15.99),
    (13, 25, '2024-05-25', 22.99),
    
    -- Locações para o cliente 14
    (14, 8, '2023-08-10', 17.99),
    (14, 10, '2023-09-15', 20.99),
    (14, 12, '2023-10-20', 15.99),
    (14, 14, '2023-11-25', 18.99),
    (14, 16, '2023-12-30', 21.99),
    (14, 18, '2024-01-05', 14.99),
    (14, 20, '2024-02-10', 19.99),
    (14, 22, '2024-03-15', 22.99),
    (14, 24, '2024-04-20', 16.99),
    (14, 26, '2024-05-25', 23.99),
    
    -- Locações para o cliente 15
    (15, 9, '2023-08-10', 18.99),
    (15, 11, '2023-09-15', 21.99),
    (15, 13, '2023-10-20', 16.99),
    (15, 15, '2023-11-25', 19.99),
    (15, 17, '2023-12-30', 22.99),
    (15, 19, '2024-01-05', 15.99),
    (15, 21, '2024-02-10', 20.99),
    (15, 23, '2024-03-15', 23.99),
    (15, 25, '2024-04-20', 17.99),
    (15, 27, '2024-05-25', 24.99),
    
    -- Locações para o cliente 16
    (16, 10, '2023-08-10', 19.99),
    (16, 12, '2023-09-15', 22.99),
    (16, 14, '2023-10-20', 17.99),
    (16, 16, '2023-11-25', 20.99),
    (16, 18, '2023-12-30', 23.99),
    (16, 20, '2024-01-05', 16.99),
    (16, 22, '2024-02-10', 21.99),
    (16, 24, '2024-03-15', 24.99),
    (16, 26, '2024-04-20', 18.99),
    (16, 28, '2024-05-25', 25.99),
    
    -- Locações para o cliente 17
    (17, 11, '2023-08-10', 20.99),
    (17, 13, '2023-09-15', 23.99),
    (17, 15, '2023-10-20', 18.99),
    (17, 17, '2023-11-25', 21.99),
    (17, 19, '2023-12-30', 24.99),
    (17, 21, '2024-01-05', 17.99),
    (17, 23, '2024-02-10', 22.99),
    (17, 25, '2024-03-15', 25.99),
    (17, 27, '2024-04-20', 19.99),
    (17, 29, '2024-05-25', 26.99),
	
    -- Locações para o cliente 18
    (18, 7, '2023-08-10', 16.99),
    (18, 9, '2023-09-15', 19.99),
    (18, 11, '2023-10-20', 14.99),
    (18, 13, '2023-11-25', 17.99),
    (18, 15, '2023-12-30', 20.99),
    (18, 17, '2024-01-05', 13.99),
    (18, 19, '2024-02-10', 18.99),
    (18, 21, '2024-03-15', 21.99),
    (18, 23, '2024-04-20', 15.99),
    (18, 25, '2024-05-25', 22.99),

    -- Locações para o cliente 19
    (19, 8, '2023-08-10', 17.99),
    (19, 10, '2023-09-15', 20.99),
    (19, 12, '2023-10-20', 15.99),
    (19, 14, '2023-11-25', 18.99),
    (19, 16, '2023-12-30', 21.99),
    (19, 18, '2024-01-05', 14.99),
    (19, 20, '2024-02-10', 19.99),
    (19, 22, '2024-03-15', 22.99),
    (19, 24, '2024-04-20', 16.99),
    (19, 26, '2024-05-25', 23.99),
    
    -- Locações para o cliente 20
    (20, 9, '2023-08-10', 18.99),
    (20, 11, '2023-09-15', 21.99),
    (20, 13, '2023-10-20', 16.99),
    (20, 15, '2023-11-25', 19.99),
    (20, 17, '2023-12-30', 22.99),
    (20, 19, '2024-01-05', 15.99),
    (20, 21, '2024-02-10', 20.99),
    (20, 23, '2024-03-15', 23.99),
    (20, 25, '2024-04-20', 17.99),
    (20, 27, '2024-05-25', 24.99),
    
    -- Locações para o cliente 21
    (21, 10, '2023-08-10', 19.99),
    (21, 12, '2023-09-15', 22.99),
    (21, 14, '2023-10-20', 17.99),
    (21, 16, '2023-11-25', 20.99),
    (21, 18, '2023-12-30', 23.99),
    (21, 20, '2024-01-05', 16.99),
    (21, 22, '2024-02-10', 21.99),
    (21, 24, '2024-03-15', 24.99),
    (21, 26, '2024-04-20', 18.99),
    (21, 28, '2024-05-25', 25.99);

-- Questão 1
CREATE VIEW Solução1 AS (
SELECT 
  cliente.nome_cliente, 
  COUNT(locacao.cod_cliente) AS quantidade_locacoes
FROM 
  cliente
JOIN 
  locacao ON cliente.cod_cliente = locacao.cod_cliente
WHERE 
  cliente.cod_cidade = 6 -- Cachoeiro de Itapemirim
GROUP BY 
  cliente.nome_cliente
HAVING 
  COUNT(locacao.cod_cliente) > 10
ORDER BY 
  quantidade_locacoes DESC
);

SELECT * FROM solução1

-- Questão 2
CREATE VIEW Solução2 AS (
SELECT
    gf.nome_genero_filme AS Genero,
    MAX(l.valor_locacao) AS Maior_Valor_Locacao,
    MIN(l.valor_locacao) AS Menor_Valor_Locacao,
    ROUND(AVG(l.valor_locacao), 2) AS Media_Valor_Locacao,
    SUM(l.valor_locacao) AS Soma_Valor_Locacao,
    COUNT(l.cod_filme) AS Quantidade_Locacoes
FROM
    genero_filme gf
JOIN
    filme f ON gf.cod_genero_filme = f.cod_genero_filme
JOIN
    locacao l ON f.cod_filme = l.cod_filme
WHERE
    f.valor_compra > 100
GROUP BY
    gf.nome_genero_filme
HAVING
    COUNT(l.cod_filme) < 1000
ORDER BY
    Quantidade_Locacoes DESC
);

SELECT * FROM solução2

-- Questão 3
CREATE view Solução3 AS (
SELECT 
    u.sigla_uf AS nome_uf,
    COUNT(l.cod_cliente) AS soma_total_locacoes,
    ROUND(AVG(l.valor_locacao), 2) AS valor_medio_locacoes
FROM locacao l
JOIN cliente c ON l.cod_cliente = c.cod_cliente
JOIN cidade ci ON c.cod_cidade = ci.cod_cidade
JOIN uf u ON ci.sigla_uf = u.sigla_uf
WHERE l.valor_locacao >= 2 AND ci.nome_cidade LIKE 'C%'
    AND u.sigla_uf IN ('RJ', 'SP', 'ES', 'MG', 'BA', 'PE')
GROUP BY u.sigla_uf
ORDER BY u.sigla_uf
);

SELECT * FROM solução3
