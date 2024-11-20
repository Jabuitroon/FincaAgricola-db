    -- select tbl_productos_pro_id, tbl_productos_tbl_proveedor_pro_id, tbl_productos_tbl_categoria_cat_id, tbl_cliente_cli_id, ven_fecha, ven_total from tbl_venta;
	-- Un select para mostrar el producto correspondiente al cliente
    select
     ven_fecha,
     tbl_productos.pro_id,
     tbl_productos.pro_nombre,
     tbl_cliente.cli_nombre,
     ven_total
     FROM tbl_cliente
	 JOIN tbl_venta
        ON tbl_cliente.cli_id = tbl_venta.tbl_cliente_cli_id
	 JOIN tbl_productos
        ON tbl_productos.pro_id = tbl_venta.tbl_productos_pro_id
