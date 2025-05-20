-- Procedimiento para insertar un cultivo
CREATE OR REPLACE PROCEDURE procInsertCrop(
    v_nombre IN VARCHAR2, 
    v_description IN VARCHAR2, 
    v_parcela_id IN NUMBER,
    v_result OUT NUMBER
)
IS
BEGIN
    INSERT INTO tbl_cultivo (cul_nombre, cul_descripcion, tbl_parcela_par_id)
    VALUES (v_nombre, v_description, v_parcela_id);
    v_result := SQL%ROWCOUNT;
END procInsertCrop;
/

CREATE OR REPLACE VIEW vw_cultivos_parcela AS
SELECT 
    cul_id AS cultivo_id, 
    cul_nombre, 
    cul_descripcion, 
    tbl_parcela_par_id, 
    tbl_parcela.par_ubicacion AS parcela_ubicacion
FROM tbl_cultivo
JOIN tbl_parcela ON tbl_cultivo.tbl_parcela_par_id = tbl_parcela.par_id;
/

-- Vista para mostrar solo ID y nombre del cultivo
CREATE OR REPLACE VIEW vw_crop_ddl AS
SELECT 
    cul_id, 
    cul_id || ' ' || cul_nombre AS nombreCultivo
FROM tbl_cultivo;
/

-- Procedimiento para actualizar un cultivo
CREATE OR REPLACE PROCEDURE procUpdateCrop(
    v_id IN NUMBER,
    v_nombre IN VARCHAR2, 
    v_descripcion IN VARCHAR2, 
    v_parcela_id IN NUMBER,
v_result OUT NUMBER
)
IS
BEGIN
    UPDATE tbl_cultivo
    SET 
        cul_nombre = v_nombre,
        cul_descripcion = v_descripcion,
        tbl_parcela_par_id = v_parcela_id
    WHERE cul_id = v_id;
v_result := SQL%ROWCOUNT;
END procUpdateCrop;
/

-- Procedimiento para eliminar un cultivo
CREATE OR REPLACE PROCEDURE procDeleteCrop(
    v_id IN NUMBER,
    v_result OUT NUMBER
)
IS
BEGIN
    DELETE FROM tbl_cultivo 
    WHERE cul_id = v_id;
    v_result := SQL%ROWCOUNT;
END procDeleteCrop;
/