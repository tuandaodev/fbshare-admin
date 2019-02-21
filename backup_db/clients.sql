-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2019 at 04:50 PM
-- Server version: 10.1.37-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fbshare`
--

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `user_app_id`, `user_fb_id`, `first_name`, `last_name`, `gender`, `email`, `phone_number`, `location`, `created`, `updated`) VALUES
(4, '1948372841938409', '100033664290570', 'Huy', 'Nguyễn Van', 'male', NULL, '097812648554', 'bình thạnh, tphcm', '2019-01-31 03:33:27', '2019-01-31 10:33:48'),
(7, '2415986501748800', '100033559267594', 'Đặng', 'Quang', 'male', NULL, '09781264866', 'phú nhận, tphcm', '2019-01-31 05:29:31', '2019-01-31 12:29:44'),
(8, '2331584263539530', '100000403802697', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-31 06:29:49', '2019-01-31 06:29:49'),
(9, '2437682209639870', '100001530461787', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-31 13:47:27', '2019-01-31 13:47:27'),
(10, '2021590114595783', '100030348953422', 'Tuấn', 'Đào', 'male', NULL, '0978126486', 'test địa chỉ', '2019-02-14 02:15:08', '2019-02-14 09:16:28'),
(11, '2534130239994150', '100008437660865', 'Tuấn', 'Đạt', 'male', NULL, '0952658740', 'dasdasdas', '2019-02-18 06:54:31', '2019-02-19 19:48:10');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
