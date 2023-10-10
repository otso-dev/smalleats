CREATE DATABASE  IF NOT EXISTS `smalleatsDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smalleatsDB`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smalleatsDB
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `address_tb`
--

DROP TABLE IF EXISTS `address_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_tb` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `road_address` varchar(45) NOT NULL COMMENT '도로명 주소',
  `detail_address` varchar(45) NOT NULL COMMENT '상세주소',
  `zonecode` int NOT NULL COMMENT '우편번호',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='구매시 새롭게 입력할 주소 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_tb`
--

LOCK TABLES `address_tb` WRITE;
/*!40000 ALTER TABLE `address_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority_tb`
--

DROP TABLE IF EXISTS `authority_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority_tb` (
  `authority_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority_tb`
--

LOCK TABLES `authority_tb` WRITE;
/*!40000 ALTER TABLE `authority_tb` DISABLE KEYS */;
INSERT INTO `authority_tb` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `authority_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_tb`
--

DROP TABLE IF EXISTS `category_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_tb` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL COMMENT '음식점 카테고리 이름',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='음식점 카테고리 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_tb`
--

LOCK TABLES `category_tb` WRITE;
/*!40000 ALTER TABLE `category_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_delivery_tb`
--

DROP TABLE IF EXISTS `food_delivery_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_delivery_tb` (
  `food_delivery_id` int NOT NULL AUTO_INCREMENT,
  `food_id` int NOT NULL COMMENT '음식점 참조키',
  `food_delivery_area` varchar(45) NOT NULL COMMENT '음식점 배달 가능 구역',
  PRIMARY KEY (`food_delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='배달 가능 구역';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_delivery_tb`
--

LOCK TABLES `food_delivery_tb` WRITE;
/*!40000 ALTER TABLE `food_delivery_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_delivery_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_menu_tb`
--

DROP TABLE IF EXISTS `food_menu_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_menu_tb` (
  `food_menu_id` int NOT NULL AUTO_INCREMENT,
  `food_menu_name` varchar(45) NOT NULL COMMENT '음식점 메뉴 이름',
  `food_menu_img` varchar(45) DEFAULT NULL COMMENT '음식점 메뉴 사진',
  `food_menu_price` varchar(45) NOT NULL COMMENT '음식점 메뉴 가격',
  PRIMARY KEY (`food_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='음식점 메뉴 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_menu_tb`
--

LOCK TABLES `food_menu_tb` WRITE;
/*!40000 ALTER TABLE `food_menu_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_menu_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_tb`
--

DROP TABLE IF EXISTS `food_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_tb` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(40) NOT NULL COMMENT '음식점 이름',
  `food_img` varchar(45) DEFAULT NULL COMMENT '음식점 메인 사진',
  `food_open` varchar(45) NOT NULL COMMENT '음식점 오픈시간',
  `food_close` varchar(45) NOT NULL COMMENT '음식점 마감시간',
  `food_min` varchar(45) NOT NULL COMMENT '음식점 최소구매 금액',
  `food_delivery_price` varchar(45) NOT NULL COMMENT '음식점 배달비',
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='음식점 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_tb`
--

LOCK TABLES `food_tb` WRITE;
/*!40000 ALTER TABLE `food_tb` DISABLE KEYS */;
INSERT INTO `food_tb` VALUES (1,'음식점이름',NULL,'7','9','10000','3000');
/*!40000 ALTER TABLE `food_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_menu_tb`
--

DROP TABLE IF EXISTS `order_menu_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_menu_tb` (
  `order_menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL COMMENT '메뉴 참조키',
  `order_menu_numbers` int NOT NULL COMMENT '구매할 메뉴 갯수',
  PRIMARY KEY (`order_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='구매 메뉴 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_menu_tb`
--

LOCK TABLES `order_menu_tb` WRITE;
/*!40000 ALTER TABLE `order_menu_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_menu_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tb`
--

DROP TABLE IF EXISTS `order_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tb` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `food_id` int NOT NULL COMMENT '음식점 참조키',
  `user_id` int NOT NULL COMMENT '유저 참조키',
  `order_menu_id` int NOT NULL COMMENT '구매 음식 참조키',
  `address_id` int DEFAULT NULL COMMENT '구매시 주소 새로 입력할 시 참조키',
  `order_day` varchar(30) NOT NULL COMMENT '구매 날짜',
  `order_req_time` varchar(45) NOT NULL COMMENT '배달요청시간',
  `order_delivery_day` varchar(45) NOT NULL COMMENT '배달요청날짜',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='메뉴 구매 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tb`
--

LOCK TABLES `order_tb` WRITE;
/*!40000 ALTER TABLE `order_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_tb`
--

DROP TABLE IF EXISTS `role_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_tb` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(15) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_tb`
--

LOCK TABLES `role_tb` WRITE;
/*!40000 ALTER TABLE `role_tb` DISABLE KEYS */;
INSERT INTO `role_tb` VALUES (1,'ROLE_USER'),(2,'ROLE_PARTNER'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address_tb`
--

DROP TABLE IF EXISTS `user_address_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address_tb` (
  `user_address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 참조키',
  `user_road_address` varchar(30) NOT NULL COMMENT '도로명 주소',
  `user_detail_address` varchar(45) NOT NULL COMMENT '상세주소',
  `user_zonecode` int NOT NULL COMMENT '우편번호',
  PRIMARY KEY (`user_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address_tb`
--

LOCK TABLES `user_address_tb` WRITE;
/*!40000 ALTER TABLE `user_address_tb` DISABLE KEYS */;
INSERT INTO `user_address_tb` VALUES (1,2,'경북 경주시 남산순환로 5','테스트',38174),(2,2,'경북 경주시 남산순환로 12-5','테스트2',38174),(3,2,'부산 강서구 강동송백5길 55','테스트3',46716);
/*!40000 ALTER TABLE `user_address_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tb`
--

DROP TABLE IF EXISTS `user_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tb` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `profile_img` varchar(100) DEFAULT NULL,
  `provider` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tb`
--

LOCK TABLES `user_tb` WRITE;
/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;
INSERT INTO `user_tb` VALUES (1,'jsh','test@testmail.com','$2a$10$ksJpwLxBRfjotecrXpo5Ku9vs0slhZD8Rq/My64eDBaNYHrn8BlTG','010-1111-1111',NULL,NULL),(2,'jsh','test2@testemail.com','$2a$10$a/caJbl3tWlBiBtnoM56T.yzds09rh81dK.NHIQpnuJjIBmoIO/HS','1234',NULL,NULL);
/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'smalleatsDB'
--

--
-- Dumping routines for database 'smalleatsDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-10 18:11:38
