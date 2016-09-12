
--Materia visão do aluno:
--idturma-nomedisciplina-horainicial-horafinal(calculada)-diadasemana-letra-vagas

CREATE OR REPLACE VIEW vDisciplinasEmOferta AS
	SELECT tu.idturma, d.nome, th.horario, (th.horario + th.duracao) AS horariofim, th.diaDasemana, tu.letra, tu.vagas
	FROM turma AS tu, disciplina AS d, turmahorario AS th
	WHERE tu.idturma = th.idturma AND tu.coddisciplina = d.codigodisciplina;  
	
--Plano de Ensino (visão do aluno):
--nomedisciplina-nomeprofessor-situacao-letra-ano-semestre-vagas

CREATE OR REPLACE VIEW vPlanoDeEnsino AS
	SELECT d.nome AS Disciplina,tu.letra, tu.ano, tu.semestre, tu.vagas, pde.estado, 
	pe.nome AS Professor FROM disciplina AS d, planodeensino AS pde, turma AS tu, 
		docente AS doc, servidor AS se, pessoa AS pe
	WHERE tu.coddisciplina = d.codigodisciplina AND tu.idturma = pde.idturma 
		AND doc.SIAPE = pde.SIAPE AND doc.SIAPE = se.SIAPE AND se.CPF = pe.CPF; 
	
--Docentes com cargo administrativo atualmente:
--SIAPE-nomedocente-departamento-posicao-tipodocente-datainicio-cargoadministrativocorrente

CREATE OR REPLACE VIEW vDocenteCargoAdministrativo AS
	SELECT d.siape, pe.nome AS Docente, de.nome AS Departamento, dca.periodo_inicio AS iniciodomandato,
	 d.tipo_docente, dca.nome_cargo
	FROM docente AS d, pessoa AS pe, docente_cargo_administrativo as dca,
		departamento AS de, servidor AS se
	WHERE (dca.periodo_termino <= CURRENT DATE OR dca.periodo_termino = NULL)
		AND d.siape = dca.siape 
		AND d.sigla_d = de.sigla
		AND d.SIAPE = se.SIAPE AND se.CPF = pe.CPF; 
	
--Membros que participaram de um conselho:
--nome-siape/RA-portariadeindicacao-telefone-docente/discente/TA-representacao

	 	 
-- siape-nome-telefone-cpf-email-endereco (servidor+pessoa)
CREATE OR REPLACE VIEW vContatosServidor AS
	SELECT s.siape, pe.nome, pe.cpf, pe.endereco_cidade, pe.endereco_bairro,
	pe.endereco_numero, pe.endereco_logradouro, pe.endereco_complemento, pe.endereco_cep
	FROM SERVIDOR AS s, PESSOA AS PE
	WHERE s.cpf = pe.cpf;
	
--Membros que participaram de um conselho:
--nome-siape/RA-portariadeindicacao-telefone-docente/discente/TA-representacao