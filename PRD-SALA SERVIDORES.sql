UPDATE DB_SALA_SERVIDORES.dbo.PESNTC
SET PesNtcAtvIdc = 0
WHERE PesNtcCod NOT IN (1, 5);

SELECT
	--*
	PesNtcCod, PesNtcCpfNum, PesNtcDes, PesNtcAphCelIdf, PesNtcChvFirBrIdf, PesNtcAtvIdc
FROM DB_SALA_SERVIDORES.dbo.PESNTC WITH(NOLOCK)
ORDER BY PesNtcAtvIdc DESC ;

SELECT TOP(20) TprHisIdf, TprHisAtu, TprHisIclDat, TprHisUmi
FROM DB_SALA_SERVIDORES.dbo.TPRHIS WITH(NOLOCK)
ORDER BY TprHisIclDat DESC;

SELECT CtrHfnIdf, CtrPlcIdf, CtrHfnHorLig, CtrHfnHorDlg, CtrHfnAtvIdc
FROM DB_SALA_SERVIDORES.dbo.CTRHFN WITH(NOLOCK);

SELECT CtrPlcIdf, CtrPlcPno, CtrPlcCmnTip, CtrPlcDes, CtrPlcApoStt, CtrPlcStt
FROM DB_SALA_SERVIDORES.dbo.CTRPLC WITH(NOLOCK);

SELECT ConfGeralIdf, ConfGeralDesc, ConfGeralValor, ConfGeralAtv
FROM DB_SALA_SERVIDORES.dbo.ConfGeral WITH(NOLOCK);

SELECT CtrPlcIdf, ConfGeralAtv
FROM DB_SALA_SERVIDORES.dbo.CrtManAr WITH(NOLOCK);

SELECT TprAtuIdf, TprAtu, TprAtuAle, TprAtuIclDat, TprAtuUmi, TprAtuNtcUltDat
FROM DB_SALA_SERVIDORES.dbo.TPRATU WITH(NOLOCK);

SELECT 
	--TOP(1) 
	LogFncArCdcIdf, LogFncArCdcDat, LogFncArCdcObs	
FROM DB_SALA_SERVIDORES.dbo.LOGFNCARCDC
ORDER BY LogFncArCdcDat DESC
;

SELECT CtrHfnIdf, CtrPlcIdf, CtrHfnHorLig, CtrHfnHorDlg, CtrHfnAtvIdc
FROM DB_SALA_SERVIDORES.dbo.CTRHFN
--WHERE CtrHfnAtvIdc = 1
;


------------------------------------------------------------------------------------------------------------------------------------

SELECT
	*
FROM DB_SALA_SERVIDORES.dbo.TPRATU WITH(NOLOCK)
;

SELECT 
	*
FROM DB_SALA_SERVIDORES.dbo.ConfGeral WITH(NOLOCK)
;

UPDATE DB_SALA_SERVIDORES.dbo.TPRATU
SET TprAtuAle = 25
WHERE TprAtuIdf = 1;

UPDATE DB_SALA_SERVIDORES.dbo.ConfGeral
SET ConfGeralValor = 22
WHERE ConfGeralIdf = 2; --TEMPERATURA MÁXIMA

UPDATE DB_SALA_SERVIDORES.dbo.ConfGeral
SET ConfGeralValor = 18
WHERE ConfGeralIdf = 3; --TEMPERATURA MÍNIMA



SELECT 
	--TOP(1) 
	LogFncArCdcIdf, LogFncArCdcDat, LogFncArCdcObs	
FROM DB_SALA_SERVIDORES.dbo.LOGFNCARCDC
--WHERE LogFncArCdcObs LIKE '%TODOS LIGADOS%'
--WHERE LogFncArCdcObs LIKE '%MODO NORMAL%'
--WHERE LogFncArCdcObs LIKE '%infoPessoa%' --> MUDANÇA MODO MANUAL / AUTOMÁTICO
--WHERE LogFncArCdcObs LIKE '%MODO NORMAL%' OR LogFncArCdcObs LIKE '%TODOS LIGADOS%' --> MODO NORMAL / TODOS LIGADOS
--WHERE LogFncArCdcObs LIKE '%Referência de Temperatura%' --> MODO NORMAL / TODOS LIGADOS
--WHERE LogFncArCdcObs LIKE '%tprAtuAle%' --> CONFIGURAÇÕES SALVAS
--WHERE LogFncArCdcObs LIKE '%cadastro":true%' --> CONFIGURAÇÕES SALVAS
--WHERE LogFncArCdcObs LIKE '%queda%' --> QUEDA ENERGIA
ORDER BY LogFncArCdcDat DESC
;

 

SELECT
	PesNtcCod, PesNtcCpfNum, PesNtcDes, PesNtcAphCelIdf, PesNtcChvFirBrIdf, PesNtcAtvIdc
FROM DB_SALA_SERVIDORES.dbo.PESNTC PESNTC WITH(NOLOCK)
--WHERE PesNtcCod = 2
ORDER BY PESNTC.PesNtcAtvIdc DESC;



SELECT PesNtcCod, PesNtcCpfNum, PesNtcDes, PesNtcAphCelIdf, PesNtcChvFirBrIdf, PesNtcAtvIdc
FROM DB_SALA_SERVIDORES.dbo.PESNTC;


/*
USE DB_SALA_SERVIDORES
GRANT DELETE ON DB_SALA_SERVIDORES.dbo.PESNTC TO [WS$SLASRV];
*/


SELECT 
	* 
FROM DB_SALA_SERVIDORES.dbo.ConfGeral
WHERE ConfGeralIdf IN (5, 6, 7, 9, 10, 11, 12, 13)


SELECT ConfGeralIdf, ConfGeralDesc, ConfGeralValor, ConfGeralAtv
FROM DB_SALA_SERVIDORES.dbo.ConfGeral;










