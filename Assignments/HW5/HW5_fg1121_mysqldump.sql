-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: warehouse    Database: fg1121_cs060
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(4) unsigned NOT NULL,
  `course_title` varchar(32) NOT NULL,
  `course_subj` varchar(16) NOT NULL,
  `course_code` int(4) NOT NULL,
  `course_term` char(2) NOT NULL,
  `course_year` int(4) NOT NULL,
  `course_teacher` int(10) unsigned NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `course_teacher` (`course_teacher`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`course_teacher`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (6001,'Intro to Fake News Recognition','JN',331,'FA',2018,9002),(6002,'Hotel Investment and Management','BU',317,'FA',2018,9002),(6003,'Analysis','MATH',301,'SP',2019,9003),(6004,'Programming','CS',101,'SP',2018,9004);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations`
--

DROP TABLE IF EXISTS `evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluations` (
  `eval_id` int(10) unsigned NOT NULL,
  `eval_value` int(10) unsigned NOT NULL,
  `eval_student` int(10) unsigned NOT NULL,
  `eval_course` int(10) unsigned NOT NULL,
  PRIMARY KEY (`eval_id`),
  KEY `eval_student` (`eval_student`),
  KEY `eval_course` (`eval_course`),
  CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`eval_student`) REFERENCES `students` (`student_id`),
  CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`eval_course`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations`
--

LOCK TABLES `evaluations` WRITE;
/*!40000 ALTER TABLE `evaluations` DISABLE KEYS */;
INSERT INTO `evaluations` VALUES (4001,10,1002,6001),(4002,7,1004,6001),(4003,9,1005,6001),(4004,8,1006,6001),(4005,10,1002,6002),(4006,7,1007,6002),(4007,6,1010,6002),(4008,8,1011,6003),(4009,9,1012,6003),(4010,7,1014,6003),(4011,10,1002,6003),(4012,10,1005,6004),(4013,8,1006,6004);
/*!40000 ALTER TABLE `evaluations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `score_id` int(10) unsigned NOT NULL,
  `score_value` int(2) NOT NULL,
  `score_student` int(10) unsigned NOT NULL,
  `score_course` int(10) unsigned NOT NULL,
  PRIMARY KEY (`score_id`),
  KEY `score_student` (`score_student`),
  KEY `score_course` (`score_course`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`score_student`) REFERENCES `students` (`student_id`),
  CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`score_course`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (2001,99,1002,6001),(2002,93,1003,6001),(2003,77,1004,6001),(2004,87,1005,6001),(2005,84,1006,6001),(2006,95,1002,6002),(2007,73,1007,6002),(2008,94,1008,6002),(2009,74,1009,6002),(2010,75,1010,6002),(2011,80,1011,6003),(2012,85,1012,6003),(2013,78,1013,6003),(2014,79,1014,6003),(2015,96,1002,6003),(2016,97,1003,6004),(2017,83,1004,6004),(2018,91,1005,6004),(2019,86,1006,6004),(2020,81,1007,6004);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` int(4) unsigned NOT NULL,
  `student_name` varchar(32) NOT NULL,
  `student_class` int(4) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1001,'Trump',2023),(1002,'Obama',2022),(1003,'Bush',2022),(1004,'Clinton',2022),(1005,'Reagan',2022),(1006,'Carter',2022),(1007,'Ford',2022),(1008,'Nixon',2022),(1009,'Johnson',2022),(1010,'Kennedy',2022),(1011,'Eisenhower',2022),(1012,'Truman',2022),(1013,'Roosevelt',2022),(1014,'Hoover',2022),(1015,'Coolidge',2022);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `teacher_id` int(4) unsigned NOT NULL,
  `teacher_name` varchar(32) NOT NULL,
  `teacher_wa` int(11) NOT NULL,
  `teacher_title` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (9001,'Amy',0,'Honors Professor'),(9002,'Bob',6,'Associate Professor'),(9003,'Cindy',5,'Assistant Professor'),(9004,'David',2,'Lecturer');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-19 23:30:58
