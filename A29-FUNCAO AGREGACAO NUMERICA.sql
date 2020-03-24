/*A29 - FUNCOES DE AGREGACAO NUMERICA*/
/*CRIAR TABELA VENDEDORES*/

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

/*INSERINDO DADOS NA TABELA VENDEDOR*/

INSERT INTO VENDEDORES VALUES(NULL, 'CARLOS', 'M', 76234.78, 88346.87, 7753.90);
INSERT INTO VENDEDORES VALUES(NULL, 'MARIA', 'F', 5865.78, 6768.87, 4467.90);
INSERT INTO VENDEDORES VALUES(NULL, 'ANTONIO', 'M', 5569.78, 4851.25, 5671.15);
INSERT INTO VENDEDORES VALUES(NULL, 'CLARA', 'F', 4286.75, 1957.45, 3985.79);
INSERT INTO VENDEDORES VALUES(NULL, 'ANDERSON','M', 9587.35, 5847.53, 8457.37);
INSERT INTO VENDEDORES VALUES(NULL, 'IVONE', 'F', 5847.25, 3985.67, 5874,58);
INSERT INTO VENDEDORES VALUES(NULL, 'JOAO', 'M', 5689.54, 5784.58, 5178.45);
INSERT INTO VENDEDORES VALUES(NULL, 'CELIA', 'F', 89667.78, 57654.87, 5755.90); 

/*MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA*/

SELECT MAX(FEVEREIRO) AS 'MAIOR_FEV'
FROM VENDEDORES;

/*MIN - TRAZ O VALOR MINIMO DE UMA COLUNA*/

SELECT MIN(FEVEREIRO) AS 'MENOR_FEV'
FROM VENDEDORES;

/*AVG - TRAZ O VALOR MEDIO DE UMA COLUNA*/

SELECT AVG(FEVEREIRO) AS 'MEDIA_FEV'
FROM VENDEDORES;

/*VARIAS FUNCOES NA MESMA QUERY*/

SELECT MAX(JANEIRO) AS 'MAX_JAN',
	   MIN(JANEIRO) AS 'MIN_JAN',
	   AVG(JANEIRO) AS 'MEDIA_JAN'
FROM VENDEDORES;

/*FUNCAO TRUNCATE - DELIMITA O NUMERO DE CASAS DECIMAIS*/
SELECT MAX(JANEIRO) AS 'MAX_JAN',
	   MIN(JANEIRO) AS 'MIN_JAN',
	   TRUNCATE(AVG(JANEIRO),2) AS 'MEDIA_JAN'
FROM VENDEDORES;


























