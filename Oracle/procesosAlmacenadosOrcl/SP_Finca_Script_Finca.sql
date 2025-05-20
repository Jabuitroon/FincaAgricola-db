-- Finca
-- Insertar
CREATE OR REPLACE PROCEDURE procInsertFinca(
    v_nombre IN VARCHAR2, 
    v_ubicacion IN VARCHAR2,
    v_result OUT NUMBER
)
IS
BEGIN
    INSERT INTO tbl_finca(fin_nombre, fin_ubicacion)
    VALUES (v_nombre, v_ubicacion);
    v_result := SQL%ROWCOUNT;
END procInsertFinca;

-- Mostrar
create or replace procedure procSelectFinca(p_cursor OUT SYS_REFCURSOR)
IS
BEGIN
     OPEN p_cursor FOR select fin_id, fin_nombre, fin_ubicacion from tbl_finca;
end procSelectFinca;

-- Mostrar el id y el nombre
CREATE OR REPLACE PROCEDURE procSelectFincaDDL(p_cursor OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_cursor FOR
        select fin_id, fin_id || ' ' || fin_nombre as nombre from tbl_finca;
END procSelectFincaDDL;

-- Actualizar
create or replace procedure procUpdateFinca(v_id IN INT , v_nombre IN VARCHAR2, v_ubicacion IN VARCHAR2, v_result OUT NUMBER)
IS
BEGIN
	 update tbl_finca
     set fin_nombre = v_nombre
     where fin_id = v_id;
     update tbl_finca
     set fin_ubicacion = v_ubicacion
     where fin_id = v_id;
     v_result := SQL%ROWCOUNT;
end procUpdateFinca;

-- Eliminar
CREATE OR REPLACE PROCEDURE procDeleteFinca(
    v_id IN INT,
    v_result OUT NUMBER
)
IS
    rows_deleted NUMBER;
BEGIN
    DELETE FROM tbl_finca WHERE fin_id = v_id;
    rows_deleted := SQL%ROWCOUNT;
    v_result := rows_deleted;
END procDeleteFinca;