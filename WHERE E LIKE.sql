/*FILTRANDO DADOS COM WHERE E LIKE*/

	SELECT NOME, TELEFONE, FROM CLIENTE;
	
/*FILTRNADO*/

	SELECT NOME, SEXO FROM CLIENTE
	WHERE SEXO = 'M';
	
	SELECT NOME, SEXO FROM CLIENTE
	WHERE SEXO = 'F';
	
	SELECT NOME, SEXO FROM CLIENTE
	WHERE ENDERECO = 'RJ';
	
/*UTILIZANDO O LIKE*/

	SELECT NOME, SEXO FROM CLIENTE
	WHERE ENDERECO LIKE 'RJ';
	
/*CARACTER CORINGA (%) PORCENTAGEM*/

	SELECT NOME, SEXO FROM CLIENTE
	WHERE ENDERECO LIKE '%RJ';
	
	SELECT NOME, SEXO, ENDERECO FROM CLIENTE
	WHERE ENDERECO LIKE '%RJ';
	
	SELECT NOME, SEXO, ENDERECO FROM CLIENTE
	WHERE ENDERECO LIKE '%CENTRO%';