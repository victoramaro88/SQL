----------------------------------------------------------
-- SELECT PARA VERIFICAR AS OCORRENCIAS NOS ULTIMOS 5 MINUTOS
--SERVIDOR: SRVWPRDDB01
-- Banco: DB_SIOPMCRP_TMP
-- Schema: SchOPR
-- Tabela: OCR
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT TOP 1
	OcrNum, CadCod, OcrGreDat, OcrNatIni, OcrMunCod
FROM DB_SIOPMCRP_TMP.SchOPR.OCR --SIOPM
WHERE 
DATEDIFF (MINUTE, OcrGreDat,GETDATE()) < 10
ORDER BY OcrGreDat DESC


-------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT PARA VERIFICAR AS OCORRENCIAS NOS ULTIMOS 30 MINUTOS NO BANCO DO SDO
--SERVIDOR: SRVBD01
-- Banco: DB_SDO
-- Schema: SchOPR
-- Tabela: OCR
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT TOP 1 
	OcrNum, CadCod, OcrGreDat, OcrNatIni, OcrMunCod
FROM DB_SDO.SchOPR.OCR --OCORRENCIA DIÁRIA
WHERE 
DATEDIFF (MINUTE, OcrGreDat,GETDATE()) < 60
ORDER BY OcrGreDat DESC


-------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT PARA VERIFICAR AS OCORRENCIAS NOS ULTIMOS 30 MINUTOS NO BANCO DO SDO - PARA ENCERRAMENTO
--SERVIDOR: SRVBD01
-- Banco: DB_SDO
-- Schema: dbo
-- Tabela: OCORRENCIA
-------------------------------------------------------------------------------------------------------------------------------------------
SELECT TOP 1 
	OcrNum, CadCod, OcrGreDat, NATCOD, MUNICIPIOIDINICIAL 
FROM DB_SDO.dbo.OCORRENCIA --SDO
WHERE 
DATEDIFF (MINUTE, OcrGreDat,GETDATE()) < 60
ORDER BY OcrGreDat DESC



