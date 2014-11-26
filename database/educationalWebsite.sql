-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.29 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных educationalwebsite
DROP DATABASE IF EXISTS `educationalwebsite`;
CREATE DATABASE IF NOT EXISTS `educationalwebsite` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `educationalwebsite`;


-- Дамп структуры для таблица educationalwebsite.admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` int(10) unsigned NOT NULL,
  KEY `FK__user` (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.admin: ~2 rows (приблизительно)
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminId`) VALUES
	(3),
	(4);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.course
DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseId` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT '/img/download.png',
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `teacher` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  KEY `FK_course_teacher` (`teacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.course: ~4 rows (приблизительно)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`courseId`, `name`, `description`, `img`, `startDate`, `endDate`, `teacher`) VALUES
	(1, 'Test2', '', '/img/download.png', '2014-12-12', '2014-11-11', 6),
	(2, 'test course 2', 'text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text ', '/img/download.png', '2014-04-13', '2014-10-13', 5),
	(3, 'Financial Engineering and Risk Management Part I', 'Financial Engineering is a multidisciplinary field involving finance and economics, mathematics, statistics, engineering and computational methods. The emphasis of FE & RM Part II will be on the use of simple stochastic models to (i) solve portfolio optimization problems (ii) price derivative securities in various asset classes including equities and credit and (iii) consider some advanced applications of financial engineering including algorithmic trading and the pricing of real options. We will also consider the role that financial engineering played during the financial crisis.\r\n\r\nWe hope that students who complete the course and the prerequisite course (FE & RM Part I) will have a good understanding of the "rocket science" behind financial engineering. But perhaps more importantly, we hope they will also understand the limitations of this theory in practice and why financial models should always be treated with a healthy degree of skepticism. ', '/img/download.png', '2014-11-23', '2015-05-12', 17),
	(43136064333301185, 'New Course', 'Description', '/img/download.png', '2014-12-12', '2015-04-04', 5);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.course_tag
DROP TABLE IF EXISTS `course_tag`;
CREATE TABLE IF NOT EXISTS `course_tag` (
  `course` bigint(20) NOT NULL,
  `tag` int(10) unsigned NOT NULL,
  KEY `FK_course_tag_course` (`course`),
  KEY `FK_course_tag_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.course_tag: ~4 rows (приблизительно)
DELETE FROM `course_tag`;
/*!40000 ALTER TABLE `course_tag` DISABLE KEYS */;
INSERT INTO `course_tag` (`course`, `tag`) VALUES
	(43136064333301185, 1),
	(2, 2),
	(3, 2),
	(1, 2);
/*!40000 ALTER TABLE `course_tag` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.lesson
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE IF NOT EXISTS `lesson` (
  `lessonId` bigint(20) NOT NULL,
  `courseId` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`lessonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.lesson: ~3 rows (приблизительно)
DELETE FROM `lesson`;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` (`lessonId`, `courseId`, `content`) VALUES
	(1, 1, '<h2>Test content 1</h2>\n<p><iframe src="http://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" width="317" height="193"></iframe></p>\n<p>rewrew</p>'),
	(2, 1, '<h2>Test content 2</h2>'),
	(3, 1, '<h2>Lecture 1</h2>\n<p>Text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text.</p>\n<p><iframe src="http://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" width="400" height="300"></iframe></p>');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentId` int(10) unsigned NOT NULL,
  KEY `FK_student_user` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.student: ~5 rows (приблизительно)
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`studentId`) VALUES
	(2),
	(10),
	(11),
	(12),
	(16),
	(18);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.student_course
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE IF NOT EXISTS `student_course` (
  `courseId` bigint(20) unsigned NOT NULL,
  `studentId` int(10) unsigned NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  KEY `FK_student_course_course` (`courseId`),
  KEY `FK_student_course_student_course_status` (`status`),
  KEY `FK_student_course_user` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.student_course: ~7 rows (приблизительно)
DELETE FROM `student_course`;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` (`courseId`, `studentId`, `status`) VALUES
	(2, 2, 2),
	(3, 2, 1),
	(1, 2, 3),
	(2, 2, 3),
	(3, 2, 3),
	(1, 2, 2),
	(43136064333301185, 11, 1);
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.student_course_status
DROP TABLE IF EXISTS `student_course_status`;
CREATE TABLE IF NOT EXISTS `student_course_status` (
  `statusId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.student_course_status: ~3 rows (приблизительно)
DELETE FROM `student_course_status`;
/*!40000 ALTER TABLE `student_course_status` DISABLE KEYS */;
INSERT INTO `student_course_status` (`statusId`, `status`) VALUES
	(1, 'past'),
	(2, 'current'),
	(3, 'upcoming');
/*!40000 ALTER TABLE `student_course_status` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.student_test_passing
DROP TABLE IF EXISTS `student_test_passing`;
CREATE TABLE IF NOT EXISTS `student_test_passing` (
  `passingId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `test` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `result` float unsigned NOT NULL COMMENT '0% <= res <= 100%',
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`passingId`),
  KEY `FK__test` (`test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.student_test_passing: ~0 rows (приблизительно)
DELETE FROM `student_test_passing`;
/*!40000 ALTER TABLE `student_test_passing` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_test_passing` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.tag
DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `tagId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.tag: ~2 rows (приблизительно)
DELETE FROM `tag`;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`tagId`, `tag`) VALUES
	(1, 'math'),
	(2, 'programming');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.teacher
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacherId` int(10) unsigned NOT NULL,
  `educationalEstablishment` varchar(100) DEFAULT NULL,
  `academicStatus` varchar(100) DEFAULT NULL,
  `university` varchar(100) DEFAULT NULL,
  KEY `FK__user` (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.teacher: ~3 rows (приблизительно)
DELETE FROM `teacher`;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacherId`, `educationalEstablishment`, `academicStatus`, `university`) VALUES
	(5, 'dsdv', 'sdv', NULL),
	(6, 'sdv', NULL, NULL),
	(17, 'cfgyu', 'cghj', NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.test
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `testId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lessonId` bigint(20) unsigned NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`testId`)
) ENGINE=InnoDB AUTO_INCREMENT=6732803274136634639 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.test: ~0 rows (приблизительно)
DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`testId`, `lessonId`, `content`) VALUES
	(1137817271919660877, 1, '{"id":1137817271919660877,"lessonId":1,"questions":[{"text":"Question 1","answers":[{"text":"question 1 answer 1 c","isCorrect":true},{"text":"question 1 answer 2 ic","isCorrect":false},{"text":"question 1 answer 3 c","isCorrect":true}]},{"text":"Question 2","answers":[{"text":"question 2 answer 1 ic","isCorrect":false},{"text":"question 2 answer 2 c","isCorrect":true},{"text":"question 2 answer 3 ic","isCorrect":false},{"text":"question 2 answer 4 ic","isCorrect":false}]},{"text":"Question 3","answers":[{"text":"question 3 answer 1 c","isCorrect":true},{"text":"question 3 answer 2 c","isCorrect":true}]}]}'),
	(5294134890473304542, 2, '{"id":5294134890473304542,"lessonId":2,"questions":[{"text":"wew","answers":[{"text":"rewrew","isCorrect":false},{"text":"rwer","isCorrect":false}]}]}');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `password` text NOT NULL,
  `photo` varchar(100) DEFAULT '/img/avatar.jpg',
  `info` text,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.user: ~10 rows (приблизительно)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`, `email`, `login`, `firstName`, `lastName`, `password`, `photo`, `info`) VALUES
	(2, 'satoshisadie@gmail.com', 'satoshisadie', NULL, NULL, '12345', '/img/avatar.jpg', NULL),
	(3, 'SichaUA@gmail.com', 'Sicha', NULL, NULL, '12345', '/img/avatar.jpg', NULL),
	(4, 'toxan56@ukr.net', 'toxan56', NULL, NULL, '12345', '/img/avatar.jpg', NULL),
	(5, 'teacher1@gmail.com', 'teacher1', NULL, NULL, '123', '/img/avatar.jpg', NULL),
	(6, 'teacher2@gmail.com', 'teacher2', NULL, NULL, '123', '/img/avatar.jpg', NULL),
	(10, 'student1@gmail.com', 'student1', NULL, NULL, '12', '/img/avatar.jpg', NULL),
	(11, 'student2@gmail.com', 'student2', NULL, NULL, '12', '/img/avatar.jpg', NULL),
	(12, 'student3@gmail.com', 'student3', NULL, NULL, '12', '/img/avatar.jpg', NULL),
	(16, 'qwe', 'qwe', NULL, NULL, 'qwe', '/img/avatar.jpg', NULL),
	(17, 'email', 'login', 'Martin', 'Haugh', 'password', '/img/avatar.jpg', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
