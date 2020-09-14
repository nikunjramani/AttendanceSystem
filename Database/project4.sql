-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 11, 2020 at 07:26 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project4`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `aid` int(11) NOT NULL,
  `enrollment` varchar(50) NOT NULL,
  `times` datetime NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `class_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`aid`, `enrollment`, `times`, `subject_name`, `class_name`) VALUES
(15, '180773107045', '2019-08-10 01:06:44', 'php', 'a 35'),
(16, '180773107045', '2019-08-10 01:17:01', 'PHP', 'A 12'),
(17, '180773107010', '2020-04-28 13:02:48', 'a', 'a'),
(18, '180773107045', '2020-04-28 13:02:48', 'a', 'a'),
(19, '180773107045', '2020-04-28 13:05:56', 'a', 'a'),
(20, '180773107045', '2020-04-28 13:06:56', 'a', 'a'),
(21, '180773107045', '2020-04-28 13:07:42', 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` int(11) NOT NULL,
  `camera-no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lecture_record`
--

CREATE TABLE `lecture_record` (
  `lrid` int(11) NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `division` varchar(20) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecture_record`
--

INSERT INTO `lecture_record` (`lrid`, `faculty_name`, `subject_name`, `division`, `time`) VALUES
(3, 'NA', 'ADA', 'B', '2019-08-10 01:17:01'),
(4, 'MKD', 'DE', 'B', '2019-08-28 00:00:00'),
(5, 'a', 'a', 'a', '2020-04-28 13:02:48'),
(6, 'a', 'a', 'a', '2020-04-28 13:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `nid` int(11) NOT NULL,
  `notice` varchar(500) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `rid` int(11) NOT NULL,
  `exam_name` varchar(50) NOT NULL,
  `enrollment` varchar(50) NOT NULL,
  `sub_marks` varchar(500) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`rid`, `exam_name`, `enrollment`, `sub_marks`, `date`) VALUES
(1, 'Mid Sem', '180773107045', '[{\"sub\":\"java\",\"total\":40,\"obtain\":30},{\"sub\":\"java\",\"total\":40,\"obtain\":30},{\"sub\":\"java\",\"total\":40,\"obtain\":30},{\"sub\":\"java\",\"total\":40,\"obtain\":30}]', '2019-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `sid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rollno` int(11) NOT NULL,
  `enrollment` decimal(20,0) NOT NULL,
  `division` varchar(10) NOT NULL,
  `mobileno` decimal(11,0) NOT NULL,
  `address` varchar(100) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`sid`, `name`, `rollno`, `enrollment`, `division`, `mobileno`, `address`, `semester`) VALUES
(16, 'Nikunj Ramani', 23, '180773107045', 'B', '7624069124', 'keshavala', 5),
(17, '1', 1, '1', '1', '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `time_table`
--

CREATE TABLE `time_table` (
  `tid` int(11) NOT NULL,
  `day` varchar(50) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `class_name` varchar(20) NOT NULL,
  `time` varchar(50) NOT NULL,
  `division` varchar(20) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_table`
--

INSERT INTO `time_table` (`tid`, `day`, `subject_name`, `faculty_name`, `class_name`, `time`, `division`, `semester`) VALUES
(1, 'Monday', 'DE', 'NKS', '218', '8:00 - 8:50', 'B', 5),
(2, 'Monday', 'ADA', 'MJD', 'B 205', '8:50 -9:40', 'B', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `lecture_record`
--
ALTER TABLE `lecture_record`
  ADD PRIMARY KEY (`lrid`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `time_table`
--
ALTER TABLE `time_table`
  ADD PRIMARY KEY (`tid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lecture_record`
--
ALTER TABLE `lecture_record`
  MODIFY `lrid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `time_table`
--
ALTER TABLE `time_table`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
