-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 06, 2019 at 07:02 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mspo`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `coId` int(11) NOT NULL,
  `coName` varchar(100) NOT NULL,
  `coAdd` varchar(100) DEFAULT NULL,
  `coTel` varchar(100) DEFAULT NULL,
  `deactivated` mediumint(9) NOT NULL DEFAULT 0,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`coId`, `coName`, `coAdd`, `coTel`, `deactivated`, `createdDate`) VALUES
(1, 'saferack', 'bukit jelutong', NULL, 0, '2019-07-06 09:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `coId` int(11) NOT NULL,
  `custId` int(11) NOT NULL,
  `custNo` varchar(100) NOT NULL,
  `custName` varchar(100) NOT NULL,
  `custIC` varchar(100) NOT NULL,
  `custTel` varchar(100) NOT NULL,
  `custAdd1` varchar(100) DEFAULT NULL,
  `custAdd2` varchar(100) DEFAULT NULL,
  `custAdd3` varchar(100) DEFAULT NULL,
  `deactivated` smallint(6) NOT NULL DEFAULT 0,
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `disabled` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lands`
--

CREATE TABLE `lands` (
  `landId` int(11) NOT NULL,
  `lotNo` varchar(200) NOT NULL,
  `titleNo` varchar(200) NOT NULL,
  `area` double NOT NULL,
  `custId` int(11) NOT NULL,
  `usageOfLand` varchar(200) NOT NULL,
  `typeOfCondition` varchar(200) NOT NULL,
  `gpsLocationLng` double NOT NULL,
  `gpsLocationLat` double NOT NULL,
  `coId` int(11) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp(),
  `disabled` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `userpassword` varchar(200) NOT NULL,
  `displayname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `deactivated` smallint(6) NOT NULL DEFAULT 0,
  `administrator` smallint(6) NOT NULL,
  `coId` int(11) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`coId`) USING BTREE,
  ADD KEY `coId` (`coId`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`custId`),
  ADD UNIQUE KEY `uniq_coId_custNo` (`coId`,`custNo`) USING BTREE,
  ADD UNIQUE KEY `uniq_coId_custIC` (`coId`,`custIC`) USING BTREE,
  ADD KEY `custId` (`custId`);

--
-- Indexes for table `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`landId`) USING BTREE,
  ADD UNIQUE KEY `uniq_landId_coId` (`landId`,`coId`) USING BTREE,
  ADD KEY `landId` (`landId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`) USING BTREE,
  ADD UNIQUE KEY `userName` (`username`) USING BTREE,
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `coId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `custId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lands`
--
ALTER TABLE `lands`
  MODIFY `landId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
