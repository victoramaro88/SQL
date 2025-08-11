
SELECT UorCod, OrgCod, OrgNivCod, UorNom, UorAreGeo, UorAtvIdc, UorSglNom, UorRegOprDat, PesIdf, PosCod, UorPesRegOprCod, RegOprTipCod, UorOpmIdc, UorAreCor, UorIpRegOprNum, UorMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UOR
WHERE UorNom LIKE '%Décimo Terceiro%'
;

SELECT OrgNivCod, OrgNivDes, OrgNivAtvIdc
FROM DB_MUNICIPIO_OPM.SchUOR.ORGNIV;




--> RETORNANDO APENAS UNIDADES "OPM"
SELECT 
	--*
	Uor, UorOpmCod, UorNome, UorOpm
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE UorOpmIdc = 1 AND UorOpmAtvIdc = 1
;


--> RETORNANDO TODAS A UNIDADES DA OPM
SELECT 
	--*
	Uor, UorNome, UorOpm, OrgNiv
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
--WHERE UorGBNome = '13.GB' AND UorOpmAtvIdc = 1
WHERE UorOpmCod = 600 AND UorOpmAtvIdc = 1
	--AND OrgNiv NOT IN (14)
;




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