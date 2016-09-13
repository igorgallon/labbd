--quantidade de disciplinas por departamento
CREATE OR REPLACE FUNCTION quantidade_disciplina_departamento ( par_siglaDepartamento varchar(5))
   returns int
   LANGUAGE SQL
   no external action
   BEGIN
    DECLARE contador INT DEFAULT 0;
    DECLARE quantidade int;

    FOR depto as c1 CURSOR FOR
       SELECT sigladepartamento   FROM disciplina
		 DO
		 if depto.siglaDepartamento = par_siglaDepartamento then
			set contador = contador +1;
		  end if;
    END FOR;
set quantidade = contador;
return quantidade;
END}


SELECT disciplina_departamento('DQ') from SYSIBM.SYSDUMMY1}
