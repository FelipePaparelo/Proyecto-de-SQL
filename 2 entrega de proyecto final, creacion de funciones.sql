use sistema_de_reservas;

-- -----------------------------------------------------------------------------------------

-- esta funcion calcula la cantidad de dias de hospedaje por reserva_id
DELIMITER //
CREATE FUNCTION calcular_dias_de_hospedaje(id_reserva INT) RETURNS INT
deterministic
BEGIN
    DECLARE fechaentrada DATE;
    DECLARE fechasalida DATE;
    DECLARE dias INT;

	SELECT fecha_entrada, fecha_salida INTO fechaentrada, fechasalida
    FROM reservas
    WHERE reserva_id = id_reserva;

    SET dias = DATEDIFF(fechasalida, fechaentrada);

    RETURN dias;
END//
DELIMITER ;

SELECT calcular_dias_de_hospedaje(10) AS dias_de_hospedaje;

-- -----------------------------------------------------------------------------------------

-- Funcion para ver el precio total de la reserva que haya realizado un cliente, obteniendo el precio total por todos los dias mas los servicios adicionales
DELIMITER //
CREATE FUNCTION precio_total(id_reserva INT) returns int
deterministic
BEGIN
	DECLARE CANTIDAD_DIAS INT;
    DECLARE PRECIO_POR_NOCHE_ INT;
    DECLARE PRECIO_TOTAL INT;
    DECLARE PRECIO_SERVICIO_ADICIONAL INT;
    
    SET CANTIDAD_DIAS = calcular_dias_de_hospedaje(ID_RESERVA);
    
    SELECT habitaciones.precio_por_noche INTO PRECIO_POR_NOCHE_ 
    FROM reservas join habitaciones 
    on reservas.habitacion_id = habitaciones.habitacion_id where reserva_id = id_reserva;
    
    SELECT servicios_adicionales.precio_adicional into PRECIO_SERVICIO_ADICIONAL
    FROM detalles_reserva join servicios_adicionales on detalles_reserva.servicio_id = servicios_adicionales.servicio_id
    where reserva_id = id_reserva;
    
    SET PRECIO_TOTAL = PRECIO_POR_NOCHE_ * CANTIDAD_DIAS;
    SET PRECIO_TOTAL = PRECIO_TOTAL + PRECIO_SERVICIO_ADICIONAL;
    
    RETURN PRECIO_TOTAL;
    
    
  
END //
DELIMITER ;

select precio_total(1) as PrecioTotal;


	
