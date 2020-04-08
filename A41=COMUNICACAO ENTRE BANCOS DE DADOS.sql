/*A41-COMUNICACAO ENTRE BANCOS DE DADOS*/

/*CRIANDO BANCO E TABELA*/
CREATE DATABASE LOJA;

USE LOJA;

/*TABELA PRODUTO DO BANCO LOJA*/
CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

/*CRIANDO OUTRO BANCO E ACESSANDO O BANCO*/
CREATE DATABASE BACKUP;

USE BACKUP;

/*CRIANDO A TABELA BKP_PRODUTO*/
CREATE TABLE BKP_PRODUTO(
	IDBKP_PRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

/*VAMOS CONECTAR AO BANCO DE DADOS ORIGINAL - LOJA*/

USE LOJA;

/*TESTAR A COMUNICACAO ENTRE OS DOIS BANCOS DE DADOS*/
/*INSERINDO O NOME DO BANCO DE DADOS ANTES DO NOME DA TABELA DO MESMO BANCO DE DADOS*/
INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL, 1000, 'TESTE', 0.0);

/*CONFERINDO OS DADOS DA TABELA DO BANCO DE DADOS BACKUP, TEMOS QUE INSERIR O NOME DO 
BANCO DE DADOS ANTES DO NOME DA TABELA*/

SELECT * FROM BACKUP.BKP_PRODUTO;
+---------------+-----------+------------------+--------+
| IDBKP_PRODUTO | IDPRODUTO | NOME             | VALOR  |
+---------------+-----------+------------------+--------+
|             1 |      1000 | TESTE            |   0.00 |
|             2 |         0 | LIVRO MODELAGEM  |  50.00 |
|             3 |         0 | LIVRO BI         |  80.00 |
|             4 |         0 | LIVRO ORACLE     |  70.00 |
|             5 |         0 | LIVRO SQL SERVER | 100.00 |
+---------------+-----------+------------------+--------+

/*PROGRAMANDO A TRIGGER PARA INSERIR DADOS NA TABELA PRODUTO (BANCO LOJA) TEREMOS O BACKUP DOS 
DADOS NA TABELA BKP_PRODUTO (BANCO BACKUP)*/

/*ALTERANDO O DELIMITER*/
DELIMITER $

/*CRIANDO A TRIGGER PARA ANTES DE INSERIR NA TABELA PRODUTOS DADOS, FAZER UM BACKUP 
NA TABELA BKP_PRODUTO NO BANCO DE DADOS BACKUP*/
CREATE TRIGGER BKP_PRODUT
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR);

END
$

/*ALTERANDO O DELIMITER*/
DELIMITER ;

/*FAZER O TESTE, INSERINDO DADOS NA TABELA PRODUTO*/
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO MODELAGEM', 50.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO BI', 80.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO ORACLE', 70.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO SQL SERVER', 100.00);

/*CONFERINDO OS DADOS NA TABELA PRODUTO DO BANCO LOJA*/
SELECT * FROM PRODUTO;
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
+-----------+------------------+--------+

/*VERIFICANDO OS DADOS NA TABELA BKP_PRODUTO NO BANCO BACKUP*/
SELECT * FROM BACKUP.BKP_PRODUTO;
+---------------+-----------+------------------+--------+
| IDBKP_PRODUTO | IDPRODUTO | NOME             | VALOR  |
+---------------+-----------+------------------+--------+
|             1 |      1000 | TESTE            |   0.00 |
|             2 |         0 | LIVRO MODELAGEM  |  50.00 |
|             3 |         0 | LIVRO BI         |  80.00 |
|             4 |         0 | LIVRO ORACLE     |  70.00 |
|             5 |         0 | LIVRO SQL SERVER | 100.00 |
+---------------+-----------+------------------+--------+

/*ALTERANDO O DELIMITER ANTES DE CRIAR A TRIGGER*/
DELIMITER $

/*CRIANDO TRIGGER PARA GRAVAR REGISTRO ANTES DE DELETAR*/
CREATE TRIGGER BKP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL, OLD.IDPRODUTO, OLD.NOME, OLD.VALOR);

END
$

/*ALTERAR O DELIMITER*/
DELIMITER ;

/*DELETANDO ALGUM REGISTRO DA TABELA PRODUTO*/
DELETE FROM PRODUTO WHERE IDPRODUTO = 2;

/*CONFERINDO NA TABELA PRODUTO*/
SELECT * FROM PRODUTO;
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
+-----------+------------------+--------+

/*CONFERINDO NA TABELA BKP_PRODUTO NO BANCO BACKUP*/
SELECT * FROM BACKUP.BKP_PRODUTO;
+---------------+-----------+------------------+--------+
| IDBKP_PRODUTO | IDPRODUTO | NOME             | VALOR  |
+---------------+-----------+------------------+--------+
|             1 |      1000 | TESTE            |   0.00 |
|             2 |         0 | LIVRO MODELAGEM  |  50.00 |
|             3 |         0 | LIVRO BI         |  80.00 |
|             4 |         0 | LIVRO ORACLE     |  70.00 |
|             5 |         0 | LIVRO SQL SERVER | 100.00 |
|             6 |         2 | LIVRO BI         |  80.00 |
+---------------+-----------+------------------+--------+

/*A TABELA BKP_PRODUTO NO CAMPO IDPRODUTO TEM OS VALORES COM ZERO, PORQUE A 
TRIGGER INSERI OS VALORES NA TABELA, ANTES DE GRAVAR NA TABELA PRINCIAPL, COM
ISSO O AUTO INCREMENTO NAO E GRAVADO NA TABELA BKP_PRODUTO*/

/*VAMOS DROPAR A TRIGGER E RECRIA LA PARA CORRIGIR ESSA QUESTAO*/
/*DROPANDO A TRIGGER BKP_PRODUT*/
DROP TRIGGER BKP_PRODUT;

/*ALTERANDO O DELIMITER ANTES DE CRIAR A TRIGGER*/
DELIMITER $

/*RECRIANDO A TRIGGER BKP_PRODUT AGORA COM O NOME DE BKP_PRODUTO*/
CREATE TRIGGER BKP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL, NEW.IDPRODUTO, NEW.NOME, NEW.VALOR);

END
$

/*RETORNANDO O DELIMITER APOS CRIAR A TRIGGER*/
DELIMITER ;

/*INSERIR DADOS NA TABELA PRODUTO PARA TESTAR A TRIGGER DE INSERT*/
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO C', 100.00);

/*VERIFICANDO NA TABELA PRODUTO NO BANCO LOJA*/
SELECT * FROM PRODUTO;
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
|         7 | LIVRO C          | 100.00 |
+-----------+------------------+--------+

/*VERIFICAR NA TABELA BKP_PRODUTO NO BANCO BACKUP*/
SELECT * FROM BACKUP.BKP_PRODUTO;
+---------------+-----------+------------------+--------+
| IDBKP_PRODUTO | IDPRODUTO | NOME             | VALOR  |
+---------------+-----------+------------------+--------+
|             1 |      1000 | TESTE            |   0.00 |
|             2 |         0 | LIVRO MODELAGEM  |  50.00 |
|             3 |         0 | LIVRO BI         |  80.00 |
|             4 |         0 | LIVRO ORACLE     |  70.00 |
|             5 |         0 | LIVRO SQL SERVER | 100.00 |
|             6 |         2 | LIVRO BI         |  80.00 |
|             7 |         7 | LIVRO C          | 100.00 |
+---------------+-----------+------------------+--------+ 






