CREATE TABLE DB_Visitatus_DEV.dbo.OrientacaoLoja (
	orlCodi bigint NOT NULL,
	orlDesc varchar(MAX) NULL,
	orlDtHr datetime NOT NULL,
	orlStat bit NOT NULL,
	lojCodi bigint NOT NULL,
	usuCodi bigint NOT NULL,
	PRIMARY KEY (orlCodi),
    FOREIGN KEY (lojCodi) REFERENCES DB_Visitatus_DEV.dbo.Loja(lojCodi),
    FOREIGN KEY (usuCodi) REFERENCES DB_Visitatus_DEV.dbo.Usuario(usuCodi)
);



CREATE TABLE DB_Visitatus_DEV.dbo.AusenciaSessao (
	ausSesCodi bigint NOT NULL,
	ausSecMoti varchar(250) NOT NULL,
	ausSecDtHr datetime NOT NULL,
	ausSecStat bit NOT NULL,	
	usuCodi bigint NOT NULL,
	sesCodi bigint NOT NULL,
	PRIMARY KEY (ausSesCodi),
    FOREIGN KEY (usuCodi) REFERENCES DB_Visitatus_DEV.dbo.Usuario(usuCodi),
    FOREIGN KEY (sesCodi) REFERENCES DB_Visitatus_DEV.dbo.Sessao(sesCodi)
);



SELECT * FROM DB_Visitatus_DEV.dbo.OrientacaoLoja;

SELECT * FROM DB_Visitatus_DEV.dbo.AusenciaSessao;

SELECT * FROM DB_Visitatus_DEV.dbo.Sessao where sesLibe = 0;



--==========================================================================================================



CREATE TABLE DB_Visitatus.dbo.OrientacaoLoja (
	orlCodi bigint NOT NULL,
	orlDesc varchar(MAX) NULL,
	orlDtHr datetime NOT NULL,
	orlStat bit NOT NULL,
	lojCodi bigint NOT NULL,
	usuCodi bigint NOT NULL,
	PRIMARY KEY (orlCodi),
    FOREIGN KEY (lojCodi) REFERENCES DB_Visitatus.dbo.Loja(lojCodi),
    FOREIGN KEY (usuCodi) REFERENCES DB_Visitatus.dbo.Usuario(usuCodi)
);



CREATE TABLE DB_Visitatus.dbo.AusenciaSessao (
	ausSesCodi bigint NOT NULL,
	ausSecMoti varchar(250) NOT NULL,
	ausSecDtHr datetime NOT NULL,
	ausSecStat bit NOT NULL,	
	usuCodi bigint NOT NULL,
	sesCodi bigint NOT NULL,
	PRIMARY KEY (ausSesCodi),
    FOREIGN KEY (usuCodi) REFERENCES DB_Visitatus.dbo.Usuario(usuCodi),
    FOREIGN KEY (sesCodi) REFERENCES DB_Visitatus.dbo.Sessao(sesCodi)
);



SELECT * FROM DB_Visitatus.dbo.OrientacaoLoja;

SELECT * FROM DB_Visitatus.dbo.AusenciaSessao;

SELECT * FROM DB_Visitatus.dbo.Sessao where sesLibe = 0;