-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_ecommerce
-- Creadas por mi: cliente, categoria, proveedor, producto, pedido, productoProveedor, detallePedido, Envio, estadoEnvio
--Creadas para trigger historial_cambios_pedido, historial_cambios_Envio
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'PlayStation'),(2,'Switch'),(3,'XBOX');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (8542165,'Hubert','Ferrer','Guerrero','123456789','Barranquilla','Calle123#45-89','hubert.ferrerg8@gmail.com'),(8912453,'Diego','Jimeno','Ortega','323741963','Bogota','Calle 82 # 49-79','hubert.ferrerg8@gmail.com'),(8956321,'Sebastian','Gonzalez','Solano','996321478','Bucaramanga','Calle 42 # 29-25','hubert.ferrerg8@gmail.com'),(10245698,'Helena','Velasco','Jaramillo','3024112369','SantaMarta','Carrera30#47-31','hubert.ferrerg8@gmail.com'),(11204789,'Juan','Velasquez','Carrillo','312489753','Cali','Carrera 82 # 49-34','hubert.ferrerg8@gmail.com'),(12345678,'Kiara','Molina','','3217889621','Cali','Calle41#32-27','hubert.ferrerg8@gmail.com'),(12496785,'Sofia','Benitez','Fernandez','3145622312','Bucaramanga','Calle21#33-29','hubert.ferrerg8@gmail.com'),(22589635,'Andrea','Rodriguez','Perez','3154748963','Barranquilla','Calle82#49-23','hubert.ferrerg8@gmail.com'),(25463124,'Jorge','Perez','Baquero','311795123','Bogota','Carrera 15 # 49-36','hubert.ferrerg8@gmail.com'),(25786312,'Luis','Molinares','Martinez','96321456','Bogota','Calle 15 # 20-28','hubert.ferrerg8@gmail.com'),(68543210,'Mia','Perez','Gonzalez','3012567462','Barranquilla','Carrera10#49-30','hubert.ferrerg8@gmail.com'),(75896412,'Bastian','Paez','Barrero','310756182','Barranquilla','Calle 30 # 49-35','hubert.ferrerg8@gmail.com'),(1140568965,'Camilo','Sepulveda','','3564512789','Bogota','Calle80B#49-24','hubert.ferrerg8@gmail.com'),(1140621789,'Andres','Vargas','','3207895112','Cartagena','Calle47#27-32','hubert.ferrerg8@gmail.com'),(1140621793,'Maria','Mei','','3034123569','Bucaramanga','Calle25#89-23','hubert.ferrerg8@gmail.com'),(1141567423,'Santiago','Guerrero','Olivero','3214556897','Barranquilla','Carrera27#49-26','hubert.ferrerg8@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detallepedido`
--

LOCK TABLES `detallepedido` WRITE;
/*!40000 ALTER TABLE `detallepedido` DISABLE KEYS */;
INSERT INTO `detallepedido` VALUES (1,NULL,2,1),(2,NULL,1,2),(3,NULL,1,3),(4,NULL,1,4),(5,NULL,2,5),(6,NULL,3,6),(7,NULL,3,7),(8,NULL,3,8),(9,NULL,2,9),(10,NULL,3,10),(11,NULL,1,11),(12,NULL,3,12),(13,NULL,1,13),(14,NULL,2,14),(15,NULL,3,15),(16,NULL,1,16),(17,NULL,1,17),(18,NULL,1,18),(19,NULL,1,19);
/*!40000 ALTER TABLE `detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,'2022-10-08',25,1),(2,'2022-10-08',2,2),(3,'2022-10-08',23,3),(4,'2022-10-08',4,4),(5,'2022-10-08',21,5),(6,'2022-10-08',20,6),(7,'2022-10-08',12,7),(8,'2022-10-08',18,8),(11,'2022-10-08',20,11),(12,'2022-10-08',11,12),(13,'2022-10-08',13,13),(14,'2022-10-08',18,14),(15,'2022-10-08',5,15),(16,'2022-10-08',22,16),(17,'2022-10-08',3,17),(18,'2022-10-08',24,18),(19,'2022-10-08',1,19),(22,'2022-10-27',15,12);
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estadoenvio`
--

LOCK TABLES `estadoenvio` WRITE;
/*!40000 ALTER TABLE `estadoenvio` DISABLE KEYS */;
INSERT INTO `estadoenvio` VALUES (1,'En camino',1),(2,'Recibido por empresa de reparto',2),(3,'En camino',3),(4,'Recibido por empresa de reparto',4),(5,'Recibido por empresa de reparto',5),(6,'En camino',6),(7,'Recibido por empresa de reparto',7),(8,'En camino',8),(11,'En camino',11),(12,'En camino',12),(13,'En camino',13),(14,'Recibido por empresa de reparto',14),(15,'En camino',15),(16,'Recibido por empresa de reparto',16),(17,'En camino',17),(18,'Recibido por empresa de reparto',18),(19,'En camino',19);
/*!40000 ALTER TABLE `estadoenvio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `historial_cambios_envio`
--

LOCK TABLES `historial_cambios_envio` WRITE;
/*!40000 ALTER TABLE `historial_cambios_envio` DISABLE KEYS */;
INSERT INTO `historial_cambios_envio` VALUES (1,'2022-10-27 21:20:27','root@localhost',NULL,'22',NULL,12,'Dato nuevo',NULL,NULL),(3,'2022-10-27 21:24:24','root@localhost','9',NULL,9,NULL,'Backup dato delete',NULL,NULL),(5,'2022-10-27 21:31:27','root@localhost','10',NULL,10,NULL,'Backup dato delete','2022-10-08',15);
/*!40000 ALTER TABLE `historial_cambios_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `historial_cambios_pedido`
--

LOCK TABLES `historial_cambios_pedido` WRITE;
/*!40000 ALTER TABLE `historial_cambios_pedido` DISABLE KEYS */;
INSERT INTO `historial_cambios_pedido` VALUES (1,'2022-10-27 20:57:13','root@localhost',NULL,'21','Nuevo dato'),(2,'2022-10-27 21:03:57','root@localhost','9','9','Update'),(3,'2022-10-27 21:05:04','root@localhost','7','12','Update'),(4,'2022-10-27 21:19:09','root@localhost',NULL,'24','Nuevo dato');
/*!40000 ALTER TABLE `historial_cambios_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1140621793,25),(2,1141567423,2),(3,11204789,23),(4,12345678,4),(5,1140568965,21),(6,1140621789,20),(7,75896412,12),(8,68543210,18),(9,25786312,12),(10,12496785,15),(11,25463124,20),(12,10245698,11),(13,22589635,13),(14,8956321,18),(15,8912453,5),(16,22589635,22),(17,8956321,3),(18,1141567423,24),(19,1140621793,1),(20,1140621793,4),(21,1140621793,3),(24,1140621793,17);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'FIFA23 PS',70,1),(2,'FIFA23 XBOX',85,3),(3,'FIFA23 SWITCH',47,2),(4,'Super Smash Bros',85,2),(5,'Dragon Ball Xenoverse PS',52,1),(6,'Dragon Ball Xenoverse XBOX',52,3),(7,'Halo',70,3),(8,'Bloodborne ',52,1),(9,'Gears of War',85,3),(10,'Killer Instinct',30,3),(11,'Pokemon Espada y Escudo',70,2),(12,'Dragon Ball Xenoverse Switch',47,2),(13,'The Last Guardian ',47,1),(14,'Sea of Thieves',70,3),(15,'Detroit: Become Human ',30,1),(16,'Titanfall',70,3),(17,'Kirby',30,2),(18,'God of war',20,1),(19,'Forza Horizon 4',85,3),(20,'Marvel\'s Spider-Man ',70,1),(21,'The legend of zelda',20,2),(22,'Animal Crossing',70,2),(23,'Metroid Dread',70,2),(24,'Super Mario Maker2',70,2),(25,'Bayonetta 2',85,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productoproveedor`
--

LOCK TABLES `productoproveedor` WRITE;
/*!40000 ALTER TABLE `productoproveedor` DISABLE KEYS */;
INSERT INTO `productoproveedor` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,4),(6,6,1),(7,7,2),(8,8,2),(9,9,3),(10,10,4),(11,11,1),(12,12,4),(13,13,2),(14,14,2),(15,15,1),(16,16,4),(17,17,3),(18,18,4),(19,19,1),(20,20,3),(21,21,1),(22,22,1),(23,23,1),(24,24,4),(25,25,2);
/*!40000 ALTER TABLE `productoproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'VideojuegosBarranquilla','3218563219','Calle72#38-15','VideojuegosBarranquilla@gmail.com','2020-08-14',NULL),(2,'VideojuegosBarranquilla','3218563219','Calle72#38-15','VideojuegosBarranquilla@gmail.com','2020-08-14',NULL),(3,'SmileBogota','3157496327','Calle45#20-20','SmileBogota@outlook.com','2021-09-30',NULL),(4,'StoreDigital','3034789654','Carrera78#90-56','StoreDigital@outlook.com','2019-04-12',NULL),(5,'MichVideogames','3135698745','Carrera27#47-28','MichVideogames@gmail.com','2022-10-08',NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 20:04:49
