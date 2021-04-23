
CREATE TABLE EQUIPO
(
    NOMBRE_EQUIPO VARCHAR2(20) CONSTRAINT NOM_EQ_PK PRIMARY KEY,
    PRESIDENTE VARCHAR2(20) CONSTRAINT PRE_EQ_NN NOT NULL,
    ESTADIO VARCHAR2(20) CONSTRAINT EST_EQ_NN NOT NULL,
    FUNDACION NUMBER(4) CONSTRAINT FUN_EQ_NN NOT NULL
);

CREATE TABLE ENTRENADOR
(
    NOMBRE_ENTRENADOR VARCHAR2(20),
    DNI_ENTRENADOR CHAR(9),
    EDAD NUMBER(2),
    NOMBRE_EQUIPO VARCHAR2(20) CONSTRAINT NOM_EQ_ENT_FK REFERENCES EQUIPO,
    CONSTRAINT NOM_DNI_ENT_PK PRIMARY KEY (NOMBRE_ENTRENADOR,DNI_ENTRENADOR)
);

CREATE TABLE JUGADOR
(
    NOMBRE_JUGADOR VARCHAR2(20),
    DNI_JUGADOR CHAR(9),
    DORSAL NUMBER(2) CONSTRAINT DOR_JUG_CK CHECK(DORSAL>0 AND DORSAL<100),
    POSICION VARCHAR2(10) CONSTRAINT POS_JUG_NN NOT NULL,
    NOMBRE_EQUIPO VARCHAR2(20) CONSTRAINT NOM_EQ_JUG_FK REFERENCES EQUIPO,
    CONSTRAINT NOM_DNI_JUG_PK PRIMARY KEY (NOMBRE_JUGADOR, DNI_JUGADOR)
);

CREATE TABLE GOLEADOR
(
    NOMBRE_JUGADOR VARCHAR2(20),
    DNI_JUGADOR CHAR(9),
    NOMBRE_EQUIPO VARCHAR2(20) CONSTRAINT NOM_EQ_GOL_FK REFERENCES EQUIPO,
    GOLES NUMBER(2) DEFAULT 0,
    CONSTRAINT NOM_DNI_JUG_GOL_FK FOREIGN KEY (NOMBRE_JUGADOR, DNI_JUGADOR) REFERENCES JUGADOR,
    CONSTRAINT GOL_GOL_CK CHECK(GOLES>=0)
);


CREATE TABLE ASISTENTE
(
    NOMBRE_JUGADOR VARCHAR2(20),
    DNI_JUGADOR CHAR(9),
    NOMBRE_EQUIPO VARCHAR2(20) CONSTRAINT NOM_EQ_GOL_FK REFERENCES EQUIPO,
    ASISTENCIAS NUMBER(2) DEFAULT 0,
    CONSTRAINT NOM_DNI_JUG_ASI_FK FOREIGN KEY (NOMBRE_JUGADOR, DNI_JUGADOR) REFERENCES JUGADOR,
    CONSTRAINT ASI_ASI_CK CHECK(ASISTENCIAS>=0)
);

ALTER TABLE JUGADOR ADD CONSTRAINT POS_JUG_CK CHECK(UPPER(POSICION) IN ('PORTERO','DEFENSA','CENTROCAMPISTA','DELANTERO'));
ALTER TABLE JUGADOR ADD NACIONALIDAD VARCHAR2(20);

CREATE INDEX NOM_DOR_POS_JUG_NAC_INX ON JUGADOR (NOMBRE_JUGADOR,DORSAL,POSICION, NACIONALIDAD); --Indice creado para obtener informacion basica sobre un jugador durante el partido
CREATE INDEX NOM_PRE_EQ_INX ON EQUIPO (NOMBRE_EQUIPO, PRESIDENTE); --Indice creado para obtener informacion sobre los presidentes de cada equipo
CREATE INDEX NOM_JUG_NOM_EQ_GOL_GOL_INX ON GOLEADOR (NOMBRE_JUGADOR, NOMBRE_EQUIPO, GOLES); --Indice creado para obtener informacion sobre los goleadores

INSERT INTO EQUIPO VALUES ('Sevilla FC','José Castro','Ramón Sánchez-Pizjuan', 1890);
INSERT INTO EQUIPO VALUES ('Real Madrid CF','Florentino Perez','Santiago Bernabeu', 1902);
INSERT INTO EQUIPO VALUES ('FC Barcelona','Joan Laporta','Camp Nou', 1899);
INSERT INTO EQUIPO VALUES ('Atletico de Madrid','Enrique Cerezo','Metropolitano', 1903);
INSERT INTO EQUIPO VALUES ('Real Betis','Angel Haro','Benito Villamarin', 1907);

INSERT INTO ENTRENADOR VALUES ('Julen Lopetegui','35353454E',54, 'Sevilla FC');
INSERT INTO ENTRENADOR VALUES ('Zinedine Zidane','46342435H',48, 'Real Madrid CF');
INSERT INTO ENTENADOR VALUES ('Ronald Koeman', '97428932P', 58, 'FC Barcelona');
INSERT INTO ENTRENADOR VALUES ('Diego Pablo Simeone','42344255B', 50, 'Atletico de Madrid');
INSERT INTO ENTRENADOR VALUES ('Manuel Pellegrini','34567892Y',67,'Real Betis');

INSERT INTO JUGADOR VALUES('Jesus Navas Gonzalez', '84328531M',16, 'Defensa', 'Sevilla FC','Española');
INSERT INTO JUGADOR VALUES('Ivan Rakitic', '18943248P',10,'Centrocampista','Sevilla FC', 'Croata');
INSERT INTO JUGADOR VALUES('Youssef En-Nesyri', '98767324T','Delantero','Sevilla FC', 'Marroquí');
INSERT INTO JUGADOR VALUES('Joan Jordán Moreno', '56728323N', 'Centrocampista', 'Sevilla FC', 'Española');
INSERT INTO JUGADOR VALUES('Jules Koundé', '98732425I', 'Defensa', 'Sevilla FC', 'Francesa');
INSERT INTO JUGADOR VALUES('Karim Benzema', '12432592D', 'Delantero', 'Real Madrid CF', 'Francesa');
INSERT INTO JUGADOR VALUES('Sergio Ramos García', '75723462O', 'Defensa', 'Real Madrid CF', 'Española');
INSERT INTO JUGADOR VALUES('Daniel Carvajal Ramos', '64354528M', 'Defensa', 'Real Madrid CF', 'Española');
INSERT INTO JUGADOR VALUES('Toni Kroos', '78263456L', 'Centrocampista', 'Real Madrid CF', 'Alemán');
INSERT INTO JUGADOR VALUES('Thibaut Courtois', '62758435C', 'Portero', 'Real Madrid CF', 'Belga');
INSERT INTO JUGADOR VALUES('Lionel Andres Messi Cuticcini', '53454321O', 'Delantero', 'FC Barcelona', 'Argentino');
INSERT INTO JUGADOR VALUES('Antoine Griezmann', '14325432U', 'Delantero', 'FC Barcelona', 'Francesa');
INSERT INTO JUGADOR VALUES('Gerard Piqué Bernabeu', '94723842T', 'Defensa', 'FC Barcelona', 'Española');
INSERT INTO JUGADOR VALUES('Jordi Alba Ramos', '21435325Y', 'Defensa', 'FC Barcelona', 'Española');
INSERT INTO JUGADOR VALUES('Oscar Mingueza Garcia', '97235256R', 'Defensa', 'FC Barcelona', 'Española');
INSERT INTO JUGADOR VALUES('Luis Alberto Suarez Diaz', '52654528I', 'Delantero', 'Atletico de Madrid', 'Uruguaya');
INSERT INTO JUGADOR VALUES('Joao Feliz Sequeira', '23567285G', 'Delantero', 'Atletico de Madrid', 'Portuguesa');
INSERT INTO JUGADOR VALUES('Saul Ñiguez Escalpez', '35278534U', 'Centrocampista', 'Atletico de Madrid', 'Española');
INSERT INTO JUGADOR VALUES('Jorge Resureccion Medina', '53728532T', 'Centrocampista', 'Atletico de Madrid', 'Española');
INSERT INTO JUGADOR VALUES('Jan Oblak', '2353256Q', 'Portero', 'Atletico de Madrid', 'Esloveia');
INSERT INTO JUGADOR VALUES('Claudio Bravo', '3675275K', 'Portero', 'Real Betis', 'Chilena');
INSERT INTO JUGADOR VALUES('Nabil Fekir', '2405325F', 'Centrocampista', 'Real Betis', 'Francesa');
INSERT INTO JUGADOR VALUES('Sergio Canales Madrazo', '6273435V', 'Centrocampista', 'Real Betis', 'Española');
INSERT INTO JUGADOR VALUES('Joaquín Sanchez Rodriguez', '5252052E', 'Centrocampista', 'Real Betis', 'Española');
INSERT INTO JUGADOR VALUES('Borja Iglesias Quintas', '6237582D', 'Delantero', 'Real Betis', 'Española');

 



DROP INDEX NOM_DOR_POS_JUG_NAC_INX;
DROP INDEX NOM_PRE_EQ_INX;
DROP INDEX NOM_JUG_NOM_EQ_GOL_GOL_INX;

DROP TABLE ASISTENTE;
DROP TABLE GOLEADOR;
DROP TABLE JUGADOR;
DROP TABLE ENTRENADOR;
DROP TABLE EQUIPO;