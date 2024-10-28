-- Proveedores
-- Insertar 
DELIMITER //
CREATE PROCEDURE procInsertProveedor(IN v_nit VARCHAR(45), IN v_nombre VARCHAR(45), IN v_finca_id INT
)
BEGIN 
    DECLARE finca_existente INT;

    -- Verificamos si la finca existe
    SELECT COUNT(*)
    INTO finca_existente
    FROM tbl_finca
    WHERE fin_id = v_finca_id;

    IF finca_existente = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Finca no existente';
    ELSE
        -- Insertar en la tabla proveedor
        INSERT INTO tbl_proveedor (
            pro_nit, 
            pro_nombre, 
            tbl_finca_fin_id
        ) 
        VALUES (
            v_nit, 
            v_nombre, 
            v_finca_id
        );
    END IF;
END//
DELIMITER ;
-- Actualizar 
DELIMITER //
CREATE PROCEDURE procUpdateProveedor(
    IN v_proveedor_id INT,  -- ID del proveedor a actualizar
    IN v_nit VARCHAR(20), 
    IN v_nombre VARCHAR(100), 
    IN v_finca_id INT
)
BEGIN 
    DECLARE finca_existente INT;

    -- Verificamos si el proveedor existe
    IF NOT EXISTS (SELECT 1 FROM tbl_proveedor WHERE pro_id = v_proveedor_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Proveedor no existente';
    END IF;

    -- Verificamos si la finca existe
    SELECT COUNT(*)
    INTO finca_existente
    FROM tbl_finca
    WHERE fin_id = v_finca_id;

    IF finca_existente = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Finca no existente';
    ELSE
        -- Actualizar en la tabla proveedor
        UPDATE tbl_proveedor 
        SET 
            pro_nit = v_nit, 
            pro_nombre = v_nombre, 
            tbl_finca_fin_id = v_finca_id
        WHERE pro_id = v_proveedor_id;
    END IF;
END//
DELIMITER ;
-- Mostrar
DELIMITER //
CREATE PROCEDURE procSelecProveedor(
    IN v_proveedor_id INT
)
BEGIN 
    -- Seleccionamos los datos del proveedor junto con la finca asociada
    SELECT 
        p.pro_id,
        p.pro_nit,
        p.pro_nombre,
        f.fin_nombre AS finca_nombre,
		f.fin_ubicacione AS finca_ubicacione
    FROM 
        tbl_proveedor p
    LEFT JOIN 
        tbl_finca f ON p.tbl_finca_fin_id = f.fin_id
    WHERE 
        p.pro_id = v_proveedor_id;
END//
DELIMITER ;
-- Selecciona unicamente el id y el nombre de los provedores
DELIMITER //
CREATE PROCEDURE spSelectProveedorDDL()
BEGIN
	select pro_id,concat(pro_nit, '',pro_nombre) as nombreProveedor
    from tbl_proveedor;
END//
DELIMITER ;
-- Eliminar
DELIMITER //
CREATE PROCEDURE procDeleteProveedor(
    IN v_proveedor_id INT
)
BEGIN 
    -- Verificamos si el proveedor existe
    IF NOT EXISTS (SELECT 1 FROM tbl_proveedor WHERE pro_id = v_proveedor_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Proveedor no existente';
    ELSE
        -- Eliminar el proveedor
        DELETE FROM tbl_proveedor 
        WHERE pro_id = v_proveedor_id;
    END IF;
END//
DELIMITER ;




