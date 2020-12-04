-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2020 at 05:31 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `date_of_member`
--

CREATE TABLE `date_of_member` (
  `Register_date` varchar(15) NOT NULL,
  `EXP_date` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `date_of_member`
--

INSERT INTO `date_of_member` (`Register_date`, `EXP_date`) VALUES
('01/02/2020', '01/02/2021'),
('02/01/2020', '02/01/2021'),
('15/01/2020', '15/01/2021');

-- --------------------------------------------------------

--
-- Table structure for table `kind_of_member`
--

CREATE TABLE `kind_of_member` (
  `Member_code` varchar(30) NOT NULL,
  `Member_type` varchar(30) NOT NULL,
  `Register_date` varchar(15) NOT NULL,
  `User_phone_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kind_of_member`
--

INSERT INTO `kind_of_member` (`Member_code`, `Member_type`, `Register_date`, `User_phone_number`) VALUES
('I12', 'Insider', '15/01/2020', '0895798979'),
('N03', 'Nisit', '01/02/2020', '0876543210');

-- --------------------------------------------------------

--
-- Table structure for table `parking`
--

CREATE TABLE `parking` (
  `Park_code` varchar(10) NOT NULL,
  `Parking_date` varchar(15) NOT NULL,
  `Entry_time` varchar(15) NOT NULL,
  `Time_out` varchar(15) NOT NULL,
  `Building_name` varchar(30) NOT NULL,
  `User_phone_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parking`
--

INSERT INTO `parking` (`Park_code`, `Parking_date`, `Entry_time`, `Time_out`, `Building_name`, `User_phone_number`) VALUES
('002', '02/02/2020', '17:50', '18:30', 'Vipa', '0876543210'),
('007', '02/02/2020', '13:32', '19:22', '์NgamWongWan1', '0895798979'),
('010', '02/02/2020', '12:25', '14:56', '์NgamWongWan2', '0801001011');

-- --------------------------------------------------------

--
-- Table structure for table `parking_building`
--

CREATE TABLE `parking_building` (
  `Building_name` varchar(30) NOT NULL,
  `Number_of_employees` int(5) NOT NULL,
  `Head_of_building` varchar(60) NOT NULL,
  `Capacity` int(5) NOT NULL,
  `Free_space` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parking_building`
--

INSERT INTO `parking_building` (`Building_name`, `Number_of_employees`, `Head_of_building`, `Capacity`, `Free_space`) VALUES
('Vipa', 10, '์Ning', 50, 25),
('์NgamWongWan1', 15, 'Somchai', 100, 32),
('์NgamWongWan2', 13, 'Suradeth', 75, 20);

-- --------------------------------------------------------

--
-- Table structure for table `price_of_member`
--

CREATE TABLE `price_of_member` (
  `Member_type` varchar(30) NOT NULL,
  `Member_price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price_of_member`
--

INSERT INTO `price_of_member` (`Member_type`, `Member_price`) VALUES
('Insider', 1500),
('Nisit', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `Receipt_code` varchar(30) NOT NULL,
  `Time _of _receipt` varchar(15) NOT NULL,
  `Date_of_receipt` varchar(15) NOT NULL,
  `Reference_code` varchar(30) NOT NULL,
  `Tax_code` varchar(30) NOT NULL,
  `POS_number` varchar(30) NOT NULL,
  `Format` varchar(30) NOT NULL CHECK (`Format` in ('student','outsider','insider','member')),
  `Parking_fee` int(5) NOT NULL,
  `Fine` int(5) NOT NULL,
  `Discount` int(5) NOT NULL,
  `Paid` int(5) NOT NULL,
  `Latest_payment` int(5) NOT NULL,
  `User_phone_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receipt`
--

INSERT INTO `receipt` (`Receipt_code`, `Time _of _receipt`, `Date_of_receipt`, `Reference_code`, `Tax_code`, `POS_number`, `Format`, `Parking_fee`, `Fine`, `Discount`, `Paid`, `Latest_payment`, `User_phone_number`) VALUES
('43214', '19:22', '02/02/2020', 'AD44', 'Y565', 'SA6', 'insider', 150, 0, 0, 0, 150, '0895798979'),
('70745', '18:30', '02/02/2020', 'EO78', 'S777', 'EX7', 'student', 40, 0, 0, 0, 40, '0876543210'),
('87658', '14:56', '02/02/2020', 'AO49', 'I789', 'ZD8', 'outsider', 80, 0, 0, 0, 80, '0801001011');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Employee_number` varchar(10) NOT NULL,
  `Affiliated_Company` varchar(30) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Employee_name` varchar(30) NOT NULL,
  `Employee_surname` varchar(30) NOT NULL,
  `Age` int(3) NOT NULL,
  `Salary` int(10) NOT NULL,
  `Education_background` varchar(30) NOT NULL,
  `Position` varchar(30) NOT NULL CHECK (`Position` in ('supervisor','security guard')),
  `Building_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Employee_number`, `Affiliated_Company`, `Address`, `Employee_name`, `Employee_surname`, `Age`, `Salary`, `Education_background`, `Position`, `Building_name`) VALUES
('0812345678', 'Boom', 'Bangkok', 'shin', 'chan', 32, 75000, 'Ph.D.', 'supervisor', '์NgamWongWan1'),
('0818181101', 'Kaset', 'Bangkok', 'Alif', 'ja', 45, 50000, 'Bachelor', 'security guard', 'Vipa'),
('0895794329', 'BFC', 'Bangkok', 'Bentucky', 'FlyConor', 25, 25000, 'Senior High school', 'security guard', '์NgamWongWan2');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `User_phone_number` varchar(10) NOT NULL,
  `Register` varchar(10) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `User_surname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`User_phone_number`, `Register`, `Username`, `User_surname`) VALUES
('0801001011', 'D66', 'Neab', 'Happylife'),
('0876543210', 'R01', 'Pok', 'ky'),
('0895798979', 'B01', 'Nana', 'cute');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `Register` varchar(10) NOT NULL,
  `Status` varchar(20) NOT NULL CHECK (`Status` in ('student','outsider','insider','member'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`Register`, `Status`) VALUES
('B01', 'student'),
('D66', 'outsider'),
('R01', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `date_of_member`
--
ALTER TABLE `date_of_member`
  ADD PRIMARY KEY (`Register_date`);

--
-- Indexes for table `kind_of_member`
--
ALTER TABLE `kind_of_member`
  ADD PRIMARY KEY (`Member_code`),
  ADD KEY `Register date` (`Register_date`),
  ADD KEY `User phone number` (`User_phone_number`),
  ADD KEY `Member_type` (`Member_type`);

--
-- Indexes for table `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`Park_code`),
  ADD KEY `User phone number` (`User_phone_number`),
  ADD KEY `Building name` (`Building_name`);

--
-- Indexes for table `parking_building`
--
ALTER TABLE `parking_building`
  ADD PRIMARY KEY (`Building_name`);

--
-- Indexes for table `price_of_member`
--
ALTER TABLE `price_of_member`
  ADD PRIMARY KEY (`Member_type`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`Receipt_code`),
  ADD UNIQUE KEY `Reference code` (`Reference_code`),
  ADD UNIQUE KEY `Tax code` (`Tax_code`),
  ADD UNIQUE KEY `POS number` (`POS_number`),
  ADD KEY `User phone number` (`User_phone_number`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Employee_number`),
  ADD KEY `Building_name` (`Building_name`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`User_phone_number`),
  ADD UNIQUE KEY `Register` (`Register`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`Register`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kind_of_member`
--
ALTER TABLE `kind_of_member`
  ADD CONSTRAINT `kind_of_member_ibfk_1` FOREIGN KEY (`Register_date`) REFERENCES `date_of_member` (`Register_date`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kind_of_member_ibfk_2` FOREIGN KEY (`User_phone_number`) REFERENCES `user_profile` (`User_phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kind_of_member_ibfk_3` FOREIGN KEY (`Member_type`) REFERENCES `price_of_member` (`Member_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parking`
--
ALTER TABLE `parking`
  ADD CONSTRAINT `parking_ibfk_1` FOREIGN KEY (`User_phone_number`) REFERENCES `user_profile` (`User_phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parking_ibfk_2` FOREIGN KEY (`Building_name`) REFERENCES `parking_building` (`Building_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`User_phone_number`) REFERENCES `user_profile` (`User_phone_number`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Building_name`) REFERENCES `parking_building` (`Building_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_status`
--
ALTER TABLE `user_status`
  ADD CONSTRAINT `user_status_ibfk_1` FOREIGN KEY (`Register`) REFERENCES `user_profile` (`Register`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
