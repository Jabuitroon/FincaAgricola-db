-- Insertar Cliente
CREATE OR REPLACE PROCEDURE procInsertClient(
    v_nombre     IN VARCHAR2,
    v_correo     IN VARCHAR2,
    v_contrasena IN VARCHAR2,
    v_direccion  IN VARCHAR2,
    v_ciudad     IN VARCHAR2,
    v_result     OUT NUMBER
)
IS
BEGIN
    INSERT INTO tbl_cliente (
        cli_nombre, 
        cli_correo, 
        cli_contrasena, 
        cli_direccion, 
        cli_ciudad
    ) VALUES (
        v_nombre, 
        v_correo, 
        v_contrasena, 
        v_direccion, 
        v_ciudad
    );

    v_result := SQL%ROWCOUNT;
END procInsertClient;
/

--Ver clientes
CREATE OR REPLACE VIEW vw_clientes AS
SELECT 
        cli_id, 
        cli_nombre, 
        cli_correo, 
        cli_contrasena, 
        cli_direccion, 
        cli_ciudad
    FROM tbl_cliente;

-- Seleccionar el id y nombre del cliente 
CREATE OR REPLACE VIEW wv_clientes_ddl AS
    SELECT 
        cli_id, 
        cli_nombre AS NombreCompleto
    FROM tbl_cliente;

-- Actualizar
CREATE OR REPLACE PROCEDURE procUpdateClient(
    v_id         IN NUMBER,
    v_nombre     IN VARCHAR2,
    v_correo     IN VARCHAR2,
    v_contrasena IN VARCHAR2,
    v_direccion  IN VARCHAR2,
    v_ciudad     IN VARCHAR2,
    v_result     OUT NUMBER
)
IS
    v_exist NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_exist
    FROM tbl_cliente
    WHERE cli_id = v_id;

    IF v_exist = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cliente no existente');
    ELSE
        UPDATE tbl_cliente
        SET 
            cli_nombre     = v_nombre,
            cli_correo     = v_correo,
            cli_contrasena = v_contrasena,
            cli_direccion  = v_direccion,
            cli_ciudad     = v_ciudad
        WHERE cli_id = v_id;

        v_result := SQL%ROWCOUNT;
    END IF;
END procUpdateClient;
/

-- Eliminar
CREATE OR REPLACE PROCEDURE procDeleteClient(
    v_id     IN NUMBER,
    v_result OUT NUMBER
)
IS
    v_exist NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_exist
    FROM tbl_cliente
    WHERE cli_id = v_id;

    IF v_exist = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Cliente no existente');
    ELSE
        DELETE FROM tbl_cliente
        WHERE cli_id = v_id;

        v_result := SQL%ROWCOUNT;
    END IF;
END procDeleteClient;
/