/*
SQLyog Enterprise - MySQL GUI v8.02 RC
MySQL - 5.5.27 : Database - eshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`eshop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eshop`;

/*Table structure for table `book_orders` */

DROP TABLE IF EXISTS `book_orders`;

CREATE TABLE `book_orders` (
  `orderid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `cartid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `del_date` date DEFAULT NULL,
  `del_status` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `book_orders` */

insert  into `book_orders`(`orderid`,`bookid`,`cartid`,`amount`,`order_date`,`del_date`,`del_status`,`email`) values (1,10001,1,200,'2014-12-19','2014-12-20',1,'vikas@gmail.com'),(2,10001,2,200,'2014-12-23',NULL,0,'vikas@gmail.com'),(3,10001,3,200,'2015-01-20','2015-01-20',1,'deepak@gmail.com'),(4,10004,4,156,'2015-08-18','2015-08-18',1,'vikas@gmail.com'),(5,10004,5,156,'2015-08-25','2015-08-25',1,'Surbhi007@gmail.com'),(6,10003,7,225,'2016-06-30',NULL,0,'deepak@gmail.com'),(7,10004,8,156,'2016-07-06','2016-07-06',1,'vikas@gmail.com'),(8,10001,9,200,'2016-07-14','2016-07-14',0,'vikas@gmail.com');

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookid` int(11) DEFAULT NULL,
  `book_name` varchar(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `book_subject` varchar(200) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `book_desc` text,
  `qty` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `books` */

insert  into `books`(`bookid`,`book_name`,`author`,`book_subject`,`publisher`,`isbn`,`price`,`book_desc`,`qty`,`photo`) values (10001,'C in 21 Days','Mark John','C++ Language','BPB','23PS21',200,'Best book for Beginers',100,'10001-10002_c.bmp'),(10002,'Programming in C','Denis Ritchie','C Language','PHI','CD01209F',85,'Best book for C Language',10,'10002-10002_c.bmp'),(10003,'JSP2.0','Peter','J2EE','Tata McHill','45NBGH23',225,'Best book for J2EE beginers',200,'10003-10003_index_JavaLogo.jpg'),(10004,'Data Structure and Algorithms','J D Ulman','DSA','PHI','FGH0002GH',156,'Best book for advance data structure',50,'10004-10004_book_dsa.jpg');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cartid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cart` */

insert  into `cart`(`cartid`,`bookid`,`booking_date`,`order_status`,`email`) values (1,10001,'2014-12-19',1,'vikas@gmail.com'),(2,10001,'2014-12-23',1,'vikas@gmail.com'),(3,10001,'2015-01-20',1,'deepak@gmail.com'),(4,10004,'2015-08-18',1,'vikas@gmail.com'),(5,10004,'2015-08-25',1,'Surbhi007@gmail.com'),(6,10001,'2016-06-30',0,'deepak@gmail.com'),(7,10003,'2016-06-30',1,'deepak@gmail.com'),(8,10004,'2016-07-06',1,'vikas@gmail.com'),(9,10001,'2016-07-14',0,'vikas@gmail.com'),(10,10004,'2016-07-14',0,'vikas@gmail.com');

/*Table structure for table `logindata` */

DROP TABLE IF EXISTS `logindata`;

CREATE TABLE `logindata` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `logindata` */

insert  into `logindata`(`username`,`password`,`usertype`) values ('admin@shopping.com','abc','admin'),('vikas@gmail.com','123','user'),('deepak@gmail.com','123','user'),('amit@gmail.com','abc','user'),('surbhi007@gmail.com','a123','user');

/*Table structure for table `userdata` */

DROP TABLE IF EXISTS `userdata`;

CREATE TABLE `userdata` (
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pin` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userdata` */

insert  into `userdata`(`name`,`address`,`city`,`state`,`pin`,`mobile_no`,`email`) values ('Vikas Kumar','123, Dadabari Main Road','Kota','Rajasthan','324009','9090909090','vikas@gmail.com'),('Deepak Namdev','123, Talwandi','Kota','Raj','324005','8989898989','deepak@gmail.com'),('Amit','123, Dadabari','Kota','Rajasthan','324009','9090909090','amit@gmail.com'),('Surbhi','123, Dadabari','Kota','Raj','324009','9080706050','surbhi007@gmail.com');

/*Table structure for table `my_orders` */

DROP TABLE IF EXISTS `my_orders`;

/*!50001 DROP VIEW IF EXISTS `my_orders` */;
/*!50001 DROP TABLE IF EXISTS `my_orders` */;

/*!50001 CREATE TABLE `my_orders` (
  `bookid` int(11) DEFAULT NULL,
  `book_name` varchar(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `book_subject` varchar(200) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `book_desc` text,
  `orderid` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `del_date` date DEFAULT NULL,
  `del_status` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `mycart` */

DROP TABLE IF EXISTS `mycart`;

/*!50001 DROP VIEW IF EXISTS `mycart` */;
/*!50001 DROP TABLE IF EXISTS `mycart` */;

/*!50001 CREATE TABLE `mycart` (
  `bookid` int(11) DEFAULT NULL,
  `book_name` varchar(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `book_subject` varchar(200) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `cartid` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*View structure for view my_orders */

/*!50001 DROP TABLE IF EXISTS `my_orders` */;
/*!50001 DROP VIEW IF EXISTS `my_orders` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `my_orders` AS (select `books`.`bookid` AS `bookid`,`books`.`book_name` AS `book_name`,`books`.`author` AS `author`,`books`.`book_subject` AS `book_subject`,`books`.`publisher` AS `publisher`,`books`.`isbn` AS `isbn`,`books`.`price` AS `price`,`books`.`book_desc` AS `book_desc`,`book_orders`.`orderid` AS `orderid`,`book_orders`.`order_date` AS `order_date`,`book_orders`.`del_date` AS `del_date`,`book_orders`.`del_status` AS `del_status`,`book_orders`.`email` AS `email` from (`books` join `book_orders`) where (`book_orders`.`bookid` = `books`.`bookid`)) */;

/*View structure for view mycart */

/*!50001 DROP TABLE IF EXISTS `mycart` */;
/*!50001 DROP VIEW IF EXISTS `mycart` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mycart` AS (select `books`.`bookid` AS `bookid`,`books`.`book_name` AS `book_name`,`books`.`author` AS `author`,`books`.`book_subject` AS `book_subject`,`books`.`publisher` AS `publisher`,`books`.`isbn` AS `isbn`,`books`.`price` AS `price`,`cart`.`cartid` AS `cartid`,`cart`.`email` AS `email`,`cart`.`booking_date` AS `booking_date`,`cart`.`order_status` AS `order_status` from (`books` join `cart`) where (`books`.`bookid` = `cart`.`bookid`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;