-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2019 at 05:44 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fbshare`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_preferences`
--

CREATE TABLE `admin_preferences` (
  `id` tinyint(1) NOT NULL,
  `user_panel` tinyint(1) NOT NULL DEFAULT '0',
  `sidebar_form` tinyint(1) NOT NULL DEFAULT '0',
  `messages_menu` tinyint(1) NOT NULL DEFAULT '0',
  `notifications_menu` tinyint(1) NOT NULL DEFAULT '0',
  `tasks_menu` tinyint(1) NOT NULL DEFAULT '0',
  `user_menu` tinyint(1) NOT NULL DEFAULT '1',
  `ctrl_sidebar` tinyint(1) NOT NULL DEFAULT '0',
  `transition_page` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_preferences`
--

INSERT INTO `admin_preferences` (`id`, `user_panel`, `sidebar_form`, `messages_menu`, `notifications_menu`, `tasks_menu`, `user_menu`, `ctrl_sidebar`, `transition_page`) VALUES
(1, 0, 0, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `user_app_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_fb_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gift_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `user_app_id`, `user_fb_id`, `first_name`, `last_name`, `gender`, `email`, `phone_number`, `location`, `gift_id`, `created`, `updated`) VALUES
(1, '123123', NULL, 'TESTSETEST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '6767456456546', '123123123', 'Đào Minh Tuấn', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-30 05:40:57', NULL),
(3, '2373937132677212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-30 06:00:58', '0000-00-00 00:00:00'),
(4, '123123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL),
(5, '237393713267721233333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-30 15:12:32', '0000-00-00 00:00:00'),
(6, '237393713267721233333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-30 15:12:48', '0000-00-00 00:00:00'),
(7, '23739371326772123333333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-30 15:18:39', '2019-01-30 15:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`id`, `name`, `description`, `created`) VALUES
(2, 'Áo thun 35k', NULL, '2019-02-20 15:23:35'),
(3, 'Đào Minh Tuấn', 'dsasdasd', '2019-02-20 15:42:25'),
(4, 'Test', 'testestset', '2019-02-20 15:42:32'),
(5, 'Đào Minh Tuấn', '', '2019-02-20 15:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `bgcolor` char(7) NOT NULL DEFAULT '#607D8B'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `bgcolor`) VALUES
(1, 'admin', 'Administrator', '#F44336'),
(2, 'members', 'General User', '#2196F3');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `page_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `page_id`, `post_id`, `created`) VALUES
(1, '1', '1', '2019-01-24 10:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`, `title`, `type`) VALUES
(1, 'page_id', '510773886113331', 'Page ID', 'text'),
(2, 'post_id', '510774389446614', 'Post ID', 'text'),
(3, 'page_access_token', 'EAADi8UzxnDQBACUZABWP9TZCT1L9BKELti7wQJvUdxp2736XeCJEXhg0Q7hpyXgTNRH4iDztW1FfoRdOs6dl9U7a1zrZCFZAVWj6NWPJ9UgwLyKe8f0tSnUMQDJ0EcB2P14RZBHgZClPODQ8cqZBZB3OREeuMY20encZARZCkc9NsvCM7rYQ2ZCnTUq', 'Page Access Token', 'text'),
(4, 'user_access_token', 'EAAAAUaZA8jlABAFypbCyL2NV4My4Pl5onOa9YXryqvP4ItkWUkbndm4kO7BgGg7krfsxca4GQGzKsK3pC4DvH3JopuO0j4L7VimjsDZAuMZA0LzphLrklZATkJLbJVnNOUbtvKiHkZCRVe56gi9CFzgjRKZBpfhwMXuPQmup0vcyCJ6SOFGcF10RHUyAWTFVYZD', 'User Access Token', 'text'),
(5, 'crawler_api_url', 'http://123link.cloud:8080', 'Crawler API URL', 'text'),
(6, 'chatfuel_bot_id', '5a5b0d9ee4b0d02fdb4c8b17', 'Chatfuel Bot ID', 'text'),
(7, 'chatfuel_token', 'vnbqX6cpvXUXFcOKr5RHJ7psSpHDRzO1hXBY8dkvn50ZkZyWML3YdtoCnKH7FSjC', 'Chatfuel Token', 'text'),
(8, 'chatfuel_block_get_user_info', 'Get_user_info', 'Get User Info Block Name', 'text'),
(9, 'chatfuel_block_user_shared', 'User_shared', 'User Shared Block Name', 'text'),
(10, 'chatfuel_block_user_not_shared', 'User_not_shared', 'User Not Shared Block Name', 'text'),
(11, 'chatfuel_block_main_event', 'Main_Event', 'Main Event Block Name', 'text'),
(12, 'list_gift', 'a:2:{i:0;s:1:\"4\";i:1;s:1:\"5\";}', 'List Gifts', 'select'),
(13, 'gift_message', '{\"messages\":[{\"text\":\"text\",\"quick_replies\":[{\"title\":\"Test\",\"set_attributes\":{\"user_gift_id\":\"4\",\"user_gift_name\":\"Test\"}},{\"title\":\"\\u0110\\u00e0o Minh Tu\\u1ea5n\",\"set_attributes\":{\"user_gift_id\":\"5\",\"user_gift_name\":\"\\u0110\\u00e0o Minh Tu\\u1ea5n\"}}],\"quick_reply_options\":{\"process_text_by_ai\":false,\"text_attribute_name\":\"user_message\"}}]}', 'Gift Message', 'other');

-- --------------------------------------------------------

--
-- Table structure for table `public_preferences`
--

CREATE TABLE `public_preferences` (
  `id` int(1) NOT NULL,
  `transition_page` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `public_preferences`
--

INSERT INTO `public_preferences` (`id`, `transition_page`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, 'SjczTts4VDZ6qx87Un.xJe', 1268889823, 1550650416, 1, 'Admin', 'istrator', 'ADMIN', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_preferences`
--
ALTER TABLE `admin_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`,`user_app_id`);

--
-- Indexes for table `gifts`
--
ALTER TABLE `gifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `public_preferences`
--
ALTER TABLE `public_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_preferences`
--
ALTER TABLE `admin_preferences`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `public_preferences`
--
ALTER TABLE `public_preferences`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
