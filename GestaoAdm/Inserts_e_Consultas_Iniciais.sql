/*
INSERT INTO DB_GESTAO_ADM.SchNume.[Numerador]
           ([numCodi]
		   ,[numIncr]
           ,[numDthr]
           ,[numAssu]
           ,[numReme]
           ,[numDest]
           ,[numNumSEI]
           ,[numAtv]
           ,[pesIdf]
           ,[tipNumCodi]
           ,[natNumCodi]
		   ,[UorCod])
     VALUES
           (1
		   ,1
           ,GETDATE()
           ,'Teste Amaro'
           ,'B/4'
           ,'Cmt 13º GB'
           ,NULL
           ,1
           ,12456
           ,3
           ,1
		   ,607),
		   ------------------------------------------------------------
		   (2
		   ,1
           ,GETDATE()
           ,'Teste Amaro 2'
           ,'B/4'
           ,'Cmt 13º GB'
           ,'123456ADASD/44D6AS86AD7'
           ,1
           ,7322
           ,1
           ,1
		   ,607);


INSERT INTO DB_GESTAO_ADM.SchNume.Referencia
           ([refCodi],[refDesc],[refAtv],[numCodi])
     VALUES
           (1,'Referência Teste 1', 1, 1)
GO
INSERT INTO DB_GESTAO_ADM.SchNume.Anexo
           ([aneCodi],[aneDesc],[aneAtv],[numCodi])
     VALUES
           (1, 'Anexo Teste 1', 1, 1),
		   (2, 'Anexo Teste 2', 1, 1),
		   (3, 'Anexo Teste 3', 1, 2)
GO
INSERT INTO DB_GESTAO_ADM.SchNume.Interessado
           ([intCodi],[intNome],[intAtv],[numCodi],[pesIdf])
     VALUES
           (1, NULL, 1, 1, 7322),
           (2, 'Interessado Civil', 1, 1, NULL),
           (3, 'Interessado Civil Teste 2', 1, 2, NULL)


INSERT INTO DB_GESTAO_ADM.SchNume.VlrDadosAdic
           ([vlrDadCodi],[vlrDadTxt],[vlrDadNum],[vlrDadAtv],[dadCodi],[numCodi])
     VALUES
           (1,NULL,450.33,1,1,1),
           (2,NULL,133.55,1,2,1),
           (3,'Texto inserido para teste',NULL,1,3,1)

*/


SELECT * FROM DB_GESTAO_ADM.SchNume.TipDadoAdic WITH(NOLOCK);
SELECT * FROM DB_GESTAO_ADM.SchNume.NatNume WITH(NOLOCK);
SELECT * FROM DB_GESTAO_ADM.SchNume.TipoNume WITH(NOLOCK);
SELECT * FROM DB_GESTAO_ADM.SchNume.DadosAdic WITH(NOLOCK);
--
SELECT * FROM DB_GESTAO_ADM.SchNume.Numerador WITH(NOLOCK);
SELECT * FROM DB_GESTAO_ADM.SchNume.VlrDadosAdic WITH(NOLOCK);
SELECT * FROM DB_GESTAO_ADM.SchNume.Referencia WITH(NOLOCK);
SELECT * FROM DB_GESTAO_ADM.SchNume.Anexo WITH(NOLOCK);
SELECT * FROM DB_GESTAO_ADM.SchNume.Interessado WITH(NOLOCK);

--> LISTAR NUMERADORES DA UOR:
SELECT
	Num.numCodi, Num.numIncr, Num.numDthr, Num.numAssu, Num.numReme, Num.numDest, Num.numNumSEI, Num.numAtv, 
	Num.TipNumCodi, TipNum.tipNumDesc, Num.natNumCodi, NatNum.natNumDesc, Num.uorCod,
	(SELECT count(*) FROM DB_GESTAO_ADM.SchNume.Referencia WITH(NOLOCK) WHERE numCodi  = Num.numCodi ) AS QtdReferencias,
	(SELECT count(*) FROM DB_GESTAO_ADM.SchNume.Anexo WITH(NOLOCK) WHERE numCodi  = Num.numCodi ) AS QtdAnexos,
	(SELECT count(*) FROM DB_GESTAO_ADM.SchNume.Interessado WITH(NOLOCK) WHERE numCodi  = Num.numCodi ) AS QtdInteressados
FROM DB_GESTAO_ADM.SchNume.Numerador Num
JOIN DB_GESTAO_ADM.SchNume.TipoNume TipNum WITH(NOLOCK) ON Num.tipNumCodi = TipNum.tipNumCodi
JOIN DB_GESTAO_ADM.SchNume.NatNume NatNum  WITH(NOLOCK) ON Num.natNumCodi = NatNum.natNumCodi
WHERE uorCod = 607 AND Num.numAtv = 1 --AND Num.tipNumCodi = 3;






 --CONSULTA DE OCORRÊNCIAS DO SDO (PRECISA SER PRODUÇÃO)
  DECLARE @GB VARCHAR(10) = '13.GB'
  DECLARE @DATE DATE = '2025-08-14'
  --
  SELECT 
  	*
  	--OCRNUM, OCRDAT, ID, STATUSID, COMANDANTECPF, DATAFINALIZACAO, GB, SGB
  FROM DB_SDO.dbo.OCORRENCIA
  WHERE GB= @GB AND CAST(OCRDAT AS DATE) >= @DATE
  ORDER BY OCRDAT DESC
  
  



SELECT ISNULL(MAX(numIncr), 0) + 1 AS novoId
FROM DB_GESTAO_ADM.SchNume.Numerador WITH(NOLOCK)
WHERE tipNumCodi = 3 AND numAtv = 1;




-------------------------------------------------------------------------------------------
--> *** PARTE DE REGISTRO DE LOG's: (AINDA PRECISA SER IMPLEMENTADO)

SELECT LogCod, IP, Host, ModLogCod, UsrCod, SisLogReg, datHorReg
FROM DB_LOG.SchLog.Log;

SELECT ModLogCod, SisLogCod, ModLog
FROM DB_LOG.SchLog.ModLog;

SELECT SisLogCod, SisLog
FROM DB_LOG.SchLog.SisLog;





                                                

















