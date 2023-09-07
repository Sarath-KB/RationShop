# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_rationstore
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2020-03-01 11:44:29
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_rationstore'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_rationstore" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_rationstore";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(50) NOT NULL auto_increment,
  "admin_username" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
);



#
# Dumping data for table 'tbl_admin'
#

# No data found.



#
# Table structure for table 'tbl_category'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_category" (
  "category_id" int(50) NOT NULL auto_increment,
  "category_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("category_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_category'
#

LOCK TABLES "tbl_category" WRITE;
/*!40000 ALTER TABLE "tbl_category" DISABLE KEYS;*/
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	(3,'Rice');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	(5,'Sugar');
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	(7,'Kerosine');
/*!40000 ALTER TABLE "tbl_category" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(50) NOT NULL auto_increment,
  "complaint_date" date NOT NULL,
  "complaint_content" varchar(50) NOT NULL,
  "user_id" int(50) NOT NULL,
  "shop_id" int(50) NOT NULL,
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_date", "complaint_content", "user_id", "shop_id") VALUES
	(1,'2020-02-28','yjjgtjuygyuj',7,5);
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_date", "complaint_content", "user_id", "shop_id") VALUES
	(2,'2020-02-28','fbsjdbdsvbxndvd',7,5);
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(50) NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(1,'Kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(3,'Eranakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(5,'Thrissur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(6,'Idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(8,'Kasargod');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(9,'Trivandram');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(10,'Kannur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(11,'Kollam');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(50) NOT NULL auto_increment,
  "feedback_content" varchar(50) NOT NULL,
  "feedback_date" date NOT NULL,
  "user_id" int(50) NOT NULL,
  "shop_id" int(50) NOT NULL,
  PRIMARY KEY  ("feedback_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_feedback'
#

LOCK TABLES "tbl_feedback" WRITE;
/*!40000 ALTER TABLE "tbl_feedback" DISABLE KEYS;*/
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "feedback_date", "user_id", "shop_id") VALUES
	(1,'null','2020-02-05',7,5);
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "feedback_date", "user_id", "shop_id") VALUES
	(2,'ffffffff','2020-02-28',7,5);
/*!40000 ALTER TABLE "tbl_feedback" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_location'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_location" (
  "location_id" int(50) NOT NULL auto_increment,
  "location_name" varchar(50) NOT NULL,
  "place_id" int(50) NOT NULL,
  PRIMARY KEY  ("location_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_location'
#

LOCK TABLES "tbl_location" WRITE;
/*!40000 ALTER TABLE "tbl_location" DISABLE KEYS;*/
REPLACE INTO "tbl_location" ("location_id", "location_name", "place_id") VALUES
	(1,'cheruvattoorr',2);
REPLACE INTO "tbl_location" ("location_id", "location_name", "place_id") VALUES
	(4,'Eramalloorr',2);
/*!40000 ALTER TABLE "tbl_location" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(50) NOT NULL auto_increment,
  "place_name" varchar(50) NOT NULL,
  "district_id" int(50) NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(2,'Kothamangalam',3);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(7,'Kunnathunadu',3);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(8,'Muvattupuzha',3);
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_povertytype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_povertytype" (
  "povertytype_id" int(50) NOT NULL auto_increment,
  "povertytype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("povertytype_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_povertytype'
#

LOCK TABLES "tbl_povertytype" WRITE;
/*!40000 ALTER TABLE "tbl_povertytype" DISABLE KEYS;*/
REPLACE INTO "tbl_povertytype" ("povertytype_id", "povertytype_name") VALUES
	(4,'Bpl');
REPLACE INTO "tbl_povertytype" ("povertytype_id", "povertytype_name") VALUES
	(5,'Apl');
REPLACE INTO "tbl_povertytype" ("povertytype_id", "povertytype_name") VALUES
	(6,'Andhodhya ');
REPLACE INTO "tbl_povertytype" ("povertytype_id", "povertytype_name") VALUES
	(7,'Non-Priority');
/*!40000 ALTER TABLE "tbl_povertytype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_product'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_product" (
  "product_id" int(50) NOT NULL auto_increment,
  "product_name" varchar(50) NOT NULL,
  "product_price" int(50) NOT NULL,
  "product_description" varchar(50) NOT NULL,
  "product_unit" varchar(50) NOT NULL,
  "product_photo" varchar(50) NOT NULL,
  "subcategory_id" int(50) NOT NULL,
  PRIMARY KEY  ("product_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_product'
#

LOCK TABLES "tbl_product" WRITE;
/*!40000 ALTER TABLE "tbl_product" DISABLE KEYS;*/
REPLACE INTO "tbl_product" ("product_id", "product_name", "product_price", "product_description", "product_unit", "product_photo", "subcategory_id") VALUES
	(6,'jaya',22,'good','kg','photo_2008.jpeg',5);
REPLACE INTO "tbl_product" ("product_id", "product_name", "product_price", "product_description", "product_unit", "product_photo", "subcategory_id") VALUES
	(7,'Unnukalle',45,'developed
','gram','photo_2085.jpg',5);
REPLACE INTO "tbl_product" ("product_id", "product_name", "product_price", "product_description", "product_unit", "product_photo", "subcategory_id") VALUES
	(8,'JK',45,'Good Product with less chemical','kg','photo_1779.jpg',9);
/*!40000 ALTER TABLE "tbl_product" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_productprice'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_productprice" (
  "productprice_id" int(50) NOT NULL auto_increment,
  "product_id" int(50) NOT NULL,
  "povertytype_id" int(50) NOT NULL,
  "product_price" int(50) NOT NULL,
  PRIMARY KEY  ("productprice_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_productprice'
#

LOCK TABLES "tbl_productprice" WRITE;
/*!40000 ALTER TABLE "tbl_productprice" DISABLE KEYS;*/
REPLACE INTO "tbl_productprice" ("productprice_id", "product_id", "povertytype_id", "product_price") VALUES
	(1,6,4,45);
REPLACE INTO "tbl_productprice" ("productprice_id", "product_id", "povertytype_id", "product_price") VALUES
	(3,6,5,1833);
/*!40000 ALTER TABLE "tbl_productprice" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shop'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shop" (
  "shop_id" int(50) NOT NULL auto_increment,
  "shop_name" varchar(50) NOT NULL,
  "shop_address" varchar(50) NOT NULL,
  "shop_contact" bigint(20) NOT NULL,
  "shop_email" varchar(50) NOT NULL,
  "shop_shopno" varchar(50) NOT NULL,
  "shop_licenseproof" varchar(50) NOT NULL,
  "shop_photo" varchar(50) NOT NULL,
  "shop_username" varchar(50) NOT NULL,
  "shop_password" varchar(50) NOT NULL,
  "shop_status" varchar(50) default NULL,
  "location_id" int(50) NOT NULL,
  PRIMARY KEY  ("shop_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_shop'
#

LOCK TABLES "tbl_shop" WRITE;
/*!40000 ALTER TABLE "tbl_shop" DISABLE KEYS;*/
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_address", "shop_contact", "shop_email", "shop_shopno", "shop_licenseproof", "shop_photo", "shop_username", "shop_password", "shop_status", "location_id") VALUES
	(4,'nbjbjh','jbjbjk','95393934590','ar@gmail.com','22225','proof_1697.jpg','Image_1513.jpg','appu@gmail.com','jjjjjj',NULL,1);
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_address", "shop_contact", "shop_email", "shop_shopno", "shop_licenseproof", "shop_photo", "shop_username", "shop_password", "shop_status", "location_id") VALUES
	(5,'Mundothil Ration Store','fdsfmv dffd dfds ','225522233','a@gmail.com','42178596','proof_1367.jpg','Image_1871.jpg','mundothil','mundothil',NULL,1);
/*!40000 ALTER TABLE "tbl_shop" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_shopproduct'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shopproduct" (
  "shopproduct_id" int(50) NOT NULL auto_increment,
  "product_id" int(50) NOT NULL,
  "shop_id" int(50) NOT NULL,
  PRIMARY KEY  ("shopproduct_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_shopproduct'
#

LOCK TABLES "tbl_shopproduct" WRITE;
/*!40000 ALTER TABLE "tbl_shopproduct" DISABLE KEYS;*/
REPLACE INTO "tbl_shopproduct" ("shopproduct_id", "product_id", "shop_id") VALUES
	(4,6,5);
/*!40000 ALTER TABLE "tbl_shopproduct" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_stock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_stock" (
  "stock_id" int(50) NOT NULL auto_increment,
  "stock_number" int(50) NOT NULL,
  "stock_unit" varchar(50) NOT NULL,
  "shopproduct_id" int(50) NOT NULL,
  PRIMARY KEY  ("stock_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_stock'
#

LOCK TABLES "tbl_stock" WRITE;
/*!40000 ALTER TABLE "tbl_stock" DISABLE KEYS;*/
REPLACE INTO "tbl_stock" ("stock_id", "stock_number", "stock_unit", "shopproduct_id") VALUES
	(1,55,'kg',1);
REPLACE INTO "tbl_stock" ("stock_id", "stock_number", "stock_unit", "shopproduct_id") VALUES
	(3,85,'kg',1);
REPLACE INTO "tbl_stock" ("stock_id", "stock_number", "stock_unit", "shopproduct_id") VALUES
	(4,88,'kg',8);
REPLACE INTO "tbl_stock" ("stock_id", "stock_number", "stock_unit", "shopproduct_id") VALUES
	(6,88,'kg',4);
REPLACE INTO "tbl_stock" ("stock_id", "stock_number", "stock_unit", "shopproduct_id") VALUES
	(7,444,'kg',1);
/*!40000 ALTER TABLE "tbl_stock" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_subcategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_subcategory" (
  "subcategory_id" int(50) NOT NULL auto_increment,
  "subcategory_name" varchar(50) NOT NULL,
  "category_id" int(50) NOT NULL,
  PRIMARY KEY  ("subcategory_id")
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_subcategory'
#

LOCK TABLES "tbl_subcategory" WRITE;
/*!40000 ALTER TABLE "tbl_subcategory" DISABLE KEYS;*/
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	(5,'White Rice',3);
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	(6,'Matta Rice',3);
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	(7,'White Sugar',5);
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	(9,'Normal',7);
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	(10,'Normal',5);
/*!40000 ALTER TABLE "tbl_subcategory" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_supplyofficer'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_supplyofficer" (
  "officer_id" int(50) NOT NULL auto_increment,
  "officer_name" varchar(50) NOT NULL,
  "officer_address" varchar(50) NOT NULL,
  "officer_contact" bigint(10) NOT NULL,
  "officer_email" varchar(50) NOT NULL,
  "officer_qualification" varchar(50) NOT NULL,
  "officer_photo" varchar(50) NOT NULL,
  "place_id" int(50) NOT NULL,
  PRIMARY KEY  ("officer_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_supplyofficer'
#

LOCK TABLES "tbl_supplyofficer" WRITE;
/*!40000 ALTER TABLE "tbl_supplyofficer" DISABLE KEYS;*/
REPLACE INTO "tbl_supplyofficer" ("officer_id", "officer_name", "officer_address", "officer_contact", "officer_email", "officer_qualification", "officer_photo", "place_id") VALUES
	(3,'fhgyjhuy','ythytju','9865321245','apxx@gmail','kkkkkkkkkkkk','Image_2005.jpg',7);
/*!40000 ALTER TABLE "tbl_supplyofficer" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(50) NOT NULL auto_increment,
  "user_name" varchar(50) NOT NULL,
  "user_address" varchar(250) NOT NULL,
  "user_gender" varchar(50) NOT NULL,
  "user_contact" bigint(20) NOT NULL,
  "user_photo" varchar(50) NOT NULL,
  "user_email" varchar(50) NOT NULL,
  "user_cardno" varchar(20) NOT NULL,
  "user_cardproof" varchar(50) NOT NULL,
  "user_member" int(50) NOT NULL,
  "user_status" int(50) NOT NULL,
  "location_id" int(50) NOT NULL,
  "user_username" varchar(50) NOT NULL,
  "user_password" varchar(50) NOT NULL,
  "povertytype_id" int(50) NOT NULL,
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=13;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(1,'jewjhf',' reterry','Female','55555555','photo_1019.jpg','ar@gmail.com','244444','proof_1569.jpg',0,0,1,'null','null',0);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(2,'aparnna',' hhkhkhkhk','Female','99999999','photo_1661.jpg','ap@gmail.com','2333444444','proof_1892.jpg',0,0,1,'antony','jjjjjjjj',0);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(3,'aparnna',' hhkhkhkhk','Female','99999999','photo_1859.jpg','ap@gmail.com','2333444444','proof_1455.jpg',0,0,1,'antony','qqqqq',0);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(4,'Arunya Bimal','Vazhakalyil h
Kothamangalam','Female','9142418767','photo_1873.jpg','aru@gmail.com','5444555444','proof_2031.jpg',0,2,1,'aru','arunya',4);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(5,'Deepa K M',' kunnathu','Female','953956412','photo_1216.png','d@gmail.com','95393655','proof_1557.jpg',5,1,5,'deepa','deepa',4);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(6,'Madhavan','Vazhakalayil h','Female','9539393459','photo_1047.jpg','ap@gmail.com','55555555555555','proof_1308.jpg',0,1,1,'admin','admin',4);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(7,'aaaaa','apxx','Female','784512','photo_1327.jfif','apxx@gmail','58421756','proof_1637.jfif',0,1,1,'sss','sss',6);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(8,'jjjjjjjjjj','fgggggggggggggggggg','Female','555555512','photo_1410.jpg','j@gmail.com','1222222222222222','proof_1353.jpg',0,2,1,'mmm','mmmm',4);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(9,'Rejani Bimal','Vazhakalayil(H)
Cheruvattoor(Po)
Kothamangalam
pin-686691','Female','9865321245','photo_1578.png','rejani@gmail.com','9539393456','proof_2057.jpg',0,0,1,'rejani','rejani1',5);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(10,'fd',' errt','Female','6556556','photo_1028.png','j@gmail.com','655448554','proof_1512.png',4,0,1,'mmm','Submit',4);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(11,'fd',' errt','Female','6556556','photo_1223.png','j@gmail.com','655448554','proof_1038.png',4,0,1,'mmm','Submit',4);
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_address", "user_gender", "user_contact", "user_photo", "user_email", "user_cardno", "user_cardproof", "user_member", "user_status", "location_id", "user_username", "user_password", "povertytype_id") VALUES
	(12,'ddddd',' ssssssssss','Female','41147257','photo_1087.png','h@gmail.com','4552757','proof_1298.png',5,0,1,'sss','ssss',4);
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
