SELECT usuCodi, sesCodi, preAtiv, lojCodi, preEmai
FROM DB_Visitatus_DEV_DEV.dbo.Presenca;

SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus_DEV.dbo.Usuario
ORDER BY usuCodi DESC;

SELECT peUCodi, peUStat, perCodi, usuCodi, lojCodi
FROM DB_Visitatus_DEV.dbo.PerfilUsuario
ORDER BY peUCodi DESC;

SELECT usLCodi, usLUser, usLPass, usLStat, usuCodi
FROM DB_Visitatus_DEV.dbo.UsuarioLogin;

SELECT tmpCvtCodi, tmpCvtNome, tmpCvtMode, tmpCvtStat
FROM DB_Visitatus_DEV.dbo.TemplateConvite;
UPDATE DB_Visitatus_DEV.dbo.TemplateConvite
SET tmpCvtMode=''
WHERE tmpCvtCodi=0;

SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus_DEV.dbo.TemplateCertificadoPresenca;
UPDATE DB_Visitatus_DEV.dbo.TemplateCertificadoPresenca
SET tmpCrtPreMode=''
WHERE tmpCrtPreCodi=0;


SELECT * FROM DB_Visitatus_DEV.dbo.Perfil;
SELECT * FROM DB_Visitatus_DEV.dbo.Permissao;
SELECT * FROM DB_Visitatus_DEV.dbo.PermissaoPerfil;

SELECT 
	--*
	P.perCodi, P.perNome
	, P2.pemCodi, P2.pemNome  
FROM DB_Visitatus_DEV.dbo.PermissaoPerfil PP
JOIN DB_Visitatus_DEV.dbo.Perfil P ON PP.perCodi = P.perCodi 
JOIN DB_Visitatus_DEV.dbo.Permissao P2 ON PP.pemCodi = P2.pemCodi 
ORDER BY P.perNome 




SELECT lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi
FROM DB_Visitatus_DEV.dbo.Loja;





--> CONSULTA DE PRESENTES CONFIRMADOS NA SESSÃO
SELECT 
    ses.SesCodi,
    ISNULL(ses.SesNume, 0) AS SesNume,
    ses.SesDtHr,
    ses.SesLibe,
    ses.SesStat,
    ses.SesNome
    ,COUNT(pre.SesCodi) AS TotalPresenca
FROM Sessao ses
LEFT JOIN Presenca pre ON ses.SesCodi = pre.SesCodi
WHERE ses.LojCodi = 1--@LojCodi
  AND ses.SesDtHr >= GETDATE()
GROUP BY 
    ses.SesCodi,
    ses.SesNume,
    ses.SesDtHr,
    ses.SesLibe,
    ses.SesStat,
    ses.SesNome
ORDER BY ses.SesDtHr ASC;







SELECT
	ses.sesCodi,
	--usr.usuNome,
	usr.usuCodi,
    ISNULL(perfUsr.perCodi, 0) AS PerfUsr,
	--
    ses.SesCodi,
    ISNULL(ses.SesNume, 0) AS SesNume,
    ses.SesDtHr,
    ses.SesLibe,
    ses.SesStat,
    ses.SesNome
    ,COUNT(pre.SesCodi) AS TotalPresenca
FROM Sessao ses
LEFT JOIN Presenca pre ON ses.SesCodi = pre.SesCodi
LEFT JOIN Usuario usr ON usr.usuCodi = pre.usuCodi 
LEFT JOIN PerfilUsuario perfUsr ON perfUsr.usuCodi = usr.usuCodi AND perfUsr.lojCodi = ses.lojCodi AND perfUsr.perCodi = 4
LEFT JOIN Perfil perf ON perf.perCodi = perfUsr.perCodi
WHERE ses.LojCodi = 1--@LojCodi
  AND ses.SesDtHr >= GETDATE()
GROUP BY 
	ses.sesCodi,
 	usr.usuCodi,
 	perfUsr.perCodi,
    ses.SesCodi,
    ses.SesNume,
    ses.SesDtHr,
    ses.SesLibe,
    ses.SesStat,
    ses.SesNome    
ORDER BY ses.SesDtHr ASC;




SELECT 
	--* 
	s.sesCodi,
	s.sesDesc,
	s.sesNome,
	s.SesDtHr,
	COUNT(s.sesCodi) AS TotalPresenca
from Sessao s 
LEFT JOIN Presenca p ON p.sesCodi = s.sesCodi
WHERE s.LojCodi = 1--@LojCodi
  AND s.SesDtHr >= GETDATE()
GROUP BY 
	s.sesCodi,
	s.sesDesc,
	s.sesNome,
	s.SesDtHr
ORDER BY s.SesDtHr ASC;




SELECT * FROM Usuario usr
LEFT JOIN PerfilUsuario perf ON usr.usuCodi = perf.usuCodi 
WHERE perf.lojCodi = 1


SELECT peUCodi, peUStat, perCodi, usuCodi, lojCodi
FROM DB_Visitatus_DEV.dbo.PerfilUsuario
where usuCodi = 50--in (1, 57)
--and lojCodi = 1
;



SELECT * FROM PerfilUsuario pu
WHERE pu.usuCodi = 50
--ORDER BY pu.peUCodi DESC



SELECT 
	*
FROM DB_Visitatus_DEV.dbo.Sessao Ses
JOIN DB_Visitatus_DEV.dbo.Loja Loj ON Ses.lojCodi = Loj.lojCodi
JOIN DB_Visitatus_DEV.dbo.TipoSessao TipSes ON Ses.tiSCodi = TipSes.tiSCodi 
JOIN DB_Visitatus_DEV.dbo.
;










