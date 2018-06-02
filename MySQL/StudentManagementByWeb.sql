CREATE DATABASE  IF NOT EXISTS `stumanagementbyweb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stumanagementbyweb`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: stumanagementbyweb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','admin'),(2,'Test','Test'),(3,'10086','10086');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentinfo`
--

DROP TABLE IF EXISTS `studentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentinfo` (
  `id` char(15) NOT NULL,
  `name` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `birthday` varchar(45) NOT NULL,
  `schoolday` varchar(45) NOT NULL,
  `major` varchar(45) NOT NULL,
  `college` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentinfo`
--

LOCK TABLES `studentinfo` WRITE;
/*!40000 ALTER TABLE `studentinfo` DISABLE KEYS */;
INSERT INTO `studentinfo` VALUES ('123271631102101','唐三藏','男','1998-01-02','2015-09-01','机械设计与制造','汽车工程学院'),('123271631102102','孙悟空','女','1991-02-21','2015-09-01','旅游管理','财经管理学院'),('123271631102103','猪八戒','男','1991-12-31','2016-09-01','国际贸易实务','工商管理学院'),('123271631102104','沙僧','男','1993-02-01','2016-09-01','电子信息工程技术','电子信息学院'),('123271631102105','草昵吗','男','1999-03-31','2017-09-01','汽车检测与维修技术','机电工程学院');
/*!40000 ALTER TABLE `studentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'stumanagementbyweb'
--

--
-- Dumping routines for database 'stumanagementbyweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-02 19:19:06
