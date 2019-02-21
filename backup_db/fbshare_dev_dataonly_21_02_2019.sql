-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2019 at 04:43 PM
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
-- Dumping data for table `admin_preferences`
--

INSERT INTO `admin_preferences` (`id`, `user_panel`, `sidebar_form`, `messages_menu`, `notifications_menu`, `tasks_menu`, `user_menu`, `ctrl_sidebar`, `transition_page`) VALUES
(1, 0, 0, 0, 0, 0, 1, 0, 0);

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

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `bgcolor`) VALUES
(1, 'admin', 'Administrator', '#F44336'),
(2, 'members', 'General User', '#2196F3');

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `page_id`, `post_id`, `created`) VALUES
(1, '1', '1', '2019-01-24 10:50:27');

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

--
-- Dumping data for table `public_preferences`
--

INSERT INTO `public_preferences` (`id`, `transition_page`) VALUES
(1, 0);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, '78JrLbIwu8qIUGEe0uh97u', 1268889823, 1550713518, 1, 'Admin', 'istrator', 'ADMIN', '0');

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
