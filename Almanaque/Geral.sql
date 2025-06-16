SELECT 
    (SELECT TOP 1 DataReg FROM DB_EFETIVO.SchEfetivo.AlmanaqueOficial) AS Oficiais,
    (SELECT TOP 1 DataReg FROM DB_EFETIVO.SchEfetivo.AlmanaqueSubSgt) AS SubtenSgt,
    (SELECT TOP 1 DataReg FROM DB_EFETIVO.SchEfetivo.AlmanaqueCbSd) AS CbSd




SELECT *
FROM DB_EFETIVO.SchEfetivo.AlmanaqueOficial;

SELECT *
FROM DB_EFETIVO.SchEfetivo.AlmanaqueSubSgt --where re=141499;

SELECT *
FROM DB_EFETIVO.SchEfetivo.AlmanaqueCbSd;





--Truncates resetando os Id
/*
TRUNCATE TABLE DB_EFETIVO.SchEfetivo.AlmanaqueOficial
GO
DBCC CHECKIDENT ('DB_EFETIVO.SchEfetivo.AlmanaqueOficial', RESEED, 1);
GO
TRUNCATE TABLE DB_EFETIVO.SchEfetivo.AlmanaqueSubSgt
GO
DBCC CHECKIDENT ('DB_EFETIVO.SchEfetivo.AlmanaqueSubSgt', RESEED, 1); 
GO
TRUNCATE TABLE DB_EFETIVO.SchEfetivo.AlmanaqueCbSd
GO
DBCC CHECKIDENT ('DB_EFETIVO.SchEfetivo.AlmanaqueCbSd', RESEED, 1); 
GO
*/

/*
INSERT INTO DB_EFETIVO.SchEfetivo.AlmanaqueOficial
(
	Quadro, QDRCOD, Numero, RE, DigitoRe, Cogitado, QaAnt, QaMer
	, Csp, Cao, DataCel, PrincipioCel, DataTenCel, PrincipioTenCel, DataMaj, PrincipioMaj
	, DataCap, PrincipioCap, Data1Ten, Principio1Ten, Data2Ten, Principio2Ten, DataAsp, PrincipioAsp
)
VALUES(
 ''
, 0
, 0
, 0
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
, ''
);
*/