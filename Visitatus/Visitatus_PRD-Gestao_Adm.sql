SELECT * FROM DB_Visitatus.dbo.Usuario
ORDER BY usuNome;

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario
where usucodi = 66;

--==============================================================================================================================


SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus.dbo.TemplateCertificadoPresenca;

SELECT * FROM DB_Visitatus.dbo.TemplateCertificadoLoja;
SELECT * FROM DB_Visitatus.dbo.Loja;
SELECT * FROM DB_Visitatus.dbo.TemplateConvite;
SELECT * FROM DB_Visitatus.dbo.TemplateLoja;


UPDATE DB_Visitatus.dbo.TemplateConvite
SET tmpCvtMode = N''
WHERE tmpCvtCodi = 0;


-----------------------------------------------------------------------------------------------------------

--GESTÃO DOS CARGOS ADMINISTRATIVOS:

SELECT * FROM DB_Visitatus.dbo.Cargos;

SELECT * FROM DB_Visitatus.dbo.CargosRito;

SELECT * FROM DB_Visitatus.dbo.GestaoCargos; --USR: 2

SELECT * FROM DB_Visitatus.dbo.Usuario-- order by usuNome;

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario;

SELECT * FROM DB_Visitatus.dbo.GestaoAdministrativa;

SELECT * FROM DB_Visitatus.dbo.Loja;


SELECT * FROM DB_Visitatus.dbo.Sessao;

-- SELECT PARA TRAZER OS OFICIAIS DA GESTÃO ADMINISTRATIVA
SELECT
	L.lojCodi, L.lojNome, L.lojNumL,
	GA.gstAdmNome, GA.gstAdmDtIn, GA.gstAdmDtFi, GA.gstAdmStat,
	C.carNome, U.usuNome
FROM DB_Visitatus.dbo.Loja L
JOIN DB_Visitatus.dbo.GestaoAdministrativa GA ON GA.lojCodi = L.lojCodi
JOIN DB_Visitatus.dbo.GestaoCargos GC ON GC.gstAdmCodi = GA.gstAdmCodi
JOIN DB_Visitatus.dbo.Cargos C ON C.carCodi = GC.carCodi 
JOIN DB_Visitatus.dbo.Usuario U ON U.usuCodi = GC.usuCodi 
WHERE L.lojCodi = 1
	AND GA.gstAdmStat = 1	
	AND (GA.gstAdmDtIn <= CAST(GETDATE() AS DATE) AND GA.gstAdmDtFi >= CAST(GETDATE() AS DATE))
ORDER BY GA.gstAdmDtFi DESC

-----------------------------------------------------------------------------------------------------------