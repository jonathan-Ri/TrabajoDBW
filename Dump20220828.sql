-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: alerta_emergencia
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
-- Table structure for table `Administrador`
--

DROP TABLE IF EXISTS `Administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrador` (
  `Nombres` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `RUT` int NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrador`
--

LOCK TABLES `Administrador` WRITE;
/*!40000 ALTER TABLE `Administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alerta`
--

DROP TABLE IF EXISTS `Alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alerta` (
  `fecha` date NOT NULL,
  `ID` varchar(30) NOT NULL,
  `tipo_emergencia` varchar(30) NOT NULL,
  `hora` varchar(7) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `observacion` varchar(50) NOT NULL,
  `RUT_administrador` int NOT NULL,
  `RUT_representante` int NOT NULL,
  `RUT_personas` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Alerta_fk_Administrador` (`RUT_administrador`),
  KEY `Alerta_fk_Personas` (`RUT_personas`),
  KEY `Alerta_fk_Representante_organismo` (`RUT_representante`),
  CONSTRAINT `Alerta_fk_Administrador` FOREIGN KEY (`RUT_administrador`) REFERENCES `Administrador` (`RUT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Alerta_fk_Personas` FOREIGN KEY (`RUT_personas`) REFERENCES `Personas` (`RUT_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Alerta_fk_Representante_organismo` FOREIGN KEY (`RUT_representante`) REFERENCES `Representante_organismo` (`RUT_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alerta`
--

LOCK TABLES `Alerta` WRITE;
/*!40000 ALTER TABLE `Alerta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personas`
--

DROP TABLE IF EXISTS `Personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personas` (
  `Discapacidad` varchar(30) NOT NULL,
  `calle_direccion` varchar(20) NOT NULL,
  `ciudad_direccion` varchar(30) NOT NULL,
  `RUT_usuario` int NOT NULL,
  PRIMARY KEY (`RUT_usuario`),
  CONSTRAINT `Personas_fk_Usuarios` FOREIGN KEY (`RUT_usuario`) REFERENCES `Usuarios` (`RUT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personas`
--

LOCK TABLES `Personas` WRITE;
/*!40000 ALTER TABLE `Personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Representante_Organismo`
--

DROP TABLE IF EXISTS `Representante_Organismo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Representante_Organismo` (
  `cargo` varchar(20) NOT NULL,
  `organismo` varchar(30) NOT NULL,
  `RUT_usuario` int NOT NULL,
  PRIMARY KEY (`RUT_usuario`),
  CONSTRAINT `Representante_Organismo_fk_Usuarios` FOREIGN KEY (`RUT_usuario`) REFERENCES `Usuarios` (`RUT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Representante_Organismo`
--

LOCK TABLES `Representante_Organismo` WRITE;
/*!40000 ALTER TABLE `Representante_Organismo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Representante_Organismo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `Nombres` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `RUT` int NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `telefono` int NOT NULL,
  `RUT_administrador` int DEFAULT NULL,
  PRIMARY KEY (`RUT`),
  KEY `Usuarios_fk_Administrador` (`RUT_administrador`),
  CONSTRAINT `Usuarios_fk_Administrador` FOREIGN KEY (`RUT_administrador`) REFERENCES `Usuarios` (`RUT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-28 18:10:46
