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
  `courseId` bigint(20) unsigned NOT NULL,
  `teacherId` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT '/img/download.png',
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.course: ~3 rows (приблизительно)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`courseId`, `teacherId`, `name`, `description`, `img`) VALUES
	(1, 2, 'Internet History, Technology, and Security', 'The impact of technology and networks on our lives, culture, and society continues to increase. The very fact that you can take this course from anywhere in the world requires a technological infrastructure that was designed, engineered, and built over the past sixty years. To function in an information-centric world, we need to understand the workings of network technology. This course will open up the Internet and show you how it was created, who created it and how it works. Along the way we will meet many of the innovators who developed the Internet and Web technologies that we use today.', '/img/download.png'),
	(2, 2, 'R Programming', 'In this course you will learn how to program in R and how to use R for effective data analysis. You will learn how to install and configure software necessary for a statistical programming environment and describe generic programming language concepts as they are implemented in a high-level statistical language. The course covers practical issues in statistical computing which includes programming in R, reading data into R, accessing R packages, writing R functions, debugging, profiling R code, and organizing and commenting R code. Topics in statistical data analysis will provide working examples.', '/img/download.png'),
	(3, 2, 'Financial Engineering and Risk Management Part I', 'Financial Engineering is a multidisciplinary field involving finance and economics, mathematics, statistics, engineering and computational methods. The emphasis of FE & RM Part II will be on the use of simple stochastic models to (i) solve portfolio optimization problems (ii) price derivative securities in various asset classes including equities and credit and (iii) consider some advanced applications of financial engineering including algorithmic trading and the pricing of real options. We will also consider the role that financial engineering played during the financial crisis.\r\n\r\nWe hope that students who complete the course and the prerequisite course (FE & RM Part I) will have a good understanding of the "rocket science" behind financial engineering. But perhaps more importantly, we hope they will also understand the limitations of this theory in practice and why financial models should always be treated with a healthy degree of skepticism. ', '/img/download.png');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.course_tag
DROP TABLE IF EXISTS `course_tag`;
CREATE TABLE IF NOT EXISTS `course_tag` (
  `courseId` bigint(20) NOT NULL,
  `tagId` int(10) unsigned NOT NULL,
  KEY `FK_course_tag_course` (`courseId`),
  KEY `FK_course_tag_tag` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.course_tag: ~4 rows (приблизительно)
DELETE FROM `course_tag`;
/*!40000 ALTER TABLE `course_tag` DISABLE KEYS */;
INSERT INTO `course_tag` (`courseId`, `tagId`) VALUES
	(43136064333301185, 1),
	(2, 2),
	(3, 2),
	(1, 7),
	(1, 4);
/*!40000 ALTER TABLE `course_tag` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.enrolment
DROP TABLE IF EXISTS `enrolment`;
CREATE TABLE IF NOT EXISTS `enrolment` (
  `sessionId` bigint(20) unsigned NOT NULL,
  `studentId` int(10) unsigned NOT NULL,
  `status` smallint(5) unsigned NOT NULL COMMENT '1 - current; 2 - pass; 3 - upcoming',
  KEY `sessionId` (`sessionId`),
  KEY `studentId` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.enrolment: ~3 rows (приблизительно)
DELETE FROM `enrolment`;
/*!40000 ALTER TABLE `enrolment` DISABLE KEYS */;
INSERT INTO `enrolment` (`sessionId`, `studentId`, `status`) VALUES
	(1, 2, 1),
	(2, 2, 3),
	(3, 2, 2);
/*!40000 ALTER TABLE `enrolment` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.lesson
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE IF NOT EXISTS `lesson` (
  `lessonId` bigint(20) unsigned NOT NULL,
  `sessionId` bigint(20) unsigned NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`lessonId`),
  KEY `FK_lesson_session` (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.lesson: ~3 rows (приблизительно)
DELETE FROM `lesson`;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` (`lessonId`, `sessionId`, `content`) VALUES
	(1, 1, '<h2>Test content 1</h2>\n<p><iframe src="http://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" width="317" height="193"></iframe></p>\n<p>rewrew</p>'),
	(2, 1, '<h2>Test content 2</h2>'),
	(3, 1, '<h2>Lecture 1</h2>\n<p>Text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text.</p>\n<p><iframe src="http://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" width="400" height="300"></iframe></p>');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.session
DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `sessionId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `courseId` bigint(20) unsigned NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '3' COMMENT '1 - life; 2 - ended; 3 - upcoming',
  `passRating` float DEFAULT NULL COMMENT 'rating to pass the course',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.session: ~3 rows (приблизительно)
DELETE FROM `session`;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` (`sessionId`, `courseId`, `startDate`, `endDate`, `status`, `passRating`) VALUES
	(1, 1, '2014-11-01', '2015-04-01', 1, NULL),
	(2, 2, '2015-02-01', '2015-06-01', 3, NULL),
	(3, 3, '2014-07-01', '2014-11-01', 2, NULL);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentId` int(10) unsigned NOT NULL,
  KEY `FK_student_user` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.student: ~7 rows (приблизительно)
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
  `tagName` varchar(50) NOT NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.tag: ~2 rows (приблизительно)
DELETE FROM `tag`;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`tagId`, `tagName`) VALUES
	(1, 'arts'),
	(2, 'biology'),
	(3, 'chemistry'),
	(4, 'computer science'),
	(5, 'economics'),
	(6, 'law'),
	(7, 'mathematics'),
	(8, 'physics');
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
	(5, 'Johns Hopkins University', 'Professor', NULL),
	(6, 'University of Michigan', 'Associate Professor', NULL),
	(17, 'Columbia University', 'Co-Director, Center for Financial Engineering', NULL),
	(2, 'Johns Hopkins University', 'Professor', NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


-- Дамп структуры для таблица educationalwebsite.test
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `testId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lessonId` bigint(20) unsigned NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`testId`)
) ENGINE=InnoDB AUTO_INCREMENT=6732803274136634639 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.test: ~2 rows (приблизительно)
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы educationalwebsite.user: ~11 rows (приблизительно)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userId`, `email`, `login`, `firstName`, `lastName`, `password`, `photo`, `info`) VALUES
	(2, 'satoshisadie@gmail.com', 'satoshisadie', 'Alexander', 'Semenets', '12345', '/img/avatar.jpg', NULL),
	(3, 'SichaUA@gmail.com', 'Sicha', NULL, NULL, '12345', '/img/avatar.jpg', NULL),
	(4, 'toxan56@ukr.net', 'toxan56', NULL, NULL, '12345', '/img/avatar.jpg', NULL),
	(5, 'teacher1@gmail.com', 'BrianC', 'Brian', 'Caffo', '123', '/img/avatar.jpg', 'Brian Caffo, PhD is a professor in the Department of Biostatistics at the Johns Hopkins University Bloomberg School of Public Health. He graduated from the Department of Statistics at the University of Florida in 2001. He works in the fields of computational statistics and neuroinformatics and co-created the SMART (www.smart-stats.org) working group. He has been the recipient of the Presidential Early Career Award for Scientist (PECASE) and Engineers and Bloomberg School of Public Health Golden Apple and AMTRA teaching awards.'),
	(6, 'teacher2@gmail.com', 'CharlesS', 'Charles', 'Severance', '123', '/img/avatar.jpg', 'Charles Severance (a.k.a. Dr. Chuck - www.dr-chuck.com) is a Clinical Associate Professor at the University of Michigan School of Information, where he teaches various technology-oriented courses including programming, database design, and Web development. Chuck has written a number of books includingUsing Google App Engine and Python for Informatics. His research field is in the building of learning management systems such as Sakai, Moodle, Blackboard, ANGEL, and others. He was the chief architect for the Sakai Project, a learning management system used at about 300 schools worldwide and wrote the book, Sakai:Free as in Freedom that describes his experiences as one of the leaders of the project. In the mid-1990s he was the host of Internet:TCI, a national television talk show about the Internet that ran for several years on the TCI cable system. Some of the videos used in this class will come from that television program. He is currently a columnist for the IEEE Computer Magazine and writes a monthly column called "Computing Conversations" that features video interviews with famous technology leaders and innovators. The course will also include some videos from those columns and interviews.'),
	(10, 'student1@gmail.com', 'student1', NULL, NULL, '12', '/img/avatar.jpg', NULL),
	(11, 'student2@gmail.com', 'student2', NULL, NULL, '12', '/img/avatar.jpg', NULL),
	(12, 'student3@gmail.com', 'student3', NULL, NULL, '12', '/img/avatar.jpg', NULL),
	(16, 'qwe', 'qwe', NULL, NULL, 'qwe', '/img/avatar.jpg', NULL),
	(17, 'email', 'MartinH', 'Martin', 'Haugh', 'password', '/img/avatar.jpg', 'Professor Martin Haugh is co-Director of the Center for Financial Engineering at Columbia University. He originally joined Columbia University in January 2002 and was a faculty member in the Department of Industrial Engineering and Operations Research until June 2005. During this time his teaching and research focused on financial engineering. Between 2005 and 2009, Professor Haugh worked in the hedge fund industry in both New York and London, specializing in equity and credit derivatives. He returned to Columbia in July 2009. Professor Haugh holds a PhD in Operations Research from MIT and also holds Master of Science degrees from the University of Oxford and University College Cork.'),
	(19, 'satoshisadie@gmail.com', 'Alex', NULL, NULL, '123', '/img/avatar.jpg', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
