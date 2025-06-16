SELECT E.RE, E.POS_GRAD, E.NOME_GUERRA, E.SITUACAO, C.CursosDesc, EC.CursosBol BOLETIM, EC.CursosDtIni, EC.CursosDtTerm
FROM DB_EFETIVO.SchEfetivo.Efetivo E 
INNER JOIN DB_EFETIVO.SchEfetivo.EfetivoCursos EC ON E.RE = EC.Re 
INNER JOIN DB_EFETIVO.SchEfetivo.Cursos C ON EC.CursosIdf = C.CursosIdf
WHERE E.RE = 141499
ORDER BY E.RE