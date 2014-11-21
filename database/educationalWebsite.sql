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


-- Dumping structure for table educationalwebsite.admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` bigint(20) unsigned NOT NULL,
  KEY `FK__user` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.admin: ~3 rows (approximately)
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminId`) VALUES
	(2),
	(3),
	(4);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


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


-- Dumping structure for table educationalwebsite.course_tag
DROP TABLE IF EXISTS `course_tag`;
CREATE TABLE IF NOT EXISTS `course_tag` (
  `courseTagId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course` bigint(20) NOT NULL,
  `tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`courseTagId`),
  KEY `FK_course_tag_course` (`course`),
  KEY `FK_course_tag_tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.course_tag: ~4 rows (approximately)
DELETE FROM `course_tag`;
/*!40000 ALTER TABLE `course_tag` DISABLE KEYS */;
INSERT INTO `course_tag` (`courseTagId`, `course`, `tag`) VALUES
	(1, 43136064333301185, 1),
	(2, 2, 2),
	(3, 3, 2),
	(4, 1, 2);
/*!40000 ALTER TABLE `course_tag` ENABLE KEYS */;


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


-- Dumping structure for table educationalwebsite.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentId` bigint(20) unsigned NOT NULL,
  KEY `FK_student_user` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.student: ~4 rows (approximately)
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`studentId`) VALUES
	(10),
	(11),
	(12),
	(16);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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

-- Dumping data for table educationalwebsite.student_course_status: ~2 rows (approximately)
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


-- Dumping structure for table educationalwebsite.tag
DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `tagId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.tag: ~2 rows (approximately)
DELETE FROM `tag`;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`tagId`, `tag`) VALUES
	(1, 'math'),
	(2, 'programming');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;


-- Dumping structure for table educationalwebsite.teacher
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacherId` bigint(20) unsigned NOT NULL,
  `educationalEstablishment` varchar(100) DEFAULT NULL,
  `academicStatus` varchar(100) DEFAULT NULL,
  KEY `FK__user` (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.teacher: ~2 rows (approximately)
DELETE FROM `teacher`;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacherId`, `educationalEstablishment`, `academicStatus`) VALUES
	(5, 'dsdv', 'sdv'),
	(6, 'sdv', NULL),
	(17, 'cfgyu', 'cghj');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


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
  `email` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `photo` varchar(100) DEFAULT '/img/avatar.jpg',
  `info` text,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table educationalwebsite.user: ~10 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`, `email`, `login`, `password`, `photo`, `info`) VALUES
	(2, 'satoshisadie@gmail.com', 'satoshisadie', '12345', '/img/avatar.jpg', NULL),
	(3, 'SichaUA@gmail.com', 'Sicha', '12345', '/img/avatar.jpg', NULL),
	(4, 'toxan56@ukr.net', 'toxan56', '12345', '/img/avatar.jpg', NULL),
	(5, 'teacher1@gmail.com', 'teacher1', '123', '/img/avatar.jpg', NULL),
	(6, 'teacher2@gmail.com', 'teacher2', '123', '/img/avatar.jpg', NULL),
	(10, 'student1@gmail.com', 'student1', '12', '/img/avatar.jpg', NULL),
	(11, 'student2@gmail.com', 'student2', '12', '/img/avatar.jpg', NULL),
	(12, 'student3@gmail.com', 'student3', '12', '/img/avatar.jpg', NULL),
	(16, 'qwe', 'qwe', 'qwe', '/img/avatar.jpg', NULL),
	(17, 'ghj', 'ghj', '123', '/img/avatar.jpg', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;