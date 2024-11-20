-- Riego
-- Insertar
DELIMITER //
CREATE PROCEDURE procInsertIrrigation(IN v_tipo VARCHAR(45), IN v_cantidad_agua VARCHAR(45), IN v_frecuencia VARCHAR(20), IN vfk_cultivo_id int, IN vfk_tbl_par_id int)
begin
      insert into tbl_riego(rie_tipo, rie_cantidad_agua, rie_frecuencia, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id) values(v_tipo, v_cantidad_agua, v_frecuencia, vfk_cultivo_id, vfk_tbl_par_id);
end //
DELIMITER ;
-- Actualizar
DELIMITER //
create procedure procUpdateIrrigation(IN v_id INT , IN v_tipo VARCHAR(45), IN v_cantidad_agua VARCHAR(45), IN v_frecuencia VARCHAR(20), IN vfk_cultivo_id int, IN vfk_tbl_par_id int)
begin
     update tbl_riego
     set rie_tipo = v_tipo, rie_cantidad_agua = v_cantidad_agua, rie_frecuencia = v_frecuencia, tbl_cultivo_cul_id = vfk_cultivo_id, tbl_cultivo_tbl_parcela_par_id = vfk_tbl_par_id
     where rie_id = v_id;
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelecIrrigation()
begin
     select rie_id, rie_tipo, rie_cantidad_agua, rie_frecuencia, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id from tbl_riego;
end//
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteIrrigation(IN v_id INT)
begin
     delete from tbl_riego where rie_id = v_id;
end//
DELIMITER ;