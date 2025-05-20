-- Usuarios
-- Insertar
DELIMITER // 
CREATE PROCEDURE procInsertUser(IN v_nombre VARCHAR(40), IN v_correo VARCHAR(80), IN v_contrasena TEXT, IN v_rol VARCHAR(45))
BEGIN 
    INSERT INTO tbl_usuario (usu_nombre, usu_correo, usu_contrasena, usu_rol) 
    VALUES (v_nombre, v_correo, v_contrasena, v_rol);
END//
DELIMITER ;
-- Actualizar
 DELIMITER //
CREATE PROCEDURE procUpdateUser(IN v_id INT,IN v_nombre VARCHAR(40), IN v_correo VARCHAR(80), IN v_contrasena TEXT, IN v_rol VARCHAR(45))
BEGIN
    UPDATE tbl_usuario
    SET usu_nombre = v_nombre, usu_correo = v_correo, usu_contrasena = v_contrasena, usu_rol = v_rol 
    WHERE usu_id = v_id;
END//
DELIMITER ;
-- Mostrar
 DELIMITER //
CREATE PROCEDURE procSelectUser()
BEGIN
    SELECT usu_id, usu_nombre, usu_correo, usu_contrasena, usu_rol
    FROM tbl_usuario;
END//
DELIMITER ;
-- Eliminar
 DELIMITER //
CREATE PROCEDURE procDeleteUser(IN v_id INT)
BEGIN
    DELETE FROM tbl_usuario
    WHERE usu_id = v_id;
END//
DELIMITER ;