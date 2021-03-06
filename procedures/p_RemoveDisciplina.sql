CREATE OR REPLACE PROCEDURE pRemoveDisciplina (IN codigoDaDisciplina CHAR(6))
LANGUAGE SQL
BEGIN
	DELETE FROM requisitos WHERE codigodisciplina = codigoDaDisciplina 
	OR codigorequisito = codigoDaDisciplina;
	DELETE FROM revisao WHERE idturma IN 
	(	SELECT re.idturma 
		FROM revisao AS re, turma AS tu, disciplina AS di 
		WHERE re.idturma = tu.idturma AND tu.coddisciplina = di.codigodisciplina
		AND di.codigodisciplina = codigoDaDisciplina
	);
	DELETE FROM planoDeEnsino WHERE idturma IN 
	(	SELECT pde.idturma 
		FROM planodeensino AS pde, turma AS tu, disciplina AS di 
		WHERE pde.idturma = tu.idturma AND tu.coddisciplina = di.codigodisciplina
		AND di.codigodisciplina = codigoDaDisciplina
	);
	DELETE FROM turmahorario WHERE idturma IN 
	(	SELECT th.idturma 
		FROM turmahorario AS th, turma AS tu, disciplina AS di 
		WHERE th.idturma = tu.idturma AND tu.coddisciplina = di.codigodisciplina
		AND di.codigodisciplina = codigoDaDisciplina
	); 
	DELETE FROM turma WHERE coddisciplina = codigoDaDisciplina;
	DELETE FROM disciplina WHERE codigodisciplina = codigoDaDisciplina;    
END}
