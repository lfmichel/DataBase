/*MODELAGEM*/
/*MODELAGEM CONCEITUAL*/
/*CRIANDO DATABASE*/
	DATABASE PROJETO1;

/*CRIANDO TABELA*/
	TABELA CLIENTE1
		NOME VARCHAR(30)
		ENDERECO VARCHAR (100)
		TELEFONE INT (11)
	
/*MODELAGEM LOGICA*/
/*CRIANDO A TABELA NO BRMODELO*/
	ARQUIVO SALVO COMO PROJETO1 EM BRMODELO
	
/*MODELAGEM FISICA*/
/*SCRIPT DO BANCO DE DADOS*/

/*CRIANDO O BANCO DE DADOS*/
	CREATE DATABASE PROJETO1;

/*CONECTANDO AO BANCO DE DADOS*/
	USE PROJETO1;
	
/*CRIANDO A TABELA E OS ATRIBUTOS*/
	CREATE TABLE CLIENTE1(
		NOME VARCHAR(30),
		ENDERECO VARCHAR(100),
		TELEFONE VARCHAR(30)
	);


	

