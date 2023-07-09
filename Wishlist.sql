CREATE DATABASE  IF NOT EXISTS `wishlist` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wishlist`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: wishlist
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_ID` varchar(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Age` int NOT NULL,
  `Manager_S_No.` varchar(45) DEFAULT NULL,
  `Manufacturer_S_No.` varchar(45) DEFAULT NULL,
  `Sales_R_No.` varchar(45) DEFAULT NULL,
  `Customer_S_No.` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Admin_ID`),
  UNIQUE KEY `Admin_ID_UNIQUE` (`Admin_ID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `admincol_UNIQUE` (`password`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('A001','prerak','pg123','Prerak','Gupta','prerak@gmail.com',20,'1-50','1-50','NA','1-50'),('A002','pranav','blah','Pranav','Aggarwal','pranav@gmail.com',19,'51-100','51-100','NA','51-100');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `customer_id` varchar(255) NOT NULL,
  `no_of_items` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('C002',-9),('C003',3),('C007',1),('C010',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `product_id` varchar(255) NOT NULL,
  `customer_id` varchar(45) NOT NULL,
  `product_name` varchar(45) DEFAULT 'null',
  `quantity` int NOT NULL,
  `S_No` int NOT NULL,
  PRIMARY KEY (`S_No`),
  UNIQUE KEY `S_No._UNIQUE` (`S_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES ('P005','C003','S',2,5),('P008','C003','S',5,6),('P009','C003','S',1,7),('P001','C007','Hairy Woodland Brome',1,8),('P001','C010','Hairy Woodland Brome',4,12);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_ID` varchar(20) NOT NULL,
  `Customer_type` varchar(20) NOT NULL,
  `Customer_First_Name` varchar(20) NOT NULL,
  `Customer_Last_Name` varchar(20) DEFAULT NULL,
  `Address` varchar(250) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Age` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Mobile_no` varchar(11) NOT NULL,
  `Gender` char(20) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Customer_ID_UNIQUE` (`Customer_ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C001','Normal','Anjela','Worling','Suite 70','1999-05-12',23,'aworling0@baidu.com','40635xvowf','Female','a'),('C002','Prime','Lillis','Lantuff','Room 1146','1991-04-02',31,'llantuff1@soup.io','29385zprbg','Genderfluid','a'),('C003','Prime','Jenny','Devigne','Room 1722','1970-01-29',53,'jdevigne2@google.com','55223vxsov','Female','a'),('C004','Prime','Bryce','Bloxsome','Apt 1334','1974-07-03',48,'bbloxsome3@hexun.com','89614tpmfd','Male','a'),('C005','Prime','Chastity','MacMarcuis','Room 1753','2009-03-25',13,'cmacmarcuis4@samsung.com','62299tgsgt','Female','a'),('C006','Prime','Davis','Probet','Suite 26','1957-02-28',65,'dprobet5@naver.com','59050exgnm','Male','aa'),('C007','Prime','Conrad','Chantrell','Room 1603','2006-10-06',16,'cchantrell6@desdev.cn','56387bbboy','Agender','a'),('C008','Prime','Pearl','Disbrey','14th Floor','1988-09-09',34,'pdisbrey7@meetup.com','34747shpof','Female','a'),('C009','Prime','Winny','Criple','Suite 46','2003-09-19',19,'wcriple8@microsoft.com','70041cmreh','Female','a'),('C010','Prime','Mariel','Dwyer','Suite 85','1987-01-10',36,'mdwyer9@google.it','79857stabm','Female','a'),('C011','Prime','Adorne','Hunnawill','PO Box 8315','1969-06-03',53,'ahunnawilla@stanford.edu','49762qcnvq','Female','a'),('C012','Normal','Chaddy','Birmingham','Suite 43','1983-08-10',39,'cbirminghamb@stanford.edu','66091xurdk','Male','a'),('C013','Prime','Napoleon','Keems','8th Floor','1984-09-09',38,'nkeemsc@who.int','38991wiced','Male','a'),('C014','Normal','Brandyn','Fishpoole','Suite 64','1953-05-22',69,'bfishpooled@thetimes.co.uk','54877gyqlb','Male','aa'),('C015','Prime','Elizabet','Baert','Suite 95','1981-05-22',41,'ebaerte@auda.org.au','16211lcqks','Female','eg'),('C016','Normal','Kaja','Ducker','19th Floor','1999-05-30',23,'kduckerf@unblog.fr','96086szzki','Female','a'),('C017','Normal','Ronald','Parsonage','Room 1492','1980-08-26',42,'rparsonageg@gov.uk','71491hhcke','Male','a'),('C018','Normal','Tootsie','Gittis','Apt 1357','1986-01-05',37,'tgittish@woothemes.com','19316wkjtp','Female','a'),('C019','Prime','Tallie','Reven','Room 1699','1979-08-29',43,'treveni@miibeian.gov.cn','91679xdudi','Male','a'),('C020','Normal','Kerrill','McInerney','Apt 1112','2000-07-10',22,'kmcinerneyj@dot.gov','13626nndjk','Female','a'),('C021','Normal','Griselda','Ruckman','10th Floor','1986-08-31',36,'gruckmank@baidu.com','82542ipyhc','Female','a'),('C022','Normal','Fern','Assiter','20th Floor','1951-10-27',71,'fassiterl@engadget.com','33611hprcf','Polygender','hh'),('C023','Normal','Dion','Kose','PO Box 20581','1998-08-13',24,'dkosem@sogou.com','80674araky','Female','a'),('C024','Normal','Morgana','Bibb','PO Box 38594','2003-07-22',19,'mbibbn@scientificamerican.com','43989bijva','Female','a'),('C025','Normal','Fabiano','Roseaman','Suite 63','1958-03-31',64,'froseamano@wikia.com','86193axfyr','Male','a'),('C026','Normal','Tory','Gribble','Room 419','1975-02-21',47,'tgribblep@pcworld.com','87380xebqn','Polygender','a'),('C027','Prime','Calhoun','Di Nisco','PO Box 14896','1989-02-02',34,'cdiniscoq@delicious.com','71462bwkjw','Male','wre'),('C028','Prime','Lennie','O\'Grogane','Room 848','1950-03-02',72,'logroganer@plala.or.jp','37357yjbpv','Male','a'),('C029','Normal','Millard','Wahncke','Apt 1256','1967-02-04',56,'mwahnckes@mediafire.com','78225jylio','Male','a'),('C030','Prime','Pearla','Grinstead','Room 89','1987-05-25',35,'pgrinsteadt@cdc.gov','86572svkfm','Female','a'),('C031','Normal','Noell','Castelow','9th Floor','1979-04-22',43,'ncastelowu@dell.com','19345mnprk','Female','a'),('C032','Normal','Zachery','Jacklings','PO Box 71356','1988-06-06',34,'zjacklingsv@apple.com','07318pyaod','Polygender','ui'),('C033','Prime','Gwendolin','Gisby','PO Box 61903','1955-10-01',67,'ggisbyw@weather.com','58619pndib','Female','a'),('C034','Normal','Justin','Plewman','Suite 36','1988-01-18',35,'jplewmanx@cmu.edu','90269ebjhl','Male','a'),('C035','Normal','Robena','Gout','Apt 1725','2006-02-11',16,'rgouty@list-manage.com','89019lpapm','Female','a'),('C036','Normal','Hinda','Terrans','Suite 56','1962-05-18',60,'hterransz@posterous.com','86518njwmm','Female','eh'),('C037','Prime','Peirce','Bettison','Room 129','2007-02-07',16,'pbettison10@lycos.com','66205zqanh','Male','a'),('C038','Prime','Ashley','Wehnerr','PO Box 4018','1994-07-30',28,'awehnerr11@europa.eu','88293chgzv','Bigender','a'),('C039','Prime','Anthiathia','Odell','Apt 117','1962-05-09',60,'aodell12@jiathis.com','90432hjepg','Female','a'),('C040','Normal','Sloane','MacKniely','Apt 291','2005-12-09',17,'smackniely13@freewebs.com','44768vgozc','Male','yujn'),('C041','Prime','Eduard','Vondruska','Apt 1992','2000-03-26',22,'evondruska14@shinystat.com','59088xsnns','Male','a'),('C042','Prime','Mariann','Dossantos','10th Floor','1987-03-31',35,'mdossantos15@google.ca','54800tkosc','Female','a'),('C043','Prime','Sharai','Bartkiewicz','Suite 93','1999-03-31',23,'sbartkiewicz16@i2i.jp','15572yersr','Female','a'),('C044','Prime','Petronella','Carlyle','PO Box 69874','1992-08-17',30,'pcarlyle17@blinklist.com','04964uqlpz','Female','a'),('C045','Prime','Norby','Teggin','Apt 1740','1999-03-03',23,'nteggin18@pinterest.com','28785tdqzv','Male','a'),('C046','Prime','Roderigo','Petrazzi','Room 1609','1986-08-12',36,'rpetrazzi19@php.net','61376xexom','Male','r'),('C047','Prime','Romola','Guarnier','Apt 245','2001-08-30',21,'rguarnier1a@vinaora.com','31211uckev','Female','a'),('C048','Prime','Melantha','Colls','PO Box 31985','1983-06-27',39,'mcolls1b@wix.com','40096qmnxl','Female','a'),('C049','Prime','Catherin','Hawksworth','16th Floor','2000-06-14',22,'chawksworth1c@ed.gov','51787ulmax','Female','a'),('C050','Prime','Lilian','Sterman','14th Floor','1993-04-05',29,'lsterman1d@google.nl','16332sbgys','Female','a'),('C051','Normal','Krista','Rimour','Room 510','1959-10-18',63,'krimour1e@jugem.jp','94671wruhi','Female','a'),('C052','Prime','Kippy','Tollett','Apt 563','2008-06-15',14,'ktollett1f@ted.com','67104crrmn','Male','a'),('C053','Normal','Kathye','Ilyukhov','Room 1562','2001-02-26',21,'kilyukhov1g@wikipedia.org','71872lmauw','Female','u'),('C054','Normal','Evanne','Houlridge','Apt 941','1950-07-25',72,'ehoulridge1h@sbwire.com','83584tjcby','Polygender','a'),('C055','Prime','Glyn','Klemenz','Suite 15','1980-01-18',43,'gklemenz1i@google.com.br','93821ccusd','Female','a'),('C056','Normal','Tris','Horley','Apt 757','1955-04-21',67,'thorley1j@freewebs.com','92139nbgkv','Male','a'),('C057','Prime','Demott','Dorot','Room 482','1955-05-13',67,'ddorot1k@google.cn','48247kijjl','Male','a'),('C058','Normal','Chantalle','Kadwallider','Apt 954','2009-05-08',13,'ckadwallider1l@canalblog.com','11748kziof','Female','4ty1w'),('C059','Normal','Freida','Petticrow','PO Box 64559','1960-10-09',62,'fpetticrow1m@earthlink.net','72057zmycr','Female','a'),('C060','Prime','Marie-ann','M\'Quharg','Apt 1166','1955-06-02',67,'mmquharg1n@cam.ac.uk','04554mnirt','Female','a'),('C061','Prime','Marylynne','Sneyd','Suite 97','1989-10-16',33,'msneyd1o@github.io','00401oftex','Female','a'),('C062','Prime','Fayth','McKibben','Room 1699','1983-03-03',39,'fmckibben1p@slideshare.net','99130kcoma','Female','a'),('C063','Prime','Cyrill','Treker','18th Floor','1976-10-29',46,'ctreker1q@usda.gov','19900arsxi','Male','r'),('C064','Prime','Bruce','Exley','Room 1470','1951-06-30',71,'bexley1r@pinterest.com','41930iatfb','Male','aa/wsvgnwebkugqen\'g'),('C065','Normal','Lia','McIlhatton','Suite 5','1982-02-20',40,'lmcilhatton1s@pbs.org','44784cysbh','Female','wr'),('C066','Prime','Clayborn','Winspur','Apt 623','2007-06-25',15,'cwinspur1t@infoseek.co.jp','23980zmshv','Male','herh'),('C067','Normal','Jeramie','Prenty','Room 1089','2004-08-11',18,'jprenty1u@ox.ac.uk','47315kprmc','Male','er\'hk'),('C068','Normal','Darb','Rawlinson','Apt 1062','1971-10-13',51,'drawlinson1v@odnoklassniki.ru','08171strss','Male','e\'rlh'),('C069','Normal','Leola','Bassam','8th Floor','1993-02-07',30,'lbassam1w@php.net','88332knawk','Female','re;h'),('C070','Normal','Layla','Bottrill','Room 1803','1956-10-31',66,'lbottrill1x@flickr.com','15914kcllh','Polygender','erl'),('C071','Normal','Devinne','Gentreau','Suite 53','1997-07-18',25,'dgentreau1y@typepad.com','88471sjekv','Female','relh'),('C072','Normal','Peadar','Eaklee','PO Box 42978','1958-12-27',64,'peaklee1z@webnode.com','53374ekejp','Male','lgj'),('C073','Prime','Dulci','Cawcutt','Suite 74','1995-02-09',28,'dcawcutt20@storify.com','04680cpzel','Female','\'g'),('C074','Normal','Nannette','Pollitt','Suite 89','1956-12-19',66,'npollitt21@cnn.com','02617kzuen','Female','ew'),('C075','Prime','Glen','De Matteis','PO Box 79974','1963-10-08',59,'gdematteis22@icio.us','86988pzebq','Female','kgew'),('C076','Prime','Auroora','Shanley','Room 1567','2002-06-05',20,'ashanley23@ebay.co.uk','31876oosao','Female','\'kg'),('C077','Normal','Wolf','Manshaw','Room 1749','1960-07-27',62,'wmanshaw24@topsy.com','00373dckvj','Male','wekhwe'),('C078','Normal','L;urette','Goosey','PO Box 33994','2008-07-31',14,'lgoosey25@360.cn','52443bvizp','Female','\'kh'),('C079','Normal','Forster','Langridge','Suite 25','1950-12-01',72,'flangridge26@github.io','56096ptgab','Male','\'wekhb'),('C080','Normal','Revkah','Vanns','Suite 23','2007-08-29',15,'rvanns27@technorati.com','54318bouzp','Female','\'wekg'),('C081','Prime','Berrie','Jagiello','PO Box 54183','1950-02-14',72,'bjagiello28@goo.gl','17909gxxwg','Female','wq3kg'),('C082','Prime','Aura','Blunkett','7th Floor','2008-07-25',14,'ablunkett29@wsj.com','64688omrsr','Female','w3q\'kg'),('C083','Normal','Link','Bellringer','PO Box 9295','1996-08-29',26,'lbellringer2a@washingtonpost.com','36898wjyzh','Male','\'e'),('C084','Prime','Rory','Kochl','Apt 692','1973-03-21',49,'rkochl2b@mlb.com','53173rbesn','Polygender','g'),('C085','Prime','Clayson','Dyet','18th Floor','1960-11-10',62,'cdyet2c@furl.net','15853mvamp','Male','we'),('C086','Normal','Cordula','Peinton','Room 479','1990-05-08',32,'cpeinton2d@tripadvisor.com','16860oldyi','Female','egj\'ew'),('C087','Normal','Dallas','Thornewell','Room 1453','1965-11-15',57,'dthornewell2e@scribd.com','58618ckhbj','Female','wke'),('C088','Normal','Noby','Cuttler','PO Box 64137','1952-10-13',70,'ncuttler2f@tuttocitta.it','07640qnqju','Male','g'),('C089','Normal','Fedora','Mc Ilory','4th Floor','1972-12-13',50,'fmcilory2g@examiner.com','31633fmwoo','Female','e'),('C090','Normal','Douglass','Bienvenu','10th Floor','1990-09-07',32,'dbienvenu2h@fastcompany.com','94521dmuhu','Male','gle'),('C091','Prime','Ramona','Lazar','PO Box 53579','1985-12-28',37,'rlazar2i@godaddy.com','92843avvsz','Female','g'),('C092','Prime','Norri','Broschek','5th Floor','1969-12-29',53,'nbroschek2j@360.cn','69927boeny','Female','ewkg\'kwewe'),('C093','Normal','Ursuline','Lower','Suite 80','1989-01-07',34,'ulower2k@reuters.com','58338xvhok','Female','kg'),('C094','Prime','Sancho','Keeting','Apt 1250','2003-09-24',19,'skeeting2l@cam.ac.uk','83376eqmxj','Genderqueer','wqkewge'),('C095','Normal','Petronella','Beidebeke','Suite 94','2007-04-05',15,'pbeidebeke2m@psu.edu','51515jftew','Female','\'wkgw'),('C096','Prime','Barnie','Surfleet','Suite 57','1992-02-10',30,'bsurfleet2n@nymag.com','13391dhvqx','Male','esjjdb'),('C097','Prime','Vitoria','Knoble','Apt 1199','1988-11-17',34,'vknoble2o@netlog.com','70354owvmp','Female','r'),('C098','Prime','Slade','Keeping','Room 323','2009-10-22',13,'skeeping2p@msn.com','86777jccow','Male','wjw'),('C099','Prime','Olenolin','Hanton','Room 1137','1977-10-19',45,'ohanton2q@blinklist.com','81592vaikn','Male','w'),('C100','Normal','Sebastien','Kampshell','Room 1101','2006-03-26',16,'skampshell2r@fema.gov','43743qavgo','Male','w'),('C101','Normal','blah','blah','blah','2002-12-27',56,'blah','blah','Male','peckcr'),('C102','Normal','Perry','Platypus','Seattle','2003-09-18',20,'perry@email.in','98765xxxxx','Male','paswd');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliver`
--

DROP TABLE IF EXISTS `deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliver` (
  `Order_ID` varchar(20) NOT NULL,
  `Delivery_Partner_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`Order_ID`),
  UNIQUE KEY `Order_ID_UNIQUE` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliver`
--

LOCK TABLES `deliver` WRITE;
/*!40000 ALTER TABLE `deliver` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_partner`
--

DROP TABLE IF EXISTS `delivery_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partner` (
  `Delivery_Partner_ID` varchar(20) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Mobile_No` varchar(11) NOT NULL,
  `Number_of_Orders` int NOT NULL,
  `Orders_delivered` int NOT NULL,
  `Orders_left` int NOT NULL,
  `Orders_picked_up` int NOT NULL,
  `Payment_received` float NOT NULL,
  `Complaints` varchar(250) DEFAULT NULL,
  `Manager_ID` varchar(20) DEFAULT NULL,
  `Manufacturer_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Delivery_Partner_ID`),
  UNIQUE KEY `Delivery_Partner_ID_UNIQUE` (`Delivery_Partner_ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `Manager_ID_idx` (`Manager_ID`),
  KEY `Manufacturer_ID_idx` (`Manufacturer_ID`),
  CONSTRAINT `Manager_ID` FOREIGN KEY (`Manager_ID`) REFERENCES `sales_manager` (`Sales_manager_ID`),
  CONSTRAINT `Manufacturer_ID` FOREIGN KEY (`Manufacturer_ID`) REFERENCES `manufacturer` (`Manufacturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partner`
--

LOCK TABLES `delivery_partner` WRITE;
/*!40000 ALTER TABLE `delivery_partner` DISABLE KEYS */;
INSERT INTO `delivery_partner` VALUES ('D001','Rowan','Posner','rposner0@taobao.com','20825urzvj',15,8,6,1,89406,'gvapqkmhjhvjgxoyrcaaugpvowxvelzwgyiggcbwzgz','S001','M001'),('D002','Byram','Mulqueeny','bmulqueeny1@hao123.com','68813qcvlm',7,0,2,5,54172,'','S002','M002'),('D003','Leola','Gandley','lgandley2@wsj.com','37809ycvgj',8,3,4,1,32147,'','S003','M003'),('D004','Magdalena','Lillo','mlillo3@wikispaces.com','16522tnjfo',15,9,3,3,18638,'','S004','M004'),('D005','Rowen','Torricella','rtorricella4@wix.com','86592extab',19,3,9,7,91935,'','S005','M005'),('D006','Allis','Meindl','ameindl5@youku.com','99207nrvmk',15,7,2,6,7111,'','S006','M006'),('D007','Benni','Starmer','bstarmer6@bloglines.com','56298wvmre',5,2,3,0,92279,'','S007','M007'),('D008','Pyotr','Allsebrook','pallsebrook7@wikispaces.com','48283phyuw',9,2,5,2,64260,'','S008','M008'),('D009','Law','Backler','lbackler8@smugmug.com','94459gaofa',14,5,9,0,78792,'','S009','M009'),('D010','Arturo','Rushmare','arushmare9@msu.edu','09151zzcrl',11,1,8,2,3270,'','S010','M010'),('D011','Sullivan','Houlston','shoulstona@uiuc.edu','98514joyro',7,1,0,6,82691,'','S011','M011'),('D012','Quinlan','Ream','qreamb@irs.gov','29280fqpuu',12,2,4,6,25828,'','S012','M012'),('D013','Logan','Tulley','ltulleyc@sun.com','47678qmuhz',20,4,9,7,39221,'xzxahmvruelzuviidptqpxpuwzovskzndmzofmilbjq','S013','M013'),('D014','Penelope','Jurgenson','pjurgensond@topsy.com','42690vjoki',12,1,6,5,1774,'vixxcdlfvclwaugqspxwbemvownogenplrjaddgattk','S014','M014'),('D015','Cassandry','Anton','cantone@google.fr','99304ghzqe',10,4,6,0,79344,'qlhljsfhfwqdcyzbcdnibxbzvgjqtprzldrkwauzmsq','S015','M015'),('D016','Kerry','Wichard','kwichardf@mapquest.com','35436tsubm',14,4,9,1,2692,'ihbduyxnvwukrxjrisfofsaxctxzbbqlgvwmvirqcbe','S016','M016'),('D017','Ellsworth','Abreheart','eabreheartg@stanford.edu','04512shyfh',8,5,1,2,57458,'yhhexhirfmxavjpzybmhzrdprkzrepynnmwmmbsqtze','S017','M017'),('D018','Francesco','Steels','fsteelsh@scribd.com','08058hqmla',11,3,0,8,97066,'fkqekigoqjlbkmkxtlnqqkrebcooxrqpcnoibonoaaz','S018','M018'),('D019','Constantia','Paske','cpaskei@sitemeter.com','87276zhlkm',18,7,6,5,67528,'cyanotysfcmgxqivnmcxubbtbpkyyvcomvohdeweqls','S019','M019'),('D020','Abigale','Lenox','alenoxj@g.co','60435faxst',10,6,4,0,86218,'tceqtvrqrgxwnkhrvsrxeejedjianvonsietlzgcfrs','S020','M020'),('D021','Dorey','Gummie','dgummiek@creativecommons.org','75515palmi',6,5,0,1,78043,'xcjuxmkwykxxkrvrbistxylbyjsdwwpprbtirvfwnwb','S021','M021'),('D022','Reyna','Constantine','rconstantinel@mozilla.org','08830boqle',7,1,1,5,49513,'inagawcvqrfuykfsnkqmwmydgciibzmmbgtemhuqwod','S022','M022'),('D023','Lexie','Armitt','larmittm@sitemeter.com','45234ptrrd',11,1,3,7,91833,'pcmbanszadziioedgdcwdqqdrakedilwayokrfwkibb','S023','M023'),('D024','Elbert','Widdecombe','ewiddecomben@cocolog-nifty.com','48328mnuln',19,8,7,4,44645,'bierazmepjpyseubyogjslfgrofysspumxjfvhehtrz','S024','M024'),('D025','Carlynn','Wilks','cwilkso@boston.com','62757vvmuh',15,8,5,2,12161,'uxdwohtahqbwqicdfvkkelvlpukilqrrtedylebiyjv','S025','M025'),('D026','Oriana','Barnwille','obarnwillep@vimeo.com','94410dyrkq',8,0,8,0,72645,'','S026','M026'),('D027','Arabella','Benwell','abenwellq@parallels.com','81714snhrh',10,4,6,0,9589,'','S027','M027'),('D028','Risa','Isham','rishamr@ezinearticles.com','40562qkeid',13,6,4,3,29556,'','S028','M028'),('D029','Magdalene','Alker','malkers@etsy.com','13954mpiyn',8,7,1,0,41521,'','S029','M029'),('D030','Frankie','Muckart','fmuckartt@dyndns.org','26397yclmp',5,3,1,1,43589,'','S030','M030'),('D031','Elia','Caneo','ecaneou@storify.com','25267tdasi',19,3,8,8,56983,'','S031','M031'),('D032','Lynnet','Stichall','lstichallv@domainmarket.com','42422gviuj',19,9,4,6,8571,'','S032','M032'),('D033','Gideon','Lisett','glisettw@multiply.com','94007nwntu',16,2,7,7,82712,'','S033','M033'),('D034','Sancho','Gillbee','sgillbeex@cargocollective.com','01492upouy',10,2,3,5,15884,'ahzryuupjugebtggdzzedgguxipzbvaaednndhsnhap','S034','M034'),('D035','Brynna','Milham','bmilhamy@microsoft.com','02367wwnvu',9,0,7,2,53371,'drrbkzoipmvabwaobidijahtmjsnkwvalfduuxkprkg','S035','M035'),('D036','Kelsy','O\'Hederscoll','kohederscollz@mozilla.com','42683kmcsx',15,5,4,6,61044,'adyrudiugnuxwtixndrfcwyaivevfaxpzltlevmjuwv','S036','M036'),('D037','Burton','Tipper','btipper10@icio.us','38435djxka',25,8,8,9,66796,'ygiixlidpmjlgnsuvwtcxxjtuptghmtmvmcztliolff','S037','M037'),('D038','Wendi','Koschek','wkoschek11@psu.edu','31483otyva',5,4,0,1,93599,'gsahtkyosrcmbvdtlpjqcrncjfzfseuynnnqfdbvvhd','S038','M038'),('D039','Georg','Mallan','gmallan12@mapy.cz','89677nvjxf',13,3,2,8,67873,'pjvejfwupnmfnvhdwvbuovpmuftbgwkeclfluiabwyo','S039','M039'),('D040','Morse','Hess','mhess13@spotify.com','61000vswed',19,7,5,7,96670,'tybyboluqcezdvmbjanmuhtfneryfwsfnegbaegypmx','S040','M040'),('D041','Rochester','Lempke','rlempke14@latimes.com','16606ykzay',21,5,9,7,63929,'vkqkcvpvlgskhrkdltsdujlbfzcbthbyjnmletgdaof','S041','M041'),('D042','Wait','Calafato','wcalafato15@mysql.com','75780jmlvt',8,2,3,3,65099,'evqgohqkhajldavkoojnsyicmfnikpuaxhqwvdxxcbq','S042','M042'),('D043','Trudy','McKmurrie','tmckmurrie16@independent.co.uk','51082lzvvv',10,1,4,5,94782,'vsmxvqvyzuotylqcbfldpnzlgxadynhkguruimlxlqk','S043','M043'),('D044','Noam','Bawdon','nbawdon17@addthis.com','00729edhyg',12,8,2,2,17125,'kvyprviweqzacecdxazmzzswfmoekbymcpcahalkhdc','S044','M044'),('D045','Fabian','Tompkiss','ftompkiss18@narod.ru','89495fcihx',10,3,0,7,46760,'soyqsjcpyorgdqxmdmpecruhuvhozxefohqrxsjfguq','S045','M045'),('D046','Rollin','Laimable','rlaimable19@bizjournals.com','44787nrrky',17,3,8,6,97991,'','S046','M046'),('D047','Stanfield','Fearnley','sfearnley1a@storify.com','33050vwdbj',18,9,2,7,44375,'','S047','M047'),('D048','Val','Cornewell','vcornewell1b@cloudflare.com','51743ddiqn',14,4,5,5,61929,'','S048','M048'),('D049','Norris','Garland','ngarland1c@gnu.org','57827gzend',16,3,8,5,45695,'','S049','M049'),('D050','Honor','Clemon','hclemon1d@furl.net','16596bciqo',13,4,3,6,48984,'','S050','M050'),('D051','Elle','Salatino','esalatino1e@earthlink.net','69724ayxlm',22,6,9,7,72186,'','S051','M051'),('D052','Rufus','Loftie','rloftie1f@miibeian.gov.cn','10556nqkte',12,3,8,1,79275,'','S052','M052'),('D053','Tallou','Gold','tgold1g@foxnews.com','65434opdfv',11,6,3,2,99937,'','S053','M053'),('D054','Shea','Idney','sidney1h@netscape.com','06514zngrd',14,9,3,2,54708,'','S054','M054'),('D055','Gael','Morlon','gmorlon1i@shutterfly.com','39005ewphe',10,7,2,1,64561,'uktdmsborljnetghhplvaptsicmfeontiiqxdoujhir','S055','M055'),('D056','Keary','Adriani','kadriani1j@barnesandnoble.com','60476ydwtt',15,8,1,6,75916,'ncpmbhlmwzjleiuqopupkfuibopnnugzdauewefqayj','S056','M056'),('D057','Sigvard','Boatwright','sboatwright1k@yelp.com','94528rhrck',7,1,6,0,54986,'wzvfgsiajwwkevzpfbomzmvboeezlvtryxmltmwsjje','S057','M057'),('D058','Perry','Barham','pbarham1l@forbes.com','42988weorz',13,5,3,5,21487,'sgibfxenzgjnpvlfjgagrgdzvottydavehtnsprctyg','S058','M058'),('D059','Arabelle','Briton','abriton1m@gov.uk','08198oturr',4,0,1,3,62194,'iwqnublnacumlbrtlkxeeacfnhjykifrzktyhbwuecb','S059','M059'),('D060','Lyle','Washtell','lwashtell1n@ustream.tv','54817seitu',22,7,8,7,84491,'hivwquymozdbhwjcllufeyteulpsncvgkxxlayufrxg','S060','M060'),('D061','Leonanie','Whitfield','lwhitfield1o@csmonitor.com','62201zkhfj',12,3,6,3,39894,'quwyflgnzpooaacueebwnoztornxzahufmpoljhkixv','S061','M061'),('D062','Robenia','Jakucewicz','rjakucewicz1p@va.gov','27738eavjb',12,3,0,9,67054,'jruemfidyntooeobmkmnghaeanumcmfvqqvmprtwjtu','S062','M062'),('D063','Fidole','Willoughby','fwilloughby1q@google.com.au','70236tirsf',17,3,9,5,57424,'','S063','M063'),('D064','Lemmy','Boardman','lboardman1r@nyu.edu','41011zqnlq',17,4,4,9,44910,'','S064','M064'),('D065','Krissy','Gaylard','kgaylard1s@wikipedia.org','61417feaff',10,3,1,6,91381,'','S065','M065'),('D066','Mathew','Marley','mmarley1t@twitter.com','87521oxhpd',15,5,1,9,10228,'','S066','M066'),('D067','Hurleigh','Erat','herat1u@cargocollective.com','08580uyfai',17,6,3,8,92260,'','S067','M067'),('D068','Edi','Masse','emasse1v@example.com','05609crujq',12,1,3,8,34979,'','S068','M068'),('D069','Jessie','Brass','jbrass1w@youku.com','90443qqcwi',18,7,6,5,13899,'','S069','M069'),('D070','Evita','Haining','ehaining1x@dell.com','51347zmvaq',10,5,1,4,4063,'','S070','M070'),('D071','Rickert','Sidary','rsidary1y@vimeo.com','66351ckrpw',10,8,2,0,99960,'','S071','M071'),('D072','Lindsay','Furlonge','lfurlonge1z@theguardian.com','04345kupun',17,9,0,8,5645,'eujfqfjnmzkepjfxkdslxlhaubprysmpapimbwgqzbj','S072','M072'),('D073','Ronnica','Couser','rcouser20@yelp.com','01060vamol',15,6,4,5,29224,'pgcrfcwppsfkymiyxvmsgzpnemwjgscfqfiakorgaxj','S073','M073'),('D074','Ring','Dovydenas','rdovydenas21@blog.com','86771wdtik',18,8,4,6,20126,'fbxgyxdjauqpoffhxctjaudybgyhamjklbixgvunjos','S074','M074'),('D075','Jarvis','Cathery','jcathery22@joomla.org','07170frogt',15,6,8,1,84076,'nqnjffkonamjkybvkxjjedfuulttpbamaxhxnzeeqxp','S075','M075'),('D076','Ward','Dewey','wdewey23@g.co','55312xplsv',15,8,1,6,78091,'qbhwddohrwpathuhtomlwtsbbopgrzagbvzimwhgebe','S076','M076'),('D077','Ranee','Clee','rclee24@auda.org.au','76848rxxzz',23,8,6,9,4798,'rcedpfitrlvmhejzokwknegpigkqfzfahuuuqmeybbo','S077','M077'),('D078','Alvis','Moston','amoston25@businesswire.com','33200plqyo',23,8,7,8,18427,'','S078','M078'),('D079','Joy','Astill','jastill26@marriott.com','94411gxkpg',14,9,4,1,22811,'yicaxkddzogsnktbkatlfunlhujectejjqqmzfyarrh','S079','M079'),('D080','Barry','Arnald','barnald27@newyorker.com','43249thqbm',19,7,8,4,2575,'ozzzesqhxayszjozcrxsicisgehoaruuuaaaarkqjii','S080','M080'),('D081','Dorene','Limbert','dlimbert28@hugedomains.com','68220lbtlo',14,7,6,1,84533,'lagujgwljklkyqgcjdkxevnghqahvuhgfcjeqbbclbg','S081','M081'),('D082','Francis','O\'Loinn','foloinn29@ehow.com','35494unuob',15,6,0,9,90784,'fjjqzlermlcrdxdghwciegitrdjdiqnqqpcvfzndjpa','S082','M082'),('D083','Ruperta','Prior','rprior2a@businesswire.com','15878chunu',6,0,6,0,46778,'','S083','M083'),('D084','Gratia','Neighbour','gneighbour2b@webnode.com','70814xsmmm',6,3,0,3,43292,'','S084','M084'),('D085','Sterne','Melmar','smelmar2c@nytimes.com','24918ppyiu',17,8,2,7,77567,'','S085','M085'),('D086','Vallie','Dommersen','vdommersen2d@mac.com','46107bcagk',10,9,0,1,94433,'mfknkohwlzzmvsfyqccpunuqdpkdglojctkywioyqoa','S086','M086'),('D087','Ethelred','Regnard','eregnard2e@timesonline.co.uk','14521cbuqe',12,5,5,2,28392,'cddzdhlfdttvjezwmyvjuuienaqlzzsljnuutpvncwc','S087','M087'),('D088','Jason','Seymer','jseymer2f@mysql.com','54887icmas',6,4,0,2,6966,'lmgwllsrmdkalwniukymstyxnuwpphpgnmixgjewuxt','S088','M088'),('D089','See','Heisler','sheisler2g@skype.com','04986ufnyk',13,6,6,1,54403,'','S089','M089'),('D090','Aggy','Oddy','aoddy2h@g.co','92495pnqii',9,7,0,2,69325,'','S090','M090'),('D091','Gilberte','Scrigmour','gscrigmour2i@yale.edu','89509vtmrb',10,1,9,0,93145,'ulizuokvkxpcjqwbqtnpfmbrnojnckvgjinkfhofvgl','S091','M091'),('D092','Collin','Ambrogio','cambrogio2j@sciencedirect.com','89903akryr',19,7,4,8,90786,'','S092','M092'),('D093','Raymund','Taffurelli','rtaffurelli2k@ycombinator.com','70779atyds',14,6,3,5,29956,'bzmrkbyldvsmeljsiypankopylaijnjiovtejybvwei','S093','M093'),('D094','Mersey','Huxtable','mhuxtable2l@reverbnation.com','71217oulpk',14,5,5,4,12396,'','S094','M094'),('D095','Cletis','Fellibrand','cfellibrand2m@dion.ne.jp','39755cvefr',10,1,5,4,20830,'pttywjpexyktytlyaaizgenwknakqfwsiwdzgvnbqpr','S095','M095'),('D096','Benny','Benion','bbenion2n@163.com','86660idqzj',19,8,2,9,98995,'','S096','M096'),('D097','Dionysus','Pailin','dpailin2o@wordpress.com','68148qinlk',19,7,9,3,66517,'bcjmolzigpuoygwbusdanzocumigtqjmdhgjfawabdp','S097','M097'),('D098','Ervin','Berlin','eberlin2p@hao123.com','22297itosq',3,0,2,1,21608,'','S098','M098'),('D099','Fraze','Pring','fpring2q@wikispaces.com','15895qmvdg',17,8,5,4,45798,'dtfdxywlwrkqqmfswtjvmclffvekveullqcbsbxtjik','S099','M099'),('D100','Johanna','Calven','jcalven2r@bing.com','59748ppnrk',23,6,8,9,28460,'hgqbsfvqhbrchxsyjcxqusonoxczwubctdhdfqffnum','S100','M100'),('D101','yut','rurur','dvbf@bing.com','34567ertyu',20,5,7,8,5678,'rughjndglkawhl','S090','M080');
/*!40000 ALTER TABLE `delivery_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `Manufacturer_ID` varchar(20) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone_No` varchar(11) NOT NULL,
  `Product_category` varchar(10) NOT NULL,
  `Number_of_products` int NOT NULL,
  `Manager_ID` varchar(20) DEFAULT NULL,
  `Delivery_Partner_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Manufacturer_ID`),
  UNIQUE KEY `Manufacturer_ID_UNIQUE` (`Manufacturer_ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `Manager_ID_idx` (`Manager_ID`),
  KEY `Delivery_Partner_ID_idx` (`Delivery_Partner_ID`),
  CONSTRAINT `Delivery_Partner_ID` FOREIGN KEY (`Delivery_Partner_ID`) REFERENCES `delivery_partner` (`Delivery_Partner_ID`),
  CONSTRAINT `Manager_ID1` FOREIGN KEY (`Manager_ID`) REFERENCES `sales_manager` (`Sales_manager_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES ('M001','Flatley-Davis','Suite 43','hpestricke0@bluehost.com','73943qydzr','C001',80,'S001','D001'),('M002','Treutel-Nienow','Apt 1720','manyene1@pinterest.com','52407ojwkw','C001',88,'S002','D002'),('M003','Stamm-Ryan','Suite 14','eferriday2@businesswire.com','90470wdvgb','C001',47,'S003','D003'),('M004','Wisoky-Hansen','Room 1123','joscroft3@wordpress.org','01241pelkb','C001',81,'S004','D004'),('M005','Bode, Spinka and Schmeler','Suite 10','weglinton4@dot.gov','26000xgjfj','C001',85,'S005','D005'),('M006','Heller, McDermott and Schoen','Room 1259','bplet5@unblog.fr','50350mbtrr','C001',58,'S006','D006'),('M007','Tromp LLC','Apt 1369','hpaolillo6@netlog.com','54460zyzjg','C001',36,'S007','D007'),('M008','Brown-Ebert','Apt 1333','cbridell7@shinystat.com','70837bacdc','C001',29,'S008','D008'),('M009','McDermott-Becker','PO Box 73262','ahowson8@msu.edu','37817bfagb','C001',59,'S009','D009'),('M010','O\'Keefe-Kassulke','Apt 482','crickerd9@hatena.ne.jp','21915jmnmz','C001',36,'S010','D010'),('M011','Hirthe-Hamill','PO Box 3836','kaugiea@amazonaws.com','14329olzrj','C001',88,'S011','D011'),('M012','Dickinson-Schmeler','Room 564','gbritneyb@unesco.org','79019ebagl','C001',46,'S012','D012'),('M013','Jones LLC','16th Floor','agyngellc@lulu.com','29401gkety','C001',3,'S013','D013'),('M014','O\'Kon-Nienow','Suite 69','kingsd@vimeo.com','20799eyjze','C001',75,'S014','D014'),('M015','Simonis-Torp','Suite 51','jdangle@sun.com','96583anzju','C001',14,'S015','D015'),('M016','Kerluke, Collier and Runte','Suite 53','bklichf@google.com.hk','07666puyrs','C001',82,'S016','D016'),('M017','Koepp, Koepp and Feeney','Apt 1712','lcurnockg@sohu.com','97317szvdk','C001',63,'S017','D017'),('M018','Kohler-Kassulke','Suite 8','riacobuccih@drupal.org','23726xaaqh','C001',51,'S018','D018'),('M019','Murazik-Cassin','Room 1172','dopdenorthi@slashdot.org','73507vggth','C001',50,'S019','D019'),('M020','Kling LLC','PO Box 60135','pluttgertj@soundcloud.com','83164kfeuv','C001',18,'S020','D020'),('M021','McClure-O\'Connell','9th Floor','grawdallk@twitpic.com','32330mrsce','C002',13,'S021','D021'),('M022','Funk, Turcotte and Gibson','17th Floor','dcamisl@ucla.edu','66837sovij','C002',48,'S022','D022'),('M023','Buckridge LLC','Suite 34','dglazyerm@gmpg.org','50328dzsht','C002',45,'S023','D023'),('M024','Schuster and Sons','Apt 315','echristoforoun@shinystat.com','71935tydmf','C002',58,'S024','D024'),('M025','Fay-Runolfsson','15th Floor','henrricoo@shutterfly.com','22163jwkxi','C002',88,'S025','D025'),('M026','Adams Group','Room 646','dguillemp@pen.io','03750qriyo','C002',49,'S026','D026'),('M027','Gusikowski-Green','PO Box 64187','kdenisevichq@noaa.gov','83990rdqjc','C002',23,'S027','D027'),('M028','Feil and Sons','Room 43','cmugglestoner@xinhuanet.com','28704jooni','C002',43,'S028','D028'),('M029','Pacocha, Schulist and Mertz','Suite 78','ehuggins@blogger.com','11222rlbvj','C002',33,'S029','D029'),('M030','Jast-DuBuque','Apt 1712','ckerryt@mapy.cz','14619cwyel','C002',52,'S030','D030'),('M031','Green-Barton','13th Floor','ajonczyku@hp.com','06942igkgi','C002',0,'S031','D031'),('M032','Kuvalis-Emmerich','PO Box 8979','jcunniffev@plala.or.jp','36627pawng','C002',43,'S032','D032'),('M033','Crona LLC','13th Floor','ubagenalw@webeden.co.uk','90980ipayx','C002',33,'S033','D033'),('M034','Kulas-Runte','Apt 1342','afoucarx@symantec.com','44620gfiun','C002',30,'S034','D034'),('M035','Keebler, Roberts and Cummings','PO Box 98659','asperay@usnews.com','08492hquwf','C002',83,'S035','D035'),('M036','Nienow, Schinner and Lakin','Apt 616','whardmanz@people.com.cn','67924zvqxe','C002',81,'S036','D036'),('M037','Muller LLC','PO Box 67985','blindman10@digg.com','85542imtcv','C002',22,'S037','D037'),('M038','Bahringer, Champlin and Schroeder','PO Box 48685','aclint11@netlog.com','58966tptop','C002',17,'S038','D038'),('M039','Jaskolski, Reilly and Upton','Apt 638','ccallaby12@usnews.com','26687mfwww','C002',63,'S039','D039'),('M040','Fay-Predovic','Suite 70','cnormant13@merriam-webster.com','60828jpxmo','C002',83,'S040','D040'),('M041','Kling-Towne','Apt 1114','mraff14@sphinn.com','29445lgjwf','C003',73,'S041','D041'),('M042','Langworth, Cartwright and Dietrich','4th Floor','jrenney15@berkeley.edu','53871sriur','C003',22,'S042','D042'),('M043','Stanton, Mraz and Goyette','7th Floor','challows16@domainmarket.com','17248rxwhn','C003',90,'S043','D043'),('M044','Sanford, Nader and Stokes','PO Box 5418','tdanielovitch17@opera.com','70364chktn','C003',60,'S044','D044'),('M045','Lehner and Sons','Apt 1337','lwallsam18@shinystat.com','88252gbrwa','C003',98,'S045','D045'),('M046','Crist-Spencer','Apt 642','gwoodroofe19@discuz.net','46809vvozr','C003',2,'S046','D046'),('M047','Walker, Stiedemann and Heidenreich','Room 1328','thallibone1a@digg.com','97924pwqlt','C003',63,'S047','D047'),('M048','Kuhic, Feeney and Shanahan','PO Box 50452','cangeau1b@apache.org','05705ccfdh','C003',15,'S048','D048'),('M049','Douglas-Hyatt','Apt 1752','lolyfat1c@ucsd.edu','76799nclzq','C003',68,'S049','D049'),('M050','Kozey-Cummings','Room 1561','xrooksby1d@ca.gov','97567iyrtf','C003',31,'S050','D050'),('M051','Schultz-Gusikowski','PO Box 14958','afryers1e@globo.com','99343vzlae','C003',96,'S051','D051'),('M052','Hermiston-Stroman','Room 1109','klaurentin1f@google.co.uk','90983bjgzv','C003',78,'S052','D052'),('M053','McClure-Bechtelar','Room 1202','agosford1g@nyu.edu','36346lajvb','C003',88,'S053','D053'),('M054','Jerde and Sons','Room 1300','ichatters1h@barnesandnoble.com','96894rkwjm','C003',56,'S054','D054'),('M055','Luettgen, Pouros and Johnson','PO Box 75894','wmoyle1i@omniture.com','10531nzwwo','C003',78,'S055','D055'),('M056','Ullrich, Satterfield and Cruickshank','Apt 741','ltune1j@blogger.com','47084lnkib','C003',99,'S056','D056'),('M057','Lang-Kreiger','2nd Floor','bmcgray1k@livejournal.com','22194ufibp','C003',15,'S057','D057'),('M058','Moen-Mitchell','20th Floor','bembury1l@wikispaces.com','65825numju','C003',38,'S058','D058'),('M059','Satterfield-Ullrich','19th Floor','lloughton1m@theglobeandmail.com','41760uwvjq','C003',12,'S059','D059'),('M060','Wunsch-Wyman','PO Box 64585','mmacsween1n@soundcloud.com','12516qchnm','C003',96,'S060','D060'),('M061','Padberg LLC','Apt 1621','mheenan1o@1und1.de','12665wqnkp','C004',83,'S061','D061'),('M062','Hermann-Ratke','Apt 1176','msafe1p@baidu.com','81680tcopq','C004',12,'S062','D062'),('M063','Lindgren-Miller','Apt 807','awraith1q@jimdo.com','50381zqdwt','C004',21,'S063','D063'),('M064','Collins, Hettinger and Cartwright','Suite 64','icollen1r@ft.com','40761qqydf','C004',96,'S064','D064'),('M065','Zieme and Sons','9th Floor','ikett1s@ehow.com','73268medpg','C004',74,'S065','D065'),('M066','Kuhn and Sons','Suite 2','ewest1t@aol.com','75382rhbnp','C004',72,'S066','D066'),('M067','Schumm-Kiehn','Suite 39','alofts1u@myspace.com','09889ydkiy','C004',66,'S067','D067'),('M068','Bode-Wisoky','Suite 70','apelling1v@geocities.com','07627axnsj','C004',35,'S068','D068'),('M069','Grady-Moore','Suite 77','aschwier1w@networksolutions.com','85376ynssq','C004',77,'S069','D069'),('M070','Volkman Inc','Apt 1737','pemmison1x@opera.com','96713pyoct','C004',34,'S070','D070'),('M071','Yundt LLC','PO Box 56352','lzuppa1y@hostgator.com','35332afhzm','C004',26,'S071','D071'),('M072','Kassulke-Yost','Suite 58','tdupoy1z@oracle.com','92196eoghr','C004',4,'S072','D072'),('M073','Boyer Inc','PO Box 3649','aheffernon20@seesaa.net','28534xearh','C004',63,'S073','D073'),('M074','Kuhlman LLC','Suite 19','fgreve21@alibaba.com','37238lpado','C004',37,'S074','D074'),('M075','Bernhard Inc','Suite 16','awoodley22@biblegateway.com','16781honmg','C004',0,'S075','D075'),('M076','Conn-Halvorson','Room 807','dgitthouse23@furl.net','15592swjhj','C004',45,'S076','D076'),('M077','Considine-Bogan','Apt 1040','mminchell24@blogs.com','78838ccwwv','C004',52,'S077','D077'),('M078','O\'Keefe Inc','PO Box 74647','gmaccaig25@dell.com','53189hutcb','C004',48,'S078','D078'),('M079','Spencer-Dach','Suite 7','bcoltherd26@walmart.com','27988wvmxo','C004',40,'S079','D079'),('M080','Lockman, Nolan and Wintheiser','PO Box 29332','astotherfield27@nsw.gov.au','93459dijmi','C004',72,'S080','D080'),('M081','Labadie, Lang and Krajcik','Suite 73','morsman28@reddit.com','60314snbpa','C005',95,'S081','D081'),('M082','Koepp-Leffler','6th Floor','alaunchbury29@cyberchimps.com','04958lnkmo','C005',0,'S082','D082'),('M083','Gorczany-McClure','Suite 51','fenevold2a@hibu.com','97903ewkml','C005',98,'S083','D083'),('M084','Kling, Ankunding and Cremin','Apt 1674','wpaddemore2b@cpanel.net','00680wdqer','C005',63,'S084','D084'),('M085','Hammes, Ullrich and Reynolds','PO Box 13685','jgriffitt2c@boston.com','75323ktqpi','C005',94,'S085','D085'),('M086','Champlin, Weber and Bode','PO Box 423','skroon2d@wired.com','59466gystu','C005',53,'S086','D086'),('M087','Emard-Doyle','Room 1301','tboyen2e@blogspot.com','92124dkfjv','C005',36,'S087','D087'),('M088','McDermott Inc','Apt 761','iknowler2f@scribd.com','85960eibxc','C005',99,'S088','D088'),('M089','Klocko-Mitchell','PO Box 21610','anesbitt2g@123-reg.co.uk','45224qnovo','C005',47,'S089','D089'),('M090','Kreiger-Fritsch','Room 188','jspelling2h@home.pl','06971hoadl','C005',32,'S090','D090'),('M091','Raynor LLC','PO Box 29201','ccarpenter2i@va.gov','67909jprxb','C005',83,'S091','D091'),('M092','Welch, Ledner and Streich','Suite 67','edefreyne2j@ycombinator.com','93228zdcja','C005',4,'S092','D092'),('M093','Cummerata, Cormier and Jacobi','Apt 12','aebbers2k@ftc.gov','91819bquee','C005',64,'S093','D093'),('M094','Kovacek-Wisozk','Room 1589','asinson2l@aboutads.info','06693bzimq','C005',32,'S094','D094'),('M095','Witting LLC','Suite 4','zlowbridge2m@google.com.br','85622uwqcw','C005',17,'S095','D095'),('M096','Borer-Wilderman','Suite 18','atunnicliffe2n@wikispaces.com','77844pvtcp','C005',34,'S096','D096'),('M097','Powlowski and Sons','Apt 1896','aemerson2o@4shared.com','26952qcdvo','C005',99,'S097','D097'),('M098','Ferry Group','Suite 74','smahoney2p@google.com.hk','27156rpkqs','C005',39,'S098','D098'),('M099','Hoppe LLC','PO Box 36344','wcurrer2q@berkeley.edu','25905zxjtt','C005',20,'S099','D099'),('M100','Bernier-Medhurst','19th Floor','hkinnier2r@usnews.com','52891ietdl','C005',27,'S100','D100');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_ID` varchar(10) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Mode_of_payment` varchar(45) NOT NULL,
  `Discount` int DEFAULT NULL,
  `Amount` int DEFAULT '0',
  `Customer_ID` varchar(20) DEFAULT NULL,
  `Delivery_partner_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  UNIQUE KEY `order_ID_UNIQUE` (`order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('O001','Delivered','Suite 70','2023-04-24','22:49:40','COD',15,50867,'C001','D038');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` varchar(10) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Quantity` int NOT NULL,
  `Price` int NOT NULL,
  `Description` varchar(250) NOT NULL,
  `Category_name` varchar(45) NOT NULL,
  `Category_ID` varchar(10) NOT NULL,
  `Date_of_mfg` date NOT NULL,
  `Manufacturer` varchar(20) NOT NULL,
  PRIMARY KEY (`Product_ID`),
  UNIQUE KEY `Product_ID_UNIQUE` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('P002','Russian Thistle',77,5334,'qppqaahaztkpqdxpp','cat1','C001','2022-02-11','West Inc'),('P003','Helocarpon Lichen',39,1375,'qjhwhhkpeukwkhjhd','cat1','C001','2022-03-04','Kozey and Sons'),('P005','Mountain Aster',39,1681,'azkcrjrmpxauvewvl','cat1','C001','2022-07-24','Schuppe-Tillman'),('P006','Rufous Butterfly Orchid',67,322,'lmezldrglvtweuzfw','cat1','C001','2022-12-17','Littel-Jacobi'),('P007','Cockleshell Lichen',47,7826,'nwrqsvkhwahgnuhhs','cat1','C001','2022-05-20','Cassin LLC'),('P008','Arrowleaf Buckwheat',41,6861,'azzhgikqzqcrinjdf','cat1','C001','2022-02-15','Streich-Ryan'),('P009','Willowleaf Aster',20,4995,'cztljmgqvbyqdvbet','cat1','C001','2022-08-07','Kuhn Inc'),('P011','Desert Lupine',38,482,'mzlkwsscihyzekaox','cat1','C001','2022-02-28','Upton Group'),('P012','Black Mampoo',72,8381,'psvfzaeqzoiuqixjg','cat1','C001','2023-01-08','Ferry-Thiel'),('P013','Bristle Bent',98,1195,'zvhpizcezrgtollqx','cat1','C001','2022-11-14','Collier LLC'),('P014','White Sapote',1,4417,'yjcmbryhyslbuvywe','cat1','C001','2022-03-26','Mante and Sons'),('P015','Leechleaf Delissea',9,5509,'nzguovzqqrxwubohf','cat1','C001','2023-02-07','Bode-Krajcik'),('P017','Plains Rough Fescue',86,1922,'dffylimxxgufyoksz','cat1','C001','2022-08-08','Dibbert LLC'),('P018','Thread Lichen',26,4214,'wxtbnapvyigqeomlc','cat1','C001','2022-12-22','Breitenberg Group'),('P021','Mojave Indigobush',47,9695,'pxearfeurmedoaojh','cat2','C002','2022-09-06','Berge-Conn'),('P022','Kaluaaha Valley Peperomia',71,4859,'yabioojtaxihibgzd','cat2','C002','2022-03-22','Fahey-Boyle'),('P023','Bursera',42,210,'zykytqonqhtmkhqoj','cat2','C002','2022-06-29','Jacobi and Sons'),('P024','Grand Canyon Rockdaisy',10,5652,'clpzbljwhsgwklgmd','cat2','C002','2022-07-21','Towne-Conn'),('P025','Schimper\'s Campylopus Moss',29,2522,'qmhcmszbsfjahvuid','cat2','C002','2022-04-06','Lesch-Corwin'),('P026','Butterfly Milkweed',45,764,'yoqbvosbmqwasrilj','cat2','C002','2022-04-06','Bradtke Group'),('P027','Lawton\'s Racomitrium Moss',43,9736,'xnkaovzbhdmdcgrex','cat2','C002','2022-09-04','Dickens Inc'),('P033','Alpine Schadonia Lichen',52,6088,'rquuovpbxvoukzuvc','cat2','C002','2022-03-26','Carter-Shanahan'),('P034','Woodhouse\'s Phlox',11,1098,'abxejlasrxbxsahyw','cat2','C002','2022-09-10','Gusikowski-Kling'),('P035','Alpinegold',51,9855,'blhatfxspxxynpvtz','cat2','C002','2022-07-30','Douglas-Heller'),('P037','Hardy Fuchsia',19,3542,'xcnjfgppyexvjgvkd','cat2','C002','2023-01-03','Barton-Rowe'),('P038','Blessed Thistle',25,5420,'bycfktyilrsxcdkgp','cat2','C002','2022-07-25','Klein-Witting'),('P039','Water Dead And Awake',55,9238,'kdrgsrbjyibrqcssx','cat2','C002','2022-06-22','Yundt-Mitchell'),('P040','Varicellaria Lichen',66,8668,'mgqbrbynxbxqysdms','cat2','C002','2022-02-24','Jacobi-Casper'),('P042','Black Pepper',50,2177,'nnituyjlgnrpfwafu','cat3','C003','2022-10-05','Russel-Koepp'),('P044','Seapurslane',72,84,'gqxoxyzhjdkiujavt','cat3','C003','2022-06-03','McDermott-Cassin'),('P045','Mourning Buckwheat',8,8496,'xoizbzoiyajfefyql','cat3','C003','2022-11-06','Schimmel-Walsh'),('P046','Elkhorn Fern',47,2734,'adtprvtprwepkzntz','cat3','C003','2022-05-08','Senger Group'),('P047','Yellow Screwstem',40,1752,'ejzeqavmthtyzvbfv','cat3','C003','2022-04-27','Sanford-Senger'),('P048','American Nailwort',24,1372,'ipgpzayhobobnbrcb','cat3','C003','2022-04-06','Lebsack-Adams'),('P049','Tejon Cryptantha',21,6209,'pxqhzgakauhytyzyt','cat3','C003','2022-06-15','Russel-Ledner'),('P050','Alaskan Douglasia',85,1343,'ymsesgwprkqmnckmy','cat3','C003','2022-12-12','Glover-Pouros'),('P052','Royal Fern',2,1194,'trjccvlgxfzoqelfa','cat3','C003','2022-06-26','Schiller Inc'),('P054','Navel Lichen',54,656,'dbxwvjgvhlykunfqt','cat3','C003','2022-11-16','Ratke LLC'),('P056','Ethiopian Rattlebox',58,9340,'ndtgomadnqjkuifms','cat3','C003','2023-02-01','Hayes LLC'),('P057','Cryphaea Moss',46,8629,'ptkcrgqfejspsbivk','cat3','C003','2022-03-03','Flatley Group'),('P060','Tarweed',22,5652,'cvwwnqpzzczvpcbxx','cat3','C003','2022-11-25','Lebsack-Pagac'),('P061','Showy Gilia',43,9217,'eymwihcjgqxyhxami','cat4','C004','2022-12-20','Bailey-Langworth'),('P062','Eastern Sweetshrub',22,99,'ydpdzcpmzrjgjvwsm','cat4','C004','2022-09-27','Kuvalis-Oberbrunner'),('P064','Mat Sandbur',73,6663,'hixygnqdrvjfszffz','cat4','C004','2022-10-28','Leffler-Schuster'),('P066','Hanging Sedge',6,2240,'vgojyazvdfykchqoo','cat4','C004','2022-07-01','Rau Group'),('P068','Securidaca',95,4291,'dizyobtdawjqidlyu','cat4','C004','2022-05-12','Buckridge-Collins'),('P070','Preuss\' Dioscorea',20,9766,'akgpzuqxjktpkqbwk','cat4','C004','2022-07-16','Schimmel Inc'),('P071','California Compassplant',9,8866,'fhdvizjlyigzrbuhs','cat4','C004','2022-03-16','Boehm-Herzog'),('P072','Broadleaf Gilia',21,4617,'mvxhqklfikkozcisf','cat4','C004','2022-05-07','Schneider-Zemlak'),('P074','Island Broom',20,281,'qglnpntmhmvecekqw','cat4','C004','2022-07-31','Langosh Inc'),('P075','Southern Rockbell',98,3748,'yaskuzeityssopxiz','cat4','C004','2022-06-02','Stamm and Sons'),('P077','Widowsfrill',72,365,'xcxmwgpubtfeibqow','cat4','C004','2022-04-24','Wisozk LLC'),('P078','Scaldweed',34,568,'mizhnuhbxyhbcqivy','cat4','C004','2022-10-25','Altenwerth LLC'),('P080','New Holland Rattlepod',43,6870,'ndirngzsitaacmkdl','cat4','C004','2022-11-28','Connelly-Kunze'),('P082','Looseflower Bluegrass',56,9037,'whjiufeexevurooaa','cat5','C005','2022-05-08','Corwin-Tillman'),('P083','Bearded Jewelflower',34,290,'yxmhimndfxlcbysnr','cat5','C005','2022-08-21','Parker Group'),('P084','Payson\'s Tansymustard',44,1613,'jmwvdhcarxzowzozj','cat5','C005','2022-09-27','Frami-Hartmann'),('P085','Goatnut',88,7079,'kjcbanisxqpzuqhko','cat5','C005','2022-02-21','Waelchi LLC'),('P086','Southern Mountain Buckwheat',54,7326,'zkkoywhqvlgrjrjjn','cat5','C005','2023-01-05','Rutherford-Kuhn'),('P087','Packard\'s Blazingstar',80,1505,'icffzhptkhqcvzajq','cat5','C005','2022-08-17','Brekke Group'),('P091','Savannah Beaksedge',9,9288,'znphdewnuozcmvmrn','cat5','C005','2022-03-04','Schmeler and Sons'),('P093','Blue Maidencane',53,7356,'tbxnvjmprrcldohhr','cat5','C005','2022-05-17','Trantow-Swift'),('P094','Gray Vervain',18,3099,'wcfwaqjhhomlzbabf','cat5','C005','2022-09-15','Grimes and Sons'),('P097','Drummond\'s Snakecotton',65,9015,'wvsjzbqxmcwsjiudv','cat5','C005','2022-06-06','Gibson and Sons'),('P099','Bushsunflower',26,8684,'wzgnxvxusbghbjurs','cat5','C005','2022-08-12','Batz LLC'),('P100','Goldenrod',7,6953,'maghhbmpwsbtzzcbc','cat5','C005','2022-06-17','Kuphal-Kertzmann'),('P101','ytytytytytytytty',2,3456,'2ewoinepb kmfd','cat1','C001','2023-01-02','Flatley-Davis'),('P102','tyuyti',23,5677,'ef','cat1','C001','2023-01-02','Flatley-Davis');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_manager`
--

DROP TABLE IF EXISTS `sales_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_manager` (
  `Sales_manager_ID` varchar(10) NOT NULL,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Mobile_No` varchar(11) NOT NULL,
  `Sales_R_No.` int NOT NULL,
  `No_of_manufacturers` int NOT NULL,
  `Payments` int NOT NULL,
  `Admin_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Sales_manager_ID`),
  UNIQUE KEY `Sales_manager_ID_UNIQUE` (`Sales_manager_ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `Admin_ID_idx` (`Admin_ID`),
  CONSTRAINT `Admin_ID` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_manager`
--

LOCK TABLES `sales_manager` WRITE;
/*!40000 ALTER TABLE `sales_manager` DISABLE KEYS */;
INSERT INTO `sales_manager` VALUES ('S001','Boy','McNaughton','bmcnaughton0@princeton.edu','58811omqum',95,4,5918,'A001'),('S002','Dill','Mealand','dmealand1@angelfire.com','17924whftj',485,1,9665,'A001'),('S003','Carline','Rope','crope2@sourceforge.net','51324suvjx',909,2,4891,'A001'),('S004','Philippine','Valenta','pvalenta3@nbcnews.com','52847chpxs',297,1,782,'A001'),('S005','Zachery','Huitson','zhuitson4@cargocollective.com','26651qqzyw',91,3,2403,'A001'),('S006','Brock','Linzey','blinzey5@arizona.edu','14502tbbiz',350,1,9933,'A001'),('S007','Edin','Holhouse','eholhouse6@admin.ch','21202cbotk',11,4,9091,'A001'),('S008','Kaile','Mc Cahey','kmccahey7@about.com','99550voxbk',249,5,7742,'A001'),('S009','Tedmund','Gascoyen','tgascoyen8@newsvine.com','18236yjzdn',925,5,2521,'A001'),('S010','Winthrop','Downe','wdowne9@hhs.gov','55839wnkri',25,3,8971,'A001'),('S011','Susy','Tomkiss','stomkissa@sakura.ne.jp','41460wctxx',701,5,7241,'A001'),('S012','Damon','Morrallee','dmorralleeb@over-blog.com','50051hhuoj',595,8,7793,'A001'),('S013','Adella','Egdal','aegdalc@adobe.com','41262bzgzi',319,9,5597,'A001'),('S014','Annalise','Swett','aswettd@uiuc.edu','48470vnusz',608,9,2787,'A001'),('S015','Lance','Minette','lminettee@ocn.ne.jp','11957klset',530,4,1413,'A001'),('S016','Timotheus','Mortel','tmortelf@last.fm','14293qrndo',552,7,9984,'A001'),('S017','Chalmers','Leadbitter','cleadbitterg@ft.com','84287jsdwb',834,7,6130,'A001'),('S018','Haley','Cullnean','hcullneanh@seattletimes.com','66184rdrvq',709,7,3582,'A001'),('S019','Christoforo','Summerton','csummertoni@twitter.com','58761kmgwa',220,9,5139,'A001'),('S020','Katherine','Wayman','kwaymanj@google.co.uk','12702obpuw',567,3,2023,'A001'),('S021','Terrye','Timlin','ttimlink@cbsnews.com','40357qqpxb',326,5,4659,'A001'),('S022','Kata','Josuweit','kjosuweitl@geocities.jp','26728zzoaw',276,5,5170,'A001'),('S023','Conney','Sammonds','csammondsm@washington.edu','91330vnsle',104,8,8519,'A001'),('S024','Jo-ann','Francescotti','jfrancescottin@tiny.cc','07500sjevm',288,5,8806,'A001'),('S025','Lanie','Borsnall','lborsnallo@technorati.com','94206qwzou',903,9,7494,'A001'),('S026','Riannon','Kneafsey','rkneafseyp@ucoz.com','03299zxyzk',58,6,9666,'A001'),('S027','Humberto','Toppas','htoppasq@arstechnica.com','34845zqhaz',349,3,8815,'A001'),('S028','Owen','Tribbeck','otribbeckr@tumblr.com','08201jdyng',250,9,4950,'A001'),('S029','Brandea','Heineking','bheinekings@wordpress.org','92591aniao',661,0,375,'A001'),('S030','Eldon','Gerrens','egerrenst@ted.com','05859ntpxi',829,5,788,'A001'),('S031','Katharina','Hugli','khugliu@cbsnews.com','41517znokd',542,8,7689,'A001'),('S032','Finlay','Harniman','fharnimanv@psu.edu','18897oukbl',697,1,3400,'A001'),('S033','Bernette','Wiskar','bwiskarw@sciencedirect.com','43104lobns',71,5,5592,'A001'),('S034','Elyn','Gadd','egaddx@blinklist.com','92846eqmws',583,2,6819,'A001'),('S035','Gerardo','Balcombe','gbalcombey@earthlink.net','58468ornxr',394,1,1084,'A001'),('S036','Grete','Blincko','gblinckoz@instagram.com','87516kwwgf',730,4,826,'A001'),('S037','Hugh','Cotillard','hcotillard10@pen.io','20275ixvat',857,4,7224,'A001'),('S038','Dael','Heald','dheald11@squidoo.com','37638zzfxa',655,1,691,'A001'),('S039','Rabi','Blankau','rblankau12@4shared.com','53166trylr',768,1,6804,'A001'),('S040','Karly','Rany','krany13@patch.com','74744lojhy',402,2,5901,'A001'),('S041','Goldi','Scottrell','gscottrell14@cafepress.com','80275pxlzt',68,7,8200,'A001'),('S042','Garvin','Bizzey','gbizzey15@gnu.org','79668rtnir',375,2,8300,'A001'),('S043','Brinna','Molyneux','bmolyneux16@unesco.org','82588zlknb',582,8,8859,'A001'),('S044','Olav','Sket','osket17@zdnet.com','90730dcapz',664,4,2366,'A001'),('S045','Ramonda','Crank','rcrank18@1und1.de','42556vrcau',715,2,2960,'A001'),('S046','Ryan','Kinlock','rkinlock19@google.com.au','27125aexdt',851,7,1816,'A001'),('S047','Brunhilde','Bramford','bbramford1a@usnews.com','00480jhmep',859,3,4626,'A001'),('S048','Ilyssa','Langridge','ilangridge1b@youtu.be','14060sebam',105,5,1755,'A001'),('S049','Anabal','Halloway','ahalloway1c@eepurl.com','57272pgtxr',485,3,3232,'A001'),('S050','Nikolaus','Stanmore','nstanmore1d@toplist.cz','68594dhvjh',801,4,3627,'A002'),('S051','Vanna','Toping','vtoping1e@issuu.com','13317onaxc',550,7,5400,'A002'),('S052','Hebert','Starmont','hstarmont1f@ezinearticles.com','91974tzzvf',839,2,4005,'A002'),('S053','Robbie','Michie','rmichie1g@surveymonkey.com','85449fovcf',984,5,2905,'A002'),('S054','Sam','Lanham','slanham1h@fotki.com','25657mhlrw',280,1,2759,'A002'),('S055','Christine','Weeds','cweeds1i@mail.ru','37309phpfk',209,0,2809,'A002'),('S056','Marten','Sturzaker','msturzaker1j@google.com.au','94951zxbqx',75,1,5114,'A002'),('S057','Fina','Dabernott','fdabernott1k@illinois.edu','80280alugs',703,0,4747,'A002'),('S058','Andeee','Moralis','amoralis1l@pbs.org','20478ratoc',566,2,3001,'A002'),('S059','Jessica','MacAlroy','jmacalroy1m@cnet.com','62987tdqhv',337,5,1758,'A002'),('S060','Delila','Lengthorn','dlengthorn1n@ucoz.com','24768udnzv',496,0,430,'A002'),('S061','Imogen','Wabb','iwabb1o@soundcloud.com','87045ahbwz',228,0,7139,'A002'),('S062','Oren','Stenhouse','ostenhouse1p@etsy.com','64371blohj',847,3,8254,'A002'),('S063','Leoine','Jozsef','ljozsef1q@nydailynews.com','75313rjdgo',808,6,9562,'A002'),('S064','Darelle','Lowensohn','dlowensohn1r@privacy.gov.au','46400qeotj',815,0,5299,'A002'),('S065','Gay','Wakefield','gwakefield1s@bbc.co.uk','36506uhwdu',878,1,4629,'A002'),('S066','Edward','Cowe','ecowe1t@photobucket.com','42266dipaz',220,8,1907,'A002'),('S067','Emmalyn','McGeever','emcgeever1u@cargocollective.com','94092ymgfg',867,6,4016,'A002'),('S068','Fanni','Umpleby','fumpleby1v@nationalgeographic.com','91740wafis',786,2,329,'A002'),('S069','Forester','Winspare','fwinspare1w@symantec.com','00136aykqy',978,1,7886,'A002'),('S070','Otis','Peacop','opeacop1x@sfgate.com','34042gjjgi',999,1,4303,'A002'),('S071','Brett','Maylam','bmaylam1y@ebay.com','88395wqios',477,1,747,'A002'),('S072','Darrel','Forton','dforton1z@wp.com','52060paubb',232,3,5090,'A002'),('S073','Ofelia','Berriman','oberriman20@bloomberg.com','66083lsnhe',569,2,663,'A002'),('S074','Cthrine','Cockaday','ccockaday21@reddit.com','07444geogu',943,9,9289,'A002'),('S075','Pate','Bunclark','pbunclark22@technorati.com','73160hlfmc',134,4,546,'A002'),('S076','Meredithe','Barrabeale','mbarrabeale23@example.com','49234cghsd',658,1,6875,'A002'),('S077','Nikita','Dallison','ndallison24@mysql.com','93103kumbg',929,9,4775,'A002'),('S078','Nicky','Norwell','nnorwell25@gov.uk','79441qigdi',997,6,8476,'A002'),('S079','Davey','Battleson','dbattleson26@examiner.com','10089tdkli',189,6,2186,'A002'),('S080','Bo','Symcock','bsymcock27@over-blog.com','33219lpgal',668,2,9103,'A002'),('S081','Jude','Skelcher','jskelcher28@is.gd','51998bxjrb',899,8,7132,'A002'),('S082','Dayna','Mulvy','dmulvy29@barnesandnoble.com','79143powio',395,6,1080,'A002'),('S083','Saundra','Breinlein','sbreinlein2a@indiatimes.com','77793vkzcv',167,7,7230,'A002'),('S084','Milicent','Lightwing','mlightwing2b@jimdo.com','06581muwra',756,3,5542,'A002'),('S085','Agnola','Malpas','amalpas2c@newyorker.com','04075utixz',765,9,920,'A002'),('S086','Gerard','Enns','genns2d@intel.com','49881zvwoh',418,9,3917,'A002'),('S087','Webb','Redholes','wredholes2e@wikipedia.org','15819nxciz',503,0,6919,'A002'),('S088','Simmonds','Raisbeck','sraisbeck2f@biglobe.ne.jp','63127hqznr',962,1,573,'A002'),('S089','Merrily','Hempshall','mhempshall2g@mysql.com','13845wpijt',3,4,9803,'A002'),('S090','Heall','Sloegrave','hsloegrave2h@feedburner.com','62249zhdxk',279,3,9959,'A002'),('S091','Rancell','Savidge','rsavidge2i@fc2.com','31893aivyo',303,1,3567,'A002'),('S092','Raychel','Szwandt','rszwandt2j@twitter.com','85939vlgox',837,1,9084,'A002'),('S093','Norri','Orridge','norridge2k@istockphoto.com','51794gpcgf',165,3,4109,'A002'),('S094','Brinna','Giriardelli','bgiriardelli2l@com.com','29603gabks',800,5,4272,'A002'),('S095','Christabel','Asplen','casplen2m@mediafire.com','11899qvzht',279,2,5761,'A002'),('S096','Shane','Limbourne','slimbourne2n@clickbank.net','41760uwtoa',51,9,6941,'A002'),('S097','Giffie','Lound','glound2o@prnewswire.com','72819tmtjj',107,2,706,'A002'),('S098','Howie','Eagling','heagling2p@youtube.com','29663nmimu',715,9,3586,'A002'),('S099','Edd','Ricciardelli','ericciardelli2q@dyndns.org','52049ibrva',93,1,209,'A002'),('S100','Bucky','Bilsford','bbilsford2r@mysql.com','95258sumyl',152,5,9646,'A002'),('S101','qwerty','asdf','vuewbsbkvdknc@gmail.com','12345tyuio',0,0,0,'A001'),('S102','er','w','dfg','advegrehj',0,0,0,'A001');
/*!40000 ALTER TABLE `sales_manager` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-09  1:28:00
