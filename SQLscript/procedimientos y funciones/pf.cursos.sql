SET GLOBAL log_bin_trust_function_creators = 1;

DROP PROCEDURE IF EXISTS listarCursosDictados;
DROP PROCEDURE IF EXISTS listarCursosDictadosEn;
DROP PROCEDURE IF EXISTS listarCursos;
DROP PROCEDURE IF EXISTS listarCursoDictado;
DROP PROCEDURE IF EXISTS filtrarCursoPorFecha;
DROP PROCEDURE IF EXISTS editarCursoFechas;
DROP PROCEDURE IF EXISTS editarCursoDocente;
DROP PROCEDURE IF EXISTS listarCurso;
DROP FUNCTION IF EXISTS existeCurso;
DROP FUNCTION IF EXISTS aperturarCurso;

DELIMITER $$
CREATE PROCEDURE listarCursos () begin
	SELECT ID as id, NOMBRE as nombre FROM CURSO;
end;
$$

DELIMITER $$
CREATE PROCEDURE `listarCursosDictados`()
begin
	SELECT DISTINCT 
		CA.ID AS id, DOCENTE AS idDocente,
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, PR.NOMBRE AS programa, A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, C.NOMBRE AS curso, 
        S.NOMBRE as seccion, fechaLatam(FECHA_INICIO) as inicio, fechaLatam(FECHA_FIN) as fin,
        S.AULA AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.MALLA_CURRICULAR
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID;
end
$$

DELIMITER $$
CREATE PROCEDURE filtrarCursoPorFecha(inicio date, fin date)
begin
	SELECT 
		CA.ID AS id, 
        DOCENTE AS idDocente,
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, 
        PR.NOMBRE AS programa, 
        A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, 
        C.NOMBRE AS curso, 
        S.NOMBRE as seccion, 
        P.NOMBRE AS docente,
        CA.FECHA_INICIO AS inicio, 
        CA.FECHA_FIN AS fin,
        S.AULA AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA 
    INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.MALLA_CURRICULAR
    INNER JOIN PERSONA P ON CA.DOCENTE = P.ID
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID
    WHERE FECHA_FIN >= inicio
	ORDER BY A.NOMBRE;
end
$$

DELIMITER $$
CREATE PROCEDURE listarCursoDictado(idCurso int) begin 
	SELECT DISTINCT 
		CA.ID AS id, DOCENTE AS idDocente, P.NOMBRE as docente,
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, PR.NOMBRE AS programa, A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, C.NOMBRE AS curso, 
        S.NOMBRE as seccion, fechaLatam(FECHA_INICIO) as inicio, fechaLatam(FECHA_FIN) as fin,
        S.AULA AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.MALLA_CURRICULAR
    INNER JOIN PERSONA P ON P.ID = CA.DOCENTE
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID
    WHERE CA.ID = idCurso;
end;
$$

DELIMITER $$
CREATE FUNCTION `existeCurso`(idCurso int) RETURNS tinyint
begin
	return (SELECT COUNT(ID) FROM CURSO WHERE ID = idCurso);
end
$$

DELIMITER $$
CREATE FUNCTION aperturarCurso(idMalla int, idSeccion int, idDocente int, inicio date, fin date) returns tinyint begin
	IF( SELECT COUNT(ID) FROM CURSO_APERTURADO WHERE MALLA_CURRICULAR = idMalla and SECCION = idSeccion) = 0 then
		INSERT INTO CURSO_APERTURADO(SECCION, MALLA_CURRICULAR, DOCENTE, FECHA_INICIO, FECHA_FIN) 
        VALUES(idSeccion, idMalla, idDocente, inicio, fin);
        return 1;
    else
		return 0;
    end if;
end;
$$

DELIMITER $$
CREATE PROCEDURE listarCursosDictadosEn(idPrograma int) begin
	SELECT DISTINCT 
		CA.ID AS id, DOCENTE AS idDocente, 
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, PR.NOMBRE AS programa, A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, C.NOMBRE AS curso, 
        S.NOMBRE as seccion, fechaLatam(FECHA_INICIO) as inicio, fechaLatam(FECHA_FIN) as fin,
        S.AULA AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.MALLA_CURRICULAR
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID
    WHERE S.PROGRAMA_AP = idPrograma
    ORDER BY S.NOMBRE, MC.SEMESTRE;
end;
$$

DELIMITER $$
CREATE PROCEDURE editarCursoFechas(_id int, _inicio date, _fin date) BEGIN
	UPDATE CURSO_APERTURADO SET FECHA_INICIO = _inicio, FECHA_FIN = _fin WHERE ID = _id;
END
$$

DELIMITER $$
CREATE PROCEDURE editarCursoDocente(_id int, idDocente int) BEGIN
	UPDATE CURSO_APERTURADO SET DOCENTE = idDocente WHERE ID = _id;
end
$$