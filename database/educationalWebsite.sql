-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for educationalwebsite
DROP DATABASE IF EXISTS `educationalwebsite`;
CREATE DATABASE IF NOT EXISTS `educationalwebsite` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `educationalwebsite`;


-- Dumping structure for table educationalwebsite.course
DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseId` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.course: ~4 rows (approximately)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`courseId`, `name`, `description`) VALUES
	(1, 'Test2', ''),
	(2, 'test course 2', 'text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text '),
	(3, 'test course 3', 'text text text text text text text text text text text '),
	(43136064333301185, 'New Course', 'Description');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- Dumping structure for table educationalwebsite.lesson
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE IF NOT EXISTS `lesson` (
  `lessonId` bigint(20) NOT NULL,
  `courseId` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`lessonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.lesson: ~3 rows (approximately)
DELETE FROM `lesson`;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` (`lessonId`, `courseId`, `content`) VALUES
	(1, 1, '<p>Test content 1</p>\n<p><iframe src="http://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" width="317" height="193"></iframe></p>\n<p>rewrew</p>'),
	(2, 1, '<h2>Test content 2</h2>'),
	(3, 1, '<h2>Lecture 1</h2>\n<p>Text text text text text text text text text text text text text</p>\n<p>text text text text text text text text text text text text text</p>\n<p>text text text text text text text text text text text text text</p>\n<p>text text text text text text text text text text text text text.</p>\n<p><iframe src="http://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" width="324" height="198"></iframe></p>');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;


-- Dumping structure for table educationalwebsite.student_course
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE IF NOT EXISTS `student_course` (
  `studentCourseId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(20) NOT NULL,
  `student` bigint(20) unsigned NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`studentCourseId`),
  KEY `FK_student_course_course` (`course`),
  KEY `FK_student_course_student_course_status` (`status`),
  KEY `FK_student_course_user` (`student`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.student_course: ~8 rows (approximately)
DELETE FROM `student_course`;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` (`studentCourseId`, `course`, `student`, `status`) VALUES
	(1, 2, 10, 2),
	(2, 3, 10, 1),
	(3, 1, 10, 3),
	(4, 2, 11, 3),
	(5, 3, 11, 3),
	(6, 1, 11, 2),
	(7, 43136064333301185, 11, 1);
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;


-- Dumping structure for table educationalwebsite.student_course_status
DROP TABLE IF EXISTS `student_course_status`;
CREATE TABLE IF NOT EXISTS `student_course_status` (
  `statusId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.student_course_status: ~3 rows (approximately)
DELETE FROM `student_course_status`;
/*!40000 ALTER TABLE `student_course_status` DISABLE KEYS */;
INSERT INTO `student_course_status` (`statusId`, `status`) VALUES
	(1, 'past'),
	(2, 'current'),
	(3, 'upcoming');
/*!40000 ALTER TABLE `student_course_status` ENABLE KEYS */;


-- Dumping structure for table educationalwebsite.student_test_passing
DROP TABLE IF EXISTS `student_test_passing`;
CREATE TABLE IF NOT EXISTS `student_test_passing` (
  `passingId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `test` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `result` float unsigned NOT NULL COMMENT '0% <= res <= 100%',
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`passingId`),
  KEY `FK__test` (`test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.student_test_passing: ~0 rows (approximately)
DELETE FROM `student_test_passing`;
/*!40000 ALTER TABLE `student_test_passing` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_test_passing` ENABLE KEYS */;


-- Dumping structure for table educationalwebsite.test
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `testId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`testId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.test: ~0 rows (approximately)
DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


-- Dumping structure for table educationalwebsite.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL COMMENT '0 - female; 1 - male',
  `location` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT '/img/avatar.jpg',
  `info` text,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_user_user_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.user: ~8 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`, `login`, `birthday`, `gender`, `location`, `photo`, `info`, `email`, `password`, `type`) VALUES
	(2, 'satoshisadie', NULL, NULL, NULL, '/img/avatar.jpg', NULL, 'satoshisadie@gmail.com', '12345', 1),
	(3, 'Sicha', NULL, NULL, NULL, '/img/avatar.jpg', NULL, 'SichaUA@gmail.com', '12345', 1),
	(4, 'toxan56', NULL, NULL, NULL, '/img/avatar.jpg', NULL, 'toxan56@ukr.net', '12345', 1),
	(5, 'teacher1', NULL, NULL, NULL, '/img/avatar.jpg', NULL, 'teacher1@gmail.com', '123', 2),
	(6, 'teacher2', NULL, NULL, NULL, '/img/avatar.jpg', NULL, 'teacher2@gmail.com', '123', 2),
	(10, 'student1', NULL, NULL, NULL, '/img/avatar.jpg', NULL, 'student1@gmail.com', '12', 3),
	(11, 'student2', NULL, NULL, NULL, '/img/avatar.jpg', NULL, 'student2@gmail.com', '12', 3),
	(12, 'student3', '2014-11-19', NULL, NULL, '/img/avatar.jpg', NULL, 'student3@gmail.com', '12', 3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table educationalwebsite.user_type
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
  `typeId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.user_type: ~3 rows (approximately)
DELETE FROM `user_type`;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` (`typeId`, `type`) VALUES
	(1, 'admin'),
	(2, 'teacher'),
	(3, 'student');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
