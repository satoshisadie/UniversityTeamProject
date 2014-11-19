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


-- Дамп структуры для таблица educationalwebsite.course
DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseId` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.course: ~4 rows (приблизительно)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`courseId`, `name`, `description`) VALUES
	(1, 'Test2', ''),
	(2, 'test course 2', 'text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text '),
	(3, 'test course 3', 'text text text text text text text text text text text '),
	(43136064333301185, 'New Course', 'Description');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


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
	(1, 1, '<p>Test content 1</p>\n<p><iframe src="http://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" width="317" height="193"></iframe></p>\n<p>rewrew</p>'),
	(2, 1, '<h2>Test content 2</h2>'),
	(3, 1, '<h2>Lecture 1</h2>\n<p>Text text text text text text text text text text text text text</p>\n<p>text text text text text text text text text text text text text</p>\n<p>text text text text text text text text text text text text text</p>\n<p>text text text text text text text text text text text text text.</p>\n<p><iframe src="http://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" width="324" height="198"></iframe></p>');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
