-- Função retorna a porcentagem de planos de ensinos aprovados por determinado docente
CREATE OR REPLACE FUNCTION aprovacao_plano_ensino_docente ( par_NOME varchar(30))
   returns float
   LANGUAGE SQL
   no external action
   BEGIN
    DECLARE APROVADOS FLOAT DEFAULT 0;
    DECLARE REPROVADOS FLOAT DEFAULT 0;
    DECLARE quantidade float;
	DECLARE SIAPE_ATUAL VARCHAR(6);

	SELECT SIAPE INTO SIAPE_ATUAL FROM SERVIDOR,PESSOA WHERE SERVIDOR.CPF = PESSOA.CPF AND PESSOA.NOME = par_NOME;

	-- contando aprovados	
    FOR aprov as c1 CURSOR FOR
       SELECT ESTADO,SIAPE FROM PLANODEENSINO
		 DO
		 if aprov.estado = 'APROVADO' AND aprov.siape = SIAPE_ATUAL then
			set APROVADOS = APROVADOS +1;
		  end if;
    END FOR;
    
    -- contando reprovados
    FOR reprov as c2 CURSOR FOR
       SELECT ESTADO,SIAPE FROM PLANODEENSINO
		 DO
		 if reprov.estado = 'REPROVADO' AND reprov.siape = SIAPE_ATUAL then
			set REPROVADOS = REPROVADOS +1;
		  end if;
    END FOR;
    -- evitando divisao por zero
    if REPROVADOS = 0 AND APROVADOS = 0 
    then set quantidade = 0; 
    else 
	set quantidade = (APROVADOS/(APROVADOS+REPROVADOS))*100 ;
	end if;
return quantidade;
END}

-- linha para testar a function
SELECT aprovacao_plano_ensino_docente('João Souza') from SYSIBM.SYSDUMMY1}
