SELECT
	--*
	--
	USR.usuCodi, USR.uniCodi, USR.posGraCodi, USR.usuNuRE, USR.usuDiRE, USR.usuNome, USR.usuNQRA,
	USR.usuEmai, USR.usuIdc,
	PERF.prfAcsCodi, PERF.prfAcsDesc, PERF.prfAcsIdc,PERF.prfAcsCodi
	--
FROM USUARIO USR
JOIN UsuarioPerfil UP ON UP.usuCodi = USR.usuCodi 
JOIN PerfilAcesso PERF ON PERF.prfAcsCodi = UP.prfAcsCodi 
JOIN Permissao PERM ON PERM.prfAcsCodi = PERF.prfAcsCodi 
JOIN RecursoAcesso REC ON REC.recAcsCodi = PERM.recAcsCodi


---------------------------------------------------------------------------------------------------


SELECT
	USR.usuCodi, USR.uniCodi, USR.posGraCodi, USR.usuNuRE, USR.usuDiRE, USR.usuNome, USR.usuNQRA,
	USR.usuEmai, USR.usuIdc,
	PERF.prfAcsCodi, PERF.prfAcsDesc, PERF.prfAcsIdc,
	UNID.uniSigl,
	POSGRAD.posGraSigl
FROM GAVETA_DB.dbo.USUARIO USR WITH(NOLOCK)
JOIN GAVETA_DB.dbo.UsuarioPerfil UP WITH(NOLOCK) ON UP.usuCodi = USR.usuCodi 
JOIN GAVETA_DB.dbo.PerfilAcesso PERF WITH(NOLOCK) ON PERF.prfAcsCodi = UP.prfAcsCodi
JOIN GAVETA_DB.dbo.UNIDADE UNID WITH(NOLOCK) ON UNID.uniCodi = USR.uniCodi
JOIN GAVETA_DB.dbo.PostoGraduacao POSGRAD WITH(NOLOCK) ON POSGRAD.posGraCodi = USR.posGraCodi
JOIN GAVETA_DB.dbo.LoginUsuario LOGIN WITH(NOLOCK) ON LOGIN.usuCodi = USR.usuCodi
WHERE USR.usuNuRE = 141499 AND LOGIN.logUsuPass = '123456'


