
SELECT 
	AVA.AvaliacaoIdf, CHA.ChamadoIdf, CHA.ChamadoDt, CAT.CategoriaDesc, SUBCAT.SubCategoriaDesc
FROM DB_HELPDESK_CB.dbo.Avaliacao AVA
JOIN DB_HELPDESK_CB.dbo.Chamado CHA ON CHA.ChamadoIdf = AVA.ChamadoIdf
JOIN DB_HELPDESK_CB.dbo.Categoria CAT ON CAT.CategoriaIdf = CHA.CategoriaIdf
JOIN DB_HELPDESK_CB.dbo.SubCategoria SUBCAT ON SUBCAT.SubCategoriaIdf = CHA.SubCategoriaIdf
;


SELECT 
	AVA.ChamadoIdf, RESQST.AvaliacaoIdf, RESQST.QuestaoIdf, QUE.QuestaoDesc, QUE.QuestaoPeso,
	RESQST.RespostaIdf, RES.RespostaDesc, RES.RespostaPeso, RESQST.RespostaAberta
FROM DB_HELPDESK_CB.dbo.RespostaQuestionario RESQST
JOIN DB_HELPDESK_CB.dbo.Questao QUE ON RESQST.QuestaoIdf = QUE.QuestaoIdf
JOIN DB_HELPDESK_CB.dbo.Resposta RES ON RES.RespostaIdf = RESQST.RespostaIdf
JOIN DB_HELPDESK_CB.dbo.Avaliacao AVA ON AVA.AvaliacaoIdf = RESQST.AvaliacaoIdf
WHERE AVA.ChamadoIdf = 6528
;


SELECT * FROM DB_HELPDESK_CB.dbo.ChamadoMens MSG
JOIN DB_CORP_CCB.SchCRPCCB.PES PES ON PES.PesIdf = MSG.PesIdf
WHERE MSG.ChamadoIdf = 6528
;

