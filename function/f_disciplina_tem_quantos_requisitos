--mostra a quantidade de pre requisitos de uma disciplina (seu codigo deve ser passado como parametro)
CREATE OR REPLACE FUNCTION disciplina_tem_quantos_requisitos(par_codigo_disciplina varchar(6))
   returns int
   LANGUAGE SQL
   no external action
   BEGIN
    DECLARE contador int DEFAULT 0;

    FOR discip as c1 CURSOR FOR
       SELECT codigoDisciplina FROM requisitos
		 DO
		 	if discip.codigoDisciplina=par_codigo_disciplina then
			set contador = contador +1;
			end if;
    END FOR;

	return contador;
END}

SELECT disciplina_tem_quantos_requisitos('089110') from SYSIBM.SYSDUMMY1}
