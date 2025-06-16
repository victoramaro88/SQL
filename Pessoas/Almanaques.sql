--> VERIFICAÇÃO DE CARGAS
SELECT
(SELECT TOP(1) DataReg AS Oficiais FROM DB_EFETIVO.SchEfetivo.AlmanaqueOficial) AS Oficiais,
(SELECT TOP(1) DataReg AS SubtenSgt FROM DB_EFETIVO.SchEfetivo.AlmanaqueSubSgt) AS SubtenSgt,
(SELECT TOP(1) DataReg AS CbSd FROM DB_EFETIVO.SchEfetivo.AlmanaqueCbSd) AS CbSd


SELECT
	*
	--id, csp, numero, digitoRe, cao, re, cas, quadro, postoGraduacao, numeral, idQuadro, ordemPosto, dataUltimaPromo, AlmanaqueDtReg
FROM DB_EFETIVO.SchEfetivo.ALMANAQUE
WHERE RE = 141499;

SELECT AlmanaqueOficialIdf, Quadro, QDRCOD, Numero, RE, DigitoRe, Cogitado, QaAnt, QaMer, Csp, Cao, DataCel, PrincipioCel, DataTenCel, PrincipioTenCel, DataMaj, PrincipioMaj, DataCap, PrincipioCap, Data1Ten, Principio1Ten, Data2Ten, Principio2Ten, DataAsp, PrincipioAsp, DataReg
FROM DB_EFETIVO.SchEfetivo.AlmanaqueOficial;

SELECT AlmanaqueSubSgtIdf, Quadro, QDRCOD, Numero, RE, DigitoRe, Cogitado, QaAnt, QaMer, Cas, DataSub, PrincipioSub, Data1Sgt, Principio1Sgt, Data2Sgt, Principio2Sgt, Data3Sgt, Principio3Sgt, DataCb, PrincipioCb, DataSd, PrincipioSd, DataReg
FROM DB_EFETIVO.SchEfetivo.AlmanaqueSubSgt;

SELECT AlmanaqueCbSdIdf, Quadro, QDRCOD, Numero, RE, DigitoRe, Cogitado, QaAnt, QaMer, DataCb, PrincipioCb, DataSd, PrincipioSd, DataReg
FROM DB_EFETIVO.SchEfetivo.AlmanaqueCbSd;


