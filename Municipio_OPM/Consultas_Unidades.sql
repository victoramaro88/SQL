
SELECT UorCod, OrgCod, OrgNivCod, UorNom, UorAreGeo, UorAtvIdc, UorSglNom, UorRegOprDat, PesIdf, PosCod, UorPesRegOprCod, RegOprTipCod, UorOpmIdc, UorAreCor, UorIpRegOprNum, UorMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UOR
--WHERE UorNom LIKE '%Décimo Terceiro%' OR UorNom LIKE '%Jales%'
WHERE UorCod = 602
;

SELECT OrgNivCod, OrgNivDes, OrgNivAtvIdc
FROM DB_MUNICIPIO_OPM.SchUOR.ORGNIV;




--> RETORNANDO APENAS UNIDADES "OPM"
SELECT 
	--*
	Uor, UorOpmCod, UorNome, UorOpm
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE UorOpmAtvIdc = 1
	AND UOR = 602
		--AND UorOpmIdc = 1
;


--> RETORNANDO TODAS A UNIDADES DA OPM
SELECT 
	--*
	Uor, UorOpmNome, UorNome, UorOpm, OrgNiv
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE UorOpmCod IN (600) AND UorOpmAtvIdc = 1
	AND OrgNiv IN (15)
ORDER BY UorOpmCod, UorNome
;


SELECT 
	--*
	Uor, UorOpmNome, UorNome, UorOpm, OrgNiv
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ WITH(NOLOCK)
WHERE (UorOpmAtvIdc = 1 AND OrgNiv IN (15)) --OrgNiv == 15: Estação de Bombeiros (EB)
		AND 
		(UorOpmNome = '13.GB' OR UorOpmNome = '02.GB')
ORDER BY UorOpmNome, UorNome;

                                            



SELECT UorCod, OpmCod, UorOpmAtvIdc, UorRegOprDat, PesIdf, PosCod, UorPesRegOprCod, RegOprTipCod, UorOpmIpRegOprNum, UorOpmMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UOROPM
where uorcod = 600 and UorOpmAtvIdc = 1
;

SELECT UorCod, UorHrqTipCod, UorCodSup, UorHrqTipSupCod, UorHrqCod, UorHrqAtvIdc, UorHrqRegOprDat, PesIdf, PosCod, UorHrqUorRegOprCod, RegOprTipCod, UorHrqIpRegOprNum, UorHrqMaqRegOprNom, UorHrqOrd
FROM DB_MUNICIPIO_OPM.SchUOR.UORHRQ
where UorCod = 600
;



SELECT * FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ_TBL
where Uor = 600 and UorOpmAtvIdc = 1
;



SELECT OrgCod, OrgNom, OrgSgl, OrgAtvIdc
FROM DB_MUNICIPIO_OPM.SchUOR.ORG;



