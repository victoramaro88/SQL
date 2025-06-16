

/* --------------------------------------------------------------------------- */

--CONSULTA GERAL DA PM
SELECT * FROM DB_EFETIVO.SchEfetivo.RHCB
--WHERE CPF = '32263773886'
WHERE RE = 147117

/* --------------------------------------------------------------------------- */

--CONSULTA DE E-MAIL DO USUÁRI POR RE OU CPF
DECLARE @docPessoa VARCHAR(30)
SET @docPessoa = '141499'--'39516468888'--
SELECT
	  PES.PesIdf AS pesIdf
	, ISNULL(EFE.POS_GRAD, 'CIVIL') AS posGrad
	, EFE.RE
	, EFE.DIG
	, DOCPF.DocPfNum AS docPfNum
	, PES.PESNOM AS pesNom
    , EMAPF.EmaPfDes AS emaPfDes
    , TELPF.TelPfDddNum AS telPfDddNum, TELPF.TelPfTelNum AS telPfTelNum
    , CTTPF.CttTipCod AS cttTipCod, CTTIP.CttTipNom AS cttTipNom
FROM DB_CORP_CCB.SchCRPCCB.CTTPF CTTPF
INNER JOIN DB_CORP_CCB.SchCRPCCB.CTTTIP CTTIP ON CTTIP.CttTipCod = CTTPF.CttTipCod
LEFT JOIN DB_CORP_CCB.SchCRPCCB.EMAPF EMAPF ON EMAPF.CttPfIdf = CTTPF.CttPfIdf
LEFT JOIN DB_CORP_CCB.SchCRPCCB.TELPF TELPF ON TELPF.CttPfIdf = CTTPF.CttPfIdf
INNER JOIN DB_CORP_CCB.SchCRPCCB.PES PES ON PES.PesIdf = CTTPF.PesIdf
INNER JOIN DB_CORP_CCB.SchCRPCCB.DOCPF DOCPF WITH(NOLOCK) ON DOCPF.PesIdf = PES.PesIdf AND DOCPF.DocTipPFCod = 1
LEFT JOIN DB_EFETIVO.SchEfetivo.Efetivo EFE ON EFE.CPF = DOCPF.DocPfNum
WHERE (DOCPF.DocPfNum = @docPessoa OR EFE.RE = TRY_CAST(@docPessoa AS INT))
ORDER BY CTTPF.CttPfIdf

/* --------------------------------------------------------------------------- */

-- CONSULTA DE MATERIAIS DE RESGATE:
SELECT IdEstoque, UorCod, PesIdf, IdMat, Quant, EstCadDat
FROM DB_MATERIAL_RESGATE.dbo.Estoque
WHERE UorCod IN(2520, 2486, 2518, 2519)
order by EstCadDat DESC 
;
--701000124

SELECT UorCCB, UorCCBNome, UorCCBOOpmCOD, UorCM, UorCMNome, UorCMOOpmCOD, UorSubCM, UorSubCMNome, UorSubCMOpmCOD, UorGBCM, UorGBNome, UorGBOpmCOD, UorSGBCM, UorSGBNome, UorSGBOpmCOD, UorPTCM, UorPTNome, UorPTOpmCOD, UorBaseCM, UorBaseNome, UorBaseOpmCOD, UorGpCM, UorGpNome, UorGpOpmCOD, UorDirCM, UorDirNome, UorDirOpmCOD, UorDepCM, UorDepNome, UorDepOpmCOD, UorDivCM, UorDivNome, UorDivOpmCOD, UorScaCM, UorScaNome, UorScaOpmCOD, UorSTACM, UorSTANome, UorSTAOpmCOD, UorPLCM, UorPLNome, UorPLOpmCOD, UorEBCM, UorEBNome, UorEBOpmCOD, UorNucleoCM, UorNucleoNome, UorNucleoOpmCOD, UorCPCM, UorCPNome, UorCPOpmCOD, UorSecCM, UorSecNome, UorSecOpmCOD, UorCentCM, UorCentNome, UorCentOpmCOD, UorAgCM, UorAgNome, UorAgOpmCOD, UorGabCM, UorGabNome, UorGabOpmCOD, UorConCM, UorConNome, UorConOpmCOD, UorEmCM, UorEmNome, UorEmOpmCOD, UorBOMCM, UorBOMNome, UorBOMOpmCOD, UorPOMCM, UorPOMNome, UorPOMOpmCOD, UorSACM, UorSANome, UorSAOpmCOD, UorBCACM, UorBCANome, UorBCAOpmCOD, UorOpmCod, UorOpmNome, Uor, UorNome, UorOpm, OrgNiv, UorOpmAtvIdc, UorOpmIdc
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
WHERE UorOpmCod = 76;


SELECT
    MAT.IdMat
    ,MAT.Material
    ,EST.Quant
    ,VW.[Uor]
    ,VW.[UorOpm]
    ,VW.[OrgNiv]
    ,VW.[UorOpmCod]
    ,VW.[UorOpmNome]
    ,VW.[UorSGBNome]
    ,VW.[UorNome]
    --,CONCAT(VW.[UorOpmNome], ' - ', VW.[UorSGBNome], ' - ', VW.[UorNome]) AS NomeUnidade
  FROM DB_MATERIAL_RESGATE.[dbo].[Estoque] AS EST WITH(NOLOCK)
  INNER JOIN DB_MATERIAL_RESGATE.[dbo].[Material] AS MAT WITH(NOLOCK) ON MAT.IdMat = EST.IdMat
  INNER JOIN DB_MUNICIPIO_OPM.[SchUOR].[VW_UOR_OPM_UOROPM_UORHRQ] AS VW WITH(NOLOCK) ON VW.Uor = EST.UorCod
  WHERE 
    VW.[UorOpmAtvIdc] = 1
    AND (
        RIGHT (VW.[UorOpm],1) != '0'
        OR RIGHT (VW.[UorOpm],3) = '000'
    )
    AND LEFT (VW.[UorOpm],3) != '702'
    AND ((VW.[OrgNiv] = 4 OR VW.[OrgNiv] = 5 OR VW.[OrgNiv] = 15)OR(VW.[Uor] = 898 OR VW.[Uor] = 870 OR (VW.[Uor] = 2486 AND VW.UorOpm = 701000124))) --ESB / MANU / GAED
 ORDER BY VW.[UorOpmCod], VW.[OrgNiv]

/* --------------------------------------------------------------------------- */
-- CONSULTA SOLICITAÇÕES SOLICITAÇÃO IOT

SELECT StdCod, StdDat, StdOriCod, StdMniCod, NcdCod, PesIdf, StdCadCod, StdIclDat, StdNum, StdPriCod, OpmCbIdf
FROM COBOM_ONLINE.SchCOBONL.STD
order by StdDat desc;

SELECT StdCod, StdDat, MunCod, StdLocLat, StdLocLng, StdLocLgrNom, StdLocLgrBaiNom, StdLocLgrNum, StdLocPrxLat, StdLocPrxLng, StdLocSltLat, StdLocSltLng, StdLocLgrCplDes
FROM COBOM_ONLINE.SchCOBONL.STDLOC
order by StdDat desc;

SELECT StdCod, StdDat, HisStdSeqNum, HisStdDes, PesIdf, HisStdIclDat
FROM COBOM_ONLINE.SchCOBONL.HISSTD
order by StdDat desc;

SELECT StdArqIdf, StdCod, StdDat, StdArdEnd
FROM COBOM_ONLINE.SchCOBONL.STDARQ
order by StdDat desc;

SELECT PesIdf, PesNom, PesSclNom, PesTipCod, PesNasDat, PesCpfMigNum, PesIclDat
FROM DB_CORP_CCB.SchCRPCCB.PES
WHERE PesCpfMigNum = '32263773886';

/* --------------------------------------------------------------------------- */

SELECT id, situacao
FROM CHAMADOS.dbo.situacao;

SELECT statusid, statusname, statusicon, displayorder
FROM CHAMADOS.dbo.ticketstatus;

/* --------------------------------------------------------------------------- */

--CONSULTA IDO

SELECT
	COUNT(IdoIdc)
FROM DB_SDO.dbo.IDO
WHERE IdoIdc = 0;

SELECT * FROM(
SELECT TOP(5)
	OcrID, IdoDataFin, IdoIdc, IdoDatEnvio
FROM DB_SDO.dbo.IDO
WHERE IdoIdc = 0
ORDER BY IdoDataFin DESC
UNION ALL
SELECT TOP(5)
	OcrID, IdoDataFin, IdoIdc, IdoDatEnvio
FROM DB_SDO.dbo.IDO
WHERE IdoIdc = 1
ORDER BY IdoDataFin DESC
UNION ALL
SELECT TOP(5)
	OcrID, IdoDataFin, IdoIdc, IdoDatEnvio
FROM DB_SDO.dbo.IDO
WHERE IdoIdc = 2
ORDER BY IdoDataFin DESC
) AS Pesquisa
ORDER BY Pesquisa.IdoIdc, Pesquisa.IdoDatEnvio DESC

/* --------------------------------------------------------------------------- */

--Consulta de Logs

SELECT top(10) LogCod, IP, Host, ModLogCod, UsrCod, SisLogReg, datHorReg
FROM DB_LOG.SchLog.Log
order by datHorReg desc;

SELECT top(10) ModLogCod, SisLogCod, ModLog
FROM DB_LOG.SchLog.ModLog;

SELECT top(10) SisLogCod, SisLog
FROM DB_LOG.SchLog.SisLog;

/* --------------------------------------------------------------------------- */

SELECT CPF, RE, PosGrad, Nome, NomeGuerra, Email, OpmAtu, UorCod, UorOpmCod, UorOpmNome, DDDOpm, TelOpm, Ramal, OrdemPostoGrad
FROM DB_PORTAL_CONTEUDO.SchPORCOU.VW_UOR_INDICADOR_TEL
WHERE UorOpmCod = '50';

SELECT CPF, RE, PosGrad, Nome, NomeGuerra, Email, OpmAtu, UorCod, UorOpmCod, UorOpmNome, DDDOpm, TelOpm, Ramal, OrdemPostoGrad
FROM DB_PORTAL_CONTEUDO.SchPORCOU.VW_UOR_PAGINA_INDICADOR_TEL
WHERE UorOpmCod = 50;

/* --------------------------------------------------------------------------- */

-- Pesquisa Efetivo

SELECT TOP(10)
	EfetivoIdf, CPF, POSCOD, POS_GRAD, RE, DIG, NOME, NOME_GUERRA, SLGCOD, SITUACAO, SEXO, QDRCOD, QDR, OPMCOD_EFETIVA, OPM_NOME_EFETIVA, OPMCOD_ATUAL, OPM_NOME_ATUAL, OPMCOD_ANTERIOR, OPM_NOME_ANTERIOR, GRD_CMD, BTL, CIA, UOR, DATA_INGRESSO, DATA_POSSE, EST_CVL, ESCOLARIDADE, RELIGIAO, DATA_NASC, CNH, VAL_CNH, CAT_CNH, CELULAR, TEL_FUNCIONAL, EMAIL_FUNCIONAL, EMAIL_PARTICULAR, CODBCO, BANCO, AGENCIA, CONTA, DGT_CONT, ALTURA, TIP_SANG, FTR_SANG, CUTIS, TIP_CBL, COR_CBL, NIVEL, ALMAN, DATA_ULT_PROM
FROM padrao.dbo.Efetivo
WHERE CPF = '32263773886'
;

SELECT TOP(10)
cpf, re, digre, posgrad, nome, nomeguerra, datanasc, sexo, email, gcmd, opm, pb, opm_atu, codposgrad, quadro, tipo_func, ordempostograd, codsitua, situa, opm_efet, quadro_desc, PmEmaIdc
FROM padrao.dbo.tb_contrefetivo
WHERE CPF = '32263773886'
;

SELECT 
	*
	--id, re, cpf, id_fun, principal, status
FROM padrao.dbo.tb_efe_fun EFEFUN WITH(NOLOCK)
INNER JOIN padrao.dbo.tb_funcao FUN WITH(NOLOCK) ON FUN.ID = EFEFUN.id_fun 
WHERE CPF = '32263773886'
;

SELECT id, descricao
FROM padrao.dbo.tb_funcao;

/* --------------------------------------------------------------------------- */

SELECT SftCod, SftTipCod, SftClsCod, OpmCbIdf, SftNom, SftDes, SftAtvIdc, SftSgl, SftCpfIclNum, SftIclDat, CnmAreCod
FROM DB_CONAPLIC.SchCTRAPL.SFT
where SftNom like '%Data Center%'
--where SftNom like '%App%'
--WHERE SftCod = 75
--WHERE SftTipCod = 4
--WHERE SftClsCod = 4;

SELECT VrsSftIdf, SftCod, SftTipCod, SftClsCod, VrsSftNum, VrsSftDat, VrsSftAtvIdc, VrsSftDes, VrsSftTagNom
FROM DB_CONAPLIC.SchCTRAPL.VRSSFT
WHERE SftCod = 63;

SELECT AbeCtrVrsSftIdf, VrsSftIdf, AbeCtrCod, AbeCtrVrsSftUrlDes, AbeCtrVrsSftAtvIdc, AbeCtrVrsSftIcnArqNom
FROM DB_CONAPLIC.SchCTRAPL.ABECTRVRSSFT
WHERE VrsSftIdf = 2085;

SELECT MnuSftCod, SftCod, SftTipCod, SftClsCod, MnuSftNom, MnuSftEnd, MnuSftAtvIdc
FROM DB_CONAPLIC.SchCTRAPL.MNUSFT
WHERE SftCod = 63

SELECT MnuSftFndCod, MnuSftCod, MnuSftFndPaiCod, MnuSftPaiCod, MnuSftFndNom, MnuSftFndEnd, MnuSftFndAtvIdc
FROM DB_CONAPLIC.SchCTRAPL.MNUSFTFND
WHERE MnuSftFndAtvIdc = 1 AND 
MnuSftCod IN (124)--(114, 115, 159, 160, 176, 183, 184)

SELECT GrpAcsCod, GrpAcsNom, GrpAcsAtvIdc, GrpAcsSlgNom
FROM DB_MA.SchMA.GRPACS
WHERE GrpAcsCod = 82;

SELECT GrpAcsCod, MnuSftFndCod, MnuSftCod, GrpAcsFndAtvIdc
FROM DB_MA.SchMA.GRPACSFND
WHERE GrpAcsCod = 101

SELECT AbeCtrCod, AbeCtrNom
FROM DB_CONAPLIC.SchCTRAPL.ABECTR;

SELECT CnmAreCod, CnmArePaiCod, CnmAreNom, CnmAreOrdNum
FROM DB_CORP_CCB.SchCRPCCB.CNMARE;

/* --------------------------------------------------------------------------- */

SELECT 
	PES.PesIdf,PES.PesNom,A.UorCod
    FROM [DB_CORP_CCB].[SchCRPCCB].[PES] AS PES WITH(NOLOCK)
		LEFT JOIN (
            SELECT 
            	EFEMILCB.PesIdf, UorOpm.UorCod
            FROM [DB_RHCB].[SchRH].[EFEMILCB] AS EFEMILCB
            LEFT JOIN [DB_RHCB].[SchRH].[EfeCbOpm] Opm ON Opm.PesIdf = EFEMILCB.PesIdf
            LEFT JOIN [DB_MUNICIPIO_OPM].[SchUOR].[UOROPM] UorOpm ON Opm.OpmCod = UorOpm.OpmCod AND UorOpm.UorOpmAtvIdc = 1
            WHERE Opm.UniAlcTipCod = 2 ) A ON PES.PesIdf = A.PesIdf
        WHERE PES.PesIdf = 3163 OR PES.PesCpfMigNum = '39516468888'
        

SELECT 
    	UorOpm.UorCod
    FROM [DB_RHCB].[SchRH].[EFEMILCB] AS EFEMILCB
    LEFT JOIN [DB_RHCB].[SchRH].[EfeCbOpm] Opm ON Opm.PesIdf = EFEMILCB.PesIdf
    LEFT JOIN [DB_MUNICIPIO_OPM].[SchUOR].[UOROPM] UorOpm ON Opm.OpmCod = UorOpm.OpmCod AND UorOpm.UorOpmAtvIdc = 1
    WHERE Opm.UniAlcTipCod = 2 
    	AND EFEMILCB.PesIdf = 1818
    		--EFEMILCB.PesIdf = 106720

/* --------------------------------------------------------------------------- */
    	select * from [DB_MUNICIPIO_OPM].[SchUOR].[UOR]
