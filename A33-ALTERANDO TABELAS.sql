/*A33 - ALTERANDO TABELAS*/
/*CRIAR TABELA TABELA*/
CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| COLUNA1 | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2 | varchar(30) | YES  |     | NULL    |       |
| COLUNA3 | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+

/*APRENDEMOS A CRIAR TABELAS COM A PK NA PRIMEIRA COLUNA*/
/*NO EXEMPLO ACIMA NAO FIZEMOS ASSIM, COMO ADICIONAR POSTERIORMENTE*/
/*COMANDO ALTER*/
/*ADICIONANDO UMA PK*/
ALTER TABLE TABELA
ADD PRIMARY KEY(COLUNA1);

/*A DIFERENCA DE FAZER POR DENTRO DA TABELA E O AUTO INCREMENTO*/
/*FAZENDO O PK POR FORA DA TABELA NAO TEMOS A OPCAO DE AUTO INCREMENTO*/

CREATE TABLE TABELA1(
	COLUNA1 INT PRIMARY KEY AUTO_INCREMENT,
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| COLUNA1 | int(11)     | NO   | PRI | NULL    | auto_increment |
| COLUNA2 | varchar(30) | YES  |     | NULL    |                |
| COLUNA3 | varchar(30) | YES  |     | NULL    |                |
+---------+-------------+------+-----+---------+----------------+

/*ADICIONANDO COLUNA SEM POSICAO, ULTIMA COLUNA*/
/*POR PADRAO A COLUNA FICA NA ULTIMA POSICAO*/

ALTER TABLE TABELA
ADD COLUNA VARCHAR(30);

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| COLUNA1 | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2 | varchar(30) | YES  |     | NULL    |       |
| COLUNA3 | varchar(30) | YES  |     | NULL    |       |
| COLUNA  | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+

/*ADICIONANDO OUTRA COLUNA NA TABELA, SEM POSICAO*/

ALTER TABLE TABELA
ADD COLUNA100 INT;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| COLUNA1   | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2   | varchar(30) | YES  |     | NULL    |       |
| COLUNA3   | varchar(30) | YES  |     | NULL    |       |
| COLUNA    | varchar(30) | YES  |     | NULL    |       |
| COLUNA100 | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

/*ADICIONANDO COLUNA COM POSICAO*/

ALTER TABLE TABELA
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| COLUNA1   | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2   | varchar(30) | YES  |     | NULL    |       |
| COLUNA3   | varchar(30) | YES  |     | NULL    |       |
| COLUNA4   | varchar(30) | NO   | UNI | NULL    |       |
| COLUNA    | varchar(30) | YES  |     | NULL    |       |
| COLUNA100 | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

/*MODIFICANDO O TIPO DE UM CAMPO*/
ALTER TABLE TABELA
MODIFY COLUNA2 DATE NOT NULL;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| COLUNA1   | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2   | date        | NO   |     | NULL    |       |
| COLUNA3   | varchar(30) | YES  |     | NULL    |       |
| COLUNA4   | varchar(30) | NO   | UNI | NULL    |       |
| COLUNA    | varchar(30) | YES  |     | NULL    |       |
| COLUNA100 | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

/*RENOMEAR O NOME DA TABELA DE TABELA PARA PESSOA*/
ALTER TABLE TABELA
RENAME PESSOA;

/*TABELA PESSOA - ANTIGA TABELA TABELA*/
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| COLUNA1   | varchar(30) | NO   | PRI | NULL    |       |
| COLUNA2   | date        | NO   |     | NULL    |       |
| COLUNA3   | varchar(30) | YES  |     | NULL    |       |
| COLUNA4   | varchar(30) | NO   | UNI | NULL    |       |
| COLUNA    | varchar(30) | YES  |     | NULL    |       |
| COLUNA100 | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

/*CRIAR UMA TABELA CHAMADA TIME*/
CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

/*TABELA TIME*/
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDTIME    | int(11)     | NO   | PRI | NULL    | auto_increment |
| TIME      | varchar(30) | YES  |     | NULL    |                |
| ID_PESSOA | varchar(30) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

/*ADICIONANDO FK NA TABELA TIME*/
ALTER TABLE TIME
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

/*TABELA TIME DEPOIS DE INSERIR A FK*/
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDTIME    | int(11)     | NO   | PRI | NULL    | auto_increment |
| TIME      | varchar(30) | YES  |     | NULL    |                |
| ID_PESSOA | varchar(30) | YES  | MUL | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

/*INFORMACOES DETALHADAS DA TABELA*/
SHOW CREATE TABLE PESSOA;

+--------+-------------------------------------------+
| Table  | Create Table                                                                                                                                                                                                                                                                                                                             |
+--------+-------------------------------------------+
| PESSOA | CREATE TABLE `pessoa` (
  `COLUNA1` varchar(30) NOT NULL,
  `COLUNA2` date NOT NULL,
  `COLUNA3` varchar(30) DEFAULT NULL,
  `COLUNA4` varchar(30) NOT NULL,
  `COLUNA` varchar(30) DEFAULT NULL,
  `COLUNA100` int(11) DEFAULT NULL,
  PRIMARY KEY (`COLUNA1`),
  UNIQUE KEY `COLUNA4` (`COLUNA4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+--------+-------------------------------------------+