-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 02:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mather&child`
--

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `sex` varchar(200) NOT NULL,
  `weight` varchar(200) NOT NULL,
  `height` varchar(200) NOT NULL,
  `date_of_bith` date NOT NULL,
  `place_of_birth` varchar(200) NOT NULL,
  `hospital` varchar(200) NOT NULL,
  `mother` varchar(200) NOT NULL,
  `doctor_ID` int(11) NOT NULL,
  `description` text NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `child`
--

INSERT INTO `child` (`ID`, `Name`, `sex`, `weight`, `height`, `date_of_bith`, `place_of_birth`, `hospital`, `mother`, `doctor_ID`, `description`, `regDate`) VALUES
(9, 'omar  ', 'male ', '3kg ', '20cm ', '2024-05-05', 'mugdisho ', 'kalkal ', 'shukri ', 1, 'shuban  ', '2024-06-05 17:42:26'),
(10, 'ali  ', 'male ', '2kg ', '18cm ', '2024-05-06', 'mogdisho ', 'digfeer ', 'shukri ', 1, 'calool xanuun ', '2024-06-05 17:53:19'),
(11, 'ali abshir ', 'male ', '2kg ', '18cm ', '2024-05-06', 'mogdisho ', 'digfeer ', 'shukri ', 1, 'calool xanuun ', '2024-06-05 17:53:51'),
(13, 'eyman ', 'famel ', '100kg ', '60cm ', '2000-01-01', 'muqdisho ', 'kalkal ', 'umaeyma ', 1, 'lafa layahy ', '2024-06-07 06:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Spatialized` varchar(50) NOT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`ID`, `Name`, `Phone`, `Email`, `Spatialized`, `regDate`) VALUES
(1, 'omar', '612444546', 'omar@gmail.com', 'bons', '2024-06-02 10:59:57'),
(47, 'ziyad ', '76166637 ', 'ziyad@gmail ', 'boes', '2024-06-07 13:45:01'),
(48, 'ziyad ', '76166637 ', 'ziyad@gmail ', 'boes', '2024-06-07 13:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Phone` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `levelEducation` varchar(200) NOT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `Name`, `Phone`, `Email`, `title`, `salary`, `levelEducation`, `regDate`) VALUES
(27, 'omar ', '72537374 ', 'omar@gmail.com ', 'ICT OFFICER ', 500, 'bacholar', '2024-06-05 21:36:08');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `production_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` text NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Name`, `production_date`, `expiry_date`, `qty`, `price`, `description`, `regDate`) VALUES
(1, 'hasas', '2024-02-05', '2025-05-08', 200, 500, 'very good', '2024-06-02 08:02:00'),
(3, 'gffhghgghjjh ', '0000-00-00', '0000-00-00', 0, 0, 'jhhjjj', '2024-06-03 09:00:29'),
(4, 'malmalado ', '2024-02-02', '2025-05-05', 102, 50, 'verygood', '2024-06-06 09:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `reqDate` datetime NOT NULL DEFAULT current_timestamp(),
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `pass`, `reqDate`, `Email`) VALUES
(14, 'omar ', '123 ', '2024-05-31 17:24:10', 'abshir'),
(15, 'ahmed', '123', '2024-06-01 11:59:40', 'omar@gmail.com'),
(18, 'xasan', '123', '2024-06-03 05:18:47', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `doctor_id` (`doctor_ID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `child`
--
ALTER TABLE `child`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `test` FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
