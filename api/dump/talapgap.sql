-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 12, 2020 at 03:14 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `talapgap`
--
CREATE DATABASE IF NOT EXISTS `talapgap` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `talapgap`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `parent` int NOT NULL,
  `rank` tinyint(3) UNSIGNED ZEROFILL NOT NULL DEFAULT '050',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `logs` mediumtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logs` mediumtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `data`, `type`, `logs`) VALUES
(1, 'controlflds', 'id,logs,content', 'array', '2020-09-12 10:32:48 updated \n'),
(2, 'menus', 'content,category,media,user,config,options', 'array', ''),
(3, 'skipbrowse', 'content,description', 'array', '2020-09-12 10:18:53 updated \n2020-09-12 10:18:32 updated \n2020-09-12 10:14:51 updated \n2020-09-12 10:14:09 updated \n2020-09-12 10:13:54 updated \n2020-09-12 10:13:52 updated \n2020-09-12 10:13:17 updated \n2020-09-12 10:13:08 updated \n2020-09-12 10:13:06 updated \n2020-09-12 10:12:25 updated \n2020-09-12 10:12:06 updated \n'),
(4, 'textflds', 'content,description,tags', 'array', '2020-09-12 10:27:53 updated \n2020-09-12 10:26:22 updated \n2020-09-12 10:26:00 updated \n2020-09-12 10:23:01 added by '),
(5, 'editorflds', 'content', 'array', '2020-09-12 10:26:46 updated \n2020-09-12 10:23:20 updated \n2020-09-12 10:23:20 added by '),
(6, 'chkflds', 'active', 'array', '2020-09-12 10:25:38 updated \n2020-09-12 10:25:38 added by '),
(7, 'tagsflds', 'tags', 'array', '2020-09-12 10:27:41 updated \n2020-09-12 10:27:41 added by ');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `categories` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `tags` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'new',
  `author` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `featured_image` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `logs` mediumtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `name`, `content`, `categories`, `tags`, `date`, `status`, `author`, `featured_image`, `logs`) VALUES
(1, 'ไปรษณีย์ไทย เผยยอดส่งกล่อง ซองเก่า “ไปรษณีย์ reBOX” จากคนไทยกว่า 10,000 กก. พร้อมชวนส่งกล่องเหลือใช้จากมหกรรมช็อปออนไลน์ 9.9 นำมาผลิตโต๊ะเก้าอี้ให้น้อง', ' กรุงเทพฯ 9 กันยายน 2563 – บริษัท ไปรษณีย์ไทย จำกัด เผยปริมาณการส่งกล่องพัสดุและซองเก่าในโครงการไปรษณีย์ reBOX เปลี่ยนกล่อง/ซองเป็นของขวัญปีใหม่ 2564 ทะลุแล้วกว่า 10,000 กิโลกรัม พร้อมชวนนำกล่องพัสดุ ซองกระดาษที่ได้จากเทศกาลช็อปออนไลน์ 9.9 ส่งเข้าร่วมแคมเปญดังกล่าว ผ่านจุดรับคืนต่างๆ ณ ที่ทำการไปรษณีย์ทั่วประเทศ โดยแคมเปญไปรษณีย์ reBOX ยังคงเปิดรับกล่องและซองแบบไม่จำกัดจำนวนชิ้น เพื่อนำไปผลิตชุดโต๊ะเก้าอี้ให้กับนักเรียนโรงเรียนตำรวจตระเวนชายแดน\r\nนายก่อกิจ ด่านชัยวิจิตร กรรมการผู้จัดการใหญ่ บริษัท ไปรษณีย์ไทย จำกัด กล่าวว่า ตามที่ไปรษณีย์ไทยได้ดำเนินโครงการ “ไปรษณีย์ reBOX เปลี่ยนกล่อง/ซองเป็นของขวัญปีใหม่ 2564” ตั้งแต่ช่วงกลางเดือนสิงหาคมที่ผ่านมา ขณะนี้มีผู้ให้ความสนใจเข้าร่วมกิจกรรมดังกล่าวกับไปรษณีย์เป็นจำนวนมาก              ซึ่งตั้งแต่ที่เปิดรับกล่องพัสดุ และซองที่ไม่สามารถใช้ซ้ำได้แล้วผ่านจุดรับคืน และที่ทำการไปรษณีย์ทั่วประเทศ จนถึงปัจจุบันพบว่ามีปริมาณกล่องพัสดุและซองที่เตรียมเข้าสู่กระบวนการรีไซเคิลกับทาง                                            บริษัท เอสซีจี แพคเกจจิ้ง จำกัด (มหาชน) แล้วกว่า 10,000 กิโลกรัม และยังคาดว่าหลังจากช่วงเทศกาลช็อปออนไลน์ 9.9 ในช่วงระหว่างวันที่ 9 – 16 กันยายน 2563 นี้ จะยิ่งมีปริมาณกล่องพัสดุและซองที่เกิดจากกิจกรรมอีคอมเมิร์ซเข้าสู่ระบบเพิ่มขึ้นอีกจำนวนมาก\r\n    “ในช่วงเทศกาล 9.9 นี้ เป็นช่วงที่คนไทยสั่งซื้อสินค้าผ่านร้านออนไลน์ และช่องทางอีมาร์เก็ตเพลสเป็นจำนวนมาก โดยข้อมูลจาก เนื่องจากกิจกรรมส่งเสริมการขาย การลดราคา รวมถึงแคมเปญต่างๆ ที่ดึงดูดให้ผู้บริโภคหันมาจับจ่ายใช้สอยกันในหลายหมวดหมู่ ไม่ว่าจะเป็นแฟชั่น อาหาร สินค้าไลฟ์สไตล์ ฯลฯ ซึ่งเป็นเรื่องที่ดีที่จะทำให้เกิดมูลค่าทางเศรษฐกิจหมุนเวียนภายในประเทศเพิ่มมากขึ้น และเชื่อว่าจากกิจกรรมนี้จะทำให้มีปริมาณกล่องพัสดุเพิ่มมากขึ้นเช่นเดียวกัน ไปรษณีย์ไทยจึงขอใช้โอกาสนี้เชิญชวนทั้งกลุ่มพ่อค้าแม่ค้าออนไลน์ องค์กรธุรกิจ รวมถึงประชาชนทั่วไปนำกล่องพัสดุทุกประเภท รวมทั้งซองกระดาษที่ได้รับจากช่วงเทศกาลดังกล่าวมาส่งคืนให้กับโครงการไปรษณีย์ reBOX เปลี่ยนกล่อง/ซองเป็นของขวัญปีใหม่ 2564 ผ่านจุดรับคืนต่างๆ ณ ที่ทำการไปรษณีย์ทั่วประเทศ โดยสามารถคืนกล่องและซองได้ไม่จำกัดจำนวนชิ้น จนถึงวันที่ 31 ตุลาคมนี้ เพื่อเข้าสู่กระบวนการรีไซเคิลเป็นชุดโต๊ะ เก้าอี้ มอบเป็นของขวัญปีใหม่ให้กับนักเรียนโรงเรียนตำรวจตระเวนชายแดนพร้อมกัน”\r\n               นายก่อกิจ กล่าวเพิ่มเติมว่า สำหรับโครงการไปรษณีย์ reBox เปลี่ยนกล่อง/ซองเป็นของขวัญปีใหม่ 2564 นั้น ทางไปรษณีย์จะร่วมกับเอสซีจี แพคเกจจิ้งฯ รีไซเคิลกล่องและซองให้เป็นชุดโต๊ะเก้าอี้เพื่อให้นักเรียนโรงเรียนตำรวจตระเวนชายแดนได้ใช้ในกิจกรรมการเรียนการสอน โดยการผลิตชุดโต๊ะเก้าอี้ 1 ชุด ต้องใช้ปริมาณกล่องเฉลี่ย 650 กิโลกรัม นำมาอัดให้มีความแข็งแรงทนทาน เสมือนโต๊ะที่ผลิตจากไม้จริงเพื่อให้สามารถใช้ได้ในระยะยาว และเป็นประโยชน์กับการศึกษาต่อไป นายก่อกิจ กล่าวทิ้งท้าย', '', 'pr,news,korkij,ก่อกิจ,reBox', '2020-09-09', '', 'PR News', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `for_table` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `for_field` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `data` tinytext COLLATE utf8mb4_general_ci NOT NULL,
  `rank` tinyint(2) UNSIGNED ZEROFILL NOT NULL DEFAULT '50',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `logs` mediumtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `for_table`, `for_field`, `data`, `rank`, `active`, `logs`) VALUES
(1, 'opt-type-data', 'options', 'type', 'data', 10, 1, ''),
(2, 'opt-type-array', 'options', 'type', 'array', 20, 1, ''),
(3, 'opt-type-arrays', 'options', 'type', 'arrays', 30, 1, ''),
(4, 'opt-type-json', 'options', 'type', 'json', 40, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_ref` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `registered` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `logs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `code`, `name`, `card_id`, `ad_ref`, `token`, `registered`, `last_login`, `logs`) VALUES
(1, 'preedeew@gmail.com', 'ADM00001', 'Developer Admin', '3100800122775', '', '', '2020-09-12 10:01:03', '2020-09-12 10:01:03', ''),
(2, 'pw@kudson.com', 'US', 'Test User ', '1111111111115', '', '', '2020-09-12 10:01:25', '2020-09-12 10:01:25', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `name` (`name`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `status` (`status`),
  ADD KEY `author` (`author`),
  ADD KEY `categories` (`categories`);
ALTER TABLE `content` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `content` ADD FULLTEXT KEY `tags` (`tags`);
ALTER TABLE `content` ADD FULLTEXT KEY `content` (`content`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `for_table` (`for_table`),
  ADD KEY `for_field` (`for_field`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
