/*A24-EXERCICIO VIEW*/
/*CRIANDO A QUERY*/
/*PROJECAO*/
SELECT C.NOME,
       C.EMAIL, /*TABELA CLIENTE*/
       T.TIPO,
       T.NUMERO, /*TABELA TELEFONE*/
       E.BAIRRO,
       E.CIDADE,
       E.ESTADO  /*TABELA ENDERECO*/
FROM CLIENTE C
/*JUNCAO*/
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

/*CRIANDO A VIEW*/
CREATE VIEW RELATORIO AS
/*CRIANDO A QUERY*/
/*PROJECAO*/
SELECT C.NOME,
       C.EMAIL, /*TABELA CLIENTE*/
       T.TIPO,
       T.NUMERO, /*TABELA TELEFONE*/
       E.BAIRRO,
       E.CIDADE,
       E.ESTADO  /*TABELA ENDERECO*/
FROM CLIENTE C
/*JUNCAO*/
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

/*APRESENTANDO A VIEW*/
SELECT * FROM RELATORIO;

/*CRIANDO SELECAO DENTRO DA VIEW*/
SELECT * FROM RELATORIO
WHERE SEXO = 'F';

/*CRIANDO A VIEW COM PADRAO V_*/
CREATE VIEW V_RELATORIO AS
/*CRIANDO A QUERY*/
/*PROJECAO*/
SELECT C.NOME,
       C.EMAIL, /*TABELA CLIENTE*/
       T.TIPO,
       T.NUMERO, /*TABELA TELEFONE*/
       E.BAIRRO,
       E.CIDADE,
       E.ESTADO  /*TABELA ENDERECO*/
FROM CLIENTE C
/*JUNCAO*/
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

/*--------------------------------------*/
/*-----PROJETO BANCO DADOS OFICINA------*/
/**CRIAR A TABELA CLIENTE DA OFICINA**/
/*TABELA CLIENTE1*/
CREATE TABLE CLIENTE1(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('F', 'M') NOT NULL,
	ESTADO CHAR(2) NOT NULL
);

/*ALTERANDO O DELIMITER*/
DELIMITER $

/*INSERINDO DADOS NA TABELA CLIENTE1 - UTILIZANDO PROCEDURE*/
CREATE PROCEDURE CAD_CLIENTE(P_NOME VARCHAR(30), P_SEXO ENUM('F','M'), P_ESTADO CHAR(2))
BEGIN
	INSERT INTO CLIENTE1 VALUES (P_NOME, P_SEXO, P_ESTADO);
END
$

/*RETORNANDO O DELIMITER*/
DELIMITER ;
 
/*CHAMAR PROCEDURE CAD_CLIENTE*/
CALL CAD_CLIENTE('LUIZ FERNANDO', 'M', 'SP');

/**CRIAR A QUERY GERAL DA TABELA CLIENTE**/
CREATE PROCEDURE SEL_CLIENTE()
BEGIN
	SELECT NOME, SEXO, ESTADO
	FROM CLIENTE1;
END
$

/*CHAMAR PROCEDURE SEL_CLIENTE*/
CALL SEL_CLIENTE();
