SELECT 
	UOR.UorOpmNome, UOR.UorSGBNome, UOR.UorNome, Estoque.EstCadDat
FROM DB_MATERIAL_RESGATE.dbo.Estoque Estoque WITH(NOLOCK)
JOIN DB_MATERIAL_RESGATE.dbo.Material Mat WITH(NOLOCK) ON Mat.IdMat = Estoque.IdMat
JOIN DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ UOR WITH(NOLOCK) ON UOR.Uor = Estoque.UorCod
WHERE UOR.UorOpmNome = '13.GB' AND UOR.UorOpmAtvIdc = 1
	AND CAST(Estoque.EstCadDat AS DATE) < CAST('2026-03-16' AS DATE)
GROUP BY UOR.UorOpmNome, UOR.UorSGBNome, UOR.UorNome, Estoque.EstCadDat
ORDER BY UOR.UorSGBNome, UOR.UorNome, Estoque.EstCadDat
;



SELECT 
	Mat.Material, Estoque.Quant, Estoque.EstCadDat, Mat.Unidade, UOR.UorOpmNome, UOR.UorSGBNome, UOR.UorNome, UOR.UorOpm
FROM DB_MATERIAL_RESGATE.dbo.Estoque Estoque WITH(NOLOCK)
JOIN DB_MATERIAL_RESGATE.dbo.Material Mat WITH(NOLOCK) ON Mat.IdMat = Estoque.IdMat
JOIN DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ UOR WITH(NOLOCK) ON UOR.Uor = Estoque.UorCod
WHERE UOR.UorOpmNome = '13.GB' AND UOR.UorOpmAtvIdc = 1
	AND CAST(Estoque.EstCadDat AS DATE) < CAST('2025-10-20' AS DATE)
;


SELECT UorCCB, UorCCBNome, UorCCBOOpmCOD, UorCM, UorCMNome, UorCMOOpmCOD, UorSubCM, UorSubCMNome, UorSubCMOpmCOD, UorGBCM, UorGBNome, UorGBOpmCOD, UorSGBCM, UorSGBNome, UorSGBOpmCOD, UorPTCM, UorPTNome, UorPTOpmCOD, UorBaseCM, UorBaseNome, UorBaseOpmCOD, UorGpCM, UorGpNome, UorGpOpmCOD, UorDirCM, UorDirNome, UorDirOpmCOD, UorDepCM, UorDepNome, UorDepOpmCOD, UorDivCM, UorDivNome, UorDivOpmCOD, UorScaCM, UorScaNome, UorScaOpmCOD, UorSTACM, UorSTANome, UorSTAOpmCOD, UorPLCM, UorPLNome, UorPLOpmCOD, UorEBCM, UorEBNome, UorEBOpmCOD, UorNucleoCM, UorNucleoNome, UorNucleoOpmCOD, UorCPCM, UorCPNome, UorCPOpmCOD, UorSecCM, UorSecNome, UorSecOpmCOD, UorCentCM, UorCentNome, UorCentOpmCOD, UorAgCM, UorAgNome, UorAgOpmCOD, UorGabCM, UorGabNome, UorGabOpmCOD, UorConCM, UorConNome, UorConOpmCOD, UorEmCM, UorEmNome, UorEmOpmCOD, UorBOMCM, UorBOMNome, UorBOMOpmCOD, UorPOMCM, UorPOMNome, UorPOMOpmCOD, UorSACM, UorSANome, UorSAOpmCOD, UorBCACM, UorBCANome, UorBCAOpmCOD, UorOpmCod, UorOpmNome, Uor, UorNome, UorOpm, OrgNiv, UorOpmAtvIdc, UorOpmIdc
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE UorOpmNome = '13.GB'
;




--Consulta geral de unidades
SELECT 
	UOR.UorOpmNome, UOR.UorSGBNome, UOR.UorNome, Estoque.EstCadDat
FROM DB_MATERIAL_RESGATE.dbo.Estoque Estoque WITH(NOLOCK)
JOIN DB_MATERIAL_RESGATE.dbo.Material Mat WITH(NOLOCK) ON Mat.IdMat = Estoque.IdMat
JOIN DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ UOR WITH(NOLOCK) ON UOR.Uor = Estoque.UorCod
WHERE UOR.UorOpmAtvIdc = 1
GROUP BY UOR.UorOpmNome, UOR.UorSGBNome, UOR.UorNome, Estoque.EstCadDat
ORDER BY UOR.UorSGBNome, UOR.UorNome, Estoque.EstCadDat
;