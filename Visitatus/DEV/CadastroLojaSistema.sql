SELECT *
FROM DB_Visitatus_DEV.dbo.Loja
WHERE Loja.lojCodi = 65;


SELECT tmpCvtCodi, lojCodi, tmpLjStat
FROM DB_Visitatus_DEV.dbo.TemplateLoja;

SELECT tmpCvtCodi, tmpCvtNome, tmpCvtMode, tmpCvtStat
FROM DB_Visitatus_DEV.dbo.TemplateConvite;