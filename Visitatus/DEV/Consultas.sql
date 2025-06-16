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











