SELECT UorCod, OrgCod, OrgNivCod, UorNom, UorAreGeo, UorAtvIdc, UorSglNom, UorRegOprDat, PesIdf, PosCod, UorPesRegOprCod, RegOprTipCod, UorOpmIdc, UorAreCor, UorIpRegOprNum, UorMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UOR
WHERE  UorCod = 51
;

SELECT UorCttEmaCod, UorCod, CttTipCod, UorCttEmaDes, UorCttEmaAtvIdc, UorCttEmaRegOprDat, PesIdf, PosCod, UorCttEmaUorRegOprCod, RegOprTipCod, UorCttEmaIpRegOprNum, UorCttEmaMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UORCTTEMA
WHERE  UorCod = 51
;

SELECT UorCttTelCod, UorCod, CttTipCod, UorCttTelDddNum, UorCttTelNum, UorCttTelRamNum, UorCttTelAtvIdc, UorCttTelRegOprDat, PesIdf, PosCod, UorCttTelUorRegOprCod, RegOprTipCod, UorCttTelIpRegOprNum, UorCttTelMaqRegOprNom
FROM DB_MUNICIPIO_OPM.SchUOR.UORCTTTEL
WHERE  UorCod = 51
;

SELECT UorCCB, UorCCBNome, UorCCBOOpmCOD, UorCM, UorCMNome, UorCMOOpmCOD, UorSubCM, UorSubCMNome, UorSubCMOpmCOD, UorGBCM, UorGBNome, UorGBOpmCOD, UorSGBCM, UorSGBNome, UorSGBOpmCOD, UorPTCM, UorPTNome, UorPTOpmCOD, UorBaseCM, UorBaseNome, UorBaseOpmCOD, UorGpCM, UorGpNome, UorGpOpmCOD, UorDirCM, UorDirNome, UorDirOpmCOD, UorDepCM, UorDepNome, UorDepOpmCOD, UorDivCM, UorDivNome, UorDivOpmCOD, UorScaCM, UorScaNome, UorScaOpmCOD, UorSTACM, UorSTANome, UorSTAOpmCOD, UorPLCM, UorPLNome, UorPLOpmCOD, UorEBCM, UorEBNome, UorEBOpmCOD, UorNucleoCM, UorNucleoNome, UorNucleoOpmCOD, UorCPCM, UorCPNome, UorCPOpmCOD, UorSecCM, UorSecNome, UorSecOpmCOD, UorCentCM, UorCentNome, UorCentOpmCOD, UorAgCM, UorAgNome, UorAgOpmCOD, UorGabCM, UorGabNome, UorGabOpmCOD, UorConCM, UorConNome, UorConOpmCOD, UorEmCM, UorEmNome, UorEmOpmCOD, UorBOMCM, UorBOMNome, UorBOMOpmCOD, UorPOMCM, UorPOMNome, UorPOMOpmCOD, UorSACM, UorSANome, UorSAOpmCOD, UorBCACM, UorBCANome, UorBCAOpmCOD, UorOpmCod, UorOpmNome, Uor, UorNome, UorOpm, OrgNiv, UorOpmAtvIdc, UorOpmIdc
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE uor = 51
;

SELECT CPFIndTel, DDDOpm, TelOpm, Ramal, CPFAtualizacao, DtHrAtualizacao, PesIdf
FROM DB_PORTAL_CONTEUDO.SchPORCOU.IndTel
WHERE CPFIndTel = '38434362821' --ERIC
;

SELECT EfetivoIdf, CPF, POSCOD, POS_GRAD, RE, DIG, NOME, NOME_GUERRA, SLGCOD, SITUACAO, SEXO, QDRCOD, QDR, OPMCOD_EFETIVA, OPM_NOME_EFETIVA, OPMCOD_ATUAL, OPM_NOME_ATUAL, OPMCOD_ANTERIOR, OPM_NOME_ANTERIOR, GRD_CMD, BTL, CIA, UORCOD, UOR, DATA_INGRESSO, DATA_POSSE, EST_CVL, ESCOLARIDADE, RELIGIAO, DATA_NASC, CNH, VAL_CNH, CAT_CNH, CELULAR, TEL_FUNCIONAL, EMAIL_FUNCIONAL, EMAIL_PARTICULAR, CODBCO, BANCO, AGENCIA, CONTA, DGT_CONT, ALTURA, TIP_SANG, FTR_SANG, CUTIS, TIP_CBL, COR_CBL, NIVEL, ALMAN, DATA_ULT_PROM
FROM DB_EFETIVO.SchEfetivo.Efetivo
WHERE NOME = 'ERIC ALVES TEIXEIRA';