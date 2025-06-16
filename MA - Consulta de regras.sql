--REGRAS MA:
SELECT SftCod, SftTipCod, SftClsCod, OpmCbIdf, SftNom, SftDes, SftAtvIdc, SftSgl, SftCpfIclNum, SftIclDat, CnmAreCod
FROM DB_CONAPLIC.SchCTRAPL.SFT
--WHERE SftNom LIKE '%SDO%';
WHERE SftCod = 91

SELECT MnuSftCod, SftCod, SftTipCod, SftClsCod, MnuSftNom, MnuSftEnd, MnuSftAtvIdc
FROM DB_CONAPLIC.SchCTRAPL.MNUSFT
--WHERE SftCod = 67;
WHERE MnuSftCod = 146

SELECT GrpAcsCod, MnuSftFndCod, MnuSftCod, GrpAcsFndAtvIdc
FROM DB_MA.SchMA.GRPACSFND
--WHERE MnuSftCod = 130;
WHERE GrpAcsCod = 130

SELECT GrpAcsCod, GrpAcsNom, GrpAcsAtvIdc, GrpAcsSlgNom
FROM DB_MA.SchMA.GRPACS
WHERE GrpAcsCod = 130;

SELECT GrpAcsRgaCod, GrpAcsCod, GrpAcsRgaNom, GrpAcsRgaAtvIdc
FROM DB_MA.SchMA.GRPACSRGA
WHERE GrpAcsRgaCod = 129;

SELECT GrpAcsRgaCod, UorCod, GrpAcsRgaUorAtvIdc
FROM DB_MA.SchMA.GRPACSRGAUOR
WHERE GrpAcsRgaCod = 132;