USE sistema_de_reservas;

-- SERT INTO clientes (cliente_dni, nombre, apellido, email, telefono) VALUES
(11111111, 'Juan', 'Pérez', 'juan@hotmail.com', '123456789'),
2222222, 'María', 'González', 'maria@hotmail.com', '987654321'),
(33333333, 'Pedro', 'Sánchez', 'pedro@hotmail.com', '456789123'),
(44444444, 'Laura', 'Martínez', 'laura@hotmail.com', '789123456'),
(55555555, 'Ana', 'López', 'ana@hotmail.com', '321654987'),
(66666666, 'David', 'Rodríguez', 'david@hotmail.com', '654987321'),
(77777777, 'Sofía', 'Hernández', 'sofia@hotmail.com', '987321654'),
(88888888, 'Pablo', 'Díaz', 'pablo@hotmail.com', '123987456'),
(99999999, 'Elena', 'Fernández', 'elena@hotmail.com', '456321789'),
(10101010, 'Carlos', 'Ruiz', 'carlos@hotmail.com', '789456123'),
(11111112, 'Carmen', 'Sanz', 'carmen@hotmail.com', '159753456'),
(12121212, 'Luis', 'García', 'luis@hotmail.com', '357951468'),
(13131313, 'Marta', 'Jiménez', 'marta@hotmail.com', '852369741'),
(14141414, 'Javier', 'Moreno', 'javier@hotmail.com', '369852147'),
(15151515, 'Silvia', 'Torres', 'silvia@hotmail.com', '741258963');

-- INSERT INTO habitaciones (tipo_habitacion, descripcion, precio_por_noche, estado) VALUES
('suite', 'Suite de lujo con vista al mar', 200.00, 'libre'),
('estandar', 'Habitación estándar con cama doble', 100.00, 'libre'),
('estandar', 'Habitación estándar con dos camas individuales', 100.00, 'libre'),
('basica', 'Habitación básica con cama individual', 50.00, 'libre'),
('suite', 'Suite de lujo con jacuzzi', 250.00, 'libre'),
('estandar', 'Habitación estándar con vista a la piscina', 120.00, 'libre'),
('basica', 'Habitación básica con baño compartido', 40.00, 'libre'),
('suite', 'Suite de lujo con terraza privada', 220.00, 'libre'),
('estandar', 'Habitación estándar con balcón', 110.00, 'libre'),
('basica', 'Habitación básica con ventilador de techo', 45.00, 'libre'),
('suite', 'Suite de lujo con minibar', 230.00, 'libre'),
('estandar', 'Habitación estándar con TV de pantalla plana', 115.00, 'libre'),
('basica', 'Habitación básica con baño privado', 55.00, 'libre'),
('suite', 'Suite de lujo con sala de estar', 240.00, 'libre'),
('estandar', 'Habitación estándar con aire acondicionado', 130.00, 'libre');

-- INSERT INTO servicios_adicionales (servicio_id, nombre_servicio, precio_adicional) VALUES
(1, 'Desayuno buffet', 15.00),
(2, 'Acceso al spa', 30.00),
(3, 'Servicio de habitación 24hs', 25.00),
(4, 'Wifi premium', 10.00),
(5, 'Transporte al aeropuerto', 50.00),
(6, 'Masaje relajante', 40.00),
(7, 'Cena romántica', 70.00),
(8, 'Excursión guiada', 45.00),
(9, 'Alquiler de bicicletas', 20.00),
(10, 'Servicio de lavandería', 15.00);


INSERT INTO RESERVAS (reserva_id, cliente_id, habitacion_id, fecha_entrada, fecha_salida, estado_reserva) VALUES
(1, 16, 4, '2024-01-23', '2024-01-30', "finalizada");
INSERT INTO RESERVAS (reserva_id, cliente_id, habitacion_id, fecha_entrada, fecha_salida, estado_reserva) VALUES
(2, 19, 4, '2024-02-14', '2024-01-17', "finalizada"),
(3, 21, 10, '2024-02-18', '2024-01-17', "finalizada");

update reservas set fecha_salida = '2024-02-17' where reserva_id = 2;
update reservas set fecha_salida = '2024-02-20' where reserva_id = 3;

INSERT INTO RESERVAS (reserva_id, cliente_id, habitacion_id, fecha_entrada, fecha_salida, estado_reserva) VALUES
(2, 19, 4, '2024-02-14', '2024-01-17', "finalizada"),
(3, 21, 10, '2024-02-18', '2024-01-17', "finalizada");


select * from clientes;
select * from reservas;
select * from servicios_adicionales;


