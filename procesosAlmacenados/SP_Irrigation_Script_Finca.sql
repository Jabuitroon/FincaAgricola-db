-- Riego
-- Insertar
DELIMITER //
CREATE PROCEDURE procInsertIrrigation(IN v_tipo VARCHAR(45), IN v_cantidad_agua VARCHAR(45), IN v_frecuencia datetime, IN vfk_cultivo_id int, IN vfk_tbl_par_id int)
begin
      insert into tbl_riego(rie_tipo, rie_cantidad_agua, rie_frecuencia, tbl_cultivo_cul_idt, bl_cultivo_tbl_parcela_par_id) values(v_tipo, v_cantidad_agua, v_frecuencia, vfk_cultivo_id, vfk_tbl_par_id);
end //
DELIMITER ;
-- Coorregir todoooooooo
-- Actualizar
DELIMITER //
create procedure procUpdateIrrigation(IN v_id INT ,IN v_tipo VARCHAR(45), IN v_cantidad_agua VARCHAR(45), IN v_frecuencia datetime, IN vfk_cultivo_id int, IN vfk_tbl_par_id int)
begin
     update tbl_clima
     set clim_temperatura = v_temperatura
     where clim_id = v_id;
     update tbl_clima
     set clim_humedad = v_humedad
     where clim_id = v_id;
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectIrrigation()
begin
     select clim_id, clim_temperatura, clim_humedad from tbl_clima;
end//
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteWeather(IN v_id INT)
begin
     delete from tbl_clima where clim_id = v_id;
end//
DELIMITER ;