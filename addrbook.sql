-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2023 at 01:28 AM
-- Server version: 10.5.19-MariaDB-0+deb11u2
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testbase`
--

-- --------------------------------------------------------

--
-- Table structure for table `addressbook`
--

CREATE TABLE `addressbook` (
  `id` int(11) NOT NULL,
  `name` varchar(33) NOT NULL,
  `phone` text NOT NULL DEFAULT '+7913-111-12-20'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `addressbook`
--

INSERT INTO `addressbook` (`id`, `name`, `phone`) VALUES
(2, 'Dennis Culmann2', '8915-888-78-12'),
(3, 'Martha Sanders', '+7913988999889'),
(4, 'Alla Pooga40Ba', '005005+'),
(5, 'Vladimir Pootin', '007'),
(6, 'Martha Sanders', '8915-888-78-88'),
(7, 'Vladimir Pootin', '006'),
(8, 'Alla Pooga40Ba', '005005+'),
(9, 'AHTOH HOCIK', '9898 9898 9898'),
(11, 'Nikia Seergeyewitch', '8-095-565-55-03'),
(12, 'Leoneed Briedzhneff', 'mr_br/off'),
(13, 'Misha Gorbachev', 'pierestroika');

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `user_id` int(3) NOT NULL,
  `domain_id` int(3) NOT NULL,
  `dname` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`user_id`, `domain_id`, `dname`) VALUES
(1, 1, 'gorr.ru'),
(1, 2, 'rout.ru'),
(2, 3, 'mo.ru'),
(2, 4, 'kwa.ru'),
(3, 5, 'qqq.ru'),
(1, 6, 'krendel.ru');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(33) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`) VALUES
(1, 'Иван Иванов'),
(2, 'Петр петров'),
(3, 'Василий афанасьев'),
(4, 'Мария Дэбэ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addressbook`
--
ALTER TABLE `addressbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD UNIQUE KEY `domain_id` (`domain_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addressbook`
--
ALTER TABLE `addressbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `domain_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
