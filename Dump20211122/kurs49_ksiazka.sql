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
-- Table structure for table `ksiazka`
--

DROP TABLE IF EXISTS `ksiazka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ksiazka` (
  `ksiazka_id` bigint NOT NULL AUTO_INCREMENT,
  `rodzaj` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `autor_imie` char(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `autor_nazwisko` char(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `tytul` char(200) COLLATE utf8_polish_ci NOT NULL,
  `min_wiek` int DEFAULT NULL,
  PRIMARY KEY (`ksiazka_id`),
  KEY `rodzaj` (`rodzaj`),
  CONSTRAINT `ksiazka_ibfk_1` FOREIGN KEY (`rodzaj`) REFERENCES `rodzaj_ksiazki` (`rodzaj`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ksiazka`
--

LOCK TABLES `ksiazka` WRITE;
/*!40000 ALTER TABLE `ksiazka` DISABLE KEYS */;
INSERT INTO `ksiazka` VALUES (1,'Historyczna','Władysław','Bartoszewski','1859 dni Warszawy',12),(2,'Historyczna','Władysław','Bartoszewski','Mój Auschwitz',12),(3,'Historyczna','Władysław','Bartoszewski','Powstanie Warszawskie',12),(4,'Bajki','Adam','Mickiewicz','Bajki',3),(5,'Bajki','Jan','Brzechwa','Bajki',3),(6,'Bajki','Marta','Berowska','Bajki polskie',3),(7,'SF','Stanisław','Lem','Bajki robotów',12),(8,'SF','Janusz','Zajdel','Paradyzja',18),(9,'SF','Janusz','Zajdel','Limes inferior',18),(10,'Biografia','Gustaw','Helling-Grudziński','Inny świat',12),(11,'Biografia','Walter','Isaacson','Steve Jobs',12),(12,'Biografia','Stanisław','Grzesiuk','Na marginesie życia',18),(13,'Biografia','Stanisław','Grzesiuk','Pięć lat kacetu',18),(14,'Biografia','Józef','Hen','Najpiękniejsze lata',12);
/*!40000 ALTER TABLE `ksiazka` ENABLE KEYS */;
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
