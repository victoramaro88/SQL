/*
ALTER TABLE DB_Visitatus_DEV.dbo.Sessao
ADD
    sesAgap bit NOT NULL DEFAULT 0,
    sesVlAg decimal(18,2) NULL;
*/

/*
ALTER TABLE DB_Visitatus_DEV.dbo.Presenca
ADD
    preAgap bit NOT NULL DEFAULT 0;
*/

SELECT sesCodi, sesDesc, sesDtHr, sesLibe, sesStat, lojCodi, graCodi, tiSCodi, sesNume, sesNome, sesAgap, sesVlAg
FROM DB_Visitatus_DEV.dbo.Sessao
WHERE sesNume = 282
;

SELECT * FROM DB_Visitatus_DEV.dbo.Presenca
--where usuCodi = 1 and sesCodi = 2
where sesCodi = 2 
;




SELECT * FROM DB_Visitatus_DEV.dbo.Loja;













