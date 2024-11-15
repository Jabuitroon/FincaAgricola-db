-- Cultivo
-- Insertar
DELIMITER //
create procedure procInsertCrop(IN v_nombre VARCHAR(45), IN v_description VARCHAR(100), IN v_parcela_id int)
begin
      insert into tbl_cultivo(cul_nombre, cul_descripcion, tbl_parcela_par_id) values(v_nombre, v_description, v_parcela_id);
end//
DELIMITER ;
-- Actualizar
DELIMITER //
create procedure procUpdateCrop(IN v_id INT ,IN v_nombre VARCHAR(45), IN v_descripcion VARCHAR(100), IN v_parcela_id int)
begin
     update tbl_cultivo
     set cul_nombre = v_nombre , cul_descripcion = v_descripcion, tbl_parcela_par_id = v_parcela_id
     where cul_id = v_id;
end//
DELIMITER ;
-- Mostrar
DELIMITER //
create procedure procSelectCrop()
begin
	select cul_id AS cultivo_id, cul_nombre, cul_descripcion , tbl_parcela_par_id, tbl_parcela.par_ubicacion
	AS Parcela_ubicacion
    FROM 
    tbl_cultivo
    INNER JOIN tbl_parcela
    ON tbl_cultivo.tbl_parcela_par_id = tbl_parcela.par_id;
end //
DELIMITER ;
-- Mostrar unicamente el id y la Nombre del cultivo
DELIMITER //
create procedure procSelectCropDDL()
BEGIN
	select cul_id, concat(cul_id, '',cul_nombre) as nombreCultivo
    from tbl_cultivo;
END //
DELIMITER ;
-- Eliminar
DELIMITER //
create procedure procDeleteCrop(IN v_id INT)
begin
     delete from tbl_cultivo where cul_id = v_id;
end//
DELIMITER ;