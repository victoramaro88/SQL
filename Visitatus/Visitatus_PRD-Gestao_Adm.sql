SELECT * FROM DB_Visitatus.dbo.Usuario
WHERE usuNome LIKE '%Mathias%'
ORDER BY usuNome;

SELECT * FROM DB_Visitatus.dbo.Perfil --WHERE perCodi = 4

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario
where usucodi IN (43);
--ORDER BY peUCodi DESC
;

SELECT * FROM DB_Visitatus.dbo.Usuario USU
JOIN DB_Visitatus.dbo.PerfilUsuario PU ON PU.usuCodi = USU.usuCodi 
JOIN DB_Visitatus.dbo.Loja L ON L.lojCodi = PU.lojCodi 
WHERE L.lojCodi = 1 AND PU.perCodi = 4;

/*
GESTÃO 2026/2027
VM (1) - BINA: 42
1V (2) - FERNANDINHO: 21
2V (3) - CESAR TADEU: 13
SEC (4) - PEDRO LUIZ: 36
*/
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
--where usuNCIM = '274536'
where usuNCIM IN(
'332466',
'319000',
'319002',
'318991',
'318993',
'345429',
'286041',
'359467',
'319087',
'313824',
'339636',
'339639',
'319010',
'339638'
)
order by usuNome;

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario;

SELECT * FROM DB_Visitatus.dbo.GestaoAdministrativa;

SELECT * FROM DB_Visitatus.dbo.GestaoCargos WHERE gstAdmCodi = 3;

SELECT * FROM DB_Visitatus.dbo.GestaoAdministrativa where lojcodi = 1;

SELECT * FROM DB_Visitatus.dbo.Loja;


SELECT * FROM DB_Visitatus.dbo.Sessao;

-- SELECT PARA TRAZER OS OFICIAIS DA GESTÃO ADMINISTRATIVA
SELECT
	GA.gstAdmCodi, L.lojCodi, L.lojNome, L.lojNumL,
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

SELECT
	Usr.usuCodi, Usr.usuNCIM, Usr.usuNome,
	Loj.lojNome, Loj.lojNumL,
	PU.perCodi
FROM DB_Visitatus.dbo.Usuario Usr
JOIN DB_Visitatus.dbo.PerfilUsuario PU ON PU.usuCodi = Usr.usuCodi
JOIN DB_Visitatus.dbo.Loja Loj ON Loj.lojCodi = PU.lojCodi 
where usuNCIM IN(
'332466',
'319000',
'319002',
'318991',
'318993',
'345429',
'286041',
'359467',
'319087',
'313824',
'339636',
'339639',
'319010',
'339638'
)
order by usuNome;