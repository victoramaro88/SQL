--> CRIAÇÃO DE TABELAS DOMÍNIO

CREATE TABLE GrupoViatura (
    gruVtrCodi SMALLINT NOT NULL PRIMARY KEY,
    gruVtrDesc VARCHAR(100) NOT NULL,
    gruVtrSigl VARCHAR(10) NULL,
    gruVtrIdc BIT NOT NULL
);

INSERT INTO GrupoViatura (gruVtrCodi, gruVtrDesc, gruVtrSigl, gruVtrIdc)
VALUES 
(1,'SOCORRO DE INCÊNDIO', '1', 1),
(2, 'SUPORTE BÁSICO DE VIDA', '2', 1),
(3, 'OPERACIONAL DE COMANDO', '3', 1),
(4, 'ABASTECIMENTO DE ÁGUA', '4', 1),
(5, 'ESPECIAIS AÉREAS', '5A', 1),
(6, 'ESPECIAIS DE INCÊNDIO / SALVAMENTO', '5B', 1),
(7, 'SUPORTE AVANÇADO DE VIDA', '6', 1),
(8, 'SUPERVISÃO', '7', 1),
(9, 'INTERVENÇÃO RÁPIDA', '8', 1),
(10, 'APOIO OPERACIONAL', '9', 1),
(11, 'SERVIÇO DE SEGURANÇA CONTRA INCÊNDIO', '10', 1),
(12, 'TRANSPORTE DE TROPA', '11', 1),
(13, 'APOIO LOGÍSTICO', '12', 1),
(14, 'TRANSPORTE DE ENFERMOS', '13', 1),
(15, 'VIATURA ADMINISTRATIVA', '14', 1),
(16, 'VIATURA DESCARACTERIZADA DE CORONÉIS', '15', 1),
(17, 'SISTEMA DE INFORMAÇÕES', '16', 1),
(18, 'EDUCAÇÃO PÚBLICA', '17', 1)
;

CREATE TABLE StatusViatura (
    sttVtrCodi SMALLINT NOT NULL PRIMARY KEY,
    sttVtrDesc VARCHAR(50) NOT NULL,
    sttVtrSigl VARCHAR(10) NULL,
    sttVtrIdc BIT NOT NULL
);

INSERT INTO StatusViatura (sttVtrCodi, sttVtrDesc, sttVtrSigl, sttVtrIdc)
VALUES
(1, 'OPERANDO', 'O', 1),
(2, 'BAIXADA', 'B', 1),
(3, 'PROCESSO DE DESCARGA', 'PD', 1)
;

CREATE TABLE MarcaVeiculo (
    marVeiCodi SMALLINT NOT NULL PRIMARY KEY,
    marVeiDesc VARCHAR(50) NOT NULL,
    marVeiSigl VARCHAR(10) NULL,
    marVeiIdc BIT NOT NULL
);

INSERT INTO MarcaVeiculo (marVeiCodi, marVeiDesc, marVeiSigl, marVeiIdc)
VALUES
(1, 'FORD', NULL, 1),
(2, 'VOLKSWAGEN', NULL, 1),
(3, 'FIAT', NULL, 1),
(4, 'IVECO', NULL, 1),
(5, 'RENAULT', NULL, 1)
;

CREATE TABLE ModeloVeiculo (
    modVeiCodi SMALLINT NOT NULL PRIMARY KEY,
    modVeiDesc VARCHAR(50) NOT NULL,
    modVeiSigl VARCHAR(10) NULL,
    modVeiIdc BIT NOT NULL
);

CREATE TABLE StatusMaterial (
    sttMatCodi SMALLINT NOT NULL PRIMARY KEY,
    sttMatDesc VARCHAR(50) NOT NULL,
    sttMatSigl VARCHAR(10) NULL,
    sttMatIdc BIT NOT NULL
);

INSERT INTO StatusMaterial (sttMatCodi, sttMatDesc, sttMatSigl, sttMatIdc)
VALUES
(1, 'OPERANDO', 'O', 1),
(2, 'BAIXADO', 'B', 1),
(3, 'PROCESSO DE DESCARGA', 'PD', 1)
;

CREATE TABLE NivelUnidade (
    nivUniCodi SMALLINT NOT NULL PRIMARY KEY,
    nivUniDesc VARCHAR(250) NOT NULL,
    nivUniSigl VARCHAR(10) NULL,
    nivUniIdc BIT NOT NULL
);

INSERT INTO NivelUnidade (nivUniCodi, nivUniDesc, nivUniSigl, nivUniIdc)
VALUES
(1, 'GRANDE COMANDO', NULL, 1),
(2,	'COMANDO', NULL, 1),
(3,	'SUBCOMANDO', NULL, 1),
(4,	'GRUPAMENTO', NULL, 1),
(5,	'SUBGRUPAMENTO', NULL, 1),
(6,	'POSTO', NULL, 1),
(7,	'BASE', NULL, 1),
(8,	'GRUPO', NULL, 1),
(9,	'DIRETORIA', NULL, 1),
(10,'DEPARTAMENTO', NULL, 1),
(11,'DIVISÃO', NULL, 1),
(12,'SECRETARIA', NULL, 1),
(13,'SETOR ADMINISTRATIVO', NULL, 1),
(14,'PELOTÃO', NULL, 1),
(15,'ESTAÇÃO', NULL, 1),
(16,'NÚCLEO', NULL, 1),
(17,'COMPANHIA', NULL, 1),
(18,'SEÇÃO', NULL, 1),
(19,'CENTRO', NULL, 1),
(20,'AGÊNCIA', NULL, 1),
(21,'GABINETE', NULL, 1),
(22,'CONTROLADORIA', NULL, 1),
(23,'ESTADO MAIOR', NULL, 1),
(24,'BOMBEIRO COMUNITÁRIO', NULL, 1),
(25,'POSTO MARÍTIMO', NULL, 1),
(26,'SETOR AQUÁTICO', NULL, 1),
(27,'BRIGADA COMUNITÁRIA', NULL, 1),
(28,'SUBSETOR AQUÁTICO', NULL, 1),
(29,'PELOTÃO GV', NULL, 1),
(30,'ESTAÇÃO G', NULL, 	1)
;

CREATE TABLE PostoGraduacao (
    posGraCodi SMALLINT NOT NULL PRIMARY KEY,
    posGraDesc VARCHAR(50) NOT NULL,
    posGraSigl VARCHAR(10) NULL,
    posGraOrd SMALLINT NOT NULL,
    posGraIdc BIT NOT NULL
);

INSERT INTO PostoGraduacao (posGraCodi, posGraDesc, posGraSigl, posGraOrd, posGraIdc)
VALUES
(1, 'CORONEL PM', 'CEL PM', 1, 1),
(2, 'TENENTE CORONEL PM', 'TEN CEL PM', 2, 1),
(3, 'MAJOR PM', 'MAJ PM', 3, 1),
(4, 'CAPITÃO PM', 'CAP PM', 4, 1),
(5, '1º TENENTE PM', '1º TEN PM', 5, 1),
(6, '2º TENENTE PM', '2º TEN PM', 6, 1),
(7, 'SUBTENENTE PM', 'SUBTEN PM', 7, 1),
(8, '1º SARGENTO PM', '1º SGT PM', 8, 1),
(9, '2º SARGENTO PM', '2º SGT PM', 9, 1),
(10, '3º SARGENTO PM', '3º SGT PM', 10, 1),
(11, 'CABO PM', 'CB PM', 11, 1),
(12, 'SOLDADO PM', 'SD PM', 12, 1),
(13, 'SOLDADO PM 2ª CLASSE', 'SD PM - 2C', 13, 1)
;

CREATE TABLE TipoRecurso (
    tipRecCodi SMALLINT NOT NULL PRIMARY KEY,
    tipRecDesc VARCHAR(50) NOT NULL,
    tipRecIdc BIT NOT NULL
);

INSERT INTO TipoRecurso (tipRecCodi, tipRecDesc, tipRecIdc)
VALUES
(1, 'AÇÃO', 1),
(2, 'MENU', 1),
(3, 'TELA', 1)
;

CREATE TABLE PerfilAcesso (
    prfAcsCodi SMALLINT NOT NULL PRIMARY KEY,
    prfAcsDesc VARCHAR(50) NOT NULL,
    prfAcsIdc BIT NOT NULL
);

INSERT INTO PerfilAcesso (prfAcsCodi, prfAcsDesc, prfAcsIdc)
VALUES
(1, 'ADMINISTRADOR', 1),
(2, 'GESTÃO', 1),
(3, 'CMT PRONTIDÃO', 1),
(4, 'CONFERENTE', 1)
;

--> CRIAÇÃO DE TABELAS RELACIONADAS

CREATE TABLE Unidade (
    uniCodi BIGINT NOT NULL PRIMARY KEY,
    uniPaiCodi BIGINT NULL, --FK
    nivUniCodi SMALLINT NOT NULL, --FK
    uniNome VARCHAR(250) NOT NULL,
    uniSigl VARCHAR(10) NULL,
    uniIdc BIT NOT NULL
    
    CONSTRAINT FK_Unidade_Pai
        FOREIGN KEY (uniPaiCodi)
        REFERENCES Unidade(uniCodi),    
        
    CONSTRAINT FK_Unidade_Nivel
        FOREIGN KEY (nivUniCodi)
        REFERENCES NivelUnidade(nivUniCodi)
);

CREATE TABLE Usuario (
    usuCodi BIGINT NOT NULL PRIMARY KEY,
    uniCodi BIGINT NOT NULL, --FK
    posGraCodi SMALLINT NOT NULL, --FK
    usuNuRE BIGINT NOT NULL,
    usuDiRE VARCHAR(1) NOT NULL,
    usuNome VARCHAR(250) NOT NULL,
    usuNQRA VARCHAR(100) NOT NULL,
    usuIdc BIT NOT NULL
    
    CONSTRAINT FK_Usuario_Unidade
        FOREIGN KEY (uniCodi)
        REFERENCES Unidade(uniCodi),    
        
    CONSTRAINT FK_Unidade_PostoGrad
        FOREIGN KEY (posGraCodi)
        REFERENCES PostoGraduacao(posGraCodi)
);

CREATE TABLE Viatura (
    viaCodi BIGINT NOT NULL PRIMARY KEY,
    sttVtrCodi SMALLINT NOT NULL, --FK
    gruVtrCodi SMALLINT NOT NULL, --FK
    uniCodi BIGINT NOT NULL, --FK
    marVeiCodi SMALLINT NOT NULL, --FK
    modVeiCodi SMALLINT NOT NULL, --FK
    usuCodi BIGINT NOT NULL, --FK
    viaDtCd DATETIME NOT NULL,
    viaPlac VARCHAR(7) NULL,
    viaAnFa INT NOT NULL,
    viaAnMo INT NOT NULL,
    viaIdc BIT NOT NULL
    
    CONSTRAINT FK_Viatura_StatusViatura
        FOREIGN KEY (sttVtrCodi)
        REFERENCES StatusViatura(sttVtrCodi),
        
    CONSTRAINT FK_Viatura_GrupoViatura
        FOREIGN KEY (gruVtrCodi)
        REFERENCES GrupoViatura(gruVtrCodi),
        
    CONSTRAINT FK_Viatura_Unidade
        FOREIGN KEY (uniCodi)
        REFERENCES Unidade(uniCodi),
        
    CONSTRAINT FK_Viatura_MarcaVeiculo
        FOREIGN KEY (marVeiCodi)
        REFERENCES MarcaVeiculo(marVeiCodi),
        
    CONSTRAINT FK_Viatura_ModeloVeiculo
        FOREIGN KEY (modVeiCodi)
        REFERENCES ModeloVeiculo(modVeiCodi),
        
    CONSTRAINT FK_Viatura_Usuario
        FOREIGN KEY (usuCodi)
        REFERENCES Usuario(usuCodi)
);

CREATE TABLE Material (
    matCodi BIGINT NOT NULL PRIMARY KEY,
    sttMatCodi SMALLINT NOT NULL, --FK
    matData DATETIME NOT NULL,
    matDesc VARCHAR(250) NOT NULL,
    matNPat BIGINT NULL,
    matNSer VARCHAR(50) NULL,
    matObse VARCHAR(500) NULL,
    matIdc BIT NOT NULL
    
    CONSTRAINT FK_Material_StatusMaterial
        FOREIGN KEY (sttMatCodi)
        REFERENCES StatusMaterial(sttMatCodi)
);

CREATE TABLE PrefixoViatura (
    pfxVtrCodi BIGINT NOT NULL PRIMARY KEY,
    viaCodi BIGINT NOT NULL, --FK
    usuCodi BIGINT NOT NULL, --FK
    pfxVtrData DATETIME NOT NULL,
    pfxVtrDesc VARCHAR(50) NOT NULL,
    pfxVtrIdc BIT NOT NULL
    
    CONSTRAINT FK_PrefixoViatura_Viatura
        FOREIGN KEY (viaCodi)
        REFERENCES Viatura(viaCodi),
    
    CONSTRAINT FK_PrefixoViatura_Usuario
        FOREIGN KEY (usuCodi)
        REFERENCES Usuario(usuCodi)
);

CREATE TABLE GavetaViatura (
    gvtVtrCodi BIGINT NOT NULL PRIMARY KEY,
    gvtPaiCodi BIGINT NULL, --FK Auto-relacionamento
    viaCodi BIGINT NOT NULL, --FK
    gvtVtrDesc VARCHAR(50) NOT NULL,
    gvtVtrSigl VARCHAR(10) NULL,
    gvtVtrObse VARCHAR(100) NULL,
    gvtVtrIdc BIT NOT NULL
    
    CONSTRAINT FK_Gaveta_Pai
        FOREIGN KEY (gvtPaiCodi)
        REFERENCES GavetaViatura(gvtVtrCodi),    
        
    CONSTRAINT FK_GavetaViatura_Viatura
        FOREIGN KEY (viaCodi)
        REFERENCES Viatura(viaCodi)
);

CREATE TABLE MaterialGaveta (
    matGvtCodi BIGINT NOT NULL PRIMARY KEY,
    gvtVtrCodi BIGINT NOT NULL, --FK
    matCodi BIGINT NOT NULL, --FK
    matGvtData DATETIME NOT NULL,
    matGvtIdc BIT NOT NULL
    
    CONSTRAINT FK_MaterialGaveta_GavetaViatura
        FOREIGN KEY (gvtVtrCodi)
        REFERENCES GavetaViatura(gvtVtrCodi),
    
    CONSTRAINT FK_MaterialGaveta_Material
        FOREIGN KEY (matCodi)
        REFERENCES Material(matCodi)
);

CREATE TABLE BaixaViatura (
    baiVtrCodi BIGINT NOT NULL PRIMARY KEY,
    viaCodi BIGINT NOT NULL, --FK
    usuCodi BIGINT NOT NULL, --FK
    sttVtrCodi SMALLINT NOT NULL, --FK
    baiVtrtDtIn DATETIME NOT NULL,
    baiVtrtDtFi DATETIME NULL,
    baiVtrtObse VARCHAR(1000) NULL,
    baiVtrIdc BIT NOT NULL
    
    CONSTRAINT FK_BaixaViatura_Viatura
        FOREIGN KEY (viaCodi)
        REFERENCES Viatura(viaCodi),
    
    CONSTRAINT FK_BaixaViatura_Usuario
        FOREIGN KEY (usuCodi)
        REFERENCES Usuario(usuCodi),
    
    CONSTRAINT FK_BaixaViatura_StatusViatura
        FOREIGN KEY (sttVtrCodi)
        REFERENCES StatusViatura(sttVtrCodi)
);

CREATE TABLE ConferenciaMaterial (
    confMatCodi BIGINT NOT NULL PRIMARY KEY,
    matCodi BIGINT NOT NULL, --FK
    usuCodi BIGINT NOT NULL, --FK
    confMatData DATETIME NOT NULL,
    confMatChk BIT NOT NULL,
    confMatObse VARCHAR(500) NULL,
    confMatIdc BIT NOT NULL
    
    CONSTRAINT FK_ConferenciaMaterial_Material
        FOREIGN KEY (matCodi)
        REFERENCES Material(matCodi),
    
    CONSTRAINT FK_ConferenciaMaterial_Usuario
        FOREIGN KEY (usuCodi)
        REFERENCES Usuario(usuCodi)
);

CREATE TABLE BaixaMaterial (
    baiMatCodi BIGINT NOT NULL PRIMARY KEY,
    matCodi BIGINT NOT NULL, --FK
    usuCodi BIGINT NOT NULL, --FK
    sttMatCodi SMALLINT NOT NULL, --FK
    baiMatDtIn DATETIME NOT NULL,
    baiMatDtFi DATETIME NULL,
    baiMatObse VARCHAR(1000) NULL,
    baiMatIdc BIT NOT NULL
    
    CONSTRAINT FK_BaixaMaterial_Material
        FOREIGN KEY (matCodi)
        REFERENCES Material(matCodi),
    
    CONSTRAINT FK_BaixaMaterial_Usuario
        FOREIGN KEY (usuCodi)
        REFERENCES Usuario(usuCodi),
    
    CONSTRAINT FK_BaixaMaterial_StatusMaterial
        FOREIGN KEY (sttMatCodi)
        REFERENCES StatusMaterial(sttMatCodi)
);

CREATE TABLE RecursoAcesso (
    recAcsCodi INT NOT NULL PRIMARY KEY,
    tipRecCodi SMALLINT NOT NULL,
    recAcsDesc VARCHAR(100) NULL,
    recAcsRota VARCHAR(30) NULL,
    recAcsIdc BIT NOT NULL
    
    CONSTRAINT FK_RecursoAcesso_TipoRecurso
        FOREIGN KEY (tipRecCodi)
        REFERENCES TipoRecurso(tipRecCodi)
);

CREATE TABLE Permissao (
    prfAcsCodi SMALLINT NOT NULL, --PK
    recAcsCodi INT NOT NULL, --PK
    prmVisu BIT NOT NULL,
    prmInse BIT NOT NULL,
    prmEdit BIT NOT NULL,
    prmExcl BIT NOT NULL
    PRIMARY KEY (prfAcsCodi, recAcsCodi)
    
    CONSTRAINT FK_Permissao_PerfilAcesso
        FOREIGN KEY (prfAcsCodi)
        REFERENCES PerfilAcesso(prfAcsCodi),
        
    CONSTRAINT FK_Permissao_RecursoAcesso
        FOREIGN KEY (recAcsCodi)
        REFERENCES RecursoAcesso(recAcsCodi)
);

CREATE TABLE UsuarioPerfil (
    usuCodi BIGINT NOT NULL, --PK
    prfAcsCodi SMALLINT NOT NULL --PK
    PRIMARY KEY (usuCodi, prfAcsCodi)
    
    CONSTRAINT FK_UsuarioPerfil_Usuario
        FOREIGN KEY (usuCodi)
        REFERENCES Usuario(usuCodi),
        
    CONSTRAINT FK_UsuarioPerfil_PerfilAcesso
        FOREIGN KEY (prfAcsCodi)
        REFERENCES PerfilAcesso(prfAcsCodi)
);
