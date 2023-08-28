-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 07:54 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) DEFAULT NULL,
  `AdminPassword` varchar(255) DEFAULT NULL,
  `AdminEmailId` varchar(255) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `userType`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'phpgurukulofficial@gmail.com', 1, '2021-05-26 18:30:00', '2023-06-17 21:13:02'),
(3, 'subadmin', 'f925916e2754e5e03f75dd58a5733251', 'sudamin@gmail.in', 0, '2021-11-10 18:28:11', NULL),
(4, 'suadmin2', 'f925916e2754e5e03f75dd58a5733251', 'sbadmin@test.com', 0, '2021-11-10 18:28:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 'Sports', 'Related to sports news', '2021-06-05 18:30:00', '2021-06-13 18:30:00', 1),
(5, 'Entertainment', 'Entertainment related  News', '2021-06-13 18:30:00', '2021-06-13 18:30:00', 1),
(6, 'Politics', 'Politics', '2021-06-21 18:30:00', '0000-00-00 00:00:00', 1),
(7, 'Business', 'Business', '2021-06-21 18:30:00', '0000-00-00 00:00:00', 1),
(9, 'General', 'this is general news that will be aggregated on the homepage.', '2023-06-18 00:52:28', NULL, 1),
(10, 'Science', 'science news', '2023-06-18 00:52:49', NULL, 1),
(11, 'Health ', 'Health', '2023-06-18 00:53:20', NULL, 1),
(12, 'Tech', 'tech news foe the enthusiasists', '2023-06-18 00:53:58', NULL, 1),
(13, 'Gaming', 'gaming news for you', '2023-06-18 00:54:25', NULL, 1),
(14, 'Kenyan News', 'this is news for kenyans by kenyans', '2023-06-18 02:44:54', NULL, 1),
(15, 'Global', 'news from all around the world', '2023-06-18 02:46:03', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'About IT News Portal', '<div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\">Welcome to our About page!</span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\"><br></span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\">At News Portal, we are dedicated to providing you with the most up-to-date and relevant information on a wide range of topics. Our mission is to deliver accurate and insightful content that enriches your knowledge and keeps you informed.</span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\"><br></span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\">Our team of experienced writers and researchers work tirelessly to gather and curate the latest news, trends, and insights across various domains. Whether you\'re interested in current events, technology, business, health, or entertainment, we have you covered.</span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\"><br></span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\">We strive to present information in a clear and accessible manner, making it easy for you to navigate through articles and find the content that interests you the most. Our user-friendly interface ensures a seamless browsing experience, allowing you to discover new topics and dive deeper into subjects that matter to you.</span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\"><br></span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\">We value the trust you place in us as your go-to source for reliable information. We adhere to strict editorial standards and prioritize accuracy, objectivity, and integrity in our content creation process. Our commitment to excellence ensures that you receive credible and trustworthy information every time you visit our website.</span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\"><br></span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\">Whether you\'re a student conducting research, a professional staying informed, or simply a curious individual seeking knowledge,&nbsp;</span></font><span style=\"color: rgb(123, 136, 152); font-family: &quot;Mercury SSm A&quot;, &quot;Mercury SSm B&quot;, Georgia, Times, &quot;Times New Roman&quot;, &quot;Microsoft YaHei New&quot;, &quot;Microsoft Yahei&quot;, å¾®è½¯é›…é»‘, å®‹ä½“, SimSun, STXihei, åŽæ–‡ç»†é»‘, serif; font-size: 26px;\">News Portal</span><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\">&nbsp;is here to serve your informational needs. We believe in the power of knowledge to inspire, empower, and transform lives.</span></font></div><div><font color=\"#7b8898\" face=\"Times New Roman\"><span style=\"font-size: 26px;\"><br></span></font></div><div><font face=\"Times New Roman\"><font color=\"#7b8898\"><span style=\"font-size: 26px;\">Thank you for choosing&nbsp;</span></font><span style=\"color: rgb(123, 136, 152); font-size: 26px;\">News Portal</span><font color=\"#7b8898\"><span style=\"font-size: 26px;\">&nbsp;as your trusted source of information. We are honored to be a part of your journey towards understanding the world and staying informed.</span></font></font></div>', '2021-06-29 18:30:00', '2023-06-18 15:47:18'),
(2, 'contactus', 'Contact Details', '<p><br></p><p><b>Address :&nbsp; </b>Kenya</p><p><b>Phone Number : </b>+254711201903</p><p><b>Email -id : </b>julietwambuku@gmail.com</p>', '2021-06-29 18:30:00', '2023-06-17 21:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL,
  `viewCounter` int(11) DEFAULT NULL,
  `postedBy` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) DEFAULT NULL,
  `SubCatDescription` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 14, 'The Guardian', 'https://www.theguardian.com/world/kenya/rss', '2021-06-21 18:30:00', '2023-06-18 02:45:10', 1),
(4, 14, 'Kenyans', 'https://www.kenyans.co.ke/feeds/news?_wrapper_format=html', '2021-06-29 18:30:00', '2023-06-18 02:45:23', 1),
(5, 14, 'Business Daily', 'https://www.businessdailyafrica.com/service/rss/bd/1939132/feed.rss', '2021-06-29 18:30:00', '2023-06-18 02:48:25', 1),
(6, 14, 'K24', 'https://www.k24tv.co.ke/category/news/feed/', '2021-06-30 18:30:00', '2023-06-18 02:48:13', 1),
(7, 14, 'KBC', 'https://www.kbc.co.ke/feed/', '2021-06-30 18:30:00', '2023-06-18 02:47:55', 1),
(11, 15, 'CNN', 'http://rss.cnn.com/rss/cnn_topstories.rss', '2023-06-18 02:39:28', '2023-06-18 02:48:38', 1),
(12, 9, 'abc NEWS ', 'https://abcnews.go.com/abcnews/usheadlines', '2023-06-18 02:43:27', NULL, 1),
(13, 15, 'Yahoo ', 'https://news.yahoo.com/rss/us', '2023-06-18 02:56:21', NULL, 1),
(14, 7, 'NYtimes', 'https://rss.nytimes.com/services/xml/rss/nyt/Business.xml', '2023-06-18 02:58:14', '2023-06-18 02:58:47', 1),
(15, 7, 'Washington Post', 'https://feeds.washingtonpost.com/rss/rss_wonkblog', '2023-06-18 03:00:27', NULL, 1),
(16, 7, 'Business standard', 'https://www.business-standard.com/rss/latest.rss', '2023-06-18 03:01:45', NULL, 1),
(17, 7, 'Harvard Business', 'http://feeds.harvardbusiness.org/harvardbusiness?format=xml', '2023-06-18 03:02:59', NULL, 1),
(18, 11, 'CNN', 'http://rss.cnn.com/rss/cnn_health.rss', '2023-06-18 03:03:46', NULL, 1),
(19, 11, 'NYtimes', 'https://rss.nytimes.com/services/xml/rss/nyt/Health.xml', '2023-06-18 03:04:07', NULL, 1),
(20, 3, 'FOX news', 'http://feeds.foxnews.com/foxnews/sports', '2023-06-18 03:05:21', NULL, 1),
(21, 3, 'ESPN', 'https://www.latimes.com/sports/rss2.0.xml', '2023-06-18 03:05:43', NULL, 1),
(22, 12, 'CNN', 'http://rss.cnn.com/rss/cnn_tech.rss', '2023-06-18 03:05:59', NULL, 1),
(23, 12, 'NYtimes', 'https://rss.nytimes.com/services/xml/rss/nyt/Technology.xml', '2023-06-18 03:06:16', NULL, 1),
(24, 13, 'engadget', 'https://www.engadget.com/tag/@gaming/rss.xml', '2023-06-18 03:18:02', NULL, 1),
(26, 10, 'the Hindu ', 'https://www.thehindu.com/sci-tech/science/?service=rss', '2023-06-18 03:19:26', NULL, 1),
(27, 10, 'business standard', 'https://www.business-standard.com/rss/technology-108.rss', '2023-06-18 03:20:02', NULL, 1),
(28, 6, 'CNN', 'http://rss.cnn.com/rss/cnn_allpolitics.rss', '2023-06-18 03:20:45', NULL, 1),
(29, 6, 'buzz feed', 'https://www.buzzfeed.com/politics.xml', '2023-06-18 03:21:12', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AdminUserName` (`AdminUserName`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postcatid` (`CategoryId`),
  ADD KEY `postsucatid` (`SubCategoryId`),
  ADD KEY `subadmin` (`postedBy`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`),
  ADD KEY `catid` (`CategoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD CONSTRAINT `pid` FOREIGN KEY (`postId`) REFERENCES `tblposts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD CONSTRAINT `postcatid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `postsucatid` FOREIGN KEY (`SubCategoryId`) REFERENCES `tblsubcategory` (`SubCategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `subadmin` FOREIGN KEY (`postedBy`) REFERENCES `tbladmin` (`AdminUserName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD CONSTRAINT `catid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
