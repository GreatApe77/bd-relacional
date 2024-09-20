CREATE DATABASE IF NOT EXISTS mateus_arruda_navarro_albuquerque;

USE mateus_arruda_navarro_albuquerque;


CREATE TABLE IF NOT EXISTS TipoCliente(
	idTipoCliente INT NOT NULL AUTO_INCREMENT,
    Descricao VARCHAR(45),
    PRIMARY KEY(idTipoCliente)
);

CREATE TABLE IF NOT EXISTS Cliente(
	idCliente INT NOT NULL AUTO_INCREMENT,
    Nascimento DATETIME,
    Nome VARCHAR(45) NOT NULL,
    TipoCliente_idTipoCliente INT NOT NULL,
    Sexo_idSexo INT NOT NULL,
    PRIMARY KEY (idCliente)
);
CREATE TABLE IF NOT EXISTS Pet(
	idPet INT NOT NULL AUTO_INCREMENT,
    Nascimento DATETIME,
    Nome VARCHAR(45) NOT NULL,
    Cliente_idCliente INT,
    Sexo_idSexo INT,
    Raca_idRaca INT,
    PRIMARY KEY (idPet)
);
CREATE TABLE IF NOT EXISTS PorteDoPet(
	idPorteDoPet INT NOT NULL AUTO_INCREMENT,
    Descricao VARCHAR(45) NOT NULL,
    PRIMARY KEY (idPorteDoPet)
);


CREATE TABLE IF NOT EXISTS Sexo(
	idSexo INT NOT NULL AUTO_INCREMENT,
    Descricao VARCHAR(45) NOT NULL,
     PRIMARY KEY(idSexo)
);


CREATE TABLE IF NOT EXISTS Raca(
	idRaca INT NOT NULL AUTO_INCREMENT,
    Descricao VARCHAR(45),
    Nome VARCHAR(45) NOT NULL,
    PorteDoPet_idPorteDoPet INT NOT NULL,
    PRIMARY KEY (idRaca)
);
CREATE TABLE IF NOT EXISTS Telefone(
	Numero VARCHAR(40) NOT NULL,
    Cliente_idCliente INT NOT NULL,
    PRIMARY KEY (Numero)
);
CREATE TABLE  IF NOT EXISTS Endereco(
	idEndereco INT NOT NULL AUTO_INCREMENT,
    Logradouro VARCHAR(45) NOT NULL,
    Numero VARCHAR(45) ,
    Complemento VARCHAR(45) ,
    Bairro VARCHAR(45) ,
    Cidade VARCHAR(45) ,
    CEP VARCHAR(8) ,
    UF VARCHAR(2) ,
    Cliente_idCliente INT NOT NULL,
    PRIMARY KEY (idEndereco)
);



ALTER TABLE
Raca ADD CONSTRAINT FOREIGN KEY 
fk_PorteDoPet_Raca (PorteDoPet_idPorteDoPet)
REFERENCES PorteDoPet(idPorteDoPet);


ALTER TABLE Pet ADD CONSTRAINT FOREIGN KEY fk_Pet_Cliente(Cliente_idCliente)
REFERENCES Cliente(idCliente);

ALTER TABLE Pet ADD CONSTRAINT FOREIGN KEY fk_Pet_Sexo(Sexo_idSexo)
REFERENCES Sexo(idSexo);

ALTER TABLE Pet ADD CONSTRAINT FOREIGN KEY fk_Pet_Raca(Raca_idRaca)
REFERENCES Raca(idRaca);

ALTER TABLE Cliente ADD CONSTRAINT FOREIGN KEY fk_Cliente_Sexo(Sexo_idSexo)
REFERENCES Sexo(idSexo);

ALTER TABLE Cliente ADD CONSTRAINT FOREIGN KEY fk_Cliente_TipoCliente(TipoCliente_idTipoCliente)
REFERENCES TipoCliente(idTipoCliente);


ALTER TABLE Telefone ADD CONSTRAINT FOREIGN KEY fk_Telefone_Cliente(Cliente_idCliente)
REFERENCES Cliente(idCliente);


ALTER TABLE Endereco ADD CONSTRAINT FOREIGN KEY fk_Endereco_Cliente(Cliente_idCliente)
REFERENCES Cliente(idCliente);
