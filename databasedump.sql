-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: csirdb
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add glider',7,'add_glider'),(20,'Can change glider',7,'change_glider'),(21,'Can delete glider',7,'delete_glider'),(22,'Can add mission',8,'add_mission'),(23,'Can change mission',8,'change_mission'),(24,'Can delete mission',8,'delete_mission'),(25,'Can add mission glider',9,'add_missionglider'),(26,'Can change mission glider',9,'change_missionglider'),(27,'Can delete mission glider',9,'delete_missionglider'),(28,'Can add sensor',10,'add_sensor'),(29,'Can change sensor',10,'change_sensor'),(30,'Can delete sensor',10,'delete_sensor'),(31,'Can add sensor calibration',11,'add_sensorcalibration'),(32,'Can change sensor calibration',11,'change_sensorcalibration'),(33,'Can delete sensor calibration',11,'delete_sensorcalibration'),(34,'Can add sensor type',12,'add_sensortype'),(35,'Can change sensor type',12,'change_sensortype'),(36,'Can delete sensor type',12,'delete_sensortype');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$uIyLvWIVEC8x$0tVTKNpCFLagMK4Jd4tsEfvgPAO8IbHdVZ0fm2zICGE=','2018-06-08 18:36:19.000000',1,'salomon.koen','','','salomonkoen@gmail.com',1,1,'2018-06-08 18:36:11.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-06-08 18:38:08.771344','1','salomon.koen',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',4,1),(2,'2018-06-08 18:38:52.609109','1','SensorType object (1)',1,'[{\"added\": {}}]',12,1),(3,'2018-06-08 18:38:59.672502','2','SensorType object (2)',1,'[{\"added\": {}}]',12,1),(4,'2018-06-08 18:39:03.493106','3','SensorType object (3)',1,'[{\"added\": {}}]',12,1),(5,'2018-06-08 18:39:06.871377','4','SensorType object (4)',1,'[{\"added\": {}}]',12,1),(6,'2018-06-08 18:39:13.694408','5','SensorType object (5)',1,'[{\"added\": {}}]',12,1),(7,'2018-06-08 18:39:18.542716','6','SensorType object (6)',1,'[{\"added\": {}}]',12,1),(8,'2018-06-08 18:39:21.238246','7','SensorType object (7)',1,'[{\"added\": {}}]',12,1),(9,'2018-06-08 18:41:15.179682','1','Glider object (1)',1,'[{\"added\": {}}]',7,1),(10,'2018-06-08 18:41:19.930012','2','Glider object (2)',1,'[{\"added\": {}}]',7,1),(11,'2018-06-08 18:41:24.469092','3','Glider object (3)',1,'[{\"added\": {}}]',7,1),(12,'2018-06-08 18:41:27.385840','4','Glider object (4)',1,'[{\"added\": {}}]',7,1),(13,'2018-06-08 18:41:29.890090','5','Glider object (5)',1,'[{\"added\": {}}]',7,1),(14,'2018-06-08 18:41:33.147482','6','Glider object (6)',1,'[{\"added\": {}}]',7,1),(15,'2018-06-08 18:41:35.423674','7','Glider object (7)',1,'[{\"added\": {}}]',7,1),(16,'2018-06-08 19:07:13.149642','1','Sensor object (1)',1,'[{\"added\": {}}]',10,1),(17,'2018-06-08 19:07:19.317300','2','Sensor object (2)',1,'[{\"added\": {}}]',10,1),(18,'2018-06-08 19:07:40.358855','3','Sensor object (3)',1,'[{\"added\": {}}]',10,1),(19,'2018-06-08 19:07:47.140320','4','Sensor object (4)',1,'[{\"added\": {}}]',10,1),(20,'2018-06-08 19:07:51.056213','5','Sensor object (5)',1,'[{\"added\": {}}]',10,1),(21,'2018-06-08 19:09:28.380136','6','O2: 466',1,'[{\"added\": {}}]',10,1),(22,'2018-06-08 19:09:36.725615','7','O2: 204',1,'[{\"added\": {}}]',10,1),(23,'2018-06-08 19:09:41.552158','8','O2: 226',1,'[{\"added\": {}}]',10,1),(24,'2018-06-08 19:09:48.227152','9','O2: 225',1,'[{\"added\": {}}]',10,1),(25,'2018-06-08 19:10:08.826820','10','O2: 227',1,'[{\"added\": {}}]',10,1),(26,'2018-06-08 19:10:13.930001','11','O2: 574',1,'[{\"added\": {}}]',10,1),(27,'2018-06-08 19:10:18.765937','12','O2: 734',1,'[{\"added\": {}}]',10,1),(28,'2018-06-08 19:10:23.588699','13','O2: 695',1,'[{\"added\": {}}]',10,1),(29,'2018-06-08 19:11:25.705853','14','PAR-50134',1,'[{\"added\": {}}]',10,1),(30,'2018-06-08 19:11:31.861143','15','PAR-50135',1,'[{\"added\": {}}]',10,1),(31,'2018-06-08 19:11:36.603266','16','PAR-50142',1,'[{\"added\": {}}]',10,1),(32,'2018-06-08 19:11:42.412869','17','PAR-50138',1,'[{\"added\": {}}]',10,1),(33,'2018-06-08 19:12:42.132602','18','Puck-779',1,'[{\"added\": {}}]',10,1),(34,'2018-06-08 19:12:53.320982','19','Puck-592',1,'[{\"added\": {}}]',10,1),(35,'2018-06-08 19:13:00.058521','20','Puck-886',1,'[{\"added\": {}}]',10,1),(36,'2018-06-08 19:13:06.017152','21','Puck-876',1,'[{\"added\": {}}]',10,1),(37,'2018-06-08 19:13:11.657548','22','Puck-885',1,'[{\"added\": {}}]',10,1),(38,'2018-06-08 19:13:27.589153','23','Puck-873',1,'[{\"added\": {}}]',10,1),(39,'2018-06-08 19:16:32.676785','1','SensorCalibration object (1)',1,'[{\"added\": {}}]',11,1),(40,'2018-06-08 19:16:56.426060','2','SensorCalibration object (2)',1,'[{\"added\": {}}]',11,1),(41,'2018-06-08 19:17:56.007314','3','SensorCalibration object (3)',1,'[{\"added\": {}}]',11,1),(42,'2018-06-08 19:20:05.483340','4','SensorCalibration object (4)',1,'[{\"added\": {}}]',11,1),(43,'2018-06-08 19:20:39.957466','5','SensorCalibration object (5)',1,'[{\"added\": {}}]',11,1),(44,'2018-06-08 19:21:08.830501','6','SensorCalibration object (6)',1,'[{\"added\": {}}]',11,1),(45,'2018-06-08 19:21:35.589152','7','SensorCalibration object (7)',1,'[{\"added\": {}}]',11,1),(46,'2018-06-08 19:22:01.918044','8','SensorCalibration object (8)',1,'[{\"added\": {}}]',11,1),(47,'2018-06-08 19:22:19.618763','9','SensorCalibration object (9)',1,'[{\"added\": {}}]',11,1),(48,'2018-06-08 19:22:36.629513','10','SensorCalibration object (10)',1,'[{\"added\": {}}]',11,1),(49,'2018-06-08 19:23:06.528695','11','SensorCalibration object (11)',1,'[{\"added\": {}}]',11,1),(50,'2018-06-08 19:23:25.235364','12','SensorCalibration object (12)',1,'[{\"added\": {}}]',11,1),(51,'2018-06-08 19:24:32.476437','13','SensorCalibration object (13)',1,'[{\"added\": {}}]',11,1),(52,'2018-06-08 19:24:56.637206','14','SensorCalibration object (14)',1,'[{\"added\": {}}]',11,1),(53,'2018-06-08 19:25:22.781827','15','SensorCalibration object (15)',1,'[{\"added\": {}}]',11,1),(54,'2018-06-08 19:25:55.545966','16','SensorCalibration object (16)',1,'[{\"added\": {}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'management_system','glider'),(8,'management_system','mission'),(9,'management_system','missionglider'),(10,'management_system','sensor'),(11,'management_system','sensorcalibration'),(12,'management_system','sensortype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-06-08 18:34:58.449123'),(2,'auth','0001_initial','2018-06-08 18:35:00.388087'),(3,'admin','0001_initial','2018-06-08 18:35:00.898074'),(4,'admin','0002_logentry_remove_auto_add','2018-06-08 18:35:00.940071'),(5,'contenttypes','0002_remove_content_type_name','2018-06-08 18:35:01.286061'),(6,'auth','0002_alter_permission_name_max_length','2018-06-08 18:35:01.462066'),(7,'auth','0003_alter_user_email_max_length','2018-06-08 18:35:01.497065'),(8,'auth','0004_alter_user_username_opts','2018-06-08 18:35:01.515065'),(9,'auth','0005_alter_user_last_login_null','2018-06-08 18:35:01.663051'),(10,'auth','0006_require_contenttypes_0002','2018-06-08 18:35:01.675051'),(11,'auth','0007_alter_validators_add_error_messages','2018-06-08 18:35:01.693050'),(12,'auth','0008_alter_user_username_max_length','2018-06-08 18:35:01.966051'),(13,'auth','0009_alter_user_last_name_max_length','2018-06-08 18:35:02.123038'),(14,'management_system','0001_initial','2018-06-08 18:35:04.393973'),(15,'sessions','0001_initial','2018-06-08 18:35:04.499980'),(16,'management_system','0002_auto_20180608_2104','2018-06-08 19:04:05.803987');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('pezsv8d51xstj51xvdha7frdmoo9ic3k','N2I0ZTY2MGMwNDE5NzM1ZTFkZWIyOGUxZWRkODA2N2E1N2Q3OGI0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYzc1MjEzNjFkNTZhN2YwOTI2ZDUzNTQwNWFjYmQyMTc3NjEwZDUxIn0=','2018-06-22 18:36:19.092004');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gliders`
--

DROP TABLE IF EXISTS `gliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gliders_name_be5360c7_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gliders`
--

LOCK TABLES `gliders` WRITE;
/*!40000 ALTER TABLE `gliders` DISABLE KEYS */;
INSERT INTO `gliders` VALUES (1,'542'),(2,'543'),(4,'573'),(5,'574'),(3,'575');
/*!40000 ALTER TABLE `gliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_glider_sensors`
--

DROP TABLE IF EXISTS `mission_glider_sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mission_glider_sensors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `missionglider_id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mission_glider_sensors_missionglider_id_sensor_id_a2b4be9e_uniq` (`missionglider_id`,`sensor_id`),
  KEY `mission_glider_sensors_sensor_id_0bd7e423_fk_sensors_id` (`sensor_id`),
  CONSTRAINT `mission_glider_senso_missionglider_id_801074c6_fk_mission_g` FOREIGN KEY (`missionglider_id`) REFERENCES `mission_gliders` (`id`),
  CONSTRAINT `mission_glider_sensors_sensor_id_0bd7e423_fk_sensors_id` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_glider_sensors`
--

LOCK TABLES `mission_glider_sensors` WRITE;
/*!40000 ALTER TABLE `mission_glider_sensors` DISABLE KEYS */;
INSERT INTO `mission_glider_sensors` VALUES (1,23,1),(20,23,6),(37,23,14),(53,23,18),(2,24,2),(21,24,7),(38,24,15),(54,24,19),(3,25,3),(22,25,8),(55,25,20),(4,26,4),(23,26,9),(39,26,16),(56,26,21),(5,27,5),(24,27,10),(40,27,17),(57,27,22),(6,30,2),(7,31,4),(8,33,2),(25,33,9),(41,33,15),(58,33,21),(9,34,5),(26,34,11),(42,34,14),(59,34,22),(10,35,2),(27,35,9),(43,35,15),(60,35,21),(11,36,5),(28,36,11),(44,36,14),(61,36,22),(12,37,1),(29,37,12),(45,37,17),(62,37,18),(13,39,1),(30,39,12),(46,39,17),(63,39,21),(14,40,2),(31,40,11),(47,40,14),(64,40,22),(15,41,4),(32,41,9),(48,41,16),(65,41,23),(16,42,5),(33,42,10),(49,42,14),(66,42,18),(17,43,1),(34,43,12),(50,43,14),(67,43,18),(18,44,2),(35,44,13),(51,44,15),(68,44,21),(19,45,5),(36,45,11),(52,45,17),(69,45,22);
/*!40000 ALTER TABLE `mission_glider_sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission_gliders`
--

DROP TABLE IF EXISTS `mission_gliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mission_gliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `dives` int(11) NOT NULL,
  `glider_id` int(11) NOT NULL,
  `mission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mission_gliders_glider_id_45755878_fk_gliders_id` (`glider_id`),
  KEY `mission_gliders_mission_id_4bfc9d0a_fk_missions_id` (`mission_id`),
  CONSTRAINT `mission_gliders_glider_id_45755878_fk_gliders_id` FOREIGN KEY (`glider_id`) REFERENCES `gliders` (`id`),
  CONSTRAINT `mission_gliders_mission_id_4bfc9d0a_fk_missions_id` FOREIGN KEY (`mission_id`) REFERENCES `missions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission_gliders`
--

LOCK TABLES `mission_gliders` WRITE;
/*!40000 ALTER TABLE `mission_gliders` DISABLE KEYS */;
INSERT INTO `mission_gliders` VALUES (23,'2012-10-01','2013-04-01',499,1,1),(24,'2012-10-01','2013-04-01',489,2,1),(25,'2012-10-01','2013-04-01',327,3,1),(26,'2012-10-01','2013-04-01',585,5,1),(27,'2012-10-01','2013-04-01',606,4,1),(28,'2013-10-13','2013-12-01',216,5,2),(29,'2013-12-01','2014-02-09',360,1,3),(30,'2013-10-17','2014-02-06',395,2,3),(31,'2013-10-17','2014-02-06',468,5,3),(32,'2013-10-17','2014-02-06',0,4,3),(33,'2015-04-22','2015-04-29',1085,2,4),(34,'2015-04-22','2015-04-29',739,4,4),(35,'2015-07-28','2015-12-09',605,2,5),(36,'2015-07-28','2015-12-09',624,4,5),(37,'2015-12-09','2016-02-07',344,1,6),(38,'2015-12-09','2016-02-07',310,5,6),(39,'2016-06-15','2016-06-29',675,1,7),(40,'2016-07-27','2016-12-04',535,5,7),(41,'2016-06-15','2016-06-29',87,2,8),(42,'2016-12-04','2017-02-02',275,4,8),(43,'2017-06-26','2017-08-04',689,5,9),(44,'2017-10-19','2017-12-17',225,1,10),(45,'2017-10-19','2017-12-17',0,4,10);
/*!40000 ALTER TABLE `mission_gliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions`
--

DROP TABLE IF EXISTS `missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `missions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions`
--

LOCK TABLES `missions` WRITE;
/*!40000 ALTER TABLE `missions` DISABLE KEYS */;
INSERT INTO `missions` VALUES (1,'SOSCEx I','2012-11-01','2013-04-01'),(2,'SOERDC/Agulhas II Shakedown','2013-10-13','2013-12-01'),(3,'SOSCEx II','2013-10-17','2014-02-09'),(4,'SAGE','2015-04-22','2015-04-29'),(5,'SOSCEx III Winter deployment','2015-07-28','2015-12-09'),(6,'SOSCEx III','2015-12-09','2016-02-07'),(7,'SOSCEx IV Winter deployment','2016-06-15','2016-12-04'),(8,'SOSCEx IV','2016-06-15','2017-02-02'),(9,'GINA','2017-06-26','2017-08-04'),(10,'COMICS','2017-10-19','2017-12-17');
/*!40000 ALTER TABLE `missions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_calibrations`
--

DROP TABLE IF EXISTS `sensor_calibrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sensor_calibrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `dark` double NOT NULL,
  `scale` double NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `sensorType_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensor_calibrations_sensor_id_be2cca06_fk_sensors_id` (`sensor_id`),
  KEY `sensor_calibrations_sensorType_id_2a7209df_fk_sensor_types_id` (`sensorType_id`),
  CONSTRAINT `sensor_calibrations_sensorType_id_2a7209df_fk_sensor_types_id` FOREIGN KEY (`sensorType_id`) REFERENCES `sensor_types` (`id`),
  CONSTRAINT `sensor_calibrations_sensor_id_be2cca06_fk_sensors_id` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_calibrations`
--

LOCK TABLES `sensor_calibrations` WRITE;
/*!40000 ALTER TABLE `sensor_calibrations` DISABLE KEYS */;
INSERT INTO `sensor_calibrations` VALUES (1,'2011-05-26',10.6,0.0006256,14,3),(2,'2011-05-26',1.6,0.0006678,15,3),(3,'2015-10-06',10.8,0.0006202,17,3),(4,'2012-06-04',10.8,0.000574,16,3),(5,'2009-03-05',50,0.0173,19,5),(6,'2009-03-05',50,0.00001291,19,6),(7,'2009-03-05',50,0.000003497,19,7),(8,'2015-09-28',53,0.0121,18,5),(9,'2015-09-28',47,0.00001569,18,6),(10,'2015-09-28',49,0.000003217,18,7),(11,'2011-10-31',48,0.0122,21,5),(12,'2011-10-31',59,0.00001263,21,6),(13,'2011-10-31',64,0.000003353,21,7),(14,'2014-06-06',47,0.0112,22,5),(15,'2014-06-06',46,0.00001289,22,6),(16,'2014-06-06',50,0.000003251,22,7);
/*!40000 ALTER TABLE `sensor_calibrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_types`
--

DROP TABLE IF EXISTS `sensor_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sensor_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_types`
--

LOCK TABLES `sensor_types` WRITE;
/*!40000 ALTER TABLE `sensor_types` DISABLE KEYS */;
INSERT INTO `sensor_types` VALUES (1,'CT Sail'),(2,'O2'),(3,'PAR'),(4,'Puck'),(5,'CHL'),(6,'470'),(7,'700');
/*!40000 ALTER TABLE `sensor_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensors`
--

DROP TABLE IF EXISTS `sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sensors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensors_type_id_a4472659_fk_sensor_types_id` (`type_id`),
  CONSTRAINT `sensors_type_id_a4472659_fk_sensor_types_id` FOREIGN KEY (`type_id`) REFERENCES `sensor_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensors`
--

LOCK TABLES `sensors` WRITE;
/*!40000 ALTER TABLE `sensors` DISABLE KEYS */;
INSERT INTO `sensors` VALUES (1,'171',1),(2,'172',1),(3,'197',1),(4,'188',1),(5,'193',1),(6,'466',2),(7,'204',2),(8,'226',2),(9,'225',2),(10,'227',2),(11,'574',2),(12,'734',2),(13,'695',2),(14,'50134',3),(15,'50135',3),(16,'50142',3),(17,'50138',3),(18,'779',4),(19,'592',4),(20,'886',4),(21,'876',4),(22,'885',4),(23,'873',4);
/*!40000 ALTER TABLE `sensors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-29 18:41:34
