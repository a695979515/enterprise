-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: jesoptest
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `createAccount` varchar(45) DEFAULT NULL,
  `updateAccount` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `portrait` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','2013-07-30 20:53:09','2016-06-06 14:48:19',NULL,NULL,'超级管理员','admin@qq.com','attached/headPortrait/20160606/146519569961677556119.jpg'),(2,'123','202cb962ac59075b964b07152d234b70','2016-05-17 11:47:57','2016-05-27 13:09:51','admin','admin','123','123@qq.com',NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT '111',
  `orderNum` int(11) NOT NULL DEFAULT '0',
  `type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
INSERT INTO `t_menu` VALUES (1,0,'','系统管理',20,'module','icon-cog bigger-150'),(2,1,'/manage/menu/selectList?init=y','资源管理',3,'page',NULL),(3,1,'/manage/user/selectList?init=y','网站管理员',1,'page',NULL),(6,0,'','内容管理',4,'module','icon-edit'),(7,6,'/manage/news/selectList?init=y&type=help','文章管理',3,'page',NULL),(9,6,'/manage/indexImg/selectList','门户滚动图片',6,'page',NULL),(36,1,'/manage/systemlog/selectList?init=y','日志管理',8,'page',NULL),(40,6,'/manage/advert/selectList?init=y','广告管理',8,'page',NULL),(43,6,'/manage/catalog/selectList?init=y&type=a','文章分类',1,'page',NULL),(49,1,'/manage/systemSetting/toEdit?init=y','系统设置',9,'page',NULL),(52,3,'/manage/user/selectList','查询',1,'button',NULL),(55,3,'/manage/user/insert','添加',2,'button',NULL),(56,3,'/manage/user/deletes','删除',3,'button',NULL),(57,0,'/manage/user/home','首页',-100,'page','icon-desktop'),(61,2,'/manage/menu/selectList','查询',1,'button',NULL),(62,2,'/manage/menu/insert','添加',2,'button',NULL),(63,2,'/manage/menu/deletes','删除',3,'button',NULL),(71,6,'/manage/news/selectList?init=y&type=notice','公告管理',2,'page',NULL),(107,1,'/manage/message/selectList?init=y','留言管理',0,'page',NULL),(113,1,'/manage/recruitment/selectList?init=y','招聘管理',2,'page',NULL),(114,1,'/manage/friendLinks/selectList?init=y','友情链接',2,'page',NULL),(115,1,'/manage/backups/backupsList','数据备份',5,'page',NULL);
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_systemsetting`
--

DROP TABLE IF EXISTS `t_systemsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_systemsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemCode` varchar(45) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `www` varchar(100) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `keywords` varchar(100) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `icp` varchar(45) NOT NULL,
  `isopen` varchar(8) NOT NULL DEFAULT 'y',
  `closeMsg` varchar(500) DEFAULT NULL,
  `qq` varchar(25) DEFAULT NULL,
  `imageRootPath` varchar(45) DEFAULT NULL,
  `version` varchar(145) DEFAULT NULL,
  `qqService` text,
  `statisticsCode` varchar(1000) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_systemsetting`
--

LOCK TABLES `t_systemsetting` WRITE;
/*!40000 ALTER TABLE `t_systemsetting` DISABLE KEYS */;
INSERT INTO `t_systemsetting` VALUES (1,'测试','企业网站','http://localhost:8080/maven_web','http://localhost:8080/maven_web/resource/images/log.png','测试网站','测试网站','测试网站','http://192.168.1.97:8080/maven_web/resource/images/favicon.png','深圳市福田区XXX路XX大厦','077512345687','69597515@qq.com','粤ICP备15052307号','true','由于维护原因，网站暂时关闭，由此带来的不便请亲原谅，大概会在10分钟后开放网站，敬请期待！',NULL,'http://192.168.1.97:8080/maven_web','1.0.0','<div>\r\n	<a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=543089122&site=qq&menu=yes\"><img src=\"http://wpa.qq.com/pa?p=2:543089122:51\" alt=\"QQ店小二,点击这里给我发消息\" title=\"QQ店小二,点击这里给我发消息\" border=\"0\" /></a> <a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=543089122&site=qq&menu=yes\"><img src=\"http://wpa.qq.com/pa?p=2:543089122:51\" alt=\"QQ店小三,点击这里给我发消息\" title=\"QQ店小三,点击这里给我发消息\" border=\"0\" /></a> <a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=543089122&site=qq&menu=yes\"><img src=\"http://wpa.qq.com/pa?p=2:543089122:51\" alt=\"QQ店小四,点击这里给我发消息\" title=\"QQ店小四,点击这里给我发消息\" border=\"0\" /></a> \r\n</div>','xx','077513245689','13557854833');
/*!40000 ALTER TABLE `t_systemsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_systemlog`
--

DROP TABLE IF EXISTS `t_systemlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_systemlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` varchar(500) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `account` varchar(45) DEFAULT NULL,
  `loginIP` varchar(15) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `loginArea` varchar(45) DEFAULT NULL,
  `diffAreaLogin` char(1) DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_systemlog`
--

LOCK TABLES `t_systemlog` WRITE;
/*!40000 ALTER TABLE `t_systemlog` DISABLE KEYS */;
INSERT INTO `t_systemlog` VALUES (12,'loginOut','loginOut',1,'admin','192.168.1.97','2016-05-18 10:08:10',NULL,'n'),(13,'login','login',1,'admin','192.168.1.97','2016-05-18 10:08:15',NULL,'n'),(14,'loginOut','loginOut',1,'admin','192.168.1.97','2016-05-18 10:59:05',NULL,'n'),(15,'login','login',1,'admin','192.168.1.97','2016-05-18 10:59:10',NULL,'n'),(16,'login','login',1,'admin','192.168.1.97','2016-05-18 11:10:47',NULL,'n'),(17,'login','login',1,'admin','192.168.1.97','2016-05-18 11:22:56',NULL,'n'),(18,'login','login',1,'admin','192.168.1.97','2016-05-18 14:57:43',NULL,'n'),(19,'login','login',1,'admin','192.168.1.97','2016-05-18 17:13:00',NULL,'n'),(20,'login','login',1,'admin','192.168.1.97','2016-05-18 18:01:14',NULL,'n'),(21,'login','login',1,'admin','192.168.1.97','2016-05-19 09:14:45',NULL,'n'),(22,'login','login',1,'admin','192.168.1.97','2016-05-19 10:29:26',NULL,'n'),(23,'login','login',1,'admin','192.168.1.97','2016-05-19 11:30:47',NULL,'n'),(24,'login','login',1,'admin','192.168.1.97','2016-05-19 11:34:57',NULL,'n'),(25,'login','login',1,'admin','192.168.1.97','2016-05-19 13:39:44',NULL,'n'),(26,'login','login',1,'admin','192.168.1.97','2016-05-19 14:11:48',NULL,'n'),(27,'login','login',1,'admin','192.168.1.97','2016-05-19 14:13:41',NULL,'n'),(28,'login','login',1,'admin','192.168.1.97','2016-05-19 14:18:45',NULL,'n'),(29,'loginOut','loginOut',1,'admin','192.168.1.97','2016-05-19 14:25:16',NULL,'n'),(30,'login','login',1,'admin','192.168.1.97','2016-05-19 14:25:22',NULL,'n'),(31,'login','login',1,'admin','192.168.1.97','2016-05-19 14:55:32',NULL,'n'),(32,'login','login',1,'admin','192.168.1.97','2016-05-19 18:00:51',NULL,'n'),(33,'login','login',1,'admin','192.168.1.97','2016-05-20 09:15:33',NULL,'n'),(34,'login','login',1,'admin','192.168.1.97','2016-05-20 10:33:59',NULL,'n'),(35,'loginOut','loginOut',1,'admin','192.168.1.97','2016-05-20 10:34:47',NULL,'n'),(36,'login','login',1,'admin','192.168.1.97','2016-05-20 10:35:13',NULL,'n'),(37,'login','login',1,'admin','192.168.1.97','2016-05-20 10:36:27',NULL,'n'),(38,'loginOut','loginOut',1,'admin','192.168.1.97','2016-05-20 10:38:19',NULL,'n'),(39,'login','login',1,'admin','192.168.1.97','2016-05-20 10:38:26',NULL,'n'),(40,'login','login',1,'admin','192.168.1.97','2016-05-20 10:39:58',NULL,'n'),(41,'login','login',1,'admin','192.168.1.97','2016-05-20 10:44:31',NULL,'n'),(42,'login','login',1,'admin','192.168.1.97','2016-05-20 10:49:31',NULL,'n'),(43,'login','login',1,'admin','192.168.1.97','2016-05-20 10:53:08',NULL,'n'),(44,'login','login',1,'admin','192.168.1.97','2016-05-20 14:45:27',NULL,'n'),(45,'login','login',1,'admin','192.168.1.97','2016-05-20 15:40:47',NULL,'n'),(46,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 12:03:08','0','y'),(47,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 12:04:07','0','n'),(48,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 12:04:12','0','n'),(49,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 13:49:33','0','n'),(50,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 13:52:34','0','n'),(51,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 14:09:58','0','n'),(52,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 14:35:13','0','n'),(53,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 14:39:01','0','n'),(54,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 15:21:47','0','n'),(55,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 15:36:20','0','n'),(56,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 16:25:35','0','n'),(57,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 16:37:33','0','n'),(58,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 16:41:58','0','n'),(59,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 16:44:26','0','n'),(60,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 16:55:28','0','n'),(61,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 17:33:23','0','n'),(62,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 17:34:44','0','n'),(63,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 17:43:32','0','n'),(64,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 17:50:51','0','n'),(65,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 17:52:52','0','n'),(66,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-23 17:55:09','0','n'),(67,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-24 09:16:44',NULL,'n'),(68,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 09:50:25','0','n'),(69,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 09:52:31','0','n'),(70,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 09:59:19','0','n'),(71,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 10:00:39','0','n'),(72,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 10:52:59','0','n'),(73,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 13:54:34','0','n'),(74,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 15:24:37','0','n'),(75,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 15:53:16','0','n'),(76,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 15:53:22',NULL,'n'),(77,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 16:24:25','0','n'),(78,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 16:47:46','0','n'),(79,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 16:48:44','0','n'),(80,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 16:52:36','0','n'),(81,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 16:58:19','0','n'),(82,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-25 16:58:48',NULL,'n'),(83,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 09:17:49','0','n'),(84,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 11:02:24','0','n'),(85,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 11:43:08','0','n'),(86,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 13:11:09','0','n'),(87,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 13:42:34','0','n'),(88,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 13:44:19','0','n'),(89,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 13:44:24',NULL,'n'),(90,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 13:44:30','0','n'),(91,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 14:29:57','0','n'),(92,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 14:34:48','0','n'),(93,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 14:35:04','0','n'),(94,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 15:03:27','0','n'),(95,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 15:03:39',NULL,'n'),(96,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 15:38:51','0','n'),(97,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 15:42:18','0','n'),(98,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 15:43:51','0','n'),(99,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 15:43:56','0','n'),(100,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 15:50:39','0','n'),(101,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 15:59:56','0','n'),(102,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:00:25','0','n'),(103,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:01:14','0','n'),(104,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:01:23',NULL,'n'),(105,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:01:32','0','n'),(106,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:02:59','0','n'),(107,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:03:06',NULL,'n'),(108,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:03:11','0','n'),(109,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:03:20',NULL,'n'),(110,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:04:23','0','n'),(111,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:04:28',NULL,'n'),(112,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:04:39','0','n'),(113,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:06:26','0','n'),(114,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:06:31',NULL,'n'),(115,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:06:40','0','n'),(116,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:08:19','0','n'),(117,'login','login',1,'admin','127.0.0.1','2016-05-26 16:32:07',NULL,'n'),(118,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:55:19','0','y'),(119,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:55:32',NULL,'n'),(120,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 16:56:07','0','n'),(121,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 17:29:01','0','n'),(122,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 17:29:08','0','n'),(123,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 17:30:27','0','n'),(124,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 17:34:15','0','n'),(125,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-26 17:38:22','0','n'),(126,'login','login',1,'admin','127.0.0.1','2016-05-27 09:59:07',NULL,'n'),(127,'loginOut','loginOut',1,'admin','127.0.0.1','2016-05-27 09:59:12',NULL,'n'),(128,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-27 09:59:27','0','y'),(129,'login','login',1,'admin','127.0.0.1','2016-05-27 10:00:11',NULL,'n'),(130,'login','login',1,'admin','127.0.0.1','2016-05-27 10:46:44',NULL,'n'),(131,'loginOut','loginOut',1,'admin','127.0.0.1','2016-05-27 10:50:05',NULL,'n'),(132,'login','login',1,'admin','127.0.0.1','2016-05-27 10:50:09',NULL,'n'),(133,'login','login',1,'admin','127.0.0.1','2016-05-27 10:53:19',NULL,'n'),(134,'login','login',1,'admin','127.0.0.1','2016-05-27 11:02:54',NULL,'n'),(135,'login','login',1,'admin','127.0.0.1','2016-05-27 11:03:50',NULL,'n'),(136,'login','login',1,'admin','127.0.0.1','2016-05-27 13:37:43',NULL,'n'),(137,'login','login',1,'admin','127.0.0.1','2016-05-27 14:07:29',NULL,'n'),(138,'login','login',1,'admin','127.0.0.1','2016-05-27 14:27:28',NULL,'n'),(139,'login','login',1,'admin','127.0.0.1','2016-05-27 14:29:27',NULL,'n'),(140,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-27 14:41:10','0','y'),(141,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-27 14:44:22','0','n'),(142,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-05-27 14:45:32','0','n'),(143,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-27 14:45:39',NULL,'n'),(144,'login','login',1,'admin','127.0.0.1','2016-05-27 16:38:59',NULL,'n'),(145,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-27 17:14:58','0','y'),(146,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-27 17:36:11','0','n'),(147,'login','login',1,'admin','127.0.0.1','2016-05-27 17:37:45',NULL,'n'),(148,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 10:12:09','0','y'),(149,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 10:57:35','0','n'),(150,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 11:00:09','0','n'),(151,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 11:39:50','0','n'),(152,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 11:42:15','0','n'),(153,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 13:08:26','0','n'),(154,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 13:33:20','0','n'),(155,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 13:38:54','0','n'),(156,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 14:36:56','0','n'),(157,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 15:30:26','0','n'),(158,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-30 15:52:26','0','n'),(159,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-31 10:14:51','0','n'),(160,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-31 10:21:20','0','n'),(161,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-05-31 17:39:42','0','n'),(162,'login','login',1,'admin','192.168.1.97','2016-06-01 09:16:18',NULL,'y'),(163,'login','login',1,'admin','192.168.1.97','2016-06-01 10:15:05',NULL,'n'),(164,'login','login',1,'admin','192.168.1.97','2016-06-01 10:24:11',NULL,'n'),(165,'login','login',1,'admin','192.168.1.97','2016-06-01 13:07:10',NULL,'n'),(166,'login','login',1,'admin','192.168.1.97','2016-06-01 13:46:59',NULL,'n'),(167,'login','login',1,'admin','192.168.1.97','2016-06-01 13:53:19',NULL,'n'),(168,'login','login',1,'admin','192.168.1.97','2016-06-01 13:54:00',NULL,'n'),(169,'login','login',1,'admin','192.168.1.97','2016-06-01 14:04:14',NULL,'n'),(170,'login','login',1,'admin','192.168.1.97','2016-06-01 17:02:10',NULL,'n'),(171,'login','login',1,'admin','192.168.1.97','2016-06-01 17:04:26',NULL,'n'),(172,'login','login',1,'admin','192.168.1.97','2016-06-01 17:05:43',NULL,'n'),(173,'login','login',1,'admin','192.168.1.97','2016-06-01 17:11:54',NULL,'n'),(174,'login','login',1,'admin','192.168.1.97','2016-06-01 17:24:11',NULL,'n'),(175,'login','login',1,'admin','192.168.1.97','2016-06-02 09:04:41',NULL,'n'),(176,'login','login',1,'admin','192.168.1.97','2016-06-02 10:10:39',NULL,'n'),(177,'login','login',1,'admin','192.168.1.97','2016-06-02 10:48:31',NULL,'n'),(178,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 11:07:26',NULL,'n'),(179,'login','login',1,'admin','192.168.1.97','2016-06-02 11:07:35',NULL,'n'),(180,'login','login',1,'admin','192.168.1.97','2016-06-02 11:40:44',NULL,'n'),(181,'login','login',1,'admin','192.168.1.97','2016-06-02 11:49:56',NULL,'n'),(182,'login','login',1,'admin','192.168.1.97','2016-06-02 11:51:37',NULL,'n'),(183,'login','login',1,'admin','192.168.1.97','2016-06-02 11:54:29',NULL,'n'),(184,'login','login',1,'admin','192.168.1.97','2016-06-02 11:56:32',NULL,'n'),(185,'login','login',1,'admin','192.168.1.97','2016-06-02 12:01:02',NULL,'n'),(186,'login','login',1,'admin','192.168.1.97','2016-06-02 12:04:15',NULL,'n'),(187,'login','login',1,'admin','192.168.1.97','2016-06-02 13:03:48',NULL,'n'),(188,'login','login',1,'admin','192.168.1.97','2016-06-02 13:21:07',NULL,'n'),(189,'login','login',1,'admin','192.168.1.97','2016-06-02 16:01:15',NULL,'n'),(190,'login','login',1,'admin','192.168.1.97','2016-06-02 16:04:46',NULL,'n'),(191,'login','login',1,'admin','192.168.1.97','2016-06-02 16:07:36',NULL,'n'),(192,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 16:09:28',NULL,'n'),(193,'login','login',1,'admin','192.168.1.97','2016-06-02 16:09:35',NULL,'n'),(194,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 16:10:10',NULL,'n'),(195,'login','login',1,'admin','192.168.1.97','2016-06-02 16:10:20',NULL,'n'),(196,'login','login',1,'admin','192.168.1.97','2016-06-02 16:13:17',NULL,'n'),(197,'login','login',1,'admin','192.168.1.97','2016-06-02 16:17:13',NULL,'n'),(198,'login','login',1,'admin','192.168.1.97','2016-06-02 16:18:59',NULL,'n'),(199,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 16:19:10',NULL,'n'),(200,'login','login',1,'admin','192.168.1.97','2016-06-02 16:19:16',NULL,'n'),(201,'login','login',1,'admin','192.168.1.97','2016-06-02 16:27:14',NULL,'n'),(202,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 16:27:38',NULL,'n'),(203,'login','login',1,'admin','192.168.1.97','2016-06-02 16:27:44',NULL,'n'),(204,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 16:29:39',NULL,'n'),(205,'login','login',1,'admin','192.168.1.97','2016-06-02 16:29:44',NULL,'n'),(206,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 16:43:24',NULL,'n'),(207,'login','login',1,'admin','192.168.1.97','2016-06-02 16:43:30',NULL,'n'),(208,'login','login',1,'admin','192.168.1.97','2016-06-02 16:45:36',NULL,'n'),(209,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 16:45:48',NULL,'n'),(210,'login','login',1,'admin','192.168.1.97','2016-06-02 16:45:54',NULL,'n'),(211,'login','login',1,'admin','192.168.1.97','2016-06-02 16:50:37',NULL,'n'),(212,'loginOut','loginOut',1,'admin','192.168.1.97','2016-06-02 16:50:50',NULL,'n'),(213,'login','login',1,'admin','192.168.1.97','2016-06-02 16:51:12',NULL,'n'),(214,'login','login',1,'admin','192.168.1.97','2016-06-02 17:02:35',NULL,'n'),(215,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-06-05 21:19:48','0','y'),(216,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-05 21:19:54','0','n'),(217,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-06-05 22:25:59','0','n'),(218,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-05 22:26:04','0','n'),(219,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-06-05 22:26:55','0','n'),(220,'login','login',1,'123','0:0:0:0:0:0:0:1','2016-06-05 22:27:05','0','n'),(221,'loginOut','loginOut',1,'123','0:0:0:0:0:0:0:1','2016-06-05 22:27:21','0','n'),(222,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-05 22:27:27',NULL,'n'),(223,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 09:23:19','0','n'),(224,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 09:24:30','0','n'),(225,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 09:24:37',NULL,'n'),(226,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 09:27:19','0','n'),(227,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 10:15:25','0','n'),(228,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 10:21:04','0','n'),(229,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 10:32:17','0','n'),(230,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 10:32:26','0','n'),(231,'login','login',1,'admin','192.168.1.138','2016-06-06 11:01:00',NULL,'y'),(232,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 11:50:42','0','y'),(233,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 11:51:17','0','n'),(234,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 13:14:19','0','n'),(235,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 13:48:29','0','n'),(236,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 14:46:59','0','n'),(237,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 14:47:52','0','n'),(238,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 15:04:45','0','n'),(239,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 15:14:05','0','n'),(240,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-06 16:41:31','0','n'),(241,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 09:07:32','0','n'),(242,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 09:24:22','0','n'),(243,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 12:50:54','0','n'),(244,'loginOut','loginOut',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 12:53:20','0','n'),(245,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 12:53:25','0','n'),(246,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 13:29:37','0','n'),(247,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 13:45:10','0','n'),(248,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 13:47:24','0','n'),(249,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 13:55:53','0','n'),(250,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 15:07:52','0','n'),(251,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 15:11:52','0','n'),(252,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 15:19:32','0','n'),(253,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 15:22:43','0','n'),(254,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 15:23:39','0','n'),(255,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 15:26:08','0','n'),(256,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 16:07:44','0','n'),(257,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 16:09:56','0','n'),(258,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 16:12:37','0','n'),(259,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 16:36:40','0','n'),(260,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-07 16:41:18','0','n'),(261,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 09:28:46',NULL,'n'),(262,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 09:39:21','0','n'),(263,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 09:43:27','0','n'),(264,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 11:28:04','0','n'),(265,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 11:29:12','0','n'),(266,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 11:37:56','0','n'),(267,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 13:32:00','0','n'),(268,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 13:42:33','0','n'),(269,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 13:52:56','0','n'),(270,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 13:55:57','0','n'),(271,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:00:43','0','n'),(272,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:11:54','0','n'),(273,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:12:42','0','n'),(274,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:13:53','0','n'),(275,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:14:20','0','n'),(276,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:15:51','0','n'),(277,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:19:21','0','n'),(278,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:21:52','0','n'),(279,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:37:55','0','n'),(280,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:48:54','0','n'),(281,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:52:36','0','n'),(282,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:53:47','0','n'),(283,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:56:54','0','n'),(284,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 14:59:58','0','n'),(285,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 15:03:07','0','n'),(286,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 15:05:50','0','n'),(287,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 15:10:59','0','n'),(288,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 15:11:40',NULL,'n'),(289,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 16:34:14','0','n'),(290,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 16:45:41','0','n'),(291,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 16:51:21','0','n'),(292,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 16:58:58','0','n'),(293,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 16:59:30','0','n'),(294,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 17:14:25','0','n'),(295,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 17:37:48','0','n'),(296,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 17:40:47','0','n'),(297,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 17:41:16','0','n'),(298,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 17:41:41','0','n'),(299,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 17:41:59','0','n'),(300,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 17:42:14','0','n'),(301,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-08 17:44:26','0','n'),(302,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-12 09:09:38','0','n'),(303,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-12 09:26:41','0','n'),(304,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-12 11:04:07','0','n'),(305,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-12 13:12:18','0','n'),(306,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-12 14:36:12','0','n'),(307,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-12 15:17:07','0','n'),(308,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-12 15:57:07','0','n'),(309,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-13 15:15:07','0','n'),(310,'login','login',1,'admin','0:0:0:0:0:0:0:1','2016-06-13 15:16:06','0','n');
/*!40000 ALTER TABLE `t_systemlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_messages`
--

DROP TABLE IF EXISTS `t_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `content` varchar(500) NOT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `leavetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_messages`
--

LOCK TABLES `t_messages` WRITE;
/*!40000 ALTER TABLE `t_messages` DISABLE KEYS */;
INSERT INTO `t_messages` VALUES (42,'aa','m','asdfdsafdsafsdafas','2135456','132@qq.com','aaa','2016-05-20 15:39:14'),(43,'标题','f','测试测试测试测试测试','13557854833','695979515@qq.com','姓名','2016-05-20 15:40:15'),(44,'标题','m','空间啊老师发司法所福克斯大接访；卡死极度疯狂撒酒疯凯撒大接访萨科罚金凯撒减肥卡死刷卡积分卡死垃圾反抗拉萨就福萨科罚金会计法啊康师傅萨洛卡积分卡死快速反击阿克苏大接访ask大接访失控的风景凯撒减肥阿斯卡积分卡死减肥啊福克斯','13557854833','123@qq.com','姓名','2016-05-20 16:41:11'),(45,'阿斯蒂芬','m','阿甘回家撒大黄蜂侃大山发送 ','13245343','1635465@qq.com','阿萨德发','2016-05-26 09:50:55'),(46,'fdalsk','m','熟悉J2EE体系结构，熟悉基础的Servlet、JSP开发，深度理解 sping框架 有关，如aop 事物 权限 容器等；\r\n3、能熟练使用SSH，Struts+Hibernate+Spring、Mybatis等框架。\r\n4、熟悉javascript开发，了解CSS和HTML；\r\n5、熟练使用MySQL数据库，熟练使用SQL；\r\n6、熟悉常用的应用服务器配置，Tomcat、nginx、Apache，能在unix/linux上进行开发配置；\r\n7、具备良好的编码习惯，重视代码质量，并保证工作效率；了解版本管理，熟悉SVN，熟悉eclipse使用，了解软件生命周期的各个阶段；\r\n8、工作积极，有强烈的团队意识和责任感。 2016-05-23 16:55:51.0 admin y java工程师 0 1 0 0 1、2年及以上的Java开发经验，了解系统安全方面优先。\r\n2、熟悉J2EE体系结构，熟悉基础的Servlet、JSP开发，深度理解 sping框架 有关，如aop 事物 权限 容器等；\r\n3、能熟练使用SSH，Struts+Hibernate+Spring、Mybatis等框架。','13557843','6595979@qq.com','kdlfjaasdf','2016-05-31 11:35:24'),(47,'ad法律框架','m','啊舒服哈迪斯看来飞机卡洛斯减肥的','13557854833','13557854833@163.com','阿萨德','2016-05-31 11:40:42'),(48,'来来来','m','哈萨克根据考生啊啊撒旦法阿斯蒂芬','13557854833','13557854833@163.com','啦啦啦啦啦','2016-05-31 11:42:30'),(49,'阿斯蒂芬爱的色放','m','goad是空间阿斯蒂芬 按时阿萨德发','13557854833','1635465@qq.com','阿萨德发生的啊','2016-05-31 11:44:18');
/*!40000 ALTER TABLE `t_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_recruitment`
--

DROP TABLE IF EXISTS `t_recruitment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_recruitment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(45) DEFAULT NULL,
  `nature` varchar(45) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `experience` varchar(45) DEFAULT NULL,
  `requirements` varchar(500) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createAccount` varchar(45) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_recruitment`
--

LOCK TABLES `t_recruitment` WRITE;
/*!40000 ALTER TABLE `t_recruitment` DISABLE KEYS */;
INSERT INTO `t_recruitment` VALUES (49,'java工程师','0',1,'2','2','1、2年及以上的Java开发经验，了解系统安全方面优先。<br />\r\n2、熟悉J2EE体系结构，熟悉基础的Servlet、JSP开发，深度理解 sping框架 有关，如aop 事物 权限 容器等；<br />\r\n3、能熟练使用SSH，Struts+Hibernate+Spring、Mybatis等框架。<br />\r\n4、熟悉javascript开发，了解CSS和HTML；<br />\r\n5、熟练使用MySQL数据库，熟练使用SQL；<br />\r\n6、熟悉常用的应用服务器配置，Tomcat、nginx、Apache，能在unix/linux上进行开发配置；<br />\r\n7、具备良好的编码习惯，重视代码质量，并保证工作效率；了解版本管理，熟悉SVN，熟悉eclipse使用，了解软件生命周期的各个阶段；<br />\r\n8、工作积极，有强烈的团队意识和责任感。','2016-05-23 16:55:51','admin','y'),(50,'java工程师','0',1,'0',NULL,'1、2年及以上的Java开发经验，了解系统安全方面优先。<br />\r\n2、熟悉J2EE体系结构，熟悉基础的Servlet、JSP开发，深度理解 sping框架 有关，如aop 事物 权限 容器等；<br />\r\n3、能熟练使用SSH，Struts+Hibernate+Spring、Mybatis等框架。<br />\r\n4、熟悉javascript开发，了解CSS和HTML；<br />\r\n5、熟练使用MySQL数据库，熟练使用SQL；<br />\r\n6、熟悉常用的应用服务器配置，Tomcat、nginx、Apache，能在unix/linux上进行开发配置；<br />\r\n7、具备良好的编码习惯，重视代码质量，并保证工作效率；了解版本管理，熟悉SVN，熟悉eclipse使用，了解软件生命周期的各个阶段；<br />\r\n8、工作积极，有强烈的团队意识和责任感。','2016-05-23 17:15:20','admin','y');
/*!40000 ALTER TABLE `t_recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_indeximg`
--

DROP TABLE IF EXISTS `t_indeximg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_indeximg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(245) NOT NULL,
  `pictureUrl` varchar(100) NOT NULL,
  `orders` int(11) NOT NULL,
  `link` varchar(145) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_indeximg`
--

LOCK TABLES `t_indeximg` WRITE;
/*!40000 ALTER TABLE `t_indeximg` DISABLE KEYS */;
INSERT INTO `t_indeximg` VALUES (20,'产品2','/attached/image/20160530/20160530104127_66.jpg',2,'http://www.cesiumai.com/productDetails/10324.html','y'),(21,'产品3','/attached/image/20160530/20160530104237_677.jpg',3,'http://www.cesiumai.com/productDetails/10325.html','y'),(23,'产品5','/attached/image/20160530/20160530104237_677.jpg',1,'http://192.168.1.97:8080/maven_web','y'),(24,'产品6','/maven_web/attached/image/20160612/20160612165316_905.jpg',4,'www.baiducom','y');
/*!40000 ALTER TABLE `t_indeximg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_friendlinks`
--

DROP TABLE IF EXISTS `t_friendlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_friendlinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `target` varchar(45) NOT NULL DEFAULT '_blank',
  `url` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_friendlinks`
--

LOCK TABLES `t_friendlinks` WRITE;
/*!40000 ALTER TABLE `t_friendlinks` DISABLE KEYS */;
INSERT INTO `t_friendlinks` VALUES (2,'淘宝','_blank','www.taobao.com'),(3,'京东商城','_blank','www.jd.com'),(5,'阿里巴巴','_blank','www.alibaba.com'),(6,'阿里巴中国站','_blank','www.1688.com'),(7,'支付宝','_blank','www.alipay.com'),(8,'阿里云计算','_self','www.aliyun.com'),(11,'万网','_blank','www.net.cn'),(13,'天猫商城','_blank','www.tmall.com'),(14,'当当网','_self','www.dangdang.com'),(15,'苏宁','_blank','http://www.suning.com');
/*!40000 ALTER TABLE `t_friendlinks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-13 16:40:48
