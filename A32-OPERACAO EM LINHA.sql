/*A32 - OPERACOES EM LINHA*/

SELECT * FROM VENDEDORES;

/*SOMA DAS VENDAS POR TRIMESTRE PARA OS VENDEDORES*/
SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL TRIMESTRE",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
FROM VENDEDORES;


































+------------+----------+------+----------+-----------+---------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO  | FEVEREIRO | MARCO   |
+------------+----------+------+----------+-----------+---------+
|          1 | IVONE    | F    |  2348.91 | 101259.94 | 2589.19 |
|          2 | CARLOS   | M    | 76234.78 |  88346.87 | 7753.90 |
|          3 | MARIA    | F    |  5865.78 |   6768.87 | 4467.90 |
|          4 | ANTONIO  | M    |  5569.78 |   4851.25 | 5671.15 |
|          5 | CLARA    | F    |  4286.75 |   1957.45 | 3985.79 |
|          6 | ANDERSON | M    |  9587.35 |   5847.53 | 8457.37 |
|          7 | JOAO     | M    |  5689.54 |   5784.58 | 5178.45 |
|          8 | CELIA    | F    | 89667.78 |  57654.87 | 5755.90 |
+------------+----------+------+----------+-----------+---------+

   
/*SOMA DAS VENDAS POR TRIMESTRE PARA OS VENDEDORES*/
SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL TRIMESTRE",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA TRIMESTRAL"
FROM VENDEDORES;