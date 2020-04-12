/*A42 TRIGGER DE AUDITORIA*/

/*TRIGGER PARA OLHAR A TABELA E DIZER QUANDO O PRODUTO FOI DELETADO,
ALTERADO. GRAVAR O VALOR DA OPERACAO NO PRECO DO PRODUTO*/

/*DELETAR AS DUAS DATABASES : LOJA E BACKUP*/
DELIMITER ;

DROP DATABASE LOJA;

DROP DATABASE BACKUP;

/*CRIANDO A DATABASE LOJA*/
CREATE DATABASE LOJA;

USE LOJA;

/*CRIANDO A TABELA PRODUTO*/
CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDPRODUTO | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | YES  |     | NULL    |                |
| VALOR     | float(10,2) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

/*INSERINDO DADOS NA TABELA PRODUTO*/
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO MODELAGEM', 50.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO BI', 80.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO ORACLE', 70.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO SQL SERVER', 100.00);

+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 110.00 |
+-----------+------------------+--------+


/*CRIANDO A DAYABASE BACKUP*/
CREATE DATABASE BACKUP;

USE BACKUP;

/*APRESENTACAO DA FUNCAO NOW() - QUANDO*/
SELECT NOW();

/*APRESENTACOA DA FUNCAO CURRENT_USER() - QUEM*/
SELECT CURRENT_USER;

/*CRIAR A TABELA BKP_PRODUTO*/
CREATE TABLE BKP_PRODUTO(
	IDBKP_PRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR_ORIGINAL FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME, /*MOSTRA A DATA E HORA*/
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
);
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDBKP_PRODUTO  | int(11)     | NO   | PRI | NULL    | auto_increment |
| IDPRODUTO      | int(11)     | YES  |     | NULL    |                |
| NOME           | varchar(30) | YES  |     | NULL    |                |
| VALOR_ORIGINAL | float(10,2) | YES  |     | NULL    |                |
| VALOR_ALTERADO | float(10,2) | YES  |     | NULL    |                |
| DATA           | datetime    | YES  |     | NULL    |                |
| USUARIO        | varchar(30) | YES  |     | NULL    |                |
| EVENTO         | char(1)     | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*CRIAR TRIGGER*/
/*ALTERAR O DELIMITER $*/
DELIMITER $

/*CRIAMOS ATRIGGER PARA AUDITAR OS PRODUTOS*/
CREATE TRIGGER AUDIT_PROD
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,
										  OLD.IDPRODUTO,
										  OLD.NOME,
										  OLD.VALOR,
										  NEW.VALOR,
										  NOW(),
										  CURRENT_USER(),
										  'U');

END
$

/*RETORNAR O DELIMITER*/
DELIMITER ;

+--------------+----------------+
| TRIGGER_NAME | TRIGGER_SCHEMA |
+--------------+----------------+
| AUDIT_PROD   | loja           |
+--------------+----------------+

/*ATUALIZANDO DADOS NA TABELA PRODUTO*/
UPDATE PRODUTO SET VALOR = 110.00
WHERE IDPRODUTO = 4;

/*CONFERINDO ALTERACAO DE DADOS NA TABELA PRODUTO NO BANCO LOJA*/
SELECT * FROM PRODUTO;

+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 110.00 |
+-----------+------------------+--------+

/*CONFERINDO A TABELA BKP_PRODUTO NO BANCO BACKUP*/
SELECT * FROM BACKUP.BKP_PRODUTO;
+---------------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+
| IDBKP_PRODUTO | IDPRODUTO | NOME             | VALOR_ORIGINAL | VALOR_ALTERADO | DATA                | USUARIO        | EVENTO |
+---------------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+
|             1 |         4 | LIVRO SQL SERVER |         100.00 |         110.00 | 2020-04-12 03:24:41 | root@localhost | U      |
+---------------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+



