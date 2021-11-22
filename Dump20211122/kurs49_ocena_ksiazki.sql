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
-- Table structure for table `ocena_ksiazki`
--

DROP TABLE IF EXISTS `ocena_ksiazki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocena_ksiazki` (
  `ksiazka_id` bigint NOT NULL,
  `klient_id` bigint NOT NULL,
  `ocena` int DEFAULT NULL,
  PRIMARY KEY (`ksiazka_id`,`klient_id`),
  KEY `klient_id` (`klient_id`),
  CONSTRAINT `ocena_ksiazki_ibfk_1` FOREIGN KEY (`ksiazka_id`) REFERENCES `ksiazka` (`ksiazka_id`),
  CONSTRAINT `ocena_ksiazki_ibfk_2` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`klient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocena_ksiazki`
--

LOCK TABLES `ocena_ksiazki` WRITE;
/*!40000 ALTER TABLE `ocena_ksiazki` DISABLE KEYS */;
INSERT INTO `ocena_ksiazki` VALUES (1,4,4),(1,5,3),(2,1,4),(2,2,4),(2,3,4),(2,5,2),(3,1,10),(3,2,5),(3,3,3),(3,4,5),(3,5,3),(4,1,5),(4,4,6),(4,5,5),(5,1,10),(5,5,5),(6,2,5),(6,3,4),(6,5,3),(7,5,4),(8,4,7),(8,5,5),(9,5,6),(10,2,10),(10,3,5),(10,5,8),(11,4,8),(11,5,7),(12,4,0),(12,5,8);
/*!40000 ALTER TABLE `ocena_ksiazki` ENABLE KEYS */;
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
