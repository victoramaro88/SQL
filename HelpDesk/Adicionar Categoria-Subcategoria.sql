SELECT CategoriaIdf, CategoriaDesc, TipCategoriaIdf, CategoriaAtv
FROM DB_HELPDESK_CB.dbo.Categoria;

SELECT SubCategoriaIdf, SubCategoriaDesc, SubCategoriaAtv
FROM DB_HELPDESK_CB.dbo.SubCategoria;

SELECT CategoriaIdf, SubCategoriaIdf
FROM DB_HELPDESK_CB.dbo.CategoriaSubCategoria;

