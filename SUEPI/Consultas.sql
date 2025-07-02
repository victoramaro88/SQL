SELECT IdMat, Material, Unidade, QCM, Ordem, Ativo
FROM ROMANEIO.dbo.MatRom
WHERE Ativo = 1
AND Material LIKE '%Bota%'
;

SELECT id_item, descr_item, id_ativ, id_servico, genero, id_grupo, imagem, foto, cod_grupo, ativo, usuario, data_criacao, durabilidade, cod_grupo_pessoas, cod_categoria
FROM ROMANEIO.dbo.tb_item_romaneio
WHERE Ativo = 1
AND descr_item LIKE '%Bota%';


SELECT
	--*
	rexRom.id_item, rexRom.id_situa, rexRom.id_tam, rexRom.tempo_uso, rexRom.dt_atualiza
FROM ROMANEIO.dbo.tb_rexromaneio rexRom WITH(NOLOCK)
JOIN ROMANEIO.dbo.tb_item_romaneio item WITH(NOLOCK) ON item.id_item = rexRom.id_item 
WHERE rexRom.re = 141499 
		AND item.ativo = 1
		AND item.id_item = 4
;

SELECT id_almox, id_item, id_tam, dt_almox, opm_almox, re_almox, motivo, situacao
FROM ROMANEIO.dbo.tbl_almox
WHERE opm_almox = '13.GB'
;


