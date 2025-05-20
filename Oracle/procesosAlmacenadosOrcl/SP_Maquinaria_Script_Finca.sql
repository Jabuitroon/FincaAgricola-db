CREATE OR REPLACE PROCEDURE procInsertMaquinaria(
    v_nombre IN VARCHAR2, 
    v_descripcion IN VARCHAR2, 
    v_clasificacion IN VARCHAR2, 
    vfk_cultivoId IN NUMBER, 
    vfk_parcelaId IN NUMBER,
    v_result OUT NUMBER
)
IS
BEGIN
    INSERT INTO tbl_maquinaria (
            ma_nombre, 
            ma_descripcion, 
            ma_clasificacion, 
            tbl_cultivo_cul_id, 
            tbl_parcela_par_id
        ) VALUES (
            v_nombre, 
            v_descripcion, 
            v_clasificacion, 
            vfk_cultivoId, 
            vfk_parcelaId
        );
    v_result := SQL%ROWCOUNT;
END procInsertMaquinaria;
/

--Ver maquinaria
CREATE OR REPLACE VIEW vw_maquinaria_info AS
SELECT 
    m.ma_id,
    m.ma_nombre,
    m.ma_descripcion,
    m.ma_clasificacion,
    m.tbl_cultivo_cul_id AS cultivo_id,
    c.cul_nombre AS cultivo_nombre,
    m.tbl_parcela_par_id AS parcela_id,
    p.par_ubicacion AS parcela_ubicacion
FROM tbl_maquinaria m
LEFT JOIN tbl_cultivo c ON m.tbl_cultivo_cul_id = c.cul_id
LEFT JOIN tbl_parcela p ON m.tbl_parcela_par_id = p.par_id;

-- Maquinaria DDL
CREATE OR REPLACE VIEW vw_machinary_ddl AS
SELECT ma_id, 'Maquinaria N° ' || ma_id || ' ' || ma_nombre AS nombre FROM tbl_maquinaria;

-- Actualizar
CREATE OR REPLACE PROCEDURE procUpdateMaquinaria(
    v_id IN NUMBER,
    v_nombre IN VARCHAR2,
    v_descripcion IN VARCHAR2,
    v_clasificacion IN VARCHAR2,
    vfk_cultivoId IN NUMBER,
    vfk_parcelaId IN NUMBER,
    v_result OUT NUMBER
)
IS
    cultivo_existente NUMBER := 0;
    parcela_existente NUMBER := 0;
BEGIN
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
            tbl_parcela_par_id = vfk_parcelaId
        WHERE ma_id = v_id;
    END IF;
    v_result := SQL%ROWCOUNT;
END procUpdateMaquinaria;
/

-- Eliminar
CREATE OR REPLACE PROCEDURE procDeleteMaquinaria(
    v_maquinaria_id IN INT,
    v_result OUT NUMBER
)
IS
BEGIN
        DELETE FROM tbl_maquinaria 
        WHERE ma_id = v_maquinaria_id;
        v_result := SQL%ROWCOUNT;
END procDeleteMaquinaria;
/
