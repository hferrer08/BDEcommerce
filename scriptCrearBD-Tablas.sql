
-- CREACION BD

CREATE SCHEMA IF NOT EXISTS proyecto_ecommerce;
USE proyecto_ecommerce;
-- PRIMERO LAS QUE NO TIENEN FK
-- CREACION TABLAS


CREATE TABLE IF NOT EXISTS Cliente (
idCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR (30) NOT NULL,
ApellidoPaterno VARCHAR (30) NOT NULL,
ApellidoMaterno VARCHAR (30) NOT NULL,
Telefono INT NOT NULL,
Ciudad VARCHAR(30) NOT NULL,
Direccion VARCHAR(30),
Email VARCHAR(50)

);

CREATE TABLE IF NOT EXISTS Categoria (
idCategoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreCategoria VARCHAR (30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Proveedor (
idProveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreProveedor VARCHAR (30) NOT NULL,
TelefonoProveedor INT NOT NULL,
Direccion VARCHAR(30),
Email VARCHAR(50) NOT NULL,
FechaInicioProveedor date NOT NULL,
FechaTerminoProveedor date
);

CREATE TABLE IF NOT EXISTS Producto(
idProducto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreProducto VARCHAR(100) NOT NULL,
CantidadProducto INT NOT NULL,
idCategoria INT NOT NULL, 
FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE IF NOT EXISTS Pedido(
idPedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL, 
idProducto INT NOT NULL,
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE IF NOT EXISTS ProductoProveedor(
idProductoProveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idProducto INT NOT NULL, 
idProveedor INT NOT NULL,
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE IF NOT EXISTS detallePedido(
idDetallePedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
DescripcionPedido VARCHAR(255) NOT NULL,
CantidadProducto INT NOT NULL,
idPedido INT NOT NULL, 
FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE IF NOT EXISTS Envio(
idEnvio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FechaEnvio DATE NOT NULL,
idProducto INT NOT NULL, 
idPedido INT NOT NULL,
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE IF NOT EXISTS EstadoEnvio(
idSeguimientoPedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
EstadoEnvio VARCHAR(50) NOT NULL,
idEnvio INT NOT NULL, 
FOREIGN KEY (idEnvio) REFERENCES Envio(idEnvio)
);






