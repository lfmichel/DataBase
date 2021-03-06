/*PROJETO OFICINA*/
/*
1-CRIAR BANCO DE DADOS CHAMADO PROJETO OFICINA E CONECTAR-SE AO BANCO.
2-FACA A SEGUINTE MODELAGEM:

	SENHOR JOSE QUER MODERNIZAR A SUA OFICINA, E POR ENQUANTO, CADASTRAR OS CARROS QUE ENTRAM
	PARA REALIZAR SERVICOS E OS SEUS RESPECTIVOS DONOS, SENHOR JOSE MENCIONOU QUE CADA CLIENTE
	POSSUI APENAS UM CARRO. UM CARRO POSSUI UMA MARCA. SENHOR JOSE TAMBEM QUER SABER AS
	CORES DOS CARROS PARA TER IDEIA DE QUAL TINTA COMPRAR, E INFORMAR QUE UM CARRO PODE TER
	MAIS DE UMA COR. SENHOR JOSE NECESSITA ARMAZENAR OS TELEFONES DOS CLIENTES, MAS NAO QUER
	QUE ELES SEJAM OBRIGATORIOS.
*/

/*--------------------------------------------------------------------------------------------*/
/*MODELAGEM CONCEITUAL*/
BANCO DE DADOS OFICINA

TABELA CLIENTE
	NOME CARACTER(30)
	SEXO CARACTER(1)
	CPF NUMERICO(15)

TABELA TELEFONE 
	TIPO CARACTER(3)
	NUMERO NUMERICO(15)
	
TABELA CARRO	
	MARCA CARACTER(20)
	COR CARACTER (10)
	PLACA ALFANUMERICO(8)

/*--------------------------------------------------------------------------------------------*/
/*MODELAGEM LOGICA - BRMODELO*/

/*--------------------------------------------------------------------------------------------*/
/*MODELAGEM FISICA - SCRIPT BANCO DADOS*/

BANCO DE DADOS - OFICINA

CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE CLIENTE
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	CPF VARCHAR(15) UNIQUE NOT NULL,
	
CREATE TABLE TELEFONE
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','CEL','COM'),
	NUMERO VARCHAR(15),
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
	
CREATE TABLE CARRO	
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(30),
	COR VARCHAR(15),
	PLACA VARCHAR(8) UNIQUE NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
