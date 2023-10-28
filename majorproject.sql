-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2023 at 08:44 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `majorproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `token` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `token`) VALUES
(2, 'admin@Letscrapitt.com', '$2y$10$yAZZ7ddOrdbxrfjuq9jYO.oBAvQoXUBveYqB81ZqPcNkX5oFVoZte', 'W9W4ZuG6p3BBq3r2zt1lKmb598QU1q3j'),
(3, 'a@a.com', '$2y$10$qZet0i72PJiYak2iXD8MrO7G1BrZzIA49f.BMN86b.P4f97oOhNde', '8O1F5lqkb3VC6O6eH91LUHv7nJ42QS8h'),
(4, 'admin@gmail.com', '1234', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `user` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`user`, `rating`, `message`) VALUES
(15, 40, 'BEST WEBSITE TO SCRAP AUTOMOBILES'),
(16, 45, 'THANKYOU FOR THIS USER FRIENDLY WEBSITE ');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`) VALUES
(2, 'HARMAN PREET SINGH', 'harmanpreets142@gmail.com', 'hello hi'),
(6, 'HARMAN PREET SINGH', 'harmanpreets142@gmail.com', 'hellllllloooooooooooo'),
(7, 'BALPREET SINGH', 'bs660676@gmail.com', 'hlo');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `user` int(11) NOT NULL,
  `otp` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`user`, `otp`) VALUES
(5, '62655ce4f1f0d');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(255) NOT NULL,
  `chassis_number` varchar(17) NOT NULL,
  `engine_number` varchar(17) NOT NULL,
  `rc_number` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `condition` longtext NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `quotation` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `model`, `chassis_number`, `engine_number`, `rc_number`, `address`, `condition`, `photo`, `status`, `quotation`) VALUES
(29, 6, 'QUALIS 2007', '1gha818Z3M0115561', '123456hava98523', 'dl0ah82272', 'TILAK NAGAR NEW DELHI-18', 'no scratches on the body', '62651d70d8c24.jpg', 2, '35000'),
(32, 15, 'Accent 2010', '1HA74782Y395D5614', '1234567SBE4564747', 'HR10CT2422', 'SONIPAT', 'NEW TYRES,WORKING AC AND NEW SEAT COVERS', '62651fe8129b9.jpg', 1, 'rs200000'),
(33, 16, 'ZEN 2001', '623DAVJAV3452BK61', 'WF3563TGEG4', 'DL14QD5421', 'NARINA VIHAR', 'AC NOT WORKING REST IN GOOD CONDITION', '6265221a17e72.jpg', 1, '15000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `pan` varchar(10) NOT NULL,
  `token` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `pan`, `token`) VALUES
(4, 'harmanpreets142@gmail.com', '$2y$10$aJR.SpCFyitXMLK7l/Y26OETMZENxgI5kv2XWCCBsXC/IfrSEPEOm', 'HARMAN PREET', 'SINGH', 'ashp983676', 'lu6M5T3eyV64NAYidKhmInxk4s2nOp2V'),
(5, 'harmanpreets242@gmail.com', '$2y$10$gYFTjLgRG47hpRHhRVtyXey2GepLM25EUxNNsAC1zesMjtXt6s08S', 'HARMAN PREET', 'SINGH', 'ashp983672', 'off5Fw2JZ3TDE8xfb3c4i7z4lA727U3Y'),
(6, 'pankajkaushal520@gmail.com', '$2y$10$Djt./uSYFp/yW.dQvML1ju1gKmK25YHBq7nRvBosehAoxyli22YrK', 'Pankaj', 'Kaushal', 'ashpk10202', '37omC5N72ITs945z8hVyFpPSy73q1qfD'),
(8, 'bs660676@gmail.com', '$2y$10$qrE54qwOnd7yI6OhgNJcw.zD/NeocsFNEAfMfvNsHw17a0CcqeSr6', 'Balpreet', 'Singh', '1234567891', 'dmquszhPf8889js1LQXcHg19jbt64b1v'),
(15, 'piyushdalmia9900@gmail.com', '$2y$10$CfUyjFxn0EWyRvpmeBdDs.FFO8sIDWUME49nLd4WL/ByOH7s59qgy', 'PIYUSH', 'DALMIA', 'ABCGW1342E', NULL),
(16, 'Gurukohli53@gmail.com', '$2y$10$8e0gScZC2wlr00cKA2tWUO3B80W4GKX8YBpWDZSnroN8vAWWFCE/a', 'Gurman', 'SINGH', 'AFDCR3622B', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD UNIQUE KEY `user` (`user`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD UNIQUE KEY `user` (`user`),
  ADD UNIQUE KEY `otp` (`otp`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chassis_number` (`chassis_number`),
  ADD UNIQUE KEY `engine_number` (`engine_number`),
  ADD UNIQUE KEY `user_id` (`user_id`,`model`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `pan` (`pan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Constraints for table `otp`
--
ALTER TABLE `otp`
  ADD CONSTRAINT `otp_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `user_id_foreign_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
