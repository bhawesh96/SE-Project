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
  `AID` varchar(20) NOT NULL,
  `PID` varchar(20) NOT NULL,
  `DID` varchar(20) NOT NULL,
  `Appointment_Date` date NOT NULL,
  `Slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor details`
--

CREATE TABLE IF NOT EXISTS `doctor details` (
  `DID` varchar(20) NOT NULL,
  `First Name` varchar(20) NOT NULL,
  `Last Name` varchar(20) DEFAULT NULL,
  `Phone Number` int(10) NOT NULL,
  `Category` varchar(30) NOT NULL,
  `FEES` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor non-availability`
--

CREATE TABLE IF NOT EXISTS `doctor non-availability` (
  `DID` varchar(20) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient details`
--

CREATE TABLE IF NOT EXISTS `patient details` (
  `PID` varchar(20) NOT NULL,
  `First Name` varchar(20) NOT NULL,
  `Last Name` varchar(20) DEFAULT NULL,
  `Phone Number` int(10) NOT NULL,
  `Date Of Birth` date NOT NULL,
  `Sex` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient history`
--

CREATE TABLE IF NOT EXISTS `patient history` (
  `PID` varchar(20) NOT NULL,
  `DID` varchar(20) NOT NULL,
  `Time Slot` int(1) NOT NULL,
  `Description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time slots`
--

CREATE TABLE IF NOT EXISTS `time slots` (
  `Slot` int(1) NOT NULL,
  `Start Time` int(11) NOT NULL,
  `End Time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time slots`
--

INSERT INTO `time slots` (`Slot`, `Start Time`, `End Time`) VALUES
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
  ADD PRIMARY KEY (`AID`),
  ADD KEY `PatientID` (`PID`),
  ADD KEY `DoctorID` (`DID`);

--
-- Indexes for table `doctor details`
--
ALTER TABLE `doctor details`
  ADD PRIMARY KEY (`DID`),
  ADD UNIQUE KEY `DoctorPh` (`Phone Number`);

--
-- Indexes for table `doctor non-availability`
--
ALTER TABLE `doctor non-availability`
  ADD KEY `DoctorID` (`DID`);

--
-- Indexes for table `patient details`
--
ALTER TABLE `patient details`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `patient history`
--
ALTER TABLE `patient history`
  ADD KEY `PatientID` (`PID`),
  ADD KEY `DoctorID` (`DID`);

--
-- Indexes for table `time slots`
--
ALTER TABLE `time slots`
  ADD PRIMARY KEY (`Slot`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
