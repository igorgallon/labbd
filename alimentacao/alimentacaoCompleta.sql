INSERT INTO PESSOA 
	(CPF, RG, NOME, ENDERECO_CIDADE, ENDERECO_BAIRRO, ENDERECO_NUMERO, 
	ENDERECO_LOGRADOURO, ENDERECO_COMPLEMENTO, ENDERECO_CEP) 
VALUES ('00000000001', '000000001', 'João Souza', 'Araraquara', 
       'Jardim Azul', 01, 'Rua José Silva', NULL, '00000001'),
       ('00000000002', '000000002', 'Tomas Leão', 'São Carlos', 
       'Jardim Romano', 115, 'Avenida Marechal Costa', NULL, '00000002'),
       ('00000000003', '000000003', 'Maria Josefina', 'São Carlos', 
       'Cidade Vermelha', 34, 'Rua Silva José', NULL, '00000003'),
       ('12345678910', '274882768', 'Ana Maria', 'Ibaté', 
       'Vila Itália', 247, 'Rua XV de Novembro', NULL, '31524896'),
       ('10987654321', '178934565', 'Carlos Lebre', 'São Carlos', 
       'Centro', 845, 'Rua José Silva', '5° Andar', '13347798'),
       ('24246468610', '893111475', 'Fábio Trello', 'Ibaté', 
       'Vila Itália', 497, 'Rua XV de Novembro', '13° Andar', '31524896'),
       ('13135357509', '744563125', 'Carla Leão', 'São Carlos', 
       'Jardim Romano', 115, 'Avenida Marechal Costa', NULL, '00000002'),
       ('10293847566', '224753985', 'John João', 'São Carlos', 
       'Jardim Romano', 1150, 'Avenida Almirante Machado', NULL, '46655523'),
       ('56473829105', '441525367', 'Renato Augustino', 'Araraquara', 
       'Jardim Azul', 2145, 'Avenida Marechal Costa', NULL, '00000002'),
       ('12825651201', '426652139', 'Fernando Rocha', 'São Carlos', 
       'Centro', 500, 'Avenida Central', 'Térreo', '21365354'),
       ('10020030010', '289167819', 'Johann Bach', 'Ribeirao Preto', 
       'Jardim Feliz', 112, 'Rua das Felicidades', NULL, '13573009'),
       ('11021031011', '927251927', 'Manoel de Barros', 'São Carlos', 
       'Vila da Amizade', 48, 'Rua da Ostentacao', NULL, '13356290'),
       ('12022032012', '118338290', 'Amancio de Oliveira', 'Ibaté', 
       'Jardim Paulista', 1124, 'Rua dois', NULL, '11345190'),
       ('13023033013', '182649277', 'Maria da Silva Souza', 'São Carlos', 
       'Vila Monteiro', 9, 'Rua Dona Alexandrina ', NULL, '13360270'),
       ('14024034014', '223716289', 'Inacio Pereira', 'Araraquara', 
       'Centro', 998, 'Rua Pindamonhangaba', '6° Andar', '11918189'),
       ('15025035015', '181726229', 'Domenico Scarlatti', 'Ibaté', 
       'Vila Italiana', 80, 'Rua das Sonatas', NULL, '12289090'),
       ('16026036016', '098262722', 'Anna Magdalena Bach', 'São Carlos', 
       'Jardim Alemão', 1673, 'Rua dos compositores', NULL, '78456219'),
       ('17027037017', '882819310', 'João Mário da Silva', 'Ibaté', 
       'Centro', 12, 'Avenida dos campeoes', '3º Andar', '13456040'),
       ('18028038018', '121231234', 'Adriana Calcanhoto', 'Araraquara', 
       'Jardim Musical', 100, 'Rua das Borboletas', NULL, '11278900'),
       ('19029039019', '827191118', 'Pompeu Pomposo', 'São Carlos', 
       'Vila Prado', 280, 'Avenida Ra Tim Bum', NULL, '98981020');

INSERT INTO CONSELHO(CODIGOCONSELHO,TIPO)
VALUES	('CDE41AF12', 'DEPARTAMENTO'),
		('CDE3FKAS12', 'GRADUACAO'),
		('CDE4BCDAQ', 'DEPARTAMENTO'),
		('A3E6FKAS12', 'GRADUACAO'),
		('3ABA01L69F', 'DEPARTAMENTO'),
		('APEO254MLA', 'DEPARTAMENTO'),
		('LKMN548T94', 'DEPARTAMENTO');

INSERT INTO MEMBRO
VALUES	('15025035015', 'CDE41AF12', '10', 'TA', 'No. 123'),
		('16026036016', 'CDE41AF12', '10', 'TA', 'No. 122'),
		('00000000001', 'CDE41AF12', '18', 'DOCENTE', 'No. 142'),
		('00000000002', 'CDE41AF12', '18', 'DOCENTE', 'No. 192'),
		('00000000003', 'CDE41AF12', '18', 'DOCENTE', 'No. 109'),

		('17027037017', 'CDE3FKAS12', '04', 'TA', 'No. 11'),
		('18028038018', 'CDE3FKAS12', '04', 'TA', 'No. 11'),
		('12345678910', 'CDE3FKAS12', '13', 'DOCENTE', 'No. 09'),
		('10987654321', 'CDE3FKAS12', '13', 'DOCENTE', 'No. 100'),
		('24246468610', 'CDE3FKAS12', '13', 'DOCENTE', 'No. 201'),
		
		('00000000002', 'CDE4BCDAQ', '18', 'DOCENTE', 'No. 192'),
		('00000000003', 'CDE4BCDAQ', '18', 'DOCENTE', 'No. 109'),
		('12345678910', 'CDE4BCDAQ', '13', 'DOCENTE', 'No. 09'),
		('10987654321', 'CDE4BCDAQ', '13', 'DOCENTE', 'No. 100'),
		('15025035015', 'CDE4BCDAQ', '10', 'TA', 'No. 123'),
		
		('13135357509', 'A3E6FKAS12', '12', 'DOCENTE', 'No. 192'),
		('56473829105', 'A3E6FKAS12', '08', 'DOCENTE', 'No. 118'),
		('12825651201', 'A3E6FKAS12', '12', 'DOCENTE', 'No. 107'),
		('18028038018', 'A3E6FKAS12', '40', 'TA', 'No. 101'),
		('19029039019', 'A3E6FKAS12', '41', 'TA', 'No. 102'),
		
		('12825651201', '3ABA01L69F', '12', 'DOCENTE', 'No. 107'),
		('18028038018', '3ABA01L69F', '40', 'TA', 'No. 101'),
		('00000000003', '3ABA01L69F', '18', 'DOCENTE', 'No. 109'),
		('19029039019', '3ABA01L69F', '41', 'TA', 'No. 102'),
		('10987654321', '3ABA01L69F', '13', 'DOCENTE', 'No. 100'),
		
		('10020030010', 'APEO254MLA', '10', 'DOCENTE',  'No. 80'),
		('11021031011', 'APEO254MLA', '20', 'DOCENTE',  'No. 81'),
		('12022032012', 'APEO254MLA', '21', 'DOCENTE',  'No. 81'),
		('19029039019', 'APEO254MLA', '11', 'TA', 'No. 481'),
		('18028038018', 'APEO254MLA', '12', 'TA', 'No. 109'),
		
		('15025035015', 'LKMN548T94', '10', 'TA', 'No. 123'),
		('17027037017', 'LKMN548T94', '04', 'TA', 'No. 11'),
		('00000000002', 'LKMN548T94', '18', 'DOCENTE', 'No. 192'),
		('13135357509', 'LKMN548T94', '12', 'DOCENTE', 'No. 192'),
		('12825651201', 'LKMN548T94', '12', 'DOCENTE', 'No. 107');
		
INSERT INTO SERVIDOR (CPF, SIAPE)
VALUES	('00000000001', '000001'),
		('00000000002', '000002'),
		('00000000003', '000003'),
		('12345678910', '000004'),
		('10987654321', '000005'),
		('24246468610', '000006'),
		('13135357509', '000007'),
		('56473829105', '000008'),
		('12825651201', '000009'),
		('10020030010', '000010'),
		('11021031011', '000011'),
		('12022032012', '000012'),
		('13023033013', '000013'),
		('14024034014', '000014'),
		('15025035015', '000015'),
		('16026036016', '000016'),
		('17027037017', '000017'),
		('18028038018', '000018'),
		('19029039019', '000019');

INSERT INTO TAS (SIAPE)
VALUES	('000015'),
		('000016'),
		('000017'),
		('000018'),
		('000019');
		
insert into departamento(sigla, centroAcademico, nome)
values
		('DC', 'CCET', 'Departamento de Computacao'),
		('DM', 'CCET', 'Departamento de Matemática'),
		('DF', 'CCET', 'Departamento de Física'),
		('DQ', 'CCET', 'Departamento de Química');
		
INSERT INTO DOCENTE 
	(SIAPE, POSICAO, TIPO_DOCENTE, TOTAL_CARGA_SEMESTRE, SIGLA_D)
VALUES 	('000001', 'PROFESSOR', 'ADJUNTO', 8, 'DC'),
		('000002', 'PROFESSOR COORDENADOR','TITULAR', 6, 'DM'),
		('000003', 'PROFESSOR CHEFE DPTO', 'ADJUNTO', 0, 'DF'),
		('000004', 'PROFESSOR', 'ASSOCIADO', 4, 'DQ'),
		('000005', 'PROFESSOR', 'TITULAR', 6, 'DC'),
		('000008', 'PROFESSOR COORDENADOR', 'ADJUNTO', 4, 'DQ');
INSERT INTO DOCENTE
	(SIAPE, POSICAO, TIPO_DOCENTE, TOTAL_CARGA_SEMESTRE, TIPO_LICENCA, PRAZO_LICENCA, SIGLA_D)
	VALUES	('000006', 'PROFESSOR COORDENADOR', 'TITULAR', 8, 'PREMIO', 15, 'DC'),
			('000007', 'PROFESSOR', 'ASSOCIADO', 8, 'PREMIO', 20, 'DF');
INSERT INTO DOCENTE 
	(SIAPE, POSICAO, TIPO_DOCENTE, TOTAL_CARGA_SEMESTRE, RAZAO_ALIVIO, CARGA_HORARIA_ALIVIO, SIGLA_D)
	VALUES	('000009', 'PROFESSOR', 'TITULAR', 4, 'RECOMENDACAO MEDICA', 2, 'DM'),
			('000010', 'PROFESSOR CHEFE DPTO', 'TITULAR', 4, 'ATIVIDADES CHEFIA', 4, 'DF'),
			('000012', 'PROFESSOR COORDENADOR', 'ASSOCIADO', 8, 'RECOMENDACAO MEDICA', 2, 'DF');	
INSERT INTO DOCENTE 
	(SIAPE, POSICAO, TIPO_DOCENTE, TOTAL_CARGA_SEMESTRE, TIPO_LICENCA, PRAZO_LICENCA, RAZAO_ALIVIO, CARGA_HORARIA_ALIVIO, SIGLA_D)
	VALUES	('000011', 'PROFESSOR', 'ADJUNTO', 8, 'PREMIO', 10, 'RECOMENDACAO MEDICA', 2, 'DQ');
INSERT INTO DOCENTE 
	(SIAPE, POSICAO, TIPO_DOCENTE, TOTAL_CARGA_SEMESTRE, TIPO_LICENCA, PRAZO_LICENCA, SIGLA_D)
	VALUES	('000013', 'PROFESSOR', 'ASSOCIADO', 6, 'PREMIO', 30, 'DM'),
			('000014', 'PROFESSOR', 'ASSOCIADO', 8, 'MEDICA', 7, 'DC');
	
INSERT INTO DOCENTE_CARGO_ADMINISTRATIVO
	(SIAPE, PERIODO_INICIO, PERIODO_TERMINO, NOME_CARGO)
	VALUES('000002','2014-03-01', '2016-02-28','COORDENADOR CURSO');
INSERT INTO DOCENTE_CARGO_ADMINISTRATIVO
	(SIAPE, PERIODO_INICIO, PERIODO_TERMINO, NOME_CARGO)
	VALUES('000002','2015-08-12', '2016-09-05','PRESIDENTE CONSELHO GRAD');
INSERT INTO DOCENTE_CARGO_ADMINISTRATIVO
	(SIAPE, PERIODO_INICIO, PERIODO_TERMINO, NOME_CARGO)
	VALUES('000003','2012-08-10','2013-09-01','CHEFE DEPARTAMENTO');
INSERT INTO DOCENTE_CARGO_ADMINISTRATIVO
	(SIAPE, PERIODO_INICIO, PERIODO_TERMINO, NOME_CARGO)
	VALUES('000003','2008-03-14','2009-04-16','COORDENADOR CURSO');
INSERT INTO DOCENTE_CARGO_ADMINISTRATIVO
	(SIAPE, PERIODO_INICIO, NOME_CARGO)
	VALUES('000006','2015-11-01','COORDENADOR CURSO');
INSERT INTO DOCENTE_CARGO_ADMINISTRATIVO
	(SIAPE, PERIODO_INICIO, PERIODO_TERMINO, NOME_CARGO)
	VALUES('000008','2010-07-02','2012-07-03','COORDENADOR CURSO');
INSERT INTO DOCENTE_CARGO_ADMINISTRATIVO
	(SIAPE, PERIODO_INICIO, PERIODO_TERMINO, NOME_CARGO)
	VALUES('000010','2013-04-17','2014-06-28','CHEFE DEPARTAMENTO');
INSERT INTO DOCENTE_CARGO_ADMINISTRATIVO
	(SIAPE, PERIODO_INICIO, NOME_CARGO)
	VALUES('000012','2016-04-10','COORDENADOR CURSO');

insert into disciplina(codigoDisciplina, creditosPraticos, creditosTeoricos, siglaDepartamento)
values (020338, 0, 4, 'DC','Introdução a Lógica'), --intro a logica
(089109, 0, 4, 'DM','Cálculo I'), --calculo i
(099015, 0, 4, 'DF','Física I'), --fisica i
(071170, 0, 4, 'DQ','Fundamentos de Química'); --fundamentos de quimica

INSERT INTO TURMA VALUES 
   (DEFAULT, '1000','A', '2016', '1',50);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1000','B', '2016', '1',50);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1000','C', '2016', '1',50);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1001','A', '2016', '1',30);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1002','A', '2016', '1',90);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1003','A', '2015', '2',30);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1003','B', '2015', '2',30);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1003','C', '2015', '2',30);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1003','D', '2015', '2',30);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1150','A', '2015', '1',50);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1151','A', '2016', '1',60);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1151','B', '2016', '1',60);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1004','A', '2016', '1',30);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1005','A', '2016', '2',35);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1005','B', '2016', '2',35);
INSERT INTO TURMA VALUES 
   (DEFAULT, '1005','C', '2016', '2',35);
INSERT INTO TURMA VALUES 
   (DEFAULT, '0800','A', '2015', '1',45);
INSERT INTO TURMA VALUES 
   (DEFAULT, '0800','B', '2015', '1',45); 
INSERT INTO TURMA VALUES 
   (DEFAULT, '0900','A', '2015', '2',30);
INSERT INTO TURMA VALUES 
   (DEFAULT, '0900','B', '2015', '2',30);

INSERT INTO PLANODEENSINO VALUES 
	('000001','APROV','1250');
INSERT INTO PLANODEENSINO VALUES 
	('000001','APROV','1251');
INSERT INTO PLANODEENSINO VALUES 
	('000001','REPRO','1252');
INSERT INTO PLANODEENSINO VALUES 
	('000002','APROV','1253');
INSERT INTO PLANODEENSINO VALUES 
	('000003','REPRO','1254');
INSERT INTO PLANODEENSINO VALUES 
	('000004','REPRO','1255');
INSERT INTO PLANODEENSINO VALUES 
	('000004','APROV','1256');
INSERT INTO PLANODEENSINO VALUES 
	('000004','APROV','1257');
INSERT INTO PLANODEENSINO VALUES 
	('000004','APROV','1258');
INSERT INTO PLANODEENSINO VALUES 
	('000005','APROV','1259');
INSERT INTO PLANODEENSINO VALUES 
	('000006','REPRO','1260');
INSERT INTO PLANODEENSINO VALUES 
	('000006','REPRO','1261');
INSERT INTO PLANODEENSINO VALUES 
	('000007','APROV','1262');
INSERT INTO PLANODEENSINO VALUES 
	('000008','REPRO','1263');
INSERT INTO PLANODEENSINO VALUES 
	('000009','APROV','1264');
INSERT INTO PLANODEENSINO VALUES 
	('000009','REPRO','1265');
INSERT INTO PLANODEENSINO VALUES 
	('000010','APROV','1266');
INSERT INTO PLANODEENSINO VALUES 
	('000010','APROV','1267');
INSERT INTO PLANODEENSINO VALUES 
	('000011','APROV','1268');
INSERT INTO PLANODEENSINO VALUES 
	('000012','REPRO','1269');

INSERT INTO TURMAHORARIO VALUES
	('1250',TIME('14.00.00'),2,'AT8','seg'); 
INSERT INTO TURMAHORARIO VALUES
	('1250',TIME('14.00.00'),2,'AT8','ter'); 
INSERT INTO TURMAHORARIO VALUES
	('1251',TIME('08.00.00'),4,'AT10','sex'); 
INSERT INTO TURMAHORARIO VALUES
	('1252',TIME('14.00.00'),4,'AT8','qua'); 
INSERT INTO TURMAHORARIO VALUES
	('1253',TIME('10.00.00'),2,'AT4','qui'); 
INSERT INTO TURMAHORARIO VALUES
	('1254',TIME('14.00.00'),4,'DC','seg'); 
INSERT INTO TURMAHORARIO VALUES
	('1255',TIME('16.00.00'),2,'AT5','seg'); 
INSERT INTO TURMAHORARIO VALUES
	('1255',TIME('14.00.00'),2,'AT6','qua'); 
INSERT INTO TURMAHORARIO VALUES
	('1256',TIME('14.00.00'),4,'AT2','seg'); 
INSERT INTO TURMAHORARIO VALUES
	('1257',TIME('10.00.00'),2,'AT5','qui'); 
INSERT INTO TURMAHORARIO VALUES
	('1258',TIME('14.00.00'),4,'AT4','ter'); 
INSERT INTO TURMAHORARIO VALUES
	('1259',TIME('08.00.00'),2,'AT9','qua'); 
INSERT INTO TURMAHORARIO VALUES
	('1259',TIME('14.00.00'),2,'AT9','qui'); 
INSERT INTO TURMAHORARIO VALUES
	('1260',TIME('10.00.00'),2,'AT4','ter'); 
INSERT INTO TURMAHORARIO VALUES
	('1261',TIME('08.00.00'),4,'AT10','sex');
INSERT INTO TURMAHORARIO VALUES
	('1262',TIME('10.00.00'),2,'AT1','seg'); 
INSERT INTO TURMAHORARIO VALUES
	('1262',TIME('16.00.00'),2,'AT1','ter'); 
INSERT INTO TURMAHORARIO VALUES
	('1263',TIME('14.00.00'),4,'AT7','sex'); 
INSERT INTO TURMAHORARIO VALUES
	('1264',TIME('16.00.00'),2,'AT7','ter'); 
INSERT INTO TURMAHORARIO VALUES
	('1265',TIME('08.00.00'),4,'AT6','qui');
INSERT INTO TURMAHORARIO VALUES
	('1266',TIME('10.00.00'),2,'AT9','seg'); 
INSERT INTO TURMAHORARIO VALUES
	('1267',TIME('14.00.00'),2,'AT10','seg'); 
INSERT INTO TURMAHORARIO VALUES
	('1267',TIME('08.00.00'),2,'AT10','qui'); 
INSERT INTO TURMAHORARIO VALUES
	('1268',TIME('14.00.00'),2,'AT9','ter'); 
INSERT INTO TURMAHORARIO VALUES
	('1269',TIME('14.00.00'),2,'AT9','ter');


INSERT INTO CONSELHODEDEPARTAMENTO(CODIGOCONSELHO,SIGLA)
VALUES('CDE41AF12','DC');
INSERT INTO CONSELHODEDEPARTAMENTO(CODIGOCONSELHO,SIGLA)
VALUES('CDE4BCDAQ','DM');
INSERT INTO CONSELHODEDEPARTAMENTO(CODIGOCONSELHO,SIGLA)
VALUES('3ABA01L69F','DF');
INSERT INTO CONSELHODEDEPARTAMENTO(CODIGOCONSELHO,SIGLA)
VALUES('APEO254MLA','DQ');
INSERT INTO CONSELHODEDEPARTAMENTO(CODIGOCONSELHO,SIGLA)
VALUES('LKMN548T94','DM');

	
	
