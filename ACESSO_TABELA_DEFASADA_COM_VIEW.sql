/* Criando uma tabela, cuja as relacoes sejam 1:n e depois
   adaptando para n:n mas sem "quebrar" as consultas antigas */

USE MyDatabase;

CREATE TABLE  clientes (
	id INT PRIMARY KEY,
    nome VARCHAR (51) NOT NULL
);

CREATE TABLE carros (
	id INT PRIMARY KEY,
    placa VARCHAR (10)	NOT NULL UNIQUE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

INSERT INTO clientes (id, nome)
VALUES
	(1, 'Ana'),
    (2, 'Bia'),
    (3, 'Carlos');
    
INSERT INTO carros (id, placa, id_cliente) 
VALUES 
    (1, 'DUS-2018', 1), 
    (2, 'RX7-JDM1', 2), 
    (3, 'SKY-GTR3', 3); 

-- Vamos simular esta consulta com as novas tabelas posteriormente 
SELECT 
	clientes.nome,
    clientes.id,
    carros.placa -- >nv_carros
FROM clientes 
INNER JOIN carros ON clientes.id = carros.id_cliente; -- >nv_carros.id_cliente

RENAME TABLE carros TO nv_carros;

CREATE TABLE donos (
	id_antigo_dono INT NOT NULL,
    id_dono_atual INT NOT NULL,
    id_carro INT NOT NULL,
    
    PRIMARY KEY (id_antigo_dono, id_dono_atual, id_carro),
    
    FOREIGN KEY (id_antigo_dono) REFERENCES clientes(id),
    FOREIGN KEY (id_dono_atual) REFERENCES clientes(id),
    FOREIGN KEY (id_carro)  REFERENCES nv_carros(id)
);

INSERT INTO donos (id_antigo_dono, id_dono_atual, id_carro) 
VALUES 
    (3, 1, 1), 
    (1, 2, 1), 
    (1, 2, 2),
	(2, 1, 3); 
    
CREATE OR REPLACE VIEW carros
AS SELECT 
	nv_carros.id,
    nv_carros.placa,
    donos.id_dono_atual AS id_cliente
FROM nv_carros 
INNER JOIN donos ON donos.id_carro = nv_carros.id;

-- agora eh possivel refazer a query da linha 30









