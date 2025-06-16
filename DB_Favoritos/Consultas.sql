SELECT catCodi, catDesc, catPai, sttCodi
FROM DB_Favoritos.schFavoritos.Categoria;

SELECT sitCodi, sitDesc, sitLink, sitObse, sttCodi, catCodi
FROM DB_Favoritos.schFavoritos.Site;






DECLARE @CategoriaPai INT = 4;
--
WITH CategoriaRecursiva AS (
    -- Caso Base: Seleciona a categoria de referência (a categoria pai específica)
    SELECT 
        catCodi, 
        catDesc, 
        catPai, 
        0 AS Nivel
    FROM DB_Favoritos.schFavoritos.Categoria
    WHERE catCodi = @CategoriaPai -- Define o ponto de partida
--
    UNION ALL
--
    -- Passo Recursivo: Seleciona todas as categorias filhas
    SELECT 
        c.catCodi, 
        c.catDesc, 
        c.catPai, 
        cr.Nivel + 1
    FROM DB_Favoritos.schFavoritos.Categoria c
    INNER JOIN CategoriaRecursiva cr 
        ON c.catPai = cr.catCodi
)
SELECT * FROM CategoriaRecursiva
ORDER BY Nivel, catCodi;















WITH CategoriaRecursiva AS (
    -- Caso Base: Seleciona todas as categorias que são raízes (não têm catPai)
    SELECT 
        catCodi, 
        catDesc, 
        catPai, 
        0 AS Nivel
    FROM DB_Favoritos.schFavoritos.Categoria
    WHERE catPai IS NULL
--
    UNION ALL
--
    -- Passo Recursivo: Seleciona todas as categorias filhas
    SELECT 
        c.catCodi, 
        c.catDesc, 
        c.catPai, 
        cr.Nivel + 1
    FROM DB_Favoritos.schFavoritos.Categoria c
    INNER JOIN CategoriaRecursiva cr 
        ON c.catPai = cr.catCodi
)
SELECT * FROM CategoriaRecursiva
ORDER BY Nivel, catCodi;
