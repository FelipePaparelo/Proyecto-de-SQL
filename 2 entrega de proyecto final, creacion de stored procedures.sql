use sistema_de_reservas;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- stored procedure para ver los datos de las reservas que hizo un cliente filtrando por tipo de habitacion, puede ser basica, estandar o suite
DELIMITER //
CREATE PROCEDURE SP_datos_de_reservas_por_tipo_habitacion (IN tipohabitacion varchar(20))
BEGIN 
	SELECT reservas.reserva_id, reservas.cliente_id, reservas.habitacion_id, reservas.fecha_entrada, reservas.fecha_salida, 
	reservas.estado_reserva, habitaciones.tipo_habitacion, habitaciones.descripcion
    FROM reservas JOIN habitaciones 
    ON reservas.habitacion_id = habitaciones.habitacion_id 
    WHERE habitaciones.tipo_habitacion = tipohabitacion;
END //
DELIMITER ;


CALL SP_datos_de_reservas_por_tipo_habitacion ('suite'); -- pueden ser basica, estandar o suite

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------
-- stored procedure para ver todos los datos de las habitaciones filtrando por si estan libres o ocupadas
DELIMITER //
CREATE PROCEDURE SP_datos_de_habitacion_por_estado (IN estado_habitacion varchar(20))
BEGIN 
	select * from habitaciones where estado = estado_habitacion;
END //
DELIMITER ;

call SP_datos_de_habitacion_por_estado('libre') -- puede ser libre o ocupada

