set global log_bin_trust_function_creators = 1;

drop procedure if exists listarProgramasAperturados;
drop procedure if exists listarProgramaAperturado;
drop procedure if exists listarMallaCurricularDe;
drop procedure if exists listarProgramas;
drop procedure if exists listarSeccionesDe;
drop procedure if exists editarSeccion;
drop function if exists aperturarPrograma;
drop function if exists aperturarSeccion;

DELIMITER $$
CREATE PROCEDURE listarProgramas() begin
	SELECT ID as id, CASE WHEN TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END as tipo, NOMBRE as nombre FROM PROGRAMA;
end;
$$

DELIMITER $$
CREATE PROCEDURE listarProgramasAperturados() begin
	SELECT PA.ID as id, CASE WHEN TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END as tipo, P.NOMBRE as nombre, A.NOMBRE as admision
    FROM PROGRAMA_APERTURADO PA INNER JOIN PROGRAMA P ON PA.PROGRAMA = P.ID INNER JOIN ADMISION A ON PA.ADMISION = A.ID;
end;
$$

DELIMITER $$
CREATE PROCEDURE listarProgramaAperturado(idPrograma int) begin
	SELECT PA.ID as id, CASE WHEN TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END as tipo, P.NOMBRE as nombre, A.NOMBRE as admision
    FROM PROGRAMA_APERTURADO PA 
    INNER JOIN PROGRAMA P ON PA.PROGRAMA = P.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID 
    WHERE PA.ID = idPrograma;
end;
$$

DELIMITER $$
CREATE FUNCTION aperturarPrograma(programa_ int, admision_ int) returns tinyint begin
	IF( SELECT COUNT(ID) FROM PROGRAMA_APERTURADO WHERE PROGRAMA = programa_ AND ADMISION = admision_ ) = 0 then
		INSERT INTO PROGRAMA_APERTURADO (ADMISION, PROGRAMA) 
        VALUES (admision_, programa_);
        return (SELECT MAX(ID) FROM PROGRAMA_APERTURADO);
    else 
		return 0;
    end if;
end;
$$

DELIMITER $$
CREATE FUNCTION aperturarSeccion(programa int, nombre char, correo varchar(50), contrasenia varchar(15), aula varchar(40)) returns tinyint begin
	IF( SELECT COUNT(ID) FROM SECCION S WHERE S.PROGRAMA_AP = programa AND S.NOMBRE = nombre ) = 0 then
		INSERT INTO SECCION (PROGRAMA_AP, NOMBRE, CORREO, CONTRASENIA, AULA) 
        VALUES (programa, nombre, correo, contrasenia, aula);
        return (SELECT MAX(ID) FROM SECCION);
    else 
		return 0;
    end if;
end;
$$

DELIMITER $$
CREATE PROCEDURE listarSeccionesDe(idPrograma int) BEGIN
	SELECT ID as id, NOMBRE as nombre, AULA as aula,  CORREO as correo, CONTRASENIA as contrasenia
    FROM SECCION WHERE PROGRAMA_AP = idPrograma ORDER BY NOMBRE;
END
$$

DELIMITER $$
CREATE PROCEDURE listarMallaCurricularDe(idPrograma int) BEGIN
	SELECT MC.ID as id, CURSO.NOMBRE as curso, MC.SEMESTRE AS semestre from CURSO INNER JOIN MALLA_CURRICULAR MC ON MC.CURSO = CURSO.ID WHERE MC.PROGRAMA = idPrograma order by MC.ID; 
END
$$

DELIMITER $$
CREATE PROCEDURE editarSeccion(_id int, _nombre char, _correo varchar(50), _contrasenia varchar(15), _aula varchar(40)) BEGIN
	UPDATE SECCION SET NOMBRE = _nombre, CORREO = _correo, CONTRASENIA = _contrasenia, AULA = _aula WHERE ID = _id;
END
$$