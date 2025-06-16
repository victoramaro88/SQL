SELECT 
*
--UorCod, OpmCod, UorOpmAtvIdc, UorRegOprDat, PesIdf, PosCod, UorPesRegOprCod, RegOprTipCod, UorOpmIpRegOprNum, UorOpmMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UOROPM AS UOROPM WITH(NOLOCK)
INNER JOIN DB_MUNICIPIO_OPM.SchUOR.UOR AS UOR ON UOR.UorCod = UOROPM.UorCod 
WHERE 
	UOROPM.UorCod = 145
AND
	UOROPM.UorOpmAtvIdc = 1
;

SELECT  
	*--UorOpm, UorGBNome, UorSecNome, UorSGBNome, UorPLNome, UorEBNome
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ_TBL WITH(NOLOCK)
WHERE 
	UorGBNome = '02.GB'
AND 
	UorOpmAtvIdc = 1 --AND OrgNiv = 15
ORDER BY 
	UorNome 
;

SELECT 
	UorCCB, UorCCBNome, UorCCBOOpmCOD, UorCM, UorCMNome, UorCMOOpmCOD, 
	UorSubCM, UorSubCMNome, UorSubCMOpmCOD, UorGBCM, UorGBNome, UorGBOpmCOD, 
	UorSGBCM, UorSGBNome, UorSGBOpmCOD, UorPTCM, UorPTNome, UorPTOpmCOD, UorBaseCM, 
	UorBaseNome, UorBaseOpmCOD, UorGpCM, UorGpNome, UorGpOpmCOD, UorDirCM, UorDirNome, 
	UorDirOpmCOD, UorDepCM, UorDepNome, UorDepOpmCOD, UorDivCM, UorDivNome, UorDivOpmCOD, 
	UorScaCM, UorScaNome, UorScaOpmCOD, UorSTACM, UorSTANome, UorSTAOpmCOD, UorPLCM, 
	UorPLNome, UorPLOpmCOD, UorEBCM, UorEBNome, UorEBOpmCOD, UorNucleoCM, UorNucleoNome, 
	UorNucleoOpmCOD, UorCPCM, UorCPNome, UorCPOpmCOD, UorSecCM, UorSecNome, UorSecOpmCOD, 
	UorCentCM, UorCentNome, UorCentOpmCOD, UorAgCM, UorAgNome, UorAgOpmCOD, UorGabCM, 
	UorGabNome, UorGabOpmCOD, UorConCM, UorConNome, UorConOpmCOD, UorEmCM, UorEmNome, 
	UorEmOpmCOD, UorBOMCM, UorBOMNome, UorBOMOpmCOD, UorPOMCM, UorPOMNome, UorPOMOpmCOD, 
	UorSACM, UorSANome, UorSAOpmCOD, UorBCACM, UorBCANome, UorBCAOpmCOD, UorOpmCod, 
	UorOpmNome, Uor, UorNome, UorOpm, OrgNiv, UorOpmAtvIdc, UorOpmIdc
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE 
	UorGBNome = '02.GB'
AND 
	UorOpmAtvIdc = 1 --AND OrgNiv = 15
ORDER BY 
	UorNome 
;

SELECT UorCod, OrgCod, OrgNivCod, UorNom, UorAreGeo, UorAtvIdc, UorSglNom, UorRegOprDat, PesIdf, PosCod, UorPesRegOprCod, RegOprTipCod, UorOpmIdc, UorAreCor, UorIpRegOprNum, UorMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UOR
WHERE 
	UorCod = 145
;




SELECT OrgCod, OrgNom, OrgSgl, OrgAtvIdc
FROM DB_MUNICIPIO_OPM.SchUOR.ORG;

SELECT OrgNivCod, OrgNivDes, OrgNivAtvIdc
FROM DB_MUNICIPIO_OPM.SchUOR.ORGNIV;