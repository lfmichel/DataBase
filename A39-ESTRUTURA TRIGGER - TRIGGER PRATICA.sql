/*A39 - ENTENDENDO TRIGGERS*/

/*ESTRUTURA DE TRIGGER*/

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

		QUALQUER COMANDO SQL
		
END -> FIM

/*DISPARA O GATILHO ANTES OU DEPOIS DE UM INSERT, DELETE OU UPDATE*/

/*FALANDO SOBRE DICIONARIO DE DADOS*/

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| comercio           |
| farmacia           |
| loja               |
| mercearia          |
| mysql              |
| oficina            |
| padaria            |
| performance_schema |
| projeto            |
| projeto1           |
| projeto2           |
| sys                |
+--------------------+

/*ABRINDO O INFORMATION SCHEMA*/
/*O MYSQL `E CASE SENSITIVE PARA O LINUX E NAO PARA O WINDOWS*/

USE INFORMATION_SCHEMA;

/*SHOW TABLES PARA INFORMATION_SCHEMA*/

+---------------------------------------+
| Tables_in_information_schema          |
+---------------------------------------+
| CHARACTER_SETS                        |
| COLLATIONS                            |
| COLLATION_CHARACTER_SET_APPLICABILITY |
| COLUMNS                               |
| COLUMN_PRIVILEGES                     |
| ENGINES                               |
| EVENTS                                |
| FILES                                 |
| GLOBAL_STATUS                         |
| GLOBAL_VARIABLES                      |
| KEY_COLUMN_USAGE                      |
| OPTIMIZER_TRACE                       |
| PARAMETERS                            |
| PARTITIONS                            |
| PLUGINS                               |
| PROCESSLIST                           |
| PROFILING                             |
| REFERENTIAL_CONSTRAINTS               |
| ROUTINES                              |
| SCHEMATA                              |
| SCHEMA_PRIVILEGES                     |
| SESSION_STATUS                        |
| SESSION_VARIABLES                     |
| STATISTICS                            |
| TABLES                                |
| TABLESPACES                           |
| TABLE_CONSTRAINTS                     |
| TABLE_PRIVILEGES                      |
| TRIGGERS                              | /*TABELA CHAMADA TRIGGERS*/
| USER_PRIVILEGES                       |
| VIEWS                                 |
| INNODB_LOCKS                          |
| INNODB_TRX                            |
| INNODB_SYS_DATAFILES                  |
| INNODB_FT_CONFIG                      |
| INNODB_SYS_VIRTUAL                    |
| INNODB_CMP                            |
| INNODB_FT_BEING_DELETED               |
| INNODB_CMP_RESET                      |
| INNODB_CMP_PER_INDEX                  |
| INNODB_CMPMEM_RESET                   |
| INNODB_FT_DELETED                     |
| INNODB_BUFFER_PAGE_LRU                |
| INNODB_LOCK_WAITS                     |
| INNODB_TEMP_TABLE_INFO                |
| INNODB_SYS_INDEXES                    |
| INNODB_SYS_TABLES                     |
| INNODB_SYS_FIELDS                     |
| INNODB_CMP_PER_INDEX_RESET            |
| INNODB_BUFFER_PAGE                    |
| INNODB_FT_DEFAULT_STOPWORD            |
| INNODB_FT_INDEX_TABLE                 |
| INNODB_FT_INDEX_CACHE                 |
| INNODB_SYS_TABLESPACES                |
| INNODB_METRICS                        |
| INNODB_SYS_FOREIGN_COLS               |
| INNODB_CMPMEM                         |
| INNODB_BUFFER_POOL_STATS              |
| INNODB_SYS_COLUMNS                    |
| INNODB_SYS_FOREIGN                    |
| INNODB_SYS_TABLESTATS                 |
+---------------------------------------+

/*DESCREVENDO A TABELA TRIGGERS DENTRO DA DATABASE INFORMATION_SCHEMA*/

DESC TRIGGERS;

/*CAMPOS DA TABELA TRIGGERS*/
+----------------------------+---------------+------+-----+---------+-------+
| Field                      | Type          | Null | Key | Default | Extra |
+----------------------------+---------------+------+-----+---------+-------+
| TRIGGER_CATALOG            | varchar(512)  | NO   |     |         |       |
| TRIGGER_SCHEMA             | varchar(64)   | NO   |     |         |       |
| TRIGGER_NAME               | varchar(64)   | NO   |     |         |       |
| EVENT_MANIPULATION         | varchar(6)    | NO   |     |         |       |
| EVENT_OBJECT_CATALOG       | varchar(512)  | NO   |     |         |       |
| EVENT_OBJECT_SCHEMA        | varchar(64)   | NO   |     |         |       |
| EVENT_OBJECT_TABLE         | varchar(64)   | NO   |     |         |       |
| ACTION_ORDER               | bigint(4)     | NO   |     | 0       |       |
| ACTION_CONDITION           | longtext      | YES  |     | NULL    |       |
| ACTION_STATEMENT           | longtext      | NO   |     | NULL    |       |
| ACTION_ORIENTATION         | varchar(9)    | NO   |     |         |       |
| ACTION_TIMING              | varchar(6)    | NO   |     |         |       |
| ACTION_REFERENCE_OLD_TABLE | varchar(64)   | YES  |     | NULL    |       |
| ACTION_REFERENCE_NEW_TABLE | varchar(64)   | YES  |     | NULL    |       |
| ACTION_REFERENCE_OLD_ROW   | varchar(3)    | NO   |     |         |       |
| ACTION_REFERENCE_NEW_ROW   | varchar(3)    | NO   |     |         |       |
| CREATED                    | datetime(2)   | YES  |     | NULL    |       |
| SQL_MODE                   | varchar(8192) | NO   |     |         |       |
| DEFINER                    | varchar(93)   | NO   |     |         |       |
| CHARACTER_SET_CLIENT       | varchar(32)   | NO   |     |         |       |
| COLLATION_CONNECTION       | varchar(32)   | NO   |     |         |       |
| DATABASE_COLLATION         | varchar(32)   | NO   |     |         |       |
+----------------------------+---------------+------+-----+---------+-------+

/*___________________________________________________________________________*/

/*TRIGGER NA PRATICA - AULA 48 DO CURSO*/

CREATE DATABASE AULA40;

USE AULA40;

/*TABELA USUARIO*/

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);

+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| IDUSUARIO | int(11)      | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)  | YES  |     | NULL    |                |
| LOGIN     | varchar(30)  | YES  |     | NULL    |                |
| SENHA     | varchar(100) | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+

/*TABELA BKP USUARIO*/

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDBACKUP  | int(11)     | NO   | PRI | NULL    | auto_increment |
| IDUSUARIO | int(11)     | YES  |     | NULL    |                |
| NOME      | varchar(30) | YES  |     | NULL    |                |
| LOGIN     | varchar(30) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

/*CRIANDO A TRIGGER*/
/*ALTERANDO O DELIMITER PARA $*/

DELIMITER $

/*TRIGGER BACKUP USER*/

CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN

	INSERT INTO BKP_USUARIO VALUES
	(NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);
		
END
$

/*RETORNANDO O DELIMITER PARA ;*/

DELIMITER ;

/*INSERINDO DADOS NA TABELA USUARIO*/

+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| IDUSUARIO | int(11)      | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)  | YES  |     | NULL    |                |
| LOGIN     | varchar(30)  | YES  |     | NULL    |                |
| SENHA     | varchar(100) | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+


INSERT INTO USUARIO VALUES(NULL, 'ANDRADE', 'ANDRADE2009', 'HEXACAMPEAO');

+-----------+---------+-------------+-------------+
| IDUSUARIO | NOME    | LOGIN       | SENHA       |
+-----------+---------+-------------+-------------+
|         1 | ANDRADE | ANDRADE2009 | HEXACAMPEAO |
+-----------+---------+-------------+-------------+

/*DELETAR USUARIO DA TABELA USUARIO*/

DELETE FROM USUARIO WHERE IDUSUARIO = 1;

/*SELECT NA TABELA BKP_USUARIO*/

SELECT * FROM BKP_USUARIO;