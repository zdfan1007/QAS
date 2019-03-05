/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 6.0.11-alpha-community : Database - attend-system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`attend-system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `attend-system`;

/*Table structure for table `business_trip` */

DROP TABLE IF EXISTS `business_trip`;

CREATE TABLE `business_trip` (
  `id` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `b_reason` char(20) DEFAULT NULL,
  `b_start_time` char(20) DEFAULT NULL,
  `b_end_time` char(20) DEFAULT NULL,
  `b_total_time` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `business_trip` */

insert  into `business_trip`(`id`,`name`,`b_reason`,`b_start_time`,`b_end_time`,`b_total_time`) values ('01','张三','工作需要','2016-05-04','2016-05-10','20d');

/*Table structure for table `information` */

DROP TABLE IF EXISTS `information`;

CREATE TABLE `information` (
  `id` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `sex` char(20) DEFAULT NULL,
  `age` char(20) DEFAULT NULL,
  `position` char(20) DEFAULT NULL,
  `number` char(20) DEFAULT NULL,
  `education` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `information` */

insert  into `information`(`id`,`name`,`sex`,`age`,`position`,`number`,`education`) values ('01','张三','man','25','employee','4521','master'),('02','Sheldon','man','35','employee','1206','master'),('03','Tom','man','30','employee','12546','master'),('2013213415','李思','女','18','经理','45210','本科'),('2013213419','钱晶晶','女','18','经理','45120','本科'),('2013213431','骆思晨','女','18','经理','79','本科'),('2013213438','曹雨蒙','女','18','经理','1235','本科');

/*Table structure for table `leave_info` */

DROP TABLE IF EXISTS `leave_info`;

CREATE TABLE `leave_info` (
  `id` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `l_reason` char(20) DEFAULT NULL,
  `l_start_time` char(20) DEFAULT NULL,
  `l_end_time` char(20) DEFAULT NULL,
  `l_total_time` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `leave_info` */

insert  into `leave_info`(`id`,`name`,`l_reason`,`l_start_time`,`l_end_time`,`l_total_time`) values ('01','张三','生病','2016-6-26','2016-6-29','3d');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` char(20) NOT NULL,
  `password` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `login` */

insert  into `login`(`id`,`password`) values ('01','001'),('02','02'),('03','03'),('04','04'),('2013213415','3415'),('2013213419','3419'),('2013213431','3431'),('2013213438','3438');

/*Table structure for table `out_on_work` */

DROP TABLE IF EXISTS `out_on_work`;

CREATE TABLE `out_on_work` (
  `id` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `on_time` char(20) DEFAULT NULL,
  `off_time` char(20) DEFAULT NULL,
  `absence_record` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `out_on_work` */

insert  into `out_on_work`(`id`,`name`,`on_time`,`off_time`,`absence_record`) values ('01','张三','9:00','17:00',NULL),('02','Sheldon','9:00','17:00',NULL),('03','Tom','9:00','17:00',NULL),('2013213415','李思','9:00','17:00',NULL),('2013213419','钱晶晶','9:00','17:00',NULL),('2013213431','骆思晨','9:00','17:00',NULL),('2013213438','曹雨蒙','9:00','17:00',NULL);

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `id` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `base_pay` char(20) DEFAULT NULL,
  `merit_pay` char(20) DEFAULT NULL,
  `total_pay` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salary` */

insert  into `salary`(`id`,`name`,`base_pay`,`merit_pay`,`total_pay`) values ('01','张三','8000','8000','16000'),('02','Sheldon','8000','8000','16000');

/*Table structure for table `work_overtime` */

DROP TABLE IF EXISTS `work_overtime`;

CREATE TABLE `work_overtime` (
  `id` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `w_reason` char(20) DEFAULT NULL,
  `w_start_time` char(20) DEFAULT NULL,
  `w_end_time` char(20) DEFAULT NULL,
  `w_total_time` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `work_overtime` */

insert  into `work_overtime`(`id`,`name`,`w_reason`,`w_start_time`,`w_end_time`,`w_total_time`) values ('01','张三','工作需要','2016-04-23-17:00','2016-04-23-20:00','8h');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
