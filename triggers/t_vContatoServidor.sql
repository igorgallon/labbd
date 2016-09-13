CREATE OR REPLACE TRIGGER t_vContatosServidor
INSTEAD OF UPDATE
ON vContatosServidor
REFERENCING NEW AS novo OLD AS velho
FOR EACH ROW
BEGIN ATOMIC
	VALUES(CASE WHEN novo.siape = velho.siape AND novo.CPF = velho.CPF THEN 0 
                ELSE RAISE_ERROR('70002', 'Must not change SIAPE or CPF') END);
    UPDATE pessoa AS pe
      SET (nome, endereco_cidade, endereco_bairro, endereco_numero, endereco_logradouro,
      		endereco_cep, email1, email2, telefone1, telefone2, telefone3)
        = (novo.nome, novo.endereco_cidade, novo.endereco_bairro, novo.endereco_numero, novo.endereco_logradouro,
      		novo.endereco_cep, novo.email1, novo.email2, novo.telefone1, novo.telefone2, novo.telefone3)
    WHERE novo.CPF = pe.CPF;
END}
