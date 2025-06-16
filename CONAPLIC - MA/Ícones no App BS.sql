SELECT SftCod, SftTipCod, SftClsCod, OpmCbIdf, SftNom, SftDes, SftAtvIdc, SftSgl, SftCpfIclNum, SftIclDat, CnmAreCod
FROM DB_CONAPLIC.SchCTRAPL.SFT
WHERE SftNom LIKE '%Escol%'
ORDER BY SftCod DESC;

SELECT VrsSftIdf, SftCod, SftTipCod, SftClsCod, VrsSftNum, VrsSftDat, VrsSftAtvIdc, VrsSftDes, VrsSftTagNom
FROM DB_CONAPLIC.SchCTRAPL.VRSSFT
WHERE SftCod = 118;

SELECT AbeCtrVrsSftIdf, VrsSftIdf, AbeCtrCod, AbeCtrVrsSftUrlDes, AbeCtrVrsSftAtvIdc, AbeCtrVrsSftIcnArqNom
FROM DB_CONAPLIC.SchCTRAPL.ABECTRVRSSFT
WHERE VrsSftIdf = 2141;
