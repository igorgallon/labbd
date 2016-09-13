-- 	Procedimento que atualiza Estado na Tabela <PlanoDeEnsino>
-- 	Remove tuplas de <Revisao> que têm ligação com o Plano de Ensino ao qual deseja-se atualizar informações
-- e atualiza informações na tabela. 

CREATE OR REPLACE PROCEDURE AdicionaMembroConselho
(IN VAL_NOME VARCHAR(30),IN VAL_CONSELHO INT,IN VAL_PORTARIA VARCHAR(20))
LANGUAGE SQL
BEGIN
	DECLARE CPF_ATUAL VARCHAR(11);
	DECLARE SIAPE_ATUAL VARCHAR(6);
	DECLARE SIAPE2 INT DEFAULT 0;
	DECLARE TIPO_MEMBRO VARCHAR(20);
		
	-- RECUPERA CPF
	SELECT P.CPF INTO CPF_ATUAL FROM PESSOA AS P
	WHERE P.NOME = VAL_NOME;
	
	-- RECUPERA SIAPE
	SELECT S.SIAPE INTO SIAPE_ATUAL FROM SERVIDOR AS S
	WHERE S.CPF = CPF_ATUAL;
	
	IF SIAPE_ATUAL = NULL THEN SET TIPO_MEMBRO = 'DISCENTE'; END IF;

	-- VERIFICA TA OU DOCENTE
	SELECT COUNT(SIAPE) INTO SIAPE2 FROM TAS WHERE TAS.SIAPE = SIAPE_ATUAL;
	
	IF SIAPE2 = 0 THEN SET TIPO_MEMBRO = 'DOCENTE'; 
	ELSE
	SET TIPO_MEMBRO = 'TA';
	END IF;
		
	INSERT INTO MEMBRO VALUES (DEFAULT,CPF_ATUAL,VAL_CONSELHO, VAL_PORTARIA, TIPO_MEMBRO, NULL);
END}

-- Testa o procedure
--call AdicionaMembroConselho('Pompeu Pomposo', '14', '14');