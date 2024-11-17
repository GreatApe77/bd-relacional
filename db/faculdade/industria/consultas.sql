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
ORDER BY 
    e.id_Equipamento, man.tipo_manutencao;