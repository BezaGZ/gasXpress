-- Elimina y crea la base de datos
DROP DATABASE IF EXISTS gasxpress;
CREATE DATABASE gasxpress;
USE gasxpress;

-- Tabla: usuario
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    tipo BOOLEAN NOT NULL
);

-- Tabla: cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY NOT NULL,
    cui VARCHAR(13) NOT NULL,
    nit VARCHAR(9) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100),
    telefono VARCHAR(50),
    direccionR VARCHAR(100),
    codigoPostal INT UNSIGNED,
    municipio VARCHAR(50),
    departamento VARCHAR(50),
    pais VARCHAR(50),
    regimen VARCHAR(50)
);

-- Tabla: impuestos
CREATE TABLE impuestos (
    id_impuesto INT PRIMARY KEY NOT NULL,
    tipo_impuesto VARCHAR(50) NOT NULL,
    valor DECIMAL(5,2) NOT NULL
);

-- Tabla: gasolina
CREATE TABLE gasolina (
    id_gasolina INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    precio_galon DECIMAL(12,6) NOT NULL,
    descripcion VARCHAR(255) NOT NULL
);

-- Tabla: tanque
CREATE TABLE tanque (
    id_tanque INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    capacidad_Maxima DECIMAL(12,6) NOT NULL,
    capacidad_Actual DECIMAL(12,6) NOT NULL,
    porcentaje_Alerta DECIMAL(5,2) NOT NULL,
    gasolina_id INT NOT NULL,
    FOREIGN KEY (gasolina_id) REFERENCES gasolina(id_gasolina)
);

-- Tabla: bomba
CREATE TABLE bomba (
    id_bomba INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla: bomba_tanque (relación entre bomba y tanque)
CREATE TABLE bomba_tanque (
    id_bomba_tanque INT PRIMARY KEY NOT NULL,
    id_bomba INT NOT NULL,
    id_tanque INT NOT NULL,
    FOREIGN KEY (id_bomba) REFERENCES bomba(id_bomba),
    FOREIGN KEY (id_tanque) REFERENCES tanque(id_tanque)
);

-- Tabla: gasolina_impuesto (relación entre gasolina e impuestos)
CREATE TABLE gasolina_impuesto (
    id_gasolina_impuesto INT PRIMARY KEY NOT NULL,
    id_gasolina INT NOT NULL,
    id_impuesto INT NOT NULL,
    FOREIGN KEY (id_gasolina) REFERENCES gasolina(id_gasolina),
    FOREIGN KEY (id_impuesto) REFERENCES impuestos(id_impuesto)
);

-- Tabla: encabezado_factura
CREATE TABLE encabezado_factura (
    id_encabezado INT PRIMARY KEY NOT NULL,
    nit VARCHAR(9) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    codigoPostal INT UNSIGNED NOT NULL,
    municipio VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    numero_registro_SAT VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    regimen_tributario VARCHAR(50) NOT NULL
);

-- Tabla: factura
CREATE TABLE factura (
    id_factura INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    serie VARCHAR(15) NOT NULL,
    numero_correlativo INT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    total_iva DECIMAL(12,6) NOT NULL,
    total_idp DECIMAL(12,6) NOT NULL,
    total_factura DECIMAL(12,6) NOT NULL,
    monto_gravable DECIMAL(12,6) NOT NULL,
    certificado_SAT VARCHAR(100) NOT NULL,
    id_usuario INT NOT NULL,
    id_cliente INT NOT NULL,
    id_encabezado INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_encabezado) REFERENCES encabezado_factura(id_encabezado)
);

-- Tabla: linea_detalle
CREATE TABLE linea_detalle (
    id_detalle INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    cantidad DECIMAL(12,6) NOT NULL,
    precio_unitario DECIMAL(12,6) NOT NULL,
    subtotal DECIMAL(12,6) NOT NULL,
    monto_iva DECIMAL(12,6) NOT NULL,
    monto_idp DECIMAL(12,6) NOT NULL,
    monto_gravable DECIMAL(12,6) NOT NULL,
    id_gasolina_impuesto INT NOT NULL,
    id_factura INT NOT NULL,
    FOREIGN KEY (id_gasolina_impuesto) REFERENCES gasolina_impuesto(id_gasolina_impuesto),
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura)
);

-- Tabla: llenado
CREATE TABLE llenado (
    id_llenado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cantidad DECIMAL(12,6) NOT NULL,
    fecha TIMESTAMP NOT NULL,
    tanque_id INT NOT NULL,
    gasolina_id INT NOT NULL,
    FOREIGN KEY (tanque_id) REFERENCES tanque(id_tanque),
    FOREIGN KEY (gasolina_id) REFERENCES gasolina(id_gasolina)
);

-- Tabla: evaporacion
CREATE TABLE evaporacion (
    id_evaporacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cantidad DECIMAL(12,6) NOT NULL,
    fecha TIMESTAMP NOT NULL,
    tanque_id INT NOT NULL,
    gasolina_id INT NOT NULL,
    FOREIGN KEY (tanque_id) REFERENCES tanque(id_tanque),
    FOREIGN KEY (gasolina_id) REFERENCES gasolina(id_gasolina)
);

-- Tabla: cierre_de_caja
CREATE TABLE cierre_de_caja (
    id_cierre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha TIMESTAMP NOT NULL,
    total_ventas DECIMAL(12,6) NOT NULL,
    total_faltante DECIMAL(12,6) NOT NULL,
    total_galones DECIMAL(12,6) NOT NULL,
    total_iva DECIMAL(12,6) NOT NULL,
    total_idp DECIMAL(12,6) NOT NULL,
    facturas_emitidas INT NOT NULL,
    ventas_emitidas INT NOT NULL,
    justificacion VARCHAR(255),
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);