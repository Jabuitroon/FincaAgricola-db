-- Finca
-- Insertar
DELIMITER //
create procedure procInsertFinca(IN v_nombre VARCHAR(45), IN v_ubicacion VARCHAR(45))
begin
      insert into tbl_finca(fin_nombre, fin_ubicacion) values(v_nombre, v_ubicacion);
end//
DELIMITER ;
-- Actualizar
DELIMITER //
create procedure procUpdateFinca(IN v_id INT ,IN v_nombre VARCHAR(45), IN v_ubicacion VARCHAR(45))
begin
	 update tbl_finca
     set fin_nombre = v_nombre
     where fin_id = v_id;
     update tbl_finca
     set fin_ubicacion = v_ubicacion
     where fin_id = v_id;
end//
DELIMITER ;
-- Mostrar el id y el nombre
DELIMITER //
create procedure procSelectFincaDDL()
begin
     select fin_id, fin_nombre as nombre from tbl_finca;
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectFinca()
begin
     select fin_id, fin_nombre, fin_ubicacion from tbl_finca;
end//
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteFinca(IN v_id INT)
begin
     delete from tbl_finca where fin_id = v_id;
end//
DELIMITER ;