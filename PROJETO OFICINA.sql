/*PROJETO OFICINA*/

CREATE DATABASE OFICINA;

USE OFICINA;

/*TABELAS*/

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	ID_CARRO INT UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','CEL','COM'),
	NUMERO VARCHAR(20),
	ID_CLIENTE INT
);

CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(20) UNIQUE
);

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	MODELO VARCHAR(20) NOT NULL,
	PLACA VARCHAR(30) NOT NULL UNIQUE,
	ID_MARCA INT
);

CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	COR VARCHAR(30) NOT NULL
);

CREATE TABLE CARRO_COR(
	ID_CARRO INT,
	ID_COR INT,
	PRIMARY KEY(ID_CARRO,ID_COR)
);

/*CONSTRAINTS*/

ALTER TABLE TELEFONE 
ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY(ID_CLIENTE) 
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO 
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY(ID_MARCA) 
REFERENCES MARCA(IDMARCA);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_COR
FOREIGN KEY(ID_COR)
REFERENCES COR(IDCOR);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

/*INSERINDO DADOS NA TABELA*/

/*REVER A AULA 26*/

INSERT INTO MARCA VALUES(NULL, 'AUDI');
INSERT INTO MARCA VALUES(NULL, 'FORD');
INSERT INTO MARCA VALUES(NULL, 'FIAT');
INSERT INTO MARCA VALUES(NULL, 'HONDA');
INSERT INTO MARCA VALUES(NULL, 'NISSAN');
INSERT INTO MARCA VALUES(NULL, 'CHEVROLET');
INSERT INTO MARCA VALUES(NULL, 'VOLKSWAGEN');
INSERT INTO MARCA VALUES(NULL, 'BMW');
INSERT INTO MARCA VALUES(NULL, 'HYUNDAI');
INSERT INTO MARCA VALUES(NULL, 'MERCEDES');

--------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| IDMARCA | int(11)     | NO   | PRI | NULL    | auto_increment |
| MARCA   | varchar(20) | YES  | UNI | NULL    |                |
+---------+-------------+------+-----+---------+----------------+

+---------+------------+
| IDMARCA | MARCA      |
+---------+------------+
|       1 | AUDI       |
|       8 | BMW        |
|       6 | CHEVROLET  |
|       3 | FIAT       |
|       2 | FORD       |
|       4 | HONDA      |
|       9 | HYUNDAI    |
|      10 | MERCEDES   |
|       5 | NISSAN     |
|       7 | VOLKSWAGEN |
+---------+------------+

INSERT INTO CARRO VALUES(NULL, 'A3', 'AAA1234', 1);
INSERT INTO CARRO VALUES(NULL, 'M4', 'AAA1111', 8);
INSERT INTO CARRO VALUES(NULL, 'ONIX', 'AAA1112', 6);
INSERT INTO CARRO VALUES(NULL, 'UNO', 'AAA1113', 3);
INSERT INTO CARRO VALUES(NULL, 'FIESTA', 'AAA1114', 2);
INSERT INTO CARRO VALUES(NULL, 'CIVIC', 'AAA1115', 4);
INSERT INTO CARRO VALUES(NULL, 'I30', 'AAA1116', 9);
INSERT INTO CARRO VALUES(NULL, 'A180', 'AAA1117', 10);
INSERT INTO CARRO VALUES(NULL, 'SENTRA', 'AAA1118', 5);
INSERT INTO CARRO VALUES(NULL, 'GOLF', 'AAA1119', 7);

+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| IDCARRO  | int(11)     | NO   | PRI | NULL    | auto_increment |
| MODELO   | varchar(20) | NO   |     | NULL    |                |
| PLACA    | varchar(30) | NO   | UNI | NULL    |                |
| ID_MARCA | int(11)     | YES  | MUL | NULL    |                |
+----------+-------------+------+-----+---------+----------------+

+---------+--------+---------+----------+
| IDCARRO | MODELO | PLACA   | ID_MARCA |
+---------+--------+---------+----------+
|       1 | A3     | AAA1234 |        1 |
|       2 | M4     | AAA1111 |        8 |
|       3 | ONIX   | AAA1112 |        6 |
|       4 | UNO    | AAA1113 |        3 |
|       5 | FIESTA | AAA1114 |        2 |
|       6 | CIVIC  | AAA1115 |        4 |
|       7 | I30    | AAA1116 |        9 |
|       8 | A180   | AAA1117 |       10 |
|       9 | SENTRA | AAA1118 |        5 |
|      10 | GOLF   | AAA1119 |        7 |
+---------+--------+---------+----------+

INSERT INTO CLIENTE VALUES(NULL, 'ANTONIO', 'M', 1);
INSERT INTO CLIENTE VALUES(NULL, 'JULIA', 'F', 2);
INSERT INTO CLIENTE VALUES(NULL, 'THIAGO', 'M', 3);
INSERT INTO CLIENTE VALUES(NULL, 'LUIZ', 'M', 4);
INSERT INTO CLIENTE VALUES(NULL, 'MICHELLE', 'F', 5);
INSERT INTO CLIENTE VALUES(NULL, 'GUSTAVO', 'M', 6);
INSERT INTO CLIENTE VALUES(NULL, 'GABRIELA', 'F', 7);
INSERT INTO CLIENTE VALUES(NULL, 'SILVIA', 'F', 8);
INSERT INTO CLIENTE VALUES(NULL, 'FABIO', 'M', 9);
INSERT INTO CLIENTE VALUES(NULL, 'FELIPE', 'M', 10);


+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| ID_CARRO  | int(11)       | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

+-----------+----------+------+----------+
| IDCLIENTE | NOME     | SEXO | ID_CARRO |
+-----------+----------+------+----------+
|         1 | ANTONIO  | M    |        1 |
|         2 | JULIA    | F    |        2 |
|         3 | THIAGO   | M    |        3 |
|         4 | LUIZ     | M    |        4 |
|         5 | MICHELLE | F    |        5 |
|         6 | GUSTAVO  | M    |        6 |
|         7 | GABRIELA | F    |        7 |
|         8 | SILVIA   | F    |        8 |
|         9 | FABIO    | M    |        9 |
|        10 | FELIPE   | M    |       10 |
+-----------+----------+------+----------+

