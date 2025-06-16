SELECT IdMat, Material, Unidade, QCM, Ordem, Ativo
FROM DB_MATERIAL_RESGATE.dbo.Material
ORDER BY Material
;

SELECT DISTINCT  
	--*
	--Estoque.IdEstoque, Estoque.UorCod, Estoque.PesIdf, Estoque.IdMat, Estoque.Quant, Estoque.EstCadDat, OPM.uornome, OPM.UorOpmNome
	SUM(Estoque.Quant)
FROM DB_MATERIAL_RESGATE.dbo.Estoque Estoque
INNER JOIN DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ AS OPM on OPM.uor = Estoque.UorCod
WHERE Estoque.IdMat = 73 AND OPM.UorOpmCod = 455--344--15gb --76--gaed --821--gbmar --176--4gb --278--18gb --149--3ºGB 124--2ºGB --97--1ºGB
AND OPM.UorOpmAtvIdc = 1
;

SELECT top(1)
UorOpmCod, UorOpmNome, Uor, UorNome, 
UorOpm, OrgNiv, UorOpmAtvIdc, UorOpmIdc
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
--WHERE UorOpmCOD = 97 
WHERE UorOpmNome = '02.gb'
--WHERE UorNome = 'GAED'
AND UorOpmAtvIdc = 1
order by uornome
;