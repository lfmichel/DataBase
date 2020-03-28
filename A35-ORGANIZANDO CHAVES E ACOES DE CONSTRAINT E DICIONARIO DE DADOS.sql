/*A35 - ORGANIZANDO CHAVES E ACOES DE CONSTRAINT*/

/*SHOW TABLES*/
SHOW TABLES;

/*APAGANDO ALGUMAS TABELAS DO BANCO DE DADOS*/
DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

/*CRIA-SE AS TABELAS SEM AS CHAVES E DEPOIS POR FORA SAO CRIADAS AS CHAVES*/
/*CRIA-SE PRIMEIRO AS TABELAS E DEPOIS OS CONSTRAINTS*/

/*CRIANDO A TABELA CLIENTE*/

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| IDCLIENTE | int(11)     | YES  |     | NULL    |       |
| NOME      | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

/*CRIANDO A TABELA TELEFONE*/

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| IDTELEFONE | int(11)     | YES  |     | NULL    |       |
| TIPO       | char(3)     | NO   |     | NULL    |       |
| NUMERO     | varchar(10) | NO   |     | NULL    |       |
| ID_CLIENTE | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

/*CRIACAO DE CONSTRAINT*/
/*ALTERAR A TABELA INSERINDO UMA PK*/

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| IDCLIENTE | int(11)     | NO   | PRI | NULL    |       |
| NOME      | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

/*ALTERAR A TABELA INSERINDO UMA FK*/

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| IDTELEFONE | int(11)     | YES  |     | NULL    |       |
| TIPO       | char(3)     | NO   |     | NULL    |       |
| NUMERO     | varchar(10) | NO   |     | NULL    |       |
| ID_CLIENTE | int(11)     | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+

/*MOSTRANDO A TABELA CLIENTE COM DETALHES*/

SHOW CREATE TABLE CLIENTE;

+---------+-----------------------------------------------------------------------------------------+
| Table   | Create Table                                                                                                                                             |
+---------+-----------------------------------------------------------------------------------------+
| CLIENTE | CREATE TABLE `cliente` (
  `IDCLIENTE` int(11) NOT NULL,
  `NOME` varchar(30) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+---------+-----------------------------------------------------------------------------------------+

/*MOSTRANDO A TABELA TELEFONE COM DETALHES*/

SHOW CREATE TABLE TELEFONE;

+----------+----------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                                                                                                                      |
+----------+----------------------------------------------------------------------------------------+
| TELEFONE | CREATE TABLE `telefone` (
  `IDTELEFONE` int(11) DEFAULT NULL,
  `TIPO` char(3) NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  KEY `FK_CLIENTE_TELEFONE` (`ID_CLIENTE`),
  CONSTRAINT `FK_CLIENTE_TELEFONE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`IDCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+----------+----------------------------------------------------------------------------------------+ 

/*DICIONARIO DE DADOS*/
/*SHOW DATABASES*/

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema | /*BANCO DO DICIONARIO DE DADOS*/
| comercio           |
| farmacia           |
| loja               |
| mercearia          |
| mysql              | /*BANCO DO DICIONARIO DE DADOS*/
| padaria            |
| performance_schema | /*BANCO DO DICIONARIO DE DADOS*/ 
| projeto            |
| projeto1           |
| projeto2           |
| sys                |
+--------------------+

/*PROCURANDO CONSTRAINTS NOS DICIONARIOS DE DADOS*/

