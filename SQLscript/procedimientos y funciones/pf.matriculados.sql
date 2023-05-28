DROP FUNCTION IF EXISTS matricularPersona;

DELIMITER $$
CREATE FUNCTION matricularPersona(idPersona int, idCurso int) returns tinyint begin
	IF ( SELECT COUNT(ID) FROM MATRICULA WHERE ESTUDIANTE = idPersona AND CURSO_AP = idCurso ) = 0 then
		INSERT INTO MATRICULA (ESTUDIANTE, CURSO_AP) VALUES (idPersona, idCurso);
        return 1;
    else 
		return 0;
	end if;
end;
$$
