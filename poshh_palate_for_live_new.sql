-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 18, 2025 at 12:25 PM
-- Server version: 8.0.31
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poshh_palate`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
CREATE TABLE IF NOT EXISTS `app_users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_users_email_unique` (`email`),
  UNIQUE KEY `app_users_phone_number_unique` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id`, `image`, `first_name`, `last_name`, `email`, `phone_number`, `password`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Kamal', 'Battle', 'devashish.soni003@gmail.com', '+916350020360', '$2y$10$xKb09r1VDNmswdYiOPy3AuUHj9dQhdDJplVk7xIgMz9Fon2UYHsNm', '1', '2025-05-01 00:51:44', '2025-05-01 00:51:44', NULL),
(2, NULL, 'Naveen', 'jain', 'jainnanu054@gmail.com', '829066093', '$2y$10$HhGu7tikVchYMlCIdQaiIeCl/4gaRZbORBv7aX.M3/NDPEN47.cgG', '1', '2025-07-10 08:47:23', '2025-07-10 08:47:23', NULL),
(3, NULL, 'pwdj', 'etgert', 'parizad.raskar@gmail.com', '9823070544', '$2y$10$JYqNX229KUeMYJ/TbjxA7OqjddVnmwgR.mpiNxySl/Moq78AmeCD2', '1', '2025-07-10 12:43:17', '2025-07-10 12:43:17', NULL),
(4, NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '09680046983', '$2y$10$vYZOWuLz.LytJkmQs6gHQ.cHBR9se7h8WPDPBxSf29gps1foHkfaO', '1', '2025-07-16 08:43:25', '2025-07-16 08:43:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `color`, `name`, `created_at`, `updated_at`) VALUES
(1, '#2320cf', 'Blue', '2025-05-27 03:22:14', '2025-05-27 03:22:14'),
(2, '#000000', 'Black', '2025-05-27 03:23:53', '2025-05-27 03:23:53'),
(3, '#ffffff', 'White', '2025-05-27 03:24:14', '2025-05-27 03:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `title`, `subtitle`, `short_description`, `button_text`, `button_link`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'banner/1746879750_9555.jpg', 'test title', 'test subtitle', 'j,mhgfhdgsfadgfhghfgkjkhgfytd', 'explore collection', 'shop-detail', '1', '2025-05-10 06:42:30', '2025-05-11 23:40:49', '2025-05-11 23:40:49'),
(8, 'storage/banner/1748326693_2260.png', 'Find Your <br> Signature Style', 'BIKINIS & SWIMSUITS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'explore collection', 'http://127.0.0.1:8000/shop', '1', '2025-05-10 06:55:00', '2025-07-18 03:32:23', NULL),
(9, 'banner/1747026762_9995.jpg', 'test title', 'test subtitle', 'qesrdgfbgtrtewqwaesfxgcbvnfr', 'explore collection', 'shop-detail', '1', '2025-05-11 23:42:44', '2025-05-11 23:50:42', '2025-05-11 23:50:42'),
(10, 'storage/banner/1748326705_6117.jpg', 'Find Your <br> Signature Style', 'BIKINIS & SWIMSUITS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'explore collection', 'http://127.0.0.1:8000/shop', '1', '2025-05-11 23:59:34', '2025-07-18 03:33:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_descriptions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_slug_unique` (`slug`),
  KEY `blogs_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `details`, `image`, `category_id`, `tags`, `meta_keywords`, `meta_descriptions`, `status`, `short_description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '7 Proven Strategies to Boost Your eCommerce Sales in 2025', 'test', 'Struggling with low conversion rates? Discover the top strategies used by successful online stores to increase sales, improve user experience, and reduce cart abandonment.', 'blog/1750247767_8290.jpg', 2, NULL, NULL, 'test', '1', NULL, NULL, '2025-06-08 09:06:07', '2025-06-18 06:26:07'),
(2, 'How to Build a Scalable eCommerce Platform with Laravel', 'test-2', 'Learn how to structure a robust and scalable Laravel-based eCommerce system with features like product filtering, carts, checkout, and admin controls.', 'blog/1750247864_2636.png', 2, NULL, NULL, NULL, '1', NULL, NULL, '2025-06-18 06:21:56', '2025-06-18 06:27:44'),
(3, '10 eCommerce Design Trends That Will Dominate in 2025', 'test-3', 'Want your online store to stand out? These cutting-edge design trends improve usability, increase trust, and boost conversions in modern eCommerce.', 'blog/1750247982_8692.jpg', 2, NULL, NULL, NULL, '1', NULL, NULL, '2025-06-18 06:29:10', '2025-06-18 06:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE IF NOT EXISTS `blog_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Merritt Cardenas', 'Sint voluptate aspe', 0, '2025-05-02 05:51:47', '2025-05-02 05:53:20', '2025-05-02 05:53:20'),
(2, 'test', 'test', 1, '2025-05-02 05:54:22', '2025-05-02 05:56:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(31, 4, 44, 1, '1000.00', '2025-07-18 05:53:24', '2025-07-18 05:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_descriptions` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_feature` tinyint(1) DEFAULT '0',
  `serial` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `image`, `meta_keywords`, `meta_descriptions`, `status`, `is_feature`, `serial`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, '3 Piece Shuit', '3-piece-shuit', 'category/1745926086_8018.jpg', '3 Piece Shuit', '3 Piece Shuit', 1, 0, 1, '2025-04-29 05:58:06', '2025-05-10 07:29:02', '2025-05-10 07:29:02'),
(2, NULL, 'Belts', 'belts', 'category/1750162628_5185.png', 'Cord Set', 'Cord Set', 1, 0, 1, '2025-04-29 06:09:51', '2025-06-17 06:47:08', NULL),
(3, NULL, 'Wrist Watch', 'wrist-watch', 'category/1750162554_4703.jpeg', 'Anarkali', 'Anarkali', 1, 0, 1, '2025-04-29 06:12:51', '2025-06-17 06:45:54', NULL),
(4, NULL, 'Kurta Set', 'kurta-set', 'category/1747034186_6584.jpg', 'Kurta Set', 'Kurta Set', 1, 0, 1, '2025-04-29 06:15:32', '2025-05-15 04:05:14', '2025-05-15 04:05:14'),
(5, NULL, 'Shirt', 'shirt', 'category/1745927264_3704.jpg', 'Shirt', 'Shirt', 1, 0, 1, '2025-04-29 06:17:44', '2025-05-10 07:20:49', '2025-05-10 07:20:49'),
(6, NULL, 'scgfxd', 'dszfvcd', 'storage/category/1747047758_2806.jpg', 'SDzffxgds', 'sdFzbghf', 1, 0, 2, '2025-05-12 05:32:38', '2025-05-12 05:37:32', '2025-05-12 05:37:32'),
(7, 3, 'cxfvdfz', 'zvf vcxbv', 'storage/category/1748006630_2808.jpg', 'zcxvcxczv', 'zxvc fgxbcvz', 1, 0, 2, '2025-05-12 05:37:09', '2025-05-23 07:54:12', '2025-05-23 07:54:12'),
(8, NULL, 'Stoles', 'stoles', 'category/1750159655_4429.png', 'test', 'test', 1, 0, 1, '2025-05-12 05:53:08', '2025-06-17 05:57:35', NULL),
(9, 4, 'scsdsa', 'sdsad', 'category/image.png', 'asdsad', 'asdasd', 1, 0, 1, '2025-05-12 06:01:53', '2025-05-15 04:09:19', '2025-05-15 04:09:19'),
(10, NULL, 'Bags', 'bags', 'category/1750159689_4342.jpg', NULL, NULL, 1, 0, 1, '2025-05-13 03:05:14', '2025-06-17 05:58:09', NULL),
(11, NULL, 'Accessories', 'accessories', 'category/1750327148_8299.jpeg', NULL, NULL, 1, 0, 1, '2025-05-15 04:07:03', '2025-06-19 04:29:08', NULL),
(12, NULL, 'Caps', 'caps', 'category/1750163023_3115.png', NULL, NULL, 1, 0, 1, '2025-05-26 04:39:38', '2025-06-17 06:53:43', NULL),
(13, 3, 'Nitesh Kumawat', 'nitesh-kumawat', 'category/image.png', NULL, NULL, 1, 0, 2, '2025-05-30 05:44:12', '2025-05-30 05:45:56', '2025-05-30 05:45:56'),
(14, 13, 'Bagsfg dfyu', 'bagsfg-dfyu', 'category/image.png', NULL, NULL, 1, 0, 3, '2025-05-30 05:44:57', '2025-05-30 05:45:51', '2025-05-30 05:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `state_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nicobar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(2, 1, 'North And Middle Andaman', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(3, 1, 'South Andaman', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(4, 2, 'Adilabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(5, 2, 'Anantapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(6, 2, 'Chittoor', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(7, 2, 'East Godavari', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(8, 2, 'Guntur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(9, 2, 'Hyderabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(10, 2, 'Kadapa (Cuddapah)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(11, 2, 'Karim Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(12, 2, 'Khammam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(13, 2, 'Krishna', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(14, 2, 'Kurnool', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(15, 2, 'Mahbubnagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(16, 2, 'Medak', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(17, 2, 'Nalgonda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(18, 2, 'Nellore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(19, 2, 'Nizamabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(20, 2, 'Prakasam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(21, 2, 'Rangareddy', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(22, 2, 'Srikakulam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(23, 2, 'Visakhapatnam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(24, 2, 'Vizianagaram', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(25, 2, 'Warangal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(26, 2, 'West Godavari', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(27, 3, 'Anjaw', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(28, 3, 'Changlang', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(29, 3, 'Dibang Valley', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(30, 3, 'East Kameng', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(31, 3, 'East Siang', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(32, 3, 'Kurung Kumey', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(33, 3, 'Lohit', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(34, 3, 'Lower Dibang Valley', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(35, 3, 'Lower Subansiri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(36, 3, 'Papum Pare', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(37, 3, 'Tawang', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(38, 3, 'Tirap', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(39, 3, 'Upper Siang', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(40, 3, 'Upper Subansiri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(41, 3, 'West Kameng', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(42, 3, 'West Siang', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(43, 4, 'Baksa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(44, 4, 'Barpeta', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(45, 4, 'Bongaigaon', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(46, 4, 'Cachar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(47, 4, 'Chirang', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(48, 4, 'Darrang', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(49, 4, 'Dhemaji', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(50, 4, 'Dhubri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(51, 4, 'Dibrugarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(52, 4, 'Dima Hasao (North Cachar Hills)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(53, 4, 'Goalpara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(54, 4, 'Golaghat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(55, 4, 'Hailakandi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(56, 4, 'Jorhat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(57, 4, 'Kamrup', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(58, 4, 'Kamrup Metropolitan', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(59, 4, 'Karbi Anglong', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(60, 4, 'Karimganj', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(61, 4, 'Kokrajhar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(62, 4, 'Lakhimpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(63, 4, 'Morigaon', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(64, 4, 'Nagaon', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(65, 4, 'Nalbari', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(66, 4, 'Sivasagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(67, 4, 'Sonitpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(68, 4, 'Tinsukia', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(69, 4, 'Udalguri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(70, 5, 'Araria', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(71, 5, 'Arwal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(72, 5, 'Aurangabad (Bihar)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(73, 5, 'Banka', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(74, 5, 'Begusarai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(75, 5, 'Bhagalpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(76, 5, 'Bhojpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(77, 5, 'Buxar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(78, 5, 'Darbhanga', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(79, 5, 'East Champaran', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(80, 5, 'Gaya', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(81, 5, 'Gopalganj', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(82, 5, 'Jamui', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(83, 5, 'Jehanabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(84, 5, 'Kaimur (Bhabua)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(85, 5, 'Katihar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(86, 5, 'Khagaria', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(87, 5, 'Kishanganj', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(88, 5, 'Lakhisarai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(89, 5, 'Madhepura', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(90, 5, 'Madhubani', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(91, 5, 'Munger', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(92, 5, 'Muzaffarpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(93, 5, 'Nalanda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(94, 5, 'Nawada', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(95, 5, 'Patna', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(96, 5, 'Purnia', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(97, 5, 'Rohtas', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(98, 5, 'Saharsa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(99, 5, 'Samastipur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(100, 5, 'Saran', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(101, 5, 'Sheikhpura', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(102, 5, 'Sheohar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(103, 5, 'Sitamarhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(104, 5, 'Siwan', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(105, 5, 'Supaul', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(106, 5, 'Vaishali', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(107, 5, 'West Champaran', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(108, 6, 'Chandigarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(109, 7, 'Bastar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(110, 7, 'Bijapur (Chhattisgarh)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(111, 7, 'Bilaspur (Chhattisgarh)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(112, 7, 'Dakshin Bastar Dantewada', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(113, 7, 'Dhamtari', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(114, 7, 'Durg', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(115, 7, 'Janjgir-Champa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(116, 7, 'Jashpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(117, 7, 'Kabirdham (Kawardha)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(118, 7, 'Korba', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(119, 7, 'Koriya', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(120, 7, 'Mahasamund', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(121, 7, 'Narayanpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(122, 7, 'Raigarh (Chhattisgarh)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(123, 7, 'Raipur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(124, 7, 'Rajnandgaon', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(125, 7, 'Surguja', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(126, 7, 'Uttar Bastar Kanker', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(127, 8, 'Dadra & Nagar Haveli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(128, 9, 'Daman', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(129, 9, 'Diu', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(130, 10, 'Central Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(131, 10, 'East Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(132, 10, 'New Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(133, 10, 'North Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(134, 10, 'North East Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(135, 10, 'North West Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(136, 10, 'South Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(137, 10, 'South West Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(138, 10, 'West Delhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(139, 11, 'North Goa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(140, 11, 'South Goa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(141, 12, 'Ahmedabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(142, 12, 'Amreli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(143, 12, 'Anand', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(144, 12, 'Banaskantha', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(145, 12, 'Bharuch', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(146, 12, 'Bhavnagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(147, 12, 'Dahod', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(148, 12, 'Gandhi Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(149, 12, 'Jamnagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(150, 12, 'Junagadh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(151, 12, 'Kachchh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(152, 12, 'Kheda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(153, 12, 'Mahesana', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(154, 12, 'Narmada', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(155, 12, 'Navsari', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(156, 12, 'Panch Mahals', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(157, 12, 'Patan', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(158, 12, 'Porbandar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(159, 12, 'Rajkot', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(160, 12, 'Sabarkantha', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(161, 12, 'Surat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(162, 12, 'Surendra Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(163, 12, 'Tapi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(164, 12, 'The Dangs', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(165, 12, 'Vadodara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(166, 12, 'Valsad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(167, 13, 'Ambala', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(168, 13, 'Bhiwani', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(169, 13, 'Faridabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(170, 13, 'Fatehabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(171, 13, 'Gurgaon', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(172, 13, 'Hisar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(173, 13, 'Jhajjar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(174, 13, 'Jind', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(175, 13, 'Kaithal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(176, 13, 'Karnal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(177, 13, 'Kurukshetra', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(178, 13, 'Mahendragarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(179, 13, 'Mewat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(180, 13, 'Palwal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(181, 13, 'Panchkula', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(182, 13, 'Panipat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(183, 13, 'Rewari', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(184, 13, 'Rohtak', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(185, 13, 'Sirsa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(186, 13, 'Sonipat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(187, 13, 'Yamuna Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(188, 14, 'Bilaspur (Himachal Pradesh)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(189, 14, 'Chamba', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(190, 14, 'Hamirpur (Himachal Pradesh)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(191, 14, 'Kangra', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(192, 14, 'Kinnaur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(193, 14, 'Kullu', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(194, 14, 'Lahul & Spiti', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(195, 14, 'Mandi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(196, 14, 'Shimla', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(197, 14, 'Sirmaur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(198, 14, 'Solan', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(199, 14, 'Una', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(200, 15, 'Anantnag', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(201, 15, 'Bandipore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(202, 15, 'Baramulla', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(203, 15, 'Budgam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(204, 15, 'Doda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(205, 15, 'Ganderbal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(206, 15, 'Jammu', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(207, 15, 'Kargil', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(208, 15, 'Kathua', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(209, 15, 'Kishtwar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(210, 15, 'Kulgam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(211, 15, 'Kupwara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(212, 15, 'Leh (Ladakh)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(213, 15, 'Poonch', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(214, 15, 'Pulwama', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(215, 15, 'Rajouri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(216, 15, 'Ramban', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(217, 15, 'Reasi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(218, 15, 'Samba', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(219, 15, 'Shopian', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(220, 15, 'Srinagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(221, 15, 'Udhampur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(222, 16, 'Bokaro', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(223, 16, 'Chatra', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(224, 16, 'Deoghar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(225, 16, 'Dhanbad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(226, 16, 'Dumka', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(227, 16, 'East Singhbhum', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(228, 16, 'Garhwa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(229, 16, 'Giridih', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(230, 16, 'Godda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(231, 16, 'Gumla', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(232, 16, 'Hazaribagh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(233, 16, 'Jamtara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(234, 16, 'Khunti', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(235, 16, 'Koderma', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(236, 16, 'Latehar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(237, 16, 'Lohardaga', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(238, 16, 'Pakur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(239, 16, 'Palamu', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(240, 16, 'Ramgarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(241, 16, 'Ranchi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(242, 16, 'Sahibganj', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(243, 16, 'Seraikela-Kharsawan', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(244, 16, 'Simdega', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(245, 16, 'West Singhbhum', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(246, 17, 'Bagalkot', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(247, 17, 'Bangalore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(248, 17, 'Bangalore Rural', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(249, 17, 'Belgaum', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(250, 17, 'Bellary', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(251, 17, 'Bidar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(252, 17, 'Bijapur (Karnataka)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(253, 17, 'Chamrajnagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(254, 17, 'Chickmagalur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(255, 17, 'Chikkaballapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(256, 17, 'Chitradurga', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(257, 17, 'Dakshina Kannada', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(258, 17, 'Davanagere', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(259, 17, 'Dharwad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(260, 17, 'Gadag', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(261, 17, 'Gulbarga', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(262, 17, 'Hassan', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(263, 17, 'Haveri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(264, 17, 'Kodagu', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(265, 17, 'Kolar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(266, 17, 'Koppal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(267, 17, 'Mandya', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(268, 17, 'Mysore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(269, 17, 'Raichur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(270, 17, 'Ramanagara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(271, 17, 'Shimoga', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(272, 17, 'Tumkur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(273, 17, 'Udupi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(274, 17, 'Uttara Kannada', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(275, 17, 'Yadgir', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(276, 18, 'Alappuzha', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(277, 18, 'Ernakulam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(278, 18, 'Idukki', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(279, 18, 'Kannur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(280, 18, 'Kasaragod', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(281, 18, 'Kollam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(282, 18, 'Kottayam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(283, 18, 'Kozhikode', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(284, 18, 'Malappuram', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(285, 18, 'Palakkad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(286, 18, 'Pathanamthitta', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(287, 18, 'Thiruvananthapuram', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(288, 18, 'Thrissur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(289, 18, 'Wayanad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(290, 19, 'Lakshadweep', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(291, 20, 'Alirajpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(292, 20, 'Anuppur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(293, 20, 'Ashok Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(294, 20, 'Balaghat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(295, 20, 'Barwani', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(296, 20, 'Betul', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(297, 20, 'Bhind', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(298, 20, 'Bhopal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(299, 20, 'Burhanpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(300, 20, 'Chhatarpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(301, 20, 'Chhindwara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(302, 20, 'Damoh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(303, 20, 'Datia', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(304, 20, 'Dewas', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(305, 20, 'Dhar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(306, 20, 'Dindori', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(307, 20, 'Guna', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(308, 20, 'Gwalior', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(309, 20, 'Harda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(310, 20, 'Hoshangabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(311, 20, 'Indore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(312, 20, 'Jabalpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(313, 20, 'Jhabua', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(314, 20, 'Katni', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(315, 20, 'Khandwa (East Nimar)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(316, 20, 'Khargone (West Nimar)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(317, 20, 'Mandla', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(318, 20, 'Mandsaur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(319, 20, 'Morena', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(320, 20, 'Narsinghpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(321, 20, 'Neemuch', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(322, 20, 'Panna', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(323, 20, 'Raisen', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(324, 20, 'Rajgarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(325, 20, 'Ratlam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(326, 20, 'Rewa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(327, 20, 'Sagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(328, 20, 'Satna', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(329, 20, 'Sehore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(330, 20, 'Seoni', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(331, 20, 'Shahdol', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(332, 20, 'Shajapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(333, 20, 'Sheopur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(334, 20, 'Shivpuri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(335, 20, 'Sidhi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(336, 20, 'Singrauli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(337, 20, 'Tikamgarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(338, 20, 'Ujjain', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(339, 20, 'Umaria', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(340, 20, 'Vidisha', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(341, 21, 'Ahmed Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(342, 21, 'Akola', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(343, 21, 'Amravati', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(344, 21, 'Aurangabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(345, 21, 'Beed', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(346, 21, 'Bhandara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(347, 21, 'Buldhana', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(348, 21, 'Chandrapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(349, 21, 'Dhule', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(350, 21, 'Gadchiroli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(351, 21, 'Gondia', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(352, 21, 'Hingoli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(353, 21, 'Jalgaon', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(354, 21, 'Jalna', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(355, 21, 'Kolhapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(356, 21, 'Latur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(357, 21, 'Mumbai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(358, 21, 'Mumbai Suburban', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(359, 21, 'Nagpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(360, 21, 'Nanded', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(361, 21, 'Nandurbar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(362, 21, 'Nashik', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(363, 21, 'Osmanabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(364, 21, 'Parbhani', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(365, 21, 'Pune', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(366, 21, 'Raigarh (Maharashtra)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(367, 21, 'Ratnagiri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(368, 21, 'Sangli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(369, 21, 'Satara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(370, 21, 'Sindhudurg', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(371, 21, 'Solapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(372, 21, 'Thane', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(373, 21, 'Wardha', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(374, 21, 'Washim', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(375, 21, 'Yavatmal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(376, 22, 'Bishnupur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(377, 22, 'Chandel', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(378, 22, 'Churachandpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(379, 22, 'Imphal East', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(380, 22, 'Imphal West', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(381, 22, 'Senapati', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(382, 22, 'Tamenglong', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(383, 22, 'Thoubal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(384, 22, 'Ukhrul', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(385, 23, 'East Garo Hills', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(386, 23, 'East Khasi Hills', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(387, 23, 'Jaintia Hills', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(388, 23, 'Ri Bhoi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(389, 23, 'South Garo Hills', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(390, 23, 'West Garo Hills', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(391, 23, 'West Khasi Hills', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(392, 24, 'Aizawl', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(393, 24, 'Champhai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(394, 24, 'Kolasib', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(395, 24, 'Lawngtlai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(396, 24, 'Lunglei', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(397, 24, 'Mamit', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(398, 24, 'Saiha', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(399, 24, 'Serchhip', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(400, 25, 'Dimapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(401, 25, 'Kiphire', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(402, 25, 'Kohima', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(403, 25, 'Longleng', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(404, 25, 'Mokokchung', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(405, 25, 'Mon', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(406, 25, 'Peren', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(407, 25, 'Phek', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(408, 25, 'Tuensang', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(409, 25, 'Wokha', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(410, 25, 'Zunheboto', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(411, 26, 'Angul', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(412, 26, 'Balangir', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(413, 26, 'Baleswar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(414, 26, 'Bargarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(415, 26, 'Bhadrak', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(416, 26, 'Boudh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(417, 26, 'Cuttack', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(418, 26, 'Debagarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(419, 26, 'Dhenkanal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(420, 26, 'Gajapati', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(421, 26, 'Ganjam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(422, 26, 'Jagatsinghapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(423, 26, 'Jajapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(424, 26, 'Jharsuguda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(425, 26, 'Kalahandi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(426, 26, 'Kandhamal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(427, 26, 'Kendrapara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(428, 26, 'Kendujhar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(429, 26, 'Khordha', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(430, 26, 'Koraput', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(431, 26, 'Malkangiri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(432, 26, 'Mayurbhanj', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(433, 26, 'Nabarangapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(434, 26, 'Nayagarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(435, 26, 'Nuapada', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(436, 26, 'Puri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(437, 26, 'Rayagada', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(438, 26, 'Sambalpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(439, 26, 'Subarnapur (Sonapur)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(440, 26, 'Sundergarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(441, 27, 'Karaikal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(442, 27, 'Mahe', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(443, 27, 'Puducherry (Pondicherry)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(444, 27, 'Yanam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(445, 28, 'Amritsar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(446, 28, 'Barnala', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(447, 28, 'Bathinda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(448, 28, 'Faridkot', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(449, 28, 'Fatehgarh Sahib', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(450, 28, 'Firozpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(451, 28, 'Gurdaspur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(452, 28, 'Hoshiarpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(453, 28, 'Jalandhar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(454, 28, 'Kapurthala', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(455, 28, 'Ludhiana', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(456, 28, 'Mansa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(457, 28, 'Moga', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(458, 28, 'Muktsar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(459, 28, 'Patiala', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(460, 28, 'Rupnagar (Ropar)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(461, 28, 'Sahibzada Ajit Singh Nagar (Mohali)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(462, 28, 'Sangrur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(463, 28, 'Shahid Bhagat Singh Nagar (Nawanshahr)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(464, 28, 'Tarn Taran', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(465, 29, 'Ajmer', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(466, 29, 'Alwar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(467, 29, 'Banswara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(468, 29, 'Baran', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(469, 29, 'Barmer', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(470, 29, 'Bharatpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(471, 29, 'Bhilwara', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(472, 29, 'Bikaner', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(473, 29, 'Bundi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(474, 29, 'Chittorgarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(475, 29, 'Churu', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(476, 29, 'Dausa', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(477, 29, 'Dholpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(478, 29, 'Dungarpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(479, 29, 'Ganganagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(480, 29, 'Hanumangarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(481, 29, 'Jaipur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(482, 29, 'Jaisalmer', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(483, 29, 'Jalor', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(484, 29, 'Jhalawar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(485, 29, 'Jhunjhunu', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(486, 29, 'Jodhpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(487, 29, 'Karauli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(488, 29, 'Kota', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(489, 29, 'Nagaur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(490, 29, 'Pali', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(491, 29, 'Pratapgarh (Rajasthan)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(492, 29, 'Rajsamand', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(493, 29, 'Sawai Madhopur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(494, 29, 'Sikar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(495, 29, 'Sirohi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(496, 29, 'Tonk', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(497, 29, 'Udaipur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(498, 30, 'East Sikkim', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(499, 30, 'North Sikkim', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(500, 30, 'South Sikkim', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(501, 30, 'West Sikkim', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(502, 31, 'Ariyalur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(503, 31, 'Chennai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(504, 31, 'Coimbatore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(505, 31, 'Cuddalore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(506, 31, 'Dharmapuri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(507, 31, 'Dindigul', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(508, 31, 'Erode', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(509, 31, 'Kanchipuram', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(510, 31, 'Kanyakumari', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(511, 31, 'Karur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(512, 31, 'Krishnagiri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(513, 31, 'Madurai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(514, 31, 'Nagapattinam', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(515, 31, 'Namakkal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(516, 31, 'Nilgiris', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(517, 31, 'Perambalur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(518, 31, 'Pudukkottai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(519, 31, 'Ramanathapuram', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(520, 31, 'Salem', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(521, 31, 'Sivaganga', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(522, 31, 'Thanjavur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(523, 31, 'Theni', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(524, 31, 'Thoothukudi (Tuticorin)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(525, 31, 'Tiruchirappalli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(526, 31, 'Tirunelveli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(527, 31, 'Tiruppur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(528, 31, 'Tiruvallur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(529, 31, 'Tiruvannamalai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(530, 31, 'Tiruvarur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(531, 31, 'Vellore', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(532, 31, 'Viluppuram', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(533, 31, 'Virudhunagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(534, 32, 'Dhalai', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(535, 32, 'North Tripura', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(536, 32, 'South Tripura', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(537, 32, 'West Tripura', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(538, 33, 'Agra', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(539, 33, 'Aligarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(540, 33, 'Allahabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(541, 33, 'Ambedkar Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(542, 33, 'Auraiya', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(543, 33, 'Azamgarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(544, 33, 'Bagpat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(545, 33, 'Bahraich', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(546, 33, 'Ballia', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(547, 33, 'Balrampur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(548, 33, 'Banda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(549, 33, 'Barabanki', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(550, 33, 'Bareilly', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(551, 33, 'Basti', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(552, 33, 'Bijnor', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(553, 33, 'Budaun', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(554, 33, 'Bulandshahr', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(555, 33, 'Chandauli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(556, 33, 'Chitrakoot', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(557, 33, 'Deoria', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(558, 33, 'Etah', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(559, 33, 'Etawah', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(560, 33, 'Faizabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(561, 33, 'Farrukhabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(562, 33, 'Fatehpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(563, 33, 'Firozabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(564, 33, 'Gautam Buddha Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(565, 33, 'Ghaziabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(566, 33, 'Ghazipur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(567, 33, 'Gonda', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(568, 33, 'Gorakhpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(569, 33, 'Hamirpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(570, 33, 'Hardoi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(571, 33, 'Hathras', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(572, 33, 'Jalaun', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(573, 33, 'Jaunpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(574, 33, 'Jhansi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(575, 33, 'Jyotiba Phule Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(576, 33, 'Kannauj', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(577, 33, 'Kanpur Dehat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(578, 33, 'Kanpur Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(579, 33, 'Kanshiram Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(580, 33, 'Kaushambi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(581, 33, 'Kheri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(582, 33, 'Kushinagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(583, 33, 'Lalitpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(584, 33, 'Lucknow', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(585, 33, 'Maharajganj', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(586, 33, 'Mahoba', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(587, 33, 'Mainpuri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(588, 33, 'Mathura', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(589, 33, 'Mau', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(590, 33, 'Meerut', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(591, 33, 'Mirzapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(592, 33, 'Moradabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(593, 33, 'Muzaffarnagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(594, 33, 'Pilibhit', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(595, 33, 'Pratapgarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(596, 33, 'Rae Bareli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(597, 33, 'Rampur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(598, 33, 'Saharanpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(599, 33, 'Sant Kabir Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(600, 33, 'Sant Ravidas Nagar (Bhadohi)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(601, 33, 'Shahjahanpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(602, 33, 'Shrawasti', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(603, 33, 'Siddharthnagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(604, 33, 'Sitapur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(605, 33, 'Sonbhadra', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(606, 33, 'Sultanpur', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(607, 33, 'Unnao', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(608, 33, 'Varanasi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(609, 34, 'Almora', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(610, 34, 'Bageshwar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(611, 34, 'Chamoli', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(612, 34, 'Champawat', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(613, 34, 'Dehradun', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(614, 34, 'Haridwar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(615, 34, 'Nainital', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(616, 34, 'Pauri Garhwal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(617, 34, 'Pithoragarh', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(618, 34, 'Rudraprayag', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(619, 34, 'Tehri Garhwal', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(620, 34, 'Udham Singh Nagar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(621, 34, 'Uttarkashi', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(622, 35, 'Bankura', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(623, 35, 'Bardhaman', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(624, 35, 'Birbhum', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(625, 35, 'Cooch Behar', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(626, 35, 'Dakshin Dinajpur (South Dinajpur)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(627, 35, 'Darjiling', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(628, 35, 'Hooghly', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(629, 35, 'Howrah', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(630, 35, 'Jalpaiguri', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(631, 35, 'Kolkata', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(632, 35, 'Maldah', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(633, 35, 'Murshidabad', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(634, 35, 'Nadia', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(635, 35, 'North 24 Parganas', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(636, 35, 'Paschim Medinipur (West Midnapore)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(637, 35, 'Purba Medinipur (East Midnapore)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(638, 35, 'Puruliya', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(639, 35, 'South 24 Parganas', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17'),
(640, 35, 'Uttar Dinajpur (North Dinajpur)', 1, NULL, '2025-04-28 09:17:17', '2025-04-28 09:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

DROP TABLE IF EXISTS `cms`;
CREATE TABLE IF NOT EXISTS `cms` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `title`, `image`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Home - About Us', NULL, '<p class=\'fs-5 text-muted\'>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit exercitationem facilis, tempora tempore beatae ex, odio dolorem suscipit rerum nihil placeat veritatis ipsam distinctio, quaerat aliquid. Vero voluptatem tenetur eaque, in saepe quo laboriosam sint natus, cupiditate mollitia impedit culpa? Quaerat nisi molestias ab ea consectetur placeat sequi at reprehenderit eveniet. Iste fugit tenetur nesciunt aliquid! Ducimus animi magnam possimus? Sed eos magnam nulla aut ipsa eius quibusdam accusantium ipsum voluptatum! Distinctio quisquam molestiae nesciunt.</p>', 1, NULL, '2025-04-28 03:47:17', '2025-04-28 03:47:17'),
(2, 'About Us', NULL, '<div><h2>What makes a good About Us or About Me page?</h2><p>A remarkable About page is genuine, approachable, and distinguished. It should give the visitor a glimpse into what working with you and your business might be like. You can include personal interests, stories, and photos that convey the unique story of your business.</p><p><br></p><p>Since About pages are creative and personal to you and your company, there are several ways to construct one, however, the process is generally the same. So, let\'s create an About page one step by step.</p><div class=\'hsg-featured-snippet\'><div class=\'hsg-featured-snippet__wrapper\'><h2>How to Write an About Page</h2><div class=\'hsg-featured-snippet__wrapper--content\' data-type=\'ordered_list\'><ol><li>Establish a mission statement.</li><li>Outline your company story.</li><li>Reveal how you\'ve evolved.</li><li>State your \'aha!\' moment.</li><li>Explain who you serve.</li><li>Explain what you\'re offering them.</li><li>Cite examples of who you\'ve served.</li><li>Describe your values.</li></ol></div></div></div><br><p>It\'s tough to establish one all-encompassing template for your About page — there are so many ways you can go about telling your company story. The good news is, there are some tried-and-true steps to get you started.</p><h3>1. Establish a mission statement.</h3><p>Your About page can and will be more comprehensive than a single<a rel=\'noopener\' target=\'_blank\' href=\'https://blog.hubspot.com/marketing/inspiring-company-mission-statements\'>mission statement</a>, but to draw people in, you need to succinctly state your goal in the industry upfront. What is your business here to do? Why should your website visitors care? This information will give the reader something to remember about your company long after they leave your website.</p><h3>2. Outline your company story.</h3><p>Every business has a story to tell. Even if you\'re running a start-up, you might not have a long history of changes and growth (yet), but it\'s a nice touch to talk about how you got to where you are on the About page. So, isolate the milestones before your company\'s founding, and use them to give readers some backstory on your current venture.</p><h3>3. Reveal how you\'ve evolved.</h3><p>There\'s no shame in admitting how your business strategy — or even your way of thinking — has changed since you began. In fact, these evolutions can improve the story you tell to website visitors.</p><p>About pages are perfect spaces to talk about where you started, how you\'ve grown, and the ideals that have helped your organization mature. Use these moments to further your company story and show people that you\'re always ready to change and adapt to the needs of your industry.</p><h3>4. State your \'aha!\' moment.</h3><p>Every good company was founded on an idea — something the current marketplace might not yet offer. What was your idea? Use this \'Aha!\' moment as a pivot point when telling your company story. What was a challenge you faced while developing your company? How did this challenge or discovery shape what you are today?</p><h3>5. Explain who you serve.</h3><p>As much as you want as many eyeballs on your About page as possible, you won\'t do business with every single one of them. That\'s why you must identify and mention your core customer. This lets your visitors know what your business is dedicated to helping them meet their needs and goals.</p><h3>6. Explain what you\'re offering them.</h3><p>As you\'re explaining who you serve, make it clear what it is you\'re offering. Companies often generalize their products or services in the website copy, making it hard to understand what it is the customer is actually paying for. Sometimes, businesses are afraid that the literal explanations of their products aren\'t interesting enough or will sound unappealing in writing. And that\'s a fair concern.</p><p>However, investing just a sentence or two into telling your potential customers exactly what they\'ll receive can keep them on your website for longer and get them interested in learning more.</p><h3>7. Cite examples of clients you\'ve served.</h3><p>Got some loyal customers in your portfolio? Use your About page to let the world know who already trusts and benefits from your work. A great way to showcase this is through a<a rel=\'noopener\' target=\'_blank\' href=\'https://blog.hubspot.com/marketing/case-studies-marketing\'>case study</a>.</p><p>Knowing about your company\'s past successes can influence your prospects\' purchasing decisions because they will be able to envision their success in the success of your past customers.</p><h3>8. Describe your values.</h3><p>Customers want to be treated like human beings. For that to happen, they need to feel that they\'re being served by human beings. When finishing your About page, describe who you are as a person or a team, and what your personal values are. What\'s your company culture like? What bigger picture in life drives your business?</p><p><br></p><p>Keep in mind a secondary audience of your company\'s About page consists of your future employees. This is another reason describing your personal values is a good idea — the key to your job candidates\' hearts is to show them you have one too.</p></div>', 1, NULL, '2025-04-28 03:47:17', '2025-04-28 03:47:17'),
(3, 'Privacy Policy', NULL, '<div> <p> <b></b> </p><p></p><p> At Adiyogi Fintech Pvt. Ltd., accessible from <a href=\'https://adiyogifintech.com\' title=\'Link: https://adiyogifintech.com\'>https://adiyogifintech.com</a>, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that are collected and recorded by Adiyogi Fintech Pvt. Ltd. and how we use it. </p><p> If you have additional questions or require more information about our Privacy Policy, do not hesitate to <a target=\'_blank\' rel=\'nofollow\' href=\'https://adiyogifintech.com/contact\' title=\'Link: https://adiyogifintech.com/contact\'>Contact Us</a>. </p><p> This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Adiyogi Fintech Pvt. Ltd. This policy is not applicable to any information collected offline or via channels other than this website. </p><p> <b xss=\'removed\'><i>Consent</i></b> </p><p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p><p> <b xss=\'removed\'><i>Information we collect</i></b> </p><p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p><p> If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide. </p><p> <b xss=\'removed\'><i>How we use your information</i></b> </p><p>We use the information we collect in various ways, including to:</p><p></p><ol> <li>Provide, operate, and maintain our website</li><li>Improve, personalize, and expand our website</li><li>Understand and analyze how you use our website</li><li>Develop <a target=\'_blank\' rel=\'nofollow\' href=\'https://adiyogifintech.com/services\' title=\'Link: https://adiyogifintech.com/services\'>New Service</a>, services, features, and functionality</li><li> Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes </li><li>Send you emails</li><li>Find and prevent fraud</li></ol> <p></p><p> <b xss=\'removed\'><i>Log Files</i></b> </p><p> Adiyogi Technosoft Pvt. Ltd. follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files includes internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information. </p><p> <b xss=\'removed\'><i>Advertising Partners Privacy Policies</i></b> </p><p>You may consult this list to find the Privacy Policy for each of the advertising partners of Adiyogi Technosoft Pvt. Ltd.</p><p> Third-party ad servers or ad networks use technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Adiyogi Technosoft Pvt. Ltd., which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit. </p><p>Note that Adiyogi Technosoft Pvt. Ltd. has no access to or control over these cookies that are used by third-party advertisers.</p><p> <b xss=\'removed\'><i>Third-Party Privacy Policies</i></b> </p><p> Adiyogi Technosoft Pvt. Ltd.\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt out of certain options. </p><p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.</p><p> <b xss=\'removed\'><i>CCPA Privacy Rights</i></b> (Do Not Sell My Personal Information) </p><p>Under the CCPA, among other rights, California consumers have the right to:</p><p></p><ul> <li> <b xss=\'removed\'><i> </i></b>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers. </li><li>Request that a business deletes any personal data about the consumer that a business has collected.</li><li>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.</li></ul> <p></p><p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p><p> <b xss=\'removed\'><i>GDPR Data Protection Rights</i></b> </p><p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p><p>The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.</p><p>The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</p><p>The right to erasure – You have the right to request that we erase your personal data, under certain conditions.</p><p>The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.</p><p>The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.</p><p>The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p><p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p><p> <b xss=\'removed\'><i>Children\'s Information</i></b> </p><p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p><p> Adiyogi Technosoft Pvt. Ltd. does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records. </p><p></p></div>', 1, NULL, '2025-04-28 03:47:17', '2025-04-28 03:47:17'),
(4, 'Term and Condition', NULL, '<div id=\'placeholders\'><h2><strong>Terms and Conditions</strong></h2></div>', 1, NULL, '2025-04-28 03:47:17', '2025-04-28 03:47:17');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount`, `type`, `valid_from`, `valid_to`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AKBPZZZS', '50.00', 'fixed', '2025-06-26 00:00:00', '2025-07-06 00:00:00', 'active', '2025-06-26 06:57:18', '2025-06-26 06:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(78, 44, 'product-gallery/1752818285_8520.png', '2025-07-18 00:28:05', '2025-07-18 00:28:05', NULL),
(79, 44, 'product-gallery/1752818285_3199.png', '2025-07-18 00:28:05', '2025-07-18 00:28:05', NULL),
(80, 45, 'product-gallery/1752818403_5182.png', '2025-07-18 00:30:03', '2025-07-18 00:30:03', NULL),
(81, 45, 'product-gallery/1752818403_6638.png', '2025-07-18 00:30:03', '2025-07-18 00:30:03', NULL),
(82, 44, 'product-gallery/1752819011_2107.png', '2025-07-18 00:40:11', '2025-07-18 00:40:11', NULL),
(83, 44, 'product-gallery/1752819011_6725.png', '2025-07-18 00:40:11', '2025-07-18 00:40:11', NULL),
(84, 46, 'product-gallery/1752833016_8523.png', '2025-07-18 04:33:36', '2025-07-18 04:33:36', NULL),
(85, 46, 'product-gallery/1752833016_1846.png', '2025-07-18 04:33:36', '2025-07-18 04:33:36', NULL),
(86, 46, 'product-gallery/1752839051_1227.jpeg', '2025-07-18 06:14:11', '2025-07-18 06:14:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_failed_jobs_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2022_09_17_166341_create_permission_modules_table', 1),
(5, '2022_09_17_166341_create_role_permissions_table', 1),
(6, '2022_09_17_166341_create_roles_table', 1),
(7, '2022_09_17_166341_create_user_permissions_table', 1),
(8, '2022_09_29_050121_create_setting_table', 1),
(9, '2022_11_18_051346_create_cms_table', 1),
(10, '2022_11_25_120548_create_cities_table', 1),
(11, '2022_11_25_120722_create_states_table', 1),
(12, '2022_11_30_111203_create_registration_otps_table', 1),
(13, '2023_01_20_172256_create_jobs_table', 1),
(14, '2025_04_28_075841_create_categories_table', 1),
(15, '2025_04_28_104410_create_products_table', 2),
(16, '2025_04_28_115601_create_subcategories_table', 3),
(17, '2025_04_29_044110_create_galleries_table', 4),
(18, '2025_04_30_050241_create_banners_table', 5),
(19, '2025_05_01_053245_create_app_users_table', 6),
(20, '2025_05_01_124146_create_tickets_table', 7),
(21, '2025_05_02_062315_create_newsletters_table', 8),
(22, '2025_05_02_084013_create_blog_categories_table', 9),
(23, '2025_05_02_112727_create_blogs_table', 10),
(24, '2025_05_12_102932_add_parent_id_to_categories_table', 11),
(25, '2025_05_22_115945_create_carts_table', 12),
(26, '2025_05_24_120305_create_wishlists_table', 13),
(27, '2025_05_26_061318_create_attributes_table', 14),
(28, '2025_05_26_061342_create_product_variants_table', 14),
(29, '2025_05_27_052418_add_price_to_product_variants_table', 15),
(30, '2025_06_25_100334_create_coupons_table', 16),
(31, '2025_06_25_100342_create_orders_table', 16),
(32, '2025_06_25_100351_create_order_items_table', 16),
(34, '2025_07_16_101100_update_categories_table_structure', 17),
(36, '2025_07_16_101300_update_products_back_photo_length', 18),
(37, '2025_07_16_101400_add_missing_foreign_keys', 18),
(38, '2025_07_16_101500_ensure_sql_structure_compatibility', 19),
(39, '2025_07_16_101200_add_galleries_to_products_table', 20),
(40, '2025_07_16_143239_update_carts_table_foreign_key_to_app_users', 20),
(41, '2025_07_16_144500_update_orders_table_foreign_key_to_app_users', 21),
(42, '2025_07_16_145000_update_wishlists_table_foreign_key_to_app_users', 22),
(43, '2025_07_16_145100_update_tickets_table_foreign_key_to_app_users', 22),
(44, '2025_07_16_143825_update_orders_table_foreign_key_to_app_users', 23),
(45, '2025_07_16_144000_update_orders_table_foreign_key_to_app_users', 23),
(47, '2025_07_16_161336_add_price_to_carts_table', 24),
(48, '2025_07_18_095542_add_size_to_product_variants_table', 25);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'devashish.soni003@gmail.com', '2025-05-02 01:09:20', '2025-05-02 01:09:20', NULL),
(2, 'devashish.soni003@gmail.com', '2025-05-02 01:09:33', '2025-05-02 01:09:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `razorpay_order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `total_amount`, `discount_amount`, `status`, `payment_status`, `razorpay_order_id`, `razorpay_payment_id`, `firstname`, `lastname`, `email`, `mobile_number`, `country`, `state`, `city`, `street`, `postal_code`, `notes`, `coupon_code`, `created_at`, `updated_at`) VALUES
(4, 1, 'ORD-1750920598', '4944.00', '0.00', 'pending', 'pending', 'order_QljQEnWE2sg0sx', NULL, 'Nitesh', 'Kumawat', 'business.kotiboxglobaltech@gmail.com', '4567892581', 'United States', 'Arkansas', 'Jaipur', 'jhgfgsd', '303006', 'hello', NULL, '2025-06-26 01:19:58', '2025-06-26 01:19:58'),
(5, 1, 'ORD-1750920966', '4944.00', '0.00', 'pending', 'pending', 'order_QljWjTHOAVBrdq', NULL, 'Nitesh', 'Kumawat', 'business.kotiboxglobaltech@gmail.com', '4567892581', 'United States', 'Arkansas', 'Jaipur', 'jhgfgsd', '303006', 'hello', NULL, '2025-06-26 01:26:06', '2025-06-26 01:26:06'),
(6, 1, 'ORD-1750921449', '4944.00', '0.00', 'pending', 'pending', 'order_QljfEEpnxEwmyI', NULL, 'Nitesh', 'Kumawat', 'business.kotiboxglobaltech@gmail.com', '4567892581', 'United States', 'Arkansas', 'Jaipur', 'jhgfgsd', '303006', 'hello', NULL, '2025-06-26 01:34:09', '2025-06-26 01:34:09'),
(7, 1, 'ORD-1750921536', '4944.00', '0.00', 'pending', 'pending', 'order_QljgkjoV5Cjif4', NULL, 'Nitesh', 'Kumawat', 'business.kotiboxglobaltech@gmail.com', '4567892581', 'United States', 'Arkansas', 'Jaipur', 'jhgfgsd', '303006', 'hello', NULL, '2025-06-26 01:35:36', '2025-06-26 01:35:36'),
(8, 1, 'ORD-1750921562', '4944.00', '0.00', 'pending', 'pending', 'order_QljhDjWDF2n6wR', NULL, 'Nitesh', 'Kumawat', 'business.kotiboxglobaltech@gmail.com', '4567892581', 'United States', 'Arkansas', 'Jaipur', 'jhgfgsd', '303006', 'hello', NULL, '2025-06-26 01:36:02', '2025-06-26 01:36:02'),
(9, 1, 'ORD-1750932089', '845.00', '0.00', 'pending', 'pending', 'order_QlmgY4IrjY2b35', NULL, 'Posh', 'Palette', 'business.kotiboxglobaltech@gmail.com', 'fgdfg', 'United States', 'Hawaii', 'fdgdfg', 'dfgfdg', '12345678', 'fdgfdgdfg gfdgfdg fgfg', NULL, '2025-06-26 04:31:29', '2025-06-26 04:31:29'),
(10, 1, 'ORD-1750932387', '845.00', '0.00', 'pending', 'pending', 'order_QlmlnHMolpghoL', NULL, 'Posh', 'Palette', 'business.kotiboxglobaltech@gmail.com', 'fgdfg', 'United States', 'Hawaii', 'fdgdfg', 'dfgfdg', '12345678', 'fdgfdgdfg gfdgfdg fgfg', NULL, '2025-06-26 04:36:27', '2025-06-26 04:36:27'),
(11, 1, 'ORD-1750933290', '100.00', '0.00', 'pending', 'pending', 'order_Qln1gQEcM2bREs', NULL, 'Posh', 'Palette', 'lakshminarayan@adiyogitechnosoft.com', '4567891235', 'United States', 'Alabama', 'xg', 'hG fa', '456789', 'v gfyusdfsgdf', NULL, '2025-06-26 04:51:30', '2025-06-26 04:51:30'),
(12, 1, 'ORD-1750935850', '100.00', '0.00', 'pending', 'pending', 'order_QlnkktNYX8mq3f', NULL, 'Posh', 'Palette', 'business.kotiboxglobaltech@gmail.com', '4569871235', 'United States', 'Alaska', 'hello', 'fjdfhfhdg', '3464564', 'hello u', NULL, '2025-06-26 05:34:10', '2025-06-26 05:34:10'),
(13, 1, 'ORD-1752662972', '3741.00', '0.00', 'pending', 'pending', 'order_QtiBh3MjMjP4ms', NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 05:19:32', '2025-07-16 05:19:32'),
(14, 1, 'ORD-1752667085', '1400.00', '0.00', 'pending', 'pending', 'order_QtjM6mPFlSXAEy', NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 06:28:05', '2025-07-16 06:28:05'),
(15, 1, 'ORD-1752667904', '3741.00', '0.00', 'pending', 'pending', 'order_QtjaXV5LCBaTkg', NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 06:41:44', '2025-07-16 06:41:44'),
(16, 1, 'ORD-1752668223', '1400.00', '0.00', 'pending', 'pending', 'order_Qtjg9jeSSKb47E', NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 06:47:03', '2025-07-16 06:47:03'),
(17, 1, 'ORD-1752668906', '1400.00', '0.00', 'processing', 'completed', 'order_QtjsAxWMbUjrfP', 'pay_QtjwOaLjJUEF1j', 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'bukjn', NULL, '2025-07-16 06:58:26', '2025-07-16 07:02:56'),
(18, 1, 'ORD-1752669357', '1400.00', '0.00', 'pending', 'pending', 'order_Qtk06dwYihlIQs', NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 07:05:57', '2025-07-16 07:05:57'),
(19, 1, 'ORD-1752669628', '1400.00', '0.00', 'pending', 'pending', 'order_Qtk4sutvKH2cSH', NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 07:10:28', '2025-07-16 07:10:28'),
(20, 1, 'ORD-1752670903', '1400.00', '0.00', 'pending', 'pending', 'order_QtkRL3bUwb0uVl', NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 07:31:43', '2025-07-16 07:31:43'),
(21, 1, 'ORD-1752672985', '1400.00', '0.00', 'processing', 'completed', 'order_Qtl1zMqySueHwA', 'pay_Qtl2mcwUySrDLD', 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 08:06:25', '2025-07-16 08:08:24'),
(22, 1, 'ORD-1752673372', '1400.00', '0.00', 'pending', 'pending', 'order_Qtl8oBOIU7YvfV', NULL, 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 08:12:52', '2025-07-16 08:12:52'),
(23, 1, 'ORD-1752673953', '1400.00', '0.00', 'processing', 'completed', 'order_QtlJ28RZBx3sPu', 'pay_QtlL3T54u3YxDY', 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 08:22:33', '2025-07-16 08:24:46'),
(26, 4, 'ORD-1752677423', '1400.00', '0.00', 'processing', 'completed', 'order_QtmI7JWEXWmy3v', 'pay_QtmIkHZTzvEgEU', 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test description', NULL, '2025-07-16 09:20:23', '2025-07-16 09:21:18'),
(27, 4, 'ORD-1752690993', '3599.00', '0.00', 'processing', 'completed', 'order_Qtq91l9XutK0rW', 'pay_Qtq9jfJuQhlhMP', 'Harshit', 'Sharma', 'harshitsharmaazz@gmail.com', '9680046983', 'India', 'Rajasthan', 'Jaipur', 'C-219, UNNATI VIHAR', '302013', 'test', NULL, '2025-07-16 13:06:33', '2025-07-16 13:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_modules`
--

DROP TABLE IF EXISTS `permission_modules`;
CREATE TABLE IF NOT EXISTS `permission_modules` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int NOT NULL,
  `can_add` tinyint NOT NULL,
  `can_edit` tinyint NOT NULL,
  `can_delete` tinyint NOT NULL,
  `can_view` tinyint NOT NULL,
  `allow_all` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_modules_module_id_unique` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_modules`
--

INSERT INTO `permission_modules` (`id`, `name`, `module_id`, `can_add`, `can_edit`, `can_delete`, `can_view`, `allow_all`) VALUES
(1, 'App Setting', 101, 0, 0, 0, 0, 0),
(2, 'Roles', 102, 0, 0, 0, 0, 0),
(3, 'Sub Admin', 103, 0, 0, 0, 0, 0),
(4, 'CMS', 104, 0, 0, 0, 0, 0),
(5, 'Location - State', 105, 0, 0, 0, 0, 0),
(6, 'Location - City', 106, 0, 0, 0, 0, 0),
(7, '...', 107, 0, 0, 0, 0, 0),
(8, '...', 108, 0, 0, 0, 0, 0),
(9, '...', 109, 0, 0, 0, 0, 0),
(10, '...', 110, 0, 0, 0, 0, 0),
(11, '...', 111, 0, 0, 0, 0, 0),
(12, '...', 112, 0, 0, 0, 0, 0),
(13, '...', 113, 0, 0, 0, 0, 0),
(14, '...', 114, 0, 0, 0, 0, 0),
(15, '...', 115, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_details` text COLLATE utf8mb4_unicode_ci,
  `specification_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specification_description` text COLLATE utf8mb4_unicode_ci,
  `is_specification` tinyint(1) NOT NULL DEFAULT '0',
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `back_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `reguler_price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `date` date DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `galleries` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_subcategory_id_foreign` (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `name`, `slug`, `sku`, `tags`, `video`, `sort_details`, `specification_name`, `specification_description`, `is_specification`, `details`, `photo`, `back_photo`, `sale_price`, `reguler_price`, `stock`, `meta_keywords`, `meta_description`, `status`, `is_type`, `date`, `link`, `galleries`, `deleted_at`, `created_at`, `updated_at`) VALUES
(44, 10, NULL, 'Test', 'test', '0123654789', '[{\"value\":\"bag\"}]', NULL, NULL, NULL, NULL, 0, 'bag description', 'products/1752819011_8329.png', 'back_photo/1752819011_4217.png', '1000.00', '1200.00', 10, 'bag', 'bag', 1, '1', NULL, NULL, '[{},{}]', NULL, '2025-07-18 00:28:05', '2025-07-18 00:40:11'),
(45, 10, NULL, 'Test', 'test-1', '0123654789', '[{\"value\":\"bag\"}]', NULL, NULL, NULL, NULL, 0, 'bag description', 'products/1752818403_5382.png', 'back_photo/1752818403_1102.png', '1000.00', '1200.00', 10, 'bag', 'bag', 1, '1', NULL, NULL, NULL, '2025-07-18 00:41:43', '2025-07-18 00:30:03', '2025-07-18 00:41:43'),
(46, 10, NULL, 'Test New', 'test-new', '0123654789', '[{\"value\":\"Bag\"}]', NULL, NULL, NULL, NULL, 0, 'Test New Product Dexription', 'products/1752833016_8497.png', 'back_photo/1752833016_5943.png', '1100.00', '1300.00', 30, 'bag', 'Test New Product Dexription', 1, '1', NULL, NULL, '[{}]', NULL, '2025-07-18 04:33:36', '2025-07-18 06:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int DEFAULT '0',
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variants_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `color`, `size`, `stock`, `price`, `image`, `created_at`, `updated_at`) VALUES
(9, 46, 'Red', '15', 5, '1000.00', 'variant-images/1752839020_8719.png', '2025-07-18 04:39:12', '2025-07-18 06:13:41'),
(10, 46, 'Blue', '14', 5, '900.00', 'variant-images/1752833352_9701.jpeg', '2025-07-18 04:39:12', '2025-07-18 04:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `registration_otps`
--

DROP TABLE IF EXISTS `registration_otps`;
CREATE TABLE IF NOT EXISTS `registration_otps` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '34286c4c-a60a-49dc-afb4-b67c17c794a9', 'Super Admin', 1, NULL, '2025-04-28 03:47:15', '2025-04-28 03:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE IF NOT EXISTS `role_permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` bigint NOT NULL,
  `can_view` tinyint NOT NULL,
  `can_add` tinyint NOT NULL,
  `can_edit` tinyint NOT NULL,
  `can_delete` tinyint NOT NULL,
  `allow_all` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_permissions_role_id_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `module_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `allow_all`) VALUES
(1, '1', 101, 1, 1, 1, 1, 1),
(2, '1', 102, 1, 1, 1, 1, 1),
(3, '1', 103, 1, 1, 1, 1, 1),
(4, '1', 104, 1, 1, 1, 1, 1),
(5, '1', 105, 1, 1, 1, 1, 1),
(6, '1', 106, 1, 1, 1, 1, 1),
(7, '1', 107, 1, 1, 1, 1, 1),
(8, '1', 108, 1, 1, 1, 1, 1),
(9, '1', 109, 1, 1, 1, 1, 1),
(10, '1', 110, 1, 1, 1, 1, 1),
(11, '1', 111, 1, 1, 1, 1, 1),
(12, '1', 112, 1, 1, 1, 1, 1),
(13, '1', 113, 1, 1, 1, 1, 1),
(14, '1', 114, 1, 1, 1, 1, 1),
(15, '1', 115, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `setting_type` tinyint DEFAULT NULL,
  `setting_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filed_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filed_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filed_value` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_type`, `setting_name`, `filed_label`, `filed_type`, `filed_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'favicon', 'Favicon (25*25)', 'file', 'storage/application/1747911634_9055.png', 1, '2025-04-28 03:47:16', '2025-05-22 05:30:34'),
(2, 1, 'logo', 'Logo', 'file', 'storage/application/1747911263_1336.png', 1, '2025-04-28 03:47:16', '2025-05-22 05:24:23'),
(3, 1, 'application_name', 'Application Name', 'text', 'POSHH PALATE', 1, '2025-04-28 03:47:16', '2025-07-18 03:40:15'),
(4, 1, 'copyright', 'Copyright', 'text', 'Copyright © 2023. All rights reserved.', 1, '2025-04-28 03:47:16', '2025-07-18 03:40:15'),
(5, 1, 'address', 'Address', 'text', 'Paota, Jodhpur, Rajasthan - 342001', 1, '2025-04-28 03:47:16', '2025-07-18 03:40:15'),
(6, 1, 'email', 'Email', 'text', 'lakshminarayan@adiyogitechnosoft.com', 1, '2025-04-28 03:47:16', '2025-07-18 03:40:15'),
(7, 1, 'phone', 'Phone', 'text', '+91-7568457070', 1, '2025-04-28 03:47:16', '2025-07-18 03:40:15'),
(8, 1, 'helpline_numbers', 'Helpline Numbers', 'text', '+91 0000000000', 1, '2025-04-28 03:47:16', '2025-07-18 03:40:15'),
(9, 2, 'facebook', 'Facebook', 'text', 'https://www.facebook.com', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16'),
(10, 2, 'twitter', 'Twitter', 'text', 'https://www.twitter.com', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16'),
(11, 2, 'linkdin', 'Linkdin', 'text', 'https://www.linkdin.com', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16'),
(12, 2, 'instagram', 'Instagram', 'text', 'https://www.instagram.com', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16'),
(13, 3, 'email_from', 'Email From', 'text', 'info@test.com', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16'),
(14, 3, 'smtp_host', 'SMTP Host', 'text', 'sandbox.smtp.mailtrap.io', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16'),
(15, 3, 'smtp_port', 'SMTP Port', 'text', '2525', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16'),
(16, 3, 'smtp_user', 'SMTP User', 'text', 'a39b56215c4b62', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16'),
(17, 3, 'smtp_pass', 'SMTP Password', 'text', 'b859477cd68576', 1, '2025-04-28 03:47:16', '2025-04-28 03:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Andaman & Nicobar Islands', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(2, 'Andhra Pradesh', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(3, 'Arunachal Pradesh', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(4, 'Assam', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(5, 'Bihar', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(6, 'Chandigarh', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(7, 'Chhattisgarh', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(8, 'Dadra & Nagar Haveli', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(9, 'Daman & Diu', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(10, 'Delhi', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(11, 'Goa', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(12, 'Gujarat', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(13, 'Haryana', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(14, 'Himachal Pradesh', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(15, 'Jammu & Kashmir', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(16, 'Jharkhand', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(17, 'Karnataka', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(18, 'Kerala', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(19, 'Lakshadweep', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(20, 'Madhya Pradesh', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(21, 'Maharashtra', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(22, 'Manipur', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(23, 'Meghalaya', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(24, 'Mizoram', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(25, 'Nagaland', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(26, 'Odisha', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(27, 'Puducherry', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(28, 'Punjab', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(29, 'Rajasthan', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(30, 'Sikkim', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(31, 'Tamil Nadu', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(32, 'Tripura', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(33, 'Uttar Pradesh', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(34, 'Uttarakhand', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16'),
(35, 'West Bengal', 1, NULL, '2025-04-28 09:17:16', '2025-04-28 09:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategories_slug_unique` (`slug`),
  KEY `subcategories_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `slug`, `category_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Blue', 'blue', 1, 1, '2025-04-29 06:31:05', '2025-04-29 06:31:05', NULL),
(7, 'Test', 'test', 2, 1, '2025-05-07 06:44:33', '2025-05-07 06:44:33', NULL),
(8, 'fdfghgjhgcfxds', 'cvvbgfgdfd', 4, 1, '2025-05-12 00:42:18', '2025-05-12 00:42:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('open','closed','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `role_id` bigint NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`),
  KEY `users_role_id_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userId`, `name`, `slug`, `email`, `mobile`, `state_id`, `city_id`, `status`, `role_id`, `image`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'A000001', 'Admin', '7cc1da20-fe60-4b15-b9bd-0e4fb4eee6c5', 'admin@admin.com', '7568457070', NULL, NULL, 1, 1, 'admin/avatar.png', '2025-04-28 03:47:16', '$2y$10$/wVDBdmvawSsZ1vIa3MAkOLSVFvOOBTmgRtZqPH/A0pPvLB5iIQcu', 'rcRhFPACEKZSbc99KsCEGZK6XYMizNOYWEqERpJ97T1T5kz94TEgimB56qtb', NULL, '2025-04-28 03:47:16', '2025-04-28 03:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE IF NOT EXISTS `user_permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` bigint NOT NULL,
  `can_view` tinyint NOT NULL,
  `can_add` tinyint NOT NULL,
  `can_edit` tinyint NOT NULL,
  `can_delete` tinyint NOT NULL,
  `allow_all` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `module_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `allow_all`) VALUES
(1, '1', 101, 1, 1, 1, 1, 1),
(2, '1', 102, 1, 1, 1, 1, 1),
(3, '1', 103, 1, 1, 1, 1, 1),
(4, '1', 104, 1, 1, 1, 1, 1),
(5, '1', 105, 1, 1, 1, 1, 1),
(6, '1', 106, 1, 1, 1, 1, 1),
(7, '1', 107, 1, 1, 1, 1, 1),
(8, '1', 108, 1, 1, 1, 1, 1),
(9, '1', 109, 1, 1, 1, 1, 1),
(10, '1', 110, 1, 1, 1, 1, 1),
(11, '1', 111, 1, 1, 1, 1, 1),
(12, '1', 112, 1, 1, 1, 1, 1),
(13, '1', 113, 1, 1, 1, 1, 1),
(14, '1', 114, 1, 1, 1, 1, 1),
(15, '1', 115, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
