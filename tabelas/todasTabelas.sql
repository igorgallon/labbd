DROP TABLE PROPOE; -- FALTA INSERT
DROP TABLE ITEM_DE_PAUTA;
DROP TABLE REUNIAO;
DROP TABLE RECESSO;
DROP TABLE ATIVIDADE;
DROP TABLE CALENDARIO;
DROP TABLE ITEM; -- FALTA INSERT
DROP TABLE VISITA; -- FALTA INSERT
DROP TABLE RECONHECIMENTO; -- FALTA INSERT
DROP TABLE DISCENTE_CURSOU_TURMA;
DROP TABLE DISCENTE_INSCREVE_TURMA;
DROP TABLE DISCENTE_PRESENCIAL;
DROP TABLE DISCENTE_EAD;
DROP TABLE DISCENTE;
DROP TABLE ENADE_AVALIA_CURSO;
DROP TABLE ENADE;
DROP TABLE CURSO;
DROP TABLE CONSELHODEDEPARTAMENTO;
DROP TABLE REVISAO;
DROP TABLE TURMAHORARIO;
DROP TABLE PLANODEENSINO;
DROP TABLE TURMA;
DROP TABLE REQUISITOS;
DROP TABLE DISCIPLINA;
DROP TABLE DOCENTE_CARGO_ADMINISTRATIVO;
DROP TABLE DOCENTE;
DROP TABLE DEPARTAMENTO;
DROP TABLE TAS;
DROP TABLE SERVIDOR;
DROP TABLE MEMBRO;
DROP TABLE CONSELHO;
DROP TABLE PESSOA;

CREATE OR REPLACE SEQUENCE ITEM_DE_PAUTA_SEQ AS INT START WITH 1 INCREMENT BY 1;

CREATE TABLE PESSOA(
	CPF VARCHAR(11) NOT NULL, 
	RG VARCHAR(9), 
	NOME VARCHAR(30), 
	ENDERECO_CIDADE VARCHAR(20), 
	ENDERECO_BAIRRO VARCHAR(20), 
	ENDERECO_NUMERO INTEGER, 
	ENDERECO_LOGRADOURO VARCHAR(50), 
	ENDERECO_COMPLEMENTO VARCHAR(10),
	ENDERECO_CEP VARCHAR(8),
	EMAIL1 VARCHAR(30),
	EMAIL2 VARCHAR(30),
	TELEFONE1 VARCHAR(11),
	TELEFONE2 VARCHAR(11),
	TELEFONE3 VARCHAR(11),
	PRIMARY KEY(CPF)
);

CREATE TABLE CONSELHO(
	CODIGOCONSELHO  INTEGER NOT NULL GENERATED ALWAYS
		AS IDENTITY
		(START WITH 10
		INCREMENT BY 1
		MINVALUE 10
		NO MAXVALUE 
		NO CYCLE 
		NO CACHE
		ORDER),
  	TIPO  VARCHAR(12) NOT NULL, -- PODE SER CONSELHO DE GRADUAÇÃO OU DE DEPARTAMENTO
  	PRIMARY KEY(CODIGOCONSELHO)
);

CREATE TABLE MEMBRO(
	IDMEMBRO  INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	NO MAXVALUE
	NO CYCLE
	NO CACHE
	ORDER
	),
	CPF VARCHAR(11) NOT NULL, 
	CODIGO_CONSELHO INTEGER NOT NULL, 
	NRO_PORTARIA_INDICACAO VARCHAR(20) NOT NULL, 
	REPRESENTACAO VARCHAR(20), -- Grupo que representa: Docente, discente, TA
	DOCUMENTO_POSSE VARCHAR(20),
	PRIMARY KEY (IDMEMBRO),
	UNIQUE (CPF, CODIGO_CONSELHO, NRO_PORTARIA_INDICACAO), 
	FOREIGN KEY (CPF)  REFERENCES Pessoa (CPF),
	FOREIGN KEY (CODIGO_CONSELHO) REFERENCES CONSELHO(CODIGOCONSELHO)
);

CREATE TABLE SERVIDOR(
	CPF VARCHAR(11) NOT NULL,
	SIAPE CHAR(6) NOT NULL,
	PRIMARY KEY (SIAPE),
	FOREIGN KEY (CPF) REFERENCES PESSOA(CPF)
);

CREATE TABLE TAS(
	SIAPE CHAR(6) NOT NULL,
	FOREIGN KEY (SIAPE) REFERENCES SERVIDOR(SIAPE),
	PRIMARY KEY (SIAPE)
);

create table departamento(
	sigla varchar(5) not null,
	centroAcademico char(20),
	nome char(30),
	primary key (sigla)
);

CREATE TABLE DOCENTE(
	SIAPE CHAR(6) NOT NULL,
	POSICAO VARCHAR(30) NOT NULL,
	TIPO_DOCENTE VARCHAR(30) NOT NULL,
	TOTAL_CARGA_SEMESTRE INT,
	TIPO_LICENCA VARCHAR(20),
	PRAZO_LICENCA INT,
	RAZAO_ALIVIO VARCHAR(40),
	CARGA_HORARIA_ALIVIO INT,
	SIGLA_D CHAR(10) NOT NULL, -- Sigla do Departamento ao qual o Docente esta vinculado
	FOREIGN KEY (SIGLA_D) REFERENCES DEPARTAMENTO (SIGLA),
	FOREIGN KEY (SIAPE) REFERENCES SERVIDOR(SIAPE),
	PRIMARY KEY (SIAPE)
);

CREATE TABLE DOCENTE_CARGO_ADMINISTRATIVO(
    IDCARGO  INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	NO MAXVALUE
	NO CYCLE
	NO CACHE
	ORDER
	),
	SIAPE CHAR(6) NOT NULL,
	PERIODO_INICIO DATE NOT NULL,
	PERIODO_TERMINO DATE,
	NOME_CARGO VARCHAR(30) NOT NULL,
	FOREIGN KEY (SIAPE) REFERENCES DOCENTE(SIAPE),
	UNIQUE (SIAPE, PERIODO_INICIO, NOME_CARGO),
	PRIMARY KEY(IDCARGO)
);

create table disciplina(
	codigoDisciplina char(6) not null,
	creditosPraticos int not null,
	creditosTeoricos int not null,
	siglaDepartamento varchar(5) not null,
	nome varchar(30) not null,
	foreign key (siglaDepartamento) references departamento(sigla),
	primary key (codigoDisciplina)
);

create table requisitos(
	codigoDisciplina char(6) not null,
	codigoRequisito char(6) not null,
	tipoRequisito integer, -- 0: pre-requisito, 1: co-requisito
	foreign key (codigoDisciplina) references disciplina(codigoDisciplina),
	primary key (codigoDisciplina, codigoRequisito)
);

CREATE TABLE TURMA(
	idTurma INTEGER NOT NULL GENERATED ALWAYS
		AS IDENTITY
		(START WITH 1250
		INCREMENT BY 1
		MINVALUE 1250
		NO MAXVALUE 
		NO CYCLE 
		NO CACHE
		ORDER),
	codDisciplina CHAR(6) NOT NULL,
	letra CHAR NOT NULL,
	ano CHAR(4) NOT NULL,
	semestre CHAR(1) NOT NULL,
	vagas INTEGER,
	UNIQUE(codDisciplina, letra, ano, semestre),
	PRIMARY KEY(idTurma),
	FOREIGN KEY (codDisciplina) REFERENCES DISCIPLINA (codigoDisciplina)
);

CREATE TABLE PLANODEENSINO(
	SIAPE CHAR(6) NOT NULL,
	estado VARCHAR(9) NOT NULL,
	idTurma INTEGER NOT NULL,
	PRIMARY KEY (SIAPE, estado, idTurma),
	FOREIGN KEY (idTurma) REFERENCES TURMA (idTurma),
	FOREIGN KEY (SIAPE) REFERENCES DOCENTE (SIAPE)
);

CREATE TABLE TURMAHORARIO(
	idTurma INTEGER NOT NULL,
	horario TIME NOT NULL,
	duracao INTEGER NOT NULL,
	localizacao VARCHAR(30),
	diaDaSemana VARCHAR(3) NOT NULL,
	PRIMARY KEY(idTurma, horario, diaDaSemana),
	FOREIGN KEY (idTurma) REFERENCES TURMA (idTurma)
);

CREATE TABLE REVISAO(
	siape char(6) not null,
	pe_estado varchar(9) not null, -- Estado do Plano de Ensino
	idturma integer not null,	
	parecer char(20),
	r_estado varchar(9), -- Estado da revisão do plano de ensino
	dataDeRevisao date,
	primary key(siape, pe_estado, idturma),
	foreign key (siape, pe_estado, idTurma) references planoDeEnsino(siape, estado, idTurma)
);
  
CREATE TABLE CONSELHODEDEPARTAMENTO(
	CODIGOCONSELHO   INTEGER     NOT NULL,
  	SIGLA   CHAR(10)     NOT NULL,
  	FOREIGN KEY (CODIGOCONSELHO) references CONSELHO(CODIGOCONSELHO),
  	FOREIGN KEY (SIGLA) references DEPARTAMENTO(SIGLA),
  	PRIMARY KEY(CODIGOCONSELHO)
);

CREATE TABLE CURSO(
	CODIGO_CURSO INTEGER NOT NULL GENERATED ALWAYS
		AS IDENTITY
		(START WITH 10
		INCREMENT BY 1
		MINVALUE 10
		NO MAXVALUE 
		NO CYCLE 
		NO CACHE
		ORDER),
	NOME VARCHAR(30) NOT NULL,
	CREDITOS_TOTAL_OPT INT NOT NULL,
	CREDITOS_TOTAL_OBR INT NOT NULL,
	PRIMARY KEY(CODIGO_CURSO)
);

CREATE TABLE Enade
(
	PERIODO_ENADE VARCHAR(4) NOT NULL,
	PRIMARY KEY (PERIODO_ENADE)
);

CREATE TABLE Enade_Avalia_Curso
(
	ID_ENADEAVALIACURSO INTEGER NOT NULL GENERATED ALWAYS
	AS IDENTITY
	(START WITH 1
		INCREMENT BY 1
		MINVALUE 1
		NO MAXVALUE 
		NO CYCLE 
		NO CACHE
	ORDER),
	PERIODO_ENADE VARCHAR(4) NOT NULL,
	CODIGO_CURSO INTEGER NOT NULL,
	RESULTADO_ENADE DOUBLE NOT NULL,
	UNIQUE (PERIODO_ENADE, CODIGO_CURSO, RESULTADO_ENADE),
	PRIMARY KEY (ID_ENADEAVALIACURSO),
	FOREIGN KEY (CODIGO_CURSO) REFERENCES Curso (CODIGO_CURSO),
	FOREIGN KEY (PERIODO_ENADE) REFERENCES Enade (PERIODO_ENADE)
);

CREATE TABLE DISCENTE (
    RA INTEGER NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    IRA INTEGER,
    DATA_CREDENCIAMENTO DATE NOT NULL,
    DATA_REALIZACAO DATE,
    ESTADO_ENADE VARCHAR(13),
    PERIODO_ENADE VARCHAR(4),
    PRIMARY KEY (RA),
    FOREIGN KEY (CPF) REFERENCES PESSOA (CPF),
    FOREIGN KEY (PERIODO_ENADE) REFERENCES ENADE (PERIODO_ENADE)
);

CREATE TABLE DISCENTE_EAD (
    RA INTEGER NOT NULL,
    PRIMARY KEY (RA),
    FOREIGN KEY (RA) REFERENCES DISCENTE (RA)
);

CREATE TABLE DISCENTE_PRESENCIAL (
    RA INTEGER NOT NULL,
    PRIMARY KEY (RA),
    FOREIGN KEY (RA) REFERENCES DISCENTE (RA)
);

CREATE TABLE discente_inscreve_turma
(
	ra INTEGER NOT NULL,
	idturma INTEGER NOT NULL,
	deferido VARCHAR(5) NOT NULL,
	dataInscricao DATE NOT NULL,
	PRIMARY KEY (ra, idturma),
	FOREIGN KEY (ra) REFERENCES discente(ra),
	FOREIGN KEY (idturma) REFERENCES turma(idturma)
);

CREATE TABLE discente_cursou_turma
(
	ra INTEGER NOT NULL,
	idturma INTEGER NOT NULL,
	nota DOUBLE NOT NULL,
	situacao VARCHAR(9) NOT NULL,
	frequencia DOUBLE NOT NULL,
	PRIMARY KEY (ra, idturma),
	FOREIGN KEY (ra) REFERENCES discente(ra),
	FOREIGN KEY (idturma) REFERENCES turma(idturma)
);

CREATE TABLE RECONHECIMENTO (
    COD_RECONHECIMENTO INTEGER NOT NULL,
    PRIMARY KEY(COD_RECONHECIMENTO)
);

CREATE TABLE VISITA (
    DATA_VISITA DATE NOT NULL,
    COMITE VARCHAR(20) NOT NULL,
    COD_RECONHECIMENTO INTEGER NOT NULL,
    PRIMARY KEY (DATA_VISITA),
    FOREIGN KEY (COD_RECONHECIMENTO) REFERENCES RECONHECIMENTO (COD_RECONHECIMENTO)
);

CREATE TABLE ITEM (
    FASE INTEGER NOT NULL,
    DESCRICAO VARCHAR(100) NOT NULL,
    COD_RECONHECIMENTO INTEGER NOT NULL,
    PRIMARY KEY (FASE, COD_RECONHECIMENTO),
    FOREIGN KEY (COD_RECONHECIMENTO) REFERENCES RECONHECIMENTO (COD_RECONHECIMENTO)
);

CREATE TABLE CALENDARIO(
	data_de_submissao DATE not null,
	nome_semestre varchar(10),
	inicio_semestre date,
	fim_semestre date,
	estado varchar(30),
	tipo integer,
	primary key (data_de_submissao)
);

CREATE TABLE ATIVIDADE(
	codigo CHAR(30) NOT NULL,
  	descricao VARCHAR(300) NOT NULL,
  	data_de_submissao_calendario DATE NOT NULL,
  	inicio DATE,
  	fim DATE,
  	responsaveis VARCHAR(30), 
  	FOREIGN KEY(data_de_submissao_calendario) REFERENCES CALENDARIO(data_de_submissao),
  	PRIMARY KEY(data_de_submissao_calendario, codigo)
);

CREATE TABLE RECESSO
(data_de_submissao     DATE 			 NOT NULL,
 abrangencia           VARCHAR(80)       NOT NULL,
 descricao             VARCHAR(80)       NOT NULL,
 inicio                DATE              NOT NULL,
 fim                   DATE              NOT NULL,
 FOREIGN KEY (data_de_submissao) REFERENCES CALENDARIO(data_de_submissao),
 PRIMARY KEY(data_de_submissao, abrangencia, inicio)
);

create table REUNIAO(
	data_reuniao date not null, 
	numero_reuniao int not null,
	primary key(numero_reuniao)
);


CREATE TABLE ITEM_DE_PAUTA (
	numero_pauta		INT			NOT NULL,
	numero_reuniao		INT			NOT NULL,
	descricao 			VARCHAR(1000)		NOT NULL,
	data_item_de_pauta	DATE						,
	status_pauta		VARCHAR(50)			NOT NULL,
	documentos 			VARCHAR(300)				,
	FOREIGN KEY(numero_reuniao) REFERENCES REUNIAO (numero_reuniao),
	PRIMARY KEY(numero_pauta, numero_reuniao)
);

CREATE TABLE PROPOE
(   
    ID_PROPOE  INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(
        START WITH 1
        INCREMENT BY 1
        MINVALUE 1
        NO MAXVALUE
        NO CYCLE
        NO CACHE
        ORDER),
    NRO_PAUTA INTEGER NOT NULL,
    NRO_REUNIAO INTEGER NOT NULL,
    CPF VARCHAR(11) NOT NULL,  
    NRO_PORTARIA_INDICACAO VARCHAR(20) NOT NULL,
    CODIGO_CONSELHO INTEGER NOT NULL,
    DATA_APROVACAO DATE, 
    DESCRICAO VARCHAR(400),
    PRIMARY KEY (ID_PROPOE),
    FOREIGN KEY (NRO_PAUTA, NRO_REUNIAO) REFERENCES ITEM_DE_PAUTA (NUMERO_PAUTA, NUMERO_REUNIAO),
    FOREIGN KEY (CPF, NRO_PORTARIA_INDICACAO, CODIGO_CONSELHO)
    	REFERENCES MEMBRO (CPF, NRO_PORTARIA_INDICACAO, CODIGO_CONSELHO)
);
