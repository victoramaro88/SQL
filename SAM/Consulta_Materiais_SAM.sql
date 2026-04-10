SELECT ID, Sigla, Chapa, GrupoMaterial, NumeroSerie, Item, DescricaoItem, Orgao, UO, UGE, UA, DescricaoDivisao, Responsavel, ContaContabil, ContaDepreciacao, ValorAquisicao, DepreciacaoAcumulada, ValorAtual, DepreciacaoMensal, VidaUtil, DataAquisicao, DataIncorporacao, Empenho, NumeroDocumento, UltimoHistorico, DataUltimoHistorico, Tipo, EstadoConservacao, DestinoUge, UltimaDepreciacao, CpfCarga, DataInsercao
FROM DB_MATERIAL.SchSAM.TBL_CARGA_MATERIAIS
where Chapa = '181813'
;