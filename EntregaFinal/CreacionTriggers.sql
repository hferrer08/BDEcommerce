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