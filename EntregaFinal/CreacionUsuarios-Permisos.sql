
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