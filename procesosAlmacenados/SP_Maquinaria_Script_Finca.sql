-- Maquinaria
-- Insertar
DELIMITER //
CREATE PROCEDURE procInsertMaquinaria(
    IN v_nombre VARCHAR(80), 
    IN v_descripcion VARCHAR(100), 
    IN v_clasificacion VARCHAR(45), 
    IN vfk_cultivoId INT, 
    IN vfk_parcelaId INT
)
BEGIN 
    DECLARE cultivo_existente INT;
    DECLARE parcela_existente INT;

    -- Verificamos si el cultivo existe
    SELECT COUNT(*)
    INTO cultivo_existente
    FROM tbl_cultivo
    WHERE cul_id = vfk_cultivoId;

    -- Verificamos si la parcela existe
    SELECT COUNT(*)
    INTO parcela_existente
    FROM tbl_parcela
    WHERE par_id = vfk_parcelaId;

    --  se insertar en tbl_maquinaria solo si ambas llaves foráneas son válidas
    IF cultivo_existente > 0 AND parcela_existente > 0 THEN
        INSERT INTO tbl_maquinaria (ma_nombre, ma_descripcion, ma_clasificacion, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id
        ) 
        VALUES (
            v_nombre, 
            v_descripcion, 
            v_clasificacion, 
            vfk_cultivoId, 
            vfk_parcelaId
        );
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cultivo o parcela no existente';
    END IF;
END//
DELIMITER ;
-- Actualizar
DELIMITER //
CREATE PROCEDURE procUpdateMaquinariavAL(IN v_id INT, IN v_nombre VARCHAR(80), IN v_descripcion VARCHAR(100), IN v_clasificacion VARCHAR(45), IN vfk_cultivoId INT, IN vfk_parcelaId INT)
BEGIN 
    DECLARE cultivo_existente INT;
    DECLARE parcela_existente INT;

    -- Verificamos si la maquinaria existe
    IF NOT EXISTS (SELECT 1 FROM tbl_maquinaria WHERE ma_id = v_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Maquinaria no existente';
    END IF;

    -- Verificamos si el cultivo existe
    SELECT COUNT(*)
    INTO cultivo_existente
    FROM tbl_cultivo
    WHERE cul_id = vfk_cultivoId;

    -- Verificamos si la parcela existe
    SELECT COUNT(*)
    INTO parcela_existente
    FROM tbl_parcela
    WHERE par_id = vfk_parcelaId;
    
    -- Actualizar en tbl_maquinaria solo si ambas llaves foráneas son válidas
    IF cultivo_existente > 0 AND parcela_existente > 0 THEN
        UPDATE tbl_maquinaria 
        SET 
            ma_nombre = v_nombre, 
            ma_descripcion = v_descripcion, 
            ma_clasificacion = v_clasificacion, 
            tbl_cultivo_cul_id = vfk_cultivoId, 
            tbl_cultivo_tbl_parcela_par_id = vfk_parcelaId
        WHERE ma_id = v_id;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cultivo o parcela no existente';
    END IF;
END//
DELIMITER ;
-- Actualizar
DELIMITER //
CREATE PROCEDURE procUpdateMaquinaria(IN v_id INT, IN v_nombre VARCHAR(80), IN v_descripcion VARCHAR(100), IN v_clasificacion VARCHAR(45), IN vfk_cultivoId INT, IN vfk_parcelaId INT)
BEGIN 
        UPDATE tbl_maquinaria 
        SET 
            ma_nombre = v_nombre, 
            ma_descripcion = v_descripcion, 
            ma_clasificacion = v_clasificacion, 
            tbl_cultivo_cul_id = vfk_cultivoId, 
            tbl_cultivo_tbl_parcela_par_id = vfk_parcelaId
        WHERE ma_id = v_id;
END//
DELIMITER ;
-- Mostrar
DELIMITER //
CREATE PROCEDURE procSelectMaquinaria()
BEGIN 
     select ma_id, ma_nombre, ma_descripcion, ma_clasificacion, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id from tbl_maquinaria;
END//
-- Maquinaria DDL
DELIMITER //
CREATE PROCEDURE procSelectMaquinariaDDL()
begin
     select ma_id,concat('Maquinaria N° ', ma_id, ' ',ma_nombre) as nombre from tbl_maquinaria;
end
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
