--> SCRIPT DE CRIAÇÃO DE TABELAS DO GESTAO ADMINISTRATIVA:

CREATE DATABASE DB_GESTAO_ADM;
GO

USE DB_GESTAO_ADM;
GO

CREATE SCHEMA SchNume;
GO

-------------------------------------------------------------------------------------

CREATE TABLE SchNume.TipDadoAdic (
    tipdadCodi INT PRIMARY KEY,
    dadDescr VARCHAR(50) NOT NULL,
    tipdadAtv bit NOT NULL
);
GO

INSERT INTO SchNume.TipDadoAdic (tipdadCodi, dadDescr, tipdadAtv)
VALUES 
(1, 'Texto', 1),
(2, 'Número', 1)
;
GO

-------------------------------------------------------------------------------------

CREATE TABLE SchNume.ModNume (
    modNumCodi INT PRIMARY KEY,
    modNumDesc VARCHAR(50) NOT NULL,
    modNumAtv BIT NOT NULL
);
GO

INSERT INTO SchNume.ModNume (modNumCodi, modNumDesc, modNumAtv)
VALUES 
(1, 'Ostensivo', 1),
(2, 'Reservado', 1)
;
GO

-------------------------------------------------------------------------------------

CREATE TABLE SchNume.TipoNume (
    tipNumCodi INT PRIMARY KEY,
    tipNumDesc VARCHAR(50) NOT NULL,
    tipNumAss VARCHAR(250) NULL,
    tipNumDest  VARCHAR(250) NULL,
    tipNumAtv BIT NOT NULL,
    uorOpmCod SMALLINT NOT NULL,
    CONSTRAINT fk_TipoNume_uorOpmCod FOREIGN KEY (uorOpmCod) REFERENCES SchNume.TipoNume(uorOpmCod)
);
GO

INSERT INTO SchNume.TipoNume (tipNumCodi, tipNumDesc, tipNumAss, tipNumDest, tipNumAtv, uorOpmCod)
VALUES 
(1, 'PARTE', NULL, NULL, 1, 1),
(2, 'OFÍCIO', NULL, NULL, 1, 1),
(3, 'INFORMAÇÕES MENSAIS', 'Informações Mensais', 'Cmt 13GB', 1, 600),
(4, 'MEMORANDO', NULL, NULL, 1, 1)
;
GO

-------------------------------------------------------------------------------------

CREATE TABLE SchNume.DadosAdic (
    dadCodi BIGINT PRIMARY KEY,
    dadDescr VARCHAR(250) NOT NULL,
    dadAtv BIT NOT NULL,
    tipNumCodi INT NOT NULL,
    tipdadCodi INT NOT NULL,
    CONSTRAINT fk_DadosAdic_tipNumCodi FOREIGN KEY (tipNumCodi) REFERENCES SchNume.TipoNume(tipNumCodi),
    CONSTRAINT fk_DadosAdic_tipdadCodi FOREIGN KEY (tipdadCodi) REFERENCES SchNume.TipDadoAdic(tipdadCodi)
);
GO

INSERT INTO SchNume.DadosAdic (dadCodi, dadDescr, dadAtv, tipNumCodi, tipdadCodi)
VALUES 
(1, 'Valor Conta de Energia (R$)', 1, 3, 2),
(2, 'Valor Conta de Água (R$)', 1, 3, 2),
(3, 'Informações para texto', 1, 3, 1)
;
GO

-------------------------------------------------------------------------------------

CREATE TABLE SchNume.Numerador (
    numCodi BIGINT PRIMARY KEY,
    numDthr DATETIME NOT NULL,
    numAssu VARCHAR(200) NOT NULL,
    numReme VARCHAR(100) NOT NULL,
    numDest VARCHAR(100) NOT NULL,
    numNumSEI VARCHAR(100) NULL,
    numAtv BIT NOT NULL,
    pesIdf BIGINT NOT NULL,
    tipNumCodi INT NOT NULL,
    modNumCodi INT NOT NULL,
    CONSTRAINT fk_Numerador_pesIdf FOREIGN KEY (pesIdf) REFERENCES DB_CORP_CCB.SchCRPCCB.PES(pesIdf),
    CONSTRAINT fk_Numerador_tipNumCodi FOREIGN KEY (tipNumCodi) REFERENCES SchNume.TipoNume(tipNumCodi),
    CONSTRAINT fk_Numerador_modNumCodi FOREIGN KEY (modNumCodi) REFERENCES SchNume.ModNume(modNumCodi)
);
GO

-------------------------------------------------------------------------------------

CREATE TABLE SchNume.Referencia (
    refCodi BIGINT PRIMARY KEY,
    refDesc VARCHAR(250) NOT NULL,
    refAtv BIT NOT NULL,
    numCodi BIGINT NOT NULL,
    CONSTRAINT fk_Referencia_numCodi FOREIGN KEY (numCodi) REFERENCES SchNume.Numerador(numCodi)
);
GO

-------------------------------------------------------------------------------------

CREATE TABLE SchNume.Anexo ( --FALTA FAZER O ANEXO
    refCodi BIGINT PRIMARY KEY,
    refDesc VARCHAR(250) NOT NULL,
    refAtv BIT NOT NULL,
    numCodi BIGINT NOT NULL,
    CONSTRAINT fk_Referencia_numCodi FOREIGN KEY (numCodi) REFERENCES SchNume.Numerador(numCodi)
);
GO

-------------------------------------------------------------------------------------





















CREATE TABLE SchNume.VlrDadosAdic (
    vlrDadCodi BIGINT PRIMARY KEY,
    vlrDadTxt VARCHAR(250) NULL,
    vlrDadNum DECIMAL(10, 2) NULL,
    vlrDadAtv BIT NOT NULL,
    dadCodi BIGINT NOT NULL,
    numCodi BIGINT NOT NULL,
    CONSTRAINT fk_VlrDadosAdic_dadCodi FOREIGN KEY (dadCodi) REFERENCES SchNume.DadosAdic(dadCodi),
    CONSTRAINT fk_VlrDadosAdic_numCodi FOREIGN KEY (numCodi) REFERENCES SchNume.Numerador(numCodi)
);
GO

-------------------------------------------------------------------------------------


/*
DROP TABLE SchNume.TipDadoAdic;
DROP TABLE SchNume.ModNume;
*/


/*
 TipDadoAdic - OK
 ModNume - OK
 TipoNume - OK
 DadosAdic - OK
 Numerador - OK
 VlrDadosAdic - OK
 Referencia - OK
 Anexo
 Interessado
 */




SELECT PesIdf, PesNom, PesSclNom, PesTipCod, PesNasDat, PesCpfMigNum, PesIclDat
FROM DB_CORP_CCB.SchCRPCCB.PES
WHERE PesCpfMigNum = '32263773886'
;







DB_MUNICIPIO_OPM.SchUOR.UOR























