
--Materia visão do aluno:
--idturma-nomedisciplina-horainicial-horafinal(calculada)-diadasemana-letra-vagas
-- ESSA � DO GUILHEME
CREATE OR REPLACE VIEW vDisciplinasEmOferta AS
	SELECT tu.idturma, d.nome, th.horario, (th.horario + th.duracao*3600) AS horariofim, 
	th.diaDasemana, tu.letra, tu.vagas, d.creditospraticos + d.creditosteoricos AS Nro_de_creditos
	FROM turma AS tu, disciplina AS d, turmahorario AS th
	WHERE tu.idturma = th.idturma AND tu.coddisciplina = d.codigodisciplina;  
	

--=======
-- Plano de Ensino (vis�o do aluno):
-- nomedisciplina-nomeprofessor-situacao-letra-ano-semestre-vagas
-- ESSA � DO P�O
-- >>>>>>> 13aacc60cac706d370e0abb7a86b22c6f5e310eb

CREATE OR REPLACE VIEW vPlanoDeEnsino AS
	SELECT d.nome AS Disciplina,d.codigodisciplina, tu.letra, tu.ano, tu.semestre, tu.vagas, pde.estado, 
	pe.nome AS Professor FROM disciplina AS d, planodeensino AS pde, turma AS tu, 
		docente AS doc, servidor AS se, pessoa AS pe
	WHERE tu.coddisciplina = d.codigodisciplina AND tu.idturma = pde.idturma 
		AND doc.SIAPE = pde.SIAPE AND doc.SIAPE = se.SIAPE AND se.CPF = pe.CPF; 
	
-- Docentes com cargo administrativo atualmente:
-- SIAPE-nomedocente-departamento-posicao-tipodocente-datainicio-cargoadministrativocorrente
-- ESSA � DO TUTUI
CREATE OR REPLACE VIEW vDocenteCargoAdministrativo AS
	SELECT d.siape, pe.nome AS Docente, de.nome AS Departamento, dca.periodo_inicio AS iniciodomandato,
	dca.periodo_termino,
	 d.tipo_docente, dca.nome_cargo
	FROM docente AS d, pessoa AS pe, docente_cargo_administrativo as dca,
		departamento AS de, servidor AS se
	WHERE (dca.periodo_termino >= CURRENT DATE OR dca.periodo_termino IS NULL)
		AND d.siape = dca.siape 
		AND d.sigla_d = de.sigla
		AND d.SIAPE = se.SIAPE AND se.CPF = pe.CPF; 
	
--Membros que participaram de um conselho:
--nome-siape/RA-portariadeindicacao-telefone-docente/discente/TA-representacao
-- ESSA � DO MATHEUS
-- siape-nome-telefone-cpf-email-endereco (servidor+pessoa)
CREATE OR REPLACE VIEW vContatosServidor AS
	SELECT s.siape, pe.nome, pe.cpf, pe.endereco_cidade, pe.endereco_bairro,
	pe.endereco_numero, pe.endereco_logradouro, pe.endereco_complemento, pe.endereco_cep,
	pe.email1, pe.email2, pe.telefone1, pe.telefone2, pe.telefone3
	FROM SERVIDOR AS s, PESSOA AS PE
	WHERE s.cpf = pe.cpf;
	
-- Membros que participaram de um conselho:
-- nome-siape/RA-portariadeindicacao-telefone-docente/discente/TA-representacao
-- ESSA � DO VASSOURA
/*
CREATE OR REPLACE VIEW vHistoricoConselho AS
	SELECT pe.nome AS Nome, s.siape AS Identificacao, mem.nro_portaria_indicacao AS Nro_Portaria,
	pe.telefone1 AS Telefone_1, pe.telefone2 AS Telefone_2, mem.representacao AS Representacao
	FROM Pessoa AS pe, Servidor AS s, Membro AS mem
	WHERE pe.cpf = mem.cpf AND mem.cpf = s.cpf
	UNION
	SELECT pe.nome AS Nome, di.ra AS Identificacao, mem.nro_portaria_indicacao AS Nro_Portaria,
	pe.telefone1 AS Telefone_1, pe.telefone2 AS Telefone_2, mem.representacao AS Representacao
	FROM Pessoa AS pe, Discente AS di, Membro AS mem
	WHERE pe.cpf = mem.cpf AND mem.cpf = di.cpf;
*/

CREATE OR REPLACE VIEW vHistoricoPlanoEnsino AS
	SELECT d.nome AS Disciplina,tu.letra, tu.ano, tu.semestre, tu.vagas, pde.estado, 
	pe.nome AS Professor, r.dataDeRevisao AS Data_Da_Revisao, r.parecer AS Parecer,
	r.pe_estado AS Estado_Do_Plano_Ensino, r.r_estado AS Estado_Da_Revisao
	FROM disciplina AS d, planodeensino AS pde, turma AS
	tu, docente AS doc, servidor AS se, pessoa AS pe, revisao AS r
	WHERE tu.coddisciplina = d.codigodisciplina AND tu.idturma = pde.idturma 
		AND doc.SIAPE = pde.SIAPE AND doc.SIAPE = se.SIAPE AND se.CPF = pe.CPF AND
		doc.SIAPE = r.SIAPE AND pde.idturma = r.idturma;
		
		
CREATE OR REPLACE VIEW vTurmaHorarioInconsistente AS
	SELECT th.idturma, tu.coddisciplina 
	FROM turmahorario AS th, turma AS tu, disciplina AS d
	WHERE th.idturma = tu.idturma AND tu.coddisciplina = d.codigodisciplina
	AND (d.creditosteoricos+d.creditospraticos) NOT IN 
		( 
		SELECT SUM(tho.duracao) FROM turmahorario 
		AS tho, turma AS tur, disciplina AS di 
		WHERE tho.idturma = tur.idturma AND tur.coddisciplina = di.codigodisciplina
		AND tho.idturma = th.idturma
		)
