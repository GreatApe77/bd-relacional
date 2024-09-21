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

###INSERÇÕES
START TRANSACTION;
INSERT INTO TipoCliente
(Descricao) 
VALUES
("Regular"),
("Assinante");


INSERT INTO Sexo
(Descricao) 
VALUES
("Masculino"),
("Feminino"),
("Outro")
;

INSERT INTO PorteDoPet(
Descricao)
VALUES
("Pequeno"),
("Médio"),
("Grande");

INSERT INTO Cliente (Nascimento, Nome, TipoCliente_idTipoCliente, Sexo_idSexo) 
VALUES ("2000-01-01", "Mateus", 1, 1),
("1980-12-13", "Jonas", 2, 1),
("1950-03-27", "Maria", 1, 2);

INSERT INTO Raca (Descricao, Nome, PorteDoPet_idPorteDoPet) 
VALUES
 ("Raca chinesa", "Shi-Tzu", 1),
("Cão de guarda", "Pastor Alemão", 3),
 ("Cachorro Agressivo", "Pitbull", 2),
 ("Cachorro Alemao", "Weimaraner", 3)
 ;
 INSERT INTO Pet(Nascimento, Nome, Cliente_idCliente, Sexo_idSexo, Raca_idRaca)
VALUES
("2014-10-10","Nina",1,2,1),
("2009-10-10","Safira",1,2,4),
("2010-10-10","Barbas",3,1,2),
("2020-10-1","Flor",3,2,3);

INSERT INTO Telefone (Numero, Cliente_idCliente)
VALUES ('81828384', 1),
('81828385', 1),
('11223344', 2),
('32123454', 3),
('98877665', 3);

INSERT INTO Endereco 
(Logradouro, Numero, Complemento, Bairro, Cidade, CEP, UF, Cliente_idCliente)
VALUES 
("Rua A", "123", "Apto 12", "Centro", "Fortaleza", "12345678", "CE", 1),
("Rua B", "456", "Apto 13", "Aldeota", "Fortaleza", "60192192", "CE", 1),
("Rua C", "789", "Apto 14", "Meireles", "Fortaleza", "60192193", "CE", 2),
("Rua D", "1011", "Apto 15", "Messejana", "Fortaleza", "60192194", "CE", 2),
("Rua E", "1213", "Casa 1", "Aerolândia", "Fortaleza", "50192195", "CE", 2),
("Rua M", "1415", "Apto 1502", "Bom Jardim", "Fortaleza", "60192099", "CE", 3);
COMMIT;
SELECT * FROM Cliente;
