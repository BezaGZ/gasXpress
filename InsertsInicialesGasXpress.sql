-- Insertar datos en la tabla cliente
INSERT INTO cliente (id_cliente, cui, nit, nombre, apellido, correo, telefono, direccionR, codigoPostal, municipio, departamento, pais, regimen)
VALUES
(1, '3351427531805', '108240282', 'Bezaleel', 'González', 'beza@gmail.com', '2343-2343', 'Zona 6', 20001, 'Los amates', 'Izabal', 'GT', 'General'),
(2, '3352427581905', '1607355k', 'Mynor', 'Ramos', 'mynor@gmail.com', '2343-2342', 'Zona 9', 19005, 'Puerto Barrios', 'Izabal', 'GT', 'General');

-- Insertar datos en la tabla usuario
INSERT INTO usuario (id_usuario, nombre, apellido, usuario, contrasena, correo, tipo)
VALUES
(1, 'Bezaleel', 'González', 'bezagz', '201944540', 'beza@gmail.com', false),
(2, 'Mynor', 'Ramos', 'mynorr', '201944540', 'mynor@gmail.com', true);

-- Insertar datos en la tabla encabezado_factura
INSERT INTO encabezado_factura (id_encabezado, nit, nombre, direccion, codigoPostal, municipio, departamento, pais, numero_registro_SAT, correo, regimen_tributario)
VALUES
(1, '108240282', 'XPress', 'Zona 10', 20001, 'Chiquimula', 'Chiquimula', 'GT', '1234567889', 'gasspress@gmail.com', 'General');

-- Insertar datos en la tabla gasolina
INSERT INTO gasolina (id_gasolina, nombre, precio_galon, descripcion)
VALUES
(1, 'Super', 29.51, 'Gasolina de alto octanaje.'),
(2, 'Regular', 27.99, 'Gasolina de medio octanaje.'),
(3, 'Diesel', 25.50, 'Combustible de octanaje estándar.');

-- Insertar datos en la tabla impuestos
INSERT INTO impuestos (id_impuesto, tipo_impuesto, valor)
VALUES
(1, 'IDP', 4.70),
(2, 'IDP', 4.60),
(3, 'IDP', 1.30),
(4, 'IVA', 12.00);

-- Insertar datos en la tabla tanque
INSERT INTO tanque (id_tanque, nombre, capacidad_Maxima, capacidad_Actual, porcentaje_Alerta, gasolina_id)
VALUES
(1, 'Tanque 1', 10000.00, 9768.00, 0.40, 1),
(2, 'Tanque 2', 10000.00, 9770.00, 0.40, 2),
(3, 'Tanque 3', 10000.00, 8469.00, 0.40, 3);

-- Insertar datos en la tabla bomba
INSERT INTO bomba (id_bomba, nombre)
VALUES
(1, 'Bomba 1'),
(2, 'Bomba 2'),
(3, 'Bomba 3'),
(4, 'Bomba 4');

-- Insertar datos en la tabla bomba_tanque
INSERT INTO bomba_tanque (id_bomba_tanque, id_bomba, id_tanque)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3);

-- Insertar datos en la tabla gasolina_impuesto
INSERT INTO gasolina_impuesto (id_gasolina_impuesto, id_gasolina, id_impuesto)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 1, 4),
(5, 2, 4),
(6, 3, 4);