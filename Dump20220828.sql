-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: alerta
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `administradors`
--

DROP TABLE IF EXISTS `administradors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permisos` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UsuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UsuarioId` (`UsuarioId`),
  CONSTRAINT `administradors_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradors`
--

LOCK TABLES `administradors` WRITE;
/*!40000 ALTER TABLE `administradors` DISABLE KEYS */;
/*!40000 ALTER TABLE `administradors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alarmas`
--

DROP TABLE IF EXISTS `alarmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarmas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_emergencia` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `localizacion` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PersonaId` int DEFAULT NULL,
  `AdministradorId` int DEFAULT NULL,
  `OrganismoId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PersonaId` (`PersonaId`),
  KEY `AdministradorId` (`AdministradorId`),
  KEY `OrganismoId` (`OrganismoId`),
  CONSTRAINT `alarmas_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `personas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `alarmas_ibfk_2` FOREIGN KEY (`AdministradorId`) REFERENCES `administradors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `alarmas_ibfk_3` FOREIGN KEY (`OrganismoId`) REFERENCES `organismos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarmas`
--

LOCK TABLES `alarmas` WRITE;
/*!40000 ALTER TABLE `alarmas` DISABLE KEYS */;
INSERT INTO `alarmas` VALUES (11,'Intoxicacion','1','1','1','2022-11-07 22:22:41','2022-11-07 22:22:41',NULL,NULL,NULL),(13,'Atropello','1','1','1','2022-11-07 23:06:43','2022-11-07 23:06:43',NULL,NULL,NULL),(14,'Atropello','1','Cámíón atropesha adulto que jugaba en su patio','Ruta 68 km 34','2022-11-07 23:09:16','2022-11-07 23:09:16',NULL,NULL,NULL),(15,'Atropello','1','1','1','2022-11-07 23:16:28','2022-11-07 23:16:28',NULL,NULL,NULL),(16,'Intoxicacion','1','1','1','2022-11-07 23:17:04','2022-11-07 23:17:04',NULL,NULL,NULL);
/*!40000 ALTER TABLE `alarmas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismos`
--

DROP TABLE IF EXISTS `organismos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organismos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Organismo` varchar(255) DEFAULT NULL,
  `Cargo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UsuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UsuarioId` (`UsuarioId`),
  CONSTRAINT `organismos_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismos`
--

LOCK TABLES `organismos` WRITE;
/*!40000 ALTER TABLE `organismos` DISABLE KEYS */;
/*!40000 ALTER TABLE `organismos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Discapacidad` varchar(255) DEFAULT NULL,
  `Calle` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UsuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UsuarioId` (`UsuarioId`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `RUT` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'1','1','1','asdasdas@gmail.com','1',1,1,'1',1,'2022-11-07 14:20:11','2022-11-07 14:20:11'),(2,'1','1','1','1@gmail.com','1',1,1,'1',1,'2022-11-07 23:03:43','2022-11-07 23:03:43'),(3,'1','1','1','1@gmail.com','1',1,1,'1',1,'2022-11-07 23:31:32','2022-11-07 23:31:32'),(4,'1','1','1','juan@gmail.com','1',31,1,'1',1,'2022-11-07 23:38:59','2022-11-07 23:38:59'),(5,'1','1','1','juan@gmail.com','1',31,1,'1',1,'2022-11-07 23:38:59','2022-11-07 23:38:59');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 12:05:29
