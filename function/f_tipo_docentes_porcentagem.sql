-- Função retorna a porcentagem de docentes de um determinado tipo
CREATE OR REPLACE FUNCTION tipo_docentes_porcentagem ( VAL_TIPO_DOCENTE varchar(30))
   returns float
   LANGUAGE SQL
   no external action
   BEGIN
    DECLARE QUANTIDADE float DEFAULT 0;
    DECLARE DIFERENTES float DEFAULT 0;
    DECLARE RESULTADO float DEFAULT 0;
    
	-- contando docentes	
    FOR doc as c1 CURSOR FOR
       SELECT TIPO_DOCENTE FROM DOCENTE
		 DO
		 set DIFERENTES = DIFERENTES + 1;
		 
		 if doc.TIPO_DOCENTE = VAL_TIPO_DOCENTE then
		 	set QUANTIDADE = QUANTIDADE +1;
		 end if;
    END FOR;
     
	set RESULTADO = (QUANTIDADE/(DIFERENTES))*100 ;

return RESULTADO;
END}
