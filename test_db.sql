-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2019 at 01:51 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_tran`
--

CREATE TABLE `chat_tran` (
  `id` int(11) NOT NULL,
  `sender` varchar(200) NOT NULL,
  `receiver` varchar(200) NOT NULL,
  `msg` varchar(400) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_tran`
--

INSERT INTO `chat_tran` (`id`, `sender`, `receiver`, `msg`, `time`) VALUES
(13, 'om', 'ganesh', 'hi', '2019-01-03 06:48:49'),
(14, 'ganesh', 'akash', 'hik', '2019-01-03 06:49:42'),
(15, 'ganesh', 'akash', 'hi', '2019-01-03 06:51:58'),
(16, 'ganesh', 'akash', 'hi', '2019-01-03 06:56:56'),
(17, 'akash', 'ganesh', 'hi', '2019-01-03 07:02:42'),
(18, 'ganesh', 'akash', 'hi', '2019-01-03 07:09:51'),
(19, 'ganesh', 'ganesh', 'hello', '2019-01-03 07:10:09'),
(20, 'akash', 'ganesh', 'hy', '2019-01-03 07:10:22'),
(21, 'bhabad', 'ganesh', 'hi bro', '2019-01-03 07:16:26'),
(22, 'bhabad', 'akash', 'hi', '2019-01-03 07:17:18'),
(23, 'bhabad', 'om', 'hik', '2019-01-03 07:17:24'),
(24, 'ganesh', 'akash', 'hik', '2019-01-03 07:38:42'),
(25, 'akash', 'ganesh', 'hiii', '2019-01-03 10:00:05'),
(26, 'ganesh', 'akash', 'hi', '2019-01-03 11:24:03'),
(27, 'ganesh', 'akash', 'asas', '2019-01-03 11:28:20'),
(28, 'ganesh', 'Sandip', 'hik', '2019-01-03 11:28:58'),
(29, 'Sandip', 'ganesh', 'Hello', '2019-01-03 12:12:07'),
(30, 'ganesh', 'ganesh', 'hi', '2019-01-03 12:12:17'),
(31, 'Sandip', 'ganesh', 'working', '2019-01-03 12:12:22'),
(32, 'Sandip', 'sham', 'hello', '2019-01-03 12:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `register_data`
--

CREATE TABLE `register_data` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_addr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register_data`
--

INSERT INTO `register_data` (`id`, `name`, `password`, `time`, `ip_addr`) VALUES
(1, 'ganesh', '123', '2019-01-01 13:10:31', 1),
(2, 'akash', '123', '2019-01-01 13:54:55', 0),
(3, 'om', '123', '2019-01-01 13:55:58', 0),
(6, 'bhabad', '123', '2019-01-02 09:16:57', 0),
(7, 'Sandip', '123456', '2019-01-03 11:27:02', 0),
(8, 'sham', '123', '2019-01-03 11:33:25', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_tran`
--
ALTER TABLE `chat_tran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register_data`
--
ALTER TABLE `register_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_tran`
--
ALTER TABLE `chat_tran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `register_data`
--
ALTER TABLE `register_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
