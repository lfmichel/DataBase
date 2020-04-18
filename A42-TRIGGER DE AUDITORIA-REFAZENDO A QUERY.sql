/*A42-TRIGGER DE AUDITORIA-REFAZENDO A QUERY*/
/*
1-CRIAR DATABASE LOJA1
2-CRIAR TABELA PRODUTO
3-INSERIR DADOS TABELA PRODUTO
4-CRIAR DATABASE BACKUP1
5-CRIAR TABELA BKP_PRODUTO
6-CRIAR TRIGGER AUDITORIA
7-ATUALIZACAO TABELA PRODUTO
*/

/*1-CRIAR DATABASE LOJA1*/
CREATE DATABASE LOJA1;

USE LOJA1;

/*2-CRIAR TABELA PRODUTO*/
CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

/*3-INSERIR DADOS TABELA PRODUTO*/
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO 1', 100.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO 2', 200.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO 3', 300.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO 4', 400.00);

/*4-CRIAR DATABASE BACKUP1*/
CREATE DATABASE BACKUP1;

USE BACKUP1;

/*-PONTO CHAVE DA QUERY-------------------------------------*/

/*5-CRIAR TABELA BKP_PRODUTO*/
CREATE TABLE BKP_PRODUTO(
	IDBKP_PRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR_ANTERIOR VARCHAR(30),
	VALOR_ATUAL VARCHAR(30),
	DATA_ATUALIZACAO DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
);

/*6-CRIAR TRIGGER AUDITORIA*/
/*ALTERANDO O DELIMITER*/
DELIMITER $

CREATE TRIGGER AUDIT_PRODUTO
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP1.BKP_PRODUTO VALUES(NULL,
										  OLD.IDPRODUTO,
										  OLD.NOME,
										  OLD.VALOR,
										  NEW.VALOR,
										  NOW(),
										  CURRENT_USER(),
										  'U');

END
$

DELIMITER ;

/*----------------------------------------------------------------*/

/*7-ATUALIZACAO TABELA PRODUTO*/
UPDATE PRODUTO SET VALOR = 600.00
WHERE IDPRODUTO = 4;

SELECT * FROM PRODUTO;
+-----------+---------+--------+
| IDPRODUTO | NOME    | VALOR  |
+-----------+---------+--------+
|         1 | LIVRO 1 | 100.00 |
|         2 | LIVRO 2 | 200.00 |
|         3 | LIVRO 3 | 300.00 |
|         4 | LIVRO 4 | 600.00 |
+-----------+---------+--------+

SELECT * FROM BACKUP1.BKP_PRODUTO;

UPDATE PRODUTO SET VALOR = 700.00
WHERE IDPRODUTO = 1;

+---------------+-----------+---------+----------------+-------------+---------------------+----------------+--------+
| IDBKP_PRODUTO | IDPRODUTO | NOME    | VALOR_ANTERIOR | VALOR_ATUAL | DATA_ATUALIZACAO    | USUARIO        | EVENTO |
+---------------+-----------+---------+----------------+-------------+---------------------+----------------+--------+
|             1 |         4 | LIVRO 4 | 400            | 600         | 2020-04-14 03:35:11 | root@localhost | U      |
|             2 |         1 | LIVRO 1 | 100            | 700         | 2020-04-14 03:37:48 | root@localhost | U      |
+---------------+-----------+---------+----------------+-------------+---------------------+----------------+--------+











