CREATE OR REPLACE TYPE ty_inconsistencia AS OBJECT (
	codigo_turma INTEGER);}
	
CREATE OR REPLACE TYPE ty_nested_table AS TABLE  OF ty_inconsistencia;}



/*
CREATE OR REPLACE FUNCTION f_consistenciaTurmahorario 
RETURN TABLE(codigo_disciplina VARCHAR);
IS	
	creditostotais INTEGER;
BEGIN
	SELECT (d.creditosteoricos+d.creditospraticos) INTO c

	SELECT tu.coddisciplina
	FROM turmahorario AS th, turma AS tu, disciplina AS d
	WHERE th.idturma = tu.idturma AND tu.coddisciplina = d.codigodisciplina
	GROUP BY tu.coddisciplina
	HAVING SUM(th.duracao) <> (d.creditosteoricos+d.creditospraticos)
	
	*/ 