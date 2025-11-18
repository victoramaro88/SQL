SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus.dbo.Usuario
WHERE usuNome LIKE '%KALI%';


SELECT peUCodi, peUStat, perCodi, usuCodi, lojCodi
FROM DB_Visitatus.dbo.PerfilUsuario
WHERE usuCodi = 358;






SELECT lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi
FROM DB_Visitatus.dbo.Loja
--WHERE lojNome LIKE '%CARLOS%'
where lojNumL = '3239'
--ORDER BY lojNome;

SELECT peUCodi, peUStat, perCodi, usuCodi, lojCodi
FROM DB_Visitatus.dbo.PerfilUsuario
WHERE lojCodi = 129; --183


SELECT usuCodi, sesCodi, preAtiv, lojCodi, preEmai
FROM DB_Visitatus.dbo.Presenca
WHERE usuCodi = 358;



SELECT potCodi, potNome, potLogo, potRegu, potStat, potSigl
FROM DB_Visitatus.dbo.Potencia;