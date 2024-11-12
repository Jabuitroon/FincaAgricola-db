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
         pro_precio= v_precio,
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
	select tbl_productos.pro_id AS producto_id, tbl_productos.pro_nombre, tbl_productos.pro_descripcion, 
    tbl_productos.pro_cantidad, tbl_productos.pro_precio, tbl_productos.pro_img, tbl_productos.tbl_proveedor_pro_id, 
    tbl_proveedor.pro_nombre AS proveedor_nombre, tbl_productos.tbl_categoria_cat_id, tbl_categoria.cat_nombre
    FROM 
    tbl_productos
    INNER JOIN tbl_proveedor
	ON tbl_productos.tbl_proveedor_pro_id = tbl_proveedor.pro_id
    INNER JOIN 
    tbl_categoria 
    ON tbl_productos.tbl_categoria_cat_id = tbl_categoria.cat_id;
end//
DELIMITER ;
-- Mostrar DDL
DELIMITER //
create procedure procSelectProductDDL()
BEGIN
	select pro_id, pro_nombre from tbl_productos;
END //
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteProduct(IN v_id INT)
begin
     delete from tbl_productos where pro_id = v_id;
end//
DELIMITER ;
