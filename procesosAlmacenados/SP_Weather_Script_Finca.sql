-- Clima
-- Insertar
DELIMITER //
CREATE PROCEDURE procInsertWeather(IN vfk_parcela int, IN v_temp VARCHAR(45), IN v_hum VARCHAR(100))
begin
      insert into tbl_clima(tbl_parcela_par_id, clim_temperatura, clim_humedad) values(vfk_parcela, v_temp, v_hum);
end //
DELIMITER ;
-- Actualizar
DELIMITER //
create procedure procUpdateWeather(IN v_id INT ,IN v_temperatura VARCHAR(45), IN v_humedad VARCHAR(45))
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
create procedure procSelectWeather()
begin
     select clim_id, clim_temperatura, clim_humedad from tbl_clima;
end//
DELIMITER ;
-- Mostrar unicamente el id y la temperatura
DELIMITER //
create procedure procSelectWeatherDDL()
begin
     select clim_id,concat(clim_id, '',clim_temperatura) as temperatura
    from tbl_clima;
end//
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteWeather(IN v_id INT)
begin
     delete from tbl_clima where clim_id = v_id;
end//
DELIMITER ;