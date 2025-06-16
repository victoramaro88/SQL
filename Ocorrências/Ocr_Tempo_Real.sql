--> OCORRÊNCIAS DO CBM
SELECT * FROM DB_CARGA_SIOPM.SchNOC.VW_OCR
--WHERE GB IN ('01.GB','02.GB','03.GB','04.GB','05.GB','08.GB','17.GB','18.GB')--('05.GB')
--WHERE GB IN ('13.GB')
	--AND SITUACAO = 'PENDENTE'
	--AND SITUACAO = 'ATENDIMENTO'
	--and TALAO = 7861 
	--and ENDERECO like '%Souza%' 
ORDER BY SITUACAO DESC, DATA_GERACAO DESC
;


SELECT * FROM DB_CARGA_SIOPM.SchNOC.VW_OCR;


SELECT CHECKSUM_AGG(BINARY_CHECKSUM(*)) FROM DB_CARGA_SIOPM.SchNOC.VW_OCR




SELECT
	--COUNT(*)
	* 
	--OcrDat, OcrNum, CadCod, AleCabNum, AleSitCod, AlePriOri, AlePriAtu, AleRtoFlg, AleLigRtoQtd, AlePpgFlg, AleEndOcr, AleNatIniCod, AleSstCod, AleGreDat, AleSrvCod, AleOpmDes, AleOpmCod, AlePriCod, AleUtmx, AleUtmy, AleCabAtdInd, AleCplNatCod, AleDtlCplNatDes, AleNatDes, AleDtlCplNatCod, AleCplNatDes, AleCriInd, AleAgdDat, AleAgdInd, AleRagInd, AleFimTsoInd, ALEIDFAGPGEOSST, AleOcrDphInd, AleOcrGeog, AleLat, AleLon, AlePoiCod
FROM DB_CARGA_SIOPM.SchTMP.ALE
WHERE LEFT(AleOpmCod, 3) = 701 --701: UNIDADES DO CBM
	AND OcrNum = 8561 
	--AND AleSitCod = 'P' -- PENDENTES
	--AND AleSitCod = 'A' -- EM ATENDIMENTO
	--AND AleSitCod = 'X' -- PARA ENCERRAMENTO 
;
--AlePriCod
	--PRIORIDADE 2: URGENTE
	--PRIORIDADE 1: NORMAL

