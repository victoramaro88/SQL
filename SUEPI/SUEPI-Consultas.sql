--==========================================================================================

-- QUERY DO DASHBOARD DO SUEPI_BD:
SELECT 
	EFE.POS_GRAD, EFE.RE AS RE, EFE.DIG, EFE.NOME, EFE.BTL AS OPM, EFE.CIA AS SGB, REX.id_item AS ID_ITEM,
	ITEM.descr_item AS ITEM, TAM.tamanho AS TAMANHO, SITUA.descr_situa AS SITUACAO,
	CONDIC.descr_condic AS CONDICAO, REX.tempo_uso AS TEMPO_USO, REX.dt_atualiza AS DATA_ATUALIZACAO, REX.dt_recebimento AS DATA_RECEBIMENTO
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
	AND EFE.RE = 115064 AND ITEM.id_item = 3
--WHERE REX.id_item IN (4, 190, 191, 192)
	--AND EFE.OPM_NOME_EFETIVA = '13.GB'
	--AND REX.dt_atualiza < '2025-07-22'
	--AND REX.re = 141499
--ORDER BY POS.POSNIV, EFE.ALMAN
;

--==========================================================================================




SELECT * FROM ROMANEIO.dbo.tb_item_romaneio
WHERE Ativo = 1
--AND descr_item LIKE '%CALÇÃO DE EDUCAÇÃO FISICA%'
AND descr_item LIKE '%bermuda%'
ORDER BY descr_item 

SELECT *
FROM ROMANEIO.dbo.tb_rexromaneio rexRom WITH(NOLOCK)
JOIN ROMANEIO.dbo.tb_item_romaneio item WITH(NOLOCK) ON item.id_item = rexRom.id_item 
WHERE rexRom.re = 141499 
		AND item.ativo = 1
		AND item.id_item = 4
;


SELECT * FROM DB_EFETIVO.SchEfetivo.Efetivo EFE WITH(NOLOCK)
WHERE /*RE = 141499 AND*/ OPMCOD_EFETIVA LIKE '70%'



-- antigo
WITH HIST_RANK AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY re, id_item ORDER BY dt_atualiza DESC) AS rn
    FROM ROMANEIO.dbo.tb_rexromaneio_hist WITH(NOLOCK)
)
SELECT 
    EFE.POS_GRAD, 
    EFE.RE AS RE, 
    EFE.DIG, 
    EFE.NOME, 
    EFE.BTL AS OPM, 
    EFE.CIA AS SGB, 
    REX.id_item AS ID_ITEM,
    ITEM.descr_item AS ITEM, 
    TAM.tamanho AS TAMANHO, 
    SITUA.descr_situa AS SITUACAO,
    CONDIC.descr_condic AS CONDICAO, 
    REX.tempo_uso AS TEMPO_USO, 
    REX.dt_atualiza AS DATA_ATUALIZACAO,
    HIST.dt_recebimento AS DATA_RECEBIMENTO 
FROM ROMANEIO.dbo.tb_rexromaneio REX WITH(NOLOCK)
JOIN ROMANEIO.dbo.tb_item_romaneio ITEM WITH(NOLOCK) 
    ON REX.id_item = ITEM.id_item
LEFT JOIN ROMANEIO.dbo.tb_situa SITUA WITH(NOLOCK) 
    ON REX.id_situa = SITUA.id_situa 
LEFT JOIN ROMANEIO.dbo.tb_tamanho TAM WITH(NOLOCK) 
    ON REX.id_tam = TAM.id_tam 
LEFT JOIN ROMANEIO.dbo.tb_condicoes CONDIC WITH(NOLOCK) 
    ON REX.id_condic = CONDIC.id_condic 
LEFT JOIN HIST_RANK HIST 
    ON REX.re = HIST.re 
   AND REX.id_item = HIST.id_item 
   AND HIST.rn = 1
JOIN DB_EFETIVO.SchEfetivo.Efetivo EFE WITH(NOLOCK) 
    ON REX.re = EFE.RE
JOIN DB_RHCB.SchRH.POS POS WITH(NOLOCK) 
    ON EFE.POSCOD = POS.POSCOD 
WHERE EFE.SITUACAO = 'ATIVO'
	AND EFE.OPMCOD_EFETIVA LIKE '70%'
AND EFE.BTL = '13.GB' 
  AND EFE.RE = 115064
  AND ITEM.id_item = 3;
