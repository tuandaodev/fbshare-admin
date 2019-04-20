-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2019 at 05:44 AM
-- Server version: 10.1.37-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `gift_name` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `user_app_id`, `user_fb_id`, `first_name`, `last_name`, `gender`, `email`, `phone_number`, `location`, `gift_id`, `gift_name`, `created`, `updated`) VALUES
(4, '1948372841938409', '100033664290570', 'Huy', 'Nguyễn Van', 'male', NULL, '097812648554', 'bình thạnh, tphcm', NULL, NULL, '2019-01-31 03:33:27', '2019-01-31 10:33:48'),
(7, '2415986501748800', '100033559267594', 'Đặng', 'Quang', 'male', NULL, '09781264866', 'phú nhận, tphcm', NULL, NULL, '2019-01-31 05:29:31', '2019-01-31 12:29:44'),
(8, '2331584263539530', '100000403802697', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-31 06:29:49', '2019-01-31 06:29:49'),
(9, '2437682209639870', '100001530461787', NULL, NULL, NULL, NULL, NULL, NULL, 2, 'Áo thun 35k', '2019-01-31 13:47:27', '2019-02-26 17:25:10'),
(11, '2534130239994150', '100008437660865', 'Tuấn', 'Đạt', 'male', NULL, '078596544', '4564', 4, 'Voucher 20k', '2019-02-18 06:54:31', '2019-02-22 08:25:24'),
(12, '2021590114595783', '100030348953422', 'Tuấn', 'Đào', 'male', NULL, '545464', '1213131', 4, 'Voucher 20k', '2019-02-21 18:31:27', '2019-02-24 10:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `gifts`
--

CREATE TABLE `gifts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image_url` varchar(1024) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gifts`
--

INSERT INTO `gifts` (`id`, `name`, `subtitle`, `image_url`, `description`, `created`) VALUES
(2, 'Áo thun 35k', 'Sub Áo thun 35k', 'https://media.gucci.com/style/White_Center_0_0_128x128/1538163005/493117_X9X96_1082_001_100_0000_Light-Oversize-T-shirt-with-Gucci-logo-and-leopard.jpg', 'Mô tả áo thun 35k', '2019-02-20 15:23:35'),
(3, 'Thỏi son 90k', 'Sub Thỏi son 90k', 'https://media.gucci.com/style/White_Center_0_0_128x128/1538163005/493117_X9X96_1082_001_100_0000_Light-Oversize-T-shirt-with-Gucci-logo-and-leopard.jpg', 'Mô tả thỏi son 90k', '2019-02-20 15:42:25'),
(4, 'Voucher 20k', 'Sub Voucher 20k', 'https://www.trespass.com/media/catalog/product/cache/1/small_image/256x/9df78eab33525d08d6e5fb8d27136e95/a/d/adder-matotsm10010-oat-a_copy_7.jpg', 'Mô tả Voucher 20k', '2019-02-20 15:42:32'),
(5, 'Card ĐT', NULL, NULL, 'Mô tả Card ĐT', '2019-02-20 15:42:37'),
(6, 'Test', 'sdasds', 'https://www.trespass.com/media/catalog/product/cache/1/small_image/256x/9df78eab33525d08d6e5fb8d27136e95/a/d/adder-matotsm10010-oat-a_copy_7.jpg', '', '2019-02-26 09:54:33'),
(7, 'Test', 'https://rockets.chatfuel.com/assets/shirt.jpg', NULL, 'sdsd', '2019-02-26 09:55:18');

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

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, '172.68.238.243', 'grybovsergey88@gmail.com', 1551367666),
(2, '172.68.238.243', 'grybovsergey88@gmail.com', 1551372928);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
(5, 'crawler_api_url', 'http://35.240.135.252:8080', 'Crawler API URL', 'text'),
(6, 'chatfuel_bot_id', '5a5b0d9ee4b0d02fdb4c8b17', 'Chatfuel Bot ID', 'text'),
(7, 'chatfuel_token', 'vnbqX6cpvXUXFcOKr5RHJ7psSpHDRzO1hXBY8dkvn50ZkZyWML3YdtoCnKH7FSjC', 'Chatfuel Token', 'text'),
(8, 'chatfuel_block_get_user_info', 'Get_user_info', 'Get User Info Block Name', 'text'),
(9, 'chatfuel_block_user_shared', 'User_shared', 'User Shared Block Name', 'text'),
(10, 'chatfuel_block_user_not_shared', 'User_not_shared', 'User Not Shared Block Name', 'text'),
(11, 'chatfuel_block_main_event', 'Main_Event', 'Main Event Block Name', 'text'),
(12, 'list_gift', 'a:3:{i:0;s:1:\"2\";i:1;s:1:\"3\";i:2;s:1:\"4\";}', 'List Gifts', 'select2'),
(13, 'gift_message', '{\"messages\":[{\"attachment\":{\"type\":\"template\",\"payload\":{\"template_type\":\"generic\",\"image_aspect_ratio\":\"square\",\"elements\":[{\"title\":\"\\u00c1o thun 35k\",\"image_url\":\"https:\\/\\/media.gucci.com\\/style\\/White_Center_0_0_128x128\\/1538163005\\/493117_X9X96_1082_001_100_0000_Light-Oversize-T-shirt-with-Gucci-logo-and-leopard.jpg\",\"subtitle\":\"Sub \\u00c1o thun 35k\",\"buttons\":[{\"type\":\"json_plugin_url\",\"title\":\"Ch\\u1ecdn qu\\u00e0 n\\u00e0y\",\"url\":\"http:\\/\\/123link.cloud\\/api\\/gift\\/choose\\/XUSER_ID\\/2\"}]},{\"title\":\"Th\\u1ecfi son 90k\",\"image_url\":\"https:\\/\\/media.gucci.com\\/style\\/White_Center_0_0_128x128\\/1538163005\\/493117_X9X96_1082_001_100_0000_Light-Oversize-T-shirt-with-Gucci-logo-and-leopard.jpg\",\"subtitle\":\"Sub Th\\u1ecfi son 90k\",\"buttons\":[{\"type\":\"json_plugin_url\",\"title\":\"Ch\\u1ecdn qu\\u00e0 n\\u00e0y\",\"url\":\"http:\\/\\/123link.cloud\\/api\\/gift\\/choose\\/XUSER_ID\\/3\"}]},{\"title\":\"Voucher 20k\",\"image_url\":\"https:\\/\\/www.trespass.com\\/media\\/catalog\\/product\\/cache\\/1\\/small_image\\/256x\\/9df78eab33525d08d6e5fb8d27136e95\\/a\\/d\\/adder-matotsm10010-oat-a_copy_7.jpg\",\"subtitle\":\"Sub Voucher 20k\",\"buttons\":[{\"type\":\"json_plugin_url\",\"title\":\"Ch\\u1ecdn qu\\u00e0 n\\u00e0y\",\"url\":\"http:\\/\\/123link.cloud\\/api\\/gift\\/choose\\/XUSER_ID\\/4\"}]}]}}}]}', 'Gift Message', 'other'),
(14, 'gift_type', '2', 'Gift Type', 'select');

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
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, 'p3.j5ZDZP3l7IO/Ehrao6O', 1268889823, 1551174123, 1, 'Admin', 'istrator', 'ADMIN', '0');

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

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `value` varchar(512) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `value`, `status`, `created`) VALUES
(1, 'EAAAAUaZA8jlABAFypbCyL2NV4My4Pl5onOa9YXryqvP4ItkWUkbndm4kO7BgGg7krfsxca4GQGzKsK3pC4DvH3JopuO0j4L7VimjsDZAuMZA0LzphLrklZATkJLbJVnNOUbtvKiHkZCRVe56gi9CFzgjRKZBpfhwMXuPQmup0vcyCJ6SOFGcF10RHUyAWTFVYZD', 1, '2019-02-24 02:25:47');

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
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `gifts`
--
ALTER TABLE `gifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
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
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
