-- drop database mailer_db;
create database if not exists mailer_db;

use mailer_db;

create table if not exists CURSO(
	ID int unsigned auto_increment primary key,
    NOMBRE varchar(200) not null
);

create table if not exists PROCESO(
	ID int unsigned auto_increment primary key,
    NOMBRE varchar(7) not null
);

create table if not exists PROGRAMA(
	ID int unsigned auto_increment primary key,
    NOMBRE varchar(200) not null,
    TIPO boolean not null
);

create table if not exists DOCENTE(
	ID int unsigned auto_increment primary key,
    CODIGO varchar(20),
    CORREO varchar(200) not null,
    NOMBRE varchar(200) not null
);

create table if not exists ESTUDIANTE(
	ID int unsigned auto_increment primary key,
    CODIGO varchar(11) not null unique,
    CORREO varchar(100) not null,
    NOMBRE varchar(200)
);

create table if not exists PROGRAMA_APERTURADO(
	ID int unsigned auto_increment primary key,
    PROGRAMA int unsigned not null,
    PROCESO int unsigned not null,
    
    FOREIGN KEY (PROGRAMA) REFERENCES PROGRAMA(ID),
    FOREIGN KEY (PROCESO) REFERENCES PROCESO(ID)
);

create table if not exists CURSO_DICTADO(
	ID int unsigned auto_increment primary key,
    CURSO int unsigned not null, 
    DOCENTE int unsigned not null,
    PROGRAMA_AP int unsigned not null,
    SECCION varchar(1) not null,
    AULA varchar(50) not null,
    
    foreign key (CURSO) REFERENCES CURSO(ID),
    foreign key (DOCENTE) REFERENCES DOCENTE(ID),
    foreign key (PROGRAMA_AP) REFERENCES PROGRAMA_APERTURADO(ID)
);

create table if not exists MATRICULA(
	ID int unsigned auto_increment primary key,
	CURSO_DI int unsigned not null,
    PROCESO int unsigned not nulL,
    ESTUDIANTE int unsigned not null,
    
    foreign key (CURSO_DI) REFERENCES CURSO_DICTADO(ID),
    foreign key (PROCESO) REFERENCES PROCESO(ID),
    foreign key (ESTUDIANTE) REFERENCES ESTUDIANTE(ID)
);

-- DROP TABLE SECCION
CREATE TABLE IF NOT EXISTS SECCION(
	ID int unsigned auto_increment primary key,
	PROGRAMA_AP INT NOT NULL,
    NOMBRE CHAR NOT NULL,
	CORREO varchar(50) NOT NULL,
	CONTRASENIA varchar(15) NOT NULL, 
    AULA varchar(14) NOT NULL,
    
    FOREIGN KEY (PROGRAMA_AP) REFERENCES PROGRAMA(ID)
)
;
CREATE TABLE IF NOT EXISTS MALLA_CURRICULAR(
	ID int unsigned auto_increment primary key,
	PROGRAMA INT NOT NULL,
    CURSO INT NOT NULL,
    
    FOREIGN KEY (PROGRAMA) REFERENCES PROGRAMA(ID),
    FOREIGN KEY (CURSO) REFERENCES CURSO(ID)
);

/*************************************/
CREATE TABLE IF NOT EXISTS DOCENTE(
	PERSONA int not null,
    CODIGO varchar(8) not null
);

CREATE TABLE IF NOT EXISTS ESTUDIANTE(
	PERSONA int not null,
    CODIGO varchar(12) not null
);


select CONCAT("INSERT INTO ESTUDIANTE VALUES (",ID,", '",CODIGO,"');") from persona where codigo like concat('20%-%');
