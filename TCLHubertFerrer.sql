--  TCL

-- Mostramos los que hay ahora mismo
use proyecto_ecommerce;
select * from proyecto_ecommerce.estadoenvio;
-- Empezamos transaccion
start transaction; 
delete from proyecto_ecommerce.estadoenvio where idSeguimientoPedido = 17;
delete from proyecto_ecommerce.estadoenvio where idSeguimientoPedido = 18;
delete from proyecto_ecommerce.estadoenvio where idSeguimientoPedido = 19;

-- Prueba de los cambios
select * from proyecto_ecommerce.estadoenvio;
-- Si quieremos eliminar los cambios
-- rollback;
-- Si queremos guardar los cambios
-- commit;

-- Para reinsertar datos si es necesario
-- INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (17,'En camino',17);
-- INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (18,'Recibido por empresa de reparto',18);
-- INSERT INTO EstadoEnvio (`idSeguimientoPedido`,`EstadoEnvio`,`idEnvio`) VALUES (19,'En camino',19);
 
-- Cambios segunda tabla

-- Ver antes de cambios
select * from proyecto_ecommerce.producto;

-- Empezamos transaccion
start transaction; 
-- Primeros 4 insert
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (26,'God of war',20,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (27,'Forza Horizon 4',85,3);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (28,'Marvel\'s Spider-Man ',70,1);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (29,'The legend of zelda',20,2);
-- Primer savepoint
savepoint producto4;


INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (30,'Animal Crossing',70,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (31,'Metroid Dread',70,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (32,'Super Mario Maker2',70,2);
INSERT INTO Producto (`idProducto`,`NombreProducto`,`CantidadProducto`,`idCategoria`) VALUES (33,'Bayonetta 2',85,2);
-- Segundo savepoint
savepoint producto8;

-- Ver cambios
select * from proyecto_ecommerce.producto;

-- Elimina el primer savepoint
release savepoint producto4;
-- Si no queremos guardar cambios
 -- rollback;
-- Si queremos guardar cambios
-- commit;