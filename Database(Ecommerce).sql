/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.29 : Database - ecommerce
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `cart` */

insert  into `cart`(`user_id`) values 
(1),
(28),
(52),
(99),
(100),
(2147483643);

/*Table structure for table `discount` */

DROP TABLE IF EXISTS `discount`;

CREATE TABLE `discount` (
  `id` varchar(255) NOT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `discount` */

insert  into `discount`(`id`,`status`) values 
('B346GG',0),
('fifty',0);

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values 
(109),
(109),
(109),
(109),
(109);

/*Table structure for table `order_main` */

DROP TABLE IF EXISTS `order_main`;

CREATE TABLE `order_main` (
  `order_id` bigint NOT NULL,
  `buyer_address` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_phone` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `order_amount` decimal(19,2) NOT NULL,
  `order_status` int NOT NULL DEFAULT '0',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `order_main` */

insert  into `order_main`(`order_id`,`buyer_address`,`buyer_email`,`buyer_name`,`buyer_phone`,`create_time`,`order_amount`,`order_status`,`update_time`) values 
(102,'gl','vishaka@gmail.com','vishaka','1234','2022-08-03 06:36:32',4010.00,0,'2022-08-03 06:36:32'),
(95,'House No.65 Sector b slice 2 scheme No. 78 Vijay Nagar Indore, -','piyushpatidar7777@gmail.com','Piyush ','123456','2022-08-02 18:00:08',400000.00,0,'2022-08-02 18:00:08'),
(92,'House No.65 Sector b slice 2 scheme No. 78 Vijay Nagar Indore, -','piyushpatidar7777@gmail.com','Piyush Patidar','123456','2022-08-02 17:40:02',20000.00,0,'2022-08-02 17:40:02'),
(90,'House No.65 Sector b slice 2 scheme No. 78 Vijay Nagar Indore, -','piyushpatidar7777@gmail.com','Piyush Patidar','123456','2022-08-02 17:38:55',800000.00,0,'2022-08-02 17:38:55'),
(88,'House No.65 Sector b slice 2 scheme No. 78 Vijay Nagar Indore, -','piyushpatidar7777@gmail.com','Piyush Patidar','123456','2022-08-02 17:34:11',240000.00,0,'2022-08-02 17:34:11'),
(61,'House No.65 Sector b slice 2 scheme No. 78 Vijay Nagar Indore, -','piyushpatidar7777@gmail.com','Piyush Patidar','123456','2022-08-02 14:12:55',20000.00,2,'2022-08-02 14:21:44'),
(64,'House No.65 Sector b slice 2 scheme No. 78 Vijay Nagar Indore, -','piyushpatidar7777@gmail.com','Piyush Patidar','123456','2022-08-02 14:24:13',15000.00,0,'2022-08-02 14:24:13'),
(48,'House No.65 Sector b slice 2 scheme No. 78 Vijay Nagar Indore, -','piyushpatidar7777@gmail.com','Piyush Patidar','123456','2022-07-29 19:09:32',20000.00,2,'2022-08-02 14:21:45');

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_type` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UK_6kq6iveuim6wd90cxo5bksumw` (`category_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `product_category` */

insert  into `product_category`(`category_id`,`category_name`,`category_type`,`create_time`,`update_time`) values 
(2147483641,'Furniture',0,'2018-03-09 23:03:26','2018-03-10 00:15:27'),
(2147483642,'Beds',2,'2018-03-10 00:15:02','2018-03-10 00:15:21'),
(2147483644,'Sofa & Recliners',3,'2018-03-10 01:01:09','2018-03-10 01:01:09'),
(2147483645,'Wall Accents',1,'2018-03-10 00:26:05','2018-03-10 00:26:05');

/*Table structure for table `product_in_order` */

DROP TABLE IF EXISTS `product_in_order`;

CREATE TABLE `product_in_order` (
  `id` bigint NOT NULL,
  `category_type` int NOT NULL,
  `count` int DEFAULT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_icon` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(19,2) NOT NULL,
  `product_stock` int DEFAULT NULL,
  `cart_user_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhnivo3fl2qtco3ulm4mq0mbr5` (`cart_user_id`),
  KEY `FKt0sfj3ffasrift1c4lv3ra85e` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `product_in_order` */

insert  into `product_in_order`(`id`,`category_type`,`count`,`product_description`,`product_icon`,`product_id`,`product_name`,`product_price`,`product_stock`,`cart_user_id`,`order_id`) values 
(51,0,1,'6 Chair Dining Table','https://jacfurn.com/pub/media/catalog/product/cache/450aa752168b746e4819b147b234da81/f/a/falco_dt_with_falco_chair_2.jpg','B0001','Dining Table',20000.00,4,NULL,NULL),
(63,0,1,'Ashley Maple Large Coffee Table','https://ii2.pepperfry.com/media/catalog/product/a/s/494x544/ashley-maple-rectangular-coffee-table-ashley-maple-rectangular-coffee-table-bh7ohh.jpg','B0003','Fabuliv Table',15000.00,20,NULL,64),
(65,0,2,'6 Chair Dining Table','https://jacfurn.com/pub/media/catalog/product/cache/450aa752168b746e4819b147b234da81/f/a/falco_dt_with_falco_chair_2.jpg','B0001','Dining Table',20000.00,5,NULL,NULL),
(66,0,7,'6 Chair Dining Table','https://jacfurn.com/pub/media/catalog/product/cache/450aa752168b746e4819b147b234da81/f/a/falco_dt_with_falco_chair_2.jpg','B0001','Dining Table',20000.00,5,NULL,88),
(79,0,1,'Wellesley Solid Wood Rocking Chair ','https://ii2.pepperfry.com/media/catalog/product/p/r/494x544/presley-solid-wood-rocking-chair-in-provincial-teak-finish---amberville-by-pepperfry-presley-solid-w-dj9rup.jpg','B0002','Amberville Chair',15000.00,12,NULL,NULL),
(87,2,1,'Bolton King Size Bed','https://ii3.pepperfry.com/media/catalog/product/b/o/494x544/bolton-king-size-bed-with-storage-in-wenge-finish-by-hometown-bolton-king-size-bed-with-storage-in-w-6ebo3z.jpg','C0001','KIng Size Bed',100000.00,109,NULL,88),
(89,2,8,'Bolton King Size Bed','https://ii3.pepperfry.com/media/catalog/product/b/o/494x544/bolton-king-size-bed-with-storage-in-wenge-finish-by-hometown-bolton-king-size-bed-with-storage-in-w-6ebo3z.jpg','C0001','KIng Size Bed',100000.00,108,NULL,90),
(91,0,1,'6 Chair Dining Table','https://jacfurn.com/pub/media/catalog/product/cache/450aa752168b746e4819b147b234da81/f/a/falco_dt_with_falco_chair_2.jpg','B0001','Dining Table',20000.00,5,NULL,92),
(94,2,4,'Bolton King Size Bed','https://ii3.pepperfry.com/media/catalog/product/b/o/494x544/bolton-king-size-bed-with-storage-in-wenge-finish-by-hometown-bolton-king-size-bed-with-storage-in-w-6ebo3z.jpg','C0001','KIng Size Bed',100000.00,100,NULL,95),
(101,0,2,'6 Chair Dining Table','https://jacfurn.com/pub/media/catalog/product/cache/450aa752168b746e4819b147b234da81/f/a/falco_dt_with_falco_chair_2.jpg','B0001','Dining Table',2005.00,4,NULL,102),
(104,0,1,'6 Chair Dining Table','https://jacfurn.com/pub/media/catalog/product/cache/450aa752168b746e4819b147b234da81/f/a/falco_dt_with_falco_chair_2.jpg','B0001','Dining Table',200000.00,2,28,NULL),
(105,1,1,'A Scenic Wall Accent','https://ii3.pepperfry.com/media/catalog/product/n/a/494x544/nature-painting-wall-art-collage-by-posh-n-plush-nature-painting-wall-art-collage-by-posh-n-plush-zicbtu.jpg','F0001','Nature Painting Wall Art Colalage',1222.00,20,28,NULL),
(106,3,1,'Miranda 3 Seater Sofa In Navy Blue Colour','https://ii2.pepperfry.com/media/catalog/product/m/i/494x544/miranda-three-seater-sofa-in-navy-blue-colour-by-woodsworth-miranda-three-seater-sofa-in-navy-blue-c-hkocgr.jpg','D0001','3 Seater Sofa',17000.00,18,28,NULL);

/*Table structure for table `product_info` */

DROP TABLE IF EXISTS `product_info`;

CREATE TABLE `product_info` (
  `product_id` varchar(255) NOT NULL,
  `category_type` int DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_icon` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(19,2) NOT NULL,
  `product_status` int DEFAULT '0',
  `product_stock` int NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `product_info` */

insert  into `product_info`(`product_id`,`category_type`,`create_time`,`product_description`,`product_icon`,`product_name`,`product_price`,`product_status`,`product_stock`,`update_time`) values 
('C0003',2,'2018-03-10 12:12:46','Bed With Headboard Storage','https://ii1.pepperfry.com/media/catalog/product/m/c/494x544/mczoe-trundle-bed-with-headboard-storage-in-white---yellow-finish-by-mollycoddle-mczoe-trundle-bed-w-0u3yqa.jpg','Kids Beds',22000.00,0,22,'2022-07-31 04:27:59'),
('D0001',3,'2018-03-10 06:51:03','Miranda 3 Seater Sofa In Navy Blue Colour','https://ii2.pepperfry.com/media/catalog/product/m/i/494x544/miranda-three-seater-sofa-in-navy-blue-colour-by-woodsworth-miranda-three-seater-sofa-in-navy-blue-c-hkocgr.jpg','3 Seater Sofa',17000.00,0,18,'2022-07-31 04:31:26'),
('B0002',0,'2018-03-10 10:35:43','Wellesley Solid Wood Rocking Chair ','https://ii2.pepperfry.com/media/catalog/product/p/r/494x544/presley-solid-wood-rocking-chair-in-provincial-teak-finish---amberville-by-pepperfry-presley-solid-w-dj9rup.jpg','Amberville Chair',15000.00,0,12,'2022-08-02 04:52:48'),
('C0001',2,'2018-03-10 12:09:41','Bolton King Size Bed','https://ii3.pepperfry.com/media/catalog/product/b/o/494x544/bolton-king-size-bed-with-storage-in-wenge-finish-by-hometown-bolton-king-size-bed-with-storage-in-w-6ebo3z.jpg','KIng Size Bed',100000.00,0,96,'2022-08-02 18:00:08'),
('C0002',2,'2018-03-10 12:11:51','Dual Comfort Bed With Mattress','https://ii3.pepperfry.com/media/wysiwyg/banners/Mattress_Shopbyfeature_web_31012022_2.jpg','Comfort Bed',180000.00,0,15,'2022-07-31 04:27:00'),
('B0001',0,'2018-03-10 06:44:25','6 Chair Dining Table','https://jacfurn.com/pub/media/catalog/product/cache/450aa752168b746e4819b147b234da81/f/a/falco_dt_with_falco_chair_2.jpg','Dining Table',200000.00,0,2,'2022-08-03 06:38:43'),
('B0004',0,'2018-03-10 10:39:29','Marin Wall Mounted TV Unit for TVs up to 55\" in Rustico Malbec & Rustico Malbec Finish','https://ii1.pepperfry.com/media/catalog/product/m/a/494x544/marin-wall-mounted-entertainment-unit--in-rustico-malbec---rustico-malbec-finish-by-colibri-marin-wa-smizrt.jpg','Colibri Tv Unit',30000.00,0,22,'2022-07-30 06:39:51'),
('B0005',0,'2018-03-10 10:40:35','All-In-One Bar Cabinet with built-in Fridge In Satvario Marble & Gold Finish','https://ii1.pepperfry.com/media/catalog/product/a/l/494x544/all-in-one-bar-cabinet-with-built-in-fridge-in-satvario-marble---gold-finish-by-speedx-home-bars-all-imttnt.jpg','Speedx Home Bar',30000.00,0,11,'2022-07-29 18:55:38'),
('D0002',3,'2018-03-10 12:08:17','Classy Recliner with cupholders in Brown Colour','https://ii2.pepperfry.com/media/catalog/product/c/l/494x544/classy-1-seater-manual-recliner-with-cupholders-in-brown-colour-by-bantia-furniture-classy-1-seater--a91rgu.jpg','Recliners',20000.00,0,20,'2022-07-31 04:32:13'),
('F0001',1,'2018-03-10 12:15:05','A Scenic Wall Accent','https://ii3.pepperfry.com/media/catalog/product/n/a/494x544/nature-painting-wall-art-collage-by-posh-n-plush-nature-painting-wall-art-collage-by-posh-n-plush-zicbtu.jpg','Nature Painting Wall Art Colalage',1222.00,0,20,'2022-07-31 04:22:42'),
('F0002',1,'2018-03-10 12:16:44','Wooden Analog Wall Clock','https://ii3.pepperfry.com/media/catalog/product/b/l/494x544/black-engineered-wood-analog-wall-clock-black-engineered-wood-analog-wall-clock-kxy3jk.jpg','Analog Wall Clock',2000.00,0,22,'2022-07-31 04:24:01'),
('B0003',0,'2022-08-03 06:42:06','Ashley Maple Large Coffee Table In Teak & Paintco Walnut Finish','https://ii2.pepperfry.com/media/catalog/product/a/s/494x544/ashley-maple-rectangular-coffee-table-ashley-maple-rectangular-coffee-table-bh7ohh.jpg','Fabuliv Table',15000.00,0,20,'2022-08-03 06:42:06'),
('B00022',1,'2022-08-03 06:42:06','Vintage Lamp','https://ii2.pepperfry.com/media/catalog/product/v/i/494x544/vintage-curved-adjustable-floor-lamp-standing-brass-antique-with-moveable-dome-and-neck-to-focus-lig-dgci8c.jpg','Floor Lamp',3500.00,0,30,'2022-08-03 06:42:06'),
('B00021',1,'2022-08-03 06:42:06','German  Finish Wardrobe','https://ii1.pepperfry.com/media/catalog/product/f/i/800x880/five-door-wardrobe-with-mirror-and-open-shelf-in-classic-walnut-finish-in-plpb-by-primorati-five-doo-bldmm9.jpg','Wardrobe',45000.00,0,25,'2022-08-03 06:42:06');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `active` bit(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sx468g52bpetvlad2j9y0lptc` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`active`,`address`,`email`,`name`,`password`,`phone`,`role`) values 
(99,'','Uttar pradesh','ankush@gmail.com','Ankush','$2a$10$T8v/MGi3fSLJOYL582ExWeiN3F8VgbEY.CZU11I2Xcj83ZfvVVGKS','1234','ROLE_CUSTOMER'),
(100,'','gl','vishaka@gmail.com','vishaka','$2a$10$B7dFvZoNjYGGHzQ227CsneMuDymMKG552CjAR6dVBL1Z07utMWt9y','1234','ROLE_CUSTOMER'),
(1,'','tilak nagar','admin@gmail.com','admin','$2a$10$T6A88yZfbLGRkTnhhzQibOx6zV/yRQ1u6ye0ec9oM6UvziB6j0g42','123456','ROLE_MANAGER'),
(28,'','House No.65 Sector b slice 2 scheme No. 78 Vijay Nagar Indore, -','piyushpatidar7777@gmail.com','Piyush ','$2a$10$54EA.lP3yruj5vL4EH98GeUMcJxtlXYH5O9MO8qreftdQ88BEcl/i','123456','ROLE_CUSTOMER');

/*Table structure for table `wishlist` */

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `id` bigint NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKklfv8svemdde0od1rs6mgstb` (`product_id`),
  KEY `FKtrd6335blsefl2gxpb8lr0gr7` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `wishlist` */

insert  into `wishlist`(`id`,`created_date`,`product_id`,`user_id`) values 
(98,'2022-08-03 03:32:57','F0002',28),
(103,'2022-08-03 06:37:08','B0001',100),
(107,'2022-08-03 08:46:02','F0001',28),
(108,'2022-08-03 08:46:14','D0002',28);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
