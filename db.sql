/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.1.32-community : Database - ai_receptnst
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ai_receptnst` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ai_receptnst`;

/*Table structure for table `assign_staff` */

DROP TABLE IF EXISTS `assign_staff`;

CREATE TABLE `assign_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `assign_staff` */

insert  into `assign_staff`(`id`,`uid`,`staff_id`,`date`) values 
(1,101,37,'2019-12-28 12:54:46'),
(2,102,39,'2019-12-28 12:55:02'),
(3,103,37,'2019-12-28 12:55:15'),
(4,104,2,'2019-12-28 12:55:27'),
(5,105,37,'2019-12-28 13:08:00'),
(6,106,3,'2019-12-26 13:08:06'),
(7,107,37,'2019-12-29 14:53:43'),
(8,108,38,'2019-12-29 15:09:28'),
(9,110,39,'2019-12-30 11:57:37'),
(10,0,37,'2020-01-11 13:35:09'),
(11,0,38,'2020-01-11 13:36:32'),
(12,0,39,'2020-01-11 13:38:35'),
(13,1,37,'2020-01-11 13:42:36'),
(14,1,38,'2020-01-11 13:42:45'),
(15,1,39,'2020-01-11 13:42:52'),
(16,1,37,'2020-01-11 13:42:56'),
(17,1,38,'2020-01-11 13:43:45'),
(18,1,39,'2020-01-11 13:43:59'),
(19,1,37,'2020-01-11 13:44:22'),
(20,1,38,'2020-01-11 13:44:35'),
(21,1,39,'2020-01-11 13:45:01'),
(22,1,37,'2020-01-11 13:45:38'),
(23,6,38,'2020-01-11 14:04:18'),
(24,7,39,'2020-01-11 14:14:33'),
(25,7,37,'2020-01-11 14:15:25'),
(26,7,38,'2020-01-11 14:16:25'),
(27,7,39,'2020-01-11 14:16:43'),
(28,7,37,'2020-01-11 14:16:51'),
(29,1,38,'2020-01-11 15:19:49'),
(30,1,39,'2020-01-11 15:21:01'),
(31,1,37,'2020-01-11 15:21:24'),
(32,1,38,'2020-01-11 15:21:36');

/*Table structure for table `assign_work` */

DROP TABLE IF EXISTS `assign_work`;

CREATE TABLE `assign_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `work` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `assign_work` */

insert  into `assign_work`(`id`,`staff_id`,`work`,`date`,`finish_date`) values 
(19,35,'level0.pdf','2019-12-22','2019-12-20'),
(20,36,'level1.3.pdf','2019-12-22','2019-12-12'),
(21,37,'level0.pdf','2019-12-22','2019-12-03'),
(22,37,'level1.1.pdf','2019-12-22','2019-12-11'),
(23,37,'level1.3.pdf','2019-12-22','2019-12-17'),
(24,38,'level0.pdf','2019-12-22','2019-12-02'),
(25,37,'level1.3.pdf','2019-12-22','2019-12-28'),
(26,39,'level0.pdf','2020-01-02','2020-01-23');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`type`) values 
(1,'admin','manager','admin'),
(37,'ccc123','ccc123','staff'),
(38,'aaa123','aaa123','staff'),
(39,'samuel','123456','staff');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `uid` int(50) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=latin1;

/*Data for the table `message` */

insert  into `message`(`message_id`,`message`,`date`,`uid`,`rid`) values 
(57,'hello. ','2020-01-01',24,8),
(58,'hello. hi. ','2020-01-01',24,8),
(59,'hello. hi. hello. ','2020-01-01',24,8),
(60,'hello. ','2020-01-01',25,8),
(61,'hello. hi. ','2020-01-01',25,8),
(62,'hello. hi. photo. ','2020-01-01',25,8),
(63,'hello. hi. photo. photo. ','2020-01-01',25,8),
(64,'hello. hi. photo. photo. photo. ','2020-01-01',25,8),
(65,'hello. ','2020-01-01',26,8),
(66,'hello. ','2020-01-01',27,8),
(67,'hello. how are you. ','2020-01-01',27,10),
(68,'hello. how are you. hello how are you. ','2020-01-01',27,10),
(69,'hello. how are you. hello how are you. chat with. ','2020-01-01',27,10),
(70,'hello. ','2020-01-01',28,8),
(71,'hello. who are you. ','2020-01-01',28,10),
(72,'hello. who are you. hello. ','2020-01-01',28,8),
(73,'hello. who are you. hello. wario. ','2020-01-01',28,8),
(74,'hello. who are you. hello. wario. hello. ','2020-01-01',28,8),
(75,'hello. who are you. hello. wario. hello. hello. ','2020-01-01',28,8),
(76,'hello. who are you. hello. wario. hello. hello. how to deposit cash. ','2020-01-01',28,8),
(77,'hello. who are you. hello. wario. hello. hello. how to deposit cash. hello. ','2020-01-01',28,8),
(78,'hello. who are you. hello. wario. hello. hello. how to deposit cash. hello. hello. ','2020-01-01',28,8),
(79,'hello. who are you. hello. wario. hello. hello. how to deposit cash. hello. hello. can I help you. ','2020-01-01',28,8),
(80,'hello. who are you. hello. wario. hello. hello. how to deposit cash. hello. hello. can I help you. can you help me. ','2020-01-01',28,8),
(81,'hello. who are you. hello. wario. hello. hello. how to deposit cash. hello. hello. can I help you. can you help me. how can you help me. ','2020-01-01',28,8),
(82,'hello. who are you. hello. wario. hello. hello. how to deposit cash. hello. hello. can I help you. can you help me. how can you help me. can you. ','2020-01-01',28,8),
(83,'hello. who are you. hello. wario. hello. hello. how to deposit cash. hello. hello. can I help you. can you help me. how can you help me. can you. Google. ','2020-01-01',28,8),
(84,'hello. who are you. hello. wario. hello. hello. how to deposit cash. hello. hello. can I help you. can you help me. how can you help me. can you. Google. Bangalore. ','2020-01-01',28,8),
(85,'hello. ','2020-01-01',29,8),
(86,'hello. create bank account. ','2020-01-01',29,8),
(87,'hello. create bank account. hello. ','2020-01-01',29,8),
(88,'hello. create bank account. hello. bank account. ','2020-01-01',29,8),
(89,'hello. create bank account. hello. bank account. hello. ','2020-01-01',29,8),
(90,'hello. create bank account. hello. bank account. hello. hello. ','2020-01-01',29,8),
(91,'hello. create bank account. hello. bank account. hello. hello. hello. ','2020-01-01',29,8),
(92,'hello. create bank account. hello. bank account. hello. hello. hello. Indian women. ','2020-01-01',29,8),
(93,'hello. create bank account. hello. bank account. hello. hello. hello. Indian women. hello. ','2020-01-01',29,8),
(94,'hello. ','2020-01-01',30,8),
(95,'hello. how are you. ','2020-01-01',30,10),
(96,'hello. how are you. how to create bank account. ','2020-01-01',30,7),
(97,'hello. how are you. how to create bank account. Odia. ','2020-01-01',30,7),
(98,'hello. ','2020-01-01',31,8),
(99,'hello. bank account. ','2020-01-01',31,8),
(100,'hello. bank account. how to create bank account. ','2020-01-01',31,7),
(101,'hello. ','2020-01-01',32,8),
(102,'hello. hello. ','2020-01-01',32,8),
(103,'hello. hello. hi. ','2020-01-01',32,8),
(114,'hello. ','2020-01-01',36,8),
(115,'hello. ','2020-01-01',37,8),
(116,'what is your name. ','2020-01-01',37,9),
(117,'what is your job. ','2020-01-01',37,11),
(118,'how to create bank account. ','2020-01-01',37,7),
(119,'hello man. ','2020-01-01',38,8),
(120,'Digitamil. ','2020-01-01',38,1),
(121,'today. ','2020-01-01',38,1),
(122,'hello how are you. ','2020-01-01',38,10),
(123,'what is your f****** name. ','2020-01-01',38,9),
(124,'what is your programming. ','2020-01-01',38,11),
(125,'what s your name. message. what s your name. ','2020-01-01',38,9),
(126,'what s your job. ','2020-01-01',38,11),
(127,'account. ','2020-01-01',38,7),
(128,'application how can I withdraw amount from my account. ','2020-01-01',38,1),
(129,'how can I withdraw. ','2020-01-01',38,1),
(130,'can I withdraw amount from my account. ','2020-01-01',38,1),
(131,'how can I help you. ','2020-01-01',38,1),
(132,'how can I withdraw amount. ','2020-01-01',38,1),
(133,'how can how to Metro cash and carry. ','2020-01-01',38,3),
(134,'exam. ','2020-01-01',38,1),
(135,'how can we do in the. ','2020-01-01',38,1),
(136,'cash from my account. ','2020-01-01',38,13),
(137,'cash from my account. ','2020-01-01',38,13),
(138,'how can I withdraw cash from my account. ','2020-01-01',38,13),
(139,'how can we draw amount from my account. ','2020-01-01',38,13),
(140,'I need to get lost. ','2020-01-01',38,1),
(141,'cash. ','2020-01-01',38,3),
(142,'good name please. ','2020-01-01',38,1),
(143,'Kante. ','2020-01-01',38,1),
(144,'what is your house. ','2020-01-01',38,11),
(145,'best go away. ','2020-01-01',38,1),
(146,'please go away. contact. hello. ','2020-01-01',38,8),
(147,'hello. ','2020-01-01',38,8),
(148,'what are you doing. ','2020-01-01',38,10),
(149,'where is your house. ','2020-01-01',38,11),
(150,'what you want. ','2020-01-01',38,10),
(151,'you are so disturbing. ','2020-01-01',38,10),
(152,'my name is Rohit. ','2020-01-01',38,9),
(153,'hello. ','2020-01-01',40,8),
(154,'how are you. ','2020-01-01',40,10),
(155,'how are you. ','2020-01-01',40,10),
(156,'who are you. ','2020-01-01',40,10),
(157,'how are you where are you from. ','2020-01-01',40,14),
(158,'how are you where are you. ','2020-01-01',40,14),
(159,'how to start an account. ','2020-01-01',40,7),
(160,'are you receptionist. ','2020-01-01',40,14),
(161,'Google assistant. ','2020-01-01',41,15),
(162,'hello. ','2020-01-01',42,8),
(163,'hello how can I help you. ','2020-01-01',42,12),
(164,'how are you man. ','2020-01-01',42,14),
(165,'are you mad. ','2020-01-01',42,14),
(166,'icon how to create. ','2020-01-01',42,7),
(167,'hello do you like pubg. ','2020-01-01',43,16),
(168,'your name. ','2020-01-01',43,9),
(169,'your name. ','2020-01-01',43,9),
(170,'hello. ','2020-01-04',89,8),
(171,'hello can you hear me. ','2020-01-04',91,12),
(172,'How can I. ','2020-01-04',91,12),
(173,'what is your name. ','2020-01-04',91,9),
(174,'how can you start a new account. ','2020-01-04',91,12),
(175,'how can I create an account. ','2020-01-04',91,7),
(176,'how can you help me. ','2020-01-04',91,12),
(177,'hello. ','2020-01-04',101,8),
(178,'job. ','2020-01-04',101,11),
(179,'your name. ','2020-01-04',101,9),
(180,'hello. ','2020-01-05',0,8),
(181,'what is your name. ','2020-01-05',0,9),
(182,'what is your job. ','2020-01-05',0,11),
(183,'i. ','2020-01-05',0,13),
(184,'i. ','2020-01-05',0,13),
(185,'i. ','2020-01-05',0,13),
(186,'i. ','2020-01-05',0,13),
(187,'i. ','2020-01-05',0,13),
(188,'hello. ','2020-01-05',2,8),
(189,'hello. ','2020-01-11',0,8),
(190,'can you help me. ','2020-01-11',0,12),
(191,'what is your name. ','2020-01-11',0,9),
(192,'what is your job. ','2020-01-11',0,11),
(193,'hello excuse. ','2020-01-11',0,8),
(194,'hello. ','2020-01-11',0,8),
(195,'what is your name. ','2020-01-11',0,9),
(196,'can you help me. ','2020-01-11',0,12),
(197,'what is your job. ','2020-01-11',0,11),
(198,'hello. ','2020-01-11',0,8),
(199,'I need to see one stop. ','2020-01-11',0,16),
(200,'I need to see one staff. ','2020-01-11',0,16),
(201,'hello. ','2020-01-11',0,8),
(202,'where is staff. ','2020-01-11',0,17),
(203,'I need to see one staff. ','2020-01-11',0,16),
(204,'can I see one staff. ','2020-01-11',0,16),
(205,'can I meet you an staff. ','2020-01-11',0,16),
(206,'where is this manager. ','2020-01-11',0,17),
(207,'your job. ','2020-01-11',0,11),
(208,'thank you. ','2020-01-11',0,14),
(209,'lot of thanks I am fine thank you. ','2020-01-11',0,19),
(210,'thank you. ','2020-01-11',0,19),
(211,'thank you thank you. ','2020-01-11',0,19),
(212,'how to start one account. ','2020-01-11',0,7),
(213,'how to create. ','2020-01-11',0,7),
(214,'how to create one account. ','2020-01-11',0,7),
(215,'how to start account. ','2020-01-11',0,7),
(216,'your manager. ','2020-01-11',0,18),
(217,'where is your manager. ','2020-01-11',0,17),
(218,'how can I help you. ','2020-01-11',0,12),
(219,'please help you. ','2020-01-11',0,12),
(220,'ok thank you. ','2020-01-11',0,19),
(221,'hello ','2020-01-11',0,8),
(222,'ok ','2020-01-11',0,22),
(223,'can you help me ','2020-01-11',0,12),
(224,'what is your job ','2020-01-11',0,11),
(225,'i ','2020-01-11',0,21),
(226,'thank you ','2020-01-11',0,19),
(227,'how to create a bank account ','2020-01-11',0,7),
(228,'your job ','2020-01-11',0,11),
(229,'my job is it ','2020-01-11',0,11),
(230,'you are not doing your job ','2020-01-11',0,14),
(231,'ok ok ','2020-01-11',0,22),
(232,'thanks ','2020-01-11',0,24),
(233,'thank you ','2020-01-11',0,19),
(234,'ok ','2020-01-11',0,22),
(235,'bye see you later ','2020-01-11',0,19),
(236,'tell your father name ','2020-01-11',0,18),
(237,'hello hi naveen suddenly ','2020-01-11',0,8),
(238,'are ','2020-01-11',0,14),
(239,'can you see me ','2020-01-11',0,23),
(240,'ok ','2020-01-11',0,22),
(241,'messi me ','2020-01-11',0,23),
(242,'can you see me ','2020-01-11',0,23),
(243,'ok ','2020-01-11',0,22),
(244,'bye see you later ','2020-01-11',0,25),
(245,'ok ','2020-01-11',0,22),
(246,'achi type of bank account is more size ','2020-01-11',0,26),
(247,'i ','2020-01-11',0,21),
(248,'you are so bad ','2020-01-11',0,14),
(249,'i ','2020-01-11',0,21),
(250,'hello hello ','2020-01-11',0,8),
(251,'where is manager ','2020-01-11',0,17),
(252,'India map where is ','2020-01-11',0,17),
(253,'worst manager ','2020-01-11',0,20),
(254,'where is manager ','2020-01-11',0,17),
(255,'the manager ','2020-01-11',0,21),
(256,'where is manager ','2020-01-11',0,17),
(257,'how to take cash ','2020-01-11',0,5),
(258,'hello ','2020-01-11',0,8),
(259,'take care ','2020-01-11',0,27),
(260,'how to take cash ','2020-01-11',0,27),
(261,'withdraw cash ','2020-01-11',0,3),
(262,'sorry I can ','2020-01-11',0,16),
(263,'are you a human being ','2020-01-11',0,14),
(264,'panaji is better ','2020-01-11',0,17),
(265,'thank you ','2020-01-11',0,19),
(266,'are you man ','2020-01-11',0,29),
(267,'women women out really a man ','2020-01-11',0,30),
(268,'are you man ','2020-01-11',0,29),
(269,'you are a man ','2020-01-11',0,29),
(270,'are you human being ','2020-01-11',0,28),
(271,'are you a woman ','2020-01-11',0,30),
(272,'i ','2020-01-11',0,21),
(273,'a ','2020-01-11',0,30),
(274,'where is the reception ','2020-01-11',0,17),
(275,'where is the reception ','2020-01-11',0,31),
(276,'hello ','2020-01-11',0,8),
(277,'is the reception ','2020-01-11',0,31),
(278,'where is the reception ','2020-01-11',0,31),
(279,'is the bangalore ','2020-01-11',0,31),
(280,'is your band have locker ','2020-01-11',0,20),
(281,'i ','2020-01-11',0,21),
(282,'miss you your have a look away 3d ','2020-01-11',0,30),
(283,'is your head and have a plum ','2020-01-11',0,32),
(284,'locker ','2020-01-11',0,32),
(285,'how ','2020-01-11',0,27),
(286,'kiss locker facility available ','2020-01-11',0,32),
(287,'i need a locker ','2020-01-11',0,32),
(288,'are ','2020-01-11',0,29),
(289,'a ','2020-01-11',0,30),
(290,'i ','2020-01-11',0,21),
(291,'thank you ','2020-01-11',0,19),
(292,'i ','2020-01-11',0,21),
(293,'by ','2020-01-11',0,25),
(294,'what is your name duty ','2020-01-11',0,9),
(295,'nandini what is your name duty ','2020-01-11',0,9),
(296,'what is your name duty ','2020-01-11',0,9),
(297,'what is your duty ','2020-01-11',0,20),
(298,'i ','2020-01-11',0,21),
(299,'thank you thank you ','2020-01-11',0,19),
(300,'are ','2020-01-11',0,29),
(301,'are ','2020-01-11',0,29),
(302,'where is tab ','2020-01-11',0,17),
(303,'are ','2020-01-11',0,29),
(304,'a ','2020-01-11',0,30),
(305,'are ','2020-01-11',0,29),
(306,'ok ','2020-01-11',0,22),
(307,'i ','2020-01-11',0,21),
(308,'ok ','2020-01-11',0,22),
(309,'a ','2020-01-11',0,30),
(310,'a ','2020-01-11',0,30),
(311,'a ','2020-01-11',0,30),
(312,'i ','2020-01-11',0,21),
(313,'ok ','2020-01-11',0,22),
(314,'a ','2020-01-11',0,30),
(315,'i ','2020-01-11',0,21),
(316,'i ','2020-01-11',0,21),
(317,'i ','2020-01-11',0,21),
(318,'hello ','2020-01-11',0,8),
(319,'i ','2020-01-11',0,21),
(320,'job ','2020-01-11',0,11),
(321,'staff ','2020-01-11',0,17),
(322,'i need to see one stop ','2020-01-11',0,16),
(323,'i need to see one stop ','2020-01-11',0,16),
(324,'where is your ','2020-01-11',0,17),
(325,'i ','2020-01-11',0,21),
(326,'i ','2020-01-11',0,21),
(327,'a ','2020-01-11',0,30),
(328,'i ','2020-01-11',0,21),
(329,'are ','2020-01-11',0,29),
(330,'hello ','2020-01-11',0,8),
(331,'is ','2020-01-11',0,17),
(332,'i ','2020-01-11',0,21),
(333,'i ','2020-01-11',0,21),
(334,'hello ','2020-01-11',0,8),
(335,'ok ','2020-01-11',0,22),
(336,'a ','2020-01-11',0,30),
(337,'is ','2020-01-11',0,17),
(338,'i ','2020-01-11',0,21),
(339,'i ','2020-01-11',0,21),
(340,'i ','2020-01-11',0,21),
(341,'ok ','2020-01-11',0,22),
(342,'you ','2020-01-11',0,19),
(343,'name ','2020-01-11',0,9),
(344,'ok ','2020-01-11',0,22),
(345,'hello ','2020-01-11',1,8),
(346,'hello what is your ','2020-01-11',1,20),
(347,'where is job ','2020-01-11',1,17),
(348,'very staff ','2020-01-11',1,17),
(349,'very staff ','2020-01-11',1,17),
(350,'where is cab ','2020-01-11',1,17),
(351,'analysis manager ','2020-01-11',1,20),
(352,'can i wish it manager ','2020-01-11',1,21),
(353,'can i wish manager ','2020-01-11',1,21),
(354,'can i be sick manager ','2020-01-11',1,21),
(355,'to take cash ','2020-01-11',1,27),
(356,'are ','2020-01-11',1,29),
(357,'thank you ','2020-01-11',1,19),
(358,'where is job ','2020-01-11',1,17),
(359,'where is yours ','2020-01-11',1,17),
(360,'are ','2020-01-11',1,29),
(361,'where is staff ','2020-01-11',1,17),
(362,'i need to talk to one stop ','2020-01-11',1,16),
(363,'please tell me your job ','2020-01-11',1,18),
(364,'can i see the manager ','2020-01-11',1,21),
(365,'how can i see manager ','2020-01-11',1,21),
(366,'thank you ','2020-01-11',1,19),
(367,'a ','2020-01-11',1,30),
(368,'a ','2020-01-11',1,30),
(369,'i ','2020-01-11',6,21),
(370,'thank you ','2020-01-11',6,19),
(371,'ok ','2020-01-11',7,22),
(372,'i ','2020-01-11',7,21),
(373,'i ','2020-01-11',7,21),
(374,'a ','2020-01-11',7,30),
(375,'hello ','2020-01-11',7,8),
(376,'no thanks ','2020-01-11',7,24),
(377,'where is kaif ','2020-01-11',7,17),
(378,'thanks ','2020-01-11',7,24),
(379,'are ','2020-01-11',7,29),
(380,'very staff ','2020-01-11',7,17),
(381,'where is yours ','2020-01-11',7,17),
(382,'a ','2020-01-11',7,30),
(383,'como me ','2020-01-11',7,23),
(384,'ok ','2020-01-11',1,22),
(385,'how ','2020-01-11',2,27),
(386,'hello ','2020-01-11',1,8),
(387,'what is your name ','2020-01-11',1,9),
(388,'what is your job ','2020-01-11',1,11),
(389,'is ','2020-01-11',1,17),
(390,'hello ','2020-01-11',1,8),
(391,'what is your name ','2020-01-11',1,9),
(392,'i am ','2020-01-11',1,21),
(393,'are ','2020-01-11',1,29),
(394,'are ','2020-01-11',1,29),
(395,'i need a staff ','2020-01-11',1,33),
(396,'ok ','2020-01-11',1,22),
(397,'i ','2020-01-11',1,33);

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `question` */

insert  into `question`(`id`,`question`,`answer`) values 
(1,'hai','Hello,how can I help you?'),
(2,'How to deposit cash?','Please fill the deposit form'),
(3,'How to withdraw cash?','Please fill the cash withdraw form'),
(4,'When did the bank close?','Bank closes at 4 pm'),
(5,'How to take loan? ','Please submit your need for the loan and submit all the necessary documents'),
(6,'Which are the documents needed to create an account?','Any two proof like aadhar card,voter ID,driving license or passport an two copies of photo'),
(7,'How to create an account?','Please take the application form and fill it'),
(8,'hello','hai,how can I help you?'),
(9,'What is your name?','My name is AI Receptionist'),
(10,'Who are you?','I am AI Receptionist.My job is to help the customers by providing necessary informations for them.Do you need any help?'),
(11,'What is your job?','My job is to help the customers by providing them necessary informations.'),
(12,'How can you help me?','I can help you by providing necessary informations.'),
(13,'How can i withdraw amount from my account?','Please fill the withdraw form'),
(14,'How are you?','I am fine!Do you need any help?'),
(15,'Are you google assistant?','No,I am just an AI Receptionist'),
(16,'I need to talk to one staff. Who can I meet?','staff'),
(17,'where is staff','staff'),
(18,'tell me your work','My job is to help the customers by providing them necessary informations.'),
(19,'thank you','yours welcome'),
(20,'Where is your manager','Manager is in the office'),
(21,'can i see the manager','staff'),
(22,'ok','thanks'),
(23,'can you help me','Ofcourse,how can I help you?'),
(24,'thanks','yours welcome'),
(25,'by,see u later','Ok fine!You can visit whenever you want'),
(26,'which type of bank avccount is more safe','Nowadays all of them are safe.You can take current or savings account'),
(27,'how to take cash','Please fill the cash withdraw form'),
(28,'are you a human beign','No,I am just an AI Receptionist'),
(29,'are you man','No,I am just an AI Receptionist'),
(30,'are you a women','No,I am just an AI Receptionist'),
(31,'where is the reception','I am the receptionist.Do you need any help'),
(32,'Is your bank have a locker facility','We provide locker facility'),
(33,'i need a staff','staff');

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `report` varchar(100) DEFAULT NULL,
  `work_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `report` */

insert  into `report`(`report_id`,`title`,`report`,`work_id`) values 
(10,'Title1','level0.pdf',35),
(11,'Title2','level1.1.pdf',36),
(12,'Title2','level1.1.pdf',36),
(13,'Title111','level1.3.pdf',38),
(14,'Title2','level1.3.dia',37),
(15,'Title111','level1.3.pdf',38);

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `pin` bigint(11) DEFAULT NULL,
  `contact` bigint(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lid` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`id`,`lid`,`name`,`gender`,`age`,`qualification`,`place`,`post`,`district`,`pin`,`contact`,`email`) values 
(27,37,'ccc','male',12,'degree','pmna','pmna','Thiruvananthapuram',563567,6749783412,'ccc@g.com'),
(28,38,'aaa','male',12,'degree','pmna','calicut','Kannur',563567,6749783412,'aaaa@g.co'),
(29,39,'sam','male',20,'degree','tvr','pmna','Malappuram',123456,6785884043,'sam@g.com');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`img`) values 
(1,'amal','amalaprn110@gmail.com','20200111_151900.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
