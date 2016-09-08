drop table disciplina;
CREATE TABLE disciplina
(
	codigoDaDisciplina char(6) not null,
	creditosPraticos int not null,
	creditosTeoricos int not null,
	siglaDepartamento char(10) not null,
	
	constraint fk_sigla_departamento foreign key(siglaDepartamento) references departamento (sigla),
	
	primary key (codigoDaDisciplina)
);

drop table departamento;
create table departamento(
	sigla char(10) not null,
	centroAcademico char(20),
	nome char(20),
	primary key(sigla)
);

drop table revisa;
create table revisa(
	dataDeRevisao date not null,
	parecer char(20),
	
	siape char(20), /*chave estrangeira de docente*/
	estado char(20),/*chave estrangeira de plano de ensino*/
	
	primary key(dataDeRevisao) /*,*/
	
	/*foreign key(siape) references docente(siape), //docente eh de outra pessoa*/
	/*foreign key(estado) references planoDeEnsino(estado) //plano de ensino eh de outra pessoa*/
);
