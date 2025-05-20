--Guardar Insumos
CREATE OR REPLACE PROCEDURE procInsertInput(
    v_nombre IN VARCHAR2,
    v_tipo IN VARCHAR2,
    v_cantidad IN VARCHAR2,
    vfk_cultivo IN NUMBER,
    vfk_parcela IN NUMBER,
    v_result OUT NUMBER
)
IS
BEGIN
    INSERT INTO tbl_insumo (
        ins_nombre,
        ins_tipo,
        ins_cantidad,
        tbl_cultivo_cul_id,
        tbl_parcela_par_id
    ) VALUES (
        v_nombre,
        v_tipo,
        v_cantidad,
        vfk_cultivo,
        vfk_parcela
    );
    v_result := SQL%ROWCOUNT;
END procInsertInput;
/

--Mostrar Insumos
CREATE OR REPLACE VIEW vw_insumos_cultivo_parcela AS
SELECT 
    i.ins_id,
    i.ins_nombre, 
    i.ins_tipo, 
    i.ins_cantidad, 
    i.tbl_cultivo_cul_id AS cultivo_id,
    c.cul_nombre AS cultivo_nombre,
    p.par_id AS parcela_id,
    p.par_ubicacion AS parcela_ubicacion
FROM tbl_insumo i
JOIN tbl_cultivo c ON i.tbl_cultivo_cul_id = c.cul_id
JOIN tbl_parcela p ON i.tbl_parcela_par_id = p.par_id;

--Insumos DDL
CREATE OR REPLACE VIEW vw_input_ddl AS
SELECT 
    ins_id, 
    ins_id || ' ' || ins_nombre AS nombreInsumo
FROM tbl_insumo;

--Actualizar Insumos
CREATE OR REPLACE PROCEDURE procUpdateInput(
    v_id IN NUMBER,
    v_nombre IN VARCHAR2,
    v_tipo IN VARCHAR2,
    v_cantidad IN VARCHAR2,
    vfk_cultivo IN NUMBER,
    vfk_parcela IN NUMBER,
    v_result OUT NUMBER
)
IS
BEGIN
    UPDATE tbl_insumo
    SET
        ins_nombre = v_nombre,
        ins_tipo = v_tipo,
        ins_cantidad = v_cantidad,
        tbl_cultivo_cul_id = vfk_cultivo,
        tbl_parcela_par_id = vfk_parcela
    WHERE ins_id = v_id;
    v_result := SQL%ROWCOUNT;
END procUpdateInput;
/

--Eliminar Insumo
CREATE OR REPLACE PROCEDURE procDeleteInput(
    v_id IN NUMBER,
    v_result OUT NUMBER
)
IS
BEGIN
    DELETE FROM tbl_insumo
    WHERE ins_id = v_id;
    v_result := SQL%ROWCOUNT;
END procDeleteInput;
/