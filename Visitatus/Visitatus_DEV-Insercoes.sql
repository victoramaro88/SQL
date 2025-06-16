-- INSERÇÕES DE PERFIS DOS USUÁRIOS:

SELECT peUCodi, peUStat, perCodi, usuCodi, lojCodi
FROM DB_Visitatus_DEV.dbo.PerfilUsuario;

--> INSERÇÃO DOS PERFIS
/*
INSERT INTO DB_Visitatus_DEV.dbo.PerfilUsuario
(peUCodi, peUStat, perCodi, usuCodi, lojCodi)
VALUES
(4, 1, 4, 2, 1),
(5, 1, 4, 3, 1)
;
*/

--> USUÁRIOS COM SEUS PERFIS
SELECT 
	PU.peUCodi,
	U.usuCodi, U.usuNome,
	L.lojCodi, L.lojNome,
	P.perCodi, P.perNome 
FROM DB_Visitatus_DEV.dbo.PerfilUsuario PU
JOIN DB_Visitatus_DEV.dbo.Usuario U ON PU.usuCodi = U.usuCodi
JOIN DB_Visitatus_DEV.dbo.Perfil P ON P.perCodi = PU.perCodi 
JOIN DB_Visitatus_DEV.dbo.Loja L ON L.lojCodi = PU.lojCodi 
ORDER BY L.lojCodi, U.usuNome, P.perNome
;

--INSERÇÃO DE VALORES DOS PERFIS
INSERT INTO DB_Visitatus_DEV.dbo.PermissaoPerfil
(perCodi, pemCodi, papAtvo, pepStat)
VALUES
--RESPONSÁVEL LOJA
(2, 1, 0, 1), 
(2, 2, 0, 1), 
(2, 3, 0, 1), 
(2, 4, 0, 1),
--VISITANTE
(3, 1, 0, 1), 
(3, 2, 0, 1), 
(3, 3, 0, 1), 
(3, 4, 0, 1),
--MEMBRO
(4, 1, 0, 1), 
(4, 2, 0, 1), 
(4, 3, 0, 1), 
(4, 4, 0, 1),
--FILIADO
(5, 1, 0, 1), 
(5, 2, 0, 1), 
(5, 3, 0, 1), 
(5, 4, 0, 1),
--ADMINISTRADOR
(337, 1, 1, 1), 
(337, 2, 1, 1), 
(337, 3, 1, 1), 
(337, 4, 1, 1)
;

SELECT * FROM DB_Visitatus_DEV.dbo.PermissaoPerfil