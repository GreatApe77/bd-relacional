# Mateus Arruda Navarro Albuquerque
# Matrícula: 2210356

# 03 - Listar Todos os usuários que fizeram supermercado no mês de novembro de 2019, totalizando as compras deles
# em novembro de 2019, calculando a média das compras, contando a quantidade de compras, mostrando o maior
# valor de compra e o menor valor de compra.

SELECT
u.Nome AS "Usuário",
count(m.idMovimentacao) AS "Total de compras",
avg(m.Valor) AS "Valor médio",
sum(m.Valor) AS "Valor total gasto no mês com Supermercado",
max(m.Valor) AS "Maior valor",
min(m.Valor) AS "Menor valor"
FROM usuario u 
INNER JOIN contas c ON c.Usuario_idUsuario=u.idUsuario
INNER JOIN movimentacao m ON m.Contas_idConta=c.idConta
INNER JOIN categoria cat ON cat.idCategoria=m.Categoria_idCategoria
WHERE m.DataMovimentacao BETWEEN "2019-11-01" AND "2019-11-30" AND cat.descCategoria LIKE("Almoço")
GROUP BY u.Nome;


# 04 - Listar todos os usuários que não têm contas relacionadas
SELECT
u.nome as "Usuários sem conta"
FROM usuario u
LEFT JOIN contas c ON c.Usuario_idUsuario= u.idUsuario
 WHERE c.Usuario_idUsuario is null;
# 05 - Listar todos os Tipos de Movimento que não tiverem nenhum registro associado na tabela de movimentação.
SELECT
tm.idTipoMovimento AS "Código",
tm.DescMovimentacao AS "Tipo do movimento"
FROM tipomovimento tm 
LEFT JOIN movimentacao m 
ON m.TipoMovimento_idTipoMovimento = tm.idTipoMovimento
WHERE m.TipoMovimento_idTipoMovimento IS NULL;
