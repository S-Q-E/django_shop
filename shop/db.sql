-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: django_shop
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add корзина',7,'add_cart'),(26,'Can change корзина',7,'change_cart'),(27,'Can delete корзина',7,'delete_cart'),(28,'Can view корзина',7,'view_cart'),(29,'Can add категория',8,'add_category'),(30,'Can change категория',8,'change_category'),(31,'Can delete категория',8,'delete_category'),(32,'Can view категория',8,'view_category'),(33,'Can add Покупатель',9,'add_customer'),(34,'Can change Покупатель',9,'change_customer'),(35,'Can delete Покупатель',9,'delete_customer'),(36,'Can view Покупатель',9,'view_customer'),(37,'Can add Внешний аккумулятор',10,'add_powerbank'),(38,'Can change Внешний аккумулятор',10,'change_powerbank'),(39,'Can delete Внешний аккумулятор',10,'delete_powerbank'),(40,'Can view Внешний аккумулятор',10,'view_powerbank'),(41,'Can add смартфон',11,'add_smartphone'),(42,'Can change смартфон',11,'change_smartphone'),(43,'Can delete смартфон',11,'delete_smartphone'),(44,'Can view смартфон',11,'view_smartphone'),(45,'Can add Заказ',12,'add_order'),(46,'Can change Заказ',12,'change_order'),(47,'Can delete Заказ',12,'delete_order'),(48,'Can view Заказ',12,'view_order'),(49,'Can add ноутбук',13,'add_notebook'),(50,'Can change ноутбук',13,'change_notebook'),(51,'Can delete ноутбук',13,'delete_notebook'),(52,'Can view ноутбук',13,'view_notebook'),(53,'Can add Наушники',14,'add_headphones'),(54,'Can change Наушники',14,'change_headphones'),(55,'Can delete Наушники',14,'delete_headphones'),(56,'Can view Наушники',14,'view_headphones'),(57,'Can add продукт',15,'add_cartproduct'),(58,'Can change продукт',15,'change_cartproduct'),(59,'Can delete продукт',15,'delete_cartproduct'),(60,'Can view продукт',15,'view_cartproduct');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$k4Oc1ZECNwbEXGz0seZOwm$27gBQxf+5lFRYvuUSFAsgB7WwCoYFG+rBdjR1tsEAAU=','2021-04-25 06:55:43.143956',1,'quanysh','','','q@q.com',1,1,'2021-04-25 06:54:18.767937'),(2,'pbkdf2_sha256$260000$ujlg6WgtmjtATgVON9zmIm$6Hc2Au8tng3EdPU+sYwXOgx6WqMeqkCVhNYfajjAPHU=','2021-05-14 10:23:26.710731',1,'admin','','','admin@admin.com',1,1,'2021-04-26 08:40:59.575913');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-04-25 06:56:30.265848','1','Смартфоны',1,'[{\"added\": {}}]',8,1),(2,'2021-04-25 06:57:08.829463','1','Покупатель  ',1,'[{\"added\": {}}]',9,1),(3,'2021-04-25 07:10:02.991152','1','Xiaomi Mi Note 10 lite',1,'[{\"added\": {}}]',11,1),(4,'2021-04-25 07:12:33.055474','2','Ноутбуки',1,'[{\"added\": {}}]',8,1),(5,'2021-04-25 07:12:52.534900','3','Наушники',1,'[{\"added\": {}}]',8,1),(6,'2021-04-25 07:13:19.564255','4','Внешние аккумуляторы',1,'[{\"added\": {}}]',8,1),(7,'2021-04-25 07:15:10.757412','1','Asus Gaming F1',1,'[{\"added\": {}}]',13,1),(8,'2021-04-25 07:36:16.282738','1','Xiaomi Powerbank 30000',1,'[{\"added\": {}}]',10,1),(9,'2021-04-25 07:37:15.333191','1','AirPods Pro',1,'[{\"added\": {}}]',14,1),(10,'2021-04-25 07:37:51.311668','1','1',1,'[{\"added\": {}}]',7,1),(11,'2021-04-25 07:38:21.395350','1','Продукт Xiaomi Powerbank 30000 из корзины 1',1,'[{\"added\": {}}]',15,1),(12,'2021-04-25 07:38:49.162151','1','Заказ №1',1,'[{\"added\": {}}]',12,1),(13,'2021-04-25 08:06:54.820892','1','Продукт Xiaomi Powerbank 30000 из корзины 1',3,'',15,1),(14,'2021-04-25 08:08:22.748628','1','Xiaomi Powerbank 30000',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',10,1),(15,'2021-04-25 08:08:42.244192','1','AirPods Pro',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',14,1),(16,'2021-04-25 08:08:57.703362','1','Asus Gaming F1',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',13,1),(17,'2021-04-25 08:09:17.142260','1','Xiaomi Mi Note 10 lite',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',11,1),(18,'2021-04-25 11:45:08.413543','3','iPhone 12 PRO',1,'[{\"added\": {}}]',11,1),(19,'2021-04-25 11:45:20.164616','2','Iphone 12Pro',3,'',11,1),(20,'2021-04-25 11:52:09.717955','4','Samsung S21',1,'[{\"added\": {}}]',11,1),(21,'2021-04-25 11:57:21.853088','2','MacBook Pro',1,'[{\"added\": {}}]',13,1),(22,'2021-04-26 08:48:08.623590','2','Продукт MacBook Pro из корзины 1',1,'[{\"added\": {}}]',15,2),(23,'2021-04-28 08:28:19.543107','3','Huawei MakeBook D14',1,'[{\"added\": {}}]',13,2),(24,'2021-04-28 08:35:41.877119','3','iPhone 12 PRO',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',11,2),(25,'2021-04-28 08:36:07.974247','1','Xiaomi Powerbank 30000',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',10,2),(26,'2021-04-28 08:39:07.799993','3','Наушники',2,'[]',8,2),(27,'2021-04-28 09:34:38.122298','3','Huawei MakeBook D14',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',13,2),(28,'2021-04-29 14:44:44.373213','3','Huawei MakeBook D14',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',13,2),(29,'2021-05-02 09:46:37.971931','1','Xiaomi Mi Note 10 lite',2,'[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',11,2),(30,'2021-05-02 09:55:23.259054','1','Xiaomi Mi Note 10 lite',2,'[]',11,2),(31,'2021-05-03 09:35:45.809793','2','Samsung EB-P1100C 10000mAh',1,'[{\"added\": {}}]',10,2),(32,'2021-05-03 09:40:30.339013','3','Remax Linon Pro Series',1,'[{\"added\": {}}]',10,2),(33,'2021-05-03 09:47:46.678032','2','Xiaomi Mi True Wireless Earbuds Basic 2',1,'[{\"added\": {}}]',14,2),(34,'2021-05-03 09:53:21.268185','3','Razer Nari Ultimate',1,'[{\"added\": {}}]',14,2),(35,'2021-05-05 05:55:09.955060','2','Ноутбуки',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',8,2),(36,'2021-05-05 12:27:02.852333','3','iPhone 12 PRO',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',11,2),(37,'2021-05-06 10:07:17.717169','4','Samsung S21',2,'[{\"changed\": {\"fields\": [\"SD \\u043a\\u0430\\u0440\\u0442\\u0430\"]}}]',11,2),(38,'2021-05-06 10:07:25.191496','4','Samsung S21',2,'[{\"changed\": {\"fields\": [\"SD \\u043a\\u0430\\u0440\\u0442\\u0430\"]}}]',11,2),(39,'2021-05-07 09:08:54.182076','1','Xiaomi Mi Note 10 lite',2,'[]',11,2),(40,'2021-05-08 10:47:20.690790','1','Покупатель  ',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044c\"]}}]',9,2),(41,'2021-05-08 10:48:31.187503','1','1',2,'[{\"changed\": {\"fields\": [\"\\u0412\\u043b\\u0430\\u0434\\u0435\\u043b\\u0435\\u0446\", \"Total products\", \"\\u041e\\u0431\\u0449\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430\"]}}]',7,2),(42,'2021-05-08 11:17:24.903138','3','Продукт MacBook Pro из корзины 1',1,'[{\"added\": {}}]',15,2),(43,'2021-05-08 11:17:33.745317','1','1',2,'[{\"changed\": {\"fields\": [\"Products\", \"In order\"]}}]',7,2),(44,'2021-05-08 11:19:11.013131','6','Продукт Продукт MacBook Pro из корзины 1 из корзины 1',1,'[{\"added\": {}}]',15,2),(45,'2021-05-08 19:37:17.743146','5','Iphone 12 mini',1,'[{\"added\": {}}]',11,2),(46,'2021-05-12 15:17:25.936493','11','Продукт iPhone 12 PRO из корзины 1',3,'',15,2),(47,'2021-05-12 15:17:26.162462','9','Продукт Asus Gaming F1 из корзины 1',3,'',15,2),(48,'2021-05-12 15:17:26.300167','8','Продукт Asus Gaming F1 из корзины 1',3,'',15,2),(49,'2021-05-12 15:17:26.551495','7','Продукт Asus Gaming F1 из корзины 1',3,'',15,2),(50,'2021-05-12 15:17:26.810685','6','Продукт Продукт MacBook Pro из корзины 1 из корзины 1',3,'',15,2),(51,'2021-05-12 15:17:27.016688','3','Продукт MacBook Pro из корзины 1',3,'',15,2),(52,'2021-05-12 16:09:41.881582','12','Продукт Samsung S21 из корзины 1',3,'',15,2),(53,'2021-05-12 16:09:41.992896','10','Продукт Xiaomi Mi True Wireless Earbuds Basic 2 из корзины 1',3,'',15,2),(54,'2021-05-12 16:09:42.248989','2','Продукт MacBook Pro из корзины 1',3,'',15,2),(55,'2021-05-12 16:09:50.958963','13','Продукт Huawei MakeBook D14 из корзины 1',3,'',15,2),(56,'2021-05-12 16:53:42.863563','16','Продукт Samsung EB-P1100C 10000mAh из корзины 2',3,'',15,2),(57,'2021-05-12 16:53:43.027531','15','Продукт Asus Gaming F1 из корзины 2',3,'',15,2),(58,'2021-05-12 16:53:43.083270','14','Продукт Xiaomi Mi Note 10 lite из корзины 2',3,'',15,2),(59,'2021-05-13 11:02:53.484296','1','Заказ №1',3,'',12,2),(60,'2021-05-13 11:03:07.347469','21','Продукт AirPods Pro из корзины 2',3,'',15,2),(61,'2021-05-13 11:03:07.442035','20','Продукт Razer Nari Ultimate из корзины 2',3,'',15,2),(62,'2021-05-13 11:03:07.497388','19','Продукт iPhone 12 PRO из корзины 2',3,'',15,2),(63,'2021-05-13 11:03:21.412415','2','2',3,'',7,2),(64,'2021-05-13 11:03:21.524972','1','1',3,'',7,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'web','cart'),(15,'web','cartproduct'),(8,'web','category'),(9,'web','customer'),(14,'web','headphones'),(13,'web','notebook'),(12,'web','order'),(10,'web','powerbank'),(11,'web','smartphone');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-04-25 06:52:05.864378'),(2,'auth','0001_initial','2021-04-25 06:52:18.694374'),(3,'admin','0001_initial','2021-04-25 06:52:22.349557'),(4,'admin','0002_logentry_remove_auto_add','2021-04-25 06:52:22.456628'),(5,'admin','0003_logentry_add_action_flag_choices','2021-04-25 06:52:22.544743'),(6,'contenttypes','0002_remove_content_type_name','2021-04-25 06:52:24.739699'),(7,'auth','0002_alter_permission_name_max_length','2021-04-25 06:52:26.427781'),(8,'auth','0003_alter_user_email_max_length','2021-04-25 06:52:27.835770'),(9,'auth','0004_alter_user_username_opts','2021-04-25 06:52:27.935130'),(10,'auth','0005_alter_user_last_login_null','2021-04-25 06:52:28.858486'),(11,'auth','0006_require_contenttypes_0002','2021-04-25 06:52:28.926315'),(12,'auth','0007_alter_validators_add_error_messages','2021-04-25 06:52:29.015044'),(13,'auth','0008_alter_user_username_max_length','2021-04-25 06:52:30.383352'),(14,'auth','0009_alter_user_last_name_max_length','2021-04-25 06:52:32.122505'),(15,'auth','0010_alter_group_name_max_length','2021-04-25 06:52:34.427293'),(16,'auth','0011_update_proxy_permissions','2021-04-25 06:52:34.522795'),(17,'auth','0012_alter_user_first_name_max_length','2021-04-25 06:52:36.855596'),(18,'sessions','0001_initial','2021-04-25 06:52:37.813203'),(19,'web','0001_initial','2021-04-25 06:53:07.622024'),(20,'web','0002_auto_20210425_1329','2021-04-25 07:29:35.134077'),(21,'web','0003_auto_20210512_2159','2021-05-12 15:59:38.058239');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a3opyh6u0zzvxx3az45xivkhrjhcy5zd','.eJxVjDsOwjAQBe_iGll4_YWSnjNYa-8aB5AtxUmFuDtESgHtm5n3EhHXpcZ18BwnEmcB4vC7JcwPbhugO7Zbl7m3ZZ6S3BS50yGvnfh52d2_g4qjfmtH5L0zhGgTM5TiyxGVPnnIHnRgTibYksk4BQ44odfJqVyUJmsCkHh_AAJbOGY:1lhUxB:bX9iTqPl-7njWsCEq_j6mc6M2g-fRIEA_djW_c5pO3o','2021-05-28 10:21:57.979770'),('mj2ukn5vjkm1bygvz7012kh4mr2yv5bl','.eJxVjDsOwjAQBe_iGll4_YWSnjNYa-8aB5AtxUmFuDtESgHtm5n3EhHXpcZ18BwnEmcB4vC7JcwPbhugO7Zbl7m3ZZ6S3BS50yGvnfh52d2_g4qjfmtH5L0zhGgTM5TiyxGVPnnIHnRgTibYksk4BQ44odfJqVyUJmsCkHh_AAJbOGY:1lawpL:0o_jpZR_GXxItfS-B03QHjGKW1KzH3Zsv5KbR-1Vo0c','2021-05-10 08:42:47.529936'),('tdr0xkrsz32pmj53z8u2ntgy0o4h9155','.eJxVjDsOwjAQBe_iGll4_YWSnjNYa-8aB5AtxUmFuDtESgHtm5n3EhHXpcZ18BwnEmcB4vC7JcwPbhugO7Zbl7m3ZZ6S3BS50yGvnfh52d2_g4qjfmtH5L0zhGgTM5TiyxGVPnnIHnRgTibYksk4BQ44odfJqVyUJmsCkHh_AAJbOGY:1lbfUi:yWqTrySWbowglYg9489N5HY51myRHk-0JDM2o5S3oAw','2021-05-12 08:24:28.879774'),('ywy6n0ot3q58d5jocmny6n7zy0tru8fl','.eJxVjDsOwjAQBe_iGll4_YWSnjNYa-8aB5AtxUmFuDtESgHtm5n3EhHXpcZ18BwnEmcB4vC7JcwPbhugO7Zbl7m3ZZ6S3BS50yGvnfh52d2_g4qjfmtH5L0zhGgTM5TiyxGVPnnIHnRgTibYksk4BQ44odfJqVyUJmsCkHh_AAJbOGY:1lhUyc:ct7-xQ-uq_Ig3BlsD8lmXjjxJhxTP_hQP782ICTvOY4','2021-05-28 10:23:26.838106');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_cart`
--

DROP TABLE IF EXISTS `web_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_products` int unsigned NOT NULL,
  `in_order` tinyint(1) NOT NULL,
  `for_anonymous_user` tinyint(1) NOT NULL,
  `final_price` decimal(9,2) NOT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_cart_owner_id_4bc849df_fk_web_customer_id` (`owner_id`),
  CONSTRAINT `web_cart_owner_id_4bc849df_fk_web_customer_id` FOREIGN KEY (`owner_id`) REFERENCES `web_customer` (`id`),
  CONSTRAINT `web_cart_chk_1` CHECK ((`total_products` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_cart`
--

LOCK TABLES `web_cart` WRITE;
/*!40000 ALTER TABLE `web_cart` DISABLE KEYS */;
INSERT INTO `web_cart` VALUES (3,1,1,0,2700000.00,1),(4,0,1,0,0.00,1),(5,1,1,0,241500.00,1),(6,1,1,0,312000.00,1),(7,1,1,0,157000.00,1),(8,1,1,0,628000.00,1),(9,1,1,0,53494.00,1),(10,0,0,1,0.00,NULL),(11,1,1,0,540000.00,1),(12,1,0,0,165000.00,1);
/*!40000 ALTER TABLE `web_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_cart_products`
--

DROP TABLE IF EXISTS `web_cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_cart_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` bigint NOT NULL,
  `cartproduct_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_cart_products_cart_id_cartproduct_id_82837161_uniq` (`cart_id`,`cartproduct_id`),
  KEY `web_cart_products_cartproduct_id_0c19c499_fk_web_cartproduct_id` (`cartproduct_id`),
  CONSTRAINT `web_cart_products_cart_id_30692a56_fk_web_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `web_cart` (`id`),
  CONSTRAINT `web_cart_products_cartproduct_id_0c19c499_fk_web_cartproduct_id` FOREIGN KEY (`cartproduct_id`) REFERENCES `web_cartproduct` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_cart_products`
--

LOCK TABLES `web_cart_products` WRITE;
/*!40000 ALTER TABLE `web_cart_products` DISABLE KEYS */;
INSERT INTO `web_cart_products` VALUES (18,3,24),(19,5,25),(20,6,26),(21,7,27),(22,8,28),(23,9,29),(25,11,31),(26,12,32);
/*!40000 ALTER TABLE `web_cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_cartproduct`
--

DROP TABLE IF EXISTS `web_cartproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_cartproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `final_price` decimal(9,2) NOT NULL,
  `cart_id` bigint NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_cartproduct_cart_id_6f555ba1_fk_web_cart_id` (`cart_id`),
  KEY `web_cartproduct_content_type_id_6f52ed98_fk_django_co` (`content_type_id`),
  KEY `web_cartproduct_user_id_d1dedbb8_fk_web_customer_id` (`user_id`),
  CONSTRAINT `web_cartproduct_cart_id_6f555ba1_fk_web_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `web_cart` (`id`),
  CONSTRAINT `web_cartproduct_content_type_id_6f52ed98_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `web_cartproduct_user_id_d1dedbb8_fk_web_customer_id` FOREIGN KEY (`user_id`) REFERENCES `web_customer` (`id`),
  CONSTRAINT `web_cartproduct_chk_1` CHECK ((`object_id` >= 0)),
  CONSTRAINT `web_cartproduct_chk_2` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_cartproduct`
--

LOCK TABLES `web_cartproduct` WRITE;
/*!40000 ALTER TABLE `web_cartproduct` DISABLE KEYS */;
INSERT INTO `web_cartproduct` VALUES (24,1,3,2700000.00,3,13,1),(25,1,3,241500.00,5,14,1),(26,3,1,312000.00,6,13,1),(27,3,1,157000.00,7,14,1),(28,3,4,628000.00,8,14,1),(29,2,7,53494.00,9,14,1),(31,3,1,540000.00,11,11,1),(32,1,1,165000.00,12,11,1);
/*!40000 ALTER TABLE `web_cartproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_category`
--

DROP TABLE IF EXISTS `web_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_category`
--

LOCK TABLES `web_category` WRITE;
/*!40000 ALTER TABLE `web_category` DISABLE KEYS */;
INSERT INTO `web_category` VALUES (1,'Смартфоны','smartphones'),(2,'Ноутбуки','notebook'),(3,'Наушники','headphones'),(4,'Внешние аккумуляторы','powerbanks');
/*!40000 ALTER TABLE `web_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_customer`
--

DROP TABLE IF EXISTS `web_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_customer_user_id_b35d8b73_fk_auth_user_id` (`user_id`),
  CONSTRAINT `web_customer_user_id_b35d8b73_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_customer`
--

LOCK TABLES `web_customer` WRITE;
/*!40000 ALTER TABLE `web_customer` DISABLE KEYS */;
INSERT INTO `web_customer` VALUES (1,'+79197909061','Asia,Alamty',2);
/*!40000 ALTER TABLE `web_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_customer_orders`
--

DROP TABLE IF EXISTS `web_customer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_customer_orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_customer_orders_customer_id_order_id_d21709c8_uniq` (`customer_id`,`order_id`),
  KEY `web_customer_orders_order_id_56b43889_fk_web_order_id` (`order_id`),
  CONSTRAINT `web_customer_orders_customer_id_deb10cf6_fk_web_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `web_customer` (`id`),
  CONSTRAINT `web_customer_orders_order_id_56b43889_fk_web_order_id` FOREIGN KEY (`order_id`) REFERENCES `web_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_customer_orders`
--

LOCK TABLES `web_customer_orders` WRITE;
/*!40000 ALTER TABLE `web_customer_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_customer_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_headphones`
--

DROP TABLE IF EXISTS `web_headphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_headphones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `connection_type` varchar(255) NOT NULL,
  `headphones_type` varchar(250) NOT NULL,
  `microphone` tinyint(1) NOT NULL,
  `noise_cancelling` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `web_headphones_category_id_485261bc_fk_web_category_id` (`category_id`),
  CONSTRAINT `web_headphones_category_id_485261bc_fk_web_category_id` FOREIGN KEY (`category_id`) REFERENCES `web_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_headphones`
--

LOCK TABLES `web_headphones` WRITE;
/*!40000 ALTER TABLE `web_headphones` DISABLE KEYS */;
INSERT INTO `web_headphones` VALUES (1,'airpodspro','AirPods Pro','крутые беспроводные наушники',80500.00,'airpods.jfif','wirelles','in-ear',1,'active',3),(2,'xiaomi-mi-pods2','Xiaomi Mi True Wireless Earbuds Basic 2','обычная версия',7642.00,'xiaomi-mi-true-wireless-earbuds-.jpg','wirelles','in-ear',1,'passive',3),(3,'razer-naury-wirled','Razer Nari Ultimate','Геймерские наушники премиум сегмента',157000.00,'razer-nari-ultimate-cernyj-100106259-1.png','wired','for_gaming',1,'active',3);
/*!40000 ALTER TABLE `web_headphones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_notebook`
--

DROP TABLE IF EXISTS `web_notebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_notebook` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `diagonal` varchar(250) NOT NULL,
  `display_type` varchar(250) NOT NULL,
  `ram` varchar(250) NOT NULL,
  `processor_freq` varchar(250) NOT NULL,
  `video` varchar(250) NOT NULL,
  `time_without_charge` varchar(250) NOT NULL,
  `os` varchar(250) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `web_notebook_category_id_195487a2_fk_web_category_id` (`category_id`),
  CONSTRAINT `web_notebook_category_id_195487a2_fk_web_category_id` FOREIGN KEY (`category_id`) REFERENCES `web_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_notebook`
--

LOCK TABLES `web_notebook` WRITE;
/*!40000 ALTER TABLE `web_notebook` DISABLE KEYS */;
INSERT INTO `web_notebook` VALUES (1,'asus','Asus Gaming F1','игровой ноут',900000.00,'laptop.jfif','15 дюймов','IPS','8ГБ','4200','RTX 2070','9ч','Windows 10',2),(2,'macbook','MacBook Pro','Mac from Apple',798000.00,'macbookpro.jfif','15 дюймов','AMOLED','16ГБ','5000 Гц','RTX 3090','11 ч','MacOS',2),(3,'huaweid14','Huawei MakeBook D14','decddsjfndfgs',312000.00,'huawei_mate_d14.jpg','14 дюймов','AMOLED','8ГБ','4.2 Гц','Rodeon Vega 8','12 x','Windows 10 Home',2);
/*!40000 ALTER TABLE `web_notebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_order`
--

DROP TABLE IF EXISTS `web_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `delivery_type` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `order_date` date NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_order_cart_id_bf88ece6_fk_web_cart_id` (`cart_id`),
  KEY `web_order_customer_id_97a97cfd_fk_web_customer_id` (`customer_id`),
  CONSTRAINT `web_order_cart_id_bf88ece6_fk_web_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `web_cart` (`id`),
  CONSTRAINT `web_order_customer_id_97a97cfd_fk_web_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `web_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_order`
--

LOCK TABLES `web_order` WRITE;
/*!40000 ALTER TABLE `web_order` DISABLE KEYS */;
INSERT INTO `web_order` VALUES (2,'Куаныш','Сагимбай','+79197909061','Бауыржанулы 28','new','pick_up','2021-05-14 09:51:24.492012','2021-05-27',3,1),(3,'Куаныш','Сагимбай','+79197909061','Бауыржанулы 28','new','pick_up','2021-05-14 09:54:54.663956','2021-05-27',4,1),(4,'Куаныш','Сагимбай','+79197909061','da','new','pick_up','2021-05-14 09:56:02.089745','2021-05-21',5,1),(5,'Куаныш','Сагимбай','+77079667603','Бауыржанулы 28','new','pick_up','2021-05-14 09:57:47.263416','2021-05-28',6,1),(6,'Куаныш','Сагимбай','+79197909061','Бауыржанулы 28','new','pick_up','2021-05-14 10:00:31.464140','2021-05-20',7,1),(7,'Куаныш','Сагимбай','+77079667603','выавыа','new','pick_up','2021-05-14 10:19:38.969004','2021-05-31',8,1),(8,'Алдар','Косе','+79197909061','Asia,Alamty','new','delivery','2021-05-17 09:07:46.036667','2021-05-26',9,1),(9,'Куаныш','Сагимбай','+79197909061','Бауыржанулы 28','new','delivery','2021-05-17 14:11:23.572059','2021-05-27',11,1);
/*!40000 ALTER TABLE `web_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_powerbank`
--

DROP TABLE IF EXISTS `web_powerbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_powerbank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `battery_capacity` int unsigned NOT NULL,
  `outputs` varchar(255) NOT NULL,
  `quick_charge` tinyint(1) NOT NULL,
  `category_id` bigint NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `web_powerbank_category_id_0607207c_fk_web_category_id` (`category_id`),
  CONSTRAINT `web_powerbank_category_id_0607207c_fk_web_category_id` FOREIGN KEY (`category_id`) REFERENCES `web_category` (`id`),
  CONSTRAINT `web_powerbank_chk_1` CHECK ((`battery_capacity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_powerbank`
--

LOCK TABLES `web_powerbank` WRITE;
/*!40000 ALTER TABLE `web_powerbank` DISABLE KEYS */;
INSERT INTO `web_powerbank` VALUES (1,30000,'micro_usb',0,4,'Крутой повербанк','xiaomi_power_100002s_2-800x800.jpg',15000.00,'powerbanks','Xiaomi Powerbank 30000'),(2,10000,'micro_usb',0,4,'цвет: серебристый','samsung-powerbank.jfif',2980.00,'samsung-powerbank','Samsung EB-P1100C 10000mAh'),(3,20000,'micro_usb',0,4,'цвет: черный\r\nкорпус: металл','remax-linon-pro.png',13990.00,'remax-pro','Remax Linon Pro Series');
/*!40000 ALTER TABLE `web_powerbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_smartphone`
--

DROP TABLE IF EXISTS `web_smartphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_smartphone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `diagonal` varchar(250) NOT NULL,
  `display_type` varchar(250) NOT NULL,
  `resolution` varchar(250) NOT NULL,
  `ram` varchar(250) NOT NULL,
  `accum_volume` varchar(250) NOT NULL,
  `sd` tinyint(1) NOT NULL,
  `sd_volume` varchar(250) DEFAULT NULL,
  `main_cam` varchar(250) NOT NULL,
  `frontal_cam` varchar(250) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `web_smartphone_category_id_50774f62_fk_web_category_id` (`category_id`),
  CONSTRAINT `web_smartphone_category_id_50774f62_fk_web_category_id` FOREIGN KEY (`category_id`) REFERENCES `web_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_smartphone`
--

LOCK TABLES `web_smartphone` WRITE;
/*!40000 ALTER TABLE `web_smartphone` DISABLE KEYS */;
INSERT INTO `web_smartphone` VALUES (1,'xiaomi','Xiaomi Mi Note 10 lite','new description',165000.00,'mi10.jpg','6 дюймов','AMOLED','Full HD','6 ГБ','5260 Ма',1,'1 ТБ','64 МП','16 МП',1),(3,'iphone12pro','iPhone 12 PRO','NEW DESCRIPTIONS',540000.00,'iphone12pro.jpg','6 дюймов','aMOLED + HDR10+','Full HD','6 ГБ','3080',0,NULL,'16MP','12MP',1),(4,'samsung','Samsung S21','the newlest smartphone',505000.00,'samsngs21.jpg','6,9 дюймов','AMOLED','4К','16ГБ','5000Ма',1,'512Гб','108 МП','24 МП',1),(5,'iphonemini','Iphone 12 mini','Маленький iPhone',500000.00,'iphone12mini.png','4,7','Retina','Full HD','4Гб','3000',0,NULL,'12MP','12MP',1);
/*!40000 ALTER TABLE `web_smartphone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 21:30:29
