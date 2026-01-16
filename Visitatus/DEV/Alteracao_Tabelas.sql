SELECT * FROM DB_Visitatus_DEV.dbo.Sessao
order by sesCodi desc
;

/*
ALTER TABLE DB_Visitatus_DEV.dbo.Sessao
ADD
    sesAgap bit NOT NULL DEFAULT 0,
    sesVlAg decimal(18,2) NULL;
*/

SELECT * FROM DB_Visitatus_DEV.dbo.Presenca;

/*
ALTER TABLE DB_Visitatus_DEV.dbo.Presenca
ADD
    preAgap bit NOT NULL DEFAULT 0;
*/