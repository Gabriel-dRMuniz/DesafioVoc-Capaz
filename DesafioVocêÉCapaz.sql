CREATE TABLE Atores (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PrimeiroNome VARCHAR(20) NULL,
    UltimoNome VARCHAR(20) NULL,
    Genero VARCHAR(1) NULL
);

CREATE TABLE Filmes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NULL,
    Ano INT NULL,
    Duracao INT NULL
);

CREATE TABLE Genero (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdGenero VARCHAR(20) NULL
);

CREATE TABLE FilmesGenero (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdGenero INT NULL,
    IdFilme INT NULL,
    FOREIGN KEY (IdGenero) REFERENCES Genero(Id),
    FOREIGN KEY (IdFilme) REFERENCES Filmes(Id)
);

CREATE TABLE ElencoFilme (
    Id INT PRIMARY KEY IDENTITY(1,1),
    IdAtor INT NOT NULL,
    IdFilme INT NULL,
    Papel VARCHAR(30) NULL,
    FOREIGN KEY (IdAtor) REFERENCES Atores(Id),
    FOREIGN KEY (IdFilme) REFERENCES Filmes(Id)
);


INSERT INTO Atores ( PrimeiroNome, UltimoNome, Genero) VALUES
( 'João', 'Silva', 'M'),
( 'Maria', 'Oliveira', 'F'),
( 'Carlos', 'Santos', 'M'),
( 'Ana', 'Costa', 'F'),
( 'Pedro', 'Souza', 'M'),
( 'Juliana', 'Lima', 'F'),
( 'Lucas', 'Ferreira', 'M'),
( 'Fernanda', 'Almeida', 'F'),
( 'Rafael', 'Gomes', 'M'),
( 'Patrícia', 'Martins', 'F');

INSERT INTO Filmes ( Nome, Ano, Duracao) VALUES
( 'O Resgate', 2010, 120),
('Amor em Fuga', 2012, 110),
( 'Noite Sombria', 2015, 105),
( 'Risada Fatal', 2013, 115),
( 'Além do Horizonte', 2018, 130),
( 'Coração Selvagem', 2011, 125),
( 'Segredo Perdido', 2014, 100),
( 'Planeta dos Sonhos', 2017, 140),
( 'Ritmo do Coração', 2016, 95),
( 'Destino Final', 2019, 135);



SELECT * FROM Genero
SELECT * FROM FilmesGenero
SELECT * FROM Filmes
SELECT * FROM ElencoFilme
SELECT * FROM Atores

INSERT INTO Genero (IdGenero) VALUES
( 'Ação'),
( 'Romance'),
( 'Terror'),
( 'Comédia'),
( 'Drama'),
( 'Suspense'),
( 'Animação'),
( 'Ficção Científica'),
( 'Musical'),
( 'Fantasia');


DROP TABLE Atores
DROP TABLE ElencoFilme
DROP TABLE Filmes
DROP TABLE FilmesGenero
DROP TABLE Genero

INSERT INTO FilmesGenero ( IdGenero, IdFilme) VALUES
( 1, 1),
( 2, 2),
( 3, 3),
( 4, 4),
( 5, 5),
( 6, 6),
( 7, 7),
( 8, 8),
( 9, 9),
( 10, 10);

INSERT INTO ElencoFilme ( IdAtor, IdFilme, Papel) VALUES
( 1, 1, 'Protagonista'),
( 2, 2, 'Co-Protagonista'),
( 3, 3, 'Vilão'),
( 4, 4, 'Coadjuvante'),
( 5, 5, 'Protagonista'),
( 6, 6, 'Coadjuvante'),
( 7, 7, 'Protagonista'),
( 8, 8, 'Vilão'),
( 9, 9, 'Co-Protagonista'),
( 10, 10, 'Coadjuvante');



--1 - Buscar o nome e ano dos filmes
SELECT Nome,Ano
FROM Filmes


--2 Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome,Ano
FROM Filmes
ORDER BY Ano ASC


--3 - Buscar pelo filme O Resgate, trazendo o nome, ano e a duração

SELECT *
FROM Filmes
WHERE Nome='O Resgate'

--Buscar os filmes lançados em 1997

SELECT *
FROM Filmes
WHERE Ano = '1997'

--5 - Buscar os filmes lançados APÓS o ano 2000

SELECT *
FROM Filmes
WHERE Ano>1999

--6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

SELECT * 
FROM Filmes
WHERE Duracao >=100 AND Duracao<=150


--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

SELECT Ano,
COUNT(*) TotalDeFilmesPorAno
FROM Filmes
WHERE Ano <> ''
GROUP BY Ano

--8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT PrimeiroNome,UltimoNome
FROM Atores
WHERE Genero='M'

--9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome,UltimoNome
FROM Atores
WHERE Genero='F'
ORDER BY PrimeiroNome ASC


--10 - Buscar o nome do filme e o gênero

SELECT Filmes.Nome, IdGenero
FROM Filmes, Genero

--11 - Buscar o nome do filme e o gênero do tipo "Suspense"

SELECT Filmes.Nome, IdGenero
FROM Filmes,Genero
WHERE IdGenero='Suspense'


--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

SELECT Filmes.Nome,Atores.PrimeiroNome,Atores.UltimoNome,ElencoFilme.Papel
FROM Filmes,Atores,ElencoFilme