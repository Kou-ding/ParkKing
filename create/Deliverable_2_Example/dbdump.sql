DROP SCHEMA IF EXISTS `student`;
CREATE SCHEMA `student`;
USE `student`;

-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: student
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `medium` char(3) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `year_recorded` int DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `performer_id` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ATperformerID_idx` (`performer_id`),
  CONSTRAINT `ATperformerID` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'The Black Light','vin',0.00,'Indie rock',1998,'Quarterstick',1),(2,'Magical Mystery Tour','vin',0.00,'Psychedelic rock',1967,'Parlophone, Capitol',2),(3,'Some Great Reward','vin',0.00,'Darkwave',1984,'Mute',3),(4,'Kind of Blue','cd',0.00,'Jazz',1959,'Columbia',4),(5,'Cigarettes & Alcohol','cd',0.00,'Britpop',1994,'Creation Records',5),(6,'Murder Ballads','cd',0.00,'Post punk',1996,'Mute Records',6),(7,'Body Language','cd',0.00,'Pop',2003,'Parlophone',7),(8,'Playing the Angel','cd',0.00,'Electronica',2005,'Mute',3),(9,'Batman Forever O.S.T.','cd',0.00,'Rock, R&B, Hip-Hop',1995,'Atlantic Records',0),(10,'Light Years','cd',0.00,'Pop',2000,'Parlophone, Capitol',NULL);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performers`
--

DROP TABLE IF EXISTS `performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performers` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `website` varchar(80) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `death_date` datetime DEFAULT NULL,
  `is_group` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performers`
--

LOCK TABLES `performers` WRITE;
/*!40000 ALTER TABLE `performers` DISABLE KEYS */;
INSERT INTO `performers` VALUES (0,'Various Artists',NULL,NULL,NULL,NULL,_binary '\0'),(1,'Calexico','USA','www.casadecalexico.com','1996-01-01 00:00:00',NULL,_binary ''),(2,'The Beatles','UK','www.beatles.com','1960-10-01 00:00:00','1970-01-01 00:00:00',_binary ''),(3,'Depeche Mode','UK','http://www.depechemode.com/','1980-01-01 00:00:00',NULL,_binary ''),(4,'Miles Davis','USA','www.milesdavis.com','1926-05-25 00:00:00','1991-09-28 00:00:00',_binary '\0'),(5,'Oasis','UK','www.oasisinet.com','1991-01-01 00:00:00',NULL,_binary ''),(6,'Nick Cave','Australia','www.nick-cave.com','1957-09-22 00:00:00',NULL,_binary '\0'),(7,'Kylie Minogue','Australia','www.kylie.com','1968-05-28 00:00:00',NULL,_binary '\0'),(8,'Thom Yorke','UK','www.theeraser.net','1968-07-10 00:00:00',NULL,_binary '\0');
/*!40000 ALTER TABLE `performers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performers_tracks`
--

DROP TABLE IF EXISTS `performers_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performers_tracks` (
  `track_id` int NOT NULL,
  `performer_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`performer_id`),
  KEY `trackID_idx` (`track_id`),
  KEY `PTperformerID` (`performer_id`),
  CONSTRAINT `PTperformerID` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PTtrackID` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performers_tracks`
--

LOCK TABLES `performers_tracks` WRITE;
/*!40000 ALTER TABLE `performers_tracks` DISABLE KEYS */;
INSERT INTO `performers_tracks` VALUES (1,6),(2,4),(3,4),(4,1),(5,1),(6,2),(7,2),(8,3),(9,3),(10,5),(11,5),(12,6),(12,7),(13,6),(14,7),(15,3),(16,3);
/*!40000 ALTER TABLE `performers_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `duration` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (4,'There Is a Light',4.23),(5,'So What',9.22),(6,'All Blues',11.33),(7,'Sideshow',2.20),(8,'Vinegaroon',1.06),(9,'I Am the Walrus',4.36),(10,'Blue Jay Way',3.55),(11,'Master and Servant',4.11),(12,'People Are People',3.52),(13,'I Am the Walrus',8.14),(14,'Cigarettes & Alcohol',4.50),(15,'Where the Wild Roses Grow',3.56),(16,'Crow Jane',4.13),(17,'Slow',3.16),(18,'Precious',4.09),(19,'Nothing\'s Impossible',4.21);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks_in_albums`
--

DROP TABLE IF EXISTS `tracks_in_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks_in_albums` (
  `track_id` int NOT NULL,
  `album_id` int NOT NULL,
  `track_number` int DEFAULT NULL,
  PRIMARY KEY (`track_id`,`album_id`),
  KEY `albumID_idx` (`album_id`),
  CONSTRAINT `TAalbumID` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TAtrackID` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks_in_albums`
--

LOCK TABLES `tracks_in_albums` WRITE;
/*!40000 ALTER TABLE `tracks_in_albums` DISABLE KEYS */;
INSERT INTO `tracks_in_albums` VALUES (1,9,9),(2,4,2),(3,4,4),(4,1,6),(5,1,11),(6,2,6),(7,2,4),(8,3,7),(9,3,3),(10,5,2),(11,5,1),(12,6,5),(13,6,8),(14,7,1),(15,8,5),(16,8,8);
/*!40000 ALTER TABLE `tracks_in_albums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-31 23:51:21
