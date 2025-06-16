CREATE SCHEMA schFavoritos;

CREATE TABLE schFavoritos.StatusTipo (
    tipCodi INT PRIMARY KEY,
    tipDesc VARCHAR(50) NOT NULL,
    tipStat bit NOT NULL
);

CREATE TABLE schFavoritos.Status (
    sttCodi INT PRIMARY KEY,
    sttDesc VARCHAR(50) NOT NULL,
    tipCodi INT NOT NULL,
    CONSTRAINT FK_StatusTipo FOREIGN KEY (tipCodi) REFERENCES schFavoritos.StatusTipo(tipCodi)
);

CREATE TABLE schFavoritos.SttTpo (
    sttTpoC INT PRIMARY KEY,
    sttCodi INT NOT NULL,
    tipCodi INT NOT NULL,
    CONSTRAINT FK_SttStatus FOREIGN KEY (sttCodi) REFERENCES schFavoritos.Status(sttCodi),
    CONSTRAINT FK_SttStatusTipo FOREIGN KEY (tipCodi) REFERENCES schFavoritos.StatusTipo(tipCodi)
);

CREATE TABLE schFavoritos.Categoria (
    catCodi INT PRIMARY KEY,
    catDesc VARCHAR(250) NOT NULL,
    catPai INT NULL,
    sttCodi INT NOT NULL,
    CONSTRAINT FK_Categoria_Categoria FOREIGN KEY (catPai) REFERENCES schFavoritos.Categoria(catCodi)
);

CREATE TABLE schFavoritos.Site (
    sitCodi INT PRIMARY KEY,
    sitDesc VARCHAR(100) NOT NULL,
    sitLink VARCHAR(1000) NOT NULL,
    sitObse VARCHAR(1000) NOT NULL,
    sttCodi INT NOT NULL,
    catCodi INT NOT NULL,
    CONSTRAINT FK_SttCodi_Site FOREIGN KEY (sttCodi) REFERENCES schFavoritos.Status(sttCodi),
    CONSTRAINT FK_Cat_Site FOREIGN KEY (catCodi) REFERENCES schFavoritos.Categoria(catCodi)
);

