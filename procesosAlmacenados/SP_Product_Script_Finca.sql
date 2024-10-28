-- Producto
-- Insertar
DELIMITER //
create procedure procInsertProduct(IN v_nombre VARCHAR(45), IN v_description VARCHAR(100), IN v_cantidad int, IN v_precio int, IN v_img text, IN vfk_proveedor int, IN vfk_categorias int)
begin
      insert into tbl_productos(pro_nombre, pro_descripcion, pro_cantidad, pro_precio, pro_img, tbl_proveedor_pro_id, tbl_categoria_cat_id) values(v_nombre, v_description, v_cantidad, v_precio, v_img, vfk_proveedor, vfk_categorias);
end//
DELIMITER ;
-- Actualizar
DELIMITER //
create procedure procUpdateProduct(IN v_id int, IN v_nombre VARCHAR(45), IN v_descripcion VARCHAR(100), IN v_cantidad int, IN v_precio int, IN v_img text, IN vfk_proveedor int, IN vfk_categorias int)
begin
     update tbl_productos
     set pro_nombre = v_nombre,
		 pro_descripcion = v_descripcion,
         pro_cantidad= v_cantidad,
         pro_precio= v_precio.
         pro_img= v_img,
         tbl_proveedor_pro_id = vfk_proveedor,
         tbl_categoria_cat_id = vfk_categorias
     where pro_id = v_id;
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectProduct()
begin
     select pro_nombre, pro_descripcion, pro_cantidad, pro_precio, pro_img, tbl_proveedor_pro_id, tbl_categoria_cat_id from tbl_productos;
end//
DELIMITER ;
create procedure spSelectProductDDL()
BEGIN
	select pro_id, pro_nombre as NombreProducto
    from tbl_productos;
END
-- Eliminar
DELIMITER //
create procedure procDeleteProduct(IN v_id INT)
begin
     delete from tbl_productos where pro_id = v_id;
end//
DELIMITER ;
