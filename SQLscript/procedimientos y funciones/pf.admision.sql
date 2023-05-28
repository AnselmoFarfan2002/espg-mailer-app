DROP PROCEDURE IF EXISTS listarAdmision;

DELIMITER $$
CREATE PROCEDURE listarAdmision() begin
	SELECT ID as id, NOMBRE as nombre from ADMISION;
end;
$$
