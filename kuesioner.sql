-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: kuesioner
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `LikertScale`
--

DROP TABLE IF EXISTS `LikertScale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LikertScale` (
  `ScaleValue` int NOT NULL,
  `ScaleMeaning` varchar(50) NOT NULL,
  PRIMARY KEY (`ScaleValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LikertScale`
--

LOCK TABLES `LikertScale` WRITE;
/*!40000 ALTER TABLE `LikertScale` DISABLE KEYS */;
INSERT INTO `LikertScale` VALUES (1,'Strongly Disagree'),(2,'Disagree'),(3,'Neutral'),(4,'Agree'),(5,'Strongly Agree');
/*!40000 ALTER TABLE `LikertScale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Questions` (
  `QuestionID` int NOT NULL,
  `QuestionText` varchar(255) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (1,'EVs are currently too expensive for the average consumer to purchase.','Cost'),(2,'The long-term cost savings make EVs a better value than regular vehicles.','Cost'),(3,'Regular gasoline vehicles offer a more reliable and convenient driving range.','Performance'),(4,'I prefer the driving experience of an electric vehicle.','Performance'),(5,'There are enough public charging stations available in my area.','Infrastructure'),(6,'I am concerned that owning an EV would require expensive home electrical upgrades.','Infrastructure'),(7,'EVs are significantly better for the environment than regular vehicles.','Environment'),(8,'Government policies should prioritize incentives for electric vehicles.','Policy'),(9,'I believe that electric vehicles will completely replace regular gasoline vehicles within the next 20 years.','Future'),(10,'The availability of high-quality EV models is comparable to regular vehicle models.','Availability');
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Responses`
--

DROP TABLE IF EXISTS `Responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Responses` (
  `ResponseID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `QuestionID` int NOT NULL,
  `ScaleValue` int NOT NULL,
  `Timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ResponseID`),
  KEY `UserID` (`UserID`),
  KEY `QuestionID` (`QuestionID`),
  KEY `ScaleValue` (`ScaleValue`),
  CONSTRAINT `Responses_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  CONSTRAINT `Responses_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `Questions` (`QuestionID`),
  CONSTRAINT `Responses_ibfk_3` FOREIGN KEY (`ScaleValue`) REFERENCES `LikertScale` (`ScaleValue`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Responses`
--

LOCK TABLES `Responses` WRITE;
/*!40000 ALTER TABLE `Responses` DISABLE KEYS */;
INSERT INTO `Responses` VALUES (1,1,1,4,'2025-12-06 10:04:05'),(2,1,2,3,'2025-12-06 10:04:05'),(3,1,3,4,'2025-12-06 10:04:05'),(4,1,4,2,'2025-12-06 10:04:05'),(5,1,5,1,'2025-12-06 10:04:05'),(6,1,6,5,'2025-12-06 10:04:05'),(7,1,7,3,'2025-12-06 10:04:05'),(8,1,8,3,'2025-12-06 10:04:05'),(9,1,9,3,'2025-12-06 10:04:05'),(10,1,10,3,'2025-12-06 10:04:05'),(11,2,1,1,'2025-12-06 10:04:05'),(12,2,2,5,'2025-12-06 10:04:05'),(13,2,3,1,'2025-12-06 10:04:05'),(14,2,4,4,'2025-12-06 10:04:05'),(15,2,5,4,'2025-12-06 10:04:05'),(16,2,6,2,'2025-12-06 10:04:05'),(17,2,7,2,'2025-12-06 10:04:05'),(18,2,8,5,'2025-12-06 10:04:05'),(19,2,9,5,'2025-12-06 10:04:05'),(20,2,10,5,'2025-12-06 10:04:05'),(21,3,1,4,'2025-12-06 10:04:05'),(22,3,2,4,'2025-12-06 10:04:05'),(23,3,3,5,'2025-12-06 10:04:05'),(24,3,4,1,'2025-12-06 10:04:05'),(25,3,5,1,'2025-12-06 10:04:05'),(26,3,6,2,'2025-12-06 10:04:05'),(27,3,7,2,'2025-12-06 10:04:05'),(28,3,8,3,'2025-12-06 10:04:05'),(29,3,9,2,'2025-12-06 10:04:05'),(30,3,10,1,'2025-12-06 10:04:05'),(31,4,1,2,'2025-12-06 10:04:05'),(32,4,2,3,'2025-12-06 10:04:05'),(33,4,3,3,'2025-12-06 10:04:05'),(34,4,4,4,'2025-12-06 10:04:05'),(35,4,5,2,'2025-12-06 10:04:05'),(36,4,6,5,'2025-12-06 10:04:05'),(37,4,7,4,'2025-12-06 10:04:05'),(38,4,8,4,'2025-12-06 10:04:05'),(39,4,9,3,'2025-12-06 10:04:05'),(40,4,10,4,'2025-12-06 10:04:05'),(41,5,1,4,'2025-12-06 10:04:05'),(42,5,2,4,'2025-12-06 10:04:05'),(43,5,3,2,'2025-12-06 10:04:05'),(44,5,4,2,'2025-12-06 10:04:05'),(45,5,5,4,'2025-12-06 10:04:05'),(46,5,6,4,'2025-12-06 10:04:05'),(47,5,7,4,'2025-12-06 10:04:05'),(48,5,8,4,'2025-12-06 10:04:05'),(49,5,9,4,'2025-12-06 10:04:05'),(50,5,10,4,'2025-12-06 10:04:05'),(51,6,1,1,'2025-12-06 10:04:05'),(52,6,2,4,'2025-12-06 10:04:05'),(53,6,3,5,'2025-12-06 10:04:05'),(54,6,4,1,'2025-12-06 10:04:05'),(55,6,5,1,'2025-12-06 10:04:05'),(56,6,6,5,'2025-12-06 10:04:05'),(57,6,7,1,'2025-12-06 10:04:05'),(58,6,8,3,'2025-12-06 10:04:05'),(59,6,9,1,'2025-12-06 10:04:05'),(60,6,10,5,'2025-12-06 10:04:05'),(61,7,1,2,'2025-12-06 10:04:05'),(62,7,2,4,'2025-12-06 10:04:05'),(63,7,3,5,'2025-12-06 10:04:05'),(64,7,4,3,'2025-12-06 10:04:05'),(65,7,5,3,'2025-12-06 10:04:05'),(66,7,6,4,'2025-12-06 10:04:05'),(67,7,7,4,'2025-12-06 10:04:05'),(68,7,8,3,'2025-12-06 10:04:05'),(69,7,9,4,'2025-12-06 10:04:05'),(70,7,10,4,'2025-12-06 10:04:05'),(71,8,1,3,'2025-12-06 10:04:05'),(72,8,2,2,'2025-12-06 10:04:05'),(73,8,3,5,'2025-12-06 10:04:05'),(74,8,4,3,'2025-12-06 10:04:05'),(75,8,5,2,'2025-12-06 10:04:05'),(76,8,6,4,'2025-12-06 10:04:05'),(77,8,7,3,'2025-12-06 10:04:05'),(78,8,8,4,'2025-12-06 10:04:05'),(79,8,9,3,'2025-12-06 10:04:05'),(80,8,10,2,'2025-12-06 10:04:05'),(81,9,1,3,'2025-12-06 10:04:05'),(82,9,2,3,'2025-12-06 10:04:05'),(83,9,3,2,'2025-12-06 10:04:05'),(84,9,4,3,'2025-12-06 10:04:05'),(85,9,5,3,'2025-12-06 10:04:05'),(86,9,6,3,'2025-12-06 10:04:05'),(87,9,7,4,'2025-12-06 10:04:05'),(88,9,8,4,'2025-12-06 10:04:05'),(89,9,9,3,'2025-12-06 10:04:05'),(90,9,10,3,'2025-12-06 10:04:05'),(91,10,1,4,'2025-12-06 10:04:05'),(92,10,2,3,'2025-12-06 10:04:05'),(93,10,3,4,'2025-12-06 10:04:05'),(94,10,4,2,'2025-12-06 10:04:05'),(95,10,5,2,'2025-12-06 10:04:05'),(96,10,6,4,'2025-12-06 10:04:05'),(97,10,7,4,'2025-12-06 10:04:05'),(98,10,8,4,'2025-12-06 10:04:05'),(99,10,9,2,'2025-12-06 10:04:05'),(100,10,10,3,'2025-12-06 10:04:05'),(101,11,1,5,'2025-12-06 10:04:05'),(102,11,2,3,'2025-12-06 10:04:05'),(103,11,3,3,'2025-12-06 10:04:05'),(104,11,4,3,'2025-12-06 10:04:05'),(105,11,5,2,'2025-12-06 10:04:05'),(106,11,6,3,'2025-12-06 10:04:05'),(107,11,7,5,'2025-12-06 10:04:05'),(108,11,8,5,'2025-12-06 10:04:05'),(109,11,9,4,'2025-12-06 10:04:05'),(110,11,10,4,'2025-12-06 10:04:05'),(111,12,1,1,'2025-12-06 10:04:05'),(112,12,2,4,'2025-12-06 10:04:05'),(113,12,3,4,'2025-12-06 10:04:05'),(114,12,4,2,'2025-12-06 10:04:05'),(115,12,5,3,'2025-12-06 10:04:05'),(116,12,6,4,'2025-12-06 10:04:05'),(117,12,7,5,'2025-12-06 10:04:05'),(118,12,8,4,'2025-12-06 10:04:05'),(119,12,9,2,'2025-12-06 10:04:05'),(120,12,10,3,'2025-12-06 10:04:05'),(121,13,1,3,'2025-12-06 10:04:05'),(122,13,2,3,'2025-12-06 10:04:05'),(123,13,3,3,'2025-12-06 10:04:05'),(124,13,4,3,'2025-12-06 10:04:05'),(125,13,5,3,'2025-12-06 10:04:05'),(126,13,6,3,'2025-12-06 10:04:05'),(127,13,7,4,'2025-12-06 10:04:05'),(128,13,8,4,'2025-12-06 10:04:05'),(129,13,9,3,'2025-12-06 10:04:05'),(130,13,10,3,'2025-12-06 10:04:05'),(131,14,1,3,'2025-12-06 10:04:05'),(132,14,2,3,'2025-12-06 10:04:05'),(133,14,3,3,'2025-12-06 10:04:05'),(134,14,4,3,'2025-12-06 10:04:05'),(135,14,5,3,'2025-12-06 10:04:05'),(136,14,6,3,'2025-12-06 10:04:05'),(137,14,7,4,'2025-12-06 10:04:05'),(138,14,8,4,'2025-12-06 10:04:05'),(139,14,9,4,'2025-12-06 10:04:05'),(140,14,10,3,'2025-12-06 10:04:05'),(141,15,1,2,'2025-12-06 10:04:05'),(142,15,2,2,'2025-12-06 10:04:05'),(143,15,3,4,'2025-12-06 10:04:05'),(144,15,4,2,'2025-12-06 10:04:05'),(145,15,5,2,'2025-12-06 10:04:05'),(146,15,6,4,'2025-12-06 10:04:05'),(147,15,7,4,'2025-12-06 10:04:05'),(148,15,8,4,'2025-12-06 10:04:05'),(149,15,9,2,'2025-12-06 10:04:05'),(150,15,10,2,'2025-12-06 10:04:05');
/*!40000 ALTER TABLE `Responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `VehicleOwned` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Putri Aprilia','Kendaraan Konvensional\r'),(2,'Hikmal Akbar','Kendaraan Listrik\r'),(3,'RK','Kendaraan Konvensional\r'),(4,'Ahmad Reza Aulia Siregar','Kendaraan Konvensional\r'),(5,'Rasdi Okta Ramadhan Lubis','Kendaraan Konvensional\r'),(6,'J','Kendaraan Konvensional\r'),(7,'Faza Naufal','Kendaraan Konvensional\r'),(8,'Azura Barus','Kendaraan Konvensional\r'),(9,'muhammad rafly khairul azhar','Kendaraan Konvensional\r'),(10,'Mas Afif','Kendaraan Konvensional\r'),(11,'Alya Rahma','Kendaraan Konvensional\r'),(12,'knjt','Kendaraan Listrik\r'),(13,'dio','Kendaraan Konvensional\r'),(14,'Rizki','Kendaraan Konvensional\r'),(15,'Daffa','Kendaraan Listrik\r');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-11 14:41:22
