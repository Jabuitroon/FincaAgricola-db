-- Categorias
-- Insertar
DELIMITER //
create procedure procInsertCategory(IN v_nombre VARCHAR(45), IN v_description VARCHAR(100))
begin
      insert into tbl_categoria(cat_nombre, cat_descripcion) values(v_nombre, v_description);
end//
DELIMITER ;
-- Actualizar
DELIMITER //
create procedure procUpdateCategory(IN v_id INT ,IN v_nombre VARCHAR(45), IN v_descripcion VARCHAR(100))
begin
	 update tbl_categoria
     set cat_nombre = v_nombre
     where cat_id = v_id;
     update tbl_categoria
     set cat_descripcion = v_descripcion
     where cat_id = v_id;
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectCategory()
begin
     select cat_id, cat_nombre, cat_descripcion from tbl_categoria;
end//
DELIMITER ;
-- Mostrar unicamente el nombre 
DELIMITER //
create procedure procSelectCategoryDDL()
begin
     select cat_id, cat_nombre as nombre from tbl_categoria;
end//
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteCategory(IN v_id INT)
begin
     delete from tbl_categoria where cat_id = v_id;
end//
DELIMITER ;