SELECT 
	*--Uor, UorOpm, UorOpmNome, UorNome
FROM DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ
where UorOpm = 700000631--700000611--
;


SELECT 
	--* 
	CatUor.CategoriaIdf, Cat.CategoriaDesc,
	CatUor.UorCod, Hrq.Uor, Hrq.UorOpm, Hrq.UorOpmNome, Hrq.UorNome
FROM DB_HELPDESK_CB.dbo.CategoriaUor CatUor
JOIN DB_HELPDESK_CB.dbo.Categoria Cat ON Cat.CategoriaIdf = CatUor.CategoriaIdf
JOIN DB_MUNICIPIO_OPM.SchUOR.VW_UOR_OPM_UOROPM_UORHRQ Hrq ON Hrq.Uor = CatUor.UorCod
WHERE Hrq.UorOpm = 700000631
;




