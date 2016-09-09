insert into disciplina(codigoDisciplina, creditosPraticos, creditosTeoricos, siglaDepartamento, nome)
values
(020338, 0, 4, 'DC','Introdução a Lógica'), --intro a logica
(089109, 0, 4, 'DM','Cálculo I'), --calculo i
(099015, 0, 4, 'DF','Física I'), --fisica i
(071170, 0, 4, 'DQ','Fundamentos de Química'); --fundamentos de quimica


insert into departamento(sigla, centroAcademico, nome)
values
('DC', 'CCET', 'Departamento de Computacao'),
('DM', 'CCET', 'Departamento de Matemática'),
('DF', 'CCET', 'Departamento de Física'),
('DQ', 'CCET', 'Departamento de Química');
