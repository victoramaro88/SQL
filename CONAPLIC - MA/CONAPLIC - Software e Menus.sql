SELECT SftCod, SftTipCod, SftClsCod, OpmCbIdf, SftNom, SftDes, SftAtvIdc, SftSgl, SftCpfIclNum, SftIclDat, CnmAreCod
FROM DB_CONAPLIC.SchCTRAPL.SFT
WHERE SftNom LIKE '%Vulto%'
--WHERE SftCod = 118
;


SELECT MnuSftCod, SftCod, SftTipCod, SftClsCod, MnuSftNom, MnuSftEnd, MnuSftAtvIdc
FROM DB_CONAPLIC.SchCTRAPL.MNUSFT
--WHERE MnuSftNom LIKE 'Menu%'
WHERE SftCod = 121
;

SELECT MnuSftFndCod, MnuSftCod, MnuSftFndPaiCod, MnuSftPaiCod, MnuSftFndNom, MnuSftFndEnd, MnuSftFndAtvIdc
FROM DB_CONAPLIC.SchCTRAPL.MNUSFTFND
WHERE MnuSftCod IN (192, 193, 194)
--WHERE MnuSftFndNom LIKE 'Procedimento%'
;

SELECT AbeCtrCod, AbeCtrNom
FROM DB_CONAPLIC.SchCTRAPL.ABECTR;

SELECT CnmAreCod, CnmArePaiCod, CnmAreNom, CnmAreOrdNum
FROM DB_CORP_CCB.SchCRPCCB.CNMARE;