
# 2. Listar quantos dias de vida cada cliente tem no dia de hoje;
SELECT 
Nome,
DATEDIFF(NOW(),Nascimento) as "Dias de vida" #ATUAL - PASSADO
FROM cliente;

# 4. Construir uma consulta SQL que liste o pedido, o produto, a quantidade de produtos do pedido, o valor unitário do produto e o valor total (quantidade x valorunitário).


SELECT
ped.idPedido as "PEDIDO",
prod.Nome as "PRODUTO",
p_h_p.Quantidade as "QUANTIDADE DO PRODUTO",
prod.Preco as "PREÇO UNITÁRIO",
prod.Preco*p_h_p.Quantidade as "VALOR TOTAL (PRODUTO*QUANTIDADE)"
FROM pedido ped 
INNER JOIN pedido_has_produto p_h_p ON p_h_p.Pedido_idPedido=ped.idPedido
INNER JOIN produto prod ON p_h_p.Produto_idProduto=prod.idProduto;

# 6. Listar todos os clientes e seus endereços. Para cada endereço, mostrar de forma descritiva qual o tipo do endereço;

SELECT 
c.nome as "CLIENTE",
tpe.Descricao as "TIPO DO ENDEREÇO",
e.Logradouro,
e.Numero,
e.Complemento,
e.EnderecoPadrao,
e.Cidade,
e.UF,
e.Bairro,
e.CEP
FROM cliente c
INNER JOIN endereco e ON e.Cliente_idCliente=c.idCliente
INNER JOIN tipoendereco tpe ON e.TipoEndereco_idTipoEndereco= tpe.idTipoEndereco;

# 8. Criar um script SQL par listar todos os clientes que moram na Cidade de São Paulo

SELECT 
cliente.Nome as "CLIENTE" 
FROM cliente
INNER JOIN endereco ON endereco.Cliente_idCliente= cliente.idCliente
WHERE endereco.Cidade LIKE ("São Paulo");

# 10. Mostrar mês a mês quantos (quantidade) pedidos foram feitos.

SELECT
year(pedido.DataPedido) as ANO,
month(pedido.DataPedido) as MES,
count(pedido.idPedido) as "TOTAL NO MES"
from pedido
GROUP BY month(pedido.DataPedido),year(pedido.DataPedido)
ORDER BY ANO,MES;

#1874
#SELECT 
#count(pedido.idPedido) as total
#from pedido WHERE pedido.DataPedido between "2015-02-01" AND "2015-02-28";

