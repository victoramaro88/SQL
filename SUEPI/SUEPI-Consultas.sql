--==========================================================================================

-- QUERY DO DASHBOARD DO SUEPI_BD:
SELECT 
	EFE.POS_GRAD, EFE.RE AS RE, EFE.DIG, EFE.NOME, EFE.BTL AS OPM, EFE.CIA AS SGB, REX.id_item AS ID_ITEM,
	ITEM.descr_item AS ITEM, TAM.tamanho AS TAMANHO, SITUA.descr_situa AS SITUACAO,
	CONDIC.descr_condic AS CONDICAO, REX.tempo_uso AS TEMPO_USO, REX.dt_atualiza AS DATA_ATUALIZACAO, REX.dt_distribuicao AS DISTRIBUICAO, REX.dt_recebimento AS DATA_RECEBIMENTO
FROM ROMANEIO.dbo.tb_rexromaneio REX WITH(NOLOCK)
JOIN ROMANEIO.dbo.tb_item_romaneio ITEM WITH(NOLOCK) ON REX.id_item = ITEM.id_item
LEFT JOIN ROMANEIO.dbo.tb_situa SITUA WITH(NOLOCK) ON REX.id_situa = SITUA.id_situa 
LEFT JOIN ROMANEIO.dbo.tb_tamanho TAM WITH(NOLOCK) ON REX.id_tam = tam.id_tam 
LEFT JOIN ROMANEIO.dbo.tb_condicoes CONDIC WITH(NOLOCK) ON REX.id_condic = CONDIC.id_condic  
JOIN DB_EFETIVO.SchEfetivo.Efetivo EFE WITH(NOLOCK) ON REX.re = EFE.RE
JOIN DB_RHCB.SchRH.POS POS WITH(NOLOCK) ON EFE.POSCOD = POS.POSCOD 
WHERE EFE.SITUACAO = 'ATIVO'
	AND OPMCOD_EFETIVA LIKE '70%';
	
	AND EFE.BTL = '13.GB' 
	AND EFE.RE = 115064 
	AND ITEM.id_item = 3
;

--==========================================================================================




SELECT * FROM ROMANEIO.dbo.tb_item_romaneio
WHERE Ativo = 1
--AND descr_item LIKE '%CALÇÃO DE EDUCAÇÃO FISICA%'
AND descr_item LIKE '%bota cano%'
ORDER BY descr_item 

SELECT *
FROM ROMANEIO.dbo.tb_rexromaneio rexRom WITH(NOLOCK)
JOIN ROMANEIO.dbo.tb_item_romaneio item WITH(NOLOCK) ON item.id_item = rexRom.id_item 
WHERE rexRom.re IN (141499)
	AND	item.ativo = 1
	AND item.id_item = 4--192
ORDER BY rexRom.id 
;

SELECT * FROM ROMANEIO.dbo.tb_rexromaneio rexRom
WHERE rexRom.re = 141499 AND rexRom.id_item = 4



SELECT re, id_item, id_tam, id_situa, id_condic, tempo_uso, dt_atualiza, distribuido, dt_distribuicao, recebido, dt_recebimento, excluido, qtde, qtde_distribuidos, uorCod, observacoes, opm_distribuicao
FROM ROMANEIO.dbo.tb_rexromaneio_hist
WHERE re = 141499 AND id_item = 4; --2019-05-10 13:34:00.000


SELECT * FROM ROMANEIO.dbo.tb_tamanho
WHERE id_item = 192;


SELECT * FROM DB_EFETIVO.SchEfetivo.Efetivo EFE WITH(NOLOCK)
WHERE /*RE = 141499 AND*/ OPMCOD_EFETIVA LIKE '70%'
