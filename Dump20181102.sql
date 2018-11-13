CREATE DATABASE  IF NOT EXISTS `uniqueID` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `uniqueID`;
-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: uniqueID
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `ID` varchar(6) NOT NULL,
  `textID` int(11) NOT NULL,
  `textIDdesc` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('ACHI',12,508,'#804000'),('ACTI',13,509,'#ff1a1a'),('ADVE',14,510,'#ffd11a'),('ARTI',17,514,'#ffd633'),('ASSE',18,515,'#ff3333'),('CAUT',19,516,'#994d00'),('CHEE',20,517,'#ff4d4d'),('DUTI',23,520,'#b35900'),('EMOT',24,521,'#ffdb4d');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_items`
--

DROP TABLE IF EXISTS `category_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_items` (
  `categoryID` varchar(6) NOT NULL,
  `itemID` int(11) NOT NULL,
  `sign` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categoryID`,`itemID`),
  KEY `FK_category_items_items` (`itemID`),
  CONSTRAINT `FK_category_items_items` FOREIGN KEY (`itemID`) REFERENCES `items` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_items`
--

LOCK TABLES `category_items` WRITE;
/*!40000 ALTER TABLE `category_items` DISABLE KEYS */;
INSERT INTO `category_items` VALUES ('ACHI',5,1),('ACHI',6,1),('ACHI',7,-1),('ACHI',8,-1),('ACTI',9,1),('ACTI',10,1),('ACTI',11,1),('ACTI',12,-1),('ADVE',13,1),('ADVE',14,-1),('ADVE',15,-1),('ADVE',16,-1),('ARTI',26,1),('ARTI',27,1),('ARTI',28,-1),('ARTI',29,-1),('ASSE',30,1),('ASSE',31,1),('ASSE',32,1),('ASSE',33,-1),('CAUT',34,-1),('CAUT',35,-1),('CAUT',36,-1),('CAUT',37,-1),('CHEE',38,1),('CHEE',39,1),('CHEE',40,1),('CHEE',41,1),('DUTI',50,1),('DUTI',51,1),('DUTI',52,-1),('DUTI',53,-1),('EMOT',54,1),('EMOT',55,1),('EMOT',56,-1),('EMOT',57,-1);
/*!40000 ALTER TABLE `category_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension_categories`
--

DROP TABLE IF EXISTS `dimension_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension_categories` (
  `dimensionID` varchar(4) NOT NULL,
  `categoryID` varchar(6) NOT NULL,
  `sign` int(11) NOT NULL,
  PRIMARY KEY (`dimensionID`,`categoryID`),
  KEY `FK_dimension_categories_categories` (`categoryID`),
  CONSTRAINT `FK_dimension_categories_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_dimension_categories_dimensions` FOREIGN KEY (`dimensionID`) REFERENCES `dimensions` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension_categories`
--

LOCK TABLES `dimension_categories` WRITE;
/*!40000 ALTER TABLE `dimension_categories` DISABLE KEYS */;
INSERT INTO `dimension_categories` VALUES ('CON','ACHI',1),('CON','CAUT',1),('CON','DUTI',1),('EXT','ACTI',1),('EXT','ASSE',1),('EXT','CHEE',1),('OPE','ADVE',1),('OPE','ARTI',1),('OPE','EMOT',1);
/*!40000 ALTER TABLE `dimension_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimensions`
--

DROP TABLE IF EXISTS `dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimensions` (
  `ID` varchar(4) NOT NULL,
  `textID` int(11) NOT NULL,
  `textIDdesc` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensions`
--

LOCK TABLES `dimensions` WRITE;
/*!40000 ALTER TABLE `dimensions` DISABLE KEYS */;
INSERT INTO `dimensions` VALUES ('CON',9,503,'#663300'),('EXT',7,504,'#ff0000'),('OPE',11,506,'#ffcc00');
/*!40000 ALTER TABLE `dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `ID` int(11) NOT NULL,
  `textID` int(11) NOT NULL,
  `textID3` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (5,42,380),(6,43,381),(7,44,382),(8,45,383),(9,46,384),(10,47,385),(11,48,386),(12,49,387),(13,50,388),(14,51,389),(15,52,390),(16,53,391),(26,63,401),(27,64,402),(28,65,403),(29,66,404),(30,67,405),(31,68,406),(32,69,407),(33,70,408),(34,71,409),(35,72,410),(36,73,411),(37,74,412),(38,75,413),(39,76,414),(40,77,415),(41,78,416),(50,87,425),(51,88,426),(52,89,427),(53,90,428),(54,91,429),(55,92,430),(56,93,431),(57,94,432);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language` varchar(50) NOT NULL,
  `lancode` varchar(2) NOT NULL,
  PRIMARY KEY (`lancode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES ('deutsch','de'),('english','en');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `firstname` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `surname` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `zipcode` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_70E4FA78F85E0677` (`username`),
  UNIQUE KEY `UNIQ_70E4FA78E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'MartinMeyer','martin_meyer@osnanet.de','','en','Martin','Meyer',NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporttexts_categories`
--

DROP TABLE IF EXISTS `reporttexts_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporttexts_categories` (
  `categoryID` varchar(6) NOT NULL,
  `valuefrom` smallint(6) NOT NULL,
  `valueto` smallint(6) NOT NULL,
  `textID` int(11) NOT NULL,
  PRIMARY KEY (`categoryID`,`valuefrom`),
  CONSTRAINT `FK_reporttexts_categories_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporttexts_categories`
--

LOCK TABLES `reporttexts_categories` WRITE;
/*!40000 ALTER TABLE `reporttexts_categories` DISABLE KEYS */;
INSERT INTO `reporttexts_categories` VALUES ('ACHI',10,28,297),('ACHI',29,46,296),('ACHI',47,64,295),('ACHI',65,82,294),('ACHI',83,100,293),('ACTI',10,28,207),('ACTI',29,46,206),('ACTI',47,64,205),('ACTI',65,82,204),('ACTI',83,100,203),('ADVE',10,28,327),('ADVE',29,46,326),('ADVE',47,64,325),('ADVE',65,82,324),('ADVE',83,100,323),('ARTI',10,28,317),('ARTI',29,46,316),('ARTI',47,64,315),('ARTI',65,82,314),('ARTI',83,100,313),('ASSE',10,28,202),('ASSE',29,46,201),('ASSE',47,64,200),('ASSE',65,82,199),('ASSE',83,100,198),('CAUT',10,28,307),('CAUT',29,46,306),('CAUT',47,64,305),('CAUT',65,82,304),('CAUT',83,100,303),('CHEE',10,28,217),('CHEE',29,46,216),('CHEE',47,64,215),('CHEE',65,82,214),('CHEE',83,100,213),('DUTI',10,28,292),('DUTI',29,46,291),('DUTI',47,64,290),('DUTI',65,82,289),('DUTI',83,100,288),('EMOT',10,28,322),('EMOT',29,46,321),('EMOT',47,64,320),('EMOT',65,82,319),('EMOT',83,100,318);
/*!40000 ALTER TABLE `reporttexts_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporttexts_dimensions`
--

DROP TABLE IF EXISTS `reporttexts_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporttexts_dimensions` (
  `dimensionID` varchar(4) NOT NULL,
  `valuefrom` smallint(6) NOT NULL,
  `valueto` smallint(6) NOT NULL,
  `textID` int(11) NOT NULL,
  PRIMARY KEY (`dimensionID`,`valuefrom`),
  CONSTRAINT `FK_reporttexts_dimensions_dimensions` FOREIGN KEY (`dimensionID`) REFERENCES `dimensions` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporttexts_dimensions`
--

LOCK TABLES `reporttexts_dimensions` WRITE;
/*!40000 ALTER TABLE `reporttexts_dimensions` DISABLE KEYS */;
INSERT INTO `reporttexts_dimensions` VALUES ('CON',10,28,182),('CON',29,46,181),('CON',47,64,180),('CON',65,82,179),('CON',83,100,178),('EXT',10,28,167),('EXT',29,46,166),('EXT',47,64,165),('EXT',65,82,164),('EXT',83,100,163),('OPE',10,28,187),('OPE',29,46,186),('OPE',47,64,185),('OPE',65,82,184),('OPE',83,100,183);
/*!40000 ALTER TABLE `reporttexts_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results_categories`
--

DROP TABLE IF EXISTS `results_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results_categories` (
  `results_mainID` int(11) NOT NULL,
  `categoryID` varchar(6) NOT NULL,
  `value` int(11) NOT NULL,
  `categorytext` varchar(4000) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `definition` varchar(4000) DEFAULT NULL,
  `resulttext` varchar(4000) DEFAULT NULL,
  `dimensionID` varchar(4) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `maincategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`results_mainID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results_categories`
--

LOCK TABLES `results_categories` WRITE;
/*!40000 ALTER TABLE `results_categories` DISABLE KEYS */;
INSERT INTO `results_categories` VALUES (1,'ACHI',80,'Achievement-striving','#804000','People with a high performance aspiration pursue their goals stubbornly. Your demands are high. They work hard to achieve the goals. Aspiration and determination are typical characteristics. People with low scores may not have a clear future perspective, but are often satisfied with a lower level of performance.','You pursue your ambitious goals and requirements with great dedication. You usually act purposefully and ambitiously.','CON',9,1),(1,'ACTI',35,'Activity Level','#ff1a1a','The activity level describes how fast a person becomes active in different situations. It is also a sign of how active a person is in general. A high level of activity speaks for a predominantly high activity. The lives of these people are very time-filled, they are often characterized by energetic and quick action. People with low scores are more calm and take time to relax. But this does not speak for clumsiness or lack of purpose. Rather, the lives of these people is less busy.','It is important for you to find times of rest and relaxation. You don\'t have to be busy all the time.','EXT',2,-1),(1,'ADVE',62,'Adventurousness','#ffd11a','The heightened need and willingness to try out new activities and behaviors are called adventurous. It generally describes the desire to try new things. The variety is preferred to the routine and the old familiar. People with a low thirst for adventure prefer to stick to the tried and tested action patterns. They are not constantly looking for new challenges.','You can face new challenges, but you are not always looking for things to replace the old.','OPE',6,1),(1,'ARTI',38,'Artistic Interests','#ffd633','People with artistic interests are emotionally moved by the beauty of art and nature. They are open to aesthetics and are often interested in music, painting or poetry. People with low values place their interests differently.','Your interests are less in the artistic field. But you\'re interested in other things.','OPE',3,-1),(1,'ASSE',32,'Assertiveness','#ff3333','The ability to prevail against others even in difficult conditions or in a challenging situation is called assertiveness. This requires professional, communicative and possibly psychological skills. People with high assertiveness often have managerial positions, are confident and superior. Low scores are typical of people who tend to stay in the background and develop their strengths there.','You like to act in the background and develop your strengths there.','EXT',1,-1),(1,'CAUT',55,'Cautiousness','#994d00','With caution, the ability of people to assess the consequences of an action and to act accordingly. People with high values are often gentle in their actions. They think before they act. People with low scores are often characterized by being able to act spontaneously and quickly.','You are aware that your actions have consequences. You think about how you act, but are also often spontaneous in your actions.','CON',5,1),(1,'CHEE',38,'Cheerfulness','#ff4d4d','Happiness is the ability to share and express positive emotions and humor with the environment. People with high scores look happy and cheerful and are more optimistic about their environment. They often smile and laugh easily. Low values indicate less exuberance. These people are not less happy, but do not express the emotions to a high degree.','You prefer to show your humour and cheerfulness in a small circle and well dosed.','EXT',3,-1),(1,'DUTI',65,'Dutifulness','#b35900','A high level of reliability and a pronounced sense of duty characterize people with a high sense of duty. These people are careful to fulfill their obligations and abide by their principles. Low values are evidence of a great serenity in dealing with duties and obligations.','You have a very strong interest in fulfilling your duties and adhering to principles.','CON',7,1),(1,'EMOT',72,'Sensitivity','#ffdb4d','Delicacy describes the ability to perceive the emotions of oneself and others more clearly than others. Emotions are a significant aspect of life. Sensations such as happiness or unhappiness are experienced more intensively. People with low values give their emotions less meaning. They are less sensitive to emotional extremes.','You are characterized by the ability to intensively perceive the feelings of others. You will also experience your own emotional world in a lasting way.','OPE',8,1);
/*!40000 ALTER TABLE `results_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results_dimensions`
--

DROP TABLE IF EXISTS `results_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results_dimensions` (
  `results_mainID` int(11) NOT NULL,
  `dimensionID` varchar(4) NOT NULL,
  `value` int(11) NOT NULL,
  `dimensiontext` varchar(4000) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `definition` varchar(4000) DEFAULT NULL,
  `resulttext` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`results_mainID`,`dimensionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results_dimensions`
--

LOCK TABLES `results_dimensions` WRITE;
/*!40000 ALTER TABLE `results_dimensions` DISABLE KEYS */;
INSERT INTO `results_dimensions` VALUES (1,'CON',67,'Conscientiousness','#663300','Conscientiousness is a characteristic of determination, self-control and effectiveness. It describes the degree of reliability in dealing with duties and tasks assigned. Also characteristic is the degree of self-organization. Organized persons with a high value act, show ambition and high degree of care. Obstacles are purposefully overcome. People with low values allow themselves more freedom and pursue their goals with more composure. They show a degree of carefreeness and carelessness and do not lose themselves in details.','You have high values in the dimension of conscientiousness, i.e. you have a high degree of self-control and act purposefully and effectively. You complete your tasks carefully and reliably.'),(1,'EXT',35,'Extraversion','#ff0000','The way humans interact with the environment characterizes the personality trait Extraversion. Extraverted people have an outward-looking attitude, feel comfortable in the company of people, and behave confidently and confidently in groups and gatherings. People with low values gain their strength from within. They like to be alone and independent and prefer working in small groups. A human is not either extroverted or introverted. Rather, the expression between the two poles can be described.','You have low values in the dimension of extraversion, i.e. you gain your strength predominantly from within.'),(1,'OPE',57,'Openness to experience','#ffcc00','Openness to experience is the willingness to make new experiences and experience them intensively. Variety and novel activities are the focus. People with high values enjoy experimenting, are curious and often have a lively imagination. Their own feelings are intensively explored and there is often a keen interest in art, music or poetry. People of low value are characterized by pragmatism. They are often practical and preserve traditional values and views.','You have medium values in the dimension of openness to experience, i.e. you do not reject new experiences in principle, but are also aware of the importance of old values and views.');
/*!40000 ALTER TABLE `results_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results_items`
--

DROP TABLE IF EXISTS `results_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results_items` (
  `results_mainID` int(11) NOT NULL,
  `itemsID` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `itemtext` varchar(4000) NOT NULL,
  PRIMARY KEY (`results_mainID`,`itemsID`),
  CONSTRAINT `fk_results_items_resultMainID` FOREIGN KEY (`results_mainID`) REFERENCES `results_main` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results_items`
--

LOCK TABLES `results_items` WRITE;
/*!40000 ALTER TABLE `results_items` DISABLE KEYS */;
INSERT INTO `results_items` VALUES (1,5,9,'I do more than what\'s expected of me.'),(1,6,8,'I work hard.'),(1,7,2,'I put little time and effort into my work.'),(1,8,5,'I do just enough work to get by.'),(1,9,7,'I am always busy.'),(1,10,1,'I am always on the go.'),(1,11,2,'I do a lot in my spare time.'),(1,12,7,'I like to take it easy.'),(1,13,9,'I prefer variety to routine.'),(1,14,2,'I prefer to stick with things that I know.'),(1,15,5,'I dislike changes.'),(1,16,10,'I am attached to conventional ways.'),(1,26,1,'I believe in the importance of art.'),(1,27,4,'I see beauty in things that others might not notice.'),(1,28,7,'I do not like poetry.'),(1,29,5,'I do not enjoy going to art museums.'),(1,30,2,'I take charge.'),(1,31,6,'I try to lead others.'),(1,32,4,'I take control of things.'),(1,33,10,'I wait for others to lead the way.'),(1,34,9,'I jump into things without thinking.'),(1,35,3,'I make rash decisions.'),(1,36,8,'I rush into things.'),(1,37,2,'I act without thinking.'),(1,38,6,'I radiate joy.'),(1,39,1,'I have a lot of fun.'),(1,40,7,'I love life.'),(1,41,1,'I look at the bright side of life.'),(1,50,4,'I keep my promises.'),(1,51,8,'I tell the truth.'),(1,52,7,'I break rules.'),(1,53,1,'I break my promises.'),(1,54,5,'I experience my emotions intensely.'),(1,55,10,'I feel others\' emotions.'),(1,56,3,'I rarely notice my emotional reactions.'),(1,57,5,'I don\'t understand people who get emotional.');
/*!40000 ALTER TABLE `results_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results_main`
--

DROP TABLE IF EXISTS `results_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results_main` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `testID` varchar(12) NOT NULL,
  `memberID` int(11) NOT NULL,
  `day` datetime DEFAULT NULL,
  `testdescription` varchar(4000) DEFAULT NULL,
  `lancode` varchar(2) NOT NULL,
  `calculated` smallint(6) DEFAULT '0',
  `foreignmemberID` int(11) DEFAULT '0',
  `IDreference` int(11) DEFAULT NULL,
  `isAverage` int(11) DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `testkey` varchar(100) DEFAULT NULL,
  `foreignemail` varchar(100) DEFAULT NULL,
  `json` varchar(4000) DEFAULT NULL,
  `crange` varchar(4000) DEFAULT NULL,
  `domain` varchar(4000) DEFAULT NULL,
  `validity` int(11) DEFAULT NULL,
  `hasForeign` smallint(6) DEFAULT NULL,
  `data` varchar(4000) DEFAULT NULL,
  `drange` varchar(4000) DEFAULT NULL,
  `foreigntests` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results_main`
--

LOCK TABLES `results_main` WRITE;
/*!40000 ALTER TABLE `results_main` DISABLE KEYS */;
INSERT INTO `results_main` VALUES (1,'TRIAL',1,'2002-11-20 18:00:00','trial version','en',1,0,NULL,0,NULL,NULL,NULL,'{\"name\": \"TOPICS\", \"children\": [{\"name\": \"Extraversion\",\"children\": [{\"name\": \"Assertiveness\", \"size\": 32},{\"name\": \"Activity Level\", \"size\": 35},{\"name\": \"Cheerfulness\", \"size\": 38}]},{\"name\": \"Conscientiousness\",\"children\": [{\"name\": \"Achievement-striving\", \"size\": 80},{\"name\": \"Cautiousness\", \"size\": 55},{\"name\": \"Dutifulness\", \"size\": 65}]},{\"name\": \"Openness to experience\",\"children\": [{\"name\": \"Adventurousness\", \"size\": 62},{\"name\": \"Artistic Interests\", \"size\": 38},{\"name\": \"Sensitivity\", \"size\": 72}]}]}','\"#ffffff\",\"#ff0000\",\"#663300\",\"#ffcc00\",\"#804000\",\"#ffd11a\",\"#ffd633\",\"#994d00\",\"#ff3333\",\"#b35900\",\"#ffdb4d\",\"#ff1a1a\",\"#ff4d4d\"','\"TOPICS\",\"Extraversion\",\"Conscientiousness\",\"Openness to experience\",\"Achievement-striving\",\"Adventurousness\",\"Artistic Interests\",\"Cautiousness\",\"Assertiveness\",\"Dutifulness\",\"Sensitivity\",\"Activity Level\",\"Cheerfulness\"',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `results_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_categories`
--

DROP TABLE IF EXISTS `test_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_categories` (
  `testID` varchar(12) NOT NULL,
  `categoryID` varchar(6) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`testID`,`categoryID`),
  KEY `FK_test_categories_categories` (`categoryID`),
  CONSTRAINT `FK_test_categories_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_test_categories_tests` FOREIGN KEY (`testID`) REFERENCES `tests` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_categories`
--

LOCK TABLES `test_categories` WRITE;
/*!40000 ALTER TABLE `test_categories` DISABLE KEYS */;
INSERT INTO `test_categories` VALUES ('TRIAL','ACHI',10),('TRIAL','ACTI',40),('TRIAL','ADVE',10),('TRIAL','ARTI',20),('TRIAL','ASSE',30),('TRIAL','CAUT',20),('TRIAL','CHEE',60),('TRIAL','DUTI',30),('TRIAL','EMOT',30);
/*!40000 ALTER TABLE `test_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_dimensions`
--

DROP TABLE IF EXISTS `test_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_dimensions` (
  `testID` varchar(12) NOT NULL,
  `dimensionID` varchar(4) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`testID`,`dimensionID`),
  KEY `FK_test_dimensions_dimensions` (`dimensionID`),
  CONSTRAINT `FK_test_dimensions_dimensions` FOREIGN KEY (`dimensionID`) REFERENCES `dimensions` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_test_dimensions_tests` FOREIGN KEY (`testID`) REFERENCES `tests` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_dimensions`
--

LOCK TABLES `test_dimensions` WRITE;
/*!40000 ALTER TABLE `test_dimensions` DISABLE KEYS */;
INSERT INTO `test_dimensions` VALUES ('TRIAL','CON',20),('TRIAL','EXT',10),('TRIAL','OPE',30);
/*!40000 ALTER TABLE `test_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `ID` varchar(12) NOT NULL,
  `textID` int(11) NOT NULL,
  `hasDimensions` smallint(6) NOT NULL DEFAULT '0',
  `isTrial` smallint(6) NOT NULL,
  `hasForeign` smallint(6) DEFAULT NULL,
  `textIDdesc` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES ('TRIAL',501,1,1,0,577);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `lancode` varchar(2) NOT NULL,
  `text` varchar(4000) DEFAULT NULL,
  `textID` int(11) NOT NULL,
  PRIMARY KEY (`lancode`,`textID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES ('de','Ich werde leicht zornig.',1),('de','Ich bin schnell irritiert.',2),('de','Ich bin nicht so leicht verärgert.',4),('de','Zorn',5),('de','Persönlichkeitsstudie',6),('de','Extraversion',7),('de','Emotionale Labilität',8),('de','Gewissenhaftigkeit',9),('de','Verträglichkeit',10),('de','Offenheit für Erfahrungen',11),('de','Leistungsstreben',12),('de','Aktivitätslevel',13),('de','Abenteuerlust',14),('de','Altruismus',15),('de','Angst',16),('de','Künstlerische Interessen',17),('de','Durchsetzungsvermögen',18),('de','Vorsicht',19),('de','Fröhlichkeit',20),('de','Entgegenkommen',21),('de','Depression',22),('de','Pflichtbewusstsein',23),('de','Feinfühligkeit',24),('de','Erlebnishunger',25),('de','Freundlichkeit',26),('de','Geselligkeit',27),('de','Phantasie',28),('de','Unmäßigkeit',29),('de','Interessenvielfalt',30),('de','Liberalismus',31),('de','Bescheidenheit',32),('de','Geradlinigkeit',33),('de','Ordentlichkeit',34),('de','Befangenheit',35),('de','Selbstdisziplin',36),('de','Kompetenz',37),('de','Mitgefühl',38),('de','Vertrauen',39),('de','Verletzlichkeit',40),('de','Test',41),('de','Ich tue mehr als von mir erwartet wird.',42),('de','Ich arbeite hart.',43),('de','Ich investiere wenig Zeit und Aufwand in meine Arbeit.',44),('de','Ich arbeite gerade genug, um über die Runden zu kommen.',45),('de','Ich bin immer beschäftigt.',46),('de','Ich bin immer auf dem Sprung.',47),('de','Ich bin in meiner Freizeit viel beschäftigt.',48),('de','Ich nehme das Leben gerne leicht.',49),('de','Ich ziehe Abwechselung der Routine vor.',50),('de','Ich halte mich lieber an Dinge, die ich kenne.',51),('de','Ich mag keine Veränderungen.',52),('de','Ich mag Herkömmliches.',53),('de','Ich sorge mich um andere.',54),('de','Ich liebe es anderen zu helfen.',55),('de','Ich bin gleichgültig, wenn es um die Gefühle anderer geht.',56),('de','Ich nehme mir keine Zeit für andere.',57),('de','Ich verliere die Fassung.',58),('de','Ich mache mir Sorgen.',59),('de','Ich befürchte das Schlimmste.',60),('de','Ich fürchte mich vor vielen Dingen.',61),('de','Ich gerate leicht in Stress.',62),('de','Ich glaube an die Bedeutung der Kunst.',63),('de','Ich sehe das Schöne in Dingen, von denen andere keine Notiz nehmen.',64),('de','Ich mag keine Poesie.',65),('de','Ich gehe nicht gerne ins Kunstmuseum.',66),('de','Ich übernehme die Führung.',67),('de','Ich versuche, andere zu führen.',68),('de','Ich habe die Dinge unter Kontrolle.',69),('de','Ich warte darauf, dass andere die Richtung vorgeben.',70),('de','Ich stürze mich ohne zu überlegen in Aktionen.',71),('de','Ich treffe schnelle Entscheidungen.',72),('de','Ich stürze mich in die Dinge hinein.',73),('de','Ich handle ohne zu Denken.',74),('de','Ich strahle Freude aus.',75),('de','Ich habe eine Menge Spaß.',76),('de','Ich liebe das Leben.',77),('de','Ich schaue auf die Sonnenseite des Lebens.',78),('de','Ich liebe eine gute Auseinandersetzung.',79),('de','Ich schreie Leute an.',80),('de','Ich beleidige Leute.',81),('de','Ich zahle anderen etwas heim.',82),('de','Ich fühle mich oft deprimiert.',83),('de','Ich mag mich selbst nicht.',84),('de','Ich falle oft in ein Loch.',85),('de','Ich bin mit mir selbst zufrieden.',86),('de','Ich halte meine Versprechen.',87),('de','Ich sage die Wahrheit.',88),('de','Ich breche Regeln.',89),('de','Ich breche meine Versprechen.',90),('de','Ich erlebe meine Gefühle intensiv.',91),('de','Ich kann die Gefühle anderer nachempfinden.',92),('de','Ich bemerke selten meine emotionalen Reaktionen.',93),('de','Ich verstehe Menschen nicht, die emotional werden.',94),('de','Ich liebe Aufregungen.',95),('de','Ich suche Abenteuer.',96),('de','Ich bin gerne draufgängerisch.',97),('de','Ich handle wild und verrückt.',98),('de','Ich schließe leicht neue Freundschaften.',99),('de','Ich fühle mich in Gesellschaft wohl.',100),('de','Ich vermeide den Kontakt mit anderen.',101),('de','Ich halte andere auf Abstand.',102),('de','Ich liebe große Partys.',103),('de','Ich spreche auf einer Party mit vielen verschiedenen Personen.',104),('de','Ich ziehe es vor, allein zu sein.',105),('de','Ich vermeide große Menschenansammlungen.',106),('de','Ich habe eine lebhafte Phantasie.',107),('de','Ich genieße es, wenn meine Phantasie Flügel bekommt.',108),('de','Ich liebe Tagträume.',109),('de','Ich liebe es, mich in Gedanken zu verlieren.',110),('de','Ich nehme an ausschweifenden Partys teil.',111),('de','Ich kenne mein Maß.',112),('de','Ich kann Versuchungen leicht widerstehen.',113),('de','Ich kontrolliere mein Verlangen.',114),('de','Ich lese gerne anspruchvolle Literatur.',115),('de','Ich vermeide intellektuelle Diskussionen.',116),('de','Ich habe Schwierigkeiten, abstrakte Ideen zu verstehen.',117),('de','Ich habe kein Interesse an theoretischen Diskussionen.',118),('de','Ich neige dazu, für politisch liberale Kandidaten zu stimmen.',119),('de','Ich glaube, dass es kein unbeschränktes Falsch und Richtg gibt.',120),('de','Ich neige dazu, für politisch konservative Kandidaten zu stimmen.',121),('de','Ich glaube, dass wir auf Verbrechen hart reagieren sollten.',122),('de','Ich glaube, dass ich besser bin als andere.',123),('de','Ich halte von mir selbst sehr viel.',124),('de','Ich habe von mir selbst eine hohe Meinung.',125),('de','Ich rühme mich meiner Tugenden.',126),('de','Ich benutze andere für meine eigenen Zwecke.',127),('de','Ich betrüge, um vorwärts zu kommen.',128),('de','Ich nutze andere aus.',129),('de','Ich behindere die Pläne anderer.',130),('de','Ich räume gerne auf.',131),('de','Ich vergesse oft Dinge an ihren Platz zurückzulegen.',132),('de','Ich hinterlasse Unordnung in meinem Zimmer.',133),('de','Ich lasse meine Dinge rumliegen.',134),('de','Ich finde es schwierig andere anzusprechen.',135),('de','Ich befürchte die Aufmerksamkeit auf mich zu ziehen.',136),('de','Ich fühle mich nur unter Freunden wohl.',137),('de','Ich lasse mich nicht von schwierigen sozialen Situationen stören.',138),('de','Ich bin immer vorbereitet.',139),('de','Ich setze meine Pläne um.',140),('de','Ich verschwende meine Zeit.',141),('de','Ich habe Schwierigkeiten, Aufgaben zu beginnen.',142),('de','Ich erledige meine Aufgaben erfolgreich.',143),('de','Ich zeichne mich aus, durch das was ich tue.',144),('de','Ich erledige meine Aufgaben präzise.',145),('de','Ich weiß, wie man die Dinge erledigt.',146),('de','Ich fühle mit den Obdachlosen.',147),('de','Ich habe Mitgefühl für die, die schlechter dran sind als ich.',148),('de','Ich bin nicht an den Problemen anderer interessiert.',149),('de','Ich versuche, nicht über Benachteiligte nachzudenken.',150),('de','Ich habe schon einmal Dinge getan, die besser nicht öffentlich werden.',151),('de','Ich habe schon mal über andere schlecht gedacht.',152),('de','Ich habe schon mal etwas nicht gleich zurückgegeben.',153),('de','Ich habe schon mal etwas weitererzählt, was ich nicht hätte sollen.',154),('de','Ich vertraue anderen.',155),('de','Ich glaube an die guten Absichten anderer.',156),('de','Ich vertraue auf das, was andere sagen.',157),('de','Ich vertraue den Leuten nicht.',158),('de','Ich gerate leicht in Panik.',159),('de','Ich werde von Geschehnissen überwältigt.',160),('de','Ich habe das Gefühl, mit den Dingen nicht klar zu kommen.',161),('de','Ich bleibe unter Druck gelassen.',162),('de','Sie weisen in der Dimension Extraversion sehr hohe Werte auf, d.h. Sie besitzen eine stark nach außen gewandte Haltung.',163),('de','Sie weisen in der Dimension Extraversion hohe Werte auf, d.h. Sie besitzen eine nach außen gewandte Haltung.',164),('de','Sie weisen in der Dimension Extraversion mittlere Werte auf, d.h. Sie haben weder eine ausschließlich nach außen gewandte Haltung, noch sind Sie in großen Teilen nur auf sich selbst bezogen.',165),('de','Sie weisen in der Dimension Extraversion niedrige Werte auf, d.h. Sie gewinnen ihre Stärke überwiegend aus innen heraus.',166),('de','Sie weisen in der Dimension Extraversion sehr niedrige Werte auf, d.h. Sie sind gerne allein und besinnen sich auf die eigenen Stärken.',167),('de','Sie weisen in der Dimension emotionale Labilität sehr hohe Werte auf, d.h. dass Sie auf Herausforderungen jeglicher Art sehr gefühlsbetont reagieren.',168),('de','Sie weisen in der Dimension emotionale Labilität hohe Werte auf, d.h. Herausforderungen begegnen Sie mit intensiven Gefühlen. Sie sind in der Lage zu empathischen Reaktionen.',169),('de','Sie weisen in der Dimension emotionale Labilität mittlere Werte auf, d.h. Sie können schwierige Situationen meistern, sind dabei aber nicht frei vom Hang zur Sorge und Unruhe.',170),('de','Sie weisen in der Dimension emotionale Labilität niedrige Werte auf, d.h. Sie sind überwiegend ausgeglichen, ruhig, ohne Sorgen und beständig in schwierigen Situationen.',171),('de','Sie weisen in der Dimension emotionale Labilität sehr niedrige Werte auf, d.h. ihre Ausgeglichenheit, Ruhe und Sorglosigkeit besticht selbst in schwierigen Situationen.',172),('de','Sie weisen in der Dimension Verträglichkeit sehr hohe Werte auf, d.h. Sie sind im Umgang mit anderen ausgesprochen hilfsbereit, zeichnen sich durch Mitgefühl und den ausgeprägten Willen zur Kooperation aus.',173),('de','Sie weisen in der Dimension Verträglichkeit hohe Werte auf, d.h. ihr positives Menschenbild bestimmt Ihren Umgang mit anderen. Dieser ist meist von Kooperation und Hilfsbereitschaft geprägt.',174),('de','Sie weisen in der Dimension Verträglichkeit mittlere Werte auf, d.h. Sie haben eine positive Prägung im Umgang mit anderen, schaffen es aber auch, sich in Konkurrenzsituationen davon zu lösen, wenn es die Situation erfordert.',175),('de','Sie weisen in der Dimension Verträglichkeit niedrige Werte auf, d.h. Sie sind durchaus in der Lage, die eigenen Interessen konsequent zu verfolgen und sich gegen Konkurrenz durchzusetzen.',176),('de','Sie weisen in der Dimension Verträglichkeit sehr niedrige Werte auf, d.h. Sie zeichnen sich durch die Fähigkeit aus, die eigenen Interessen in den Vordergrund zu stellen. Sie können sich der Konkurrenz stellen.',177),('de','Sie weisen in der Dimension Gewissenhaftigkeit sehr hohe Werte auf, d.h. Sie sind ein ausgesprochen selbstkontrollierter, zielstrebiger und effektiv handelnder Mensch. Kennzeichnend sind zudem ihr hoher Ehrgeiz und die Sorgfalt, mit der Sie die Ihnen anvertrauten Aufgaben bearbeiten.',178),('de','Sie weisen in der Dimension Gewissenhaftigkeit hohe Werte auf, d.h. Sie haben ein hohes Maß an Selbstkontrolle und agieren zielstrebig und effektiv. Ihre Aufgaben erledigen Sie sorgfältig und zuverlässig.',179),('de','Sie weisen in der Dimension Gewissenhaftigkeit mittlere Werte auf, d.h. Sie sind in der Lage, selbstkontrolliert Ihre Aufgaben zuverlässig zu erledigen. Sie erlauben sich aber auch einen gewissen Freiraum und verbeißen sich nicht in ihre Pflichten.',180),('de','Sie weisen in der Dimension Gewissenhaftigkeit niedrige Werte auf, d.h. Sie gehen Ihre Aufgaben unbekümmert und sorglos an. Eine gewisse innere Gelassenheit prägt Ihr Handeln.',181),('de','Sie weisen in der Dimension Gewissenhaftigkeit sehr niedrige Werte auf, d.h. Sie erlauben sich viele Freiheiten und handeln unbekümmert und mit einer großen Gelassenheit.',182),('de','Sie weisen in der Dimension Offenheit für Erfahrungen sehr hohe Werte auf, d.h. Sie suchen nach neuen Erfahrungen und sind dabei äußerst experimentierfreudig. Ihnen liegt sehr viel an abwechslungsreichen Tätigkeiten.',183),('de','Sie weisen in der Dimension Offenheit für Erfahrungen hohe Werte auf, d.h. Sie machen gerne neue Erfahrungen, sind bereit zu experimentieren und ziehen Abwechslung der Routine vor.',184),('de','Sie weisen in der Dimension Offenheit für Erfahrungen mittlere Werte auf, d.h. Sie lehnen neue Erfahrungen nicht grundsätzlich ab, sind sich aber auch der Bedeutung alter Werte und Ansichten bewusst.',185),('de','Sie weisen in der Dimension Offenheit für Erfahrungen niedrige Werte auf, d.h. Sie halten ehr an Tradition und alten Werten fest, anstatt sich für neue Erfahrungen zu öffnen.',186),('de','Sie weisen in der Dimension Offenheit für Erfahrungen sehr niedrige Werte auf, d.h. Traditionen und alte Werte sind Ihnen äußerst wichtig. Sie verzichten darauf, unbedingt neue Erfahrungen machen zu müssen.',187),('de','Sie sind ein überaus herzlicher, offener und kontaktfreudiger Mensch. Sie zeigen ihre Zuneigung zu anderen Personen und sind jederzeit offen für neue Freundschaften.',188),('de','Sie zeichnen sich durch die Fähigkeit aus, Zuneigung zu zeigen und durch ihre Herzlichkeit und Kontaktfreudigkeit auch neue Freundschaften einzugehen.',189),('de','Sie zeigen Ihre Zuneigung zu anderen Menschen, wenn Sie es für erforderlich halten. Sie können sich aber auch im Umgang mit Ihrer Umwelt in Zurückhaltung üben.',190),('de','Es gelingt Ihnen, gegenüber anderen Zurückhaltung zu üben. Sie fühlen sich in kleinen Gruppen wohler als in großen Gesellschaften.',191),('de','Sie sind ein sehr zurückhaltender Mensch, der gut allein sein kann. Sie sind nicht darauf aus, ständig neue Bekanntschaften zu machen.',192),('de','Sie lieben es, Zeit in geselliger Runde zu verbringen. Sie mögen eine unbeschwerte Atmosphäre und unverbindliche Kontakte.',193),('de','Sie zeigen die Bereitschaft, gerne Zeit mit anderen Menschen zu verbringen. Sie mögen gesellige Runden.',194),('de','Es stört Sie nicht sonderlich, allein zu sein. Sie verbringen auch Zeit mit anderen, ohne gesteigerten Wert auf unverbindliche Kontakte zu legen.',195),('de','Sie können gut allein sein und ohne Gesellschaft aus sich heraus agieren. Kleine Arbeitsgruppen kommen Ihnen entgegen.',196),('de','Es liegt Ihnen nichts an unverbindlicher Geselligkeit. Sie sind lieber für sich. ',197),('de','Ihre Selbstsicherheit sowie Ihre hohe kommunikative und fachliche Kompetenz führen dazu, dass Sie sich selbst in schwierigen Situationen durchsetzen. Sie haben die Fähigkeit, Leitungsaufgaben zu übernehmen.',198),('de','Es gelingt Ihnen überwiegend,  sich auch in schwierigen Situationen gegen andere durchzusetzen. Dabei kommen Ihnen ihre fachlichen und kommunikativen Fähigkeiten zugute.',199),('de','Wenn die Situation es erfordert, sind Sie in der Lage, sich gegenüber anderen durchzusetzen. Es liegt Ihnen aber eher, diese Situationen wenn möglich zu meiden.',200),('de','Sie handeln gerne im Hintergrund und entwickeln dort im besonderen Maße Ihre Stärken.',201),('de','Sie meiden die Konfrontation. Es macht Ihnen nichts aus, anderen die Entscheidungen zu überlassen.',202),('de','Sie sind überaus aktiv und können energisch und schnell reagieren. Sie sind stets beschäftigt, Müßiggang ist Ihnen vollkommen fremd.',203),('de','Sie werden schnell aktiv und halten meistens einen hohen Grad an Aktivität aufrecht.',204),('de','Sie haben für sich ein Gleichgewicht zwischen ständiger Geschäftigkeit und Ruhe und Entspannung gefunden.',205),('de','Es ist Ihnen wichtig, Zeiten der Ruhe und Entspannung zu finden. Sie müssen nicht permanent geschäftig sein.',206),('de','Sie lehnen ständige Geschäftigkeit ab. Vielmehr suchen Sie die Ruhe und Entspannung, ohne dabei Ziele aus den Augen zu verlieren.',207),('de','Sie zeigen eine sehr hohe Bereitschaft, Risiken einzugehen und suchen nach neuen Herausforderungen.',208),('de','Sie sind durchaus bereit, Risiken einzugehen und neue Reize zu setzen.',209),('de','Sie vermeiden nach Möglichkeit Risiken, sind im Zweifelsfalle aber durchaus in der Lage neue Herausforderungen anzunehmen.',210),('de','Sie haben geringes Interesse an nervenaufreibenden Situationen und meiden unbekanntes Terrain.',211),('de','Sie vermeiden Risiken. Sie haben keinerlei Interesse an Nervenkitzel oder Abenteuern. ',212),('de','Sie sind ein ausgesprochen fröhlicher Mensch der seinen Humor und seine positive Einstellung gerne mit der Umwelt teilt.',213),('de','Sie besitzen die Fähigkeit, ihren Humor zu zeigen und positive Emotionen mit der Umwelt zu teilen. Sie sind meist vergnügt und wirken auf Ihr Umfeld meist optimistisch.',214),('de','Sie können humorvoll sein und positive Emotionen zeigen, müssen dies aber nicht bei jeder Gelegenheit unter Beweis stellen.',215),('de','Sie zeigen Ihren Humor und Ihre Fröhlichkeit lieber im kleinen Kreis und wohl dosiert.',216),('de','Ausgelassenheit und zur Schau getragene Emotionalität sind Ihnen vollkommen unbekannt.',217),('de','Ihre Ruhe und Sorglosigkeit lassen keinen Raum für Ängstlichkeit. Sie sind davon überzeugt, dass sich die Dinge zum positiven entwickeln.',218),('de','Sie machen sich selten Sorgen, dass die Dinge schief gehen könnten. Angstgefühle sind Ihnen fremd, Sie sind in den meisten Situationen ruhig und entspannt.',219),('de','Den meisten Herausforderungen begegnen Sie ruhig und gelassen. Manche Dinge können Ihnen Sorgen bereiten, ohne dass Sie sich in Ängstlichkeit verlieren.',220),('de','Sie erleben ihre Gefühle in schwierigen Situationen intensiv. Sie schieben die Sorgen nicht einfach beiseite, sondern setzen sich mit ihnen auseinander.',221),('de','Sie machen sich intensiv Gedanken darüber, wie Sie die Herausforderungen zu einem guten Ende führen können.',222),('de','Sie lassen sich selbst durch provokantes Verhalten nicht reizen und reagieren niemals zornig.',223),('de','Sie sind nicht leicht reizbar. Provokationen führen bei Ihnen nicht zu Reaktionen auf gleichem Niveau.',224),('de','Sie sind in gewissen Situationen durchaus reizbar, haben die Gefühle von Ärger und Frustration aber überwiegend im Griff.',225),('de','Sie reagieren stark darauf, wenn Sie in bestimmten Situationen herausgefordert werden. Sie  zeigen selten eine gleichgültige Haltung.',226),('de','Negative äußere Einflüsse werden für Sie zu einer Herausforderung. Gleichgültigkeit gegenüber den äußeren Einflüssen ist Ihnen vollkommen fremd.',227),('de','Sie sind jederzeit in der Lage, mit negativen Einflüssen umzugehen. Ihre positive Grundeinstellung führt dazu, dass Sie auch mit negativen Gefühlen gut umgehen können.',228),('de','Schuldgefühle, Trauer oder andere negative Gefühle haben nur geringen Einfluss auf Ihre positive Einstellung.',229),('de','Sie neigen dazu, negative Gefühle ihre im Grunde positive Grundhaltung überschatten zu lassen. Meistens gelingt es Ihnen aber, mit diesen Gefühlen umzugehen.',230),('de','Ihre Fähigkeit zu emphatischen Gefühlen zeichnet Sie aus. Oftmals lassen Sie die Probleme aber zu sehr an sich heran, so dass diese Ihnen zu groß werden.',231),('de','Sie besitzen eine hohe Empfindsamkeit für belastende Gefühle wie Trauer oder Schuldgefühle.',232),('de','Kritik an Ihrer Person macht Ihnen nichts aus. Sie finden jederzeit einen Weg, darauf zu reagieren und für sich passende Antworten zu finden.',233),('de','Sie können mit Kritik gut umgehen. Sie sind gegen Angriffe auf Ihre Persönlichkeit gut gewappnet.',234),('de','Sie nehmen sich der Kritik anderer an, können aber meist gut damit umgehen. Angriffe auf Ihre Person bringen Sie zum Nachdenken über sich selbst.',235),('de','Sie sind im Umgang mit anderen Menschen eher zurückhaltend. Sie fühlen sich im kleinen Kreis bekannter Personen wohler.',236),('de','Ihre zurückhaltende Art prägt Sie. Sie vermeiden es stets, im Mittelpunkt des Interesses zu stehen.',237),('de','Versuchungen unterschiedlicher Art können Sie nicht locken. Sie widerstehen dem kurzfristigen Verlangen.',238),('de','Es gelingt Ihnen überwiegend, Versuchungen zu widerstehen. Sie wissen um die eigene Stärke, dem kurzfristigen Verlangen nicht nachzugeben.',239),('de','Ab und an geben Sie Versuchungen nach, auch wenn Sie wissen, dass Sie dies evtl. bereuen werden. Es gelingt Ihnen aber ebenso, Stärke zu zeigen und Verlockungen zu widerstehen.',240),('de','Sie erkennen, wann Sie gewisse Dinge übertrieben haben und sind in der Lage, dies zu bereuen.',241),('de','Versuchungen und kurzfristiges Verlangen fordern Sie heraus. Sie arbeiten an Strategien, damit umzugehen.',242),('de','Stress und andere schwierige Situationen können Ihnen in keiner Weise zusetzen. Sie haben selbst dann Ihre Gefühle im Griff.',243),('de','Es gelingt Ihnen überwiegend, auch in schwierigen Situationen, Ihre Gefühle zu beherrschen. Sie können mit schwierigen Situationen und Stress umgehen.',244),('de','Sie haben grundsätzlich die Fähigkeit, mit Stresssituationen umzugehen. Ihre Gefühle in schwierigen Situationen beschäftigen Sie, Sie können diese nicht gänzlich ausblenden.',245),('de','In schwierigen Situationen erleben Sie sehr stark die eigenen Gefühle und können Verletzungen erkennen. Sie versuchen, sich über die eigene Situation im Klaren zu werden, bevor Sie reagieren.',246),('de','Sie reagieren mit intensiven Gefühlen auf Stress und schwierige Situationen. Dies wird Ihnen zu einer starken Herausforderung.',247),('de','Sie sind grundsätzlich der Überzeugung, dass andere Menschen ehrlich sind und gute Absichten verfolgen.',248),('de','Sie gehen in den meisten Situationen davon aus, dass andere Menschen es ehrlich meinen und grundsätzlich gute Vorsätze und Absichten verfolgen.',249),('de','Sie gehen nicht davon aus, dass andere Menschen ausschließlich gute Absichten verfolgen. Sie sind bei ihrer Einschätzung anderer eher vorsichtig aber auch nicht grundsätzlich skeptisch.',250),('de','Anderen Menschen werden nicht von vornherein gute Absichten unterstellt. Sie haben gegenüber der Ehrlichkeit anderer eine gewisse Skepsis und Zurückhaltung.',251),('de','Sie neigen in keiner Weise dazu, anderen Menschen von vornherein blind zu vertrauen. Vielmehr hinterfragen Sie deren Motivation und Absichten.',252),('de','Ihr Umgang mit anderen Menschen ist durchweg gekennzeichnet von Offenherzigkeit und Aufrichtigkeit. Es käme Ihnen nie in den Sinn, andere Personen zu beeinflussen, weder offen noch verdeckt.',253),('de','Sie sind im Umgang mit ihrem Umfeld meist aufrichtig und offenherzig. Es liegt Ihnen vollkommen fern, andere Menschen zu manipulieren.',254),('de','Sie sind an einem offenen und ehrlichen Umgang mit anderen interessiert, können aber auch in gewissem Maße für die eigenen Zwecke andere Menschen beeinflussen.',255),('de','Es gelingt Ihnen in vielen Situationen, Einfluss auf andere Menschen zu nehmen und diese für Ihre eigenen Zwecke zu beeinflussen.',256),('de','Sie haben eine ausgeprägte Fähigkeit, andere Menschen für Ihre Ziele und Absichten einzubinden.',257),('de','Ihre selbstlose Hilfsbereitschaft steht anderen Menschen jederzeit zur Verfügung. Sie erwarten dafür keinerlei Gegenleistung.',258),('de','Sie haben eine hohe Hilfsbereitschaft und setzen sich häufig selbstlos für andere Menschen ein, ohne dabei auf den eigenen Vorteil zu achten.',259),('de','Die Probleme anderer sind Ihnen nicht gleichgültig. Sie erkennen aber, wann eine Hilfestellung Ihre eigenen Kräfte und Möglichkeiten übersteigt.',260),('de','Es gelingt Ihnen meist, gegenüber anderen Menschen die Distanz zu wahren. Es liegt Ihnen fern, sich in die Probleme anderer hineinzusteigern.',261),('de','Sie lassen sich nicht von den Problemen anderer dazu verleiten, Ihre eigenen Interessen hintenanzustellen.',262),('de','Sie machen immer den Schritt auf den anderen zu und stellen die eigenen Ansichten hinten an.',263),('de','Sie zeichnen sich durch die Fähigkeit aus, in Konfliktsituationen nachzugeben. Eigener Ärger wird erfolgreich unterdrückt.',264),('de','Sie sind zu Kompromissen bereit. Dabei geben Sie Ihren eigenen Standpunkt nicht bedingungslos auf, gehen aber auf andere Ansichten ein.',265),('de','Sie gehen Konflikten und Konfrontationen nicht aus dem Weg. Sie geben Ihren Standpunkt nicht unbedingt preis.',266),('de','Sie stellen sich der Auseinandersetzung und verteidigen die eigenen Ansichten vehement.',267),('de','Sie stellen Ihre Fähigkeiten und Begabungen niemals zur Schau. Sie sind stets darauf bedacht, dass Ihre positiven Eigenschaften niemals in den Mittelpunkt gerückt werden.',268),('de','Es ist Ihnen nicht wichtig, Ihre eigenen Fähigkeiten, Ihr Können, Ihren Einfluss und Ihren Besitz zur Schau zu tragen. Vielmehr vermeiden sie es lieber, diese Dinge zu thematisieren.',269),('de','Sie sind sich Ihrer Stärken bewusst und setzen diese auch ein, ohne prahlerisch zu werden.',270),('de','Sie wissen um Ihre Fähigkeiten und scheuen sich nicht, diese offen zu zeigen.',271),('de','Es ist Ihnen wichtig, dass Ihr Können und Ihre Talente bemerkt und beachtet werden. Sie verheimlichen niemals Ihre Begabungen.',272),('de','Sie haben ein ausgeprägtes Gespür für die Gefühle Ihrer Mitmenschen und sind in der Lage, deren Befindlichkeit wahrzunehmen und zu teilen.',273),('de','Die Bedürfnisse und Befindlichkeiten anderer Menschen sind Ihnen nicht unwichtig. Sie nehmen diese wahr und gehen in besonderem Maße darauf ein.',274),('de','Sie erkennen die Gemütszustände anderer und können darauf adäquat reagieren, ohne die eigene Befindlichkeit aus dem Blick zu verlieren.',275),('de','Sie lassen im Umgang mit Anderen von Ihrem Verstand leiten, auch wenn diese schwierige Situationen bewältigen müssen.',276),('de','Sie wahren den Abstand zur Gefühlswelt Ihres Gegenübers und schätzen sich selbst als rational und logisch handelnd ein.',277),('de','Sie erledigen Ihre Arbeit zielstrebig und effektiv. Sie kennen Ihre kompetenten Stärken.',278),('de','Sie sind sich Ihrer Fähigkeiten bewusst und in der Lage, übernommene Aufgaben effektiv und korrekt zu erledigen.',279),('de','Sie kennen Ihre Fähigkeiten und können diese auch zur Zielerreichung einsetzen. Manchmal trauen Sie sich zu wenig zu, Sie kennen aber auch Ihre Grenzen.',280),('de','Es gelingt Ihnen häufig, Überforderungen offen einzugestehen. Es liegt Ihnen fern, mit den eigenen Fähigkeiten zu prahlen.',281),('de','Sie stellen Ihr Können niemals in den Mittelpunkt. Häufig trauen Sie sich aber auch selbst zu wenig zu.',282),('de','Ordnung ist Ihnen in Ihrem Leben enorm wichtig. Das betrifft sowohl Ihre Umgebung als auch die Art und Weise, wie Sie arbeiten. Sie handeln organisiert und systematisch.',283),('de','Sie haben hohes Interesse an einer geordneten Umgebung und können Aufgaben meist organisiert und systematisch erledigen.',284),('de','Ordnung hat für Sie einen gewissen Stellenwert. Sie sind aber nicht daran gebunden und können auch mit spontanen Situationen umgehen.',285),('de','Sie lassen sich ihre Spontanität und ihre Fähigkeit, mit unstrukturierten Situationen umzugehen, nur selten von Ihrer Ordnungsliebe eindämmen.',286),('de','Spontanität ist Ihnen wichtiger als organisiertes Handeln. Sie können auf Unvorhergesehenes unmittelbar reagieren.',287),('de','Die Erfüllung Ihrer Pflichten ist Ihnen extrem wichtig. Ihre Prinzipien haben für Sie einen sehr hohen Stellenwert.',288),('de','Sie haben ein sehr großes Interesse daran, Ihren Pflichten nachzukommen und sich an Prinzipien zu halten.',289),('de','Sie kennen Ihre Pflichten, schaffen es aber auch, eine gewisse Unbekümmertheit im Umgang damit an den Tag zu legen.',290),('de','Sie lassen Ihr Handeln nicht von Pflichten und Prinzipien diktieren. Vielmehr pflegen Sie eine gewisse Gelassenheit und Unbekümmertheit.',291),('de','Sie sind von einer hohen Gelassenheit im Umgang mit Ihren Pflichten geprägt. Sie gehen Ihre Aufgaben unbekümmert an, Prinzipien spielen dabei eine untergeordnete Rolle.',292),('de','Ihre Zielstrebigkeit verhilft Ihnen dabei, Ihre hoch gesetzten Ziele zu erreichen. Sie haben große Ansprüche an sich selbst. Dafür arbeiten Sie hart und strebsam.',293),('de','Sie verfolgen Ihre hoch gesetzten Ziele und Ansprüche mit großem Einsatz. Sie agieren dabei meist zielstrebig und strebsam.',294),('de','Ihre selbstgesteckten Ziele sind für Sie auch erreichbar. Sie setzen sich selbst nicht zu sehr unter Druck, versuchen aber, die Ziele mit angemessenem Aufwand zu erreichen.',295),('de','Sie sind mit dem was Sie erreichen zufrieden. Ihre Ziele sind nie zu hoch gesteckt, sie sind eher genügsam und mit weniger ambitionierten Zielen unterwegs.',296),('de','Sie setzen Ihre Ziele niedrig. Es liegt Ihnen fern, sich mit zu hohen Erwartungen unter Druck zu setzen. Sie formulieren Ihre Ziele mit einer großen Genügsamkeit.',297),('de','Sie sind von hoher Willenskraft gekennzeichnet. Sie lassen sich in Ihrer Arbeit nicht ablenken und erledigen Aufgaben ohne Aufschub.',298),('de','Sie haben einen starken Willen, Ziele zu erreichen. Sie lassen sich dabei kaum ablenken. Vielmehr können Sie in Ihrer Arbeit Ablenkungen ausblenden, Aufgaben werden nicht aufgeschoben.',299),('de','Sie zeigen ein diszipliniertes Verhalten in Ihrer Arbeit, können aber auch abschalten und sich durch andere Tätigkeiten ablenken und so einen Ausgleich finden.',300),('de','Neben der Notwendigkeit, Ihre Aufgaben zu Ende zu bringen, suchen Sie gelegentlich nach Möglichkeiten der Ablenkung. Ausgleichende Tätigkeiten haben bei Ihnen einen hohen Stellenwert. ',301),('de','Sie suchen häufig nach Ablenkung und ausgleichenden Tätigkeiten neben der Bearbeitung der Ihnen anvertrauten Aufgaben.',302),('de','Sie unternehmen niemals unbedachte Handlungen. Sie prüfen die Folgen Ihres Tuns, bevor Sie handeln.',303),('de','Ihr Handeln ist von Vorsicht geprägt, d.h. sie agieren überwiegend vorausschauend und schätzen die Folgen ihres Tuns ab, bevor sie aktiv werden.',304),('de','Sie sind sich bewusst, dass ihr Handeln Folgen hat. Sie überlegen, wie Sie agieren, sind aber auch häufig spontan in Ihren Aktionen.',305),('de','Ihr Handeln zeigt einen hohen Grad an Unbekümmertheit. Sie sind in der Lage, spontan zu reagieren und schnell zu handeln, wenn die Situation es erfordert.',306),('de','Spontanes Handeln und eine schnelle Reaktion auf neue Situationen sind Ihre Stärken. Dabei überlegen Sie sich im Vorfeld nicht sämtliche Konsequenzen.',307),('de','Sie sind ein ausgesprochen phantasievoller Mensch. Ihre Vorstellungskraft ist in der Lage, ganze Innenwelten zu erschaffen.',308),('de','Sie haben eine rege Vorstellungskraft und eine lebhafte Phantasie. Damit gelingt es Ihnen, den Alltag interessanter zu machen.',309),('de','Ihre Vorstellungskraft nutzt Ihnen, sich Dinge vorstellen zu können, ohne dabei den Realitätssinn zu verlieren.',310),('de','Sie sind praktisch veranlagt und in der Lage, die Dinge realistisch zu betrachten.',311),('de','Sie betrachten Ihr Umfeld durchweg realistisch. Sie sind geprägt von einem starken Pragmatismus.',312),('de','Die Schönheit der Dinge, ob in Natur oder Künsten wie Musik, Malerei oder Dichtung, begeistern Sie.',313),('de','Sie lassen sich von der Schönheit der Natur berühren. Sie haben ggf. Interesse für Künste wie Musik, Dichtung oder Malerei.',314),('de','Die Schönheit der Natur lässt Sie nicht unberührt. Gelegentlich zeigen Sie Interesse an künstlerischen Dingen.',315),('de','Ihre Interessen liegen weniger auf künstlerischem Gebiet. Sie sind aber an anderen Dingen interessiert.',316),('de','Ihre Interessen konzentrieren sich auf andere Dinge als auf künstlerische oder ästhetische Aspekte.',317),('de','Sie nehmen die Emotionen anderer Menschen unmittelbar wahr. Auch Ihr eigenes Gefühlsleben ist jederzeit präsent.',318),('de','Sie zeichnen sich durch die Fähigkeit aus, Gefühle anderer intensiv wahrzunehmen. Zudem erleben Sie die eigene Gefühlswelt nachhaltig.',319),('de','Sie sind in der Lage, die eigenen und die Gefühle anderer zu erleben, lassen die Dinge aber nicht zu nah an sich heran.',320),('de','Sie beherrschen Ihre Gefühlswelt und sind damit kaum anfällig für emotionale Extreme.',321),('de','Ihre eigenen Gefühle sowie die anderer Menschen können Sie ausblenden und schützen sich damit selbst vor zu starker Emotionalität.',322),('de','Sie haben ein starkes Verlangen danach, neue unbekannte Dinge auszuprobieren. Abwechslung ziehen Sie der Routine vor.',323),('de','Sie lieben es, neue Aktivitäten und Handlungsweisen zu erproben. Abwechslung im Alltag ist Ihnen wichtig.',324),('de','Sie können sich neuen Herausforderungen stellen, sind aber nicht ständig auf der Suche nach Dingen, die Altbekanntes ersetzen.',325),('de','Sie ziehen die Routine und bekannte Handlungsweisen dem Neuen vor. Sie laufen nicht Gefahr, ständig neue Dinge ausprobieren zu müssen.',326),('de','Sie halten an Altbekanntem und routinierten Handlungsweisen fest. Sie suchen nicht nach neuen, unbekannten Aktivitäten.',327),('de','Sie besitzen ein sehr großes Spektrum an unterschiedlichen Interessen. Sie gehen keiner herausfordernden Diskussion aus dem Weg.',328),('de','Ihre Interessen sind vielfältig. Sie stellen sich herausfordernden Diskussionen und komplexen Fragestellungen.',329),('de','Sie haben vielerlei Interessen, können sich aber auch auf ein klar umrissenes Thema konzentrieren und beschränken.',330),('de','Sie lassen sich nicht von Ihrer Neugierde antreiben. Es gelingt Ihnen, sich auf eine klar abgegrenzte  Aufgabe zu konzentrieren.',331),('de','Sie konzentrieren sich auf ein klar umrissenes Interessensfeld. Sie müssen sich nicht zwangsweise mit jedweder Fragestellung auseinandersetzen.',332),('de','Sie hinterfragen stets bestehende Werte und Traditionen und stellen diese auf den Prüfstand.',333),('de','Sie geben sich selten mit bestehenden Traditionen und Werten zufrieden. Diese werden von Ihnen häufig hinterfragt und auf die Probe gestellt.',334),('de','Bestehende Werte und Traditionen sind Ihnen wichtig. Sie sind aber auch in der Lage, diese in bestimmten Situationen in Frage zu stellen.',335),('de','Es gelingt Ihnen, Autoritäten und Werte anzuerkennen. Sie unterliegen nicht dem Druck, diese ständig hinterfragen zu müssen.',336),('de','Sie halten an den bestehenden Werten fest und hinterfragen diese nicht. Sie pflegen eine traditionelle Sichtweise.',337),('de','Persönlichkeitsstudie Fremdeinschätzung',338),('de','Er/ sie wird leicht zornig.',339),('de','Er/ sie ist schnell irritiert.',340),('de','Er/ sie ist nicht so leicht verärgert.',342),('de','Er/ sie tut mehr als von ihm/ ihr erwartet wird.',380),('de','Er/ sie arbeitet hart.',381),('de','Er/ sie investiert wenig Zeit und Aufwand in seine/ ihre Arbeit.',382),('de','Er/ sie arbeitet gerade genug, um über die Runden zu kommen.',383),('de','Er/ sie ist immer beschäftigt.',384),('de','Er/ sie ist immer auf dem Sprung.',385),('de','Er/ sie ist in seiner/ ihrer Freizeit viel beschäftigt.',386),('de','Er/ sie nimmt das Leben gerne leicht.',387),('de','Er/ sie zieht Abwechselung der Routine vor.',388),('de','Er/ sie hält sich lieber an Dinge, die er/ sie kennt.',389),('de','Er/ sie mag keine Veränderungen.',390),('de','Er/ sie mag Herkömmliches.',391),('de','Er/ sie sorgt sich um andere.',392),('de','Er/ sie liebt es anderen zu helfen.',393),('de','Er/ sie ist gleichgültig, wenn es um die Gefühle anderer geht.',394),('de','Er/ sie nimmt sich keine Zeit für andere.',395),('de','Er/ sie verliert die Fassung.',396),('de','Er/ sie macht sich Sorgen.',397),('de','Er/ sie befürchtet das Schlimmste.',398),('de','Er/ sie fürchtet sich vor vielen Dingen.',399),('de','Er/ sie gerät leicht in Stress.',400),('de','Er/ sie glaubt an die Bedeutung der Kunst.',401),('de','Er/ sie sieht das Schöne in Dingen, von denen andere keine Notiz nehmen.',402),('de','Er/ sie mag keine Poesie.',403),('de','Er/ sie geht nicht gerne ins Kunstmuseum.',404),('de','Er/ sie übernimmt die Führung.',405),('de','Er/ sie versucht, andere zu führen.',406),('de','Er/ sie hat die Dinge unter Kontrolle.',407),('de','Er/ sie wartet darauf, dass andere die Richtung vorgeben.',408),('de','Er/ sie stürzt sich ohne zu überlegen in Aktionen.',409),('de','Er/ sie trifft schnelle Entscheidungen.',410),('de','Er/ sie stürzt sich in die Dinge hinein.',411),('de','Er/ sie handlet ohne zu Denken.',412),('de','Er/ sie strahlt Freude aus.',413),('de','Er/ sie hat eine Menge Spaß.',414),('de','Er/ sie liebt das Leben.',415),('de','Er/ sie schaut auf die Sonnenseite des Lebens.',416),('de','Er/ sie liebt eine gute Auseinandersetzung.',417),('de','Er/ sie schreit Leute an.',418),('de','Er/ sie beleidigt Leute.',419),('de','Er/ sie zahlt anderen etwas heim.',420),('de','Er/ sie fühlt sich oft deprimiert.',421),('de','Er/ sie mag sich selbst nicht.',422),('de','Er/ sie fällt oft in ein Loch.',423),('de','Er/ sie ist mit sich selbst zufrieden.',424),('de','Er/ sie hält seine Versprechen.',425),('de','Er/ sie sagt die Wahrheit.',426),('de','Er/ sie bricht Regeln.',427),('de','Er/ sie bricht seine/ ihre Versprechen.',428),('de','Er/ sie erlebt seine/ ihre Gefühle intensiv.',429),('de','Er/ sie kann die Gefühle anderer nachempfinden.',430),('de','Er/ sie bemerkt selten seine/ ihre emotionalen Reaktionen.',431),('de','Er/ sie versteht Menschen nicht, die emotional werden.',432),('de','Er/ sie liebt Aufregungen.',433),('de','Er/ sie sucht Abenteuer.',434),('de','Er/ sie ist gerne draufgängerisch.',435),('de','Er/ sie handelt wild und verrückt.',436),('de','Er/ sie schließt leicht neue Freundschaften.',437),('de','Er/ sie fühlt sich in Gesellschaft wohl.',438),('de','Er/ sie vermeidet den Kontakt mit anderen.',439),('de','Er/ sie hält andere auf Abstand.',440),('de','Er/ sie liebt große Partys.',441),('de','Er/ sie spricht auf einer Party mit vielen verschiedenen Personen.',442),('de','Er/ sie zieht es vor, allein zu sein.',443),('de','Er/ sie vermeidet große Menschenansammlungen.',444),('de','Er/ sie hat eine lebhafte Phantasie.',445),('de','Er/ sie genießt es, wenn seine/ ihre Phantasie Flügel bekommt.',446),('de','Er/ sie liebt Tagträume.',447),('de','Er/ sie liebt es, sich in Gedanken zu verlieren.',448),('de','Er/ sie nimmt an ausschweifenden Partys teil.',449),('de','Er/ sie kennt sein/ ihr Maß.',450),('de','Er/ sie kann Versuchungen leicht widerstehen.',451),('de','Er/ sie kontrolliert sein/ ihr Verlangen.',452),('de','Er/ sie liest gerne anspruchvolle Literatur.',453),('de','Er/ sie vermeidet intellektuelle Diskussionen.',454),('de','Er/ sie hat Schwierigkeiten, abstrakte Ideen zu verstehen.',455),('de','Er/ sie hat kein Interesse an theoretischen Diskussionen.',456),('de','Er/ sie neigt dazu, für politisch liberale Kandidaten zu stimmen.',457),('de','Er/ sie glaubt, dass es kein unbeschränktes Falsch und Richtg gibt.',458),('de','Er/ sie neigt dazu, für politisch konservative Kandidaten zu stimmen.',459),('de','Er/ sie glaubt, dass wir auf Verbrechen hart reagieren sollten.',460),('de','Er/ sie glaubt, dass er/ sie besser ist als andere.',461),('de','Er/ sie hält von sich selbst sehr viel.',462),('de','Er/ sie hat von sich selbst eine hohe Meinung.',463),('de','Er/ sie rühmet sich seiner/ ihrer Tugenden.',464),('de','Er/ sie benutzt andere für seine/ ihre eigenen Zwecke.',465),('de','Er/ sie betrügt, um vorwärts zu kommen.',466),('de','Er/ sie nutzt andere aus.',467),('de','Er/ sie behindert die Pläne anderer.',468),('de','Er/ sie räumt gerne auf.',469),('de','Er/ sie vergisst oft Dinge an ihren Platz zurückzulegen.',470),('de','Er/ sie hinterlässt Unordnung in seinem/ ihren Zimmer.',471),('de','Er/ sie lässt seine/ ihre Dinge rumliegen.',472),('de','Er/ sie findet es schwierig andere anzusprechen.',473),('de','Er/ sie befürchtet die Aufmerksamkeit auf sich zu ziehen.',474),('de','Er/ sie fühlt sich nur unter Freunden wohl.',475),('de','Er/ sie lässt sich nicht von schwierigen sozialen Situationen stören.',476),('de','Er/ sie ist immer vorbereitet.',477),('de','Er/ sie setzt seine/ ihre Pläne um.',478),('de','Er/ sie verschwendet seine/ ihre Zeit.',479),('de','Er/ sie hat Schwierigkeiten, Aufgaben zu beginnen.',480),('de','Er/ sie erledigt seine/ ihre Aufgaben erfolgreich.',481),('de','Er/ sie zeichnet sich aus, durch das was er/ sie tut.',482),('de','Er/ sie erledigt seine/ ihre Aufgaben präzise.',483),('de','Er/ sie weiß, wie man die Dinge erledigt.',484),('de','Er/ sie fühlt mit den Obdachlosen.',485),('de','Er/ sie hat Mitgefühl für die, die schlechter dran sind als er/ sie.',486),('de','Er/ sie ist nicht an den Problemen anderer interessiert.',487),('de','Er/ sie versucht, nicht über Benachteiligte nachzudenken.',488),('de','Er/ sie hat schon einmal Dinge getan, die besser nicht öffentlich werden.',489),('de','Er/ sie hat schon mal über andere schlecht gedacht.',490),('de','Er/ sie hat schon mal etwas nicht gleich zurückgegeben.',491),('de','Er/ sie hat schon mal etwas weitererzählt, was er/ sie nicht hätte sollen.',492),('de','Er/ sie vertraut anderen.',493),('de','Er/ sie glaubt an die guten Absichten anderer.',494),('de','Er/ sie vertraut auf das, was andere sagen.',495),('de','Er/ sie vertraut den Leuten nicht.',496),('de','Er/ sie gerät leicht in Panik.',497),('de','Er/ sie wird von Geschehnissen überwältigt.',498),('de','Er/ sie hat das Gefühl, mit den Dingen nicht klar zu kommen.',499),('de','Er/ sie bleibt unter Druck gelassen.',500),('de','Testversion',501),('de','Die Persönlichkeitseigenschaft Verträglichkeit beschreibt die Umgangsform mit anderen Menschen. Sie kennzeichnet die Art und Weise, wie eine Person mit anderen Menschen auskommt. Ein positives Menschenbild prägt einen nachsichtigen, kooperativen Umgang mit dem Gegenüber. Hilfsbereitschaft und Mitgefühl sind charakteristisch für Menschen mit hohen Werten. Niedrige Werte zeugen von der Fähigkeit, sich in Konkurrenzsituationen durchzusetzen und für die eigenen Interessen einzustehen.',502),('de','Gewissenhaftigkeit ist ein Merkmal für Zielstrebigkeit, Selbstkontrolle und Effektivität. Sie beschreibt den Grad der Zuverlässigkeit im Umgang mit Pflichten und übertragenen Aufgaben. Kennzeichnend ist zudem der Grad der Selbstorganisation. Personen mit einem hohen Wert handeln organisiert, zeigen Ehrgeiz und hohe Sorgfältigkeit. Hindernisse werden zielstrebig überwunden. Menschen mit niedrigen Werten erlauben sich selbst mehr Freiheiten und verfolgen ihre Ziele mit mehr Gelassenheit. Sie zeigen eine gewisse Unbekümmertheit und Sorglosigkeit und verlieren sich nicht in Details.',503),('de','Die Art und Weise, wie Menschen mit der Umwelt interagieren, charakterisiert die Persönlichkeitseigenschaft Extraversion. Extravertierte Menschen haben eine nach außen gewandte Haltung, fühlen sich in Gesellschaft von Menschen wohl und treten in Gruppen und Zusammenkünften sicher und selbstbewusst auf. Personen mit niedrigen Werten gewinnen ihre Kraft von innen heraus. Sie sind gerne allein und unabhängig und bevorzugen die Arbeit in kleinen Gruppen. Ein Mensch ist nicht entweder extravertiert oder introvertiert. Vielmehr lässt sich die Ausprägung zwischen den beiden Polen beschreiben.',504),('de','Emotionale Labilität beschreibt die Art und Weise, wie Gefühle und Gedanken vor allem in herausfordernden Situationen erlebt werden. Emotional stabile Menschen zeigen eine große Ausgeglichenheit und Ruhe, sind sorgenfrei und auch in schwierigen Situationen nicht aus der Ruhe zu bringen. Niedrige Werte sind ein Indiz dafür, dass die Person eher dazu neigt, sich Sorgen zu machen. Sie reagiert eher mit Betroffenheit und Traurigkeit, zeichnet sich aber durch höhere Empathie und ein intensiveres Erleben der eigenen Gefühlswelt aus.',505),('de','Offenheit für Erfahrungen bezeichnet die Bereitschaft, neue Erfahrungen zu machen und diese intensiv zu erleben. Abwechslung und neuartige Aktivitäten stehen dabei im Fokus. Menschen mit hohen Werten haben Freude am Experimentieren, sind neugierig und haben häufig ein lebendiges Vorstellungsvermögen. Die eigenen Gefühle werden intensiv ergründet und es herrscht oft ein reges Interesse an Kunst, Musik oder Lyrik. Personen mit niedrigem Wert zeichnen sich durch Pragmatismus aus. Sie sind oft praktisch begabt und bewahren traditionelle Werte und Ansichten.',506),('de','Ehrlichkeit der Beantwortung.',507),('de','Menschen mit hohem Leistungsstreben verfolgen ihre Ziele hartnäckig. Ihre Ansprüche haben ein hohes Niveau. Für die Zielerreichung arbeiten sie hart. Strebsamkeit und Zielstrebigkeit sind typische Eigenschaften. Personen mit niedrigen Werten haben ggf. eine nicht so klare Zukunftsperspektive, sind aber oft mit einem geringeren Leistungsniveau bereits zufrieden.',508),('de','Der Aktivitätslevel beschreibt, wie schnell ein Mensch in unterschiedlichen Situationen aktiv wird. Er ist zudem ein Merkmal dafür, wie aktiv ein Mensch im Allgemeinen ist. Ein hoher Aktivitätslevel spricht für eine überwiegend hohe Geschäftigkeit. Das Leben dieser Menschen ist zeitlich sehr ausgefüllt, sie zeichnen sich häufig durch energisches und schnelles Handeln aus. Menschen mit niedrigen Werten sind eher ruhig und nehmen sich gezielt Zeit zur Entspannung. Dies spricht aber nicht für Schwerfälligkeit oder fehlende Zielstrebigkeit. Vielmehr ist das Leben dieser Personen weniger geschäftig.',509),('de','Das gesteigerte Bedürfnis und die erhöhte Bereitschaft, neue Aktivitäten und Handlungsweisen zu erproben, werden als Abenteuerlust bezeichnet. Es beschreibt generell das Verlangen, Neues auszuprobieren. Die Abwechslung wird der Routine und dem Altbekannten vorgezogen. Menschen mit geringer Abenteuerlust bevorzugen es eher, an den bewährten Handlungsmustern festzuhalten. Sie sind nicht ständig auf der Suche nach neuen Herausforderungen.',510),('de','Altruismus bezeichnet die Bereitschaft anderen zu helfen, ohne dafür eine Gegenleistung zu erwarten. Es handelt sich um ein Engagement für das Wohlergehen des Anderen gekennzeichnet von Großzügigkeit und Rücksicht. Menschen mit hohen Werten sind bereit, selbstlos anderen in der Not zu helfen. Niedrige Werte sind ein Anzeichen dafür, sich nicht in die Probleme anderer hineinziehen zu lassen und eine gesunde Distanz zu wahren.',511),('de','Zorn kennzeichnet die Anfälligkeit für Gefühle von Ärger und in Folge dessen von Frustration und Bitterkeit. Hohe Werte zeugen von einer Tendenz zur Reizbarkeit, zum Ärger und Zorn. Folge davon sind häufig Enttäuschung und Frustration. Menschen mit niedrigen Werten sind nicht leicht reizbar. Niedrige Werte können aber auch ein Zeichen für Gleichgültigkeit sein.',512),('de','Angst beschreibt die Anfälligkeit dafür, Angstgefühle und Sorgen zu empfinden. Hohe Werte zeugen von dem Hang dazu, sich Sorgen zu machen und Anspannung und Angst zu empfinden. Menschen mit hohem Wert wirken oft angespannt. Menschen mit niedrigen Werten sind entspannt und ruhig und ohne Sorge, dass Dinge schiefgehen könnten.',513),('de','Personen mit künstlerischen Interessen lassen sich von der Schönheit in Kunst und Natur emotional bewegen. Sie sind aufgeschlossen für Ästhetisches und interessieren sich häufig für Musik, Malerei oder Dichtung. Menschen mit geringen Werten legen ihre Interessenschwerpunkte anders.',514),('de','Die Fähigkeit, sich auch unter schwierigen Bedingungen bzw. in herausfordernden Situation gegen andere durchzusetzen, wird als Durchsetzungsvermögen bezeichnet. Dieses setzt fachliche, kommunikative und ggf. psychologische Fähigkeiten voraus. Menschen mit hohem Durchsetzungsvermögen haben oft Leitungspositionen, sind selbstsicher und überlegen. Niedrige Werte sind typisch für Personen, die sich eher im Hintergrund halten und dort ihre Stärken entwickeln.',515),('de','Mit Vorsicht wird die Fähigkeit von Menschen bezeichnet, die Folgen einer Handlung abschätzen zu können und dementsprechend zu handeln. Menschen mit hohen Werten sind oft behutsam in ihrem agieren. Sie überlegen, bevor sie handeln. Personen mit geringen Werten zeichnen sich häufig dadurch aus, dass sie fähig sind spontan und schnell zu handeln.',516),('de','Mit Fröhlichkeit wird die Fähigkeit bezeichnet, positive Emotionen und Humor mit der Umwelt zu teilen und zu zeigen. Menschen mit hohen Werten wirken vergnügt und heiter und erscheinen auf ihr Umfeld eher optimistisch. Sie lächeln häufig und lachen leicht. Niedrige Werte zeugen von weniger Ausgelassenheit. Diese Menschen sind aber nicht weniger glücklich, äußern die Emotionen aber nicht in dem hohen Maße.',517),('de','Die Fähigkeit nachzugeben anstatt die Konfrontation zu suchen wird als Entgegenkommen bezeichnet. Der u.U. vorhandene eigene Ärger oder gar Aggressionen werden unterdrückt. Es schließt die Bereitschaft zu vergessen und zu verzeihen ein. Menschen mit niedrigen Werten geben in Konfliktsituationen nicht so leicht nach. Sie scheuen nicht die Konfrontation und konkurrieren, wenn erforderlich mit ihrem Gegenüber.',518),('de','Depressive Personen verspüren im Übermaß negative Gefühle wie Trauer oder Entmutigung. Kennzeichen sind Einsamkeit, Entmutigung, Schuldgefühle. Niedrige Werte sind nicht zwingend ein Merkmal für Unbeschwertheit oder Fröhlichkeit aber für emotionale Stabilität.',519),('de','Eine hohe Verlässlichkeit sowie ein ausgeprägtes Pflichtgefühl zeichnen Menschen mit hohem Pflichtbewusstsein aus. Diese Menschen sind darauf bedacht, ihren Verpflichtungen nachzukommen und sich an ihre Prinzipien zu halten. Niedrige Werte zeugen von einer großen Gelassenheit Umgang mit Pflichten und Auflagen.',520),('de','Feinfühligkeit beschreibt die Fähigkeit, die Emotionen von sich und anderen deutlicher als andere wahrzunehmen. Gefühle sind ein bedeutender Aspekt im Leben. Empfindungen wie Glück oder Unglück werden intensiver erlebt. Personen mit niedrigen Werten geben ihren Gefühlsregungen weniger Bedeutung. Sie sind damit weniger empfindlich für emotionale Extreme.',521),('de','Erlebnishunger beschreibt die Suche nach Abwechslung und Erlebnissen, die neue Reize setzen. Hohe Werte sind charakterisierend für Menschen mit Abenteuerlust und Risikobereitschaft. Sie suchen den Nervenkitzel. Menschen mit niedrigen Werten sind nicht an nervenaufreibenden Situationen und Erlebnissen interessiert.',522),('de','Freundlichkeit beschreibt die Fähigkeit, Zuneigung zu zeigen und leicht neue Freundschaften einzugehen. Kennzeichnend ist ein wohlwollendes, respektvolles und wertschätzendes Verhalten. Hohe Werte zeugen von Herzlichkeit, Offenheit und Kontaktfreudigkeit. Menschen mit niedrigen Werten sind eher zurückhaltend und reserviert gegenüber anderen Personen, nicht aber ohne Mitgefühl oder gar feindselig.',523),('de','Unter Geselligkeit versteht man die Bereitschaft, gerne Zeit unter Menschen zu verbringen. Dabei spielt die Unbeschwertheit des Zusammenseins eine wesentliche Rolle. Es handelt sich also im Wesentlichen um zeitlich begrenzte und eher unverbindliche Kontakte. Niedrige Werte sind typisch für Menschen, die gerne für sich allein sind und sich eher in kleinen Gruppen wohlfühlen, als in größerer Gesellschaft.',524),('de','Phantasie bezeichnet die kreative Vorstellungskraft des Menschen. Sie kann den Alltag interessanter machen und schafft innere Bilder bzw. eine komplette Innenwelt. Personen mit wenig Phantasie bevorzugen eine realistische Betrachtungsweise. Sie sind meist eher praktisch orientiert, Tagträumereien sind ihnen fremd.',525),('de','Kurzfristigem Verlangen nicht widerstehen zu können wird als Unmäßigkeit bezeichnet. Personen mit hohen Werten gelingt es nicht, Verlangen nach gewissen Dingen zu widerstehen, auch wenn später das Verhalten häufig bereut wird. Niedrige Werte zeigen eine hohe Frustrationstoleranz. Versuchungen und Verlockungen wird leichter widerstanden.',526),('de','Menschen mit ausgeprägter Interessenvielfalt beschäftigen sich mit vielfältigen intellektuellen Themen. Sie setzen sich gerne mit theoretischen Fragestellungen auseinander, lösen gerne knifflige Denksportaufgaben und nehmen gerne an anspruchsvollen Diskussionen teil. Niedrige Werte deuten auf eine ehre begrenzte Neugierde hin. Diese Personen schaffen es, sich auf eingegrenzte Themen zu konzentrieren. Beide Ausprägungen sagen nichts über die Intelligenz aus.',527),('de','Aufgeschlossene Menschen sind bemüht, bestehende Werte und Traditionen zu hinterfragen. Dies können Werte sozialer, ethnischer, religiöser oder politischer Natur sein. Personen mit niedrigen Werten sind eher bereit, Traditionen und Autoritäten anzuerkennen. Sie pflegen eine eher konservative Sichtweise.',528),('de','Nicht angeberisch zu sein, eigene Fähigkeiten und Leistungen nicht in den Vordergrund zu stellen, wird als Bescheidenheit bezeichnet. Der eigene Besitz und die eigene Stellung werden nicht hervorgehoben. Bescheidene Menschen zeichnen sich durch Zurückhaltung und Genügsamkeit aus. Niedrige Werte kennzeichnen Menschen, die nach Beachtung und Anerkennung streben.',529),('de','Unter Geradlinigkeit wird die Bereitschaft verstanden, mit Aufrichtigkeit und Offenherzigkeit anderen zu begegnen und diese nicht zu täuschen oder zu manipulieren, also keine verdeckte Einflussnahme zu nehmen. Menschen mit niedrigen Werten sind eher in der Lage, mit unterschiedlichen Methoden auf andere Einfluss zu nehmen.',530),('de','Ordentlichkeit umfasst neben der Ordnung im eigenen Zuhause und am Arbeitsplatz die Fähigkeit, Dinge organisiert und systematisch anzugehen. Eine organisierte und systematische Vorgehensweise kennzeichnet die Arbeit dieser Personen. Menschen mit geringen Werten sind weniger an Ordnungen gebunden und können besser mit unstrukturierten, spontanen Situationen umgehen.',531),('de','Befangenheit ist ein Merkmal für schüchterne Menschen die unsicher im Umgang mit anderen sind. Personen mit hohen Werten fühlen sich in großen Gesellschaften unwohl. Kritik oder gar Spott setzt ihnen sehr zu. Hohe Werte sind ein Indiz weniger Angreifbarkeit in unangenehmen Situationen. Ein erhöhtes Geschick im Umgang mit anderen Menschen ist damit nicht zwingend verbunden.',532),('de','Selbstdisziplin ist von hoher Willenskraft und der Fähigkeit gekennzeichnet, Ablenkungen zu widerstehen. Extremes Aufschieben oder Arbeitsstörung gekennzeichnet durch Vertagen des Arbeitsbeginns und häufige Unterbrechung der Arbeit kommen bei Menschen mit hoher Selbstdisziplin kaum vor. Personen mit geringer Selbstdisziplin gelingt es eher, neben den übertragenen Aufgaben die Ablenkung und den Ausgleich zu suchen.',533),('de','Kompetenz bezeichnet die Fähigkeit, angenommene Aufgaben effektiv und korrekt zu erledigen. Menschen mit hoher Kompetenz fühlen sich selbst gut gerüstet, um im Leben zu bestehen. Personen mit geringen Werten sind eher in der Lage, Überforderungen einzugestehen. Sie neigen dazu, die eigenen Fähigkeiten zu gering zu schätzen.',534),('de','Mitgefühl beschreibt eine gutmütige, mitfühlende Einstellung zu anderen Menschen. Menschen mit einem hohen Maß an Mitgefühl nehmen die Bedürfnisse und Sorgen anderer wahr und lassen sich von ihnen leiten. Personen mit geringen Werten lassen sich nicht so sehr von den Lebensumständen anderer beeinflussen und sehen sich selbst eher als rational und logisch agierend.',535),('de','Ehrleichkeit der Beantwortung.',536),('de','Vertrauen kennzeichnet Menschen, die grundsätzlich davon ausgehen, dass andere Menschen gute Absichten haben. Sie setzen Ehrlichkeit und gute Vorsätze beim Anderen voraus. Niedrige Werte sind eher ein Kennzeichen für Skepsis und Zurückhaltung. Andere Menschen werden nicht von vornherein ausschließlich gute Absichten unterstellt.',537),('de','Verletzlichkeit ist ein Kennzeichen dafür, schlecht mit Stress und Druck umgehen zu können. Menschen mit hohen Werten müssen in Stresssituationen zunächst ihre eigenen Gefühle unter Kontrolle bringen. Menschen mit niedrigen Werten beherrschen ihre Gefühle auch in schwierigen Situationen.',538),('de','Durchführung am:',540),('de','Was Sie erwartet',541),('de','Die Persönlichkeitspsychologie befasst sich seit Anfang des 20. Jahrhunderts mit der Entwicklung von Modellen, mit deren Hilfe sich Charaktereigenschaften beschreiben lassen. Die von Ihnen durchgeführte Persönlichkeitsstudie basiert auf dem Fünf Faktoren Modell, auch Big Five genannt.',542),('de','Dieses Modell beschreibt fünf Dimensionen der Persönlichkeit:',543),('de','Extraversion',544),('de','Emotionale Stabilität',545),('de','Verträglichkeit',546),('de','Gewissenhaftigkeit',547),('de','Offenheit für Erfahrungen',548),('de','Zuverlässige und aussagekräftige Ergebnisse setzen voraus, dass drei Kriterien bei der Anwendung eines Persönlichkeitstests erfüllt sind:',549),('de','Objektivität',550),('de','Validität',551),('de','Reliabilität',552),('de','Objektivität',553),('de','Die Objektivität eines Persönlichkeitstests bezieht sich sowohl auf dessen Durchführung als auch auf die Auswertung und Interpretation.',554),('de','Objektivität der Durchführung',555),('de','Die Durchführung des Tests muss unabhängig von der Testperson zum gleichen Ergebnis führen. Die EDV gestützte Automatisierung des Testverfahrens garantiert diese Unabhängigkeit.',556),('de','Objektivität der Auswertung',557),('de','Die Auswertung muss unabhängig von äußeren Einflüssen in der gleichen Weise erfolgen.',558),('de','Objektivität der Interpretation',559),('de','Die Interpretation der Ergebnisse muss unabhängig von der auswertenden Person erfolgen.',560),('de','Die von Ihnen durchgeführte Persönlichkeitsstudie ist in der Durchführung, Auswertung und Interpretation der Ergebnisse EDV gestützt, d.h. Einflüsse einer ggf. auswertenden oder interpretierenden Person sind per se ausgeschlossen.',561),('de','Validität',562),('de','Validität bezeichnet die Gültigkeit, mit der die zugrundeliegenden Aussagen (Items) tatsächlich die zu messenden Eigenschaften messen.',563),('de','Die Persönlichkeitsstudie basiert auf dem wissenschaftlich anerkannten Testverfahren des Fünf Faktoren Modells, damit ist die Validität der Aussagen gegeben.',564),('de','Reliabilität',565),('de','Reliabilität bezeichnet die Genauigkeit eines Testverfahrens, d.h. eine wiederholte Durchführung führt zu den selben Ergebnissen. Zur Bestimmung der Reliabilität existieren statistisch-mathematische Verfahren.',566),('de','Die hohe Reliabilität der einzelnen Aussagen (Items) belegt die Unabhängigkeit von zufälligen Schwankungen im Ergebnis.',567),('de','Durchgeführt von: ',568),('de','Datum der Durchführung: ',569),('de','Selbsteinschätzung',570),('de','Fremdeinschätzung',571),('de','Gesamteinschätzung',572),('de','Wir präsentieren Ihnen die Auswertung der Fremdeinschätzung. Die Ergebnisse beschreiben die Sicht der durchführenden Person auf Ihre Persönlichkeit.',573),('de','Die Ergebnisse basieren auf der Durchführung der Fremdeinschätzung',574),('de','Die Persönlichkeitspsychologie befasst sich seit Anfang des 20. Jahrhunderts mit der Entwicklung von Modellen, mit deren Hilfe sich Charaktereigenschaften beschreiben lassen. Die von Ihnen durchgeführte Persönlichkeitsstudie basiert auf dem Fünf Faktoren Modell, auch Big Five genannt.',576),('de','Die Testversion zur Persönlichkeitsstudie ...',577),('de','Die Persönlichkeitspsychologie befasst sich seit Anfang des 20. Jahrhunderts mit der Entwicklung von Modellen, mit deren Hilfe sich Charaktereigenschaften beschreiben lassen. Die von Ihnen durchgeführte Persönlichkeitsstudie basiert auf dem Fünf Faktoren Modell, auch Big Five genannt.',578),('de','Dieses Modell beschreibt fünf Dimensionen der Persönlichkeit:',579),('de','Extraversion',580),('de','Emotionale Labilität',581),('de','Verträglichkeit',582),('de','Gewissenhaftigkeit',583),('de','Offenheit für Erfahrungen',584),('de','Jede dieser Dimensionen weißt sechs Unterkategorien auf, sogenannte Facetten.',585),('de','Die Studie basiert auf den Aussagen (sogenannten Items), die Sie während der Duchführung bewertet haben. Dabei wurde auf einer Skala von 1 bis 10 die Zustimmung zur Aussage eingeschätzt.',586),('de','Auf den folgenden Seiten der vorliegenden Auswertung werden die Ergebnisse Ihrer Persönlichkeitsstudie erläutert. Das Ergebnis steht zudem weiterhin online zur Einsicht zur Verfügung. Sie können die Auswertung jederzeit erneut per E-Mail als PDF Datei versenden.',587),('de','Die Auswertung gliedert sich in folgende Abschnitte:',588),('de','Auswertung in der Übersicht',589),('de','Alle Ergebnisse der Persönlichkeitsstudie werden hier beschrieben. Zu jeder Dimension der Persönlickeit sowie zu allen Facetten erhalten Sie Beschreibung basierend auf den Ergebnissen der Auswertung Ihrer.',590),('de','Ihre ausgeprägtesten\nCharaktereigenschaften',591),('de','Dieser Teil der Auswertung fokusiert sich auf die Charaktereigenschaften, die bei Ihnen am ausgeprägtesten sind, d.h. bei denen für Sie die höchsten Werte ermittelt wurden.',592),('de','Ihre Charaktereigenschaften mit geringer Ausprägung.',593),('de','In diesem Abschnitt werden die Facetten Ihrer Persönlichkeit beschrieben, in denen die Auswertung niedrige Werte ergeben hat.',594),('de','Auswertung im Detail - Definitionen',595),('de','Dieser Bereich beleuchtet noch einmal alle Dimensionen und Facetten im Detail und ergänzt die persönlichen Ergebnisse duch die Definitionen der einzelnen Charaktereigenschaften.',596),('de','Die Persönlichkeitspsychologie befasst sich seit Anfang des 20. Jahrhunderts mit der Entwicklung von Modellen, mit deren Hilfe sich Charaktereigenschaften beschreiben lassen. Die Persönlichkeitsstudie basiert auf dem Fünf Faktoren Modell, auch Big Five genannt. Die von Ihnen durchgeführte Testversion beschränkt auf einen Ausschnitt aller Dimensionen und Facetten. Die komplette Studie erfasst die fünf Grunddimensionen:',597),('de','Erstellen Sie sich noch heute ein Benutzerkonto und führen Sie die komplette Studie durch.',598),('de','Der Test war schwerer als erwartet.',599),('de','Die Fragen waren verständlich.',600),('de','Die Fragen waren schwer zu beantworten.',601),('de','Der Test hat insgesamt länger gedauert als erwartet.',602),('de','Die Ergebnisse haben mich bestätigt.',603),('de','Die Ergebnisse haben mich positiv überrascht.',604),('de','Die Ergebnisse fand ich verständlich formuliert.',605),('de','Die Ergebnisse fand ich umfassend.',606),('de','Ich habe ungefähr folgende Zeit zur Beantwortung benötigt (in Minuten).',607),('de','Der Test hat mir Motivation gegeben, mich weiter mit meiner Persönlichkeit auseinander zu setzen.',608),('de','Ich kann mir vorstellen den Test innerhalb der nächsten Monate noch einmal zu machen um zu sehen, wie ich mich entwickelt habe.',609),('de','Ich werde den Test bei Gelegenheit weiterempfehlen.',610),('en','I get angry easily.',1),('en','I get irritated easily.',2),('en','I am not easily annoyed.',4),('en','Anger',5),('en','Personality Inventory',6),('en','Extraversion',7),('en','Emotional Lability',8),('en','Conscientiousness',9),('en','Agreeableness',10),('en','Openness to experience',11),('en','Achievement-striving',12),('en','Activity Level',13),('en','Adventurousness',14),('en','Altruism',15),('en','Anxiety',16),('en','Artistic Interests',17),('en','Assertiveness',18),('en','Cautiousness',19),('en','Cheerfulness',20),('en','Cooperation',21),('en','Depression',22),('en','Dutifulness',23),('en','Sensitivity',24),('en','Excitement-Seeking',25),('en','Friendliness',26),('en','Gregariousness',27),('en','Imagination',28),('en','Immoderation',29),('en','Variety of Interests',30),('en','Liberalism',31),('en','Modesty',32),('en','concession',33),('en','Orderliness',34),('en','Self-Consciousness',35),('en','Self-discipline',36),('en','Self-efficacy',37),('en','Sympathy',38),('en','Trust',39),('en','Vulnerability',40),('en','Test',41),('en','I do more than what\'s expected of me.',42),('en','I work hard.',43),('en','I put little time and effort into my work.',44),('en','I do just enough work to get by.',45),('en','I am always busy.',46),('en','I am always on the go.',47),('en','I do a lot in my spare time.',48),('en','I like to take it easy.',49),('en','I prefer variety to routine.',50),('en','I prefer to stick with things that I know.',51),('en','I dislike changes.',52),('en','I am attached to conventional ways.',53),('en','I am concerned about others.',54),('en','I love to help others.',55),('en','I am indifferent to the feelings of others.',56),('en','I take no time for others.',57),('en','I lose my temper.',58),('en','I worry about things.',59),('en','I fear for the worst.',60),('en','I am afraid of many things.',61),('en','I get stressed out easily.',62),('en','I believe in the importance of art.',63),('en','I see beauty in things that others might not notice.',64),('en','I do not like poetry.',65),('en','I do not enjoy going to art museums.',66),('en','I take charge.',67),('en','I try to lead others.',68),('en','I take control of things.',69),('en','I wait for others to lead the way.',70),('en','I jump into things without thinking.',71),('en','I make rash decisions.',72),('en','I rush into things.',73),('en','I act without thinking.',74),('en','I radiate joy.',75),('en','I have a lot of fun.',76),('en','I love life.',77),('en','I look at the bright side of life.',78),('en','I love a good fight.',79),('en','I yell at people.',80),('en','I insult people.',81),('en','I get back at others.',82),('en','I often feel blue.',83),('en','I dislike myself.',84),('en','I am often down in the dumps.',85),('en','I feel comfortable with myself.',86),('en','I keep my promises.',87),('en','I tell the truth.',88),('en','I break rules.',89),('en','I break my promises.',90),('en','I experience my emotions intensely.',91),('en','I feel others\' emotions.',92),('en','I rarely notice my emotional reactions.',93),('en','I don\'t understand people who get emotional.',94),('en','I love excitement.',95),('en','I seek adventure.',96),('en','I enjoy being reckless.',97),('en','I act wild and crazy.',98),('en','I make friends easily.',99),('en','I feel comfortable around people.',100),('en','I avoid contacts with others.',101),('en','I keep others at a distance.',102),('en','I love large parties.',103),('en','I talk to a lot of different people at parties.',104),('en','I prefer to be alone.',105),('en','I avoid crowds.',106),('en','I have a vivid imagination.',107),('en','I enjoy wild flights of fantasy.',108),('en','I love to daydream.',109),('en','I like to get lost in thought.',110),('en','I go on binges.',111),('en','I rarely overindulge.',112),('en','I easily resist temptations.',113),('en','I am able to control my cravings.',114),('en','I love to read challenging material.',115),('en','I avoid philosophical discussions.',116),('en','I have difficulty understanding abstract ideas.',117),('en','I am not interested in theoretical discussions.',118),('en','I tend to vote for liberal political candidates.',119),('en','I believe that there is no absolute right and wrong.',120),('en','I tend to vote for conservative political candidates.',121),('en','I believe that we should be tough on crime.',122),('en','I believe that I am better than others.',123),('en','I think highly of myself.',124),('en','I have a high opinion of myself.',125),('en','I boast about my virtues.',126),('en','I use others for my own ends.',127),('en','I cheat to get ahead.',128),('en','I take advantage of others.',129),('en','I obstruct others\' plans.',130),('en','I like to tidy up.',131),('en','I often forget to put things back in their proper place.',132),('en','I leave a mess in my room.',133),('en','I leave my belongings around.',134),('en','I find it difficult to approach others.',135),('en','I am afraid to draw attention to myself.',136),('en','I only feel comfortable with friends.',137),('en','I am not bothered by difficult social situations.',138),('en','I am always prepared.',139),('en','I carry out my plans.',140),('en','I waste my time.',141),('en','I have difficulty starting tasks.',142),('en','I complete tasks successfully.',143),('en','I excel in what I do.',144),('en','I handle tasks smoothly.',145),('en','I know how to get things done.',146),('en','I sympathize with the homeless.',147),('en','I feel sympathy for those who are worse off than myself.',148),('en','I am not interested in other people\'s problems.',149),('en','I try not to think about the needy.',150),('en','I have already done things that better do not get public.',151),('en','I have already had some bad thought about others.',152),('en','I have already something not immediately returned.',153),('en','I have already retold something I should not have.',154),('en','I trust others.',155),('en','I believe that others have good intentions.',156),('en','I trust what people say.',157),('en','I distrust people.',158),('en','I panic easily.',159),('en','I become overwhelmed by events.',160),('en','I feel that I\'m unable to deal with things.',161),('en','I remain calm under pressure.',162),('en','You have very high values in the dimension of extraversion, i.e. you have a very outward-facing posture.',163),('en','You have high values in the dimension of extraversion, i.e. you have an outward posture.',164),('en','You have average values in the dimension of extraversion, that is, you do not have an exclusively outward-looking posture, nor are you largely self-oriented.',165),('en','You have low values in the dimension of extraversion, i.e. you gain your strength predominantly from within.',166),('en','You have very low values in the dimension of extraversion, i.e. you like to be alone and reflect on your own strengths.',167),('en','You have very high values in the dimension of emotional instability, i.e. you react very emotionally to challenges of any kind.',168),('en','You have high values in the dimension of emotional instability, i.e. you meet challenges with intense feelings. You are capable of empathic reactions.',169),('en','You have medium values in the dimension of emotional instability, i.e. you can master difficult situations, but are not free from a tendency to worry and restlessness.',170),('en','You have low values in the dimension of emotional instability, i.e. you are predominantly balanced, calm, without worries and constant in difficult situations.',171),('en','You have very low values in the dimension of emotional instability, i.e. your balance, calm and carelessness captivates even in difficult situations.',172),('en','You show very high values in the dimension of agreeableness, i.e. you are extremely helpful in dealing with others, you are characterised by compassion and a pronounced willingness to cooperate',173),('en','You have high values in the dimension of agreeableness, i.e. your positive image of man determines how you deal with others. This is usually characterised by cooperation and helpfulness.',174),('en','You have medium values in the dimension of agreeableness, i.e. you have a positive influence in dealing with others, but also manage to detach yourself from them in competitive situations, if the situation so requires.',175),('en','You have low values in the dimension of agreeableness, i.e. you are quite capable of consistently pursuing your own interests and asserting yourself against competition.',176),('en','You have very low values in the dimension of agreeableness, i.e. you are characterised by your ability to put your own interests first. You can face the competition.',177),('en','You have very high values in the dimension of conscientiousness, i.e. you are an extremely self-controlled, determined and effective person. You are also characterised by a high degree of ambition and the care with which you handle the tasks entrusted to them.',178),('en','You have high values in the dimension of conscientiousness, i.e. you have a high degree of self-control and act purposefully and effectively. You complete your tasks carefully and reliably.',179),('en','You have average values in the dimension of conscientiousness, i.e. you are able to perform your tasks reliably under your own control. But you also allow yourself a certain amount of freedom and do not bite into their duties.',180),('en','You have low values in the dimension of conscientiousness, i.e. you approach your tasks carefree and without worries. A certain inner calmness characterizes your actions.',181),('en','You have very low values in the dimension of conscientiousness, i.e. you allow yourself many freedoms and act carefree and with great serenity.',182),('en','You have very high values in the dimension of openness for experiences, i.e. you are looking for new experiences and are very keen to experiment. You are very interested in varied activities.',183),('en','You have high values in the dimension of openness for experiences, i.e. you like to make new experiences, are willing to experiment and prefer variety to routine.',184),('en','You have medium values in the dimension of openness to experience, i.e. you do not reject new experiences in principle, but are also aware of the importance of old values and views.',185),('en','You have low values in the dimension of openness to experience, i.e. you stick to tradition and old values instead of opening up to new experiences.',186),('en','You have very low values in the dimension of openness to experience, i.e. traditions and old values are extremely important to you. You refrain from necessarily having to make new experiences.',187),('en','You are an extremely cordial, open and sociable person. You show your affection for other people and are always open to new friendships.',188),('en','You are characterised by your ability to show affection and to make new friends through your cordiality and sociability.',189),('en','You show your affection for other people when you think it is necessary. However, you can also exercise restraint in dealing with your environment.',190),('en','You are able to exercise restraint towards others. You feel more comfortable in small groups than in large societies.',191),('en','You are a very reserved person who can be alone well. You are not out to make new acquaintances all the time.',192),('en','You love to spend time in social gatherings. You like a carefree atmosphere and non-binding contacts.',193),('en','You show the willingness to spend time with other people. You like sociable rounds.',194),('en','You don\'t mind being alone very much. You also spend time with others, without placing increased value on non-binding contacts.',195),('en','You can be well alone and act on your own without society. Small working groups are at your disposal.',196),('en','You don\'t care about informal sociability. You\'d rather be on your own.',197),('en','Your self-confidence as well as your high communicative and professional competence lead to your asserting yourself in difficult situations. You have the ability to take on managerial responsibilities.',198),('en','Mostly you succeed in asserting yourself against others, even in difficult situations. You will benefit from your professional and communicative skills.',199),('en','If the situation requires it, you will be able to assert yourself against others. But it is more up to you to avoid these situations if possible.',200),('en','You like to act in the background and develop your strengths there.',201),('en','You avoid confrontation. You don\'t mind leaving the decisions to others.',202),('en','You are extremely active and can react energetically and quickly. You are always busy, idleness is completely alien to you.',203),('en','You become active quickly and usually maintain a high level of activity.',204),('en','You have found a balance between constant activity and peace and relaxation.',205),('en','It is important for you to find times of rest and relaxation. You don\'t have to be busy all the time.',206),('en','You reject constant activity. Rather, you seek peace and relaxation without losing sight of your goals.',207),('en','You show a very high willingness to take risks and are looking for new challenges.',208),('en','You are quite willing to take risks and set new stimuli.',209),('en','If possible, you avoid risks, but in case of doubt you are able to accept new challenges.',210),('en','You have little interest in nerve-wracking situations and avoid unknown terrain.',211),('en','You avoid risks. You have no interest in thrills or adventures.',212),('en','You are a very cheerful person who likes to share his humour and positive attitude with the environment.',213),('en','You have the ability to show your humour and share positive emotions with the environment. You are usually cheerful and seem optimistic about your environment.',214),('en','You can be humorous and show positive emotions, but you don\'t have to prove it on every occasion.',215),('en','You prefer to show your humour and cheerfulness in a small circle and well dosed.',216),('en','You are completely unaware of exuberance and emotionality.',217),('en','Your calm and carelessness leave no room for anxiety. You are convinced that things will develop positively.',218),('en','You rarely worry that things might go wrong. Feelings of fear are alien to you, you are calm and relaxed in most situations.',219),('en','You will face most challenges calmly and calmly. Some things can worry you without you losing yourself in anxiety.',220),('en','You experience your feelings intensively in difficult situations. You don\'t just put the worries aside, you deal with them.',221),('en','You think intensively about how you can lead the challenges to a good end.',222),('en','you do not allow yourself to be provoked by provocative behaviour and never react angrily.',223),('en','You\'re not easily irritated. Provocations do not lead to reactions at the same level.',224),('en','You are irritable in certain situations, but have the feelings of anger and frustration under control.',225),('en','You react strongly to being challenged in certain situations. You rarely show an indifferent attitude.',226),('en','Negative external influences become a challenge for you. You are completely unaware of indifference to external influences.',227),('en','You are able to deal with negative influences at any time. Your positive basic attitude leads to the fact that you can also deal well with negative feelings.',228),('en','Feelings of guilt, sadness or other negative feelings have little influence on your positive attitude.',229),('en','You tend to let negative feelings overshadow your basically positive attitude. But most of the time you manage to deal with these feelings.',230),('en','Your ability to empathize is what sets you apart. Often, however, you let the problems get too close to you, so that you become too big for you.',231),('en','You have a high sensitivity for stressful feelings such as grief or guilt.',232),('en','You don\'t mind being critical of yourself. You will always find a way to react and find the right answers for you.',233),('en','You\'re good with criticism. You are well armed against attacks on your personality.',234),('en','You accept criticism from others, but are usually good at dealing with it. Attacks on your person make you think about yourself.',235),('en','You are rather reserved when dealing with other people. You will feel more comfortable in the small circle of well-known people.',236),('en','Your restrained nature characterizes you. You always avoid being the focus of interest.',237),('en','Temptations of various kinds cannot entice you. You resist the short-term cravings.',238),('en','Mostly you succeed in resisting temptations. You know your own strength, not to give in to short-term desires.',239),('en','Every now and then you give in to temptations, even if you know that you may regret it. But you also succeed in showing strength and resisting temptations.',240),('en','You recognize when you have exaggerated certain things and are able to regret this.',241),('en','Temptations and short-term desires challenge you. You are working on strategies to deal with it.',242),('en','Stress and other difficult situations cannot harm you in any way. Even then, you have your feelings under control.',243),('en','You are able to control your feelings, even in difficult situations. You can deal with difficult situations and stress.',244),('en','You have the basic ability to deal with stress situations. Your feelings in difficult situations occupy you, you cannot completely hide them.',245),('en','In difficult situations you experience your own feelings very strongly and can recognize injuries. You try to become aware of your own situation before you react.',246),('en','You react with intense feelings to stress and difficult situations. This will be a strong challenge for you.',247),('en','You are basically convinced that other people are honest and have good intentions.',248),('en','In most situations you assume that other people mean it honestly and basically have good intentions and intentions.',249),('en','You do not assume that other people have only good intentions. You are rather cautious in their assessment of others, but also not fundamentally skeptical.',250),('en','Other people are not a priori accused of good intentions. You have a certain scepticism and restraint towards the honesty of others.',251),('en','You do not tend in any way to trust other people blindly from the outset. Rather, you question their motivation and intentions.',252),('en','Your interaction with other people is characterized throughout by openness and sincerity. It would never occur to you to influence other people, neither openly nor covertly.',253),('en','You are usually sincere and open-hearted in your dealings with your environment. You\'re completely out of your depth about manipulating other people.',254),('en','You are interested in open and honest interaction with others, but can also influence other people to a certain extent for your own purposes.',255),('en','In many situations you succeed in influencing other people and influencing them for your own purposes.',256),('en','You have a strong ability to engage other people for your goals and intentions.',257),('en','Your selfless willingness to help is available to other people at any time. You don\'t expect anything in return.',258),('en','You have a high willingness to help and often selflessly stand up for other people without paying attention to your own advantage.',259),('en','You are not indifferent to the problems of others. However, you recognize when help exceeds your own strengths and possibilities.',260),('en','You usually manage to keep your distance from other people. It is far from you to get into the problems of others. ',261),('en','You will not be tempted by the problems of others to put your own interests first.',262),('en','You always take the step towards each other and put your own views at the back.',263),('en','You are characterised by your ability to give way in conflict situations. Your own anger is successfully suppressed.',264),('en','You are willing to compromise. You don\'t give up your own point of view unconditionally, but you do respond to other views.',265),('en','You do not avoid conflicts and confrontations. You don\'t necessarily disclose your point of view.',266),('en','You confront the conflict and vehemently defend your own views.',267),('en','You never show off your abilities and talents. You are always anxious that your positive qualities never become the focus of attention.',268),('en','It is not important for you to display your own abilities, your skills, your influence and your possessions. Rather, you prefer to avoid addressing these issues.',269),('en','You are aware of your strengths and use them without becoming boastful.',270),('en','You know about your abilities and are not afraid to show them openly.',271),('en','It is important to you that your skills and talents are noticed and respected. You never hide your talents.',272),('en','You have a strong feeling for the feelings of your fellow human beings and are able to perceive and share their feelings.',273),('en','The needs and sensitivities of other people are not unimportant to you. You perceive them and respond to them in a special way.',274),('en','You recognize the states of mind of others and can react adequately without losing sight of your own state of mind.',275),('en','You let your mind guide you in dealing with others, even if they have to cope with difficult situations.',276),('en','You maintain the distance to the emotional world of your counterpart and regard yourself as acting rationally and logically.',277),('en','You do your work purposefully and effectively. You know your competent strengths.',278),('en','You are aware of your abilities and are able to perform tasks effectively and correctly.',279),('en','You know your abilities and can use them to achieve your goals. Sometimes you don\'t dare do enough, but you also know your limits.',280),('en','You often manage to openly admit excessive demands. You are far from bragging about your own abilities.',281),('en','You never put your skills first. Often, however, you do not dare to do enough yourself.',282),('en','Order is enormously important to you in your life. This concerns both your environment and the way you work. You act in an organized and systematic manner.',283),('en','You are highly interested in a well-ordered environment and are usually able to carry out tasks in an organised and systematic manner.',284),('en','Order has a certain significance for you. However, you are not bound by it and can also deal with spontaneous situations.',285),('en','You rarely allow your spontaneity and your ability to deal with unstructured situations to be curbed by your love of order.',286),('en','Spontaneity is more important to you than organized action. You can react immediately to unforeseen events.',287),('en','The fulfilment of your duties is extremely important to you. Your principles are very important to you.',288),('en','You have a very strong interest in fulfilling your duties and adhering to principles.',289),('en','You know your duties, but you also manage to show a certain carelessness in dealing with them.',290),('en','You do not let your actions be dictated by duties and principles. Rather, you cultivate a certain serenity and unconcern.',291),('en','You are characterized by a high degree of composure in dealing with your duties. You approach your tasks carefree, principles play a subordinate role.',292),('en','Your determination helps you to achieve your ambitious goals. You have high expectations of yourself. That\'s why you work hard and ambitious.',293),('en','You pursue your ambitious goals and requirements with great dedication. You usually act purposefully and ambitiously.',294),('en','Your self-imposed goals are also attainable for you. You do not put yourself under too much pressure, but try to achieve the goals with reasonable effort.',295),('en','You are satisfied with what you achieve. Your goals are never set too high, you are rather frugal and you travel with less ambitious goals.',296),('en','You set your targets low. It is far from you to put yourself under pressure with expectations that are too high. You formulate your goals with great frugality.',297),('en','You are characterized by high willpower. You are not distracted in your work and complete tasks without delay.',298),('en','You have a strong will to achieve goals. Your are hardly distracted. Rather, you can hide distractions in your work, tasks are not postponed.',299),('en','You show disciplined behaviour in your work, but you can also switch off and distract yourself from other activities and thus find a balance.',300),('en','In addition to the need to complete your tasks, you occasionally look for ways to distract yourself. Balancing activities are very important to you.',301),('en','You are often looking for distractions and compensatory activities in addition to working on the tasks entrusted to you.',302),('en','You never take reckless actions. You check the consequences of your actions before you act.',303),('en','Your actions are characterised by caution, i.e. you predominantly act with foresight and assess the consequences of your actions before you become active.',304),('en','You are aware that your actions have consequences. You think about how you act, but are also often spontaneous in your actions.',305),('en','Your actions show a high degree of carelessness. You are able to react spontaneously and act quickly when the situation requires it.',306),('en','Spontaneous action and a quick reaction to new situations are your strengths. You do not consider all the consequences in advance.',307),('en','You are an extremely imaginative person. Your imagination is capable of creating whole inner worlds.',308),('en','You have a vivid imagination and a lively imagination. This enables you to make everyday life more interesting.',309),('en','Your imagination helps you to imagine things without losing your sense of reality.',310),('en','You are practical and able to look at things realistically.',311),('en','You view your environment realistically throughout. You are characterized by a strong pragmatism.',312),('en','The beauty of things, whether in nature or arts such as music, painting or poetry, inspire you.',313),('en','You let yourself be touched by the beauty of nature. You may be interested in arts such as music, poetry or painting.',314),('en','The beauty of nature does not leave you untouched. Occasionally you show interest in artistic things.',315),('en','Your interests are less in the artistic field. But you\'re interested in other things.',316),('en','Your interests focus on things other than artistic or aesthetic aspects.',317),('en','You directly perceive the emotions of other people. Your own emotional life is also present at all times.',318),('en','You are characterized by the ability to intensively perceive the feelings of others. You will also experience your own emotional world in a lasting way.',319),('en','You are able to experience your own feelings and those of others, but do not let things get too close.',320),('en','You control your emotional world and are therefore hardly susceptible to emotional extremes.',321),('en','You can hide your own feelings as well as those of other people and thus protect yourself from too strong an emotionality.',322),('en','You have a strong desire to try new unknown things. Variety is preferable to routine.',323),('en','You love to try out new activities and ways of acting. Variety in everyday life is important to you.',324),('en','You can face new challenges, but you are not always looking for things to replace the old.',325),('en','You prefer routine and familiar actions to new ones. You don\'t run the risk of constantly having to try out new things.',326),('en','You adhere to familiar and routine procedures. You\'re not looking for new, unknown activities.',327),('en','You have a very wide range of different interests. You will not avoid any challenging discussion.',328),('en','Your interests are multiple. You face challenging discussions and complex questions.',329),('en','You have many interests, but you can also concentrate and limit yourself to a clearly defined topic.',330),('en','You don\'t let your curiosity drive you. You succeed in concentrating on a clearly defined task.',331),('en','You concentrate on a clearly defined field of interest. You do not necessarily have to deal with every question.',332),('en','You always question existing values and traditions and put them to the test.',333),('en','You are rarely satisfied with existing traditions and values. These are often questioned and put to the test by you.',334),('en','Existing values and traditions are important to you. But you are also able to question them in certain situations.',335),('en','You succeed in recognizing authority and values. You are not subject to the pressure of constantly having to question them.',336),('en','You stick to the existing values and do not question them. You maintain a traditional view.',337),('en','Personality Inventory by third',338),('en','He/ she gets angry easily.',339),('en','He/ she gets irritated easily.',340),('en','He/ she is not easily annoyed.',342),('en','He/ she does more than what\'s expected of him/ her.',380),('en','He/ she works hard.',381),('en','He/ she puts little time and effort into his/ her work.',382),('en','He/ she does just enough work to get by.',383),('en','He/ she is always busy.',384),('en','He/ she is always on the go.',385),('en','He/ she does a lot in his/ her spare time.',386),('en','He/ she likes to take it easy.',387),('en','He/ she prefers variety to routine.',388),('en','He/ she prefers to stick with things that he/ she know.',389),('en','He/ she dislikes changes.',390),('en','He/ she is attached to conventional ways.',391),('en','He/ she is concerned about others.',392),('en','He/ she loves to help others.',393),('en','He/ she is indifferent to the feelings of others.',394),('en','He/ she takes no time for others.',395),('en','He/ she loses his/ her temper.',396),('en','He/ she worries about things.',397),('en','He/ she fears for the worst.',398),('en','He/ she is afraid of many things.',399),('en','He/ she gets stressed out easily.',400),('en','He/ she believes in the importance of art.',401),('en','He/ she sees beauty in things that others might not notice.',402),('en','He/ she does not like poetry.',403),('en','He/ she does not enjoy going to art museums.',404),('en','He/ she takes charge.',405),('en','He/ she tries to lead others.',406),('en','He/ she takes control of things.',407),('en','He/ she waits for others to lead the way.',408),('en','He/ she jumps into things without thinking.',409),('en','He/ she makes rash decisions.',410),('en','He/ she rushes into things.',411),('en','He/ she acts without thinking.',412),('en','He/ she radiates joy.',413),('en','He/ she has a lot of fun.',414),('en','He/ she loves life.',415),('en','He/ she looks at the bright side of life.',416),('en','He/ she loves a good fight.',417),('en','He/ she yells at people.',418),('en','He/ she insults people.',419),('en','He/ she gets back at others.',420),('en','He/ she often feels blue.',421),('en','He/ she dislikes hisself/ herself.',422),('en','He/ she is often down in the dumps.',423),('en','He/ she feels comfortable with hisself/ herself.',424),('en','He/ she keeps his/ her promises.',425),('en','He/ she tells the truth.',426),('en','He/ she breaks rules.',427),('en','He/ she breaks his/ her promises.',428),('en','He/ she experiences his/ her emotions intensely.',429),('en','He/ she feels others emotions.',430),('en','He/ she rarely notices his/ her emotional reactions.',431),('en','He/ she doesn\'t understand people who get emotional.',432),('en','He/ she loves excitement.',433),('en','He/ she seeks adventure.',434),('en','He/ she enjoys being reckless.',435),('en','He/ she acts wild and crazy.',436),('en','He/ she makes friends easily.',437),('en','He/ she feels comfortable around people.',438),('en','He/ she avoids contacts with others.',439),('en','He/ she keeps others\' at a distance.',440),('en','He/ she loves large parties.',441),('en','He/ she talks to a lot of different people at parties.',442),('en','He/ she prefers to be alone.',443),('en','He/ she avoids crowds.',444),('en','He/ she has a vivid imagination.',445),('en','He/ she enjoys wild flights of fantasy.',446),('en','He/ she loves to daydream.',447),('en','He/ she likes to get lost in thought.',448),('en','He/ she goes on binges.',449),('en','He/ she rarely overindulges.',450),('en','He/ she easily resists temptations.',451),('en','He/ she is able to control his/ her cravings.',452),('en','He/ she loves to read challenging material.',453),('en','He/ she avoids philosophical discussions.',454),('en','He/ she has difficulty understanding abstract ideas.',455),('en','He/ she is not interested in theoretical discussions.',456),('en','He/ she tends to vote for liberal political candidates.',457),('en','He/ she believes that there is no absolute right and wrong.',458),('en','He/ she tends to vote for conservative political candidates.',459),('en','He/ she believes that we should be tough on crime.',460),('en','He/ she believes that he/ she is better than others.',461),('en','He/ she thinks highly of hisself/ herself.',462),('en','He/ she has a high opinion of hisself/ herself.',463),('en','He/ she boasts about his/ her virtues.',464),('en','He/ she uses others for my own ends.',465),('en','He/ she cheats to get ahead.',466),('en','He/ she takes advantage of others.',467),('en','He/ she obstructs others\' plans.',468),('en','He/ she likes to tidy up.',469),('en','He/ she often forgets to put things back in their proper place.',470),('en','He/ she leaves a mess in his/ her room.',471),('en','He/ she leaves his/ her belongings around.',472),('en','He/ she finds it difficult to approach others.',473),('en','He/ she is afraid to draw attention to hisself/ herself.',474),('en','He/ she only feels comfortable with friends.',475),('en','He/ she is not bothered by difficult social situations.',476),('en','He/ she is always prepared.',477),('en','He/ she carries out his/ her plans.',478),('en','He/ she wastes his/ her time.',479),('en','He/ she has difficulty starting tasks.',480),('en','He/ she completes tasks successfully.',481),('en','He/ she excels in what he/ she does.',482),('en','He/ she handles tasks smoothly.',483),('en','He/ she knowes how to get things done.',484),('en','He/ she sympathizes with the homeless.',485),('en','He/ she feels sympathy for those who are worse off than hisself/ herself.',486),('en','He/ she is not interested in other people\'s problems.',487),('en','He/ she tries not to think about the needy.',488),('en','He/ she has already done things that better do not get public.',489),('en','He/ she has already had some bad thought about others.',490),('en','He/ she has already something not immediately returned.',491),('en','He/ she has already retold something he/ she should not have.',492),('en','He/ she trusts others.',493),('en','He/ she believes that others have good intentions.',494),('en','He/ she trusts what people say.',495),('en','He/ she distrusts people.',496),('en','He/ she panics easily.',497),('en','He/ she becomes overwhelmed by events.',498),('en','He/ she feels that he/ she is unable to deal with things.',499),('en','He/ she remains calm under pressure.',500),('en','Trial Version',501),('en','The personality trait compatibility describes the manners with other people. It marks the way a person gets on with other people. A positive image of man shapes an indulgent, cooperative relationship with the other person. Helpfulness and compassion are characteristic of people with high values. Low scores testify to the ability to prevail in competitive situations and to stand up for one\'s own interests.Agreeableness describes ...',502),('en','Conscientiousness is a characteristic of determination, self-control and effectiveness. It describes the degree of reliability in dealing with duties and tasks assigned. Also characteristic is the degree of self-organization. Organized persons with a high value act, show ambition and high degree of care. Obstacles are purposefully overcome. People with low values allow themselves more freedom and pursue their goals with more composure. They show a degree of carefreeness and carelessness and do not lose themselves in details.',503),('en','The way humans interact with the environment characterizes the personality trait Extraversion. Extraverted people have an outward-looking attitude, feel comfortable in the company of people, and behave confidently and confidently in groups and gatherings. People with low values gain their strength from within. They like to be alone and independent and prefer working in small groups. A human is not either extroverted or introverted. Rather, the expression between the two poles can be described.',504),('en','Emotional lability describes the way feelings and thoughts are experienced, especially in challenging situations. Emotionally stable people show great balance and calm, are carefree and can not be put off even in difficult situations. Low scores are an indication that the person is more likely to be worried. She reacts more with dismay and sadness, but is characterized by higher empathy and a more intense experience of one\'s own emotional world.',505),('en','Openness to experience is the willingness to make new experiences and experience them intensively. Variety and novel activities are the focus. People with high values enjoy experimenting, are curious and often have a lively imagination. Their own feelings are intensively explored and there is often a keen interest in art, music or poetry. People of low value are characterized by pragmatism. They are often practical and preserve traditional values and views.',506),('en','Honesty of answering.',507),('en','People with a high performance aspiration pursue their goals stubbornly. Your demands are high. They work hard to achieve the goals. Aspiration and determination are typical characteristics. People with low scores may not have a clear future perspective, but are often satisfied with a lower level of performance.',508),('en','The activity level describes how fast a person becomes active in different situations. It is also a sign of how active a person is in general. A high level of activity speaks for a predominantly high activity. The lives of these people are very time-filled, they are often characterized by energetic and quick action. People with low scores are more calm and take time to relax. But this does not speak for clumsiness or lack of purpose. Rather, the lives of these people is less busy.',509),('en','The heightened need and willingness to try out new activities and behaviors are called adventurous. It generally describes the desire to try new things. The variety is preferred to the routine and the old familiar. People with a low thirst for adventure prefer to stick to the tried and tested action patterns. They are not constantly looking for new challenges.',510),('en','Altruism is the willingness to help others without expecting anything in return. It is a commitment to the well-being of others characterized by generosity and consideration. People with high values are willing to selflessly help others in need. Low scores are a sign that you are not getting involved in the problems of others and keeping a healthy distance.',511),('en','Anger characterizes the susceptibility to feelings of anger and, as a result, frustration and bitterness. High values indicate a tendency to irritability, anger and anger. Consequences of this are often disappointment and frustration. People with low scores are not easily irritated. But low values can also be a sign of indifference.',512),('en','Anxiety describes the susceptibility to feel anxiety and worry. High scores testify to the tendency to be worried and to feel tension and anxiety. People of high value are often tense. People with low scores are relaxed and calm and without worrying that things could go wrong.',513),('en','People with artistic interests are emotionally moved by the beauty of art and nature. They are open to aesthetics and are often interested in music, painting or poetry. People with low values place their interests differently.',514),('en','The ability to prevail against others even in difficult conditions or in a challenging situation is called assertiveness. This requires professional, communicative and possibly psychological skills. People with high assertiveness often have managerial positions, are confident and superior. Low scores are typical of people who tend to stay in the background and develop their strengths there.',515),('en','With caution, the ability of people to assess the consequences of an action and to act accordingly. People with high values are often gentle in their actions. They think before they act. People with low scores are often characterized by being able to act spontaneously and quickly.',516),('en','Happiness is the ability to share and express positive emotions and humor with the environment. People with high scores look happy and cheerful and are more optimistic about their environment. They often smile and laugh easily. Low values indicate less exuberance. These people are not less happy, but do not express the emotions to a high degree.',517),('en','The ability to give in instead of looking for confrontation is called accommodating. The existing own anger or even aggression are suppressed. It includes a willingness to forget and forgive. People with low scores are less likely to yield in conflict situations. They do not shy away from the confrontation and compete, if necessary, with their counterpart.',518),('en','Depressed individuals have excessive feelings of grief or discouragement. Characteristics are loneliness, discouragement, feelings of guilt. Low values are not necessarily a sign of lightheartedness or happiness but of emotional stability.',519),('en','A high level of reliability and a pronounced sense of duty characterize people with a high sense of duty. These people are careful to fulfill their obligations and abide by their principles. Low values are evidence of a great serenity in dealing with duties and obligations.',520),('en','Delicacy describes the ability to perceive the emotions of oneself and others more clearly than others. Emotions are a significant aspect of life. Sensations such as happiness or unhappiness are experienced more intensively. People with low values give their emotions less meaning. They are less sensitive to emotional extremes.',521),('en','Experience hunger describes the search for change and experiences that set new stimuli. High values are characteristic of people with a thirst for adventure and a willingness to take risks. They are looking for the thrill. People with low scores are not interested in nerve-wracking situations and experiences.',522),('en','Kindness describes the ability to show affection and easily make new friends. Characteristic is benevolent, respectful and appreciative behavior. High values are evidence of warmth, openness and sociability. People with low values are more reserved and reserved to others, but not compassionate or even hostile.',523),('en','Sociability is the willingness to spend time among people. The light-heartedness of being together plays an essential role here. It is therefore essentially time-limited and rather non-binding contacts. Low scores are typical of people who like to be on their own and feel better in small groups rather than in larger groups.',524),('en','Imagination is the creative imagination of man. It can make everyday life more interesting and creates inner images or a complete inner world. People with little imagination prefer a realistic approach. They are usually more practical oriented, daydreaming is alien to them.',525),('en','Being unable to resist a short-term desire is called intemperance. People with high scores do not succeed in resisting longing for certain things, even if later on the behavior is often regretted. Low values show a high frustration tolerance. Temptations and temptations are more easily resisted.',526),('en','People with a pronounced variety of interests deal with a variety of intellectual topics. They like to deal with theoretical issues, solve tricky brain teasers and participate in challenging discussions. Low scores indicate an honor of limited curiosity. These people manage to focus on limited topics. Both expressions do not say anything about intelligence.',527),('en','Open-minded people strive to question existing values and traditions. These can be values of a social, ethnic, religious or political nature. People with low scores are more willing to recognize traditions and authorities. You maintain a more conservative view.',528),('en','Not being voracious, not putting your own abilities and achievements in the foreground is called modesty. Your own property and your own position are not highlighted. Modest people are characterized by restraint and contentment. Low values characterize people who strive for respect and recognition.',529),('en','Straightforwardness is understood as the willingness to treat others with sincerity and frankness, and not to deceive or manipulate them, ie to take no covert influence. People with low scores are more likely to influence others with different methods.',530),('en','Neatness includes the ability to organize things in an organized and systematic way, in addition to home and workplace order. An organized and systematic approach characterizes the work of these individuals. People with low scores are less committed to order and better able to deal with unstructured, spontaneous situations.',531),('en','Self-embarrassment is a characteristic of shy people who are insecure when dealing with others. People with high values feel uncomfortable in large companies. Criticism or even ridicule attaches to them very much. High scores are an indication of less vulnerability in unpleasant situations. An increased skill in dealing with other people is not necessarily connected.',532),('en','Self-discipline is characterized by high willpower and the ability to resist distractions. Extreme postponement or maladministration characterized by postponing the start of work and frequent interruption of work hardly occur in people with high self-discipline. Persons with little self-discipline are more likely to seek distraction and compensation in addition to their assigned tasks.',533),('en','ompetence is the ability to effectively and correctly handle accepted tasks. People with high competence feel well equipped to survive in life. People with low scores are more likely to admit excessive demands. They tend to underestimate their own abilities.',534),('en','Compassion describes a good-natured, compassionate attitude towards other people. People with a high degree of compassion perceive and be guided by the needs and concerns of others. People with low scores are not so much influenced by the circumstances of others and see themselves as rational and logical.',535),('en','Honesty of answering.',536),('en','Trust characterizes people who basically assume that other people have good intentions. They presuppose honesty and good intentions in others. Low scores are a sign of skepticism and restraint. Other people are not assumed from the outset exclusively good intentions.',537),('en','Vulnerability is a hallmark of being unable to deal with stress and stress. People with high scores first need to control their own emotions in stressful situations. People with low values control their emotions even in difficult situations.',538),('en','Carry out on:',540),('en','What\'s waiting for you',541),('en','Personality psychology has been involved since the beginning of the 20th century with the development of models that can be used to describe character traits. The Personality Study you conducted is based on the Five Factor Model, also known as the Big Five.',542),('en','This model describes five dimensions of the personal inventory:',543),('en','Extraversion',544),('en','Emotional Lability',545),('en','Agreeableness',546),('en','Conscientiousness',547),('en','Openness To Experience',548),('en','Reliable and meaningful results require that three criteria be met when applying a personality test:',549),('en','Objectivity',550),('en','Validity',551),('en','Reliability',552),('en','Objectivity',553),('en','The objectivity of a personality test relates both to its implementation and to the evaluation and interpretation.',554),('en','Objectivity of implementation',555),('en','The performance of the test must lead to the same result, regardless of the subject. The computer-aided automation of the test procedure guarantees this independence.',556),('en','Objectivity of the evaluation',557),('en','The evaluation must be carried out in the same way regardless of external influences.',558),('en','Objectivity of interpretation',559),('en','The interpretation of the results must be independent of the evaluating person.',560),('en','The personality study conducted by you is based on the implementation, evaluation and interpretation of the results by artificial intelligence. Influences of a possibly evaluating or interpreting person are excluded per se.',561),('en','Validity',562),('en','Validity is the validity with which the underlying statements (items) actually measure the properties to be measured.',563),('en','The personality study is based on the scientifically recognized test method of the Five Factor Model, which is the validity of the statements given.',564),('en','Reliability',565),('en','Reliability refers to the accuracy of a test procedure, i. Repeated performance leads to the same results. Statistical-mathematical methods exist for determining reliability.',566),('en','The high reliability of the individual statements (items) proves the independence of random fluctuations in the result.',567),('en','Carried out by:',568),('en','Date of execution: ',569),('en','self-assessment',570),('en','external assessment',571),('en','total assessment',572),('en','We present the evaluation of the external assessment. The results describe the person\'s view of your personality.',573),('en','The results are based on the execution of the external assessment',574),('en','The Personal Inventory ....',576),('en','The trial version of the personal inventory ...',577),('en','Personality psychology has been involved since the beginning of the 20th century with the development of models that can be used to describe character traits. The Personality Study you conducted is based on the Five Factor Model, also known as the Big Five.',578),('en','This model describes five dimensions of personality:',579),('en','Extraversion',580),('en','Emotional Lability',581),('en','Agreeableness',582),('en','Conscientiousness',583),('en','Openness To Experience',584),('en','Each of these dimensions has six subcategories, so-called facets.',585),('en','The study is based on the statements (so-called items) that you evaluated during the course of the test. It was estimated on a scale of 1 to 10,',586),('en','The results of your personality study are explained on the following pages of this evaluation. The result is also still available online for inspection. You can send the evaluation again at any time via e-mail as a PDF file.',587),('en','The evaluation is divided into the following sections:',588),('en','Evaluation in the overview',589),('en','All results of the personality study are described here. For each dimension of personality as well as for all facets you will receive description based on the results of your evaluation.',590),('en','Your most pronounced\nCharacter traits',591),('en','This part of the evaluation focuses on the character traits that are most pronounced in you that means where the highest values were found for you.',592),('en','Your character traits with low severity.',593),('en','This section describes the facets of your personality where the score was low.',594),('en','Evaluation in detail - Definitions',595),('en','This area once again highlights all dimensions and facets in detail and complements the personal results through the definitions of the individual character traits.',596),('en','Personality psychology has been involved since the beginning of the 20th century with the development of models that can be used to describe character traits. The personality study is based on the Five Factor Model, also called Big Five. The trial version you performed limited to a section of all dimensions and facets. The complete study captures the five basic dimensions:',597),('en','Create an account today and complete the entire study.',598),('en','The test was harder than expected.',599),('en','The questions were understandable.',600),('en','The questions were difficult to answer.',601),('en','The test took longer than expected.',602),('en','The results have confirmed me.',603),('en','The results surprised me positively.',604),('en','I found the results understandable.',605),('en','I found the results comprehensive.',606),('en','I needed about the following time to answer (in minutes).',607),('en','The test gave me motivation to continue to deal with my personality.',608),('en','I can imagine doing the test again within the next few months to see how I\'ve developed.',609),('en','I will recommend the test on occasion.',610);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_categories`
--

DROP TABLE IF EXISTS `vw_categories`;
/*!50001 DROP VIEW IF EXISTS `vw_categories`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_categories` AS SELECT 
 1 AS `ID`,
 1 AS `color`,
 1 AS `text`,
 1 AS `lancode`,
 1 AS `textdesc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_dimensions`
--

DROP TABLE IF EXISTS `vw_dimensions`;
/*!50001 DROP VIEW IF EXISTS `vw_dimensions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_dimensions` AS SELECT 
 1 AS `ID`,
 1 AS `color`,
 1 AS `text`,
 1 AS `lancode`,
 1 AS `textdesc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_items`
--

DROP TABLE IF EXISTS `vw_items`;
/*!50001 DROP VIEW IF EXISTS `vw_items`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_items` AS SELECT 
 1 AS `ID`,
 1 AS `text`,
 1 AS `lancode`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_reports_tex_cat`
--

DROP TABLE IF EXISTS `vw_reports_tex_cat`;
/*!50001 DROP VIEW IF EXISTS `vw_reports_tex_cat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_reports_tex_cat` AS SELECT 
 1 AS `categoryID`,
 1 AS `text`,
 1 AS `lancode`,
 1 AS `valuefrom`,
 1 AS `valueto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_reports_tex_dim`
--

DROP TABLE IF EXISTS `vw_reports_tex_dim`;
/*!50001 DROP VIEW IF EXISTS `vw_reports_tex_dim`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_reports_tex_dim` AS SELECT 
 1 AS `dimensionID`,
 1 AS `text`,
 1 AS `lancode`,
 1 AS `valuefrom`,
 1 AS `valueto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_tests`
--

DROP TABLE IF EXISTS `vw_tests`;
/*!50001 DROP VIEW IF EXISTS `vw_tests`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_tests` AS SELECT 
 1 AS `lancode`,
 1 AS `text`,
 1 AS `textdesc`,
 1 AS `ID`,
 1 AS `isTrial`,
 1 AS `hasForeign`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_tests_with_dim`
--

DROP TABLE IF EXISTS `vw_tests_with_dim`;
/*!50001 DROP VIEW IF EXISTS `vw_tests_with_dim`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_tests_with_dim` AS SELECT 
 1 AS `ID`,
 1 AS `isTrial`,
 1 AS `categoryID`,
 1 AS `itemID`,
 1 AS `text`,
 1 AS `lancode`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'uniqueID'
--
/*!50003 DROP PROCEDURE IF EXISTS `P_CALCULATE_CATEGORIES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CALCULATE_CATEGORIES`(p_ID INTEGER, p_categoryID VARCHAR(6), p_lancode VARCHAR(2))
BEGIN
 	DECLARE v_value FLOAT;
 	DECLARE v_value_tmp FLOAT;
 	DECLARE v_categorytext VARCHAR(4000);
 	DECLARE v_color VARCHAR(7);
    DECLARE v_definition VARCHAR(4000);
	DECLARE v_resulttext VARCHAR(4000);
	DECLARE v_dimensionID VARCHAR(4);
	DECLARE v_itemID INTEGER;
 	DECLARE v_sign FLOAT;
 	DECLARE v_count FLOAT;
    DECLARE v_i INTEGER;
 	DECLARE c_items CURSOR FOR SELECT itemID, sign FROM category_items WHERE categoryID = p_categoryID AND itemID IN (SELECT itemsID FROM results_items WHERE results_mainID = p_ID);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_i = 1;
 	-- get category text
 	SELECT text, color, textdesc INTO v_categorytext, v_color, v_definition FROM vw_categories WHERE ID = p_categoryID AND lancode = p_lancode;
 	-- calculate value
 	SET v_value = 0;
 	SET v_count = 0;
 	OPEN c_items;
	SET v_i = 0;
	WHILE v_i = 0 DO
		FETCH c_items INTO v_itemID, v_sign;
        IF v_i = 0 THEN
			SET v_count = v_count + 1;
			SELECT value INTO v_value_tmp FROM results_items WHERE results_mainID = p_ID AND itemsID = v_itemID;
			IF v_sign = 1 THEN
				SET v_value = v_value + v_value_tmp;
			ELSE
				SET v_value = v_value - v_value_tmp + 11;
			END IF;
		END IF;
	END	WHILE;
	CLOSE c_items;
 	SET v_value = ROUND((v_value / (v_count/10)),0);
    SELECT dimensionID INTO v_dimensionID FROM dimension_categories WHERE categoryID = p_categoryID;
	-- get result text
	SELECT text INTO v_resulttext FROM vw_reports_tex_cat WHERE lancode = p_lancode AND categoryID = p_categoryID AND valuefrom <= v_value AND valueto >= v_value;
     -- Insert result
 	INSERT INTO results_categories VALUES (p_ID, p_categoryID, v_value, v_categorytext, v_color, v_definition, v_resulttext, v_dimensionID,NULL,NULL);
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_CALCULATE_DIMENSIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CALCULATE_DIMENSIONS`(p_ID INTEGER, p_dimensionID VARCHAR(6), p_lancode VARCHAR(2))
BEGIN
 	DECLARE v_value FLOAT;
 	DECLARE v_value_tmp FLOAT;
 	DECLARE v_dimensiontext VARCHAR(4000);
 	DECLARE v_categoryID VARCHAR(6);
 	DECLARE v_color VARCHAR(7);
    DECLARE v_definition VARCHAR(4000);
	DECLARE v_resulttext VARCHAR(4000);
 	DECLARE v_sign FLOAT;
 	DECLARE v_count FLOAT;
    DECLARE v_i INTEGER;
 	DECLARE c_categories CURSOR FOR SELECT categoryID, sign FROM dimension_categories WHERE dimensionID = p_dimensionID AND categoryID in (SELECT categoryID FROM results_categories WHERE results_mainID = p_ID);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_i = 1;
 	-- get dimension text
	SELECT text, color, textdesc INTO v_dimensiontext, v_color, v_definition FROM vw_dimensions WHERE ID = p_dimensionID AND lancode = p_lancode;
 	-- calculate value
 	SET v_value = 0;
 	SET v_count = 0;
 	OPEN c_categories;
	SET v_i = 0;
	WHILE v_i = 0 DO
 		FETCH c_categories INTO v_categoryID, v_sign;
		IF v_i = 0 THEN
 			SET v_count = v_count + 1;
 			SELECT value INTO v_value_tmp FROM results_categories WHERE results_mainID = p_ID AND categoryID = v_categoryID;
 			IF v_sign = 1 THEN
 				SET v_value = v_value + v_value_tmp;
 			ELSE
 				SET v_value = v_value - v_value_tmp + 110;
			END IF;
		END IF;
	END WHILE;
	CLOSE c_categories;
	SET v_value = ROUND((v_value / v_count),0);
	-- get result text
	SELECT text INTO v_resulttext FROM vw_reports_tex_dim WHERE lancode = p_lancode AND dimensionID = p_dimensionID AND valuefrom <= v_value AND valueto >= v_value;
    -- Insert result
 	INSERT INTO results_dimensions VALUES (p_ID, p_dimensionID, v_value, v_dimensiontext, v_color, v_definition, v_resulttext);
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_CALCULATE_MAIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CALCULATE_MAIN`(p_ID INTEGER)
BEGIN
 	DECLARE v_ID INTEGER;
 	DECLARE v_testID VARCHAR(12);
 	DECLARE v_hasDimensions INTEGER;
 	DECLARE v_dimensionID VARCHAR(4);
 	DECLARE v_lancode VARCHAR(2);
 	DECLARE v_categoryID VARCHAR(6);
    DECLARE v_i INTEGER;
    DECLARE v_ii INTEGER;
 	DECLARE v_count FLOAT;
   	DECLARE v_sum FLOAT;
   	DECLARE v_value FLOAT;
 	DECLARE c_tests CURSOR FOR SELECT ID, testID, lancode FROM results_main WHERE calculated = 0 AND ID = p_ID FOR UPDATE;
	DECLARE c_categories CURSOR FOR SELECT categoryID FROM test_categories WHERE testID = v_testID AND categoryID <> 'TEST';
	DECLARE c_dimensions CURSOR FOR SELECT dimensionID FROM test_dimensions WHERE testID = v_testID;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_i = 1, v_ii = 1;
 	-- get all tests which are not caclulated yet
	SET v_value = NULL;
 	OPEN c_tests;
	SET v_i = 0;
 	WHILE v_i = 0 DO
		FETCH c_tests INTO v_ID, v_testID, v_lancode;
 		-- calculate categories first
 		OPEN c_categories;
		SET v_ii = 0;
 		WHILE v_ii = 0 DO
			FETCH c_categories INTO v_categoryID;
            IF v_ii = 0 THEN
				CALL P_CALCULATE_CATEGORIES (v_ID, v_categoryID, v_lancode);
			END IF;
 		END	WHILE;
 		CLOSE c_categories;
 		-- do we have to calculate dimensions?
 		SELECT hasDimensions INTO v_hasDimensions FROM tests WHERE ID = v_testID;
 		IF v_hasDimensions = 1 THEN
			OPEN c_dimensions;
			SET v_ii = 0;
			WHILE v_ii = 0 DO
				FETCH c_dimensions INTO v_dimensionID;
				IF v_ii = 0 THEN
					CALL P_CALCULATE_DIMENSIONS (v_ID, v_dimensionID, v_lancode);
				END IF;
			END WHILE;
 		END IF;
 		CLOSE c_dimensions;
 		-- do we have to calculate validity?
        SELECT count(*) INTO v_count FROM test_categories WHERE testID = v_testID AND categoryID = 'TEST';
        IF v_count > 0 THEN
   			SELECT count(*) INTO v_count FROM results_items WHERE results_mainID = p_ID AND itemsID in (SELECT itemID FROM category_items WHERE categoryID = 'TEST');
   			SELECT SUM(value) INTO v_sum FROM results_items WHERE results_mainID = p_ID AND itemsID in (SELECT itemID FROM category_items WHERE categoryID = 'TEST');
			SET v_value = ROUND((v_sum / (v_count/10)),0);
        END IF;
 		-- set calculated flag
 		UPDATE results_main SET calculated = 1, validity = v_value WHERE ID = v_ID;
 	END WHILE;
 	CLOSE c_tests;
	CALL P_CALCULATE_ORDER (v_ID);
    -- CALL P_GENERATE_TITLE (v_ID, v_testID, v_lancode);
    CALL P_GENERATE_JSON (v_ID, v_testID, v_lancode);
    CALL P_GENERATE_COLOR_SCHEME (v_ID, v_testID, v_lancode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_CALCULATE_ORDER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CALCULATE_ORDER`(p_ID INTEGER)
BEGIN
	DECLARE v_categoryID VARCHAR(6);
	DECLARE v_value FLOAT;
	DECLARE v_lastvalue FLOAT;
    DECLARE v_count INTEGER;
    DECLARE v_rank INTEGER;
    DECLARE v_lastrank INTEGER;
    DECLARE v_i INTEGER;
	DECLARE c_categories CURSOR FOR SELECT categoryID, value FROM results_categories WHERE results_mainID = p_ID ORDER BY value FOR UPDATE;
	DECLARE c_rank1 CURSOR FOR SELECT categoryID, rank FROM results_categories WHERE results_mainID = p_ID ORDER BY rank FOR UPDATE;
	DECLARE c_rank2 CURSOR FOR SELECT categoryID, rank FROM results_categories WHERE results_mainID = p_ID ORDER BY rank DESC FOR UPDATE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_i = 1;

    UPDATE results_categories SET maincategory = null WHERE results_mainID = p_ID;
	OPEN c_categories;
	SET v_i = 0;
	SET v_count = 0;
	SET v_rank = 0;
	SET v_lastvalue = 0;
 	WHILE v_i = 0 DO
		FETCH c_categories INTO v_categoryID, v_value; 
        IF v_i = 0 THEN
			SET v_count = v_count + 1;
			IF v_value <> v_lastvalue THEN
				SET v_rank = v_count;
            END IF;
            UPDATE results_categories SET rank = v_rank WHERE categoryID = v_categoryID AND results_mainID = p_ID;
			SET v_lastvalue = v_value;
        END IF;
  	END WHILE;
 	CLOSE c_categories;      

	OPEN c_rank1;
	SET v_i = 0;
	SET v_lastvalue = 0;
	SET v_count = 0;
	SET v_rank = 0;
	SET v_lastrank = 0;
 myloop1:	WHILE v_i = 0 DO
		FETCH c_rank1 INTO v_categoryID, v_rank; 
        IF v_i = 0 THEN
			SET v_count = v_count + 1;
            IF v_count < 6 THEN
				UPDATE results_categories SET maincategory = -1 WHERE categoryID = v_categoryID AND results_mainID = p_ID;
			ELSE
				IF v_rank = v_lastrank THEN
					UPDATE results_categories SET maincategory = -1 WHERE categoryID = v_categoryID AND results_mainID = p_ID;
				ELSE
					LEAVE myloop1;
                END IF;
            END IF;
			SET v_lastrank = v_rank;
		END IF;
  	END WHILE;
 	CLOSE c_rank1;      

	OPEN c_rank2;
	SET v_i = 0;
	SET v_lastvalue = 0;
	SET v_count = 0;
	SET v_rank = 0;
	SET v_lastrank = 0;
 myloop2:	WHILE v_i = 0 DO
		FETCH c_rank2 INTO v_categoryID, v_rank; 
        IF v_i = 0 THEN
			SET v_count = v_count + 1;
            IF v_count < 6 THEN
				UPDATE results_categories SET maincategory = 1 WHERE categoryID = v_categoryID AND results_mainID = p_ID;
			ELSE
				IF v_rank = v_lastrank THEN
					UPDATE results_categories SET maincategory = 1 WHERE categoryID = v_categoryID AND results_mainID = p_ID;
				ELSE
					LEAVE myloop2;
                END IF;
            END IF;
			SET v_lastrank = v_rank;
		END IF;
  	END WHILE;
 	CLOSE c_rank2;      

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_GENERATE_COLOR_SCHEME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GENERATE_COLOR_SCHEME`(p_ID INTEGER, p_testID VARCHAR(12), p_lancode VARCHAR(2))
BEGIN
    DECLARE v_i INTEGER;
    DECLARE v_ii INTEGER;
    DECLARE v_len INTEGER;
    DECLARE v_count INTEGER;
 	DECLARE v_text VARCHAR(4000);
 	DECLARE v_range VARCHAR(4000);
 	DECLARE v_domain VARCHAR(4000);
 	DECLARE v_color VARCHAR(7);
	DECLARE v_dimensionID VARCHAR(4);
 	DECLARE v_categoryID VARCHAR(4);
 	DECLARE c_dim_seq CURSOR FOR SELECT dimensionID FROM test_dimensions WHERE testID = p_testID ORDER BY position;
 	DECLARE c_cat_seq CURSOR FOR SELECT d.categoryID FROM test_categories t, dimension_categories d WHERE testID = p_testID AND t.categoryID=d.categoryID AND t.categoryID<>'TEST' ORDER BY position;
   	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_i = 1;

	SET v_range = '"#ffffff","';
	SET v_domain = '"TOPICS","';
	OPEN c_dim_seq;

	SET v_i = 0;
	WHILE v_i = 0 DO
		FETCH c_dim_seq INTO v_dimensionID;
 		IF v_i = 0 THEN
  			SELECT dimensiontext, color INTO v_text, v_color FROM results_dimensions WHERE results_mainID = p_ID AND dimensionID = v_dimensionID;
			SET v_range = CONCAT(v_range,v_color,'","');
			SET v_domain = CONCAT(v_domain,v_text,'","');
 		END	IF;
	END WHILE;
 	CLOSE c_dim_seq;

	OPEN c_cat_seq;
	SELECT FOUND_ROWS() INTO v_len;

	SET v_count = 0;
	SET v_i = 0;
	WHILE v_i = 0 DO
		FETCH c_cat_seq INTO v_categoryID;
		IF v_i = 0 THEN
			SET v_count = v_count + 1;
  			SELECT categorytext, color INTO v_text, v_color FROM results_categories WHERE results_mainID = p_ID AND categoryID = v_categoryID;
			IF (v_count < v_len) THEN
				SET v_range = CONCAT(v_range,v_color,'","');
				SET v_domain = CONCAT(v_domain,v_text,'","');
			ELSE
				SET v_range = CONCAT(v_range,v_color,'"');
				SET v_domain = CONCAT(v_domain,v_text,'"');
            END IF;
 		END	IF;
	END WHILE;

    UPDATE results_main SET crange = v_range, domain = v_domain WHERE ID = p_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_GENERATE_JSON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GENERATE_JSON`(p_ID INTEGER, p_testID VARCHAR(12), p_lancode VARCHAR(2))
BEGIN
 	DECLARE v_value INTEGER;
 	DECLARE v_text VARCHAR(4000);
    DECLARE v_result VARCHAR(10000);
    DECLARE v_len_dim INTEGER;
    DECLARE v_len_cat INTEGER;
    DECLARE v_count_dim INTEGER;
    DECLARE v_count_cat INTEGER;
    DECLARE v_i INTEGER;
    DECLARE v_ii INTEGER;
	DECLARE v_dimensionID VARCHAR(4);
 	DECLARE v_categoryID VARCHAR(4);
 	DECLARE c_dim_seq CURSOR FOR SELECT dimensionID FROM test_dimensions WHERE testID = p_testID ORDER BY position;
 	DECLARE c_cat_seq CURSOR FOR SELECT d.categoryID FROM test_categories t, dimension_categories d WHERE testID = p_testID AND dimensionID = v_dimensionID AND t.categoryID=d.categoryID AND t.categoryID<>'TEST' ORDER BY position;
   	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_i = 1, v_ii = 1;

	SET v_result = '{"name": "TOPICS", "children": [';
	SET v_count_dim = 0;

	OPEN c_dim_seq;
	SELECT FOUND_ROWS() INTO v_len_dim;
	SET v_i = 0;
	WHILE v_i = 0 DO
		FETCH c_dim_seq INTO v_dimensionID;
 		IF v_i = 0 THEN
			SET v_count_dim = v_count_dim + 1;
  			SELECT CONVERT(value,CHAR), dimensiontext INTO v_value, v_text FROM results_dimensions WHERE results_mainID = p_ID AND dimensionID = v_dimensionID;
			SET v_result = CONCAT(v_result,'{"name": "',v_text,'","children": [');

			SET v_ii = 0;
			SET v_count_cat = 0;
			OPEN c_cat_seq;
			SELECT FOUND_ROWS() INTO v_len_cat;

 			WHILE v_ii = 0 DO
				FETCH c_cat_seq INTO v_categoryID;
				IF v_ii = 0 THEN
					SET v_count_cat = v_count_cat + 1;

					SELECT CONVERT(value,CHAR), categorytext INTO v_value, v_text FROM results_categories WHERE results_mainID = p_ID AND categoryID = v_categoryID;
					IF (v_count_cat < v_len_cat) THEN
						SET v_result = CONCAT(v_result,'{"name": "', v_text,'", "size": ', v_value, '},');
					ELSE
						SET v_result = CONCAT(v_result,'{"name": "', v_text,'", "size": ', v_value, '}');
                    END IF;
				END	 IF;
			END WHILE;
			CLOSE c_cat_seq;
			SET v_i = 0;
			SET v_result = SUBSTRING_INDEX(v_result, 1, (CHAR_LENGTH(v_result)-1));
			IF (v_count_dim < v_len_dim) THEN
				SET v_result = CONCAT(v_result,']},');
			ELSE
				SET v_result = CONCAT(v_result,']}');
            END IF;
 		END	IF;
	END WHILE;
 	CLOSE c_dim_seq;
	SET v_result = SUBSTRING_INDEX(v_result, 1, (CHAR_LENGTH(v_result)-1));
    SET v_result = CONCAT(v_result, ']}');

    UPDATE results_main SET json = v_result WHERE ID = p_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_GENERATE_TITLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GENERATE_TITLE`(p_ID INTEGER, p_testID VARCHAR(12), p_lancode VARCHAR(2))
BEGIN
 	DECLARE v_position FLOAT;
	DECLARE v_page VARCHAR(100);
   	DECLARE v_textdesc VARCHAR(4000);
   	DECLARE v_text VARCHAR(4000);
	DECLARE v_IDreference INT;
    DECLARE v_isAverage INT;
    DECLARE v_firstname VARCHAR(100);
    DECLARE v_surname VARCHAR(100);
    DECLARE v_email VARCHAR(100);
    DECLARE v_day VARCHAR(100);
    DECLARE v_count INT;
    
	SET v_position = 100;
    SET v_page = 'TITLE';
    
    -- Test description
    SELECT text INTO v_textdesc FROM vw_tests WHERE ID = p_testID AND lancode = p_lancode;

	SELECT IDreference, isAverage INTO v_IDreference, v_isAverage FROM results_main WHERE ID = p_id;

	if (v_IDreference is NULL) then
		SELECT text INTO v_text FROM translations where textID = 570 AND lancode = p_lancode; -- Selbsteinschätzung
	end if;
	if (v_IDreference is not NULL AND v_isAverage is NULL) then
		SELECT text INTO v_text FROM translations where textID = 571 AND lancode = p_lancode; -- Fremdeinschätzung
	end if;

	if (v_isAverage = 1) then
		SELECT text INTO v_text FROM translations where textID = 572 AND lancode = p_lancode; -- Gesamteinschätzung
    end if;
        
	SET v_position = v_position + 10;
    INSERT INTO results_texts VALUES (p_ID, v_position, CONCAT (v_textdesc,' (',v_text,')'), '<h1 style="font-weight: bold;">', '</h1><br><br>', v_page);
    
	SELECT count(*) INTO v_count FROM results_main r, member m WHERE r.ID = p_id and r.memberID = m.id;
	IF v_count = 1 THEN
		SELECT m.firstname, m.surname, m.email, r.day INTO v_firstname, v_surname, v_email, v_day FROM results_main r, member m WHERE r.ID = p_id and r.memberID = m.id;
	ELSE
		SELECT '-', '-', IFNULL(email,'-'), day INTO v_firstname, v_surname, v_email, v_day FROM results_main WHERE ID = p_id;
	END IF;

	SET v_position = v_position + 10;
    INSERT INTO results_texts VALUES (p_ID, v_position, CONCAT (v_firstname,' ',v_surname), '<h1 style="font-weight: bold;">', '</h1>', v_page);

   	SELECT IDreference, isAverage INTO v_IDreference, v_isAverage FROM results_main WHERE ID = p_id;

	if (v_IDreference is NULL) then
		SELECT text INTO v_text FROM translations where textID = 540 AND lancode = p_lancode;
		SET v_position = v_position + 10;
		INSERT INTO results_texts VALUES (p_ID, v_position, v_text, '<p>', '', v_page);

		SELECT text INTO v_text FROM translations where textID = 569 AND lancode = p_lancode;
		SET v_position = v_position + 10;
		INSERT INTO results_texts VALUES (p_ID, v_position, CONCAT(v_day,'.'), '', '</p>', v_page);
		
	end if;
	if (v_IDreference is not NULL AND v_isAverage is NULL) then
		SELECT foreignemail, day INTO v_email, v_day FROM results_main WHERE ID = p_id;

		SELECT text INTO v_text FROM translations where textID = 568 AND lancode = p_lancode;
		SET v_position = v_position + 10;
		INSERT INTO results_texts VALUES (p_ID, v_position, CONCAT(v_text,v_email), '<h3>', '</h3>', v_page);
	end if;
    -- fixed texts
    INSERT INTO results_texts (results_mainID,position,text,starttags,endtags,page) SELECT p_id,pos,fixtext,starttags,endtags,page FROM vw_reporttexts_fixed WHERE lancode = p_lancode AND testID = p_testID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_categories`
--

/*!50001 DROP VIEW IF EXISTS `vw_categories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_categories` AS select `categories`.`ID` AS `ID`,`categories`.`color` AS `color`,`t1`.`text` AS `text`,`l1`.`lancode` AS `lancode`,`t2`.`text` AS `textdesc` from ((((`categories` join `translations` `t1` on((`categories`.`textID` = `t1`.`textID`))) join `languages` `l1` on((`l1`.`lancode` = `t1`.`lancode`))) join `translations` `t2` on((`categories`.`textIDdesc` = `t2`.`textID`))) join `languages` `l2` on((`l2`.`lancode` = `t2`.`lancode`))) where (`l1`.`lancode` = `l2`.`lancode`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dimensions`
--

/*!50001 DROP VIEW IF EXISTS `vw_dimensions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dimensions` AS select `dimensions`.`ID` AS `ID`,`dimensions`.`color` AS `color`,`t1`.`text` AS `text`,`l1`.`lancode` AS `lancode`,`t2`.`text` AS `textdesc` from ((((`dimensions` join `translations` `t1` on((`dimensions`.`textID` = `t1`.`textID`))) join `languages` `l1` on((`l1`.`lancode` = `t1`.`lancode`))) join `translations` `t2` on((`dimensions`.`textIDdesc` = `t2`.`textID`))) join `languages` `l2` on((`l2`.`lancode` = `t2`.`lancode`))) where (`l1`.`lancode` = `l2`.`lancode`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_items`
--

/*!50001 DROP VIEW IF EXISTS `vw_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_items` AS select `items`.`ID` AS `ID`,`translations`.`text` AS `text`,`languages`.`lancode` AS `lancode` from ((`items` join `translations` on((`items`.`textID` = `translations`.`textID`))) join `languages` on((`languages`.`lancode` = `translations`.`lancode`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reports_tex_cat`
--

/*!50001 DROP VIEW IF EXISTS `vw_reports_tex_cat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reports_tex_cat` AS select `reporttexts_categories`.`categoryID` AS `categoryID`,`translations`.`text` AS `text`,`languages`.`lancode` AS `lancode`,`reporttexts_categories`.`valuefrom` AS `valuefrom`,`reporttexts_categories`.`valueto` AS `valueto` from ((`reporttexts_categories` join `translations` on((`reporttexts_categories`.`textID` = `translations`.`textID`))) join `languages` on((`languages`.`lancode` = `translations`.`lancode`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reports_tex_dim`
--

/*!50001 DROP VIEW IF EXISTS `vw_reports_tex_dim`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reports_tex_dim` AS select `reporttexts_dimensions`.`dimensionID` AS `dimensionID`,`translations`.`text` AS `text`,`languages`.`lancode` AS `lancode`,`reporttexts_dimensions`.`valuefrom` AS `valuefrom`,`reporttexts_dimensions`.`valueto` AS `valueto` from ((`reporttexts_dimensions` join `translations` on((`reporttexts_dimensions`.`textID` = `translations`.`textID`))) join `languages` on((`languages`.`lancode` = `translations`.`lancode`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_tests`
--

/*!50001 DROP VIEW IF EXISTS `vw_tests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tests` AS select `l1`.`lancode` AS `lancode`,`t1`.`text` AS `text`,`t2`.`text` AS `textdesc`,`tests`.`ID` AS `ID`,`tests`.`isTrial` AS `isTrial`,`tests`.`hasForeign` AS `hasForeign` from ((((`tests` join `translations` `t1` on((`tests`.`textID` = `t1`.`textID`))) join `languages` `l1` on((`l1`.`lancode` = `t1`.`lancode`))) join `translations` `t2` on((`tests`.`textIDdesc` = `t2`.`textID`))) join `languages` `l2` on((`l2`.`lancode` = `t2`.`lancode`))) where (`l1`.`lancode` = `l2`.`lancode`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_tests_with_dim`
--

/*!50001 DROP VIEW IF EXISTS `vw_tests_with_dim`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tests_with_dim` AS select `tests`.`ID` AS `ID`,`tests`.`isTrial` AS `isTrial`,`test_categories`.`categoryID` AS `categoryID`,`category_items`.`itemID` AS `itemID`,`vw_items`.`text` AS `text`,`languages`.`lancode` AS `lancode` from ((((`tests` join `test_categories` on((`tests`.`ID` = `test_categories`.`testID`))) join `category_items` on((`test_categories`.`categoryID` = `category_items`.`categoryID`))) join `vw_items` on((`vw_items`.`ID` = `category_items`.`itemID`))) join `languages` on((`vw_items`.`lancode` = `languages`.`lancode`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-02 13:10:31
