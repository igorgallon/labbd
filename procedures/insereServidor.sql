CREATE OR REPLACE PROCEDURE pInsereServidor (IN siape CHAR(6),IN nome VARCHAR(30), IN posicao VARCHAR(30),
IN tipo_docente VARCHAR(30), IN cpf VARCHAR(11), IN tipo_servidor CHAR(1))
LANGUAGE SQL
BEGIN
	IF tipo_servidor = 'd' OR tipo_servidor = 'D' THEN 
		INSERT INTO pessoa(CPF, nome) VALUES (cpf, nome);
		INSERT INTO servidor(CPF, SIAPE) values (cpf, siape);
		INSERT INTO docente(siape, posicao, tipo_docente) values (siape, posicao, tipo_docente);
	ELSEIF tipo_servidor = 'T' OR tipo_servidor = 't' THEN
		INSERT INTO pessoa(cpf, nome) VALUES (cpf, nome);
		INSERT INTO servidor(CPF, SIAPE) values (cpf, siape);
		INSERT INTO TAs(siape) values (siape);
	ELSE
		CALL dbms_output.put('Erro!');
	END IF;  
END} 