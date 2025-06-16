SELECT ChamadoIdf, PesIdf, ChamadoDt, PrioridadeIdf, CategoriaIdf, SubCategoriaIdf, StatusAtendIdf, ChamadoaAtv
FROM DB_HELPDESK_CB.dbo.Chamado
ORDER BY ChamadoIdf DESC;

SELECT ChamadoMensIdf, ChamadoMensDesc, ChamadoMensDt, ChamadoIdf, TipMensChamadoIdf, ChamadoMensAtv, PesIdf
FROM DB_HELPDESK_CB.dbo.ChamadoMens
WHERE ChamadoIdf = 6461;

SELECT ChamadoHistIdf, ChamadoHistDt, ChamadoHistDesc, ChamadoIdf, ModeloRespostaIdf, ChamadoHistAtv
FROM DB_HELPDESK_CB.dbo.ChamadoHist
WHERE ChamadoIdf = 6461;

SELECT AnexoIdf, AnexoEnd, ChamadoMensIdf, AnexoAtv
FROM DB_HELPDESK_CB.dbo.Anexo
WHERE ChamadoMensIdf IN (13750, 13753, 13754);

SELECT ChamadoTransfIdf, ChamadoTransfDt, ChamadoIdf, CategoriaIdf, PesIdfAtual, ChamadoTransfAtv, SubCategoriaIdf
FROM DB_HELPDESK_CB.dbo.ChamadoTransf
WHERE ChamadoIdf = 6461;