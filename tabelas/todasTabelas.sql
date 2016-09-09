DROP TABLE CONSELHODEDEPARTAMENTO;
DROP TABLE CONSELHO;
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
DROP TABLE PESSOA;

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
	PRIMARY KEY(CPF)
);

CREATE TABLE SERVIDOR(
	CPF CHAR(11) NOT NULL,
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
	nome char(20),
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
	SIAPE CHAR(6) NOT NULL,
	PERIODO_INICIO DATE NOT NULL,
	PERIODO_TERMINO DATE,
	NOME_CARGO VARCHAR(30) NOT NULL,
	FOREIGN KEY (SIAPE) REFERENCES DOCENTE(SIAPE),
	PRIMARY KEY (SIAPE, PERIODO_INICIO, NOME_CARGO)
);

create table disciplina(
	codigoDisciplina char(6) not null,
	creditosPraticos int not null,
	creditosTeoricos int not null,
	siglaDepartamento varchar(5) not null,
	nome varchar(50) not null,
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
	codDisciplina CHAR(4) NOT NULL,
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
	estado VARCHAR(5) NOT NULL,
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

create table revisao(
	siape char(6) not null,
	pe_estado varchar(5) not null, -- Estado do Plano de Ensino
	idturma integer not null,	
	parecer char(20),
	r_estado varchar(5), -- Estado da revisão do plano de ensino
	dataDeRevisao date,
	primary key(siape, pe_estado, idturma),
	foreign key (siape, pe_estado, idTurma) references planoDeEnsino(siape, estado, idTurma)
);

CREATE TABLE CONSELHO(
	CODIGOCONSELHO   VARCHAR(10)     NOT NULL,
  	TIPO  INTEGER NOT NULL,
  	PRIMARY KEY(CODIGOCONSELHO)
);
  
CREATE TABLE CONSELHODEDEPARTAMENTO(
	CODIGOCONSELHO   VARCHAR(10)     NOT NULL,
  	SIGLA   CHAR(10)     NOT NULL,
  	FOREIGN KEY (CODIGOCONSELHO) references CONSELHO(CODIGOCONSELHO),
  	FOREIGN KEY (SIGLA) references DEPARTAMENTO(SIGLA),
  	PRIMARY KEY(CODIGOCONSELHO)
);
