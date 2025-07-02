SELECT usuCodi, sesCodi, preAtiv, lojCodi, preEmai
FROM DB_Visitatus.dbo.Presenca;

SELECT lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi
FROM DB_Visitatus.dbo.Loja;

SELECT sesCodi, sesDesc, sesDtHr, sesLibe, sesStat, lojCodi, graCodi, tiSCodi, sesNume, sesNome
FROM DB_Visitatus.dbo.Sessao;

SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus.dbo.Usuario
ORDER BY usuCodi DESC;

SELECT peUCodi, peUStat, perCodi, usuCodi, lojCodi
FROM DB_Visitatus.dbo.PerfilUsuario
ORDER BY peUCodi DESC;
--ORDER BY perCodi DESC;

SELECT usLCodi, usLUser, usLPass, usLStat, usuCodi
FROM DB_Visitatus.dbo.UsuarioLogin;

SELECT tmpCvtCodi, tmpCvtNome, tmpCvtMode, tmpCvtStat
FROM DB_Visitatus.dbo.TemplateConvite;
UPDATE DB_Visitatus.dbo.TemplateConvite
SET tmpCvtMode=''
WHERE tmpCvtCodi=0;

SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus.dbo.TemplateCertificadoPresenca;
UPDATE DB_Visitatus.dbo.TemplateCertificadoPresenca
SET tmpCrtPreMode=''
WHERE tmpCrtPreCodi=0;
