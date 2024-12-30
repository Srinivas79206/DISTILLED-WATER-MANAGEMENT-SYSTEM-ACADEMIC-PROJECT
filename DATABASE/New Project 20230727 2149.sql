-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema distilled
--

CREATE DATABASE IF NOT EXISTS distilled;
USE distilled;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `ip_log` varchar(45) NOT NULL default '',
  `pass` varchar(45) NOT NULL default '',
  `time` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `containers`
--

DROP TABLE IF EXISTS `containers`;
CREATE TABLE `containers` (
  `cs_id` int(10) unsigned NOT NULL auto_increment,
  `weight` varchar(45) NOT NULL default '',
  `expiry_date` varchar(45) NOT NULL default '',
  `mfd` varchar(45) NOT NULL default '',
  `price` varchar(45) NOT NULL default '',
  `statuss` varchar(45) NOT NULL default '',
  `p_image` longblob NOT NULL,
  PRIMARY KEY  (`cs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `containers`
--

/*!40000 ALTER TABLE `containers` DISABLE KEYS */;
/*!40000 ALTER TABLE `containers` ENABLE KEYS */;


--
-- Definition of table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` varchar(45) NOT NULL default '',
  `transporter` varchar(45) NOT NULL default '',
  `des` varchar(45) NOT NULL default '',
  `oid` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(10) unsigned NOT NULL auto_increment,
  `containers` varchar(45) NOT NULL default '',
  `delivery_time` varchar(45) NOT NULL default '',
  `delivery_place` longtext NOT NULL,
  `transporter_id` varchar(45) NOT NULL default '',
  `statuss` varchar(45) NOT NULL default '',
  `price` varchar(45) NOT NULL default '',
  `user_id` varchar(45) NOT NULL default '',
  `time` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `quality_tester`
--

DROP TABLE IF EXISTS `quality_tester`;
CREATE TABLE `quality_tester` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `approvals` varchar(45) NOT NULL default '',
  `dis_approvals` varchar(45) NOT NULL default '',
  `cs_id` varchar(45) NOT NULL default '',
  `time` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quality_tester`
--

/*!40000 ALTER TABLE `quality_tester` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_tester` ENABLE KEYS */;


--
-- Definition of table `transporter`
--

DROP TABLE IF EXISTS `transporter`;
CREATE TABLE `transporter` (
  `transporter_id` int(10) unsigned NOT NULL,
  `delivery_place` varchar(45) NOT NULL default '',
  `starting_time` varchar(45) NOT NULL default '',
  `reaching_time` varchar(45) NOT NULL default '',
  `vehicle_id` varchar(45) NOT NULL default '',
  `order_id` varchar(45) NOT NULL default '',
  `statuss` varchar(45) NOT NULL default '',
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transporter`
--

/*!40000 ALTER TABLE `transporter` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter` ENABLE KEYS */;


--
-- Definition of table `transporters`
--

DROP TABLE IF EXISTS `transporters`;
CREATE TABLE `transporters` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `pass` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transporters`
--

/*!40000 ALTER TABLE `transporters` DISABLE KEYS */;
INSERT INTO `transporters` (`id`,`name`,`pass`) VALUES 
 (1,'T1','456456'),
 (2,'T2','789789'),
 (3,'T3','963963');
/*!40000 ALTER TABLE `transporters` ENABLE KEYS */;


--
-- Definition of table `user_reg`
--

DROP TABLE IF EXISTS `user_reg`;
CREATE TABLE `user_reg` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Username` varchar(45) NOT NULL default '',
  `Qualification` longtext NOT NULL,
  `Number` varchar(45) NOT NULL default '',
  `Email` varchar(45) NOT NULL default '',
  `user_type` varchar(45) NOT NULL default '',
  `Address` longtext NOT NULL,
  `pass` varchar(45) NOT NULL default '',
  `rpass` varchar(45) NOT NULL default '',
  `statuss` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_reg`
--

/*!40000 ALTER TABLE `user_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reg` ENABLE KEYS */;


--
-- Definition of table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `size` varchar(45) NOT NULL default '',
  `tname` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
