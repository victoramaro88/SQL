SELECT IdMat, Material, Unidade, QCM, Ordem, Ativo
FROM ROMANEIO.dbo.MatRom
WHERE Ativo = 1
AND Material LIKE '%SUNGA%'
;


SELECT id, re, id_item, id_tam, id_situa, id_condic, tempo_uso, dt_atualiza, distribuido, dt_distribuicao, recebido, dt_recebimento, excluido, opm_enviada, dt_almoxarifado, almoxarifado, re_almoxarifado, cod_opm_enviada, re_distribuiu, ip_distribuiu, grupo_equipamento, qtde_distribuidos
FROM ROMANEIO.dbo.tb_rexromaneio
where re = 141499
;

SELECT id_almox, id_item, id_tam, dt_almox, opm_almox, re_almox, motivo, situacao
FROM ROMANEIO.dbo.tbl_almox
WHERE opm_almox = '13.GB'
;