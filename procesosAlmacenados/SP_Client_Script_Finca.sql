-- Cliente
-- Insertar
DELIMITER // 
CREATE PROCEDURE procInsertClient(IN v_nombre VARCHAR(45), IN v_correo TEXT, IN v_contrasena TEXT, IN v_direccion VARCHAR(80), IN v_ciudad VARCHAR(45))
BEGIN 
    INSERT INTO tbl_cliente (cli_nombre, cli_correo, cli_contrasena, cli_direccion, cli_ciudad) 
    VALUES (v_nombre, v_correo, v_contrasena, v_direccion, v_ciudad);
END//
DELIMITER ;
-- Actualizar
 DELIMITER //
CREATE PROCEDURE procUpdateClient(IN v_id INT,IN v_nombre VARCHAR(45), IN v_correo TEXT, IN v_contrasena TEXT, IN v_direccion VARCHAR(80), IN v_ciudad VARCHAR(45))
BEGIN
    UPDATE tbl_cliente
    SET cli_nombre = v_nombre,
		cli_correo = v_correo, 
        cli_contrasena = v_contrasena,
        cli_direccion = v_direccion,
        cli_ciudad = v_ciudad        
    WHERE cli_id = v_id;
END//
DELIMITER ;
-- Mostrar
 DELIMITER //
CREATE PROCEDURE procSelectClient()
BEGIN
    SELECT cli_id, cli_nombre, cli_correo, cli_direccion, cli_ciudad
    FROM tbl_cliente;
END//
DELIMITER ;

-- Seleccionar el id y nombre del cliente 
DELIMITER //
CREATE PROCEDURE spSelectClienteDDL()
BEGIN
	select cli_id, cli_nombre  as NombreCompleto from tbl_cliente;
END//
DELIMITER ;
-- Eliminar
 DELIMITER //
CREATE PROCEDURE procDeleteClient(IN v_id INT)
BEGIN
    DELETE FROM tbl_cliente
    WHERE cli_id = v_id;
END//
DELIMITER ;