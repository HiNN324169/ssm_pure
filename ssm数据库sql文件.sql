/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.36 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `a_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `home_address` varchar(30) NOT NULL COMMENT '用户地址',
  `school_address` varchar(10) NOT NULL COMMENT '学校地址',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`a_id`,`home_address`,`school_address`) values (1,'江西','赣州'),(2,'浙江','杭州'),(3,'湖南','长沙');

/*Table structure for table `animal` */

DROP TABLE IF EXISTS `animal`;

CREATE TABLE `animal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '动物 id',
  `dog` varchar(30) NOT NULL COMMENT '狗',
  `pig` varchar(30) NOT NULL COMMENT '猪',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `animal` */

insert  into `animal`(`id`,`dog`,`pig`) values (1,'土狗','肥猪'),(2,'哈奇士','佩奇'),(3,'狼狗','小猪');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PPID',
  `name` varchar(100) NOT NULL COMMENT 'PPPP',
  `number` int(11) NOT NULL COMMENT 'PPPP',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8 COMMENT='PPP';

/*Data for the table `book` */

insert  into `book`(`book_id`,`name`,`number`) values (1003,'java',12),(1004,'````',1231),(1005,'PPPP',124531),(1006,'ppppp',124531),(1007,'java 编程入门',1315),(1008,'java 编程入门',13151),(1009,'css 样式表',1614),(1010,'Java程序设计',10),(1011,'数据结构',10),(1012,'设计模式',10),(1013,'编译原理',10);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `u_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `sex` varchar(10) NOT NULL COMMENT '性别',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`u_id`,`username`,`sex`) values (1,'李四','12'),(2,'王五','55'),(3,'张飒','53');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
