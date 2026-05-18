SELECT usuCodi, sesCodi, preAtiv, lojCodi, preEmai
FROM DB_Visitatus_DEV.dbo.Presenca;

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


SELECT * FROM DB_Visitatus_DEV.dbo.Loja;




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




--> RETORNAR AS ORIENTAÇÕES DA LOJA PARA AS TELAS DE EDIÇÃO E VISUALIZAÇÃO
SELECT 
	-- *
	OL.orlCodi, OL.orlDesc, OL.orlDtHr, OL.orlStat, OL.lojCodi, OL.usuCodi
	, Usr.usuNome 
FROM DB_Visitatus_DEV.dbo.OrientacaoLoja OL
JOIN DB_Visitatus_DEV.dbo.Usuario Usr ON Usr.usuCodi = OL.usuCodi
WHERE OL.lojCodi = 1
;





SELECT 
	potCodi, potNome, potLogo, potRegu, potStat, potSigl
FROM DB_Visitatus_DEV.dbo.Potencia
WHERE potCodi = 5
;



SELECT ritCodi, ritNome, ritLogo, ritStat
FROM DB_Visitatus_DEV.dbo.Rito;



SELECT peUCodi, peUStat, perCodi, usuCodi, lojCodi
FROM DB_Visitatus_DEV.dbo.PerfilUsuario
where usuCodi = 1
;

SELECT peUCodi, peUStat, perCodi, usuCodi, lojCodi
FROM DB_Visitatus_DEV.dbo.PerfilUsuario
order by peUCodi desc