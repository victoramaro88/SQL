/*
INSERT INTO [SchNume].[Numerador]
           ([numCodi]
           ,[numDthr]
           ,[numAssu]
           ,[numReme]
           ,[numDest]
           ,[numNumSEI]
           ,[numAtv]
           ,[pesIdf]
           ,[tipNumCodi]
           ,[natNumCodi])
     VALUES
           (1
           ,GETDATE()
           ,'Teste Amaro'
           ,'B/4'
           ,'Cmt 13º GB'
           ,NULL
           ,1
           ,12456
           ,3
           ,1);


INSERT INTO [SchNume].[VlrDadosAdic]
           ([vlrDadCodi],[vlrDadTxt],[vlrDadNum],[vlrDadAtv],[dadCodi],[numCodi])
     VALUES
           (1,NULL,450.33,1,1,1),
           (2,NULL,133.55,1,2,1),
           (3,'Texto inserido para teste',NULL,1,2,1)
*/


SELECT * FROM [SchNume].[TipDadoAdic] WITH(NOLOCK)
SELECT * FROM [SchNume].[NatNume] WITH(NOLOCK)
SELECT * FROM [SchNume].[TipoNume] WITH(NOLOCK)
SELECT * FROM [SchNume].[DadosAdic] WITH(NOLOCK)
SELECT * FROM [SchNume].[Numerador] WITH(NOLOCK)
SELECT * FROM [SchNume].[VlrDadosAdic] WITH(NOLOCK)



SELECT 
	--* 
	Nume.numCodi, Nume.numDthr, Nume.numAssu, Nume.numReme, Nume.numDest,
	Nume.numNumSEI, Nume.numAtv, Nume.tipNumCodi, TipNum.tipNumDesc,
	Dad.dadDescr, VlrAdic.vlrDadNum, VlrAdic.vlrDadTxt, Dad.tipdadCodi, 
	TipDad.tipdadDescr
FROM [SchNume].[Numerador] Nume WITH(NOLOCK)
JOIN [SchNume].[TipoNume] TipNum WITH(NOLOCK) ON TipNum.tipNumCodi = Nume.tipNumCodi
LEFT JOIN [SchNume].[VlrDadosAdic] VlrAdic WITH(NOLOCK) ON VlrAdic.numCodi = Nume.numCodi
LEFT JOIN [SchNume].[DadosAdic] Dad WITH(NOLOCK) ON Dad.dadCodi = VlrAdic.dadCodi
LEFT JOIN [SchNume].[TipDadoAdic] TipDad WITH(NOLOCK) ON TipDad.tipdadCodi = Dad.tipdadCodi




SELECT natNumCodi,natNumDesc,natNumAtv
  FROM DB_GESTAO_ADM.SchNume.NatNume




