-- MySQL dump 10.13  Distrib 5.6.31, for Linux (x86_64)
--
-- Host: localhost    Database: xmall
-- ------------------------------------------------------
-- Server version	5.6.31

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
-- Table structure for table `yao_attribute_option`
--

DROP TABLE IF EXISTS `yao_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_attribute_option` (
  `attribute_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`attribute_option_id`),
  KEY `goods_attribute_id` (`goods_attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_attribute_option`
--

LOCK TABLES `yao_attribute_option` WRITE;
/*!40000 ALTER TABLE `yao_attribute_option` DISABLE KEYS */;
INSERT INTO `yao_attribute_option` VALUES (1,1,'4G'),(2,1,'8G'),(3,1,'16G'),(4,1,'2G'),(5,1,'12G'),(6,1,'32G'),(7,3,'木头'),(8,3,'水晶'),(9,3,'桂花'),(10,3,'香蕉'),(11,8,'i3'),(12,8,'i5'),(13,8,'i7'),(14,9,'I3'),(15,9,'I5'),(16,9,'I7');
/*!40000 ALTER TABLE `yao_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_attribute_type`
--

DROP TABLE IF EXISTS `yao_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_attribute_type` (
  `attribute_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`attribute_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_attribute_type`
--

LOCK TABLES `yao_attribute_type` WRITE;
/*!40000 ALTER TABLE `yao_attribute_type` DISABLE KEYS */;
INSERT INTO `yao_attribute_type` VALUES (1,'text'),(2,'select');
/*!40000 ALTER TABLE `yao_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_brand`
--

DROP TABLE IF EXISTS `yao_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `logo_ori` varchar(255) NOT NULL DEFAULT '',
  `sort_number` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`brand_id`),
  KEY `sort_number` (`sort_number`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_brand`
--

LOCK TABLES `yao_brand` WRITE;
/*!40000 ALTER TABLE `yao_brand` DISABLE KEYS */;
INSERT INTO `yao_brand` VALUES (2,'安踏','','',2,1477655656,1477655656),(3,'小红帽','','',5,1477896256,1477896256),(6,'红星','Brand/2016-10-31/thumb_100x100_581726f442f1e.png','Brand/2016-10-31/581726f442f1e.png',8,1477912313,1477912313);
/*!40000 ALTER TABLE `yao_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_category`
--

DROP TABLE IF EXISTS `yao_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_number` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_thumb` varchar(255) NOT NULL DEFAULT '',
  `is_used` tinyint(1) NOT NULL DEFAULT '1',
  `is_nav` tinyint(4) NOT NULL DEFAULT '1',
  `meta_title` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) NOT NULL DEFAULT '',
  `meta_description` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`),
  KEY `sort_number` (`sort_number`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_category`
--

LOCK TABLES `yao_category` WRITE;
/*!40000 ALTER TABLE `yao_category` DISABLE KEYS */;
INSERT INTO `yao_category` VALUES (1,'未分类',0,-1,'','',0,0,'','',''),(5,'眼镜',0,0,'','',1,1,'','',''),(6,'男士眼镜',5,0,'','',1,1,'','',''),(7,'女士眼镜',5,0,'','',1,1,'','',''),(8,'飞行员眼镜',5,0,'','',1,1,'','',''),(9,'驾驶镜',5,0,'','',1,1,'','',''),(10,'太阳镜',5,0,'','',1,1,'','',''),(11,'图书',0,0,'','',1,1,'','',''),(12,'历史',11,0,'','',1,1,'','',''),(14,'科技',11,0,'','',1,1,'','',''),(15,'计算机',11,0,'','',1,1,'','',''),(16,'电子书',11,0,'','',1,1,'','',''),(17,'科普',14,0,'','',1,1,'','',''),(18,'建筑',14,0,'','',1,1,'','',''),(19,'工业技术',14,0,'','',1,1,'','',''),(20,'电子通信',14,0,'','',1,1,'','',''),(21,'自然科学',14,0,'','',1,1,'','',''),(22,'互联网',15,0,'','',1,1,'','',''),(23,'计算机编程',15,0,'','',1,1,'','',''),(24,'硬件，攒机',15,0,'','',1,1,'','',''),(25,'大数据',15,0,'','',1,1,'','',''),(26,'移动开发',15,0,'','',1,1,'','',''),(27,'PHP',15,0,'','',1,1,'','',''),(28,'近代史',12,0,'','',1,1,'','',''),(29,'当代史',12,0,'','',1,1,'','',''),(30,'古代史',12,0,'','',1,1,'','',''),(31,'先秦百家',12,0,'','',1,1,'','',''),(32,'三皇五帝',12,0,'','',1,1,'','',''),(33,'励志',16,0,'','',1,1,'','',''),(34,'小说',16,0,'','',1,1,'','',''),(35,'成功学',16,0,'','',0,0,'','',''),(36,'经济金融',16,0,'','',1,1,'','',''),(37,'免费',16,0,'','',1,1,'','','');
/*!40000 ALTER TABLE `yao_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_event`
--

DROP TABLE IF EXISTS `yao_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_event` (
  `event_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_event`
--

LOCK TABLES `yao_event` WRITE;
/*!40000 ALTER TABLE `yao_event` DISABLE KEYS */;
INSERT INTO `yao_event` VALUES (100,'2016国庆大促'),(101,'2016双11');
/*!40000 ALTER TABLE `yao_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_event_member`
--

DROP TABLE IF EXISTS `yao_event_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_event_member` (
  `event_member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_event_member`
--

LOCK TABLES `yao_event_member` WRITE;
/*!40000 ALTER TABLE `yao_event_member` DISABLE KEYS */;
INSERT INTO `yao_event_member` VALUES (1,101,14),(2,100,14),(3,101,17);
/*!40000 ALTER TABLE `yao_event_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_goods`
--

DROP TABLE IF EXISTS `yao_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_thumb` varchar(255) NOT NULL DEFAULT '',
  `SKU` varchar(16) NOT NULL DEFAULT '',
  `UPC` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `minimum` int(10) unsigned NOT NULL DEFAULT '1',
  `subtract` tinyint(4) NOT NULL DEFAULT '1',
  `is_shipping` tinyint(4) NOT NULL DEFAULT '1',
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `length` int(10) unsigned NOT NULL DEFAULT '0',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `sort_number` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) NOT NULL DEFAULT '',
  `meta_description` varchar(1024) NOT NULL DEFAULT '',
  `length_unit_id` int(10) unsigned NOT NULL DEFAULT '0',
  `weight_unit_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tax_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stock_status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `UPC` (`UPC`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  KEY `tax_id` (`tax_id`),
  KEY `stock_status_id` (`stock_status_id`),
  KEY `length_unit_id` (`length_unit_id`),
  KEY `weight_unit_id` (`weight_unit_id`),
  KEY `sort_number` (`sort_number`),
  KEY `name` (`name`),
  KEY `price` (`price`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_goods`
--

LOCK TABLES `yao_goods` WRITE;
/*!40000 ALTER TABLE `yao_goods` DISABLE KEYS */;
INSERT INTO `yao_goods` VALUES (21,'眼镜','','','1214','121',1500.00,500,1,1,1,'2016-08-15',5,5,5,5,1,0,'这是眼镜',0,'','','',1,1,1,1,1,1,1478093960,1478093960),(24,'电脑','','','1111','111',111.00,111,1,1,1,'2016-10-02',1,1,1,111,1,0,'',0,'','','',1,1,1,1,2,1,1478260438,1478260438),(28,'土豪眼镜','','','12','112',1123.00,111,1,1,1,'2016-09-10',1,1,1,1,1,0,'',0,'','','',1,1,1,1,2,1,1478349412,1478349412),(29,'小康眼镜','','','526','542',9999.00,1,1,1,1,'2016-09-10',1,1,1,1,1,0,'',0,'','','',1,1,1,1,2,6,1478355711,1478355711);
/*!40000 ALTER TABLE `yao_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_goods_attribute`
--

DROP TABLE IF EXISTS `yao_goods_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_goods_attribute` (
  `goods_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `sort_number` int(11) NOT NULL DEFAULT '0',
  `goods_type_id` int(11) NOT NULL DEFAULT '0',
  `attribute_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_attribute_id`),
  KEY `goods_type_id` (`goods_type_id`),
  KEY `attribute_type_id` (`attribute_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_goods_attribute`
--

LOCK TABLES `yao_goods_attribute` WRITE;
/*!40000 ALTER TABLE `yao_goods_attribute` DISABLE KEYS */;
INSERT INTO `yao_goods_attribute` VALUES (1,'内存',0,1,2),(2,'镜片材质',0,2,1),(3,'镜框材质',0,2,1),(4,'作者',0,3,1),(5,'出版社',0,3,1),(6,'页数',0,3,1),(9,'CPU',3,1,2);
/*!40000 ALTER TABLE `yao_goods_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_goods_attribute_value`
--

DROP TABLE IF EXISTS `yao_goods_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_goods_attribute_value` (
  `goods_attribute_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `is_option` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_attribute_value_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_attribute_id` (`goods_attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_goods_attribute_value`
--

LOCK TABLES `yao_goods_attribute_value` WRITE;
/*!40000 ALTER TABLE `yao_goods_attribute_value` DISABLE KEYS */;
INSERT INTO `yao_goods_attribute_value` VALUES (1,22,1,'1,2,3',0),(2,0,2,'',0),(3,0,3,',,',0),(4,0,2,'',0),(5,0,3,'7,8,9',0),(6,0,2,'',0),(7,0,3,'10,8,9',0),(8,0,2,'',0),(9,0,3,'7,8,9',1),(10,23,1,'1,3,5',1),(11,23,8,'11,12,13',1),(12,24,1,'2',1),(13,24,9,'15',1),(14,26,1,'1',1),(15,26,9,'14',1),(16,27,1,'1,2,3,4,5',1),(17,27,9,'14,15,16',1),(18,27,2,'',0),(19,27,3,'',0),(20,29,2,'',0),(21,29,3,'',0);
/*!40000 ALTER TABLE `yao_goods_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_goods_image`
--

DROP TABLE IF EXISTS `yao_goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_goods_image` (
  `goods_image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `image_small` varchar(255) NOT NULL DEFAULT '',
  `image_medium` varchar(255) NOT NULL DEFAULT '',
  `image_big` varchar(255) NOT NULL DEFAULT '',
  `sort_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_image_id`),
  KEY `goods_id` (`goods_id`),
  KEY `sort_number` (`sort_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_goods_image`
--

LOCK TABLES `yao_goods_image` WRITE;
/*!40000 ALTER TABLE `yao_goods_image` DISABLE KEYS */;
INSERT INTO `yao_goods_image` VALUES (1,21,'Goods/2016-11-02/5819ec8e02276.jpg','Goods/2016-11-02/small_5819ec8e02276.jpg','Goods/2016-11-02/medium_5819ec8e02276.jpg','Goods/2016-11-02/big_5819ec8e02276.jpg',0),(2,21,'Goods/2016-11-02/5819ec8e0ab07.jpg','Goods/2016-11-02/small_5819ec8e0ab07.jpg','Goods/2016-11-02/medium_5819ec8e0ab07.jpg','Goods/2016-11-02/big_5819ec8e0ab07.jpg',0),(3,29,'Goods/2016-11-05/581deb0a36af7.jpg','Goods/2016-11-05/small_581deb0a36af7.jpg','Goods/2016-11-05/medium_581deb0a36af7.jpg','Goods/2016-11-05/big_581deb0a36af7.jpg',0),(4,29,'Goods/2016-11-05/581deb0a4f8a9.jpg','Goods/2016-11-05/small_581deb0a4f8a9.jpg','Goods/2016-11-05/medium_581deb0a4f8a9.jpg','Goods/2016-11-05/big_581deb0a4f8a9.jpg',0),(5,29,'Goods/2016-11-05/581deb0a52224.jpg','Goods/2016-11-05/small_581deb0a52224.jpg','Goods/2016-11-05/medium_581deb0a52224.jpg','Goods/2016-11-05/big_581deb0a52224.jpg',0),(6,29,'Goods/2016-11-05/581deb0a54c7e.jpg','Goods/2016-11-05/small_581deb0a54c7e.jpg','Goods/2016-11-05/medium_581deb0a54c7e.jpg','Goods/2016-11-05/big_581deb0a54c7e.jpg',0);
/*!40000 ALTER TABLE `yao_goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_goods_product`
--

DROP TABLE IF EXISTS `yao_goods_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_goods_product` (
  `goods_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(11) NOT NULL DEFAULT '0',
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_operate` enum('=','-','+') NOT NULL DEFAULT '+',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goods_product_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_goods_product`
--

LOCK TABLES `yao_goods_product` WRITE;
/*!40000 ALTER TABLE `yao_goods_product` DISABLE KEYS */;
INSERT INTO `yao_goods_product` VALUES (1,26,15,1114.00,'-',1),(2,26,1,1110.00,'+',1);
/*!40000 ALTER TABLE `yao_goods_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_goods_type`
--

DROP TABLE IF EXISTS `yao_goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_goods_type` (
  `goods_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_goods_type`
--

LOCK TABLES `yao_goods_type` WRITE;
/*!40000 ALTER TABLE `yao_goods_type` DISABLE KEYS */;
INSERT INTO `yao_goods_type` VALUES (1,'笔记本'),(2,'眼镜'),(3,'图书');
/*!40000 ALTER TABLE `yao_goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_length_unit`
--

DROP TABLE IF EXISTS `yao_length_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_length_unit` (
  `length_unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`length_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_length_unit`
--

LOCK TABLES `yao_length_unit` WRITE;
/*!40000 ALTER TABLE `yao_length_unit` DISABLE KEYS */;
INSERT INTO `yao_length_unit` VALUES (1,'厘米'),(2,'毫米'),(3,'英寸'),(4,'米');
/*!40000 ALTER TABLE `yao_length_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_member`
--

DROP TABLE IF EXISTS `yao_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_member` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  `password` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `is_newsletter` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_member`
--

LOCK TABLES `yao_member` WRITE;
/*!40000 ALTER TABLE `yao_member` DISABLE KEYS */;
INSERT INTO `yao_member` VALUES (1,'yaoxue2014@hotmail.com',NULL,'a66abb5684c45962d887564f08346e8d','HelloYao',0),(2,'xueyao@yao.com',NULL,'a66abb5684c45962d887564f08346e8d','flowstone',0);
/*!40000 ALTER TABLE `yao_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_member_login_log`
--

DROP TABLE IF EXISTS `yao_member_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_member_login_log` (
  `member_login_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `login_ip` int(10) unsigned NOT NULL DEFAULT '0',
  `error_numer` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_login_log_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_member_login_log`
--

LOCK TABLES `yao_member_login_log` WRITE;
/*!40000 ALTER TABLE `yao_member_login_log` DISABLE KEYS */;
INSERT INTO `yao_member_login_log` VALUES (1,11,1477429573,372089611,0),(2,11,1477469573,372090123,0),(3,11,1477479573,372089612,0);
/*!40000 ALTER TABLE `yao_member_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_product_option`
--

DROP TABLE IF EXISTS `yao_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_product_option` (
  `product_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_option_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_option_id`),
  KEY `goods_product_id` (`goods_product_id`),
  KEY `attribute_option_id` (`attribute_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_product_option`
--

LOCK TABLES `yao_product_option` WRITE;
/*!40000 ALTER TABLE `yao_product_option` DISABLE KEYS */;
INSERT INTO `yao_product_option` VALUES (1,1,1),(2,1,14),(3,2,1),(4,2,14),(5,3,1),(6,3,14);
/*!40000 ALTER TABLE `yao_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_session`
--

DROP TABLE IF EXISTS `yao_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_session`
--

LOCK TABLES `yao_session` WRITE;
/*!40000 ALTER TABLE `yao_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `yao_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_setting`
--

DROP TABLE IF EXISTS `yao_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_setting` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(32) NOT NULL DEFAULT '',
  `setting_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `setting_group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`setting_id`),
  KEY `setting_type_id` (`setting_type_id`),
  KEY `setting_group_id` (`setting_group_id`),
  KEY `sort_number` (`sort_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_setting`
--

LOCK TABLES `yao_setting` WRITE;
/*!40000 ALTER TABLE `yao_setting` DISABLE KEYS */;
INSERT INTO `yao_setting` VALUES (1,'shop_title','XMall','商店名称',1,1,0),(2,'allow_comment','5','是否允许商品评论',3,1,0),(3,'use_captcha','','哪些页面使用验证码',4,2,0),(4,'mate_description','BuyPlus(败pping), 用BuyPlus，不败家！','mate描述description',2,1,0),(5,'brand_thumb_width','66','品牌缩略图宽',1,1,0),(6,'brand_thumb_height','66','品牌缩略图高',1,1,0);
/*!40000 ALTER TABLE `yao_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_setting_group`
--

DROP TABLE IF EXISTS `yao_setting_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_setting_group` (
  `setting_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_title` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`setting_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_setting_group`
--

LOCK TABLES `yao_setting_group` WRITE;
/*!40000 ALTER TABLE `yao_setting_group` DISABLE KEYS */;
INSERT INTO `yao_setting_group` VALUES (1,'商店设置'),(2,'安全配置');
/*!40000 ALTER TABLE `yao_setting_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_setting_option`
--

DROP TABLE IF EXISTS `yao_setting_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_setting_option` (
  `setting_option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_title` varchar(32) NOT NULL DEFAULT '',
  `setting_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`setting_option_id`),
  KEY `setting_id` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_setting_option`
--

LOCK TABLES `yao_setting_option` WRITE;
/*!40000 ALTER TABLE `yao_setting_option` DISABLE KEYS */;
INSERT INTO `yao_setting_option` VALUES (1,'注册',3),(2,'登录',3),(3,'评论',3),(4,'生成订单',3),(5,'是',2),(6,'否',2);
/*!40000 ALTER TABLE `yao_setting_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_setting_type`
--

DROP TABLE IF EXISTS `yao_setting_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_setting_type` (
  `setting_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`setting_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_setting_type`
--

LOCK TABLES `yao_setting_type` WRITE;
/*!40000 ALTER TABLE `yao_setting_type` DISABLE KEYS */;
INSERT INTO `yao_setting_type` VALUES (1,'text'),(2,'textarea'),(3,'select'),(4,'select-multi');
/*!40000 ALTER TABLE `yao_setting_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_stock_status`
--

DROP TABLE IF EXISTS `yao_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_stock_status` (
  `stock_status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`stock_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_stock_status`
--

LOCK TABLES `yao_stock_status` WRITE;
/*!40000 ALTER TABLE `yao_stock_status` DISABLE KEYS */;
INSERT INTO `yao_stock_status` VALUES (1,'库存充足'),(2,'1-3周'),(3,'1-3天'),(4,'脱销'),(5,'预定');
/*!40000 ALTER TABLE `yao_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_tax`
--

DROP TABLE IF EXISTS `yao_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_tax`
--

LOCK TABLES `yao_tax` WRITE;
/*!40000 ALTER TABLE `yao_tax` DISABLE KEYS */;
INSERT INTO `yao_tax` VALUES (1,'免税产品'),(2,'缴税产品');
/*!40000 ALTER TABLE `yao_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yao_weight_unit`
--

DROP TABLE IF EXISTS `yao_weight_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yao_weight_unit` (
  `weight_unit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`weight_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yao_weight_unit`
--

LOCK TABLES `yao_weight_unit` WRITE;
/*!40000 ALTER TABLE `yao_weight_unit` DISABLE KEYS */;
INSERT INTO `yao_weight_unit` VALUES (1,'克'),(2,'千克'),(3,'500克(斤)');
/*!40000 ALTER TABLE `yao_weight_unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-07  2:37:28
