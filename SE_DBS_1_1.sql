-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2017 at 04:47 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital appointment booking system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE IF NOT EXISTS `appointments` (
  `appID` varchar(20) NOT NULL,
  `patID` varchar(20) NOT NULL,
  `drID` varchar(20) NOT NULL,
  `app_date` date NOT NULL,
  `slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor details`
--

CREATE TABLE IF NOT EXISTS `drDetails` (
  `drID` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `phone` int(10) NOT NULL,
  `category` varchar(30) NOT NULL,
  `fees` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor non-availability`
--

CREATE TABLE IF NOT EXISTS `drNA` (
  `drID` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient details`
--

CREATE TABLE IF NOT EXISTS `patDetails` (
  `patID` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `phone` int(10) NOT NULL,
  `dob` date NOT NULL,
  `sex` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient history`
--

CREATE TABLE IF NOT EXISTS `patHistory` (
  `patID` varchar(20) NOT NULL,
  `drID` varchar(20) NOT NULL,
  `time_slot` int(1) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time slots`
--

CREATE TABLE IF NOT EXISTS `timeSlot` (
  `slot` int(1) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time slots`
--

INSERT INTO `timeSlot` (`slot`, `start_time`, `end_time`) VALUES
(1, 9, 12),
(2, 13, 16),
(3, 16, 20),
(4, 21, 24);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appID`),
  ADD KEY `PatientID` (`patID`),
  ADD KEY `DoctorID` (`drID`);

--
-- Indexes for table `doctor details`
--
ALTER TABLE `drDetails`
  ADD PRIMARY KEY (`drID`),
  ADD UNIQUE KEY `DoctorPh` (`phone`);

--
-- Indexes for table `doctor non-availability`
--
ALTER TABLE `drNA`
  ADD KEY `DoctorID` (`drID`);

--
-- Indexes for table `patient details`
--
ALTER TABLE `patDetails`
  ADD PRIMARY KEY (`patID`);

--
-- Indexes for table `patient history`
--
ALTER TABLE `patHistory`
  ADD KEY `PatientID` (`patID`),
  ADD KEY `DoctorID` (`drID`);

--
-- Indexes for table `time slots`
--
ALTER TABLE `timeSlot`
  ADD PRIMARY KEY (`slot`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
