CREATE TABLE DB_BetterLife.dbo.TipoContato (
	ticCodi smallint primary key NOT NULL,
	ticDesc varchar(100) NOT NULL,
	ticStat bit NOT NULL
)
INSERT INTO DB_BetterLife.dbo.TipoContato
(ticCodi, ticDesc, ticStat)
VALUES
(1, 'Celular', 1),
(2, 'E-mail', 1),
(3, 'Telefone Fixo', 1),
(4, 'Telefone Contato', 1),
(5, 'Celular Contato', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.Contato (
	cttCodi bigint primary key NOT NULL,
	cttDesc varchar(500) NOT NULL,
	cttStat bit NOT NULL,
	ticCodi smallint NOT NULL,
	CONSTRAINT fk_CttTipCtt FOREIGN KEY (ticCodi) REFERENCES DB_BetterLife.dbo.TipoContato(ticCodi)	
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.TipoUsuario (
	tusCodi smallint primary key NOT NULL,
	tusDesc varchar(100) NOT NULL,
	tusStat bit NOT NULL
)
INSERT INTO DB_BetterLife.dbo.TipoUsuario
(tusCodi, tusDesc, tusStat)
VALUES
(1, 'Administrador', 1),
(2, 'Usuário', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.Genero (
	genCodi smallint primary key NOT NULL,
	genDesc varchar(100) NOT NULL,
	genStat bit NOT NULL
)
INSERT INTO DB_BetterLife.dbo.Genero
(genCodi, genDesc, genStat)
VALUES
(1, 'Masculino', 1),
(2, 'Feminino', 1),
(3, 'Prefiro não informar', 1),
(4, 'Outro', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.TipoPessoa (
	tipCodi smallint primary key NOT NULL,
	tipDesc varchar(100) NOT NULL,
	tipStat bit NOT NULL
)
INSERT INTO DB_BetterLife.dbo.TipoPessoa
(tipCodi, tipDesc, tipStat)
VALUES
(1, 'Médico', 1),
(2, 'Colaborador', 1),
(3, 'Paciente', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.TipoCirurgia (
	tpcCodi int primary key NOT NULL,
	tpcDesc varchar(500) NOT NULL,
	tpcStat bit NOT NULL
)
INSERT INTO DB_BetterLife.dbo.TipoCirurgia
(tpcCodi, tpcDesc, tpcStat)
VALUES
(1, 'Sleeve / Gastrectomia Vertical', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.Hospital (
	hosCodi int primary key NOT NULL,
	hosDesc varchar(1000) NOT NULL,
	hosStat bit NOT NULL
)
INSERT INTO DB_BetterLife.dbo.Hospital
(hosCodi, hosDesc, hosStat)
VALUES
(1, 'Leforte Liberdade', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.TipoDocumento (
	tidCodi smallint primary key NOT NULL,
	tidDesc varchar(100) NOT NULL,
	tidStat bit NOT NULL
)
INSERT INTO DB_BetterLife.dbo.TipoDocumento
(tidCodi, tidDesc, tidStat)
VALUES
(1, 'CPF', 1),
(2, 'CRM', 1),
(3, 'CNH', 1),
(4, 'RG', 1);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.Consultorio (
	conCodi int primary key NOT NULL,
	conDesc varchar(500) NOT NULL,
	conStat bit NOT NULL,
	conFoto varchar(MAX) NULL
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.Pessoa (
	pesCodi bigint primary key NOT NULL,
	pesNome varchar(500) NOT NULL,
	pesFoto varchar(max) NOT NULL,
	pesNasc date NOT NULL,
	pesStat bit NOT NULL,
	tipCodi smallint NOT NULL,
	genCodi smallint NOT NULL,
	CONSTRAINT fk_TipCodiPesCod FOREIGN KEY (tipCodi) REFERENCES DB_BetterLife.dbo.TipoPessoa(tipCodi),
	CONSTRAINT fk_GenCodiPesCod FOREIGN KEY (genCodi) REFERENCES DB_BetterLife.dbo.Genero(genCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.UsuarioPessoa (
	usuCodi bigint primary key NOT NULL,
	usuLogi varchar(50) NOT NULL,
	usuSenh varchar(100) NOT NULL,
	usuStat bit NOT NULL,
	pesCodi bigint NOT NULL,
	tusCodi smallint NOT NULL,
	CONSTRAINT fk_PesCodUsuCodi FOREIGN KEY (pesCodi) REFERENCES DB_BetterLife.dbo.Pessoa(pesCodi),
	CONSTRAINT fk_PesCodTusCodi FOREIGN KEY (tusCodi) REFERENCES DB_BetterLife.dbo.TipoUsuario(tusCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.Documento (
	docCodi bigint primary key NOT NULL,
	docNume varchar(100) NOT NULL,
	docStat bit NOT NULL,
	pesCodi bigint NOT NULL,
	tidCodi smallint NOT NULL,
	CONSTRAINT fk_PesCodDocCodi FOREIGN KEY (pesCodi) REFERENCES DB_BetterLife.dbo.Pessoa(pesCodi),
	CONSTRAINT fk_PesCodTidCodi FOREIGN KEY (tidCodi) REFERENCES DB_BetterLife.dbo.TipoDocumento(tidCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.PessoaConsultorio (
	pecCodi int primary key NOT NULL,
	pecStat bit NOT NULL,
	pesCodi bigint NOT NULL,
	conCodi int NOT NULL,
	CONSTRAINT fk_PecCodPesCodi FOREIGN KEY (pesCodi) REFERENCES DB_BetterLife.dbo.Pessoa(pesCodi),
	CONSTRAINT fk_PecCodConCodi FOREIGN KEY (conCodi) REFERENCES DB_BetterLife.dbo.Consultorio(conCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.PessoaContato (
	pctCodi bigint primary key NOT NULL,
	pctStat bit NOT NULL,
	pesCodi bigint NOT NULL,
	cttCodi bigint NOT NULL,
	CONSTRAINT fk_PctCodiPesCodi FOREIGN KEY (pesCodi) REFERENCES DB_BetterLife.dbo.Pessoa(pesCodi),
	CONSTRAINT fk_PctCodiCttCodi FOREIGN KEY (cttCodi) REFERENCES DB_BetterLife.dbo.Contato(cttCodi)
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.CarteiraBariatrica (
	carCodi bigint primary key NOT NULL,
	carDtCi date NOT NULL,
	tpcCodi int NOT NULL,
	hosCodi int NOT NULL,
	pesCodi bigint NOT NULL,
	pecCodi int NOT NULL,
	catStat bit NOT NULL,
	tusCodi 
	CONSTRAINT fk_CarCodiTpcCodi FOREIGN KEY (tpcCodi) REFERENCES DB_BetterLife.dbo.TipoCirurgia(tpcCodi),
	CONSTRAINT fk_CarCodiHosCodi FOREIGN KEY (hosCodi) REFERENCES DB_BetterLife.dbo.Hospital(hosCodi),
	CONSTRAINT fk_CarCodiPesCodi FOREIGN KEY (pesCodi) REFERENCES DB_BetterLife.dbo.Pessoa(pesCodi),
	CONSTRAINT fk_CarCodiPecCodi FOREIGN KEY (pecCodi) REFERENCES DB_BetterLife.dbo.PessoaConsultorio(pecCodi),
);

/*-------------------------------------------------------------*/

CREATE TABLE DB_BetterLife.dbo.Permissao (
	perCodi int primary key NOT NULL,
	perDesc varchar(500) NOT NULL,
	perAtiv bit NOT NULL,
	perStat bit NOT NULL,
	tusCodi smallint NOT NULL,
	CONSTRAINT fk_PesCodiTusCodi FOREIGN KEY (tusCodi) REFERENCES DB_BetterLife.dbo.TipoUsuario(tusCodi)
);
