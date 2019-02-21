-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2019 at 04:52 PM
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
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`, `title`) VALUES
(1, 'page_id', '510773886113331', 'Page ID'),
(2, 'post_id', '510774389446614', 'Post ID'),
(3, 'page_access_token', 'EAADi8UzxnDQBACUZABWP9TZCT1L9BKELti7wQJvUdxp2736XeCJEXhg0Q7hpyXgTNRH4iDztW1FfoRdOs6dl9U7a1zrZCFZAVWj6NWPJ9UgwLyKe8f0tSnUMQDJ0EcB2P14RZBHgZClPODQ8cqZBZB3OREeuMY20encZARZCkc9NsvCM7rYQ2ZCnTUq', 'Page Access Token'),
(4, 'user_access_token', 'EAAAAUaZA8jlABAFypbCyL2NV4My4Pl5onOa9YXryqvP4ItkWUkbndm4kO7BgGg7krfsxca4GQGzKsK3pC4DvH3JopuO0j4L7VimjsDZAuMZA0LzphLrklZATkJLbJVnNOUbtvKiHkZCRVe56gi9CFzgjRKZBpfhwMXuPQmup0vcyCJ6SOFGcF10RHUyAWTFVYZD', 'User Access Token'),
(5, 'crawler_api_url', 'http://35.240.135.252:8080', 'Crawler API URL'),
(6, 'chatfuel_bot_id', '5a5b0d9ee4b0d02fdb4c8b17', 'Chatfuel Bot ID'),
(7, 'chatfuel_token', 'vnbqX6cpvXUXFcOKr5RHJ7psSpHDRzO1hXBY8dkvn50ZkZyWML3YdtoCnKH7FSjC', 'Chatfuel Token'),
(8, 'chatfuel_block_get_user_info', 'Get_user_info', 'Get User Info Block Name'),
(9, 'chatfuel_block_user_shared', 'User_shared', 'User Shared Block Name'),
(10, 'chatfuel_block_user_not_shared', 'User_not_shared', 'User Not Shared Block Name'),
(11, 'chatfuel_block_main_event', 'Main_Event', 'Main Event Block Name');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
