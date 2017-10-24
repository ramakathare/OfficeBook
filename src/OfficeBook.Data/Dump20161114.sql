-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: officebook_api
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Current Database: `officebook_api`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `officebook_api` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `officebook_api`;

--
-- Table structure for table `ob_announcements`
--

DROP TABLE IF EXISTS `ob_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_announcements` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Message` text NOT NULL,
  `PostId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_announcements`
--

LOCK TABLES `ob_announcements` WRITE;
/*!40000 ALTER TABLE `ob_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_comments`
--

DROP TABLE IF EXISTS `ob_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_comments` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Creator` int(11) NOT NULL,
  `EditedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Editor` int(11) NOT NULL,
  `ParentId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_comments`
--

LOCK TABLES `ob_comments` WRITE;
/*!40000 ALTER TABLE `ob_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_files`
--

DROP TABLE IF EXISTS `ob_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_files` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `ParentId` int(11) unsigned NOT NULL DEFAULT '0',
  `FileTypeId` int(11) NOT NULL,
  `Extension` varchar(45) DEFAULT NULL,
  `StorageId` varchar(32) DEFAULT NULL,
  `Creator` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EditedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Editor` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_files`
--

LOCK TABLES `ob_files` WRITE;
/*!40000 ALTER TABLE `ob_files` DISABLE KEYS */;
INSERT INTO `ob_files` VALUES (1,'a.txt',0,0,NULL,NULL,0,'2016-11-13 03:56:58','2016-11-13 03:56:58',0);
/*!40000 ALTER TABLE `ob_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_groupfiles`
--

DROP TABLE IF EXISTS `ob_groupfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_groupfiles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `GroupId` int(11) NOT NULL,
  `FileId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_groupfiles`
--

LOCK TABLES `ob_groupfiles` WRITE;
/*!40000 ALTER TABLE `ob_groupfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_groupfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_groupposts`
--

DROP TABLE IF EXISTS `ob_groupposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_groupposts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `GroupId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_groupposts`
--

LOCK TABLES `ob_groupposts` WRITE;
/*!40000 ALTER TABLE `ob_groupposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_groupposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_groups`
--

DROP TABLE IF EXISTS `ob_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_groups` (
  `Id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Handle` varchar(45) NOT NULL,
  `Desc` text,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Creator` int(11) NOT NULL,
  `EditedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Editor` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_groups`
--

LOCK TABLES `ob_groups` WRITE;
/*!40000 ALTER TABLE `ob_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_groupusers`
--

DROP TABLE IF EXISTS `ob_groupusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_groupusers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `GroupId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_groupusers`
--

LOCK TABLES `ob_groupusers` WRITE;
/*!40000 ALTER TABLE `ob_groupusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_groupusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_postfiles`
--

DROP TABLE IF EXISTS `ob_postfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_postfiles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PostId` int(11) NOT NULL,
  `FileId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_postfiles`
--

LOCK TABLES `ob_postfiles` WRITE;
/*!40000 ALTER TABLE `ob_postfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_postfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_postreactions`
--

DROP TABLE IF EXISTS `ob_postreactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_postreactions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReactionId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_postreactions`
--

LOCK TABLES `ob_postreactions` WRITE;
/*!40000 ALTER TABLE `ob_postreactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_postreactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_posts`
--

DROP TABLE IF EXISTS `ob_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_posts` (
  `Id` int(11) unsigned NOT NULL,
  `Type` int(11) NOT NULL,
  `Creator` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EditedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Editor` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_posts`
--

LOCK TABLES `ob_posts` WRITE;
/*!40000 ALTER TABLE `ob_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_reactions`
--

DROP TABLE IF EXISTS `ob_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_reactions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReactionId` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Creator` int(11) NOT NULL,
  `EditedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Editor` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_reactions`
--

LOCK TABLES `ob_reactions` WRITE;
/*!40000 ALTER TABLE `ob_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_tasks`
--

DROP TABLE IF EXISTS `ob_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_tasks` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Message` varchar(45) NOT NULL,
  `ParentId` varchar(45) NOT NULL DEFAULT '0',
  `Started` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Ended` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AssigneeId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_tasks`
--

LOCK TABLES `ob_tasks` WRITE;
/*!40000 ALTER TABLE `ob_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_typesof_files`
--

DROP TABLE IF EXISTS `ob_typesof_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_typesof_files` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Mime` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_typesof_files`
--

LOCK TABLES `ob_typesof_files` WRITE;
/*!40000 ALTER TABLE `ob_typesof_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_typesof_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_typesof_posts`
--

DROP TABLE IF EXISTS `ob_typesof_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_typesof_posts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_typesof_posts`
--

LOCK TABLES `ob_typesof_posts` WRITE;
/*!40000 ALTER TABLE `ob_typesof_posts` DISABLE KEYS */;
INSERT INTO `ob_typesof_posts` VALUES (1,'Post'),(2,'Link'),(3,'Photo'),(4,'Video'),(5,'Album'),(6,'LikePost');
/*!40000 ALTER TABLE `ob_typesof_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_typesof_reactions`
--

DROP TABLE IF EXISTS `ob_typesof_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_typesof_reactions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_typesof_reactions`
--

LOCK TABLES `ob_typesof_reactions` WRITE;
/*!40000 ALTER TABLE `ob_typesof_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_typesof_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_usercomments`
--

DROP TABLE IF EXISTS `ob_usercomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_usercomments` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `CommentId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_usercomments`
--

LOCK TABLES `ob_usercomments` WRITE;
/*!40000 ALTER TABLE `ob_usercomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_usercomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_userfiles`
--

DROP TABLE IF EXISTS `ob_userfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_userfiles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `FileId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_userfiles`
--

LOCK TABLES `ob_userfiles` WRITE;
/*!40000 ALTER TABLE `ob_userfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_userfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_userposts`
--

DROP TABLE IF EXISTS `ob_userposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_userposts` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_userposts`
--

LOCK TABLES `ob_userposts` WRITE;
/*!40000 ALTER TABLE `ob_userposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_userposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_userreactions`
--

DROP TABLE IF EXISTS `ob_userreactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_userreactions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `ReactionId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_userreactions`
--

LOCK TABLES `ob_userreactions` WRITE;
/*!40000 ALTER TABLE `ob_userreactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_userreactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob_users`
--

DROP TABLE IF EXISTS `ob_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ob_users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Handle` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob_users`
--

LOCK TABLES `ob_users` WRITE;
/*!40000 ALTER TABLE `ob_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'officebook_api'
--

--
-- Current Database: `officebook_identityserver`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `officebook_identityserver` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `officebook_identityserver`;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(250) NOT NULL,
  `ProductVersion` varchar(250) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20161106101804_InitialIdentityServerMigration','1.0.1'),('20161106101826_InitialIdentityServerMigration','1.0.1'),('20161106101904_InitialIdentityServerMigration','1.0.1');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroleclaims`
--

DROP TABLE IF EXISTS `aspnetroleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClaimType` varchar(255) DEFAULT NULL,
  `ClaimValue` varchar(255) DEFAULT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroleclaims`
--

LOCK TABLES `aspnetroleclaims` WRITE;
/*!40000 ALTER TABLE `aspnetroleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ConcurrencyStamp` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `NormalizedName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClaimType` varchar(255) DEFAULT NULL,
  `ClaimValue` varchar(255) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` varchar(255) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  KEY `IX_AspNetUserRoles_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AccessFailedCount` int(11) NOT NULL,
  `ConcurrencyStamp` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `EmailConfirmed` bit(1) NOT NULL,
  `LockoutEnabled` bit(1) NOT NULL,
  `LockoutEnd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NormalizedEmail` varchar(255) DEFAULT NULL,
  `NormalizedUserName` varchar(255) DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `PhoneNumberConfirmed` bit(1) NOT NULL,
  `SecurityStamp` varchar(255) DEFAULT NULL,
  `TwoFactorEnabled` bit(1) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusertokens`
--

DROP TABLE IF EXISTS `aspnetusertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusertokens` (
  `UserId` int(11) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusertokens`
--

LOCK TABLES `aspnetusertokens` WRITE;
/*!40000 ALTER TABLE `aspnetusertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientclaims`
--

DROP TABLE IF EXISTS `clientclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `Type` varchar(250) NOT NULL,
  `Value` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ClientClaims_ClientId` (`ClientId`),
  CONSTRAINT `FK_ClientClaims_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientclaims`
--

LOCK TABLES `clientclaims` WRITE;
/*!40000 ALTER TABLE `clientclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientcorsorigins`
--

DROP TABLE IF EXISTS `clientcorsorigins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientcorsorigins` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `Origin` varchar(150) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ClientCorsOrigins_ClientId` (`ClientId`),
  CONSTRAINT `FK_ClientCorsOrigins_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientcorsorigins`
--

LOCK TABLES `clientcorsorigins` WRITE;
/*!40000 ALTER TABLE `clientcorsorigins` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientcorsorigins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientgranttypes`
--

DROP TABLE IF EXISTS `clientgranttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientgranttypes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `GrantType` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ClientGrantTypes_ClientId` (`ClientId`),
  CONSTRAINT `FK_ClientGrantTypes_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientgranttypes`
--

LOCK TABLES `clientgranttypes` WRITE;
/*!40000 ALTER TABLE `clientgranttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientgranttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientidprestrictions`
--

DROP TABLE IF EXISTS `clientidprestrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientidprestrictions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `Provider` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ClientIdPRestrictions_ClientId` (`ClientId`),
  CONSTRAINT `FK_ClientIdPRestrictions_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientidprestrictions`
--

LOCK TABLES `clientidprestrictions` WRITE;
/*!40000 ALTER TABLE `clientidprestrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientidprestrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientpostlogoutredirecturis`
--

DROP TABLE IF EXISTS `clientpostlogoutredirecturis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientpostlogoutredirecturis` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `PostLogoutRedirectUri` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ClientPostLogoutRedirectUris_ClientId` (`ClientId`),
  CONSTRAINT `FK_ClientPostLogoutRedirectUris_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientpostlogoutredirecturis`
--

LOCK TABLES `clientpostlogoutredirecturis` WRITE;
/*!40000 ALTER TABLE `clientpostlogoutredirecturis` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientpostlogoutredirecturis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientredirecturis`
--

DROP TABLE IF EXISTS `clientredirecturis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientredirecturis` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `RedirectUri` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ClientRedirectUris_ClientId` (`ClientId`),
  CONSTRAINT `FK_ClientRedirectUris_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientredirecturis`
--

LOCK TABLES `clientredirecturis` WRITE;
/*!40000 ALTER TABLE `clientredirecturis` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientredirecturis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AbsoluteRefreshTokenLifetime` int(11) NOT NULL,
  `AccessTokenLifetime` int(11) NOT NULL,
  `AccessTokenType` int(11) NOT NULL,
  `AllowAccessToAllScopes` bit(1) NOT NULL,
  `AllowAccessTokensViaBrowser` bit(1) NOT NULL,
  `AllowPromptNone` bit(1) NOT NULL,
  `AllowRememberConsent` bit(1) NOT NULL,
  `AlwaysSendClientClaims` bit(1) NOT NULL,
  `AuthorizationCodeLifetime` int(11) NOT NULL,
  `ClientId` varchar(200) NOT NULL,
  `ClientName` varchar(200) NOT NULL,
  `ClientUri` varchar(255) DEFAULT NULL,
  `EnableLocalLogin` bit(1) NOT NULL,
  `Enabled` bit(1) NOT NULL,
  `IdentityTokenLifetime` int(11) NOT NULL,
  `IncludeJwtId` bit(1) NOT NULL,
  `LogoUri` varchar(255) DEFAULT NULL,
  `LogoutSessionRequired` bit(1) NOT NULL,
  `LogoutUri` varchar(255) DEFAULT NULL,
  `PrefixClientClaims` bit(1) NOT NULL,
  `PublicClient` bit(1) NOT NULL,
  `RefreshTokenExpiration` int(11) NOT NULL,
  `RefreshTokenUsage` int(11) NOT NULL,
  `RequireClientSecret` bit(1) NOT NULL,
  `RequireConsent` bit(1) NOT NULL,
  `RequirePkce` bit(1) NOT NULL,
  `SlidingRefreshTokenLifetime` int(11) NOT NULL,
  `UpdateAccessTokenClaimsOnRefresh` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Clients_ClientId` (`ClientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientscopes`
--

DROP TABLE IF EXISTS `clientscopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientscopes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `Scope` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ClientScopes_ClientId` (`ClientId`),
  CONSTRAINT `FK_ClientScopes_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientscopes`
--

LOCK TABLES `clientscopes` WRITE;
/*!40000 ALTER TABLE `clientscopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientscopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientsecrets`
--

DROP TABLE IF EXISTS `clientsecrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientsecrets` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Expiration` datetime DEFAULT NULL,
  `Type` varchar(250) DEFAULT NULL,
  `Value` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ClientSecrets_ClientId` (`ClientId`),
  CONSTRAINT `FK_ClientSecrets_Clients_ClientId` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientsecrets`
--

LOCK TABLES `clientsecrets` WRITE;
/*!40000 ALTER TABLE `clientsecrets` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientsecrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistedgrants`
--

DROP TABLE IF EXISTS `persistedgrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistedgrants` (
  `Key` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `ClientId` varchar(200) NOT NULL,
  `CreationTime` datetime NOT NULL,
  `Data` varchar(255) NOT NULL,
  `Expiration` datetime NOT NULL,
  `SubjectId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Key`,`Type`),
  KEY `IX_PersistedGrants_SubjectId` (`SubjectId`),
  KEY `IX_PersistedGrants_SubjectId_ClientId` (`SubjectId`,`ClientId`),
  KEY `IX_PersistedGrants_SubjectId_ClientId_Type` (`SubjectId`,`ClientId`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistedgrants`
--

LOCK TABLES `persistedgrants` WRITE;
/*!40000 ALTER TABLE `persistedgrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistedgrants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scopeclaims`
--

DROP TABLE IF EXISTS `scopeclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scopeclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AlwaysIncludeInIdToken` bit(1) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Name` varchar(200) NOT NULL,
  `ScopeId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ScopeClaims_ScopeId` (`ScopeId`),
  CONSTRAINT `FK_ScopeClaims_Scopes_ScopeId` FOREIGN KEY (`ScopeId`) REFERENCES `scopes` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scopeclaims`
--

LOCK TABLES `scopeclaims` WRITE;
/*!40000 ALTER TABLE `scopeclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `scopeclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scopes`
--

DROP TABLE IF EXISTS `scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scopes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AllowUnrestrictedIntrospection` bit(1) NOT NULL,
  `ClaimsRule` varchar(200) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DisplayName` varchar(200) DEFAULT NULL,
  `Emphasize` bit(1) NOT NULL,
  `Enabled` bit(1) NOT NULL,
  `IncludeAllClaimsForUser` bit(1) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Required` bit(1) NOT NULL,
  `ShowInDiscoveryDocument` bit(1) NOT NULL,
  `Type` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Scopes_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scopes`
--

LOCK TABLES `scopes` WRITE;
/*!40000 ALTER TABLE `scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scopesecrets`
--

DROP TABLE IF EXISTS `scopesecrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scopesecrets` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `Expiration` datetime DEFAULT NULL,
  `ScopeId` int(11) NOT NULL,
  `Type` varchar(250) DEFAULT NULL,
  `Value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ScopeSecrets_ScopeId` (`ScopeId`),
  CONSTRAINT `FK_ScopeSecrets_Scopes_ScopeId` FOREIGN KEY (`ScopeId`) REFERENCES `scopes` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scopesecrets`
--

LOCK TABLES `scopesecrets` WRITE;
/*!40000 ALTER TABLE `scopesecrets` DISABLE KEYS */;
/*!40000 ALTER TABLE `scopesecrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'officebook_identityserver'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-14 13:58:06
