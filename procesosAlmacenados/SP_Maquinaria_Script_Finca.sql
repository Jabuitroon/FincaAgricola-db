-- Maquinaria
-- Insertar
DELIMITER //
CREATE PROCEDURE procInsertMaquinaria(
    IN v_nombre VARCHAR(80), 
    IN v_descripcion VARCHAR(100), 
    IN v_clasificacion VARCHAR(45), 
    IN v_cultivo_id INT, 
    IN v_parcela_id INT
)
BEGIN 
    DECLARE cultivo_existente INT;
    DECLARE parcela_existente INT;

    -- Verificamos si el cultivo existe
    SELECT COUNT(*)
    INTO cultivo_existente
    FROM tbl_cultivo
    WHERE cul_id = v_cultivo_id;

    -- Verificamos si la parcela existe
    SELECT COUNT(*)
    INTO parcela_existente
    FROM tbl_parcela
    WHERE par_id = v_parcela_id;

    --  se insertar en tbl_maquinaria solo si ambas llaves foráneas son válidas
    IF cultivo_existente > 0 AND parcela_existente > 0 THEN
        INSERT INTO tbl_maquinaria (ma_nombre, ma_descripcion, ma_clasificacion, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id
        ) 
        VALUES (
            v_nombre, 
            v_descripcion, 
            v_clasificacion, 
            v_cultivo_id, 
            v_parcela_id
        );
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cultivo o parcela no existente';
    END IF;
END//

DELIMITER ;
-- Actualizar
DELIMITER //
CREATE PROCEDURE procUpdateMaquinaria(IN v_maquinaria_id INT,IN v_nombre VARCHAR(80), IN v_descripcion VARCHAR(100), IN v_clasificacion VARCHAR(45), IN v_cultivo_id INT, IN v_parcela_id INT
)
BEGIN 
    DECLARE cultivo_existente INT;
    DECLARE parcela_existente INT;

    -- Verificamos si la maquinaria existe
    IF NOT EXISTS (SELECT 1 FROM tbl_maquinaria WHERE ma_id = v_maquinaria_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Maquinaria no existente';
    END IF;

    -- Verificamos si el cultivo existe
    SELECT COUNT(*)
    INTO cultivo_existente
    FROM tbl_cultivo
    WHERE cul_id = v_cultivo_id;

    -- Verificamos si la parcela existe
    SELECT COUNT(*)
    INTO parcela_existente
    FROM tbl_parcela
    WHERE par_id = v_parcela_id;
    
    -- Actualizar en tbl_maquinaria solo si ambas llaves foráneas son válidas
    IF cultivo_existente > 0 AND parcela_existente > 0 THEN
        UPDATE tbl_maquinaria 
        SET 
            ma_nombre = v_nombre, 
            ma_descripcion = v_descripcion, 
            ma_clasificacion = v_clasificacion, 
            tbl_cultivo_cul_id = v_cultivo_id, 
            tbl_cultivo_tbl_parcela_par_id = v_parcela_id
        WHERE ma_id = v_maquinaria_id;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cultivo o parcela no existente';
    END IF;
END//
DELIMITER ;
-- Mostrar
DELIMITER //
CREATE PROCEDURE procSelectMaquinaria(IN v_maquinaria_id INT)
BEGIN 
    -- Seleccionamos los datos de la maquinaria junto con el cultivo y la parcela
    SELECT 
        m.ma_id,
        m.ma_nombre,
        m.ma_descripcion,
        m.ma_clasificacion,
        c.cul_nombre AS cultivo_nombre,
        c.cul_descripcion AS cultivo_descricion,
        p.par_dimensiones AS parcela_dimenciones,
        p.par_ubicacion AS parcela_ubicacion
		
    FROM 
        tbl_maquinaria m
    JOIN 
        tbl_cultivo c ON m.tbl_cultivo_cul_id = c.cul_id
    JOIN 
        tbl_parcela p ON m.tbl_cultivo_tbl_parcela_par_id = p.par_id
    WHERE 
        m.ma_id = v_maquinaria_id;
END//

DELIMITER ;
-- Eliminar
DELIMITER //
CREATE PROCEDURE procDeleteMaquinaria(
    IN v_maquinaria_id INT
)
BEGIN 
    DECLARE maquinaria_existente INT;

    -- Verificamos si la maquinaria existe
    SELECT COUNT(*)
    INTO maquinaria_existente
    FROM tbl_maquinaria
    WHERE ma_id = v_maquinaria_id;

    IF maquinaria_existente = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Maquinaria no existente';
    ELSE
        -- Eliminar la maquinaria
        DELETE FROM tbl_maquinaria 
        WHERE ma_id = v_maquinaria_id;
    END IF;
END//

DELIMITER ;
