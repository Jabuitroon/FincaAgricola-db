-- Insumo
-- Insertar
DELIMITER //
CREATE PROCEDURE procInsertInput(IN v_nombre VARCHAR(45), IN v_tipo VARCHAR(45), IN v_cantidad VARCHAR(45),IN vfk_cultivo INT, IN vfk_parcela INT)
begin
      insert into tbl_insumo(ins_nombre, ins_tipo, ins_cantidad, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id) values(v_nombre, v_tipo, v_cantidad, vfk_cultivo, vfk_parcela);
end //
DELIMITER ;
-- Actualizar
DELIMITER //
create procedure procUpdateInput(IN v_id INT ,IN v_nombre VARCHAR(45), IN v_tipo VARCHAR(45), IN v_cantidad VARCHAR(45),IN vfk_cultivo INT, IN vfk_parcela INT)
begin
     update tbl_insumo
     set ins_nombre = v_nombre, ins_tipo = v_tipo, ins_cantidad = v_cantidad, tbl_cultivo_cul_id = vfk_cultivo, tbl_cultivo_tbl_parcela_par_id = vfk_parcela
     where ins_id = v_id;
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectInput()
begin
     select ins_id, ins_nombre, ins_tipo, ins_cantidad, tbl_cultivo_cul_id, tbl_cultivo_tbl_parcela_par_id from tbl_insumo;
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectInputDDL()
begin
     select ins_id,concat(ins_id, ' ',ins_nombre) as nombre from tbl_insumo;
end//
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteInput(IN v_id INT)
begin
     delete from tbl_insumo where ins_id = v_id;
end//
DELIMITER ;