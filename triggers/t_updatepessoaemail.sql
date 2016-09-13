CREATE OR REPLACE TRIGGER t_UPDATEPESSOAEMAIL
BEFORE UPDATE
ON PESSOA 
REFERENCING NEW AS novo OLD AS velho
FOR EACH ROW
BEGIN ATOMIC
	
	VALUES(CASE WHEN novo.CPF = velho.CPF THEN 0 
                ELSE RAISE_ERROR('70003', 'Must not change CPF') END);

    IF velho.email1 IS NULL AND novo.email1 IS NULL AND novo.email2 IS NOT NULL AND velho.email2 IS NOT NULL 
    THEN SET novo.email1 = novo.email2;
    set novo.email2 = velho.email2;
    ELSEIF velho.email1 IS NULL AND novo.email1 IS NULL AND novo.email2 IS NOT NULL
    THEN SET novo.email1 = novo.email2;
    set novo.email2 = NULL;
    END IF; 
END}
