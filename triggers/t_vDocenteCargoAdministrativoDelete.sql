CREATE OR REPLACE TRIGGER t_vDocenteCargoAdministrativo
INSTEAD OF DELETE --OR DELETE OR INSERT
ON vDocenteCargoAdministrativo
REFERENCING OLD AS velho
FOR EACH ROW
BEGIN ATOMIC
	DELETE FROM docente_cargo_administrativo AS dca
      WHERE dca.siape = velho.siape AND dca.periodo_inicio = velho.iniciodomandato AND
      dca.nome_cargo = velho.nome_cargo;
END}
