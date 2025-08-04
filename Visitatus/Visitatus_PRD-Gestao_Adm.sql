SELECT * FROM DB_Visitatus.dbo.Usuario
WHERE usuNome LIKE '%Mathias%'
ORDER BY usuNome;

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario
where usucodi IN (43);
--ORDER BY peUCodi DESC
;

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

-- ID CARGOS:
-- 1: VENERÁVEL MESTRE
-- 5: SECRETÁRIO 

-- ID LOJA:
-- 15: 14 BIS

SELECT * FROM DB_Visitatus.dbo.Rito;

SELECT * FROM DB_Visitatus.dbo.Cargos;

SELECT * FROM DB_Visitatus.dbo.CargosRito
where ritCodi = 3
;

SELECT * FROM DB_Visitatus.dbo.GestaoCargos; 

SELECT * FROM DB_Visitatus.dbo.Usuario 
where usuNCIM = '274536'
order by usuNome;

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
WHERE L.lojCodi = 15
	AND GA.gstAdmStat = 1	
	AND (GA.gstAdmDtIn <= CAST(GETDATE() AS DATE) AND GA.gstAdmDtFi >= CAST(GETDATE() AS DATE))
ORDER BY GA.gstAdmDtFi DESC

-----------------------------------------------------------------------------------------------------------