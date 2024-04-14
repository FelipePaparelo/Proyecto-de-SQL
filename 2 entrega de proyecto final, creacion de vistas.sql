USE SISTEMA_DE_RESERVAS;

-- Vista para ver todas las reservas que se han realizado a lo largo del tiempo
CREATE VIEW VW_TodasLasReservas AS
SELECT * FROM Reservas;

-- --------------------------------------------------------------------------------------
-- Vista para ver la informacion de todas las habitaciones
CREATE VIEW VW_InformacionDeHabitaciones AS
SELECT habitacion_id, tipo_habitacion, descripcion, precio_por_noche, estado
FROM habitaciones;

-- --------------------------------------------------------------------------------------
-- Vista para ver la informacion de todos los clientes
CREATE VIEW VW_DetallesDeClientes AS
SELECT cliente_dni, nombre, apellido, email, telefono
FROM clientes;

-- --------------------------------------------------------------------------------------
-- Vista pare ver los datos de los clientes que hicieron una reserva ordenado por reserva_id en form ascendente
CREATE VIEW VW_DatosDeClientesPorReserva AS
SELECT reserva_id, reservas.cliente_id, clientes.nombre, clientes.apellido, clientes.cliente_dni
from reservas join clientes on reservas.cliente_id =  clientes.cliente_id order by reservas.reserva_id asc;

-- --------------------------------------------------------------------------------------
-- Vista para ver los datos de la habitacion que reservo cada cliente
CREATE VIEW VW_DatosDehabitacionPorReserva AS
SELECT reserva_id, habitaciones.habitacion_id, habitaciones.tipo_habitacion, habitaciones.descripcion, habitaciones.precio_por_noche, habitaciones.estado
from reservas join habitaciones on reservas.habitacion_id =  habitaciones.habitacion_id order by reservas.reserva_id asc;


