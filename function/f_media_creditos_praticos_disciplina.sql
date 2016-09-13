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

-- Teste
--SELECT media_creditos_praticos_disciplina() from SYSIBM.SYSDUMMY1}
