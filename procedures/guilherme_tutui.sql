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
	

/*
		*/
