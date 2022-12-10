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