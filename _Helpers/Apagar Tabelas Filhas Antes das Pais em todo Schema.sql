--> Apagar Tabelas Filhas Antes das Pais em todo o Schema

DECLARE @SchemaName SYSNAME = 'Cadastro'; -- ALTERE para o nome do schema que você quer limpar
DECLARE @sql NVARCHAR(MAX) = N'';

-- 1. Remover Foreign Keys primeiro
SELECT @sql += 'ALTER TABLE ' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) +
               ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + ';' + CHAR(13)
FROM sys.foreign_keys fk
JOIN sys.tables t ON fk.parent_object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name = @SchemaName;

-- 2. Apagar todas as tabelas do schema
SELECT @sql += 'DROP TABLE ' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) + ';' + CHAR(13)
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name = @SchemaName;

-- Executar script
EXEC sp_executesql @sql;


/*
Como funciona:
Primeiro passo: Remove todas as chaves estrangeiras do schema informado (Cadastro).

Segundo passo: Remove todas as tabelas do schema.

O script é dinâmico, então você só precisa trocar o nome do schema na primeira linha (@SchemaName).

Exemplo de uso
Se você tiver o seguinte cenário:

Cadastro.Clientes (pai)

Cadastro.Pedidos (filha de Clientes)

Cadastro.ItensPedido (filha de Pedidos)

O script vai:

Remover todas as FKs (ItensPedido → Pedidos e Pedidos → Clientes)

Apagar as tabelas na ordem correta (ItensPedido → Pedidos → Clientes) automaticamente.
*/