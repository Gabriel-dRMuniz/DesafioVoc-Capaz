CREATE TABLE Atores(
Id INT PRIMARY KEY NOT NULL,
PrimeiroNome VARCHAR(20) NULL,
UltimoNome VARCHAR(20) NULL,
Genero VARCHAR(1) NULL
)

CREATE TABLE ElencoFilme
(
Id INT PRIMARY KEY NOT NULL,
IdAtor INT NOT NULL,
FOREIGN KEY(idAtor)REFERENCES Atores(Id),
IdFilme INT NULL,
FOREIGN KEY(IdFilme)REFERENCES Filmes(Id),
Papel VARCHAR(30) NULL
)

CREATE TABLE Filmes
(
Id INT PRIMARY KEY NOT NULL,
Nome VARCHAR(50) NULL,
Ano INT NULL,
Duracao INT NULL
)

CREATE TABLE FilmesGenero
(
Id INT PRIMARY KEY NOT NULL,
IdGenero INT NULL,
FOREIGN KEY(IdGenero)REFERENCES Genero(Id),
IdFilme INT NULL,
FOREIGN KEY(IdFilme)REFERENCES Filmes(Id),
)

CREATE TABLE Genero
(
Id INT PRIMARY KEY NOT NULL,
IdGenero VARCHAR(20) NULL
)

INSERT INTO Atores (Id, PrimeiroNome, UltimoNome, Genero) VALUES
(1, 'João', 'Silva', 'M'),
(2, 'Maria', 'Oliveira', 'F'),
(3, 'Carlos', 'Santos', 'M'),
(4, 'Ana', 'Costa', 'F'),
(5, 'Pedro', 'Souza', 'M'),
(6, 'Juliana', 'Lima', 'F'),
(7, 'Lucas', 'Ferreira', 'M'),
(8, 'Fernanda', 'Almeida', 'F'),
(9, 'Rafael', 'Gomes', 'M'),
(10, 'Patrícia', 'Martins', 'F');

INSERT INTO Filmes (Id, Nome, Ano, Duracao) VALUES
(1, 'O Resgate', 2010, 120),
(2, 'Amor em Fuga', 2012, 110),
(3, 'Noite Sombria', 2015, 105),
(4, 'Risada Fatal', 2013, 115),
(5, 'Além do Horizonte', 2018, 130),
(6, 'Coração Selvagem', 2011, 125),
(7, 'Segredo Perdido', 2014, 100),
(8, 'Planeta dos Sonhos', 2017, 140),
(9, 'Ritmo do Coração', 2016, 95),
(10, 'Destino Final', 2019, 135);



SELECT * FROM Genero
SELECT * FROM FilmesGenero
SELECT * FROM Filmes
SELECT * FROM ElencoFilme
SELECT * FROM Atores

INSERT INTO Genero (Id, IdGenero) VALUES
(1, 'Ação'),
(2, 'Romance'),
(3, 'Terror'),
(4, 'Comédia'),
(5, 'Drama'),
(6, 'Suspense'),
(7, 'Animação'),
(8, 'Ficção Científica'),
(9, 'Musical'),
(10, 'Fantasia');


DROP TABLE Atores
DROP TABLE ElencoFilme
DROP TABLE Filmes
DROP TABLE FilmesGenero
DROP TABLE Genero

INSERT INTO FilmesGenero (Id, IdGenero, IdFilme) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

INSERT INTO ElencoFilme (Id, IdAtor, IdFilme, Papel) VALUES
(1, 1, 1, 'Protagonista'),
(2, 2, 2, 'Co-Protagonista'),
(3, 3, 3, 'Vilão'),
(4, 4, 4, 'Coadjuvante'),
(5, 5, 5, 'Protagonista'),
(6, 6, 6, 'Coadjuvante'),
(7, 7, 7, 'Protagonista'),
(8, 8, 8, 'Vilão'),
(9, 9, 9, 'Co-Protagonista'),
(10, 10, 10, 'Coadjuvante');



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



--11 - Buscar o nome do filme e o gênero do tipo "Mistério"12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel