-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS industria_manufatura;
USE industria_manufatura;

-- Tabela de Modelos
CREATE TABLE Modelo (
    id_Modelo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL
);

-- Tabela de Localização
CREATE TABLE Localizacao (
    id_Localizacao INT PRIMARY KEY AUTO_INCREMENT,
    predio VARCHAR(1) NOT NULL,   -- Exemplo: "Setor A - Linha 1"
    setor INT                      -- Exemplo: "Produção"
    -- outros atributos específicos da localização
);

-- Tabela de Equipamentos
CREATE TABLE Equipamento (
    id_Equipamento INT PRIMARY KEY AUTO_INCREMENT,
    Modelo_id_Modelo INT NOT NULL,
    Localizacao_id_Localizacao INT NOT NULL,
    data_aquisicao DATE DEFAULT(NOW()),
    custo_inicial DECIMAL(10, 2) NOT NULL,
    status ENUM('ativo', 'inativo') NOT NULL,
    periodicidade_manutencao_dias INT
);

-- Tabela de Especialidades
CREATE TABLE Especialidade (
    id_Especialidade INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL  -- Exemplo: "Máquinas Pesadas", "Elétrica", "Mecânica"
);

-- Tabela de Técnicos
CREATE TABLE Tecnico (
    id_Tecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    anos_experiencia INT NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL,
    status ENUM('ocupado', 'descoupado') NOT NULL
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedor (
    id_Fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(100) NOT NULL,
    status ENUM('ativo', 'inativo') NOT NULL
);

-- Tabela de Endereços (associada a Fornecedor)
CREATE TABLE Endereco (
    id_Endereco INT PRIMARY KEY AUTO_INCREMENT,
    Fornecedor_id_Fornecedor INT NOT NULL,
    numero VARCHAR(255),
    logradouro VARCHAR(255),
    cep VARCHAR(255)
);

-- Tabela de Peças
CREATE TABLE Peca (
    id_Peca INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    Fornecedor_id_Fornecedor INT NOT NULL,
    estoque INT NOT NULL
);

-- Tabela de Especialidade_Tecnico (associação entre Técnico e Especialidade)
CREATE TABLE Especialidade_Tecnico (
    id_EspecialidadeTecnico INT PRIMARY KEY AUTO_INCREMENT,
    Tecnico_id_Tecnico INT NOT NULL,
    Especialidade_id_Especialidade INT NOT NULL
);

-- Tabela de Especialidade_Equipamento (associação entre Equipamento e Especialidade)
CREATE TABLE Especialidade_Equipamento (
    id_EspecialidadeEquipamento INT PRIMARY KEY AUTO_INCREMENT,
    Modelo_id_Modelo INT NOT NULL,
    Especialidade_id_Especialidade INT NOT NULL
);

-- Tabela de Manutenções
CREATE TABLE Manutencao (
    id_Manutencao INT PRIMARY KEY AUTO_INCREMENT,
    Equipamento_id_Equipamento INT NOT NULL,
    Tecnico_id_Tecnico INT NOT NULL,
    tipo_manutencao ENUM('preventiva', 'corretiva') NOT NULL,
    data_solicitacao DATE NOT NULL,
    data_inicio DATE NOT NULL,
    data_conclusao DATE NOT NULL,
    status ENUM('pendente', 'em andamento', 'concluída') NOT NULL
);

-- Tabela de Manutencao_Peca (associação entre Manutencao e Peca)
CREATE TABLE Manutencao_Peca (
    id_ManutencaoPeca INT PRIMARY KEY AUTO_INCREMENT,
    Manutencao_id_Manutencao INT NOT NULL,
    Peca_id_Peca INT NOT NULL,
    quantidade INT NOT NULL
);

-- Tabela de Compatibilidade entre Peças e Equipamentos
CREATE TABLE Compatibilidade_Peca_Equipamento (
    id_Compatibilidade INT PRIMARY KEY AUTO_INCREMENT,
    Peca_id_Peca INT NOT NULL,
    Modelo_id_Modelo INT NOT NULL
);

-- Adicionando as Chaves Estrangeiras
ALTER TABLE Equipamento
    ADD FOREIGN KEY (Modelo_id_Modelo) REFERENCES Modelo(id_Modelo),
    ADD FOREIGN KEY (Localizacao_id_Localizacao) REFERENCES Localizacao(id_Localizacao);

ALTER TABLE Endereco
    ADD FOREIGN KEY (Fornecedor_id_Fornecedor) REFERENCES Fornecedor(id_Fornecedor);

ALTER TABLE Peca
    ADD FOREIGN KEY (Fornecedor_id_Fornecedor) REFERENCES Fornecedor(id_Fornecedor);

ALTER TABLE Especialidade_Tecnico
    ADD FOREIGN KEY (Tecnico_id_Tecnico) REFERENCES Tecnico(id_Tecnico),
    ADD FOREIGN KEY (Especialidade_id_Especialidade) REFERENCES Especialidade(id_Especialidade);

ALTER TABLE Especialidade_Equipamento
    ADD FOREIGN KEY (Modelo_id_Modelo) REFERENCES Modelo(id_Modelo),
    ADD FOREIGN KEY (Especialidade_id_Especialidade) REFERENCES Especialidade(id_Especialidade);

ALTER TABLE Manutencao
    ADD FOREIGN KEY (Equipamento_id_Equipamento) REFERENCES Equipamento(id_Equipamento),
    ADD FOREIGN KEY (Tecnico_id_Tecnico) REFERENCES Tecnico(id_Tecnico);

ALTER TABLE Manutencao_Peca
    ADD FOREIGN KEY (Manutencao_id_Manutencao) REFERENCES Manutencao(id_Manutencao),
    ADD FOREIGN KEY (Peca_id_Peca) REFERENCES Peca(id_Peca);

ALTER TABLE Compatibilidade_Peca_Equipamento
    ADD FOREIGN KEY (Peca_id_Peca) REFERENCES Peca(id_Peca),
    ADD FOREIGN KEY (Modelo_id_Modelo) REFERENCES Modelo(id_Modelo);
