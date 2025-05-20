-- Mostrar ID y nombre concatenado (para DDL)
CREATE OR REPLACE PROCEDURE procSelectCategoryDDL(
    p_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_cursor FOR
        SELECT cat_id, cat_id || ' ' || cat_nombre AS nombre
        FROM tbl_categoria;
END procSelectCategoryDDL;
/

-- Eliminar categoría
CREATE OR REPLACE PROCEDURE procDeleteCategory(
    v_id     IN NUMBER,
    v_result OUT NUMBER
)
IS
BEGIN
    DELETE FROM tbl_categoria WHERE cat_id = v_id;
    v_result := SQL%ROWCOUNT;
END procDeleteCategory;
/