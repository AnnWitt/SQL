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
-- Table structure for table `recenzja`
--

DROP TABLE IF EXISTS `recenzja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recenzja` (
  `recenzja_id` bigint NOT NULL AUTO_INCREMENT,
  `ksiazka_id` bigint DEFAULT NULL,
  `recenzja_tekst` varchar(300) COLLATE utf8_polish_ci DEFAULT NULL,
  `klient_id` bigint NOT NULL,
  PRIMARY KEY (`recenzja_id`),
  KEY `ksiazka_id` (`ksiazka_id`),
  KEY `klient_id` (`klient_id`),
  CONSTRAINT `recenzja_ibfk_1` FOREIGN KEY (`ksiazka_id`) REFERENCES `ksiazka` (`ksiazka_id`),
  CONSTRAINT `recenzja_ibfk_2` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`klient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recenzja`
--

LOCK TABLES `recenzja` WRITE;
/*!40000 ALTER TABLE `recenzja` DISABLE KEYS */;
INSERT INTO `recenzja` VALUES (1,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla egestas tempor pulvinar. Etiam a pulvinar ipsum. Praesent aliquet neque luctus nibh luctus faucibus. Morbi venenatis et libero in dictum. Viva',1),(2,1,'Senectus et netus et malesuada fames ac turpis egestas. Aliquam vehicula, diam ut porttitor eleifend, libero sapien aliquet felis, sed volutpat erat lorem sit amet orci. Nulla velit nulla, tincidunt id nunc non, adipiscing dictum velit. Vestibulum dapibus turpis ac nibh blandit, int',1),(3,2,'Duis vitae convallis neque, nec sollicitudin dolor. Vestibulum id sodales nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam interdum aliquet purus, et porttitor ligula faucibus et. Phasellus vitae libero blandit, euis',2),(4,2,'A ac dictum congue, neque justo tincidunt lacus, at malesuada nulla tellus vitae magna. In in eros rhoncus, viverra mauris a, blandi',2),(5,3,'Neque justo tincidunt lacus, at malesuada nulla tellus vitae magna. In in eros rhoncus, viverra mauris a, blandi',2),(6,4,'Duis vitae convallis neque, nec sollicitudin dolor. Vestibulum id sodales nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam interdum aliquet purus, et porttitor ligula faucibus et. Phasellus vitae libero blandit, euismod m',3),(7,5,'Świetna!',2);
/*!40000 ALTER TABLE `recenzja` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-22 21:44:40
