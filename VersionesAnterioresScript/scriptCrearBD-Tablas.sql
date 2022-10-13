
-- CREACION BD

CREATE SCHEMA IF NOT EXISTS proyecto_ecommerce;
USE proyecto_ecommerce;
-- PRIMERO LAS QUE NO TIENEN FK
-- CREACION TABLAS


CREATE TABLE IF NOT EXISTS Cliente (
idCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR (30) NOT NULL,
ApellidoPaterno VARCHAR (30) NOT NULL,
ApellidoMaterno VARCHAR (30),
Telefono VARCHAR(50) NOT NULL,
Ciudad VARCHAR(30) NOT NULL,
Direccion VARCHAR(100),
Email VARCHAR(50)

);

CREATE TABLE IF NOT EXISTS Categoria (
idCategoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreCategoria VARCHAR (30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Proveedor (
idProveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreProveedor VARCHAR (100) NOT NULL,
TelefonoProveedor VARCHAR(50) NOT NULL,
Direccion VARCHAR(100),
Email VARCHAR(50) NOT NULL,
FechaInicioProveedor date NOT NULL,
FechaTerminoProveedor date
);

CREATE TABLE IF NOT EXISTS Producto(
idProducto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreProducto VARCHAR(100) NOT NULL,
Stock INT NOT NULL,
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

-- Insert Categoria
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (8912453,'Diego','Jimeno','Ortega','323741963','Bogota','Calle 82 # 49-79','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (8956321,'Sebastian','Gonzalez','Solano','996321478','Bucaramanga','Calle 42 # 29-25','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (10245698,'Helena','Velasco','Jaramillo','3024112369','SantaMarta','Carrera30#47-31','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (11204789,'Juan','Velasquez','Carrillo','312489753','Cali','Carrera 82 # 49-34','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (12345678,'Kiara','Molina','','3217889621','Cali','Calle41#32-27','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (12496785,'Sofia','Benitez','Fernandez','3145622312','Bucaramanga','Calle21#33-29','hubert.ferrerg8@gmail12496785.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (22589635,'Andrea','Rodriguez','Perez','3154748963','Barranquilla','Calle82#49-23','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (25463124,'Jorge','Perez','Baquero','311795123','Bogota','Carrera 15 # 49-36','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (25786312,'Luis','Molinares','Martinez','96321456','Bogota','Calle 15 # 20-28','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (68543210,'Mia','Perez','Gonzalez','3012567462','Barranquilla','Carrera10#49-30','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (75896412,'Bastian','Paez','Barrero','310756182','Barranquilla','Calle 30 # 49-35','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (1140568965,'Camilo','Sepulveda','','3564512789','Bogota','Calle80B#49-24','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (1140621789,'Andres','Vargas','','3207895112','Cartagena','Calle47#27-32','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (1141567423,'Santiago','Guerrero','Olivero','3214556897','Barranquilla','Carrera27#49-26','hubert.ferrerg8@gmail.com');
INSERT INTO Cliente (`idCliente`,`Nombre`,`ApellidoPaterno`,`ApellidoMaterno`,`Telefono`,`Ciudad`,`Direccion`,`Email`) VALUES (1140621793,'Maria','Mei','','3034123569','Bucaramanga','Calle25#89-23','hubert.ferrerg8@gmail.com');

-- Insert Categoria
INSERT INTO Categoria (`idCategoria`,`NombreCategoria`) VALUES (1,'PlayStation');
INSERT INTO Categoria (`idCategoria`,`NombreCategoria`) VALUES (2,'Switch');
INSERT INTO Categoria (`idCategoria`,`NombreCategoria`) VALUES (3,'XBOX');

-- Insert proveedor
INSERT INTO Proveedor (`idProveedor`,`NombreProveedor`,`TelefonoProveedor`,`Direccion`,`Email`,`FechaInicioProveedor`,`FechaTerminoProveedor`) VALUES (1,'VideojuegosBarranquilla','3218563219','Calle72#38-15','VideojuegosBarranquilla@gmail.com','2020-08-14',NULL);
INSERT INTO Proveedor (`idProveedor`,`NombreProveedor`,`TelefonoProveedor`,`Direccion`,`Email`,`FechaInicioProveedor`,`FechaTerminoProveedor`) VALUES (2,'SmileBogota','3157496327','Calle45#20-20','SmileBogota@outlook.com','2021-09-30',NULL);
INSERT INTO Proveedor (`idProveedor`,`NombreProveedor`,`TelefonoProveedor`,`Direccion`,`Email`,`FechaInicioProveedor`,`FechaTerminoProveedor`) VALUES (3,'StoreDigital','3034789654','Carrera78#90-56','StoreDigital@outlook.com','2019-04-12',NULL);
INSERT INTO Proveedor (`idProveedor`,`NombreProveedor`,`TelefonoProveedor`,`Direccion`,`Email`,`FechaInicioProveedor`,`FechaTerminoProveedor`) VALUES (4,'MichVideogames','3135698745','Carrera27#47-28','MichVideogames@gmail.com','2022-10-08',NULL);

-- Insert Productos

INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (1,'FIFA23 PS',70,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (2,'FIFA23 XBOX',85,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (3,'FIFA23 SWITCH',47,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (4,'Super Smash Bros',85,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (5,'Dragon Ball Xenoverse PS',52,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (6,'Dragon Ball Xenoverse XBOX',52,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (7,'Halo',70,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (8,'Bloodborne ',52,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (9,'Gears of War',85,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (10,'Killer Instinct',30,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (11,'Pokemon Espada y Escudo',70,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (12,'Dragon Ball Xenoverse Switch',47,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (13,'The Last Guardian ',47,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (14,'Sea of Thieves',70,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (15,'Detroit: Become Human ',30,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (16,'Titanfall',70,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (17,'Kirby',30,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (18,'God of war',20,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (19,'Forza Horizon 4',85,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (20,'Marvel\'s Spider-Man ',70,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (21,'The legend of zelda',20,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (22,'Animal Crossing',70,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (23,'Metroid Dread',70,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (24,'Super Mario Maker2',70,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (25,'Bayonetta 2',85,2);

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