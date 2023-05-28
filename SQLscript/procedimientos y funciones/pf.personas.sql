SET GLOBAL log_bin_trust_function_creators = true;

DROP PROCEDURE IF EXISTS listarPersona;
DROP PROCEDURE IF EXISTS listarMatriculados;
DROP PROCEDURE IF EXISTS filtrarPersonasPorNombre;
DROP PROCEDURE IF EXISTS filtrarDocentesPorNombre;
DROP FUNCTION IF EXISTS existePersona;
DROP FUNCTION IF EXISTS listarEstudiantePorCodigo;
DROP FUNCTION IF EXISTS registrarDocente;
DROP FUNCTION IF EXISTS registrarEstudiante;

DELIMITER $$
CREATE FUNCTION registrarDocente( codigo_ varchar(8), nombre_ varchar(100), correos_ varchar(100) ) returns int begin
	IF (SELECT COUNT(PERSONA) FROM DOCENTE WHERE CODIGO = codigo_) >= 1 THEN 
		RETURN 0;
	elseif (SELECT COUNT(PROPIETARIO) FROM CORREO WHERE DIRECCION = correos_) >= 1 THEN 
		set @_id = (SELECT PROPIETARIO FROM CORREO WHERE DIRECCION = correos_);
	else
		insert into PERSONA (NOMBRE) VALUES (nombre_);
        set @_id = (select max(ID) from persona);
        insert into CORREO VALUES (@_id, correos_);
	END IF; 
		
	insert into DOCENTE VALUES (@_id, codigo_);
       
    RETURN 1;
end;
$$

DELIMITER $$
CREATE FUNCTION registrarEstudiante( codigo_ varchar(12), nombre_ varchar(100), correos_ varchar(100) ) returns int begin
	IF (SELECT COUNT(PERSONA) FROM ESTUDIANTE WHERE CODIGO = codigo_) >= 1 THEN 
		RETURN 0;
	elseif (SELECT COUNT(PROPIETARIO) FROM CORREO WHERE DIRECCION = correos_) >= 1 THEN 
		set @_id = (SELECT PROPIETARIO FROM CORREO WHERE DIRECCION = correos_);
	else
		insert into PERSONA (NOMBRE) VALUES (nombre_);
        set @_id = (select max(ID) from persona);
        insert into CORREO VALUES (@_id, correos_);
	END IF;
		
	insert into ESTUDIANTE VALUES (@_id, codigo_);
       
    RETURN 1;
end;
$$

DELIMITER $$
CREATE PROCEDURE listarPersona( idPersona int )
begin
	IF( SELECT COUNT(PERSONA) FROM ESTUDIANTE WHERE PERSONA = idPersona ) > 0 THEN
		SELECT ID as id, NOMBRE as nombre, CODIGO as codigo FROM PERSONA INNER JOIN ESTUDIANTE ON PERSONA.ID = ESTUDIANTE.PERSONA WHERE ID = idPersona;
	ELSEIF( SELECT COUNT(PERSONA) FROM DOCENTE WHERE PERSONA = idPersona ) > 0 THEN
		SELECT ID as id, NOMBRE as nombre, CODIGO as codigo FROM PERSONA INNER JOIN DOCENTE ON PERSONA.ID = DOCENTE.PERSONA WHERE ID = idPersona;
	ELSE 
		SELECT ID as id, NOMBRE as nombre FROM PERSONA WHERE ID = idPersona;
    END IF;
end
$$

DELIMITER $$
CREATE PROCEDURE filtrarPersonasPorNombre(nameTarget varchar(100)) begin
	SELECT ID as id, NOMBRE as nombre FROM PERSONA WHERE NOMBRE like CONCAT('%', nameTarget, '%') order by NOMBRE limit 15;
end
$$

DELIMITER $$
CREATE PROCEDURE filtrarDocentesPorNombre(nameTarget varchar(100)) begin
	SELECT ID as id, NOMBRE as nombre, CODIGO as codigo FROM PERSONA INNER JOIN DOCENTE ON PERSONA.ID = DOCENTE.PERSONA WHERE NOMBRE like CONCAT('%', nameTarget, '%') order by NOMBRE limit 15;
end
$$

DELIMITER $$
CREATE PROCEDURE listarMatriculados( idCurso int )
begin
	SELECT P.ID as id, NOMBRE as nombre, E.CODIGO as codigo 
    FROM PERSONA P 
    INNER JOIN ESTUDIANTE E ON E.PERSONA = P.ID
    INNER JOIN MATRICULA M ON E.PERSONA = M.ESTUDIANTE
    WHERE M.CURSO_AP = idCurso;
end
$$

DELIMITER $$
CREATE FUNCTION existePersona(idPersona int) returns tinyint begin
	return (SELECT COUNT(ID) FROM PERSONA WHERE ID = idPersona);
end;
$$

DELIMITER $$
CREATE FUNCTION listarEstudiantePorCodigo( _codigo varchar(12) ) returns int
begin
	IF (SELECT COUNT(PERSONA) FROM ESTUDIANTE WHERE CODIGO = _codigo) = 0 THEN
		RETURN 0;
	ELSE 
		RETURN (SELECT PERSONA FROM ESTUDIANTE WHERE CODIGO = _codigo);
	END IF;
end
$$