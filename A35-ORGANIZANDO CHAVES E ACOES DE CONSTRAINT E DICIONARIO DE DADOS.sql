/*A35 - ORGANIZANDO CHAVES E ACOES DE CONSTRAINT*/

/*SHOW TABLES*/
SHOW TABLES;

/*APAGANDO ALGUMAS TABELAS DO BANCO DE DADOS*/
DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

/*CRIA-SE AS TABELAS SEM AS CHAVES E DEPOIS POR FORA SAO CRIADAS AS CHAVES*/
/*CRIA-SE PRIMEIRO AS TABELAS E DEPOIS OS CONSTRAINTS*/
/*SCRIPT COM CREATE TABLE E DEPOIS COM ALTER TABLE*/

/*CRIANDO A TABELA CLIENTE*/

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| IDCLIENTE | int(11)     | YES  |     | NULL    |       |
| NOME      | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

/*CRIANDO A TABELA TELEFONE*/

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| IDTELEFONE | int(11)     | YES  |     | NULL    |       |
| TIPO       | char(3)     | NO   |     | NULL    |       |
| NUMERO     | varchar(10) | NO   |     | NULL    |       |
| ID_CLIENTE | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

/*CRIACAO DE CONSTRAINT*/
/*ALTERAR A TABELA INSERINDO UMA PK*/

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| IDCLIENTE | int(11)     | NO   | PRI | NULL    |       |
| NOME      | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

/*ALTERAR A TABELA INSERINDO UMA FK*/

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| IDTELEFONE | int(11)     | YES  |     | NULL    |       |
| TIPO       | char(3)     | NO   |     | NULL    |       |
| NUMERO     | varchar(10) | NO   |     | NULL    |       |
| ID_CLIENTE | int(11)     | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+

/*MOSTRANDO A TABELA CLIENTE COM DETALHES*/

SHOW CREATE TABLE CLIENTE;

+---------+-----------------------------------------------------------------------------------------+
| Table   | Create Table                                                                                                                                             |
+---------+-----------------------------------------------------------------------------------------+
| CLIENTE | CREATE TABLE `cliente` (
  `IDCLIENTE` int(11) NOT NULL,
  `NOME` varchar(30) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+---------+-----------------------------------------------------------------------------------------+

/*MOSTRANDO A TABELA TELEFONE COM DETALHES*/

SHOW CREATE TABLE TELEFONE;

+----------+----------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                                                                                                                      |
+----------+----------------------------------------------------------------------------------------+
| TELEFONE | CREATE TABLE `telefone` (
  `IDTELEFONE` int(11) DEFAULT NULL,
  `TIPO` char(3) NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  KEY `FK_CLIENTE_TELEFONE` (`ID_CLIENTE`),
  CONSTRAINT `FK_CLIENTE_TELEFONE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`IDCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+----------+----------------------------------------------------------------------------------------+ 

/*DICIONARIO DE DADOS*/
/*SHOW DATABASES*/
/*DICIONARIO DE DADOS GUARDAM OS METADADOS, QUE SAO OS DADOS DOS DADOS*/
SHOW DATABASES;

/*OBJETOS SAO ARMAZENADOS EM DIRETORIOS DENTRO DO DICIONARIO DE DADOS*/
+--------------------+
| Database           |
+--------------------+
| information_schema | /*BANCO DO DICIONARIO DE DADOS*/
| comercio           |
| farmacia           |
| loja               |
| mercearia          |
| mysql              | /*BANCO DO DICIONARIO DE DADOS*/
| padaria            |
| performance_schema | /*BANCO DO DICIONARIO DE DADOS*/ 
| projeto            |
| projeto1           |
| projeto2           |
| sys                |
+--------------------+

/*PROCURANDO CONSTRAINTS NOS DICIONARIOS DE DADOS*/

/*CONECTAR AO BANCO DO DICIONARIO DE DADOS - information_schema*/
USE INFORMATION_SCHEMA;

/*PARA VISUALIZAR A DATABASE ATUAL, UTILIZAMOS O COMANDO STATUS*/
STATUS

/*VISAO DO COMANDO STATUS*/
--------------
C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe  Ver 14.14 Distrib 5.7.20, for Win64 (x86_64)

Connection id:          3
Current database:       information_schema /*DATABASE ATUAL*/
Current user:           root@localhost
SSL:                    Not in use
Using delimiter:        ;
Server version:         5.7.20-log MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 23 hours 56 min 35 sec

Threads: 1  Questions: 82  Slow queries: 0  Opens: 132  Flush tables: 1  Open tables: 108  Queries per second avg: 0.000
--------------

/*DESCOBRIR QUAIS AS TABELAS DO BANCO DO DICIONARIO DE DADOS REQUISITADO*/
/*TABELAS DA INFORMATION_SCHEMA*/
/*PARA PROCURAR TABELAS EM BANCO DE DADOS NO MYSQL, DEVEMOS ENTRAR NO
 BANDO DE DADOS E PROCUARA AS TABELAS QUE QUEREMOS*/
 /*VAMOS PROCURAR ALGUMA TABELA RELACIONADA COM CONSTRAINTS*/
 /*DEVEMOS ACHAR A TABELA TABLE_CONSTRAINTS*/
 
 /*COMANDO SHOW TABLES*/
 SHOW TABLES;
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
| TABLE_CONSTRAINTS                     | /*TABELA DAS CONSTRAINTS*/
| TABLE_PRIVILEGES                      |
| TRIGGERS                              |
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

/*VAMOS DESCREVER OS ARGUMENTOS DA TABELA TABLE_CONSTRAINTS - UTILIZE DESC TABLE_CONSTRAINTS*/
DESC TABLE_CONSTRAINTS;

+--------------------+--------------+------+-----+---------+-------+
| Field              | Type         | Null | Key | Default | Extra |
+--------------------+--------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(512) | NO   |     |         |       |
| CONSTRAINT_SCHEMA  | varchar(64)  | NO   |     |         |       | /*QUERO SABER O BANCO DE DADOS*/
| CONSTRAINT_NAME    | varchar(64)  | NO   |     |         |       | /*QUERO SABER O NOME DA CONSTRAINT*/
| TABLE_SCHEMA       | varchar(64)  | NO   |     |         |       |
| TABLE_NAME         | varchar(64)  | NO   |     |         |       | /*QUERO SABER O NOME DA TABELA ONDE ESTA A CONSTRAINT*/
| CONSTRAINT_TYPE    | varchar(64)  | NO   |     |         |       | /*QUERO SABER O TIPO DA CONSTRAINT*/
+--------------------+--------------+------+-----+---------+-------+

/*CONSTRUINDO A QUERY PARA O BANCO DO DICIONARIO DE DADOS - TABLE_CONSTRAINTS*/
SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS;
 
 /*RESULTADO DA QUERY PARA AS TABELAS DO BANCO DO DICIONARIO DE DADOS - TABLE_CONSTRAINTS*/
+----------+---------------------------+-------------+
| BANCO    | TABELA                    | TIPO        |
+----------+---------------------------+-------------+
| comercio | cliente                   | PRIMARY KEY |
| comercio | cliente1                  | PRIMARY KEY |
| comercio | cursos                    | PRIMARY KEY |
| comercio | jogador                   | PRIMARY KEY |
| comercio | pessoa                    | PRIMARY KEY |
| comercio | pessoa                    | UNIQUE      |
| comercio | tabela1                   | PRIMARY KEY |
| comercio | telefone                  | FOREIGN KEY |
| comercio | time                      | PRIMARY KEY |
| comercio | time                      | FOREIGN KEY |
| comercio | times                     | PRIMARY KEY |
| comercio | times                     | FOREIGN KEY |
| comercio | vendedores                | PRIMARY KEY |
| farmacia | cliente                   | PRIMARY KEY |
| farmacia | cliente                   | UNIQUE      |
| farmacia | cliente                   | UNIQUE      |
| farmacia | endereco                  | PRIMARY KEY |
| farmacia | endereco                  | FOREIGN KEY |
| farmacia | telefone                  | PRIMARY KEY |
| farmacia | telefone                  | FOREIGN KEY |
| loja     | cliente                   | PRIMARY KEY |
| loja     | cliente                   | UNIQUE      |
| loja     | cliente                   | UNIQUE      |
| loja     | endereco                  | PRIMARY KEY |
| loja     | endereco                  | FOREIGN KEY |
| loja     | telefone                  | PRIMARY KEY |
| loja     | telefone                  | FOREIGN KEY |
| mysql    | columns_priv              | PRIMARY KEY |
| mysql    | db                        | PRIMARY KEY |
| mysql    | engine_cost               | PRIMARY KEY |
| mysql    | event                     | PRIMARY KEY |
| mysql    | func                      | PRIMARY KEY |
| mysql    | gtid_executed             | PRIMARY KEY |
| mysql    | help_category             | PRIMARY KEY |
| mysql    | help_category             | UNIQUE      |
| mysql    | help_keyword              | PRIMARY KEY |
| mysql    | help_keyword              | UNIQUE      |
| mysql    | help_relation             | PRIMARY KEY |
| mysql    | help_topic                | PRIMARY KEY |
| mysql    | help_topic                | UNIQUE      |
| mysql    | innodb_index_stats        | PRIMARY KEY |
| mysql    | innodb_table_stats        | PRIMARY KEY |
| mysql    | ndb_binlog_index          | PRIMARY KEY |
| mysql    | plugin                    | PRIMARY KEY |
| mysql    | proc                      | PRIMARY KEY |
| mysql    | procs_priv                | PRIMARY KEY |
| mysql    | proxies_priv              | PRIMARY KEY |
| mysql    | server_cost               | PRIMARY KEY |
| mysql    | servers                   | PRIMARY KEY |
| mysql    | slave_master_info         | PRIMARY KEY |
| mysql    | slave_relay_log_info      | PRIMARY KEY |
| mysql    | slave_worker_info         | PRIMARY KEY |
| mysql    | tables_priv               | PRIMARY KEY |
| mysql    | time_zone                 | PRIMARY KEY |
| mysql    | time_zone_leap_second     | PRIMARY KEY |
| mysql    | time_zone_name            | PRIMARY KEY |
| mysql    | time_zone_transition      | PRIMARY KEY |
| mysql    | time_zone_transition_type | PRIMARY KEY |
| mysql    | user                      | PRIMARY KEY |
| padaria  | cliente                   | PRIMARY KEY |
| padaria  | cliente                   | UNIQUE      |
| padaria  | cliente                   | UNIQUE      |
| padaria  | endereco                  | PRIMARY KEY |
| padaria  | endereco                  | FOREIGN KEY |
| padaria  | telefone                  | PRIMARY KEY |
| padaria  | telefone                  | FOREIGN KEY |
| sys      | sys_config                | PRIMARY KEY |
+----------+---------------------------+-------------+

/*CRIANDO A QUERY PARA FILTRAR A TABELA TABLE_CONSTRAINTS, PARA TRAZER APENAS A INFORMACAO DO PROJETO COMERCIO*/
/*QUERY COM A SELECAO DO PROJETO COMERCIO*/
SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

/*RESULTADO*/
+----------+------------+-------------+
| BANCO    | TABELA     | TIPO        |
+----------+------------+-------------+
| comercio | cliente    | PRIMARY KEY |
| comercio | cursos     | PRIMARY KEY |
| comercio | jogador    | PRIMARY KEY |
| comercio | pessoa     | PRIMARY KEY |
| comercio | pessoa     | UNIQUE      |
| comercio | telefone   | FOREIGN KEY |
| comercio | time       | PRIMARY KEY |
| comercio | time       | FOREIGN KEY |
| comercio | times      | PRIMARY KEY |
| comercio | times      | FOREIGN KEY |
| comercio | vendedores | PRIMARY KEY |
+----------+------------+-------------+
/*CRIANDO A QUERY PARA INSERIR O CAMPO CONSTRAINT_NAME*/
SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS "NOME REGRA",
	   CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

/*RESULTADO*/
+----------+------------+---------------------+-------------+
| BANCO    | TABELA     | NOME REGRA          | TIPO        |
+----------+------------+---------------------+-------------+
| comercio | cliente    | PRIMARY             | PRIMARY KEY |
| comercio | cursos     | PRIMARY             | PRIMARY KEY |
| comercio | jogador    | PRIMARY             | PRIMARY KEY |
| comercio | pessoa     | PRIMARY             | PRIMARY KEY |
| comercio | pessoa     | COLUNA4             | UNIQUE      |
| comercio | telefone   | FK_CLIENTE_TELEFONE | FOREIGN KEY |
| comercio | time       | PRIMARY             | PRIMARY KEY |
| comercio | time       | time_ibfk_1         | FOREIGN KEY |
| comercio | times      | PRIMARY             | PRIMARY KEY |
| comercio | vendedores | PRIMARY             | PRIMARY KEY |
+----------+------------+---------------------+-------------+

/*APAGANDO CONSTRAINTS - FK_CLIENTE_TELEFONE - LOCALIZADA NA TABELA TELEFONE DO BANCO DE DADOS COMERCIO*/
/*ANTES DEVEMOS ALTERAR PARA O BANCO DE DADOS COMERCIO*/
USE COMERCIO;

/*QUERY PARA APAGAR A CONSTRAINT DA TABELA TELEFONE DO BANCO DE DADOS COMERCIO*/
ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

/*RECONSTRUINDO A CONSTRAINT FK_CLIENTE_TELEFONE*/
ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE 
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

/*PARA INSERIR 1 MILHAO DE DADOS EM UMA TABELA COM CHAVE ESTRANGEIRA,
DEVEMOS RETIRAR A CHAVE ESTRANGEIRA (DROP), INSERIR OS 1 MILHAO DE DADOS
NA TABELA, E DEPOIS CRIAR NOVAMENTE A CHAE ESTRANGEIRA, PARA TERMOS A INTEGRIDADE REFERENCIAL.
DEVEMOS VERIFICAR POSTERIORMENTE QUAIS REGISTROS (ID) TEMOS NA TABELA PRINCIPAL E NA TABELA ESTRANGEIRA*/

/*ACOES DE CONSTRAINTS FICOU PARA A PROXIMA AULA*/