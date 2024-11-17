
USE industria_manufatura;

START TRANSACTION;
-- Inserindo dados na tabela Modelo
INSERT INTO Modelo (nome, fabricante) VALUES
('Modelo A', 'Fabricante X'),
('Modelo B', 'Fabricante Y'),
('Modelo C', 'Fabricante Z'),
('Modelo D', 'Fabricante W'),
('Modelo E', 'Fabricante V'),
('Modelo F', 'Fabricante U');

-- Inserindo dados na tabela Localizacao
INSERT INTO Localizacao (predio, setor) VALUES
('A', 1),
('B', 2),
('C', 3),
('D', 4),
('E', 5),
('F', 6);

-- Inserindo dados na tabela Equipamento
INSERT INTO Equipamento (Modelo_id_Modelo, Localizacao_id_Localizacao, data_aquisicao, custo_inicial, status, periodicidade_manutencao_dias) VALUES
(1, 1, '2023-01-15', 25000.00, 'ativo', 180),
(2, 2, '2022-07-20', 15000.00, 'ativo', 365),
(3, 3, '2021-03-10', 30000.00, 'inativo', 90),
(4, 4, '2020-06-15', 20000.00, 'ativo', 120),
(5, 5, '2019-11-10', 18000.00, 'ativo', 180),
(6, 6, '2021-08-01', 22000.00, 'inativo', 240);

-- Inserindo dados na tabela Especialidade
INSERT INTO Especialidade (descricao) VALUES
('Elétrica'),
('Mecânica'),
('Máquinas Pesadas'),
('Máquinas Leves'),
('Automação Industrial');

-- Inserindo dados na tabela Tecnico
INSERT INTO Tecnico (nome, anos_experiencia, valor_diaria, status) VALUES
('João Silva', 5, 350.00, 'desocupado'),
('Maria Oliveira', 10, 500.00, 'ocupado'),
('Carlos Pereira', 3, 300.00, 'desocupado'),
('Mateus Navarro', 3, 455.88, 'desocupado'),
('Davi Salgueiro',15,799.99,'ocupado'),
('Eduardo Jorge',20,899.90,'ocupado'),
('Alan Carlos',30,20000.99,'ocupado'),
('Jonas Eletricista',99,1,'desocupado');

-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (nome, cnpj) VALUES
('Fornecedor A', '11.111.111/0001-11'),
('Fornecedor B', '22.222.222/0002-22'),
('Fornecedor C', '33.333.333/0003-33'),
('Fornecedor D', '44.333.333/0003-33'),
('Peças 8000', '55.333.333/0003-33'),
('Super Parafusos', '66.333.333/0003-33'),
('Peça AQUI', '77.333.333/0003-33'),
('AUTO Falantes', '88.333.333/0003-33'),
('Eduardo Rodas', '99.333.333/0003-33');

INSERT INTO Endereco (Fornecedor_id_Fornecedor, numero, logradouro, cep, complemento, uf, municipio) VALUES
(1, '100', 'Rua A', '12345678', 'Apto 10', 'SP', 'São Paulo'),
(1, '200', 'Avenida B', '23456789', 'Casa', 'RJ', 'Rio de Janeiro'),
(2, '300', 'Travessa C', '34567890', 'Bloco C', 'MG', 'Belo Horizonte'),
(3, '222', 'Alamedas Aladas', '34567891', 'Bloco F', 'CE', 'Acaraú'),
(3, '345', 'Rua Parque Agradável', '34567892', 'Casa C', 'RJ', 'Três Rios'),
(4, '1421', 'Avenida Washington Soares', '34567893', 'Bloco C', 'CE', 'Fortaleza'),
(7, '123', 'Rua das Palmeiras', '78901234', 'Apto 303', 'SP', 'Campinas'),
(8, '456', 'Avenida Central', '89012345', '', 'RJ', 'Niterói'),
(9, '789', 'Travessa dos Lírios', '90123456', 'Casa 1', 'MG', 'Juiz de Fora'),
(1, '101', 'Rua dos Pioneiros', '10234567', 'Bloco B', 'PR', 'Curitiba'),
(2, '202', 'Avenida das Nações', '20345678', 'Loja 5', 'RS', 'Porto Alegre'),
(3, '303', 'Rua do Sol', '30456789', '', 'SC', 'Florianópolis'),
(4, '404', 'Alameda das Orquídeas', '40567890', 'Ponto Comercial', 'BA', 'Ilhéus'),
(5, '505', 'Avenida Beira-Mar', '50678901', 'Galpão A', 'CE', 'Fortaleza'),
(6, '606', 'Rua das Oliveiras', '60789012', '', 'PE', 'Recife'),
(7, '707', 'Praça das Flores', '70890123', 'Sobreloja', 'SP', 'Santos'),
(8, '808', 'Estrada Velha', '80901234', 'Sítio São João', 'GO', 'Goiânia'),
(4, '955', 'Rua Xuxa Park', '34567894', 'Bloco C', 'CE', 'Fortaleza');


-- Inserindo dados na tabela Peca
INSERT INTO Peca (descricao, custo, Fornecedor_id_Fornecedor, estoque) VALUES
('Parafuso M10', 2.50, 1, 500),
('Motor Elétrico', 750.00, 3, 10),
('Rolamento 6205', 50.00, 1, 100),
('Porca Castelo', 0.79, 6, 24532),
('Turbina R3', 9500.00, 2, 2);

-- Inserindo dados na tabela Especialidade_Tecnico
INSERT INTO Especialidade_Tecnico (Tecnico_id_Tecnico, Especialidade_id_Especialidade) VALUES
(1, 1),
(1,2),
(4,1),
(4,3),
(2, 2),
(3, 3);

-- Inserindo dados na tabela Especialidade_Equipamento
INSERT INTO Especialidade_Equipamento (Modelo_id_Modelo, Especialidade_id_Especialidade) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserindo dados na tabela Manutencao
INSERT INTO Manutencao (Equipamento_id_Equipamento, Tecnico_id_Tecnico, tipo_manutencao, data_solicitacao, data_inicio, data_conclusao) VALUES
(1, 1, 'preventiva', '2024-01-10', '2024-01-11', '2024-01-12'),
(2, 2, 'corretiva', '2024-02-01', '2024-02-02', '2024-02-03'),
(3, 3, 'preventiva', '2024-03-01', '2024-03-02', '2024-03-03'),
(4, 4, 'corretiva', '2024-04-05', '2024-04-06', '2024-04-07'),
(5, 5, 'preventiva', '2024-05-10', '2024-05-11', '2024-05-12'),
(6, 6, 'corretiva', '2024-06-15', '2024-06-16', '2024-06-17'),
(1, 2, 'preventiva', '2024-07-20', '2024-07-21', '2024-07-22'),
(2, 3, 'corretiva', '2024-08-01', '2024-08-02', '2024-08-03'),
(3, 4, 'corretiva', '2024-09-05', '2024-09-06', '2024-09-07'),
(4, 5, 'preventiva', '2024-10-10', '2024-10-11', '2024-10-12'),
(5, 6, 'corretiva', '2024-11-15', '2024-11-16', NULL),
(6, 1, 'preventiva', '2024-12-01', '2024-12-02', '2024-12-03'),
(2, 2, 'corretiva', '2024-12-20', NULL, NULL),
(1, 3, 'corretiva', '2025-01-05', '2025-01-06', '2025-01-07'),
(4, 4, 'preventiva', '2025-01-15', NULL, NULL),
(5, 5, 'corretiva', '2025-02-01', '2025-02-02', NULL);

-- Inserindo dados na tabela Manutencao_Peca
INSERT INTO Manutencao_Peca (Manutencao_id_Manutencao, Peca_id_Peca, quantidade) VALUES
(1, 1, 10),
(2, 2, 1),
(3, 3, 5);

-- Inserindo dados na tabela Compatibilidade_Peca_Equipamento
INSERT INTO Compatibilidade_Peca_Equipamento (Peca_id_Peca, Modelo_id_Modelo) VALUES
(1, 1),
(2, 2),
(3, 3);
COMMIT;
ROLLBACK;