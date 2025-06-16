SELECT * FROM DB_Visitatus_DEV.dbo.Loja;
SELECT * FROM DB_Visitatus_DEV.dbo.Rito;
SELECT * FROM DB_Visitatus_DEV.dbo.CargosRito;
SELECT * FROM DB_Visitatus_DEV.dbo.TemplateConvite;
SELECT * FROM DB_Visitatus_DEV.dbo.TemplateLoja;
SELECT * FROM DB_Visitatus_DEV.dbo.Usuario;
SELECT * FROM DB_Visitatus_DEV.dbo.PerfilUsuario;
SELECT * FROM DB_Visitatus_DEV.dbo.UsuarioLogin;
SELECT * FROM DB_Visitatus_DEV.dbo.Presenca;
SELECT * FROM DB_Visitatus_DEV.dbo.Loja;
SELECT * FROM DB_Visitatus_DEV.dbo.Rito;
SELECT * FROM DB_Visitatus_DEV.dbo.TemplateCertificadoPresenca;
SELECT * FROM DB_Visitatus_DEV.dbo.GestaoAdministrativa;
SELECT * FROM DB_Visitatus_DEV.dbo.PermissaoPerfil;


--> CONSULTAR O USUÁRIO NA TELA DE CADASTRO
SELECT 
	Usr.usuCodi, Usr.usuNome, Usr.usuNasc, Usr.usuEmai, Usr.usuNCel, Usr.usuStat, 
	Loj.lojCodi, Loj.lojNome, Loj.lojNumL,
	Perf.perCodi, Perf.perNome, Perf.perStat 
FROM DB_Visitatus_DEV.dbo.Usuario Usr
JOIN DB_Visitatus_DEV.dbo.PerfilUsuario PerUsu ON Usr.usuCodi = PerUsu.usuCodi 
JOIN DB_Visitatus_DEV.dbo.Loja Loj ON PerUsu.lojCodi = Loj.lojCodi 
JOIN DB_Visitatus_DEV.dbo.Perfil Perf ON PerUsu.perCodi = Perf.perCodi
WHERE Usr.usuNCIM = 320097 AND Loj.potCodi = 5
ORDER BY Loj.lojNome 




-----------------------------------------------------------------------------------------------------------
--> SELECT PARA RETORNAR AS INFORMAÇÕES DOS CERTIFICADOS DE PRESENÇAS DOS IRMÃOS.

SELECT 
	Loj.lojNome, Loj.lojNumL,
	Pot.potSigl, Pot.potNome,
	Ses.sesDtHr,
	Cid.cidNome,
	Est.estSigl,
	Loj.lojLogo,
	Pot.potLogo
FROM DB_Visitatus_DEV.dbo.Sessao Ses
JOIN DB_Visitatus_DEV.dbo.Loja Loj ON Loj.lojCodi = Ses.lojCodi
JOIN DB_Visitatus_DEV.dbo.Potencia Pot ON Pot.potCodi = Loj.potCodi 
JOIN DB_Visitatus_DEV.dbo.Cidade Cid ON Cid.cidCodi = Loj.cidCodi 
JOIN DB_Visitatus_DEV.dbo.Estado Est ON Est.estCodi = Cid.estCodi 
WHERE Ses.sesCodi = 4;

SELECT 
	Usu.usuCodi, Usu.usuNome, 
	Loj.lojNome, Loj.lojNumL
FROM DB_Visitatus_DEV.dbo.Presenca Pre
JOIN DB_Visitatus_DEV.dbo.Usuario Usu ON Usu.usuCodi = Pre.usuCodi
JOIN DB_Visitatus_DEV.dbo.Loja Loj ON Loj.lojCodi = Pre.lojCodi  
JOIN DB_Visitatus_DEV.dbo.Sessao Ses ON Ses.sesCodi = Pre.sesCodi
JOIN DB_Visitatus_DEV.dbo.TipoSessao Tip ON Tip.tiSCodi = Ses.tiSCodi 
WHERE Pre.sesCodi = 4;

--> SELECT PARA CONFIRMAÇÃO DE PRESENÇA DA SESSÃO:
SELECT 
	Usu.usuCodi, Usu.usuNome, Usu.usuNCIM,
	Loj.lojNome, Loj.lojNumL,
	Pre.preAtiv 
	--
	, PU.perCodi 
FROM DB_Visitatus_DEV.dbo.Presenca Pre
JOIN DB_Visitatus_DEV.dbo.Usuario Usu ON Usu.usuCodi = Pre.usuCodi
JOIN DB_Visitatus_DEV.dbo.Loja Loj ON Loj.lojCodi = Pre.lojCodi  
JOIN DB_Visitatus_DEV.dbo.Sessao Ses ON Ses.sesCodi = Pre.sesCodi
--
JOIN DB_Visitatus_DEV.dbo.PerfilUsuario PU ON PU.usuCodi = Pre.usuCodi
WHERE Pre.sesCodi = 4 AND PU.perCodi = 4;

-----------------------------------------------------------------------------------------------------------
--> TEMPLATES DE CONVITES

SELECT tmpCvtCodi, tmpCvtNome, tmpCvtMode, tmpCvtStat
FROM DB_Visitatus_DEV.dbo.TemplateConvite;

SELECT tmpCvtCodi, lojCodi, tmpLjStat
FROM DB_Visitatus_DEV.dbo.TemplateLoja;

UPDATE DB_Visitatus_DEV.dbo.TemplateConvite
SET tmpCvtMode=''
WHERE tmpCvtCodi=0;

SELECT * FROM DB_Visitatus_DEV.dbo.Presenca;
SELECT * FROM DB_Visitatus_DEV.dbo.Usuario order by usuCodi desc; --WHERE usuCodi = 32; --CIM marcinho 246836
SELECT * FROM DB_Visitatus_DEV.dbo.Loja;
SELECT * FROM DB_Visitatus_DEV.dbo.PerfilUsuario --WHERE usuCodi = 1;--32;
order by peUCodi desc
--order by usuCodi


-----------------------------------------------------------------------------------------------------------
--> TEMPLATES DE CERTIFICADOS

SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus_DEV.dbo.TemplateCertificadoPresenca;

UPDATE DB_Visitatus_DEV.dbo.TemplateCertificadoPresenca
SET tmpCrtPreMode=''
WHERE tmpCrtPreCodi=;


SELECT tmpCrtPreCodi, lojCodi, tmpCrtStat
FROM DB_Visitatus_DEV.dbo.TemplateCertificadoLoja;

-----------------------------------------------------------------------------------------------------------


SELECT ritCodi, ritNome, ritLogo, ritStat
FROM DB_Visitatus_DEV.dbo.Rito;

SELECT potCodi, potNome, potLogo, potRegu, potStat, potSigl
FROM DB_Visitatus_DEV.dbo.Potencia;

SELECT perCodi, perNome, perStat
FROM DB_Visitatus_DEV.dbo.Perfil;

SELECT pemCodi, pemNome, pemStat
FROM DB_Visitatus_DEV.dbo.Permissao;

SELECT graCodi, graNome, graStat
FROM DB_Visitatus_DEV.dbo.Grau;

SELECT tiSCodi, tiSNome, tiSStat
FROM DB_Visitatus_DEV.dbo.TipoSessao;

SELECT *
FROM DB_Visitatus_DEV.dbo.PerfilUsuario;

SELECT lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi
FROM DB_Visitatus_DEV.dbo.Loja;

SELECT sesCodi, sesNume, sesDtHr, sesNome, sesDesc, lojCodi, tiSCodi, graCodi, sesLibe, sesStat
FROM DB_Visitatus_DEV.dbo.Sessao;

-----------------------------------------------------------------------------------------------------------

SELECT sesCodi, sesDesc, sesDtHr, sesLibe, sesStat, lojCodi, graCodi, tiSCodi, sesNume, sesNome
FROM DB_Visitatus_DEV.dbo.Sessao;

SELECT * FROM DB_Visitatus_DEV.dbo.PerfilUsuario WHERE usuCodi = 47

SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus_DEV.dbo.Usuario;

SELECT usLCodi, usLUser, usLPass, usLStat, usuCodi
FROM DB_Visitatus_DEV.dbo.UsuarioLogin;

SELECT lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi
FROM DB_Visitatus_DEV.dbo.Loja;

SELECT gstAdmCodi, carCodi, usuCodi, gstCarStat
FROM DB_Visitatus_DEV.dbo.GestaoCargos;

SELECT gstAdmCodi, gstAdmNome, gstAdmDtIn, gstAdmDtFi, gstAdmStat, lojCodi
FROM DB_Visitatus_DEV.dbo.GestaoAdministrativa;

SELECT usuCodi, sesCodi, preAtiv, lojCodi, preEmai
FROM DB_Visitatus_DEV.dbo.Presenca;

SELECT perCodi, perNome, perStat
FROM DB_Visitatus_DEV.dbo.Perfil;

SELECT pemCodi, pemNome, pemStat
FROM DB_Visitatus_DEV.dbo.Permissao;

SELECT perCodi, pemCodi, papAtvo, pepStat
FROM DB_Visitatus_DEV.dbo.PermissaoPerfil;



SELECT *
FROM DB_Visitatus_DEV.dbo.PerfilUsuario
WHERE usuCodi IN (1, 4)
;

--> CONSULTA DE LISTA DE PRESENÇA DE UMA SESSÃO:
DECLARE @lojCodi BIGINT
SET @lojCodi = (SELECT lojCodi FROM DB_Visitatus_DEV.dbo.Sessao WHERE sesCodi = 4)
SELECT
    pre.SesCodi, usu.UsuCodi, usu.UsuNome, usu.UsuNcim, loj.LojCodi, loj.LojNome, loj.LojNumL, pre.PreAtiv, pre.PreEmai,
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM DB_Visitatus_DEV.dbo.Presenca pre_sub
            JOIN DB_Visitatus_DEV.dbo.Usuario usu_sub ON pre_sub.usuCodi = usu_sub.usuCodi
            JOIN DB_Visitatus_DEV.dbo.PerfilUsuario per_sub ON usu_sub.usuCodi = per_sub.usuCodi
            WHERE 
                per_sub.perCodi = 4 --> Perfil "Membro"
                AND pre_sub.lojCodi = @lojCodi --> Id da Loja
                AND pre_sub.usuCodi = pre.usuCodi
        ) THEN 1
        ELSE 0
    END AS MembroLoja
FROM DB_Visitatus_DEV.dbo.Presenca pre
INNER JOIN DB_Visitatus_DEV.dbo.Usuario usu ON pre.usuCodi = usu.usuCodi
INNER JOIN DB_Visitatus_DEV.dbo.Loja loj ON pre.lojCodi = loj.lojCodi 
INNER JOIN DB_Visitatus_DEV.dbo.Sessao ses ON pre.sesCodi = ses.sesCodi
INNER JOIN DB_Visitatus_DEV.dbo.PerfilUsuario per ON usu.usuCodi = per.usuCodi
WHERE 
    pre.sesCodi = 4 --> Id da Sessão
    AND per.PerCodi = 4 --> Perfil "Membro"
ORDER BY MembroLoja, usu.usuNome;

SELECT * FROM DB_Visitatus_DEV.dbo.Sessao

SELECT * FROM DB_Visitatus_DEV.dbo.Usuario

SELECT * FROM DB_Visitatus_DEV.dbo.Loja

SELECT * FROM DB_Visitatus_DEV.dbo.PerfilUsuario

SELECT * FROM DB_Visitatus_DEV.dbo.Perfil

SELECT * FROM DB_Visitatus_DEV.dbo.Presenca



SELECT 
	U.usuCodi, U.usuNome, U.usuNCIM, U.usuNCel, U.usuEmai, U.usuNasc, U.usuStat,
	P.perCodi, P.perNome
	, PU.peUStat
FROM DB_Visitatus_DEV.dbo.PerfilUsuario PU
JOIN DB_Visitatus_DEV.dbo.Perfil P ON P.perCodi = PU.perCodi 
JOIN DB_Visitatus_DEV.dbo.Loja L ON L.lojCodi = PU.lojCodi 
JOIN DB_Visitatus_DEV.dbo.Usuario U ON U.usuCodi = PU.usuCodi
WHERE L.lojCodi = 1
ORDER BY U.usuNome 


SELECT 
	P.perCodi, P.perNome, P.perStat 
	, PR.pemCodi, PR.pemNome, PR.pemStat 
	, PP.papAtvo, PP.pepStat 
FROM DB_Visitatus_DEV.dbo.PermissaoPerfil PP
JOIN DB_Visitatus_DEV.dbo.Perfil P ON P.perCodi = PP.perCodi
JOIN DB_Visitatus_DEV.dbo.Permissao PR ON PR.pemCodi = PP.pemCodi
WHERE P.perCodi = 337;


-- SELECT DAS INFORMAÇÕES DAS SESSÕES
SELECT 
	S.sesCodi, S.sesNume, S.sesNome, S.sesDesc, S.sesDtHr, S.sesLibe, S.sesStat,
	TS.tiSNome,	G.graNome, 
	L.lojCodi, L.lojNome, L.lojStat, L.lojNume, L.lojLogr, L.lojNumL, L.lojBair,
	P.potNome, P.potSigl, P.potRegu,
	R.ritNome,
	C.cidNome, E.estSigl,
	L.lojLogo,
	P.potLogo
FROM DB_Visitatus_DEV.dbo.Sessao S
JOIN DB_Visitatus_DEV.dbo.Grau G ON G.graCodi = S.graCodi 
JOIN DB_Visitatus_DEV.dbo.TipoSessao TS ON TS.tiSCodi = S.tiSCodi 
JOIN DB_Visitatus_DEV.dbo.Loja L ON L.lojCodi = S.lojCodi
JOIN DB_Visitatus_DEV.dbo.Potencia P ON P.potCodi = L.potCodi
JOIN DB_Visitatus_DEV.dbo.Rito R ON R.ritCodi = L.ritCodi 
JOIN DB_Visitatus_DEV.dbo.Cidade C ON C.cidCodi = L.cidCodi 
JOIN DB_Visitatus_DEV.dbo.Estado E ON E.estCodi = C.estCodi
WHERE S.sesCodi = 4
--WHERE S.sesLibe = 1 AND L.lojCodi = 1
--ORDER BY S.sesCodi DESC



SELECT 
	lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi 
FROM DB_Visitatus_DEV.dbo.Loja
WHERE lojNumL = '4024' AND potCodi = 5


SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus_DEV.dbo.Usuario;

SELECT sesCodi, sesDesc, sesDtHr, sesLibe, sesStat, lojCodi, graCodi, tiSCodi, sesNume, sesNome
FROM DB_Visitatus_DEV.dbo.Sessao;


SELECT perCodi, perNome, perStat
FROM DB_Visitatus_DEV.dbo.Perfil;

--==============================================================================================================================
-- CONFIGURAÇÕES RELACIONADAS À PRESENÇA

SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus_DEV.dbo.Usuario;

SELECT * FROM DB_Visitatus_DEV.dbo.PerfilUsuario
WHERE usuCodi = 4
--WHERE lojCodi >2
;

SELECT * FROM DB_Visitatus_DEV.dbo.Loja
--WHERE lojCodi >2
;

SELECT * FROM DB_Visitatus_DEV.dbo.Presenca;

--==============================================================================================================================

-- CONFIGURAÇÕES RELACIONADAS AOS USUÁRIOS DE UMA LOJA ESPECÍFICA

SELECT * FROM DB_Visitatus_DEV.dbo.Loja L;

SELECT 	* FROM DB_Visitatus_DEV.dbo.Perfil P;

SELECT 	* FROM DB_Visitatus_DEV.dbo.Usuario;

SELECT * FROM DB_Visitatus_DEV.dbo.PerfilUsuario;

SELECT 
	PU.peUCodi,
	L.lojCodi, L.lojNome, L.lojNumL,
	U.usuCodi, U.usuNome,
	P.perCodi, P.perNome 
FROM DB_Visitatus_DEV.dbo.PerfilUsuario PU
JOIN DB_Visitatus_DEV.dbo.Usuario U ON U.usuCodi = PU.usuCodi
JOIN DB_Visitatus_DEV.dbo.Loja L ON L.lojCodi = PU.lojCodi 
JOIN DB_Visitatus_DEV.dbo.Perfil P ON P.perCodi = PU.perCodi
ORDER BY L.lojNome, U.usuNome
--ORDER BY PU.peUCodi DESC
;

SELECT 
	*
FROM DB_Visitatus_DEV.dbo.Usuario U
JOIN DB_Visitatus_DEV.dbo.PerfilUsuario PU ON PU.usuCodi = U.usuCodi
WHERE PU.lojCodi = 1
;


--==============================================================================================================================


SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus_DEV.dbo.TemplateCertificadoPresenca;

SELECT tmpCrtPreCodi, lojCodi, tmpCrtStat
FROM DB_Visitatus_DEV.dbo.TemplateCertificadoLoja;

SELECT * FROM DB_Visitatus_DEV.dbo.TemplateConvite;
SELECT * FROM DB_Visitatus_DEV.dbo.TemplateLoja;


UPDATE DB_Visitatus_DEV.dbo.TemplateConvite
SET tmpCvtMode = N''
WHERE tmpCvtCodi = 0;


-----------------------------------------------------------------------------------------------------------

--GESTÃO DOS CARGOS ADMINISTRATIVOS:

SELECT * FROM DB_Visitatus_DEV.dbo.Cargos;

SELECT * FROM DB_Visitatus_DEV.dbo.CargosRito;

SELECT * FROM DB_Visitatus_DEV.dbo.GestaoCargos; --USR: 2

SELECT * FROM DB_Visitatus_DEV.dbo.Usuario order by usuNome;

SELECT * FROM DB_Visitatus_DEV.dbo.GestaoAdministrativa;

SELECT * FROM DB_Visitatus_DEV.dbo.Loja;


SELECT * FROM DB_Visitatus_DEV.dbo.Sessao;

-- SELECT PARA TRAZER OS OFICIAIS DA GESTÃO ADMINISTRATIVA
SELECT
	L.lojCodi, L.lojNome, L.lojNumL,
	GA.gstAdmNome, GA.gstAdmDtIn, GA.gstAdmDtFi, GA.gstAdmStat,
	C.carNome, U.usuNome
FROM DB_Visitatus_DEV.dbo.Loja L
JOIN DB_Visitatus_DEV.dbo.GestaoAdministrativa GA ON GA.lojCodi = L.lojCodi
JOIN DB_Visitatus_DEV.dbo.GestaoCargos GC ON GC.gstAdmCodi = GA.gstAdmCodi
JOIN DB_Visitatus_DEV.dbo.Cargos C ON C.carCodi = GC.carCodi 
JOIN DB_Visitatus_DEV.dbo.Usuario U ON U.usuCodi = GC.usuCodi 
WHERE L.lojCodi = 1
	AND GA.gstAdmStat = 1
	AND (GA.gstAdmDtIn <= CAST(GETDATE() AS DATE) AND GA.gstAdmDtFi >= CAST(GETDATE() AS DATE))
ORDER BY GA.gstAdmDtFi DESC

-----------------------------------------------------------------------------------------------------------