-- --------------------------------------------------------
-- Host:                         192.168.100.1
-- Server version:               5.7.21-0ubuntu0.16.04.1-log - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for his_connect
DROP DATABASE IF EXISTS `his_connect`;
CREATE DATABASE IF NOT EXISTS `his_connect` /*!40100 DEFAULT CHARACTER SET tis620 */;
USE `his_connect`;


-- Dumping structure for view his_connect.allergy
DROP VIEW IF EXISTS `allergy`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `allergy` (
	`hn` VARCHAR(15) NOT NULL COLLATE 'tis620_thai_ci',
	`drug_name` VARCHAR(250) NULL COMMENT 'ชื่อยาที่แพ้' COLLATE 'tis620_thai_ci',
	`symptom` TEXT NULL COMMENT 'หมายเหตุ' COLLATE 'tis620_thai_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.appointment
DROP VIEW IF EXISTS `appointment`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `appointment` (
	`hn` VARCHAR(15) NOT NULL COLLATE 'tis620_thai_ci',
	`seq` CHAR(0) NOT NULL COLLATE 'utf8mb4_general_ci',
	`date_serve` DATE NOT NULL COMMENT 'วันที่ลงทะเบียน',
	`time_serve` BINARY(0) NULL,
	`date` DATE NOT NULL COMMENT 'วันที่นัดมา',
	`time` VARCHAR(5) NULL COLLATE 'tis620_thai_ci',
	`department` VARCHAR(40) NULL COLLATE 'tis620_thai_ci',
	`detail` VARCHAR(254) NULL COMMENT 'นัดมาเพื่อ' COLLATE 'tis620_thai_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.bedno
DROP VIEW IF EXISTS `bedno`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `bedno` (
	`bedno` VARCHAR(5) NULL COLLATE 'tis620_thai_ci',
	`bedtype` INT(6) NULL,
	`bedtype_name` VARCHAR(40) NULL COLLATE 'tis620_thai_ci',
	`roomno` CHAR(0) NOT NULL COLLATE 'utf8mb4_general_ci',
	`wardcode` VARCHAR(6) NULL COLLATE 'tis620_thai_ci',
	`wardname` VARCHAR(40) NULL COLLATE 'tis620_thai_ci',
	`std_code` INT(6) NULL,
	`isactive` INT(1) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.chronic
DROP VIEW IF EXISTS `chronic`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `chronic` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`icd_code` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`icd_name` VARCHAR(255) NULL COLLATE 'tis620_thai_ci',
	`start_date` DATE NULL,
	`time_serve` VARCHAR(8) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for table his_connect.clinic_hdc
DROP TABLE IF EXISTS `clinic_hdc`;
CREATE TABLE IF NOT EXISTS `clinic_hdc` (
  `cliniccode` char(2) NOT NULL,
  `clinicname` varchar(120) NOT NULL,
  `IP` char(50) DEFAULT '1',
  `OP` char(50) DEFAULT '0',
  PRIMARY KEY (`cliniccode`),
  KEY `IP` (`IP`),
  KEY `OP` (`OP`),
  KEY `cliniccode` (`cliniccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table his_connect.clinic_hdc: ~27 rows (approximately)
/*!40000 ALTER TABLE `clinic_hdc` DISABLE KEYS */;
INSERT IGNORE INTO `clinic_hdc` (`cliniccode`, `clinicname`, `IP`, `OP`) VALUES
	('01', 'อายุรกรรม', '10100', '00100'),
	('02', 'ศัลยกรรม', '10200', '00200'),
	('03', 'สูติกรรม', '10300', '00300'),
	('04', 'นรีเวชกรรม', '10400', '00400'),
	('05', 'กุมารเวชกรรม', '10500', '00500'),
	('06', 'โสต ศอ นาสิก', '10600', '00600'),
	('07', 'รังสีวิทยา', '10700', '00700'),
	('08', 'ศัลยกรรมออร์โธปิดิกส์', '10800', '00800'),
	('09', 'จิตเวช', '10900', '00900'),
	('10', 'รังสีรักษา', '11000', '01000'),
	('11', 'ทันตกรรม', '11100', '01100'),
	('12', 'เวชศาสตร์ฉุกเฉินและนิติเวช', '11200', '01200'),
	('13', 'เวชกรรมฟื้นฟู', '11300', '01300'),
	('14', 'แพทย์แผนไทย', '11400', '01400'),
	('15', 'PCU / แผนกส่งเสริมสุขภาพ', '11500', '01500'),
	('16', 'เวชกรรมปฏิบัติทั่วไป', '11600', '01600'),
	('17', 'เวชศาสตร์ครอบครัวและชุมชน', '11700', '01700'),
	('18', 'อาชีวเวชศาสตร์', '11800', '01800'),
	('19', 'วิสัญญีวิทยา', '11900', '01900'),
	('20', 'ศัลยกรรมประสาท', '12000', '02000'),
	('21', 'อาชีวอนามัย', '12100', '02100'),
	('22', 'เวชกรรมพิจารณา', '12200', '02200'),
	('23', 'พยาธิวิทยากายวิภาค', '12300', '02300'),
	('24', 'พยาธิวิทยาคลินิก', '12400', '02400'),
	('25', 'แพทย์ทางเลือก', '12500', '02500'),
	('26', 'ตจวิทยาคลินิก (ผิวหนัง)', '12600', '02600'),
	('99', 'อื่นๆ', '19900', '09900');
/*!40000 ALTER TABLE `clinic_hdc` ENABLE KEYS */;


-- Dumping structure for view his_connect.concurrentipdbyclinic
DROP VIEW IF EXISTS `concurrentipdbyclinic`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `concurrentipdbyclinic` (
	`hospcode` VARCHAR(5) NULL COLLATE 'tis620_thai_ci',
	`date` DATETIME NOT NULL,
	`cliniccode` VARCHAR(2) NULL COLLATE 'utf8mb4_general_ci',
	`clinicname` VARCHAR(120) NULL COLLATE 'utf8mb4_general_ci',
	`cases` DECIMAL(23,0) NULL,
	`new_case` DECIMAL(23,0) NULL,
	`discharge` DECIMAL(23,0) NULL,
	`death` DECIMAL(23,0) NULL,
	`icu` DECIMAL(23,0) NULL,
	`semi` DECIMAL(23,0) NULL,
	`homeward` DECIMAL(23,0) NULL,
	`clip` DECIMAL(23,0) NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.concurrentipdbyward
DROP VIEW IF EXISTS `concurrentipdbyward`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `concurrentipdbyward` (
	`hospcode` VARCHAR(5) NULL COLLATE 'tis620_thai_ci',
	`regdate` DATE NOT NULL,
	`wardcode` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`wardname` VARCHAR(40) NULL COLLATE 'tis620_thai_ci',
	`std_code` INT(6) NULL,
	`cases` DECIMAL(23,0) NULL,
	`new_case` DECIMAL(23,0) NULL,
	`discharge` DECIMAL(23,0) NULL,
	`death` DECIMAL(23,0) NULL,
	`normal` DECIMAL(23,0) NULL,
	`special` DECIMAL(23,0) NULL,
	`icu` DECIMAL(23,0) NULL,
	`semi` DECIMAL(23,0) NULL,
	`stroke` DECIMAL(23,0) NULL,
	`burn` DECIMAL(23,0) NULL,
	`imc` DECIMAL(23,0) NULL,
	`lr` DECIMAL(23,0) NULL,
	`clip` DECIMAL(23,0) NULL,
	`minithanyaruk` DECIMAL(23,0) NULL,
	`homeward` DECIMAL(23,0) NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.countbedno
DROP VIEW IF EXISTS `countbedno`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `countbedno` (
	`total_bed` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.diagnosis
DROP VIEW IF EXISTS `diagnosis`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `diagnosis` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`date` DATE NOT NULL,
	`time_serve` VARCHAR(5) NULL COLLATE 'tis620_thai_ci',
	`seq` SMALLINT(6) NOT NULL,
	`diag_type` CHAR(1) NULL COLLATE 'tis620_thai_ci',
	`icd_code` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`icd_name` VARCHAR(220) NULL COLLATE 'tis620_thai_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.diag_vwxy
DROP VIEW IF EXISTS `diag_vwxy`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `diag_vwxy` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`visitno` VARCHAR(15) NULL COLLATE 'tis620_thai_ci',
	`DATE` DATE NOT NULL,
	`diagcode` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`diag_name` VARCHAR(220) NULL COLLATE 'tis620_thai_ci',
	`diag_type` CHAR(1) NULL COLLATE 'tis620_thai_ci',
	`dr` VARCHAR(30) NULL COLLATE 'tis620_thai_ci',
	`episode` CHAR(0) NOT NULL COLLATE 'utf8mb4_general_ci',
	`codeset` VARCHAR(2) NOT NULL COLLATE 'utf8mb4_general_ci',
	`d_update` DATE NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.doctor
DROP VIEW IF EXISTS `doctor`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `doctor` (
	`dr_code` INT(11) NULL,
	`dr_license_code` VARCHAR(100) NULL COLLATE 'tis620_thai_ci',
	`dr_name` VARCHAR(50) NULL COLLATE 'tis620_thai_ci',
	`expire_date` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.drug
DROP VIEW IF EXISTS `drug`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `drug` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`seq` INT(4) NOT NULL,
	`date_serve` DATE NOT NULL,
	`time_serve` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`drug_name` VARCHAR(60) NULL COLLATE 'tis620_thai_ci',
	`qty` DOUBLE(6,2) NOT NULL,
	`unit` VARCHAR(20) NULL COLLATE 'tis620_thai_ci',
	`usage_line1` VARCHAR(255) NULL COLLATE 'tis620_thai_ci',
	`usage_line2` VARCHAR(255) NULL COLLATE 'tis620_thai_ci',
	`usage_line3` VARCHAR(255) NULL COLLATE 'tis620_thai_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.getvisitformophalert
DROP VIEW IF EXISTS `getvisitformophalert`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `getvisitformophalert` (
	`hospcode` VARCHAR(5) NULL COLLATE 'tis620_thai_ci',
	`cid` VARCHAR(22) NULL COLLATE 'tis620_thai_ci',
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`vn` VARCHAR(15) NULL COLLATE 'tis620_thai_ci',
	`department_type` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_general_ci',
	`department_code` VARCHAR(2) NULL COLLATE 'tis620_thai_ci',
	`department_name` VARCHAR(120) NULL COLLATE 'utf8mb4_general_ci',
	`date_service` DATE NOT NULL,
	`time_service` VARCHAR(10) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.getward
DROP VIEW IF EXISTS `getward`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `getward` (
	`hospcode` VARCHAR(5) NULL COLLATE 'tis620_thai_ci',
	`wardcode` VARCHAR(10) NOT NULL COLLATE 'tis620_thai_ci',
	`wardname` VARCHAR(40) NULL COLLATE 'tis620_thai_ci',
	`std_code` VARCHAR(11) NOT NULL COLLATE 'utf8mb4_general_ci',
	`bed_normal` BIGINT(11) NULL,
	`bed_special` BIGINT(11) NULL,
	`bed_icu` BIGINT(11) NULL,
	`bed_semi` BIGINT(11) NULL,
	`bed_stroke` BIGINT(11) NULL,
	`bed_burn` BIGINT(11) NULL,
	`bed_minithanyaruk` BIGINT(11) NULL,
	`bed_extra` INT(1) NOT NULL,
	`lr` BIGINT(11) NULL,
	`clip` BIGINT(11) NULL,
	`homeward` BIGINT(11) NULL,
	`isactive` INT(1) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.hospital
DROP VIEW IF EXISTS `hospital`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `hospital` (
	`provider_code` VARCHAR(5) NOT NULL COLLATE 'tis620_thai_ci',
	`provider_name` VARCHAR(50) NULL COLLATE 'tis620_thai_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.lab
DROP VIEW IF EXISTS `lab`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `lab` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`seq` INT(11) NOT NULL,
	`date_serve` DATE NOT NULL,
	`lab_name` VARCHAR(162) NULL COLLATE 'tis620_thai_ci',
	`lab_result` VARCHAR(40) NULL COLLATE 'tis620_thai_ci',
	`standard_result` VARCHAR(30) NULL COLLATE 'tis620_thai_ci',
	`time_serve` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`IOPD` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for table his_connect.map_ward_clinic
DROP TABLE IF EXISTS `map_ward_clinic`;
CREATE TABLE IF NOT EXISTS `map_ward_clinic` (
  `roomcode` varchar(20) NOT NULL,
  `cliniccode` char(2) NOT NULL,
  `is_icu` tinyint(1) NOT NULL DEFAULT '0',
  `is_semi` tinyint(1) NOT NULL DEFAULT '0',
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_clip` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`roomcode`),
  KEY `fk_mwc_clinic` (`cliniccode`),
  CONSTRAINT `fk_mwc_clinic` FOREIGN KEY (`cliniccode`) REFERENCES `clinic_hdc` (`cliniccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table his_connect.map_ward_clinic: ~5 rows (approximately)
/*!40000 ALTER TABLE `map_ward_clinic` DISABLE KEYS */;
INSERT IGNORE INTO `map_ward_clinic` (`roomcode`, `cliniccode`, `is_icu`, `is_semi`, `is_home`, `is_clip`, `isactive`) VALUES
	('LR1', '03', 1, 0, 0, 0, 1),
	('WARD1', '01', 0, 0, 0, 0, 1),
	('WARD12', '01', 0, 0, 1, 0, 1),
	('WARD2', '02', 0, 0, 0, 0, 1),
	('WARD8', '05', 1, 0, 0, 1, 1);
/*!40000 ALTER TABLE `map_ward_clinic` ENABLE KEYS */;


-- Dumping structure for view his_connect.person
DROP VIEW IF EXISTS `person`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `person` (
	`PatientID` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`title_code` VARCHAR(6) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fname` VARCHAR(30) NULL COLLATE 'utf8_general_ci',
	`lname` VARCHAR(30) NULL COLLATE 'utf8_general_ci',
	`CID` VARCHAR(22) NULL COLLATE 'tis620_thai_ci',
	`sex_code` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`birthdate` VARCHAR(10) NULL COLLATE 'utf8_general_ci',
	`marry_status` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nationality` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_general_ci',
	`citizenship` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_general_ci',
	`religion` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`addr` VARCHAR(50) NULL COLLATE 'tis620_thai_ci',
	`vill` CHAR(3) NULL COLLATE 'tis620_thai_ci',
	`addCode` VARCHAR(6) NULL COLLATE 'tis620_thai_ci',
	`Tel` VARCHAR(15) NULL COLLATE 'tis620_thai_ci',
	`last_update` VARCHAR(16) NULL COLLATE 'tis620_thai_ci',
	`occupation` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.procedure
DROP VIEW IF EXISTS `procedure`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `procedure` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`seq` INT(11) NOT NULL,
	`date_serve` DATE NOT NULL,
	`procedure_code` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`procedure_name` VARCHAR(220) NULL COLLATE 'tis620_thai_ci',
	`time_serve` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_general_ci',
	`start_date` DATE NOT NULL,
	`start_time` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_general_ci',
	`end_date` DATE NOT NULL,
	`end_time` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.profile
DROP VIEW IF EXISTS `profile`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `profile` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`cid` VARCHAR(22) NULL COLLATE 'tis620_thai_ci',
	`title_name` VARCHAR(15) NULL COLLATE 'tis620_thai_ci',
	`first_name` VARCHAR(30) NULL COLLATE 'tis620_thai_ci',
	`last_name` VARCHAR(30) NULL COLLATE 'tis620_thai_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.refer
DROP VIEW IF EXISTS `refer`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `refer` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`date_serve` DATE NOT NULL,
	`seq` SMALLINT(6) NOT NULL,
	`hcode_to` VARCHAR(8) NULL COLLATE 'tis620_thai_ci',
	`name_to` VARCHAR(250) NULL COLLATE 'tis620_thai_ci',
	`reason` TEXT NULL COLLATE 'tis620_bin',
	`time_serve` VARCHAR(10) NULL COLLATE 'tis620_thai_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.service
DROP VIEW IF EXISTS `service`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `service` (
	`hn` VARCHAR(11) NOT NULL COLLATE 'tis620_thai_ci',
	`seq` SMALLINT(6) NOT NULL,
	`date` DATE NOT NULL,
	`bp` SMALLINT(6) NULL,
	`bp1` SMALLINT(6) NULL,
	`puls` SMALLINT(6) NULL,
	`time_serve` VARCHAR(13) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.sumopdvisitbyclinic
DROP VIEW IF EXISTS `sumopdvisitbyclinic`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `sumopdvisitbyclinic` (
	`hospcode` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_general_ci',
	`date` DATE NOT NULL,
	`cliniccode` VARCHAR(2) NULL COLLATE 'utf8mb4_general_ci',
	`clinicname` VARCHAR(120) NULL COLLATE 'utf8mb4_general_ci',
	`cases` BIGINT(21) NOT NULL,
	`admit` DECIMAL(23,0) NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.sumreferin
DROP VIEW IF EXISTS `sumreferin`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `sumreferin` (
	`refer_date` DATE NOT NULL,
	`cases` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.sumreferout
DROP VIEW IF EXISTS `sumreferout`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `sumreferout` (
	`refer_date` DATE NOT NULL,
	`cases` BIGINT(21) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.vaccine
DROP VIEW IF EXISTS `vaccine`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vaccine` (
	`hn` VARCHAR(15) NOT NULL COLLATE 'tis620_thai_ci',
	`date_serve` DATE NOT NULL,
	`time_serve` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`vaccine_code` VARCHAR(10) NULL COLLATE 'tis620_thai_ci',
	`vaccine_name` VARCHAR(50) NULL COLLATE 'tis620_thai_ci'
) ENGINE=MyISAM;


-- Dumping structure for view his_connect.allergy
DROP VIEW IF EXISTS `allergy`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `allergy`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `allergy` AS select `pt`.`ptallergy`.`hn` AS `hn`,`pt`.`ptallergy`.`listname` AS `drug_name`,`pt`.`ptallergy`.`descrip` AS `symptom` from `pt`.`ptallergy`;


-- Dumping structure for view his_connect.appointment
DROP VIEW IF EXISTS `appointment`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `appointment`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `appointment` AS select `p`.`hn` AS `hn`,'' AS `seq`,`p`.`regdate` AS `date_serve`,NULL AS `time_serve`,`p`.`appointdate` AS `date`,`p`.`timeappoint` AS `time`,(select `r`.`roomname` from `hos`.`roomno` `r` where (`r`.`roomcode` = `p`.`toroomappoint`)) AS `department`,`p`.`causeappoint` AS `detail` from `pt`.`ptappoint` `p` order by `p`.`regdate` desc limit 500;


-- Dumping structure for view his_connect.bedno
DROP VIEW IF EXISTS `bedno`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `bedno`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `bedno` AS select `b`.`bed` AS `bedno`,`cc`.`std_code` AS `bedtype`,`hh`.`name` AS `bedtype_name`,'' AS `roomno`,`b`.`now_ward` AS `wardcode`,`cc`.`roomname` AS `wardname`,`cc`.`std_code` AS `std_code`,1 AS `isactive` from (((`ipd`.`ipd` `b` join `hos`.`hosbed` `a` on(((`a`.`code` = `b`.`bed`) and (`a`.`bedtype` = `b`.`bed_type`)))) left join `hos`.`roomno` `cc` on((`cc`.`roomcode` = `b`.`now_ward`))) left join `hos`.`codeinhos` `hh` on((`hh`.`code` = `b`.`bed_type`))) where (`b`.`datedsc` = '0000-00-00');


-- Dumping structure for view his_connect.chronic
DROP VIEW IF EXISTS `chronic`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `chronic`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `chronic` AS select `c`.`hn` AS `hn`,`c`.`icd10` AS `icd_code`,(select `i`.`description` from `hos`.`icd101_4` `i` where (`i`.`code` = `c`.`icd10`) limit 1) AS `icd_name`,`c`.`dateadm` AS `start_date`,'00:00:00' AS `time_serve` from `pt`.`ptclinic` `c` where ((`c`.`datedsc` = '0000-00-00') and (`c`.`icd10` is not null) and (`c`.`icd10` <> ''));


-- Dumping structure for view his_connect.concurrentipdbyclinic
DROP VIEW IF EXISTS `concurrentipdbyclinic`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `concurrentipdbyclinic`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `concurrentipdbyclinic` AS select (select `vv`.`codehos` from `hosdata`.`confighos` `vv` limit 1) AS `hospcode`,now() AS `date`,`t`.`cliniccode` AS `cliniccode`,`t`.`clinicname` AS `clinicname`,sum((case when (`t`.`datedsc` = '0000-00-00') then 1 else 0 end)) AS `cases`,sum((case when ((`t`.`datedsc` = '0000-00-00') and (`t`.`dateadm` = curdate())) then 1 else 0 end)) AS `new_case`,sum((case when (`t`.`datedsc` = curdate()) then 1 else 0 end)) AS `discharge`,sum((case when ((`t`.`datedsc` = curdate()) and (`t`.`status` = 'SDSC9')) then 1 else 0 end)) AS `death`,sum((case when ((`t`.`datedsc` = '0000-00-00') and ((`t`.`roomname` like '%ICU%') or (`t`.`roomname` like '%CCU%'))) then 1 else 0 end)) AS `icu`,sum((case when ((`t`.`datedsc` = '0000-00-00') and ((`t`.`roomname` like '%SEMI%') or (`t`.`roomname` like '%HDU%'))) then 1 else 0 end)) AS `semi`,sum((case when ((`t`.`datedsc` = '0000-00-00') and (`t`.`roomname` like '%home%')) then 1 else 0 end)) AS `homeward`,sum((case when ((`t`.`datedsc` = '0000-00-00') and ((`t`.`roomname` like '%เด็กแรกเกิด%') or (`t`.`roomname` like '%NB%') or (`t`.`roomname` like '%คลิป%'))) then 1 else 0 end)) AS `clip` from (select `a`.`an` AS `an`,coalesce(max(`h`.`cliniccode`),'01') AS `cliniccode`,coalesce(max(`h`.`clinicname`),'อายุรกรรม') AS `clinicname`,max(`a`.`dateadm`) AS `dateadm`,max(`a`.`datedsc`) AS `datedsc`,max(`a`.`status`) AS `status`,max(`r`.`roomname`) AS `roomname` from ((((`ipd`.`ipd` `a` left join `opd`.`opd` `o` on(((`a`.`regdate` = `o`.`regdate`) and (`a`.`hn` = `o`.`hn`) and (`a`.`frequency` = `o`.`frequency`)))) left join `hos`.`roomno` `r` on((`r`.`roomcode` = `a`.`now_ward`))) left join `hos`.`clinic` `c` on((`o`.`clinic` = `c`.`code`))) left join `his_connect`.`clinic_hdc` `h` on(((convert(`c`.`stdcode` using utf8mb4) collate utf8mb4_general_ci) = (`h`.`cliniccode` collate utf8mb4_general_ci)))) where ((left(`a`.`an`,1) <> 'X') and (`r`.`spclty` = 'Y')) group by `a`.`an`) `t` group by `t`.`cliniccode`,`t`.`clinicname` having (`cases` > 0) order by `t`.`cliniccode`;


-- Dumping structure for view his_connect.concurrentipdbyward
DROP VIEW IF EXISTS `concurrentipdbyward`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `concurrentipdbyward`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `concurrentipdbyward` AS select (select `vv`.`codehos` from `hosdata`.`confighos` `vv` limit 1) AS `hospcode`,curdate() AS `regdate`,`bb`.`roomcode` AS `wardcode`,`bb`.`roomname` AS `wardname`,`bb`.`std_code` AS `std_code`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00'))) then 1 else 0 end)) AS `cases`,sum((case when ((`a`.`dateadm` = curdate()) and (cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00'))) then 1 else 0 end)) AS `new_case`,sum((case when (`a`.`datedsc` = curdate()) then 1 else 0 end)) AS `discharge`,sum((case when ((`a`.`datedsc` = curdate()) and (`a`.`status` = 'SDSC9')) then 1 else 0 end)) AS `death`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and (not((`bb`.`roomname` like '%ICU%'))) and (not((`bb`.`roomname` like '%CCU%'))) and (not((`bb`.`roomname` like '%SEMI%'))) and (not((`bb`.`roomname` like '%HDU%'))) and (not((`bb`.`roomname` like '%IMC%'))) and (not((`bb`.`roomname` like '%Palliative%'))) and (not((`bb`.`roomname` like '%รอคลอด%'))) and (not((`bb`.`roomname` like '%เด็กแรกเกิด%'))) and (not((`bb`.`roomname` like '%minithanyaruk%'))) and (not((`bb`.`roomname` like '%home%')))) then 1 else 0 end)) AS `normal`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and ((`bb`.`roomname` like '%ICU%') or (`bb`.`roomname` like '%CCU%') or (`bb`.`roomname` like '%SEMI%') or (`bb`.`roomname` like '%HDU%') or (`bb`.`roomname` like '%IMC%') or (`bb`.`roomname` like '%Palliative%') or (`bb`.`roomname` like '%รอคลอด%') or (`bb`.`roomname` like '%เด็กแรกเกิด%'))) then 1 else 0 end)) AS `special`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and ((`bb`.`roomname` like '%ICU%') or (`bb`.`roomname` like '%CCU%'))) then 1 else 0 end)) AS `icu`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and ((`bb`.`roomname` like '%SEMI%') or (`bb`.`roomname` like '%HDU%'))) then 1 else 0 end)) AS `semi`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and (`bb`.`roomname` like '%stroke%')) then 1 else 0 end)) AS `stroke`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and (`bb`.`roomname` like '%burn%')) then 1 else 0 end)) AS `burn`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and ((`bb`.`roomname` like '%IMC%') or (`bb`.`roomname` like '%Palliative%'))) then 1 else 0 end)) AS `imc`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and (`bb`.`roomname` like '%รอคลอด%')) then 1 else 0 end)) AS `lr`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and (`bb`.`roomname` like '%เด็กแรกเกิด%')) then 1 else 0 end)) AS `clip`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and (`bb`.`roomname` like '%minithanyaruk%')) then 1 else 0 end)) AS `minithanyaruk`,sum((case when ((cast(concat(`a`.`dateadm`,' ',cast((`a`.`timesend` * 100) as time(6))) as datetime) <= cast(date_format(now(),'%Y-%m-%d %H:58:00') as datetime)) and ((cast(concat(`a`.`datedsc`,' ',cast((`a`.`dsctime` * 100) as time(6))) as datetime) > cast(date_format(now(),'%Y-%m-%d %H:00:00') as datetime)) or (`a`.`datedsc` = '0000-00-00')) and (`bb`.`roomname` like '%home%')) then 1 else 0 end)) AS `homeward` from (`ipd`.`ipd` `a` left join `hos`.`roomno` `bb` on((`bb`.`roomcode` = `a`.`now_ward`))) where ((`a`.`dateadm` >= (curdate() - interval 1 year)) and ((`a`.`now_ward` like '%WARD%') or (`a`.`now_ward` like '%LR1%')) and (`bb`.`spclty` = 'Y') and (left(`a`.`an`,1) <> 'X')) group by `bb`.`roomcode`,`bb`.`roomname`,`bb`.`std_code`;


-- Dumping structure for view his_connect.countbedno
DROP VIEW IF EXISTS `countbedno`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `countbedno`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `countbedno` AS select count(`a`.`an`) AS `total_bed` from `ipd`.`ipd` `a` where ((`a`.`datedsc` = '0000-00-00') and (not((`a`.`an` like 'x%'))));


-- Dumping structure for view his_connect.diagnosis
DROP VIEW IF EXISTS `diagnosis`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `diagnosis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `diagnosis` AS select `o`.`hn` AS `hn`,`o`.`regdate` AS `date`,`o`.`timestart` AS `time_serve`,`o`.`frequency` AS `seq`,`d`.`dxtype` AS `diag_type`,`d`.`diag` AS `icd_code`,`d`.`descrip` AS `icd_name` from (`opd`.`opd` `o` join `opd`.`odiag` `d` on(((`d`.`regdate` = `o`.`regdate`) and (`o`.`hn` = `d`.`hn`) and (`d`.`frequency` = `o`.`frequency`)))) order by `o`.`regdate` desc;


-- Dumping structure for view his_connect.diag_vwxy
DROP VIEW IF EXISTS `diag_vwxy`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `diag_vwxy`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `diag_vwxy` AS select `a`.`hn` AS `hn`,`a`.`docno` AS `visitno`,`a`.`regdate` AS `DATE`,`b`.`diag` AS `diagcode`,`b`.`descrip` AS `diag_name`,`b`.`dxtype` AS `diag_type`,`a`.`doctor` AS `dr`,'' AS `episode`,'IT' AS `codeset`,`a`.`date_update` AS `d_update` from (`opd`.`opd` `a` left join `opd`.`odiag` `b` on(((`b`.`regdate` = `a`.`regdate`) and (`b`.`hn` = `a`.`hn`) and (`b`.`frequency` = `a`.`frequency`)))) where (left(`b`.`diag`,1) in ('S','T','V','W','X','Y')) order by `a`.`regdate` desc limit 1000;


-- Dumping structure for view his_connect.doctor
DROP VIEW IF EXISTS `doctor`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `doctor`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `doctor` AS select `a`.`userid` AS `dr_code`,`a`.`regist_no` AS `dr_license_code`,`a`.`username` AS `dr_name`,'0000-00-00' AS `expire_date` from (`hosdata`.`user` `a` left join `hos`.`userposition` `b` on((`a`.`position` = `b`.`posCode`))) where ((`b`.`posname` like 'แพทย์') and (`a`.`status` = 'PASS1') and (`a`.`userid` in ('222','196','65','2807','2798')));


-- Dumping structure for view his_connect.drug
DROP VIEW IF EXISTS `drug`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `drug`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `drug` AS select `opd`.`drug_order_opd`.`hn` AS `hn`,`opd`.`drug_order_opd`.`frequency` AS `seq`,`opd`.`drug_order_opd`.`regdate` AS `date_serve`,`opd`.`drug_order_opd`.`time_order` AS `time_serve`,`opd`.`drug_order_opd`.`namedrug` AS `drug_name`,`opd`.`drug_order_opd`.`amount` AS `qty`,(select `l`.`UnitName` from `hos`.`itemlist` `l` where (`l`.`itemcode` = `opd`.`drug_order_opd`.`codedrug`)) AS `unit`,(select `l`.`Line1` from `hos`.`itemlabel` `l` where (`l`.`code` = `opd`.`drug_order_opd`.`item_usage`)) AS `usage_line1`,(select `l`.`Line2` from `hos`.`itemlabel` `l` where (`l`.`code` = `opd`.`drug_order_opd`.`item_usage`)) AS `usage_line2`,(select `l`.`Line3` from `hos`.`itemlabel` `l` where (`l`.`code` = `opd`.`drug_order_opd`.`item_usage`)) AS `usage_line3` from `opd`.`drug_order_opd` where (`opd`.`drug_order_opd`.`regdate` between (curdate() + interval -(1) year) and curdate());


-- Dumping structure for view his_connect.getvisitformophalert
DROP VIEW IF EXISTS `getvisitformophalert`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `getvisitformophalert`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `getvisitformophalert` AS select (select `vv`.`codehos` from `hosdata`.`confighos` `vv` limit 1) AS `hospcode`,replace(`p`.`cardid`,'-','') AS `cid`,`o`.`hn` AS `hn`,`o`.`docno` AS `vn`,(case when (`room`.`roomname` like '%ER%') then 'ER' else 'OPD' end) AS `department_type`,lpad(trim(`c`.`stdcode`),2,'0') AS `department_code`,coalesce(`ch`.`clinicname`,convert(`c`.`NAME` using utf8mb4)) AS `department_name`,`o`.`regdate` AS `date_service`,time_format(`o`.`timereg`,'%H:%i') AS `time_service` from (((((`opd`.`opd` `o` join `pt`.`pt` `p` on((`p`.`hn` = `o`.`hn`))) left join `hos`.`clinic` `c` on((`c`.`code` = `o`.`clinic`))) left join `his_connect`.`clinic_hdc` `ch` on((`ch`.`cliniccode` = convert(lpad(trim(`c`.`stdcode`),2,'0') using utf8mb4)))) left join `ipd`.`ipd` `ip` on(((`ip`.`hn` = `o`.`hn`) and (`ip`.`dateadm` = `o`.`regdate`) and (left(`ip`.`an`,1) <> 'X') and (`ip`.`datedsc` = '0000-00-00')))) left join `hos`.`roomno` `room` on((`room`.`roomcode` = `o`.`sendScrRoom`))) where ((`o`.`regdate` = curdate()) and (`o`.`result` = 'RST1') and isnull(`ip`.`an`) and (`p`.`ptnation` = '99')) group by `o`.`regdate`,`o`.`hn`,`o`.`frequency` order by `o`.`regdate`,`o`.`timereg`;


-- Dumping structure for view his_connect.getward
DROP VIEW IF EXISTS `getward`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `getward`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `getward` AS select (select `vv`.`codehos` from `hosdata`.`confighos` `vv` limit 1) AS `hospcode`,`hos`.`roomno`.`roomcode` AS `wardcode`,`hos`.`roomno`.`roomname` AS `wardname`,coalesce(cast(`hos`.`roomno`.`std_code` as char charset utf8mb4),'') AS `std_code`,coalesce(`hos`.`roomno`.`bed`,0) AS `bed_normal`,(case when (`hos`.`roomno`.`spclty` = 'Y') then coalesce(`hos`.`roomno`.`bed_vip`,0) else 0 end) AS `bed_special`,(case when (`hos`.`roomno`.`roomname` regexp '(ICU|CCU|NICU|PICU)') then coalesce(`hos`.`roomno`.`bed`,0) else 0 end) AS `bed_icu`,(case when (`hos`.`roomno`.`roomname` regexp '(SEMI|HDU)') then coalesce(`hos`.`roomno`.`bed`,0) else 0 end) AS `bed_semi`,(case when (`hos`.`roomno`.`roomname` like '%stroke%') then coalesce(`hos`.`roomno`.`bed`,0) else 0 end) AS `bed_stroke`,(case when (`hos`.`roomno`.`roomname` like '%burn%') then coalesce(`hos`.`roomno`.`bed`,0) else 0 end) AS `bed_burn`,(case when (`hos`.`roomno`.`roomname` like '%minithanyaruk%') then coalesce(`hos`.`roomno`.`bed`,0) else 0 end) AS `bed_minithanyaruk`,0 AS `bed_extra`,(case when ((`hos`.`roomno`.`roomname` like '%LR%') or (`hos`.`roomno`.`roomname` like '%ห้องคลอด%') or (`hos`.`roomno`.`roomname` like '%รอคลอด%')) then coalesce(`hos`.`roomno`.`bed`,0) else 0 end) AS `lr`,(case when ((`hos`.`roomno`.`roomname` like '%เด็กแรกเกิด%') or (`hos`.`roomno`.`roomname` like '%NICU%')) then coalesce(`hos`.`roomno`.`bed`,0) else 0 end) AS `clip`,(case when (`hos`.`roomno`.`roomname` like '%home%') then coalesce(`hos`.`roomno`.`bed`,0) else 0 end) AS `homeward`,(case when (coalesce(`hos`.`roomno`.`spclty`,'') = 'Y') then 1 else 0 end) AS `isactive` from `hos`.`roomno` where ((`hos`.`roomno`.`groupcode` = 'WARD') and (`hos`.`roomno`.`nouse` = 0)) order by `hos`.`roomno`.`roomcode`;


-- Dumping structure for view his_connect.hospital
DROP VIEW IF EXISTS `hospital`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `hospital`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `hospital` AS select `hosdata`.`confighos`.`codehos` AS `provider_code`,`hosdata`.`confighos`.`nameHos` AS `provider_name` from `hosdata`.`confighos`;


-- Dumping structure for view his_connect.lab
DROP VIEW IF EXISTS `lab`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `lab`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `lab` AS select `l`.`hn` AS `hn`,`l`.`frequency` AS `seq`,`l`.`regdate` AS `date_serve`,concat(`l`.`namelab`,'[',`s`.`labname`,']') AS `lab_name`,`s`.`result_lab` AS `lab_result`,`s`.`normal_lab` AS `standard_result`,`l`.`time_order` AS `time_serve`,'OPD' AS `IOPD` from (`opd`.`lab_order_opd` `l` left join `opd`.`result_lab_opd` `s` on(((`s`.`regdate` = `l`.`regdate`) and (`s`.`hn` = `l`.`hn`) and (`s`.`frequency` = `l`.`frequency`) and (`s`.`orderno` = `l`.`orderno`) and (`s`.`labcode` = `l`.`codelab`)))) where (`l`.`regdate` between (curdate() + interval -(1) year) and curdate()) union select `l`.`hn` AS `hn`,`l`.`frequency` AS `seq`,`l`.`regdate` AS `date_serve`,concat(`l`.`namelab`,'[',`s`.`labname`,']') AS `lab_name`,`s`.`result_lab` AS `lab_result`,`s`.`normal_lab` AS `standard_result`,`l`.`time_order` AS `time_serve`,'PCU' AS `IOPD` from (`pcu`.`lab_order_pcu` `l` left join `pcu`.`result_lab_pcu` `s` on(((`s`.`regdate` = `l`.`regdate`) and (`s`.`hn` = `l`.`hn`) and (`s`.`frequency` = `l`.`frequency`) and (`s`.`orderno` = `l`.`orderno`) and (`s`.`labcode` = `l`.`codelab`)))) where (`l`.`regdate` between (curdate() + interval -(1) year) and curdate());


-- Dumping structure for view his_connect.person
DROP VIEW IF EXISTS `person`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `person`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `person` AS select `a`.`hn` AS `PatientID`,`a`.`hn` AS `hn`,(case when (convert(`a`.`pttitle` using utf8) = convert('นาย' using utf8)) then 'นาย' when (convert(`a`.`pttitle` using utf8) = convert('นาง' using utf8)) then 'นาง' when ((convert(`a`.`pttitle` using utf8) = convert('นางสาว' using utf8)) or (convert(`a`.`pttitle` using utf8) = convert('น.ส.' using utf8))) then 'นางสาว' when (convert(`a`.`pttitle` using utf8) = convert('ด.ช.' using utf8)) then 'ด.ช' when (convert(`a`.`pttitle` using utf8) = convert('ด.ญ.' using utf8)) then 'ด.ญ.' else 'ด.ญ.' end) AS `title_code`,convert(`a`.`ptfname` using utf8) AS `fname`,convert(`a`.`ptlname` using utf8) AS `lname`,replace(replace(`a`.`cardid`,'-',''),'_','') AS `CID`,(case when (`a`.`ptsex` = 'SX1') then '1' when (`a`.`ptsex` = 'SX2') then '2' else '9' end) AS `sex_code`,date_format(`a`.`ptdob`,'%Y-%m-%d') AS `birthdate`,(case when (`a`.`married` = 'MA1') then '1' when (`a`.`married` in ('MA2','MA3','MA4','MA5')) then '2' when (`a`.`married` = 'MA6') then '3' else '9' end) AS `marry_status`,(case when (`a`.`ptnation` = '99') then '99' when (`a`.`ptnation` = '44') then '44' when (`a`.`ptnation` = '56') then '56' else '999' end) AS `nationality`,(case when (`a`.`ptrace` = '99') then '1' when (`a`.`ptrace` = '44') then '2' when (`a`.`ptrace` = '56') then '3' else '999' end) AS `citizenship`,(case when (`a`.`religion` = 'RL1') then '1' when (`a`.`religion` = 'RL2') then '2' when (`a`.`religion` = 'RL3') then '3' else '8' end) AS `religion`,`a`.`ptaddress` AS `addr`,`a`.`ptvillage` AS `vill`,concat(`a`.`ptprovince`,`a`.`ptamphur`,`a`.`pttambon`) AS `addCode`,`a`.`ptphone` AS `Tel`,concat(convert(date_format(`a`.`updatedate`,'%Y%m%d') using tis620),(case when isnull(`a`.`timereg`) then '000000' else replace(`a`.`timereg`,':','') end)) AS `last_update`,'N' AS `occupation` from `pt`.`pt` `a` where (left(`a`.`hn`,1) <> 'x') order by `a`.`hn` desc;


-- Dumping structure for view his_connect.procedure
DROP VIEW IF EXISTS `procedure`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `procedure`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `procedure` AS select `opd`.`ooper`.`hn` AS `hn`,`opd`.`ooper`.`frequency` AS `seq`,`opd`.`ooper`.`regdate` AS `date_serve`,`opd`.`ooper`.`oper` AS `procedure_code`,`opd`.`ooper`.`descrip` AS `procedure_name`,'00:00' AS `time_serve`,`opd`.`ooper`.`regdate` AS `start_date`,'00:00' AS `start_time`,`opd`.`ooper`.`regdate` AS `end_date`,'00:00' AS `end_time` from `opd`.`ooper`;


-- Dumping structure for view his_connect.profile
DROP VIEW IF EXISTS `profile`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `profile`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY INVOKER VIEW `profile` AS select `pt`.`pt`.`hn` AS `hn`,replace(`pt`.`pt`.`cardid`,'-','') AS `cid`,`pt`.`pt`.`pttitle` AS `title_name`,`pt`.`pt`.`ptfname` AS `first_name`,`pt`.`pt`.`ptlname` AS `last_name` from `pt`.`pt`;


-- Dumping structure for view his_connect.refer
DROP VIEW IF EXISTS `refer`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `refer`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `refer` AS select `hosdata`.`sendrefer`.`hn` AS `hn`,`hosdata`.`sendrefer`.`regdate` AS `date_serve`,`hosdata`.`sendrefer`.`frequency` AS `seq`,`hosdata`.`sendrefer`.`sendtohos` AS `hcode_to`,(select `h`.`name` from `hos`.`hospitals` `h` where (`h`.`OFF_ID` = `hosdata`.`sendrefer`.`sendtohos`)) AS `name_to`,`hosdata`.`sendrefer`.`diagnosis` AS `reason`,`hosdata`.`sendrefer`.`timerefer` AS `time_serve` from `hosdata`.`sendrefer`;


-- Dumping structure for view his_connect.service
DROP VIEW IF EXISTS `service`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `service`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `service` AS select `opd`.`opd`.`hn` AS `hn`,`opd`.`opd`.`frequency` AS `seq`,`opd`.`opd`.`regdate` AS `date`,`opd`.`opd`.`hpressure` AS `bp`,`opd`.`opd`.`lpressure` AS `bp1`,`opd`.`opd`.`pulse` AS `puls`,time_format(`opd`.`opd`.`timestart`,'%H:%i:%s') AS `time_serve` from `opd`.`opd` where ((left(`opd`.`opd`.`hn`,1) <> 'x') and (`opd`.`opd`.`regdate` between (curdate() + interval -(3) year) and curdate()) and ((`opd`.`opd`.`timestart` <> '') or isnull(`opd`.`opd`.`timestart`) or (`opd`.`opd`.`timestart` <> '__:__')));


-- Dumping structure for view his_connect.sumopdvisitbyclinic
DROP VIEW IF EXISTS `sumopdvisitbyclinic`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `sumopdvisitbyclinic`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `sumopdvisitbyclinic` AS select '10942' AS `hospcode`,`o`.`regdate` AS `date`,coalesce(`h`.`cliniccode`,'01') AS `cliniccode`,coalesce(`h`.`clinicname`,'อายุรกรรม') AS `clinicname`,count(0) AS `cases`,sum((case when (`a`.`an` is not null) then 1 else 0 end)) AS `admit` from (((`opd`.`opd` `o` left join `hos`.`clinic` `c` on((`c`.`code` = `o`.`clinic`))) left join `ipd`.`ipd` `a` on(((`a`.`hn` = `o`.`hn`) and (`a`.`dateadm` = `o`.`regdate`) and (left(`a`.`an`,1) <> 'x')))) left join `his_connect`.`clinic_hdc` `h` on((`h`.`cliniccode` = convert(lpad(trim(`c`.`stdcode`),2,'0') using utf8mb4)))) where (`o`.`regdate` = curdate()) group by `o`.`regdate`,coalesce(`h`.`cliniccode`,'01'),coalesce(`h`.`clinicname`,'อายุรกรรม') order by `cliniccode`;


-- Dumping structure for view his_connect.sumreferin
DROP VIEW IF EXISTS `sumreferin`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `sumreferin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `sumreferin` AS select `hosdata`.`referin`.`regdate` AS `refer_date`,count(0) AS `cases` from `hosdata`.`referin` group by `hosdata`.`referin`.`regdate` order by `hosdata`.`referin`.`regdate` desc limit 1000;


-- Dumping structure for view his_connect.sumreferout
DROP VIEW IF EXISTS `sumreferout`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `sumreferout`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `sumreferout` AS select `hosdata`.`sendrefer`.`regdate` AS `refer_date`,count(0) AS `cases` from `hosdata`.`sendrefer` group by `hosdata`.`sendrefer`.`regdate` order by `hosdata`.`sendrefer`.`regdate` desc limit 1000;


-- Dumping structure for view his_connect.vaccine
DROP VIEW IF EXISTS `vaccine`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vaccine`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vaccine` AS select `opd`.`ptvaccine`.`hn` AS `hn`,`opd`.`ptvaccine`.`regdate` AS `date_serve`,if(isnull(`opd`.`ptvaccine`.`time_vacc`),'00:00',`opd`.`ptvaccine`.`time_vacc`) AS `time_serve`,`opd`.`ptvaccine`.`code` AS `vaccine_code`,`opd`.`ptvaccine`.`name` AS `vaccine_name` from `opd`.`ptvaccine` union select `pcu`.`ptvaccine`.`hn` AS `hn`,`pcu`.`ptvaccine`.`regdate` AS `date_serve`,if(isnull(`pcu`.`ptvaccine`.`time_vacc`),'00:00',`pcu`.`ptvaccine`.`time_vacc`) AS `time_serve`,`pcu`.`ptvaccine`.`code` AS `vaccine_code`,`pcu`.`ptvaccine`.`name` AS `vaccine_name` from `pcu`.`ptvaccine`;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
