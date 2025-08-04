--> Apagar Todo um Schema (com tabelas e FKs)

DECLARE @SchemaName SYSNAME = 'Cadastro'; -- ALTERE para o schema que deseja apagar
DECLARE @sql NVARCHAR(MAX) = N'';

-- 1. Remover Foreign Keys do schema
SELECT @sql += 'ALTER TABLE ' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) +
               ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + ';' + CHAR(13)
FROM sys.foreign_keys fk
JOIN sys.tables t ON fk.parent_object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name = @SchemaName;

-- 2. Remover tabelas do schema
SELECT @sql += 'DROP TABLE ' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) + ';' + CHAR(13)
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name = @SchemaName;

-- 3. Remover views (caso existam)
SELECT @sql += 'DROP VIEW ' + QUOTENAME(s.name) + '.' + QUOTENAME(v.name) + ';' + CHAR(13)
FROM sys.views v
JOIN sys.schemas s ON v.schema_id = s.schema_id
WHERE s.name = @SchemaName;

-- 4. Remover procedures (caso existam)
SELECT @sql += 'DROP PROCEDURE ' + QUOTENAME(s.name) + '.' + QUOTENAME(p.name) + ';' + CHAR(13)
FROM sys.procedures p
JOIN sys.schemas s ON p.schema_id = s.schema_id
WHERE s.name = @SchemaName;

-- 5. Remover functions (caso existam)
SELECT @sql += 'DROP FUNCTION ' + QUOTENAME(s.name) + '.' + QUOTENAME(f.name) + ';' + CHAR(13)
FROM sys.objects f
JOIN sys.schemas s ON f.schema_id = s.schema_id
WHERE s.name = @SchemaName
  AND f.type IN ('FN', 'IF', 'TF');

-- 6. Finalmente, remover o schema
SELECT @sql += 'DROP SCHEMA ' + QUOTENAME(@SchemaName) + ';';

-- Executar script
EXEC sp_executesql @sql;
