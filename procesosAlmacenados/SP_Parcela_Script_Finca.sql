-- Parcela
-- Insertar
DELIMITER //
CREATE PROCEDURE `procParcelaprocParcela`(IN v_dimensiones int, IN v_ubicacion VARCHAR(45) )
begin
      insert into tbl_parcela(par_dimensiones, par_ubicacion) values(v_dimensiones, v_ubicacion);
end//
DELIMITER ;  
-- Actualizar
DELIMITER //
create procedure procUpdateParcela(IN v_id INT ,IN v_dimensiones int, IN v_ubicacion VARCHAR(45))
begin
	
     update tbl_parcela
     set par_dimensiones = v_dimensiones, par_ubicacion = v_ubicacion
     where par_id = v_id;
     
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectParcela()
begin
     select par_id, par_dimensiones, par_ubicacion from tbl_parcela;
end//
DELIMITER ;
-- Seleccionar el id y la ubicación de la parcela 
DELIMITER //
CREATE PROCEDURE spSelectParcelaDDL()
BEGIN
	select par_id, par_ubicacion as ubicacionParcela
    from tbl_parcela;
END//
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteParcela(IN v_id INT)
begin
     delete from tbl_parcela where par_id = v_id;
end//
DELIMITER ;