-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: empresa_calzado
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bodega`
--

DROP TABLE IF EXISTS `bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodega` (
  `IdBod` int(11) NOT NULL COMMENT 'Id de la bodega que conecta con el inventario',
  `Producto` int(11) DEFAULT NULL COMMENT 'ID del producto',
  PRIMARY KEY (`IdBod`),
  KEY `relacionproducto` (`Producto`),
  CONSTRAINT `relacionproducto` FOREIGN KEY (`Producto`) REFERENCES `producto` (`IdPro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `IdColor` int(11) NOT NULL COMMENT 'ID del color del producto',
  `NColor` varchar(45) DEFAULT NULL COMMENT 'Color del producto',
  PRIMARY KEY (`IdColor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `Codigo` int(11) NOT NULL COMMENT 'Codigo del empleado',
  `NIP` int(11) DEFAULT NULL COMMENT 'Numero de identificacion del empleado',
  `Direccion` varchar(45) DEFAULT NULL COMMENT 'Dirección del empleado',
  `Fnacimiento` date DEFAULT NULL COMMENT 'Fecha de nacimiento del empleado',
  `Nombre` varchar(45) DEFAULT NULL COMMENT 'Nombre del empleado',
  `Apellido` varchar(45) DEFAULT NULL COMMENT 'Apellidos del empleado',
  `Salario` int(11) DEFAULT NULL COMMENT 'El salario del empleado',
  `Genero` int(11) DEFAULT NULL COMMENT 'El genero del empleado',
  `Nacionalidad` int(11) DEFAULT NULL COMMENT 'La nacionalidad del empleado',
  `Contraseña` int(11) DEFAULT NULL COMMENT 'Contraseña del empleado',
  PRIMARY KEY (`Codigo`),
  KEY `relaciongenero` (`Genero`),
  KEY `relacionnacionalidad` (`Nacionalidad`),
  CONSTRAINT `relaciongenero` FOREIGN KEY (`Genero`) REFERENCES `genero` (`IdGenero`),
  CONSTRAINT `relacionnacionalidad` FOREIGN KEY (`Nacionalidad`) REFERENCES `nacionalidad` (`IdNacio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `IdGenero` int(11) NOT NULL COMMENT 'Id del genero',
  `Nombre` varchar(45) DEFAULT NULL COMMENT 'Nombre del genero del empleado',
  PRIMARY KEY (`IdGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `IdInv` int(11) NOT NULL COMMENT 'ID de la tabla del inventario que conecta con la bodega',
  `IdEmp` int(11) DEFAULT NULL COMMENT 'ID del empleado',
  `IdBod` int(11) DEFAULT NULL COMMENT 'ID de la bodega conectado con la tabla bodega',
  PRIMARY KEY (`IdInv`),
  KEY `relacioninventario` (`IdEmp`),
  KEY `relacionbodega` (`IdBod`),
  CONSTRAINT `relacionbodega` FOREIGN KEY (`IdBod`) REFERENCES `bodega` (`IdBod`),
  CONSTRAINT `relacioninventario` FOREIGN KEY (`IdEmp`) REFERENCES `empleado` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nacionalidad` (
  `IdNacio` int(11) NOT NULL COMMENT 'ID de la nacionalidad',
  `Nombre` varchar(45) DEFAULT NULL COMMENT 'Nacionalidad del empleado',
  PRIMARY KEY (`IdNacio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `IdPro` int(11) NOT NULL COMMENT 'ID del producto',
  `Seccion` int(11) DEFAULT NULL COMMENT 'Espacio en donde esta el producto',
  `Marca` varchar(45) DEFAULT NULL COMMENT 'Nombre de la marca del producto',
  `Referencia` varchar(45) DEFAULT NULL COMMENT 'Referencia del producto',
  `Talla` int(11) DEFAULT NULL COMMENT 'Numero de la talla del producto',
  `Color` int(11) DEFAULT NULL COMMENT 'Color del producto',
  `Valor` int(11) DEFAULT NULL COMMENT 'Valor del producto',
  PRIMARY KEY (`IdPro`),
  KEY `relacioncolor` (`Color`),
  KEY `relacionseccion` (`Seccion`),
  CONSTRAINT `relacioncolor` FOREIGN KEY (`Color`) REFERENCES `color` (`IdColor`),
  CONSTRAINT `relacionseccion` FOREIGN KEY (`Seccion`) REFERENCES `seccion` (`IdSec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto` (
  `IdPuesto` int(11) NOT NULL COMMENT 'ID del puesto',
  `Nombre` varchar(45) DEFAULT NULL COMMENT 'Nombre del puesto del empleado',
  PRIMARY KEY (`IdPuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `IdRol` int(11) NOT NULL COMMENT 'ID del rol',
  `IdEmp` int(11) DEFAULT NULL COMMENT 'ID del empleado que conecta con la tabla empleado',
  `IDPuesto` int(11) DEFAULT NULL COMMENT 'ID del puesto que conecta con la tabla puesto',
  PRIMARY KEY (`IdRol`),
  KEY `relacionemp1` (`IdEmp`),
  KEY `relacionpuesto` (`IDPuesto`),
  CONSTRAINT `relacionemp1` FOREIGN KEY (`IdEmp`) REFERENCES `empleado` (`Codigo`),
  CONSTRAINT `relacionpuesto` FOREIGN KEY (`IDPuesto`) REFERENCES `puesto` (`IdPuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccion` (
  `IdSec` int(11) NOT NULL COMMENT 'ID de la sección',
  `NSec` varchar(45) DEFAULT NULL COMMENT 'Letra de la sección en donde pertenece el producto',
  PRIMARY KEY (`IdSec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos` (
  `IdTele` int(11) NOT NULL,
  `IdEmp` int(11) DEFAULT NULL,
  `Numero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdTele`),
  KEY `relaciontelefono` (`IdEmp`),
  CONSTRAINT `relaciontelefono` FOREIGN KEY (`IdEmp`) REFERENCES `empleado` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-08 23:07:43
