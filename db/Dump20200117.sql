CREATE DATABASE  IF NOT EXISTS `online_book_shopping_amin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `online_book_shopping_amin`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: online_book_shopping_amin
-- ------------------------------------------------------
-- Server version	5.5.37

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('amin','ROLE_ADMIN');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_book`
--

DROP TABLE IF EXISTS `basket_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9rgkikwyg8n6dtoh58yjo4w92` (`book_id`),
  KEY `FKdspy0d9x0m4v2hxt7y4a4ju9o` (`order_id`),
  CONSTRAINT `FK9rgkikwyg8n6dtoh58yjo4w92` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FKdspy0d9x0m4v2hxt7y4a4ju9o` FOREIGN KEY (`order_id`) REFERENCES `ordered_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_book`
--

LOCK TABLES `basket_book` WRITE;
/*!40000 ALTER TABLE `basket_book` DISABLE KEYS */;
INSERT INTO `basket_book` VALUES (25,3,8,15),(26,3,11,15),(27,4,10,15),(28,3,13,15),(29,2,16,15),(30,2,15,15),(31,2,18,15),(32,3,10,16),(33,3,13,16),(34,3,12,16),(35,3,15,16),(36,2,19,16),(37,2,20,16),(38,3,24,16),(39,3,22,16),(40,3,31,16),(41,3,30,16),(42,3,33,16),(43,3,34,16),(44,3,37,16),(45,3,40,16),(46,3,43,16),(47,3,46,16),(48,3,45,16),(49,3,49,16),(50,3,63,16),(51,2,10,17),(52,2,11,17),(53,3,8,18),(54,3,10,19),(55,2,10,20),(56,2,10,21),(57,2,10,22),(58,1,11,23),(59,4,10,24),(60,3,11,24),(61,3,13,24),(62,2,15,24),(63,2,16,24),(64,2,19,24);
/*!40000 ALTER TABLE `basket_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `image` varchar(145) DEFAULT NULL,
  `register` timestamp NULL DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `author` text,
  `enabled` bit(2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `page_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK1wxwagv6cm3vjrxqhmv884hir` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (4,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','\0',2,12),(5,'asdasd1231212122','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.03,'1212','\0',1,12),(7,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','\0',1,123),(8,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(9,'asdasd12312anjnjn','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','\0',1,12),(10,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(11,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(12,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(13,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(14,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(15,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(16,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(17,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(18,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(19,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(20,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(21,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(22,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(23,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','\0',1,112),(24,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(30,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(31,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(32,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(33,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(34,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(35,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(36,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(37,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(38,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(39,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(40,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(41,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(42,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(43,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(44,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(45,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(46,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(47,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(48,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(49,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(61,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(62,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(63,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(64,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(65,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(66,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(67,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(68,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(69,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(70,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(71,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(72,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(73,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(74,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(75,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(76,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(77,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(78,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(79,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(80,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(81,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(82,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(83,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(84,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(85,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(86,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(87,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(88,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(89,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(90,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(91,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(92,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(93,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(94,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(95,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(96,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(97,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(98,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(99,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(100,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(124,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(125,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','\0',1,12),(126,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(127,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(128,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(129,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(130,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(131,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(132,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(133,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(134,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(135,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(136,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(137,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(138,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(139,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(140,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(141,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(142,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(143,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(144,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(145,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(146,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(147,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(148,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(149,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(150,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(151,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(152,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(153,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(154,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(155,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(156,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(157,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(158,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(159,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(160,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(161,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(162,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(163,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(164,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(165,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(166,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(167,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(168,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(169,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(170,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(171,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(172,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(173,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(174,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(175,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(176,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(177,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(178,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(179,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(180,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(181,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(182,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(183,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(184,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(185,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(186,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(187,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(188,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(189,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(190,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(191,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(192,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(193,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(194,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(195,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(196,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(197,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(198,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(199,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(200,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(201,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(202,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(203,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(251,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(252,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(253,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(254,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(255,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(256,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(257,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(258,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(259,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(260,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(261,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(262,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(263,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(264,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(265,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(266,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(267,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(268,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(269,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(270,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(271,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(272,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(273,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(274,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(275,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(276,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(277,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(278,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(279,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(280,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(281,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(282,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(283,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(284,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(285,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(286,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(287,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(288,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(289,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(290,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(291,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(292,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(293,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(294,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(295,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(296,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(297,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(298,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(299,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(300,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(301,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(302,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(303,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(304,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(305,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(306,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(307,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(308,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(309,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(310,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(311,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(312,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(313,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(314,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(315,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(316,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(317,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(318,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(319,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(320,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(321,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(322,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(323,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(324,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(325,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(326,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(327,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(328,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(329,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(330,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(331,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(332,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(333,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(334,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(335,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(336,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(337,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(338,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(339,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(340,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(341,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(342,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(343,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(344,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(345,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(346,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(347,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(348,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(349,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(350,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(351,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(352,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(353,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(354,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(355,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(356,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(357,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(358,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(359,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(360,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(361,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(362,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(363,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(364,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(365,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(366,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(367,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(368,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(369,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(370,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(371,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(372,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(373,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(374,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(375,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(376,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(377,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(378,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(379,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(380,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(381,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(382,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(383,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(384,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(385,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(386,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(387,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(388,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(389,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(390,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(391,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(392,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(393,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(394,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(395,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(396,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(397,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(398,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(399,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(400,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(401,'asdasa','sdasd','37a59ee5-1ae1-4599-a61e-301a1cb3b108.jpg','2020-01-16 13:48:14',121.00,'1212','',2,12),(402,'asdasd12312','dasdasd','f5354946-56c1-4f62-8312-13e8750213c5.png','2020-01-16 13:52:00',21.00,'12','',1,12),(403,'asdasdijik','sdasda','35061fde-1a5b-4dc2-9a4a-7fad5e1f737e.png','2020-01-16 15:04:17',21.00,'Muellif 1','',1,123),(404,'zxzxcc','zxcxczx','ca3b57a5-ac07-4c47-82f5-8de1bb0d2389.jpg','2020-01-16 15:07:55',12.00,'adasad','',2,1221),(405,'asdasd12312a','daasd','b5259ff9-ae99-4af5-a87f-6e2fb00d3cae.jpg','2020-01-16 15:09:16',12.00,'qwq','',1,12),(406,'zczczxc','zxczxczx','02ddc491-53a6-43df-be88-c78b5277949f.png','2020-01-16 15:58:39',1212.00,'Artur Konan Doyl','',2,12),(407,'sadasd','sadasd','f260718e-cd57-4b90-91a2-69dc33d6f247.jpg','2020-01-16 17:01:02',12.00,'12','',1,12),(408,'asdas','asdas','40c8f57e-ff06-478f-8380-8e1c2e0d85bb.jpg','2020-01-16 17:01:44',121.00,'Muellif 1','',1,12),(409,'mimskmdkam','sddaad','4e463d3a-0163-45d5-bb68-be80bf2f093a.jpg','2020-01-16 18:05:59',1212.00,'adasad','',1,112),(410,'admasmd','saaas','e88c9740-b917-4bdb-83ae-eedda9316b22.jpg','2020-01-16 18:06:17',1212.00,'Artur Konan Doyl','',1,71),(411,'sdgsfdg','sfgsdfg','dc7c065e-afed-4224-a151-bd8412f14ead.png','2020-01-17 11:22:18',243.00,'234','',4,324),(412,'2sdfs','sdfsd','0bd60386-fe87-4737-8c75-2892d702fcb0.jpg','2020-01-17 11:22:31',32.00,'Artur Konan Doyl','',4,24),(413,'a','a','c9d4e547-96f9-46a7-b1b0-7e064ec553c8.png','2020-01-17 12:22:33',1.00,'12','',4,1),(414,'a','a','1bcda004-a6b0-4597-85aa-4af7efa3375c.jpg','2020-01-17 12:22:46',1.00,'12','',4,1);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (15,'asdsa','anarceferzade@mail.ru','ads','070-831-4228'),(16,'asd','anarceferzade@mail.ru','Amin','070-831-4228'),(17,'sad','anarceferzade@mail.ru','asda','070-831-4228'),(18,'asd','anarceferzade@mail.ru','Amin','070-831-4228'),(19,'tft','anarceferzade@mail.ru','Anar','070-831-4228'),(20,'tft','anarceferzade@mail.ru','PHP','070-831-4228'),(21,'tft','anarceferzade@mail.ru','Amin','070-831-4228'),(22,'tft','anarceferzade@mail.ru','Amin','070-831-4228'),(23,'asd','anarceferzade@mail.ru','Anar','070-831-4228'),(24,'tft','anarceferzade@mail.ru','Anar','070-831-4228');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order_model`
--

DROP TABLE IF EXISTS `customer_order_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order_model` (
  `customer_id` int(11) NOT NULL,
  `order_model_id` int(11) NOT NULL,
  UNIQUE KEY `UK_j91eyvud6n3lbj5d0bd6xn7km` (`order_model_id`),
  KEY `FKablqpqtenlfatmuqo2ypuhqkr` (`customer_id`),
  CONSTRAINT `FK7dlofrvdt8pe04ep80yqoye8p` FOREIGN KEY (`order_model_id`) REFERENCES `ordered_book` (`id`),
  CONSTRAINT `FKablqpqtenlfatmuqo2ypuhqkr` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order_model`
--

LOCK TABLES `customer_order_model` WRITE;
/*!40000 ALTER TABLE `customer_order_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_order_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_book`
--

DROP TABLE IF EXISTS `ordered_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordered_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `register` datetime DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmmv0hkk7qa2qc60kjdxgr5eq9` (`customer_id`),
  CONSTRAINT `FKmmv0hkk7qa2qc60kjdxgr5eq9` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_book`
--

LOCK TABLES `ordered_book` WRITE;
/*!40000 ALTER TABLE `ordered_book` DISABLE KEYS */;
INSERT INTO `ordered_book` VALUES (15,'dgdfg','2020-01-17 03:32:15',8864,15),(16,'asdas','2020-01-17 03:54:02',23076,16),(17,'asdas','2020-01-17 03:57:34',2448,17),(18,'fgd','2020-01-17 04:01:03',36,18),(19,'hg','2020-01-17 04:02:09',3636,19),(20,'sdfsd','2020-01-17 04:02:33',2424,20),(21,'sd','2020-01-17 04:05:14',2424,21),(22,'sad','2020-01-17 04:06:11',2424,22),(23,'asasd','2020-01-17 04:07:51',12,23),(24,NULL,'2020-01-17 04:17:05',8828,24);
/*!40000 ALTER TABLE `ordered_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Amin','Ceferzade','amin','12','amin00c1309@gmail.com'),(2,'Anar','Ceferzade','anar','12','anarceferzade@mail.ru'),(3,'Amal','Ceferzade','amal','12','anarceferzade@gmail.com'),(4,'u','s1','u','1','anarceferzade@mail.ru');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('amin','{noop}1234',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-17  4:52:42
