USE industria_manufatura;

#1. Relatório de Frequência de Manutenção por Equipamento: Exibir o total de
#manutenções realizadas por cada equipamento, separadas por tipo de manutenção
#(preventiva e corretiva).

SELECT
e.id_Equipamento as 'ID',
m.nome as 'Modelo do equipamento',
count(man.id_Manutencao) as'Quantidade',
man.tipo_manutencao as 'Tipo'

FROM manutencao man 
INNER JOIN 
equipamento e ON man.Equipamento_id_Equipamento = e.id_Equipamento
INNER JOIN 
modelo m ON e.Modelo_id_Modelo = m.id_Modelo
GROUP BY man.tipo_manutencao,e.id_Equipamento
ORDER BY e.id_Equipamento, man.tipo_manutencao;


#2. Relatório de Custos de Manutenção por Técnico: Listar o total de custo das
#manutenções realizadas por cada técnico, considerando os custos de peças e tempo de
#trabalho do técnico.
##DUVIDA
SELECT 
tec.nome as 'Técnico',
sum(p.custo*m_p.quantidade) as 'Custo total'
FROM Tecnico tec
INNER JOIN Manutencao m ON m.Tecnico_id_Tecnico =tec.id_Tecnico
LEFT JOIN Manutencao_Peca m_p ON m_p.Manutencao_id_Manutencao = m.id_Manutencao
LEFT JOIN Peca p ON m_p.Peca_id_Peca = p.id_Peca
GROUP BY tec.nome;


#3. Relatório de Equipamentos com Maior Frequência de Falhas: Exibir os equipamentos
#que mais necessitam de manutenção corretiva, permitindo identificar possíveis
#necessidades de substituição.

SELECT
e.id_equipamento as 'Equipamento',
m.nome as 'Modelo',
count(man.id_Manutencao)  as 'Total de manutenções corretivas',
(year(now())-year(e.data_aquisicao)) as 'idade do equipamento'
FROM equipamento e INNER JOIN Modelo m ON e.Modelo_id_Modelo = m.id_Modelo
INNER JOIN Manutencao man ON man.Equipamento_id_Equipamento = e.id_Equipamento
WHERE man.tipo_manutencao = 'corretiva'
GROUP BY e.id_equipamento
ORDER BY `Total de manutenções corretivas` DESC;

#4. Relatório de Manutenções Pendentes: Listar todas as manutenções pendentes, com
#informações sobre o técnico designado, o equipamento, o custo estimado da
#manutenção (peças e mão de obra) e a data da solicitação.


