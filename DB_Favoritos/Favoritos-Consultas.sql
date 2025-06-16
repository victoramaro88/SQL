SELECT tipCodi, tipDesc, tipStat
FROM DB_Favoritos.schFavoritos.StatusTipo;

SELECT sttCodi, sttDesc, tipCodi
FROM DB_Favoritos.schFavoritos.Status;

SELECT sttTpoC, sttCodi, tipCodi
FROM DB_Favoritos.schFavoritos.SttTpo;

-- SELECIONANDO O TIPO DE STATUS
SELECT 
	S.sttCodi, S.sttDesc
FROM DB_Favoritos.schFavoritos.Status S
JOIN DB_Favoritos.schFavoritos.SttTpo STT ON STT.sttCodi = S.sttCodi 
JOIN DB_Favoritos.schFavoritos.StatusTipo ST ON ST.tipCodi = STT.tipCodi 
WHERE ST.tipCodi = 1;

SELECT *
FROM DB_Favoritos.schFavoritos.Categoria CAT
--WHERE CAT.catCodi = CAT.catPai -- PEGANDO APENAS AS CATEGORIAS PAIS
--ORDER BY CAT.catPai;

SELECT MAX(CAT.catCodi) FROM DB_Favoritos.schFavoritos.Categoria CAT

SELECT sitCodi, sitDesc, sitLink, sitObse, sttCodi, catCodi
FROM DB_Favoritos.schFavoritos.Site;

----------------------------------------------------------------------TESTE HIERARQUIA
WITH Hierarquia (catCodi, catDesc, catPai, nivel) AS (
    -- 1️ Caso Base: Seleciona as categorias raiz (sem pai)
    SELECT 
        catCodi, 
        catDesc, 
        catPai,
        1 AS nivel
    FROM DB_Favoritos.schFavoritos.Categoria
    WHERE catPai IS NULL
    UNION ALL
    -- 2️ Passo Recursivo: Busca os filhos da hierarquia
    SELECT 
        c.catCodi, 
        c.catDesc, 
        c.catPai,
        h.nivel + 1
    FROM DB_Favoritos.schFavoritos.Categoria c
    INNER JOIN Hierarquia h ON c.catPai = h.catCodi
)
-- 3️ Consulta Final
SELECT * FROM Hierarquia ORDER BY nivel, catPai, catCodi;


----------------------------------------------------------------------TESTE 2
WITH Hierarquia (catCodi, catDesc, catPai, nivel) AS (
    -- Caso Base: Seleciona as categorias raiz (sem pai)
    SELECT 
        catCodi, 
        catDesc, 
        catPai,
        1 AS nivel
    FROM DB_Favoritos.schFavoritos.Categoria
    WHERE catPai IS NULL
    UNION ALL
    -- Passo Recursivo: Busca os filhos da hierarquia
    SELECT 
        c.catCodi, 
        c.catDesc, 
        c.catPai,
        h.nivel + 1
    FROM DB_Favoritos.schFavoritos.Categoria c
    INNER JOIN Hierarquia h ON c.catPai = h.catCodi
)
-- Consulta Final com LEFT JOIN para trazer os sites
SELECT 
    h.catCodi, 
    h.catDesc, 
    h.nivel,
    s.sitCodi,
    s.sitDesc,
    s.sitLink
FROM Hierarquia h
LEFT JOIN DB_Favoritos.schFavoritos.Site s ON h.catCodi = s.catCodi
ORDER BY h.nivel, h.catPai, h.catCodi;


