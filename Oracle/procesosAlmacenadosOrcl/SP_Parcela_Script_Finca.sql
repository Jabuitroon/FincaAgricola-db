-- INSERTAR PARCELA
CREATE OR REPLACE PROCEDURE procInsertParcela(v_dimensiones IN NUMBER, v_ubicacion IN VARCHAR2, v_temperatura IN DOUBLE, v_humedad IN DOUBLE, vfk_finca IN NUMBER, v_result OUT NUMBER)
IS
BEGIN
        INSERT INTO tbl_parcela (par_dimensiones, par_ubicacion, par_temperatura, par_humedad, tbl_finca_fin_id)
        VALUES (v_dimensiones, v_ubicacion, v_temperatura, v_humedad, vfk_finca);
        v_result := SQL%ROWCOUNT;
END procInsertParcela;
/

-- VER TODAS LAS PARCELAS
CREATE OR REPLACE PROCEDURE procSelectParcela(
    p_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
SELECT      p.par_id AS parcela_id,
            p.par_dimensiones,
            p.par_ubicacion,
            p.par_temperatura,
            p.par_humedad,
            p.tbl_finca_fin_id,
            f.fin_nombre AS finca_nombre
        FROM tbl_parcela p
        INNER JOIN tbl_finca f ON p.tbl_finca_fin_id = f.fin_id;
END procSelectParcela;
/

-- MOSTRAR PARCELAS PARA DDL
CREATE OR REPLACE PROCEDURE procSelectParcelaDDL(
    p_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cursor FOR
        SELECT par_id, 'Parcela N° ' || par_id AS nombre
        FROM tbl_parcela;
END procSelectParcelaDDL;
/

-- ACTUALIZAR PARCELA
CREATE OR REPLACE PROCEDURE procUpdateParcela(
    v_id          IN NUMBER,
    v_dimensiones IN NUMBER,
    v_ubicacion   IN VARCHAR2,
    v_Temperatura IN NUMBER,
    v_Humedad     IN NUMBER,
    vfk_finca     IN NUMBER,
    v_result      OUT NUMBER
)
IS
BEGIN
    UPDATE tbl_parcela
        SET par_dimensiones = v_dimensiones,
            par_ubicacion = v_ubicacion,
            par_temperatura = v_Temperatura,
            par_humedad = v_Humedad,
            tbl_finca_fin_id = vfk_finca
        WHERE par_id = v_id;
        v_result := SQL%ROWCOUNT;
END procUpdateParcela;
/

-- ELIMINAR PARCELA
CREATE OR REPLACE PROCEDURE procDeleteParcela(
    v_id IN INT,
    v_result OUT NUMBER
)
IS
    rows_deleted NUMBER;
BEGIN
    DELETE FROM tbl_parcela WHERE par_id = v_id;
    v_result := SQL%ROWCOUNT;
END procDeleteParcela;
/