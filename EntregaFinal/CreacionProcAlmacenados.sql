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

