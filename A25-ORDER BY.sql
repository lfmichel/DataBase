/*A25 - ORDER BY*/

/*PROJECAO*/
SELECT NOME, SEXO, CPF, CIDADE
FROM CLIENTE
/*JUNCAO*/
INNER JOIN ENDERECO
ON IDCLIENTE= ID_CLIENTE;

+---------+------+---------+----------------+
| NOME    | SEXO | CPF     | CIDADE         |
+---------+------+---------+----------------+
| JOAO    | M    | 98547-6 | RIO DE JANEIRO |
| CARLOS  | M    | 86664-7 | B. HORIZONTE   |
| ANA     | F    | 75658-5 | SAO PAULO      |
| JORGE   | M    | 88657-5 | B. HORIZONTE   |
| CLARA   | F    | 99754-7 | B. HORIZONTE   |
| CELIA   | F    | 77558-5 | NITEROI        |
| ANTONIO | M    | 78558-6 | RIO DE JANEIRO |
| JOAO    | M    | 86695-6 | RIO DE JANEIRO |
+---------+------+---------+----------------+

/*ORDENANDO POR NOME A TABELA CLIENTE*/
/*PROJECAO*/
SELECT NOME, SEXO, CPF, CIDADE
FROM CLIENTE
/*JUNCAO*/
INNER JOIN ENDERECO
ON IDCLIENTE= ID_CLIENTE
ORDER BY NOME;

+---------+------+---------+----------------+
| NOME    | SEXO | CPF     | CIDADE         |
+---------+------+---------+----------------+
| ANA     | F    | 75658-5 | SAO PAULO      |
| ANTONIO | M    | 78558-6 | RIO DE JANEIRO |
| CARLOS  | M    | 86664-7 | B. HORIZONTE   |
| CELIA   | F    | 77558-5 | NITEROI        |
| CLARA   | F    | 99754-7 | B. HORIZONTE   |
| JOAO    | M    | 98547-6 | RIO DE JANEIRO |
| JOAO    | M    | 86695-6 | RIO DE JANEIRO |
| JORGE   | M    | 88657-5 | B. HORIZONTE   |
+---------+------+---------+----------------+

/*ORDENACAO POR NOME E CPF A TABELA CLIENTE*/
/*PROJECAO*/
SELECT NOME, SEXO, CPF, CIDADE
FROM CLIENTE
/*JUNCAO*/
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
ORDER BY NOME, CPF ASC;

+---------+------+---------+----------------+
| NOME    | SEXO | CPF     | CIDADE         |
+---------+------+---------+----------------+
| ANA     | F    | 75658-5 | SAO PAULO      |
| ANTONIO | M    | 78558-6 | RIO DE JANEIRO |
| CARLOS  | M    | 86664-7 | B. HORIZONTE   |
| CELIA   | F    | 77558-5 | NITEROI        |
| CLARA   | F    | 99754-7 | B. HORIZONTE   |
| JOAO    | M    | 86695-6 | RIO DE JANEIRO |
| JOAO    | M    | 98547-6 | RIO DE JANEIRO |
| JORGE   | M    | 88657-5 | B. HORIZONTE   |
+---------+------+---------+----------------+

/*ORDENACAO POR NUMERO DA COLUNA*/
/*PROJECAO*/
SELECT NOME, SEXO, CPF, CIDADE
FROM CLIENTE
/*JUNCAO*/
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
ORDER BY 4;

+---------+------+---------+----------------+
| NOME    | SEXO | CPF     | CIDADE         |
+---------+------+---------+----------------+
| CARLOS  | M    | 86664-7 | B. HORIZONTE   |
| CLARA   | F    | 99754-7 | B. HORIZONTE   |
| JORGE   | M    | 88657-5 | B. HORIZONTE   |
| CELIA   | F    | 77558-5 | NITEROI        |
| JOAO    | M    | 98547-6 | RIO DE JANEIRO |
| JOAO    | M    | 86695-6 | RIO DE JANEIRO |
| ANTONIO | M    | 78558-6 | RIO DE JANEIRO |
| ANA     | F    | 75658-5 | SAO PAULO      |
+---------+------+---------+----------------+
















