SELECT * FROM DB_CORP_CCB.SchCRPCCB.PES PES
WHERE PES.PesCpfMigNum = '18182434823'


SELECT 
	Cha.ChamadoIdf, Cha.ChamadoDt, Mens.ChamadoMensDt,	Cat.CategoriaDesc, SubCat.SubCategoriaDesc
	,(SELECT ChamadoMensDesc from DB_HELPDESK_CB.dbo.ChamadoMens where ChamadoIdf = Cha.ChamadoIdf AND TipMensChamadoIdf = 1) AS MsgAbertura
	, Mens.ChamadoMensDesc
	, PES.PesNom
FROM DB_HELPDESK_CB.dbo.Chamado Cha
JOIN DB_HELPDESK_CB.dbo.ChamadoMens Mens ON Mens.ChamadoIdf = Cha.ChamadoIdf
JOIN DB_HELPDESK_CB.dbo.Categoria Cat ON Cha.CategoriaIdf = Cat.CategoriaIdf 
JOIN DB_HELPDESK_CB.dbo.SubCategoria SubCat ON Cha.SubCategoriaIdf = SubCat.SubCategoriaIdf
JOIN DB_CORP_CCB.SchCRPCCB.PES PES ON PES.PesIdf = Mens.PesIdf
WHERE Mens.PesIdf IN (5196) AND Mens.TipMensChamadoIdf = 5
ORDER BY PES.PesNom, Mens.ChamadoIdf
;


SELECT * FROM DB_HELPDESK_CB.dbo.Chamado Cha
WHERE Cha.ChamadoIdf IN (6406, 6446)

SELECT * FROM DB_HELPDESK_CB.dbo.ChamadoMens Mens
WHERE Mens.ChamadoIdf = 6446


