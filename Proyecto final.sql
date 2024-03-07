-- DROP schema if exists sistema_de_reservas;
-- CREATE schema if not exists sistema_de_reservas;
USE sistema_de_reservas;

-- CREACION DE TABLAS DE LA BASE DE DATOS

-- TABLA CLIENTES
CREATE TABLE IF NOT EXISTS CLIENTES(
cliente_id INT NOT NULL, -- cliente_id --> primary key
cliente_dni INT NOT NULL, -- cliente_dni --> candidate key
nombre VARCHAR(30),
apellido VARCHAR(30),
email VARCHAR (50),
telefono INT,
PRIMARY KEY (cliente_id, cliente_dni)
);

-- TABLA HABITACIONES
CREATE TABLE IF NOT EXISTS HABITACIONES(
habitacion_id INT NOT NULL, -- habitacion_id --> primary key
tipo_habitacion VARCHAR(30),
descripcion TEXT(1000),
precio_por_noche VARCHAR(10),
estado VARCHAR(20),
PRIMARY KEY (habitacion_id)
);

-- TABLA RESERVAS
CREATE TABLE IF NOT EXISTS RESERVAS(
reserva_id INT NOT NULL, -- reserva_id --> primary key
cliente_id INT NOT NULL, -- cliente_id --> candidate key
habitacion_id INT NOT NULL, -- habitacion_id --> candidate key
fecha_entrada DATE,
fecha_salida DATE,
estado_reserva VARCHAR(20),
PRIMARY KEY (reserva_id, cliente_id, habitacion_id)
);

-- TABLA SERVICIOS_ADICIONALES
CREATE TABLE IF NOT EXISTS SERVICIOS_ADICIONALES(
servicio_id int not null,
nombre_servicio VARCHAR(30),
precio_adicional int,
PRIMARY KEY (servicio_id)
);

-- TABLA DETALLES_RESERVA
CREATE TABLE IF NOT EXISTS DETALLES_RESERVA(
detalle_id int not null, -- detalle_id --> primary key
reserva_id int not null, -- reserva_id --> candidate key
servicio_id int not null, -- servicio_id --> candidate key
cantidad int,
PRIMARY KEY (detalle_id, reserva_id, servicio_id)
);

-- foreign keys
-- cliente_id de reservas a cliente id de clientes
ALTER TABLE reservas 
ADD CONSTRAINT fk_cliente_id 
FOREIGN KEY fk_clientes (cliente_id)
REFERENCES clientes (cliente_id);

-- habitacion_id de reservas a habitacion_id de habitaciones
ALTER TABLE reservas
ADD CONSTRAINT fk_habitacion_id
FOREIGN KEY fk_habitacion_id (habitacion_id)
REFERENCES habitaciones (habitacion_id);

-- reserva_id de detalles_reserva a reserva_id de reservas
ALTER TABLE detalles_reserva
ADD CONSTRAINT fk_reserva_id
FOREIGN KEY fk_reserva_id (reserva_id)
REFERENCES reservas (reserva_id);

-- servicio_id de detalles_reserva a servicio_id de servicios_adicionales
ALTER TABLE detalles_reserva
ADD CONSTRAINT fk_servicio_id
FOREIGN KEY fk_servicio_id (servicio_id)
REFERENCES servicios_adicionales (servicio_id)



