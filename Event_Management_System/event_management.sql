-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2025 at 01:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Username`, `Password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `eventregistrations`
--

CREATE TABLE `eventregistrations` (
  `RegistrationID` int(11) NOT NULL,
  `EventID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `RegistrationDate` datetime DEFAULT current_timestamp(),
  `Status` varchar(50) DEFAULT 'Registered'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `eventregistrations`
--

INSERT INTO `eventregistrations` (`RegistrationID`, `EventID`, `UserID`, `RegistrationDate`, `Status`) VALUES
(1, 1, 1, '2025-04-29 15:28:11', 'Registered'),
(2, 3, 1, '2025-04-29 15:29:44', 'Registered'),
(3, 5, 1, '2025-04-30 14:42:21', 'Registered'),
(4, 2, 1, '2025-04-30 14:52:22', 'Registered'),
(5, 2, 3, '2025-05-04 15:53:07', 'Registered'),
(6, 1, 4, '2025-05-04 16:17:25', 'Registered');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `EventID` int(11) NOT NULL,
  `EventName` varchar(200) NOT NULL,
  `Description` text DEFAULT NULL,
  `EventDate` date NOT NULL,
  `Venue` varchar(200) DEFAULT NULL,
  `OrganizerID` int(11) DEFAULT NULL,
  `TotalSeats` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`EventID`, `EventName`, `Description`, `EventDate`, `Venue`, `OrganizerID`, `TotalSeats`, `CreatedDate`) VALUES
(1, 'Hockey', 'Play hockey', '2025-06-12', 'GSFC', NULL, 48, '2025-04-29 15:26:48'),
(2, 'Cricket', 'Play Cricket', '2025-06-12', 'GSFC', NULL, 48, '2025-04-29 15:27:21'),
(3, 'Volley Ball', 'Play Volley Ball', '2025-06-12', 'GSFC', NULL, 49, '2025-04-29 15:27:50'),
(5, 'Kabbadi', 'Play', '2025-06-12', 'GSFC', NULL, 49, '2025-04-30 13:04:33'),
(6, 'Baseball', 'Play Baseball', '2025-06-12', 'GSFC', NULL, 25, '2025-04-30 14:54:16'),
(8, 'Ludo', 'Must be 4 player', '2025-06-12', 'Anviksha', NULL, 12, '2025-05-04 16:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FullName` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `FullName`, `Email`, `Phone`, `Role`) VALUES
(1, 'Pranav', 'Pranav@123', 'Pranav Panchal', 'pranavpanchal192@gmail.com', '9512271919', NULL),
(3, 'Darshan', 'Darshan@123', 'Darshan Patel', '22bt04089@gsfcuniversity.ac.in', '8745874585', NULL),
(4, 'Kushal', 'Kushal@123', 'Kushal Parikh', '22bt04085@gsfcuniversity.ac.in', '7458745885', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `VenueID` int(11) NOT NULL,
  `VenueName` varchar(200) NOT NULL,
  `Address` text DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `eventregistrations`
--
ALTER TABLE `eventregistrations`
  ADD PRIMARY KEY (`RegistrationID`),
  ADD KEY `EventID` (`EventID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `OrganizerID` (`OrganizerID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`VenueID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eventregistrations`
--
ALTER TABLE `eventregistrations`
  MODIFY `RegistrationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `VenueID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `eventregistrations`
--
ALTER TABLE `eventregistrations`
  ADD CONSTRAINT `eventregistrations_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `events` (`EventID`),
  ADD CONSTRAINT `eventregistrations_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`OrganizerID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
