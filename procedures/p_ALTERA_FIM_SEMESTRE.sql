--Atualizar o fim do semestre

CREATE OR REPLACE PROCEDURE ALTERA_FIM_SEMESTRE (data_de_submissao_cal DATE, novo_fim_semestre varchar(10))
BEGIN
    UPDATE CALENDARIO SET fim_semestre = novo_fim_semestre
    WHERE data_de_submissao = data_de_submissao_cal;
END
