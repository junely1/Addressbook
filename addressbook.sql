-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: addressbook
-- ------------------------------------------------------
-- Server version	5.7.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `grp` varchar(30) DEFAULT 'My contacts',
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `pos` varchar(20) DEFAULT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `bday` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `homepg` varchar(20) DEFAULT NULL,
  `sns` varchar(25) DEFAULT NULL,
  `file` tinytext,
  `memo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (8,'Family','Smith','Smith','010-5454-3434','adam@yahoo.com','CEO','IT','CEO','1975-03-03','St. Andrew St','www.adam.com','twitter.com/adam','images (3).jpeg',''),(33,'Work','George','Courtney','010-4433-2434','jack@yahoo.com','Manager','Marketing','Marketing manager','1989-09-01','St.Manhattan Street','www.jackblunt.com','facebook.com/jack','images (2).jpeg',''),(71,'My contact','Amanda','Rhymes','010-7601-6040','amanda@gmail.com','Sales representative','Sales','Sales representative','1990-03-02','St Andrews 123, CA','amandaRhymes.com','twitter.com/amanda','images.jpeg',''),(72,'My contact','Judy','Lee','010-1330-0302','judy_h@hotmail.com','HR manager','HR','Manager','1888-03-09','Wilshire Blvd 2038','www.judyharvis.com','facebook.com/judy','profile-home-makers-vflWnMtf7.jpg',''),(77,'Gym','Halsey','Brown','010-4445-3242','heyhalsey@gmail.com','Personal trainer','Golden gym','Trainer','1990-12-31','134 Highland, CA ','www.halsey.com','facebook.com/halsey','de824106.jpg',''),(78,'Friends','Alan','Alexander','010-3938-0202','alan@yahoo.com','R&D manager','R&D','Manager','1888-02-01','St Paul st, 1234','','intagram.com/alan','images (5).jpeg',''),(79,'My contact','aa','','','','','','','','','','','null','');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trash`
--

DROP TABLE IF EXISTS `trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trash` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `grp` varchar(30) DEFAULT 'My contacts',
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `pos` varchar(20) DEFAULT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `bday` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `homepg` varchar(20) DEFAULT NULL,
  `sns` varchar(25) DEFAULT NULL,
  `file` tinytext,
  `memo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trash`
--

LOCK TABLES `trash` WRITE;
/*!40000 ALTER TABLE `trash` DISABLE KEYS */;
INSERT INTO `trash` VALUES (35,'Colleague','Fiona','Francis','010-4325-6432','fiona@gmail.com','Secretary','Administration','Specialist','1985-04-30','','','','images (4)1.jpeg',''),(36,'Family','David','Jason','010-3343-6436','david@yahoo.com','Product manager','Product','Manager','1970-03-23','','','','bf6261c3-39e5-4c5f-9880-0ca366c2b0f8.jpg','');
/*!40000 ALTER TABLE `trash` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-18 14:26:37
