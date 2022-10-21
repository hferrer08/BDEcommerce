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

-- CONCATENA LUGAR DE ENVIO DIRECCION+CIUDAD

DELIMITER //

CREATE FUNCTION LUGAR_ENVIO (idClie INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
DECLARE RESULTADO VARCHAR(100);

IF idClie <= 0 THEN
SET RESULTADO = "El numero debe ser mayor a 0";
ELSE
SELECT CONCAT (Direccion, ' , ',Ciudad)
INTO RESULTADO
FROM Cliente WHERE idCliente = idClie;
END IF;
RETURN RESULTADO;
END//


DELIMITER ;
-- PRUEBA
select LUGAR_ENVIO(1140621793);

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