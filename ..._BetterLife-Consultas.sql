


DECLARE @pesCodi BIGINT
SET @pesCodi = 0
DECLARE @cttCodi varchar(100)
SET @cttCodi = (SELECT cttCodi FROM DB_BetterLife.dbo.PessoaContato WHERE pesCodi = @pesCodi)
--SELECT @pesCodi AS PesCodi, @cttCodi AS CttCodi
DELETE FROM DB_BetterLife.dbo.PessoaContato WHERE pesCodi=@pesCodi
DELETE FROM DB_BetterLife.dbo.Contato WHERE cttCodi IN (@cttCodi)
DELETE FROM DB_BetterLife.dbo.Documento WHERE pesCodi=@pesCodi
DELETE FROM DB_BetterLife.dbo.PessoaConsultorio WHERE pesCodi=@pesCodi
DELETE FROM DB_BetterLife.dbo.UsuarioPessoa WHERE pesCodi=@pesCodi
DELETE FROM DB_BetterLife.dbo.Pessoa WHERE pesCodi=@pesCodi;

--------------------------------------------------------------------------------------------------------

SELECT
	--*
	P.pesCodi, P.pesNome
	, TP.tipDesc 
	, C.conDesc 
	, D.docNume 
	, TD.tidDesc
	--pesCodi, pesNome, pesFoto, pesNasc, pesStat, tipCodi, genCodi
FROM DB_BetterLife.dbo.Pessoa P
JOIN DB_BetterLife.dbo.TipoPessoa TP ON TP.tipCodi = P.tipCodi
JOIN DB_BetterLife.dbo.PessoaConsultorio PC ON PC.pesCodi = P.pesCodi 
JOIN DB_BetterLife.dbo.Consultorio C ON C.conCodi = PC.conCodi 
JOIN DB_BetterLife.dbo.Documento D ON D.pesCodi = P.pesCodi
JOIN DB_BetterLife.dbo.TipoDocumento TD ON TD.tidCodi = D.tidCodi 
;

SELECT * FROM DB_BetterLife.dbo.Documento

SELECT * FROM DB_BetterLife.dbo.CarteiraBariatrica cb 

--------------------------------------------------------------------------------------------------------

SELECT tidCodi, tidDesc, tidStat
FROM DB_BetterLife.dbo.TipoDocumento;

SELECT carCodi, carDtCi, tpcCodi, hosCodi, pesCodi, pecCodi, carStat
FROM DB_BetterLife.dbo.CarteiraBariatrica;

SELECT hosCodi, hosDesc, hosStat
FROM DB_BetterLife.dbo.Hospital;

SELECT tpcCodi, tpcDesc, tpcStat
FROM DB_BetterLife.dbo.TipoCirurgia;

SELECT tipCodi, tipDesc, tipStat
FROM DB_BetterLife.dbo.TipoPessoa;

SELECT genCodi, genDesc, genStat
FROM DB_BetterLife.dbo.Genero;

SELECT ticCodi, ticDesc, ticStat
FROM DB_BetterLife.dbo.TipoContato;

SELECT tidCodi, tidDesc, tidStat
FROM DB_BetterLife.dbo.TipoDocumento;

SELECT pesCodi, pesNome, pesFoto, pesNasc, pesStat, tipCodi, genCodi
FROM DB_BetterLife.dbo.Pessoa;

SELECT cttCodi, cttDesc, cttStat, ticCodi
FROM DB_BetterLife.dbo.Contato;

SELECT pctCodi, pctStat, pesCodi, cttCodi
FROM DB_BetterLife.dbo.PessoaContato;

SELECT docCodi, docNume, docStat, pesCodi, tidCodi
FROM DB_BetterLife.dbo.Documento;

SELECT conCodi, conDesc, conStat, conFoto
FROM DB_BetterLife.dbo.Consultorio;

SELECT pecCodi, pecStat, pesCodi, conCodi
FROM DB_BetterLife.dbo.PessoaConsultorio;

SELECT pesCodi, pesNome, pesFoto, pesNasc, pesStat, tipCodi, genCodi
FROM DB_BetterLife.dbo.Pessoa;

SELECT tpcCodi, tpcDesc, tpcStat
FROM DB_BetterLife.dbo.TipoCirurgia;

SELECT pesCodi, pesNome, pesFoto, pesNasc, pesStat, tipCodi, genCodi
FROM DB_BetterLife.dbo.Pessoa;

SELECT docCodi, docNume, docStat, pesCodi, tidCodi
FROM DB_BetterLife.dbo.Documento;

SELECT usuCodi, usuLogi, usuSenh, usuStat, pesCodi, tusCodi
FROM DB_BetterLife.dbo.UsuarioPessoa;