/*A28 - PROCEDURES COM TABELAS*/

/*CRIANDO A TABELA CURSOS*/
CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

/*INSERINDO DADOS NA TABELA CURSOS*/
INSERT INTO CURSOS VALUES(NULL, 'BANCO DE DADOS FUNDAMENTAL', 25, 200.00);

/*-----------------------------------------------------------------------------------*/

/*CRIANDO A PROCEDURE COM TABELAS*/

/*PRIMEIRO PASSO PARA CRIAR PROCEDURE, ALTERAR O DELIMITADOR*/

DELIMITER $

/*CRIANDO A PROCEDURE CADASTRO CURSO*/

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30), P_HORAS INT(3), P_VALOR FLOAT(10,2))
BEGIN
		INSERT INTO CURSOS VALUES(NULL, P_NOME, P_HORAS, P_VALOR);
END
$

/*RETORNANDO O DELIMITER*/
DELIMITER ;

/*CHAMANDO A PROCEDURE*/

CALL CAD_CURSO('BI SQL SERVER', 35, 200.00);

SELECT * FROM CURSOS;

/*ALTERANDO O DELIMITER PARA CRIAR A PROCEDURE*/

DELIMITER $

/*CRIANDO A PROCEDURE SELECIONA CURSO*/

CREATE PROCEDURE SEL_CURSO()
BEGIN
		SELECT IDCURSO, NOME, HORAS, VALOR
		FROM CURSOS;
END
$

/*ALTERANDO O DELIMITER APOS CRIAR A PROCEDURE*/

DELIMITER ;

/*CHAMANDO A PROCEDURE*/

CALL SEL_CURSO();

/*-----------------------------------------------------------------------------------*/

/*EXERCICIO DE PROCEDURES COM TABELAS*/
/*CRIANDO A TABELA CURSOS*/
CREATE TABLE CURSOS(
	IDCURSOS INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

/*INSERINDO DADOS NA TABELA CURSOS*/
INSERT INTO CURSOS VALUES (NULL, 'BANCO DE DADOS FUNDAMENTAL', 25, 200.00);

/*CRIANDO PROCEDURE PARA INSERIR DADOS NA TABELA CURSOS*/
/*ALTERANDO O DELIMITADOR*/
DELIMITER $

/*PROCEDURE CAD_CURSOS*/
CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30), P_HORAS INT(3), P_VALOR FLOAT(10,2))
BEGIN
		INSERT INTO CURSOS VALUES (NULL, P_NOME, P_HORAS, P_VALOR); 
END
$

/*RETORNANDO O DELIMITADOR*/
DELIMITER ;

/*CHAMANDO A PROCEDURE CAD_CURSO*/
CALL CAD_CURSO("BI SQL SERVER", 35, 200.00);

/*PROJETANDO A TABELA*/
SELECT NOME, HORAS, VALOR FROM CURSOS;

/*ALTERANDO O DELIMITER PARA CRIAR A PROCEDURE SEL_CURSO*/
DELIMITER $

/*PROCEDURE SEL_CURSO*/
CREATE PROCEDURE SEL_CURSO()
BEGIN
		SELECT IDCURSOS, NOME, HORAS, VALOR FROM CURSOS;
END
$

/*RETORNANDO O DELIMITER*/
DELIMITER ;

/*CHAMANDO A PROCEDURE*/
CALL SEL_CURSO();

