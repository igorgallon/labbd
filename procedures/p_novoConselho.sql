-- 	Procedimento que adiciona um conselho do banco
CREATE OR REPLACE PROCEDURE NovoConselho
(IN VAL_TIPO VARCHAR(12),IN SIGLA VARCHAR(10))
LANGUAGE SQL
BEGIN
	DECLARE ID_ATUAL VARCHAR(12);
	
	-- ADICIONA NOVO CONSELHO
	INSERT INTO CONSELHO VALUES(DEFAULT,VAL_TIPO);
	
	SELECT max(CODIGOCONSELHO) INTO ID_ATUAL FROM CONSELHO;
	
	-- VERIFICA O TIPO DO CONSELHO
	IF VAL_TIPO = 'DEPARTAMENTO' THEN INSERT INTO CONSELHODEDEPARTAMENTO VALUES(ID_ATUAL,SIGLA);
	END IF;
	
END}

-- Testa o procedure
--call NovoConselho(10);
