-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2021 at 09:48 AM
-- Server version: 8.0.26
-- PHP Version: 8.0.10
--
-- Database: `users`
--
CREATE DATABASE `ccny`;

use `ccny`;
-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `sectionNo` int NOT NULL,
  `courseID` int NOT NULL,
  `instructorID` int NOT NULL,
  `emplid` int NOT NULL,
  `average_rating` float NOT NULL,
  `number_of_students_enrolled` int NOT NULL,
  `max_capacity` int NOT NULL,
  `number_of_credits` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`sectionNo`, `courseID`, `instructorID`, `emplid`, `average_rating`, `number_of_students_enrolled`, `max_capacity`, `number_of_credits`) VALUES
(1, 12345, 23456789, 12345678, 4, 27, 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseID` int NOT NULL,
  `courseTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseID`, `courseTitle`, `department`) VALUES
(12345, 'Software Engineering', 'Computer Science'),
(54321, 'Game Workshop', 'Art');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `instructorID` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employment_status` enum('OK','WARNED','FIRED','') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `number_of_warnings` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructorID`, `name`, `email`, `username`, `password`, `employment_status`, `number_of_warnings`) VALUES
(13576428, 'Bob Johnson', 'bjohnson@citymail.cuny.edu', 'bjohnson', 'test', 'WARNED', 1),
(23456789, 'Jie Wei', 'jwei@citymail.cuny.edu', 'jwei', 'test', 'OK', 0);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `emplid` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `overall_GPA` float NOT NULL,
  `enrollment_status` enum('ENROLLED','WARNED','SUSPENDED','TERMINATED') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `honor_roll_status` enum('REGULAR','HONOR_ROLL') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `graduation_app` enum('INCOMPLETE','WARNED','GRADUATED','') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`emplid`, `name`, `email`, `username`, `password`, `overall_GPA`, `enrollment_status`, `honor_roll_status`, `graduation_app`) VALUES
(12345678, 'Liana Hasan', 'lhasan000@citymail.cuny.edu', 'lhasan000', 'test', 3.5, 'ENROLLED', 'REGULAR', 'INCOMPLETE'),
(87654321, 'John Smith', 'jsmith@citymail.cuny.edu', 'jsmith', 'test', 3.4, 'WARNED', 'REGULAR', 'INCOMPLETE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`sectionNo`),
  ADD KEY `courseID` (`courseID`),
  ADD KEY `classes_ibfk_1` (`instructorID`),
  ADD KEY `emplid` (`emplid`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`instructorID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`emplid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `sectionNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54322;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `instructorID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23456790;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `emplid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87654322;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`emplid`) REFERENCES `students` (`emplid`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
