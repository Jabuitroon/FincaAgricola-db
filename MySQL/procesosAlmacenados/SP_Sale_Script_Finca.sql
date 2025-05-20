-- Venta
-- Insertar
DELIMITER //
create procedure procInsertSale(IN vfk_pro_id INT, IN tbl_pro_tbl_prov INT, IN tbl_pro_tbl_cat INT, IN vfk_cliente int, IN v_fecha DATE, IN v_total INT)
begin
      insert into tbl_venta(tbl_productos_pro_id, tbl_productos_tbl_proveedor_pro_id, tbl_productos_tbl_categoria_cat_id, tbl_cliente_cli_id, ven_fecha, ven_total) values(vfk_pro_id, tbl_pro_tbl_prov, tbl_pro_tbl_cat, vfk_cliente, v_fecha, v_total);
end//
DELIMITER ;

-- Insertar 2 (Simplificado)
DELIMITER //
create procedure spInsertSale(IN v_fecha DATE, IN vfk_pro_id INT, IN vfk_cliente int, IN v_total INT)
begin
    DECLARE prov INT;
    DECLARE cat INT;

    SELECT tbl_proveedor_pro_id, tbl_categoria_cat_id
    INTO prov, cat
    from tbl_productos where tbl_productos.pro_id = vfk_pro_id;    
    insert into tbl_venta(ven_fecha, tbl_productos_pro_id, tbl_cliente_cli_id, ven_total, tbl_productos_tbl_proveedor_pro_id, tbl_productos_tbl_categoria_cat_id) values(v_fecha, vfk_pro_id,  vfk_cliente, v_total, prov, cat);
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectSale()
begin
    select
     ven_id as 'Venta ID',
     ven_fecha as 'Fecha',
     concat(tbl_productos.pro_id, ' ', tbl_productos.pro_nombre) as 'ID / Nombre del Producto',
	 concat(tbl_cliente.cli_id, ' ', tbl_cliente.cli_nombre) as 'ID / Nombre del Cliente',
     ven_total as 'Total'
     FROM tbl_cliente
	 JOIN tbl_venta
        ON tbl_cliente.cli_id = tbl_venta.tbl_cliente_cli_id
	 JOIN tbl_productos
        ON tbl_productos.pro_id = tbl_venta.tbl_productos_pro_id;  
end//
DELIMITER ;
-- Actualizar
DELIMITER //
create procedure procUpdateSale(IN v_id int, vfk_pro_id INT, IN tbl_pro_tbl_prov INT, IN tbl_pro_tbl_cat INT, IN vfk_cliente int, IN v_fecha DATE, IN v_total INT)
begin
     update tbl_venta
     set tbl_productos_pro_id = vfk_pro_id,
		 tbl_productos_tbl_proveedor_pro_id = tbl_pro_tbl_prov,
         tbl_productos_tbl_categoria_cat_id = tbl_pro_tbl_cat,
         tbl_cliente_cli_id= vfk_cliente.
         ven_fecha= v_fecha,
         ven_total = v_total
     where ven_id = v_id;
end//
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteSale(IN v_id INT)
begin
     delete from tbl_venta where ven_id = v_id;
end//
DELIMITER ;