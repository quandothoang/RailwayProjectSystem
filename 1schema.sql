-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: cs336.ctajrdswgkyj.us-east-2.rds.amazonaws.com    Database: RailwaySystem0
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(20) DEFAULT NULL,
  KEY `username` (`username`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `employees` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin1');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `email` varchar(35) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  KEY `username` (`username`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`username`) REFERENCES `person` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('joel@gmail.com','joelie'),('Test_1','Test_1'),('Axel@gmail.com','McLovin'),('meowmoe@kaoel.com','Snoopy'),('miranda@gmail.com','Miranda'),('axxel@gmal.com','axjim'),('Bbj',''),('miranda@cs.rutgers.edu','Miranda_Teacher'),('joel@rutgers.edu','jmar'),('joel@cs.rutgers.edu','jjoel');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerRep`
--

DROP TABLE IF EXISTS `customerRep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerRep` (
  `username` varchar(20) DEFAULT NULL,
  KEY `username` (`username`),
  CONSTRAINT `customerRep_ibfk_1` FOREIGN KEY (`username`) REFERENCES `employees` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerRep`
--

LOCK TABLES `customerRep` WRITE;
/*!40000 ALTER TABLE `customerRep` DISABLE KEYS */;
INSERT INTO `customerRep` VALUES ('custyRep');
/*!40000 ALTER TABLE `customerRep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `ssn` varchar(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  KEY `username` (`username`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`username`) REFERENCES `person` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('111-11-111','admin1'),('222-22-222','custyRep');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `reservationNum` int NOT NULL AUTO_INCREMENT,
  `trainID` int DEFAULT NULL,
  `tLine_name` varchar(20) DEFAULT NULL,
  `destination` varchar(15) DEFAULT NULL,
  `origin` varchar(15) DEFAULT NULL,
  `dTime` datetime DEFAULT NULL,
  PRIMARY KEY (`reservationNum`),
  KEY `trainID` (`trainID`,`tLine_name`,`origin`,`destination`,`dTime`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`trainID`, `tLine_name`, `origin`, `destination`, `dTime`) REFERENCES `train_schedule` (`trainID`, `tLine_name`, `origin`, `destination`, `dTime`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`reservationNum`) REFERENCES `reservation` (`reservationNum`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (42,3000,'EastonNorth Corridor','Metuchen','New Brunswick','2020-12-25 12:00:00'),(44,3000,'EastonNorth Corridor','Rahway','New Brunswick','2020-12-25 12:00:00'),(43,3000,'Northeast Corridor L','Edison','New Brunswick','2020-12-10 12:00:00'),(57,3000,'Northeast Corridor L','Rahway','New Brunswick','2020-12-10 12:00:00'),(49,3002,'Northeast Corridor L','Edison','New Brunswick','2020-12-18 12:00:00'),(50,3002,'Northeast Corridor L','Metuchen','New Brunswick','2020-12-18 12:00:00'),(52,3002,'Northeast Corridor L','Metuchen','New Brunswick','2020-12-18 12:00:00'),(23,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(24,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(29,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(30,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(31,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(35,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(36,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(37,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(40,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(55,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(58,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(59,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(60,3002,'Northeast Corridor L','Rahway','New Brunswick','2020-12-18 12:00:00'),(45,4000,'East Coastal L','New Brunswick','Rahway','2020-12-27 12:00:00'),(46,4000,'East Coastal L','New Brunswick','Rahway','2020-12-27 12:00:00'),(47,4000,'East Coastal L','New Brunswick','Rahway','2020-12-27 12:00:00'),(48,4000,'East Coastal L','New Brunswick','Rahway','2020-12-27 12:00:00'),(38,4002,'North Jersey Coast L','Perth Amboy','Red Bank','2020-12-22 12:00:00');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `username` varchar(20) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  `fName` varchar(15) DEFAULT NULL,
  `lName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('','Hhj','Uhh','Hhj'),('admin1','admin','quan','quan'),('axjim','123','Axel','jr'),('custyRep','123','custy','Rep'),('jjoel','123','JoelF','Martinezz'),('jmar','123','Joel','Martinez'),('joelie','123','quan','quanny'),('McLovin','123','Axel','Ernie'),('Miranda','123','Miranda','Gupta'),('Miranda_Teacher','1234','Miranda','Garcia'),('Snoopy','123','Snoop','Dogg'),('Test_1','Test_1','Test_1','Test_1');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_table`
--

DROP TABLE IF EXISTS `question_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_table` (
  `questionID` int NOT NULL AUTO_INCREMENT,
  `question` text,
  `answer` text,
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_table`
--

LOCK TABLES `question_table` WRITE;
/*!40000 ALTER TABLE `question_table` DISABLE KEYS */;
INSERT INTO `question_table` VALUES (1,'My reservation is cancelled. How am I going to get my compensation?','We can refund you by issuing travel credits in the amount of your ticket with a $5 gift card, or we can refund it to your original payment method the full amount. Note that travel credits refund is instant while banks might take 5-7 business days to process your refund.'),(2,'The information on my reservation is incorrect. How do I fix this?','The information on my reservation is incorrect. How do I fix this?'),(3,'Do children, people with disability and people over the age of 65 get a discount?','Yes, simply select your appropriate group to receive discount when making a reservation.'),(4,'Are there any services offered on board the train?','This depends on route and company that you booked your reservation. Simply check your ticket for further information.'),(5,'How do I cancel my reservation?','Simply go into “My Reservation” and cancel from there. Please be reminded that a cancellation fee might be implemented if your reservation is cancelled 48h prior to the schedule departure time.'),(6,'How many luggages can I bring on board?','We strongly recommend that each passenger only brings 1 check-in size suitcase onboard in order to have enough storage for everyone.'),(7,'How early do I have to be at the station prior to departure time?','Please arrive at least 15 minutes prior to departure time. Train doors will be closed 3 minutes prior to departure time. We will not be able to issue a refund if you cannot make it on time to your train.'),(8,'Meow','meow meow meow'),(9,'','This is an answer.'),(10,'How long will it take me to get the train?','It will take you 10 minutes.'),(11,'How long will it take me to get the train?','Yes'),(12,'How long will it take me to get the train?','Okay.'),(13,'How long will it take me to get the train?','This is an answer.'),(14,'How long will it take me to get the train?','Yes.,'),(15,'How long will it take me to get the train?','Maybe'),(16,'How long will it take me to get the train?','Okay.'),(17,'How long will it take me to get the train?','This is similar to the previous question.'),(18,'How long will it take me to get the train?','This is similar to the previous question.'),(19,'How long will it take me to get the train?','This is similar to the previous question.'),(20,'How long will it take me to get the train?','This is similar to the previous question.'),(21,'How long will it take me to get the train?','This is similar to the previous question.'),(22,'How long will it take me to get the train?','This is similar to the previous question.'),(23,'How long will it take me to get the train?','Okay, yes'),(24,'How long will it take me to get the train?','Okay, No problem! have a good one.'),(25,'How long will it take me to get the train?','Np. Come back next time.'),(26,'How long will it take me to get the train?','Of course! Thank you :D'),(27,'How long will it take me to get the train?','Okay! Sure.'),(28,'How can I pay for my ticket','By cash or credit card'),(29,'How do I make an account?',''),(30,'How do I get my refund','By cash or credit card'),(31,'How do I get to the station','You can take the Metro'),(32,'When can I get my refund','');
/*!40000 ALTER TABLE `question_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationNum` int NOT NULL AUTO_INCREMENT,
  `dateReserve` date DEFAULT NULL,
  `totalFare` double DEFAULT NULL,
  `passenger` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`reservationNum`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (22,'2020-12-16',20,'Axel Ernie'),(23,'2020-12-16',20,'Axel Ernie'),(24,'2020-12-17',20,'Axel Ernie'),(29,'2020-12-17',20,'Miranda Gupta'),(30,'2020-12-17',20,'Miranda Gupta'),(31,'2020-12-17',20,'Miranda Gupta'),(32,'2020-12-17',20,'Miranda Gupta'),(34,'2020-12-17',20,'Miranda Garcia'),(35,'2020-12-17',15,'Miranda Garcia'),(36,'2020-12-17',13,'Miranda Garcia'),(37,'2020-12-17',10,'Miranda Garcia'),(38,'2020-12-17',16,'Axel jr'),(40,'2020-12-17',20,'Axel Ernie'),(42,'2020-12-17',6.5,'Axel Ernie'),(43,'2020-12-17',5,'Axel Ernie'),(44,'2020-12-17',20,'Axel Ernie'),(45,'2020-12-17',14,'Axel Ernie'),(46,'2020-12-17',18.2,'Axel Ernie'),(47,'2020-12-17',21,'Axel Ernie'),(48,'2020-12-17',21,'Axel Ernie'),(49,'2020-12-17',5,'Axel Ernie'),(50,'2020-12-17',7.5,'Axel Ernie'),(51,'2020-12-17',7.5,'Axel Ernie'),(52,'2020-12-17',7.5,'Axel Ernie'),(53,'2020-12-17',7.5,'Axel Ernie'),(55,'2020-12-17',20,'JoelF Martinezz'),(56,'2020-12-17',20,'JoelF Martinezz'),(57,'2020-12-17',15,'JoelF Martinezz'),(58,'2020-12-17',15,'JoelF Martinezz'),(59,'2020-12-17',10,'JoelF Martinezz'),(60,'2020-12-17',13,'JoelF Martinezz');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserves`
--

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserves` (
  `reservationNum` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`reservationNum`),
  KEY `username` (`username`),
  CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`reservationNum`) REFERENCES `reservation` (`reservationNum`) ON DELETE CASCADE,
  CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`username`) REFERENCES `customer` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
INSERT INTO `reserves` VALUES (38,'axjim'),(55,'jjoel'),(56,'jjoel'),(57,'jjoel'),(58,'jjoel'),(59,'jjoel'),(60,'jjoel'),(22,'McLovin'),(23,'McLovin'),(24,'McLovin'),(40,'McLovin'),(42,'McLovin'),(43,'McLovin'),(44,'McLovin'),(45,'McLovin'),(46,'McLovin'),(47,'McLovin'),(48,'McLovin'),(49,'McLovin'),(50,'McLovin'),(51,'McLovin'),(52,'McLovin'),(53,'McLovin'),(29,'Miranda'),(30,'Miranda'),(31,'Miranda'),(32,'Miranda'),(34,'Miranda_Teacher'),(35,'Miranda_Teacher'),(36,'Miranda_Teacher'),(37,'Miranda_Teacher');
/*!40000 ALTER TABLE `reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `stationID` int NOT NULL,
  `cityName` varchar(20) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`stationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (675,'Metuchen','NJ'),(1538,'Rahway','NJ'),(2449,'New Brunswick','NJ'),(3035,'Edison','NJ'),(3103,'Hazlet','NJ'),(3219,'Red Bank','NJ'),(4574,'Aberdeen-Matawan','NJ'),(5060,'South Amboy','NJ'),(5175,'Perth Amboy','NJ'),(6298,'Woodbridge','NJ'),(6729,'Avenel','NJ'),(9720,'Metropark','NJ');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stops`
--

DROP TABLE IF EXISTS `stops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stops` (
  `stationID` int NOT NULL,
  `trainID` int NOT NULL,
  `tLine_name` varchar(20) NOT NULL,
  `destination` varchar(15) NOT NULL,
  `origin` varchar(15) NOT NULL,
  `dTime` datetime NOT NULL,
  PRIMARY KEY (`stationID`,`trainID`,`tLine_name`,`origin`,`destination`,`dTime`),
  KEY `trainID` (`trainID`,`tLine_name`,`origin`,`destination`,`dTime`),
  CONSTRAINT `stops_ibfk_1` FOREIGN KEY (`stationID`) REFERENCES `station` (`stationID`) ON DELETE CASCADE,
  CONSTRAINT `stops_ibfk_2` FOREIGN KEY (`trainID`, `tLine_name`, `origin`, `destination`, `dTime`) REFERENCES `train_schedule` (`trainID`, `tLine_name`, `origin`, `destination`, `dTime`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stops`
--

LOCK TABLES `stops` WRITE;
/*!40000 ALTER TABLE `stops` DISABLE KEYS */;
/*!40000 ALTER TABLE `stops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tFollows`
--

DROP TABLE IF EXISTS `tFollows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tFollows` (
  `trainID` int NOT NULL,
  `tLine_name` varchar(20) NOT NULL,
  `dTime` datetime NOT NULL,
  `destination` varchar(15) NOT NULL,
  `origin` varchar(15) NOT NULL,
  PRIMARY KEY (`trainID`,`tLine_name`,`origin`,`destination`,`dTime`),
  CONSTRAINT `tFollows_ibfk_1` FOREIGN KEY (`trainID`) REFERENCES `train` (`trainID`) ON DELETE CASCADE,
  CONSTRAINT `tFollows_ibfk_2` FOREIGN KEY (`trainID`, `tLine_name`, `origin`, `destination`, `dTime`) REFERENCES `train_schedule` (`trainID`, `tLine_name`, `origin`, `destination`, `dTime`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tFollows`
--

LOCK TABLES `tFollows` WRITE;
/*!40000 ALTER TABLE `tFollows` DISABLE KEYS */;
INSERT INTO `tFollows` VALUES (3000,'EastonNorth Corridor','2020-12-25 12:15:00','Metropark','Edison'),(3000,'EastonNorth Corridor','2020-12-25 12:15:00','Metuchen','Edison'),(3000,'EastonNorth Corridor','2020-12-25 12:15:00','Rahway','Edison'),(3000,'EastonNorth Corridor','2020-12-25 12:45:00','Rahway','Metropark'),(3000,'EastonNorth Corridor','2020-12-25 12:30:00','Metropark','Metuchen'),(3000,'EastonNorth Corridor','2020-12-25 12:30:00','Rahway','Metuchen'),(3000,'EastonNorth Corridor','2020-12-25 12:00:00','Edison','New Brunswick'),(3000,'EastonNorth Corridor','2020-12-25 12:00:00','Metropark','New Brunswick'),(3000,'EastonNorth Corridor','2020-12-25 12:00:00','Metuchen','New Brunswick'),(3000,'EastonNorth Corridor','2020-12-25 12:00:00','Rahway','New Brunswick'),(3000,'Northeast Corridor L','2020-12-10 12:15:00','Metropark','Edison'),(3000,'Northeast Corridor L','2020-12-10 12:15:00','Metuchen','Edison'),(3000,'Northeast Corridor L','2020-12-10 12:15:00','Rahway','Edison'),(3000,'Northeast Corridor L','2020-12-10 12:45:00','Rahway','Metropark'),(3000,'Northeast Corridor L','2020-12-10 12:30:00','Metropark','Metuchen'),(3000,'Northeast Corridor L','2020-12-10 12:30:00','Rahway','Metuchen'),(3000,'Northeast Corridor L','2020-12-10 12:00:00','Edison','New Brunswick'),(3000,'Northeast Corridor L','2020-12-10 12:00:00','Metropark','New Brunswick'),(3000,'Northeast Corridor L','2020-12-10 12:00:00','Metuchen','New Brunswick'),(3000,'Northeast Corridor L','2020-12-10 12:00:00','Rahway','New Brunswick'),(3002,'Northeast Corridor L','2020-12-18 12:15:00','Metropark','Edison'),(3002,'Northeast Corridor L','2021-01-18 12:15:00','Metropark','Edison'),(3002,'Northeast Corridor L','2020-12-18 12:15:00','Metuchen','Edison'),(3002,'Northeast Corridor L','2021-01-18 12:15:00','Metuchen','Edison'),(3002,'Northeast Corridor L','2020-12-18 12:15:00','Rahway','Edison'),(3002,'Northeast Corridor L','2021-01-18 12:15:00','Rahway','Edison'),(3002,'Northeast Corridor L','2020-12-18 12:45:00','Rahway','Metropark'),(3002,'Northeast Corridor L','2021-01-18 12:45:00','Rahway','Metropark'),(3002,'Northeast Corridor L','2020-12-18 12:30:00','Metropark','Metuchen'),(3002,'Northeast Corridor L','2021-01-18 12:30:00','Metropark','Metuchen'),(3002,'Northeast Corridor L','2020-12-18 12:30:00','Rahway','Metuchen'),(3002,'Northeast Corridor L','2021-01-18 12:30:00','Rahway','Metuchen'),(3002,'Northeast Corridor L','2020-12-18 12:00:00','Edison','New Brunswick'),(3002,'Northeast Corridor L','2021-01-18 12:00:00','Edison','New Brunswick'),(3002,'Northeast Corridor L','2020-12-18 12:00:00','Metropark','New Brunswick'),(3002,'Northeast Corridor L','2021-01-18 12:00:00','Metropark','New Brunswick'),(3002,'Northeast Corridor L','2020-12-18 12:00:00','Metuchen','New Brunswick'),(3002,'Northeast Corridor L','2021-01-18 12:00:00','Metuchen','New Brunswick'),(3002,'Northeast Corridor L','2020-12-18 12:00:00','Rahway','New Brunswick'),(3002,'Northeast Corridor L','2021-01-18 12:00:00','Rahway','New Brunswick'),(4000,'East Coastal L','2020-12-27 13:15:00','Hazlet','Aberdeen-Matawa'),(4000,'East Coastal L','2020-12-27 13:15:00','New Brunswick','Aberdeen-Matawa'),(4000,'East Coastal L','2020-12-27 12:15:00','Aberdeen-Matawa','Avenel'),(4000,'East Coastal L','2020-12-27 12:15:00','Hazlet','Avenel'),(4000,'East Coastal L','2020-12-27 12:15:00','New Brunswick','Avenel'),(4000,'East Coastal L','2020-12-27 12:15:00','Perth Amboy','Avenel'),(4000,'East Coastal L','2020-12-27 12:15:00','South Amboy','Avenel'),(4000,'East Coastal L','2020-12-27 12:15:00','Woodbridge','Avenel'),(4000,'East Coastal L','2020-12-27 13:30:00','New Brunswick','Hazlet'),(4000,'East Coastal L','2020-12-27 12:45:00','Aberdeen-Matawa','Perth Amboy'),(4000,'East Coastal L','2020-12-27 12:45:00','Hazlet','Perth Amboy'),(4000,'East Coastal L','2020-12-27 12:45:00','New Brunswick','Perth Amboy'),(4000,'East Coastal L','2020-12-27 12:45:00','South Amboy','Perth Amboy'),(4000,'East Coastal L','2020-12-27 12:00:00','Aberdeen-Matawa','Rahway'),(4000,'East Coastal L','2020-12-27 12:00:00','Avenel','Rahway'),(4000,'East Coastal L','2020-12-27 12:00:00','Hazlet','Rahway'),(4000,'East Coastal L','2020-12-27 12:00:00','New Brunswick','Rahway'),(4000,'East Coastal L','2020-12-27 12:00:00','Perth Amboy','Rahway'),(4000,'East Coastal L','2020-12-27 12:00:00','South Amboy','Rahway'),(4000,'East Coastal L','2020-12-27 12:00:00','Woodbridge','Rahway'),(4000,'East Coastal L','2020-12-27 13:00:00','Aberdeen-Matawa','South Amboy'),(4000,'East Coastal L','2020-12-27 13:00:00','Hazlet','South Amboy'),(4000,'East Coastal L','2020-12-27 13:00:00','New Brunswick','South Amboy'),(4000,'East Coastal L','2020-12-27 12:30:00','Aberdeen-Matawa','Woodbridge'),(4000,'East Coastal L','2020-12-27 12:30:00','Hazlet','Woodbridge'),(4000,'East Coastal L','2020-12-27 12:30:00','New Brunswick','Woodbridge'),(4000,'East Coastal L','2020-12-27 12:30:00','Perth Amboy','Woodbridge'),(4000,'East Coastal L','2020-12-27 12:30:00','South Amboy','Woodbridge'),(4000,'North Jersey Coast L','2020-12-24 13:15:00','Hazlet','Aberdeen-Matawa'),(4000,'North Jersey Coast L','2020-12-24 13:15:00','New Brunswick','Aberdeen-Matawa'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','Aberdeen-Matawa','Avenel'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','Hazlet','Avenel'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','New Brunswick','Avenel'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','Perth Amboy','Avenel'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','South Amboy','Avenel'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','Woodbridge','Avenel'),(4000,'North Jersey Coast L','2020-12-24 13:30:00','New Brunswick','Hazlet'),(4000,'North Jersey Coast L','2020-12-24 12:45:00','Aberdeen-Matawa','Perth Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:45:00','Hazlet','Perth Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:45:00','New Brunswick','Perth Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:45:00','South Amboy','Perth Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','Aberdeen-Matawa','Rahway'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','Avenel','Rahway'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','Hazlet','Rahway'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','New Brunswick','Rahway'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','Perth Amboy','Rahway'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','South Amboy','Rahway'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','Woodbridge','Rahway'),(4000,'North Jersey Coast L','2020-12-24 13:00:00','Aberdeen-Matawa','South Amboy'),(4000,'North Jersey Coast L','2020-12-24 13:00:00','Hazlet','South Amboy'),(4000,'North Jersey Coast L','2020-12-24 13:00:00','New Brunswick','South Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','Aberdeen-Matawa','Woodbridge'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','Hazlet','Woodbridge'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','New Brunswick','Woodbridge'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','Perth Amboy','Woodbridge'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','South Amboy','Woodbridge'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','Avenel','Aberdeen-Matawa'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','Perth Amboy','Aberdeen-Matawa'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','Rahway','Aberdeen-Matawa'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','South Amboy','Aberdeen-Matawa'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','Woodbridge','Aberdeen-Matawa'),(4002,'North Jersey Coast L','2020-12-22 13:30:00','Rahway','Avenel'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','Aberdeen-Matawa','Hazlet'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','Avenel','Hazlet'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','Perth Amboy','Hazlet'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','Rahway','Hazlet'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','South Amboy','Hazlet'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','Woodbridge','Hazlet'),(4002,'North Jersey Coast L','2020-12-22 13:00:00','Avenel','Perth Amboy'),(4002,'North Jersey Coast L','2020-12-22 13:00:00','Rahway','Perth Amboy'),(4002,'North Jersey Coast L','2020-12-22 13:00:00','Woodbridge','Perth Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','Aberdeen-Matawa','Red Bank'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','Avenel','Red Bank'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','Hazlet','Red Bank'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','Perth Amboy','Red Bank'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','Rahway','Red Bank'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','South Amboy','Red Bank'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','Woodbridge','Red Bank'),(4002,'North Jersey Coast L','2020-12-22 12:45:00','Avenel','South Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:45:00','Perth Amboy','South Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:45:00','Rahway','South Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:45:00','Woodbridge','South Amboy'),(4002,'North Jersey Coast L','2020-12-22 13:15:00','Avenel','Woodbridge'),(4002,'North Jersey Coast L','2020-12-22 13:15:00','Rahway','Woodbridge');
/*!40000 ALTER TABLE `tFollows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `trainID` int NOT NULL,
  PRIMARY KEY (`trainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (3000),(3001),(3002),(4000),(4002);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_schedule`
--

DROP TABLE IF EXISTS `train_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_schedule` (
  `trainID` int NOT NULL,
  `tLine_name` varchar(20) NOT NULL,
  `dTime` datetime NOT NULL,
  `aTime` datetime DEFAULT NULL,
  `tTime` varchar(15) DEFAULT NULL,
  `fare` double DEFAULT NULL,
  `stops` int DEFAULT NULL,
  `destination` varchar(15) NOT NULL,
  `origin` varchar(15) NOT NULL,
  `stopsS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`trainID`,`tLine_name`,`origin`,`destination`,`dTime`),
  CONSTRAINT `train_schedule_ibfk_1` FOREIGN KEY (`trainID`) REFERENCES `train` (`trainID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_schedule`
--

LOCK TABLES `train_schedule` WRITE;
/*!40000 ALTER TABLE `train_schedule` DISABLE KEYS */;
INSERT INTO `train_schedule` VALUES (3000,'EastonNorth Corridor','2020-12-25 12:15:00','2020-12-25 12:45:00','30 minutes',10,1,'Metropark','Edison','Metuchen'),(3000,'EastonNorth Corridor','2020-12-25 12:15:00','2020-12-25 12:30:00','15 minutes',5,0,'Metuchen','Edison',''),(3000,'EastonNorth Corridor','2020-12-25 12:15:00','2020-12-25 13:00:00','45 minutes',15,2,'Rahway','Edison','Metuchen, Metropark'),(3000,'EastonNorth Corridor','2020-12-25 12:45:00','2020-12-25 13:00:00','15 minutes',5,0,'Rahway','Metropark',''),(3000,'EastonNorth Corridor','2020-12-25 12:30:00','2020-12-25 12:45:00','15 minutes',5,0,'Metropark','Metuchen',''),(3000,'EastonNorth Corridor','2020-12-25 12:30:00','2020-12-25 13:00:00','30 minutes',10,1,'Rahway','Metuchen','Metropark'),(3000,'EastonNorth Corridor','2020-12-25 12:00:00','2020-12-25 12:15:00','15 minutes',5,0,'Edison','New Brunswick',''),(3000,'EastonNorth Corridor','2020-12-25 12:00:00','2020-12-25 12:45:00','45 minutes',15,2,'Metropark','New Brunswick','Edison, Metuchen'),(3000,'EastonNorth Corridor','2020-12-25 12:00:00','2020-12-25 12:30:00','30 minutes',10,1,'Metuchen','New Brunswick','Edison'),(3000,'EastonNorth Corridor','2020-12-25 12:00:00','2020-12-25 13:00:00','1 hour',20,3,'Rahway','New Brunswick','Edison, Metuchen, Metropark'),(3000,'Northeast Corridor L','2020-12-10 12:15:00','2020-12-10 12:45:00','30 minutes',10,1,'Metropark','Edison','Metuchen'),(3000,'Northeast Corridor L','2020-12-10 12:15:00','2020-12-10 12:30:00','15 minutes',5,0,'Metuchen','Edison',''),(3000,'Northeast Corridor L','2020-12-10 12:15:00','2020-12-10 12:13:00','45 minutes',15,2,'Rahway','Edison','Metuchen, Metropark'),(3000,'Northeast Corridor L','2020-12-10 12:45:00','2020-12-10 13:00:00','15 minutes',5,0,'Rahway','Metropark',''),(3000,'Northeast Corridor L','2020-12-10 12:30:00','2020-12-10 12:45:00','15 minutes',5,0,'Metropark','Metuchen',''),(3000,'Northeast Corridor L','2020-12-10 12:30:00','2020-12-10 13:00:00','30 minutes',10,1,'Rahway','Metuchen','Metropark'),(3000,'Northeast Corridor L','2020-12-10 12:00:00','2020-12-10 12:15:00','15 minutes',5,0,'Edison','New Brunswick',''),(3000,'Northeast Corridor L','2020-12-10 12:00:00','2020-12-10 12:45:00','45 minutes',15,2,'Metropark','New Brunswick','Edison, Metuchen'),(3000,'Northeast Corridor L','2020-12-10 12:00:00','2020-12-10 12:30:00','30 minutes',10,1,'Metuchen','New Brunswick','Edison'),(3000,'Northeast Corridor L','2020-12-10 12:00:00','2020-12-10 13:00:00','1 hour',20,3,'Rahway','New Brunswick','Edison, Metuchen, Metropark'),(3002,'Northeast Corridor L','2020-12-18 12:15:00','2020-12-18 12:45:00','30 minutes',10,1,'Metropark','Edison','Metuchen'),(3002,'Northeast Corridor L','2021-01-18 12:15:00','2021-01-18 12:45:00','30 minutes',10,1,'Metropark','Edison','Metuchen'),(3002,'Northeast Corridor L','2020-12-18 12:15:00','2020-12-18 12:30:00','15 minutes',5,0,'Metuchen','Edison',''),(3002,'Northeast Corridor L','2021-01-18 12:15:00','2021-01-18 12:30:00','15 minutes',5,0,'Metuchen','Edison',''),(3002,'Northeast Corridor L','2020-12-18 12:15:00','2020-12-18 18:13:00','45 minutes',15,2,'Rahway','Edison','Metuchen, Metropark'),(3002,'Northeast Corridor L','2021-01-18 12:15:00','2021-01-18 18:13:00','45 minutes',15,2,'Rahway','Edison','Metuchen'),(3002,'Northeast Corridor L','2020-12-18 12:45:00','2020-12-18 13:00:00','15 minutes',5,0,'Rahway','Metropark',''),(3002,'Northeast Corridor L','2021-01-18 12:45:00','2021-01-18 13:00:00','15 minutes',5,0,'Rahway','Metropark',''),(3002,'Northeast Corridor L','2020-12-18 12:30:00','2020-12-18 12:45:00','15 minutes',5,0,'Metropark','Metuchen',''),(3002,'Northeast Corridor L','2021-01-18 12:30:00','2021-01-18 12:45:00','15 minutes',5,0,'Metropark','Metuchen',''),(3002,'Northeast Corridor L','2020-12-18 12:30:00','2020-12-18 13:00:00','30 minutes',10,1,'Rahway','Metuchen','Metropark'),(3002,'Northeast Corridor L','2021-01-18 12:30:00','2021-01-18 13:00:00','30 minutes',10,1,'Rahway','Metuchen','Metropark'),(3002,'Northeast Corridor L','2020-12-18 12:00:00','2020-12-18 12:15:00','15 minutes',5,0,'Edison','New Brunswick',''),(3002,'Northeast Corridor L','2021-01-18 12:00:00','2021-01-18 12:15:00','15 minutes',5,0,'Edison','New Brunswick',''),(3002,'Northeast Corridor L','2020-12-18 12:00:00','2020-12-18 12:45:00','45 minutes',15,2,'Metropark','New Brunswick','Edison, Metuchen'),(3002,'Northeast Corridor L','2021-01-18 12:00:00','2021-01-18 12:45:00','45 minutes',15,2,'Metropark','New Brunswick','Edison, Metuchen'),(3002,'Northeast Corridor L','2020-12-18 12:00:00','2020-12-18 12:30:00','30 minutes',10,1,'Metuchen','New Brunswick','Edison'),(3002,'Northeast Corridor L','2021-01-18 12:00:00','2021-01-18 12:30:00','30 minutes',10,1,'Metuchen','New Brunswick','Edison'),(3002,'Northeast Corridor L','2020-12-18 12:00:00','2020-12-18 13:00:00','1 hour',20,3,'Rahway','New Brunswick','Edison, Metuchen, Metropark'),(3002,'Northeast Corridor L','2021-01-18 12:00:00','2021-01-18 13:00:00','1 hour',20,3,'Rahway','New Brunswick','Edison, Metuchen, Metropark'),(4000,'East Coastal L','2020-12-27 13:15:00','2020-12-27 13:30:00','15 minutes',4,0,'Hazlet','Aberdeen-Matawa',''),(4000,'East Coastal L','2020-12-27 13:15:00','2020-12-27 13:45:00','30 minutes',8,1,'New Brunswick','Aberdeen-Matawa','Hazlet'),(4000,'East Coastal L','2020-12-27 12:15:00','2020-12-27 13:15:00','1 hour',16,3,'Aberdeen-Matawa','Avenel','Woodbridge, Perth Amboy, South Amboy'),(4000,'East Coastal L','2020-12-27 12:15:00','2020-12-27 13:30:00','1 hour 15 minut',20,4,'Hazlet','Avenel','Woodbridge, Perth Amboy, South Amboy, Aberdeen-Matawan'),(4000,'East Coastal L','2020-12-27 12:15:00','2020-12-27 13:45:00','1 hour 30 minut',24,5,'New Brunswick','Avenel','Woodbridge, Perth Amboy, South Amboy, Aberdeen-Matawan, Hazlet'),(4000,'East Coastal L','2020-12-27 12:15:00','2020-12-27 12:45:00','30 minutes',8,1,'Perth Amboy','Avenel','Woodbridge'),(4000,'East Coastal L','2020-12-27 12:15:00','2020-12-27 13:00:00','45 minutes',12,2,'South Amboy','Avenel','Woodbridge, Perth Amboy'),(4000,'East Coastal L','2020-12-27 12:15:00','2020-12-27 12:30:00','15 minutes',4,0,'Woodbridge','Avenel',''),(4000,'East Coastal L','2020-12-27 13:30:00','2020-12-27 13:45:00','15 minutes',4,0,'New Brunswick','Hazlet',''),(4000,'East Coastal L','2020-12-27 12:45:00','2020-12-27 13:15:00','30 minutes',8,1,'Aberdeen-Matawa','Perth Amboy','South Amboy'),(4000,'East Coastal L','2020-12-27 12:45:00','2020-12-27 13:30:00','45 minutes',12,2,'Hazlet','Perth Amboy','South Amboy, Aberdeen-Matawan'),(4000,'East Coastal L','2020-12-27 12:45:00','2020-12-27 13:45:00','1 hour',16,3,'New Brunswick','Perth Amboy','South Amboy, Aberdeen-Matawan, Hazlet'),(4000,'East Coastal L','2020-12-27 12:45:00','2020-12-27 13:00:00','15 minutes',4,0,'South Amboy','Perth Amboy',''),(4000,'East Coastal L','2020-12-27 12:00:00','2020-12-27 13:15:00','1 hour 15 minut',20,4,'Aberdeen-Matawa','Rahway','Avenel, Woodbridge, Perth Amboy, South Amboy'),(4000,'East Coastal L','2020-12-27 12:00:00','2020-12-27 12:15:00','15 minutes',4,0,'Avenel','Rahway',''),(4000,'East Coastal L','2020-12-27 12:00:00','2020-12-27 13:30:00','1 hour 30 minut',24,5,'Hazlet','Rahway','Avenel, Woodbridge, Perth Amboy, South Amboy, Aberdeen-Matawan'),(4000,'East Coastal L','2020-12-27 12:00:00','2020-12-27 13:45:00','1 hour 45 minut',28,6,'New Brunswick','Rahway','Avenel, Woodbridge, Perth Amboy, South Amboy, Aberdeen-Matawan, Hazlet'),(4000,'East Coastal L','2020-12-27 12:00:00','2020-12-27 12:45:00','45 minutes',12,2,'Perth Amboy','Rahway','Avenel, Woodbridge'),(4000,'East Coastal L','2020-12-27 12:00:00','2020-12-27 13:00:00','1 hour',16,3,'South Amboy','Rahway','Avenel, Woodbridge, Perth Amboy'),(4000,'East Coastal L','2020-12-27 12:00:00','2020-12-27 12:30:00','30 minutes',8,1,'Woodbridge','Rahway','Avenel'),(4000,'East Coastal L','2020-12-27 13:00:00','2020-12-27 13:15:00','15 minutes',4,0,'Aberdeen-Matawa','South Amboy',''),(4000,'East Coastal L','2020-12-27 13:00:00','2020-12-27 13:30:00','30 minutes',8,1,'Hazlet','South Amboy','Aberdeen-Matawan'),(4000,'East Coastal L','2020-12-27 13:00:00','2020-12-27 13:45:00','45 minutes',12,2,'New Brunswick','South Amboy','Aberdeen-Matawan, Hazlet'),(4000,'East Coastal L','2020-12-27 12:30:00','2020-12-27 13:15:00','45 minutes',12,2,'Aberdeen-Matawa','Woodbridge','Perth Amboy, South Amboy'),(4000,'East Coastal L','2020-12-27 12:30:00','2020-12-27 13:30:00','1 hour',16,3,'Hazlet','Woodbridge','Perth Amboy, South Amboy, Aberdeen-Matawan'),(4000,'East Coastal L','2020-12-27 12:30:00','2020-12-27 13:45:00','1 hour 15 minut',20,4,'New Brunswick','Woodbridge','Perth Amboy, South Amboy, Aberdeen-Matawan, Hazlet'),(4000,'East Coastal L','2020-12-27 12:30:00','2020-12-27 12:45:00','15 minutes',4,0,'Perth Amboy','Woodbridge',''),(4000,'East Coastal L','2020-12-27 12:30:00','2020-12-27 13:00:00','30 minutes',8,1,'South Amboy','Woodbridge','Perth Amboy'),(4000,'North Jersey Coast L','2020-12-24 13:15:00','2020-12-24 13:30:00','15 minutes',4,0,'Hazlet','Aberdeen-Matawa',''),(4000,'North Jersey Coast L','2020-12-24 13:15:00','2020-12-24 13:45:00','30 minutes',8,1,'New Brunswick','Aberdeen-Matawa','Hazlet'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','2020-12-24 13:15:00','1 hour',16,3,'Aberdeen-Matawa','Avenel','Woodbridge, Perth Amboy, South Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','2020-12-24 13:30:00','1 hour 15 minut',20,4,'Hazlet','Avenel','Woodbridge, Perth Amboy, South Amboy, Aberdeen-Matawan'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','2020-12-24 13:45:00','1 hour 30 minut',24,5,'New Brunswick','Avenel','Woodbridge, Perth Amboy, South Amboy, Aberdeen-Matawan, Hazlet'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','2020-12-24 12:45:00','30 minutes',8,1,'Perth Amboy','Avenel','Woodbridge'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','2020-12-24 13:00:00','45 minutes',12,2,'South Amboy','Avenel','Woodbridge, Perth Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:15:00','2020-12-24 12:30:00','15 minutes',4,0,'Woodbridge','Avenel',''),(4000,'North Jersey Coast L','2020-12-24 13:30:00','2020-12-24 13:45:00','15 minutes',4,0,'New Brunswick','Hazlet',''),(4000,'North Jersey Coast L','2020-12-24 12:45:00','2020-12-24 13:15:00','30 minutes',8,1,'Aberdeen-Matawa','Perth Amboy','South Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:45:00','2020-12-24 13:30:00','45 minutes',12,2,'Hazlet','Perth Amboy','South Amboy, Aberdeen-Matawan'),(4000,'North Jersey Coast L','2020-12-24 12:45:00','2020-12-24 13:45:00','1 hour',16,3,'New Brunswick','Perth Amboy','South Amboy, Aberdeen-Matawan, Hazlet'),(4000,'North Jersey Coast L','2020-12-24 12:45:00','2020-12-24 13:00:00','15 minutes',4,0,'South Amboy','Perth Amboy',''),(4000,'North Jersey Coast L','2020-12-24 12:00:00','2020-12-24 13:15:00','1 hour 15 minut',20,4,'Aberdeen-Matawa','Rahway','Avenel, Woodbridge, Perth Amboy, South Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','2020-12-24 12:15:00','15 minutes',4,0,'Avenel','Rahway',''),(4000,'North Jersey Coast L','2020-12-24 12:00:00','2020-12-24 13:30:00','1 hour 30 minut',24,5,'Hazlet','Rahway','Avenel, Woodbridge, Perth Amboy, South Amboy, Aberdeen-Matawan'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','2020-12-24 13:45:00','1 hour 45 minut',28,6,'New Brunswick','Rahway','Avenel, Woodbridge, Perth Amboy, South Amboy, Aberdeen-Matawan, Hazlet'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','2020-12-24 12:45:00','45 minutes',12,2,'Perth Amboy','Rahway','Avenel, Woodbridge'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','2020-12-24 13:00:00','1 hour',16,3,'South Amboy','Rahway','Avenel, Woodbridge, Perth Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:00:00','2020-12-24 12:30:00','30 minutes',8,1,'Woodbridge','Rahway','Avenel'),(4000,'North Jersey Coast L','2020-12-24 13:00:00','2020-12-24 13:15:00','15 minutes',4,0,'Aberdeen-Matawa','South Amboy',''),(4000,'North Jersey Coast L','2020-12-24 13:00:00','2020-12-24 13:30:00','30 minutes',8,1,'Hazlet','South Amboy','Aberdeen-Matawan'),(4000,'North Jersey Coast L','2020-12-24 13:00:00','2020-12-24 13:45:00','45 minutes',12,2,'New Brunswick','South Amboy','Aberdeen-Matawan, Hazlet'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','2020-12-24 13:15:00','45 minutes',12,2,'Aberdeen-Matawa','Woodbridge','Perth Amboy, South Amboy'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','2020-12-24 13:30:00','1 hour',16,3,'Hazlet','Woodbridge','Perth Amboy, South Amboy, Aberdeen-Matawan'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','2020-12-24 13:45:00','1 hour 15 minut',20,4,'New Brunswick','Woodbridge','Perth Amboy, South Amboy, Aberdeen-Matawan, Hazlet'),(4000,'North Jersey Coast L','2020-12-24 12:30:00','2020-12-24 12:45:00','15 minutes',4,0,'Perth Amboy','Woodbridge',''),(4000,'North Jersey Coast L','2020-12-24 12:30:00','2020-12-24 13:00:00','30 minutes',8,1,'South Amboy','Woodbridge','Perth Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','2020-12-22 13:30:00','1 hour',16,3,'Avenel','Aberdeen-Matawa','South Amboy, Perth Amboy, Woodbridge'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','2020-12-22 13:00:00','30 minutes',8,1,'Perth Amboy','Aberdeen-Matawa','South Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','2020-12-22 13:45:00','1 hour 15 minut',20,4,'Rahway','Aberdeen-Matawa','South Amboy, Perth Amboy, Woodbridge, Avenel'),(4002,'North Jersey Coast L','2020-12-22 12:30:00','2020-12-22 12:45:00','15 minutes',4,0,'South Amboy','Aberdeen-Matawa',''),(4002,'North Jersey Coast L','2020-12-22 12:30:00','2020-12-22 13:15:00','45 minutes',12,2,'Woodbridge','Aberdeen-Matawa','South Amboy, Perth Amboy'),(4002,'North Jersey Coast L','2020-12-22 13:30:00','2020-12-22 13:45:00','15 minutes',4,0,'Rahway','Avenel',''),(4002,'North Jersey Coast L','2020-12-22 12:15:00','2020-12-22 12:30:00','15 minutes',4,0,'Aberdeen-Matawa','Hazlet',''),(4002,'North Jersey Coast L','2020-12-22 12:15:00','2020-12-22 13:30:00','1 hour 15 minut',20,4,'Avenel','Hazlet','Aberdeen-Matawan, South Amboy, Perth Amboy, Woodbridge'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','2020-12-22 13:00:00','45 minutes',12,2,'Perth Amboy','Hazlet','Aberdeen-Matawan, South Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','2020-12-22 13:45:00','1 hour 30 minut',24,5,'Rahway','Hazlet','Aberdeen-Matawan, South Amboy, Perth Amboy, Woodbridge, Avenel'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','2020-12-22 12:45:00','30 minutes',8,1,'South Amboy','Hazlet','Aberdeen-Matawan'),(4002,'North Jersey Coast L','2020-12-22 12:15:00','2020-12-22 13:15:00','1 hour',16,3,'Woodbridge','Hazlet','Aberdeen-Matawan, South Amboy, Perth Amboy'),(4002,'North Jersey Coast L','2020-12-22 13:00:00','2020-12-22 13:30:00','30 minutes',8,1,'Avenel','Perth Amboy','Woodbridge'),(4002,'North Jersey Coast L','2020-12-22 13:00:00','2020-12-22 13:45:00','45 minutes',12,2,'Rahway','Perth Amboy','Woodbridge, Avenel'),(4002,'North Jersey Coast L','2020-12-10 13:00:00','2020-12-22 13:15:00','15 minutes',4,0,'Woodbridge','Perth Amboy',''),(4002,'North Jersey Coast L','2020-12-22 13:00:00','2020-12-22 13:15:00','15 minutes',4,0,'Woodbridge','Perth Amboy',''),(4002,'North Jersey Coast L','2020-12-22 12:00:00','2020-12-22 12:30:00','30 minutes',8,1,'Aberdeen-Matawa','Red Bank','Hazlet'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','2020-12-22 13:30:00','1 hour 30 minut',24,5,'Avenel','Red Bank','Hazlet, Aberdeen-Matawan, South Amboy, Perth Amboy, Woodbridge'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','2020-12-10 12:15:00','15 minutes',4,0,'Hazlet','Red Bank',''),(4002,'North Jersey Coast L','2020-12-22 12:00:00','2020-12-22 13:00:00','1 hour',16,3,'Perth Amboy','Red Bank','Hazlet, Aberdeen-Matawan, South Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','2020-12-22 13:45:00','1 hour 45 minut',28,6,'Rahway','Red Bank','Hazlet, Aberdeen-Matawan, South Amboy, Perth Amboy, Woodbridge, Avenel'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','2020-12-22 12:45:00','45 minutes',12,2,'South Amboy','Red Bank','Hazlet, Aberdeen-Matawan'),(4002,'North Jersey Coast L','2020-12-22 12:00:00','2020-12-22 13:15:00','1 hour 15 minut',20,4,'Woodbridge','Red Bank','Hazlet, Aberdeen-Matawan, South Amboy, Perth Amboy'),(4002,'North Jersey Coast L','2020-12-22 12:45:00','2020-12-22 13:30:00','45 minutes',12,2,'Avenel','South Amboy','Perth Amboy, Woodbridge'),(4002,'North Jersey Coast L','2020-12-22 12:45:00','2020-12-22 13:00:00','15 minutes',4,0,'Perth Amboy','South Amboy',''),(4002,'North Jersey Coast L','2020-12-22 12:45:00','2020-12-22 13:45:00','1 hour',16,3,'Rahway','South Amboy','Perth Amboy, Woodbridge, Avenel'),(4002,'North Jersey Coast L','2020-12-22 12:45:00','2020-12-22 13:15:00','30 minutes',8,1,'Woodbridge','South Amboy','Perth Amboy'),(4002,'North Jersey Coast L','2020-12-22 13:15:00','2020-12-22 13:30:00','15 minutes',4,0,'Avenel','Woodbridge',''),(4002,'North Jersey Coast L','2020-12-22 13:15:00','2020-12-22 13:45:00','30 minutes',8,1,'Rahway','Woodbridge','Avenel');
/*!40000 ALTER TABLE `train_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `username` varchar(20) NOT NULL,
  `stationID` int DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `stationID` (`stationID`),
  CONSTRAINT `works_ibfk_1` FOREIGN KEY (`username`) REFERENCES `employees` (`username`) ON DELETE CASCADE,
  CONSTRAINT `works_ibfk_2` FOREIGN KEY (`stationID`) REFERENCES `station` (`stationID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'RailwaySystem0'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17  0:46:16
