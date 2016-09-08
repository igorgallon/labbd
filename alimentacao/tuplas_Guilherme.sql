DROP TABLE TURMA;
DROP TABLE TURMAHORARIO;
DROP TABLE PLANODEENSINO;

CREATE TABLE TURMA 
(
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
	PRIMARY KEY(idTurma)
	--FOREIGN KEY (codDisciplina) REFERENCES DISCIPLINA (codDisciplina)
);

CREATE TABLE PLANODEENSINO
(
	SIAPE CHAR(6) NOT NULL,
	estado VARCHAR(5) NOT NULL,
	idTurma INTEGER NOT NULL,
	PRIMARY KEY (SIAPE, estado, idTurma),
	FOREIGN KEY (idTurma) REFERENCES TURMA (idTurma),
	FOREIGN KEY (SIAPE) REFERENCES DOCENTE (SIAPE)
);

-- PLANODEENSINO(PK(FK_DOCENTE(CPF,SILUS), FK_TURMA(codDisciplina, letra, ano, semestre), estado))

CREATE TABLE TURMAHORARIO
(
	idTurma INTEGER NOT NULL,
	horario TIME NOT NULL,
	duracao INTEGER NOT NULL,
	localizacao VARCHAR(30),
	diaDaSemana VARCHAR(3) NOT NULL,
	PRIMARY KEY(idTurma, horario, diaDaSemana),
	FOREIGN KEY (idTurma) REFERENCES TURMA (idTurma)
);

-- TURMA(PK(FK_DISCIPLINA(codDisciplina), letra, ano, semestre))
-- TURMAHORARIO(PK(FK_TURMA(codDisciplina, letra, ano, semestre), horario, diaDaSemana), vagas, localizacao)

