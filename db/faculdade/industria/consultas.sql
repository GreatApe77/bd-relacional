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
#DUVIDA
SELECT
    man.id_Manutencao AS 'Código da Manutenção',
    tec.nome AS 'Técnico',
    e.id_Equipamento AS 'Equipamento',
    m.nome AS 'Modelo',
    man.data_solicitacao AS 'Data de Solicitação',
    (tec.valor_diaria * DATEDIFF(man.data_previsao_conclusao, man.data_previsao_inicio)) AS 'Custo de Mão de Obra',
    COALESCE(SUM(p.custo * m_p.quantidade), 0) AS 'Custo de Peças',
    (tec.valor_diaria * DATEDIFF(man.data_previsao_conclusao, man.data_previsao_inicio)) 
        + COALESCE(SUM(p.custo * m_p.quantidade), 0) AS 'Custo Total Estimado'
FROM 
    Manutencao man
INNER JOIN 
    Tecnico tec ON tec.id_Tecnico = man.Tecnico_id_Tecnico
INNER JOIN 
    Equipamento e ON e.id_Equipamento = man.Equipamento_id_Equipamento
INNER JOIN 
    Modelo m ON m.id_Modelo = e.Modelo_id_Modelo
LEFT JOIN 
    Manutencao_Peca m_p ON m_p.Manutencao_id_Manutencao = man.id_Manutencao
LEFT JOIN 
    Peca p ON m_p.Peca_Id_Peca = p.id_Peca
WHERE 
    man.data_inicio IS NULL
GROUP BY 
    man.id_Manutencao, tec.nome, e.id_Equipamento, m.nome, man.data_solicitacao, 
    man.data_previsao_inicio, man.data_previsao_conclusao, tec.valor_diaria;

