-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: kurs49
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klient` (
  `klient_id` bigint NOT NULL AUTO_INCREMENT,
  `imie` char(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` char(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `rok_urodzenia` date DEFAULT NULL,
  `plec` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `data_zalozenia` date DEFAULT NULL,
  `id_polecony_przez` bigint DEFAULT NULL,
  PRIMARY KEY (`klient_id`),
  KEY `id_polecony_przez` (`id_polecony_przez`),
  CONSTRAINT `klient_ibfk_1` FOREIGN KEY (`id_polecony_przez`) REFERENCES `klient` (`klient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
INSERT INTO `klient` VALUES (1,'Jacek','Szymański','1970-01-01','M','2014-01-01',NULL),(2,'Jan','Kowalski','1980-01-01','M','2014-01-10',1),(3,'Franciszek','Kowalczyk','1981-01-01','M','2014-01-10',1),(4,'Joanna','Nowak','2000-02-01','K','2014-01-10',1),(5,'Tadeusz','Nowak','1972-01-01','M','2014-01-10',2),(6,'Jacek','Szymański','1950-01-01','M','2014-01-01',2),(7,'Tomasz','Nowak','1975-01-03','M','2014-08-01',NULL);
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-22 21:44:41
