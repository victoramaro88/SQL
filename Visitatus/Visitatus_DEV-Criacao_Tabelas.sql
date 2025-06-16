CREATE TABLE DB_Visitatus_DEV.dbo.TipoSessao (
	tiSCodi int primary key NOT NULL,
	tiSNome varchar(500) NOT NULL,
	tiSStat bit NOT NULL
)
INSERT INTO DB_Visitatus_DEV.dbo.TipoSessao
(tiSCodi, tiSNome, tiSStat)
VALUES
(1, 'Ordinária', 1),
(2, 'Iniciação', 1),
(3, 'Passagem', 1),
(4, 'Elevação', 1),
(5, 'Exaltação', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Grau (
	graCodi int primary key NOT NULL,
	graNome varchar(250) NOT NULL,
	graStat bit NOT NULL
)
INSERT INTO DB_Visitatus_DEV.dbo.Grau
(graCodi, graNome, graStat)
VALUES
(1, 'Aprendiz', 1),
(2, 'Companheiro', 1),
(3, 'Mestre', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Rito (
	ritCodi int primary key NOT NULL,
	ritNome varchar(250) NOT NULL,
	ritLogo varchar(MAX) NULL,
	ritStat bit NOT NULL
)
INSERT INTO DB_Visitatus_DEV.dbo.Rito
(ritCodi, ritNome, ritLogo, ritStat)
VALUES
(1, 'York', 'Imagem Base64 do Rito', 1),
(2, 'REAA - Rito Escocês Antigo e Aceito', 'Imagem Base64 do Rito', 1),
(3, 'Brasileiro', 'Imagem Base64 do Rito', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Potencia (
	potCodi int primary key NOT NULL,
	potNome varchar(250) NOT NULL,
	potSigl varchar(10) NOT NULL,
	potLogo varchar(MAX) NOT NULL,
	potRegu bit NOT NULL,
	potStat bit NOT NULL
)
INSERT INTO DB_Visitatus_DEV.dbo.Potencia
(potCodi, potNome, potLogo, potRegu, potStat)
VALUES
(1, 'GOB - Grande Oriente do Brasil', 'Imagem Base64 da Potência', 1, 1),
(2, 'GOP - Grande Oriente Paulista', 'Imagem Base64 da Potência', 1, 1),
(3, 'GLESP - Grande Loja do Estado de São Paulo', 'Imagem Base64 da Potência', 1, 1),
(4, 'Brasileiro', 'Imagem Base64 do Rito', 1, 1),
(5, 'GOSP - Grande Oriente do Estado de São Paulo', 'Imagem Base64 do Rito', 0, 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Permissao (
	pemCodi int primary key NOT NULL,
	pemNome varchar(100) NOT NULL,
	pemStat bit NOT NULL
)
INSERT INTO DB_Visitatus_DEV.dbo.Permissao
(pemCodi, pemNome, pemStat)
VALUES
(1, 'Cadastro Loja', 1),
(2, 'Cadastro Potência', 1),
(3, 'Cadastro Rito', 1),
(4, 'Cadastro Sessão', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Perfil (
	perCodi int primary key NOT NULL,
	perNome varchar(100) NOT NULL,
	perStat bit NOT NULL
)
INSERT INTO DB_Visitatus_DEV.dbo.Perfil
(perCodi, perNome, perStat)
VALUES
(337, 'Administrador', 1),
(2, 'Responsável Loja', 1),
(3, 'Visitante', 1),
(4, 'Membro', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.PermissaoPerfil (
    perCodi int NOT NULL,
    pemCodi int NOT NULL,
    papAtvo bit NOT NULL,
    pepStat bit NOT NULL,
    PRIMARY KEY (perCodi, pemCodi),
    FOREIGN KEY (perCodi) REFERENCES Perfil(perCodi),
    FOREIGN KEY (pemCodi) REFERENCES Permissao(pemCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Estado (
	estCodi int primary key NOT NULL,
	estNome varchar(250) NOT NULL,
	estSigl varchar(2) NOT NULL,
	estStat bit NOT NULL
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Cidade (
	cidCodi bigint primary key NOT NULL,
	cidNome varchar(500) NOT NULL,
	cidStat bit NOT NULL,
	estCodi int NOT NULL,
	CONSTRAINT fk_CidEst FOREIGN KEY (estCodi) REFERENCES DB_Visitatus_DEV.dbo.Estado(estCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Loja (
    lojCodi bigint primary key NOT NULL,
    lojNome varchar(1000) NOT NULL,
    lojNumL varchar(10) NOT NULL,
    lojLogo varchar(max) NULL,
    lojLogr varchar(500) NULL,    
    lojNume varchar(10) NULL,    
    lojBair varchar(500) NULL,
    lojStat bit NOT NULL,
    cidCodi bigint NULL,
    potCodi int NOT NULL,
    ritCodi int NULL,
    CONSTRAINT fk_CidLoj FOREIGN KEY (cidCodi) REFERENCES DB_Visitatus_DEV.dbo.Cidade(cidCodi),
    CONSTRAINT fk_PotLoj FOREIGN KEY (potCodi) REFERENCES DB_Visitatus_DEV.dbo.Potencia(potCodi),
    CONSTRAINT fk_RitLoj FOREIGN KEY (ritCodi) REFERENCES DB_Visitatus_DEV.dbo.Rito(ritCodi),
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Usuario (
	usuCodi bigint primary key NOT NULL,
	usuNome varchar(250) NOT NULL,
	usuNCIM varchar(10) NOT NULL,
	usuNasc datetime NOT NULL,
	usuEmai varchar(200) NOT NULL,
	usuNCel varchar(11) NOT NULL,
	usuStat bit NOT NULL
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.PerfilUsuario (
	peUCodi int primary key NOT NULL,
	peUStat bit NOT NULL,
	perCodi int NOT NULL,
	usuCodi bigint NOT NULL,
	lojCodi bigint NOT NULL,
	CONSTRAINT fk_PeUPer FOREIGN KEY (perCodi) REFERENCES DB_Visitatus_DEV.dbo.Perfil(perCodi),
	CONSTRAINT fk_PeUUsu FOREIGN KEY (usuCodi) REFERENCES DB_Visitatus_DEV.dbo.Usuario(usuCodi),
	CONSTRAINT fk_PeULoj FOREIGN KEY (lojCodi) REFERENCES DB_Visitatus_DEV.dbo.Loja(lojCodi),
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.UsuarioLoja (
	usuCodi bigint NOT NULL,
	lojCodi bigint NOT NULL,
    usLStat bit NOT NULL,
    PRIMARY KEY (usuCodi, lojCodi),
    FOREIGN KEY (usuCodi) REFERENCES Usuario(usuCodi),
    FOREIGN KEY (lojCodi) REFERENCES Loja(lojCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.UsuarioLogin (
	usLCodi bigint primary key NOT NULL,
	usLUser varchar(50) NOT NULL,
	usLPass varchar(500) NOT NULL,
	usLStat bit NOT NULL,
	usuCodi bigint NOT NULL,
	CONSTRAINT fk_UsuLogin FOREIGN KEY (usuCodi) REFERENCES DB_Visitatus_DEV.dbo.Usuario(usuCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Sessao (
	sesCodi bigint primary key NOT NULL,
	sesDesc varchar(500) NOT NULL,
	sesDtHr datetime NOT NULL,
	sesLibe bit NOT NULL,
	sesStat bit NOT NULL,
	lojCodi bigint NOT NULL,
	graCodi int NOT NULL,
	tiSCodi int NOT NULL,
	sesNume bigint NULL,
	sesNome varchar(100) NOT NULL,
	CONSTRAINT fk_SessLoj FOREIGN KEY (lojCodi) REFERENCES DB_Visitatus_DEV.dbo.Loja(lojCodi),
	CONSTRAINT fk_SessGra FOREIGN KEY (graCodi) REFERENCES DB_Visitatus_DEV.dbo.Grau(graCodi),
	CONSTRAINT fk_SessTiS FOREIGN KEY (tiSCodi) REFERENCES DB_Visitatus_DEV.dbo.TipoSessao(tiSCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Presenca (
	usuCodi bigint NOT NULL,
	sesCodi bigint NOT NULL,
	lojCodi bigint NOT NULL,
    preAtiv bit NOT NULL,
    PRIMARY KEY (usuCodi, sesCodi, lojCodi),
    FOREIGN KEY (usuCodi) REFERENCES DB_Visitatus_DEV.dbo.Usuario(usuCodi),
    FOREIGN KEY (sesCodi) REFERENCES DB_Visitatus_DEV.dbo.Sessao(sesCodi),
    FOREIGN KEY (lojCodi) REFERENCES DB_Visitatus_DEV.dbo.Loja(lojCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.TemplateConvite (
	tmpCvtCodi int primary key NOT NULL,
	tmpCvtNome varchar(250) NOT NULL,
	tmpCvtMode varchar(MAX) NOT NULL,
	tmpCvtStat bit NOT NULL
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.TemplateLoja (
	tmpCvtCodi int NOT NULL,
	lojCodi bigint NOT NULL,
	tmpLjStat bit NOT NULL,
	PRIMARY KEY (tmpCvtCodi, lojCodi),
    FOREIGN KEY (tmpCvtCodi) REFERENCES DB_Visitatus_DEV.dbo.TemplateConvite(tmpCvtCodi),
    FOREIGN KEY (lojCodi) REFERENCES DB_Visitatus_DEV.dbo.Loja(lojCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.Cargos (
	carCodi bigint primary key NOT NULL,
	carNome varchar(100) NOT NULL,
	carDesc varchar(300) NULL,
	carStat bit NOT NULL
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.CargosRito (
	carCodi bigint NOT NULL,
	ritCodi int NOT NULL,
	cariOrdm int NOT NULL,
	cariStat bit NOT NULL,
	PRIMARY KEY (carCodi, ritCodi),
    FOREIGN KEY (carCodi) REFERENCES DB_Visitatus_DEV.dbo.Cargos(carCodi),
    FOREIGN KEY (ritCodi) REFERENCES DB_Visitatus_DEV.dbo.Rito(ritCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.GestaoAdministrativa (
	gstAdmCodi bigint primary key NOT NULL,
	gstAdmNome varchar(100) NOT NULL,
	gstAdmDtIn date NOT NULL,
	gstAdmDtFi date NOT NULL,
	gstAdmStat bit NOT NULL,
	lojCodi bigint NOT NULL,
	CONSTRAINT fk_gstAdmLj FOREIGN KEY (lojCodi) REFERENCES DB_Visitatus_DEV.dbo.Loja(lojCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.GestaoCargos (
	gstAdmCodi bigint NOT NULL,
	carCodi bigint NOT NULL,
	usuCodi bigint NOT NULL,
	gstCarStat bit NOT NULL,
	PRIMARY KEY (gstAdmCodi, carCodi, usuCodi),
    FOREIGN KEY (gstAdmCodi) REFERENCES DB_Visitatus_DEV.dbo.GestaoAdministrativa(gstAdmCodi),
    FOREIGN KEY (carCodi) REFERENCES DB_Visitatus_DEV.dbo.Cargos(carCodi),
    FOREIGN KEY (usuCodi) REFERENCES DB_Visitatus_DEV.dbo.Usuario(usuCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.TemplateCertificadoPresenca (
	tmpCrtPreCodi int primary key NOT NULL,
	tmpCrtPreNome varchar(250) NOT NULL,
	tmpCrtPreMode varchar(MAX) NOT NULL,
	tmpCrtPreStat bit NOT NULL
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_Visitatus_DEV.dbo.TemplateCertificadoLoja (
	tmpCrtPreCodi int NOT NULL,
	lojCodi bigint NOT NULL,
	tmpCrtStat bit NOT NULL,
	PRIMARY KEY (tmpCrtPreCodi, lojCodi),
    FOREIGN KEY (tmpCrtPreCodi) REFERENCES DB_Visitatus_DEV.dbo.TemplateCertificadoPresenca(tmpCrtPreCodi),
    FOREIGN KEY (lojCodi) REFERENCES DB_Visitatus_DEV.dbo.Loja(lojCodi)
);

/*-------------------------------------------------------------*/




















