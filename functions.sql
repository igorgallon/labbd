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
SELECT disciplina_departamento('DM') from SYSIBM.SYSDUMMY1}
SELECT disciplina_departamento('DC') from SYSIBM.SYSDUMMY1}

--quantidade de creditos praticos por disciplina
CREATE OR REPLACE FUNCTION media_creditos_praticos_disciplina()
   returns double
   LANGUAGE SQL
   no external action
   BEGIN
    DECLARE contador double DEFAULT 0.0;
    DECLARE media double default 0.0;

    FOR discip as c1 CURSOR FOR
       SELECT creditosPraticos FROM disciplina
		 DO
			set contador = contador +1;
			set media = media + discip.creditosPraticos;
    END FOR;
set media = media/contador;
return media;
END}

SELECT media_creditos_praticos_disciplina() from SYSIBM.SYSDUMMY1}
