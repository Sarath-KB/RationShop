# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_rationstore
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2021-05-26 10:09:01
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_rationstore'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_rationstore" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_rationstore";


#
# Table structure for table 'tbl_addrequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_addrequest" (
  "req_id" int(10) unsigned NOT NULL auto_increment,
  "req_do" varchar(50) NOT NULL,
  "card_number" varchar(50) NOT NULL,
  "req_name" varchar(50) NOT NULL,
  "req_proof" varchar(50) NOT NULL,
  "req_status" varchar(50) NOT NULL default '0',
  "user_id" varchar(50) NOT NULL,
  PRIMARY KEY  ("req_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_addrequest'
#

LOCK TABLES "tbl_addrequest" WRITE;
/*!40000 ALTER TABLE "tbl_addrequest" DISABLE KEYS;*/
REPLACE INTO "tbl_addrequest" ("req_id", "req_do", "card_number", "req_name", "req_proof", "req_status", "user_id") VALUES
	('1','Add','1545448959488','anjana','Image_1205.jpg','0','1');
/*!40000 ALTER TABLE "tbl_addrequest" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(50) NOT NULL auto_increment,
  "admin_username" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_username", "admin_password") VALUES
	(1,'admin','admin');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_assignslot'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_assignslot" (
  "assignslot_id" int(10) unsigned NOT NULL auto_increment,
  "slot_id" varchar(50) NOT NULL,
  "user_id" varchar(50) NOT NULL,
  "shop_id" varchar(50) NOT NULL,
  "slot_date" varchar(50) NOT NULL,
  PRIMARY KEY  ("assignslot_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_assignslot'
#

LOCK TABLES "tbl_assignslot" WRITE;
/*!40000 ALTER TABLE "tbl_assignslot" DISABLE KEYS;*/
REPLACE INTO "tbl_assignslot" ("assignslot_id", "slot_id", "user_id", "shop_id", "slot_date") VALUES
	('3','2','1','5','2021-05-25');
REPLACE INTO "tbl_assignslot" ("assignslot_id", "slot_id", "user_id", "shop_id", "slot_date") VALUES
	('4','2','1','5','2021-05-25');
REPLACE INTO "tbl_assignslot" ("assignslot_id", "slot_id", "user_id", "shop_id", "slot_date") VALUES
	('5','1','1','5','2021-05-25');
REPLACE INTO "tbl_assignslot" ("assignslot_id", "slot_id", "user_id", "shop_id", "slot_date") VALUES
	('6','1','1','5','2021-05-25');
/*!40000 ALTER TABLE "tbl_assignslot" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_booking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_booking" (
  "booking_id" int(10) unsigned NOT NULL auto_increment,
  "user_id" varchar(50) NOT NULL,
  "shop_id" varchar(50) NOT NULL,
  "product_id" varchar(50) NOT NULL,
  "product_qty" varchar(50) NOT NULL,
  "booking_status" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("booking_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_booking'
#

LOCK TABLES "tbl_booking" WRITE;
/*!40000 ALTER TABLE "tbl_booking" DISABLE KEYS;*/
REPLACE INTO "tbl_booking" ("booking_id", "user_id", "shop_id", "product_id", "product_qty", "booking_status") VALUES
	('2','1','5','6','6','1');
/*!40000 ALTER TABLE "tbl_booking" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_cardrequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_cardrequest" (
  "cardrequest_id" int(10) unsigned NOT NULL auto_increment,
  "cardrequest_name" varchar(50) NOT NULL,
  "cardrequest_address" varchar(50) default NULL,
  "card_income" varchar(50) NOT NULL,
  "cardrequest_nos" int(10) unsigned NOT NULL,
  "cardrequest_photo" varchar(50) NOT NULL,
  "cardrequest_proof" varchar(50) NOT NULL,
  "user_id" varchar(50) NOT NULL,
  "cardrequest_status" tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  ("cardrequest_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_cardrequest'
#

LOCK TABLES "tbl_cardrequest" WRITE;
/*!40000 ALTER TABLE "tbl_cardrequest" DISABLE KEYS;*/
REPLACE INTO "tbl_cardrequest" ("cardrequest_id", "cardrequest_name", "cardrequest_address", "card_income", "cardrequest_nos", "cardrequest_photo", "cardrequest_proof", "user_id", "cardrequest_status") VALUES
	('1','Sarath','Kuruppathdathil','50,0000','0','photo_1185.jpg','proof_1230.png','1',1);
/*!40000 ALTER TABLE "tbl_cardrequest" ENABLE KEYS;*/
UNLOCK TABLES;


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
  "complaint_reply" varchar(50) NOT NULL default 'Not Yet Replied',
  "complaint_status" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_date", "complaint_content", "user_id", "shop_id", "complaint_reply", "complaint_status") VALUES
	(1,'2020-02-28','yjjgtjuygyuj',1,5,'Not Yet Replied','0');
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_date", "complaint_content", "user_id", "shop_id", "complaint_reply", "complaint_status") VALUES
	(2,'2020-02-28','fbsjdbdsvbxndvd',1,5,'Not Yet Replied','0');
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
# Table structure for table 'tbl_districtofficer'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_districtofficer" (
  "districtofficer_id" int(10) unsigned NOT NULL auto_increment,
  "districtofficer_name" varchar(50) NOT NULL,
  "districtofficer_contact" varchar(50) NOT NULL,
  "districtofficer_email" varchar(50) NOT NULL,
  "district_id" varchar(50) NOT NULL,
  "districtofficer_photo" varchar(50) NOT NULL,
  "districtofficer_proof" varchar(50) NOT NULL,
  "districtofficer_username" varchar(50) NOT NULL,
  "districtofficer_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("districtofficer_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_districtofficer'
#

LOCK TABLES "tbl_districtofficer" WRITE;
/*!40000 ALTER TABLE "tbl_districtofficer" DISABLE KEYS;*/
REPLACE INTO "tbl_districtofficer" ("districtofficer_id", "districtofficer_name", "districtofficer_contact", "districtofficer_email", "district_id", "districtofficer_photo", "districtofficer_proof", "districtofficer_username", "districtofficer_password") VALUES
	('1','Suhas','8606749626','suhas@gmail.com','3','proof_1261.jpg','','suhas','suhas@123');
/*!40000 ALTER TABLE "tbl_districtofficer" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_districtproduct'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_districtproduct" (
  "districtproduct_id" int(10) unsigned NOT NULL auto_increment,
  "product_id" varchar(50) NOT NULL,
  "districtofficer_id" varchar(50) NOT NULL,
  PRIMARY KEY  ("districtproduct_id")
);



#
# Dumping data for table 'tbl_districtproduct'
#

# No data found.



#
# Table structure for table 'tbl_districtstock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_districtstock" (
  "districtstock_id" int(10) unsigned NOT NULL auto_increment,
  "districtstock_number" varchar(50) NOT NULL,
  "districtstock_unit" varchar(50) NOT NULL,
  "districtproduct_id" varchar(50) NOT NULL,
  PRIMARY KEY  ("districtstock_id")
);



#
# Dumping data for table 'tbl_districtstock'
#

# No data found.



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
# Table structure for table 'tbl_member'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_member" (
  "member_id" int(10) unsigned NOT NULL auto_increment,
  "member_name" varchar(50) NOT NULL,
  "member_photo" varchar(50) NOT NULL,
  "member_proof" varchar(50) NOT NULL,
  "user_id" varchar(50) NOT NULL,
  PRIMARY KEY  ("member_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_member'
#

LOCK TABLES "tbl_member" WRITE;
/*!40000 ALTER TABLE "tbl_member" DISABLE KEYS;*/
REPLACE INTO "tbl_member" ("member_id", "member_name", "member_photo", "member_proof", "user_id") VALUES
	('1','biju','photo_1998.png','proof_1884.jpg','1');
REPLACE INTO "tbl_member" ("member_id", "member_name", "member_photo", "member_proof", "user_id") VALUES
	('2','gpg','photo_1418.png','proof_1962.jpg','1');
/*!40000 ALTER TABLE "tbl_member" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(50) NOT NULL auto_increment,
  "place_name" varchar(50) NOT NULL,
  "district_id" int(50) NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=10;



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
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(9,'kalamasery',3);
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_povertytype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_povertytype" (
  "povertytype_id" int(50) NOT NULL auto_increment,
  "povertytype_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("povertytype_id")
) AUTO_INCREMENT=9;



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
REPLACE INTO "tbl_povertytype" ("povertytype_id", "povertytype_name") VALUES
	(8,'White');
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
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_productprice'
#

LOCK TABLES "tbl_productprice" WRITE;
/*!40000 ALTER TABLE "tbl_productprice" DISABLE KEYS;*/
REPLACE INTO "tbl_productprice" ("productprice_id", "product_id", "povertytype_id", "product_price") VALUES
	(1,6,6,45);
REPLACE INTO "tbl_productprice" ("productprice_id", "product_id", "povertytype_id", "product_price") VALUES
	(3,7,5,1833);
REPLACE INTO "tbl_productprice" ("productprice_id", "product_id", "povertytype_id", "product_price") VALUES
	(4,8,5,2);
/*!40000 ALTER TABLE "tbl_productprice" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_quota'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_quota" (
  "quota_id" int(10) unsigned NOT NULL auto_increment,
  "povertytype_id" varchar(50) NOT NULL,
  "product_id" varchar(50) NOT NULL,
  "product_qty" varchar(50) NOT NULL,
  PRIMARY KEY  ("quota_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_quota'
#

LOCK TABLES "tbl_quota" WRITE;
/*!40000 ALTER TABLE "tbl_quota" DISABLE KEYS;*/
REPLACE INTO "tbl_quota" ("quota_id", "povertytype_id", "product_id", "product_qty") VALUES
	('1','6','6','2');
REPLACE INTO "tbl_quota" ("quota_id", "povertytype_id", "product_id", "product_qty") VALUES
	('2','6','8','.5');
/*!40000 ALTER TABLE "tbl_quota" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_requestmembers'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_requestmembers" (
  "requestmembers_id" int(10) unsigned NOT NULL auto_increment,
  "requestmembers_name" varchar(50) NOT NULL,
  "requestmembers_photo" varchar(50) NOT NULL,
  "requestmembers_proof" varchar(50) NOT NULL,
  "cardrequest_id" varchar(50) NOT NULL,
  PRIMARY KEY  ("requestmembers_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_requestmembers'
#

LOCK TABLES "tbl_requestmembers" WRITE;
/*!40000 ALTER TABLE "tbl_requestmembers" DISABLE KEYS;*/
REPLACE INTO "tbl_requestmembers" ("requestmembers_id", "requestmembers_name", "requestmembers_photo", "requestmembers_proof", "cardrequest_id") VALUES
	('1','biju','photo_1103.jpg','proof_1050.png','1');
REPLACE INTO "tbl_requestmembers" ("requestmembers_id", "requestmembers_name", "requestmembers_photo", "requestmembers_proof", "cardrequest_id") VALUES
	('2','jisha','photo_1668.jpg','proof_1329.jpg','1');
/*!40000 ALTER TABLE "tbl_requestmembers" ENABLE KEYS;*/
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
  "supplyofficer_id" varchar(50) NOT NULL,
  PRIMARY KEY  ("shop_id")
) AUTO_INCREMENT=8;



#
# Dumping data for table 'tbl_shop'
#

LOCK TABLES "tbl_shop" WRITE;
/*!40000 ALTER TABLE "tbl_shop" DISABLE KEYS;*/
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_address", "shop_contact", "shop_email", "shop_shopno", "shop_licenseproof", "shop_photo", "shop_username", "shop_password", "shop_status", "location_id", "supplyofficer_id") VALUES
	(4,'nbjbjh','jbjbjk','95393934590','ar@gmail.com','22225','proof_1697.jpg','Image_1513.jpg','appu@gmail.com','jjjjjj',NULL,1,'');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_address", "shop_contact", "shop_email", "shop_shopno", "shop_licenseproof", "shop_photo", "shop_username", "shop_password", "shop_status", "location_id", "supplyofficer_id") VALUES
	(5,'Mundothil Ration Store','fdsfmv dffd dfds ','225522233','a@gmail.com','42178596','proof_1367.jpg','Image_1871.jpg','mundothil','mundothil',NULL,1,'');
REPLACE INTO "tbl_shop" ("shop_id", "shop_name", "shop_address", "shop_contact", "shop_email", "shop_shopno", "shop_licenseproof", "shop_photo", "shop_username", "shop_password", "shop_status", "location_id", "supplyofficer_id") VALUES
	(7,'GEEVAN P GIGI','PUNNILAM H
KOOVAPPARA','9846935869','geevanpgigi23@gmail.com','hhg','proof_1756.jpg','Image_1912.jpg','sath','sath',NULL,1,'4');
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
) AUTO_INCREMENT=5;



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
# Table structure for table 'tbl_shoprequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_shoprequest" (
  "shoprequest_id" int(10) unsigned NOT NULL auto_increment,
  "product_id" varchar(50) NOT NULL,
  "product_qty" varchar(50) NOT NULL,
  "shop_id" varchar(50) NOT NULL,
  "shoprequest_status" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("shoprequest_id")
);



#
# Dumping data for table 'tbl_shoprequest'
#

# No data found.



#
# Table structure for table 'tbl_slot'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_slot" (
  "slot_id" int(10) unsigned NOT NULL auto_increment,
  "slot_from" varchar(50) NOT NULL,
  PRIMARY KEY  ("slot_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_slot'
#

LOCK TABLES "tbl_slot" WRITE;
/*!40000 ALTER TABLE "tbl_slot" DISABLE KEYS;*/
REPLACE INTO "tbl_slot" ("slot_id", "slot_from") VALUES
	('1','10:00');
REPLACE INTO "tbl_slot" ("slot_id", "slot_from") VALUES
	('2','10:10');
/*!40000 ALTER TABLE "tbl_slot" ENABLE KEYS;*/
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
	(6,82,'kg',4);
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
) AUTO_INCREMENT=13;



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
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	(12,'kit',3);
/*!40000 ALTER TABLE "tbl_subcategory" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_talukofficer'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_talukofficer" (
  "talukofficer_id" int(10) unsigned NOT NULL auto_increment,
  "talukofficer_name" varchar(50) NOT NULL,
  "talukofficer_contact" varchar(50) NOT NULL,
  "talukofficer_email" varchar(50) NOT NULL,
  "place_id" varchar(50) NOT NULL,
  "talukofficer_photo" varchar(50) NOT NULL,
  "talukofficer_proof" varchar(50) NOT NULL,
  "talukofficer_username" varchar(50) NOT NULL,
  "talukofficer_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("talukofficer_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_talukofficer'
#

LOCK TABLES "tbl_talukofficer" WRITE;
/*!40000 ALTER TABLE "tbl_talukofficer" DISABLE KEYS;*/
REPLACE INTO "tbl_talukofficer" ("talukofficer_id", "talukofficer_name", "talukofficer_contact", "talukofficer_email", "place_id", "talukofficer_photo", "talukofficer_proof", "talukofficer_username", "talukofficer_password") VALUES
	('1','Geevan','8606749625','geevanpgigi23@gmail.com','2','Image_1040.jpg','','geevan','geevan@123');
REPLACE INTO "tbl_talukofficer" ("talukofficer_id", "talukofficer_name", "talukofficer_contact", "talukofficer_email", "place_id", "talukofficer_photo", "talukofficer_proof", "talukofficer_username", "talukofficer_password") VALUES
	('2','das','8606749625','das@gmail.com','8','Image_1678.png','','daskk','daskk@123');
/*!40000 ALTER TABLE "tbl_talukofficer" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_talukproduct'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_talukproduct" (
  "talukproduct_id" int(10) unsigned NOT NULL auto_increment,
  "product_id" tinyint(3) unsigned NOT NULL,
  "talukofficer_id" varchar(50) NOT NULL,
  PRIMARY KEY  ("talukproduct_id")
);



#
# Dumping data for table 'tbl_talukproduct'
#

# No data found.



#
# Table structure for table 'tbl_talukrequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_talukrequest" (
  "talukrequest_id" int(10) unsigned default NULL,
  "product_id" varchar(50) NOT NULL,
  "product_qty" varchar(50) NOT NULL,
  "talukofficer_id" varchar(50) NOT NULL,
  "talkrequest_status" varchar(50) NOT NULL default '0'
);



#
# Dumping data for table 'tbl_talukrequest'
#

# No data found.



#
# Table structure for table 'tbl_talukstock'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_talukstock" (
  "talukstock_id" int(10) unsigned NOT NULL auto_increment,
  "talukstock_number" varchar(50) NOT NULL,
  "talukstock_unit" varchar(50) NOT NULL,
  "talukproduct_id" varchar(50) NOT NULL,
  PRIMARY KEY  ("talukstock_id")
);



#
# Dumping data for table 'tbl_talukstock'
#

# No data found.



#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) NOT NULL,
  "user_contact" varchar(50) NOT NULL,
  "user_email" varchar(50) NOT NULL,
  "user_address" varchar(50) NOT NULL,
  "user_gender" varchar(50) NOT NULL,
  "location_id" varchar(50) NOT NULL,
  "user_nomember" varchar(50) NOT NULL,
  "user_photo" varchar(50) NOT NULL,
  "user_proof" varchar(50) NOT NULL,
  "povertytype_id" varchar(50) default NULL,
  "user_cardno" varchar(50) default '0',
  "user_username" varchar(50) NOT NULL,
  "user_password" varchar(50) NOT NULL,
  "user_status" varchar(50) NOT NULL default '0',
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_email", "user_address", "user_gender", "location_id", "user_nomember", "user_photo", "user_proof", "povertytype_id", "user_cardno", "user_username", "user_password", "user_status") VALUES
	('1','Sarath','8606749624','geevanpgigi23@gmail.com','null','Male','1','2','photo_1750.jpg','proof_1265.png','6','1706992021','sarath','sarath','2');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
