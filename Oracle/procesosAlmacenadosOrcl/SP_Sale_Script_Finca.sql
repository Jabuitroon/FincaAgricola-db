-- Venta Insertar
CREATE OR REPLACE PROCEDURE spInsertSale (
    v_fecha        IN DATE,
    vfk_pro_id     IN NUMBER,
    vfk_cliente    IN NUMBER,
    v_total        IN NUMBER
) AS
BEGIN
    INSERT INTO tbl_venta (
        ven_fecha,
        tbl_producto_pro_id,
        tbl_cliente_cli_id,
        ven_total
    )
    VALUES (
        v_fecha,
        vfk_pro_id,
        vfk_cliente,
        v_total
    );
END spInsertSale;
/

-- Mostrar
CREATE OR REPLACE VIEW vw_ventas AS
        SELECT
            v.ven_id AS "Venta ID",
            v.ven_fecha AS "Fecha",
            p.pro_id || ' ' || p.pro_nombre AS "ID / Nombre del Producto",
            c.cli_id || ' ' || c.cli_nombre AS "ID / Nombre del Cliente",
            v.ven_total AS "Total"
        FROM tbl_venta v
        JOIN tbl_cliente c ON c.cli_id = v.tbl_cliente_cli_id
        JOIN tbl_producto p ON p.pro_id = v.tbl_producto_pro_id;

-- Actualizar
CREATE OR REPLACE PROCEDURE procUpdateSale (
    v_id            IN NUMBER,
    vfk_pro_id      IN NUMBER,
    vfk_cliente     IN NUMBER,
    v_fecha         IN DATE,
    v_total         IN NUMBER,
v_result OUT NUMBER
) AS
BEGIN
    UPDATE tbl_venta
    SET
        tbl_producto_pro_id = vfk_pro_id,
        tbl_cliente_cli_id = vfk_cliente,
        ven_fecha = v_fecha,
        ven_total = v_total
    WHERE ven_id = v_id;
v_result := SQL%ROWCOUNT;
END procUpdateSale;
/

-- Eliminar
CREATE OR REPLACE PROCEDURE procDeleteSale (
    v_id IN NUMBER,
    v_result OUT NUMBER
) AS
BEGIN
    DELETE FROM tbl_venta
    WHERE ven_id = v_id;
    v_result := SQL%ROWCOUNT;
END procDeleteSale;
/