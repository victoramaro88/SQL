SELECT lojCodi, lojNome, lojNumL, lojLogo, lojLogr, lojNume, lojBair, lojStat, cidCodi, potCodi, ritCodi
FROM DB_Visitatus.dbo.Loja
--WHERE lojNome LIKE '%%'
;

SELECT usuCodi, usuNome, usuNCIM, usuNasc, usuEmai, usuNCel, usuStat
FROM DB_Visitatus.dbo.Usuario;

SELECT 
	Usr.usuNome AS Nome, Usr.usuNCel AS Celular, Usr.usuNCIM AS CIM, Loj.lojNome AS Loja, Loj.lojNumL AS Numero
FROM DB_Visitatus.dbo.Presenca Pre WITH(NOLOCK)
JOIN DB_Visitatus.dbo.Usuario Usr WITH(NOLOCK) ON Usr.usuCodi = Pre.usuCodi
JOIN DB_Visitatus.dbo.Loja Loj WITH(NOLOCK) ON Loj.lojCodi = Pre.lojCodi
where Loj.lojcodi = 61;