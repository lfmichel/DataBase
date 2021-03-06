/*A40 - TRIGGER NA PRATICA*/
/*ESTRUTURA DA TRIGGER*/
CREATE TRIGGER NOME DA TRIGGER
BEFORE/AFTER INSERT/DELETE/UPDATE ON NOME DA TABELA
ON EACH ROW
BEGIN

	COMANDO SQL;
	
END

/*FIM ESTRUTURA TRIGGER*/

/*CRIANDO EXEMPLO DE TRIGGER*/

/*CRIANDO A DATABASE AULA40*/
CREATE DATABASE AULA40;

/*CONECTANDO NA DATABASE AULA40*/
USE AULA40;

/*CRIANDO A TABELA USUARIO*/
CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);

/*O CENARIO E: TODA VEZ QUE EU APAGAR UM REGISTRO 
DA TABELA USUARIO, QUERO QUE O REGISTRO SEJA BACKUPADO
IMEDIATAMENTE*/

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

/*CRIANDO A TRIGGER*/
/*ALTERANDO O DELIMITER*/
DELIMITER $

/*TRIGGER*/
/*TRIGGER PARA INSERIR REGISTRO NA TABELA BKP_USUARIO ANTES DE DELETAR O REGISTRO DA TABELA USUARIO*/
CREATE TRIGGER BKP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN

	INSERT INTO BKP_USUARIO VALUES
	(NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);
	
END
$

/*RETORNANDO O DELIMITER*/
DELIMITER ;

/*----------------------------------------------------------------------------*/
/*CONCEITO DE AFTER / BEFORE*/
/*TEMOS TRES SITUACOES ONDE PODEMOS MANIPULAR DADOS DENTRO DA TABELA
SAO : INSERT, DELETE E UPDATE. TEMOS:
* UM AFTER/BEFORE EM INSERT,
* UM AFTER/BEFORE EM DELETE,
* UM AFTER/BEDORE EM UPDATE.
*/

/*CONCEITO DE NEW E OLD*/
/*
* TEMOS NO INSERT UM DADO NOVO (NEW)
* TEMOS NO DELETE UM DADO VELHO (OLD)
* TEMOS NO UPDATE UM DADO NOVO NA CLAUSULA UPDATE, E UM DADO VELHO NA TABELA 
*/ 
/*----------------------------------------------------------------------------*/

/*INSERINDO REGISTROS NA TABELA USUARIO*/
INSERT INTO USUARIO VALUES(NULL, 'ANDRADE', 'ANDRADE2009', 'HEXACAMPEAO');

/*DELETANDO REGISTRO NA TABELA USUARIO*/
DELETE FROM USUARIO WHERE IDUSUARIO = 1;




















