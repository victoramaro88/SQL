SELECT 
	*
FROM DB_MATERIAL_RESGATE.dbo.Estoque Est
JOIN DB_MATERIAL_RESGATE.dbo.Material Mat ON Est.IdMat = Mat.IdMat 
JOIN DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ Uor ON Est.UorCod = Uor.Uor
WHERE 
	UorCod = 821
	--Uor.UorNome LIKE '%GBMAR%'
	AND Mat.Material LIKE '%cadaver%'
	AND Uor.UorOpmAtvIdc = 1
;

SELECT UorCCB, UorCCBNome, UorCCBOOpmCOD, UorCM, UorCMNome, UorCMOOpmCOD, UorSubCM, UorSubCMNome, UorSubCMOpmCOD, UorGBCM, UorGBNome, UorGBOpmCOD, UorSGBCM, UorSGBNome, UorSGBOpmCOD, UorPTCM, UorPTNome, UorPTOpmCOD, UorBaseCM, UorBaseNome, UorBaseOpmCOD, UorGpCM, UorGpNome, UorGpOpmCOD, UorDirCM, UorDirNome, UorDirOpmCOD, UorDepCM, UorDepNome, UorDepOpmCOD, UorDivCM, UorDivNome, UorDivOpmCOD, UorScaCM, UorScaNome, UorScaOpmCOD, UorSTACM, UorSTANome, UorSTAOpmCOD, UorPLCM, UorPLNome, UorPLOpmCOD, UorEBCM, UorEBNome, UorEBOpmCOD, UorNucleoCM, UorNucleoNome, UorNucleoOpmCOD, UorCPCM, UorCPNome, UorCPOpmCOD, UorSecCM, UorSecNome, UorSecOpmCOD, UorCentCM, UorCentNome, UorCentOpmCOD, UorAgCM, UorAgNome, UorAgOpmCOD, UorGabCM, UorGabNome, UorGabOpmCOD, UorConCM, UorConNome, UorConOpmCOD, UorEmCM, UorEmNome, UorEmOpmCOD, UorBOMCM, UorBOMNome, UorBOMOpmCOD, UorPOMCM, UorPOMNome, UorPOMOpmCOD, UorSACM, UorSANome, UorSAOpmCOD, UorBCACM, UorBCANome, UorBCAOpmCOD, UorOpmCod, UorOpmNome, Uor, UorNome, UorOpm, OrgNiv, UorOpmAtvIdc, UorOpmIdc
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE uor= 821 --UorNome LIKE '%GBMAR%'--
	AND UorOpmAtvIdc = 1
;