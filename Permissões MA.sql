-- REGRAS MA
SELECT SftCod, SftTipCod, SftClsCod, OpmCbIdf, SftNom, SftDes, SftAtvIdc, SftSgl, SftCpfIclNum, SftIclDat, CnmAreCod
FROM DB_CONAPLIC.SchCTRAPL.SFT
WHERE SftCod = 64
order by SftCod desc

SELECT MnuSftCod, SftCod, SftTipCod, SftClsCod, MnuSftNom, MnuSftEnd, MnuSftAtvIdc
FROM DB_CONAPLIC.SchCTRAPL.MNUSFT
WHERE SftCod = 64;

SELECT GrpAcsCod, MnuSftFndCod, MnuSftCod, GrpAcsFndAtvIdc
FROM DB_MA.SchMA.GRPACSFND
WHERE MnuSftCod IN (125, 129, 130, 131, 134, 136)

SELECT GrpAcsCod, GrpAcsNom, GrpAcsAtvIdc, GrpAcsSlgNom
FROM DB_MA.SchMA.GRPACS
WHERE GrpAcsCod IN (80);

SELECT GrpAcsRgaCod, GrpAcsCod, GrpAcsRgaNom, GrpAcsRgaAtvIdc
FROM DB_MA.SchMA.GRPACSRGA
WHERE GrpAcsCod IN (80);

--------

SELECT GrpAcsRgaCod, PosCod, GrpAcsRgaPosAtvIdc
FROM DB_MA.SchMA.GRPACSRGAPOS
WHERE GrpAcsRgaCod IN (80);

SELECT GrpAcsRgaCod, OpmCbIdf, GrpAcsRgaOpmAtvIdc
FROM DB_MA.SchMA.GRPACSRGAOPM
WHERE GrpAcsRgaCod IN (80);

SELECT GrpAcsRgaCod, UorCod, GrpAcsRgaUorAtvIdc
FROM DB_MA.SchMA.GRPACSRGAUOR
WHERE GrpAcsRgaCod IN (80);

SELECT GrpAcsRgaCod, FunCod, GrpAcsRgaFunAtvIdc
FROM DB_MA.SchMA.GRPACSRGAFUN
WHERE GrpAcsRgaCod IN (80);

SELECT UorCod, GrpAcsRgaCod, PesIdf, GrpAcsRgaAvsPesUorAtvIdc
FROM DB_MA.SchMA.GRPACSRGAAVSPESUOR
WHERE GrpAcsRgaCod IN (80);

SELECT OpmCbIdf, GrpAcsRgaCod, PesIdf, GrpAcsRgaAvsPesOpmAtvIdc
FROM DB_MA.SchMA.GRPACSRGAAVSPESOPM
WHERE GrpAcsRgaCod IN (80);

SELECT GrpAcsRgaCod, AtvPrfCod, GrpAcsRgaAtvPrfAtvIdc
FROM DB_MA.SchMA.GRPACSRGAATVPRF
WHERE GrpAcsRgaCod IN (80);

SELECT AtvTipCod, GrpAcsRgaCod, GrpAcsRgaAtvTipAtvIdc
FROM DB_MA.SchMA.GRPACSRGAATVTIP
WHERE GrpAcsRgaCod IN (80);

SELECT GrpAcsRgaCod, PesIdf, GrpAcsRgaAvsPesAtvIdc, GrpAcsRgaAvsPesIniVigDat, GrpAcsRgaAvsPesFimVigDat
FROM DB_MA.SchMA.GRPACSRGAAVSPES
WHERE GrpAcsRgaCod IN (80);

SELECT OpmCbIdf, GrpAcsRgaCod, PesIdf, GrpAcsRgaAvsPesOpmAtvIdc
FROM DB_MA.SchMA.GRPACSRGAAVSPESOPM
WHERE GrpAcsRgaCod IN (80);

SELECT UorCod, GrpAcsRgaCod, PesIdf, GrpAcsRgaAvsPesUorAtvIdc
FROM DB_MA.SchMA.GRPACSRGAAVSPESUOR
WHERE GrpAcsRgaCod IN (80);







