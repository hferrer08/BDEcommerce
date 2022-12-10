-- ELIMINAR BASE DE DATOS
-- DROP SCHEMA proyecto_ecommerce;

-- CREACION BD

CREATE SCHEMA IF NOT EXISTS proyecto_ecommerce;
USE proyecto_ecommerce;
-- PRIMERO LAS QUE NO TIENEN FK
-- CREACION TABLAS

CREATE TABLE IF NOT EXISTS Pais(
idPais INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombrePais VARCHAR (50)
);
CREATE TABLE IF NOT EXISTS Ciudad(
idCiudad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreCiudad VARCHAR (50),
idPais INT NOT NULL,
FOREIGN KEY (idPais) REFERENCES Pais(idPais)
);

CREATE TABLE IF NOT EXISTS Cliente (
idCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR (30) NOT NULL,
ApellidoPaterno VARCHAR (30) NOT NULL,
ApellidoMaterno VARCHAR (30),
Telefono VARCHAR(50) NOT NULL,
Direccion VARCHAR(100),
Email VARCHAR(50),
idCiudad INT NOT NULL,
FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad)
);

CREATE TABLE IF NOT EXISTS Categoria (
idCategoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreCategoria VARCHAR (30) NOT NULL
);

CREATE TABLE IF NOT EXISTS TipoDeJuego (
idTipoDeJuego INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FisicoOVirtual VARCHAR (30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Proveedor (
idProveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreProveedor VARCHAR (100) NOT NULL,
TelefonoProveedor VARCHAR(50) NOT NULL,
Direccion VARCHAR(100),
Email VARCHAR(50) NOT NULL,
FechaInicioProveedor date NOT NULL,
FechaTerminoProveedor date,
idCiudad INT NOT NULL,
FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad)
);

CREATE TABLE IF NOT EXISTS Producto(
idProducto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreProducto VARCHAR(100) NOT NULL,
Stock INT NOT NULL,
idCategoria INT NOT NULL, 
idTipoDeJuego INT NOT NULL,
FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria),
FOREIGN KEY (idTipoDeJuego) REFERENCES TipoDeJuego(idTipoDeJuego)
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
DescripcionPedido VARCHAR(255),
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

-- Insert Pais
INSERT INTO Pais (`idPais`,`NombrePais`) VALUES (1,'Colombia');

-- Insert Ciudad
INSERT INTO Ciudad (`idCiudad`,`NombreCiudad`,`idPais`) VALUES (1,'Barranquilla',1);
INSERT INTO Ciudad (`idCiudad`,`NombreCiudad`,`idPais`) VALUES (2,'Bogota',1);
INSERT INTO Ciudad (`idCiudad`,`NombreCiudad`,`idPais`) VALUES (3,'Bucaramanga',1);
INSERT INTO Ciudad (`idCiudad`,`NombreCiudad`,`idPais`) VALUES (4,'Cali',1);
INSERT INTO Ciudad (`idCiudad`,`NombreCiudad`,`idPais`) VALUES (5,'Santa Marta',1);
INSERT INTO Ciudad (`idCiudad`,`NombreCiudad`,`idPais`) VALUES (6,'Cartagena',1);


-- Insert Cliente
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (8912453,'Diego','Jimeno','Ortega','323741963',2,'Calle 82 # 49-79','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (8956321,'Sebastian','Gonzalez','Solano','996321478',3,'Calle 42 # 29-25','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (10245698,'Helena','Velasco','Jaramillo','3024112369',4,'Carrera30#47-31','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (11204789,'Juan','Velasquez','Carrillo','312489753',6,'Carrera 82 # 49-34','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (12345678,'Kiara','Molina','','3217889621',4,'Calle41#32-27','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (12496785,'Sofia','Benitez','Fernandez','3145622312',3,'Calle21#33-29','hubert.ferrerg8@gmail12496785.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (22589635,'Andrea','Rodriguez','Perez','3154748963',1,'Calle82#49-23','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (25463124,'Jorge','Perez','Baquero','311795123',2,'Carrera 15 # 49-36','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (25786312,'Luis','Molinares','Martinez','96321456',2,'Calle 15 # 20-28','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (68543210,'Mia','Perez','Gonzalez','3012567462',1,'Carrera10#49-30','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (75896412,'Bastian','Paez','Barrero','310756182',1,'Calle 30 # 49-35','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (1140568965,'Camilo','Sepulveda','','3564512789',2,'Calle80B#49-24','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (1140621789,'Andres','Vargas','','3207895112',3,'Calle47#27-32','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (1141567423,'Santiago','Guerrero','Olivero','3214556897',1,'Carrera27#49-26','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`) VALUES (1140621793,'Maria','Mei','','3034123569',5,'Calle25#89-23','hubert.ferrerg8@gmail.com');

-- Insert Categoria
INSERT INTO Categoria (`idCategoria`,`NombreCategoria`) VALUES (1,'PlayStation');
INSERT INTO Categoria (`idCategoria`,`NombreCategoria`) VALUES (2,'Switch');
INSERT INTO Categoria (`idCategoria`,`NombreCategoria`) VALUES (3,'XBOX');

-- Insert TipoDeJuego
INSERT INTO TipoDeJuego (`idTipoDeJuego`,`FisicoOVirtual`) VALUES (1,'Fisico');
INSERT INTO TipoDeJuego (`idTipoDeJuego`,`FisicoOVirtual`) VALUES (2,'Virtual');


-- Insert proveedor
INSERT INTO Proveedor (`idProveedor`,`NombreProveedor`,`TelefonoProveedor`,`Direccion`,`Email`,`FechaInicioProveedor`,`FechaTerminoProveedor`,`idCiudad`) VALUES (1,'VideojuegosBarranquilla','3218563219','Calle72#38-15','VideojuegosBarranquilla@gmail.com','2020-08-14',NULL,1);
INSERT INTO Proveedor (`idProveedor`,`NombreProveedor`,`TelefonoProveedor`,`Direccion`,`Email`,`FechaInicioProveedor`,`FechaTerminoProveedor`,`idCiudad`) VALUES (2,'SmileBogota','3157496327','Calle45#20-20','SmileBogota@outlook.com','2021-09-30',NULL,2);
INSERT INTO Proveedor (`idProveedor`,`NombreProveedor`,`TelefonoProveedor`,`Direccion`,`Email`,`FechaInicioProveedor`,`FechaTerminoProveedor`,`idCiudad`) VALUES (3,'StoreDigital','3034789654','Carrera78#90-56','StoreDigital@outlook.com','2019-04-12',NULL,1);
INSERT INTO Proveedor (`idProveedor`,`NombreProveedor`,`TelefonoProveedor`,`Direccion`,`Email`,`FechaInicioProveedor`,`FechaTerminoProveedor`,`idCiudad`) VALUES (4,'MichVideogames','3135698745','Carrera27#47-28','MichVideogames@gmail.com','2022-10-08',NULL,2);

-- Insert Productos

INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (1,'FIFA23 PS',70,1,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (2,'FIFA23 XBOX',85,3,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (3,'FIFA23 SWITCH',47,2,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (4,'Super Smash Bros',85,2,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (5,'Dragon Ball Xenoverse PS',52,1,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (6,'Dragon Ball Xenoverse XBOX',52,3,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (7,'Halo',70,3,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (8,'Bloodborne ',52,1,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (9,'Gears of War',85,3,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (10,'Killer Instinct',30,3,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (11,'Pokemon Espada y Escudo',70,2,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (12,'Dragon Ball Xenoverse Switch',47,2,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (13,'The Last Guardian ',47,1,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (14,'Sea of Thieves',70,3,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (15,'Detroit: Become Human ',30,1,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (16,'Titanfall',70,3,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (17,'Kirby',30,2,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (18,'God of war',20,1,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (19,'Forza Horizon 4',85,3,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (20,'Marvel\'s Spider-Man ',70,1,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (21,'The legend of zelda',20,2,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (22,'Animal Crossing',70,2,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (23,'Metroid Dread',70,2,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (24,'Super Mario Maker2',70,2,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`Stock`,`idCategoria`,`idTipoDeJuego`) VALUES (25,'Bayonetta 2',85,2,2);

-- Insert Pedido


INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (1,1140621793,25);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (2,1141567423,2);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (3,11204789,23);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (4,12345678,4);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (5,1140568965,21);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (6,1140621789,20);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (7,75896412,12);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (8,68543210,18);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (9,25786312,10);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (10,12496785,15);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (11,25463124,20);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (12,10245698,11);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (13,22589635,13);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (14,8956321,18);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (15,8912453,5);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (16,22589635,22);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (17,8956321,3);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (18,1141567423,24);
INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (19,1140621793,1);

-- Insert ProductoProveedor

INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (1,1,1);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (2,2,2);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (3,3,3);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (4,4,4);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (5,5,4);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (6,6,1);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (7,7,2);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (8,8,2);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (9,9,3);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (10,10,4);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (11,11,1);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (12,12,4);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (13,13,2);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (14,14,2);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (15,15,1);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (16,16,4);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (17,17,3);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (18,18,4);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (19,19,1);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (20,20,3);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (21,21,1);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (22,22,1);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (23,23,1);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (24,24,4);
INSERT INTO ProductoProveedor (`idProductoProveedor`,`idProducto`,`idProveedor`) VALUES (25,25,2);

-- insert detallePedido


INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (1,NULL,2,1);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (2,NULL,1,2);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (3,NULL,1,3);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (4,NULL,1,4);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (5,NULL,2,5);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (6,NULL,3,6);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (7,NULL,3,7);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (8,NULL,3,8);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (9,NULL,2,9);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (10,NULL,3,10);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (11,NULL,1,11);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (12,NULL,3,12);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (13,NULL,1,13);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (14,NULL,2,14);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (15,NULL,3,15);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (16,NULL,1,16);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (17,NULL,1,17);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (18,NULL,1,18);
INSERT INTO detallePedido (`idDetallePedido`,`DescripcionPedido`,`CantidadProducto`,`idPedido`) VALUES (19,NULL,1,19);

-- insert Envio


INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (1,'2022-10-08',25,1);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (2,'2022-10-08',2,2);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (3,'2022-10-08',23,3);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (4,'2022-10-08',4,4);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (5,'2022-10-08',21,5);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (6,'2022-10-08',20,6);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (7,'2022-10-08',12,7);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (8,'2022-10-08',18,8);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (9,'2022-10-08',10,9);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (10,'2022-10-08',15,10);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (11,'2022-10-08',20,11);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (12,'2022-10-08',11,12);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (13,'2022-10-08',13,13);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (14,'2022-10-08',18,14);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (15,'2022-10-08',5,15);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (16,'2022-10-08',22,16);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (17,'2022-10-08',3,17);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (18,'2022-10-08',24,18);
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (19,'2022-10-08',1,19);

-- insert EstadoEnvio

INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (1,'En camino',1);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (2,'Recibido por empresa de reparto',2);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (3,'En camino',3);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (4,'Recibido por empresa de reparto',4);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (5,'Recibido por empresa de reparto',5);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (6,'En camino',6);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (7,'Recibido por empresa de reparto',7);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (8,'En camino',8);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (9,'En camino',9);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (10,'Recibido por empresa de reparto',10);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (11,'En camino',11);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (12,'En camino',12);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (13,'En camino',13);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (14,'Recibido por empresa de reparto',14);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (15,'En camino',15);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (16,'Recibido por empresa de reparto',16);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (17,'En camino',17);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (18,'Recibido por empresa de reparto',18);
INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (19,'En camino',19);

-- Creacion tablas vistas

-- Stock pronto a acabarse segun Categoria
CREATE VIEW Stock_ProntoAAcabar as
select prod.idProducto, prod.NombreProducto, prod.Stock, cat.NombreCategoria 
from producto prod 
inner join categoria cat on cat.idCategoria = prod.idCategoria
where Stock < 30;

-- Estado de envios del mes de Octubre
CREATE VIEW Estado_PedidosOctubre as
select eenvio.idSeguimientoPedido, env.FechaEnvio, prod.NombreProducto, clien.Nombre, clien.ApellidoPaterno, eenvio.EstadoEnvio from 
envio env
inner join pedido ped on ped.idPedido = env.idPedido
inner join estadoenvio eenvio on eenvio.idEnvio = env.idEnvio
inner join cliente clien on clien.idCliente = ped.idCliente
inner join producto prod on prod.idProducto = ped.idProducto
where FechaEnvio between '2022-10-01' and '2022-10-31';

-- Pedidos por categoria

CREATE VIEW Pedidos_PorCategoria as
select cat.NombreCategoria,COUNT(*) TotalPedidos  from pedido ped
inner join producto prod on prod.idProducto = ped.idProducto
inner join categoria cat on cat.idCategoria = prod.idCategoria
where cat.idCategoria = 1

UNION

select cat.NombreCategoria, COUNT(*) TotalPedidos   from pedido ped
inner join producto prod on prod.idProducto = ped.idProducto
inner join categoria cat on cat.idCategoria = prod.idCategoria
where cat.idCategoria = 2

UNION

select cat.NombreCategoria, COUNT(*) TotalPedidos  from pedido ped
inner join producto prod on prod.idProducto = ped.idProducto
inner join categoria cat on cat.idCategoria = prod.idCategoria
where cat.idCategoria = 3;

-- Todos los productos pedidos por cliente
CREATE VIEW ProductosTotalesPedidos_PorCliente as
select ped.idPedido, clien.idCliente, clien.Nombre, clien.ApellidoPaterno,prod.NombreProducto 
 from pedido ped
inner join cliente clien on clien.idCliente = ped.idCliente
inner join producto prod on prod.idProducto = ped.idProducto;

-- Productos de cada proveedor
CREATE VIEW ProductosPorProveedor as
select prov.idProveedor, prov.NombreProveedor, prod.NombreProducto, cat.NombreCategoria  from productoproveedor prodprov
inner join producto prod on prod.idProducto = prodprov.idProducto
inner join proveedor prov on prov.idProveedor = prodprov.idProveedor
inner join categoria cat on cat.idCategoria = prod.idCategoria
where prov.idProveedor = 1
union
select prov.idProveedor, prov.NombreProveedor, prod.NombreProducto, cat.NombreCategoria  from productoproveedor prodprov
inner join producto prod on prod.idProducto = prodprov.idProducto
inner join proveedor prov on prov.idProveedor = prodprov.idProveedor
inner join categoria cat on cat.idCategoria = prod.idCategoria
where prov.idProveedor = 2
union
select prov.idProveedor, prov.NombreProveedor, prod.NombreProducto, cat.NombreCategoria  from productoproveedor prodprov
inner join producto prod on prod.idProducto = prodprov.idProducto
inner join proveedor prov on prov.idProveedor = prodprov.idProveedor
inner join categoria cat on cat.idCategoria = prod.idCategoria
where prov.idProveedor = 3
union
select prov.idProveedor, prov.NombreProveedor, prod.NombreProducto, cat.NombreCategoria  from productoproveedor prodprov
inner join producto prod on prod.idProducto = prodprov.idProducto
inner join proveedor prov on prov.idProveedor = prodprov.idProveedor
inner join categoria cat on cat.idCategoria = prod.idCategoria
where prov.idProveedor = 4;

-- CREACION DE FUNCIONES

-- CONCATENA NOMBRE + NUMERO DE CONTACTO

DELIMITER //

CREATE FUNCTION CONTACTO_A_LLAMAR (idClie INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
DECLARE RESULTADO VARCHAR(100);

IF idClie <= 0 THEN
SET RESULTADO = "El numero debe ser mayor a 0";
ELSE
SELECT CONCAT (Nombre, ' ',Telefono)
INTO RESULTADO
FROM Cliente

 WHERE idCliente = idClie;
END IF;
RETURN RESULTADO;
END//


DELIMITER ;
-- PRUEBA
select CONTACTO_A_LLAMAR(1140621793);

-- BUSCAR NOMBRE CATEGORIA

DELIMITER //

CREATE FUNCTION BUSCAR_CATEGORIA (idCate INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
DECLARE Nombre VARCHAR(100);
Set Nombre = (select NombreCategoria from categoria where idCategoria = idCate); 
RETURN Nombre;
END//


DELIMITER ;

-- PRUEBA
select BUSCAR_CATEGORIA(2);
select BUSCAR_CATEGORIA(3);

-- PRUEBA
select NombreProducto, idCategoria, BUSCAR_CATEGORIA(idCategoria) from Producto;

-- PROCEDIMIENTOS ALMACENADOS

-- PERMITIRA ORDENAR LA TABLA PRODUCTO SEGUN UN CAMPO Y ESCOGER SI SE HARA DE MANERA ASC O DESC.

DROP PROCEDURE IF EXISTS ORDENAR_POR_CAMPO;
DELIMITER //
CREATE PROCEDURE ORDENAR_POR_CAMPO(IN campo varchar(100), orden varchar(100))
BEGIN
IF campo <> '' THEN
	SET @ordenCampo = CONCAT(' ORDER BY ' , campo,' ', orden);
ELSE
	SET @ordenCampo = '';
END IF;
SET @consulta = CONCAT('SELECT * FROM producto', @ordenCampo);

PREPARE runSQL FROM @consulta;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;

END //
DELIMITER ;

-- Prueba ordenando por cantidad stock

call ORDENAR_POR_CAMPO('Stock','DESC');

-- INSERTAR DATOS
-- PERMITE INSERTAR UN NUEVO CLIENTE A LA BASE DE DATOS

DROP PROCEDURE IF EXISTS SPU_INS_CLIENTENUEVO;
DELIMITER //
CREATE PROCEDURE SPU_INS_CLIENTENUEVO(IN id int, nombre varchar(30), ApPaterno VARCHAR(30), ApMaterno VARCHAR(30), 
Tel VARCHAR (50), Ciud INT, Direc VARCHAR(100), CorreoE VARCHAR(50))
BEGIN 
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`idCiudad`,`Direccion`,`Email`)
VALUES (id, nombre, ApPaterno, ApMaterno, Tel, Ciud, Direc, CorreoE); 
END //
DELIMITER ;

call SPU_INS_CLIENTENUEVO (8542165, 'Hubert', 'Ferrer', 'Guerrero', '123456789', 1, 'Calle123#45-89', 'hubert.ferrerg8@gmail.com');

-- TRIGGERS

-- Creacion tabla historial de cambios pedido

create table historial_cambios_pedido(
idHistorialCamb int not null primary key auto_increment,
fecha datetime not null,
idUsuario varchar (50),
datoViejo varchar(50),
datoNuevo varchar(50),
TipoCambio varchar (50)
);

-- Trigger insert - Guarda historial de cambios insert de la tabla pedido

create trigger insertHistorialCambio
after insert on pedido
for each row
insert into historial_cambios_pedido (fecha, idUsuario, datoNuevo, TipoCambio)
values
(now(),session_user(), new.idPedido, 'Nuevo dato');

-- Prueba

INSERT INTO Pedido (`idPedido`,`idCliente`,`idProducto`) VALUES (21,1140621793,3);
select * from historial_cambios_pedido;

-- Trigger update - Guarda historial de cambios update de tabla pedido

create trigger updateHistorialCambio
after update on pedido
for each row
insert into historial_cambios_pedido (fecha, idUsuario, datoViejo, datoNuevo, TipoCambio)
values
(now(),session_user(), old.idProducto, new.idProducto, 'Update');


-- Prueba
update pedido set idProducto = 12 where idPedido = 9;
select * from historial_cambios_pedido;

create table historial_cambios_Envio(
idHistCambEnvio int not null primary key auto_increment,
fecha datetime not null,
idUsuario varchar (50),
datoViejo_idEnvio varchar(50),
datoNuevo_idEnvio varchar(50),
datoViejo_idPedido int,
datoNuevo_idPedido int,
TipoCambio varchar (50),
datoViejo_FechaEnvio date,
datoViejo_idProducto int
);

-- Trigger Insert envio - Realiza historia de cambio insert en tabla Envio

create trigger insertHistorialEnvio
after insert on Envio
for each row
insert into historial_cambios_Envio (fecha, idUsuario, datoNuevo_idEnvio, datoNuevo_idPedido, TipoCambio)
values
(now(),session_user(), new.idEnvio, new.idPedido, 'Dato nuevo');

-- Prueba
INSERT INTO Envio (`idEnvio`,`FechaEnvio`,`idProducto`,`idPedido`) VALUES (22,'2022-10-27',15,12);
select * from historial_cambios_Envio;

-- Trigger delete

-- Trigger Delete Envio // before - Hace backup de dato eliminado en tabla Envio
create trigger deleteHistorialEnvio
before delete on envio
for each row
insert into historial_cambios_Envio (fecha, idUsuario, datoViejo_idEnvio, datoViejo_idPedido, TipoCambio, datoViejo_FechaEnvio,datoViejo_idProducto )
values
(now(),session_user(), old.idEnvio, old.idPedido, 'Backup dato delete', old.FechaEnvio, old.idProducto);

-- Prueba
delete from estadoEnvio where idEnvio = 10;
delete from Envio where idEnvio = 10;
select * from historial_cambios_Envio;

-- Creación de usuario practicante solo para visualizar
create user 'practicante'@'localhost' identified by 'Prueba234';
-- Permisos para sólo visualizar
grant select on *.* to 'practicante'@'localhost'; 

-- Creación de usuario programador nuevo
create user 'nuevoProg'@'localhost' identified by 'C0d3r123';
-- Permisos para select, insert y update (visualizar, ingresar y actualizar) datos 
grant select, insert, update on *.* to 'nuevoProg'@'localhost';

-- Verificación
use mysql;
show tables;
select * from user;
