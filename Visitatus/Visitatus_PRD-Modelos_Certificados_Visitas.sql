SELECT tmpCrtPreCodi, tmpCrtPreNome, tmpCrtPreMode, tmpCrtPreStat
FROM DB_Visitatus.dbo.TemplateCertificadoPresenca;

SELECT tmpCrtPreCodi, lojCodi, tmpCrtStat
FROM DB_Visitatus.dbo.TemplateCertificadoLoja;

----------------------------------------------------------------------------------------------------------------

SELECT tmpCvtCodi, tmpCvtNome, tmpCvtMode, tmpCvtStat
FROM DB_Visitatus.dbo.TemplateConvite;

SELECT tmpCvtCodi, lojCodi, tmpLjStat
FROM DB_Visitatus.dbo.TemplateLoja;




SELECT sesCodi, sesDesc, sesDtHr, sesLibe, sesStat, lojCodi, graCodi, tiSCodi, sesNume, sesNome
FROM DB_Visitatus.dbo.Sessao;

SELECT usuCodi, sesCodi, preAtiv, lojCodi, preEmai
FROM DB_Visitatus.dbo.Presenca
order by sesCodi;