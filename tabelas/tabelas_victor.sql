CREATE TABLE CONSELHO
 (CODIGOCONSELHO   VARCHAR(10)     NOT NULL,
  TIPO  INTEGER NOT NULL,
  PRIMARY KEY(CODIGOCONSELHO)          );
  
CREATE TABLE CONSELHODEDEPARTAMENTO
 (CODIGOCONSELHO   VARCHAR(10)     NOT NULL,
  SIGLA   CHAR(10)     NOT NULL,
  FOREIGN KEY (CODIGOCONSELHO) references CONSELHO(CODIGOCONSELHO),
  FOREIGN KEY (SIGLA) references DEPARTAMENTO(SIGLA),
  PRIMARY KEY(CODIGOCONSELHO)          );