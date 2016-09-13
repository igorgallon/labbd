--se o usuario tentar inserir uma disciplina com zero credito pratico e zero credito teorico
--a insercao eh feita com a 4 creditos teoricos
CREATE OR REPLACE TRIGGER insert_set_creditos
  NO CASCADE
  BEFORE INSERT ON disciplina
  REFERENCING NEW AS N FOR EACH ROW
  BEGIN
  	if n.creditosTeoricos=0 and n.creditosPraticos=0 then
  		set n.creditosTeoricos=4;
  	end if;
END}

--insert into disciplina(codigoDisciplina, creditosPraticos, creditosTeoricos, siglaDepartamento, nome)
--values	('000111', 0, 0, 'DC','Tópicos em Informática 7')}

--select * from disciplina}
