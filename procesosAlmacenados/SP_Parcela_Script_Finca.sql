-- Parcela
-- Insertar
DELIMITER //
CREATE PROCEDURE procInsertParcela(IN v_dimensiones int, IN v_ubicacion VARCHAR(45), IN vfk_finca int, IN vfk_clima int)
begin
      insert into tbl_parcela(par_dimensiones, par_ubicacion, tbl_finca_fin_id, tbl_clima_clim_id) values(v_dimensiones, v_ubicacion, vfk_finca, vfk_clima);
end//
DELIMITER ;  
-- Actualizar
DELIMITER //
create procedure procUpdateParcela(IN v_id INT ,IN v_dimensiones int, IN v_ubicacion VARCHAR(45), IN vfk_finca int, IN vfk_clima int)
begin
	
     update tbl_parcela
     set par_dimensiones = v_dimensiones, par_ubicacion = v_ubicacion, tbl_finca_fin_id = vfk_finca, tbl_clima_clim_id = vfk_clima
     where par_id = v_id;
     
end//
DELIMITER ;


-- Mostrar
DELIMITER //
create procedure procSelectParcela()
begin
	select par_id As parcela_id, par_dimensiones, par_ubicacion, tbl_finca_fin_id, 
    tbl_finca.fin_nombre AS Finca_nombre, tbl_clima_clim_id, tbl_clima.clim_temperatura
    FROM 
    tbl_parcela
    INNER JOIN tbl_finca
    ON tbl_parcela.tbl_finca_fin_id = tbl_finca.fin_id
    INNER JOIN 
    tbl_clima
    ON tbl_parcela.tbl_clima_clim_id = tbl_clima.clim_id;
end//
-- Eliminar
DELIMITER //
create procedure procDeleteParcela(IN v_id INT)
begin
     delete from tbl_parcela where par_id = v_id;
end//
DELIMITER ;