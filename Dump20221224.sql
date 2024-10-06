-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: alumni
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feedback_id` varchar(30) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `is_visible` varchar(1) DEFAULT '1',
  `is_deleted` varchar(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'5rGxGgxYSnclDAkSJhLdrveTBvkZC4','testing','test@gmail.com','testing message','1','0','2022-12-19 07:52:20',NULL);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` varchar(30) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `lpa` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `is_visible` varchar(1) DEFAULT '1',
  `is_deleted` varchar(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'bJyldmeRLVyjC9eV5OLRWIAAwgPpRA',NULL,'Qaswa Technologies Pvt Ltd','4 Lakh','Software Engineer','1','0','2022-12-22 07:33:28',NULL),(2,'xcWFsVXPGiIDff8wlAkCfaM9MtaYrB','CTvkaSQTuoxDkLmMrq0qOok6BeyeB5','Qaswa Technologies Pvt Ltd','44','cwkdc','1','0','2022-12-22 07:37:51','2022-12-22 07:42:11');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` varchar(30) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` longblob,
  `post_status` varchar(1) DEFAULT '0',
  `is_visible` varchar(1) DEFAULT '1',
  `is_deleted` varchar(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'DFiQdRiReTqt5AtTzZqFANNrNX1x1G','Gow5YGYWTbCJNGD7ibUMvxXXsm6pGu','testing title',_binary '<p>testing</p>','0','1','0','2022-12-19 13:24:57',NULL),(2,'LNauYctngBaxaN7cvUHXuKHmDIwShB','3mAOZa4nLoL8uUnyWmxebqCVgD8OAa','testing title',_binary '<h2 style=\"margin-top: 0px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAAFMCAYAAADWVDfUAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAOxAAADsQBlSsOGwAABGRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0n77u/JyBpZD0nVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkJz8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0nYWRvYmU6bnM6bWV0YS8nPgo8cmRmOlJERiB4bWxuczpyZGY9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMnPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgeG1sbnM6QXR0cmliPSdodHRwOi8vbnMuYXR0cmlidXRpb24uY29tL2Fkcy8xLjAvJz4KICA8QXR0cmliOkFkcz4KICAgPHJkZjpTZXE+CiAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz4KICAgICA8QXR0cmliOkNyZWF0ZWQ+MjAyMi0wMS0yNTwvQXR0cmliOkNyZWF0ZWQ+CiAgICAgPEF0dHJpYjpFeHRJZD43MWM2YTE4OC0yMTdjLTRlOTktYTBiZC1mYzM2M2U4NWY4MTI8L0F0dHJpYjpFeHRJZD4KICAgICA8QXR0cmliOkZiSWQ+NTI1MjY1OTE0MTc5NTgwPC9BdHRyaWI6RmJJZD4KICAgICA8QXR0cmliOlRvdWNoVHlwZT4yPC9BdHRyaWI6VG91Y2hUeXBlPgogICAgPC9yZGY6bGk+CiAgIDwvcmRmOlNlcT4KICA8L0F0dHJpYjpBZHM+CiA8L3JkZjpEZXNjcmlwdGlvbj4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOmRjPSdodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyc+CiAgPGRjOnRpdGxlPgogICA8cmRmOkFsdD4KICAgIDxyZGY6bGkgeG1sOmxhbmc9J3gtZGVmYXVsdCc+ZXZlbnRzPC9yZGY6bGk+CiAgIDwvcmRmOkFsdD4KICA8L2RjOnRpdGxlPgogPC9yZGY6RGVzY3JpcHRpb24+CgogPHJkZjpEZXNjcmlwdGlv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\" data-filename=\"events.png\" style=\"width: 370px;\"><br></p>','0','1','0','2022-12-22 11:43:08',NULL),(3,'eeVcjhStdaDBhGloHreldR1JTrTXBt','3mAOZa4nLoL8uUnyWmxebqCVgD8OAa','Post Title',_binary 'my post content','0','1','0','2022-12-22 13:35:26',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `social_id` varchar(30) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `is_visible` varchar(1) DEFAULT '1',
  `is_deleted` varchar(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
INSERT INTO `social_links` VALUES (1,NULL,NULL,'afafaf','acaca','acacaWW','asacca','1','0','2022-12-17 10:09:12',NULL),(2,NULL,NULL,'afafaf','acaca','acacaWW','asacca','1','0','2022-12-17 10:10:32',NULL),(7,'vbU1ow7wt5p77lvolWQCxwGCm63dXT','CTvkaSQTuoxDkLmMrq0qOok6BeyeB5','www.facebook.com','www.linkedin.com','www.instagram.com','www.twitter.com','1','0','2022-12-21 12:39:14',NULL);
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `is_visible` varchar(1) DEFAULT '1',
  `is_deleted` varchar(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_request` varchar(1) DEFAULT '0' COMMENT '1 = requested for alumni',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Amit Bharti','amitawesome08@gmail.com','07218232503','1111',NULL,NULL,NULL,NULL,'1','0','2022-12-17 08:51:15',NULL,'0'),(2,NULL,'Amit Bharti','amit@gmail.com','7218232503','1234',NULL,NULL,NULL,NULL,'1','0','2022-12-17 09:16:14',NULL,'0'),(3,NULL,'zoya','zoya@gmail.com','9874563210','1111',NULL,NULL,NULL,NULL,'1','0','2022-12-17 10:58:03',NULL,'0'),(4,NULL,'ttttttt','tttttt@tttt','7418529630','1111',NULL,NULL,NULL,NULL,'1','0','2022-12-17 11:01:06',NULL,'0'),(5,'Eq75R8Lar3c5WUuw7kDS5qy4fo4qoL','ttttttt','tttttt@tttt','7418529660','1111',NULL,NULL,NULL,NULL,'1','0','2022-12-17 11:03:13',NULL,'0'),(6,'Gow5YGYWTbCJNGD7ibUMvxXXsm6pGu','zoya','zoya@gm','9685743210','1111',NULL,NULL,'student',NULL,'1','0','2022-12-17 12:09:42','2022-12-21 07:34:44','0'),(7,'CTvkaSQTuoxDkLmMrq0qOok6BeyeB5','Sadaf','sadaf@gmail.com','7485961230','1234','BE','CSE','student','https://ik.imagekit.io/kmzp3rqzu/Alumni/CTvkaSQTuoxDkLmMrq0qOok6BeyeB5','1','0','2022-12-20 11:30:35','2022-12-22 08:24:16','1'),(8,'3mAOZa4nLoL8uUnyWmxebqCVgD8OAa','Zoya Sadaf','zoya@gmail.com','9325991688','1111','BE','CSE','alumni','https://ik.imagekit.io/kmzp3rqzu/Alumni/3mAOZa4nLoL8uUnyWmxebqCVgD8OAa','1','0','2022-12-21 08:23:24','2022-12-22 11:40:55','0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'alumni'
--

--
-- Dumping routines for database 'alumni'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-24 12:56:50
