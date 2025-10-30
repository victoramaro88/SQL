/*
PERFIS:
1	Administrador
2	Responsável Loja
3	Visitante
4	Membro
5	Filiado	
*/


/*SELECT 
	*
FROM DB_Visitatus.dbo.Presenca PRE WITH(NOLOCK)
JOIN DB_Visitatus.dbo.Usuario USR WITH(NOLOCK) ON USR.usuCodi = PRE.usuCodi 
JOIN DB_Visitatus.dbo.Sessao SES WITH(NOLOCK) ON PRE.sesCodi = SES.sesCodi
LEFT JOIN DB_Visitatus.dbo.PerfilUsuario PERF WITH(NOLOCK) ON USR.usuCodi = PERF.usuCodi
WHERE PRE.sesCodi = 26-- AND PRE.lojCodi = 1
	AND PERF.perCodi IN (4, 5)
ORDER BY USR.usuNome
;*/

SELECT 	* FROM DB_Visitatus.dbo.Presenca;
SELECT 	* FROM DB_Visitatus.dbo.Sessao;
SELECT 	* FROM DB_Visitatus.dbo.Perfil;
SELECT 	* FROM DB_Visitatus.dbo.Usuario WHERE usuCodi = 38;
SELECT 	* FROM DB_Visitatus.dbo.Loja WHERE lojCodi = 139;

SELECT * FROM DB_Visitatus.dbo.PerfilUsuario PERF
JOIN DB_Visitatus.dbo.Usuario USR ON PERF.usuCodi = USR.usuCodi
WHERE lojCodi = 128
;

SELECT * FROM DB_Visitatus.dbo.Presenca PRE
WHERE PRE.lojCodi = 139
;

--> PESQUISA DE USUÁRIOS COM PRESENÇAS CONFIRMADAS.
SELECT
	USR.usuCodi, USR.usuNome, USR.usuNCIM, PERF.perCodi, LOJ2.lojNome, LOJ2.lojNumL, POT.potSigl
FROM DB_Visitatus.dbo.Loja LOJ WITH(NOLOCK)
JOIN DB_Visitatus.dbo.Sessao SES WITH(NOLOCK) ON LOJ.lojCodi = SES.lojCodi 
JOIN DB_Visitatus.dbo.Presenca PRE WITH(NOLOCK) ON SES.sesCodi = PRE.sesCodi
JOIN DB_Visitatus.dbo.Usuario USR WITH(NOLOCK) ON PRE.usuCodi = USR.usuCodi
LEFT JOIN DB_Visitatus.dbo.PerfilUsuario PERF WITH(NOLOCK) ON PRE.usuCodi = PERF.usuCodi AND PERF.lojCodi = LOJ.lojCodi AND PERF.perCodi IN (4, 5)
JOIN DB_Visitatus.dbo.Loja LOJ2 WITH(NOLOCK) ON PRE.lojCodi = LOJ2.lojCodi
JOIN DB_Visitatus.dbo.Potencia POT WITH(NOLOCK) ON LOJ2.potCodi = POT.potCodi 
WHERE SES.sesCodi = 26
ORDER BY PERF.perCodi, USR.usuNome




