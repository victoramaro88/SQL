--> CONVITES
SELECT tmpCvtCodi, tmpCvtNome, tmpCvtMode, tmpCvtStat
FROM DB_Visitatus.dbo.TemplateConvite;

SELECT tmpCvtCodi, lojCodi, tmpLjStat
FROM DB_Visitatus.dbo.TemplateLoja;


--> CERTIFICADOS
SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus.dbo.TemplateCertificadoPresenca;

SELECT tmpCrtPreCodi, lojCodi, tmpCrtStat
FROM DB_Visitatus.dbo.TemplateCertificadoLoja;

