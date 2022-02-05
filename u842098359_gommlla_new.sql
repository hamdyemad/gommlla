-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 25, 2021 at 11:03 PM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u842098359_gommlla_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT 1,
  `image` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `unique_identifier`, `version`, `activated`, `image`, `created_at`, `updated_at`) VALUES
(1, 'club_point', 'club_point', '1.2', 1, 'club_points.png', '2020-07-16 13:00:42', '2020-11-22 15:59:02'),
(2, 'Offline Payment', 'offline_payment', '1.3', 1, 'offline_banner.jpg', '2020-07-19 22:19:10', '2020-11-22 15:59:43'),
(3, 'OTP', 'otp_system', '1.3', 1, 'otp_system.jpg', '2020-07-19 22:20:12', '2020-11-22 15:58:30'),
(4, 'Point of Sale', 'pos_system', '1.3', 1, 'pos_banner.jpg', '2020-11-16 19:14:48', '2020-11-22 15:57:36'),
(5, 'refund', 'refund_request', '1.1', 1, 'refund_request.png', '2020-11-22 16:02:04', '2020-11-22 16:02:04'),
(6, 'Seller Subscription System', 'seller_subscription', '1.2', 1, 'seller_subscription.jpg', '2021-10-28 20:57:25', '2021-10-28 20:57:25'),
(7, 'affiliate', 'affiliate_system', '1.4', 1, 'affiliate_banner.jpg', '2021-10-28 20:58:16', '2021-10-28 20:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `country`, `city`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(1, 8, 'cairo', 'egypt', 'cairo', '123456', '123456789', 0, '2020-11-18 16:19:08', '2020-11-18 16:19:08'),
(3, 13, 'القاهرة', 'Egypt', 'nasr city', '123', '01096432967', 0, '2020-11-18 21:24:24', '2020-11-18 21:24:24'),
(4, 12, 'Illum eius fugiat', 'American Samoa', 'Vel cillum et culpa', 'Et veniam magnam qu', '+1 (805) 486-8367', 0, '2021-08-26 18:59:00', '2021-08-26 18:59:00'),
(5, 45, 'Rerum corporis et de', 'Ukraine', 'Nisi dolor possimus', 'Deserunt earum velit', '+1 (387) 719-8244', 0, '2021-08-28 15:51:48', '2021-08-28 15:51:48'),
(6, 45, 'Rerum corporis et de', 'Ukraine', 'Nisi dolor possimus', 'Deserunt earum velit', '+1 (387) 719-8244', 0, '2021-08-28 15:51:49', '2021-08-28 15:51:49'),
(7, 47, 'Quis qui odio aliqua', 'Mexico', 'Necessitatibus exerc', 'Aspernatur sed vero', '+1 (817) 551-2432', 0, '2021-08-28 16:09:17', '2021-08-28 16:09:17'),
(8, 60, 'ايلوسدظد', 'Egypt', 'Giza', '57157', '01283337434', 0, '2021-10-28 03:03:39', '2021-10-28 03:03:39'),
(9, 58, 'امبابه شارع الوحده', 'Egypt', 'الجيزه', '4508', '01283337434', 0, '2021-10-28 05:31:09', '2021-10-28 05:31:09'),
(10, 69, 'امبابه شارع الوحده امام العسكري', 'Egypt', 'الجيزه', '13344', '+2001206689263', 0, '2021-11-25 18:26:06', '2021-11-25 18:26:06');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_configs`
--

CREATE TABLE `affiliate_configs` (
  `id` int(11) NOT NULL,
  `type` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_configs`
--

INSERT INTO `affiliate_configs` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\"}]', '2020-03-09 09:56:21', '2020-03-09 04:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_options`
--

CREATE TABLE `affiliate_options` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf32_unicode_ci DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_options`
--

INSERT INTO `affiliate_options` (`id`, `type`, `details`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(2, 'user_registration_first_purchase', NULL, 20, 1, '2020-03-03 05:08:37', '2020-03-05 03:56:30'),
(3, 'product_sharing', NULL, 20, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32'),
(4, 'category_wise_affiliate', NULL, 0, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE `affiliate_payments` (
  `id` int(11) NOT NULL,
  `affiliate_user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `affiliate_payments`
--

INSERT INTO `affiliate_payments` (`id`, `affiliate_user_id`, `amount`, `payment_method`, `payment_details`, `created_at`, `updated_at`) VALUES
(2, 1, 20.00, 'Paypal', NULL, '2020-03-10 02:04:30', '2020-03-10 02:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_users`
--

CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL,
  `paypal_email` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `bank_information` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `informations` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `balance` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_users`
--

INSERT INTO `affiliate_users` (`id`, `paypal_email`, `bank_information`, `user_id`, `informations`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'demo@gmail.com', '123456', 8, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Nostrum dicta sint l\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"Aut perferendis null\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"Voluptatem Sit dolo\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"Ut ad beatae occaeca\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"Porro sint soluta u\"}]', 30.00, 1, '2020-03-09 05:35:07', '2020-03-10 02:04:30'),
(2, NULL, NULL, 70, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"\\u0645\\u0627\\u0631\\u064a\\u0627\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"arsanuos35@gmail.com\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"\\u0649\\u0649\\u0633\\u064a\\u0646\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"01283337434\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"\\u062c\\u0631\\u0648\\u0628\\u0627\\u062a \\u0627\\u0644\\u0641\\u064a\\u0633\\u0628\\u0648\\u0643\"}]', 0.00, 0, '2021-11-25 20:28:22', '2021-11-25 20:28:22'),
(3, NULL, NULL, 72, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Mustafa\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"mustafa@gmail.com\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"test\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"012312312312\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"22\"}]', 0.00, 0, '2021-11-26 01:43:05', '2021-11-26 01:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_withdraw_requests`
--

CREATE TABLE `affiliate_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `name`, `logo`, `currency_id`, `currency_format`, `facebook`, `twitter`, `instagram`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'MATGGAR', 'uploads/logo/matggar.png', 1, 'symbol', 'https://facebook.com', 'https://twitter.com', 'https://instagram.com', 'https://youtube.com', 'https://google.com', '2019-08-04 14:39:15', '2019-08-04 14:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'الوزن', '2021-08-29 23:20:57', '2021-08-29 23:20:57'),
(11, 'الخامة', '2021-11-25 19:45:35', '2021-11-25 19:45:35'),
(12, 'المقاسات', '2021-11-25 19:45:43', '2021-11-25 19:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(2, 3, 'الوزن', 'sa', '2021-08-29 23:20:57', '2021-08-29 23:20:57'),
(10, 11, 'الخامة', 'sa', '2021-11-25 19:45:35', '2021-11-25 19:45:35'),
(11, 12, 'المقاسات', 'sa', '2021-11-25 19:45:43', '2021-11-25 19:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `url`, `position`, `published`, `created_at`, `updated_at`) VALUES
(4, '1', '#', 1, 0, '2019-03-12 03:58:23', '2020-11-21 13:20:36'),
(5, '2', '#', 1, 0, '2019-03-12 03:58:41', '2020-11-21 13:20:36'),
(7, '3', '#', 2, 0, '2019-05-26 03:16:38', '2020-11-21 13:20:36'),
(8, '4', '#', 2, 0, '2019-06-11 03:00:06', '2020-11-21 13:20:36'),
(9, '5', '#', 1, 0, '2019-06-11 03:00:15', '2020-11-21 13:20:36'),
(10, '6', '#', 1, 0, '2019-06-11 03:00:24', '2020-11-21 13:20:36'),
(11, '7', '#', 1, 1, '2020-07-11 20:05:42', '2020-11-21 13:20:36'),
(12, '8', '#', 1, 1, '2020-07-11 20:06:08', '2020-11-21 13:20:36'),
(13, '9', '#', 1, 1, '2020-07-11 20:06:35', '2020-11-21 13:20:36'),
(14, '10', '#', 2, 1, '2020-07-12 03:28:04', '2020-11-21 13:20:36'),
(15, '11', '#', 2, 1, '2020-07-12 03:28:48', '2020-11-21 13:20:36'),
(16, '12', '#', 2, 1, '2020-07-12 03:29:14', '2020-11-21 13:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `top`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Nike', '13', 1, 'Demo-brand-12', 'Demo brand', NULL, '2019-03-12 04:05:56', '2020-11-21 13:20:36'),
(2, 'Zara', '14', 1, 'Demo-brand1', 'Demo brand1', NULL, '2019-03-12 04:06:13', '2020-11-21 13:20:36'),
(3, 'D&G', '15', 1, 'DG-5sE8x', NULL, NULL, '2020-07-29 10:55:40', '2020-11-21 13:20:36'),
(4, 'CHANEL', '16', 1, 'CHANEL-yOLEj', NULL, NULL, '2020-07-29 10:58:46', '2020-11-21 13:20:36'),
(5, 'LOUIS VUITTON', '17', 1, 'LOUIS-VUITTON-XZF7L', NULL, NULL, '2020-07-29 11:00:49', '2020-11-21 13:20:36'),
(6, 'DIOR', '18', 1, 'DIOR-n27zS', NULL, NULL, '2020-07-29 11:02:47', '2020-11-21 13:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `brand_translations`
--

CREATE TABLE `brand_translations` (
  `id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'home_default_currency', '12', '2018-10-15 23:35:52', '2020-06-14 19:51:37'),
(2, 'system_default_currency', '29', '2018-10-15 23:36:58', '2021-08-31 01:51:44'),
(3, 'currency_format', '1', '2018-10-17 01:01:59', '2018-10-17 01:01:59'),
(4, 'symbol_format', '1', '2018-10-17 01:01:59', '2019-01-20 00:10:55'),
(5, 'no_of_decimals', '3', '2018-10-17 01:01:59', '2020-03-03 22:57:16'),
(6, 'product_activation', '1', '2018-10-27 23:38:37', '2019-02-03 23:11:41'),
(7, 'vendor_system_activation', '1', '2018-10-28 05:44:16', '2019-02-03 23:11:38'),
(8, 'show_vendors', '1', '2018-10-28 05:44:47', '2019-02-03 23:11:13'),
(9, 'paypal_payment', '0', '2018-10-28 05:45:16', '2021-01-13 13:35:18'),
(10, 'stripe_payment', '0', '2018-10-28 05:45:47', '2021-01-13 13:35:17'),
(11, 'cash_payment', '1', '2018-10-28 05:46:05', '2019-01-24 01:40:18'),
(12, 'payumoney_payment', '0', '2018-10-28 05:46:27', '2019-03-05 03:41:36'),
(13, 'best_selling', '1', '2018-12-24 06:13:44', '2019-02-14 03:29:13'),
(14, 'paypal_sandbox', '0', '2019-01-16 10:44:18', '2019-01-16 10:44:18'),
(15, 'sslcommerz_sandbox', '1', '2019-01-16 10:44:18', '2019-03-13 22:07:26'),
(16, 'sslcommerz_payment', '0', '2019-01-24 07:39:07', '2019-01-29 04:13:46'),
(17, 'vendor_commission', '20', '2019-01-31 04:18:04', '2019-04-13 04:49:26'),
(18, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Shop name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"License No\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"file\",\"label\":\"Tax Papers\"}]', '2019-02-03 09:36:58', '2019-02-16 04:14:42'),
(19, 'google_analytics', '0', '2019-02-06 10:22:35', '2019-02-06 10:22:35'),
(20, 'facebook_login', '0', '2019-02-07 10:51:59', '2019-02-08 17:41:15'),
(21, 'google_login', '1', '2019-02-07 10:52:10', '2021-01-13 13:29:58'),
(22, 'twitter_login', '0', '2019-02-07 10:52:20', '2019-02-08 00:32:56'),
(23, 'payumoney_payment', '1', '2019-03-05 09:38:17', '2019-03-05 09:38:17'),
(24, 'payumoney_sandbox', '1', '2019-03-05 09:38:17', '2019-03-05 03:39:18'),
(36, 'facebook_chat', '1', '2019-04-15 09:45:04', '2020-07-18 10:27:52'),
(37, 'email_verification', '0', '2019-04-30 05:30:07', '2019-04-30 05:30:07'),
(38, 'wallet_system', '1', '2019-05-19 06:05:44', '2020-11-29 11:51:50'),
(39, 'coupon_system', '1', '2019-06-11 07:46:18', '2020-11-29 11:53:07'),
(40, 'current_version', '3.6', '2019-06-11 07:46:18', '2019-06-11 07:46:18'),
(41, 'instamojo_payment', '0', '2019-07-06 07:58:03', '2019-07-06 07:58:03'),
(42, 'instamojo_sandbox', '1', '2019-07-06 07:58:43', '2019-07-06 07:58:43'),
(43, 'razorpay', '0', '2019-07-06 07:58:43', '2019-07-06 07:58:43'),
(44, 'paystack', '0', '2019-07-21 11:00:38', '2019-07-21 11:00:38'),
(45, 'pickup_point', '1', '2019-10-17 09:50:39', '2020-07-05 22:54:35'),
(46, 'maintenance_mode', '0', '2019-10-17 09:51:04', '2021-08-03 18:02:39'),
(47, 'voguepay', '0', '2019-10-17 09:51:24', '2019-10-17 09:51:24'),
(48, 'voguepay_sandbox', '0', '2019-10-17 09:51:38', '2019-10-17 09:51:38'),
(50, 'category_wise_commission', '0', '2020-01-21 05:22:47', '2020-01-21 05:22:47'),
(51, 'conversation_system', '1', '2020-01-21 05:23:21', '2020-01-21 05:23:21'),
(52, 'guest_checkout_active', '1', '2020-01-22 05:36:38', '2020-01-22 05:36:38'),
(53, 'facebook_pixel', '0', '2020-01-22 09:43:58', '2020-01-22 09:43:58'),
(55, 'classified_product', '1', '2020-05-13 11:01:05', '2020-11-29 12:44:16'),
(56, 'club_point_convert_rate', '10', '2019-03-12 03:58:23', '2019-03-12 03:58:23'),
(57, 'pos_activation_for_seller', '1', '2020-07-19 17:05:07', '2020-07-19 17:05:07'),
(58, 'shipping_type', 'product_wise_shipping', '2020-07-19 17:05:07', '2020-07-19 17:05:07'),
(59, 'flat_rate_shipping_cost', '0', '2020-07-19 17:05:07', '2020-07-19 17:05:07'),
(60, 'shipping_cost_admin', '0', '2020-07-19 17:05:07', '2020-07-19 17:05:07'),
(61, 'payhere_sandbox', '0', '2020-11-16 11:06:59', '2020-11-16 11:06:59'),
(62, 'payhere', '0', '2020-11-16 11:06:59', '2020-11-16 11:06:59'),
(63, 'google_recaptcha', '0', '2020-11-16 11:06:59', '2020-11-16 11:06:59'),
(64, 'ngenius', '0', '2020-11-16 11:06:59', '2020-11-16 11:06:59'),
(65, 'header_logo', '227', '2020-11-21 07:20:35', '2021-11-17 16:28:09'),
(66, 'show_language_switcher', 'on', '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(67, 'show_currency_switcher', 'on', '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(68, 'header_stikcy', 'on', '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(69, 'footer_logo', '227', '2020-11-21 07:20:35', '2021-11-17 16:28:41'),
(70, 'about_us_description', NULL, '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(71, 'contact_address', NULL, '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(72, 'contact_phone', NULL, '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(73, 'contact_email', NULL, '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(74, 'widget_one_labels', '[\"\\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\",\"\\u0645\\u0646 \\u0646\\u062d\\u0646\"]', '2020-11-21 07:20:35', '2020-12-13 10:09:23'),
(75, 'widget_one_links', '[\"https:\\/\\/tycoon.today\\/index.php\",\"https:\\/\\/tycoon.today\\/index.php\\/aboutus\"]', '2020-11-21 07:20:35', '2021-08-03 02:18:38'),
(76, 'widget_one', 'متجر TYCOON', '2020-11-21 07:20:35', '2021-08-03 02:18:07'),
(77, 'frontend_copyright_text', 'All rights Reserved for Gommlla', '2020-11-21 07:20:35', '2021-11-17 16:39:12'),
(78, 'show_social_links', 'on', '2020-11-21 07:20:35', '2021-08-03 02:24:40'),
(79, 'facebook_link', '#', '2020-11-21 07:20:35', '2021-08-03 02:24:40'),
(80, 'twitter_link', '#', '2020-11-21 07:20:35', '2021-08-03 02:24:40'),
(81, 'instagram_link', '#', '2020-11-21 07:20:35', '2021-08-03 02:24:40'),
(82, 'youtube_link', '#', '2020-11-21 07:20:35', '2021-08-03 02:24:40'),
(83, 'linkedin_link', '#', '2020-11-21 07:20:35', '2021-08-03 02:24:40'),
(84, 'payment_method_images', NULL, '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(85, 'home_slider_images', '[\"212\",\"214\",\"215\"]', '2020-11-21 07:20:35', '2021-08-26 18:24:55'),
(86, 'home_slider_links', '[\"#\",\"#\",\"#\"]', '2020-11-21 07:20:35', '2021-08-26 18:24:55'),
(87, 'home_banner1_images', '[\"212\",\"214\",\"215\"]', '2020-11-21 07:20:35', '2021-08-26 18:27:43'),
(88, 'home_banner1_links', '[\"#\",\"#\",\"#\"]', '2020-11-21 07:20:35', '2020-11-24 04:30:08'),
(89, 'home_banner2_images', '[\"215\",\"213\",\"212\",\"214\"]', '2020-11-21 07:20:35', '2021-08-26 18:28:27'),
(90, 'home_banner2_links', '[\"#\",\"#\",\"#\",\"#\"]', '2020-11-21 07:20:35', '2021-08-26 18:28:27'),
(91, 'home_categories', '[1,2,4,3,5]', '2020-11-21 07:20:35', '2020-11-21 13:20:37'),
(92, 'top10_categories', '[1,2,3,4,5]', '2020-11-21 07:20:35', '2020-11-21 13:20:37'),
(93, 'top10_brands', '[1,2,3,4,5,6]', '2020-11-21 07:20:35', '2020-11-21 13:20:37'),
(94, 'website_name', 'Gommlla', '2020-11-21 07:20:35', '2021-11-17 16:29:53'),
(95, 'site_motto', 'The Best Store In World', '2020-11-21 07:20:35', '2021-08-03 02:17:09'),
(96, 'site_icon', '227', '2020-11-21 07:20:35', '2021-11-17 16:29:53'),
(97, 'base_color', '#ff6702', '2020-11-21 07:20:35', '2021-11-17 16:25:34'),
(98, 'base_hov_color', '#77be44', '2020-11-21 07:20:35', '2021-08-24 03:20:23'),
(99, 'meta_title', 'Gommlla', '2020-11-21 07:20:35', '2021-11-17 16:35:00'),
(100, 'meta_description', 'تشكيلة واسعة من السبورات و ملابس السهرة - جلابيب وفساتين وعبايات شرعية - كل ما يخص الاطفال من ملابس ومستلزمات بيبي', '2020-11-21 07:20:35', '2021-08-03 16:12:18'),
(101, 'meta_keywords', NULL, '2020-11-21 07:20:35', '2021-08-03 02:16:50'),
(102, 'meta_image', '227', '2020-11-21 07:20:35', '2021-11-17 16:35:00'),
(103, 'site_name', 'Gommlla MARKETPLACE', '2020-11-21 07:20:35', '2021-11-17 16:37:18'),
(104, 'system_logo_white', '227', '2020-11-21 07:20:35', '2021-11-17 16:37:18'),
(105, 'system_logo_black', '227', '2020-11-21 07:20:35', '2021-11-17 16:37:18'),
(106, 'timezone', NULL, '2020-11-21 07:20:35', '2020-11-21 07:20:35'),
(107, 'admin_login_background', '227', '2020-11-21 07:20:35', '2021-11-17 16:37:18'),
(108, 'refund_request_time', '3', '2019-03-12 08:58:23', '2019-03-12 08:58:23'),
(109, 'refund_sticker', '163', '2020-11-23 16:22:11', '2020-11-23 16:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `created_at`, `updated_at`) VALUES
(44, 38, 70, NULL, 100.00, 10.00, 0.00, 1, '2020-12-16 22:52:54', '2020-12-16 22:52:54'),
(48, 18, 16, NULL, 170.00, 0.00, 0.00, 2, '2020-12-23 13:57:32', '2020-12-23 13:57:32'),
(49, 18, 33, NULL, 350.00, 0.00, 0.00, 2, '2020-12-23 14:01:10', '2020-12-23 14:01:10'),
(50, 18, 37, NULL, 500.00, 0.00, 0.00, 2, '2020-12-23 14:02:16', '2020-12-23 14:02:16'),
(51, 12, 70, 'Blue-43', 100.00, 10.00, 0.00, 2, '2020-12-23 14:21:13', '2020-12-23 14:21:13'),
(52, 18, 70, 'Blue-43', 100.00, 10.00, 0.00, 2, '2020-12-23 14:28:25', '2020-12-23 14:28:25'),
(53, 18, 70, 'Blue-44', 100.00, 10.00, 0.00, 2, '2020-12-23 14:28:47', '2020-12-23 14:28:47'),
(54, 18, 70, NULL, 100.00, 10.00, 0.00, 2, '2020-12-23 14:31:00', '2020-12-23 14:31:00'),
(55, 38, 41, NULL, 300.00, 0.00, 0.00, 1, '2020-12-29 11:53:37', '2020-12-29 11:53:37'),
(56, 38, 58, NULL, 150.00, 0.00, 0.00, 1, '2021-01-08 18:54:27', '2021-01-08 18:54:27'),
(57, 12, 60, NULL, 150.00, 0.00, 0.00, 2, '2021-01-14 09:48:16', '2021-01-14 09:48:16'),
(65, 35, 53, '18', 20.00, 20.00, 0.00, 1, '2021-01-14 11:38:08', '2021-01-14 11:38:08'),
(66, 35, 53, '19', 20.00, 20.00, 0.00, 1, '2021-01-14 11:38:25', '2021-01-14 11:38:25'),
(67, 35, 53, '20', 20.00, 20.00, 0.00, 1, '2021-01-14 11:38:34', '2021-01-14 11:38:34'),
(68, 35, 56, 'Aquamarine-l', 150.00, 0.00, 0.00, 1, '2021-01-14 11:42:53', '2021-01-14 11:42:53'),
(69, 35, 46, '43', 100.00, 0.00, 0.00, 1, '2021-01-14 11:43:16', '2021-01-14 11:43:16'),
(70, 39, 61, NULL, 142.50, 0.00, 0.00, 1, '2021-03-26 04:01:30', '2021-03-26 04:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `img` int(11) DEFAULT NULL,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT 0,
  `top` int(1) NOT NULL DEFAULT 0,
  `digital` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `level`, `img`, `commision_rate`, `banner`, `icon`, `featured`, `top`, `digital`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(5, 'أحذية', NULL, 0, 197, 0.00, '199', '191', 1, 1, 0, '-e5bil', NULL, NULL, '2021-06-24 07:09:17', '2021-06-25 00:09:17');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(5, 5, 'أحذية', 'sa', '2020-11-24 00:00:22', '2020-11-24 00:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `club_points`
--

CREATE TABLE `club_points` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `points` double(18,2) NOT NULL,
  `convert_status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `club_points`
--

INSERT INTO `club_points` (`id`, `user_id`, `order_id`, `points`, `convert_status`, `created_at`, `updated_at`) VALUES
(1, 13, 0, 0.00, 1, '2020-11-23 17:04:16', '2020-11-23 17:27:26'),
(2, 13, 0, 0.00, 1, '2020-11-23 17:24:21', '2020-11-23 17:27:22'),
(3, 13, 0, 100.00, 1, '2020-11-23 17:45:45', '2020-11-23 17:46:59'),
(4, 13, 0, 100.00, 1, '2020-11-23 21:55:04', '2020-11-29 11:31:13'),
(5, 13, 0, 100.00, 1, '2020-11-23 21:56:27', '2020-11-29 11:32:23'),
(6, 13, 0, 100.00, 1, '2020-11-23 21:57:02', '2020-11-29 11:41:44'),
(7, 13, 0, 100.00, 1, '2020-11-23 21:57:21', '2020-11-29 12:34:10'),
(8, 13, 0, 100.00, 1, '2020-11-23 21:58:06', '2020-11-29 12:34:11'),
(9, 13, 0, 100.00, 1, '2020-11-23 21:58:31', '2020-11-29 12:34:12'),
(10, 13, 0, 100.00, 1, '2020-11-23 21:59:12', '2020-11-29 12:50:05'),
(11, 13, 0, 100.00, 1, '2020-11-23 22:05:30', '2020-11-29 12:50:45'),
(12, 13, 0, 100.00, 1, '2020-11-23 23:06:53', '2020-11-29 12:50:30'),
(13, 13, 0, 0.00, 1, '2020-11-25 16:23:57', '2020-11-29 12:50:26'),
(14, 13, 0, 100.00, 1, '2020-11-25 23:48:48', '2020-11-29 12:50:22'),
(15, 13, 0, 0.00, 1, '2020-11-26 22:15:31', '2020-11-29 12:50:18'),
(16, 13, 0, 0.00, 1, '2020-11-29 12:38:14', '2020-11-29 12:50:13'),
(17, 13, 0, 200.00, 1, '2020-11-29 13:29:45', '2020-11-29 13:34:55'),
(18, 13, 0, 100.00, 1, '2020-11-29 13:34:17', '2020-11-29 13:34:52'),
(19, 23, 0, 0.00, 1, '2020-11-29 20:01:04', '2020-11-29 20:01:04'),
(20, 24, 0, 100.00, 1, '2020-11-29 21:01:05', '2020-11-29 21:01:05'),
(21, 26, 0, 100.00, 1, '2020-11-29 21:02:06', '2020-11-29 21:02:06'),
(22, 27, 0, 100.00, 1, '2020-11-29 21:02:16', '2020-11-29 21:02:16'),
(23, 29, 0, 100.00, 1, '2020-11-29 21:03:11', '2020-11-29 21:03:11'),
(24, 30, 0, 300.00, 1, '2020-11-29 21:05:10', '2020-11-29 21:05:10'),
(25, 31, 0, 200.00, 1, '2020-11-29 21:07:24', '2020-11-29 21:07:24'),
(26, 32, 0, 200.00, 1, '2020-11-29 21:11:14', '2020-11-29 21:11:14'),
(27, 24, 0, 200.00, 1, '2020-11-29 22:19:44', '2020-11-29 22:19:44'),
(28, 24, 0, 100.00, 1, '2020-11-29 22:22:13', '2020-11-29 22:22:13'),
(29, 24, 0, 100.00, 1, '2020-11-29 22:23:48', '2020-11-29 22:23:48'),
(30, 13, 76, 200.00, 1, '2020-12-07 10:04:03', '2020-12-07 10:04:03'),
(31, 12, 84, 200.00, 1, '2020-12-07 18:11:31', '2020-12-07 18:11:31'),
(32, 12, 85, 200.00, 1, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(33, 35, 86, 0.00, 1, '2020-12-08 12:34:18', '2020-12-08 12:34:18'),
(34, 35, 87, 0.00, 1, '2020-12-08 13:57:28', '2020-12-08 13:57:28'),
(35, 35, 88, 0.00, 1, '2020-12-08 14:06:51', '2020-12-08 14:06:51'),
(36, 35, 89, 0.00, 1, '2020-12-08 14:07:53', '2020-12-08 14:07:53'),
(37, 35, 90, 0.00, 1, '2020-12-08 15:03:53', '2020-12-08 15:03:53'),
(38, 12, 91, 0.00, 1, '2020-12-09 14:00:40', '2020-12-09 14:00:40'),
(39, 12, 91, 0.00, 1, '2020-12-09 15:57:57', '2020-12-09 15:57:57'),
(40, 35, 90, 0.00, 1, '2020-12-09 18:51:16', '2020-12-09 18:51:16'),
(41, 35, 89, 0.00, 1, '2020-12-09 18:52:34', '2020-12-09 18:52:34'),
(42, 12, 92, 0.00, 1, '2020-12-09 22:58:03', '2020-12-09 22:58:03'),
(43, 35, 93, 0.00, 1, '2020-12-09 22:58:13', '2020-12-09 22:58:13'),
(44, 35, 94, 100.00, 1, '2020-12-09 23:11:27', '2020-12-09 23:11:27'),
(45, 35, 95, 0.00, 1, '2020-12-10 12:46:05', '2020-12-10 12:46:05'),
(46, 35, 96, 0.00, 1, '2020-12-10 13:00:44', '2020-12-10 13:00:44'),
(47, 35, 97, 0.00, 1, '2020-12-10 13:57:06', '2020-12-13 17:08:18'),
(48, 13, 98, 0.00, 1, '2020-12-10 18:26:06', '2020-12-10 18:26:06'),
(49, 35, 99, 200.00, 1, '2020-12-10 22:40:30', '2020-12-10 22:40:30'),
(50, 35, 100, 0.00, 1, '2020-12-10 22:43:01', '2020-12-10 22:43:01'),
(51, 35, 101, 0.00, 1, '2020-12-13 08:48:13', '2020-12-13 08:48:13'),
(52, 13, 102, 0.00, 0, '2020-12-13 10:39:46', '2020-12-13 17:08:26'),
(53, 13, 103, 200.00, 0, '2020-12-13 17:10:32', '2020-12-13 17:10:32'),
(54, 13, 105, 0.00, 1, '2020-12-13 17:23:17', '2020-12-13 19:49:57'),
(55, 13, 106, 200.00, 1, '2020-12-13 18:27:53', '2020-12-13 18:27:53'),
(56, 37, 107, 0.00, 1, '2020-12-16 17:39:12', '2020-12-16 17:39:12'),
(57, 40, 113, 100.00, 0, '2021-07-25 20:37:17', '2021-07-25 20:37:17'),
(58, 47, 118, 300.00, 0, '2021-08-28 16:17:11', '2021-08-28 16:17:11'),
(59, 47, 119, 0.00, 0, '2021-08-29 23:07:19', '2021-08-29 23:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `club_point_details`
--

CREATE TABLE `club_point_details` (
  `id` int(11) NOT NULL,
  `club_point_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `point` double(8,2) NOT NULL,
  `refund_status` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `club_point_details`
--

INSERT INTO `club_point_details` (`id`, `club_point_id`, `product_id`, `product_qty`, `point`, `refund_status`, `created_at`, `updated_at`) VALUES
(1, 1, 70, 0, 0.00, 0, '2020-11-23 17:04:16', '2020-11-23 17:04:16'),
(2, 2, 70, 0, 0.00, 0, '2020-11-23 17:24:21', '2020-11-23 17:24:21'),
(3, 3, 70, 0, 100.00, 0, '2020-11-23 17:45:45', '2020-11-23 17:45:45'),
(4, 4, 70, 0, 100.00, 0, '2020-11-23 21:55:04', '2020-11-23 21:55:04'),
(5, 5, 70, 0, 100.00, 0, '2020-11-23 21:56:27', '2020-11-23 21:56:27'),
(6, 6, 70, 0, 100.00, 0, '2020-11-23 21:57:02', '2020-11-23 21:57:02'),
(7, 7, 70, 0, 100.00, 0, '2020-11-23 21:57:21', '2020-11-23 21:57:21'),
(8, 8, 70, 0, 100.00, 0, '2020-11-23 21:58:06', '2020-11-23 21:58:06'),
(9, 9, 70, 0, 100.00, 0, '2020-11-23 21:58:31', '2020-11-23 21:58:31'),
(10, 10, 70, 0, 100.00, 0, '2020-11-23 21:59:12', '2020-11-23 21:59:12'),
(11, 11, 70, 0, 100.00, 0, '2020-11-23 22:05:30', '2020-11-23 22:05:30'),
(12, 12, 70, 0, 100.00, 0, '2020-11-23 23:06:53', '2020-11-23 23:06:53'),
(13, 13, 15, 0, 0.00, 0, '2020-11-25 16:23:57', '2020-11-25 16:23:57'),
(14, 13, 16, 0, 0.00, 0, '2020-11-25 16:23:57', '2020-11-25 16:23:57'),
(15, 14, 70, 0, 0.00, 0, '2020-11-25 23:48:48', '2020-11-25 23:48:48'),
(16, 14, 68, 0, 0.00, 0, '2020-11-25 23:48:48', '2020-11-25 23:48:48'),
(17, 15, 16, 0, 0.00, 0, '2020-11-26 22:15:32', '2020-11-26 22:15:32'),
(18, 16, 16, 0, 0.00, 0, '2020-11-29 12:38:14', '2020-11-29 12:38:14'),
(19, 17, 70, 0, 200.00, 0, '2020-11-29 13:29:45', '2020-11-29 13:29:45'),
(20, 18, 70, 0, 100.00, 0, '2020-11-29 13:34:17', '2020-11-29 13:34:17'),
(21, 19, 15, 0, 0.00, 0, '2020-11-29 20:01:04', '2020-11-29 20:01:04'),
(22, 20, 70, 0, 100.00, 0, '2020-11-29 21:01:05', '2020-11-29 21:01:05'),
(23, 21, 70, 0, 100.00, 0, '2020-11-29 21:02:06', '2020-11-29 21:02:06'),
(24, 22, 70, 0, 100.00, 0, '2020-11-29 21:02:16', '2020-11-29 21:02:16'),
(25, 23, 70, 0, 100.00, 0, '2020-11-29 21:03:11', '2020-11-29 21:03:11'),
(26, 24, 70, 0, 300.00, 0, '2020-11-29 21:05:10', '2020-11-29 21:05:10'),
(27, 25, 70, 0, 200.00, 0, '2020-11-29 21:07:24', '2020-11-29 21:07:24'),
(28, 26, 70, 0, 200.00, 0, '2020-11-29 21:11:14', '2020-11-29 21:11:14'),
(29, 27, 70, 0, 200.00, 0, '2020-11-29 22:19:44', '2020-11-29 22:19:44'),
(30, 28, 70, 0, 100.00, 0, '2020-11-29 22:22:13', '2020-11-29 22:22:13'),
(31, 29, 70, 0, 100.00, 0, '2020-11-29 22:23:48', '2020-11-29 22:23:48'),
(32, 30, 22, 0, 200.00, 0, '2020-12-07 10:04:03', '2020-12-07 10:04:03'),
(33, 30, 70, 0, 200.00, 0, '2020-12-07 10:04:03', '2020-12-07 10:04:03'),
(34, 31, 50, 0, 200.00, 0, '2020-12-07 18:11:31', '2020-12-07 18:11:31'),
(35, 31, 70, 0, 200.00, 0, '2020-12-07 18:11:31', '2020-12-07 18:11:31'),
(36, 32, 70, 0, 0.00, 0, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(37, 32, 50, 0, 0.00, 0, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(38, 32, 45, 0, 0.00, 0, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(39, 33, 61, 0, 0.00, 0, '2020-12-08 12:34:18', '2020-12-08 12:34:18'),
(40, 34, 60, 0, 0.00, 0, '2020-12-08 13:57:28', '2020-12-08 13:57:28'),
(41, 35, 61, 0, 0.00, 0, '2020-12-08 14:06:51', '2020-12-08 14:06:51'),
(42, 36, 56, 0, 0.00, 0, '2020-12-08 14:07:53', '2020-12-08 14:07:53'),
(43, 37, 57, 0, 0.00, 0, '2020-12-08 15:03:53', '2020-12-08 15:03:53'),
(44, 38, 45, 0, 0.00, 0, '2020-12-09 14:00:40', '2020-12-09 14:00:40'),
(45, 39, 45, 0, 0.00, 0, '2020-12-09 15:57:57', '2020-12-09 15:57:57'),
(46, 40, 57, 0, 0.00, 0, '2020-12-09 18:51:16', '2020-12-09 18:51:16'),
(47, 41, 56, 0, 0.00, 0, '2020-12-09 18:52:34', '2020-12-09 18:52:34'),
(48, 43, 50, 0, 0.00, 0, '2020-12-09 22:58:13', '2020-12-09 22:58:13'),
(49, 44, 70, 0, 100.00, 0, '2020-12-09 23:11:27', '2020-12-09 23:11:27'),
(50, 45, 61, 0, 0.00, 0, '2020-12-10 12:46:05', '2020-12-10 12:46:05'),
(51, 46, 61, 0, 0.00, 0, '2020-12-10 13:00:44', '2020-12-10 13:00:44'),
(52, 47, 70, 0, 200.00, 1, '2020-12-10 13:57:06', '2020-12-13 17:08:18'),
(53, 48, 71, 0, 0.00, 1, '2020-12-10 18:26:06', '2020-12-10 18:52:45'),
(54, 49, 70, 0, 0.00, 0, '2020-12-10 22:40:30', '2020-12-10 22:40:30'),
(55, 49, 60, 0, 0.00, 0, '2020-12-10 22:40:30', '2020-12-10 22:40:30'),
(56, 50, 67, 0, 0.00, 0, '2020-12-10 22:43:01', '2020-12-10 22:43:01'),
(57, 51, 60, 0, 0.00, 0, '2020-12-13 08:48:13', '2020-12-13 08:48:13'),
(58, 51, 52, 0, 0.00, 0, '2020-12-13 08:48:13', '2020-12-13 08:48:13'),
(59, 52, 15, 0, 100.00, 0, '2020-12-13 10:39:46', '2020-12-13 10:39:46'),
(60, 52, 70, 0, 100.00, 1, '2020-12-13 10:39:46', '2020-12-13 17:08:26'),
(61, 53, 70, 0, 200.00, 1, '2020-12-13 17:10:32', '2020-12-13 17:19:53'),
(62, 54, 70, 0, 400.00, 1, '2020-12-13 17:23:17', '2020-12-13 17:24:11'),
(63, 55, 70, 0, 200.00, 0, '2020-12-13 18:27:53', '2020-12-13 18:27:53'),
(64, 56, 50, 0, 0.00, 0, '2020-12-16 17:39:12', '2020-12-16 17:39:12'),
(65, 57, 70, 0, 0.00, 0, '2021-07-25 20:37:18', '2021-07-25 20:37:18'),
(66, 57, 53, 0, 0.00, 0, '2021-07-25 20:37:18', '2021-07-25 20:37:18'),
(67, 57, 54, 0, 0.00, 0, '2021-07-25 20:37:18', '2021-07-25 20:37:18'),
(68, 58, 70, 0, 0.00, 0, '2021-08-28 16:17:11', '2021-08-28 16:17:11'),
(69, 58, 69, 0, 0.00, 0, '2021-08-28 16:17:11', '2021-08-28 16:17:11'),
(70, 58, 69, 0, 0.00, 0, '2021-08-28 16:17:11', '2021-08-28 16:17:11'),
(71, 59, 63, 0, 0.00, 0, '2021-08-29 23:07:19', '2021-08-29 23:07:19'),
(72, 59, 62, 0, 0.00, 0, '2021-08-29 23:07:19', '2021-08-29 23:07:19'),
(73, 59, 67, 0, 0.00, 0, '2021-08-29 23:07:19', '2021-08-29 23:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 00:12:26', '2018-11-05 00:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(47, 'Purple', '#800080', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 00:12:27', '2018-11-05 00:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(64, 'Green', '#008000', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(68, 'Olive', '#808000', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(74, 'Teal', '#008080', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(98, 'Navy', '#000080', '2018-11-05 00:12:28', '2018-11-05 00:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 00:12:29', '2018-11-05 00:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(138, 'Gray', '#808080', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 00:12:30', '2018-11-05 00:12:30'),
(143, 'Black', '#000000', '2018-11-05 00:12:30', '2018-11-05 00:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT 1,
  `receiver_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `sender_id`, `receiver_id`, `title`, `sender_viewed`, `receiver_viewed`, `created_at`, `updated_at`) VALUES
(1, 12, 12, 'بلوزة تونيك ثلثيني مقاسات واسعة فضفاضة', 1, 1, '2020-07-18 10:28:59', '2020-11-16 19:28:24'),
(2, 12, 12, 'حذاء شبابي', 1, 1, '2020-12-02 16:26:22', '2020-12-02 16:33:47'),
(3, 12, 12, 'حذاء شبابي. are there. any new colro in black', 1, 1, '2020-12-02 16:26:55', '2020-12-02 16:34:23'),
(4, 12, 12, 'فستان بناتي  are there. the same color in red', 1, 1, '2020-12-02 20:21:09', '2020-12-02 20:24:18'),
(5, 13, 12, 'حذاء شبابي test messame', 1, 1, '2020-12-03 10:37:24', '2020-12-03 11:40:48'),
(6, 12, 12, 'test message', 1, 0, '2020-12-03 11:31:47', '2020-12-03 11:31:47'),
(7, 12, 12, 'test message', 1, 0, '2020-12-03 11:35:39', '2020-12-03 11:35:39'),
(8, 12, 12, 'test message', 1, 0, '2020-12-03 11:36:23', '2020-12-03 11:36:23'),
(9, 12, 12, 'test message', 1, 0, '2020-12-03 11:37:06', '2020-12-03 11:37:06'),
(10, 12, 12, 'test message', 1, 0, '2020-12-03 21:13:46', '2020-12-03 21:13:46'),
(11, 35, 12, 'test message', 1, 1, '2020-12-03 21:14:15', '2020-12-03 21:19:07'),
(12, 35, 12, 'kmes title', 1, 1, '2020-12-05 09:15:24', '2020-12-06 10:25:21'),
(13, 35, 12, 'test message', 1, 1, '2020-12-05 09:15:32', '2020-12-09 13:41:33'),
(14, 35, 12, 'kmes title', 1, 1, '2020-12-05 09:26:00', '2020-12-09 13:40:53'),
(15, 35, 12, 'هل اللون متوفر', 1, 1, '2020-12-07 12:24:52', '2020-12-09 13:40:10'),
(16, 35, 12, 'هل يوجد لون احمر ؟', 1, 1, '2020-12-08 15:02:45', '2020-12-09 13:23:24'),
(17, 37, 12, 'هل يمكن الحصول على لون اخر', 1, 1, '2020-12-16 17:38:02', '2020-12-16 17:41:38'),
(18, 35, 12, 'طقم خروج', 1, 1, '2020-12-17 09:37:29', '2020-12-17 09:39:48'),
(19, 12, 12, 'قميص اولادي', 1, 1, '2021-10-27 05:31:45', '2021-10-27 05:32:55'),
(20, 60, 12, 'قميص اولادي', 1, 0, '2021-10-28 02:40:05', '2021-10-28 02:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, NULL, NULL),
(2, 'AL', 'Albania', 1, NULL, NULL),
(3, 'DZ', 'Algeria', 1, NULL, NULL),
(4, 'DS', 'American Samoa', 1, NULL, NULL),
(5, 'AD', 'Andorra', 1, NULL, NULL),
(6, 'AO', 'Angola', 1, NULL, NULL),
(7, 'AI', 'Anguilla', 1, NULL, NULL),
(8, 'AQ', 'Antarctica', 1, NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(10, 'AR', 'Argentina', 1, NULL, NULL),
(11, 'AM', 'Armenia', 1, NULL, NULL),
(12, 'AW', 'Aruba', 1, NULL, NULL),
(13, 'AU', 'Australia', 1, NULL, NULL),
(14, 'AT', 'Austria', 1, NULL, NULL),
(15, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(16, 'BS', 'Bahamas', 1, NULL, NULL),
(17, 'BH', 'Bahrain', 1, NULL, NULL),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 1, NULL, NULL),
(20, 'BY', 'Belarus', 1, NULL, NULL),
(21, 'BE', 'Belgium', 1, NULL, NULL),
(22, 'BZ', 'Belize', 1, NULL, NULL),
(23, 'BJ', 'Benin', 1, NULL, NULL),
(24, 'BM', 'Bermuda', 1, NULL, NULL),
(25, 'BT', 'Bhutan', 1, NULL, NULL),
(26, 'BO', 'Bolivia', 1, NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(28, 'BW', 'Botswana', 1, NULL, NULL),
(29, 'BV', 'Bouvet Island', 1, NULL, NULL),
(30, 'BR', 'Brazil', 1, NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(33, 'BG', 'Bulgaria', 1, NULL, NULL),
(34, 'BF', 'Burkina Faso', 1, NULL, NULL),
(35, 'BI', 'Burundi', 1, NULL, NULL),
(36, 'KH', 'Cambodia', 1, NULL, NULL),
(37, 'CM', 'Cameroon', 1, NULL, NULL),
(38, 'CA', 'Canada', 1, NULL, NULL),
(39, 'CV', 'Cape Verde', 1, NULL, NULL),
(40, 'KY', 'Cayman Islands', 1, NULL, NULL),
(41, 'CF', 'Central African Republic', 1, NULL, NULL),
(42, 'TD', 'Chad', 1, NULL, NULL),
(43, 'CL', 'Chile', 1, NULL, NULL),
(44, 'CN', 'China', 1, NULL, NULL),
(45, 'CX', 'Christmas Island', 1, NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(47, 'CO', 'Colombia', 1, NULL, NULL),
(48, 'KM', 'Comoros', 1, NULL, NULL),
(49, 'CG', 'Congo', 1, NULL, NULL),
(50, 'CK', 'Cook Islands', 1, NULL, NULL),
(51, 'CR', 'Costa Rica', 1, NULL, NULL),
(52, 'HR', 'Croatia (Hrvatska)', 1, NULL, NULL),
(53, 'CU', 'Cuba', 1, NULL, NULL),
(54, 'CY', 'Cyprus', 1, NULL, NULL),
(55, 'CZ', 'Czech Republic', 1, NULL, NULL),
(56, 'DK', 'Denmark', 1, NULL, NULL),
(57, 'DJ', 'Djibouti', 1, NULL, NULL),
(58, 'DM', 'Dominica', 1, NULL, NULL),
(59, 'DO', 'Dominican Republic', 1, NULL, NULL),
(60, 'TP', 'East Timor', 1, NULL, NULL),
(61, 'EC', 'Ecuador', 1, NULL, NULL),
(62, 'EG', 'Egypt', 1, NULL, NULL),
(63, 'SV', 'El Salvador', 1, NULL, NULL),
(64, 'GQ', 'Equatorial Guinea', 1, NULL, NULL),
(65, 'ER', 'Eritrea', 1, NULL, NULL),
(66, 'EE', 'Estonia', 1, NULL, NULL),
(67, 'ET', 'Ethiopia', 1, NULL, NULL),
(68, 'FK', 'Falkland Islands (Malvinas)', 1, NULL, NULL),
(69, 'FO', 'Faroe Islands', 1, NULL, NULL),
(70, 'FJ', 'Fiji', 1, NULL, NULL),
(71, 'FI', 'Finland', 1, NULL, NULL),
(72, 'FR', 'France', 1, NULL, NULL),
(73, 'FX', 'France, Metropolitan', 1, NULL, NULL),
(74, 'GF', 'French Guiana', 1, NULL, NULL),
(75, 'PF', 'French Polynesia', 1, NULL, NULL),
(76, 'TF', 'French Southern Territories', 1, NULL, NULL),
(77, 'GA', 'Gabon', 1, NULL, NULL),
(78, 'GM', 'Gambia', 1, NULL, NULL),
(79, 'GE', 'Georgia', 1, NULL, NULL),
(80, 'DE', 'Germany', 1, NULL, NULL),
(81, 'GH', 'Ghana', 1, NULL, NULL),
(82, 'GI', 'Gibraltar', 1, NULL, NULL),
(83, 'GK', 'Guernsey', 1, NULL, NULL),
(84, 'GR', 'Greece', 1, NULL, NULL),
(85, 'GL', 'Greenland', 1, NULL, NULL),
(86, 'GD', 'Grenada', 1, NULL, NULL),
(87, 'GP', 'Guadeloupe', 1, NULL, NULL),
(88, 'GU', 'Guam', 1, NULL, NULL),
(89, 'GT', 'Guatemala', 1, NULL, NULL),
(90, 'GN', 'Guinea', 1, NULL, NULL),
(91, 'GW', 'Guinea-Bissau', 1, NULL, NULL),
(92, 'GY', 'Guyana', 1, NULL, NULL),
(93, 'HT', 'Haiti', 1, NULL, NULL),
(94, 'HM', 'Heard and Mc Donald Islands', 1, NULL, NULL),
(95, 'HN', 'Honduras', 1, NULL, NULL),
(96, 'HK', 'Hong Kong', 1, NULL, NULL),
(97, 'HU', 'Hungary', 1, NULL, NULL),
(98, 'IS', 'Iceland', 1, NULL, NULL),
(99, 'IN', 'India', 1, NULL, NULL),
(100, 'IM', 'Isle of Man', 1, NULL, NULL),
(101, 'ID', 'Indonesia', 1, NULL, NULL),
(102, 'IR', 'Iran (Islamic Republic of)', 1, NULL, NULL),
(103, 'IQ', 'Iraq', 1, NULL, NULL),
(104, 'IE', 'Ireland', 1, NULL, NULL),
(105, 'IL', 'Israel', 1, NULL, NULL),
(106, 'IT', 'Italy', 1, NULL, NULL),
(107, 'CI', 'Ivory Coast', 1, NULL, NULL),
(108, 'JE', 'Jersey', 1, NULL, NULL),
(109, 'JM', 'Jamaica', 1, NULL, NULL),
(110, 'JP', 'Japan', 1, NULL, NULL),
(111, 'JO', 'Jordan', 1, NULL, NULL),
(112, 'KZ', 'Kazakhstan', 1, NULL, NULL),
(113, 'KE', 'Kenya', 1, NULL, NULL),
(114, 'KI', 'Kiribati', 1, NULL, NULL),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 1, NULL, NULL),
(116, 'KR', 'Korea, Republic of', 1, NULL, NULL),
(117, 'XK', 'Kosovo', 1, NULL, NULL),
(118, 'KW', 'Kuwait', 1, NULL, NULL),
(119, 'KG', 'Kyrgyzstan', 1, NULL, NULL),
(120, 'LA', 'Lao People\'s Democratic Republic', 1, NULL, NULL),
(121, 'LV', 'Latvia', 1, NULL, NULL),
(122, 'LB', 'Lebanon', 1, NULL, NULL),
(123, 'LS', 'Lesotho', 1, NULL, NULL),
(124, 'LR', 'Liberia', 1, NULL, NULL),
(125, 'LY', 'Libyan Arab Jamahiriya', 1, NULL, NULL),
(126, 'LI', 'Liechtenstein', 1, NULL, NULL),
(127, 'LT', 'Lithuania', 1, NULL, NULL),
(128, 'LU', 'Luxembourg', 1, NULL, NULL),
(129, 'MO', 'Macau', 1, NULL, NULL),
(130, 'MK', 'Macedonia', 1, NULL, NULL),
(131, 'MG', 'Madagascar', 1, NULL, NULL),
(132, 'MW', 'Malawi', 1, NULL, NULL),
(133, 'MY', 'Malaysia', 1, NULL, NULL),
(134, 'MV', 'Maldives', 1, NULL, NULL),
(135, 'ML', 'Mali', 1, NULL, NULL),
(136, 'MT', 'Malta', 1, NULL, NULL),
(137, 'MH', 'Marshall Islands', 1, NULL, NULL),
(138, 'MQ', 'Martinique', 1, NULL, NULL),
(139, 'MR', 'Mauritania', 1, NULL, NULL),
(140, 'MU', 'Mauritius', 1, NULL, NULL),
(141, 'TY', 'Mayotte', 1, NULL, NULL),
(142, 'MX', 'Mexico', 1, NULL, NULL),
(143, 'FM', 'Micronesia, Federated States of', 1, NULL, NULL),
(144, 'MD', 'Moldova, Republic of', 1, NULL, NULL),
(145, 'MC', 'Monaco', 1, NULL, NULL),
(146, 'MN', 'Mongolia', 1, NULL, NULL),
(147, 'ME', 'Montenegro', 1, NULL, NULL),
(148, 'MS', 'Montserrat', 1, NULL, NULL),
(149, 'MA', 'Morocco', 1, NULL, NULL),
(150, 'MZ', 'Mozambique', 1, NULL, NULL),
(151, 'MM', 'Myanmar', 1, NULL, NULL),
(152, 'NA', 'Namibia', 1, NULL, NULL),
(153, 'NR', 'Nauru', 1, NULL, NULL),
(154, 'NP', 'Nepal', 1, NULL, NULL),
(155, 'NL', 'Netherlands', 1, NULL, NULL),
(156, 'AN', 'Netherlands Antilles', 1, NULL, NULL),
(157, 'NC', 'New Caledonia', 1, NULL, NULL),
(158, 'NZ', 'New Zealand', 1, NULL, NULL),
(159, 'NI', 'Nicaragua', 1, NULL, NULL),
(160, 'NE', 'Niger', 1, NULL, NULL),
(161, 'NG', 'Nigeria', 1, NULL, NULL),
(162, 'NU', 'Niue', 1, NULL, NULL),
(163, 'NF', 'Norfolk Island', 1, NULL, NULL),
(164, 'MP', 'Northern Mariana Islands', 1, NULL, NULL),
(165, 'NO', 'Norway', 1, NULL, NULL),
(166, 'OM', 'Oman', 1, NULL, NULL),
(167, 'PK', 'Pakistan', 1, NULL, NULL),
(168, 'PW', 'Palau', 1, NULL, NULL),
(169, 'PS', 'Palestine', 1, NULL, NULL),
(170, 'PA', 'Panama', 1, NULL, NULL),
(171, 'PG', 'Papua New Guinea', 1, NULL, NULL),
(172, 'PY', 'Paraguay', 1, NULL, NULL),
(173, 'PE', 'Peru', 1, NULL, NULL),
(174, 'PH', 'Philippines', 1, NULL, NULL),
(175, 'PN', 'Pitcairn', 1, NULL, NULL),
(176, 'PL', 'Poland', 1, NULL, NULL),
(177, 'PT', 'Portugal', 1, NULL, NULL),
(178, 'PR', 'Puerto Rico', 1, NULL, NULL),
(179, 'QA', 'Qatar', 1, NULL, NULL),
(180, 'RE', 'Reunion', 1, NULL, NULL),
(181, 'RO', 'Romania', 1, NULL, NULL),
(182, 'RU', 'Russian Federation', 1, NULL, NULL),
(183, 'RW', 'Rwanda', 1, NULL, NULL),
(184, 'KN', 'Saint Kitts and Nevis', 1, NULL, NULL),
(185, 'LC', 'Saint Lucia', 1, NULL, NULL),
(186, 'VC', 'Saint Vincent and the Grenadines', 1, NULL, NULL),
(187, 'WS', 'Samoa', 1, NULL, NULL),
(188, 'SM', 'San Marino', 1, NULL, NULL),
(189, 'ST', 'Sao Tome and Principe', 1, NULL, NULL),
(190, 'SA', 'Saudi Arabia', 1, NULL, NULL),
(191, 'SN', 'Senegal', 1, NULL, NULL),
(192, 'RS', 'Serbia', 1, NULL, NULL),
(193, 'SC', 'Seychelles', 1, NULL, NULL),
(194, 'SL', 'Sierra Leone', 1, NULL, NULL),
(195, 'SG', 'Singapore', 1, NULL, NULL),
(196, 'SK', 'Slovakia', 1, NULL, NULL),
(197, 'SI', 'Slovenia', 1, NULL, NULL),
(198, 'SB', 'Solomon Islands', 1, NULL, NULL),
(199, 'SO', 'Somalia', 1, NULL, NULL),
(200, 'ZA', 'South Africa', 1, NULL, NULL),
(201, 'GS', 'South Georgia South Sandwich Islands', 1, NULL, NULL),
(202, 'SS', 'South Sudan', 1, NULL, NULL),
(203, 'ES', 'Spain', 1, NULL, NULL),
(204, 'LK', 'Sri Lanka', 1, NULL, NULL),
(205, 'SH', 'St. Helena', 1, NULL, NULL),
(206, 'PM', 'St. Pierre and Miquelon', 1, NULL, NULL),
(207, 'SD', 'Sudan', 1, NULL, NULL),
(208, 'SR', 'Suriname', 1, NULL, NULL),
(209, 'SJ', 'Svalbard and Jan Mayen Islands', 1, NULL, NULL),
(210, 'SZ', 'Swaziland', 1, NULL, NULL),
(211, 'SE', 'Sweden', 1, NULL, NULL),
(212, 'CH', 'Switzerland', 1, NULL, NULL),
(213, 'SY', 'Syrian Arab Republic', 1, NULL, NULL),
(214, 'TW', 'Taiwan', 1, NULL, NULL),
(215, 'TJ', 'Tajikistan', 1, NULL, NULL),
(216, 'TZ', 'Tanzania, United Republic of', 1, NULL, NULL),
(217, 'TH', 'Thailand', 1, NULL, NULL),
(218, 'TG', 'Togo', 1, NULL, NULL),
(219, 'TK', 'Tokelau', 1, NULL, NULL),
(220, 'TO', 'Tonga', 1, NULL, NULL),
(221, 'TT', 'Trinidad and Tobago', 1, NULL, NULL),
(222, 'TN', 'Tunisia', 1, NULL, NULL),
(223, 'TR', 'Turkey', 1, NULL, NULL),
(224, 'TM', 'Turkmenistan', 1, NULL, NULL),
(225, 'TC', 'Turks and Caicos Islands', 1, NULL, NULL),
(226, 'TV', 'Tuvalu', 1, NULL, NULL),
(227, 'UG', 'Uganda', 1, NULL, NULL),
(228, 'UA', 'Ukraine', 1, NULL, NULL),
(229, 'AE', 'United Arab Emirates', 1, NULL, NULL),
(230, 'GB', 'United Kingdom', 1, NULL, NULL),
(231, 'US', 'United States', 1, NULL, NULL),
(232, 'UM', 'United States minor outlying islands', 1, NULL, NULL),
(233, 'UY', 'Uruguay', 1, NULL, NULL),
(234, 'UZ', 'Uzbekistan', 1, NULL, NULL),
(235, 'VU', 'Vanuatu', 1, NULL, NULL),
(236, 'VA', 'Vatican City State', 1, NULL, NULL),
(237, 'VE', 'Venezuela', 1, NULL, NULL),
(238, 'VN', 'Vietnam', 1, NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', 1, NULL, NULL),
(240, 'VI', 'Virgin Islands (U.S.)', 1, NULL, NULL),
(241, 'WF', 'Wallis and Futuna Islands', 1, NULL, NULL),
(242, 'EH', 'Western Sahara', 1, NULL, NULL),
(243, 'YE', 'Yemen', 1, NULL, NULL),
(244, 'ZR', 'Zaire', 1, NULL, NULL),
(245, 'ZM', 'Zambia', 1, NULL, NULL),
(246, 'ZW', 'Zimbabwe', 1, NULL, NULL),
(247, 'AF', 'Afghanistan', 1, NULL, NULL),
(248, 'AL', 'Albania', 1, NULL, NULL),
(249, 'DZ', 'Algeria', 1, NULL, NULL),
(250, 'DS', 'American Samoa', 1, NULL, NULL),
(251, 'AD', 'Andorra', 1, NULL, NULL),
(252, 'AO', 'Angola', 1, NULL, NULL),
(253, 'AI', 'Anguilla', 1, NULL, NULL),
(254, 'AQ', 'Antarctica', 1, NULL, NULL),
(255, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(256, 'AR', 'Argentina', 1, NULL, NULL),
(257, 'AM', 'Armenia', 1, NULL, NULL),
(258, 'AW', 'Aruba', 1, NULL, NULL),
(259, 'AU', 'Australia', 1, NULL, NULL),
(260, 'AT', 'Austria', 1, NULL, NULL),
(261, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(262, 'BS', 'Bahamas', 1, NULL, NULL),
(263, 'BH', 'Bahrain', 1, NULL, NULL),
(264, 'BD', 'Bangladesh', 1, NULL, NULL),
(265, 'BB', 'Barbados', 1, NULL, NULL),
(266, 'BY', 'Belarus', 1, NULL, NULL),
(267, 'BE', 'Belgium', 1, NULL, NULL),
(268, 'BZ', 'Belize', 1, NULL, NULL),
(269, 'BJ', 'Benin', 1, NULL, NULL),
(270, 'BM', 'Bermuda', 1, NULL, NULL),
(271, 'BT', 'Bhutan', 1, NULL, NULL),
(272, 'BO', 'Bolivia', 1, NULL, NULL),
(273, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(274, 'BW', 'Botswana', 1, NULL, NULL),
(275, 'BV', 'Bouvet Island', 1, NULL, NULL),
(276, 'BR', 'Brazil', 1, NULL, NULL),
(277, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(278, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(279, 'BG', 'Bulgaria', 1, NULL, NULL),
(280, 'BF', 'Burkina Faso', 1, NULL, NULL),
(281, 'BI', 'Burundi', 1, NULL, NULL),
(282, 'KH', 'Cambodia', 1, NULL, NULL),
(283, 'CM', 'Cameroon', 1, NULL, NULL),
(284, 'CA', 'Canada', 1, NULL, NULL),
(285, 'CV', 'Cape Verde', 1, NULL, NULL),
(286, 'KY', 'Cayman Islands', 1, NULL, NULL),
(287, 'CF', 'Central African Republic', 1, NULL, NULL),
(288, 'TD', 'Chad', 1, NULL, NULL),
(289, 'CL', 'Chile', 1, NULL, NULL),
(290, 'CN', 'China', 1, NULL, NULL),
(291, 'CX', 'Christmas Island', 1, NULL, NULL),
(292, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(293, 'CO', 'Colombia', 1, NULL, NULL),
(294, 'KM', 'Comoros', 1, NULL, NULL),
(295, 'CG', 'Congo', 1, NULL, NULL),
(296, 'CK', 'Cook Islands', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `free_shipping` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `count` int(11) NOT NULL DEFAULT 1,
  `count_use` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `type`, `code`, `details`, `discount`, `discount_type`, `start_date`, `end_date`, `created_at`, `updated_at`, `free_shipping`, `count`, `count_use`) VALUES
(1, 'type', '12acd12', '', 10.00, 'discount', 2147483647, 2147483647, '2020-11-18 11:08:22', '2020-11-18 11:08:22', 'no', 1, 0),
(2, 'category_base', 'cdshcd', '[{\"product_id\":15},{\"product_id\":16},{\"product_id\":17},{\"product_id\":18},{\"product_id\":19},{\"product_id\":24},{\"product_id\":25},{\"product_id\":26},{\"product_id\":27},{\"product_id\":28},{\"product_id\":29},{\"product_id\":30},{\"product_id\":31},{\"product_id\":32},{\"product_id\":33},{\"product_id\":34},{\"product_id\":35},{\"product_id\":36},{\"product_id\":37},{\"product_id\":38},{\"product_id\":39},{\"product_id\":40},{\"product_id\":41},{\"product_id\":42},{\"product_id\":55},{\"product_id\":56},{\"product_id\":57},{\"product_id\":58},{\"product_id\":71}]', 10.00, 'percent', 1624536000, 1625227200, '2021-06-24 21:55:34', '2021-06-24 21:55:34', 'yes', 1, 0),
(3, 'product_base', 'zaweq234', '[{\"product_id\":\"80\"}]', 1.00, 'amount', 1633035600, 1637874000, '2021-10-27 05:24:19', '2021-10-27 05:24:19', 'no', 120, 0);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `exchange_rate`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'U.S. Dollar', '$', 1.00000, 1, 'USD', '2018-10-09 09:35:08', '2018-10-17 03:50:52'),
(2, 'Australian Dollar', '$', 1.28000, 1, 'AUD', '2018-10-09 09:35:08', '2019-02-04 03:51:55'),
(5, 'Brazilian Real', 'R$', 3.25000, 1, 'BRL', '2018-10-09 09:35:08', '2018-10-17 03:51:00'),
(6, 'Canadian Dollar', '$', 1.27000, 1, 'CAD', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(7, 'Czech Koruna', 'Kč', 20.65000, 1, 'CZK', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(8, 'Danish Krone', 'kr', 6.05000, 1, 'DKK', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(9, 'Euro', '€', 0.85000, 1, 'EUR', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(10, 'Hong Kong Dollar', '$', 7.83000, 1, 'HKD', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(11, 'Hungarian Forint', 'Ft', 255.24000, 1, 'HUF', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(12, 'شيكل', '₪', 3.48000, 1, 'ILS', '2018-10-09 09:35:08', '2020-06-27 16:45:30'),
(13, 'Japanese Yen', '¥', 107.12000, 1, 'JPY', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(14, 'Malaysian Ringgit', 'RM', 3.91000, 1, 'MYR', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(15, 'Mexican Peso', '$', 18.72000, 1, 'MXN', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(16, 'Norwegian Krone', 'kr', 7.83000, 1, 'NOK', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(17, 'New Zealand Dollar', '$', 1.38000, 1, 'NZD', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(18, 'Philippine Peso', '₱', 52.26000, 1, 'PHP', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(19, 'Polish Zloty', 'zł', 3.39000, 1, 'PLN', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(20, 'Pound Sterling', '£', 0.72000, 1, 'GBP', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(21, 'Russian Ruble', 'руб', 55.93000, 1, 'RUB', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(22, 'Singapore Dollar', '$', 1.32000, 1, 'SGD', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(23, 'Swedish Krona', 'kr', 8.19000, 1, 'SEK', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(24, 'Swiss Franc', 'CHF', 0.94000, 1, 'CHF', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(26, 'Thai Baht', '฿', 31.39000, 1, 'THB', '2018-10-09 09:35:08', '2018-10-09 09:35:08'),
(27, 'Taka', '৳', 84.00000, 1, 'BDT', '2018-10-09 09:35:08', '2018-12-02 03:16:13'),
(28, 'Indian Rupee', 'Rs', 68.45000, 1, 'Rupee', '2019-07-07 08:33:46', '2019-07-07 08:33:46'),
(29, 'جنية مصري', 'EGP', 15.70000, 1, 'EGP', '2021-08-31 01:51:31', '2021-08-31 01:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wholesale` tinyint(2) NOT NULL DEFAULT 0,
  `wholesale_active` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `wholesale`, `wholesale_active`, `created_at`, `updated_at`) VALUES
(4, 8, 1, 1, '2019-08-01 08:35:09', '2021-07-29 17:01:04'),
(5, 13, 0, 0, '2020-11-17 15:05:10', '2021-07-29 17:38:31'),
(6, 14, 0, 0, '2020-11-17 15:11:50', '2020-11-17 15:11:50'),
(7, 15, 0, 0, '2020-11-19 16:59:04', '2020-11-19 16:59:04'),
(8, 16, 0, 0, '2020-11-19 18:19:00', '2020-11-19 18:19:00'),
(9, 17, 0, 0, '2020-11-19 19:00:22', '2020-11-19 19:00:22'),
(10, 18, 0, 0, '2020-11-19 19:41:43', '2020-11-19 19:41:43'),
(11, 19, 0, 0, '2020-11-19 19:49:58', '2020-11-19 19:49:58'),
(12, 20, 0, 0, '2020-11-23 03:16:15', '2020-11-23 03:16:15'),
(13, 21, 0, 0, '2020-11-23 07:00:56', '2020-11-23 07:00:56'),
(14, 22, 0, 0, '2020-11-29 19:56:41', '2020-11-29 19:56:41'),
(15, 23, 0, 0, '2020-11-29 20:01:04', '2020-11-29 20:01:04'),
(16, 24, 0, 0, '2020-11-29 21:01:05', '2020-11-29 21:01:05'),
(17, 26, 0, 0, '2020-11-29 21:02:06', '2020-11-29 21:02:06'),
(18, 27, 0, 0, '2020-11-29 21:02:15', '2020-11-29 21:02:15'),
(19, 28, 0, 0, '2020-11-29 21:02:55', '2020-11-29 21:02:55'),
(20, 29, 0, 0, '2020-11-29 21:03:10', '2020-11-29 21:03:10'),
(21, 30, 0, 0, '2020-11-29 21:05:10', '2020-11-29 21:05:10'),
(22, 31, 0, 0, '2020-11-29 21:07:23', '2020-11-29 21:07:23'),
(23, 32, 0, 0, '2020-11-29 21:11:14', '2020-11-29 21:11:14'),
(24, 33, 0, 0, '2020-11-30 22:47:08', '2020-11-30 22:47:08'),
(25, 34, 0, 0, '2020-11-30 22:48:13', '2020-11-30 22:48:13'),
(26, 35, 0, 0, '2020-12-01 12:52:38', '2020-12-01 12:52:38'),
(27, 36, 0, 0, '2020-12-09 05:11:03', '2020-12-09 05:11:03'),
(28, 37, 0, 0, '2020-12-16 17:36:17', '2020-12-16 17:36:17'),
(29, 38, 0, 0, '2020-12-16 22:51:38', '2020-12-16 22:51:38'),
(30, 39, 0, 0, '2021-03-26 03:59:52', '2021-03-26 03:59:52'),
(31, 40, 0, 0, '2021-07-25 20:35:12', '2021-07-25 20:35:12'),
(33, 48, 0, 0, '2021-08-31 00:56:13', '2021-08-31 00:56:13'),
(34, 49, 1, 1, '2021-08-31 02:32:28', '2021-08-31 02:34:21'),
(35, 54, 0, 0, '2021-10-05 10:23:26', '2021-10-05 10:23:26'),
(37, 57, 0, 0, '2021-10-27 22:38:36', '2021-10-27 22:38:36'),
(39, 60, 0, 0, '2021-10-28 02:39:30', '2021-10-28 02:39:30'),
(41, 62, 0, 0, '2021-10-29 01:39:27', '2021-10-29 01:39:27'),
(42, 63, 0, 0, '2021-10-29 03:19:39', '2021-10-29 03:19:39'),
(43, 67, 0, 0, '2021-11-25 15:15:48', '2021-11-25 15:15:48'),
(45, 70, 0, 0, '2021-11-25 20:28:22', '2021-11-25 20:28:22'),
(46, 72, 0, 0, '2021-11-26 01:43:05', '2021-11-26 01:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `customer_packages`
--

CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(28,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_packages`
--

INSERT INTO `customer_packages` (`id`, `name`, `amount`, `product_upload`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Free', 0.00, 50, NULL, '2021-10-28 23:28:28', '2021-10-28 23:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_payments`
--

CREATE TABLE `customer_package_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_package_id` int(11) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approval` int(1) NOT NULL,
  `offline_payment` int(1) NOT NULL COMMENT '1=offline payment\r\n2=online paymnet',
  `reciept` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_translations`
--

CREATE TABLE `customer_package_translations` (
  `id` bigint(20) NOT NULL,
  `customer_package_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_package_translations`
--

INSERT INTO `customer_package_translations` (`id`, `customer_package_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Free', 'sa', '2021-10-28 23:28:28', '2021-10-28 23:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `customer_products`
--

CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(28,2) DEFAULT 0.00,
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_product_translations`
--

CREATE TABLE `customer_product_translations` (
  `id` bigint(20) NOT NULL,
  `customer_product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `date` varchar(191) DEFAULT NULL,
  `amount` double(8,3) NOT NULL DEFAULT 0.000,
  `category_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `amount`, `category_id`, `notes`, `created_at`, `updated_at`) VALUES
(2, '2021-07-12', 10000.000, 1, NULL, '2021-07-11 19:52:52', '2021-07-11 19:52:52'),
(3, '2021-07-14', 1000.000, 3, 'مصاريف اكل لصاحب المحل من مطعم', '2021-07-14 20:48:11', '2021-07-14 20:48:11'),
(4, '2021-07-25', 100.000, 4, 'دفع ايصال كهباء المحل', '2021-07-25 20:39:28', '2021-07-25 20:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'مصاريف ادارية', 'الوصف', '2021-07-11 19:01:29', '2021-07-11 19:01:48'),
(3, 'مصاريف اكل للعمال', 'يتصثنبؤ', '2021-07-14 20:36:13', '2021-07-14 20:36:13'),
(4, 'كهرباء المحل', NULL, '2021-07-25 20:38:49', '2021-07-25 20:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'فستان سهرة طويل ترتر مع تول', 1635282000, 1638219600, 1, 1, '#3eefgg', 'white', '29', 'فستان-سهرة-طويل-ترتر-مع-تول-edfwh', '2020-07-16 08:50:22', '2021-10-27 05:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(8, 1, 15, 10100.00, 'percent', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(9, 1, 16, 3.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(10, 1, 17, 40.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(11, 1, 18, 0.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(12, 1, 19, 0.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(13, 1, 35, 0.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(14, 1, 36, 0.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(15, 1, 37, 0.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(16, 1, 38, 0.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34'),
(17, 1, 39, 0.00, 'amount', '2021-10-27 05:28:34', '2021-10-27 05:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_translations`
--

CREATE TABLE `flash_deal_translations` (
  `id` bigint(20) NOT NULL,
  `flash_deal_id` bigint(20) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deal_translations`
--

INSERT INTO `flash_deal_translations` (`id`, `flash_deal_id`, `title`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'فستان سهرة طويل ترتر مع تول', 'sa', '2021-10-27 05:28:34', '2021-10-27 05:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_sidebar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `frontend_color`, `logo`, `footer_logo`, `admin_logo`, `admin_login_background`, `admin_login_sidebar`, `favicon`, `site_name`, `address`, `description`, `phone`, `email`, `facebook`, `instagram`, `twitter`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, '6', 'uploads/logo/sLkheTD8W40NSHRefo2zK3WVR3v0XWw9u6qYyJcb.png', NULL, 'uploads/admin_logo/5rmBQ97EJGLlDPGlI1Xmgn0MXRv41VI2k8Pkx3Ov.png', 'uploads/admin_login_background/AKIpsMab9ZUw8VAxqC69dI56E5JaAw8kN21SDCYN.png', 'uploads/admin_login_sidebar/RCZlXoLJ4JWHrQS7bjMHLsLPcB1CpcufgGECgGpR.png', 'uploads/favicon/wudgJGXsvcOkjAkLwhc8lBLkEXWSkRp8120f7wKJ.png', 'tycoon', 'فلسطين - القدس - العيزرية', 'أفتتح معرض tycoon عام 2008 في العيزريه في ضواحي القدس. المعرض يحتوي على كافة انواع الملابس النسائيه الهندي والتركي وغيرها من الملابس الراقيه. كل يوم في موديلات جديده وعروض . يمكنم ايضا الشراء والتسوق عن طريق الموقع.', '00972544644510', 'info@tycoon.today', 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.twitter.com', 'https://www.youtube.com', NULL, '2021-08-30 17:17:45', '2020-11-15 04:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `category_id`, `subsubcategories`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"3\",\"4\",\"1\",\"2\"]', 1, '2019-03-12 04:38:23', '2020-07-15 11:07:24'),
(2, 2, '[\"8\"]', 1, '2019-03-12 04:44:54', '2020-07-15 12:20:25'),
(3, 4, '[\"7\"]', 1, '2020-07-15 12:15:10', '2020-07-15 12:15:10'),
(4, 3, '[\"10\"]', 1, '2020-07-15 12:23:27', '2020-07-15 12:28:13'),
(5, 5, '[\"11\"]', 1, '2020-07-15 12:32:33', '2020-07-15 12:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, '2019-01-20 10:13:20', '2019-01-20 10:13:20'),
(4, 'العربية', 'sa', 1, '2019-04-28 16:34:12', '2020-07-22 12:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'ملابس ستاتي', 'http://tycoon.today/search?category=Demo-category-1', '2020-07-15 13:26:45', '2020-07-15 13:26:45'),
(2, 'ملابس ولادي', 'http://tycoon.today/search?category=Demo-category-2', '2020-07-15 13:42:23', '2020-07-15 13:42:23'),
(3, 'ملابس بناتي', 'http://tycoon.today/search?category=Demo-category-3', '2020-07-15 13:42:52', '2020-07-15 13:42:52'),
(4, 'ملابس بيبي', 'http://tycoon.today/search?category=--0unem', '2020-07-15 13:43:39', '2020-07-15 13:43:39'),
(5, 'أحذية متنوعة', 'http://tycoon.today/search?category=-e5BiL', '2020-07-15 13:44:18', '2020-07-15 13:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `manual_payment_methods`
--

CREATE TABLE `manual_payment_methods` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manual_payment_methods`
--

INSERT INTO `manual_payment_methods` (`id`, `type`, `heading`, `description`, `bank_info`, `photo`, `created_at`, `updated_at`) VALUES
(4, 'check_payment', 'my_check', NULL, NULL, '157', '2020-11-19 17:29:20', '2020-11-23 16:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 'http://tycoon.today/product/------avrcK', '2020-07-18 10:28:59', '2020-07-18 10:28:59'),
(2, 1, 12, 'hello', '2020-11-16 19:28:24', '2020-11-16 19:28:24'),
(3, 2, 12, 'https://tycoon.today/product/--EYaB4', '2020-12-02 16:26:22', '2020-12-02 16:26:22'),
(4, 3, 12, 'https://tycoon.today/product/--EYaB4\r\nhello. woirld', '2020-12-02 16:26:55', '2020-12-02 16:26:55'),
(5, 2, 12, 'yes', '2020-12-02 16:33:47', '2020-12-02 16:33:47'),
(6, 3, 12, 'helo. its ok', '2020-12-02 16:34:23', '2020-12-02 16:34:23'),
(7, 2, 12, 'ok. that is fine', '2020-12-02 20:19:39', '2020-12-02 20:19:39'),
(8, 4, 12, 'https://tycoon.today/product/--gUFdE\r\nare there any colors. out', '2020-12-02 20:21:09', '2020-12-02 20:21:09'),
(9, 4, 12, 'ok', '2020-12-02 20:24:18', '2020-12-02 20:24:18'),
(10, 5, 13, 'https://tycoon.today/product/--EYaB4 test product', '2020-12-03 10:37:24', '2020-12-03 10:37:24'),
(11, 6, 12, 'test message test', '2020-12-03 11:31:47', '2020-12-03 11:31:47'),
(12, 7, 12, 'test message test', '2020-12-03 11:35:39', '2020-12-03 11:35:39'),
(13, 8, 12, 'test message test', '2020-12-03 11:36:23', '2020-12-03 11:36:23'),
(14, 9, 12, 'test message test', '2020-12-03 11:37:06', '2020-12-03 11:37:06'),
(15, 5, 12, 'ok', '2020-12-03 11:40:56', '2020-12-03 11:40:56'),
(16, 4, 12, 'can you help me', '2020-12-03 15:07:02', '2020-12-03 15:07:02'),
(17, 10, 12, 'test message test', '2020-12-03 21:13:46', '2020-12-03 21:13:46'),
(18, 11, 35, 'test message test', '2020-12-03 21:14:15', '2020-12-03 21:14:15'),
(19, 11, 35, 'can you help me reply', '2020-12-03 21:19:07', '2020-12-03 21:19:07'),
(20, 12, 35, 'kmes content 1', '2020-12-05 09:15:24', '2020-12-05 09:15:24'),
(21, 13, 35, 'test message test', '2020-12-05 09:15:32', '2020-12-05 09:15:32'),
(22, 14, 35, 'kmes body 2', '2020-12-05 09:26:00', '2020-12-05 09:26:00'),
(23, 15, 35, 'اللون الاحمر متوفر ؟', '2020-12-07 12:24:52', '2020-12-07 12:24:52'),
(24, 16, 35, 'اللون الاحمر متوفر ؟؟', '2020-12-08 15:02:45', '2020-12-08 15:02:45'),
(25, 11, 35, 'Ok', '2020-12-09 01:20:18', '2020-12-09 01:20:18'),
(26, 11, 35, 'hello', '2020-12-09 12:04:10', '2020-12-09 12:04:10'),
(27, 11, 35, 'hi', '2020-12-09 12:07:26', '2020-12-09 12:07:26'),
(28, 11, 35, 'Hi Taj mahl', '2020-12-09 12:21:04', '2020-12-09 12:21:04'),
(29, 11, 35, 'hello', '2020-12-09 12:24:09', '2020-12-09 12:24:09'),
(30, 11, 35, 'hosain', '2020-12-09 12:24:43', '2020-12-09 12:24:43'),
(31, 11, 35, 'hello', '2020-12-09 12:48:48', '2020-12-09 12:48:48'),
(32, 11, 35, 'ahmed', '2020-12-09 12:50:01', '2020-12-09 12:50:01'),
(33, 11, 35, 'Hello tajMahl', '2020-12-09 12:51:13', '2020-12-09 12:51:13'),
(34, 12, 35, 'What other colors ?', '2020-12-09 12:51:45', '2020-12-09 12:51:45'),
(35, 16, 35, 'هل يوجد مقاسات للاطفال ؟', '2020-12-09 13:23:23', '2020-12-09 13:23:23'),
(36, 16, 35, 'هل هناك مقاسات صغيرة !', '2020-12-09 13:31:08', '2020-12-09 13:31:08'),
(37, 15, 12, 'yes. for sure \r\nانت. اطلب ونحن نوفر لك ما تريد', '2020-12-09 13:40:43', '2020-12-09 13:40:43'),
(38, 14, 12, 'اهلا بك. \r\nكم العمر المطلوب', '2020-12-09 13:41:24', '2020-12-09 13:41:24'),
(39, 13, 12, 'اهلا.', '2020-12-09 13:41:38', '2020-12-09 13:41:38'),
(40, 15, 35, 'شكرا', '2020-12-13 09:01:20', '2020-12-13 09:01:20'),
(41, 17, 37, 'لون اخر من نفس الفئة وحجم اكبر قليلا', '2020-12-16 17:38:02', '2020-12-16 17:38:02'),
(42, 14, 35, 'my age is 18', '2020-12-16 20:36:08', '2020-12-16 20:36:08'),
(43, 18, 35, 'هل هناك مقاس صغير ؟', '2020-12-17 09:37:29', '2020-12-17 09:37:29'),
(44, 18, 12, 'yas', '2020-12-17 09:40:07', '2020-12-17 09:40:07'),
(45, 19, 12, 'https://tycoon.today/product/--lmitg\r\njust for test', '2021-10-27 05:31:45', '2021-10-27 05:31:45'),
(46, 19, 12, 'ok. no problem', '2021-10-27 05:32:55', '2021-10-27 05:32:55'),
(47, 20, 60, 'https://tycoon.today/product/--lmitg\r\nالمنتج ده بيجي بالدسته ولا بالقطعه؟', '2021-10-28 02:40:05', '2021-10-28 02:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('036d6bc23eebff15e59f1fdefbf69318d542af5bf98c9332b940330440dc01793f749de63fcef32d', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 17:10:09', '2020-11-19 17:10:09', '2022-10-20 13:10:09'),
('04f884574573ae2ca5cbdfdcf90e1e94dd43c08da042381804d39289684890379887ee265511a0b7', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-10 12:58:50', '2020-12-10 12:58:50', '2022-11-10 08:58:50'),
('0795d3db30ada17864ec41c10ad1857c6bfea149bff5691653562cf89bdbe1d7a5cbe2600dbf7102', 12, 1, 'Personal Access Token', '[]', 0, '2020-11-17 17:50:06', '2020-11-17 17:50:06', '2022-10-18 13:50:06'),
('08bdcec9ee17d5c42e110b37ac0ebc23ead9e6b815421822b61289735b61e153882e9b23fc8ca54f', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 22:53:54', '2020-12-09 22:53:54', '2022-11-09 18:53:54'),
('08cdb9762787eb758248bb1cad3a46337ce1f0e0ec14aebca151d1c0e67bc788c9cd51299aa595e1', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-13 11:16:44', '2020-12-13 11:16:44', '2022-11-13 07:16:44'),
('0a37cc5bd00497fda1dcddb82e8b26ade2e91ed8f54c525f0415a094c33e2d065f7e78a734eeeccf', 35, 1, 'Personal Access Token', '[]', 0, '2021-01-14 11:00:30', '2021-01-14 11:00:30', '2022-12-15 07:00:30'),
('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-30 02:51:13', '2019-07-30 02:51:13', '2020-07-30 10:51:13'),
('1399433a41c37f387929c4ce7cf271752b29e9773973c63398fd72b28850b69ec2593dc02eb3e89c', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-03 21:40:13', '2020-12-03 21:40:13', '2022-11-03 17:40:13'),
('15a21609d041c7abd6643a253bf065736c5b0e1653d7ecb19b07f4649c453be70a4057fdcd8899d4', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-02 14:02:47', '2020-12-02 14:02:47', '2022-11-02 10:02:47'),
('22083016bfa1472b6fe9d9aaff51c82ce701049d91d06ab94c8077784816d6be51e8a1ce2f06b1b8', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-01 12:53:42', '2020-12-01 12:53:42', '2022-11-01 08:53:42'),
('2413dc753303624cb10983a56f9756ba31d218268c27de3fbd956eb889e755a426f7bf5fdab51ef8', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-05 14:06:01', '2020-12-05 14:06:01', '2022-11-05 10:06:01'),
('24459084bb932df3cb43510c29d36a32ba80d57fb7970c7db9b12025cda7ade4d8cb300d860d62bd', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-11 14:15:03', '2020-12-11 14:15:03', '2022-11-11 10:15:03'),
('2467323d9b3969bdee88cfb2c933774e4fc0956a1717e350c23a44178c6048fdad11d2bd03940682', 35, 1, 'Personal Access Token', '[]', 0, '2021-01-04 19:52:08', '2021-01-04 19:52:08', '2022-12-05 15:52:08'),
('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 04:00:04', '2019-08-04 04:00:04', '2020-08-04 12:00:04'),
('2aee884d226f608b2c04e7e369972958e77344b3f98f5527f4e2b1abbc224cfb075bb8e9bcdfca55', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-04 12:32:33', '2020-12-04 12:32:33', '2022-11-04 08:32:33'),
('2b35c93516e0d8af90f0d602be2ce2a1921f0da78525617b4b61a03334a7c852acef441262d7687e', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 16:59:43', '2020-11-19 16:59:43', '2022-10-20 12:59:43'),
('346c83ed67aa385c255cbeac613b96ca04c12dbff7425cf340457b880c6ddaa6ba3bb9d0bb666dc6', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-04 12:39:53', '2020-12-04 12:39:53', '2022-11-04 08:39:53'),
('37f6aacbfdd07ef0d433d8339118f2bd348f59a13b8b5ea178dd3224a1823d2baed394689ee4738e', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-01 14:17:24', '2020-12-01 14:17:24', '2022-11-01 10:17:24'),
('3aaf2a6432c234e1c5efd107e4303c06dbd72355c97eddc489e7bc1376b0f9fd5656332a54740435', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 18:13:36', '2020-11-19 18:13:36', '2022-10-20 14:13:36'),
('3debf0759381f184085d695f07c0127bdb7a25b63850baeb75168b3174b07042e8264622b1bfa7bc', 12, 1, 'Personal Access Token', '[]', 0, '2020-12-03 10:01:57', '2020-12-03 10:01:57', '2022-11-03 06:01:57'),
('4208ed0cd0b5880b13e68ba5ed006725c70384b15354fda0721d6ee5f1fd65b7a84b8dda98b8e3e1', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-08 23:22:27', '2020-12-08 23:22:27', '2022-11-08 19:22:27'),
('4c2680297cde012dba8b80f63985457ca2b3cac626531ba98629892cd266fabbe8dcf212b1bb88eb', 21, 1, 'Personal Access Token', '[]', 0, '2020-11-23 07:01:03', '2020-11-23 07:01:03', '2022-10-24 03:01:03'),
('4cc7afaac5e2fb4b0a869cf4582d7ddd56b5dcc9a8bccb3b2e762543e56cec6d69283db66f383b58', 39, 1, 'Personal Access Token', '[]', 0, '2021-03-26 04:00:00', '2021-03-26 04:00:00', '2023-02-24 01:00:00'),
('4ce6f9abd38097503e1a3212da2e854b34e14d11e23e57db9d5c0b0980d1f547de12efef571d37d9', 35, 1, 'Personal Access Token', '[]', 0, '2021-01-22 06:04:04', '2021-01-22 06:04:04', '2022-12-23 02:04:04'),
('4d1c04bf464910c9337523d1bd327562d18a27a11fc5b5581e45823897579c860c8eeafb32454255', 37, 1, 'Personal Access Token', '[]', 0, '2020-12-16 17:36:28', '2020-12-16 17:36:28', '2022-11-16 13:36:28'),
('4fac72267f7645ab4ee479acf7d645e4eb76ba4fa57605fcbae104021d7c49d73a6380ec31a21e54', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 16:14:47', '2020-12-09 16:14:47', '2022-11-09 12:14:47'),
('50fe8e3a1f9d0fe7f9e52226746c1607e6cd485ca1f0014ece7399ac1aee251b1dd02daf8678b4fd', 18, 1, 'Personal Access Token', '[]', 0, '2020-12-23 14:00:01', '2020-12-23 14:00:01', '2022-11-23 10:00:01'),
('51de0e7f1c8b5285897eff865f56cb4ae4f9fd014247f4d08f0f7944b5bc72aa241a54f393ff9148', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-07 21:50:30', '2020-12-07 21:50:30', '2022-11-07 17:50:30'),
('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-13 04:44:28', '2019-07-13 04:44:28', '2020-07-13 12:44:28'),
('5df1e689a7479ef8e4561adc31a96d5a769ed0cbdeb668ae6889c67c8af7ebdb916452079161b663', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-13 08:59:50', '2020-12-13 08:59:50', '2022-11-13 04:59:50'),
('5f48dae319428a8bf015b03e577aed2b943ca0f9f29f4f01c144089583a4610e4bd1b5232989acf3', 19, 1, 'Personal Access Token', '[]', 0, '2020-11-19 19:50:07', '2020-11-19 19:50:07', '2022-10-20 15:50:07'),
('62106421b4e1f5c7bc3141cac9239154b7506f664dc520d84c2aeb5caa4ad9117a05a67d9fcd6c58', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 13:30:35', '2020-12-09 13:30:35', '2022-11-09 09:30:35'),
('6634cb8f80bf3b19f5644763a9cfe860e644f22637c1cb59bd21f35d6c174ed30d5da9ca33706587', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 17:42:54', '2020-11-19 17:42:54', '2022-10-20 13:42:54'),
('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 05:23:06', '2019-08-04 05:23:06', '2020-08-04 13:23:06'),
('6b4a77bda26b21d96c5084afc4950f49cf728ac38ca407dc13ac7b774ee3a7a8acd1e3b50f64a346', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 13:22:51', '2020-12-09 13:22:51', '2022-11-09 09:22:51'),
('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 05:32:12', '2019-08-04 05:32:12', '2020-08-04 13:32:12'),
('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-08 00:35:26', '2019-08-08 00:35:26', '2020-08-08 08:35:26'),
('71d69161387e792f9d1943d75a69906258ad7fee4bd7bb614bb5da7b00dcd3f49be1a24361fd3af1', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-07 12:24:09', '2020-12-07 12:24:09', '2022-11-07 08:24:09'),
('7385a96efabc38be93e0705948470006e364287897f6fcb64c3738415f0d0249cb1eece588c77427', 12, 1, 'Personal Access Token', '[]', 0, '2020-11-17 15:23:12', '2020-11-17 15:23:12', '2022-10-18 11:23:12'),
('75492c6547858d992f7e4d4d44023f6c8def0e34eb248e242b72517c93baa94f3a60ad8020c50196', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 18:03:21', '2020-11-19 18:03:21', '2022-10-20 14:03:21'),
('756dd032c347c5a28cd3ade288bdd279d4f7acc69c29d77e41faf91c9ff28892ce7995d01205bdde', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 20:52:45', '2020-12-09 20:52:45', '2022-11-09 16:52:45'),
('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 05:29:44', '2019-08-04 05:29:44', '2020-08-04 13:29:44'),
('7793730fe31cca2c1765480fc952069d5ed93af9f4cdbe6a68fc1e56476dd9f2d99a10030c60a857', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-02 11:43:59', '2020-12-02 11:43:59', '2022-11-02 07:43:59'),
('785ad7f042f2c7b6ceefd0f134539fbaa9e43fe1691816ff37bf166150d529f04f0f257547ff3cb9', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 22:55:12', '2020-12-09 22:55:12', '2022-11-09 18:55:12'),
('7ad1884b6d66eae9d8cc99c832c43bdaf3ccabdbb8e6f579df30d8406ee78a4ff51f5d0f1b7c63e8', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-17 09:05:25', '2020-12-17 09:05:25', '2022-11-17 05:05:25'),
('7b5fafca7438f3cb0f8915c23361d1a7f4cb14783536a90913764a392ccf3222af9eaf8fc710aded', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-13 09:07:40', '2020-12-13 09:07:40', '2022-11-13 05:07:40'),
('806aa6fe77dfd57ef935a22201d991ee6d5592328d31b132c5e47bea52a84a1178b40b612b56d455', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-05 18:24:34', '2020-12-05 18:24:34', '2022-11-05 14:24:34'),
('80d96db957a520c52e40750353ed069666e6f3a8e077fd2305c23b8d773a31bf3195bf8475c10d1c', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-13 09:11:51', '2020-12-13 09:11:51', '2022-11-13 05:11:51'),
('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-22 00:07:47', '2019-07-22 00:07:47', '2020-07-22 08:07:47'),
('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 04:05:05', '2019-08-04 04:05:05', '2020-08-04 12:05:05'),
('8a994e45f9e536a5df0695d325d2b062805a504f40f2769612919b465f69a5c7558a35091d1b5eb3', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 19:48:05', '2020-11-19 19:48:05', '2022-10-20 15:48:05'),
('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 04:44:35', '2019-08-04 04:44:35', '2020-08-04 12:44:35'),
('8e8a633910f33aac8c96abe722a87ff28f81d10127b16d84d2c1199a32bd9d73d72c0a150c48cf47', 20, 1, 'Personal Access Token', '[]', 0, '2020-11-23 03:16:24', '2020-11-23 03:16:24', '2022-10-23 23:16:24'),
('9235e830ea5160380f758774b091f4341d86652ca88591e638293f5e4a8d99df7532f9847dd9fb57', 34, 1, 'Personal Access Token', '[]', 0, '2020-11-30 22:50:07', '2020-11-30 22:50:07', '2022-10-31 18:50:07'),
('9247b2a7bcbfb8c48e845373f9cd75aafebc8d281f25c687150fef86eb80570eb1a37d8547111ecd', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-08 15:01:14', '2020-12-08 15:01:14', '2022-11-08 11:01:14'),
('92cd928778e7353d2998f23a937d4abe41474f8a6c32759987b003238da680158251c21f39664f97', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-03 16:32:21', '2020-12-03 16:32:21', '2022-11-03 12:32:21'),
('94ef7a2814b7ede9a776cf56b74dc9f8b93fb5670ccaad82477b7767220de10010119590cc609d1e', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-01 13:37:18', '2020-12-01 13:37:18', '2022-11-01 09:37:18'),
('96fb46dc47c57805804cb5349135e243ad07945fda9a6763a384e0241f13f584261d3b3f434b3d8e', 17, 1, 'Personal Access Token', '[]', 0, '2020-11-19 19:00:46', '2020-11-19 19:00:46', '2022-10-20 15:00:46'),
('973ccbd3e1fdac2e4efbb8bcc5df4660dad38b8a838d0357af199fd518b34585627a0d6d52a264be', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 16:31:06', '2020-12-09 16:31:06', '2022-11-09 12:31:06'),
('9f5907278d45efac96aaace9818c2fd442ce6223b0c4784cd161d22e87151a69b9222462184a295e', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-08 12:17:13', '2020-12-08 12:17:13', '2022-11-08 08:17:13'),
('a145bf0a3925f1ceaa3439727545d7e17f0437cc9f09bf1d9df4a4cf629661ce951f6fea63d1ff8b', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-01 14:03:50', '2020-12-01 14:03:50', '2022-11-01 10:03:51'),
('a18458afbf157363fc71949ad3f4f72eb2302d39529dcd78ccb0d47cd1f5b205090bcc352f37cc74', 12, 1, 'Personal Access Token', '[]', 0, '2021-01-13 06:00:28', '2021-01-13 06:00:28', '2022-12-14 02:00:28'),
('aa314c2098ce36371f12c10a9166745f2881288db268b38f379d55d6c2c657be2d94a3b2791d57a8', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-13 09:12:20', '2020-12-13 09:12:20', '2022-11-13 05:12:20'),
('aa791a5d137e30ce9b5a01982c42dee940d1036bcae90807e5b19ce22520b41b587c0ca136ec4ebf', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-08 11:52:04', '2020-12-08 11:52:04', '2022-11-08 07:52:04'),
('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 05:14:32', '2019-08-04 05:14:32', '2020-08-04 13:14:32'),
('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-29 23:45:31', '2019-07-29 23:45:31', '2020-07-30 07:45:31'),
('c5ef61ac08c0f26c0735f9c99a0f78f719cd19d225156f3a6a67121dcfd7452b99296d5bee48cec2', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 17:47:26', '2020-11-19 17:47:26', '2022-10-20 13:47:26'),
('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-05 03:02:59', '2019-08-05 03:02:59', '2020-08-05 11:02:59'),
('c8ad72ae0fadd1eb37342e219d9442a6953813eeeeb28814064f1208f178d930842c34596c09a7e8', 14, 1, 'Personal Access Token', '[]', 1, '2020-11-17 15:11:50', '2020-11-17 15:11:50', '2022-10-18 11:11:50'),
('ca34a63d046de13d7624bd8075548048d793ad2cf7c417572ed4c4d75cfe2ec48c6686ba829e4d20', 18, 1, 'Personal Access Token', '[]', 0, '2020-12-23 13:55:06', '2020-12-23 13:55:06', '2022-11-23 09:55:06'),
('caa3c2c62cd914aaa54ef1f0ed85c7c472a5b1039e8497699cbd606236335b731bc7d199dd339e06', 12, 1, 'Personal Access Token', '[]', 0, '2020-11-17 13:27:43', '2020-11-17 13:27:43', '2022-10-18 09:27:43'),
('cb1c5e8af71322bdd8d99f50cf2254f4182ea86f39386ec0e4714dce831b8a31d074d1ffb5080f4d', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 18:05:02', '2020-11-19 18:05:02', '2022-10-20 14:05:02'),
('cb762b6ffb0ba9923c14ac0776a2f63c5d1d4f1f73cc18f97aeb734744dd02459947405c242626c6', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-07 23:13:25', '2020-12-07 23:13:25', '2022-11-07 19:13:25'),
('cd97158aace4054709aa2c26ce89a0496b13ec7957a8667687ed0886c9d82ee9f62c32cd507ad3c0', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-01 13:54:24', '2020-12-01 13:54:24', '2022-11-01 09:54:24'),
('cfc4b103b8c9566da1a5722f8fe72f5302f09a34bc8e8fccd6fca495803e8e199a3107b13d2bfc98', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-11 14:04:25', '2020-12-11 14:04:25', '2022-11-11 10:04:25'),
('d25c7e8d3107483ad38f47dcb639194e750a2b28c5029fa3d030e8947496471a68d824721e2c92f4', 12, 1, 'Personal Access Token', '[]', 0, '2020-11-19 04:02:42', '2020-11-19 04:02:42', '2022-10-20 00:02:42'),
('d37d4ed2bf8c13c4b26ee26e314006cf76f78daedfefb3fecb294bb197a591f9f9edccc1df7f2db0', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 17:55:48', '2020-11-19 17:55:48', '2022-10-20 13:55:48'),
('d481d83be635d2458e09cc0e40b40ce5de49870e650ecc6336e2d64be3a5b471ea9de23f9d2b3a83', 12, 1, 'Personal Access Token', '[]', 0, '2021-01-13 10:26:45', '2021-01-13 10:26:45', '2022-12-14 06:26:45'),
('d50d54255e753f373d75ce3294f1f2df68e6a46f20957c4054bfe4905660f5674360834328c04c5e', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-03 15:29:35', '2020-12-03 15:29:35', '2022-11-03 11:29:35'),
('d5460aea898368630ab7b46a15cde67c83f0dae8d5afcbf9d6110ef734cead50a90b3012c04c6403', 35, 1, 'Personal Access Token', '[]', 0, '2021-01-22 07:04:13', '2021-01-22 07:04:13', '2022-12-23 03:04:13'),
('d67edd4401da2db9e46032f5e3f64fb89edd91ec3d94cbbb775d7ed85861c8236503d94b67472c93', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-16 20:34:50', '2020-12-16 20:34:50', '2022-11-16 16:34:50'),
('d8e31d553ada698f9cf985f53b688416006153e41885f2c0cf39548c1d4ce37ddae3ca9303c17682', 12, 1, 'Personal Access Token', '[]', 0, '2020-12-01 12:44:11', '2020-12-01 12:44:11', '2022-11-01 08:44:11'),
('da7ddd637b7f40bfa13468f05ed5980eeb5ca98f4bbc89048a98bcb6af4907273a2436d4a0cda875', 35, 1, 'Personal Access Token', '[]', 0, '2021-01-14 11:24:49', '2021-01-14 11:24:49', '2022-12-15 07:24:49'),
('da80d3071f6cb80e98b02e097b38f045c7e68bf4d8bf75d4bd2f442f9ca18b0687ec0568294d20e5', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-11 14:03:59', '2020-12-11 14:03:59', '2022-11-11 10:03:59'),
('e06420b53233d89c81493d351e17e9ab7c101719c4d1d1c674cbdff8c1020785b1f8dc4a0c2ec35d', 38, 1, 'Personal Access Token', '[]', 0, '2020-12-16 22:51:43', '2020-12-16 22:51:43', '2022-11-16 18:51:43'),
('e3c08babf8723df2981cc142debd300ea605bf2e4597df302e04e795ed4a6f85123a511db0fb6684', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-06 20:23:01', '2020-12-06 20:23:01', '2022-11-06 16:23:01'),
('e5ad6d11353a44c489fd9be8439e3963afd2228c81742291656ec0d43bf75462a1d55b4711d471b5', 12, 1, 'Personal Access Token', '[]', 0, '2021-01-13 10:45:41', '2021-01-13 10:45:41', '2022-12-14 06:45:41'),
('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-15 00:53:40', '2019-07-15 00:53:40', '2020-07-15 08:53:40'),
('e8595b5fb198bbb81bd1be4d39bebd9a6327061099143f942edc73dcac20a4bbfc6d16dc4e8d4bfd', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 16:59:48', '2020-12-09 16:59:48', '2022-11-09 12:59:48'),
('e8ac0b7c8335d3bd06b81bf4a5c48ea941b1e61a3f8ec81e45d9b6ab16d01e9c4189b8ebf1c0ee9a', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 18:14:33', '2020-11-19 18:14:33', '2022-10-20 14:14:33'),
('e94f7f2d9f4ff38bc52ffef1e614dd78046e5176dd80cbb6b73508da0c277715a170e4e65286bb36', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 18:05:08', '2020-11-19 18:05:08', '2022-10-20 14:05:08'),
('eccc7643755d2e2badabc53c68342a6c1d3f25ff0cbbfe3786e6a1c46505d04258576ff871027913', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-08 16:27:04', '2020-12-08 16:27:04', '2022-11-08 12:27:04'),
('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-13 04:36:45', '2019-07-13 04:36:45', '2020-07-13 12:36:45'),
('eda15093e1aed1ec74c7839d2aef1246bd0973cbfa645587ff8a8cd3beef005bac0abee1120734a6', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-01 16:37:55', '2020-12-01 16:37:55', '2022-11-01 12:37:55'),
('f61bcb76b01ecfd1ff38ab4397929604ec73b5a90660af49f59262935e5e9ca94cf81abc97f035d4', 35, 1, 'Personal Access Token', '[]', 0, '2021-01-14 09:38:32', '2021-01-14 09:38:32', '2022-12-15 05:38:32'),
('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 05:22:01', '2019-08-04 05:22:01', '2020-08-04 13:22:01'),
('f76d445bf4d2146ef49e5960477eb485328493f68e9449e7b70a4524dbafc99a5caa2f62ea692e72', 15, 1, 'Personal Access Token', '[]', 0, '2020-11-19 18:13:33', '2020-11-19 18:13:33', '2022-10-20 14:13:33'),
('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 04:38:49', '2019-07-30 04:38:49', '2020-07-30 12:38:49'),
('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 05:28:55', '2019-08-04 05:28:55', '2020-08-04 13:28:55'),
('fad85781a9a764e4a22e344c264fb356395003178b6297919dc6cc1a5c92e392c148f96f6441fbca', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-02 12:53:11', '2020-12-02 12:53:11', '2022-11-02 08:53:11'),
('fc51d0713e85be71819e9f62940cfd01f2bb344226954762b1b51fb83c533dd3cf08c3e1c1c231de', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-07 14:04:24', '2020-12-07 14:04:24', '2022-11-07 10:04:24'),
('fdfb7acc727f332c0b56b8660628a3474edb9568acdfcde3cd729655598cfe91c5ce60b550fbfc64', 35, 1, 'Personal Access Token', '[]', 0, '2020-12-09 13:49:00', '2020-12-09 13:49:00', '2022-11-09 09:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj', 'http://localhost', 1, 0, 0, '2019-07-13 04:17:34', '2019-07-13 04:17:34'),
(2, NULL, 'Laravel Password Grant Client', 'WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77', 'http://localhost', 0, 1, 0, '2019-07-13 04:17:34', '2019-07-13 04:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-13 04:17:34', '2019-07-13 04:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_payment` int(1) NOT NULL DEFAULT 0,
  `manual_payment_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(8,2) DEFAULT NULL,
  `coupon_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `code` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL,
  `employ_id` int(11) DEFAULT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `delivery_viewed` int(1) NOT NULL DEFAULT 1,
  `payment_status_viewed` int(1) DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `guest_id`, `shipping_address`, `payment_type`, `manual_payment`, `manual_payment_data`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `date`, `employ_id`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `created_at`, `updated_at`) VALUES
(1, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'paid', NULL, 1220.00, 0.00, '20201118-17274899', 1605720468, NULL, 1, 1, 1, 1, '2020-11-18 21:27:48', '2020-12-10 11:12:49'),
(2, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'paid', NULL, 1220.00, 0.00, '20201118-17281797', 1627397280, NULL, 1, 1, 1, 1, '2020-11-18 21:28:17', '2020-12-10 11:35:51'),
(3, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'paid', NULL, 1220.00, 0.00, '20201118-17301658', 1605720616, NULL, 1, 1, 1, 1, '2020-11-18 21:30:16', '2020-12-10 11:35:58'),
(5, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'my_check', 1, NULL, 'paid', NULL, 120.00, 0.00, '20201119-15335752', 1605800037, NULL, 1, 0, 0, 1, '2020-11-19 19:33:57', '2020-11-19 19:35:01'),
(6, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 0.00, 0.00, '20201119-19182810', 1605813508, NULL, 0, 1, 1, 1, '2020-11-19 23:18:28', '2020-11-23 16:23:43'),
(7, NULL, 863099, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 70.00, 0.00, '20201119-19191960', 1605813559, NULL, 0, 0, 0, 1, '2020-11-19 23:19:19', '2020-11-19 23:19:20'),
(8, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'my_check', 1, '{\"name\":\"\\u062d\\u0633\\u0646 \\u062e\\u0627\\u0644\\u062f\",\"amount\":\"100\",\"trx_id\":\"1234\",\"photo\":\"164\"}', 'paid', NULL, 100.00, 0.00, '20201123-12311080', 1606134670, NULL, 1, 1, 1, 1, '2020-11-23 16:31:10', '2020-11-23 17:04:53'),
(9, NULL, 573206, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20201123-12361323', 1606134973, NULL, 0, 0, 0, 0, '2020-11-23 16:36:13', '2020-11-23 16:36:13'),
(10, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'my_check', 1, '{\"name\":\"\\u062d\\u0633\\u0646 \\u062e\\u0627\\u0644\\u062f\",\"amount\":\"100\",\"trx_id\":\"12345\",\"photo\":\"164\"}', 'paid', NULL, 100.00, 0.00, '20201123-13204952', 1606137649, NULL, 1, 1, 1, 1, '2020-11-23 17:20:49', '2020-11-23 17:26:28'),
(11, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'paid', NULL, 100.00, 0.00, '20201123-13421675', 1606138936, NULL, 1, 1, 1, 1, '2020-11-23 17:42:16', '2020-11-23 17:47:13'),
(12, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 300.00, 0.00, '20201123-13533338', 1606139613, NULL, 0, 0, 0, 0, '2020-11-23 17:53:33', '2020-11-23 17:53:33'),
(13, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-16585034', 1606150730, NULL, 0, 0, 0, 0, '2020-11-23 20:58:50', '2020-11-23 20:58:50'),
(14, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17003287', 1606150832, NULL, 0, 0, 0, 0, '2020-11-23 21:00:32', '2020-11-23 21:00:32'),
(15, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17135849', 1606151638, NULL, 0, 0, 0, 0, '2020-11-23 21:13:58', '2020-11-23 21:13:58'),
(16, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', NULL, 0.00, '20201123-17165522', 1606151815, NULL, 0, 0, 0, 0, '2020-11-23 21:16:55', '2020-11-23 21:16:55'),
(17, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17180245', 1606151882, NULL, 0, 1, 1, 0, '2020-11-23 21:18:02', '2020-12-10 10:02:54'),
(18, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17221045', 1606152130, NULL, 0, 1, 1, 0, '2020-11-23 21:22:10', '2020-12-10 11:11:56'),
(19, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17231551', 1606152195, NULL, 0, 0, 0, 0, '2020-11-23 21:23:15', '2020-11-23 21:23:15'),
(20, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17235318', 1606152233, NULL, 0, 1, 1, 0, '2020-11-23 21:23:53', '2020-12-10 11:11:27'),
(21, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17245777', 1606152297, NULL, 0, 0, 0, 0, '2020-11-23 21:24:57', '2020-11-23 21:24:57'),
(22, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17293768', 1606152577, NULL, 0, 0, 0, 0, '2020-11-23 21:29:37', '2020-11-23 21:29:37'),
(23, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17365050', 1606153010, NULL, 0, 0, 0, 0, '2020-11-23 21:36:50', '2020-11-23 21:36:50'),
(24, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17372393', 1606153043, NULL, 0, 0, 0, 0, '2020-11-23 21:37:23', '2020-11-23 21:37:23'),
(25, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17382730', 1606153107, NULL, 0, 0, 0, 0, '2020-11-23 21:38:27', '2020-11-23 21:38:27'),
(26, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17392681', 1606153166, NULL, 0, 0, 0, 0, '2020-11-23 21:39:26', '2020-11-23 21:39:26'),
(27, NULL, 991768, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17400345', 1606153203, NULL, 0, 0, 0, 0, '2020-11-23 21:40:03', '2020-11-23 21:40:03'),
(28, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17412444', 1606153284, NULL, 0, 0, 0, 0, '2020-11-23 21:41:24', '2020-11-23 21:41:24'),
(29, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17421914', 1606153339, NULL, 1, 0, 0, 0, '2020-11-23 21:42:19', '2020-11-25 16:08:25'),
(30, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17430535', 1606153385, NULL, 0, 0, 0, 0, '2020-11-23 21:43:05', '2020-11-23 21:43:05'),
(31, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17433583', 1606153415, NULL, 0, 0, 0, 0, '2020-11-23 21:43:35', '2020-11-23 21:43:35'),
(32, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17543959', 1606154079, NULL, 0, 0, 0, 0, '2020-11-23 21:54:39', '2020-11-23 21:54:39'),
(33, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17550336', 1606154103, NULL, 0, 0, 0, 1, '2020-11-23 21:55:03', '2020-11-23 21:55:04'),
(34, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17554225', 1606154142, NULL, 0, 0, 0, 0, '2020-11-23 21:55:42', '2020-11-23 21:55:42'),
(35, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17560681', 1606154166, NULL, 0, 0, 0, 0, '2020-11-23 21:56:06', '2020-11-23 21:56:06'),
(36, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17562637', 1606154186, NULL, 0, 0, 0, 0, '2020-11-23 21:56:26', '2020-11-23 21:56:26'),
(37, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17570118', 1606154221, NULL, 0, 0, 0, 0, '2020-11-23 21:57:01', '2020-11-23 21:57:01'),
(38, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17572165', 1606154241, NULL, 0, 0, 0, 1, '2020-11-23 21:57:21', '2020-11-23 21:57:21'),
(39, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17580628', 1606154286, NULL, 0, 0, 0, 1, '2020-11-23 21:58:06', '2020-11-23 21:58:06'),
(40, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17583162', 1606154311, NULL, 0, 0, 0, 1, '2020-11-23 21:58:31', '2020-11-23 21:58:31'),
(41, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 50.00, 50.00, '20201123-17591192', 1606154351, NULL, 0, 0, 0, 1, '2020-11-23 21:59:11', '2020-11-23 21:59:12'),
(42, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20201123-18052954', 1606154729, NULL, 1, 1, 1, 1, '2020-11-23 22:05:29', '2020-11-23 23:08:38'),
(43, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'my_check', 1, NULL, 'paid', NULL, 100.00, 0.00, '20201123-19060875', 1606158368, NULL, 1, 1, 1, 1, '2020-11-23 23:06:08', '2020-11-23 23:07:21'),
(44, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 270.00, 0.00, '20201125-12235613', 1606307036, 12, 1, 1, 1, 1, '2020-11-25 16:23:56', '2020-11-25 16:42:03'),
(45, 13, NULL, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 210.00, 0.00, '20201125-12293826', 1606307378, 12, 0, 1, 1, 1, '2020-11-25 16:29:38', '2020-11-25 16:44:13'),
(46, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 180.00, 30.00, '20201125-19484779', 1606333727, 12, 1, 1, 1, 1, '2020-11-25 23:48:47', '2020-11-25 23:49:57'),
(47, 13, NULL, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 220.00, 0.00, '20201125-19530431', 1606333984, 12, 1, 1, 1, 1, '2020-11-25 23:53:04', '2020-11-26 00:32:42'),
(48, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 170.00, 0.00, '20201126-18153197', 1606414531, 12, 1, 1, 1, 1, '2020-11-26 22:15:31', '2020-11-29 11:41:59'),
(49, NULL, 456677, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20201126-12254047', 1606415140, 12, 0, 0, 0, 1, '2020-11-26 16:25:40', '2020-11-26 16:25:40'),
(50, NULL, 507634, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20201126-12324279', 1606415562, 12, 0, 1, 1, 1, '2020-11-26 16:32:42', '2020-12-10 10:40:59'),
(51, NULL, 941797, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20201126-12341412', 1606415654, 12, 0, 0, 0, 1, '2020-11-26 16:34:14', '2020-11-26 16:34:15'),
(52, NULL, 905772, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20201126-13311825', 1606419078, 12, 0, 0, 0, 1, '2020-11-26 17:31:18', '2020-11-26 17:31:18'),
(53, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 170.00, 0.00, '20201129-08381455', 1606660694, 12, 0, 1, 1, 1, '2020-11-29 12:38:14', '2020-11-29 12:46:52'),
(54, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'wallet', 0, NULL, 'unpaid', NULL, 220.00, 0.00, '20201129-08485190', 1606661331, NULL, 0, 0, 0, 0, '2020-11-29 12:48:51', '2020-11-29 12:48:51'),
(55, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'wallet', 0, NULL, 'unpaid', NULL, 220.00, 0.00, '20201129-08542917', 1606661669, NULL, 0, 0, 0, 0, '2020-11-29 12:54:29', '2020-11-29 12:54:29'),
(56, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'wallet', 0, NULL, 'unpaid', NULL, 220.00, 0.00, '20201129-08594759', 1606661987, NULL, 0, 0, 0, 0, '2020-11-29 12:59:47', '2020-11-29 12:59:47'),
(57, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'wallet', 0, NULL, 'unpaid', NULL, 220.00, 0.00, '20201129-09244487', 1606663484, NULL, 0, 0, 0, 0, '2020-11-29 13:24:44', '2020-11-29 13:24:45'),
(58, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'wallet', 0, NULL, 'unpaid', NULL, 220.00, 0.00, '20201129-09273446', 1606663654, NULL, 0, 0, 0, 0, '2020-11-29 13:27:34', '2020-11-29 13:27:34'),
(59, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'wallet', 0, NULL, 'unpaid', NULL, 220.00, 0.00, '20201129-09290639', 1606663746, NULL, 0, 0, 0, 0, '2020-11-29 13:29:06', '2020-11-29 13:29:06'),
(60, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'wallet', 0, NULL, 'paid', NULL, 220.00, 0.00, '20201129-09294458', 1606663784, NULL, 0, 0, 0, 1, '2020-11-29 13:29:44', '2020-11-29 13:29:45'),
(61, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-09341753', 1606664057, 12, 0, 1, 1, 1, '2020-11-29 13:34:17', '2020-12-06 12:13:31'),
(62, NULL, 932260, '{\"name\":\"\\u0645\\u062d\\u0645\\u062f \\u0633\\u0627\\u0645\\u064a\",\"email\":\"mohamed@gmail.com\",\"address\":null,\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-14012763', 1606680087, 12, 0, 0, 0, 1, '2020-11-29 18:01:27', '2020-11-29 18:01:28'),
(63, 22, NULL, '{\"name\":\"\\u0645\\u062d\\u0645\\u062f \\u0633\\u0627\\u0645\\u064a\",\"email\":\"mohamed@gmail.com\",\"address\":null,\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-15564157', 1606687001, 12, 0, 0, 0, 1, '2020-11-29 19:56:41', '2020-11-29 19:56:42'),
(64, 23, NULL, '{\"name\":\"\\u0627\\u0628\\u0631\\u0627\\u0647\\u064a\\u0645 \\u0639\\u0644\\u064a\",\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":\"0112345678908\"}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20201129-16010493', 1606687264, 12, 0, 0, 0, 1, '2020-11-29 20:01:04', '2020-11-29 20:01:04'),
(65, 24, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u0627\\u062f\\u0645\",\"email\":\"nader@gmail.com\",\"address\":null,\"country\":\"Palestine\",\"city\":\"\\u0627\\u0644\\u0642\\u062f\\u0633\",\"postal_code\":\"001\",\"phone\":\"012345678905\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-17010593', 1606690865, 12, 0, 0, 0, 0, '2020-11-29 21:01:05', '2020-11-29 21:01:05'),
(66, 26, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u0627\\u062f\\u0645\",\"email\":null,\"address\":null,\"country\":\"Palestine\",\"city\":\"\\u0627\\u0644\\u0642\\u062f\\u0633\",\"postal_code\":\"001\",\"phone\":\"012345678905\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-17020635', 1606690926, 12, 0, 0, 0, 0, '2020-11-29 21:02:06', '2020-11-29 21:02:06'),
(67, 27, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u0627\\u062f\\u0645\",\"email\":null,\"address\":null,\"country\":\"Palestine\",\"city\":\"\\u0627\\u0644\\u0642\\u062f\\u0633\",\"postal_code\":\"001\",\"phone\":\"012345678905\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-17021524', 1606690935, 12, 0, 0, 0, 0, '2020-11-29 21:02:15', '2020-11-29 21:02:15'),
(68, 28, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u0627\\u062f\\u0645\",\"email\":null,\"address\":null,\"country\":\"Palestine\",\"city\":\"\\u0627\\u0644\\u0642\\u062f\\u0633\",\"postal_code\":\"001\",\"phone\":\"012345678905\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-17025556', 1606690975, 12, 0, 0, 0, 0, '2020-11-29 21:02:55', '2020-11-29 21:02:55'),
(69, 29, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u0627\\u062f\\u0645\",\"email\":null,\"address\":null,\"country\":\"Palestine\",\"city\":\"\\u0627\\u0644\\u0642\\u062f\\u0633\",\"postal_code\":\"001\",\"phone\":\"012345678905\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-17031017', 1606690990, 12, 0, 0, 0, 1, '2020-11-29 21:03:10', '2020-11-29 21:03:11'),
(70, 30, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u062d\\u0646\\u062a\\u0634\",\"email\":null,\"address\":null,\"country\":\"Palestine\",\"city\":\"\\u0627\\u0644\\u0642\\u062f\\u0633\",\"postal_code\":\"002\",\"phone\":\"012346754890\"}', 'cash', 0, NULL, 'paid', 'cash', 330.00, 0.00, '20201129-17051053', 1606691110, 12, 0, 0, 0, 1, '2020-11-29 21:05:10', '2020-11-29 21:05:10'),
(71, 31, NULL, '{\"name\":\"\\u0645\\u062d\\u0645\\u062f \\u0633\\u0639\\u064a\\u062f\",\"email\":null,\"address\":null,\"country\":\"Palestine\",\"city\":\"\\u0627\\u0644\\u0642\\u062f\\u0633\",\"postal_code\":\"002\",\"phone\":\"02314567890\"}', 'cash', 0, NULL, 'paid', 'cash', 220.00, 0.00, '20201129-17072354', 1606691243, 12, 0, 0, 0, 1, '2020-11-29 21:07:23', '2020-11-29 21:07:24'),
(72, 32, NULL, '{\"name\":\"\\u0645\\u062d\\u0645\\u062f \\u0633\\u0639\\u064a\\u062f\",\"email\":null,\"address\":null,\"country\":\"Palestine\",\"city\":\"\\u0627\\u0644\\u0642\\u062f\\u0633\",\"postal_code\":\"01\",\"phone\":\"0324567890\"}', 'cash', 0, NULL, 'paid', 'cash', 220.00, 0.00, '20201129-17111434', 1606691474, 12, 0, 0, 0, 1, '2020-11-29 21:11:14', '2020-11-29 21:11:14'),
(73, 24, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u0627\\u062f\\u0645\",\"email\":\"nader@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 220.00, 0.00, '20201129-18194496', 1606695584, 12, 0, 0, 0, 1, '2020-11-29 22:19:44', '2020-11-29 22:19:44'),
(74, 24, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u0627\\u062f\\u0645\",\"email\":\"nader@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-18221229', 1606695732, 12, 0, 0, 0, 1, '2020-11-29 22:22:12', '2020-11-29 22:22:13'),
(75, 24, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631 \\u0627\\u062f\\u0645\",\"email\":\"nader@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 110.00, 0.00, '20201129-18234754', 1606695827, 12, 0, 0, 0, 1, '2020-11-29 22:23:47', '2020-11-29 22:23:48'),
(76, 13, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 320.00, 0.00, '20201207-06040213', 1607342642, 12, 1, 1, 1, 1, '2020-12-07 10:04:02', '2020-12-09 19:11:48'),
(77, 12, NULL, '{\"name\":\"aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"country\":\"Egypt\",\"city\":\"nasr city\",\"postal_code\":\"123\",\"phone\":\"01096432967\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 340.00, 0.00, '20201207-010128', 1607367688, NULL, 0, 1, 1, 0, '2020-12-07 17:01:28', '2020-12-07 17:01:28'),
(78, 12, NULL, NULL, 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201207-013259', 1607369579, NULL, 0, 1, 1, 0, '2020-12-07 17:32:59', '2020-12-07 17:32:59'),
(79, 12, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201207-020208', 1607371328, NULL, 0, 1, 1, 0, '2020-12-07 18:02:08', '2020-12-07 18:02:08'),
(80, 12, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201207-020537', 1607371537, NULL, 0, 1, 1, 0, '2020-12-07 18:05:37', '2020-12-07 18:05:37'),
(81, 12, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201207-020735', 1607371655, NULL, 0, 1, 1, 0, '2020-12-07 18:07:35', '2020-12-07 18:07:35'),
(82, 12, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201207-020828', 1607371708, NULL, 0, 1, 1, 0, '2020-12-07 18:08:28', '2020-12-07 18:08:28'),
(83, 12, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201207-021106', 1607371866, NULL, 0, 1, 1, 0, '2020-12-07 18:11:06', '2020-12-07 18:11:06'),
(84, 12, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201207-021131', 1607371891, NULL, 0, 1, 1, 0, '2020-12-07 18:11:31', '2020-12-07 18:11:31'),
(85, 12, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201207-023148', 1607373108, NULL, 0, 1, 1, 0, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(86, 35, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 150.00, 0.00, '20201208-083418', 1607438058, NULL, 0, 1, 1, 0, '2020-12-08 12:34:18', '2020-12-08 12:34:18'),
(87, 35, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 150.00, 0.00, '20201208-095728', 1607443048, NULL, 0, 1, 1, 0, '2020-12-08 13:57:28', '2020-12-08 13:57:28'),
(88, 35, NULL, 'null', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 150.00, 0.00, '20201208-100651', 1607443611, NULL, 0, 1, 1, 0, '2020-12-08 14:06:51', '2020-12-08 14:06:51'),
(89, 35, NULL, 'null', 'cash_on_delivery', 0, NULL, 'paid', NULL, 150.00, 0.00, '20201208-100753', 1607443673, NULL, 1, 1, 1, 1, '2020-12-08 14:07:53', '2020-12-10 10:43:09'),
(90, 35, NULL, 'null', 'cash_on_delivery', 0, NULL, 'paid', NULL, 300.00, 0.00, '20201208-110353', 1607447033, NULL, 1, 1, 1, 1, '2020-12-08 15:03:53', '2020-12-10 13:49:40'),
(91, 12, NULL, '\"{\\\"name\\\":\\\"naderadam\\\",\\\"email\\\":\\\"naderadam20152015@gmail.com\\\",\\\"address\\\":\\\"\\\\u0634\\\\u0627\\\\u0631\\\\u0639 \\\\u0627\\\\u0644\\\\u0641\\\\u0627\\\\u0631\\\\u0648\\\\u0642\\\",\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u062a\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"\\\\u0627\\\\u0644\\\\u0642\\\\u062f\\\\u0633\\\",\\\"postal_code\\\":\\\"123\\\",\\\"phone\\\":\\\"12345\\\"}\"', 'cash_on_delivery', 0, NULL, 'paid', NULL, 850.00, 0.00, '20201209-100040', 1607529640, NULL, 1, 0, 0, 1, '2020-12-09 14:00:40', '2020-12-09 15:58:00'),
(92, 12, NULL, '\"{\\\"name\\\":\\\"naderadam\\\",\\\"email\\\":\\\"naderadam20152015@gmail.com\\\",\\\"address\\\":\\\"\\\\u0634\\\\u0627\\\\u0631\\\\u0639 \\\\u0627\\\\u0644\\\\u0641\\\\u0627\\\\u0631\\\\u0648\\\\u0642\\\",\\\"country\\\":null,\\\"city\\\":\\\"\\\\u0627\\\\u0644\\\\u0642\\\\u062f\\\\u0633\\\",\\\"postal_code\\\":\\\"123\\\",\\\"phone\\\":\\\"12345\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201209-065803', 1607561883, NULL, 0, 1, 1, 0, '2020-12-09 22:58:03', '2020-12-09 22:58:03'),
(93, 35, NULL, '\"{\\\"name\\\":\\\"Hosain abdellatif\\\",\\\"email\\\":\\\"shs@gmail.com\\\",\\\"address\\\":\\\"\\\\u0634\\\\u0627\\\\u0631\\\\u0639 \\\\u0627\\\\u0644\\\\u0641\\\\u0627\\\\u0631\\\\u0648\\\\u0642\\\",\\\"country\\\":null,\\\"city\\\":\\\"\\\\u0627\\\\u0644\\\\u0642\\\\u062f\\\\u0633\\\",\\\"postal_code\\\":\\\"123\\\",\\\"phone\\\":\\\"12345\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 850.00, 0.00, '20201209-065813', 1607561893, NULL, 0, 1, 1, 0, '2020-12-09 22:58:13', '2020-12-09 22:58:13'),
(94, 35, NULL, '\"{\\\"name\\\":\\\"Hosain abdellatif\\\",\\\"email\\\":\\\"shs@gmail.com\\\",\\\"address\\\":null,\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"Cairo\\\",\\\"postal_code\\\":\\\"123456\\\",\\\"phone\\\":null}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 100.00, 0.00, '20201209-071127', 1607562687, NULL, 0, 1, 1, 0, '2020-12-09 23:11:27', '2020-12-09 23:11:27'),
(95, 35, NULL, '\"{\\\"name\\\":\\\"shs\\\",\\\"email\\\":\\\"shs@gmail.com\\\",\\\"address\\\":null,\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"cairo\\\",\\\"postal_code\\\":\\\"23124\\\",\\\"phone\\\":\\\"12343123\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 150.00, 0.00, '20201210-084605', 1607611565, NULL, 0, 1, 1, 0, '2020-12-10 12:46:05', '2020-12-10 12:46:05'),
(96, 35, NULL, '\"{\\\"name\\\":\\\"\\\\u062d\\\\u0633\\\\u064a\\\\u0646\\\",\\\"email\\\":\\\"shs@gmail.com\\\",\\\"address\\\":null,\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"\\\\u0627\\\\u0644\\\\u0645\\\\u0646\\\\u0635\\\\u0648\\\\u0631\\\\u0629\\\",\\\"postal_code\\\":\\\"123123\\\",\\\"phone\\\":\\\"010123\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 150.00, 0.00, '20201210-090044', 1607612444, NULL, 1, 1, 1, 0, '2020-12-10 13:00:44', '2020-12-10 13:52:27'),
(97, 35, NULL, '\"{\\\"name\\\":\\\"\\\\u062d\\\\u0633\\\\u064a\\\\u0646\\\",\\\"email\\\":\\\"shs@gmail.com\\\",\\\"address\\\":null,\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"Giza\\\",\\\"postal_code\\\":\\\"123456\\\",\\\"phone\\\":\\\"010123\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 200.00, 0.00, '20201210-095706', 1607615826, NULL, 0, 1, 1, 0, '2020-12-10 13:57:06', '2020-12-10 13:57:06'),
(98, 13, NULL, '{\"name\":\"Aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 300.00, 0.00, '20201210-14260678', 1607631966, 12, 1, 1, 1, 1, '2020-12-10 18:26:06', '2020-12-11 11:41:08'),
(99, 35, NULL, '\"{\\\"name\\\":\\\"\\\\u062d\\\\u0633\\\\u064a\\\\u0646\\\",\\\"email\\\":\\\"shs@gmail.com\\\",\\\"address\\\":null,\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"\\\\u0627\\\\u0644\\\\u0645\\\\u0646\\\\u0635\\\\u0648\\\\u0631\\\\u0629\\\",\\\"postal_code\\\":\\\"12343\\\",\\\"phone\\\":\\\"010123\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 370.00, 0.00, '20201210-064030', 1607647230, NULL, 0, 1, 1, 0, '2020-12-10 22:40:30', '2020-12-10 22:40:30'),
(100, 35, NULL, '\"{\\\"name\\\":\\\"\\\\u062d\\\\u0633\\\\u064a\\\\u0646\\\",\\\"email\\\":\\\"shs@gmail.com\\\",\\\"address\\\":null,\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"\\\\u0627\\\\u0644\\\\u0645\\\\u0646\\\\u0635\\\\u0648\\\\u0631\\\\u0629\\\",\\\"postal_code\\\":\\\"123123\\\",\\\"phone\\\":\\\"010123\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 100.00, 0.00, '20201210-064301', 1607647381, NULL, 0, 1, 1, 0, '2020-12-10 22:43:01', '2020-12-10 22:43:01'),
(101, 35, NULL, '\"{\\\"name\\\":\\\"\\\\u062d\\\\u0633\\\\u064a\\\\u0646\\\",\\\"email\\\":\\\"shs@gmail.com\\\",\\\"address\\\":null,\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"\\\\u0627\\\\u0644\\\\u0645\\\\u0646\\\\u0635\\\\u0648\\\\u0631\\\\u0629\\\",\\\"postal_code\\\":\\\"23123\\\",\\\"phone\\\":\\\"010123\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 500.00, 0.00, '20201213-044813', 1607856493, NULL, 0, 1, 1, 0, '2020-12-13 08:48:13', '2020-12-13 08:48:13'),
(102, 13, NULL, '{\"name\":\"Aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 510.00, 0.00, '20201213-06394616', 1607863186, 12, 1, 1, 1, 1, '2020-12-13 10:39:46', '2020-12-13 17:09:34'),
(103, 13, NULL, '{\"name\":\"Aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 220.00, 0.00, '20201213-13103157', 1607886631, 12, 1, 0, 0, 1, '2020-12-13 17:10:31', '2020-12-13 17:11:32'),
(104, NULL, 402490, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 330.00, 0.00, '20201213-13213147', 1607887291, 12, 0, 0, 0, 1, '2020-12-13 17:21:31', '2020-12-13 17:21:31'),
(105, 13, NULL, '{\"name\":\"Aya Shaban\",\"email\":\"aya@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', 440.00, 0.00, '20201213-13231764', 1607887397, 12, 1, 0, 0, 1, '2020-12-13 17:23:17', '2020-12-13 17:23:39'),
(106, 13, NULL, '\"{\\\"name\\\":\\\"Aya Shaban\\\",\\\"email\\\":\\\"aya@gmail.com\\\",\\\"address\\\":\\\"\\\\u0634\\\\u0627\\\\u0631\\\\u0639 \\\\u0627\\\\u0644\\\\u0641\\\\u0627\\\\u0631\\\\u0648\\\\u0642\\\",\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"\\\\u0627\\\\u0644\\\\u0642\\\\u062f\\\\u0633\\\",\\\"postal_code\\\":\\\"123\\\",\\\"phone\\\":\\\"12345\\\"}\"', 'wallet', 0, NULL, 'paid', NULL, 200.00, 0.00, '20201213-022753', 1607891273, NULL, 0, 1, 1, 0, '2020-12-13 18:27:53', '2020-12-13 18:27:53'),
(107, 37, NULL, '\"{\\\"name\\\":\\\"mohammad\\\",\\\"email\\\":\\\"gridsapps@gmail.com\\\",\\\"address\\\":null,\\\"country\\\":\\\"\\\\u0641\\\\u0644\\\\u0633\\\\u0637\\\\u064a\\\\u0646\\\",\\\"city\\\":\\\"\\\\u0631\\\\u0627\\\\u0645 \\\\u0627\\\\u0644\\\\u0644\\\\u0647\\\",\\\"postal_code\\\":\\\"00970\\\",\\\"phone\\\":\\\"0059814392\\\"}\"', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 280.00, 0.00, '20201216-013912', 1608147552, NULL, 0, 1, 1, 0, '2020-12-16 17:39:12', '2020-12-16 17:39:12'),
(108, NULL, 308272, '{\"name\":\"Sameer\",\"email\":\"Sameer@gridsapps.com\",\"address\":\"Ramallah\",\"country\":\"Andorra\",\"city\":\"Ramallah\",\"postal_code\":\"00970\",\"phone\":\"599814392\",\"checkout_type\":\"guest\"}', 'paypal', 0, NULL, 'unpaid', NULL, 100.00, 0.00, '20210113-09343517', 1610487275, NULL, 0, 0, 0, 0, '2021-01-13 13:34:35', '2021-01-13 13:34:35'),
(109, NULL, 116796, '{\"name\":\"Sameer\",\"email\":\"Sameer@gridsapps.com\",\"address\":\"Ramallah\",\"country\":\"Andorra\",\"city\":\"Ramallah\",\"postal_code\":\"00970\",\"phone\":\"599814392\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 100.00, 0.00, '20210113-09344960', 1610487289, NULL, 0, 0, 0, 0, '2021-01-13 13:34:49', '2021-01-13 13:34:49'),
(110, NULL, 302342, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20210207-05493382', 1612633773, 12, 0, 0, 0, 1, '2021-02-07 09:49:33', '2021-02-07 09:49:33'),
(111, 8, NULL, '{\"name\":\"hassan khaled\",\"email\":\"hassankhaled132@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', NULL, 0.00, '20210207-05500771', 1612633807, NULL, 0, 0, 0, 0, '2021-02-07 09:50:07', '2021-02-07 09:50:07'),
(112, 8, NULL, '{\"name\":\"hassan khaled\",\"email\":\"hassankhaled132@gmail.com\",\"address\":\"\",\"country\":\"\",\"city\":\"\",\"postal_code\":\"\",\"phone\":\"\"}', 'cash', 0, NULL, 'paid', 'cash', NULL, 0.00, '20210207-05501489', 1612633814, NULL, 0, 0, 0, 0, '2021-02-07 09:50:14', '2021-02-07 09:50:14'),
(113, 40, NULL, '{\"name\":\"\\u0646\\u0627\\u062f\\u0631\",\"email\":\"nadar@gmail.cm\",\"address\":null,\"country\":\"Egypt\",\"city\":\"cairo\",\"postal_code\":\"123\",\"phone\":\"010123456789\"}', 'cash', 0, NULL, 'paid', 'cash', 180.00, 0.00, '20210726-00351236', 1627216512, 12, 0, 0, 0, 1, '2021-07-25 20:35:12', '2021-07-25 20:37:18'),
(114, NULL, 685496, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 700.00, 0.00, '20210727-06215170', 1627323711, 12, 0, 0, 0, 1, '2021-07-27 09:21:52', '2021-07-27 09:21:52'),
(115, NULL, 726016, '{\"name\":null,\"email\":null,\"address\":null,\"country\":\"Afghanistan\",\"city\":null,\"postal_code\":null,\"phone\":null}', 'cash', 0, NULL, 'paid', 'cash', 100.00, 0.00, '20210727-21351219', 1627378512, 12, 0, 0, 0, 1, '2021-07-28 00:35:12', '2021-07-28 00:35:13'),
(116, 12, NULL, '{\"name\":\"naderadam\",\"email\":\"naderadam20152015@gmail.com\",\"address\":\"Illum eius fugiat\",\"country\":\"American Samoa\",\"city\":\"Vel cillum et culpa\",\"postal_code\":\"Et veniam magnam qu\",\"phone\":\"+1 (805) 486-8367\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 196.00, 0.00, '20210826-20593229', 1630000772, NULL, 0, 0, 0, 0, '2021-08-26 18:59:32', '2021-08-26 18:59:32'),
(117, 45, NULL, '{\"name\":\"Armand Gilmore\",\"email\":\"gynoqaxof@mailinator.com\",\"address\":\"Rerum corporis et de\",\"country\":\"Ukraine\",\"city\":\"Nisi dolor possimus\",\"postal_code\":\"Deserunt earum velit\",\"phone\":\"+1 (387) 719-8244\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 270.00, 0.00, '20210828-17522534', 1630162345, NULL, 0, 0, 0, 0, '2021-08-28 15:52:25', '2021-08-28 15:52:25'),
(118, 47, NULL, '{\"name\":\"Ahmed Tager\",\"email\":\"a@a.com\",\"address\":\"Quis qui odio aliqua\",\"country\":\"Mexico\",\"city\":\"Necessitatibus exerc\",\"postal_code\":\"Aspernatur sed vero\",\"phone\":\"+1 (817) 551-2432\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'paid', NULL, 1055.00, 0.00, '20210828-18101131', 1630163411, NULL, 1, 0, 0, 1, '2021-08-28 16:10:11', '2021-08-28 16:17:11'),
(119, 47, NULL, '{\"name\":\"Ahmed Tager\",\"email\":\"a@a.com\",\"address\":\"Quis qui odio aliqua\",\"country\":\"Mexico\",\"city\":\"Necessitatibus exerc\",\"postal_code\":\"Aspernatur sed vero\",\"phone\":\"+1 (817) 551-2432\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'paid', NULL, 720.00, 0.00, '20210830-01032861', 1630274608, NULL, 1, 1, 1, 1, '2021-08-29 23:03:28', '2021-08-29 23:07:51'),
(120, 58, NULL, '{\"name\":\"admin2\",\"email\":\"admin2@tycoon.today\",\"address\":\"\\u0627\\u0645\\u0628\\u0627\\u0628\\u0647 \\u0634\\u0627\\u0631\\u0639 \\u0627\\u0644\\u0648\\u062d\\u062f\\u0647\",\"country\":\"Egypt\",\"city\":\"\\u0627\\u0644\\u062c\\u064a\\u0632\\u0647\",\"postal_code\":\"4508\",\"phone\":\"01283337434\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 100.00, 0.00, '20211028-00315431', 1635370314, NULL, 0, 0, 0, 0, '2021-10-28 05:31:54', '2021-10-28 05:31:54'),
(121, 58, NULL, '{\"name\":\"admin2\",\"email\":\"admin2@tycoon.today\",\"address\":\"\\u0627\\u0645\\u0628\\u0627\\u0628\\u0647 \\u0634\\u0627\\u0631\\u0639 \\u0627\\u0644\\u0648\\u062d\\u062f\\u0647\",\"country\":\"Egypt\",\"city\":\"\\u0627\\u0644\\u062c\\u064a\\u0632\\u0647\",\"postal_code\":\"4508\",\"phone\":\"01283337434\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, -9900.00, 0.00, '20211028-13484816', 1635418128, NULL, 0, 0, 0, 0, '2021-10-28 18:48:48', '2021-10-28 18:48:48'),
(122, NULL, 990094, '{\"name\":\"Mostafa Salem\",\"email\":\"mostafasalem@outlook.com\",\"address\":\"MKENSIA\",\"country\":\"Morocco\",\"city\":\"sale\",\"postal_code\":\"11000\",\"phone\":\"002126505522552\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 150.00, 0.00, '20211029-00373850', 1635457058, NULL, 1, 0, 0, 0, '2021-10-29 05:37:38', '2021-11-26 01:53:13'),
(123, 69, NULL, '{\"name\":\"\\u0627\\u0628\\u0627\\u0646\\u0648\\u0628\",\"email\":\"bebowilliam12@gmail.com\",\"address\":\"\\u0627\\u0645\\u0628\\u0627\\u0628\\u0647 \\u0634\\u0627\\u0631\\u0639 \\u0627\\u0644\\u0648\\u062d\\u062f\\u0647 \\u0627\\u0645\\u0627\\u0645 \\u0627\\u0644\\u0639\\u0633\\u0643\\u0631\\u064a\",\"country\":\"Egypt\",\"city\":\"\\u0627\\u0644\\u062c\\u064a\\u0632\\u0647\",\"postal_code\":\"13344\",\"phone\":\"+2001206689263\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 0, NULL, 'unpaid', NULL, 240.00, 0.00, '20211125-18305715', 1637854257, NULL, 1, 1, 1, 0, '2021-11-25 18:30:57', '2021-11-26 01:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `employ_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `employ_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 12, 66, '', 300.00, 0.00, 0.00, 3, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:27:48', '2020-11-19 17:16:15'),
(2, 1, NULL, 12, 67, '', 300.00, 0.00, 0.00, 3, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:27:48', '2020-11-19 17:16:15'),
(3, 1, NULL, 12, 70, '', 200.00, 0.00, 0.00, 2, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:27:48', '2020-11-19 17:16:15'),
(4, 1, NULL, 12, 68, '', 300.00, 0.00, 0.00, 3, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:27:48', '2020-11-19 17:16:15'),
(5, 1, NULL, 12, 69, '', 120.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:27:48', '2020-11-19 17:16:15'),
(6, 2, NULL, 12, 66, '', 300.00, 0.00, 0.00, 3, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-11-18 21:28:17', '2020-11-19 14:37:15'),
(7, 2, NULL, 12, 67, '', 300.00, 0.00, 0.00, 3, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-11-18 21:28:17', '2020-11-19 14:37:15'),
(8, 2, NULL, 12, 70, '', 200.00, 0.00, 0.00, 2, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-11-18 21:28:17', '2020-11-19 14:37:15'),
(9, 2, NULL, 12, 68, '', 300.00, 0.00, 0.00, 3, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-11-18 21:28:17', '2020-11-19 14:37:15'),
(10, 2, NULL, 12, 69, '', 120.00, 0.00, 0.00, 1, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-11-18 21:28:17', '2020-11-19 14:37:15'),
(11, 3, NULL, 12, 66, '', 300.00, 0.00, 0.00, 3, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:30:16', '2020-11-19 13:36:36'),
(12, 3, NULL, 12, 67, '', 300.00, 0.00, 0.00, 3, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:30:16', '2020-11-19 13:36:36'),
(13, 3, NULL, 12, 70, '', 200.00, 0.00, 0.00, 2, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:30:16', '2020-11-19 13:36:36'),
(14, 3, NULL, 12, 68, '', 300.00, 0.00, 0.00, 3, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:30:16', '2020-11-19 13:36:36'),
(15, 3, NULL, 12, 69, '', 120.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-18 21:30:16', '2020-11-19 13:36:36'),
(17, 5, NULL, 12, 69, '', 120.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-19 19:33:57', '2020-11-19 19:35:06'),
(18, 6, NULL, 12, 18, NULL, 0.00, 0.00, 0.00, 8, 'paid', 'pending', NULL, NULL, NULL, '2020-11-19 23:18:28', '2020-11-19 23:18:28'),
(19, 6, NULL, 12, 15, NULL, 0.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-19 23:18:28', '2020-11-19 23:18:28'),
(20, 7, NULL, 12, 34, 's', 70.00, 0.00, 0.00, 2, 'paid', 'pending', NULL, NULL, NULL, '2020-11-19 23:19:19', '2020-11-19 23:19:19'),
(21, 8, NULL, 12, 70, '', 100.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-23 16:31:10', '2020-11-23 17:04:20'),
(22, 9, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 16:36:13', '2020-11-23 16:36:13'),
(23, 10, NULL, 12, 70, '', 100.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-23 17:20:49', '2020-11-23 17:26:12'),
(24, 11, NULL, 12, 70, '', 100.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-23 17:42:16', '2020-11-23 17:45:48'),
(25, 12, NULL, 12, 15, NULL, 0.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 17:53:33', '2020-11-23 17:53:33'),
(26, 12, NULL, 12, 70, NULL, 200.00, 0.00, 0.00, 2, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 17:53:33', '2020-11-23 17:53:33'),
(27, 12, NULL, 12, 68, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 17:53:33', '2020-11-23 17:53:33'),
(28, 13, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 20:58:50', '2020-11-23 20:58:50'),
(29, 14, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:00:32', '2020-11-23 21:00:32'),
(30, 15, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:13:58', '2020-11-23 21:13:58'),
(31, 17, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:18:02', '2020-11-23 21:18:02'),
(32, 18, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:22:10', '2020-11-23 21:22:10'),
(33, 19, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:23:15', '2020-11-23 21:23:15'),
(34, 20, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:23:53', '2020-11-23 21:23:53'),
(35, 21, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:24:57', '2020-11-23 21:24:57'),
(36, 22, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:29:37', '2020-11-23 21:29:37'),
(37, 23, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:36:50', '2020-11-23 21:36:50'),
(38, 24, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:37:23', '2020-11-23 21:37:23'),
(39, 25, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:38:27', '2020-11-23 21:38:27'),
(40, 26, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:39:26', '2020-11-23 21:39:26'),
(41, 27, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:40:03', '2020-11-23 21:40:03'),
(42, 28, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:41:24', '2020-11-23 21:41:24'),
(43, 29, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:42:19', '2020-11-23 21:42:19'),
(44, 30, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:43:05', '2020-11-23 21:43:05'),
(45, 31, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:43:35', '2020-11-23 21:43:35'),
(46, 32, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:54:39', '2020-11-23 21:54:39'),
(47, 33, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:55:03', '2020-11-23 21:55:03'),
(48, 34, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:55:42', '2020-11-23 21:55:42'),
(49, 35, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:56:06', '2020-11-23 21:56:06'),
(50, 36, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:56:26', '2020-11-23 21:56:26'),
(51, 37, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:57:01', '2020-11-23 21:57:01'),
(52, 38, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:57:21', '2020-11-23 21:57:21'),
(53, 39, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:58:06', '2020-11-23 21:58:06'),
(54, 40, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:58:31', '2020-11-23 21:58:31'),
(55, 41, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'pending', NULL, NULL, NULL, '2020-11-23 21:59:12', '2020-11-23 21:59:12'),
(56, 42, NULL, 12, 70, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-23 22:05:29', '2020-11-23 23:08:20'),
(57, 43, NULL, 12, 70, '', 100.00, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-11-23 23:06:08', '2020-11-23 23:06:55'),
(58, 44, NULL, 12, 15, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-25 16:23:56', '2020-11-25 16:23:56'),
(59, 44, NULL, 12, 16, NULL, 170.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-25 16:23:56', '2020-11-25 16:23:56'),
(60, 45, NULL, 12, 68, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-25 16:29:38', '2020-11-25 16:29:38'),
(61, 45, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-25 16:29:38', '2020-11-25 16:29:38'),
(62, 46, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-25 23:48:47', '2020-11-25 23:48:47'),
(63, 46, NULL, 12, 68, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-25 23:48:47', '2020-11-25 23:48:47'),
(64, 47, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-25 23:53:04', '2020-11-25 23:53:04'),
(65, 48, NULL, 12, 16, NULL, 170.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-26 22:15:31', '2020-11-26 22:15:31'),
(66, 49, NULL, 12, 17, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-26 16:25:40', '2020-11-26 16:25:40'),
(67, 50, NULL, 12, 17, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-26 16:32:42', '2020-11-26 16:32:42'),
(68, 51, NULL, 12, 17, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-26 16:34:14', '2020-11-26 16:34:14'),
(69, 52, NULL, 12, 17, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-26 17:31:18', '2020-11-26 17:31:18'),
(70, 53, NULL, 12, 16, NULL, 170.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 12:38:14', '2020-11-29 12:38:14'),
(71, 54, NULL, 12, 70, '', 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-11-29 12:48:51', '2020-11-29 12:48:51'),
(72, 55, NULL, 12, 70, '', 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-11-29 12:54:29', '2020-11-29 12:54:29'),
(73, 56, NULL, 12, 70, '', 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-11-29 12:59:47', '2020-11-29 12:59:47'),
(74, 57, NULL, 12, 70, '', 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-11-29 13:24:45', '2020-11-29 13:24:45'),
(75, 58, NULL, 12, 70, '', 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-11-29 13:27:34', '2020-11-29 13:27:34'),
(76, 59, NULL, 12, 70, '', 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-11-29 13:29:06', '2020-11-29 13:29:06'),
(77, 60, NULL, 12, 70, '', 200.00, 20.00, 0.00, 2, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-11-29 13:29:44', '2020-11-29 13:29:45'),
(78, 61, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 13:34:17', '2020-11-29 13:34:17'),
(79, 62, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 18:01:27', '2020-11-29 18:01:27'),
(80, 63, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 19:56:41', '2020-11-29 19:56:41'),
(81, 64, NULL, 12, 15, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 20:01:04', '2020-11-29 20:01:04'),
(82, 65, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 21:01:05', '2020-11-29 21:01:05'),
(83, 66, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 21:02:06', '2020-11-29 21:02:06'),
(84, 67, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 21:02:15', '2020-11-29 21:02:15'),
(85, 68, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 21:02:55', '2020-11-29 21:02:55'),
(86, 69, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 21:03:10', '2020-11-29 21:03:10'),
(87, 70, NULL, 12, 70, NULL, 300.00, 30.00, 0.00, 3, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 21:05:10', '2020-11-29 21:05:10'),
(88, 71, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 21:07:23', '2020-11-29 21:07:23'),
(89, 72, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 21:11:14', '2020-11-29 21:11:14'),
(90, 73, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 22:19:44', '2020-11-29 22:19:44'),
(91, 74, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 22:22:12', '2020-11-29 22:22:12'),
(92, 75, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-11-29 22:23:47', '2020-11-29 22:23:47'),
(93, 76, NULL, 12, 22, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-07 10:04:02', '2020-12-07 10:04:02'),
(94, 76, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-07 10:04:02', '2020-12-07 10:04:02'),
(95, 77, NULL, 12, 16, NULL, 510.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 17:01:28', '2020-12-07 17:01:28'),
(96, 77, NULL, 12, 16, NULL, 340.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 17:01:28', '2020-12-07 17:01:28'),
(97, 78, NULL, 12, 56, NULL, 450.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 17:32:59', '2020-12-07 17:32:59'),
(98, 78, NULL, 12, 35, NULL, 400.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 17:32:59', '2020-12-07 17:32:59'),
(99, 79, NULL, 12, 16, NULL, 340.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:02:08', '2020-12-07 18:02:08'),
(100, 79, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:02:08', '2020-12-07 18:02:08'),
(101, 79, NULL, 12, 50, NULL, 140.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:02:08', '2020-12-07 18:02:08'),
(102, 80, NULL, 12, 50, NULL, 140.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:05:37', '2020-12-07 18:05:37'),
(103, 80, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:05:37', '2020-12-07 18:05:37'),
(104, 81, NULL, 12, 50, NULL, 140.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:07:35', '2020-12-07 18:07:35'),
(105, 81, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:07:36', '2020-12-07 18:07:36'),
(106, 82, NULL, 12, 50, NULL, 140.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:08:28', '2020-12-07 18:08:28'),
(107, 82, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:08:28', '2020-12-07 18:08:28'),
(108, 83, NULL, 12, 50, NULL, 140.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:11:06', '2020-12-07 18:11:06'),
(109, 83, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:11:06', '2020-12-07 18:11:06'),
(110, 84, NULL, 12, 50, NULL, 140.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:11:31', '2020-12-07 18:11:31'),
(111, 84, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:11:31', '2020-12-07 18:11:31'),
(112, 85, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(113, 85, NULL, 12, 50, NULL, 140.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(114, 85, NULL, 12, 45, NULL, 200.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(115, 86, NULL, 12, 61, NULL, 150.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-08 12:34:18', '2020-12-08 12:34:18'),
(116, 87, NULL, 12, 60, NULL, 300.00, 0.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-08 13:57:28', '2020-12-08 13:57:28'),
(117, 88, NULL, 12, 61, NULL, 150.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-08 14:06:51', '2020-12-08 14:06:51'),
(118, 89, NULL, 12, 56, NULL, 150.00, 0.00, 0.00, 1, 'paid', 'confirmed', NULL, NULL, NULL, '2020-12-08 14:07:53', '2020-12-09 18:52:40'),
(119, 90, NULL, 12, 57, NULL, 300.00, 0.00, 0.00, 3, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-08 15:03:53', '2020-12-09 18:51:25'),
(120, 91, NULL, 12, 45, NULL, 200.00, 0.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-09 14:00:40', '2020-12-09 15:58:00'),
(121, 93, NULL, 12, 50, NULL, 210.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-09 22:58:13', '2020-12-09 22:58:13'),
(122, 94, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-09 23:11:27', '2020-12-09 23:11:27'),
(123, 95, NULL, 12, 61, NULL, 150.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-10 12:46:05', '2020-12-10 12:46:05'),
(124, 96, NULL, 12, 61, NULL, 150.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-10 13:00:44', '2020-12-10 13:00:44'),
(125, 97, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-10 13:57:06', '2020-12-10 13:57:06'),
(126, 98, NULL, 12, 71, 'Amethyst-36', 300.00, 0.00, 0.00, 3, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-10 18:26:06', '2020-12-10 18:26:06'),
(127, 99, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-10 22:40:30', '2020-12-10 22:40:30'),
(128, 99, NULL, 12, 60, NULL, 150.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-10 22:40:30', '2020-12-10 22:40:30'),
(129, 100, NULL, 12, 67, NULL, 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-10 22:43:01', '2020-12-10 22:43:01'),
(130, 101, NULL, 12, 60, NULL, 450.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-13 08:48:13', '2020-12-13 08:48:13'),
(131, 101, NULL, 12, 52, NULL, 50.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-13 08:48:13', '2020-12-13 08:48:13'),
(132, 102, NULL, 12, 15, NULL, 400.00, 0.00, 0.00, 4, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-13 10:39:46', '2020-12-13 10:39:46'),
(133, 102, NULL, 12, 70, NULL, 100.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-13 10:39:46', '2020-12-13 10:39:46'),
(134, 103, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-13 17:10:31', '2020-12-13 17:10:31'),
(135, 104, NULL, 12, 70, NULL, 300.00, 30.00, 0.00, 3, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-13 17:21:31', '2020-12-13 17:21:31'),
(136, 105, NULL, 12, 70, NULL, 400.00, 40.00, 0.00, 4, 'paid', 'delivered', NULL, NULL, NULL, '2020-12-13 17:23:17', '2020-12-13 17:23:17'),
(137, 106, NULL, 12, 70, NULL, 200.00, 20.00, 0.00, 2, 'paid', 'pending', NULL, NULL, NULL, '2020-12-13 18:27:53', '2020-12-13 18:27:53'),
(138, 107, NULL, 12, 50, NULL, 280.00, 0.00, 0.00, 4, 'unpaid', 'pending', NULL, NULL, NULL, '2020-12-16 17:39:12', '2020-12-16 17:39:12'),
(139, 108, NULL, 12, 67, '', 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-13 13:34:35', '2021-01-13 13:34:35'),
(140, 109, NULL, 12, 67, '', 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-01-13 13:34:49', '2021-01-13 13:34:49'),
(141, 110, NULL, 12, 15, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-02-07 09:49:33', '2021-02-07 09:49:33'),
(142, 113, NULL, 12, 70, 'AntiqueWhite-43', 90.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-25 20:35:12', '2021-07-25 20:35:12'),
(143, 113, NULL, 12, 53, '18', 20.00, 20.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-25 20:35:12', '2021-07-25 20:35:12'),
(144, 113, NULL, 12, 54, '36', 30.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-25 20:35:12', '2021-07-25 20:35:12'),
(145, 114, NULL, 12, 15, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-27 09:21:52', '2021-07-27 09:21:52'),
(146, 114, NULL, 12, 21, NULL, 50.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-27 09:21:52', '2021-07-27 09:21:52'),
(147, 114, NULL, 12, 18, NULL, 350.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-27 09:21:52', '2021-07-27 09:21:52'),
(148, 114, NULL, 12, 17, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-27 09:21:52', '2021-07-27 09:21:52'),
(149, 114, NULL, 12, 22, NULL, 100.00, 0.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-27 09:21:52', '2021-07-27 09:21:52'),
(150, 115, NULL, 12, 70, 'AntiqueWhite-43', 90.00, 10.00, 0.00, 1, 'paid', 'delivered', NULL, NULL, NULL, '2021-07-28 00:35:12', '2021-07-28 00:35:12'),
(151, 116, NULL, 12, 66, '', 96.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-08-26 18:59:32', '2021-08-26 18:59:32'),
(152, 116, NULL, 12, 65, '', 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-08-26 18:59:32', '2021-08-26 18:59:32'),
(153, 117, NULL, 12, 70, 'AntiqueWhite-43', 90.00, 10.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-08-28 15:52:25', '2021-08-28 15:52:25'),
(154, 117, NULL, 12, 16, '', 170.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-08-28 15:52:25', '2021-08-28 15:52:25'),
(155, 118, NULL, 12, 70, 'AntiqueWhite-43', 285.00, 0.00, 0.00, 3, 'paid', 'confirmed', 'home_delivery', NULL, NULL, '2021-08-28 16:10:11', '2021-08-28 16:17:13'),
(156, 118, NULL, 12, 69, '', 330.00, 0.00, 0.00, 3, 'paid', 'confirmed', 'home_delivery', NULL, NULL, '2021-08-28 16:10:11', '2021-08-28 16:17:13'),
(157, 118, NULL, 12, 69, '', 440.00, 0.00, 0.00, 4, 'paid', 'confirmed', 'home_delivery', NULL, NULL, '2021-08-28 16:10:11', '2021-08-28 16:17:13'),
(158, 119, NULL, 12, 63, '', 400.00, 0.00, 0.00, 4, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2021-08-29 23:03:28', '2021-08-29 23:07:30'),
(159, 119, NULL, 12, 62, '', 80.00, 0.00, 0.00, 4, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2021-08-29 23:03:28', '2021-08-29 23:07:30'),
(160, 119, NULL, 12, 67, '', 240.00, 0.00, 0.00, 3, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2021-08-29 23:03:28', '2021-08-29 23:07:30'),
(161, 120, NULL, 12, 71, 'Amethyst-36', 100.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-10-28 05:31:54', '2021-10-28 05:31:54'),
(162, 121, NULL, 12, 15, '', -10000.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-10-28 18:48:48', '2021-10-28 18:48:48'),
(163, 121, NULL, 12, 70, 'AntiqueWhite-43', 90.00, 10.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-10-28 18:48:48', '2021-10-28 18:48:48'),
(164, 122, NULL, 12, 60, '', 150.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2021-10-29 05:37:38', '2021-10-29 05:37:38'),
(165, 123, NULL, 12, 63, '', 120.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'pickup_point', 0, NULL, '2021-11-25 18:30:57', '2021-11-25 18:30:57'),
(166, 123, NULL, 12, 69, '', 120.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'pickup_point', 0, NULL, '2021-11-25 18:30:57', '2021-11-25 18:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `otp_configurations`
--

CREATE TABLE `otp_configurations` (
  `id` int(11) NOT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `otp_configurations`
--

INSERT INTO `otp_configurations` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'nexmo', '1', '2020-03-22 07:19:07', '2020-03-22 07:19:07'),
(2, 'otp_for_order', '1', '2020-03-22 07:19:07', '2020-03-22 07:19:07'),
(3, 'otp_for_delivery_status', '1', '2020-03-22 07:19:37', '2020-03-22 07:19:37'),
(4, 'otp_for_paid_status', '0', '2020-03-22 07:19:37', '2020-03-22 07:19:37'),
(5, 'twillo', '0', '2020-03-22 07:54:03', '2020-03-22 01:54:20'),
(6, 'ssl_wireless', '0', '2020-03-22 07:54:03', '2020-03-22 01:54:20'),
(7, 'fast2sms', '0', '2020-03-22 07:54:03', '2020-03-22 01:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `created_at`, `updated_at`) VALUES
(1, 'home_page', 'Home Page', 'home', NULL, NULL, NULL, NULL, NULL, '2020-11-04 14:13:20', '2020-11-04 14:13:20'),
(2, 'seller_policy_page', 'سياسة التوصيل', 'sellerpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 14:14:41', '2020-12-13 10:27:49'),
(3, 'return_policy_page', 'سياسة الإرجاع', 'returnpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 14:14:41', '2020-12-13 10:26:38'),
(4, 'support_policy_page', 'سياسة الدعم', 'supportpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 14:14:59', '2020-12-13 10:25:40'),
(5, 'terms_conditions_page', 'الشروط والأحكام', 'terms', NULL, NULL, NULL, NULL, NULL, '2020-11-04 14:15:29', '2020-12-13 10:24:51'),
(6, 'privacy_policy_page', 'سياسة الخصوصية', 'privacypolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 14:15:55', '2020-12-13 10:23:51'),
(7, 'custom_page', 'من نحن', 'aboutus', '<p style=\"text-align: right; \"><b>حول متجر&nbsp;tycoon</b></p><div dir=\"auto\" style=\"text-align: right; font-family: system-ui, -apple-system, system-ui, \" .sfnstext-regular\",=\"\" sans-serif;=\"\" color:=\"\" rgb(5,=\"\" 5,=\"\" 5);=\"\" font-size:=\"\" 15px;\"=\"\"><span style=\"text-align: start;\">تشكيلة واسعة من السبورات التركية و ملابس السهرة - جلابيب وفساتين وعبايات شرعية - كل ما يخص الاطفال من ملابس ومستلزمات بيبي.</span><br></div><div dir=\"auto\" style=\"text-align: right; font-family: system-ui, -apple-system, system-ui, \" .sfnstext-regular\",=\"\" sans-serif;=\"\" color:=\"\" rgb(5,=\"\" 5,=\"\" 5);=\"\" font-size:=\"\" 15px;\"=\"\">فتتح معرض تاج محل عام 2008 في العيزريه في ضواحي القدس. المعرض يحتوي على كافة انواع الملابس النسائيه الهندي والتركي وغيرها من الملابس الراقيه. كل يوم في موديلات جديده وعروض . يمكنم ايضا الشراء والتسوق عن طريق الموقع. اي استفسارات أو اقتراحات الرجاء ارسالها الى info@tycoon.today&nbsp;&nbsp;</div>', 'من نحن', 'حول متجر tycoon', 'من نحن', NULL, '2020-12-13 10:04:44', '2021-08-31 01:09:09'),
(8, 'custom_page', 'للإتصال بنا', 'contactus', '<div style=\"font-family: system-ui, -apple-system, system-ui, &quot;.SFNSText-Regular&quot;, sans-serif; color: rgb(28, 30, 33);\"><div class=\"dwo3fsh8 g5ia77u1 rt8b4zig n8ej3o3l agehan2d sk4xxmp2 rq0escxv q9uorilb kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso l9j0dhe7 i1ao9s8h k4urcfbm\" style=\"border-width: 0px; padding: 0px; margin: 0px; appearance: none; background-color: transparent; text-align: inherit; width: 344px; position: relative; display: inline-block; font-family: inherit;\"><div class=\"j83agx80 cbu4d94t sj5x9vvc cxgpxx05\" style=\"flex-direction: column; padding-top: 8px; display: flex; padding-bottom: 8px; font-family: inherit;\"><div class=\"rq0escxv l9j0dhe7 du4w35lb j83agx80 pfnyh3mw jifvfom9 ll8tlv6m owycx6da btwxx1t3 hv4rvrfc dati1w0a jb3vyjys b5q2rw42 lq239pai mysgfdmx hddg9phg\" style=\"margin: -6px; flex-flow: row nowrap; padding-right: 16px; z-index: 0; padding-left: 16px; display: flex; padding-top: 0px; justify-content: flex-start; position: relative; align-items: flex-start; flex-shrink: 0; font-family: inherit;\"><div class=\"rq0escxv l9j0dhe7 du4w35lb j83agx80 cbu4d94t g5gj957u d2edcug0 hpfvmrgz rj1gh0hx buofh1pr o8rfisnq p8fzw8mz pcp91wgn iuny7tx3 ipjc6fyt\" style=\"flex: 1 1 0px; flex-direction: column; max-width: 100%; z-index: 0; min-width: 0px; padding: 6px; display: flex; position: relative; align-self: center; font-family: inherit;\"><div class=\"j83agx80 cbu4d94t ew0dbk1b irj2b8pg\" style=\"flex-direction: column; margin-bottom: -5px; margin-top: -5px; display: flex; font-family: inherit;\"><div class=\"qzhwtbm6 knvmm38d\" style=\"margin-top: 5px; margin-bottom: 5px; font-family: inherit;\"><span class=\"d2edcug0 hpfvmrgz qv66sw1b c1et5uql oi732d6d ik7dh3pa fgxwclzu a8c37x1j keod5gw0 nxhoafnm aigsh9s9 d9wwppkn fe6kdd0r mau55g9w c8b282yb iv3no6db jq4qci2q a3bd9o3v knj5qynh oo9gr5id hzawbc8m\" dir=\"auto\" style=\"line-height: 1.3333; display: block; overflow-wrap: break-word; max-width: 100%; font-family: inherit; min-width: 0px; text-align: right; -webkit-font-smoothing: antialiased; font-size: 0.9375rem; color: var(--primary-text); word-break: break-word;\"><div class=\"j83agx80 cbu4d94t ew0dbk1b irj2b8pg\" style=\"flex-direction: column; margin-bottom: -5px; margin-top: -5px; display: flex; font-family: inherit;\"><div class=\"qzhwtbm6 knvmm38d\" style=\"margin-top: 5px; margin-bottom: 5px; font-family: inherit;\"><span class=\"d2edcug0 hpfvmrgz qv66sw1b c1et5uql oi732d6d ik7dh3pa fgxwclzu jq4qci2q a3bd9o3v knj5qynh oo9gr5id hzawbc8m\" style=\"line-height: 1.3333; overflow-wrap: break-word; max-width: 100%; font-family: inherit; min-width: 0px; -webkit-font-smoothing: antialiased; font-size: 0.9375rem; color: var(--primary-text); word-break: break-word;\"><div class=\"kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql\" style=\"overflow-wrap: break-word; margin: 0px; font-family: inherit;\"><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">info@tycoon.today. يمكنمكم المراسلة&nbsp;</div><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\"> او الاتصال على 0568454578 --- 0544644510&nbsp;</div><div><div class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl oo9gr5id gpro0wi8 lrazzd5p\" role=\"button\" tabindex=\"0\" style=\"outline: none; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; background-color: transparent; text-align: inherit; font-weight: 600; display: inline; -webkit-tap-highlight-color: transparent; color: var(--primary-text); font-family: inherit;\"><br></div></div></div></span></div></div></span></div></div></div></div></div></div></div>', 'contact us', 'contact us', 'contact us', NULL, '2020-12-13 10:32:19', '2020-12-13 10:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page_translations`
--

INSERT INTO `page_translations` (`id`, `page_id`, `title`, `content`, `lang`, `created_at`, `updated_at`) VALUES
(1, 7, 'من نحن', '<p style=\"text-align: right; \"><b>حول متجر&nbsp;tycoon</b></p><div dir=\"auto\" style=\"text-align: right; font-family: system-ui, -apple-system, system-ui, \" .sfnstext-regular\",=\"\" sans-serif;=\"\" color:=\"\" rgb(5,=\"\" 5,=\"\" 5);=\"\" font-size:=\"\" 15px;\"=\"\"><span style=\"text-align: start;\">تشكيلة واسعة من السبورات التركية و ملابس السهرة - جلابيب وفساتين وعبايات شرعية - كل ما يخص الاطفال من ملابس ومستلزمات بيبي.</span><br></div><div dir=\"auto\" style=\"text-align: right; font-family: system-ui, -apple-system, system-ui, \" .sfnstext-regular\",=\"\" sans-serif;=\"\" color:=\"\" rgb(5,=\"\" 5,=\"\" 5);=\"\" font-size:=\"\" 15px;\"=\"\">فتتح معرض تاج محل عام 2008 في العيزريه في ضواحي القدس. المعرض يحتوي على كافة انواع الملابس النسائيه الهندي والتركي وغيرها من الملابس الراقيه. كل يوم في موديلات جديده وعروض . يمكنم ايضا الشراء والتسوق عن طريق الموقع. اي استفسارات أو اقتراحات الرجاء ارسالها الى info@tycoon.today&nbsp;&nbsp;</div>', 'sa', '2020-12-13 10:04:44', '2021-08-31 01:09:09'),
(2, 6, 'سياسة الخصوصية', NULL, 'sa', '2020-12-13 10:23:51', '2020-12-13 10:23:51'),
(3, 5, 'الشروط والأحكام', NULL, 'sa', '2020-12-13 10:24:51', '2020-12-13 10:24:51'),
(4, 4, 'سياسة الدعم', NULL, 'sa', '2020-12-13 10:25:40', '2020-12-13 10:25:40'),
(5, 3, 'سياسة الإرجاع', NULL, 'sa', '2020-12-13 10:26:38', '2020-12-13 10:26:38'),
(6, 2, 'سياسة التوصيل', NULL, 'sa', '2020-12-13 10:27:49', '2020-12-13 10:27:49'),
(7, 8, 'للإتصال بنا', '<div style=\"font-family: system-ui, -apple-system, system-ui, &quot;.SFNSText-Regular&quot;, sans-serif; color: rgb(28, 30, 33);\"><div class=\"dwo3fsh8 g5ia77u1 rt8b4zig n8ej3o3l agehan2d sk4xxmp2 rq0escxv q9uorilb kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso l9j0dhe7 i1ao9s8h k4urcfbm\" style=\"border-width: 0px; padding: 0px; margin: 0px; appearance: none; background-color: transparent; text-align: inherit; width: 344px; position: relative; display: inline-block; font-family: inherit;\"><div class=\"j83agx80 cbu4d94t sj5x9vvc cxgpxx05\" style=\"flex-direction: column; padding-top: 8px; display: flex; padding-bottom: 8px; font-family: inherit;\"><div class=\"rq0escxv l9j0dhe7 du4w35lb j83agx80 pfnyh3mw jifvfom9 ll8tlv6m owycx6da btwxx1t3 hv4rvrfc dati1w0a jb3vyjys b5q2rw42 lq239pai mysgfdmx hddg9phg\" style=\"margin: -6px; flex-flow: row nowrap; padding-right: 16px; z-index: 0; padding-left: 16px; display: flex; padding-top: 0px; justify-content: flex-start; position: relative; align-items: flex-start; flex-shrink: 0; font-family: inherit;\"><div class=\"rq0escxv l9j0dhe7 du4w35lb j83agx80 cbu4d94t g5gj957u d2edcug0 hpfvmrgz rj1gh0hx buofh1pr o8rfisnq p8fzw8mz pcp91wgn iuny7tx3 ipjc6fyt\" style=\"flex: 1 1 0px; flex-direction: column; max-width: 100%; z-index: 0; min-width: 0px; padding: 6px; display: flex; position: relative; align-self: center; font-family: inherit;\"><div class=\"j83agx80 cbu4d94t ew0dbk1b irj2b8pg\" style=\"flex-direction: column; margin-bottom: -5px; margin-top: -5px; display: flex; font-family: inherit;\"><div class=\"qzhwtbm6 knvmm38d\" style=\"margin-top: 5px; margin-bottom: 5px; font-family: inherit;\"><span class=\"d2edcug0 hpfvmrgz qv66sw1b c1et5uql oi732d6d ik7dh3pa fgxwclzu a8c37x1j keod5gw0 nxhoafnm aigsh9s9 d9wwppkn fe6kdd0r mau55g9w c8b282yb iv3no6db jq4qci2q a3bd9o3v knj5qynh oo9gr5id hzawbc8m\" dir=\"auto\" style=\"line-height: 1.3333; display: block; overflow-wrap: break-word; max-width: 100%; font-family: inherit; min-width: 0px; text-align: right; -webkit-font-smoothing: antialiased; font-size: 0.9375rem; color: var(--primary-text); word-break: break-word;\"><div class=\"j83agx80 cbu4d94t ew0dbk1b irj2b8pg\" style=\"flex-direction: column; margin-bottom: -5px; margin-top: -5px; display: flex; font-family: inherit;\"><div class=\"qzhwtbm6 knvmm38d\" style=\"margin-top: 5px; margin-bottom: 5px; font-family: inherit;\"><span class=\"d2edcug0 hpfvmrgz qv66sw1b c1et5uql oi732d6d ik7dh3pa fgxwclzu jq4qci2q a3bd9o3v knj5qynh oo9gr5id hzawbc8m\" style=\"line-height: 1.3333; overflow-wrap: break-word; max-width: 100%; font-family: inherit; min-width: 0px; -webkit-font-smoothing: antialiased; font-size: 0.9375rem; color: var(--primary-text); word-break: break-word;\"><div class=\"kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql\" style=\"overflow-wrap: break-word; margin: 0px; font-family: inherit;\"><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">info@tycoon.today. يمكنمكم المراسلة&nbsp;</div><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\"> او الاتصال على 0568454578 --- 0544644510&nbsp;</div><div><div class=\"oajrlxb2 g5ia77u1 qu0x051f esr5mh6w e9989ue4 r7d6kgcz rq0escxv nhd2j8a9 nc684nl6 p7hjln8o kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x jb3vyjys rz4wbd8a qt6c0cv9 a8nywdso i1ao9s8h esuyzwwr f1sip0of lzcic4wl oo9gr5id gpro0wi8 lrazzd5p\" role=\"button\" tabindex=\"0\" style=\"outline: none; list-style: none; border-width: 0px; border-style: initial; border-color: initial; padding: 0px; margin: 0px; touch-action: manipulation; background-color: transparent; text-align: inherit; font-weight: 600; display: inline; -webkit-tap-highlight-color: transparent; color: var(--primary-text); font-family: inherit;\"><br></div></div></div></span></div></div></span></div></div></div></div></div></div></div>', 'sa', '2020-12-13 10:32:19', '2020-12-13 10:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('naderadam20152015@gmail.com', '$2y$10$mYX.Wq0jjlr.uc.spbL0FOtvYJjSZpuMNkR0u6o6Ge7a61J4Ph3f6', '2020-07-29 11:28:39'),
('hassankhaled132@gmail.com', '$2y$10$QLRycn/QPU60w3MMIsA67ubD6rXVBRqiVyCy.sJHH5c5dzZbD0j96', '2020-07-29 11:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points`
--

CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_point_translations`
--

CREATE TABLE `pickup_point_translations` (
  `id` bigint(20) NOT NULL,
  `pickup_point_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'support_policy', NULL, '2019-10-29 10:54:45', '2019-01-22 03:13:15'),
(2, 'return_policy', NULL, '2019-10-29 10:54:47', '2019-01-24 03:40:11'),
(4, 'seller_policy', NULL, '2019-10-29 10:54:49', '2019-02-04 15:50:15'),
(5, 'terms', NULL, '2019-10-29 10:54:51', '2019-10-28 16:00:00'),
(6, 'privacy_policy', NULL, '2019-10-29 10:54:54', '2019-10-28 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flash_deal_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) NOT NULL,
  `wholesale_price` double(8,3) NOT NULL DEFAULT 0.000,
  `wholesale_text` double(8,3) NOT NULL DEFAULT 0.000,
  `wholesale_over` double(8,3) NOT NULL DEFAULT 0.000,
  `purchase_price` double(8,2) NOT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `colors` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `unit_Purchase` int(11) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `discount` double(8,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 DEFAULT 'flat_rate',
  `shipping_cost` double(8,2) DEFAULT 0.00,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `refundable` int(1) NOT NULL DEFAULT 0,
  `earn_point` double(8,2) NOT NULL DEFAULT 0.00,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Stock_Alert` int(11) NOT NULL DEFAULT 0,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crose_sale` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `number_pieces_package` decimal(8,2) NOT NULL DEFAULT 0.00,
  `product_sell_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unit',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `wholesale_price`, `wholesale_text`, `wholesale_over`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `unit`, `sale_unit`, `unit_Purchase`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `Stock_Alert`, `file_path`, `crose_sale`, `package_price`, `number_pieces_package`, `product_sell_type`, `created_at`, `updated_at`) VALUES
(15, 'عباية ستاتي تركي مكسي مصنوعة من أجود أنواع أقمشة الجورجيت والايبيك', 'admin', 12, 0, 9, NULL, NULL, '49', '49', NULL, NULL, 'youtube', NULL, '', NULL, 100.00, 0.000, 0.000, 0.000, 60.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 91, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 7, 'عباية ستاتي تركي مكسي مصنوعة من أجود أنواع أقمشة الجورجيت والايبيك', NULL, NULL, NULL, '-----------Trrez', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:46:57', '2021-11-25 20:56:32'),
(16, 'فستان كاروهات تركي مكسي', 'admin', 12, 0, 9, NULL, NULL, '86', '86', NULL, NULL, 'youtube', NULL, '', NULL, 170.00, 0.000, 0.000, 0.000, 100.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 29, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 11, 'فستان كاروهات تركي مكسي', NULL, NULL, NULL, '----KrVvU', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:48:03', '2021-11-25 20:56:32'),
(17, 'بلوزة سبورت ايروبين', 'admin', 12, 0, 8, NULL, NULL, '90', '90', NULL, NULL, 'youtube', NULL, '', NULL, 100.00, 0.000, 0.000, 0.000, 40.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 45, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 5, 'بلوزة سبورت ايروبين', NULL, NULL, NULL, '---JYcDf', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:48:45', '2021-11-25 20:56:32'),
(18, 'فستان سهرة طويل ترتر مع تول', 'admin', 12, 0, 6, NULL, NULL, '126', '126', NULL, NULL, 'youtube', NULL, '', NULL, 350.00, 0.000, 0.000, 0.000, 240.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 99, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'فستان سهرة طويل ترتر مع تول', NULL, NULL, NULL, '------ktLvE', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:49:22', '2021-11-25 20:56:32'),
(19, 'فستان سهرة قصير كتف مفتوح', 'admin', 12, 0, 6, NULL, NULL, '104,99', '113', NULL, NULL, 'youtube', NULL, '', NULL, 230.00, 0.000, 0.000, 0.000, 100.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 100, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان سهرة قصير كتف مفتوح', NULL, NULL, NULL, '-----1jxy8', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:50:02', '2021-11-25 20:56:32'),
(20, 'بيجامة برمودا قطن تركي', 'admin', 12, 0, 12, NULL, NULL, '78,79,80', '78', NULL, NULL, 'youtube', NULL, '', NULL, 100.00, 0.000, 0.000, 0.000, 50.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 50, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'بيجامة برمودا قطن تركي', NULL, NULL, NULL, '----nmpks', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:51:31', '2021-11-25 20:56:48'),
(21, 'قميص نوم قطن تركي', 'admin', 12, 0, 14, NULL, NULL, '36', '36', NULL, NULL, 'youtube', NULL, '', NULL, 50.00, 0.000, 0.000, 0.000, 30.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 99, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'قميص نوم قطن تركي', NULL, NULL, NULL, '----82niO', 0, 0.00, 5.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:52:16', '2021-11-25 20:56:48'),
(22, 'بنطلون جينز ممزع ومبطن', 'admin', 12, 0, 10, NULL, NULL, '162', '162', NULL, NULL, 'youtube', NULL, '', NULL, 100.00, 0.000, 0.000, 0.000, 65.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 18, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 2, 'بنطلون جينز ممزع ومبطن', NULL, NULL, NULL, '----QSxHq', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:53:15', '2021-11-25 20:56:20'),
(23, 'بنطلون قماش رسمي مع ربطة', 'admin', 12, 0, 1, NULL, NULL, '103,102', '12', NULL, NULL, 'youtube', NULL, '', NULL, 100.00, 0.000, 0.000, 0.000, 60.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 40, 'etc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'بنطلون قماش رسمي مع ربطة', NULL, NULL, NULL, '-----Gx27O', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-07 20:53:58', '2021-11-25 20:56:20'),
(24, 'عباية ستاتي تركي مكسي مصنوعة من أجود أنواع أقمشة الجورجيت والايبيك', 'admin', 12, 0, 9, NULL, 2, '52,55,56,57', '67', NULL, NULL, 'youtube', NULL, '[{\"value\":\"عباية ستاتي\"},{\"value\":\"عباية تركي\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 75.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"38\",\"60\"]}]', '[]', NULL, 1, 1, 1, 0, 'etc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'عباية ستاتي تركي مكسي مصنوعة من أجود أنواع أقمشة الجورجيت والايبيك', NULL, NULL, NULL, '-----------k6in3', 0, 0.00, 0.00, '025797813172493', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-14 18:47:03', '2021-11-25 20:56:32'),
(25, 'فستان شيفون معرق تركي ، كم أسباني، كلوش ومبطن', 'admin', 12, 0, 9, NULL, 2, '109', '109', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان شيقون\"},{\"value\":\"فستان  معرق\"},{\"value\":\"فستان تركي\"}]', 'فستان شيفون معرق تركي ، كم أسباني، كلوش ومبطن', 100.00, 0.000, 0.000, 0.000, 70.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"38\",\"39\",\"40\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان شيفون معرق تركي ، كم أسباني، كلوش ومبطن', 'فستان شيفون معرق تركي ، كم أسباني، كلوش ومبطن', NULL, NULL, '---------rqkd7', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-14 18:51:04', '2021-11-25 20:56:32'),
(26, 'فستان كاروهات تركي مكسي', 'admin', 12, 0, 9, NULL, 2, '7,8,9', '9', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان كاروهات\"},{\"value\":\"فستان تركي\"},{\"value\":\"فستان مكسي\"}]', 'فستان كاروهات تركي مكسي', 100.00, 0.000, 0.000, 0.000, 50.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"38\",\"39\",\"40\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان كاروهات تركي مكسي', 'فستان كاروهات تركي مكسي', NULL, NULL, '----b8QgL', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-14 18:53:24', '2021-11-25 20:56:32'),
(27, 'فستان شيفون مبطن ومنقط تركي', 'admin', 12, 0, 9, NULL, 2, '30', '30', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان شيفون\"},{\"value\":\"فستان مبطن\"},{\"value\":\"فستان منقط\"},{\"value\":\"فستان تركي\"}]', NULL, 230.00, 0.000, 0.000, 0.000, 140.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان شيفون مبطن ومنقط تركي', NULL, NULL, NULL, '-----6WZHW', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-14 18:58:57', '2021-11-25 20:56:32'),
(28, 'فستان ايروبين تركي مكسي مع زمة للخصر', 'admin', 12, 0, 9, NULL, 2, '61', '61', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان ايروبين\"},{\"value\":\"فستان تركي\"},{\"value\":\"فستان\"},{\"value\":\"فستان مكسي\"},{\"value\":\"فستان زمة للخصر\"}]', NULL, 400.00, 0.000, 0.000, 0.000, 320.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"38\",\"39\",\"40\",\"41\",\"42\",\"34\",\"44\",\"45\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان ايروبين تركي مكسي مع زمة للخصر', NULL, NULL, NULL, '-------iKjVQ', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-14 19:02:36', '2021-11-25 20:56:32'),
(29, 'فستان ايروبين مكسي كلوش', 'admin', 12, 0, 9, 2, 2, '77,78', '66', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان ايروبين\"},{\"value\":\"فستان مكسي\"},{\"value\":\"فستان كلوش\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 50.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان ايروبين مكسي كلوش', NULL, NULL, NULL, '----fLgdl', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 10:31:31', '2021-11-25 20:56:32'),
(30, 'فستان كلوش قماش نترات', 'admin', 12, 0, 9, 1, 2, '10', '10', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان كلوش\"},{\"value\":\"فستانقماش نترات\"}]', NULL, 230.00, 0.000, 0.000, 0.000, 150.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان كلوش قماش نترات', NULL, NULL, NULL, '----bF5WK', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 10:35:54', '2021-11-25 20:56:32'),
(31, 'فستان ايروبين طبقتين تركي', 'admin', 12, 0, 9, 2, 2, '113,123', '123', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان ايروبين\"},{\"value\":\"فستان طبقتين\"},{\"value\":\"فستان تركي\"}]', NULL, 140.00, 0.000, 0.000, 0.000, 100.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان ايروبين طبقتين تركي', NULL, NULL, NULL, '----xZTeV', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 10:42:34', '2021-11-25 20:56:32'),
(32, 'فستان سبورت ستاتي مكسي', 'admin', 12, 0, 9, 2, 2, '90,86', '107', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان سبورت\"},{\"value\":\"فستاني مكسي\"}]', NULL, 130.00, 0.000, 0.000, 0.000, 75.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"36\",\"37\",\"38\",\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان سبورت ستاتي مكسي', NULL, NULL, NULL, '----1iv27', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 10:45:30', '2021-11-25 20:56:32'),
(33, 'تونز قطعتين كاروهات', 'admin', 12, 0, 8, 3, 2, '75,76', '75', NULL, NULL, 'youtube', NULL, '[{\"value\":\"تونز\"},{\"value\":\"تونز كاروهات\"},{\"value\":\"تونز قطعتين\"}]', NULL, 350.00, 0.000, 0.000, 0.000, 200.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"M\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'تونز قطعتين كاروهات', NULL, NULL, NULL, '---ZO4u9', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:02:03', '2021-11-25 20:56:32'),
(34, 'بلوزة سبورت ايروبين', 'admin', 12, 0, 8, 4, 2, '66,65,60', '66', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بلوزة سبورت\"},{\"value\":\"بلوزة ايروبين\"}]', NULL, 350.00, 0.000, 0.000, 0.000, 200.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'بلوزة سبورت ايروبين', NULL, NULL, NULL, '---jWoti', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:05:29', '2021-11-25 20:56:32'),
(35, 'بلوزة تونيك ثلثيني مقاسات واسعة فضفاضة', 'admin', 12, 0, 8, 4, 2, '74,72,71', '69', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بلوزات تونيك\"}]', NULL, 200.00, 0.000, 0.000, 0.000, 150.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, -2, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 2, 'بلوزة تونيك ثلثيني مقاسات واسعة فضفاضة', NULL, NULL, NULL, '------avrcK', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:09:44', '2021-11-25 20:56:32'),
(36, 'بلوزة ايروبين كم إسباني عريض', 'admin', 12, 0, 8, 4, 2, '87,89,88', '89', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بلوزة اسباني\"},{\"value\":\"بلوزة كم عريض\"}]', NULL, 350.00, 0.000, 0.000, 0.000, 250.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'بلوزة ايروبين كم إسباني عريض', NULL, NULL, NULL, '-----n2qet', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:20:51', '2021-11-25 20:56:32'),
(37, 'طقم قطعتين على قميص تونيك طويل', 'admin', 12, 0, 8, 5, 2, '66,65,64', '67', NULL, NULL, 'youtube', NULL, '[{\"value\":\"طقم قطعتينعلي قميص\"}]', NULL, 500.00, 0.000, 0.000, 0.000, 430.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'طقم قطعتين على قميص تونيك طويل', NULL, NULL, NULL, '------gX2eO', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:24:03', '2021-11-25 20:56:32'),
(38, 'افرهول سبورت', 'admin', 12, 0, 8, 5, 2, '107', '107', NULL, NULL, 'youtube', NULL, '[{\"value\":\"افرهول\"}]', NULL, 200.00, 0.000, 0.000, 0.000, 150.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'افرهول سبورت', NULL, NULL, NULL, '--7HUCX', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:27:16', '2021-11-25 20:56:32'),
(39, 'قميص ايروبين قصير مع زمة', 'admin', 12, 0, 8, 6, 2, '42,55,56,57,54', '69', NULL, NULL, 'youtube', NULL, '[{\"value\":\"قميص ايروبن\"},{\"value\":\"قميص قصيرمزموم\"}]', NULL, 300.00, 0.000, 0.000, 0.000, 220.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'قميص ايروبين قصير مع زمة', NULL, NULL, NULL, '-----R1MoS', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:40:21', '2021-11-25 20:56:32'),
(40, 'طقم قطعتين قماش ايرويين ايطالي', 'admin', 12, 0, 8, 5, 2, '70,71,72', '106', NULL, NULL, 'youtube', NULL, '[{\"value\":\"\'طقم ايطالي\"}]', NULL, 300.00, 0.000, 0.000, 0.000, 150.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'طقم قطعتين قماش ايرويين ايطالي', NULL, NULL, NULL, '-----2dIV2', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:43:54', '2021-11-25 20:56:32'),
(41, 'فستان جينز مكسي', 'admin', 12, 0, 8, 3, 2, '109,108,110', '109', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان جينز\"},{\"value\":\"فستان مكسي\"}]', NULL, 300.00, 0.000, 0.000, 0.000, 200.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'فستان جينز مكسي', NULL, NULL, NULL, '---6omol', 0, 7.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:46:39', '2021-11-25 20:56:32'),
(42, 'جاكيت جينز تركي قصير', 'admin', 12, 0, 8, 4, 2, '127,129', '127', NULL, NULL, 'youtube', NULL, '[{\"value\":\"جاكت\"},{\"value\":\"جاكت جينز\"},{\"value\":\"جاكت  تركي\"},{\"value\":\"جاكت قصير\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 80.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"S\",\"m\",\"l\",\"xl\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'جاكيت جينز تركي قصير', NULL, NULL, NULL, '----kbFaL', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 11:48:39', '2021-11-25 20:56:32'),
(43, 'عرض جهاز بيبي كامل', 'admin', 12, 0, 16, 7, 2, '130,132', '118', NULL, NULL, 'youtube', NULL, '[{\"value\":\"جهاز بيبي\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 80.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'عرض جهاز بيبي كامل', NULL, NULL, NULL, '----lIgko', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 12:17:35', '2021-11-25 20:56:42'),
(44, 'طقم اسبورت', 'admin', 12, 0, 2, 8, 2, '129', '129', NULL, NULL, 'youtube', NULL, '[{\"value\":\"سبورت اولادي\"}]', NULL, 500.00, 0.000, 0.000, 0.000, 400.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"s\",\"m\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'طقم اسبورت', NULL, NULL, NULL, '--XHhQz', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 12:21:50', '2021-11-25 20:56:20'),
(45, 'فستان تركي', 'admin', 12, 0, 13, 10, 2, '48,47,46', '30', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فسان تركي\"},{\"value\":\"فستان سهرة\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 70.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"m\",\"l\"]}]', '[]', NULL, 1, 1, 1, -4, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 4, 'فستان تركي', NULL, NULL, NULL, '--IeGXj', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 12:26:50', '2021-11-25 20:56:48'),
(46, 'حذاء تركي', 'admin', 12, 5, 22, 11, 2, '114', '114', NULL, NULL, 'youtube', NULL, '[{\"value\":\"خذاء تركي\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 60.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"40\",\"41\",\"42\",\"43\",\"44\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'حذاء تركي', NULL, NULL, NULL, '--1EV7i', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-15 12:32:22', '2020-11-24 17:48:25'),
(47, 'ملابس ولادي', 'admin', 12, 0, 2, 8, 2, '115', '115', NULL, NULL, 'youtube', NULL, '[{\"value\":\"ملابس اولادي\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 70.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"30\",\"31\",\"32\",\"33\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'ملابس ولادي', NULL, NULL, NULL, '--k0Fki', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-16 11:09:38', '2021-11-25 20:56:20'),
(48, 'طقم اولادي', 'admin', 12, 0, 2, 8, 2, '115,116', '112', NULL, NULL, 'youtube', NULL, '[{\"value\":\"طقم\"}]', NULL, 120.00, 0.000, 0.000, 0.000, 70.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"30\",\"31\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'طقم اولادي', NULL, NULL, NULL, '--F4nSF', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-16 11:13:36', '2021-11-25 20:56:20'),
(49, 'طقم بيبي', 'admin', 12, 0, 16, 7, 2, '118,117', '131', NULL, NULL, 'youtube', NULL, '[{\"value\":\"طقم بيبي\"}]', NULL, 50.00, 0.000, 0.000, 0.000, 35.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"22\",\"23\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'طقم بيبي', NULL, NULL, NULL, '--imDWw', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-16 11:16:41', '2021-11-25 20:56:42'),
(50, 'طقم بيبي', 'admin', 12, 0, 16, 7, 2, '117', '117', NULL, NULL, 'youtube', NULL, '[{\"value\":\"طقم بيبي\"}]', NULL, 70.00, 0.000, 0.000, 0.000, 35.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"21\",\"22\",\"23\"]}]', '[]', NULL, 1, 1, 1, -21, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 21, 'طقم بيبي', NULL, NULL, NULL, '--QmM0q', 0, 0.00, 5.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-16 11:18:18', '2021-11-25 20:56:42'),
(51, 'طقم بناتي', 'admin', 12, 0, 13, 10, 2, '120,119', '120', NULL, NULL, 'youtube', NULL, '', NULL, 100.00, 0.000, 0.000, 0.000, 50.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"25\",\"24\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'طقم بناتي', NULL, NULL, NULL, '--GQjSG', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-16 11:22:52', '2021-11-25 20:56:48'),
(52, 'طقم بناتي', 'admin', 12, 0, 13, 10, 2, '111', '111', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بناتي\"}]', NULL, 50.00, 0.000, 0.000, 0.000, 30.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"22\",\"23\",\"24\"]}]', '[]', NULL, 1, 1, 1, -1, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'طقم بناتي', NULL, NULL, NULL, '--Ytn2M', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-16 11:24:21', '2021-11-25 20:56:48'),
(53, 'حذاء بيبي', 'admin', 12, 5, 22, 11, 2, '121', '121', NULL, NULL, 'youtube', NULL, '[{\"value\":\"حذاء بيبي\"}]', NULL, 50.00, 0.000, 0.000, 0.000, 30.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"18\",\"19\",\"20\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 10.00, 'amount', 20.00, 'amount', 'flat_rate', 0.00, 1, 'حذاء بيبي', NULL, NULL, NULL, '--IlHJ3', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-16 11:42:20', '2021-07-25 20:35:12'),
(54, 'حذاء سهرة', 'admin', 12, 5, 22, 11, 2, '122', '122', NULL, NULL, 'youtube', NULL, '[{\"value\":\"سهرة\"}]', NULL, 30.00, 0.000, 0.000, 0.000, 30.00, 1, '[\"2\"]', '[{\"attribute_id\":\"2\",\"values\":[\"36\",\"37\"]}]', '[]', NULL, 1, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 10.00, 'amount', 'flat_rate', 0.00, 1, 'حذاء سهرة', NULL, NULL, NULL, '--VTbmO', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-16 11:44:39', '2021-07-25 20:35:12'),
(55, 'طقم خروج', 'admin', 12, 0, 8, 3, 2, '31,30,33', '31', NULL, NULL, 'youtube', NULL, '[{\"value\":\"طقم خروج\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 100.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 100, 'pc', NULL, NULL, 1, 0.00, 'amount', 20.00, 'amount', 'flat_rate', 0.00, 0, 'طقم خروج', NULL, NULL, NULL, '--DIuEl', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:12:08', '2021-11-25 20:56:32'),
(56, 'تونز', 'admin', 12, 0, 8, 3, 6, '10', '10', NULL, NULL, 'youtube', NULL, '[{\"value\":\"تونز\"}]', NULL, 150.00, 0.000, 0.000, 0.000, 100.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"m\",\"l\"]}]', '[\"#FAEBD7\",\"#00FFFF\",\"#7FFFD4\",\"#F0FFFF\",\"#00FFFF\",\"#008B8B\",\"#F0FFF0\"]', NULL, 1, 1, 1, -4, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 4, 'تونز', NULL, NULL, NULL, '-BsmdP', 0, 0.00, 2.70, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:17:22', '2021-11-25 20:56:32'),
(57, 'تونز طويل', 'admin', 12, 0, 8, 3, 3, '124', '125', NULL, NULL, 'youtube', NULL, '[{\"value\":\"تونز\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 70.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 97, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 3, 'تونز طويل', NULL, NULL, NULL, '--fDTrD', 0, 0.00, 0.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:20:50', '2021-11-25 20:56:32'),
(58, 'قميص', 'admin', 12, 0, 8, 3, 2, '126', '126', NULL, NULL, 'youtube', NULL, '[{\"value\":\"قميص\"}]', NULL, 150.00, 140.000, 0.000, 0.000, 100.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 30, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'قميص', NULL, NULL, NULL, '-aiOe5', 0, 0.00, 0.00, '847285049090429', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:22:10', '2021-11-25 20:56:32'),
(59, 'طقم شبابي', 'admin', 12, 0, 2, 8, 2, '127,21', '162', NULL, NULL, 'youtube', NULL, '[{\"value\":\"شبابي\"}]', NULL, 250.00, 70.000, 0.000, 0.000, 200.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 30, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'طقم شبابي', NULL, NULL, NULL, '--0A3sZ', 0, 0.00, 0.00, '153104534622838', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:26:08', '2021-11-25 20:56:20'),
(60, 'قميص اولادي', 'admin', 12, 0, 2, 8, 3, '128,129', '128', NULL, NULL, 'youtube', NULL, '[{\"value\":\"قميص\"}]', NULL, 150.00, 0.000, 0.000, 0.000, 100.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 43, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 7, 'قميص اولادي', NULL, NULL, NULL, '--lmitg', 0, 0.00, 1.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:27:56', '2021-11-25 20:56:20'),
(61, 'طقم صيقي شبابي', 'admin', 12, 0, 2, 8, 3, '129,21', '128', NULL, NULL, 'youtube', NULL, '[{\"value\":\"صيفي\"}]', NULL, 150.00, 0.000, 0.000, 0.000, 120.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 36, 'pc', NULL, NULL, 1, 5.00, 'percent', 0.00, 'amount', 'flat_rate', 0.00, 4, 'طقم صيقي شبابي', NULL, NULL, NULL, '---3hxin', 0, 0.00, 5.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:29:12', '2021-11-25 20:56:20'),
(62, 'طقم بيبي', 'admin', 12, 0, 16, 7, 4, '117,116', '130', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بيبي\"}]', NULL, 80.00, 20.000, 0.000, 0.000, 55.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 96, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'طقم بيبي', NULL, NULL, NULL, '--39yLu', 0, 0.00, 0.00, '283671060153689', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:32:05', '2021-11-25 20:56:42'),
(63, 'ملابس بيبي', 'admin', 12, 0, 16, 7, 2, '131,132', '111', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بيبي\"}]', NULL, 120.00, 100.000, 0.000, 0.000, 95.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 35, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 2, 'ملابس بيبي', NULL, NULL, NULL, '--XdVzq', 0, 0.00, 0.00, '011988515789832', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:33:30', '2021-11-25 20:56:42'),
(64, 'بيبي', 'admin', 12, 0, 16, 7, 3, '117,132,131,130', '118', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بيبي\"}]', NULL, 100.00, 0.000, 0.000, 0.000, 84.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 20, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'بيبي', NULL, NULL, NULL, '-KUqtn', 0, 0.00, 7.00, NULL, 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:35:03', '2021-11-25 20:56:42'),
(65, 'فستان', 'admin', 12, 0, 13, 10, 5, '49,51,55', '33', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان\"}]', NULL, 100.00, 50.000, 0.000, 0.000, 80.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 39, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'فستان', NULL, NULL, NULL, '-iqrrv', 0, 0.00, 0.00, '748836775989760', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:39:25', '2021-11-25 20:56:48'),
(66, 'فستان بناتي', 'admin', 12, 0, 13, 10, 6, '109', '31', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان\"}]', NULL, 120.00, 0.000, 0.000, 0.000, 85.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 49, 'pc', NULL, NULL, 1, 20.00, 'percent', 0.00, 'amount', 'flat_rate', 0.00, 1, 'فستان بناتي', NULL, NULL, NULL, '--gUFdE', 0, 0.00, 0.00, '510067904313927', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:40:28', '2021-11-25 20:56:48'),
(67, 'فستان سهرة', 'admin', 12, 0, 13, 10, 5, '113,109', '113', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان\"}]', NULL, 100.00, 80.000, 0.000, 0.000, 90.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 44, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 4, 'فستان سهرة', NULL, NULL, NULL, '--tAjJY', 0, 0.00, 0.00, '685198121107894', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:42:11', '2021-11-25 20:56:48'),
(68, 'حذاء كعب عالي', 'admin', 12, 5, 22, 11, 2, '162,114', '162', NULL, NULL, 'youtube', NULL, '[{\"value\":\"كعب عالي\"}]', NULL, 100.00, 50.000, 0.000, 0.000, 90.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 48, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 3, 'حذاء كعب عالي', NULL, NULL, NULL, '---o1irk', 0, 0.00, 0.00, '096435070669051', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:45:19', '2021-08-01 22:38:50'),
(69, 'اطفالي كجول', 'admin', 12, 5, 22, 11, 1, '116,115', '116', NULL, NULL, 'youtube', NULL, '[{\"value\":\"كجول\"}]', NULL, 120.00, 110.000, 0.000, 0.000, 110.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 12, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 3, 'اطفالي كجول', NULL, NULL, NULL, '--GJF1M', 0, 0.00, 0.00, '339759694534080', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:46:20', '2021-11-25 18:30:57'),
(70, 'حذاء شبابي', 'admin', 12, 5, 22, 11, 2, '162', '162', NULL, NULL, 'youtube', NULL, '[{\"value\":\"شبابي\"}]', NULL, 100.00, 95.000, 0.000, 0.000, 80.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"43\",\"44\"]}]', '[\"#FAEBD7\",\"#000000\",\"#0000FF\"]', NULL, 0, 1, 1, 54, 'pc', NULL, NULL, 1, 10.00, 'percent', 10.00, 'amount', 'free', 0.00, 90, 'حذاء شبابي', NULL, NULL, NULL, '--EYaB4', 1, 100.00, 4.50, '537540294808710', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2020-07-29 12:47:21', '2021-10-28 18:48:48'),
(71, 'test product', 'admin', 12, 0, 8, 3, 1, '126', '107', NULL, NULL, 'youtube', NULL, '[{\"value\":\"test\"}]', NULL, 100.00, 90.000, 5.000, 2.000, 80.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"36\",\"37\"]}]', '[\"#9966CC\",\"#00FFFF\",\"#00FFFF\"]', NULL, 0, 1, 1, 0, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 2, 'test product', NULL, NULL, NULL, 'test-product-Yutd7', 1, 0.00, 0.00, '1234567', 0, NULL, 0, NULL, '[\"70\",\"69\",\"68\",\"67\"]', '0.00', '0.00', 'unit', '2020-12-10 18:21:30', '2021-11-25 20:56:32'),
(72, 'المنتج الاول', 'admin', 12, 0, 3, NULL, 3, '197', '198,199', NULL, NULL, 'youtube', NULL, '[{\"value\":\"ملابس\"}]', NULL, 10.00, 100.000, 2.000, 1.000, 10.00, 1, '[\"1\",\"2\"]', '[{\"attribute_id\":\"1\",\"values\":[\"34\",\"35\"]},{\"attribute_id\":\"2\",\"values\":[\"\\u0642\\u0637\\u0646\",\"\\u0643\\u062a\\u0627\\u0646\"]}]', '[\"#F0F8FF\",\"#9966CC\"]', NULL, 0, 1, 0, 0, '1', 1, 1, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'المنتج الاول', NULL, NULL, NULL, '--vw4B8', 1, 0.00, 0.00, '883460762527589', 0, NULL, 3, NULL, NULL, '0.00', '0.00', 'unit', '2021-07-14 17:28:17', '2021-11-25 20:56:32'),
(73, 'حذاء شبابي', 'admin', 12, 5, 22, 11, 2, '162', '162', NULL, NULL, 'youtube', NULL, '[{\"value\":\"شبابي\"}]', NULL, 100.00, 95.000, 0.000, 0.000, 80.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"43\",\"44\"]}]', '[\"#FAEBD7\",\"#000000\",\"#0000FF\"]', NULL, 0, 1, 1, 54, 'pc', NULL, NULL, 1, 10.00, 'percent', 10.00, 'amount', 'free', 0.00, 87, 'حذاء شبابي', NULL, NULL, NULL, '--1w42K', 1, 100.00, 4.50, '537540294808710', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-01 22:37:38', '2021-08-01 22:37:38'),
(74, 'حذاء شبابي', 'admin', 47, 5, 22, 11, 2, '162', '162', NULL, NULL, 'youtube', NULL, '[{\"value\":\"شبابي\"}]', NULL, 100.00, 95.000, 0.000, 0.000, 80.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"43\",\"44\"]}]', '[\"#FAEBD7\",\"#000000\",\"#0000FF\"]', NULL, 0, 1, 1, 1, 'pc', NULL, NULL, 1, 10.00, 'percent', 10.00, 'amount', 'free', 0.00, 89, 'حذاء شبابي', NULL, NULL, NULL, '--EYaB4', 1, 100.00, 4.50, '537540294808710', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-28 17:04:55', '2021-08-28 17:04:55'),
(75, 'اطفالي كجول', 'admin', 47, 5, 22, 11, 1, '116,115', '116', NULL, NULL, 'youtube', NULL, '[{\"value\":\"كجول\"}]', NULL, 120.00, 110.000, 0.000, 0.000, 110.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 1, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 2, 'اطفالي كجول', NULL, NULL, NULL, '--GJF1M', 0, 0.00, 0.00, '339759694534080', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-28 17:04:55', '2021-08-28 17:04:55'),
(76, 'اطفالي كجول', 'admin', 47, 5, 22, 11, 1, '116,115', '116', NULL, NULL, 'youtube', NULL, '[{\"value\":\"كجول\"}]', NULL, 120.00, 110.000, 0.000, 0.000, 110.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 1, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 2, 'اطفالي كجول', NULL, NULL, NULL, '--GJF1M', 0, 0.00, 0.00, '339759694534080', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-28 17:04:55', '2021-08-28 17:04:55'),
(77, 'حذاء شبابي', 'admin', 47, 5, 22, 11, 2, '162', '162', NULL, NULL, 'youtube', NULL, '[{\"value\":\"شبابي\"}]', NULL, 100.00, 95.000, 0.000, 0.000, 80.00, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"43\",\"44\"]}]', '[\"#FAEBD7\",\"#000000\",\"#0000FF\"]', NULL, 0, 1, 1, 1, 'pc', NULL, NULL, 1, 10.00, 'percent', 10.00, 'amount', 'free', 0.00, 89, 'حذاء شبابي', NULL, NULL, NULL, '--EYaB4', 1, 100.00, 4.50, '537540294808710', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-28 17:23:33', '2021-08-28 17:23:33'),
(78, 'اطفالي كجول', 'admin', 47, 5, 22, 11, 1, '116,115', '116', NULL, NULL, 'youtube', NULL, '[{\"value\":\"كجول\"}]', NULL, 120.00, 110.000, 0.000, 0.000, 110.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 1, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 2, 'اطفالي كجول', NULL, NULL, NULL, '--GJF1M', 0, 0.00, 0.00, '339759694534080', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-28 17:23:33', '2021-08-28 17:23:33'),
(79, 'اطفالي كجول', 'admin', 47, 5, 22, 11, 1, '116,115', '116', NULL, NULL, 'youtube', NULL, '[{\"value\":\"كجول\"}]', NULL, 120.00, 110.000, 0.000, 0.000, 110.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 1, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 2, 'اطفالي كجول', NULL, NULL, NULL, '--GJF1M', 0, 0.00, 0.00, '339759694534080', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-28 17:23:33', '2021-08-28 17:23:33'),
(80, 'ملابس بيبي', 'admin', 47, 0, 16, 7, 2, '131,132', '111', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بيبي\"}]', NULL, 120.00, 0.000, 0.000, 0.000, 95.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 4, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'ملابس بيبي', NULL, NULL, NULL, '--XdVzq', 0, 0.00, 0.00, '011988515789832', 0, NULL, 0, NULL, NULL, '15.00', '5.00', 'package', '2021-08-29 23:16:57', '2021-11-25 20:56:42'),
(81, 'طقم بيبي', 'admin', 47, 0, 16, 7, 4, '117,116', '130', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بيبي\"}]', NULL, 80.00, 20.000, 0.000, 0.000, 55.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 4, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'طقم بيبي', NULL, NULL, NULL, '--39yLu', 0, 0.00, 0.00, '283671060153689', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-29 23:16:57', '2021-11-25 20:56:42'),
(82, 'فستان سهرة', 'admin', 47, 0, 13, 10, 5, '113,109', '113', NULL, NULL, 'youtube', NULL, '[{\"value\":\"فستان\"}]', NULL, 100.00, 80.000, 0.000, 0.000, 90.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 3, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 4, 'فستان سهرة', NULL, NULL, NULL, '--tAjJY', 0, 0.00, 0.00, '685198121107894', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-08-29 23:16:57', '2021-11-25 20:56:48'),
(83, 'ملابس بيبي', 'admin', 47, 0, 16, 7, 2, '131,132', '111', NULL, NULL, 'youtube', NULL, '[{\"value\":\"بيبي\"}]', NULL, 120.00, 0.000, 0.000, 0.000, 95.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 4, 'pc', NULL, NULL, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 1, 'ملابس بيبي', NULL, NULL, NULL, '--53Y1e', 0, 0.00, 0.00, '011988515789832', 0, NULL, 0, NULL, NULL, '15.00', '5.00', 'package', '2021-11-24 19:52:16', '2021-11-25 20:56:42'),
(84, 'aa', 'admin', 12, 5, 21, 12, 1, NULL, NULL, NULL, NULL, 'youtube', NULL, '', NULL, 0.00, 0.000, 0.000, 0.000, 0.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 0, 'قطعة', 0, 0, 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'aa', NULL, NULL, NULL, 'aa-6dYJ4', 1, 0.00, 0.00, '685797082151683', 0, NULL, 0, NULL, NULL, '0.00', '0.00', 'unit', '2021-11-26 01:29:06', '2021-11-26 01:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_reting`
--

CREATE TABLE `product_reting` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reting` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_reting`
--

INSERT INTO `product_reting` (`id`, `product_id`, `user_id`, `reting`, `created_at`, `updated_at`) VALUES
(1, 70, 12, 5, '2020-12-06 16:59:56', '2020-12-06 16:59:56'),
(2, 70, 14, 4, '2020-12-06 18:25:10', '2020-12-06 18:25:10'),
(3, 56, 14, 4, '2020-12-07 11:17:37', '2020-12-07 11:17:37'),
(4, 64, 35, 7, '2020-12-07 14:20:29', '2020-12-07 15:07:39'),
(5, 56, 35, 1, '2020-12-07 15:18:58', '2020-12-07 15:23:38'),
(6, 60, 35, 1, '2020-12-07 15:25:58', '2020-12-07 23:15:37'),
(7, 61, 35, 5, '2020-12-07 23:13:36', '2020-12-08 15:02:50'),
(8, 50, 37, 5, '2020-12-16 17:36:47', '2020-12-16 17:36:47'),
(9, 21, 37, 5, '2020-12-16 19:59:24', '2020-12-16 19:59:28'),
(10, 56, 38, 3, '2020-12-16 22:52:22', '2020-12-16 22:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 24, '38', NULL, 100.00, 10, '2020-07-14 18:47:03', '2020-11-23 01:31:21'),
(2, 24, '60', NULL, 100.00, 10, '2020-07-14 18:47:03', '2020-11-23 01:31:21'),
(3, 25, '38', NULL, 10.00, 10, '2020-07-14 18:51:04', '2020-11-23 01:29:50'),
(4, 25, '39', NULL, 10.00, 10, '2020-07-14 18:51:04', '2020-11-23 01:29:50'),
(5, 25, '40', NULL, 10.00, 10, '2020-07-14 18:51:04', '2020-11-23 01:29:50'),
(6, 26, '38', NULL, 100.00, 10, '2020-07-14 18:53:24', '2020-11-23 01:29:03'),
(7, 26, '39', NULL, 100.00, 10, '2020-07-14 18:53:24', '2020-11-23 01:29:03'),
(8, 26, '40', NULL, 100.00, 10, '2020-07-14 18:53:24', '2020-11-23 01:29:03'),
(9, 27, '38', NULL, 50.00, 10, '2020-07-14 18:58:57', '2020-11-23 01:27:27'),
(10, 27, '39', NULL, 50.00, 10, '2020-07-14 18:58:57', '2020-11-23 01:27:27'),
(11, 27, '40', NULL, 50.00, 10, '2020-07-14 18:58:57', '2020-11-23 01:27:27'),
(12, 27, '41', NULL, 50.00, 10, '2020-07-14 18:58:58', '2020-11-23 01:27:28'),
(13, 27, '42', NULL, 50.00, 10, '2020-07-14 18:58:58', '2020-11-23 01:27:28'),
(14, 27, '43', NULL, 50.00, 10, '2020-07-14 18:58:58', '2020-11-23 01:27:28'),
(15, 27, '44', NULL, 50.00, 10, '2020-07-14 18:58:58', '2020-11-23 01:27:28'),
(16, 27, '45', NULL, 50.00, 10, '2020-07-14 18:58:58', '2020-11-23 01:27:28'),
(17, 27, '46', NULL, 50.00, 10, '2020-07-14 18:58:58', '2020-11-23 01:27:28'),
(18, 28, '38', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(19, 28, '39', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(20, 28, '40', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(21, 28, '41', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(22, 28, '42', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(23, 28, '34', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(24, 28, '44', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(25, 28, '45', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(26, 28, '48', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(27, 28, '49', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(28, 28, '50', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(29, 28, '51', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(30, 28, '52', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(31, 28, '53', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(32, 28, '54', NULL, 50.00, 10, '2020-07-14 19:02:36', '2020-11-23 01:25:13'),
(33, 29, '38', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(34, 29, '39', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(35, 29, '40', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(36, 29, '41', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(37, 29, '42', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(38, 29, '43', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(39, 29, '44', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(40, 29, '45', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(41, 29, '46', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(42, 29, '47', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(43, 29, '48', NULL, 100.00, 10, '2020-07-15 10:31:31', '2020-11-23 01:22:51'),
(44, 30, '38', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:35'),
(45, 30, '39', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:35'),
(46, 30, '40', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:35'),
(47, 30, '41', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:35'),
(48, 30, '42', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:35'),
(49, 30, '43', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:35'),
(50, 30, '44', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:35'),
(51, 30, '45', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:36'),
(52, 30, '46', NULL, 50.00, 10, '2020-07-15 10:35:55', '2020-11-23 01:21:36'),
(53, 31, '38', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:58'),
(54, 31, '39', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:58'),
(55, 31, '40', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:59'),
(56, 31, '41', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:59'),
(57, 31, '42', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:59'),
(58, 31, '43', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:59'),
(59, 31, '44', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:59'),
(60, 31, '45', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:59'),
(61, 31, '46', NULL, 50.00, 10, '2020-07-15 10:42:34', '2020-11-23 01:19:59'),
(62, 32, '36', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(63, 32, '37', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(64, 32, '38', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(65, 32, '39', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(66, 32, '40', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(67, 32, '41', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(68, 32, '42', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(69, 32, '43', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(70, 32, '44', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(71, 32, '45', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(72, 32, '46', NULL, 50.00, 10, '2020-07-15 10:45:30', '2020-11-23 01:18:50'),
(73, 33, 's', NULL, 50.00, 10, '2020-07-15 11:02:03', '2020-11-23 01:17:02'),
(74, 33, 'M', NULL, 50.00, 10, '2020-07-15 11:02:03', '2020-11-23 01:17:02'),
(75, 33, 'l', NULL, 50.00, 10, '2020-07-15 11:02:03', '2020-11-23 01:17:02'),
(76, 33, 'xl', NULL, 50.00, 10, '2020-07-15 11:02:03', '2020-11-23 01:17:02'),
(77, 34, 's', NULL, 35.00, 8, '2020-07-15 11:05:29', '2020-11-23 01:15:23'),
(78, 34, 'm', NULL, 35.00, 10, '2020-07-15 11:05:29', '2020-11-23 01:15:23'),
(79, 34, 'l', NULL, 35.00, 10, '2020-07-15 11:05:29', '2020-11-23 01:15:23'),
(80, 34, 'xl', NULL, 35.00, 10, '2020-07-15 11:05:29', '2020-11-23 01:15:23'),
(81, 35, 's', NULL, 50.00, 10, '2020-07-15 11:09:44', '2020-11-23 01:13:49'),
(82, 35, 'm', NULL, 50.00, 10, '2020-07-15 11:09:44', '2020-11-23 01:13:49'),
(83, 35, 'l', NULL, 50.00, 10, '2020-07-15 11:09:44', '2020-11-23 01:13:49'),
(84, 35, 'xl', NULL, 50.00, 10, '2020-07-15 11:09:44', '2020-11-23 01:13:49'),
(85, 36, 's', NULL, 50.00, 10, '2020-07-15 11:20:51', '2020-11-23 01:07:23'),
(86, 36, 'm', NULL, 50.00, 10, '2020-07-15 11:20:51', '2020-11-23 01:07:23'),
(87, 36, 'l', NULL, 50.00, 10, '2020-07-15 11:20:51', '2020-11-23 01:07:23'),
(88, 36, 'xl', NULL, 50.00, 10, '2020-07-15 11:20:51', '2020-11-23 01:07:23'),
(89, 37, 's', NULL, 50.00, 10, '2020-07-15 11:24:03', '2020-11-23 01:03:32'),
(90, 37, 'm', NULL, 50.00, 10, '2020-07-15 11:24:03', '2020-11-23 01:03:32'),
(91, 37, 'l', NULL, 50.00, 10, '2020-07-15 11:24:03', '2020-11-23 01:03:32'),
(92, 37, 'xl', NULL, 50.00, 10, '2020-07-15 11:24:03', '2020-11-23 01:03:32'),
(93, 38, 's', NULL, 100.00, 10, '2020-07-15 11:27:16', '2020-11-23 01:01:43'),
(94, 38, 'm', NULL, 100.00, 10, '2020-07-15 11:27:16', '2020-11-23 01:01:43'),
(95, 38, 'l', NULL, 100.00, 10, '2020-07-15 11:27:16', '2020-11-23 01:01:43'),
(96, 38, 'xl', NULL, 100.00, 10, '2020-07-15 11:27:16', '2020-11-23 01:01:43'),
(97, 39, 's', NULL, 100.00, 10, '2020-07-15 11:40:21', '2020-11-23 01:00:38'),
(98, 39, 'm', NULL, 100.00, 10, '2020-07-15 11:40:21', '2020-11-23 01:00:38'),
(99, 39, 'l', NULL, 100.00, 10, '2020-07-15 11:40:21', '2020-11-23 01:00:38'),
(100, 39, 'xl', NULL, 100.00, 10, '2020-07-15 11:40:21', '2020-11-23 01:00:38'),
(101, 40, 's', NULL, 100.00, 10, '2020-07-15 11:43:54', '2020-11-23 00:58:27'),
(102, 40, 'm', NULL, 100.00, 10, '2020-07-15 11:43:54', '2020-11-23 00:58:27'),
(103, 40, 'l', NULL, 100.00, 10, '2020-07-15 11:43:54', '2020-11-23 00:58:27'),
(104, 40, 'xl', NULL, 100.00, 10, '2020-07-15 11:43:54', '2020-11-23 00:58:27'),
(105, 41, 's', NULL, 100.00, 10, '2020-07-15 11:46:39', '2020-11-23 00:50:49'),
(106, 41, 'm', NULL, 100.00, 10, '2020-07-15 11:46:39', '2020-11-23 00:50:49'),
(107, 41, 'l', NULL, 100.00, 10, '2020-07-15 11:46:39', '2020-11-23 00:50:49'),
(108, 41, 'xl', NULL, 100.00, 10, '2020-07-15 11:46:39', '2020-11-23 00:50:49'),
(109, 42, 'S', NULL, 100.00, 10, '2020-07-15 11:48:39', '2020-11-23 00:49:46'),
(110, 42, 'm', NULL, 100.00, 10, '2020-07-15 11:48:39', '2020-11-23 00:49:46'),
(111, 42, 'l', NULL, 100.00, 10, '2020-07-15 11:48:39', '2020-11-23 00:49:46'),
(112, 42, 'xl', NULL, 100.00, 10, '2020-07-15 11:48:39', '2020-11-23 00:49:46'),
(113, 43, 's', NULL, 100.00, 10, '2020-07-15 12:17:35', '2020-11-23 00:48:21'),
(114, 44, 's', NULL, 50.00, 10, '2020-07-15 12:21:50', '2020-11-23 00:47:03'),
(115, 44, 'm', NULL, 50.00, 10, '2020-07-15 12:21:50', '2020-11-23 00:47:03'),
(116, 45, 'm', NULL, 100.00, 10, '2020-07-15 12:26:50', '2020-11-23 00:40:25'),
(117, 45, 'l', NULL, 100.00, 10, '2020-07-15 12:26:50', '2020-11-23 00:40:25'),
(118, 46, '40', NULL, 100.00, 10, '2020-07-15 12:32:22', '2020-11-23 00:37:33'),
(119, 46, '41', NULL, 100.00, 10, '2020-07-15 12:32:22', '2020-11-23 00:37:33'),
(120, 46, '42', NULL, 100.00, 10, '2020-07-15 12:32:22', '2020-11-23 00:37:33'),
(121, 46, '43', NULL, 100.00, 10, '2020-07-15 12:32:22', '2020-11-23 00:37:33'),
(122, 46, '44', NULL, 100.00, 10, '2020-07-15 12:32:22', '2020-11-23 00:37:33'),
(123, 47, '30', NULL, 100.00, 10, '2020-07-16 11:09:38', '2020-11-23 00:36:34'),
(124, 47, '31', NULL, 100.00, 10, '2020-07-16 11:09:38', '2020-11-23 00:36:34'),
(125, 47, '32', NULL, 100.00, 10, '2020-07-16 11:09:38', '2020-11-23 00:36:34'),
(126, 47, '33', NULL, 100.00, 10, '2020-07-16 11:09:38', '2020-11-23 00:36:34'),
(127, 48, '30', NULL, 70.00, 10, '2020-07-16 11:13:36', '2020-11-23 00:34:57'),
(128, 48, '31', NULL, 70.00, 10, '2020-07-16 11:13:36', '2020-11-23 00:34:57'),
(129, 49, '22', NULL, 35.00, 10, '2020-07-16 11:16:41', '2020-11-23 00:33:47'),
(130, 49, '23', NULL, 35.00, 10, '2020-07-16 11:16:41', '2020-11-23 00:33:47'),
(131, 50, '21', NULL, 35.00, 10, '2020-07-16 11:18:18', '2020-11-23 00:25:00'),
(132, 50, '22', NULL, 35.00, 10, '2020-07-16 11:18:18', '2020-11-23 00:25:00'),
(133, 50, '23', NULL, 35.00, 10, '2020-07-16 11:18:18', '2020-11-23 00:25:00'),
(134, 52, '22', NULL, 50.00, 10, '2020-07-16 11:24:21', '2020-11-23 00:21:53'),
(135, 52, '23', NULL, 50.00, 10, '2020-07-16 11:24:21', '2020-11-23 00:21:53'),
(136, 52, '24', NULL, 50.00, 10, '2020-07-16 11:24:21', '2020-11-23 00:21:53'),
(137, 51, '25', NULL, 0.00, 10, '2020-07-16 11:25:54', '2020-11-23 00:22:57'),
(138, 51, '24', NULL, 0.00, 10, '2020-07-16 11:25:54', '2020-11-23 00:22:57'),
(139, 53, '18', NULL, 30.00, 9, '2020-07-16 11:42:20', '2021-07-25 20:35:12'),
(140, 53, '19', NULL, 30.00, 10, '2020-07-16 11:42:20', '2020-11-23 00:19:12'),
(141, 53, '20', NULL, 30.00, 10, '2020-07-16 11:42:20', '2020-11-23 00:19:12'),
(142, 54, '36', NULL, 30.00, 9, '2020-07-16 11:44:39', '2021-07-25 20:35:12'),
(143, 54, '37', NULL, 30.00, 10, '2020-07-16 11:44:39', '2020-11-23 00:21:02'),
(144, 56, 'AntiqueWhite-m', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(145, 56, 'AntiqueWhite-l', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(146, 56, 'Aqua-m', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(147, 56, 'Aqua-l', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(148, 56, 'Aquamarine-m', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(149, 56, 'Aquamarine-l', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(150, 56, 'Azure-m', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(151, 56, 'Azure-l', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(152, 56, 'DarkCyan-m', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(153, 56, 'DarkCyan-l', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(154, 56, 'Honeydew-m', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(155, 56, 'Honeydew-l', NULL, 150.00, 10, '2020-07-29 12:17:22', '2020-11-23 00:15:35'),
(190, 64, NULL, NULL, 100.00, 20, '2020-11-24 17:34:10', '2020-11-24 17:34:10'),
(194, 60, NULL, NULL, 150.00, 49, '2020-11-24 17:37:10', '2021-10-29 05:37:38'),
(197, 57, NULL, NULL, 100.00, 100, '2020-11-24 17:39:10', '2020-11-24 17:39:10'),
(198, 55, NULL, NULL, 100.00, 100, '2020-11-24 17:41:28', '2020-11-24 17:41:28'),
(199, 23, NULL, NULL, 100.00, 40, '2020-11-24 18:01:05', '2020-11-24 18:01:05'),
(200, 22, NULL, NULL, 100.00, 18, '2020-11-24 18:01:36', '2021-07-27 09:21:52'),
(201, 21, NULL, NULL, 50.00, 99, '2020-11-24 18:02:07', '2021-07-27 09:21:52'),
(202, 20, NULL, NULL, 100.00, 50, '2020-11-24 18:02:35', '2020-11-24 18:02:35'),
(203, 19, NULL, NULL, 230.00, 100, '2020-11-24 18:03:07', '2020-11-24 18:03:07'),
(204, 18, NULL, NULL, 350.00, 99, '2020-11-24 18:03:44', '2021-07-27 09:21:52'),
(205, 17, NULL, NULL, 100.00, 48, '2020-11-24 18:04:15', '2021-07-27 09:21:52'),
(206, 16, NULL, NULL, 170.00, 38, '2020-11-24 18:04:45', '2021-08-28 15:52:25'),
(207, 15, NULL, NULL, 100.00, 91, '2020-11-24 18:05:17', '2021-10-28 18:48:48'),
(210, 71, 'Amethyst-36', NULL, 100.00, 15, '2020-12-10 18:21:30', '2021-10-28 05:31:54'),
(211, 71, 'Amethyst-37', NULL, 100.00, 10, '2020-12-10 18:21:30', '2021-06-24 03:27:44'),
(212, 71, 'Aqua-36', NULL, 100.00, 10, '2020-12-10 18:21:30', '2021-06-24 03:27:44'),
(213, 71, 'Aqua-37', NULL, 100.00, 10, '2020-12-10 18:21:30', '2021-06-24 03:27:44'),
(214, 70, 'AntiqueWhite-43', NULL, 100.00, 3, '2020-12-23 11:37:52', '2021-10-28 18:48:48'),
(215, 70, 'AntiqueWhite-44', NULL, 100.00, 10, '2020-12-23 11:37:52', '2021-02-04 02:07:53'),
(216, 70, 'Black-43', NULL, 100.00, 10, '2020-12-23 11:37:52', '2021-02-04 02:07:53'),
(217, 70, 'Black-44', NULL, 100.00, 10, '2020-12-23 11:37:52', '2021-02-04 02:07:53'),
(218, 70, 'Blue-43', NULL, 100.00, 10, '2020-12-23 11:37:52', '2021-02-04 02:07:53'),
(219, 70, 'Blue-44', NULL, 100.00, 10, '2020-12-23 11:37:52', '2021-02-04 02:07:53'),
(220, 66, NULL, NULL, 120.00, 49, '2021-02-04 02:08:46', '2021-08-26 18:59:32'),
(221, 61, NULL, NULL, 150.00, 36, '2021-02-04 02:09:12', '2021-02-04 02:09:12'),
(222, 72, 'AliceBlue-34-قطن', NULL, 10.00, 10, '2021-07-14 17:28:17', '2021-07-29 15:03:09'),
(223, 72, 'AliceBlue-34-كتان', NULL, 10.00, 10, '2021-07-14 17:28:17', '2021-07-29 15:03:09'),
(224, 72, 'AliceBlue-35-قطن', NULL, 10.00, 10, '2021-07-14 17:28:17', '2021-07-29 15:03:09'),
(225, 72, 'AliceBlue-35-كتان', NULL, 10.00, 10, '2021-07-14 17:28:17', '2021-07-29 15:03:09'),
(226, 72, 'Amethyst-34-قطن', NULL, 10.00, 10, '2021-07-14 17:28:17', '2021-07-29 15:03:09'),
(227, 72, 'Amethyst-34-كتان', NULL, 10.00, 10, '2021-07-14 17:28:17', '2021-07-29 15:03:09'),
(228, 72, 'Amethyst-35-قطن', NULL, 10.00, 10, '2021-07-14 17:28:17', '2021-07-29 15:03:09'),
(229, 72, 'Amethyst-35-كتان', NULL, 10.00, 10, '2021-07-14 17:28:17', '2021-07-29 15:03:09'),
(232, 68, NULL, NULL, 100.00, 48, '2021-08-01 22:38:50', '2021-08-01 22:38:50'),
(233, 59, NULL, NULL, 250.00, 30, '2021-08-01 22:40:21', '2021-08-01 22:40:21'),
(236, 63, NULL, NULL, 120.00, 35, '2021-08-01 22:41:53', '2021-11-25 18:30:57'),
(237, 62, NULL, NULL, 80.00, 96, '2021-08-01 22:42:41', '2021-08-29 23:03:28'),
(238, 65, NULL, NULL, 100.00, 39, '2021-08-01 22:43:16', '2021-08-26 18:59:32'),
(239, 67, NULL, NULL, 100.00, 44, '2021-08-01 22:43:45', '2021-08-29 23:03:28'),
(240, 69, NULL, NULL, 120.00, 12, '2021-08-01 22:44:07', '2021-11-25 18:30:57'),
(241, 58, NULL, NULL, 150.00, 30, '2021-08-01 22:45:01', '2021-08-01 22:45:01'),
(245, 80, NULL, NULL, 120.00, 4, '2021-11-24 18:40:55', '2021-11-24 18:40:55'),
(246, 84, NULL, NULL, 0.00, 0, '2021-11-26 01:29:06', '2021-11-26 01:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `name`, `unit`, `description`, `lang`, `created_at`, `updated_at`) VALUES
(1, 70, 'حذاء شبابي', 'pc', NULL, 'sa', '2020-11-22 21:14:56', '2020-11-22 21:14:56'),
(2, 69, 'اطفالي كجول', 'pc', NULL, 'sa', '2020-11-22 23:35:57', '2020-11-22 23:35:57'),
(3, 68, 'حذاء كعب عالي', 'pc', NULL, 'sa', '2020-11-22 23:40:52', '2020-11-22 23:40:52'),
(4, 67, 'فستان سهرة', 'pc', NULL, 'sa', '2020-11-22 23:43:42', '2020-11-22 23:43:42'),
(5, 66, 'فستان بناتي', 'pc', NULL, 'sa', '2020-11-22 23:46:25', '2020-11-22 23:46:25'),
(6, 65, 'فستان', 'pc', NULL, 'sa', '2020-11-22 23:49:22', '2020-11-22 23:49:22'),
(7, 64, 'بيبي', 'pc', NULL, 'sa', '2020-11-22 23:50:57', '2020-11-22 23:50:57'),
(8, 63, 'ملابس بيبي', 'pc', NULL, 'sa', '2020-11-22 23:53:19', '2020-11-22 23:53:19'),
(9, 62, 'طقم بيبي', 'pc', NULL, 'sa', '2020-11-22 23:56:18', '2020-11-22 23:56:18'),
(10, 61, 'طقم صيقي شبابي', 'pc', NULL, 'sa', '2020-11-23 00:04:11', '2020-11-23 00:04:11'),
(11, 60, 'قميص اولادي', 'pc', NULL, 'sa', '2020-11-23 00:09:17', '2020-11-23 00:09:17'),
(12, 59, 'طقم شبابي', 'pc', NULL, 'sa', '2020-11-23 00:11:08', '2020-11-23 00:11:08'),
(13, 58, 'قميص', 'pc', NULL, 'sa', '2020-11-23 00:13:15', '2020-11-23 00:13:15'),
(14, 57, 'تونز طويل', 'pc', NULL, 'sa', '2020-11-23 00:14:17', '2020-11-23 00:14:17'),
(15, 56, 'تونز', 'pc', NULL, 'sa', '2020-11-23 00:15:35', '2020-11-23 00:15:35'),
(16, 55, 'طقم خروج', 'pc', NULL, 'sa', '2020-11-23 00:17:03', '2020-11-23 00:17:03'),
(17, 53, 'حذاء بيبي', 'pc', NULL, 'sa', '2020-11-23 00:19:12', '2020-11-23 00:19:12'),
(18, 54, 'حذاء سهرة', 'pc', NULL, 'sa', '2020-11-23 00:21:02', '2020-11-23 00:21:02'),
(19, 52, 'طقم بناتي', 'pc', NULL, 'sa', '2020-11-23 00:21:53', '2020-11-23 00:21:53'),
(20, 51, 'طقم بناتي', 'pc', NULL, 'sa', '2020-11-23 00:22:57', '2020-11-23 00:22:57'),
(21, 50, 'طقم بيبي', 'pc', NULL, 'sa', '2020-11-23 00:25:00', '2020-11-23 00:25:00'),
(22, 49, 'طقم بيبي', 'pc', NULL, 'sa', '2020-11-23 00:33:47', '2020-11-23 00:33:47'),
(23, 48, 'طقم اولادي', 'pc', NULL, 'sa', '2020-11-23 00:34:57', '2020-11-23 00:34:57'),
(24, 47, 'ملابس ولادي', 'pc', NULL, 'sa', '2020-11-23 00:36:34', '2020-11-23 00:36:34'),
(25, 46, 'حذاء تركي', 'pc', NULL, 'sa', '2020-11-23 00:37:33', '2020-11-23 00:37:33'),
(26, 45, 'فستان تركي', 'pc', NULL, 'sa', '2020-11-23 00:40:25', '2020-11-23 00:40:25'),
(27, 44, 'طقم اسبورت', 'pc', NULL, 'sa', '2020-11-23 00:47:03', '2020-11-23 00:47:03'),
(28, 43, 'عرض جهاز بيبي كامل', 'pc', NULL, 'sa', '2020-11-23 00:48:21', '2020-11-23 00:48:21'),
(29, 42, 'جاكيت جينز تركي قصير', 'pc', NULL, 'sa', '2020-11-23 00:49:46', '2020-11-23 00:49:46'),
(30, 41, 'فستان جينز مكسي', 'pc', NULL, 'sa', '2020-11-23 00:50:49', '2020-11-23 00:50:49'),
(31, 40, 'طقم قطعتين قماش ايرويين ايطالي', 'pc', NULL, 'sa', '2020-11-23 00:58:27', '2020-11-23 00:58:27'),
(32, 39, 'قميص ايروبين قصير مع زمة', 'pc', NULL, 'sa', '2020-11-23 01:00:38', '2020-11-23 01:00:38'),
(33, 38, 'افرهول سبورت', 'pc', NULL, 'sa', '2020-11-23 01:01:43', '2020-11-23 01:01:43'),
(34, 37, 'طقم قطعتين على قميص تونيك طويل', 'pc', NULL, 'sa', '2020-11-23 01:03:32', '2020-11-23 01:03:32'),
(35, 36, 'بلوزة ايروبين كم إسباني عريض', 'pc', NULL, 'sa', '2020-11-23 01:07:23', '2020-11-23 01:07:23'),
(36, 35, 'بلوزة تونيك ثلثيني مقاسات واسعة فضفاضة', 'pc', NULL, 'sa', '2020-11-23 01:13:49', '2020-11-23 01:13:49'),
(37, 34, 'بلوزة سبورت ايروبين', 'pc', NULL, 'sa', '2020-11-23 01:15:23', '2020-11-23 01:15:23'),
(38, 33, 'تونز قطعتين كاروهات', 'pc', NULL, 'sa', '2020-11-23 01:17:02', '2020-11-23 01:17:02'),
(39, 32, 'فستان سبورت ستاتي مكسي', 'pc', NULL, 'sa', '2020-11-23 01:18:50', '2020-11-23 01:18:50'),
(40, 31, 'فستان ايروبين طبقتين تركي', 'pc', NULL, 'sa', '2020-11-23 01:19:59', '2020-11-23 01:19:59'),
(41, 30, 'فستان كلوش قماش نترات', 'pc', NULL, 'sa', '2020-11-23 01:21:36', '2020-11-23 01:21:36'),
(42, 29, 'فستان ايروبين مكسي كلوش', 'pc', NULL, 'sa', '2020-11-23 01:22:51', '2020-11-23 01:22:51'),
(43, 28, 'فستان ايروبين تركي مكسي مع زمة للخصر', 'pc', NULL, 'sa', '2020-11-23 01:25:13', '2020-11-23 01:25:13'),
(44, 27, 'فستان شيفون مبطن ومنقط تركي', 'pc', NULL, 'sa', '2020-11-23 01:27:28', '2020-11-23 01:27:28'),
(45, 26, 'فستان كاروهات تركي مكسي', 'pc', 'فستان كاروهات تركي مكسي', 'sa', '2020-11-23 01:29:03', '2020-11-23 01:29:03'),
(46, 25, 'فستان شيفون معرق تركي ، كم أسباني، كلوش ومبطن', 'pc', 'فستان شيفون معرق تركي ، كم أسباني، كلوش ومبطن', 'sa', '2020-11-23 01:29:50', '2020-11-23 01:29:50'),
(47, 24, 'عباية ستاتي تركي مكسي مصنوعة من أجود أنواع أقمشة الجورجيت والايبيك', 'etc', NULL, 'sa', '2020-11-23 01:31:21', '2020-11-23 01:31:21'),
(48, 23, 'بنطلون قماش رسمي مع ربطة', 'etc', NULL, 'sa', '2020-11-23 01:35:41', '2020-11-23 01:35:41'),
(49, 22, 'بنطلون جينز ممزع ومبطن', 'pc', NULL, 'sa', '2020-11-23 01:38:28', '2020-11-23 01:38:28'),
(50, 21, 'قميص نوم قطن تركي', 'pc', NULL, 'sa', '2020-11-23 01:44:01', '2020-11-23 01:44:01'),
(51, 20, 'بيجامة برمودا قطن تركي', 'pc', NULL, 'sa', '2020-11-23 01:46:06', '2020-11-23 01:46:06'),
(52, 19, 'فستان سهرة قصير كتف مفتوح', 'pc', NULL, 'sa', '2020-11-23 01:48:17', '2020-11-23 01:48:17'),
(53, 18, 'فستان سهرة طويل ترتر مع تول', 'pc', NULL, 'sa', '2020-11-23 01:49:38', '2020-11-23 01:49:38'),
(54, 17, 'بلوزة سبورت ايروبين', 'pc', NULL, 'sa', '2020-11-24 18:04:15', '2020-11-24 18:04:15'),
(55, 16, 'فستان كاروهات تركي مكسي', 'pc', NULL, 'sa', '2020-11-24 18:04:45', '2020-11-24 18:04:45'),
(56, 15, 'عباية ستاتي تركي مكسي مصنوعة من أجود أنواع أقمشة الجورجيت والايبيك', 'pc', NULL, 'sa', '2020-11-24 18:05:17', '2020-11-24 18:05:17'),
(57, 71, 'test product', 'pc', NULL, 'sa', '2020-12-10 18:21:30', '2020-12-10 18:21:30'),
(58, 72, 'المنتج الاول', '1', NULL, 'sa', '2021-07-14 17:28:17', '2021-07-14 17:28:17'),
(59, 80, 'ملابس بيبي', 'pc', NULL, 'sa', '2021-10-28 23:07:53', '2021-10-28 23:07:53'),
(60, 84, 'aa', '0', NULL, 'sa', '2021-11-26 01:29:06', '2021-11-26 01:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_upsale`
--

CREATE TABLE `product_upsale` (
  `id` int(11) NOT NULL,
  `upsale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_upsale`
--

INSERT INTO `product_upsale` (`id`, `upsale_id`, `product_id`, `discount_type`, `discount`, `created_at`, `updated_at`) VALUES
(1, 2, 70, 'amount', 10, '2021-06-24 02:09:46', '2021-06-24 02:09:46'),
(2, 2, 69, 'amount', 0, '2021-06-24 02:09:46', '2021-06-24 02:09:46'),
(3, 3, 69, 'amount', 4, '2021-06-24 03:25:28', '2021-06-24 03:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `data` varchar(191) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `total` double(8,3) NOT NULL DEFAULT 0.000,
  `discount` double(8,3) NOT NULL DEFAULT 0.000,
  `text` double(8,3) NOT NULL DEFAULT 0.000,
  `shipping` double(8,3) NOT NULL DEFAULT 0.000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchases_products`
--

CREATE TABLE `purchases_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchases_id` int(11) NOT NULL,
  `price` double(8,3) NOT NULL,
  `counnt` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `employ_id` int(11) DEFAULT NULL,
  `seller_approval` int(1) NOT NULL DEFAULT 0,
  `admin_approval` int(1) NOT NULL DEFAULT 0,
  `refund_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `reason` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_seen` int(11) NOT NULL,
  `refund_status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `refund_requests`
--

INSERT INTO `refund_requests` (`id`, `user_id`, `guest_id`, `order_id`, `order_detail_id`, `seller_id`, `employ_id`, `seller_approval`, `admin_approval`, `refund_amount`, `reason`, `admin_seen`, `refund_status`, `created_at`, `updated_at`) VALUES
(2, 13, NULL, 11, 24, 12, NULL, 0, 1, 100.00, NULL, 0, 1, '2020-11-23 17:47:30', '2020-11-23 17:48:47'),
(3, 13, NULL, 43, 57, 12, 12, 0, 1, 100.00, NULL, 0, 1, '2020-11-23 23:49:09', '2020-11-24 15:36:18'),
(4, 13, NULL, 45, 61, 12, 12, 0, 1, 110.00, NULL, 0, 1, '2020-11-25 16:44:28', '2020-11-25 16:44:45'),
(7, 13, NULL, 47, 64, 12, 12, 0, 1, 220.00, NULL, 0, 1, '2020-11-26 21:41:23', '2020-11-26 21:41:23'),
(8, 35, NULL, 97, 125, 12, 12, 0, 1, 220.00, NULL, 0, 1, '2020-12-10 17:32:48', '2020-12-13 17:08:18'),
(15, 13, NULL, 98, 126, 12, 12, 0, 1, 300.00, NULL, 0, 1, '2020-12-10 18:52:45', '2020-12-10 18:52:45'),
(16, 13, NULL, 102, 133, 12, 12, 0, 1, 110.00, NULL, 0, 1, '2020-12-13 16:37:06', '2020-12-13 17:08:26'),
(17, 13, NULL, 103, 134, 12, 12, 0, 1, 220.00, NULL, 0, 1, '2020-12-13 17:19:53', '2020-12-13 17:19:53'),
(18, 13, NULL, 105, 136, 12, 12, 0, 1, 440.00, NULL, 0, 1, '2020-12-13 17:24:11', '2020-12-13 17:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"18\",\"19\",\"20\"]', '2018-10-10 02:39:47', '2021-10-27 22:54:55'),
(2, 'Accountant', '[\"2\",\"3\"]', '2018-10-10 02:52:09', '2018-10-10 02:52:09'),
(3, 'shipping', '[\"3\"]', '2021-11-25 20:34:34', '2021-11-25 20:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_translations`
--

CREATE TABLE `role_translations` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_translations`
--

INSERT INTO `role_translations` (`id`, `role_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Manager', 'sa', '2021-10-27 22:54:55', '2021-10-27 22:54:55'),
(2, 3, 'shipping', 'sa', '2021-11-25 20:34:34', '2021-11-25 20:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `query`, `count`, `created_at`, `updated_at`) VALUES
(2, 'dcs', 1, '2020-03-07 22:29:09', '2020-03-07 22:29:09'),
(3, 'das', 3, '2020-03-07 22:29:15', '2020-03-07 22:29:50'),
(4, 'فستان', 1, '2020-07-07 19:47:58', '2020-07-07 19:47:58'),
(5, 'حجصحشحح', 1, '2020-12-19 16:21:06', '2020-12-19 16:21:06'),
(6, 'تم', 1, '2021-07-30 21:09:53', '2021-07-30 21:09:53'),
(7, 'تم في', 1, '2021-07-30 21:11:39', '2021-07-30 21:11:39'),
(8, 'احذيه', 1, '2021-10-29 03:21:24', '2021-10-29 03:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) NOT NULL DEFAULT 0,
  `remaining_digital_uploads` int(11) NOT NULL DEFAULT 0,
  `invalid_at` date DEFAULT NULL,
  `verification_status` int(1) NOT NULL DEFAULT 0,
  `verification_info` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT 0,
  `admin_to_pay` double(8,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `user_id`, `seller_package_id`, `remaining_uploads`, `remaining_digital_uploads`, `invalid_at`, `verification_status`, `verification_info`, `cash_on_delivery_status`, `admin_to_pay`, `bank_name`, `bank_acc_name`, `bank_acc_no`, `bank_routing_no`, `bank_payment_status`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 0, 0, NULL, 1, '[{\"type\":\"text\",\"label\":\"Name\",\"value\":\"Mr. Seller\"},{\"type\":\"select\",\"label\":\"Marital Status\",\"value\":\"Married\"},{\"type\":\"multi_select\",\"label\":\"Company\",\"value\":\"[\\\"Company\\\"]\"},{\"type\":\"select\",\"label\":\"Gender\",\"value\":\"Male\"},{\"type\":\"file\",\"label\":\"Image\",\"value\":\"uploads\\/verification_form\\/CRWqFifcbKqibNzllBhEyUSkV6m1viknGXMEhtiW.png\"}]', 1, 78.40, NULL, NULL, NULL, NULL, 0, '2018-10-07 02:42:57', '2020-01-26 02:21:11'),
(2, 44, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-08-28 13:38:08', '2021-08-28 13:38:08'),
(3, 45, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-08-28 15:53:15', '2021-08-28 15:53:15'),
(4, 47, 4, 50, 50, '2022-02-05', 1, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-08-28 16:19:31', '2021-10-28 23:29:57'),
(5, 50, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-09-22 19:42:50', '2021-09-22 19:42:50'),
(6, 51, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-09-25 09:21:30', '2021-09-25 09:21:30'),
(7, 51, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-09-25 09:21:32', '2021-09-25 09:21:32'),
(8, 52, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-02 03:23:28', '2021-10-02 03:23:28'),
(9, 52, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-02 03:23:30', '2021-10-02 03:23:30'),
(10, 53, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-04 12:30:13', '2021-10-04 12:30:13'),
(11, 53, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-04 12:30:16', '2021-10-04 12:30:16'),
(12, 55, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-11 15:31:27', '2021-10-11 15:31:27'),
(13, 55, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-11 15:31:29', '2021-10-11 15:31:29'),
(14, 56, NULL, 0, 0, NULL, 1, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-27 04:45:21', '2021-10-27 04:50:24'),
(15, 59, NULL, 0, 0, NULL, 1, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-28 01:56:39', '2021-10-28 01:57:16'),
(16, 61, NULL, 0, 0, NULL, 1, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Ali\"},{\"type\":\"text\",\"label\":\"Shop name\",\"value\":\"Ali shop\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"13d8aacf27@emailnax.com\"},{\"type\":\"text\",\"label\":\"License No\",\"value\":\"123456\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"NEXT CLUB\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"0102145874558\"},{\"type\":\"file\",\"label\":\"Tax Papers\",\"value\":\"uploads\\/verification_form\\/8Qif80DBcVGWj2fPMGq28kQ38871vQeSLR83kz5X.png\"}]', 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-10-28 22:58:59', '2021-10-28 23:03:14'),
(17, 64, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-11-03 17:36:34', '2021-11-03 17:36:34'),
(18, 64, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-11-03 17:36:37', '2021-11-03 17:36:37'),
(19, 65, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-11-07 14:31:03', '2021-11-07 14:31:03'),
(20, 65, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-11-07 14:31:05', '2021-11-07 14:31:05'),
(21, 66, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-11-24 19:30:02', '2021-11-24 19:30:02'),
(22, 68, 4, 50, 50, '2022-03-05', 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-11-25 17:34:46', '2021-11-25 17:37:43'),
(23, 69, 4, 50, 50, '2022-03-05', 1, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2021-11-25 18:57:31', '2021-11-25 19:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `seller_packages`
--

CREATE TABLE `seller_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(11,2) NOT NULL DEFAULT 0.00,
  `product_upload` int(11) NOT NULL DEFAULT 0,
  `digital_product_upload` int(11) NOT NULL DEFAULT 0,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seller_packages`
--

INSERT INTO `seller_packages` (`id`, `name`, `amount`, `product_upload`, `digital_product_upload`, `logo`, `duration`, `created_at`, `updated_at`) VALUES
(4, 'Free', 0.00, 50, 50, NULL, 100, '2021-10-28 23:29:45', '2021-10-28 23:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `seller_package_payments`
--

CREATE TABLE `seller_package_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_package_id` int(11) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approval` int(1) NOT NULL,
  `offline_payment` int(1) NOT NULL COMMENT '1=offline payment\r\n2=online paymnet',
  `reciept` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_package_translations`
--

CREATE TABLE `seller_package_translations` (
  `id` bigint(20) NOT NULL,
  `seller_package_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seller_package_translations`
--

INSERT INTO `seller_package_translations` (`id`, `seller_package_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 4, 'Free', 'sa', '2021-10-28 23:29:45', '2021-10-28 23:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraw_requests`
--

CREATE TABLE `seller_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `keyword`, `author`, `revisit`, `sitemap_link`, `description`, `created_at`, `updated_at`) VALUES
(1, 'bootstrap,responsive,template,developer', 'taj mahal', 11, 'https://www.tycoon.today', 'ta', '2020-06-14 14:53:50', '2020-06-14 19:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_up_point_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `name`, `logo`, `sliders`, `address`, `facebook`, `google`, `twitter`, `youtube`, `slug`, `meta_title`, `meta_description`, `pick_up_point_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 3, 'Demo Seller Shop', '142', '139,140,141', 'House : Demo, Road : Demo, Section : Demo', 'www.facebook.com', 'www.google.com', 'www.twitter.com', 'www.youtube.com', 'Demo-Seller-Shop-1', 'Demo Seller Shop Title', 'Demo description', NULL, 0.00, '2018-11-27 08:23:13', '2020-11-21 13:20:37'),
(2, 44, 'Paloma Weaver', NULL, NULL, 'Voluptate quidem sap', NULL, NULL, NULL, NULL, 'Paloma-Weaver-2', 'c', 'fd', '[]', 0.00, '2021-08-28 13:38:08', '2021-08-28 13:38:20'),
(3, 45, 'Marsden Carver', NULL, NULL, 'Ipsam nemo consectet', NULL, NULL, NULL, NULL, 'Marsden-Carver-', NULL, NULL, NULL, 0.00, '2021-08-28 15:53:15', '2021-08-28 15:53:15'),
(4, 47, 'Bevis Ward', NULL, NULL, 'Aut quia labore volu', NULL, NULL, NULL, NULL, 'Bevis-Ward-4', 'ds', 'dss', '[]', 0.00, '2021-08-28 16:19:31', '2021-08-28 17:19:42'),
(5, 50, 'EtoHaMrshwdeG', NULL, NULL, 'nCPKfVrJQkijg', NULL, NULL, NULL, NULL, 'EtoHaMrshwdeG-', NULL, NULL, NULL, 0.00, '2021-09-22 19:42:50', '2021-09-22 19:42:50'),
(6, 51, 'BoKaciYpsIUvZCmO', NULL, NULL, 'vqDAsfRlbCBEzGIX', NULL, NULL, NULL, NULL, 'BoKaciYpsIUvZCmO-', NULL, NULL, NULL, 0.00, '2021-09-25 09:21:30', '2021-09-25 09:21:30'),
(7, 52, 'OoaeStmExUBzj', NULL, NULL, 'YSvxtGyRkpmPdCD', NULL, NULL, NULL, NULL, 'OoaeStmExUBzj-', NULL, NULL, NULL, 0.00, '2021-10-02 03:23:28', '2021-10-02 03:23:28'),
(8, 53, 'jMOcyFYJzAwGUVhb', NULL, NULL, 'KIGtYyxSOHXRnc', NULL, NULL, NULL, NULL, 'jMOcyFYJzAwGUVhb-', NULL, NULL, NULL, 0.00, '2021-10-04 12:30:13', '2021-10-04 12:30:13'),
(9, 55, 'NZrvJoDkFHns', NULL, NULL, 'psvnJouA', NULL, NULL, NULL, NULL, 'NZrvJoDkFHns-', NULL, NULL, NULL, 0.00, '2021-10-11 15:31:27', '2021-10-11 15:31:27'),
(10, 56, 'Al7alawani', NULL, NULL, 'ramallah city - main street', NULL, NULL, NULL, NULL, 'Al7alawani-', NULL, NULL, NULL, 0.00, '2021-10-27 04:45:21', '2021-10-27 04:45:21'),
(11, 59, 'arsanuoshanna3@gmail.com', NULL, NULL, 'djdsk', NULL, NULL, NULL, NULL, 'arsanuoshanna3@gmail.com-', NULL, NULL, NULL, 0.00, '2021-10-28 01:56:39', '2021-10-28 01:56:39'),
(12, 61, 'my Store Ali', NULL, NULL, 'next club', NULL, NULL, NULL, NULL, 'my-Store-Ali-', NULL, NULL, NULL, 0.00, '2021-10-28 22:58:59', '2021-10-28 22:58:59'),
(13, 64, 'oDmFiVQdnEWf', NULL, NULL, 'wpXTFLAJfS', NULL, NULL, NULL, NULL, 'oDmFiVQdnEWf-', NULL, NULL, NULL, 0.00, '2021-11-03 17:36:34', '2021-11-03 17:36:34'),
(14, 65, 'SzWOMNTovcnErJqI', NULL, NULL, 'QvWOaqlS', NULL, NULL, NULL, NULL, 'SzWOMNTovcnErJqI-', NULL, NULL, NULL, 0.00, '2021-11-07 14:31:03', '2021-11-07 14:31:03'),
(15, 66, 'مصنع الملابس', NULL, NULL, 'بجوار النادي', NULL, NULL, NULL, NULL, 'مصنع-الملابس-', NULL, NULL, NULL, 0.00, '2021-11-24 19:30:02', '2021-11-24 19:30:02'),
(16, 68, 'test', NULL, NULL, 'test', NULL, NULL, NULL, NULL, 'test-', NULL, NULL, NULL, 0.00, '2021-11-25 17:34:46', '2021-11-25 17:34:46'),
(17, 69, 'جملة', NULL, NULL, 'شبرا الخيمه', NULL, NULL, NULL, NULL, 'جملة-', NULL, NULL, NULL, 0.00, '2021-11-25 18:57:31', '2021-11-25 18:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 1,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `published`, `link`, `created_at`, `updated_at`) VALUES
(17, '143', 0, '#', '2020-11-15 04:13:57', '2020-11-21 13:20:37'),
(21, '144', 1, '#', '2020-11-15 18:28:00', '2020-11-21 13:20:37'),
(22, '145', 1, '#', '2020-11-15 18:47:48', '2020-11-21 13:20:37'),
(23, '146', 1, '#', '2020-11-15 18:48:16', '2020-11-21 13:20:37'),
(24, '147', 1, '#', '2020-11-15 18:48:41', '2020-11-21 13:20:37'),
(25, '148', 1, '#', '2020-11-15 18:49:09', '2020-11-21 13:20:37'),
(27, '149', 1, '#', '2020-11-15 18:50:19', '2020-11-21 13:20:37'),
(28, '150', 1, '#', '2020-11-15 19:03:36', '2020-11-21 13:20:37'),
(29, '151', 1, '#', '2020-11-15 19:03:57', '2020-11-21 13:20:37'),
(30, '152', 1, '#', '2020-11-15 19:04:35', '2020-11-21 13:20:37'),
(31, '153', 1, '#', '2020-11-15 19:04:59', '2020-11-21 13:20:37'),
(32, '154', 1, '#', '2020-11-15 19:12:42', '2020-11-21 13:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 58, 1, '2021-10-27 22:53:01', '2021-10-27 22:53:01'),
(2, 71, 3, '2021-11-25 20:33:38', '2021-11-25 20:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'lolo.sara31@gmail.com', '2020-12-26 21:14:11', '2020-12-26 21:14:11'),
(2, 'joetelawry368pau@gmail.com', '2021-09-04 22:14:25', '2021-09-04 22:14:25'),
(3, 'ryanthomasina8@gmail.com', '2021-09-08 18:03:21', '2021-09-08 18:03:21'),
(4, 'shannacraig002@gmail.com', '2021-09-10 19:43:08', '2021-09-10 19:43:08'),
(5, 'sullivanalexandrina51@gmail.com', '2021-09-15 12:43:36', '2021-09-15 12:43:36'),
(6, 'silviomarileer3j5zc1@gmail.com', '2021-09-22 19:39:05', '2021-09-22 19:39:05'),
(7, 'taddvrqfordaqw6fg2p7jli@gmail.com', '2021-09-25 09:20:49', '2021-09-25 09:20:49'),
(8, 'tonie4lmsr19@gmail.com', '2021-10-02 03:22:20', '2021-10-02 03:22:20'),
(9, 'adelheidq4don06@gmail.com', '2021-10-04 12:27:04', '2021-10-04 12:27:04'),
(10, 'rainaq7exy74@gmail.com', '2021-10-09 12:31:55', '2021-10-09 12:31:55'),
(11, 'carmelinakfymi39@gmail.com', '2021-10-11 15:29:32', '2021-10-11 15:29:32'),
(12, 'marlenevqbrn42@gmail.com', '2021-10-19 13:48:30', '2021-10-19 13:48:30'),
(13, 'epope9288@gmail.com', '2021-11-03 17:35:13', '2021-11-03 17:35:13'),
(14, 'alicestokes2866@gmail.com', '2021-11-07 14:30:02', '2021-11-07 14:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `category_id`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'داخلي', 2, '', 'داخلي', NULL, '2019-03-12 04:13:24', '2020-07-07 19:35:53'),
(2, 'سبورات', 2, '', 'سبورات', NULL, '2019-03-12 04:13:44', '2020-07-07 19:35:22'),
(3, 'بنطلونات', 1, '', 'بنطلونات', NULL, '2019-03-12 04:13:59', '2020-07-07 19:34:42'),
(4, 'مقاسات كبيرة (أحجام خاصة)', 1, '---', 'مقاسات كبيرة (أحجام خاصة)', NULL, '2019-03-12 04:18:25', '2020-07-07 19:34:11'),
(5, 'بيجامات ورياضة', 1, '-', 'بيجامات ورياضة', NULL, '2019-03-12 04:18:38', '2020-07-07 19:33:35'),
(6, 'سهرة ومناسبات', 1, '--', 'سهرة ومناسبات', NULL, '2019-03-12 04:18:51', '2020-07-07 19:32:31'),
(7, 'داخلي', 1, '', 'داخلي', NULL, '2019-03-12 04:19:05', '2020-07-07 19:31:31'),
(8, 'سبورات', 1, '', 'سبورات', NULL, '2019-03-12 04:19:13', '2020-07-07 19:30:55'),
(9, 'شرعي', 1, '', 'شرعي', NULL, '2019-03-12 04:19:22', '2020-07-07 19:29:42'),
(10, 'رسمي', 2, '-0zhFo', 'رسمي', NULL, '2020-07-07 19:36:40', '2020-07-07 19:36:40'),
(11, 'بيجامات ورياضة', 2, '--tCBtP', 'بيجامات ورياضة', NULL, '2020-07-07 19:37:08', '2020-07-07 19:37:08'),
(12, 'بيجامات ورياضة', 3, '--UxFYd', 'بيجامات ورياضة', NULL, '2020-07-07 19:37:30', '2020-07-07 19:37:30'),
(13, 'فساتين رسمي', 3, '--gG1fO', 'فساتين رسمي', NULL, '2020-07-07 19:37:55', '2020-07-07 19:37:55'),
(14, 'داخلي', 3, '-QTWMw', 'داخلي', NULL, '2020-07-07 19:38:18', '2020-07-07 19:38:18'),
(15, 'سبورات', 3, '-FgP9P', 'سبورات', NULL, '2020-07-07 19:38:40', '2020-07-07 19:38:40'),
(16, 'عرض جهاز بيبي كامل', 4, '----KVa9H', 'عرض جهاز بيبي كامل', NULL, '2020-07-07 19:39:22', '2020-07-07 19:39:22'),
(17, 'بيجامات', 4, '-P4EEE', 'بيجامات', NULL, '2020-07-07 19:39:48', '2020-07-07 19:39:48'),
(18, 'أطقم', 3, '-D5G9V', 'أطقم', NULL, '2020-07-07 19:40:11', '2020-07-07 19:40:11'),
(19, 'داخلي', 4, '-3GklW', 'داخلي', NULL, '2020-07-07 19:40:29', '2020-07-07 19:40:29'),
(20, 'مستلزمات بيبي ورضاعة', 4, '---Xja6y', 'مستلزمات بيبي ورضاعة', NULL, '2020-07-07 19:40:59', '2020-07-07 19:40:59'),
(21, 'أحذية حريمي', 5, '--sg9M5', 'أحذية حريمي', NULL, '2020-07-07 19:41:24', '2021-11-25 19:32:02'),
(22, 'أحذية اولادي', 5, '--Q5l3X', 'أحذية اولادي', NULL, '2020-07-07 19:41:43', '2021-11-25 19:33:48'),
(23, 'أحذية بناتي', 5, '--2PJNF', 'أحذية بناتي', NULL, '2020-07-07 19:42:04', '2020-07-07 19:42:04'),
(24, 'أحذية بيبي', 5, '--Tm1EN', 'أحذية بيبي', NULL, '2020-07-07 19:42:38', '2020-07-07 19:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_translations`
--

CREATE TABLE `sub_category_translations` (
  `id` bigint(20) NOT NULL,
  `sub_category_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_category_translations`
--

INSERT INTO `sub_category_translations` (`id`, `sub_category_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 21, 'أحذية حريمي', 'sa', '2021-11-25 19:32:02', '2021-11-25 19:32:02'),
(2, 22, 'أحذية اولادي', 'sa', '2021-11-25 19:33:48', '2021-11-25 19:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `sub_category_id`, `name`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 9, 'عباية', '-aipGN', 'عبايات', NULL, '2020-07-15 10:27:05', '2020-07-15 10:27:05'),
(2, 9, 'فستان', '-Fp1cF', 'فستان', 'فستان شرعي', '2020-07-15 10:28:29', '2020-07-15 10:28:29'),
(3, 8, 'تونز', '-0lBYb', 'تونز', 'تونز', '2020-07-15 10:56:59', '2020-07-15 10:56:59'),
(4, 8, 'بلوزات', '-hvPgH', 'سبورات', 'بلوزات', '2020-07-15 11:03:26', '2020-07-15 11:03:26'),
(5, 8, 'اطقم', '-eZw0s', 'سبورات', 'اطقم', '2020-07-15 11:22:37', '2020-07-15 11:22:37'),
(6, 8, 'قميص', '-iHaLX', 'سبورات', 'قمصان', '2020-07-15 11:38:19', '2020-07-15 11:38:19'),
(7, 16, 'عرض جهاز بيبي كامل', '----mDj5b', 'عرض جهاز بيبي كامل', 'عرض جهاز بيبي كامل', '2020-07-15 12:14:56', '2020-07-15 12:14:56'),
(8, 2, 'سبورت اولادي', '--sL2GE', 'سبورات', 'ملابس اسبزرت اولادي', '2020-07-15 12:18:54', '2020-07-15 12:18:54'),
(9, 12, 'بناتي سهرة', '--xuI4U', 'سهرة ومناسبات', 'بناتي سهرة', '2020-07-15 12:23:12', '2020-07-15 12:23:12'),
(10, 13, 'فستان', '-t0Afv', 'سهرة ومناسبات', 'فستان سهرة بناتي', '2020-07-15 12:25:28', '2020-07-15 12:25:28'),
(11, 22, 'احذية تركي', '--dJfpq', 'احذية', 'احذية', '2020-07-15 12:29:49', '2020-07-15 12:29:49'),
(12, 21, 'بوط', '-n4TcD', 'بوط حريمي _ هاف بوط حريمي', NULL, '2021-11-25 19:37:01', '2021-11-25 19:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_category_translations`
--

CREATE TABLE `sub_sub_category_translations` (
  `id` bigint(20) NOT NULL,
  `sub_sub_category_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_sub_category_translations`
--

INSERT INTO `sub_sub_category_translations` (`id`, `sub_sub_category_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 12, 'بوط', 'sa', '2021-11-25 19:37:01', '2021-11-25 19:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'first supplier', '0123456789', 'فلسطين', '2021-07-11 15:53:15', '2021-07-11 15:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT 0,
  `client_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(3, 'en', 'All Category', 'All Category', '2020-11-02 05:40:38', '2020-11-02 05:40:38'),
(4, 'en', 'All', 'All', '2020-11-02 05:40:38', '2020-11-02 05:40:38'),
(5, 'en', 'Flash Sale', 'Flash Sale', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(6, 'en', 'View More', 'View More', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(7, 'en', 'Add to wishlist', 'Add to wishlist', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(8, 'en', 'Add to compare', 'Add to compare', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(9, 'en', 'Add to cart', 'Add to cart', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(10, 'en', 'Club Point', 'Club Point', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(11, 'en', 'Classified Ads', 'Classified Ads', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(13, 'en', 'Used', 'Used', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(14, 'en', 'Top 10 Categories', 'Top 10 Categories', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(15, 'en', 'View All Categories', 'View All Categories', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(16, 'en', 'Top 10 Brands', 'Top 10 Brands', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(17, 'en', 'View All Brands', 'View All Brands', '2020-11-02 05:40:40', '2020-11-02 05:40:40'),
(43, 'en', 'Terms & conditions', 'Terms & conditions', '2020-11-02 05:40:41', '2020-11-02 05:40:41'),
(51, 'en', 'Best Selling', 'Best Selling', '2020-11-02 05:40:42', '2020-11-02 05:40:42'),
(53, 'en', 'Top 20', 'Top 20', '2020-11-02 05:40:42', '2020-11-02 05:40:42'),
(55, 'en', 'Featured Products', 'Featured Products', '2020-11-02 05:40:42', '2020-11-02 05:40:42'),
(56, 'en', 'Best Sellers', 'Best Sellers', '2020-11-02 05:40:43', '2020-11-02 05:40:43'),
(57, 'en', 'Visit Store', 'Visit Store', '2020-11-02 05:40:43', '2020-11-02 05:40:43'),
(58, 'en', 'Popular Suggestions', 'Popular Suggestions', '2020-11-02 05:46:59', '2020-11-02 05:46:59'),
(59, 'en', 'Category Suggestions', 'Category Suggestions', '2020-11-02 05:46:59', '2020-11-02 05:46:59'),
(62, 'en', 'Automobile & Motorcycle', 'Automobile & Motorcycle', '2020-11-02 05:47:01', '2020-11-02 05:47:01'),
(63, 'en', 'Price range', 'Price range', '2020-11-02 05:47:01', '2020-11-02 05:47:01'),
(64, 'en', 'Filter by color', 'Filter by color', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(65, 'en', 'Home', 'Home', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(67, 'en', 'Newest', 'Newest', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(68, 'en', 'Oldest', 'Oldest', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(69, 'en', 'Price low to high', 'Price low to high', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(70, 'en', 'Price high to low', 'Price high to low', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(71, 'en', 'Brands', 'Brands', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(72, 'en', 'All Brands', 'All Brands', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(74, 'en', 'All Sellers', 'All Sellers', '2020-11-02 05:47:02', '2020-11-02 05:47:02'),
(78, 'en', 'Inhouse product', 'Inhouse product', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(79, 'en', 'Message Seller', 'Message Seller', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(80, 'en', 'Price', 'Price', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(81, 'en', 'Discount Price', 'Discount Price', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(82, 'en', 'Color', 'Color', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(83, 'en', 'Quantity', 'Quantity', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(84, 'en', 'available', 'available', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(85, 'en', 'Total Price', 'Total Price', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(86, 'en', 'Out of Stock', 'Out of Stock', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(87, 'en', 'Refund', 'Refund', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(88, 'en', 'Share', 'Share', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(89, 'en', 'Sold By', 'Sold By', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(90, 'en', 'customer reviews', 'customer reviews', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(91, 'en', 'Top Selling Products', 'Top Selling Products', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(92, 'en', 'Description', 'Description', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(93, 'en', 'Video', 'Video', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(94, 'en', 'Reviews', 'Reviews', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(95, 'en', 'Download', 'Download', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(96, 'en', 'There have been no reviews for this product yet.', 'There have been no reviews for this product yet.', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(97, 'en', 'Related products', 'Related products', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(98, 'en', 'Any query about this product', 'Any query about this product', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(99, 'en', 'Product Name', 'Product Name', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(100, 'en', 'Your Question', 'Your Question', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(101, 'en', 'Send', 'Send', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(103, 'en', 'Use country code before number', 'Use country code before number', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(105, 'en', 'Remember Me', 'Remember Me', '2020-11-02 06:18:03', '2020-11-02 06:18:03'),
(107, 'en', 'Dont have an account?', 'Dont have an account?', '2020-11-02 06:18:04', '2020-11-02 06:18:04'),
(108, 'en', 'Register Now', 'Register Now', '2020-11-02 06:18:04', '2020-11-02 06:18:04'),
(109, 'en', 'Or Login With', 'Or Login With', '2020-11-02 06:18:04', '2020-11-02 06:18:04'),
(110, 'en', 'oops..', 'oops..', '2020-11-02 08:29:04', '2020-11-02 08:29:04'),
(111, 'en', 'This item is out of stock!', 'This item is out of stock!', '2020-11-02 08:29:04', '2020-11-02 08:29:04'),
(112, 'en', 'Back to shopping', 'Back to shopping', '2020-11-02 08:29:04', '2020-11-02 08:29:04'),
(113, 'en', 'Login to your account.', 'Login to your account.', '2020-11-02 09:27:41', '2020-11-02 09:27:41'),
(115, 'en', 'Purchase History', 'Purchase History', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(116, 'en', 'New', 'New', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(117, 'en', 'Downloads', 'Downloads', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(118, 'en', 'Sent Refund Request', 'Sent Refund Request', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(119, 'en', 'Product Bulk Upload', 'Product Bulk Upload', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(123, 'en', 'Orders', 'Orders', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(124, 'en', 'Recieved Refund Request', 'Recieved Refund Request', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(126, 'en', 'Shop Setting', 'Shop Setting', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(127, 'en', 'Payment History', 'Payment History', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(128, 'en', 'Money Withdraw', 'Money Withdraw', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(129, 'en', 'Conversations', 'Conversations', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(130, 'en', 'My Wallet', 'My Wallet', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(131, 'en', 'Earning Points', 'Earning Points', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(132, 'en', 'Support Ticket', 'Support Ticket', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(133, 'en', 'Manage Profile', 'Manage Profile', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(134, 'en', 'Sold Amount', 'Sold Amount', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(135, 'en', 'Your sold amount (current month)', 'Your sold amount (current month)', '2020-11-02 09:27:53', '2020-11-02 09:27:53'),
(136, 'en', 'Total Sold', 'Total Sold', '2020-11-02 09:27:54', '2020-11-02 09:27:54'),
(137, 'en', 'Last Month Sold', 'Last Month Sold', '2020-11-02 09:27:54', '2020-11-02 09:27:54'),
(138, 'en', 'Total sale', 'Total sale', '2020-11-02 09:27:54', '2020-11-02 09:27:54'),
(139, 'en', 'Total earnings', 'Total earnings', '2020-11-02 09:27:54', '2020-11-02 09:27:54'),
(140, 'en', 'Successful orders', 'Successful orders', '2020-11-02 09:27:54', '2020-11-02 09:27:54'),
(141, 'en', 'Total orders', 'Total orders', '2020-11-02 09:27:54', '2020-11-02 09:27:54'),
(142, 'en', 'Pending orders', 'Pending orders', '2020-11-02 09:27:54', '2020-11-02 09:27:54'),
(143, 'en', 'Cancelled orders', 'Cancelled orders', '2020-11-02 09:27:54', '2020-11-02 09:27:54'),
(145, 'en', 'Product', 'Product', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(147, 'en', 'Purchased Package', 'Purchased Package', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(148, 'en', 'Package Not Found', 'Package Not Found', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(149, 'en', 'Upgrade Package', 'Upgrade Package', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(150, 'en', 'Shop', 'Shop', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(151, 'en', 'Manage & organize your shop', 'Manage & organize your shop', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(152, 'en', 'Go to setting', 'Go to setting', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(153, 'en', 'Payment', 'Payment', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(154, 'en', 'Configure your payment method', 'Configure your payment method', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(156, 'en', 'My Panel', 'My Panel', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(158, 'en', 'Item has been added to wishlist', 'Item has been added to wishlist', '2020-11-02 09:27:55', '2020-11-02 09:27:55'),
(159, 'en', 'My Points', 'My Points', '2020-11-02 09:28:15', '2020-11-02 09:28:15'),
(160, 'en', ' Points', ' Points', '2020-11-02 09:28:15', '2020-11-02 09:28:15'),
(161, 'en', 'Wallet Money', 'Wallet Money', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(162, 'en', 'Exchange Rate', 'Exchange Rate', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(163, 'en', 'Point Earning history', 'Point Earning history', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(164, 'en', 'Date', 'Date', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(165, 'en', 'Points', 'Points', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(166, 'en', 'Converted', 'Converted', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(167, 'en', 'Action', 'Action', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(168, 'en', 'No history found.', 'No history found.', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(169, 'en', 'Convert has been done successfully Check your Wallets', 'Convert has been done successfully Check your Wallets', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(170, 'en', 'Something went wrong', 'Something went wrong', '2020-11-02 09:28:16', '2020-11-02 09:28:16'),
(171, 'en', 'Remaining Uploads', 'Remaining Uploads', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(172, 'en', 'No Package Found', 'No Package Found', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(173, 'en', 'Search product', 'Search product', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(174, 'en', 'Name', 'Name', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(176, 'en', 'Current Qty', 'Current Qty', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(177, 'en', 'Base Price', 'Base Price', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(178, 'en', 'Published', 'Published', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(179, 'en', 'Featured', 'Featured', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(180, 'en', 'Options', 'Options', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(181, 'en', 'Edit', 'Edit', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(182, 'en', 'Duplicate', 'Duplicate', '2020-11-02 09:37:13', '2020-11-02 09:37:13'),
(184, 'en', '1. Download the skeleton file and fill it with data.', '1. Download the skeleton file and fill it with data.', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(185, 'en', '2. You can download the example file to understand how the data must be filled.', '2. You can download the example file to understand how the data must be filled.', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(186, 'en', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(187, 'en', '4. After uploading products you need to edit them and set products images and choices.', '4. After uploading products you need to edit them and set products images and choices.', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(188, 'en', 'Download CSV', 'Download CSV', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(189, 'en', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(190, 'en', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(191, 'en', 'Download Category', 'Download Category', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(192, 'en', 'Download Sub category', 'Download Sub category', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(193, 'en', 'Download Sub Sub category', 'Download Sub Sub category', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(194, 'en', 'Download Brand', 'Download Brand', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(195, 'en', 'Upload CSV File', 'Upload CSV File', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(196, 'en', 'CSV', 'CSV', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(197, 'en', 'Choose CSV File', 'Choose CSV File', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(198, 'en', 'Upload', 'Upload', '2020-11-02 09:37:20', '2020-11-02 09:37:20'),
(199, 'en', 'Add New Digital Product', 'Add New Digital Product', '2020-11-02 09:37:25', '2020-11-02 09:37:25'),
(200, 'en', 'Available Status', 'Available Status', '2020-11-02 09:37:29', '2020-11-02 09:37:29'),
(201, 'en', 'Admin Status', 'Admin Status', '2020-11-02 09:37:29', '2020-11-02 09:37:29'),
(202, 'en', 'Pending Balance', 'Pending Balance', '2020-11-02 09:38:07', '2020-11-02 09:38:07'),
(203, 'en', 'Send Withdraw Request', 'Send Withdraw Request', '2020-11-02 09:38:07', '2020-11-02 09:38:07'),
(204, 'en', 'Withdraw Request history', 'Withdraw Request history', '2020-11-02 09:38:07', '2020-11-02 09:38:07'),
(205, 'en', 'Amount', 'Amount', '2020-11-02 09:38:07', '2020-11-02 09:38:07'),
(206, 'en', 'Status', 'Status', '2020-11-02 09:38:07', '2020-11-02 09:38:07'),
(207, 'en', 'Message', 'Message', '2020-11-02 09:38:07', '2020-11-02 09:38:07'),
(208, 'en', 'Send A Withdraw Request', 'Send A Withdraw Request', '2020-11-02 09:38:07', '2020-11-02 09:38:07'),
(209, 'en', 'Basic Info', 'Basic Info', '2020-11-02 09:38:13', '2020-11-02 09:38:13'),
(211, 'en', 'Your Phone', 'Your Phone', '2020-11-02 09:38:13', '2020-11-02 09:38:13'),
(212, 'en', 'Photo', 'Photo', '2020-11-02 09:38:13', '2020-11-02 09:38:13'),
(213, 'en', 'Browse', 'Browse', '2020-11-02 09:38:13', '2020-11-02 09:38:13'),
(215, 'en', 'Your Password', 'Your Password', '2020-11-02 09:38:13', '2020-11-02 09:38:13'),
(216, 'en', 'New Password', 'New Password', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(217, 'en', 'Confirm Password', 'Confirm Password', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(218, 'en', 'Add New Address', 'Add New Address', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(219, 'en', 'Payment Setting', 'Payment Setting', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(220, 'en', 'Cash Payment', 'Cash Payment', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(221, 'en', 'Bank Payment', 'Bank Payment', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(222, 'en', 'Bank Name', 'Bank Name', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(223, 'en', 'Bank Account Name', 'Bank Account Name', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(224, 'en', 'Bank Account Number', 'Bank Account Number', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(225, 'en', 'Bank Routing Number', 'Bank Routing Number', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(226, 'en', 'Update Profile', 'Update Profile', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(227, 'en', 'Change your email', 'Change your email', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(228, 'en', 'Your Email', 'Your Email', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(229, 'en', 'Sending Email...', 'Sending Email...', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(230, 'en', 'Verify', 'Verify', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(231, 'en', 'Update Email', 'Update Email', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(232, 'en', 'New Address', 'New Address', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(233, 'en', 'Your Address', 'Your Address', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(234, 'en', 'Country', 'Country', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(235, 'en', 'Select your country', 'Select your country', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(236, 'en', 'City', 'City', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(237, 'en', 'Your City', 'Your City', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(239, 'en', 'Your Postal Code', 'Your Postal Code', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(240, 'en', '+880', '+880', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(241, 'en', 'Save', 'Save', '2020-11-02 09:38:14', '2020-11-02 09:38:14'),
(242, 'en', 'Received Refund Request', 'Received Refund Request', '2020-11-02 09:56:20', '2020-11-02 09:56:20'),
(244, 'en', 'Delete Confirmation', 'Delete Confirmation', '2020-11-02 09:56:20', '2020-11-02 09:56:20'),
(245, 'en', 'Are you sure to delete this?', 'Are you sure to delete this?', '2020-11-02 09:56:21', '2020-11-02 09:56:21'),
(246, 'en', 'Premium Packages for Sellers', 'Premium Packages for Sellers', '2020-11-02 09:57:36', '2020-11-02 09:57:36'),
(247, 'en', 'Product Upload', 'Product Upload', '2020-11-02 09:57:36', '2020-11-02 09:57:36'),
(248, 'en', 'Digital Product Upload', 'Digital Product Upload', '2020-11-02 09:57:36', '2020-11-02 09:57:36'),
(250, 'en', 'Purchase Package', 'Purchase Package', '2020-11-02 09:57:36', '2020-11-02 09:57:36'),
(251, 'en', 'Select Payment Type', 'Select Payment Type', '2020-11-02 09:57:36', '2020-11-02 09:57:36'),
(252, 'en', 'Payment Type', 'Payment Type', '2020-11-02 09:57:36', '2020-11-02 09:57:36'),
(253, 'en', 'Select One', 'Select One', '2020-11-02 09:57:36', '2020-11-02 09:57:36'),
(254, 'en', 'Online payment', 'Online payment', '2020-11-02 09:57:37', '2020-11-02 09:57:37'),
(255, 'en', 'Offline payment', 'Offline payment', '2020-11-02 09:57:37', '2020-11-02 09:57:37'),
(256, 'en', 'Purchase Your Package', 'Purchase Your Package', '2020-11-02 09:57:37', '2020-11-02 09:57:37'),
(258, 'en', 'Paypal', 'Paypal', '2020-11-02 09:57:37', '2020-11-02 09:57:37'),
(259, 'en', 'Stripe', 'Stripe', '2020-11-02 09:57:37', '2020-11-02 09:57:37'),
(260, 'en', 'sslcommerz', 'sslcommerz', '2020-11-02 09:57:37', '2020-11-02 09:57:37'),
(265, 'en', 'Confirm', 'Confirm', '2020-11-02 09:57:37', '2020-11-02 09:57:37'),
(266, 'en', 'Offline Package Payment', 'Offline Package Payment', '2020-11-02 09:57:37', '2020-11-02 09:57:37'),
(267, 'en', 'Transaction ID', 'Transaction ID', '2020-11-02 10:30:12', '2020-11-02 10:30:12'),
(268, 'en', 'Choose image', 'Choose image', '2020-11-02 10:30:12', '2020-11-02 10:30:12'),
(269, 'en', 'Code', 'Code', '2020-11-02 10:42:00', '2020-11-02 10:42:00'),
(270, 'en', 'Delivery Status', 'Delivery Status', '2020-11-02 10:42:00', '2020-11-02 10:42:00'),
(271, 'en', 'Payment Status', 'Payment Status', '2020-11-02 10:42:00', '2020-11-02 10:42:00'),
(272, 'en', 'Paid', 'Paid', '2020-11-02 10:42:00', '2020-11-02 10:42:00'),
(273, 'en', 'Order Details', 'Order Details', '2020-11-02 10:42:00', '2020-11-02 10:42:00'),
(274, 'en', 'Download Invoice', 'Download Invoice', '2020-11-02 10:42:00', '2020-11-02 10:42:00'),
(275, 'en', 'Unpaid', 'Unpaid', '2020-11-02 10:42:00', '2020-11-02 10:42:00'),
(277, 'en', 'Order placed', 'Order placed', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(278, 'en', 'Confirmed', 'Confirmed', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(279, 'en', 'On delivery', 'On delivery', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(280, 'en', 'Delivered', 'Delivered', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(281, 'en', 'Order Summary', 'Order Summary', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(282, 'en', 'Order Code', 'Order Code', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(283, 'en', 'Customer', 'Customer', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(287, 'en', 'Total order amount', 'Total order amount', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(288, 'en', 'Shipping metdod', 'Shipping metdod', '2020-11-02 10:43:59', '2020-11-02 10:43:59'),
(289, 'en', 'Flat shipping rate', 'Flat shipping rate', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(290, 'en', 'Payment metdod', 'Payment metdod', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(291, 'en', 'Variation', 'Variation', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(292, 'en', 'Delivery Type', 'Delivery Type', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(293, 'en', 'Home Delivery', 'Home Delivery', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(294, 'en', 'Order Ammount', 'Order Ammount', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(295, 'en', 'Subtotal', 'Subtotal', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(296, 'en', 'Shipping', 'Shipping', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(298, 'en', 'Coupon Discount', 'Coupon Discount', '2020-11-02 10:44:00', '2020-11-02 10:44:00'),
(300, 'en', 'N/A', 'N/A', '2020-11-02 10:44:20', '2020-11-02 10:44:20'),
(301, 'en', 'In stock', 'In stock', '2020-11-02 10:54:52', '2020-11-02 10:54:52'),
(302, 'en', 'Buy Now', 'Buy Now', '2020-11-02 10:54:52', '2020-11-02 10:54:52'),
(303, 'en', 'Item added to your cart!', 'Item added to your cart!', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(304, 'en', 'Proceed to Checkout', 'Proceed to Checkout', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(305, 'en', 'Cart Items', 'Cart Items', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(306, 'en', '1. My Cart', '1. My Cart', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(307, 'en', 'View cart', 'View cart', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(308, 'en', '2. Shipping info', '2. Shipping info', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(309, 'en', 'Checkout', 'Checkout', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(310, 'en', '3. Delivery info', '3. Delivery info', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(311, 'en', '4. Payment', '4. Payment', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(312, 'en', '5. Confirmation', '5. Confirmation', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(313, 'en', 'Remove', 'Remove', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(314, 'en', 'Return to shop', 'Return to shop', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(315, 'en', 'Continue to Shipping', 'Continue to Shipping', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(316, 'en', 'Or', 'Or', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(317, 'en', 'Guest Checkout', 'Guest Checkout', '2020-11-02 10:56:46', '2020-11-02 10:56:46'),
(318, 'en', 'Continue to Delivery Info', 'Continue to Delivery Info', '2020-11-02 10:57:44', '2020-11-02 10:57:44'),
(319, 'en', 'Postal Code', 'Postal Code', '2020-11-02 11:01:01', '2020-11-02 11:01:01'),
(320, 'en', 'Choose Delivery Type', 'Choose Delivery Type', '2020-11-02 11:01:04', '2020-11-02 11:01:04'),
(321, 'en', 'Local Pickup', 'Local Pickup', '2020-11-02 11:01:04', '2020-11-02 11:01:04'),
(322, 'en', 'Select your nearest pickup point', 'Select your nearest pickup point', '2020-11-02 11:01:04', '2020-11-02 11:01:04'),
(323, 'en', 'Continue to Payment', 'Continue to Payment', '2020-11-02 11:01:04', '2020-11-02 11:01:04'),
(324, 'en', 'Select a payment option', 'Select a payment option', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(325, 'en', 'Razorpay', 'Razorpay', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(326, 'en', 'Paystack', 'Paystack', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(327, 'en', 'VoguePay', 'VoguePay', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(328, 'en', 'payhere', 'payhere', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(329, 'en', 'ngenius', 'ngenius', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(330, 'en', 'Paytm', 'Paytm', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(331, 'en', 'Cash on Delivery', 'Cash on Delivery', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(332, 'en', 'Your wallet balance :', 'Your wallet balance :', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(333, 'en', 'Insufficient balance', 'Insufficient balance', '2020-11-02 11:01:13', '2020-11-02 11:01:13'),
(334, 'en', 'I agree to the', 'I agree to the', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(338, 'en', 'Complete Order', 'Complete Order', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(339, 'en', 'Summary', 'Summary', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(340, 'en', 'Items', 'Items', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(341, 'en', 'Total Club point', 'Total Club point', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(342, 'en', 'Total Shipping', 'Total Shipping', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(343, 'en', 'Have coupon code? Enter here', 'Have coupon code? Enter here', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(344, 'en', 'Apply', 'Apply', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(345, 'en', 'You need to agree with our policies', 'You need to agree with our policies', '2020-11-02 11:01:14', '2020-11-02 11:01:14'),
(346, 'en', 'Forgot password', 'Forgot password', '2020-11-02 11:01:25', '2020-11-02 11:01:25'),
(469, 'en', 'SEO Setting', 'SEO Setting', '2020-11-02 11:01:33', '2020-11-02 11:01:33'),
(474, 'en', 'System Update', 'System Update', '2020-11-02 11:01:34', '2020-11-02 11:01:34'),
(480, 'en', 'Add New Payment Method', 'Add New Payment Method', '2020-11-02 11:01:38', '2020-11-02 11:01:38'),
(481, 'en', 'Manual Payment Method', 'Manual Payment Method', '2020-11-02 11:01:38', '2020-11-02 11:01:38'),
(482, 'en', 'Heading', 'Heading', '2020-11-02 11:01:38', '2020-11-02 11:01:38'),
(483, 'en', 'Logo', 'Logo', '2020-11-02 11:01:38', '2020-11-02 11:01:38'),
(484, 'en', 'Manual Payment Information', 'Manual Payment Information', '2020-11-02 11:01:42', '2020-11-02 11:01:42'),
(485, 'en', 'Type', 'Type', '2020-11-02 11:01:42', '2020-11-02 11:01:42'),
(486, 'en', 'Custom Payment', 'Custom Payment', '2020-11-02 11:01:42', '2020-11-02 11:01:42'),
(487, 'en', 'Check Payment', 'Check Payment', '2020-11-02 11:01:42', '2020-11-02 11:01:42'),
(488, 'en', 'Checkout Thumbnail', 'Checkout Thumbnail', '2020-11-02 11:01:42', '2020-11-02 11:01:42'),
(489, 'en', 'Payment Instruction', 'Payment Instruction', '2020-11-02 11:01:42', '2020-11-02 11:01:42'),
(490, 'en', 'Bank Information', 'Bank Information', '2020-11-02 11:01:42', '2020-11-02 11:01:42'),
(491, 'en', 'Select File', 'Select File', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(492, 'en', 'Upload New', 'Upload New', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(493, 'en', 'Sort by newest', 'Sort by newest', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(494, 'en', 'Sort by oldest', 'Sort by oldest', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(495, 'en', 'Sort by smallest', 'Sort by smallest', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(496, 'en', 'Sort by largest', 'Sort by largest', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(497, 'en', 'Selected Only', 'Selected Only', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(498, 'en', 'No files found', 'No files found', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(499, 'en', '0 File selected', '0 File selected', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(500, 'en', 'Clear', 'Clear', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(501, 'en', 'Prev', 'Prev', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(502, 'en', 'Next', 'Next', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(503, 'en', 'Add Files', 'Add Files', '2020-11-02 11:01:53', '2020-11-02 11:01:53'),
(504, 'en', 'Method has been inserted successfully', 'Method has been inserted successfully', '2020-11-02 11:02:03', '2020-11-02 11:02:03'),
(506, 'en', 'Order Date', 'Order Date', '2020-11-02 11:02:42', '2020-11-02 11:02:42'),
(507, 'en', 'Bill to', 'Bill to', '2020-11-02 11:02:42', '2020-11-02 11:02:42'),
(510, 'en', 'Sub Total', 'Sub Total', '2020-11-02 11:02:42', '2020-11-02 11:02:42'),
(512, 'en', 'Total Tax', 'Total Tax', '2020-11-02 11:02:42', '2020-11-02 11:02:42'),
(513, 'en', 'Grand Total', 'Grand Total', '2020-11-02 11:02:42', '2020-11-02 11:02:42'),
(514, 'en', 'Your order has been placed successfully. Please submit payment information from purchase history', 'Your order has been placed successfully. Please submit payment information from purchase history', '2020-11-02 11:02:47', '2020-11-02 11:02:47'),
(515, 'en', 'Thank You for Your Order!', 'Thank You for Your Order!', '2020-11-02 11:02:48', '2020-11-02 11:02:48'),
(516, 'en', 'Order Code:', 'Order Code:', '2020-11-02 11:02:48', '2020-11-02 11:02:48'),
(517, 'en', 'A copy or your order summary has been sent to', 'A copy or your order summary has been sent to', '2020-11-02 11:02:48', '2020-11-02 11:02:48'),
(518, 'en', 'Make Payment', 'Make Payment', '2020-11-02 11:03:26', '2020-11-02 11:03:26'),
(519, 'en', 'Payment screenshot', 'Payment screenshot', '2020-11-02 11:03:29', '2020-11-02 11:03:29'),
(520, 'en', 'Paypal Credential', 'Paypal Credential', '2020-11-02 11:12:20', '2020-11-02 11:12:20'),
(522, 'en', 'Paypal Client ID', 'Paypal Client ID', '2020-11-02 11:12:20', '2020-11-02 11:12:20'),
(523, 'en', 'Paypal Client Secret', 'Paypal Client Secret', '2020-11-02 11:12:20', '2020-11-02 11:12:20'),
(524, 'en', 'Paypal Sandbox Mode', 'Paypal Sandbox Mode', '2020-11-02 11:12:20', '2020-11-02 11:12:20'),
(525, 'en', 'Sslcommerz Credential', 'Sslcommerz Credential', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(526, 'en', 'Sslcz Store Id', 'Sslcz Store Id', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(527, 'en', 'Sslcz store password', 'Sslcz store password', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(528, 'en', 'Sslcommerz Sandbox Mode', 'Sslcommerz Sandbox Mode', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(529, 'en', 'Stripe Credential', 'Stripe Credential', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(531, 'en', 'STRIPE KEY', 'STRIPE KEY', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(533, 'en', 'STRIPE SECRET', 'STRIPE SECRET', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(534, 'en', 'RazorPay Credential', 'RazorPay Credential', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(535, 'en', 'RAZOR KEY', 'RAZOR KEY', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(536, 'en', 'RAZOR SECRET', 'RAZOR SECRET', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(537, 'en', 'Instamojo Credential', 'Instamojo Credential', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(538, 'en', 'API KEY', 'API KEY', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(539, 'en', 'IM API KEY', 'IM API KEY', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(540, 'en', 'AUTH TOKEN', 'AUTH TOKEN', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(541, 'en', 'IM AUTH TOKEN', 'IM AUTH TOKEN', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(542, 'en', 'Instamojo Sandbox Mode', 'Instamojo Sandbox Mode', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(543, 'en', 'PayStack Credential', 'PayStack Credential', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(544, 'en', 'PUBLIC KEY', 'PUBLIC KEY', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(545, 'en', 'SECRET KEY', 'SECRET KEY', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(546, 'en', 'MERCHANT EMAIL', 'MERCHANT EMAIL', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(547, 'en', 'VoguePay Credential', 'VoguePay Credential', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(548, 'en', 'MERCHANT ID', 'MERCHANT ID', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(549, 'en', 'Sandbox Mode', 'Sandbox Mode', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(550, 'en', 'Payhere Credential', 'Payhere Credential', '2020-11-02 11:12:21', '2020-11-02 11:12:21'),
(551, 'en', 'PAYHERE MERCHANT ID', 'PAYHERE MERCHANT ID', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(552, 'en', 'PAYHERE SECRET', 'PAYHERE SECRET', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(553, 'en', 'PAYHERE CURRENCY', 'PAYHERE CURRENCY', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(554, 'en', 'Payhere Sandbox Mode', 'Payhere Sandbox Mode', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(555, 'en', 'Ngenius Credential', 'Ngenius Credential', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(556, 'en', 'NGENIUS OUTLET ID', 'NGENIUS OUTLET ID', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(557, 'en', 'NGENIUS API KEY', 'NGENIUS API KEY', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(558, 'en', 'NGENIUS CURRENCY', 'NGENIUS CURRENCY', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(559, 'en', 'Mpesa Credential', 'Mpesa Credential', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(560, 'en', 'MPESA CONSUMER KEY', 'MPESA CONSUMER KEY', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(561, 'en', 'MPESA_CONSUMER_KEY', 'MPESA_CONSUMER_KEY', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(562, 'en', 'MPESA CONSUMER SECRET', 'MPESA CONSUMER SECRET', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(563, 'en', 'MPESA_CONSUMER_SECRET', 'MPESA_CONSUMER_SECRET', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(564, 'en', 'MPESA SHORT CODE', 'MPESA SHORT CODE', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(565, 'en', 'MPESA_SHORT_CODE', 'MPESA_SHORT_CODE', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(566, 'en', 'MPESA SANDBOX ACTIVATION', 'MPESA SANDBOX ACTIVATION', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(567, 'en', 'Flutterwave Credential', 'Flutterwave Credential', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(568, 'en', 'RAVE_PUBLIC_KEY', 'RAVE_PUBLIC_KEY', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(569, 'en', 'RAVE_SECRET_KEY', 'RAVE_SECRET_KEY', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(570, 'en', 'RAVE_TITLE', 'RAVE_TITLE', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(571, 'en', 'STAGIN ACTIVATION', 'STAGIN ACTIVATION', '2020-11-02 11:12:22', '2020-11-02 11:12:22'),
(573, 'en', 'All Product', 'All Product', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(574, 'en', 'Sort By', 'Sort By', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(575, 'en', 'Rating (High > Low)', 'Rating (High > Low)', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(576, 'en', 'Rating (Low > High)', 'Rating (Low > High)', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(577, 'en', 'Num of Sale (High > Low)', 'Num of Sale (High > Low)', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(578, 'en', 'Num of Sale (Low > High)', 'Num of Sale (Low > High)', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(579, 'en', 'Base Price (High > Low)', 'Base Price (High > Low)', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(580, 'en', 'Base Price (Low > High)', 'Base Price (Low > High)', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(581, 'en', 'Type & Enter', 'Type & Enter', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(582, 'en', 'Added By', 'Added By', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(583, 'en', 'Num of Sale', 'Num of Sale', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(584, 'en', 'Total Stock', 'Total Stock', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(585, 'en', 'Todays Deal', 'Todays Deal', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(586, 'en', 'Rating', 'Rating', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(587, 'en', 'times', 'times', '2020-11-02 11:15:01', '2020-11-02 11:15:01'),
(588, 'en', 'Add Nerw Product', 'Add Nerw Product', '2020-11-02 11:15:02', '2020-11-02 11:15:02'),
(589, 'en', 'Product Information', 'Product Information', '2020-11-02 11:15:02', '2020-11-02 11:15:02'),
(590, 'en', 'Unit', 'Unit', '2020-11-02 11:15:02', '2020-11-02 11:15:02'),
(591, 'en', 'Unit (e.g. KG, Pc etc)', 'Unit (e.g. KG, Pc etc)', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(592, 'en', 'Minimum Qty', 'Minimum Qty', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(593, 'en', 'Tags', 'Tags', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(594, 'en', 'Type and hit enter to add a tag', 'Type and hit enter to add a tag', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(595, 'en', 'Barcode', 'Barcode', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(596, 'en', 'Refundable', 'Refundable', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(597, 'en', 'Product Images', 'Product Images', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(598, 'en', 'Gallery Images', 'Gallery Images', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(599, 'en', 'Todays Deal updated successfully', 'Todays Deal updated successfully', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(600, 'en', 'Published products updated successfully', 'Published products updated successfully', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(601, 'en', 'Thumbnail Image', 'Thumbnail Image', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(602, 'en', 'Featured products updated successfully', 'Featured products updated successfully', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(603, 'en', 'Product Videos', 'Product Videos', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(604, 'en', 'Video Provider', 'Video Provider', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(605, 'en', 'Youtube', 'Youtube', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(606, 'en', 'Dailymotion', 'Dailymotion', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(607, 'en', 'Vimeo', 'Vimeo', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(608, 'en', 'Video Link', 'Video Link', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(609, 'en', 'Product Variation', 'Product Variation', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(610, 'en', 'Colors', 'Colors', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(611, 'en', 'Attributes', 'Attributes', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(612, 'en', 'Choose Attributes', 'Choose Attributes', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(613, 'en', 'Choose the attributes of this product and then input values of each attribute', 'Choose the attributes of this product and then input values of each attribute', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(614, 'en', 'Product price + stock', 'Product price + stock', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(616, 'en', 'Unit price', 'Unit price', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(617, 'en', 'Purchase price', 'Purchase price', '2020-11-02 11:15:03', '2020-11-02 11:15:03'),
(618, 'en', 'Flat', 'Flat', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(619, 'en', 'Percent', 'Percent', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(620, 'en', 'Discount', 'Discount', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(621, 'en', 'Product Description', 'Product Description', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(622, 'en', 'Product Shipping Cost', 'Product Shipping Cost', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(623, 'en', 'Free Shipping', 'Free Shipping', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(624, 'en', 'Flat Rate', 'Flat Rate', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(625, 'en', 'Shipping cost', 'Shipping cost', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(626, 'en', 'PDF Specification', 'PDF Specification', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(627, 'en', 'SEO Meta Tags', 'SEO Meta Tags', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(628, 'en', 'Meta Title', 'Meta Title', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(629, 'en', 'Meta Image', 'Meta Image', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(630, 'en', 'Choice Title', 'Choice Title', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(631, 'en', 'Enter choice values', 'Enter choice values', '2020-11-02 11:15:04', '2020-11-02 11:15:04'),
(632, 'en', 'All categories', 'All categories', '2020-11-03 05:12:19', '2020-11-03 05:12:19'),
(633, 'en', 'Add New category', 'Add New category', '2020-11-03 05:12:19', '2020-11-03 05:12:19'),
(634, 'en', 'Type name & Enter', 'Type name & Enter', '2020-11-03 05:12:19', '2020-11-03 05:12:19'),
(635, 'en', 'Banner', 'Banner', '2020-11-03 05:12:19', '2020-11-03 05:12:19'),
(637, 'en', 'Commission', 'Commission', '2020-11-03 05:12:19', '2020-11-03 05:12:19'),
(638, 'en', 'icon', 'icon', '2020-11-03 05:12:19', '2020-11-03 05:12:19'),
(639, 'en', 'Featured categories updated successfully', 'Featured categories updated successfully', '2020-11-03 05:12:20', '2020-11-03 05:12:20'),
(640, 'en', 'Hot', 'Hot', '2020-11-03 05:13:12', '2020-11-03 05:13:12'),
(641, 'en', 'Filter by Payment Status', 'Filter by Payment Status', '2020-11-03 05:15:15', '2020-11-03 05:15:15'),
(642, 'en', 'Un-Paid', 'Un-Paid', '2020-11-03 05:15:15', '2020-11-03 05:15:15'),
(643, 'en', 'Filter by Deliver Status', 'Filter by Deliver Status', '2020-11-03 05:15:15', '2020-11-03 05:15:15'),
(644, 'en', 'Pending', 'Pending', '2020-11-03 05:15:15', '2020-11-03 05:15:15'),
(645, 'en', 'Type Order code & hit Enter', 'Type Order code & hit Enter', '2020-11-03 05:15:15', '2020-11-03 05:15:15'),
(646, 'en', 'Num. of Products', 'Num. of Products', '2020-11-03 05:15:15', '2020-11-03 05:15:15'),
(647, 'en', 'Walk In Customer', 'Walk In Customer', '2020-11-03 08:03:20', '2020-11-03 08:03:20'),
(648, 'en', 'QTY', 'QTY', '2020-11-03 08:03:20', '2020-11-03 08:03:20'),
(649, 'en', 'Without Shipping Charge', 'Without Shipping Charge', '2020-11-03 08:03:20', '2020-11-03 08:03:20'),
(650, 'en', 'With Shipping Charge', 'With Shipping Charge', '2020-11-03 08:03:20', '2020-11-03 08:03:20'),
(651, 'en', 'Pay With Cash', 'Pay With Cash', '2020-11-03 08:03:20', '2020-11-03 08:03:20'),
(652, 'en', 'Shipping Address', 'Shipping Address', '2020-11-03 08:03:20', '2020-11-03 08:03:20'),
(653, 'en', 'Close', 'Close', '2020-11-03 08:03:20', '2020-11-03 08:03:20'),
(654, 'en', 'Select country', 'Select country', '2020-11-03 08:03:21', '2020-11-03 08:03:21'),
(655, 'en', 'Order Confirmation', 'Order Confirmation', '2020-11-03 08:03:21', '2020-11-03 08:03:21'),
(656, 'en', 'Are you sure to confirm this order?', 'Are you sure to confirm this order?', '2020-11-03 08:03:21', '2020-11-03 08:03:21'),
(657, 'en', 'Comfirm Order', 'Comfirm Order', '2020-11-03 08:03:21', '2020-11-03 08:03:21'),
(659, 'en', 'Personal Info', 'Personal Info', '2020-11-03 09:38:15', '2020-11-03 09:38:15'),
(660, 'en', 'Repeat Password', 'Repeat Password', '2020-11-03 09:38:15', '2020-11-03 09:38:15'),
(661, 'en', 'Shop Name', 'Shop Name', '2020-11-03 09:38:15', '2020-11-03 09:38:15'),
(662, 'en', 'Register Your Shop', 'Register Your Shop', '2020-11-03 09:38:15', '2020-11-03 09:38:15'),
(663, 'en', 'Affiliate Informations', 'Affiliate Informations', '2020-11-03 09:39:06', '2020-11-03 09:39:06'),
(664, 'en', 'Affiliate', 'Affiliate', '2020-11-03 09:39:06', '2020-11-03 09:39:06'),
(665, 'en', 'User Info', 'User Info', '2020-11-03 09:39:06', '2020-11-03 09:39:06'),
(667, 'en', 'Installed Addon', 'Installed Addon', '2020-11-03 09:48:13', '2020-11-03 09:48:13'),
(668, 'en', 'Available Addon', 'Available Addon', '2020-11-03 09:48:13', '2020-11-03 09:48:13'),
(669, 'en', 'Install New Addon', 'Install New Addon', '2020-11-03 09:48:13', '2020-11-03 09:48:13'),
(670, 'en', 'Version', 'Version', '2020-11-03 09:48:13', '2020-11-03 09:48:13'),
(671, 'en', 'Activated', 'Activated', '2020-11-03 09:48:13', '2020-11-03 09:48:13'),
(672, 'en', 'Deactivated', 'Deactivated', '2020-11-03 09:48:13', '2020-11-03 09:48:13'),
(673, 'en', 'Activate OTP', 'Activate OTP', '2020-11-03 09:48:20', '2020-11-03 09:48:20'),
(674, 'en', 'OTP will be Used For', 'OTP will be Used For', '2020-11-03 09:48:20', '2020-11-03 09:48:20'),
(675, 'en', 'Settings updated successfully', 'Settings updated successfully', '2020-11-03 09:48:20', '2020-11-03 09:48:20'),
(676, 'en', 'Product Owner', 'Product Owner', '2020-11-03 09:48:46', '2020-11-03 09:48:46'),
(677, 'en', 'Point', 'Point', '2020-11-03 09:48:46', '2020-11-03 09:48:46'),
(678, 'en', 'Set Point for Product Within a Range', 'Set Point for Product Within a Range', '2020-11-03 09:48:47', '2020-11-03 09:48:47'),
(679, 'en', 'Set Point for multiple products', 'Set Point for multiple products', '2020-11-03 09:48:47', '2020-11-03 09:48:47'),
(680, 'en', 'Min Price', 'Min Price', '2020-11-03 09:48:47', '2020-11-03 09:48:47'),
(681, 'en', 'Max Price', 'Max Price', '2020-11-03 09:48:47', '2020-11-03 09:48:47'),
(682, 'en', 'Set Point for all Products', 'Set Point for all Products', '2020-11-03 09:48:47', '2020-11-03 09:48:47'),
(683, 'en', 'Set Point For ', 'Set Point For ', '2020-11-03 09:48:47', '2020-11-03 09:48:47'),
(684, 'en', 'Convert Status', 'Convert Status', '2020-11-03 09:48:58', '2020-11-03 09:48:58'),
(685, 'en', 'Earned At', 'Earned At', '2020-11-03 09:48:59', '2020-11-03 09:48:59'),
(686, 'en', 'Seller Based Selling Report', 'Seller Based Selling Report', '2020-11-03 09:49:35', '2020-11-03 09:49:35'),
(687, 'en', 'Sort by verificarion status', 'Sort by verificarion status', '2020-11-03 09:49:35', '2020-11-03 09:49:35'),
(688, 'en', 'Approved', 'Approved', '2020-11-03 09:49:35', '2020-11-03 09:49:35'),
(689, 'en', 'Non Approved', 'Non Approved', '2020-11-03 09:49:35', '2020-11-03 09:49:35'),
(690, 'en', 'Filter', 'Filter', '2020-11-03 09:49:35', '2020-11-03 09:49:35'),
(691, 'en', 'Seller Name', 'Seller Name', '2020-11-03 09:49:35', '2020-11-03 09:49:35'),
(692, 'en', 'Number of Product Sale', 'Number of Product Sale', '2020-11-03 09:49:36', '2020-11-03 09:49:36'),
(693, 'en', 'Order Amount', 'Order Amount', '2020-11-03 09:49:36', '2020-11-03 09:49:36'),
(694, 'en', 'Facebook Chat Setting', 'Facebook Chat Setting', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(695, 'en', 'Facebook Page ID', 'Facebook Page ID', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(696, 'en', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(697, 'en', 'Login into your facebook page', 'Login into your facebook page', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(698, 'en', 'Find the About option of your facebook page', 'Find the About option of your facebook page', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(699, 'en', 'At the very bottom, you can find the \\“Facebook Page ID\\”', 'At the very bottom, you can find the \\“Facebook Page ID\\”', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(700, 'en', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(701, 'en', 'Scroll down that page and you will get \\\"white listed domain\\\"', 'Scroll down that page and you will get \\\"white listed domain\\\"', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(702, 'en', 'Set your website domain name', 'Set your website domain name', '2020-11-03 09:51:14', '2020-11-03 09:51:14'),
(703, 'en', 'Google reCAPTCHA Setting', 'Google reCAPTCHA Setting', '2020-11-03 09:51:25', '2020-11-03 09:51:25'),
(704, 'en', 'Site KEY', 'Site KEY', '2020-11-03 09:51:25', '2020-11-03 09:51:25'),
(705, 'en', 'Select Shipping Method', 'Select Shipping Method', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(706, 'en', 'Product Wise Shipping Cost', 'Product Wise Shipping Cost', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(707, 'en', 'Flat Rate Shipping Cost', 'Flat Rate Shipping Cost', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(708, 'en', 'Seller Wise Flat Shipping Cost', 'Seller Wise Flat Shipping Cost', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(709, 'en', 'Note', 'Note', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(710, 'en', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(711, 'en', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(712, 'en', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(713, 'en', 'Flat Rate Cost', 'Flat Rate Cost', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(714, 'en', 'Shipping Cost for Admin Products', 'Shipping Cost for Admin Products', '2020-11-03 09:51:32', '2020-11-03 09:51:32'),
(715, 'en', 'Countries', 'Countries', '2020-11-03 09:52:02', '2020-11-03 09:52:02'),
(716, 'en', 'Show/Hide', 'Show/Hide', '2020-11-03 09:52:02', '2020-11-03 09:52:02'),
(717, 'en', 'Country status updated successfully', 'Country status updated successfully', '2020-11-03 09:52:02', '2020-11-03 09:52:02'),
(718, 'en', 'All Subcategories', 'All Subcategories', '2020-11-03 10:27:55', '2020-11-03 10:27:55'),
(719, 'en', 'Add New Subcategory', 'Add New Subcategory', '2020-11-03 10:27:55', '2020-11-03 10:27:55'),
(720, 'en', 'Sub-Categories', 'Sub-Categories', '2020-11-03 10:27:55', '2020-11-03 10:27:55'),
(721, 'en', 'Sub Category Information', 'Sub Category Information', '2020-11-03 10:28:07', '2020-11-03 10:28:07'),
(723, 'en', 'Slug', 'Slug', '2020-11-03 10:28:07', '2020-11-03 10:28:07'),
(724, 'en', 'All Sub Subcategories', 'All Sub Subcategories', '2020-11-03 10:29:12', '2020-11-03 10:29:12'),
(725, 'en', 'Add New Sub Subcategory', 'Add New Sub Subcategory', '2020-11-03 10:29:12', '2020-11-03 10:29:12'),
(726, 'en', 'Sub-Sub-categories', 'Sub-Sub-categories', '2020-11-03 10:29:12', '2020-11-03 10:29:12'),
(727, 'en', 'Make This Default', 'Make This Default', '2020-11-04 06:24:24', '2020-11-04 06:24:24');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(728, 'en', 'Shops', 'Shops', '2020-11-04 09:17:10', '2020-11-04 09:17:10'),
(729, 'en', 'Women Clothing & Fashion', 'Women Clothing & Fashion', '2020-11-04 09:23:12', '2020-11-04 09:23:12'),
(730, 'en', 'Cellphones & Tabs', 'Cellphones & Tabs', '2020-11-04 10:10:41', '2020-11-04 10:10:41'),
(731, 'en', 'Welcome to', 'Welcome to', '2020-11-07 05:14:43', '2020-11-07 05:14:43'),
(732, 'en', 'Create a New Account', 'Create a New Account', '2020-11-07 05:32:15', '2020-11-07 05:32:15'),
(733, 'en', 'Full Name', 'Full Name', '2020-11-07 05:32:15', '2020-11-07 05:32:15'),
(734, 'en', 'password', 'password', '2020-11-07 05:32:15', '2020-11-07 05:32:15'),
(735, 'en', 'Confrim Password', 'Confrim Password', '2020-11-07 05:32:15', '2020-11-07 05:32:15'),
(736, 'en', 'I agree with the', 'I agree with the', '2020-11-07 05:32:15', '2020-11-07 05:32:15'),
(737, 'en', 'Terms and Conditions', 'Terms and Conditions', '2020-11-07 05:32:15', '2020-11-07 05:32:15'),
(738, 'en', 'Register', 'Register', '2020-11-07 05:32:15', '2020-11-07 05:32:15'),
(739, 'en', 'Already have an account', 'Already have an account', '2020-11-07 05:32:16', '2020-11-07 05:32:16'),
(741, 'en', 'Sign Up with', 'Sign Up with', '2020-11-07 05:32:16', '2020-11-07 05:32:16'),
(742, 'en', 'I agree with the Terms and Conditions', 'I agree with the Terms and Conditions', '2020-11-07 05:34:49', '2020-11-07 05:34:49'),
(745, 'en', 'All Role', 'All Role', '2020-11-07 05:44:28', '2020-11-07 05:44:28'),
(746, 'en', 'Add New Role', 'Add New Role', '2020-11-07 05:44:28', '2020-11-07 05:44:28'),
(747, 'en', 'Roles', 'Roles', '2020-11-07 05:44:28', '2020-11-07 05:44:28'),
(749, 'en', 'Add New Staffs', 'Add New Staffs', '2020-11-07 05:44:36', '2020-11-07 05:44:36'),
(750, 'en', 'Role', 'Role', '2020-11-07 05:44:36', '2020-11-07 05:44:36'),
(751, 'en', 'Frontend Website Name', 'Frontend Website Name', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(752, 'en', 'Website Name', 'Website Name', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(753, 'en', 'Site Motto', 'Site Motto', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(754, 'en', 'Best eCommerce Website', 'Best eCommerce Website', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(755, 'en', 'Site Icon', 'Site Icon', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(756, 'en', 'Website favicon. 32x32 .png', 'Website favicon. 32x32 .png', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(757, 'en', 'Website Base Color', 'Website Base Color', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(758, 'en', 'Hex Color Code', 'Hex Color Code', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(759, 'en', 'Website Base Hover Color', 'Website Base Hover Color', '2020-11-07 05:44:59', '2020-11-07 05:44:59'),
(760, 'en', 'Update', 'Update', '2020-11-07 05:45:00', '2020-11-07 05:45:00'),
(761, 'en', 'Global Seo', 'Global Seo', '2020-11-07 05:45:00', '2020-11-07 05:45:00'),
(762, 'en', 'Meta description', 'Meta description', '2020-11-07 05:45:00', '2020-11-07 05:45:00'),
(763, 'en', 'Keywords', 'Keywords', '2020-11-07 05:45:00', '2020-11-07 05:45:00'),
(764, 'en', 'Separate with coma', 'Separate with coma', '2020-11-07 05:45:00', '2020-11-07 05:45:00'),
(765, 'en', 'Website Pages', 'Website Pages', '2020-11-07 05:49:04', '2020-11-07 05:49:04'),
(766, 'en', 'All Pages', 'All Pages', '2020-11-07 05:49:04', '2020-11-07 05:49:04'),
(767, 'en', 'Add New Page', 'Add New Page', '2020-11-07 05:49:04', '2020-11-07 05:49:04'),
(768, 'en', 'URL', 'URL', '2020-11-07 05:49:04', '2020-11-07 05:49:04'),
(769, 'en', 'Actions', 'Actions', '2020-11-07 05:49:04', '2020-11-07 05:49:04'),
(770, 'en', 'Edit Page Information', 'Edit Page Information', '2020-11-07 05:49:22', '2020-11-07 05:49:22'),
(771, 'en', 'Page Content', 'Page Content', '2020-11-07 05:49:22', '2020-11-07 05:49:22'),
(772, 'en', 'Title', 'Title', '2020-11-07 05:49:22', '2020-11-07 05:49:22'),
(773, 'en', 'Link', 'Link', '2020-11-07 05:49:22', '2020-11-07 05:49:22'),
(774, 'en', 'Use character, number, hypen only', 'Use character, number, hypen only', '2020-11-07 05:49:22', '2020-11-07 05:49:22'),
(775, 'en', 'Add Content', 'Add Content', '2020-11-07 05:49:22', '2020-11-07 05:49:22'),
(776, 'en', 'Seo Fields', 'Seo Fields', '2020-11-07 05:49:22', '2020-11-07 05:49:22'),
(777, 'en', 'Update Page', 'Update Page', '2020-11-07 05:49:22', '2020-11-07 05:49:22'),
(778, 'en', 'Default Language', 'Default Language', '2020-11-07 05:50:09', '2020-11-07 05:50:09'),
(779, 'en', 'Add New Language', 'Add New Language', '2020-11-07 05:50:09', '2020-11-07 05:50:09'),
(780, 'en', 'RTL', 'RTL', '2020-11-07 05:50:09', '2020-11-07 05:50:09'),
(781, 'en', 'Translation', 'Translation', '2020-11-07 05:50:09', '2020-11-07 05:50:09'),
(782, 'en', 'Language Information', 'Language Information', '2020-11-07 05:50:23', '2020-11-07 05:50:23'),
(783, 'en', 'Save Page', 'Save Page', '2020-11-07 05:51:27', '2020-11-07 05:51:27'),
(784, 'en', 'Home Page Settings', 'Home Page Settings', '2020-11-07 05:51:35', '2020-11-07 05:51:35'),
(785, 'en', 'Home Slider', 'Home Slider', '2020-11-07 05:51:35', '2020-11-07 05:51:35'),
(786, 'en', 'Photos & Links', 'Photos & Links', '2020-11-07 05:51:35', '2020-11-07 05:51:35'),
(787, 'en', 'Add New', 'Add New', '2020-11-07 05:51:35', '2020-11-07 05:51:35'),
(788, 'en', 'Home Categories', 'Home Categories', '2020-11-07 05:51:35', '2020-11-07 05:51:35'),
(789, 'en', 'Home Banner 1 (Max 3)', 'Home Banner 1 (Max 3)', '2020-11-07 05:51:35', '2020-11-07 05:51:35'),
(790, 'en', 'Banner & Links', 'Banner & Links', '2020-11-07 05:51:35', '2020-11-07 05:51:35'),
(791, 'en', 'Home Banner 2 (Max 3)', 'Home Banner 2 (Max 3)', '2020-11-07 05:51:36', '2020-11-07 05:51:36'),
(792, 'en', 'Top 10', 'Top 10', '2020-11-07 05:51:36', '2020-11-07 05:51:36'),
(793, 'en', 'Top Categories (Max 10)', 'Top Categories (Max 10)', '2020-11-07 05:51:36', '2020-11-07 05:51:36'),
(794, 'en', 'Top Brands (Max 10)', 'Top Brands (Max 10)', '2020-11-07 05:51:36', '2020-11-07 05:51:36'),
(795, 'en', 'System Name', 'System Name', '2020-11-07 05:54:22', '2020-11-07 05:54:22'),
(796, 'en', 'System Logo - White', 'System Logo - White', '2020-11-07 05:54:22', '2020-11-07 05:54:22'),
(797, 'en', 'Choose Files', 'Choose Files', '2020-11-07 05:54:22', '2020-11-07 05:54:22'),
(798, 'en', 'Will be used in admin panel side menu', 'Will be used in admin panel side menu', '2020-11-07 05:54:23', '2020-11-07 05:54:23'),
(799, 'en', 'System Logo - Black', 'System Logo - Black', '2020-11-07 05:54:23', '2020-11-07 05:54:23'),
(800, 'en', 'Will be used in admin panel topbar in mobile + Admin login page', 'Will be used in admin panel topbar in mobile + Admin login page', '2020-11-07 05:54:23', '2020-11-07 05:54:23'),
(801, 'en', 'System Timezone', 'System Timezone', '2020-11-07 05:54:23', '2020-11-07 05:54:23'),
(802, 'en', 'Admin login page background', 'Admin login page background', '2020-11-07 05:54:23', '2020-11-07 05:54:23'),
(803, 'en', 'Website Header', 'Website Header', '2020-11-07 06:21:36', '2020-11-07 06:21:36'),
(804, 'en', 'Header Setting', 'Header Setting', '2020-11-07 06:21:36', '2020-11-07 06:21:36'),
(805, 'en', 'Header Logo', 'Header Logo', '2020-11-07 06:21:36', '2020-11-07 06:21:36'),
(806, 'en', 'Show Language Switcher?', 'Show Language Switcher?', '2020-11-07 06:21:36', '2020-11-07 06:21:36'),
(807, 'en', 'Show Currency Switcher?', 'Show Currency Switcher?', '2020-11-07 06:21:36', '2020-11-07 06:21:36'),
(808, 'en', 'Enable stikcy header?', 'Enable stikcy header?', '2020-11-07 06:21:36', '2020-11-07 06:21:36'),
(809, 'en', 'Website Footer', 'Website Footer', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(810, 'en', 'Footer Widget', 'Footer Widget', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(811, 'en', 'About Widget', 'About Widget', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(812, 'en', 'Footer Logo', 'Footer Logo', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(813, 'en', 'About description', 'About description', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(814, 'en', 'Contact Info Widget', 'Contact Info Widget', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(815, 'en', 'Footer contact address', 'Footer contact address', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(816, 'en', 'Footer contact phone', 'Footer contact phone', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(817, 'en', 'Footer contact email', 'Footer contact email', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(818, 'en', 'Link Widget One', 'Link Widget One', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(819, 'en', 'Links', 'Links', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(820, 'en', 'Footer Bottom', 'Footer Bottom', '2020-11-07 06:21:56', '2020-11-07 06:21:56'),
(821, 'en', 'Copyright Widget ', 'Copyright Widget ', '2020-11-07 06:21:57', '2020-11-07 06:21:57'),
(822, 'en', 'Copyright Text', 'Copyright Text', '2020-11-07 06:21:57', '2020-11-07 06:21:57'),
(823, 'en', 'Social Link Widget ', 'Social Link Widget ', '2020-11-07 06:21:57', '2020-11-07 06:21:57'),
(824, 'en', 'Show Social Links?', 'Show Social Links?', '2020-11-07 06:21:57', '2020-11-07 06:21:57'),
(825, 'en', 'Social Links', 'Social Links', '2020-11-07 06:21:57', '2020-11-07 06:21:57'),
(826, 'en', 'Payment Methods Widget ', 'Payment Methods Widget ', '2020-11-07 06:21:57', '2020-11-07 06:21:57'),
(827, 'en', 'RTL status updated successfully', 'RTL status updated successfully', '2020-11-07 06:36:11', '2020-11-07 06:36:11'),
(828, 'en', 'Language changed to ', 'Language changed to ', '2020-11-07 06:36:27', '2020-11-07 06:36:27'),
(829, 'en', 'Inhouse Product sale report', 'Inhouse Product sale report', '2020-11-07 07:30:25', '2020-11-07 07:30:25'),
(830, 'en', 'Sort by Category', 'Sort by Category', '2020-11-07 07:30:25', '2020-11-07 07:30:25'),
(831, 'en', 'Product wise stock report', 'Product wise stock report', '2020-11-07 07:31:02', '2020-11-07 07:31:02'),
(832, 'en', 'Currency changed to ', 'Currency changed to ', '2020-11-07 10:36:28', '2020-11-07 10:36:28'),
(833, 'en', 'Avatar', 'Avatar', '2020-11-08 07:32:35', '2020-11-08 07:32:35'),
(834, 'en', 'Copy', 'Copy', '2020-11-08 08:03:42', '2020-11-08 08:03:42'),
(835, 'en', 'Variant', 'Variant', '2020-11-08 08:43:02', '2020-11-08 08:43:02'),
(836, 'en', 'Variant Price', 'Variant Price', '2020-11-08 08:43:03', '2020-11-08 08:43:03'),
(837, 'en', 'SKU', 'SKU', '2020-11-08 08:43:03', '2020-11-08 08:43:03'),
(838, 'en', 'Key', 'Key', '2020-11-08 10:35:09', '2020-11-08 10:35:09'),
(839, 'en', 'Value', 'Value', '2020-11-08 10:35:09', '2020-11-08 10:35:09'),
(840, 'en', 'Copy Translations', 'Copy Translations', '2020-11-08 10:35:10', '2020-11-08 10:35:10'),
(841, 'en', 'All Pick-up Points', 'All Pick-up Points', '2020-11-08 10:35:43', '2020-11-08 10:35:43'),
(842, 'en', 'Add New Pick-up Point', 'Add New Pick-up Point', '2020-11-08 10:35:43', '2020-11-08 10:35:43'),
(843, 'en', 'Manager', 'Manager', '2020-11-08 10:35:43', '2020-11-08 10:35:43'),
(844, 'en', 'Location', 'Location', '2020-11-08 10:35:43', '2020-11-08 10:35:43'),
(845, 'en', 'Pickup Station Contact', 'Pickup Station Contact', '2020-11-08 10:35:43', '2020-11-08 10:35:43'),
(846, 'en', 'Open', 'Open', '2020-11-08 10:35:43', '2020-11-08 10:35:43'),
(847, 'en', 'POS Activation for Seller', 'POS Activation for Seller', '2020-11-08 10:35:55', '2020-11-08 10:35:55'),
(848, 'en', 'Order Completed Successfully.', 'Order Completed Successfully.', '2020-11-08 10:36:02', '2020-11-08 10:36:02'),
(849, 'en', 'Text Input', 'Text Input', '2020-11-08 10:38:40', '2020-11-08 10:38:40'),
(850, 'en', 'Select', 'Select', '2020-11-08 10:38:40', '2020-11-08 10:38:40'),
(851, 'en', 'Multiple Select', 'Multiple Select', '2020-11-08 10:38:40', '2020-11-08 10:38:40'),
(852, 'en', 'Radio', 'Radio', '2020-11-08 10:38:40', '2020-11-08 10:38:40'),
(853, 'en', 'File', 'File', '2020-11-08 10:38:40', '2020-11-08 10:38:40'),
(854, 'en', 'Email Address', 'Email Address', '2020-11-08 10:39:32', '2020-11-08 10:39:32'),
(855, 'en', 'Verification Info', 'Verification Info', '2020-11-08 10:39:32', '2020-11-08 10:39:32'),
(856, 'en', 'Approval', 'Approval', '2020-11-08 10:39:32', '2020-11-08 10:39:32'),
(857, 'en', 'Due Amount', 'Due Amount', '2020-11-08 10:39:32', '2020-11-08 10:39:32'),
(858, 'en', 'Show', 'Show', '2020-11-08 10:39:32', '2020-11-08 10:39:32'),
(859, 'en', 'Pay Now', 'Pay Now', '2020-11-08 10:39:32', '2020-11-08 10:39:32'),
(860, 'en', 'Affiliate User Verification', 'Affiliate User Verification', '2020-11-08 10:40:01', '2020-11-08 10:40:01'),
(861, 'en', 'Reject', 'Reject', '2020-11-08 10:40:01', '2020-11-08 10:40:01'),
(862, 'en', 'Accept', 'Accept', '2020-11-08 10:40:01', '2020-11-08 10:40:01'),
(863, 'en', 'Beauty, Health & Hair', 'Beauty, Health & Hair', '2020-11-08 10:54:17', '2020-11-08 10:54:17'),
(864, 'en', 'Comparison', 'Comparison', '2020-11-08 10:54:33', '2020-11-08 10:54:33'),
(865, 'en', 'Reset Compare List', 'Reset Compare List', '2020-11-08 10:54:33', '2020-11-08 10:54:33'),
(866, 'en', 'Your comparison list is empty', 'Your comparison list is empty', '2020-11-08 10:54:33', '2020-11-08 10:54:33'),
(867, 'en', 'Convert Point To Wallet', 'Convert Point To Wallet', '2020-11-08 11:04:42', '2020-11-08 11:04:42'),
(868, 'en', 'Note: You need to activate wallet option first before using club point addon.', 'Note: You need to activate wallet option first before using club point addon.', '2020-11-08 11:04:43', '2020-11-08 11:04:43'),
(869, 'en', 'Create an account.', 'Create an account.', '2020-11-09 04:17:11', '2020-11-09 04:17:11'),
(870, 'en', 'Use Email Instead', 'Use Email Instead', '2020-11-09 04:17:11', '2020-11-09 04:17:11'),
(871, 'en', 'By signing up you agree to our terms and conditions.', 'By signing up you agree to our terms and conditions.', '2020-11-09 04:17:11', '2020-11-09 04:17:11'),
(872, 'en', 'Create Account', 'Create Account', '2020-11-09 04:17:11', '2020-11-09 04:17:11'),
(873, 'en', 'Or Join With', 'Or Join With', '2020-11-09 04:17:11', '2020-11-09 04:17:11'),
(874, 'en', 'Already have an account?', 'Already have an account?', '2020-11-09 04:17:11', '2020-11-09 04:17:11'),
(875, 'en', 'Log In', 'Log In', '2020-11-09 04:17:11', '2020-11-09 04:17:11'),
(876, 'en', 'Computer & Accessories', 'Computer & Accessories', '2020-11-09 05:52:05', '2020-11-09 05:52:05'),
(878, 'en', 'Product(s)', 'Product(s)', '2020-11-09 05:52:23', '2020-11-09 05:52:23'),
(879, 'en', 'in your cart', 'in your cart', '2020-11-09 05:52:23', '2020-11-09 05:52:23'),
(880, 'en', 'in your wishlist', 'in your wishlist', '2020-11-09 05:52:23', '2020-11-09 05:52:23'),
(881, 'en', 'you ordered', 'you ordered', '2020-11-09 05:52:24', '2020-11-09 05:52:24'),
(882, 'en', 'Default Shipping Address', 'Default Shipping Address', '2020-11-09 05:52:24', '2020-11-09 05:52:24'),
(883, 'en', 'Sports & outdoor', 'Sports & outdoor', '2020-11-09 05:53:32', '2020-11-09 05:53:32'),
(884, 'en', 'Copied', 'Copied', '2020-11-09 05:54:19', '2020-11-09 05:54:19'),
(885, 'en', 'Copy the Promote Link', 'Copy the Promote Link', '2020-11-09 05:54:19', '2020-11-09 05:54:19'),
(886, 'en', 'Write a review', 'Write a review', '2020-11-09 05:54:20', '2020-11-09 05:54:20'),
(887, 'en', 'Your name', 'Your name', '2020-11-09 05:54:20', '2020-11-09 05:54:20'),
(888, 'en', 'Comment', 'Comment', '2020-11-09 05:54:20', '2020-11-09 05:54:20'),
(889, 'en', 'Your review', 'Your review', '2020-11-09 05:54:20', '2020-11-09 05:54:20'),
(890, 'en', 'Submit review', 'Submit review', '2020-11-09 05:54:20', '2020-11-09 05:54:20'),
(891, 'en', 'Claire Willis', 'Claire Willis', '2020-11-09 06:05:00', '2020-11-09 06:05:00'),
(892, 'en', 'Germaine Greene', 'Germaine Greene', '2020-11-09 06:05:00', '2020-11-09 06:05:00'),
(893, 'en', 'Product File', 'Product File', '2020-11-09 06:07:08', '2020-11-09 06:07:08'),
(894, 'en', 'Choose file', 'Choose file', '2020-11-09 06:07:08', '2020-11-09 06:07:08'),
(895, 'en', 'Type to add a tag', 'Type to add a tag', '2020-11-09 06:07:08', '2020-11-09 06:07:08'),
(896, 'en', 'Images', 'Images', '2020-11-09 06:07:08', '2020-11-09 06:07:08'),
(897, 'en', 'Main Images', 'Main Images', '2020-11-09 06:07:08', '2020-11-09 06:07:08'),
(898, 'en', 'Meta Tags', 'Meta Tags', '2020-11-09 06:07:08', '2020-11-09 06:07:08'),
(899, 'en', 'Digital Product has been inserted successfully', 'Digital Product has been inserted successfully', '2020-11-09 06:14:25', '2020-11-09 06:14:25'),
(900, 'en', 'Edit Digital Product', 'Edit Digital Product', '2020-11-09 06:14:34', '2020-11-09 06:14:34'),
(901, 'en', 'Select an option', 'Select an option', '2020-11-09 06:14:34', '2020-11-09 06:14:34'),
(902, 'en', 'tax', 'tax', '2020-11-09 06:14:35', '2020-11-09 06:14:35'),
(903, 'en', 'Any question about this product?', 'Any question about this product?', '2020-11-09 06:15:11', '2020-11-09 06:15:11'),
(904, 'en', 'Sign in', 'Sign in', '2020-11-09 06:15:11', '2020-11-09 06:15:11'),
(905, 'en', 'Login with Google', 'Login with Google', '2020-11-09 06:15:11', '2020-11-09 06:15:11'),
(906, 'en', 'Login with Facebook', 'Login with Facebook', '2020-11-09 06:15:11', '2020-11-09 06:15:11'),
(907, 'en', 'Login with Twitter', 'Login with Twitter', '2020-11-09 06:15:11', '2020-11-09 06:15:11'),
(908, 'en', 'Click to show phone number', 'Click to show phone number', '2020-11-09 06:15:51', '2020-11-09 06:15:51'),
(909, 'en', 'Other Ads of', 'Other Ads of', '2020-11-09 06:15:52', '2020-11-09 06:15:52'),
(910, 'en', 'Store Home', 'Store Home', '2020-11-09 06:54:23', '2020-11-09 06:54:23'),
(911, 'en', 'Top Selling', 'Top Selling', '2020-11-09 06:54:23', '2020-11-09 06:54:23'),
(912, 'en', 'Shop Settings', 'Shop Settings', '2020-11-09 06:55:38', '2020-11-09 06:55:38'),
(913, 'en', 'Visit Shop', 'Visit Shop', '2020-11-09 06:55:38', '2020-11-09 06:55:38'),
(914, 'en', 'Pickup Points', 'Pickup Points', '2020-11-09 06:55:38', '2020-11-09 06:55:38'),
(915, 'en', 'Select Pickup Point', 'Select Pickup Point', '2020-11-09 06:55:38', '2020-11-09 06:55:38'),
(916, 'en', 'Slider Settings', 'Slider Settings', '2020-11-09 06:55:39', '2020-11-09 06:55:39'),
(917, 'en', 'Social Media Link', 'Social Media Link', '2020-11-09 06:55:39', '2020-11-09 06:55:39'),
(918, 'en', 'Facebook', 'Facebook', '2020-11-09 06:55:39', '2020-11-09 06:55:39'),
(919, 'en', 'Twitter', 'Twitter', '2020-11-09 06:55:39', '2020-11-09 06:55:39'),
(920, 'en', 'Google', 'Google', '2020-11-09 06:55:39', '2020-11-09 06:55:39'),
(921, 'en', 'New Arrival Products', 'New Arrival Products', '2020-11-09 06:56:26', '2020-11-09 06:56:26'),
(922, 'en', 'Check Your Order Status', 'Check Your Order Status', '2020-11-09 07:23:32', '2020-11-09 07:23:32'),
(923, 'en', 'Shipping method', 'Shipping method', '2020-11-09 07:27:40', '2020-11-09 07:27:40'),
(924, 'en', 'Shipped By', 'Shipped By', '2020-11-09 07:27:41', '2020-11-09 07:27:41'),
(925, 'en', 'Image', 'Image', '2020-11-09 07:29:37', '2020-11-09 07:29:37'),
(926, 'en', 'Sub Sub Category', 'Sub Sub Category', '2020-11-09 07:29:37', '2020-11-09 07:29:37'),
(927, 'en', 'Inhouse Products', 'Inhouse Products', '2020-11-09 08:22:32', '2020-11-09 08:22:32'),
(928, 'en', 'Forgot Password?', 'Forgot Password?', '2020-11-09 08:33:21', '2020-11-09 08:33:21'),
(929, 'en', 'Enter your email address to recover your password.', 'Enter your email address to recover your password.', '2020-11-09 08:33:21', '2020-11-09 08:33:21'),
(930, 'en', 'Email or Phone', 'Email or Phone', '2020-11-09 08:33:21', '2020-11-09 08:33:21'),
(931, 'en', 'Send Password Reset Link', 'Send Password Reset Link', '2020-11-09 08:33:21', '2020-11-09 08:33:21'),
(932, 'en', 'Back to Login', 'Back to Login', '2020-11-09 08:33:21', '2020-11-09 08:33:21'),
(933, 'en', 'index', 'index', '2020-11-09 08:35:29', '2020-11-09 08:35:29'),
(934, 'en', 'Download Your Product', 'Download Your Product', '2020-11-09 08:35:30', '2020-11-09 08:35:30'),
(935, 'en', 'Option', 'Option', '2020-11-09 08:35:30', '2020-11-09 08:35:30'),
(936, 'en', 'Applied Refund Request', 'Applied Refund Request', '2020-11-09 08:35:39', '2020-11-09 08:35:39'),
(937, 'en', 'Item has been renoved from wishlist', 'Item has been renoved from wishlist', '2020-11-09 08:36:04', '2020-11-09 08:36:04'),
(938, 'en', 'Bulk Products Upload', 'Bulk Products Upload', '2020-11-09 08:39:24', '2020-11-09 08:39:24'),
(939, 'en', 'Upload CSV', 'Upload CSV', '2020-11-09 08:39:25', '2020-11-09 08:39:25'),
(940, 'en', 'Create a Ticket', 'Create a Ticket', '2020-11-09 08:40:25', '2020-11-09 08:40:25'),
(941, 'en', 'Tickets', 'Tickets', '2020-11-09 08:40:25', '2020-11-09 08:40:25'),
(942, 'en', 'Ticket ID', 'Ticket ID', '2020-11-09 08:40:25', '2020-11-09 08:40:25'),
(943, 'en', 'Sending Date', 'Sending Date', '2020-11-09 08:40:25', '2020-11-09 08:40:25'),
(944, 'en', 'Subject', 'Subject', '2020-11-09 08:40:25', '2020-11-09 08:40:25'),
(945, 'en', 'View Details', 'View Details', '2020-11-09 08:40:25', '2020-11-09 08:40:25'),
(946, 'en', 'Provide a detailed description', 'Provide a detailed description', '2020-11-09 08:40:26', '2020-11-09 08:40:26'),
(947, 'en', 'Type your reply', 'Type your reply', '2020-11-09 08:40:26', '2020-11-09 08:40:26'),
(948, 'en', 'Send Ticket', 'Send Ticket', '2020-11-09 08:40:26', '2020-11-09 08:40:26'),
(949, 'en', 'Load More', 'Load More', '2020-11-09 08:40:57', '2020-11-09 08:40:57'),
(950, 'en', 'Jewelry & Watches', 'Jewelry & Watches', '2020-11-09 08:47:38', '2020-11-09 08:47:38'),
(951, 'en', 'Filters', 'Filters', '2020-11-09 08:53:54', '2020-11-09 08:53:54'),
(952, 'en', 'Contact address', 'Contact address', '2020-11-09 08:58:46', '2020-11-09 08:58:46'),
(953, 'en', 'Contact phone', 'Contact phone', '2020-11-09 08:58:47', '2020-11-09 08:58:47'),
(954, 'en', 'Contact email', 'Contact email', '2020-11-09 08:58:47', '2020-11-09 08:58:47'),
(955, 'en', 'Filter by', 'Filter by', '2020-11-09 09:00:03', '2020-11-09 09:00:03'),
(956, 'en', 'Condition', 'Condition', '2020-11-09 09:56:13', '2020-11-09 09:56:13'),
(957, 'en', 'All Type', 'All Type', '2020-11-09 09:56:13', '2020-11-09 09:56:13'),
(960, 'en', 'Pay with wallet', 'Pay with wallet', '2020-11-09 10:56:34', '2020-11-09 10:56:34'),
(961, 'en', 'Select variation', 'Select variation', '2020-11-10 05:54:29', '2020-11-10 05:54:29'),
(962, 'en', 'No Product Added', 'No Product Added', '2020-11-10 06:07:53', '2020-11-10 06:07:53'),
(963, 'en', 'Status has been updated successfully', 'Status has been updated successfully', '2020-11-10 06:41:23', '2020-11-10 06:41:23'),
(964, 'en', 'All Seller Packages', 'All Seller Packages', '2020-11-10 07:14:10', '2020-11-10 07:14:10'),
(965, 'en', 'Add New Package', 'Add New Package', '2020-11-10 07:14:10', '2020-11-10 07:14:10'),
(966, 'en', 'Package Logo', 'Package Logo', '2020-11-10 07:14:10', '2020-11-10 07:14:10'),
(967, 'en', 'days', 'days', '2020-11-10 07:14:10', '2020-11-10 07:14:10'),
(968, 'en', 'Create New Seller Package', 'Create New Seller Package', '2020-11-10 07:14:31', '2020-11-10 07:14:31'),
(969, 'en', 'Package Name', 'Package Name', '2020-11-10 07:14:31', '2020-11-10 07:14:31'),
(970, 'en', 'Duration', 'Duration', '2020-11-10 07:14:31', '2020-11-10 07:14:31'),
(971, 'en', 'Validity in number of days', 'Validity in number of days', '2020-11-10 07:14:31', '2020-11-10 07:14:31'),
(972, 'en', 'Update Package Information', 'Update Package Information', '2020-11-10 07:14:59', '2020-11-10 07:14:59'),
(973, 'en', 'Package has been inserted successfully', 'Package has been inserted successfully', '2020-11-10 07:15:14', '2020-11-10 07:15:14'),
(974, 'en', 'Refund Request', 'Refund Request', '2020-11-10 07:17:25', '2020-11-10 07:17:25'),
(975, 'en', 'Reason', 'Reason', '2020-11-10 07:17:25', '2020-11-10 07:17:25'),
(976, 'en', 'Label', 'Label', '2020-11-10 07:20:13', '2020-11-10 07:20:13'),
(977, 'en', 'Select Label', 'Select Label', '2020-11-10 07:20:13', '2020-11-10 07:20:13'),
(978, 'en', 'Multiple Select Label', 'Multiple Select Label', '2020-11-10 07:20:13', '2020-11-10 07:20:13'),
(979, 'en', 'Radio Label', 'Radio Label', '2020-11-10 07:20:13', '2020-11-10 07:20:13'),
(980, 'en', 'Pickup Point Orders', 'Pickup Point Orders', '2020-11-10 07:25:40', '2020-11-10 07:25:40'),
(981, 'en', 'View', 'View', '2020-11-10 07:25:40', '2020-11-10 07:25:40'),
(982, 'en', 'Order #', 'Order #', '2020-11-10 07:25:48', '2020-11-10 07:25:48'),
(983, 'en', 'Order Status', 'Order Status', '2020-11-10 07:25:48', '2020-11-10 07:25:48'),
(984, 'en', 'Total amount', 'Total amount', '2020-11-10 07:25:48', '2020-11-10 07:25:48'),
(986, 'en', 'TOTAL', 'TOTAL', '2020-11-10 07:25:49', '2020-11-10 07:25:49'),
(987, 'en', 'Delivery status has been updated', 'Delivery status has been updated', '2020-11-10 07:25:49', '2020-11-10 07:25:49'),
(988, 'en', 'Payment status has been updated', 'Payment status has been updated', '2020-11-10 07:25:49', '2020-11-10 07:25:49'),
(989, 'en', 'INVOICE', 'INVOICE', '2020-11-10 07:25:58', '2020-11-10 07:25:58'),
(990, 'en', 'Set Refund Time', 'Set Refund Time', '2020-11-10 07:34:04', '2020-11-10 07:34:04'),
(991, 'en', 'Set Time for sending Refund Request', 'Set Time for sending Refund Request', '2020-11-10 07:34:04', '2020-11-10 07:34:04'),
(992, 'en', 'Set Refund Sticker', 'Set Refund Sticker', '2020-11-10 07:34:05', '2020-11-10 07:34:05'),
(993, 'en', 'Sticker', 'Sticker', '2020-11-10 07:34:05', '2020-11-10 07:34:05'),
(994, 'en', 'Refund Request All', 'Refund Request All', '2020-11-10 07:34:12', '2020-11-10 07:34:12'),
(995, 'en', 'Order Id', 'Order Id', '2020-11-10 07:34:12', '2020-11-10 07:34:12'),
(996, 'en', 'Seller Approval', 'Seller Approval', '2020-11-10 07:34:12', '2020-11-10 07:34:12'),
(997, 'en', 'Admin Approval', 'Admin Approval', '2020-11-10 07:34:12', '2020-11-10 07:34:12'),
(998, 'en', 'Refund Status', 'Refund Status', '2020-11-10 07:34:12', '2020-11-10 07:34:12'),
(1000, 'en', 'No Refund', 'No Refund', '2020-11-10 07:35:27', '2020-11-10 07:35:27'),
(1001, 'en', 'Status updated successfully', 'Status updated successfully', '2020-11-10 07:54:20', '2020-11-10 07:54:20'),
(1002, 'en', 'User Search Report', 'User Search Report', '2020-11-11 04:43:24', '2020-11-11 04:43:24'),
(1003, 'en', 'Search By', 'Search By', '2020-11-11 04:43:24', '2020-11-11 04:43:24'),
(1004, 'en', 'Number searches', 'Number searches', '2020-11-11 04:43:24', '2020-11-11 04:43:24'),
(1005, 'en', 'Sender', 'Sender', '2020-11-11 04:51:49', '2020-11-11 04:51:49'),
(1006, 'en', 'Receiver', 'Receiver', '2020-11-11 04:51:49', '2020-11-11 04:51:49'),
(1007, 'en', 'Verification form updated successfully', 'Verification form updated successfully', '2020-11-11 04:53:29', '2020-11-11 04:53:29'),
(1008, 'en', 'Invalid email or password', 'Invalid email or password', '2020-11-11 05:07:49', '2020-11-11 05:07:49'),
(1009, 'en', 'All Coupons', 'All Coupons', '2020-11-11 05:14:04', '2020-11-11 05:14:04'),
(1010, 'en', 'Add New Coupon', 'Add New Coupon', '2020-11-11 05:14:04', '2020-11-11 05:14:04'),
(1011, 'en', 'Coupon Information', 'Coupon Information', '2020-11-11 05:14:04', '2020-11-11 05:14:04'),
(1012, 'en', 'Start Date', 'Start Date', '2020-11-11 05:14:04', '2020-11-11 05:14:04'),
(1013, 'en', 'End Date', 'End Date', '2020-11-11 05:14:05', '2020-11-11 05:14:05'),
(1014, 'en', 'Product Base', 'Product Base', '2020-11-11 05:14:05', '2020-11-11 05:14:05'),
(1015, 'en', 'Send Newsletter', 'Send Newsletter', '2020-11-11 05:14:10', '2020-11-11 05:14:10'),
(1016, 'en', 'Mobile Users', 'Mobile Users', '2020-11-11 05:14:10', '2020-11-11 05:14:10'),
(1017, 'en', 'SMS subject', 'SMS subject', '2020-11-11 05:14:10', '2020-11-11 05:14:10'),
(1018, 'en', 'SMS content', 'SMS content', '2020-11-11 05:14:10', '2020-11-11 05:14:10'),
(1019, 'en', 'All Flash Delas', 'All Flash Delas', '2020-11-11 05:16:06', '2020-11-11 05:16:06'),
(1020, 'en', 'Create New Flash Dela', 'Create New Flash Dela', '2020-11-11 05:16:06', '2020-11-11 05:16:06'),
(1022, 'en', 'Page Link', 'Page Link', '2020-11-11 05:16:06', '2020-11-11 05:16:06'),
(1023, 'en', 'Flash Deal Information', 'Flash Deal Information', '2020-11-11 05:16:14', '2020-11-11 05:16:14'),
(1024, 'en', 'Background Color', 'Background Color', '2020-11-11 05:16:14', '2020-11-11 05:16:14'),
(1025, 'en', '#0000ff', '#0000ff', '2020-11-11 05:16:14', '2020-11-11 05:16:14'),
(1026, 'en', 'Text Color', 'Text Color', '2020-11-11 05:16:14', '2020-11-11 05:16:14'),
(1027, 'en', 'White', 'White', '2020-11-11 05:16:14', '2020-11-11 05:16:14'),
(1028, 'en', 'Dark', 'Dark', '2020-11-11 05:16:15', '2020-11-11 05:16:15'),
(1029, 'en', 'Choose Products', 'Choose Products', '2020-11-11 05:16:15', '2020-11-11 05:16:15'),
(1030, 'en', 'Discounts', 'Discounts', '2020-11-11 05:16:20', '2020-11-11 05:16:20'),
(1031, 'en', 'Discount Type', 'Discount Type', '2020-11-11 05:16:20', '2020-11-11 05:16:20'),
(1032, 'en', 'Twillo Credential', 'Twillo Credential', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1033, 'en', 'TWILIO SID', 'TWILIO SID', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1034, 'en', 'TWILIO AUTH TOKEN', 'TWILIO AUTH TOKEN', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1035, 'en', 'TWILIO VERIFY SID', 'TWILIO VERIFY SID', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1036, 'en', 'VALID TWILLO NUMBER', 'VALID TWILLO NUMBER', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1037, 'en', 'Nexmo Credential', 'Nexmo Credential', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1038, 'en', 'NEXMO KEY', 'NEXMO KEY', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1039, 'en', 'NEXMO SECRET', 'NEXMO SECRET', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1040, 'en', 'SSL Wireless Credential', 'SSL Wireless Credential', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1041, 'en', 'SSL SMS API TOKEN', 'SSL SMS API TOKEN', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1042, 'en', 'SSL SMS SID', 'SSL SMS SID', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1043, 'en', 'SSL SMS URL', 'SSL SMS URL', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1044, 'en', 'Fast2SMS Credential', 'Fast2SMS Credential', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1045, 'en', 'AUTH KEY', 'AUTH KEY', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1046, 'en', 'ROUTE', 'ROUTE', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1047, 'en', 'Promotional Use', 'Promotional Use', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1048, 'en', 'Transactional Use', 'Transactional Use', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1050, 'en', 'SENDER ID', 'SENDER ID', '2020-11-11 05:17:35', '2020-11-11 05:17:35'),
(1051, 'en', 'Nexmo OTP', 'Nexmo OTP', '2020-11-11 05:17:42', '2020-11-11 05:17:42'),
(1052, 'en', 'Twillo OTP', 'Twillo OTP', '2020-11-11 05:17:43', '2020-11-11 05:17:43'),
(1053, 'en', 'SSL Wireless OTP', 'SSL Wireless OTP', '2020-11-11 05:17:43', '2020-11-11 05:17:43'),
(1054, 'en', 'Fast2SMS OTP', 'Fast2SMS OTP', '2020-11-11 05:17:43', '2020-11-11 05:17:43'),
(1055, 'en', 'Order Placement', 'Order Placement', '2020-11-11 05:17:43', '2020-11-11 05:17:43'),
(1056, 'en', 'Delivery Status Changing Time', 'Delivery Status Changing Time', '2020-11-11 05:17:43', '2020-11-11 05:17:43'),
(1057, 'en', 'Paid Status Changing Time', 'Paid Status Changing Time', '2020-11-11 05:17:43', '2020-11-11 05:17:43'),
(1058, 'en', 'Send Bulk SMS', 'Send Bulk SMS', '2020-11-11 05:19:14', '2020-11-11 05:19:14'),
(1059, 'en', 'All Subscribers', 'All Subscribers', '2020-11-11 05:21:51', '2020-11-11 05:21:51'),
(1060, 'en', 'Coupon Information Adding', 'Coupon Information Adding', '2020-11-11 05:22:25', '2020-11-11 05:22:25'),
(1061, 'en', 'Coupon Type', 'Coupon Type', '2020-11-11 05:22:25', '2020-11-11 05:22:25'),
(1062, 'en', 'For Products', 'For Products', '2020-11-11 05:22:25', '2020-11-11 05:22:25'),
(1063, 'en', 'For Total Orders', 'For Total Orders', '2020-11-11 05:22:25', '2020-11-11 05:22:25'),
(1064, 'en', 'Add Your Product Base Coupon', 'Add Your Product Base Coupon', '2020-11-11 05:22:42', '2020-11-11 05:22:42'),
(1065, 'en', 'Coupon code', 'Coupon code', '2020-11-11 05:22:42', '2020-11-11 05:22:42'),
(1066, 'en', 'Sub Category', 'Sub Category', '2020-11-11 05:22:42', '2020-11-11 05:22:42'),
(1067, 'en', 'Add More', 'Add More', '2020-11-11 05:22:43', '2020-11-11 05:22:43'),
(1068, 'en', 'Add Your Cart Base Coupon', 'Add Your Cart Base Coupon', '2020-11-11 05:29:40', '2020-11-11 05:29:40'),
(1069, 'en', 'Minimum Shopping', 'Minimum Shopping', '2020-11-11 05:29:40', '2020-11-11 05:29:40'),
(1070, 'en', 'Maximum Discount Amount', 'Maximum Discount Amount', '2020-11-11 05:29:41', '2020-11-11 05:29:41'),
(1071, 'en', 'Coupon Information Update', 'Coupon Information Update', '2020-11-11 06:18:34', '2020-11-11 06:18:34'),
(1073, 'en', 'Please Configure SMTP Setting to work all email sending funtionality', 'Please Configure SMTP Setting to work all email sending funtionality', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1074, 'en', 'Configure Now', 'Configure Now', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1076, 'en', 'Total published products', 'Total published products', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1077, 'en', 'Total sellers products', 'Total sellers products', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1078, 'en', 'Total admin products', 'Total admin products', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1079, 'en', 'Manage Products', 'Manage Products', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1080, 'en', 'Total product category', 'Total product category', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1081, 'en', 'Create Category', 'Create Category', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1082, 'en', 'Total product sub sub category', 'Total product sub sub category', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1083, 'en', 'Create Sub Sub Category', 'Create Sub Sub Category', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1084, 'en', 'Total product sub category', 'Total product sub category', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1085, 'en', 'Create Sub Category', 'Create Sub Category', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1086, 'en', 'Total product brand', 'Total product brand', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1087, 'en', 'Create Brand', 'Create Brand', '2020-11-11 11:10:18', '2020-11-11 11:10:18'),
(1089, 'en', 'Total sellers', 'Total sellers', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1091, 'en', 'Total approved sellers', 'Total approved sellers', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1093, 'en', 'Total pending sellers', 'Total pending sellers', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1094, 'en', 'Manage Sellers', 'Manage Sellers', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1095, 'en', 'Category wise product sale', 'Category wise product sale', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1097, 'en', 'Sale', 'Sale', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1098, 'en', 'Category wise product stock', 'Category wise product stock', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1099, 'en', 'Category Name', 'Category Name', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1100, 'en', 'Stock', 'Stock', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1101, 'en', 'Frontend', 'Frontend', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1103, 'en', 'Home page', 'Home page', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1104, 'en', 'setting', 'setting', '2020-11-11 11:10:19', '2020-11-11 11:10:19'),
(1106, 'en', 'Policy page', 'Policy page', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1107, 'en', 'setting', 'setting', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1109, 'en', 'General', 'General', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1110, 'en', 'setting', 'setting', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1111, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1112, 'en', 'Useful link', 'Useful link', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1113, 'en', 'setting', 'setting', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1114, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1115, 'en', 'Activation', 'Activation', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1116, 'en', 'setting', 'setting', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1117, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1118, 'en', 'SMTP', 'SMTP', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1119, 'en', 'setting', 'setting', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1120, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1121, 'en', 'Payment method', 'Payment method', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1122, 'en', 'setting', 'setting', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1123, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1124, 'en', 'Social media', 'Social media', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1125, 'en', 'setting', 'setting', '2020-11-11 11:10:20', '2020-11-11 11:10:20'),
(1126, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1127, 'en', 'Business', 'Business', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1128, 'en', 'setting', 'setting', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1130, 'en', 'setting', 'setting', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1131, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1132, 'en', 'Seller verification', 'Seller verification', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1133, 'en', 'form setting', 'form setting', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1134, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1135, 'en', 'Language', 'Language', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1136, 'en', 'setting', 'setting', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1137, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1139, 'en', 'setting', 'setting', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1140, 'en', 'Click Here', 'Click Here', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1141, 'en', 'Dashboard', 'Dashboard', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1142, 'en', 'POS System', 'POS System', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1143, 'en', 'POS Manager', 'POS Manager', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1144, 'en', 'POS Configuration', 'POS Configuration', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1145, 'en', 'Products', 'Products', '2020-11-11 11:10:21', '2020-11-11 11:10:21'),
(1146, 'en', 'Add New product', 'Add New product', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1147, 'en', 'All Products', 'All Products', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1148, 'en', 'In House Products', 'In House Products', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1149, 'en', 'Seller Products', 'Seller Products', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1150, 'en', 'Digital Products', 'Digital Products', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1151, 'en', 'Bulk Import', 'Bulk Import', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1152, 'en', 'Bulk Export', 'Bulk Export', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1153, 'en', 'Category', 'Category', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1154, 'en', 'Subcategory', 'Subcategory', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1155, 'en', 'Sub Subcategory', 'Sub Subcategory', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1156, 'en', 'Brand', 'Brand', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1157, 'en', 'Attribute', 'Attribute', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1158, 'en', 'Product Reviews', 'Product Reviews', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1159, 'en', 'Sales', 'Sales', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1160, 'en', 'All Orders', 'All Orders', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1161, 'en', 'Inhouse orders', 'Inhouse orders', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1162, 'en', 'Seller Orders', 'Seller Orders', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1163, 'en', 'Pick-up Point Order', 'Pick-up Point Order', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1164, 'en', 'Refunds', 'Refunds', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1165, 'en', 'Refund Requests', 'Refund Requests', '2020-11-11 11:10:22', '2020-11-11 11:10:22'),
(1166, 'en', 'Approved Refund', 'Approved Refund', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1167, 'en', 'Refund Configuration', 'Refund Configuration', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1168, 'en', 'Customers', 'Customers', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1169, 'en', 'Customer list', 'Customer list', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1170, 'en', 'Classified Products', 'Classified Products', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1171, 'en', 'Classified Packages', 'Classified Packages', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1172, 'en', 'Sellers', 'Sellers', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1173, 'en', 'All Seller', 'All Seller', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1174, 'en', 'Payouts', 'Payouts', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1175, 'en', 'Payout Requests', 'Payout Requests', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1176, 'en', 'Seller Commission', 'Seller Commission', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1177, 'en', 'Seller Packages', 'Seller Packages', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1178, 'en', 'Seller Verification Form', 'Seller Verification Form', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1179, 'en', 'Reports', 'Reports', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1180, 'en', 'In House Product Sale', 'In House Product Sale', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1181, 'en', 'Seller Products Sale', 'Seller Products Sale', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1182, 'en', 'Products Stock', 'Products Stock', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1183, 'en', 'Products wishlist', 'Products wishlist', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1184, 'en', 'User Searches', 'User Searches', '2020-11-11 11:10:23', '2020-11-11 11:10:23'),
(1185, 'en', 'Marketing', 'Marketing', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1186, 'en', 'Flash deals', 'Flash deals', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1187, 'en', 'Newsletters', 'Newsletters', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1188, 'en', 'Bulk SMS', 'Bulk SMS', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1189, 'en', 'Subscribers', 'Subscribers', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1190, 'en', 'Coupon', 'Coupon', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1191, 'en', 'Support', 'Support', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1192, 'en', 'Ticket', 'Ticket', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1193, 'en', 'Product Queries', 'Product Queries', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1194, 'en', 'Website Setup', 'Website Setup', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1195, 'en', 'Header', 'Header', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1196, 'en', 'Footer', 'Footer', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1197, 'en', 'Pages', 'Pages', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1198, 'en', 'Appearance', 'Appearance', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1199, 'en', 'Setup & Configurations', 'Setup & Configurations', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1200, 'en', 'General Settings', 'General Settings', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1201, 'en', 'Features activation', 'Features activation', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1202, 'en', 'Languages', 'Languages', '2020-11-11 11:10:24', '2020-11-11 11:10:24'),
(1203, 'en', 'Currency', 'Currency', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1204, 'en', 'Pickup point', 'Pickup point', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1205, 'en', 'SMTP Settings', 'SMTP Settings', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1206, 'en', 'Payment Methods', 'Payment Methods', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1207, 'en', 'File System Configuration', 'File System Configuration', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1208, 'en', 'Social media Logins', 'Social media Logins', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1209, 'en', 'Analytics Tools', 'Analytics Tools', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1210, 'en', 'Facebook Chat', 'Facebook Chat', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1211, 'en', 'Google reCAPTCHA', 'Google reCAPTCHA', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1212, 'en', 'Shipping Configuration', 'Shipping Configuration', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1213, 'en', 'Shipping Countries', 'Shipping Countries', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1214, 'en', 'Affiliate System', 'Affiliate System', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1215, 'en', 'Affiliate Registration Form', 'Affiliate Registration Form', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1216, 'en', 'Affiliate Configurations', 'Affiliate Configurations', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1217, 'en', 'Affiliate Users', 'Affiliate Users', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1218, 'en', 'Referral Users', 'Referral Users', '2020-11-11 11:10:25', '2020-11-11 11:10:25'),
(1219, 'en', 'Affiliate Withdraw Requests', 'Affiliate Withdraw Requests', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1220, 'en', 'Offline Payment System', 'Offline Payment System', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1221, 'en', 'Manual Payment Methods', 'Manual Payment Methods', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1222, 'en', 'Offline Wallet Recharge', 'Offline Wallet Recharge', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1223, 'en', 'Offline Customer Package Payments', 'Offline Customer Package Payments', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1224, 'en', 'Offline Seller Package Payments', 'Offline Seller Package Payments', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1225, 'en', 'Paytm Payment Gateway', 'Paytm Payment Gateway', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1226, 'en', 'Set Paytm Credentials', 'Set Paytm Credentials', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1227, 'en', 'Club Point System', 'Club Point System', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1228, 'en', 'Club Point Configurations', 'Club Point Configurations', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1229, 'en', 'Set Product Point', 'Set Product Point', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1230, 'en', 'User Points', 'User Points', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1231, 'en', 'OTP System', 'OTP System', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1232, 'en', 'OTP Configurations', 'OTP Configurations', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1233, 'en', 'Set OTP Credentials', 'Set OTP Credentials', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1234, 'en', 'Staffs', 'Staffs', '2020-11-11 11:10:26', '2020-11-11 11:10:26'),
(1235, 'en', 'All staffs', 'All staffs', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1236, 'en', 'Staff permissions', 'Staff permissions', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1237, 'en', 'Addon Manager', 'Addon Manager', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1238, 'en', 'Browse Website', 'Browse Website', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1239, 'en', 'POS', 'POS', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1240, 'en', 'Notifications', 'Notifications', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1241, 'en', 'new orders', 'new orders', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1242, 'en', 'user-image', 'user-image', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1243, 'en', 'Profile', 'Profile', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1244, 'en', 'Logout', 'Logout', '2020-11-11 11:10:27', '2020-11-11 11:10:27'),
(1247, 'en', 'Page Not Found!', 'Page Not Found!', '2020-11-11 11:10:28', '2020-11-11 11:10:28'),
(1249, 'en', 'The page you are looking for has not been found on our server.', 'The page you are looking for has not been found on our server.', '2020-11-11 11:10:28', '2020-11-11 11:10:28'),
(1253, 'en', 'Registration', 'Registration', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1255, 'en', 'I am shopping for...', 'I am shopping for...', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1257, 'en', 'Compare', 'Compare', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1259, 'en', 'Wishlist', 'Wishlist', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1261, 'en', 'Cart', 'Cart', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1263, 'en', 'Your Cart is empty', 'Your Cart is empty', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1265, 'en', 'Categories', 'Categories', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1267, 'en', 'See All', 'See All', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1269, 'en', 'Seller Policy', 'Seller Policy', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1271, 'en', 'Return Policy', 'Return Policy', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1273, 'en', 'Support Policy', 'Support Policy', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1275, 'en', 'Privacy Policy', 'Privacy Policy', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1277, 'en', 'Your Email Address', 'Your Email Address', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1279, 'en', 'Subscribe', 'Subscribe', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1281, 'en', 'Contact Info', 'Contact Info', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1283, 'en', 'Address', 'Address', '2020-11-11 11:10:29', '2020-11-11 11:10:29'),
(1285, 'en', 'Phone', 'Phone', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1287, 'en', 'Email', 'Email', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1288, 'en', 'Login', 'Login', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1289, 'en', 'My Account', 'My Account', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1291, 'en', 'Login', 'Login', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1293, 'en', 'Order History', 'Order History', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1295, 'en', 'My Wishlist', 'My Wishlist', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1297, 'en', 'Track Order', 'Track Order', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1299, 'en', 'Be an affiliate partner', 'Be an affiliate partner', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1301, 'en', 'Be a Seller', 'Be a Seller', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1303, 'en', 'Apply Now', 'Apply Now', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1305, 'en', 'Confirmation', 'Confirmation', '2020-11-11 11:10:30', '2020-11-11 11:10:30');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(1307, 'en', 'Delete confirmation message', 'Delete confirmation message', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1309, 'en', 'Cancel', 'Cancel', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1312, 'en', 'Delete', 'Delete', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1313, 'en', 'Item has been added to compare list', 'Item has been added to compare list', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1314, 'en', 'Please login first', 'Please login first', '2020-11-11 11:10:30', '2020-11-11 11:10:30'),
(1315, 'en', 'Total Earnings From', 'Total Earnings From', '2020-11-12 06:01:11', '2020-11-12 06:01:11'),
(1316, 'en', 'Client Subscription', 'Client Subscription', '2020-11-12 06:01:12', '2020-11-12 06:01:12'),
(1317, 'en', 'Product category', 'Product category', '2020-11-12 06:03:46', '2020-11-12 06:03:46'),
(1318, 'en', 'Product sub sub category', 'Product sub sub category', '2020-11-12 06:03:46', '2020-11-12 06:03:46'),
(1319, 'en', 'Product sub category', 'Product sub category', '2020-11-12 06:03:46', '2020-11-12 06:03:46'),
(1320, 'en', 'Product brand', 'Product brand', '2020-11-12 06:03:46', '2020-11-12 06:03:46'),
(1321, 'en', 'Top Client Packages', 'Top Client Packages', '2020-11-12 06:05:21', '2020-11-12 06:05:21'),
(1322, 'en', 'Top Freelancer Packages', 'Top Freelancer Packages', '2020-11-12 06:05:21', '2020-11-12 06:05:21'),
(1323, 'en', 'Number of sale', 'Number of sale', '2020-11-12 07:13:09', '2020-11-12 07:13:09'),
(1324, 'en', 'Number of Stock', 'Number of Stock', '2020-11-12 07:16:02', '2020-11-12 07:16:02'),
(1325, 'en', 'Top 10 Products', 'Top 10 Products', '2020-11-12 08:02:29', '2020-11-12 08:02:29'),
(1326, 'en', 'Top 12 Products', 'Top 12 Products', '2020-11-12 08:02:39', '2020-11-12 08:02:39'),
(1327, 'en', 'Admin can not be a seller', 'Admin can not be a seller', '2020-11-12 09:30:19', '2020-11-12 09:30:19'),
(1328, 'en', 'Filter by Rating', 'Filter by Rating', '2020-11-15 06:01:15', '2020-11-15 06:01:15'),
(1329, 'en', 'Published reviews updated successfully', 'Published reviews updated successfully', '2020-11-15 06:01:15', '2020-11-15 06:01:15'),
(1330, 'en', 'Refund Sticker has been updated successfully', 'Refund Sticker has been updated successfully', '2020-11-15 06:17:12', '2020-11-15 06:17:12'),
(1331, 'en', 'Edit Product', 'Edit Product', '2020-11-15 08:31:54', '2020-11-15 08:31:54'),
(1332, 'en', 'Meta Images', 'Meta Images', '2020-11-15 08:32:12', '2020-11-15 08:32:12'),
(1333, 'en', 'Update Product', 'Update Product', '2020-11-15 08:32:12', '2020-11-15 08:32:12'),
(1334, 'en', 'Product has been deleted successfully', 'Product has been deleted successfully', '2020-11-15 08:32:57', '2020-11-15 08:32:57'),
(1335, 'en', 'Your Profile has been updated successfully!', 'Your Profile has been updated successfully!', '2020-11-15 09:10:42', '2020-11-15 09:10:42'),
(1336, 'en', 'Upload limit has been reached. Please upgrade your package.', 'Upload limit has been reached. Please upgrade your package.', '2020-11-15 09:13:45', '2020-11-15 09:13:45'),
(1337, 'en', 'Add Your Product', 'Add Your Product', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1338, 'en', 'Select a category', 'Select a category', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1339, 'en', 'Select a brand', 'Select a brand', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1340, 'en', 'Product Unit', 'Product Unit', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1341, 'en', 'Minimum Qty.', 'Minimum Qty.', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1342, 'en', 'Product Tag', 'Product Tag', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1343, 'en', 'Type & hit enter', 'Type & hit enter', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1344, 'en', 'Videos', 'Videos', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1345, 'en', 'Video From', 'Video From', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1346, 'en', 'Video URL', 'Video URL', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1347, 'en', 'Customer Choice', 'Customer Choice', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1348, 'en', 'PDF', 'PDF', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1349, 'en', 'Choose PDF', 'Choose PDF', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1350, 'en', 'Select Category', 'Select Category', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1351, 'en', 'Target Category', 'Target Category', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1352, 'en', 'subsubcategory', 'subsubcategory', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1353, 'en', 'Search Category', 'Search Category', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1354, 'en', 'Search SubCategory', 'Search SubCategory', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1355, 'en', 'Search SubSubCategory', 'Search SubSubCategory', '2020-11-15 09:17:56', '2020-11-15 09:17:56'),
(1356, 'en', 'Update your product', 'Update your product', '2020-11-15 09:39:14', '2020-11-15 09:39:14'),
(1357, 'en', 'Product has been updated successfully', 'Product has been updated successfully', '2020-11-15 09:51:36', '2020-11-15 09:51:36'),
(1358, 'en', 'Add Your Digital Product', 'Add Your Digital Product', '2020-11-15 10:24:21', '2020-11-15 10:24:21'),
(1359, 'en', 'Active eCommerce CMS Update Process', 'Active eCommerce CMS Update Process', '2020-11-16 05:53:31', '2020-11-16 05:53:31'),
(1360, 'en', 'You will need to know the following items before\r\n        proceeding', 'You will need to know the following items before\r\n        proceeding', '2020-11-16 05:53:31', '2020-11-16 05:53:31'),
(1361, 'en', 'Codecanyon purchase code', 'Codecanyon purchase code', '2020-11-16 05:53:31', '2020-11-16 05:53:31'),
(1362, 'en', 'Database Name', 'Database Name', '2020-11-16 05:53:31', '2020-11-16 05:53:31'),
(1363, 'en', 'Database Username', 'Database Username', '2020-11-16 05:53:31', '2020-11-16 05:53:31'),
(1364, 'en', 'Database Password', 'Database Password', '2020-11-16 05:53:31', '2020-11-16 05:53:31'),
(1365, 'en', 'Database Hostname', 'Database Hostname', '2020-11-16 05:53:31', '2020-11-16 05:53:31'),
(1366, 'en', 'Update Now', 'Update Now', '2020-11-16 05:53:31', '2020-11-16 05:53:31'),
(1367, 'en', 'You will need to know the following items before\r\n                            proceeding', 'You will need to know the following items before\r\n                            proceeding', '2020-11-16 05:54:20', '2020-11-16 05:54:20'),
(1368, 'en', 'Congratulations', 'Congratulations', '2020-11-16 05:55:14', '2020-11-16 05:55:14'),
(1369, 'en', 'You have successfully completed the updating process. Please Login to continue', 'You have successfully completed the updating process. Please Login to continue', '2020-11-16 05:55:14', '2020-11-16 05:55:14'),
(1370, 'en', 'Go to Home', 'Go to Home', '2020-11-16 05:55:14', '2020-11-16 05:55:14'),
(1371, 'en', 'Login to Admin panel', 'Login to Admin panel', '2020-11-16 05:55:14', '2020-11-16 05:55:14'),
(1372, 'en', 'S3 File System Credentials', 'S3 File System Credentials', '2020-11-16 10:59:57', '2020-11-16 10:59:57'),
(1373, 'en', 'AWS_ACCESS_KEY_ID', 'AWS_ACCESS_KEY_ID', '2020-11-16 10:59:57', '2020-11-16 10:59:57'),
(1374, 'en', 'AWS_SECRET_ACCESS_KEY', 'AWS_SECRET_ACCESS_KEY', '2020-11-16 10:59:57', '2020-11-16 10:59:57'),
(1375, 'en', 'AWS_DEFAULT_REGION', 'AWS_DEFAULT_REGION', '2020-11-16 10:59:57', '2020-11-16 10:59:57'),
(1376, 'en', 'AWS_BUCKET', 'AWS_BUCKET', '2020-11-16 10:59:57', '2020-11-16 10:59:57'),
(1377, 'en', 'AWS_URL', 'AWS_URL', '2020-11-16 10:59:57', '2020-11-16 10:59:57'),
(1378, 'en', 'S3 File System Activation', 'S3 File System Activation', '2020-11-16 10:59:57', '2020-11-16 10:59:57'),
(1379, 'en', 'Your phone number', 'Your phone number', '2020-11-17 03:50:10', '2020-11-17 03:50:10'),
(1380, 'en', 'Zip File', 'Zip File', '2020-11-17 04:58:45', '2020-11-17 04:58:45'),
(1381, 'en', 'Install', 'Install', '2020-11-17 04:58:45', '2020-11-17 04:58:45'),
(1382, 'en', 'This version is not capable of installing Addons, Please update.', 'This version is not capable of installing Addons, Please update.', '2020-11-17 04:59:11', '2020-11-17 04:59:11'),
(1383, 'en', 'Order', 'Order', '2021-01-03 19:14:32', '2021-01-03 19:14:32'),
(1384, 'en', 'Search in menu', 'Search in menu', '2021-01-03 19:14:33', '2021-01-03 19:14:33'),
(1385, 'en', 'Uploaded Files', 'Uploaded Files', '2021-01-03 19:14:33', '2021-01-03 19:14:33'),
(1386, 'en', 'System', 'System', '2021-01-03 19:14:33', '2021-01-03 19:14:33'),
(1387, 'en', 'Server status', 'Server status', '2021-01-03 19:14:33', '2021-01-03 19:14:33'),
(1388, 'en', 'Nothing Found', 'Nothing Found', '2021-01-03 19:14:33', '2021-01-03 19:14:33'),
(1389, 'en', 'HTTPS Activation', 'HTTPS Activation', '2021-01-03 19:15:35', '2021-01-03 19:15:35'),
(1390, 'en', 'Maintenance Mode', 'Maintenance Mode', '2021-01-03 19:15:35', '2021-01-03 19:15:35'),
(1391, 'en', 'Maintenance Mode Activation', 'Maintenance Mode Activation', '2021-01-03 19:15:35', '2021-01-03 19:15:35'),
(1392, 'en', 'Classified Product Activate', 'Classified Product Activate', '2021-01-03 19:15:35', '2021-01-03 19:15:35'),
(1393, 'en', 'Classified Product', 'Classified Product', '2021-01-03 19:15:35', '2021-01-03 19:15:35'),
(1394, 'en', 'Business Related', 'Business Related', '2021-01-03 19:15:35', '2021-01-03 19:15:35'),
(1395, 'en', 'Vendor System Activation', 'Vendor System Activation', '2021-01-03 19:15:35', '2021-01-03 19:15:35'),
(1396, 'en', 'Wallet System Activation', 'Wallet System Activation', '2021-01-03 19:15:35', '2021-01-03 19:15:35'),
(1397, 'en', 'Coupon System Activation', 'Coupon System Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1398, 'en', 'Pickup Point Activation', 'Pickup Point Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1399, 'en', 'Conversation Activation', 'Conversation Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1400, 'en', 'Guest Checkout Activation', 'Guest Checkout Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1401, 'en', 'Category-based Commission', 'Category-based Commission', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1402, 'en', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1403, 'en', 'Set Commisssion Now', 'Set Commisssion Now', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1404, 'en', 'Email Verification', 'Email Verification', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1405, 'en', 'Payment Related', 'Payment Related', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1406, 'en', 'Paypal Payment Activation', 'Paypal Payment Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1407, 'en', 'You need to configure Paypal correctly to enable this feature', 'You need to configure Paypal correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1408, 'en', 'Stripe Payment Activation', 'Stripe Payment Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1409, 'en', 'SSlCommerz Activation', 'SSlCommerz Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1410, 'en', 'Instamojo Payment Activation', 'Instamojo Payment Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1411, 'en', 'You need to configure Instamojo Payment correctly to enable this feature', 'You need to configure Instamojo Payment correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1412, 'en', 'Razor Pay Activation', 'Razor Pay Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1413, 'en', 'You need to configure Razor correctly to enable this feature', 'You need to configure Razor correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1414, 'en', 'PayStack Activation', 'PayStack Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1415, 'en', 'You need to configure PayStack correctly to enable this feature', 'You need to configure PayStack correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1416, 'en', 'VoguePay Activation', 'VoguePay Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1417, 'en', 'You need to configure VoguePay correctly to enable this feature', 'You need to configure VoguePay correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1418, 'en', 'Payhere Activation', 'Payhere Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1419, 'en', 'Ngenius Activation', 'Ngenius Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1420, 'en', 'You need to configure Ngenius correctly to enable this feature', 'You need to configure Ngenius correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1421, 'en', 'Iyzico Activation', 'Iyzico Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1422, 'en', 'You need to configure iyzico correctly to enable this feature', 'You need to configure iyzico correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1423, 'en', 'Cash Payment Activation', 'Cash Payment Activation', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1424, 'en', 'Social Media Login', 'Social Media Login', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1425, 'en', 'Facebook login', 'Facebook login', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1426, 'en', 'You need to configure Facebook Client correctly to enable this feature', 'You need to configure Facebook Client correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1427, 'en', 'Google login', 'Google login', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1428, 'en', 'You need to configure Google Client correctly to enable this feature', 'You need to configure Google Client correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1429, 'en', 'Twitter login', 'Twitter login', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1430, 'en', 'You need to configure Twitter Client correctly to enable this feature', 'You need to configure Twitter Client correctly to enable this feature', '2021-01-03 19:15:36', '2021-01-03 19:15:36'),
(1431, 'en', 'We are Under Maintenance.', 'We are Under Maintenance.', '2021-01-03 19:15:47', '2021-01-03 19:15:47'),
(1432, 'en', 'We will be back soon!', 'We will be back soon!', '2021-01-03 19:15:47', '2021-01-03 19:15:47'),
(1433, 'en', 'Parent Category', 'Parent Category', '2021-01-03 19:54:42', '2021-01-03 19:54:42'),
(1434, 'en', 'Category Information', 'Category Information', '2021-01-03 19:55:55', '2021-01-03 19:55:55'),
(1435, 'en', 'No Parent', 'No Parent', '2021-01-03 19:55:55', '2021-01-03 19:55:55'),
(1436, 'en', 'Physical', 'Physical', '2021-01-03 19:55:55', '2021-01-03 19:55:55'),
(1437, 'en', 'Digital', 'Digital', '2021-01-03 19:55:55', '2021-01-03 19:55:55'),
(1438, 'en', '200x200', '200x200', '2021-01-03 19:55:55', '2021-01-03 19:55:55'),
(1439, 'en', '32x32', '32x32', '2021-01-03 19:55:55', '2021-01-03 19:55:55'),
(1440, 'en', 'Search your files', 'Search your files', '2021-01-03 19:56:35', '2021-01-03 19:56:35'),
(1441, 'en', 'Category has been inserted successfully', 'Category has been inserted successfully', '2021-01-03 19:57:48', '2021-01-03 19:57:48'),
(1442, 'en', 'Category has been deleted successfully', 'Category has been deleted successfully', '2021-01-03 19:58:02', '2021-01-03 19:58:02'),
(1443, 'en', 'Translatable', 'Translatable', '2021-01-03 22:18:24', '2021-01-03 22:18:24'),
(1444, 'en', 'Category has been updated successfully', 'Category has been updated successfully', '2021-01-03 22:20:16', '2021-01-03 22:20:16'),
(1445, 'en', 'Cookies Agreement', 'Cookies Agreement', '2021-01-03 22:30:54', '2021-01-03 22:30:54'),
(1446, 'en', 'Cookies Agreement Text', 'Cookies Agreement Text', '2021-01-03 22:30:54', '2021-01-03 22:30:54'),
(1447, 'en', 'Show Cookies Agreement?', 'Show Cookies Agreement?', '2021-01-03 22:30:54', '2021-01-03 22:30:54'),
(1448, 'en', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', '2021-01-04 01:19:28', '2021-01-04 01:19:28'),
(1449, 'en', 'Language has been deleted successfully', 'Language has been deleted successfully', '2021-01-10 03:54:38', '2021-01-10 03:54:38'),
(1450, 'en', 'Type key & Enter', 'Type key & Enter', '2021-01-10 03:55:19', '2021-01-10 03:55:19'),
(1451, 'sa', 'All Category', 'جميع الفئات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1452, 'sa', 'All', 'الجميع', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1453, 'sa', 'Flash Sale', 'عروض لحظية', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1454, 'sa', 'View More', 'عرض المزيد', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1455, 'sa', 'Add to wishlist', 'أضف إلى المفضلة', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1456, 'sa', 'Add to compare', 'أضف للمقارنة', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1457, 'sa', 'Add to cart', 'أضف إلى السلة', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1458, 'sa', 'Club Point', 'النقاط للمكافئات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1459, 'sa', 'Classified Ads', 'إعلانات مبوبة', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1460, 'sa', 'Used', 'مستخدم', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1461, 'sa', 'Top 10 Categories', 'أفضل 10 تصنيفات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1462, 'sa', 'View All Categories', 'عرض جميع الفئات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1463, 'sa', 'Top 10 Brands', 'أفضل 10 ماركات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1464, 'sa', 'View All Brands', 'عرض جميع الماركات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1465, 'sa', 'Terms & conditions', 'الشروط والضوابط', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1466, 'sa', 'Best Selling', 'الأفضل مبيعا', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1467, 'sa', 'Top 20', 'أفضل 20', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1468, 'sa', 'Featured Products', 'المنتجات المميزة', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1469, 'sa', 'Best Sellers', 'أفضل البائعين', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1470, 'sa', 'Visit Store', 'زيارة المتجر', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1471, 'sa', 'Popular Suggestions', 'أشهر التوصيات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1472, 'sa', 'Category Suggestions', 'الفئات الموصى بها', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1473, 'sa', 'Automobile & Motorcycle', 'السيارات والدراجات النارية', '2021-01-10 04:04:13', '2021-01-24 03:58:37'),
(1474, 'sa', 'Price range', 'معدل الأسعار', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1475, 'sa', 'Filter by color', 'فلترة حسب اللون', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1476, 'sa', 'Home', 'الرئيسية', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1477, 'sa', 'Newest', 'الأحدث', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1478, 'sa', 'Oldest', 'الأقدم', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1479, 'sa', 'Price low to high', 'الأسعار من الأقل إلى الأكثر', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1480, 'sa', 'Price high to low', 'الأسعار من الأكثر إلى الأقل', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1481, 'sa', 'Brands', 'الماركات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1482, 'sa', 'All Brands', 'جميع الماركات', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1483, 'sa', 'All Sellers', 'جميع البائعين', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1484, 'sa', 'Inhouse product', 'منتجات داخل المتجر الرئيسي', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1485, 'sa', 'Message Seller', 'راسل البائع', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1486, 'sa', 'Price', 'السعر', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1487, 'sa', 'Discount Price', 'السعر بعد الخصم', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1488, 'sa', 'Color', 'اللون', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1489, 'sa', 'Quantity', 'الكمية', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1490, 'sa', 'available', 'متاح', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1491, 'sa', 'Total Price', 'السعر الكلي', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1492, 'sa', 'Out of Stock', 'غير متوفر بالمخزن', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1493, 'sa', 'Refund', 'إرجاع', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1494, 'sa', 'Share', 'مشاركة', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1495, 'sa', 'Sold By', 'مُباع', '2021-01-10 04:04:13', '2021-01-24 03:58:37'),
(1496, 'sa', 'customer reviews', 'تقييم الزبون', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1497, 'sa', 'Top Selling Products', 'المنتجات الأعلى مبيعا', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1498, 'sa', 'Description', 'الوصف', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1499, 'sa', 'Video', 'فيديو', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1500, 'sa', 'Reviews', 'المراجعات والتقييم', '2021-01-10 04:04:13', '2021-01-24 03:58:37'),
(1501, 'en', 'Translations updated for ', 'Translations updated for ', '2021-01-10 04:04:13', '2021-01-10 04:04:13'),
(1502, 'sa', 'Return to shop', 'العودة للمتجر', '2021-01-10 04:06:10', '2021-01-24 17:16:29'),
(1503, 'sa', 'Return Policy', 'سياسة الإرجاع', '2021-01-10 04:06:10', '2021-01-10 04:06:10'),
(1504, 'sa', 'Support Policy', 'سياسة الدعم', '2021-01-10 04:07:50', '2021-01-10 04:07:50'),
(1505, 'sa', 'Privacy Policy', 'سياسة الخصوصية', '2021-01-10 04:08:26', '2021-01-10 04:08:26'),
(1506, 'sa', 'Be a Seller', 'سجٌل كبائع', '2021-01-10 04:09:54', '2021-01-10 04:09:54'),
(1507, 'sa', 'Admin can not be a seller', 'المدير لا يمكن أن يصبح بائع', '2021-01-10 04:09:54', '2021-01-10 04:09:54'),
(1508, 'sa', 'Apply Now', 'سجل الآن', '2021-01-10 04:10:21', '2021-01-10 04:10:21'),
(1509, 'sa', 'My Account', 'حسابي', '2021-01-10 04:11:02', '2021-01-10 04:11:02'),
(1510, 'sa', 'Or Login With', 'أو سجل الدخول من خلال', '2021-01-10 04:17:25', '2021-01-10 04:17:25'),
(1511, 'sa', 'Login to your account.', 'سجل الدخول إلى حسابك', '2021-01-10 04:17:25', '2021-01-10 04:17:25'),
(1512, 'sa', 'Login into your facebook page', 'سجل الدخول إلى صفحة الفيسبوك الخاصة بك', '2021-01-10 04:17:25', '2021-01-10 04:17:25'),
(1513, 'sa', 'Will be used in admin panel topbar in mobile + Admin login page', 'سيكون مستخدما في شريط التحكم العلوي وكذلك في صفحة الدخول للإدارة', '2021-01-10 04:17:25', '2021-01-10 04:17:25'),
(1514, 'sa', 'Admin login page background', 'تسجيل الدخول إلى صفحة لوحة التحكم', '2021-01-10 04:17:25', '2021-01-10 04:17:25'),
(1515, 'sa', 'Login with Google', 'تسجيل الدخول من خلال جوجل', '2021-01-10 04:17:25', '2021-01-10 04:17:25'),
(1516, 'sa', 'Login with Facebook', 'تسجيل الدخول من خلال فيسبوك', '2021-01-10 04:17:25', '2021-01-10 04:17:25'),
(1517, 'sa', 'Login with Twitter', 'تسجيل الدخول من خلال تويتر', '2021-01-10 04:17:25', '2021-01-10 04:17:25'),
(1518, 'sa', 'Back to Login', 'العودة إلى الدخول', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1519, 'sa', 'Social media Logins', 'تسجيل الدخول من خلال السوشال ميديا', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1520, 'sa', 'Login', 'الدخول', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1521, 'sa', 'Please login first', 'الرجاء تسجيل الدخول أولا', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1522, 'sa', 'You have successfully completed the updating process. Please Login to continue', 'لقد تمكنت من إتمام التعديلات بنجاح يرجى تسجيل الدخول للإستمرار', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1523, 'sa', 'Login to Admin panel', 'تسجيل الدخول إلى لوحة التحكم', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1524, 'sa', 'Social Media Login', 'تسجيل الدخول من خلال السوشال ميديا', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1525, 'sa', 'Facebook login', 'تسجيل الدخول من خلال الفيسبوك', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1526, 'sa', 'Google login', 'تسجيل الدخول من خلال جوجل', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1527, 'sa', 'Twitter login', 'تسجيل الدخول من خلال تويتر', '2021-01-10 04:17:26', '2021-01-10 04:17:26'),
(1528, 'sa', 'Order History', 'تواريخ الطلبات', '2021-01-10 04:18:06', '2021-01-10 04:18:53'),
(1529, 'sa', 'My Wishlist', 'قائمتي المفضلة', '2021-01-10 04:19:33', '2021-01-10 04:19:33'),
(1530, 'sa', 'Track Order', 'تتبع الطلبات', '2021-01-10 04:20:09', '2021-01-10 04:20:09'),
(1531, 'sa', 'Contact Info Widget', 'واجهة (ويدجيت) معلومات التواصل', '2021-01-10 04:21:13', '2021-01-10 04:21:13'),
(1532, 'sa', 'Contact Info', 'معلومات التواصل', '2021-01-10 04:21:13', '2021-01-10 04:21:13'),
(1533, 'sa', 'Add New Address', 'إضافة عنوان جديد', '2021-01-10 04:24:09', '2021-01-24 16:57:40'),
(1534, 'sa', 'New Address', 'عنوان جديد', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1535, 'sa', 'Your Address', 'عنوانك', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1536, 'sa', 'Shipping Address', 'عنوان الشحن', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1537, 'sa', 'Footer contact address', 'معلومات الشحن في الفوتر', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1538, 'sa', 'Email Address', 'عنوان البريد الإلكتروني', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1539, 'sa', 'Default Shipping Address', 'عنوان الشحن الإفتراضي', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1540, 'sa', 'Enter your email address to recover your password.', 'أدخل عنوان بريدك الإلكتروني لتتمكن من إستعادة كلمة المرور', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1541, 'sa', 'Contact address', 'عنوان الإتصال', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1542, 'sa', 'Your Email Address', 'عنوان بريدك الإلكتروني', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1543, 'sa', 'Address', 'العنوان', '2021-01-10 04:24:09', '2021-01-10 04:24:09'),
(1544, 'sa', 'Your Phone', 'رقم هاتفك', '2021-01-10 04:26:16', '2021-01-10 04:26:16'),
(1545, 'sa', 'Cellphones & Tabs', 'الهاتف النقال والتاب', '2021-01-10 04:26:16', '2021-01-10 04:26:16'),
(1546, 'sa', 'Footer contact phone', 'رقم الهاتف في الفوتر', '2021-01-10 04:26:16', '2021-01-10 04:26:16'),
(1547, 'sa', 'Click to show phone number', 'إضغط لإظهار رقم الهاتف', '2021-01-10 04:26:16', '2021-01-10 04:26:16'),
(1548, 'sa', 'Email or Phone', 'البريد الإلكتروني أو رقم الموبايل', '2021-01-10 04:26:16', '2021-01-10 04:26:16'),
(1549, 'sa', 'Contact phone', 'تلفون الإتصال', '2021-01-10 04:26:16', '2021-01-10 04:26:16'),
(1550, 'sa', 'Phone', 'الهاتف', '2021-01-10 04:26:16', '2021-01-10 04:26:16'),
(1551, 'sa', 'Your phone number', 'رقم تلفونك', '2021-01-10 04:26:16', '2021-01-10 04:26:16'),
(1552, 'sa', 'Change your email', 'تغيير بريدك الإلكتروني', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1553, 'sa', 'Your Email', 'إيميلك الإلكتروني', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1554, 'sa', 'Sending Email...', 'إرسال بريد إلكتروني', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1555, 'sa', 'Update Email', 'تعديل البريد الإلكتروني', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1556, 'sa', 'MERCHANT EMAIL', 'بريد إلكتروني تجاري MERCHANT EMAIL', '2021-01-10 04:29:32', '2021-01-24 18:29:27'),
(1557, 'sa', 'Footer contact email', 'البريد الإلكتروني للتواصل في الفوتر', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1558, 'sa', 'Use Email Instead', 'إستخدام بريد إلكتروني بديل', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1559, 'sa', 'Contact email', 'البريد الإلكتروني للتواصل', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1560, 'sa', 'Invalid email or password', 'بريد إلكتروني خاطيء أو كلمة مرور خاطئة', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1561, 'sa', 'Please Configure SMTP Setting to work all email sending funtionality', 'يرجى تكوين إعداد SMTP للعمل على جميع وظائف إرسال البريد الإلكتروني', '2021-01-10 04:29:32', '2021-01-25 02:07:25'),
(1562, 'sa', 'Email', 'البريد الإلكتروني', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1563, 'sa', 'Email Verification', 'تفعيل البريد الإلكتروني', '2021-01-10 04:29:32', '2021-01-10 04:29:32'),
(1564, 'sa', 'All Subscribers', 'جميع المشتركين بالقائمة البريدية', '2021-01-10 04:30:58', '2021-01-10 04:30:58'),
(1565, 'sa', 'Subscribers', 'المشتركين', '2021-01-10 04:30:58', '2021-01-10 04:30:58'),
(1566, 'sa', 'Subscribe', 'إشترك بالقائمة', '2021-01-10 04:30:58', '2021-01-10 04:30:58'),
(1567, 'sa', 'Affiliate Registration Form', 'نموذج التسجيل كأفلييت', '2021-01-10 04:32:07', '2021-01-10 04:32:07'),
(1568, 'sa', 'Registration', 'التسجيل', '2021-01-10 04:32:07', '2021-01-10 04:32:07'),
(1569, 'sa', 'I am shopping for...', 'إبحث في الفئات والمنتجات المتوفرة بالمتجر', '2021-01-10 04:33:45', '2021-01-10 04:33:45'),
(1570, 'sa', 'Reset Compare List', 'إعادة  إعداد قائمة المقارنة', '2021-01-10 04:35:18', '2021-01-10 04:35:18'),
(1571, 'sa', 'Compare', 'المقارنة', '2021-01-10 04:35:18', '2021-01-10 04:35:18'),
(1572, 'sa', 'Item has been added to compare list', 'تمت إضافة المنتج للمقارنة', '2021-01-10 04:35:18', '2021-01-10 04:35:18'),
(1573, 'sa', 'Item has been added to wishlist', 'تمت إضافة المنتج إلى قائمة المفضلة لديك', '2021-01-10 04:36:55', '2021-01-10 04:36:55'),
(1574, 'sa', 'in your wishlist', 'في قائمة المفضلة لديك', '2021-01-10 04:36:55', '2021-01-10 04:36:55'),
(1575, 'sa', 'Item has been renoved from wishlist', 'تم حذف المنتج من قائمة المفضلة', '2021-01-10 04:36:55', '2021-01-10 04:36:55'),
(1576, 'sa', 'Products wishlist', 'المنتجات المفضلة', '2021-01-10 04:36:55', '2021-01-10 04:36:55'),
(1577, 'sa', 'Wishlist', 'المفضلة', '2021-01-10 04:36:55', '2021-01-10 04:36:55'),
(1578, 'sa', 'Item added to your cart!', 'تمت إضافة المنتج إلى سلة المشتريات الخاصة بك', '2021-01-10 04:39:38', '2021-01-10 04:39:38'),
(1579, 'sa', 'Cart Items', 'عناصر عربة التسوق', '2021-01-10 04:39:38', '2021-01-24 17:16:29'),
(1580, 'sa', '1. My Cart', '1. سلة المشتريات الخاصة بي', '2021-01-10 04:39:38', '2021-01-24 17:16:29'),
(1581, 'sa', 'View cart', 'عرض سلة المشتريات', '2021-01-10 04:39:38', '2021-01-10 04:39:38'),
(1582, 'sa', 'in your cart', 'في سلة المشتريات الخاصة بك', '2021-01-10 04:39:38', '2021-01-10 04:39:38'),
(1583, 'sa', 'Add Your Cart Base Coupon', 'أضف قسيمة الكوبون إلى سلة التسوق الخاصة بك', '2021-01-10 04:39:38', '2021-01-10 04:39:38'),
(1584, 'sa', 'Cart', 'السلة', '2021-01-10 04:39:38', '2021-01-10 04:39:38'),
(1585, 'sa', 'Your Cart is empty', 'سلة المشتريات الخاصة بك فارغة', '2021-01-10 04:39:38', '2021-01-10 04:39:38'),
(1586, 'sa', 'All categories', 'جميع الفئات', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1587, 'sa', 'Featured categories updated successfully', 'تم تحديث الفئات المميزة بنجاح', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1588, 'sa', 'All Subcategories', 'جميع الفئات الفرعية', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1589, 'sa', 'Sub-Categories', 'الفئات الفرعية', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1590, 'sa', 'All Sub Subcategories', 'جميع الفئات الفرعية', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1591, 'sa', 'Sub-Sub-categories', 'الفئات الفرع فرعية', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1592, 'sa', 'Home Categories', 'الفئات الرئيسية', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1593, 'sa', 'Top Categories (Max 10)', 'أعلى الفئات (أفضل 10)', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1594, 'sa', 'Categories', 'الفئات', '2021-01-10 04:57:47', '2021-01-10 04:57:47'),
(1595, 'sa', 'See All', 'عرض الكل', '2021-01-10 04:58:12', '2021-01-10 04:58:31'),
(1596, 'en', 'Ok. I Understood', 'Ok. I Understood', '2021-01-10 05:02:44', '2021-01-10 05:02:44'),
(1597, 'sa', 'AUTH TOKEN', 'AUTH TOKEN', '2021-01-10 05:03:22', '2021-01-24 18:29:27'),
(1598, 'sa', 'IM AUTH TOKEN', 'IM AUTH TOKEN', '2021-01-10 05:03:22', '2021-01-24 18:29:27'),
(1599, 'sa', 'Facebook Chat Setting', 'إعداد دردشة Facebook', '2021-01-10 05:03:22', '2021-01-24 19:25:40'),
(1600, 'sa', 'Facebook Page ID', 'معرف صفحة الفيسبوك Facebook Page ID', '2021-01-10 05:03:22', '2021-01-24 19:25:40'),
(1601, 'sa', 'Please be carefull when you are configuring Facebook chat. For incorrect configuration you will not get messenger icon on your user-end site.', 'يرجى توخي الحذر عند تكوين دردشة Facebook. للتكوين غير الصحيح ، لن تحصل على أيقونة messenger على الموقع المستخدم الخاص بك.', '2021-01-10 05:03:22', '2021-01-24 19:25:40'),
(1602, 'sa', 'Find the About option of your facebook page', 'ابحث عن خيار \"حول\" في صفحتك على Facebook', '2021-01-10 05:03:22', '2021-01-24 19:25:40'),
(1603, 'sa', 'At the very bottom, you can find the \\“Facebook Page ID\\”', 'في الجزء السفلي ، يمكنك العثور على \\ \"معرف صفحة Facebook \\\"', '2021-01-10 05:03:22', '2021-01-24 19:25:40'),
(1604, 'sa', 'Facebook', 'فيسبوك', '2021-01-10 05:03:22', '2021-01-24 21:30:00'),
(1605, 'sa', 'TWILIO AUTH TOKEN', 'TWILIO AUTH TOKEN', '2021-01-10 05:03:22', '2021-01-25 02:07:25'),
(1606, 'sa', 'SSL SMS API TOKEN', 'SSL SMS API TOKEN', '2021-01-10 05:03:22', '2021-01-25 02:07:25'),
(1607, 'sa', 'Facebook Chat', 'دردشة الفيسبوك', '2021-01-10 05:03:22', '2021-01-25 03:15:44'),
(1608, 'sa', 'The page you are looking for has not been found on our server.', 'لم يتم العثور على الصفحة التي تبحث عنها على خادمنا.', '2021-01-10 05:03:22', '2021-01-25 03:22:10'),
(1609, 'sa', 'You need to configure Facebook Client correctly to enable this feature', 'You need to configure Facebook Client correctly to enable this feature', '2021-01-10 05:03:22', '2021-01-25 03:54:00'),
(1610, 'sa', 'Cookies Agreement', 'اتفاقية ملفات تعريف الارتباط كوكيز', '2021-01-10 05:03:22', '2021-01-25 00:50:52'),
(1611, 'sa', 'Cookies Agreement Text', 'نص اتفاقية ملفات تعريف الارتباط الكوكيز', '2021-01-10 05:03:22', '2021-01-25 00:50:52'),
(1612, 'sa', 'Show Cookies Agreement?', 'عرض اتفاقية ملفات تعريف الارتباط؟ الكوكيز', '2021-01-10 05:03:22', '2021-01-25 00:50:52'),
(1613, 'sa', 'Ok. I Understood', 'موافق', '2021-01-10 05:03:22', '2021-01-10 05:03:22'),
(1614, 'en', 'Install/Update Addon', 'Install/Update Addon', '2021-01-10 08:33:10', '2021-01-10 08:33:10'),
(1615, 'en', 'No Addon Installed', 'No Addon Installed', '2021-01-10 08:33:10', '2021-01-10 08:33:10'),
(1616, 'en', 'Install/Update', 'Install/Update', '2021-01-10 08:33:15', '2021-01-10 08:33:15'),
(1621, 'en', 'Addon nstalled successfully', 'Addon nstalled successfully', '2021-01-10 08:35:40', '2021-01-10 08:35:40'),
(1622, 'en', 'Use Phone Instead', 'Use Phone Instead', '2021-01-10 09:04:05', '2021-01-10 09:04:05'),
(1623, 'en', 'Phone Verification', 'Phone Verification', '2021-01-10 09:04:33', '2021-01-10 09:04:33'),
(1624, 'en', 'Resend Code', 'Resend Code', '2021-01-10 09:04:33', '2021-01-10 09:04:33'),
(1625, 'en', 'Registration successfull.', 'Registration successfull.', '2021-01-10 09:11:04', '2021-01-10 09:11:04'),
(1626, 'en', 'All Customers', 'All Customers', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1627, 'en', 'Type email or name & Enter', 'Type email or name & Enter', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1628, 'en', 'Package', 'Package', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1629, 'en', 'Wallet Balance', 'Wallet Balance', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1630, 'en', 'Log in as this Customer', 'Log in as this Customer', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1631, 'en', 'Ban this Customer', 'Ban this Customer', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1632, 'en', 'Do you really want to ban this Customer?', 'Do you really want to ban this Customer?', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1633, 'en', 'Proceed!', 'Proceed!', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1634, 'en', 'Do you really want to unban this Customer?', 'Do you really want to unban this Customer?', '2021-01-10 09:14:31', '2021-01-10 09:14:31'),
(1635, 'en', 'All uploaded files', 'All uploaded files', '2021-01-11 20:11:53', '2021-01-11 20:11:53'),
(1636, 'en', 'Upload New File', 'Upload New File', '2021-01-11 20:11:53', '2021-01-11 20:11:53'),
(1637, 'en', 'All files', 'All files', '2021-01-11 20:11:53', '2021-01-11 20:11:53'),
(1638, 'en', 'Search', 'Search', '2021-01-11 20:11:53', '2021-01-11 20:11:53'),
(1639, 'en', 'Details Info', 'Details Info', '2021-01-11 20:11:53', '2021-01-11 20:11:53'),
(1640, 'en', 'Copy Link', 'Copy Link', '2021-01-11 20:11:53', '2021-01-11 20:11:53'),
(1641, 'en', 'Are you sure to delete this file?', 'Are you sure to delete this file?', '2021-01-11 20:11:54', '2021-01-11 20:11:54'),
(1642, 'en', 'File Info', 'File Info', '2021-01-11 20:11:54', '2021-01-11 20:11:54'),
(1643, 'en', 'Link copied to clipboard', 'Link copied to clipboard', '2021-01-11 20:11:54', '2021-01-11 20:11:54'),
(1644, 'en', 'Oops, unable to copy', 'Oops, unable to copy', '2021-01-11 20:11:54', '2021-01-11 20:11:54'),
(1645, 'en', 'Server information', 'Server information', '2021-01-11 20:14:13', '2021-01-11 20:14:13'),
(1646, 'en', 'Current Version', 'Current Version', '2021-01-11 20:14:13', '2021-01-11 20:14:13'),
(1647, 'en', 'Required Version', 'Required Version', '2021-01-11 20:14:13', '2021-01-11 20:14:13'),
(1648, 'en', 'php.ini Config', 'php.ini Config', '2021-01-11 20:14:13', '2021-01-11 20:14:13'),
(1649, 'en', 'Config Name', 'Config Name', '2021-01-11 20:14:14', '2021-01-11 20:14:14'),
(1650, 'en', 'Current', 'Current', '2021-01-11 20:14:14', '2021-01-11 20:14:14'),
(1651, 'en', 'Recommended', 'Recommended', '2021-01-11 20:14:14', '2021-01-11 20:14:14'),
(1652, 'en', 'Extensions information', 'Extensions information', '2021-01-11 20:14:14', '2021-01-11 20:14:14'),
(1653, 'en', 'Extension Name', 'Extension Name', '2021-01-11 20:14:14', '2021-01-11 20:14:14'),
(1654, 'en', 'Filesystem Permissions', 'Filesystem Permissions', '2021-01-11 20:14:14', '2021-01-11 20:14:14'),
(1655, 'en', 'File or Folder', 'File or Folder', '2021-01-11 20:14:14', '2021-01-11 20:14:14'),
(1656, 'sa', 'Be an affiliate partner', 'كن شريك أفلييت معنا', '2021-01-11 21:03:16', '2021-01-11 21:03:16'),
(1657, 'sa', 'Logout', 'تسجيل خروج', '2021-01-11 21:03:46', '2021-01-11 21:03:46'),
(1658, 'sa', 'My Panel', 'لوحة التحكم خاصتي', '2021-01-11 21:04:30', '2021-01-11 21:04:30'),
(1659, 'en', 'Something went wrong!', 'Something went wrong!', '2021-01-12 17:46:02', '2021-01-12 17:46:02'),
(1660, 'en', 'Sorry for the inconvenience, but we\'re working on it.', 'Sorry for the inconvenience, but we\'re working on it.', '2021-01-12 17:46:03', '2021-01-12 17:46:03'),
(1661, 'en', 'Error code', 'Error code', '2021-01-12 17:46:03', '2021-01-12 17:46:03'),
(1662, 'en', 'Add New Brand', 'Add New Brand', '2021-01-12 18:35:24', '2021-01-12 18:35:24'),
(1663, 'en', '120x80', '120x80', '2021-01-12 18:35:24', '2021-01-12 18:35:24'),
(1664, 'en', 'All Attributes', 'All Attributes', '2021-01-12 18:35:45', '2021-01-12 18:35:45'),
(1665, 'en', 'Add New Attribute', 'Add New Attribute', '2021-01-12 18:35:45', '2021-01-12 18:35:45'),
(1666, 'en', 'Filter by date', 'Filter by date', '2021-01-12 18:36:34', '2021-01-12 18:36:34'),
(1667, 'en', 'Support Desk', 'Support Desk', '2021-01-12 18:37:43', '2021-01-12 18:37:43'),
(1668, 'en', 'Type ticket code & Enter', 'Type ticket code & Enter', '2021-01-12 18:37:43', '2021-01-12 18:37:43'),
(1669, 'en', 'User', 'User', '2021-01-12 18:37:43', '2021-01-12 18:37:43'),
(1670, 'en', 'Last reply', 'Last reply', '2021-01-12 18:37:43', '2021-01-12 18:37:43'),
(1671, 'en', 'Conversation is disabled at this moment', 'Conversation is disabled at this moment', '2021-01-12 18:37:51', '2021-01-12 18:37:51'),
(1672, 'en', 'Basic Affiliate', 'Basic Affiliate', '2021-01-12 18:39:01', '2021-01-12 18:39:01'),
(1673, 'en', 'User Registration & First Purchase', 'User Registration & First Purchase', '2021-01-12 18:39:01', '2021-01-12 18:39:01'),
(1674, 'en', 'Product Sharing Affiliate', 'Product Sharing Affiliate', '2021-01-12 18:39:01', '2021-01-12 18:39:01'),
(1675, 'en', 'Product Sharing and Purchasing', 'Product Sharing and Purchasing', '2021-01-12 18:39:01', '2021-01-12 18:39:01'),
(1676, 'en', 'Product Sharing Affiliate (Category Wise)', 'Product Sharing Affiliate (Category Wise)', '2021-01-12 18:39:01', '2021-01-12 18:39:01'),
(1677, 'en', 'Approved sellers updated successfully', 'Approved sellers updated successfully', '2021-01-12 18:39:42', '2021-01-12 18:39:42'),
(1678, 'en', 'Refferal Users', 'Refferal Users', '2021-01-12 18:40:08', '2021-01-12 18:40:08'),
(1679, 'en', 'Reffered By', 'Reffered By', '2021-01-12 18:40:08', '2021-01-12 18:40:08'),
(1680, 'en', 'Affiliate Withdraw Request', 'Affiliate Withdraw Request', '2021-01-12 18:40:23', '2021-01-12 18:40:23'),
(1681, 'en', 'Affiliate Withdraw Request Reject', 'Affiliate Withdraw Request Reject', '2021-01-12 18:40:23', '2021-01-12 18:40:23'),
(1682, 'en', 'Are you sure, You want to reject this?', 'Are you sure, You want to reject this?', '2021-01-12 18:40:23', '2021-01-12 18:40:23'),
(1683, 'en', 'Account Name', 'Account Name', '2021-01-12 18:41:03', '2021-01-12 18:41:03'),
(1684, 'en', 'Account Number', 'Account Number', '2021-01-12 18:41:03', '2021-01-12 18:41:03'),
(1685, 'en', 'Routing Number', 'Routing Number', '2021-01-12 18:41:03', '2021-01-12 18:41:03'),
(1686, 'en', 'Offline Wallet Recharge Requests', 'Offline Wallet Recharge Requests', '2021-01-12 18:41:27', '2021-01-12 18:41:27'),
(1687, 'en', 'Method', 'Method', '2021-01-12 18:41:27', '2021-01-12 18:41:27'),
(1688, 'en', 'TXN ID', 'TXN ID', '2021-01-12 18:41:27', '2021-01-12 18:41:27'),
(1689, 'en', 'Money has been added successfully', 'Money has been added successfully', '2021-01-12 18:41:27', '2021-01-12 18:41:27'),
(1690, 'en', 'Offline Seller Package Payment Requests', 'Offline Seller Package Payment Requests', '2021-01-12 18:41:46', '2021-01-12 18:41:46'),
(1691, 'en', 'Reciept', 'Reciept', '2021-01-12 18:41:46', '2021-01-12 18:41:46'),
(1692, 'en', 'Offline Seller Package Payment approved successfully', 'Offline Seller Package Payment approved successfully', '2021-01-12 18:41:46', '2021-01-12 18:41:46'),
(1693, 'en', 'Paytm Credential', 'Paytm Credential', '2021-01-12 18:42:20', '2021-01-12 18:42:20'),
(1694, 'en', 'PAYTM ENVIRONMENT', 'PAYTM ENVIRONMENT', '2021-01-12 18:42:20', '2021-01-12 18:42:20'),
(1695, 'en', 'PAYTM MERCHANT ID', 'PAYTM MERCHANT ID', '2021-01-12 18:42:20', '2021-01-12 18:42:20'),
(1696, 'en', 'PAYTM MERCHANT KEY', 'PAYTM MERCHANT KEY', '2021-01-12 18:42:20', '2021-01-12 18:42:20'),
(1697, 'en', 'PAYTM MERCHANT WEBSITE', 'PAYTM MERCHANT WEBSITE', '2021-01-12 18:42:20', '2021-01-12 18:42:20'),
(1698, 'en', 'PAYTM CHANNEL', 'PAYTM CHANNEL', '2021-01-12 18:42:20', '2021-01-12 18:42:20'),
(1699, 'en', 'PAYTM INDUSTRY TYPE', 'PAYTM INDUSTRY TYPE', '2021-01-12 18:42:20', '2021-01-12 18:42:20'),
(1700, 'en', 'MIMO OTP', 'MIMO OTP', '2021-01-12 18:45:04', '2021-01-12 18:45:04'),
(1701, 'en', 'Sendmail', 'Sendmail', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1702, 'en', 'Mailgun', 'Mailgun', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1703, 'en', 'MAIL HOST', 'MAIL HOST', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1704, 'en', 'MAIL PORT', 'MAIL PORT', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1705, 'en', 'MAIL USERNAME', 'MAIL USERNAME', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1706, 'en', 'MAIL PASSWORD', 'MAIL PASSWORD', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1707, 'en', 'MAIL ENCRYPTION', 'MAIL ENCRYPTION', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1708, 'en', 'MAIL FROM ADDRESS', 'MAIL FROM ADDRESS', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1709, 'en', 'MAIL FROM NAME', 'MAIL FROM NAME', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1710, 'en', 'MAILGUN DOMAIN', 'MAILGUN DOMAIN', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1711, 'en', 'MAILGUN SECRET', 'MAILGUN SECRET', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1712, 'en', 'Save Configuration', 'Save Configuration', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1713, 'en', 'Test SMTP configuration', 'Test SMTP configuration', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1714, 'en', 'Enter your email address', 'Enter your email address', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1715, 'en', 'Send test email', 'Send test email', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1716, 'en', 'Instruction', 'Instruction', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1717, 'en', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1718, 'en', 'For Non-SSL', 'For Non-SSL', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1719, 'en', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1720, 'en', 'Set Mail Host according to your server Mail Client Manual Settings', 'Set Mail Host according to your server Mail Client Manual Settings', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1721, 'en', 'Set Mail port as 587', 'Set Mail port as 587', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1722, 'en', 'Set Mail Encryption as ssl if you face issue with tls', 'Set Mail Encryption as ssl if you face issue with tls', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1723, 'en', 'For SSL', 'For SSL', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1724, 'en', 'Set Mail port as 465', 'Set Mail port as 465', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1725, 'en', 'Set Mail Encryption as ssl', 'Set Mail Encryption as ssl', '2021-01-12 18:58:12', '2021-01-12 18:58:12'),
(1726, 'en', 'Brand Information', 'Brand Information', '2021-01-12 18:58:32', '2021-01-12 18:58:32'),
(1727, 'en', 'Brand has been updated successfully', 'Brand has been updated successfully', '2021-01-12 18:58:55', '2021-01-12 18:58:55'),
(1728, 'en', 'This is used for search. Input those words by which cutomer can find this product.', 'This is used for search. Input those words by which cutomer can find this product.', '2021-01-13 09:47:43', '2021-01-13 09:47:43'),
(1729, 'en', 'These images are visible in product details page gallery. Use 600x600 sizes images.', 'These images are visible in product details page gallery. Use 600x600 sizes images.', '2021-01-13 09:47:43', '2021-01-13 09:47:43'),
(1730, 'en', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', '2021-01-13 09:47:43', '2021-01-13 09:47:43'),
(1731, 'en', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', '2021-01-13 09:47:43', '2021-01-13 09:47:43'),
(1732, 'en', 'Save Product', 'Save Product', '2021-01-13 09:47:43', '2021-01-13 09:47:43'),
(1733, 'en', 'Product has been inserted successfully', 'Product has been inserted successfully', '2021-01-13 09:55:13', '2021-01-13 09:55:13'),
(1734, 'en', 'Back to uploaded files', 'Back to uploaded files', '2021-01-13 10:37:23', '2021-01-13 10:37:23'),
(1735, 'en', 'Drag & drop your files', 'Drag & drop your files', '2021-01-13 10:37:23', '2021-01-13 10:37:23'),
(1736, 'en', 'Iyzico Credential', 'Iyzico Credential', '2021-01-13 10:39:58', '2021-01-13 10:39:58'),
(1737, 'en', 'IYZICO_API_KEY', 'IYZICO_API_KEY', '2021-01-13 10:39:58', '2021-01-13 10:39:58'),
(1738, 'en', 'IYZICO_SECRET_KEY', 'IYZICO_SECRET_KEY', '2021-01-13 10:39:58', '2021-01-13 10:39:58'),
(1739, 'en', 'IYZICO Sandbox Mode', 'IYZICO Sandbox Mode', '2021-01-13 10:39:58', '2021-01-13 10:39:58'),
(1740, 'en', '1. Flat rate shipping cost is applicable if Flat rate shipping is enabled.', '1. Flat rate shipping cost is applicable if Flat rate shipping is enabled.', '2021-01-13 17:35:25', '2021-01-13 17:35:25'),
(1741, 'en', '1. Shipping cost for admin is applicable if Seller wise shipping cost is enabled.', '1. Shipping cost for admin is applicable if Seller wise shipping cost is enabled.', '2021-01-13 17:35:25', '2021-01-13 17:35:25'),
(1742, 'en', 'Facebook Pixel Setting', 'Facebook Pixel Setting', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1743, 'en', 'Facebook Pixel', 'Facebook Pixel', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1744, 'en', 'Facebook Pixel ID', 'Facebook Pixel ID', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1745, 'en', 'Please be carefull when you are configuring Facebook pixel.', 'Please be carefull when you are configuring Facebook pixel.', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1746, 'en', 'Log in to Facebook and go to your Ads Manager account', 'Log in to Facebook and go to your Ads Manager account', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1747, 'en', 'Open the Navigation Bar and select Events Manager', 'Open the Navigation Bar and select Events Manager', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1748, 'en', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1749, 'en', 'Google Analytics Setting', 'Google Analytics Setting', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1750, 'en', 'Google Analytics', 'Google Analytics', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1751, 'en', 'Tracking ID', 'Tracking ID', '2021-01-13 17:38:24', '2021-01-13 17:38:24'),
(1752, 'en', 'Google Login Credential', 'Google Login Credential', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1753, 'en', 'Client ID', 'Client ID', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1754, 'en', 'Google Client ID', 'Google Client ID', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1755, 'en', 'Client Secret', 'Client Secret', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1756, 'en', 'Google Client Secret', 'Google Client Secret', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1757, 'en', 'Facebook Login Credential', 'Facebook Login Credential', '2021-01-13 17:39:21', '2021-01-13 17:39:21');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(1758, 'en', 'App ID', 'App ID', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1759, 'en', 'Facebook Client ID', 'Facebook Client ID', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1760, 'en', 'App Secret', 'App Secret', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1761, 'en', 'Facebook Client Secret', 'Facebook Client Secret', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1762, 'en', 'Twitter Login Credential', 'Twitter Login Credential', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1763, 'en', 'Twitter Client ID', 'Twitter Client ID', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1764, 'en', 'Twitter Client Secret', 'Twitter Client Secret', '2021-01-13 17:39:21', '2021-01-13 17:39:21'),
(1765, 'en', 'Your Shop has been created successfully!', 'Your Shop has been created successfully!', '2021-01-13 17:46:38', '2021-01-13 17:46:38'),
(1766, 'en', 'Shop Logo', 'Shop Logo', '2021-01-13 17:46:39', '2021-01-13 17:46:39'),
(1767, 'en', 'Shop Address', 'Shop Address', '2021-01-13 17:46:39', '2021-01-13 17:46:39'),
(1768, 'en', 'Banner Settings', 'Banner Settings', '2021-01-13 17:46:39', '2021-01-13 17:46:39'),
(1769, 'en', 'Banners', 'Banners', '2021-01-13 17:46:39', '2021-01-13 17:46:39'),
(1770, 'en', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', '2021-01-13 17:46:39', '2021-01-13 17:46:39'),
(1771, 'en', 'Insert link with https ', 'Insert link with https ', '2021-01-13 17:46:39', '2021-01-13 17:46:39'),
(1772, 'en', 'Add New Seller', 'Add New Seller', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1773, 'en', 'Filter by Approval', 'Filter by Approval', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1774, 'en', 'Non-Approved', 'Non-Approved', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1775, 'en', 'Type name or email & Enter', 'Type name or email & Enter', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1776, 'en', 'Due to seller', 'Due to seller', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1777, 'en', 'Log in as this Seller', 'Log in as this Seller', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1778, 'en', 'Go to Payment', 'Go to Payment', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1779, 'en', 'Ban this seller', 'Ban this seller', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1780, 'en', 'Do you really want to ban this seller?', 'Do you really want to ban this seller?', '2021-01-13 17:47:53', '2021-01-13 17:47:53'),
(1781, 'en', 'About', 'About', '2021-01-13 17:58:26', '2021-01-13 17:58:26'),
(1782, 'en', 'Payout Info', 'Payout Info', '2021-01-13 17:58:26', '2021-01-13 17:58:26'),
(1783, 'en', 'Bank Acc Name', 'Bank Acc Name', '2021-01-13 17:58:26', '2021-01-13 17:58:26'),
(1784, 'en', 'Bank Acc Number', 'Bank Acc Number', '2021-01-13 17:58:26', '2021-01-13 17:58:26'),
(1785, 'en', 'Total Products', 'Total Products', '2021-01-13 17:58:26', '2021-01-13 17:58:26'),
(1786, 'en', 'Total Sold Amount', 'Total Sold Amount', '2021-01-13 17:58:26', '2021-01-13 17:58:26'),
(1787, 'en', 'Seller Payments', 'Seller Payments', '2021-01-13 17:58:49', '2021-01-13 17:58:49'),
(1788, 'en', 'Seller', 'Seller', '2021-01-13 17:58:49', '2021-01-13 17:58:49'),
(1789, 'en', 'Payment Details', 'Payment Details', '2021-01-13 17:58:49', '2021-01-13 17:58:49'),
(1790, 'en', 'Package Duration', 'Package Duration', '2021-01-13 18:09:36', '2021-01-13 18:09:36'),
(1791, 'en', 'of seller product price will be deducted from seller earnings', 'of seller product price will be deducted from seller earnings', '2021-01-13 18:11:55', '2021-01-13 18:11:55'),
(1792, 'en', 'This commission only works when Category Based Commission is turned off from Business Settings', 'This commission only works when Category Based Commission is turned off from Business Settings', '2021-01-13 18:11:55', '2021-01-13 18:11:55'),
(1793, 'en', 'Commission doesn\'t work if seller package system add-on is activated', 'Commission doesn\'t work if seller package system add-on is activated', '2021-01-13 18:11:55', '2021-01-13 18:11:55'),
(1794, 'en', 'Edit Seller Information', 'Edit Seller Information', '2021-01-13 18:23:49', '2021-01-13 18:23:49'),
(1795, 'en', 'Seller Information', 'Seller Information', '2021-01-13 18:23:49', '2021-01-13 18:23:49'),
(1796, 'en', 'Seller Withdraw Request', 'Seller Withdraw Request', '2021-01-13 18:24:05', '2021-01-13 18:24:05'),
(1797, 'en', 'Total Amount to Pay', 'Total Amount to Pay', '2021-01-13 18:24:05', '2021-01-13 18:24:05'),
(1798, 'en', 'Requested Amount', 'Requested Amount', '2021-01-13 18:24:05', '2021-01-13 18:24:05'),
(1799, 'en', 'Offline payment has been done. Please wait for response.', 'Offline payment has been done. Please wait for response.', '2021-01-13 18:26:10', '2021-01-13 18:26:10'),
(1800, 'en', 'All Flash Deals', 'All Flash Deals', '2021-01-13 18:40:59', '2021-01-13 18:40:59'),
(1801, 'en', 'Create New Flash Deal', 'Create New Flash Deal', '2021-01-13 18:40:59', '2021-01-13 18:40:59'),
(1802, 'en', '#FFFFFF', '#FFFFFF', '2021-01-13 18:41:03', '2021-01-13 18:41:03'),
(1803, 'en', 'This image is shown as cover banner in flash deal details page.', 'This image is shown as cover banner in flash deal details page.', '2021-01-13 18:41:03', '2021-01-13 18:41:03'),
(1804, 'en', 'Flash Deal has been inserted successfully', 'Flash Deal has been inserted successfully', '2021-01-13 18:45:42', '2021-01-13 18:45:42'),
(1805, 'en', 'Flash deal status updated successfully', 'Flash deal status updated successfully', '2021-01-13 18:45:48', '2021-01-13 18:45:48'),
(1806, 'en', 'Your order has been placed successfully', 'Your order has been placed successfully', '2021-01-17 17:26:45', '2021-01-17 17:26:45'),
(1807, 'en', 'This offer has been expired.', 'This offer has been expired.', '2021-01-19 08:12:34', '2021-01-19 08:12:34'),
(1808, 'en', 'FlashDeal has been deleted successfully', 'FlashDeal has been deleted successfully', '2021-01-20 00:45:07', '2021-01-20 00:45:07'),
(1809, 'en', 'Flash Deal has been updated successfully', 'Flash Deal has been updated successfully', '2021-01-20 00:46:59', '2021-01-20 00:46:59'),
(1810, 'sa', 'Download', 'تنزيل', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1811, 'sa', 'There have been no reviews for this product yet.', 'لم تكن هناك مراجعات لهذا المنتج حتى الآن.', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1812, 'sa', 'Related products', 'منتجات ذات صله', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1813, 'sa', 'Any query about this product', 'أي استفسار عن هذا المنتج', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1814, 'sa', 'Product Name', 'اسم المنتج', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1815, 'sa', 'Your Question', 'سؤالك', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1816, 'sa', 'Send', 'إرسال', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1817, 'sa', 'Use country code before number', 'استخدم رمز البلد قبل الرقم', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1818, 'sa', 'Remember Me', 'تذكًرني', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1819, 'sa', 'Dont have an account?', 'ليس لديك حساب؟', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1820, 'sa', 'Register Now', 'سجل الان', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1821, 'sa', 'oops..', 'المعذره...', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1822, 'sa', 'This item is out of stock!', 'هذا العنصر غير متوفر في المخزون!', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1823, 'sa', 'Back to shopping', 'العودة إلى التسوق', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1824, 'sa', 'Purchase History', 'تاريخ الشراء', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1825, 'sa', 'New', 'جديد', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1826, 'sa', 'Downloads', 'التحميلات', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1827, 'sa', 'Sent Refund Request', 'إرسال طلب استرداد', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1828, 'sa', 'Product Bulk Upload', 'تحميل مجمع للمنتجات', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1829, 'sa', 'Orders', 'الطلبات', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1830, 'sa', 'Recieved Refund Request', 'تم استلام طلب استرداد', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1831, 'sa', 'Shop Setting', 'إعداد المتجر', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1832, 'sa', 'Payment History', 'تاريخ الدفع', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1833, 'sa', 'Money Withdraw', 'سحب الأموال', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1834, 'sa', 'Conversations', 'المحادثات', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1835, 'sa', 'My Wallet', 'محفظتي', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1836, 'sa', 'Earning Points', 'كسب النقاط', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1837, 'sa', 'Support Ticket', 'بطاقة الدعم', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1838, 'sa', 'Manage Profile', 'إدارة الملف الشخصي', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1839, 'sa', 'Sold Amount', 'المبلغ المُباع', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1840, 'sa', 'Your sold amount (current month)', 'المبلغ المباع (الشهر الحالي)', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1841, 'sa', 'Total Sold', 'إجمالي المبيعات', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1842, 'sa', 'Last Month Sold', 'مبيعات الشهر الماضي', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1843, 'sa', 'Total sale', 'إجمالي البيع', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1844, 'sa', 'Total earnings', 'مجموع الأرباح الكلية', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1845, 'sa', 'Successful orders', 'الطلبات الناجحة', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1846, 'sa', 'Total orders', 'إجمالي الطلبات', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1847, 'sa', 'Pending orders', 'الطلبات المعلقة في قائمة الإنتظار', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1848, 'sa', 'Cancelled orders', 'الطلبات الملغاة', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1849, 'sa', 'Product', 'المنتج', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1850, 'sa', 'Purchased Package', 'الحزمة المشتراة', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1851, 'sa', 'Package Not Found', 'الحزمة غير موجودة', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1852, 'sa', 'Upgrade Package', 'ترقية الحزمة', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1853, 'sa', 'Shop', 'متجر', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1854, 'sa', 'Manage & organize your shop', 'إدارة وتنظيم متجرك', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1855, 'sa', 'Go to setting', 'اذهب إلى الإعدادات', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1856, 'sa', 'Payment', 'الدفع', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1857, 'sa', 'Configure your payment method', 'قم بإعداد وتكوين طريقة الدفع الخاصة بك', '2021-01-24 04:17:57', '2021-01-24 04:17:57'),
(1858, 'sa', 'My Points', 'نقاطي', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1859, 'sa', ' Points', 'نقاط', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1860, 'sa', 'Wallet Money', 'أموال المحفظة', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1861, 'sa', 'Exchange Rate', 'سعر الصرف', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1862, 'sa', 'Point Earning history', 'سِجل كسب النقاط', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1863, 'sa', 'Date', 'التاريخ', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1864, 'sa', 'Points', 'نقاط', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1865, 'sa', 'Converted', 'تم تحويلها', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1866, 'sa', 'Action', 'إتخاذ إجراء', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1867, 'sa', 'No history found.', 'لم يتم العثور على التاريخ.', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1868, 'sa', 'Convert has been done successfully Check your Wallets', 'التحويل تم بنجاح تحقق من محافظك', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1869, 'sa', 'Something went wrong', 'حدث خطأ ما', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1870, 'sa', 'Remaining Uploads', 'التحميلات المتبقية', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1871, 'sa', 'No Package Found', 'لم يتم العثور على حزمة', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1872, 'sa', 'Search product', 'البحث عن المنتج', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1873, 'sa', 'Name', 'الاسم', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1874, 'sa', 'Current Qty', 'الكمية الحالية', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1875, 'sa', 'Base Price', 'السعر الأساسي', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1876, 'sa', 'Published', 'نشرت', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1877, 'sa', 'Featured', 'مميز', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1878, 'sa', 'Options', 'خيارات', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1879, 'sa', 'Edit', 'تحرير', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1880, 'sa', 'Duplicate', 'مكرر', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1881, 'sa', '1. Download the skeleton file and fill it with data.', '1. قم بتنزيل ملف الهيكل الشكلي واملأه بالبيانات.', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1882, 'sa', '2. You can download the example file to understand how the data must be filled.', '2. يمكنك تنزيل ملف المثال لفهم كيفية ملء البيانات.', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1883, 'sa', '3. Once you have downloaded and filled the skeleton file, upload it in the form below and submit.', '3. بمجرد تنزيل ملف الهيكل الشكلي وتعبئته ، قم بتحميله في النموذج أدناه وأرسله.', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1884, 'sa', '4. After uploading products you need to edit them and set products images and choices.', '4. بعد تحميل المنتجات تحتاج إلى تعديلها وتعيين صور المنتجات والاختيارات.', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1885, 'sa', 'Download CSV', 'تنزيل ملف CSV', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1886, 'sa', '1. Category,Sub category,Sub Sub category and Brand should be in numerical ids.', '1. يجب أن تكون الفئة ، والفئة الفرعية ، والفئة الفرعية الثانية  والعلامة التجارية في هويات رقمية.', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1887, 'sa', '2. You can download the pdf to get Category,Sub category,Sub Sub category and Brand id.', '2. يمكنك تنزيل ملف pdf للحصول على الفئة والفئة الفرعية والفئة الفرعية الثانية ومعرف العلامة التجارية.', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1888, 'sa', 'Download Category', 'تحميل الفئات', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1889, 'sa', 'Download Sub category', 'تحميل التصنيفات الفرعية', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1890, 'sa', 'Download Sub Sub category', 'تحميل التصنيف الفرعي الثانية', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1891, 'sa', 'Download Brand', 'تحميل العلامة التجارية والماركات', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1892, 'sa', 'Upload CSV File', 'تحميل ملف CSV', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1893, 'sa', 'CSV', 'ملف CSV', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1894, 'sa', 'Choose CSV File', 'اختر ملف CSV', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1895, 'sa', 'Upload', 'تحميل', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1896, 'sa', 'Add New Digital Product', 'إضافة منتج رقمي جديد', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1897, 'sa', 'Available Status', 'الحالة المتاحة', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1898, 'sa', 'Admin Status', 'حالة المسؤول والإدارة', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1899, 'sa', 'Pending Balance', 'رصيد معلق', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1900, 'sa', 'Send Withdraw Request', 'إرسال طلب سحب', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1901, 'sa', 'Withdraw Request history', 'تاريخ الطلب  للسحب', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1902, 'sa', 'Amount', 'المبلغ والكمية', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1903, 'sa', 'Status', 'حالة', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1904, 'sa', 'Message', 'رسالة', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1905, 'sa', 'Send A Withdraw Request', 'إرسال طلب سحب', '2021-01-24 04:37:39', '2021-01-24 04:37:39'),
(1906, 'sa', 'Basic Info', 'معلومات أساسية', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1907, 'sa', 'Photo', 'صورة', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1908, 'sa', 'Browse', 'تصفح', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1909, 'sa', 'Your Password', 'كلمة المرور الخاصتك', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1910, 'sa', 'New Password', 'كلمة مرور جديدة', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1911, 'sa', 'Confirm Password', 'تأكيد كلمة المرور', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1912, 'sa', 'Payment Setting', 'إعدادات الدفع', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1913, 'sa', 'Cash Payment', 'الدفع النقدي', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1914, 'sa', 'Bank Payment', 'الدفع البنكي', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1915, 'sa', 'Bank Name', 'اسم البنك', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1916, 'sa', 'Bank Account Name', 'اسم الحساب المصرفي', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1917, 'sa', 'Bank Account Number', 'رقم الحساب المصرفي', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1918, 'sa', 'Bank Routing Number', 'رقم توجيه البنك', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1919, 'sa', 'Update Profile', 'تحديث الملف الشخصي', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1920, 'sa', 'Verify', 'التحقق', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1921, 'sa', 'Country', 'الدولة', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1922, 'sa', 'Select your country', 'إختر دولتك', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1923, 'sa', 'City', 'المدينة', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1924, 'sa', 'Your City', 'مدينتك', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1925, 'sa', 'Your Postal Code', 'رقم البوستال كود', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1926, 'sa', '+880', '+880', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1927, 'sa', 'Save', 'حفظ', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1928, 'sa', 'Received Refund Request', 'تم استلام طلب استرداد', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1929, 'sa', 'Delete Confirmation', 'حذف التأكيد', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1930, 'sa', 'Are you sure to delete this?', 'هل أنت متأكد من حذف هذا؟', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1931, 'sa', 'Premium Packages for Sellers', 'حزمة متميزة للبائعين', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1932, 'sa', 'Product Upload', 'تحميل المنتج', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1933, 'sa', 'Digital Product Upload', 'تحميل منتج رقمي', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1934, 'sa', 'Purchase Package', 'شراء حزمة', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1935, 'sa', 'Select Payment Type', 'اختر نوع الدفع', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1936, 'sa', 'Payment Type', 'نوع الدفع', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1937, 'sa', 'Select One', 'اختر واحدا', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1938, 'sa', 'Online payment', 'الدفع الالكتروني', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1939, 'sa', 'Offline payment', 'الدفع أوفلاين', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1940, 'sa', 'Purchase Your Package', 'شراء الحزمة الخاصة بك', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1941, 'sa', 'Paypal', 'باي بال', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1942, 'sa', 'Stripe', 'الدفع بسترايب', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1943, 'sa', 'sslcommerz', 'الدفع sslcommerz', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1944, 'sa', 'Confirm', 'تأكيد', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1945, 'sa', 'Offline Package Payment', 'الدفع للحزمة أوفلاين', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1946, 'sa', 'Transaction ID', 'رقم المعرف للمعاملة', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1947, 'sa', 'Choose image', 'اختر صورة', '2021-01-24 16:57:40', '2021-01-24 16:57:40'),
(1948, 'sa', 'Code', 'الكود', '2021-01-24 17:16:28', '2021-01-24 17:16:28'),
(1949, 'sa', 'Delivery Status', 'حالة التوصيل', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1950, 'sa', 'Payment Status', 'حالة الدفع', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1951, 'sa', 'Paid', 'مدفوعة', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1952, 'sa', 'Order Details', 'تفاصيل الطلب', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1953, 'sa', 'Download Invoice', 'تحميل الفاتورة', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1954, 'sa', 'Unpaid', 'غير مدفوعة', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1955, 'sa', 'Order placed', 'تم تقديم الطلب', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1956, 'sa', 'Confirmed', 'تم التأكيد', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1957, 'sa', 'On delivery', 'عند التسليم', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1958, 'sa', 'Delivered', 'تم التوصيل والتسليم', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1959, 'sa', 'Order Summary', 'ملخص الطلب', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1960, 'sa', 'Order Code', 'كود الطلب', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1961, 'sa', 'Customer', 'الزبون', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1962, 'sa', 'Total order amount', 'مبلغ الطلب الإجمالي', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1963, 'sa', 'Shipping metdod', 'طريقة الشحن', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1964, 'sa', 'Flat shipping rate', 'سعر شحن ثابت', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1965, 'sa', 'Payment metdod', 'طريقة الدفع', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1966, 'sa', 'Variation', 'تعدد الاختلافات للصنف', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1967, 'sa', 'Delivery Type', 'نوع التوصيل', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1968, 'sa', 'Home Delivery', 'توصيل منزلي', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1969, 'sa', 'Order Ammount', 'مبلغ وكمية الطلبية', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1970, 'sa', 'Subtotal', 'المجموع الفرعي', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1971, 'sa', 'Shipping', 'الشحن', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1972, 'sa', 'Coupon Discount', 'كوبون خصم', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1973, 'sa', 'N/A', 'غير متوفر', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1974, 'sa', 'In stock', 'في المخزن', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1975, 'sa', 'Buy Now', 'اشتري الآن', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1976, 'sa', 'Proceed to Checkout', 'الشروع في الخروج وإتمام الدفع', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1977, 'sa', '2. Shipping info', '2. معلومات الشحن', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1978, 'sa', 'Checkout', 'إنهاد الدفع والخروج', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1979, 'sa', '3. Delivery info', '3. معلومات التسليم والتوصيل', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1980, 'sa', '4. Payment', '4. الدفع', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1981, 'sa', '5. Confirmation', '5. التأكيد', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1982, 'sa', 'Remove', 'إزالة', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1983, 'sa', 'Continue to Shipping', 'تابع الشحن', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1984, 'sa', 'Or', 'أو', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1985, 'sa', 'Guest Checkout', 'تسجيل خروج الزائر', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1986, 'sa', 'Continue to Delivery Info', 'تابع إلى معلومات التسليم', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1987, 'sa', 'Postal Code', 'الرمز البريدي', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1988, 'sa', 'Choose Delivery Type', 'اختر نوع التسليم', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1989, 'sa', 'Local Pickup', 'النقل المحلي', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1990, 'sa', 'Select your nearest pickup point', 'حدد أقرب نقطة التقاط واستلام لك', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1991, 'sa', 'Continue to Payment', 'تابع الدفع', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1992, 'sa', 'Select a payment option', 'حدد خيار الدفع', '2021-01-24 17:16:29', '2021-01-24 17:16:29'),
(1993, 'sa', 'Razorpay', 'الدفع من خلال Razorpay', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(1994, 'sa', 'Paystack', 'الدفع من خلال Paystack', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(1995, 'sa', 'VoguePay', 'الدفع من خلال VoguePay', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(1996, 'sa', 'payhere', 'الدفع من خلال payhere', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(1997, 'sa', 'ngenius', 'الدفع من خلال ngenius', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(1998, 'sa', 'Paytm', 'الدفع من خلال Paytm', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(1999, 'sa', 'Cash on Delivery', 'الدفع عند الاستلام', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2000, 'sa', 'Your wallet balance :', 'رصيد محفظتك:', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2001, 'sa', 'Insufficient balance', 'رصيد غير كاف', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2002, 'sa', 'I agree to the', 'أوافق على', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2003, 'sa', 'Complete Order', 'ترتيب كامل', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2004, 'sa', 'Summary', 'ملخص', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2005, 'sa', 'Items', 'عناصر', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2006, 'sa', 'Total Club point', 'مجموع نقاط المكافئات', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2007, 'sa', 'Total Shipping', 'إجمالي الشحن', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2008, 'sa', 'Have coupon code? Enter here', 'هل لديك رمز قسيمة \"كوبون\"؟ أدخل هنا', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2009, 'sa', 'Apply', 'تطبيق', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2010, 'sa', 'You need to agree with our policies', 'يجب أن توافق على سياساتنا', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2011, 'sa', 'Forgot password', 'نسيت كلمة المرور', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2012, 'sa', 'SEO Setting', 'إعدادات  SEO', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2013, 'sa', 'System Update', 'تحديث النظام', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2014, 'sa', 'Add New Payment Method', 'إضافة طريقة دفع جديدة', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2015, 'sa', 'Manual Payment Method', 'طريقة الدفع اليدوي', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2016, 'sa', 'Heading', 'عنوان رئيسي Heading', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2017, 'sa', 'Logo', 'الشعار', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2018, 'sa', 'Manual Payment Information', 'معلومات الدفع النقدي', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2019, 'sa', 'Type', 'النوع', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2020, 'sa', 'Custom Payment', 'الدفع المخصص', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2021, 'sa', 'Check Payment', 'الدفع عن طريق الشيكات', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2022, 'sa', 'Checkout Thumbnail', 'صورة مصغرة لإنهاء البيع', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2023, 'sa', 'Payment Instruction', 'تعليمات الدفع', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2024, 'sa', 'Bank Information', 'معلومات البنك', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2025, 'sa', 'Select File', 'إختيار الملف', '2021-01-24 18:17:00', '2021-01-24 18:17:00'),
(2026, 'sa', 'Upload New', 'تحميل جديد', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2027, 'sa', 'Sort by newest', 'ترتيب حسب الأحدث', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2028, 'sa', 'Sort by oldest', 'ترتيب حسب الأقدم', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2029, 'sa', 'Sort by smallest', 'ترتيب حسب الأصغر', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2030, 'sa', 'Sort by largest', 'الترتيب حسب الأكبر', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2031, 'sa', 'Selected Only', 'محدد فقط', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2032, 'sa', 'No files found', 'لم يتم العثور على ملفات', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2033, 'sa', '0 File selected', '0 ملف محدد', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2034, 'sa', 'Clear', 'مسح', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2035, 'sa', 'Prev', 'السابق', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2036, 'sa', 'Next', 'التالي', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2037, 'sa', 'Add Files', 'إضافة ملفات', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2038, 'sa', 'Method has been inserted successfully', 'تم إدخال الطريقة بنجاح', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2039, 'sa', 'Order Date', 'ترتيب التاريخ', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2040, 'sa', 'Bill to', 'فاتورة ل', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2041, 'sa', 'Sub Total', 'المجموع الفرعي', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2042, 'sa', 'Total Tax', 'إجمالي الضرائب', '2021-01-24 18:17:01', '2021-01-24 18:17:01'),
(2043, 'sa', 'Grand Total', 'المجموع الكلي', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2044, 'sa', 'Your order has been placed successfully. Please submit payment information from purchase history', 'تم تقديم طلبك بنجاح. يرجى تقديم معلومات الدفع من سجل الشراء', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2045, 'sa', 'Thank You for Your Order!', 'شكرا لطلبك!', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2046, 'sa', 'Order Code:', 'كود الطلب:', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2047, 'sa', 'A copy or your order summary has been sent to', 'تم إرسال نسخة أو ملخص طلبك إلى', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2048, 'sa', 'Make Payment', 'قم بالدفع', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2049, 'sa', 'Payment screenshot', 'صور سكرين شوت من الدفع  SCreen-Shot', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2050, 'sa', 'Paypal Credential', 'اعتماد Paypal Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2051, 'sa', 'Paypal Client ID', 'معرف عميل Paypal Client ID', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2052, 'sa', 'Paypal Client Secret', 'كلمة سر العميل Paypal Client Secret', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2053, 'sa', 'Paypal Sandbox Mode', 'وضع Paypal Sandbox Mode', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2054, 'sa', 'Sslcommerz Credential', 'شهادة Sslcommerz Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2055, 'sa', 'Sslcz Store Id', 'رقم متجر Sslcz Store Id', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2056, 'sa', 'Sslcz store password', 'كلمة مرور متجر Sslcz store password', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2057, 'sa', 'Sslcommerz Sandbox Mode', 'وضع  SSlcommerz Sandbox', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2058, 'sa', 'Stripe Credential', 'Stripe Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2059, 'sa', 'STRIPE KEY', 'STRIPE KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2060, 'sa', 'STRIPE SECRET', 'STRIPE SECRET', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2061, 'sa', 'RazorPay Credential', 'RazorPay Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2062, 'sa', 'RAZOR KEY', 'RAZOR KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2063, 'sa', 'RAZOR SECRET', 'RAZOR SECRET', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2064, 'sa', 'Instamojo Credential', 'Instamojo Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2065, 'sa', 'API KEY', 'API KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2066, 'sa', 'IM API KEY', 'IM API KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2067, 'sa', 'Instamojo Sandbox Mode', 'Instamojo Sandbox Mode', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2068, 'sa', 'PayStack Credential', 'PayStack Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2069, 'sa', 'PUBLIC KEY', 'PUBLIC KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2070, 'sa', 'SECRET KEY', 'SECRET KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2071, 'sa', 'VoguePay Credential', 'VoguePay Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2072, 'sa', 'MERCHANT ID', 'MERCHANT ID', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2073, 'sa', 'Sandbox Mode', 'Sandbox Mode', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2074, 'sa', 'Payhere Credential', 'Payhere Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2075, 'sa', 'PAYHERE MERCHANT ID', 'PAYHERE MERCHANT ID', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2076, 'sa', 'PAYHERE SECRET', 'PAYHERE SECRET', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2077, 'sa', 'PAYHERE CURRENCY', 'PAYHERE CURRENCY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2078, 'sa', 'Payhere Sandbox Mode', 'Payhere Sandbox Mode', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2079, 'sa', 'Ngenius Credential', 'Ngenius Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2080, 'sa', 'NGENIUS OUTLET ID', 'NGENIUS OUTLET ID', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2081, 'sa', 'NGENIUS API KEY', 'NGENIUS API KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2082, 'sa', 'NGENIUS CURRENCY', 'NGENIUS CURRENCY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2083, 'sa', 'Mpesa Credential', 'Mpesa Credential', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2084, 'sa', 'MPESA CONSUMER KEY', 'MPESA CONSUMER KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2085, 'sa', 'MPESA_CONSUMER_KEY', 'MPESA_CONSUMER_KEY', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2086, 'sa', 'MPESA CONSUMER SECRET', 'MPESA CONSUMER SECRET', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2087, 'sa', 'MPESA_CONSUMER_SECRET', 'MPESA_CONSUMER_SECRET', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2088, 'sa', 'MPESA SHORT CODE', 'MPESA SHORT CODE', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2089, 'sa', 'MPESA_SHORT_CODE', 'MPESA_SHORT_CODE', '2021-01-24 18:29:27', '2021-01-24 18:29:27'),
(2090, 'sa', 'MPESA SANDBOX ACTIVATION', 'MPESA SANDBOX ACTIVATION', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2091, 'sa', 'Flutterwave Credential', 'Flutterwave Credential', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2092, 'sa', 'RAVE_PUBLIC_KEY', 'RAVE_PUBLIC_KEY', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2093, 'sa', 'RAVE_SECRET_KEY', 'RAVE_SECRET_KEY', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2094, 'sa', 'RAVE_TITLE', 'RAVE_TITLE', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2095, 'sa', 'STAGIN ACTIVATION', 'تنشيط STAGIN', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2096, 'sa', 'All Product', 'جميع المنتجات', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2097, 'sa', 'Sort By', 'فرز حسب', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2098, 'sa', 'Rating (High > Low)', 'تصنيف (مرتفع> منخفض)', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2099, 'sa', 'Rating (Low > High)', 'تصنيف (منخفض> مرتفع)', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2100, 'sa', 'Num of Sale (High > Low)', 'رقم البيع (مرتفع> منخفض)', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2101, 'sa', 'Num of Sale (Low > High)', 'رقم البيع (منخفض> مرتفع)', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2102, 'sa', 'Base Price (High > Low)', 'السعر الأساسي (مرتفع> منخفض)', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2103, 'sa', 'Base Price (Low > High)', 'السعر الأساسي (منخفض> مرتفع)', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2104, 'sa', 'Type & Enter', 'اكتب وأدخل', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2105, 'sa', 'Added By', 'أضيف بواسطة', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2106, 'sa', 'Num of Sale', 'رقم البيع', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2107, 'sa', 'Total Stock', 'إجمالي المخزون', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2108, 'sa', 'Todays Deal', 'صفقة اليوم', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2109, 'sa', 'Rating', 'التقييم', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2110, 'sa', 'times', 'مرة', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2111, 'sa', 'Add Nerw Product', 'أضف منتج جديد', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2112, 'sa', 'Product Information', 'معلومات المنتج', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2113, 'sa', 'Unit', 'وحدة', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2114, 'sa', 'Unit (e.g. KG, Pc etc)', 'وحدة (مثل KG ، pc، إلخ)', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2115, 'sa', 'Minimum Qty', 'الحد الأدنى للكمية', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2116, 'sa', 'Tags', 'العلامات \"تاج\"', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2117, 'sa', 'Type and hit enter to add a tag', 'اكتب واضغط على enter لإضافة علامة \"تاج\"', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2118, 'sa', 'Barcode', 'الباركود', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2119, 'sa', 'Refundable', 'مستردة', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2120, 'sa', 'Product Images', 'صور المنتج', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2121, 'sa', 'Gallery Images', 'معرض الصور', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2122, 'sa', 'Todays Deal updated successfully', 'صفقة اليوم تم تحديثها بنجاح', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2123, 'sa', 'Published products updated successfully', 'المنتج المنشور تم تحديثه بنجاح', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2124, 'sa', 'Thumbnail Image', 'صورة مصغرة', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2125, 'sa', 'Featured products updated successfully', 'المنتج مالميز تم تحديثه بنجاح', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2126, 'sa', 'Product Videos', 'فيديو المنتج', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2127, 'sa', 'Video Provider', 'مشغل فيديو', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2128, 'sa', 'Youtube', 'يوتيوب', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2129, 'sa', 'Dailymotion', 'ديلي موشن', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2130, 'sa', 'Vimeo', 'فيميو', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2131, 'sa', 'Video Link', 'رابط الفيديو', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2132, 'sa', 'Product Variation', 'تنوع المنتج', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2133, 'sa', 'Colors', 'ألوان', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2134, 'sa', 'Attributes', 'السمات  والحقول', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2135, 'sa', 'Choose Attributes', 'اختر السمات', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2136, 'sa', 'Choose the attributes of this product and then input values of each attribute', 'اختر سمات هذا المنتج ثم قم بإدخال قيمة لكل سمة', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2137, 'sa', 'Product price + stock', 'سعر المنتج + المخزون', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2138, 'sa', 'Unit price', 'سعر الوحدة', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2139, 'sa', 'Purchase price', 'سعر الشراء', '2021-01-24 18:42:14', '2021-01-24 18:42:14'),
(2140, 'sa', 'Flat', 'سعر ثابت', '2021-01-24 18:59:01', '2021-11-25 12:51:48'),
(2141, 'sa', 'Percent', 'في المائة', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2142, 'sa', 'Discount', 'خصم', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2143, 'sa', 'Product Description', 'وصف المنتج', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2144, 'sa', 'Product Shipping Cost', 'تكلفة شحن المنتج', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2145, 'sa', 'Free Shipping', 'شحن مجاني', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2146, 'sa', 'Flat Rate', 'سعر ثابت', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2147, 'sa', 'Shipping cost', 'تكلفة الشحن', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2148, 'sa', 'PDF Specification', 'مواصفات PDF', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2149, 'sa', 'SEO Meta Tags', 'علامات تعريف SEO', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2150, 'sa', 'Meta Title', 'عنوان ميتا', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2151, 'sa', 'Meta Image', 'صورة ميتا', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2152, 'sa', 'Choice Title', 'اختار عنوانا', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2153, 'sa', 'Enter choice values', 'أدخل القيم المختارة', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2154, 'sa', 'Add New category', 'أضف فئة جديدة', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2155, 'sa', 'Type name & Enter', 'اكتب الاسم وأدخل Enter', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2156, 'sa', 'Banner', 'بانر', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2157, 'sa', 'Commission', 'الكوميشن', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2158, 'sa', 'icon', 'الأيقونة', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2159, 'sa', 'Hot', 'سعر ناري', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2160, 'sa', 'Filter by Payment Status', 'الفلترة حسب حالة الدفع', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2161, 'sa', 'Un-Paid', 'غير مدفوعة الأجر', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2162, 'sa', 'Filter by Deliver Status', 'الفاترة حسب حالة التسليم', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2163, 'sa', 'Pending', 'معلق بقائمة الإنتظار', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2164, 'sa', 'Type Order code & hit Enter', 'اكتب رمز الطلب واضغط على  Enter', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2165, 'sa', 'Num. of Products', 'عدد المنتجات', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2166, 'sa', 'Walk In Customer', 'دخول العميل', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2167, 'sa', 'QTY', 'العدد والكمية', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2168, 'sa', 'Without Shipping Charge', 'بدون رسوم الشحن', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2169, 'sa', 'With Shipping Charge', 'مع رسوم الشحن', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2170, 'sa', 'Pay With Cash', 'ادفع نقدًا', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2171, 'sa', 'Close', 'إغلاق', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2172, 'sa', 'Select country', 'اختر الدولة', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2173, 'sa', 'Order Confirmation', 'تأكيد الطلب', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2174, 'sa', 'Are you sure to confirm this order?', 'هل أنت متأكد من تأكيد هذه الطلبية ؟', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2175, 'sa', 'Comfirm Order', 'تأكيد الطلبية', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2176, 'sa', 'Personal Info', 'معلومات شخصية', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2177, 'sa', 'Repeat Password', 'كرر كلمة المرور', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2178, 'sa', 'Shop Name', 'اسم المتجر', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2179, 'sa', 'Register Your Shop', 'سجل متجرك', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2180, 'sa', 'Affiliate Informations', 'معلومات الأفلييت', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2181, 'sa', 'Affiliate', 'أفلييت', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2182, 'sa', 'User Info', 'معلومات المستخدم', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2183, 'sa', 'Installed Addon', 'تثبيت الإضافات', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2184, 'sa', 'Available Addon', 'الإضافات المتاحة', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2185, 'sa', 'Install New Addon', 'قم بتثبيت إضافة جديدة', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2186, 'sa', 'Version', 'الإصدار', '2021-01-24 18:59:01', '2021-01-24 18:59:01'),
(2187, 'sa', 'Activated', 'مفعل', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2188, 'sa', 'Deactivated', 'غير مفعّل', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2189, 'sa', 'Activate OTP', 'تفعيل OTP', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2190, 'sa', 'OTP will be Used For', 'سيتم استخدام OTP ل', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2191, 'sa', 'Settings updated successfully', 'تم تحديث الإعدادات بنجاح', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2192, 'sa', 'Product Owner', 'مالك المنتج', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2193, 'sa', 'Point', 'نقطة', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2194, 'sa', 'Set Point for Product Within a Range', 'قم بتعيين نقاط للمنتج ضمن النطاق', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2195, 'sa', 'Set Point for multiple products', 'قم بتعيين نقاط تعيين لمنتجات متعددة', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2196, 'sa', 'Min Price', 'السعر  الأقل', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2197, 'sa', 'Max Price', 'أقصى سعر', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2198, 'sa', 'Set Point for all Products', 'قم بتعيين نقاط لجميع المنتجات', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2199, 'sa', 'Set Point For ', 'قم بتعيين  نقاط ل', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2200, 'sa', 'Convert Status', 'تحويل الحالة', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2201, 'sa', 'Earned At', 'تم الحصول عليها في', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2202, 'sa', 'Seller Based Selling Report', 'تقرير بيع قائم على البائع', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2203, 'sa', 'Sort by verificarion status', 'فرز حسب حالة التحقق', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2204, 'sa', 'Approved', 'تمت الموافقة', '2021-01-24 19:25:39', '2021-01-24 19:25:39'),
(2205, 'sa', 'Non Approved', 'غير معتمد', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2206, 'sa', 'Filter', 'فلتر', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2207, 'sa', 'Seller Name', 'اسم البائع', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2208, 'sa', 'Number of Product Sale', 'عدد مبيعات المنتج', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2209, 'sa', 'Order Amount', 'كمية ومبلغ الطلبية', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2210, 'sa', 'Go to Settings of your page and find the option of \\\"Advance Messaging\\\"', 'انتقل إلى إعدادات صفحتك وابحث عن خيار \\ \"Advance Messaging \\\"', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2211, 'sa', 'Scroll down that page and you will get \\\"white listed domain\\\"', 'قم بالتمرير لأسفل تلك الصفحة وستحصل على \\ \"white listed domain\\ \\\"', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2212, 'sa', 'Set your website domain name', 'قم بتعيين اسم مجال موقع الويب الخاص بك  website domain name', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2213, 'sa', 'Google reCAPTCHA Setting', 'إعداد Google reCAPTCHA 34', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2214, 'sa', 'Site KEY', 'مفتاح الموقع', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2215, 'sa', 'Select Shipping Method', 'حدد طريقة الشحن', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2216, 'sa', 'Product Wise Shipping Cost', 'تكلفة الشحن المنتج الأفضل', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2217, 'sa', 'Flat Rate Shipping Cost', 'تكلفة الشحن بسعر موحد', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2218, 'sa', 'Seller Wise Flat Shipping Cost', 'تكلفة أجور الشحن للبائع', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2219, 'sa', 'Note', 'ملاحظة', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2220, 'sa', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', 'حساب تكلفة الشحن الخاصة بالمنتج: يتم حساب تكلفة الشحن عن طريق إضافة تكلفة شحن كل منتج', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2221, 'sa', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', 'حساب تكلفة الشحن بالسعر الثابت: لا يهم كم عدد المنتجات التي يشتريها العميل. تكلفة الشحن ثابتة', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2222, 'sa', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If a customer purchase 2 product from two seller shipping cost is calculate by addition of each seller flat shipping cost', 'حساب البائع لتكلفة الشحن: سعر ثابت لكل بائع. إذا قام العميل بشراء منتجين من اثنين من تكلفة الشحن للبائعين يتم حسابها عن طريق إضافة تكلفة الشحن الثابتة لكل بائع', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2223, 'sa', 'Flat Rate Cost', 'تكلفة السعر الثابت', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2224, 'sa', 'Shipping Cost for Admin Products', 'تكلفة الشحن لمنتجات الإدارة', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2225, 'sa', 'Countries', 'الدول', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2226, 'sa', 'Show/Hide', 'إظهار / إخفاء', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2227, 'sa', 'Country status updated successfully', 'تم تحديث حالة البلد بنجاح', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2228, 'sa', 'Add New Subcategory', 'إضافة تصنيف فرعي جديد', '2021-01-24 19:25:40', '2021-01-24 19:25:40'),
(2229, 'sa', 'Sub Category Information', 'معلومات الفئة الفرعية', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2230, 'sa', 'Slug', 'سلج Slug', '2021-01-24 19:48:15', '2021-01-24 19:48:34'),
(2231, 'sa', 'Add New Sub Subcategory', 'إضافة تصنيف فرعي جديد', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2232, 'sa', 'Make This Default', 'اجعل هذا الافتراضي', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2233, 'sa', 'Shops', 'متاجر', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2234, 'sa', 'Women Clothing & Fashion', 'ملابس وموضة نسائية', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2235, 'sa', 'Welcome to', 'مرحبًا بك في', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2236, 'sa', 'Create a New Account', 'قم بإنشاء حساب جديد', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2237, 'sa', 'Full Name', 'الاسم الكامل', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2238, 'sa', 'password', 'كلمة المرور', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2239, 'sa', 'Confrim Password', 'تأكيد كلمة المرور', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2240, 'sa', 'I agree with the', 'أنا أتفق مع', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2241, 'sa', 'Terms and Conditions', 'الشروط والأحكام', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2242, 'sa', 'Register', 'سجل', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2243, 'sa', 'Already have an account', 'لديك حساب بالفعل مسبقا', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2244, 'sa', 'Sign Up with', 'اشترك مع', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2245, 'sa', 'I agree with the Terms and Conditions', 'أوافق على الشروط والأحكام', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2246, 'sa', 'All Role', 'كل الأدوار والصلاحيات', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2247, 'sa', 'Add New Role', 'أضف دور جديد', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2248, 'sa', 'Roles', 'الأدوار', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2249, 'sa', 'Add New Staffs', 'إضافة طاقم عمل جديد', '2021-01-24 19:48:15', '2021-01-24 19:48:15');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(2250, 'sa', 'Role', 'دور', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2251, 'sa', 'Frontend Website Name', 'اسم موقع الواجهة الأمامية', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2252, 'sa', 'Website Name', 'اسم الموقع', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2253, 'sa', 'Site Motto', 'موقع شعار Motto  29', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2254, 'sa', 'Best eCommerce Website', 'أفضل موقع للتجارة الإلكترونية', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2255, 'sa', 'Site Icon', 'أيقونة الموقع', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2256, 'sa', 'Website favicon. 32x32 .png', 'أيقونة موقع الويب. 32 × 32. png', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2257, 'sa', 'Website Base Color', 'لون أساسي للموقع', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2258, 'sa', 'Hex Color Code', 'رمز اللون بالترمز السداسي', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2259, 'sa', 'Website Base Hover Color', 'لون تحوم قاعدة موقع الويب', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2260, 'sa', 'Update', 'تحديث', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2261, 'sa', 'Global Seo', 'SEO Global  العالمية سيو', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2262, 'sa', 'Meta description', 'وصف ميتا', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2263, 'sa', 'Keywords', 'الكلمات الرئيسية', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2264, 'sa', 'Separate with coma', 'منفصلة مع كوما ,', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2265, 'sa', 'Website Pages', 'صفحات  الموقع', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2266, 'sa', 'All Pages', 'جميع الصفحات', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2267, 'sa', 'Add New Page', 'أضف صفحة جديدة', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2268, 'sa', 'URL', 'URL رابط الصفحة او الموقع', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2269, 'sa', 'Actions', 'الإجراءات', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2270, 'sa', 'Edit Page Information', 'تحرير معلومات الصفحة', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2271, 'sa', 'Page Content', 'محتوى الصفحة', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2272, 'sa', 'Title', 'العنوان', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2273, 'sa', 'Link', 'رابط', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2274, 'sa', 'Use character, number, hypen only', 'استخدم الحرف ، الرقم ، الواصلة فقط', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2275, 'sa', 'Add Content', 'أضف محتوى', '2021-01-24 19:48:15', '2021-01-24 19:48:15'),
(2276, 'sa', 'Seo Fields', 'حقول ال سيو  SEO', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2277, 'sa', 'Update Page', 'تحديث الصفحة', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2278, 'sa', 'Default Language', 'اللغة الافتراضية', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2279, 'sa', 'Add New Language', 'أضف لغة جديدة', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2280, 'sa', 'RTL', 'RTL من اليمين إلى اليسار', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2281, 'sa', 'Translation', 'الترجمة', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2282, 'sa', 'Language Information', 'معلومات اللغة', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2283, 'sa', 'Save Page', 'حفظ الصفحة', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2284, 'sa', 'Home Page Settings', 'إعدادات الصفحة الرئيسية', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2285, 'sa', 'Home Slider', 'السلايدر الرئيسي', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2286, 'sa', 'Photos & Links', 'صور وروابط', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2287, 'sa', 'Add New', 'إضافة جديد', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2288, 'sa', 'Home Banner 1 (Max 3)', 'البانرات العلوية 1 (بحد أقصى 3)', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2289, 'sa', 'Banner & Links', 'البانر والروابط', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2290, 'sa', 'Home Banner 2 (Max 3)', 'البانرات العلوية 2 (بحد أقصى 3)', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2291, 'sa', 'Top 10', 'أعلى 10', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2292, 'sa', 'Top Brands (Max 10)', 'أفضل العلامات التجارية (بحد أقصى 10)', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2293, 'sa', 'System Name', 'اسم النظام', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2294, 'sa', 'System Logo - White', 'شعار نظام - أبيض', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2295, 'sa', 'Choose Files', 'اختر الملفات', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2296, 'sa', 'Will be used in admin panel side menu', 'سيتم استخدامه في القائمة الجانبية للوحة الإدارة', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2297, 'sa', 'System Logo - Black', 'شعار نظام - أسود', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2298, 'sa', 'System Timezone', 'المنطقة الزمنية للنظام', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2299, 'sa', 'Website Header', 'رأس موقع الويب Website Header', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2300, 'sa', 'Header Setting', 'إعداد الرأس Header Setting', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2301, 'sa', 'Header Logo', 'الشعار في الأعلى', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2302, 'sa', 'Show Language Switcher?', 'إظهار محوّل اللغة؟', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2303, 'sa', 'Show Currency Switcher?', 'عرض محوّل العملات؟', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2304, 'sa', 'Enable stikcy header?', 'تمكين رأس stikcy؟', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2305, 'sa', 'Website Footer', 'تذييل الموقع Website Footer', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2306, 'sa', 'Footer Widget', 'تذييل القطعة Footer Widget', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2307, 'sa', 'About Widget', 'حول المقطع About Widget', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2308, 'sa', 'Footer Logo', 'الشعار السفلي في الفوتر', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2309, 'sa', 'About description', 'حول الوصف', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2310, 'sa', 'Link Widget One', 'رابط المقطع واحد Link Widget One', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2311, 'sa', 'Links', 'روابط', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2312, 'sa', 'Footer Bottom', 'الفوتر السفلي', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2313, 'sa', 'Copyright Widget ', 'المقطع المخصص  لحقوق النشر', '2021-01-24 20:23:28', '2021-01-24 20:23:28'),
(2314, 'sa', 'Copyright Text', 'نص حقوق النشر', '2021-01-24 20:23:29', '2021-01-24 20:23:29'),
(2315, 'sa', 'Social Link Widget ', 'مقطع  أداة الارتباط بوسائل التواصل الاجتماعي', '2021-01-24 20:23:29', '2021-01-24 20:23:29'),
(2316, 'sa', 'Show Social Links?', 'إظهار الروابط الاجتماعية؟', '2021-01-24 20:23:29', '2021-01-24 20:23:29'),
(2317, 'sa', 'Social Links', 'روابط مواقع التواصل الاجتماعية', '2021-01-24 20:23:29', '2021-01-24 20:23:29'),
(2318, 'sa', 'Payment Methods Widget ', 'مقطع طرق الدفع', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2319, 'sa', 'RTL status updated successfully', 'تم تحديث حالة RTL بنجاح', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2320, 'sa', 'Language changed to ', 'تغيرت اللغة إلى', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2321, 'sa', 'Inhouse Product sale report', 'تقرير بيع المنتج الداخلي', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2322, 'sa', 'Sort by Category', 'فرز حسب الفئة', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2323, 'sa', 'Product wise stock report', 'تقرير مخزون المنتج', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2324, 'sa', 'Currency changed to ', 'العملة تغيرت إلى', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2325, 'sa', 'Avatar', 'الصورة الرمزية أفتار', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2326, 'sa', 'Copy', 'نسخ', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2327, 'sa', 'Variant', 'البديل والتعدد', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2328, 'sa', 'Variant Price', 'سعر متغير', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2329, 'sa', 'SKU', 'رقم  SKU', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2330, 'sa', 'Key', 'مفتاح', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2331, 'sa', 'Value', 'القيمة', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2332, 'sa', 'Copy Translations', 'نسخ الترجمات', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2333, 'sa', 'All Pick-up Points', 'جميع نقاط الاستلام', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2334, 'sa', 'Add New Pick-up Point', 'أضف نقطة التقاط جديدة', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2335, 'sa', 'Manager', 'مدير', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2336, 'sa', 'Location', 'الموقع  الجغرافي والمكاني', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2337, 'sa', 'Pickup Station Contact', 'الاتصال بمحطة الالتقاط', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2338, 'sa', 'Open', 'مفتوح', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2339, 'sa', 'POS Activation for Seller', 'تفعيل نقاط البيع للبائع', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2340, 'sa', 'Order Completed Successfully.', 'تم إنجاز الطلب بنجاح.', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2341, 'sa', 'Text Input', 'إدخال نص مربع ادخال نص', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2342, 'sa', 'Select', 'اختر', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2343, 'sa', 'Multiple Select', 'اختيار متعدد', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2344, 'sa', 'Radio', 'راديو', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2345, 'sa', 'File', 'ملف', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2346, 'sa', 'Verification Info', 'معلومات التحقق', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2347, 'sa', 'Approval', 'الموافقة', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2348, 'sa', 'Due Amount', 'المبلغ المستحق', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2349, 'sa', 'Show', 'مشاهدة', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2350, 'sa', 'Pay Now', 'ادفع الآن', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2351, 'sa', 'Affiliate User Verification', 'التحقق من المستخدم الأفلييت', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2352, 'sa', 'Reject', 'رفض', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2353, 'sa', 'Accept', 'قبول', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2354, 'sa', 'Beauty, Health & Hair', 'الجمال والصحة والشعر', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2355, 'sa', 'Comparison', 'مقارنة', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2356, 'sa', 'Your comparison list is empty', 'قائمة المقارنة فارغة', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2357, 'sa', 'Convert Point To Wallet', 'تحويل النقاط إلى المحفظة', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2358, 'sa', 'Note: You need to activate wallet option first before using club point addon.', 'ملاحظة: أنت بحاجة إلى تنشيط خيار المحفظة أولاً قبل استخدام إضافة نقاط المكافئات', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2359, 'sa', 'Create an account.', 'إنشاء حساب.', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2360, 'sa', 'By signing up you agree to our terms and conditions.', 'بمجرد تسجيلم فإنك توافق على الشروط والأحكام الخاصة بنا.', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2361, 'sa', 'Create Account', 'إنشاء حساب', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2362, 'sa', 'Or Join With', 'أو انضم إلى', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2363, 'sa', 'Already have an account?', 'لديك حساب بالفعل مسبقا ؟', '2021-01-24 20:36:32', '2021-01-24 20:36:32'),
(2364, 'sa', 'Log In', 'تسجيل الدخول', '2021-01-24 20:36:33', '2021-01-24 20:36:33'),
(2365, 'sa', 'Computer & Accessories', 'كمبيوتر وإكسسوارات', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2366, 'sa', 'Product(s)', 'منتجات', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2367, 'sa', 'you ordered', 'لقد طلبت', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2368, 'sa', 'Sports & outdoor', 'معدات رياضية  وخارج المنزل', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2369, 'sa', 'Copied', 'نسخ', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2370, 'sa', 'Copy the Promote Link', 'إنسخ رابط الدعاية والتسويق', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2371, 'sa', 'Write a review', 'أكتب تقييم ومراجعة', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2372, 'sa', 'Your name', 'إسمك', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2373, 'sa', 'Comment', 'ملاحظات', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2374, 'sa', 'Your review', 'تقييمك ومراجعتك', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2375, 'sa', 'Submit review', 'إرسال المراجعة والتقييم', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2376, 'sa', 'Claire Willis', 'كلير ويليس', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2377, 'sa', 'Germaine Greene', 'جيرمين جرين', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2378, 'sa', 'Product File', 'ملف المنتج', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2379, 'sa', 'Choose file', 'اختيار ملف', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2380, 'sa', 'Type to add a tag', 'اكتب لإضافة علامة', '2021-01-24 20:38:19', '2021-01-24 21:29:59'),
(2381, 'sa', 'Images', 'الصور', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2382, 'sa', 'Main Images', 'الصورة الرئيسية', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2383, 'sa', 'Meta Tags', 'وسوم الميتا والعلامات الفوقية', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2384, 'sa', 'Digital Product has been inserted successfully', 'تم إدخال  منتج رقمي بنجاح', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2385, 'sa', 'Edit Digital Product', 'تحرير منتج رقمي', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2386, 'sa', 'Select an option', 'حدد أحد الخيارات', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2387, 'sa', 'tax', 'ضريبة', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2388, 'sa', 'Any question about this product?', 'أي سؤال حول هذا المنتج؟', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2389, 'sa', 'Sign in', 'تسجيل الدخول', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2390, 'sa', 'Other Ads of', 'إعلانات أخرى من', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2391, 'sa', 'Store Home', 'المتجر الرئيسي', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2392, 'sa', 'Top Selling', 'الأعلى  مبيعا', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2393, 'sa', 'Shop Settings', 'إعدادات المتجر', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2394, 'sa', 'Visit Shop', 'قم بزيارة المتجر', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2395, 'sa', 'Pickup Points', 'نقطة بيك أب إلتقاط وتسليم', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2396, 'sa', 'Select Pickup Point', 'حدد نقطة الالتقاط', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2397, 'sa', 'Slider Settings', 'إعدادات السلايدر', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2398, 'sa', 'Social Media Link', 'رابط الوسائط الاجتماعية', '2021-01-24 20:38:20', '2021-01-24 21:29:59'),
(2399, 'sa', 'Twitter', 'تويتر', '2021-01-24 20:38:20', '2021-01-24 21:30:00'),
(2400, 'sa', 'Google', 'جوجل', '2021-01-24 20:38:20', '2021-01-24 21:30:00'),
(2401, 'sa', 'New Arrival Products', 'منتجات وصلت حديثا', '2021-01-24 20:38:20', '2021-01-24 21:30:00'),
(2402, 'sa', 'Check Your Order Status', 'تحقق من حالة طلبك', '2021-01-24 20:38:20', '2021-01-24 21:30:00'),
(2403, 'sa', 'Shipping method', 'طريقة الشحن', '2021-01-24 20:38:20', '2021-01-24 21:30:00'),
(2404, 'sa', 'Shipped By', 'تم الشحن بواسطة', '2021-01-24 20:38:20', '2021-01-24 21:30:00'),
(2405, 'sa', 'Image', 'صورة', '2021-01-24 20:38:20', '2021-01-24 21:30:00'),
(2406, 'sa', 'Sub Sub Category', 'فئة فرعية من المستوى الثاني', '2021-01-24 20:38:20', '2021-01-24 21:30:00'),
(2407, 'sa', 'Inhouse Products', 'منتجات بالمتجر الرئيسي', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2408, 'sa', 'Forgot Password?', 'فقدت كلمة المرور؟', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2409, 'sa', 'Send Password Reset Link', 'أرسل رابط إعادة تعيين كلمة المرور', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2410, 'sa', 'index', 'الرئيسية', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2411, 'sa', 'Download Your Product', 'قم بتنزيل منتجك', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2412, 'sa', 'Option', 'خيارات', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2413, 'sa', 'Applied Refund Request', 'تطلبيق طلب الاسترداد للمنتجات', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2414, 'sa', 'Bulk Products Upload', 'تحميل المنتجات بالجملة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2415, 'sa', 'Upload CSV', 'تحميل ملف CSV', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2416, 'sa', 'Create a Ticket', 'إنشاء تذكرة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2417, 'sa', 'Tickets', 'تذكرة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2418, 'sa', 'Ticket ID', 'معرف ورقم  التذكرة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2419, 'sa', 'Sending Date', 'تاريخ الإرسال', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2420, 'sa', 'Subject', 'الموضوع', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2421, 'sa', 'View Details', 'اعرض التفاصيل', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2422, 'sa', 'Provide a detailed description', 'قدم وصفاً مفصلاً', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2423, 'sa', 'Type your reply', 'اكتب ردك', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2424, 'sa', 'Send Ticket', 'إرسال التذكرة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2425, 'sa', 'Load More', 'تحميل المزيد', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2426, 'sa', 'Jewelry & Watches', 'مجوهرات وساعات', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2427, 'sa', 'Filters', 'فلاتر', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2428, 'sa', 'Filter by', 'فلترة باستخدام', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2429, 'sa', 'Condition', 'شرط', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2430, 'sa', 'All Type', 'كل الأنواع', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2431, 'sa', 'Pay with wallet', 'ادفع باستخدام المحفظة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2432, 'sa', 'Select variation', 'اختيار تعدد الأشكال', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2433, 'sa', 'No Product Added', 'لا يوجد منتج مضاف', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2434, 'sa', 'Status has been updated successfully', 'تم تحديث الحالة بنجاح', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2435, 'sa', 'All Seller Packages', 'جميع حزم البائعين', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2436, 'sa', 'Add New Package', 'إضافة حزمة جديدة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2437, 'sa', 'Package Logo', 'شعار الحزمة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2438, 'sa', 'days', 'أياما', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2439, 'sa', 'Create New Seller Package', 'إنشاء حزمة بائع جديد', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2440, 'sa', 'Package Name', 'اسم الحزمة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2441, 'sa', 'Duration', 'المدة والفترة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2442, 'sa', 'Validity in number of days', 'الصلاحية في عدد الأيام', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2443, 'sa', 'Update Package Information', 'تحديث معلومات الحزمة', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2444, 'sa', 'Package has been inserted successfully', 'تم إدخال الحزمة بنجاح', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2445, 'sa', 'Refund Request', 'طلب استرداد', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2446, 'sa', 'Reason', 'السبب', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2447, 'sa', 'Label', 'تسمية Label', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2448, 'sa', 'Select Label', 'حدد تسمية', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2449, 'sa', 'Multiple Select Label', 'تحديد تسميات بشكل  متعدد', '2021-01-24 21:43:13', '2021-01-24 21:43:13'),
(2450, 'sa', 'Total Amount to Pay', 'المبلغ الإجمالي للدفع', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2451, 'sa', 'Requested Amount', 'المبلغ المطلوب', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2452, 'sa', 'Offline payment has been done. Please wait for response.', 'تم الدفع أوفلاين . من فضلك انتظر الرد.', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2453, 'sa', 'All Flash Deals', 'جميع عروض الفلاش', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2454, 'sa', 'Create New Flash Deal', 'قم بإنشاء صفقة فلاش جديدة', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2455, 'sa', '#FFFFFF', '# FFFFFF', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2456, 'sa', 'This image is shown as cover banner in flash deal details page.', 'هذه الصورة معروضة على هيئة غلاف بانر  في صفحة تفاصيل صفقة فلاش.', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2457, 'sa', 'Flash Deal has been inserted successfully', 'صفقة فلاش تم ادراجها بنجاح', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2458, 'sa', 'Flash deal status updated successfully', 'تم تحديث حالة صفقة فلاش بنجاح', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2459, 'sa', 'Your order has been placed successfully', 'تم وضع طلبك بنجاح', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2460, 'sa', 'This offer has been expired.', 'انتهت صلاحية هذا العرض.', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2461, 'sa', 'FlashDeal has been deleted successfully', 'تم حذف صفقة فلاش بنجاح', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2462, 'sa', 'Flash Deal has been updated successfully', 'تم تحديث  صفقة فلاش بنجاح', '2021-01-24 21:48:41', '2021-01-24 21:48:41'),
(2463, 'sa', 'Open the Navigation Bar and select Events Manager', 'افتح شريط التنقل وحدد مدير الأحداث', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2464, 'sa', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', 'انسخ معرّف Pixel الخاص بك من أسفل اسم موقعك والصق الرقم في حقل Facebook Pixel ID', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2465, 'sa', 'Google Analytics Setting', 'إعداد Google Analytics', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2466, 'sa', 'Google Analytics', 'تحليلات جوجل', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2467, 'sa', 'Tracking ID', 'معرف التتبع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2468, 'sa', 'Google Login Credential', 'بيانات اعتماد تسجيل الدخول إلى Google', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2469, 'sa', 'Client ID', 'معرف العميل', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2470, 'sa', 'Google Client ID', 'معرف عميل Google', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2471, 'sa', 'Client Secret', 'كلمة سر العميل', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2472, 'sa', 'Google Client Secret', 'كلمة سر عميل Google', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2473, 'sa', 'Facebook Login Credential', 'بيانات اعتماد تسجيل الدخول إلى Facebook', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2474, 'sa', 'App ID', 'معرف التطبيق', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2475, 'sa', 'Facebook Client ID', 'معرف عميل Facebook', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2476, 'sa', 'App Secret', 'كلمة سر التطبيق', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2477, 'sa', 'Facebook Client Secret', 'كلمة سر عميل Facebook', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2478, 'sa', 'Twitter Login Credential', 'بيانات اعتماد تسجيل الدخول إلى Twitter', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2479, 'sa', 'Twitter Client ID', 'معرف عميل Twitter', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2480, 'sa', 'Twitter Client Secret', 'كلمة سر عميل تويتر', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2481, 'sa', 'Your Shop has been created successfully!', 'تم إنشاء متجرك بنجاح!', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2482, 'sa', 'Shop Logo', 'شعار المتجر', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2483, 'sa', 'Shop Address', 'عنوان المتجر', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2484, 'sa', 'Banner Settings', 'إعدادات البانر', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2485, 'sa', 'Banners', 'البانرات', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2486, 'sa', 'We had to limit height to maintian consistancy. In some device both side of the banner might be cropped for height limitation.', 'كان علينا الحد من الارتفاع للحفاظ على الاتساق. في بعض الأجهزة ، قد يتم اقتصاص كلا جانبي الشعار للحد من الارتفاع.', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2487, 'sa', 'Insert link with https ', 'أدخل ارتباط مع https', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2488, 'sa', 'Add New Seller', 'إضافة بائع جديد', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2489, 'sa', 'Filter by Approval', 'الفلترة حسب الموافقة', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2490, 'sa', 'Non-Approved', 'غير معتمد', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2491, 'sa', 'Type name or email & Enter', 'اكتب الاسم أو البريد الإلكتروني ثم Enter', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2492, 'sa', 'Due to seller', 'مستحق للبائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2493, 'sa', 'Log in as this Seller', 'تسجيل الدخول باسم هذا البائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2494, 'sa', 'Go to Payment', 'اذهب إلى الدفع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2495, 'sa', 'Ban this seller', 'حظر هذا البائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2496, 'sa', 'Do you really want to ban this seller?', 'هل تريد حقًا حظر هذا البائع؟', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2497, 'sa', 'About', 'حول', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2498, 'sa', 'Payout Info', 'معلومات الدفع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2499, 'sa', 'Bank Acc Name', 'اسم حساب البنك', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2500, 'sa', 'Bank Acc Number', 'رقم حساب البنك', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2501, 'sa', 'Total Products', 'إجمالي المنتجات', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2502, 'sa', 'Total Sold Amount', 'إجمالي المبلغ المباع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2503, 'sa', 'Seller Payments', 'مدفوعات البائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2504, 'sa', 'Seller', 'البائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2505, 'sa', 'Payment Details', 'تفاصيل الدفع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2506, 'sa', 'Package Duration', 'مدة الباقة', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2507, 'sa', 'of seller product price will be deducted from seller earnings', 'سيتم خصم من سعر منتج البائع من أرباح البائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2508, 'sa', 'This commission only works when Category Based Commission is turned off from Business Settings', 'تعمل هذه العمولة فقط عند إيقاف تشغيل \"العمولة المستندة إلى الفئة\" من \"إعدادات الأعمال\"', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2509, 'sa', 'Commission doesn\'t work if seller package system add-on is activated', 'لا تعمل العمولة إذا تم تنشيط الوظيفة الإضافية لنظام حزمة البائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2510, 'sa', 'Edit Seller Information', 'تحرير معلومات البائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2511, 'sa', 'Seller Information', 'معلومات البائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2512, 'sa', 'Seller Withdraw Request', 'طلب سحب للبائع', '2021-01-25 00:01:42', '2021-01-25 00:01:42'),
(2513, 'sa', 'PAYTM MERCHANT WEBSITE', 'موقع PAYTM MERCHANT', '2021-01-25 00:18:30', '2021-01-25 00:18:30'),
(2514, 'sa', 'PAYTM CHANNEL', 'قناة  PAYTM 3 PAYTM', '2021-01-25 00:18:30', '2021-01-25 00:18:30'),
(2515, 'sa', 'PAYTM INDUSTRY TYPE', 'نوع الصناعة', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2516, 'sa', 'MIMO OTP', 'MIMO OTP', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2517, 'sa', 'Sendmail', 'إرسال بريد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2518, 'sa', 'Mailgun', 'Mailgun', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2519, 'sa', 'MAIL HOST', 'مضيف البريد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2520, 'sa', 'MAIL PORT', 'منفذ البريد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2521, 'sa', 'MAIL USERNAME', 'اسم مستخدم البريد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2522, 'sa', 'MAIL PASSWORD', 'كلمة مرور البريد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2523, 'sa', 'MAIL ENCRYPTION', 'تشفير البريد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2524, 'sa', 'MAIL FROM ADDRESS', 'البريد من العنوان', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2525, 'sa', 'MAIL FROM NAME', 'بريد من الاسم', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2526, 'sa', 'MAILGUN DOMAIN', 'المجال البريدي MAILGUN DOMAIN', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2527, 'sa', 'MAILGUN SECRET', 'كلمة سر البريد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2528, 'sa', 'Save Configuration', 'حفظ التكوين والإعداد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2529, 'sa', 'Test SMTP configuration', 'اختبار تكوين والإعداد  SMTP', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2530, 'sa', 'Enter your email address', 'أدخل عنوان بريدك الإلكتروني', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2531, 'sa', 'Send test email', 'إرسال بريد إلكتروني تجريبي', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2532, 'sa', 'Instruction', 'تعليمات', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2533, 'sa', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', 'يرجى توخي الحذر عند تكوين SMTP. للتكوين غير الصحيح ، ستحصل على خطأ في وقت تقديم الطلب ، التسجيل الجديد ، إرسال النشرة الإخبارية.', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2534, 'sa', 'For Non-SSL', 'لغير SSL 23', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2535, 'sa', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', 'حدد sendmail لبرنامج Mail Driver إذا واجهت أي مشكلة بعد تكوين SMTP كبرنامج تشغيل البريد', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2536, 'sa', 'Set Mail Host according to your server Mail Client Manual Settings', 'قم بتعيين مضيف البريد وفقًا للإعدادات اليدوية لعميل البريد الخاص بالخادم', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2537, 'sa', 'Set Mail port as 587', 'قم بتعيين منفذ البريد على أنه 587', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2538, 'sa', 'Set Mail Encryption as ssl if you face issue with tls', 'عيّن تشفير البريد كـ ssl إذا كنت تواجه مشكلة في tls', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2539, 'sa', 'For SSL', 'لـ SSL', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2540, 'sa', 'Set Mail port as 465', 'قم بتعيين منفذ البريد كـ 465', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2541, 'sa', 'Set Mail Encryption as ssl', 'قم بتعيين تشفير البريد كـ ssl', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2542, 'sa', 'Brand Information', 'معلومات العلامة التجارية', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2543, 'sa', 'Brand has been updated successfully', 'تم تحديث العلامة التجارية بنجاح', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2544, 'sa', 'This is used for search. Input those words by which cutomer can find this product.', 'يستخدم هذا للبحث. أدخل تلك الكلمات التي يمكن للزبون العثور على هذا المنتج من خلالها.', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2545, 'sa', 'These images are visible in product details page gallery. Use 600x600 sizes images.', 'هذه الصور مرئية في معرض صفحة تفاصيل المنتج. استخدم صور بحجم 600 × 600.', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2546, 'sa', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', 'هذه الصورة مرئية في كل علبة المنتج. استخدم صورة بحجم 300 × 300. احتفظ ببعض المساحة الفارغة حول الكائن الرئيسي لصورتك حيث كان علينا قص بعض الحواف في أجهزة مختلفة لجعلها مستجيبة.', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2547, 'sa', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', 'استخدم الارتباط الصحيح بدون معلمة إضافية. لا تستخدم رابط المشاركة القصير / كود iframe المضمن.', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2548, 'sa', 'Save Product', 'حفظ المنتج', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2549, 'sa', 'Product has been inserted successfully', 'تم إدخال المنتج بنجاح', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2550, 'sa', 'Back to uploaded files', 'رجوع إلى الملفات المرفوعة', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2551, 'sa', 'Drag & drop your files', 'قم بسحب وإسقاط ملفاتك', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2552, 'sa', 'Iyzico Credential', 'شهادة ايزيكو', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2553, 'sa', 'IYZICO_API_KEY', 'IYZICO_SECRET_KEY', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2554, 'sa', 'IYZICO_SECRET_KEY', 'IYZICO_SECRET_KEY', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2555, 'sa', 'IYZICO Sandbox Mode', 'IYZICO Sandbox Mode', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2556, 'sa', '1. Flat rate shipping cost is applicable if Flat rate shipping is enabled.', '1. يتم تطبيق تكلفة الشحن ذات السعر الثابت إذا تم تمكين الشحن بسعر موحد.', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2557, 'sa', '1. Shipping cost for admin is applicable if Seller wise shipping cost is enabled.', '1. تكلفة الشحن للمشرف قابلة للتطبيق إذا تم تمكين تكلفة الشحن الخاصة بالبائع.', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2558, 'sa', 'Facebook Pixel Setting', 'إعداد Facebook Pixel', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2559, 'sa', 'Facebook Pixel', 'فيسبوك بيكسل', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2560, 'sa', 'Facebook Pixel ID', 'معرف Facebook Pixel', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2561, 'sa', 'Please be carefull when you are configuring Facebook pixel.', 'يرجى توخي الحذر عند تكوين Facebook pixel.', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2562, 'sa', 'Log in to Facebook and go to your Ads Manager account', 'قم بتسجيل الدخول إلى Facebook وانتقل إلى حساب Ads Manager الخاص بك', '2021-01-25 00:18:31', '2021-01-25 00:18:31'),
(2563, 'sa', 'Oops, unable to copy', 'عفوًا ، غير قادر على النسخ', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2564, 'sa', 'Server information', 'معلومات الخادم', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2565, 'sa', 'Current Version', 'الإصدار الحالي', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2566, 'sa', 'Required Version', 'الإصدار المطلوب', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2567, 'sa', 'php.ini Config', 'تكوين ملف php.ini', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2568, 'sa', 'Config Name', 'اسم التكوين والإعداد', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2569, 'sa', 'Current', 'الحالي', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2570, 'sa', 'Recommended', 'الموصى بها', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2571, 'sa', 'Extensions information', 'معلومات ملحقات', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2572, 'sa', 'Extension Name', 'اسم ملحق', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2573, 'sa', 'Filesystem Permissions', 'أذونات نظام الملفات', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2574, 'sa', 'File or Folder', 'ملف أو مجلد', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2575, 'sa', 'Something went wrong!', 'حدث خطأ ما!', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2576, 'sa', 'Sorry for the inconvenience, but we\'re working on it.', 'آسف على الإزعاج ، لكننا نعمل على ذلك.', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2577, 'sa', 'Error code', 'رمز الخطأ', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2578, 'sa', 'Add New Brand', 'أضف علامة تجارية جديدة', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2579, 'sa', '120x80', '120 × 80', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2580, 'sa', 'All Attributes', 'كل السمات', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2581, 'sa', 'Add New Attribute', 'أضف سمة جديدة', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2582, 'sa', 'Filter by date', 'الفلترة حسب التاريخ', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2583, 'sa', 'Support Desk', 'مكتب وقسم  الدعم', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2584, 'sa', 'Type ticket code & Enter', 'اكتب رمز التذكرة ثم اضغد Enter', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2585, 'sa', 'User', 'مستخدم', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2586, 'sa', 'Last reply', 'الرد الأخير', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2587, 'sa', 'Conversation is disabled at this moment', 'تم تعطيل المحادثة في هذه اللحظة', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2588, 'sa', 'Basic Affiliate', 'نظام أفلييت أساسي', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2589, 'sa', 'User Registration & First Purchase', 'تسجيل المستخدم والشراء الأول', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2590, 'sa', 'Product Sharing Affiliate', 'منتسب تقاسم الأفلييت للمنتج', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2591, 'sa', 'Product Sharing and Purchasing', 'مشاركة المنتج وشرائه', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2592, 'sa', 'Product Sharing Affiliate (Category Wise)', 'شركة تابعة لمشاركة المنتج كأفلييت  (الفئة الحكيمة)', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2593, 'sa', 'Approved sellers updated successfully', 'تم تحديث  البائعين المعتمدين بنجاح', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2594, 'sa', 'Refferal Users', 'مستخدمو الروابط المتاحة', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2595, 'sa', 'Reffered By', 'المرجع بواسطة', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2596, 'sa', 'Affiliate Withdraw Request', 'طلب سحب تابع للأفلييت', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2597, 'sa', 'Affiliate Withdraw Request Reject', 'رفض طلب سحب الأموال للأفلييت', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2598, 'sa', 'Are you sure, You want to reject this?', 'هل أنت متأكد أنك تريد رفض هذا؟', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2599, 'sa', 'Account Name', 'اسم الحساب', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2600, 'sa', 'Account Number', 'رقم الحساب', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2601, 'sa', 'Routing Number', 'رقم التوجيه', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2602, 'sa', 'Offline Wallet Recharge Requests', 'طلبًا لإعادة شحن المحفظة أوفلاين', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2603, 'sa', 'Method', 'طريقة', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2604, 'sa', 'TXN ID', 'معرف TXN', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2605, 'sa', 'Money has been added successfully', 'تم إضافة  المال بنجاح', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2606, 'sa', 'Offline Seller Package Payment Requests', 'طلبات دفع حزمة البائع أوفلاين', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2607, 'sa', 'Reciept', 'استلام', '2021-01-25 00:35:29', '2021-01-25 00:36:03'),
(2608, 'sa', 'Offline Seller Package Payment approved successfully', 'تمت الموافقة على  دفعة حزمة البائع أوفلاين  بنجاح', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2609, 'sa', 'Paytm Credential', 'اعتماد وتهيئة  Paytm', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2610, 'sa', 'PAYTM ENVIRONMENT', 'بيئة  PAYTM', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2611, 'sa', 'PAYTM MERCHANT ID', 'معرف تاجر PAYTM MERCHANT ID', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2612, 'sa', 'PAYTM MERCHANT KEY', 'مفتاح التاجر PAYTM MERCHANT KEY', '2021-01-25 00:35:29', '2021-01-25 00:35:29'),
(2613, 'sa', 'You need to configure Twitter Client correctly to enable this feature', 'تحتاج إلى تكوين عميل تويتر بشكل صحيح لتمكين هذه الميزة', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2614, 'sa', 'We are Under Maintenance.', 'نحن الآن بالمتجر  تحت الصيانة.', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2615, 'sa', 'We will be back soon!', 'سنعود قريبا!', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2616, 'sa', 'Parent Category', 'الفئة الأصل أو الأب', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2617, 'sa', 'Category Information', 'معلومات الفئة', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2618, 'sa', 'No Parent', 'لا يوجد فئة أصل أو والد', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2619, 'sa', 'Physical', 'مادية  وملموس', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2620, 'sa', 'Digital', 'رقمي', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2621, 'sa', '200x200', '200 × 200', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2622, 'sa', '32x32', '32 × 32', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2623, 'sa', 'Search your files', 'ابحث في ملفاتك', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2624, 'sa', 'Category has been inserted successfully', 'تم إدراج  الفئة بنجاح', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2625, 'sa', 'Category has been deleted successfully', 'تم حذف الفئة بنجاح', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2626, 'sa', 'Translatable', 'مترجم', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2627, 'sa', 'Category has been updated successfully', 'تم تحديث التصنيف بنجاح', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2628, 'sa', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', 'لدينا بانر محدود الإرتفاع للحفاظ على واجهة المستخدم. كان علينا الاقتصاص من كلا الجانبين الأيسر والأيمن في عرض الأجهزة المختلفة لجعلها تستجيب ومتجاوبة مع التصميم . قبل تصميم البانر ضع هذه النقاط في الاعتبار.', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2629, 'sa', 'Language has been deleted successfully', 'تم حذف اللغة بنجاح', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2630, 'sa', 'Type key & Enter', 'اكتب مفتاح ثم  Enter', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2631, 'sa', 'Translations updated for ', 'تم تحديث الترجمات ل', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2632, 'sa', 'Install/Update Addon', 'تثبيت / تحديث الملحق والإضافة', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2633, 'sa', 'No Addon Installed', 'لا يوجد ملحق  أو إضافة مثبتة', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2634, 'sa', 'Install/Update', 'تثبيت / تحديث', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2635, 'sa', 'Addon nstalled successfully', 'تم تثبيت الملحق والإضافة  بنجاح', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2636, 'sa', 'Use Phone Instead', 'استخدم الهاتف بدلاً من ذلك', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2637, 'sa', 'Phone Verification', 'التحقق من الهاتف', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2638, 'sa', 'Resend Code', 'إعادة إرسال الرمز', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2639, 'sa', 'Registration successfull.', 'التسجيل ناجح.', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2640, 'sa', 'All Customers', 'جميع الزبائن', '2021-01-25 00:50:52', '2021-01-25 00:50:52'),
(2641, 'sa', 'Type email or name & Enter', 'اكتب البريد الإلكتروني أو الاسم ثم Enter', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2642, 'sa', 'Package', 'باكيج', '2021-01-25 00:50:53', '2021-11-25 12:56:39'),
(2643, 'sa', 'Wallet Balance', 'رصيد المحفظة', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2644, 'sa', 'Log in as this Customer', 'تسجيل الدخول باسم هذا العميل', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2645, 'sa', 'Ban this Customer', 'حظر هذا الزبون', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2646, 'sa', 'Do you really want to ban this Customer?', 'هل تريد حقًا حظر هذا العميل؟', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2647, 'sa', 'Proceed!', 'تم العمل على ذلك  تابع!', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2648, 'sa', 'Do you really want to unban this Customer?', 'هل تريد حقًا إلغاء حظر هذا العميل؟', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2649, 'sa', 'All uploaded files', 'جميع الملفات المرفوعة', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2650, 'sa', 'Upload New File', 'تحميل ملف جديد', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2651, 'sa', 'All files', 'جميع الملفات', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2652, 'sa', 'Search', 'بحث', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2653, 'sa', 'Details Info', 'تفاصيل المعلومات', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2654, 'sa', 'Copy Link', 'نسخ الرابط', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2655, 'sa', 'Are you sure to delete this file?', '48 هل أنت متأكد من حذف هذا الملف؟', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2656, 'sa', 'File Info', 'معلومات الملف', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2657, 'sa', 'Link copied to clipboard', 'تم نسخ الارتباط إلى الحافظة', '2021-01-25 00:50:53', '2021-01-25 00:50:53'),
(2658, 'sa', 'Radio Label', 'تسمية الراديو', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2659, 'sa', 'Pickup Point Orders', 'طلبات نقطة الاستلام', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2660, 'sa', 'View', 'مشاهدة', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2661, 'sa', 'Order #', '#طلب', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2662, 'sa', 'Order Status', 'حالة الطلب', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2663, 'sa', 'Total amount', 'المبلغ الإجمالي', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2664, 'sa', 'TOTAL', 'المجموع', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2665, 'sa', 'Delivery status has been updated', 'تم تحديث حالة التسليم', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2666, 'sa', 'Payment status has been updated', 'تم تحديث حالة الدفع', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2667, 'sa', 'INVOICE', 'فاتورة', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2668, 'sa', 'Set Refund Time', 'ضبط وقت الاسترداد', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2669, 'sa', 'Set Time for sending Refund Request', 'تعيين الوقت لإرسال طلب استرداد', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2670, 'sa', 'Set Refund Sticker', 'تعيين ملصق استرداد', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2671, 'sa', 'Sticker', 'ملصق', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2672, 'sa', 'Refund Request All', 'طلب استرداد الكل', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2673, 'sa', 'Order Id', 'معرف الطلب', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2674, 'sa', 'Seller Approval', 'موافقة البائع', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2675, 'sa', 'Admin Approval', 'موافقة المسؤول', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2676, 'sa', 'Refund Status', 'حالة رد الأموال', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2677, 'sa', 'No Refund', 'لا يرد', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2678, 'sa', 'Status updated successfully', 'تم تحديث الحالة بنجاح', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2679, 'sa', 'User Search Report', 'تقرير بحث المستخدم', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2680, 'sa', 'Search By', 'بحث بواسطة', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2681, 'sa', 'Number searches', 'عدد عمليات البحث', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2682, 'sa', 'Sender', 'المرسل', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2683, 'sa', 'Receiver', 'المستقبل', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2684, 'sa', 'Verification form updated successfully', 'تم تحديث نموذج التحقق بنجاح', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2685, 'sa', 'All Coupons', 'جميع القسائم', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2686, 'sa', 'Add New Coupon', 'إضافة قسيمة جديدة', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2687, 'sa', 'Coupon Information', 'معلومات القسيمة', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2688, 'sa', 'Start Date', 'تاريخ البدء', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2689, 'sa', 'End Date', 'تاريخ الانتهاء', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2690, 'sa', 'Product Base', 'قاعدة المنتج', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2691, 'sa', 'Send Newsletter', 'إرسال النشرة الإخبارية', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2692, 'sa', 'Mobile Users', 'مستخدمو الهاتف المحمول', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2693, 'sa', 'SMS subject', 'موضوع الرسالة', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2694, 'sa', 'SMS content', 'محتوى SMS', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2695, 'sa', 'All Flash Delas', 'كل عروض فلاش', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2696, 'sa', 'Create New Flash Dela', 'إنشاء عرض فلاش جديد', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2697, 'sa', 'Page Link', 'رابط الصفحة', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2698, 'sa', 'Flash Deal Information', 'معلومات عن صفقة فلاش', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2699, 'sa', 'Background Color', 'لون الخلفية', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2700, 'sa', '#0000ff', '#0000ff', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2701, 'sa', 'Text Color', 'لون النص', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2702, 'sa', 'White', 'أبيض', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2703, 'sa', 'Dark', 'داكن', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2704, 'sa', 'Choose Products', 'اختر المنتجات', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2705, 'sa', 'Discounts', 'خصومات', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2706, 'sa', 'Discount Type', 'نوع الخصم', '2021-01-25 01:55:57', '2021-01-25 01:55:57'),
(2707, 'sa', 'Twillo Credential', 'Twillo Credential', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2708, 'sa', 'TWILIO SID', 'TWILIO SID', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2709, 'sa', 'TWILIO VERIFY SID', 'TWILIO VERIFY SID', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2710, 'sa', 'VALID TWILLO NUMBER', 'VALID TWILLO NUMBER', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2711, 'sa', 'Nexmo Credential', 'Nexmo Credential', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2712, 'sa', 'NEXMO KEY', 'NEXMO KEY', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2713, 'sa', 'NEXMO SECRET', 'NEXMO SECRET', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2714, 'sa', 'SSL Wireless Credential', 'SSL Wireless Credential', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2715, 'sa', 'SSL SMS SID', 'SSL SMS SID', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2716, 'sa', 'SSL SMS URL', 'SSL SMS URL', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2717, 'sa', 'Fast2SMS Credential', 'Fast2SMS Credential', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2718, 'sa', 'AUTH KEY', 'AUTH KEY', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2719, 'sa', 'ROUTE', 'ROUTE', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2720, 'sa', 'Promotional Use', 'الاستخدام الترويجي', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2721, 'sa', 'Transactional Use', 'استخدام المعاملات', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2722, 'sa', 'SENDER ID', 'هوية المرسل', '2021-01-25 02:07:25', '2021-01-25 02:07:25');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(2723, 'sa', 'Nexmo OTP', 'Nexmo OTP', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2724, 'sa', 'Twillo OTP', 'Twillo OTP', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2725, 'sa', 'SSL Wireless OTP', 'SSL Wireless OTP', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2726, 'sa', 'Fast2SMS OTP', 'Fast2SMS OTP', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2727, 'sa', 'Order Placement', 'إدراج الطلبية', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2728, 'sa', 'Delivery Status Changing Time', 'وقت تغيير حالة التسليم', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2729, 'sa', 'Paid Status Changing Time', 'وقت تغيير الحالة المدفوعة', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2730, 'sa', 'Send Bulk SMS', 'إرسال رسائل نصية مجمعة', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2731, 'sa', 'Coupon Information Adding', 'إضافة معلومات القسيمة', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2732, 'sa', 'Coupon Type', 'نوع القسيمة', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2733, 'sa', 'For Products', 'للمنتجات', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2734, 'sa', 'For Total Orders', 'لإجمالي الطلبات', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2735, 'sa', 'Add Your Product Base Coupon', 'أضف قسيمة قاعدة المنتج الخاصة بك', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2736, 'sa', 'Coupon code', 'رمز القسيمة', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2737, 'sa', 'Sub Category', 'فئة فرعية', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2738, 'sa', 'Add More', 'أضف المزيد', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2739, 'sa', 'Minimum Shopping', 'الحد الأدنى من التسوق', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2740, 'sa', 'Maximum Discount Amount', 'الحد الأقصى لمبلغ الخصم', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2741, 'sa', 'Coupon Information Update', 'تحديث معلومات القسيمة', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2742, 'sa', 'Configure Now', 'تكوين وإعداد الآن', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2743, 'sa', 'Total published products', 'إجمالي المنتجات المنشورة', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2744, 'sa', 'Total sellers products', 'مجموع منتجات البائعين', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2745, 'sa', 'Total admin products', 'إجمالي المنتجات الإدارية', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2746, 'sa', 'Manage Products', 'إدارة المنتجات', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2747, 'sa', 'Total product category', 'مجموع المنتجات للفئة الإجمالية', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2748, 'sa', 'Create Category', 'إنشاء فئة', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2749, 'sa', 'Total product sub sub category', 'إجمالي فئة فرع  فرعية للمنتج', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2750, 'sa', 'Create Sub Sub Category', 'إنشاء فئة فرع  فرعية', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2751, 'sa', 'Total product sub category', 'إجمالي المنتجات  للفئة فرعية', '2021-01-25 02:07:25', '2021-01-25 02:07:25'),
(2752, 'sa', 'Create Sub Category', 'إنشاء فئة فرعية', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2753, 'sa', 'Total product brand', 'إجمالي علامة المنتج', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2754, 'sa', 'Create Brand', 'إنشاء علامة تجارية', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2755, 'sa', 'Total sellers', 'مجموع البائعين', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2756, 'sa', 'Total approved sellers', 'إجمالي البائعين المعتمدين', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2757, 'sa', 'Total pending sellers', 'إجمالي البائعين في قائمة الإنتظار', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2758, 'sa', 'Manage Sellers', 'إدارة البائعين', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2759, 'sa', 'Category wise product sale', 'فئة بيع المنتجات الأكثر قبولا', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2760, 'sa', 'Sale', 'بيع', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2761, 'sa', 'Category wise product stock', 'فئة مخزون المنتجات الحكيمة', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2762, 'sa', 'Category Name', 'اسم الفئة', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2763, 'sa', 'Stock', 'المخزون', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2764, 'sa', 'Frontend', 'الواجهة الأمامية', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2765, 'sa', 'Home page', 'الصفحة الرئيسية', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2766, 'sa', 'setting', 'الإعدادات', '2021-01-25 02:26:08', '2021-01-25 02:27:27'),
(2767, 'sa', 'Policy page', 'صفحة السياسة', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2768, 'sa', 'General', 'عام', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2769, 'sa', 'Click Here', 'انقر هنا', '2021-01-25 02:26:08', '2021-01-25 02:27:27'),
(2770, 'sa', 'Useful link', 'رابط مفيد', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2771, 'sa', 'Activation', 'تفعيل', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2772, 'sa', 'SMTP', 'SMTP', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2773, 'sa', 'Payment method', 'طريقة الدفع', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2774, 'sa', 'Social media', 'سوشال ميديا', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2775, 'sa', 'Business', 'الأعمال', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2776, 'sa', 'Seller verification', 'تفعيل حساب التاجر', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2777, 'sa', 'form setting', 'من الإعدادات', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2778, 'sa', 'Language', 'اللغة', '2021-01-25 02:26:08', '2021-01-25 02:26:08'),
(2779, 'sa', 'Dashboard', 'لوحة التحكم', '2021-01-25 02:26:08', '2021-01-25 02:27:27'),
(2780, 'sa', 'POS System', 'نظام نقاط البيع POS', '2021-01-25 02:26:08', '2021-01-25 02:27:28'),
(2781, 'sa', 'POS Manager', 'مدير نظام نقاط البيع POS', '2021-01-25 02:26:08', '2021-01-25 02:27:28'),
(2782, 'sa', 'POS Configuration', 'تهيئة وإعداد  نظام نقاط البيع POS', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2783, 'sa', 'Products', 'المنتجات', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2784, 'sa', 'Add New product', 'أضف منتج جديد', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2785, 'sa', 'All Products', 'جميع المنتجات', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2786, 'sa', 'In House Products', 'منتجات داخل المتجر الرئيسي', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2787, 'sa', 'Seller Products', 'منتجات البائع', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2788, 'sa', 'Digital Products', 'منتجات رقمية', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2789, 'sa', 'Bulk Import', 'إستيراد بالجملة لمجموعة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2790, 'sa', 'Bulk Export', 'تصدير بالجملة لمجموعة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2791, 'sa', 'Category', 'الفئة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2792, 'sa', 'Subcategory', 'الفئة الفرعية', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2793, 'sa', 'Sub Subcategory', 'الفئة الفرع فرعية', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2794, 'sa', 'Brand', 'علامة تجارية \"ماركة\"', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2795, 'sa', 'Attribute', 'السمات والحقول', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2796, 'sa', 'Product Reviews', 'تقييمات ومراجعات المنتج', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2797, 'sa', 'Sales', 'المبيعات', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2798, 'sa', 'All Orders', 'جميع الطلبات', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2799, 'sa', 'Inhouse orders', 'الطلبات في المتجر الرئيسي', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2800, 'sa', 'Seller Orders', 'طلبات التاجر', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2801, 'sa', 'Pick-up Point Order', 'طلب نقطة الاستلام', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2802, 'sa', 'Refunds', 'المرتجعات والمعادة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2803, 'sa', 'Refund Requests', 'طلب إسترجاع', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2804, 'sa', 'Approved Refund', 'قبول الإرجاع', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2805, 'sa', 'Refund Configuration', 'تهيئة وإعداد الإسترجاع', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2806, 'sa', 'Customers', 'الزبائن', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2807, 'sa', 'Customer list', 'قائمة الزبائن', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2808, 'sa', 'Classified Products', 'المنتجات المبوبة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2809, 'sa', 'Classified Packages', 'الحزم المبوبة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2810, 'sa', 'Sellers', 'البائعين', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2811, 'sa', 'All Seller', 'كل البائعين', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2812, 'sa', 'Payouts', 'المدفوعات', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2813, 'sa', 'Payout Requests', 'طلبات المدفوعات', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2814, 'sa', 'Seller Commission', 'عمولة البائع', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2815, 'sa', 'Seller Packages', 'حزم البائع', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2816, 'sa', 'Seller Verification Form', 'نموذج التحقق من البائع', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2817, 'sa', 'Reports', 'تقارير', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2818, 'sa', 'In House Product Sale', 'بيع المنتجات في المتجر الرئيسي', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2819, 'sa', 'Seller Products Sale', 'بيع منتجات البائع', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2820, 'sa', 'Products Stock', 'مخزون المنتجات', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2821, 'sa', 'User Searches', 'عمليات بحث المستخدم', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2822, 'sa', 'Marketing', 'التسويق', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2823, 'sa', 'Flash deals', 'صفقات فلاش', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2824, 'sa', 'Newsletters', 'نشرة إخبارية', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2825, 'sa', 'Bulk SMS', 'رسالة نصية شاملة ومجمعة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2826, 'sa', 'Coupon', 'القسيمة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2827, 'sa', 'Support', 'الدعم', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2828, 'sa', 'Ticket', 'تذكرة', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2829, 'sa', 'Product Queries', 'استفسارات عن المنتج', '2021-01-25 02:41:35', '2021-01-25 02:41:35'),
(2830, 'sa', 'Website Setup', 'إعدادات الموقع الإلكتروني', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2831, 'sa', 'Header', 'رأس الموقع الهيدر', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2832, 'sa', 'Footer', 'الفوتر ذيل الموقع', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2833, 'sa', 'Pages', 'الصفحات', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2834, 'sa', 'Appearance', 'المظهر العام', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2835, 'sa', 'Setup & Configurations', 'الإعداد والتكوينات', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2836, 'sa', 'General Settings', 'إعدادات عامة', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2837, 'sa', 'Features activation', 'ميزات التنشيط', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2838, 'sa', 'Languages', 'اللغات', '2021-01-25 03:15:44', '2021-11-25 12:58:01'),
(2839, 'sa', 'Currency', 'العملة', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2840, 'sa', 'Pickup point', 'نقطة الالتقاط', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2841, 'sa', 'SMTP Settings', 'إعدادات SMTP', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2842, 'sa', 'Payment Methods', 'طرق الدفع', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2843, 'sa', 'File System Configuration', 'تكوين وإعداد نظام الملفات', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2844, 'sa', 'Analytics Tools', 'أدوات التحليلات', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2845, 'sa', 'Google reCAPTCHA', 'جوجل reCAPTCHA', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2846, 'sa', 'Shipping Configuration', 'تكوين وتهيئة الشحن', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2847, 'sa', 'Shipping Countries', 'دول الشحن', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2848, 'sa', 'Affiliate System', 'نظام الانتساب للأفلييت', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2849, 'sa', 'Affiliate Configurations', 'تهيئة وتكوينات الأفلييت', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2850, 'sa', 'Affiliate Users', 'المستخدمين  المنتسبين للأفلييت', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2851, 'sa', 'Referral Users', 'مستخدمو تم قدومهم من خلال روابط الإحالة', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2852, 'sa', 'Affiliate Withdraw Requests', 'طلبات سحب النقود للأفلييت', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2853, 'sa', 'Offline Payment System', 'نظام الدفع أوفلاين', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2854, 'sa', 'Manual Payment Methods', 'طرق الدفع اليدوية', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2855, 'sa', 'Offline Wallet Recharge', 'إعادة شحن المحفظة أوفلاين', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2856, 'sa', 'Offline Customer Package Payments', 'مدفوعات حزمة العملاء أفلاين', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2857, 'sa', 'Offline Seller Package Payments', 'مدفوعات حزمة البائع أفلاين', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2858, 'sa', 'Paytm Payment Gateway', 'بوابة الدفع Paytm', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2859, 'sa', 'Set Paytm Credentials', 'تعيين وتهيئة Paytm', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2860, 'sa', 'Club Point System', 'نظام نقاط المكافئات', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2861, 'sa', 'Club Point Configurations', 'تهيئة نظام  نقاط المكافئات', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2862, 'sa', 'Set Product Point', 'تعيين نقاط المنتج  المكافئة', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2863, 'sa', 'User Points', 'عدد نقاط المستخدم', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2864, 'sa', 'OTP System', 'نظام OTP', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2865, 'sa', 'OTP Configurations', 'تهيئة نظام  OTP', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2866, 'sa', 'Set OTP Credentials', 'صلاحيات واعتماد نظام OTP', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2867, 'sa', 'Staffs', 'طاقم العمل', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2868, 'sa', 'All staffs', 'جميع الموظفين', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2869, 'sa', 'Staff permissions', 'أذونات  وصلاحيات الموظفين', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2870, 'sa', 'Addon Manager', 'مدير الملحقات والإضافات', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2871, 'sa', 'Browse Website', 'تصفح الموقع', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2872, 'sa', 'POS', 'نظام  نقاط البيع POS', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2873, 'sa', 'Notifications', 'التنبيهات والإخطارات', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2874, 'sa', 'new orders', 'طلبات  جديدة', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2875, 'sa', 'user-image', 'صورة المستخدم', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2876, 'sa', 'Profile', 'الملف الشخصي', '2021-01-25 03:15:44', '2021-01-25 03:15:44'),
(2877, 'sa', 'Page Not Found!', 'الصفحة غير متوفرة!', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2878, 'sa', 'Seller Policy', 'سياسة البائع', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2879, 'sa', 'Confirmation', 'التأكيد', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2880, 'sa', 'Delete confirmation message', 'حذف رسالة التأكيد', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2881, 'sa', 'Cancel', 'إلغاء', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2882, 'sa', 'Delete', 'حذف', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2883, 'sa', 'Total Earnings From', 'إجمالي الأرباح من', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2884, 'sa', 'Client Subscription', 'اشتراك العميل', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2885, 'sa', 'Product category', 'فئة المنتج', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2886, 'sa', 'Product sub sub category', 'فئة فرع  فرعية المنتج', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2887, 'sa', 'Product sub category', 'فئة فرعية للمنتج', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2888, 'sa', 'Product brand', 'ماركة المنتج', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2889, 'sa', 'Top Client Packages', 'أفضل حزم  العملاء', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2890, 'sa', 'Top Freelancer Packages', 'باقة  أفضل العاملين لحسابهم الخاص', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2891, 'sa', 'Number of sale', 'عدد البيع', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2892, 'sa', 'Number of Stock', 'عدد المخزون', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2893, 'sa', 'Top 10 Products', 'أفضل 10 منتجات', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2894, 'sa', 'Top 12 Products', 'أفضل 12 منتجًا', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2895, 'sa', 'Filter by Rating', 'فلترة حسب التصنيف', '2021-01-25 03:22:10', '2021-01-25 03:22:10'),
(2896, 'sa', 'Published reviews updated successfully', 'تم تحديث المراجعات المنشورة بنجاح', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2897, 'sa', 'Refund Sticker has been updated successfully', 'تم تحديث ملصق رد الأموال بنجاح', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2898, 'sa', 'Edit Product', 'تحرير المنتج', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2899, 'sa', 'Meta Images', 'صور ميتا', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2900, 'sa', 'Update Product', 'تحديث المنتج', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2901, 'sa', 'Product has been deleted successfully', 'تم حذف المنتج بنجاح', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2902, 'sa', 'Your Profile has been updated successfully!', 'تم تحديث ملف التعريف الخاص بك بنجاح!', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2903, 'sa', 'Upload limit has been reached. Please upgrade your package.', 'تم الوصول إلى حد التحميل. الرجاء ترقية الحزمة الخاصة بك.', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2904, 'sa', 'Add Your Product', 'أضف منتجك', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2905, 'sa', 'Select a category', 'اختر فئة', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2906, 'sa', 'Select a brand', 'اختر ماركة', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2907, 'sa', 'Product Unit', 'وحدة المنتج', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2908, 'sa', 'Minimum Qty.', 'الحد الأدنى من الكمية.', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2909, 'sa', 'Product Tag', 'علامة المنتج', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2910, 'sa', 'Type & hit enter', 'اكتب واضغط Enter', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2911, 'sa', 'Videos', 'فيديو', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2912, 'sa', 'Video From', 'فيديو من', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2913, 'sa', 'Video URL', 'رابط الفيديو', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2914, 'sa', 'Customer Choice', 'اختيار العميل', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2915, 'sa', 'PDF', 'PDF', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2916, 'sa', 'Choose PDF', 'اختر PDF', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2917, 'sa', 'Select Category', 'اختر الفئة', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2918, 'sa', 'Target Category', 'الفئة المستهدفة', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2919, 'sa', 'subsubcategory', 'فئة فرع فرعية', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2920, 'sa', 'Search Category', 'فئة البحث', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2921, 'sa', 'Search SubCategory', 'بحث في الفئات الفرعية', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2922, 'sa', 'Search SubSubCategory', 'بحث في الفئات الفرع فرعية', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2923, 'sa', 'Update your product', 'قم بتحديث منتجك', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2924, 'sa', 'Product has been updated successfully', 'تم تحديث المنتج بنجاح', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2925, 'sa', 'Add Your Digital Product', 'أضف منتجك الرقمي', '2021-01-25 03:40:00', '2021-01-25 03:40:00'),
(2926, 'sa', 'Active eCommerce CMS Update Process', 'عملية تحديث المتجر الإلكتروني', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2927, 'sa', 'You will need to know the following items before\r\n        proceeding', 'سوف تحتاج إلى معرفة العناصر التالية قبل المتابعة', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2928, 'sa', 'Codecanyon purchase code', 'كود شراء اضافات', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2929, 'sa', 'Database Name', 'اسم قاعدة البيانات', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2930, 'sa', 'Database Username', 'اسم مستخدم قاعدة البيانات', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2931, 'sa', 'Database Password', 'كلمة مرور قاعدة البيانات', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2932, 'sa', 'Database Hostname', 'اسم مضيف قاعدة البيانات', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2933, 'sa', 'Update Now', 'التحديث الآن', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2934, 'sa', 'You will need to know the following items before\r\n                            proceeding', 'سوف تحتاج إلى معرفة العناصر التالية قبل المتابعة', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2935, 'sa', 'Congratulations', 'ألف مبروك', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2936, 'sa', 'Go to Home', 'اذهب إلى الصفحة الرئيسية', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2937, 'sa', 'S3 File System Credentials', 'تهيئة اعتماد نظام الملفات  S3 File System Credentials', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2938, 'sa', 'AWS_ACCESS_KEY_ID', 'AWS_ACCESS_KEY_ID', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2939, 'sa', 'AWS_SECRET_ACCESS_KEY', 'AWS_SECRET_ACCESS_KEY', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2940, 'sa', 'AWS_DEFAULT_REGION', 'AWS_DEFAULT_REGION', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2941, 'sa', 'AWS_BUCKET', 'AWS_BUCKET', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2942, 'sa', 'AWS_URL', 'AWS_URL', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2943, 'sa', 'S3 File System Activation', 'S3 File System Activation', '2021-01-25 03:40:01', '2021-01-25 03:40:01'),
(2944, 'sa', 'Zip File', 'الملف المضغوط Zip File', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2945, 'sa', 'Install', 'تنصيب  Install', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2946, 'sa', 'This version is not capable of installing Addons, Please update.', 'هذا الإصدار غير قادر على تثبيت الإضافات ، يرجى التحديث.', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2947, 'sa', 'Order', 'طلبية', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2948, 'sa', 'Search in menu', 'البحث في القائمة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2949, 'sa', 'Uploaded Files', 'تحميل الملفات', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2950, 'sa', 'System', 'النظام', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2951, 'sa', 'Server status', 'حالة السيرفر', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2952, 'sa', 'Nothing Found', 'لا شيء موجود', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2953, 'sa', 'HTTPS Activation', 'تفعيل HTTPS', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2954, 'sa', 'Maintenance Mode', 'نمط وحالة  الصيانة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2955, 'sa', 'Maintenance Mode Activation', 'تنشيط وضع الصيانة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2956, 'sa', 'Classified Product Activate', 'تنشيط المنتجات  المبوبة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2957, 'sa', 'Classified Product', 'منتج مبوب ومصنف', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2958, 'sa', 'Business Related', 'الأعمال ذات الصلة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2959, 'sa', 'Vendor System Activation', 'تفعيل نظام البائع', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2960, 'sa', 'Wallet System Activation', 'تفعيل نظام المحفظة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2961, 'sa', 'Coupon System Activation', 'تفعيل نظام القسائم والكوبونات', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2962, 'sa', 'Pickup Point Activation', 'تفعيل نقطة الالتقاط', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2963, 'sa', 'Conversation Activation', 'تفعيل المحادثة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2964, 'sa', 'Guest Checkout Activation', 'تفعيل تسجيل خروج الزائر', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2965, 'sa', 'Category-based Commission', 'عمولة على أساس الفئة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2966, 'sa', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', 'بعد تفعيل هذا الخيار ، سيتم تعطيل عمولة البائع وتحتاج إلى تعيين العمولة على كل فئة وإلا فلن يحصل المسؤول على أي عمولة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2967, 'sa', 'Set Commisssion Now', 'تعيين العمولة الآن', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2968, 'sa', 'Payment Related', 'طريقة الدفع ذات الصلة', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2969, 'sa', 'Paypal Payment Activation', 'Paypal Payment Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2970, 'sa', 'You need to configure Paypal correctly to enable this feature', 'You need to configure Paypal correctly to enable this feature', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2971, 'sa', 'Stripe Payment Activation', 'Stripe Payment Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2972, 'sa', 'SSlCommerz Activation', 'SSlCommerz Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2973, 'sa', 'Instamojo Payment Activation', 'Instamojo Payment Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2974, 'sa', 'You need to configure Instamojo Payment correctly to enable this feature', 'You need to configure Instamojo Payment correctly to enable this feature', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2975, 'sa', 'Razor Pay Activation', 'Razor Pay Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2976, 'sa', 'You need to configure Razor correctly to enable this feature', 'You need to configure Razor correctly to enable this feature', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2977, 'sa', 'PayStack Activation', 'PayStack Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2978, 'sa', 'You need to configure PayStack correctly to enable this feature', 'You need to configure PayStack correctly to enable this feature', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2979, 'sa', 'VoguePay Activation', 'VoguePay Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2980, 'sa', 'You need to configure VoguePay correctly to enable this feature', 'You need to configure VoguePay correctly to enable this feature', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2981, 'sa', 'Payhere Activation', 'Payhere Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2982, 'sa', 'Ngenius Activation', 'Ngenius Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2983, 'sa', 'You need to configure Ngenius correctly to enable this feature', 'You need to configure Ngenius correctly to enable this feature', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2984, 'sa', 'Iyzico Activation', 'Iyzico Activation', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2985, 'sa', 'You need to configure iyzico correctly to enable this feature', 'You need to configure iyzico correctly to enable this feature', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2986, 'sa', 'Cash Payment Activation', 'تفعيل الدفع النقدي', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2987, 'sa', 'You need to configure Google Client correctly to enable this feature', 'You need to configure Google Client correctly to enable this feature', '2021-01-25 03:54:00', '2021-01-25 03:54:00'),
(2988, 'en', '200x300', '200x300', '2021-01-25 22:59:42', '2021-01-25 22:59:42'),
(2989, 'sa', 'ملابس ستاتي', 'ملابس ستاتي', '2021-02-04 04:52:35', '2021-02-04 04:52:35'),
(2990, 'sa', 'ملابس بيبي', 'ملابس بيبي', '2021-02-04 05:40:36', '2021-02-04 05:40:36'),
(2991, 'sa', 'OFF', 'OFF', '2021-02-04 05:53:00', '2021-02-04 05:53:00'),
(2992, 'sa', 'ملابس ولادي', 'ملابس ولادي', '2021-02-05 06:45:07', '2021-02-05 06:45:07'),
(2993, 'sa', 'ملابس بناتي', 'ملابس بناتي', '2021-02-05 06:45:11', '2021-02-05 06:45:11'),
(2994, 'sa', 'أحذية', 'أحذية', '2021-02-05 06:45:17', '2021-02-05 06:45:17'),
(2995, 'sa', 'Approval has been done successfully', 'Approval has been done successfully', '2021-02-07 10:42:21', '2021-02-07 10:42:21'),
(2996, 'sa', 'Refund has been sent successfully', 'Refund has been sent successfully', '2021-02-07 10:42:21', '2021-02-07 10:42:21'),
(2997, 'sa', 'ALL COUNT', 'ALL COUNT', '2021-02-07 11:23:47', '2021-02-07 11:23:47'),
(2998, 'sa', 'متوسط التكلفة', 'متوسط التكلفة', '2021-02-07 11:23:47', '2021-02-07 11:23:47'),
(2999, 'sa', 'التكلفة', 'التكلفة', '2021-02-07 11:23:47', '2021-02-07 11:23:47'),
(3000, 'sa', 'سعر البيع', 'سعر البيع', '2021-02-07 11:23:47', '2021-02-07 11:23:47'),
(3001, 'sa', 'اجمالي البيع', 'اجمالي البيع', '2021-02-07 11:23:47', '2021-02-07 11:23:47'),
(3002, 'sa', 'متوقع الربح', 'متوقع الربح', '2021-02-07 11:23:47', '2021-02-07 11:23:47'),
(3003, 'sa', 'Role Information', 'Role Information', '2021-02-07 11:42:12', '2021-02-07 11:42:12'),
(3004, 'sa', 'Permissions', 'Permissions', '2021-02-07 11:42:12', '2021-02-07 11:42:12'),
(3005, 'sa', '200x300', '200x300', '2021-02-15 00:41:20', '2021-02-15 00:41:20'),
(3006, 'sa', 'upsale', 'upsale', '2021-06-24 01:56:05', '2021-06-24 01:56:05'),
(3007, 'sa', 'crose sale', 'crose sale', '2021-06-24 01:56:06', '2021-06-24 01:56:06'),
(3008, 'sa', 'upsale Product', 'upsale Product', '2021-06-24 02:07:33', '2021-06-24 02:07:33'),
(3009, 'sa', 'number', 'number', '2021-06-24 02:07:33', '2021-06-24 02:07:33'),
(3010, 'sa', 'delet', 'delet', '2021-06-24 02:09:46', '2021-06-24 02:09:46'),
(3011, 'sa', 'cross sale Product', 'cross sale Product', '2021-06-24 02:14:28', '2021-06-24 02:14:28'),
(3012, 'sa', 'crose products', 'crose products', '2021-06-24 02:51:43', '2021-06-24 02:51:43'),
(3013, 'sa', 'model', 'model', '2021-06-24 03:35:43', '2021-06-24 03:35:43'),
(3014, 'sa', 'Coupon has been saved successfully', 'Coupon has been saved successfully', '2021-06-24 21:55:34', '2021-06-24 21:55:34'),
(3015, 'sa', 'Stock Alert ', 'Stock Alert ', '2021-06-28 21:34:04', '2021-06-28 21:34:04'),
(3016, 'sa', 'Step 1', 'Step 1', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3017, 'sa', 'Download the skeleton file and fill it with proper data', 'Download the skeleton file and fill it with proper data', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3018, 'sa', 'You can download the example file to understand how the data must be filled', 'You can download the example file to understand how the data must be filled', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3019, 'sa', 'Once you have downloaded and filled the skeleton file, upload it in the form below and submit', 'Once you have downloaded and filled the skeleton file, upload it in the form below and submit', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3020, 'sa', 'After uploading products you need to edit them and set product\'s images and choices', 'After uploading products you need to edit them and set product\'s images and choices', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3021, 'sa', 'Step 2', 'Step 2', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3022, 'sa', 'Category,Sub category,Sub Sub category and Brand should be in numerical ids', 'Category,Sub category,Sub Sub category and Brand should be in numerical ids', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3023, 'sa', 'You can download the pdf to get Category,Sub category,Sub Sub category and Brand id', 'You can download the pdf to get Category,Sub category,Sub Sub category and Brand id', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3024, 'sa', 'Upload Product File', 'Upload Product File', '2021-06-29 16:53:27', '2021-06-29 16:53:27'),
(3025, 'sa', 'Warehouse', 'المخازن', '2021-06-29 17:10:42', '2021-07-26 00:33:58'),
(3026, 'sa', 'Add New Warehouse', 'اضف مخزن جديد', '2021-06-29 17:11:12', '2021-07-26 00:33:58'),
(3027, 'sa', 'Add New warehouses', 'اضف مخزن جديد', '2021-06-29 17:15:07', '2021-07-26 00:33:58'),
(3028, 'sa', 'warehouses Information', 'معلومات المخزن', '2021-06-29 17:15:07', '2021-07-26 00:33:58'),
(3029, 'sa', 'warehouses has been inserted successfully', 'تم اضافة المخزن بنجاح', '2021-06-29 17:17:56', '2021-07-26 00:33:58'),
(3030, 'sa', 'Edite warehouses', 'تعديل المخزن', '2021-06-29 17:23:43', '2021-07-26 00:33:58'),
(3031, 'sa', 'warehouses has been Update successfully', 'تم تعديل المخزن بنجاح', '2021-06-29 17:44:09', '2021-07-26 00:33:58'),
(3032, 'sa', 'warehouses has been Delete successfully', 'تم حذف المخزن بنجاح', '2021-06-29 17:46:19', '2021-07-26 00:33:58'),
(3033, 'sa', 'Suppliers', 'الموردين', '2021-07-11 15:15:05', '2021-07-26 00:35:27'),
(3034, 'sa', 'Add New Supplier', 'اضف مورد', '2021-07-11 15:48:06', '2021-07-26 00:35:27'),
(3035, 'sa', 'Supplier Information', 'معلومات المورد', '2021-07-11 15:48:13', '2021-07-26 00:35:27'),
(3036, 'sa', 'Supplier has been inserted successfully', 'تم اضافة المورد بنجاح', '2021-07-11 15:53:15', '2021-07-26 00:35:27'),
(3037, 'sa', 'Edite Supplier', 'تعديل المورد', '2021-07-11 16:49:47', '2021-07-26 00:35:27'),
(3038, 'sa', 'Supplier has been Update successfully', 'تم تعديل المورد بنجاح', '2021-07-11 16:52:05', '2021-07-26 00:35:27'),
(3039, 'sa', 'units', 'الوحدات', '2021-07-11 17:12:27', '2021-07-26 00:37:33'),
(3040, 'sa', 'Add New Units', 'اضف وحدة', '2021-07-11 17:12:27', '2021-07-26 00:37:33'),
(3041, 'sa', 'units Information', 'معلومات الوحدة', '2021-07-11 17:13:22', '2021-07-26 00:37:33'),
(3042, 'sa', 'Short Name', 'Short Name', '2021-07-11 17:13:22', '2021-07-11 17:13:22'),
(3043, 'sa', 'short', 'short', '2021-07-11 17:13:22', '2021-07-11 17:13:22'),
(3044, 'sa', 'opration', 'opration', '2021-07-11 17:13:22', '2021-07-11 17:13:22'),
(3045, 'sa', '*', '*', '2021-07-11 17:13:22', '2021-07-11 17:13:22'),
(3046, 'sa', '/', '/', '2021-07-11 17:13:22', '2021-07-11 17:13:22'),
(3047, 'sa', 'parent', 'parent', '2021-07-11 17:14:50', '2021-07-11 17:14:50'),
(3048, 'sa', 'Unit has been inserted successfully', 'تم اضافة الوحدة بنجاح', '2021-07-11 17:16:28', '2021-07-26 00:37:33'),
(3049, 'sa', 'Supplier has been delete successfully', 'تم حذف المورد بنجاح', '2021-07-11 17:21:59', '2021-07-26 00:35:27'),
(3050, 'sa', 'Edite Units', 'تعديل الوحدة', '2021-07-11 17:33:19', '2021-07-26 00:37:33'),
(3051, 'sa', 'unit has been Update successfully', 'تم تعديل الوحدة بنجاح', '2021-07-11 17:41:24', '2021-07-26 00:37:33'),
(3052, 'sa', 'unit has been delete successfully', 'تم حذف الوحدة بنجاح', '2021-07-11 17:42:44', '2021-07-26 00:37:33'),
(3053, 'sa', 'expense category', 'انواع المصريف', '2021-07-11 18:46:07', '2021-07-26 00:40:16'),
(3054, 'sa', 'Add New expense category', 'اضف نوع مصاريف', '2021-07-11 18:46:07', '2021-07-26 00:40:16'),
(3055, 'sa', 'expense category Information', 'معلومات القسم', '2021-07-11 18:46:48', '2021-07-26 00:40:16'),
(3056, 'sa', 'expense category has been inserted successfully', 'تم اضافة القسم بنجاح', '2021-07-11 19:01:29', '2021-07-26 00:40:16'),
(3057, 'sa', 'Edite expense category', 'تعديل قسم المصاريف', '2021-07-11 19:01:38', '2021-07-26 00:40:16'),
(3058, 'sa', 'expense category has been update successfully', 'تم التعديل بنجاح', '2021-07-11 19:01:48', '2021-07-26 00:40:16'),
(3059, 'sa', 'expense category has been delete successfully', 'تم الحذف بنجاح', '2021-07-11 19:03:06', '2021-07-26 00:40:16'),
(3060, 'sa', 'expenses', 'المصاريف', '2021-07-11 19:51:10', '2021-07-26 00:40:16'),
(3061, 'sa', 'Add New expense', 'اضف مصاريف', '2021-07-11 19:51:10', '2021-07-26 00:40:16'),
(3062, 'sa', 'notes', 'notes', '2021-07-11 19:51:10', '2021-07-11 19:51:10'),
(3063, 'sa', 'Expense Information', 'معلومات المصاريف', '2021-07-11 19:51:18', '2021-07-26 00:40:16'),
(3064, 'sa', 'select option', 'select option', '2021-07-11 19:51:18', '2021-07-11 19:51:18'),
(3065, 'sa', 'expenses has been inserted successfully', 'تم اضافة المصاريف بنجاح', '2021-07-11 19:51:40', '2021-07-26 00:40:16'),
(3066, 'sa', 'Edit Expense', 'تعديل المصاريف', '2021-07-11 19:51:49', '2021-07-26 00:40:16'),
(3067, 'sa', 'expenses has been Update successfully', 'تم التعديل بنجاح', '2021-07-11 19:52:32', '2021-07-26 00:40:16'),
(3068, 'sa', 'expenses has been Delete successfully', 'تم الحذف بنجاح', '2021-07-11 19:53:01', '2021-07-26 00:40:16'),
(3069, 'sa', 'warehouses', 'المخازن', '2021-07-14 00:14:36', '2021-07-26 00:33:58'),
(3070, 'sa', 'expense_categories', 'قسم المصاريف', '2021-07-14 00:14:36', '2021-07-26 00:40:16'),
(3071, 'sa', 'sale Unit', 'وحدة البيع', '2021-07-14 17:01:50', '2021-07-26 00:37:33'),
(3072, 'sa', 'Purchase Unit', 'وحدة الشراء', '2021-07-14 17:01:50', '2021-07-26 00:37:33'),
(3073, 'sa', 'print Barcode', 'print Barcode', '2021-07-14 19:23:32', '2021-07-14 19:23:32'),
(3074, 'sa', 'Add New purchases', 'Add New purchases', '2021-07-15 17:18:02', '2021-07-15 17:18:02'),
(3075, 'sa', 'purchases Information', 'purchases Information', '2021-07-15 17:18:02', '2021-07-15 17:18:02'),
(3076, 'sa', 'supplier', 'الموردين', '2021-07-15 17:23:31', '2021-07-26 00:35:27'),
(3077, 'sa', 'price unite', 'سعر الوحدة', '2021-07-16 00:13:27', '2021-07-26 00:37:33'),
(3078, 'sa', 'boint order', 'boint order', '2021-07-25 20:37:21', '2021-07-25 20:37:21'),
(3079, 'sa', 'all boint', 'all boint', '2021-07-25 20:37:21', '2021-07-25 20:37:21'),
(3080, 'sa', 'Attribute Information', 'Attribute Information', '2021-07-26 01:49:20', '2021-07-26 01:49:20'),
(3081, 'sa', 'Attribute has been updated successfully', 'Attribute has been updated successfully', '2021-07-26 01:49:35', '2021-07-26 01:49:35'),
(3082, 'sa', 'Sall IN weekly', 'المبيعات خلال اسبوع', '2021-07-29 04:39:38', '2021-07-28 22:15:41'),
(3083, 'sa', 'seal in week', 'seal in week', '2021-07-29 05:08:04', '2021-07-29 05:08:04'),
(3084, 'sa', 'sale in week', 'المبيعات اسبوعية', '2021-07-29 05:14:09', '2021-07-28 22:17:51'),
(3085, 'sa', 'sale in Month', 'المبيعات شهرية', '2021-07-29 05:14:09', '2021-07-28 22:17:51'),
(3086, 'sa', 'Sall IN month', 'المبيعات شهرية', '2021-07-29 05:14:10', '2021-07-28 22:15:41'),
(3087, 'sa', 'sale in Year', 'المبيعات سنوية', '2021-07-29 05:20:57', '2021-07-28 22:31:40'),
(3088, 'sa', 'Sall IN Year', 'المبيعات سنوية', '2021-07-29 05:20:57', '2021-07-28 22:32:55'),
(3089, 'sa', 'sale in Hour', 'المبيعات خلال اليوم', '2021-07-28 21:45:18', '2021-07-28 22:17:51'),
(3090, 'sa', 'Sall IN Hour', 'المبيعات خلال اليوم', '2021-07-28 21:45:19', '2021-07-28 22:15:41'),
(3091, 'sa', 'wholesale price', 'سعر البيع للتجار', '2021-07-29 14:58:56', '2021-07-29 17:11:12'),
(3092, 'sa', 'wholesale_active', 'التجار', '2021-07-29 15:45:56', '2021-07-29 17:11:12'),
(3093, 'sa', 'send your request successfully !', 'send your request successfully !', '2021-07-29 15:51:44', '2021-07-29 15:51:44'),
(3094, 'sa', 'All wholesale', 'كل التجار', '2021-07-29 16:33:33', '2021-07-29 17:11:12'),
(3095, 'sa', 'wholesale', 'التجار', '2021-07-29 16:33:33', '2021-07-29 17:11:12'),
(3096, 'sa', 'All wholesale request', 'كل طلبات التجار', '2021-07-29 16:34:36', '2021-07-29 17:11:12'),
(3097, 'sa', 'wholesale request', 'طلبات التجار', '2021-07-29 16:34:36', '2021-07-29 17:11:12'),
(3098, 'sa', 'Accipt', 'Accipt', '2021-07-29 16:54:04', '2021-07-29 16:54:04'),
(3099, 'sa', 'wholesale successfully', 'طلب يكون تاجر', '2021-07-29 17:01:04', '2021-07-29 17:11:12'),
(3100, 'sa', 'wholesale list', 'قائمة التجار', '2021-07-29 17:09:02', '2021-07-29 17:11:12'),
(3101, 'sa', 'wholesale_request list', 'قائمة طلبات التجار', '2021-07-29 17:09:02', '2021-07-29 17:11:12'),
(3102, 'sa', 'Email Verification - ', 'Email Verification - ', '2021-07-29 17:32:53', '2021-07-29 17:32:53'),
(3103, 'sa', 'wholesale over', 'خصم للتجار', '2021-08-01 17:22:08', '2021-08-01 17:29:52'),
(3104, 'sa', 'wholesale text', 'ضريبة للتجار', '2021-08-01 17:28:55', '2021-08-01 17:30:14'),
(3105, 'sa', 'Product has been duplicated successfully', 'Product has been duplicated successfully', '2021-08-01 22:37:38', '2021-08-01 22:37:38'),
(3106, 'sa', 'System Default Currency', 'System Default Currency', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3107, 'sa', 'Set Currency Formats', 'Set Currency Formats', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3108, 'sa', 'Symbol Format', 'Symbol Format', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3109, 'sa', 'No of decimals', 'No of decimals', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3110, 'sa', 'All Currencies', 'All Currencies', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3111, 'sa', 'Add New Currency', 'Add New Currency', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3112, 'sa', 'Currency name', 'Currency name', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3113, 'sa', 'Currency symbol', 'Currency symbol', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3114, 'sa', 'Currency code', 'Currency code', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3115, 'sa', 'Currency Status updated successfully', 'Currency Status updated successfully', '2021-08-03 01:29:09', '2021-08-03 01:29:09'),
(3116, 'sa', 'OOPS!', 'OOPS!', '2021-08-03 18:03:02', '2021-08-03 18:03:02'),
(3117, 'sa', 'This site is under developement. We will be back soon!!', 'This site is under developement. We will be back soon!!', '2021-08-03 18:03:02', '2021-08-03 18:03:02'),
(3118, 'sa', 'Top Categories', 'Top Categories', '2021-08-24 15:37:15', '2021-08-24 15:37:15'),
(3119, 'sa', 'Top  Brands', 'Top  Brands', '2021-08-24 15:37:15', '2021-08-24 15:37:15'),
(3120, 'en', 'OFF', 'OFF', '2021-08-24 16:03:29', '2021-08-24 16:03:29'),
(3121, 'en', 'Top Categories', 'Top Categories', '2021-08-24 16:03:32', '2021-08-24 16:03:32'),
(3122, 'en', 'Top  Brands', 'Top  Brands', '2021-08-24 16:03:33', '2021-08-24 16:03:33'),
(3123, 'en', 'sale in Hour', 'sale in Hour', '2021-08-24 16:09:58', '2021-08-24 16:09:58'),
(3124, 'en', 'sale in week', 'sale in week', '2021-08-24 16:09:58', '2021-08-24 16:09:58'),
(3125, 'en', 'sale in Month', 'sale in Month', '2021-08-24 16:09:58', '2021-08-24 16:09:58'),
(3126, 'en', 'sale in Year', 'sale in Year', '2021-08-24 16:09:58', '2021-08-24 16:09:58'),
(3127, 'en', 'Sall IN weekly', 'Sall IN weekly', '2021-08-24 16:09:59', '2021-08-24 16:09:59'),
(3128, 'en', 'Sall IN month', 'Sall IN month', '2021-08-24 16:09:59', '2021-08-24 16:09:59'),
(3129, 'en', 'Sall IN Year', 'Sall IN Year', '2021-08-24 16:09:59', '2021-08-24 16:09:59'),
(3130, 'en', 'Sall IN Hour', 'Sall IN Hour', '2021-08-24 16:09:59', '2021-08-24 16:09:59'),
(3131, 'en', 'warehouses', 'warehouses', '2021-08-24 16:10:01', '2021-08-24 16:10:01'),
(3132, 'en', 'suppliers', 'suppliers', '2021-08-24 16:10:01', '2021-08-24 16:10:01'),
(3133, 'en', 'units', 'units', '2021-08-24 16:10:01', '2021-08-24 16:10:01'),
(3134, 'sa', 'expense_categories', 'expense_categories', '2021-08-24 16:10:01', '2021-08-24 16:10:01'),
(3135, 'en', 'expense_categories', 'expense_categories', '2021-08-24 16:35:12', '2021-08-24 16:35:12'),
(3136, 'en', 'expenses', 'expenses', '2021-08-24 16:35:12', '2021-08-24 16:35:12'),
(3137, 'en', 'wholesale list', 'wholesale list', '2021-08-24 16:35:12', '2021-08-24 16:35:12'),
(3138, 'en', 'wholesale_request list', 'wholesale_request list', '2021-08-24 16:35:12', '2021-08-24 16:35:12'),
(3139, 'en', 'wholesale_active', 'wholesale_active', '2021-08-24 16:46:08', '2021-08-24 16:46:08'),
(3140, 'sa', 'Product Image', 'Product Image', '2021-08-26 18:53:23', '2021-08-26 18:53:23'),
(3141, 'sa', 'Please add shipping address', 'Please add shipping address', '2021-08-26 18:58:55', '2021-08-26 18:58:55'),
(3142, 'sa', 'Your Shop has been updated successfully!', 'Your Shop has been updated successfully!', '2021-08-28 13:38:20', '2021-08-28 13:38:20'),
(3143, 'sa', 'has not been verified yet.', 'has not been verified yet.', '2021-08-28 13:38:25', '2021-08-28 13:38:25'),
(3144, 'sa', 'Recharge Wallet', 'Recharge Wallet', '2021-08-28 13:38:43', '2021-08-28 13:38:43'),
(3145, 'sa', 'Offline Recharge Wallet', 'Offline Recharge Wallet', '2021-08-28 13:38:43', '2021-08-28 13:38:43'),
(3146, 'sa', 'Wallet recharge history', 'Wallet recharge history', '2021-08-28 13:38:43', '2021-08-28 13:38:43'),
(3147, 'sa', 'print Invoice', 'print Invoice', '2021-08-28 16:16:42', '2021-08-28 16:16:42'),
(3148, 'sa', 'Refund has been  successfully', 'Refund has been  successfully', '2021-08-28 16:17:00', '2021-08-28 16:17:00'),
(3149, 'sa', 'Import Products', 'Import Products', '2021-08-28 16:45:43', '2021-08-28 16:45:43'),
(3150, 'sa', 'Verify Now', 'Verify Now', '2021-08-28 17:14:18', '2021-08-28 17:14:18'),
(3151, 'sa', 'Non-refundable', 'Non-refundable', '2021-08-29 23:07:51', '2021-08-29 23:07:51'),
(3152, 'sa', 'Attribute has been inserted successfully', 'Attribute has been inserted successfully', '2021-08-29 23:20:57', '2021-08-29 23:20:57'),
(3153, 'en', 'model', 'model', '2021-08-30 15:53:56', '2021-08-30 15:53:56'),
(3154, 'sa', 'Page has been updated successfully', 'Page has been updated successfully', '2021-08-31 01:09:09', '2021-08-31 01:09:09'),
(3155, 'sa', 'Symbol', 'Symbol', '2021-08-31 01:51:12', '2021-08-31 01:51:12'),
(3156, 'sa', 'Currency updated successfully', 'Currency updated successfully', '2021-08-31 01:51:31', '2021-08-31 01:51:31'),
(3157, 'sa', 'You have subscribed successfully', 'You have subscribed successfully', '2021-09-04 22:14:25', '2021-09-04 22:14:25'),
(3158, 'sa', 'You are  already a subscriber', 'You are  already a subscriber', '2021-09-04 22:14:32', '2021-09-04 22:14:32'),
(3159, 'sa', 'Sorry! Something went wrong.', 'Sorry! Something went wrong.', '2021-09-25 09:21:32', '2021-09-25 09:21:32'),
(3160, 'sa', 'Attribute has been deleted successfully', 'Attribute has been deleted successfully', '2021-10-27 05:20:35', '2021-10-27 05:20:35'),
(3161, 'sa', 'Emails', 'Emails', '2021-10-27 05:25:35', '2021-10-27 05:25:35'),
(3162, 'sa', 'Users', 'Users', '2021-10-27 05:25:35', '2021-10-27 05:25:35'),
(3163, 'sa', 'Newsletter subject', 'Newsletter subject', '2021-10-27 05:25:35', '2021-10-27 05:25:35'),
(3164, 'sa', 'Newsletter content', 'Newsletter content', '2021-10-27 05:25:35', '2021-10-27 05:25:35'),
(3165, 'sa', 'SMS has been sent.', 'SMS has been sent.', '2021-10-27 05:26:23', '2021-10-27 05:26:23'),
(3166, 'sa', 'See Details', 'See Details', '2021-10-27 05:31:45', '2021-10-27 05:31:45'),
(3167, 'sa', 'Message has been send to seller', 'Message has been send to seller', '2021-10-27 05:31:45', '2021-10-27 05:31:45'),
(3168, 'sa', 'Staff Information', 'Staff Information', '2021-10-27 22:52:15', '2021-10-27 22:52:15'),
(3169, 'sa', 'Staff has been inserted successfully', 'Staff has been inserted successfully', '2021-10-27 22:53:01', '2021-10-27 22:53:01'),
(3170, 'sa', 'Role has been updated successfully', 'Role has been updated successfully', '2021-10-27 22:54:55', '2021-10-27 22:54:55'),
(3171, 'sa', 'Uploaded By', 'Uploaded By', '2021-10-28 03:05:55', '2021-10-28 03:05:55'),
(3172, 'sa', 'Customer Status', 'Customer Status', '2021-10-28 03:05:55', '2021-10-28 03:05:55'),
(3173, 'sa', 'Product Wish Report', 'Product Wish Report', '2021-10-28 03:11:22', '2021-10-28 03:11:22'),
(3174, 'sa', 'Number of Wish', 'Number of Wish', '2021-10-28 03:11:22', '2021-10-28 03:11:22'),
(3175, 'sa', 'Shop Verification', 'Shop Verification', '2021-10-28 23:01:19', '2021-10-28 23:01:19'),
(3176, 'sa', 'Your shop verification request has been submitted successfully!', 'Your shop verification request has been submitted successfully!', '2021-10-28 23:02:28', '2021-10-28 23:02:28'),
(3177, 'sa', 'New verification request(s)', 'New verification request(s)', '2021-10-28 23:02:41', '2021-10-28 23:02:41'),
(3178, 'sa', 'All Classifies Packages', 'All Classifies Packages', '2021-10-28 23:27:56', '2021-10-28 23:27:56'),
(3179, 'sa', 'Create New Package', 'Create New Package', '2021-10-28 23:28:00', '2021-10-28 23:28:00'),
(3180, 'sa', 'Free', 'Free', '2021-10-28 23:29:52', '2021-10-28 23:29:52'),
(3181, 'sa', 'Free Package', 'Free Package', '2021-10-28 23:29:52', '2021-10-28 23:29:52'),
(3182, 'sa', 'Package purchasing successful', 'Package purchasing successful', '2021-10-28 23:29:57', '2021-10-28 23:29:57'),
(3183, 'sa', 'Product Upload Remaining', 'Product Upload Remaining', '2021-10-28 23:29:57', '2021-10-28 23:29:57'),
(3184, 'sa', 'Digital Product Upload Remaining', 'Digital Product Upload Remaining', '2021-10-28 23:29:57', '2021-10-28 23:29:57'),
(3185, 'sa', 'Package Expires at', 'Package Expires at', '2021-10-28 23:29:57', '2021-10-28 23:29:57'),
(3186, 'sa', 'Current Package', 'Current Package', '2021-10-28 23:29:57', '2021-10-28 23:29:57'),
(3187, 'sa', 'Be a Seller?', 'Be a Seller?', '2021-11-24 17:54:09', '2021-11-24 17:54:09'),
(3188, 'sa', 'Product sale type', 'نوع المبيع', '2021-11-24 18:16:58', '2021-11-25 12:54:14'),
(3189, 'sa', 'Package price', 'سعر الباكيج', '2021-11-24 18:28:24', '2021-11-25 12:53:50'),
(3190, 'sa', 'Number Pieces In Package', 'عدد المنتجات في الباكيج', '2021-11-24 18:28:24', '2021-11-25 12:53:29'),
(3191, 'sa', 'AliceBlue', 'AliceBlue', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3192, 'sa', 'Amethyst', 'Amethyst', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3193, 'sa', 'AntiqueWhite', 'AntiqueWhite', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3194, 'sa', 'Aqua', 'Aqua', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3195, 'sa', 'Aquamarine', 'Aquamarine', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3196, 'sa', 'Azure', 'Azure', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3197, 'sa', 'Beige', 'Beige', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3198, 'sa', 'Bisque', 'Bisque', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3199, 'sa', 'Black', 'Black', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3200, 'sa', 'BlanchedAlmond', 'BlanchedAlmond', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3201, 'sa', 'Blue', 'Blue', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3202, 'sa', 'BlueViolet', 'BlueViolet', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3203, 'sa', 'Brown', 'Brown', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3204, 'sa', 'BurlyWood', 'BurlyWood', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3205, 'sa', 'CadetBlue', 'CadetBlue', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3206, 'sa', 'Chartreuse', 'Chartreuse', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3207, 'sa', 'Chocolate', 'Chocolate', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3208, 'sa', 'Coral', 'Coral', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3209, 'sa', 'CornflowerBlue', 'CornflowerBlue', '2021-11-24 19:52:30', '2021-11-24 19:52:30');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(3210, 'sa', 'Cornsilk', 'Cornsilk', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3211, 'sa', 'Crimson', 'Crimson', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3212, 'sa', 'Cyan', 'Cyan', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3213, 'sa', 'DarkBlue', 'DarkBlue', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3214, 'sa', 'DarkCyan', 'DarkCyan', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3215, 'sa', 'DarkGoldenrod', 'DarkGoldenrod', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3216, 'sa', 'DarkGray', 'DarkGray', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3217, 'sa', 'DarkGreen', 'DarkGreen', '2021-11-24 19:52:30', '2021-11-24 19:52:30'),
(3218, 'sa', 'DarkKhaki', 'DarkKhaki', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3219, 'sa', 'DarkMagenta', 'DarkMagenta', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3220, 'sa', 'DarkOliveGreen', 'DarkOliveGreen', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3221, 'sa', 'DarkOrange', 'DarkOrange', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3222, 'sa', 'DarkOrchid', 'DarkOrchid', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3223, 'sa', 'DarkRed', 'DarkRed', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3224, 'sa', 'DarkSalmon', 'DarkSalmon', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3225, 'sa', 'DarkSeaGreen', 'DarkSeaGreen', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3226, 'sa', 'DarkSlateBlue', 'DarkSlateBlue', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3227, 'sa', 'DarkSlateGray', 'DarkSlateGray', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3228, 'sa', 'DarkTurquoise', 'DarkTurquoise', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3229, 'sa', 'DarkViolet', 'DarkViolet', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3230, 'sa', 'DeepPink', 'DeepPink', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3231, 'sa', 'DeepSkyBlue', 'DeepSkyBlue', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3232, 'sa', 'DimGray', 'DimGray', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3233, 'sa', 'DodgerBlue', 'DodgerBlue', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3234, 'sa', 'FireBrick', 'FireBrick', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3235, 'sa', 'FloralWhite', 'FloralWhite', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3236, 'sa', 'ForestGreen', 'ForestGreen', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3237, 'sa', 'Fuchsia', 'Fuchsia', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3238, 'sa', 'Gainsboro', 'Gainsboro', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3239, 'sa', 'GhostWhite', 'GhostWhite', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3240, 'sa', 'Gold', 'Gold', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3241, 'sa', 'Goldenrod', 'Goldenrod', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3242, 'sa', 'Gray', 'Gray', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3243, 'sa', 'Green', 'Green', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3244, 'sa', 'GreenYellow', 'GreenYellow', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3245, 'sa', 'Honeydew', 'Honeydew', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3246, 'sa', 'HotPink', 'HotPink', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3247, 'sa', 'IndianRed', 'IndianRed', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3248, 'sa', 'Indigo', 'Indigo', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3249, 'sa', 'Ivory', 'Ivory', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3250, 'sa', 'Khaki', 'Khaki', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3251, 'sa', 'Lavender', 'Lavender', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3252, 'sa', 'LavenderBlush', 'LavenderBlush', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3253, 'sa', 'LawnGreen', 'LawnGreen', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3254, 'sa', 'LemonChiffon', 'LemonChiffon', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3255, 'sa', 'LightBlue', 'LightBlue', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3256, 'sa', 'LightCoral', 'LightCoral', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3257, 'sa', 'LightCyan', 'LightCyan', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3258, 'sa', 'LightGoldenrodYellow', 'LightGoldenrodYellow', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3259, 'sa', 'LightGreen', 'LightGreen', '2021-11-24 19:52:31', '2021-11-24 19:52:31'),
(3260, 'sa', 'LightGrey', 'LightGrey', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3261, 'sa', 'LightPink', 'LightPink', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3262, 'sa', 'LightSalmon', 'LightSalmon', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3263, 'sa', 'LightSeaGreen', 'LightSeaGreen', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3264, 'sa', 'LightSkyBlue', 'LightSkyBlue', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3265, 'sa', 'LightSlateGray', 'LightSlateGray', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3266, 'sa', 'LightSteelBlue', 'LightSteelBlue', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3267, 'sa', 'LightYellow', 'LightYellow', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3268, 'sa', 'Lime', 'Lime', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3269, 'sa', 'LimeGreen', 'LimeGreen', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3270, 'sa', 'Linen', 'Linen', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3271, 'sa', 'Magenta', 'Magenta', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3272, 'sa', 'Maroon', 'Maroon', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3273, 'sa', 'MediumAquamarine', 'MediumAquamarine', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3274, 'sa', 'MediumBlue', 'MediumBlue', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3275, 'sa', 'MediumOrchid', 'MediumOrchid', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3276, 'sa', 'MediumPurple', 'MediumPurple', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3277, 'sa', 'MediumSeaGreen', 'MediumSeaGreen', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3278, 'sa', 'MediumSlateBlue', 'MediumSlateBlue', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3279, 'sa', 'MediumSpringGreen', 'MediumSpringGreen', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3280, 'sa', 'MediumTurquoise', 'MediumTurquoise', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3281, 'sa', 'MediumVioletRed', 'MediumVioletRed', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3282, 'sa', 'MidnightBlue', 'MidnightBlue', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3283, 'sa', 'MintCream', 'MintCream', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3284, 'sa', 'MistyRose', 'MistyRose', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3285, 'sa', 'Moccasin', 'Moccasin', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3286, 'sa', 'NavajoWhite', 'NavajoWhite', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3287, 'sa', 'Navy', 'Navy', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3288, 'sa', 'OldLace', 'OldLace', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3289, 'sa', 'Olive', 'Olive', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3290, 'sa', 'OliveDrab', 'OliveDrab', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3291, 'sa', 'Orange', 'Orange', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3292, 'sa', 'OrangeRed', 'OrangeRed', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3293, 'sa', 'Orchid', 'Orchid', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3294, 'sa', 'PaleGoldenrod', 'PaleGoldenrod', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3295, 'sa', 'PaleGreen', 'PaleGreen', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3296, 'sa', 'PaleTurquoise', 'PaleTurquoise', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3297, 'sa', 'PaleVioletRed', 'PaleVioletRed', '2021-11-24 19:52:32', '2021-11-24 19:52:32'),
(3298, 'sa', 'PapayaWhip', 'PapayaWhip', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3299, 'sa', 'PeachPuff', 'PeachPuff', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3300, 'sa', 'Peru', 'Peru', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3301, 'sa', 'Pink', 'Pink', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3302, 'sa', 'Plum', 'Plum', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3303, 'sa', 'PowderBlue', 'PowderBlue', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3304, 'sa', 'Purple', 'Purple', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3305, 'sa', 'Red', 'Red', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3306, 'sa', 'RosyBrown', 'RosyBrown', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3307, 'sa', 'RoyalBlue', 'RoyalBlue', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3308, 'sa', 'SaddleBrown', 'SaddleBrown', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3309, 'sa', 'Salmon', 'Salmon', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3310, 'sa', 'SandyBrown', 'SandyBrown', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3311, 'sa', 'SeaGreen', 'SeaGreen', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3312, 'sa', 'Seashell', 'Seashell', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3313, 'sa', 'Sienna', 'Sienna', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3314, 'sa', 'Silver', 'Silver', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3315, 'sa', 'SkyBlue', 'SkyBlue', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3316, 'sa', 'SlateBlue', 'SlateBlue', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3317, 'sa', 'SlateGray', 'SlateGray', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3318, 'sa', 'Snow', 'Snow', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3319, 'sa', 'SpringGreen', 'SpringGreen', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3320, 'sa', 'SteelBlue', 'SteelBlue', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3321, 'sa', 'Tan', 'Tan', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3322, 'sa', 'Teal', 'Teal', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3323, 'sa', 'Thistle', 'Thistle', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3324, 'sa', 'Tomato', 'Tomato', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3325, 'sa', 'Turquoise', 'Turquoise', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3326, 'sa', 'Violet', 'Violet', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3327, 'sa', 'Wheat', 'Wheat', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3328, 'sa', 'WhiteSmoke', 'WhiteSmoke', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3329, 'sa', 'Yellow', 'Yellow', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3330, 'sa', 'YellowGreen', 'YellowGreen', '2021-11-24 19:52:33', '2021-11-24 19:52:33'),
(3331, 'sa', 'Subcategory has been updated successfully', 'Subcategory has been updated successfully', '2021-11-25 19:32:02', '2021-11-25 19:32:02'),
(3332, 'sa', 'Sub Subcategory Information', 'Sub Subcategory Information', '2021-11-25 19:35:52', '2021-11-25 19:35:52'),
(3333, 'sa', 'SubSubCategory has been inserted successfully', 'SubSubCategory has been inserted successfully', '2021-11-25 19:37:01', '2021-11-25 19:37:01'),
(3334, 'sa', 'Your classified product upload limit has been reached. Please buy a package.', 'Your classified product upload limit has been reached. Please buy a package.', '2021-11-25 19:41:11', '2021-11-25 19:41:11'),
(3335, 'sa', 'Premium Packages for Customers', 'Premium Packages for Customers', '2021-11-25 19:41:11', '2021-11-25 19:41:11'),
(3336, 'sa', 'Offline Package Purchase ', 'Offline Package Purchase ', '2021-11-25 19:41:11', '2021-11-25 19:41:11'),
(3337, 'sa', 'Email already exists!', 'Email already exists!', '2021-11-25 20:25:19', '2021-11-25 20:25:19'),
(3338, 'sa', 'Your verification request has been submitted successfully!', 'Your verification request has been submitted successfully!', '2021-11-25 20:28:22', '2021-11-25 20:28:22'),
(3339, 'sa', 'Role has been inserted successfully', 'Role has been inserted successfully', '2021-11-25 20:34:34', '2021-11-25 20:34:34'),
(3340, 'sa', 'Staff has been updated successfully', 'Staff has been updated successfully', '2021-11-25 20:35:00', '2021-11-25 20:35:00');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `short` varchar(191) NOT NULL,
  `top` int(11) DEFAULT NULL,
  `opration` varchar(191) DEFAULT NULL,
  `value` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `short`, `top`, `opration`, `value`, `created_at`, `updated_at`) VALUES
(0, 'قطعة', 'pc', 1, '*', 12, '2021-07-14 20:55:45', '2021-07-14 20:56:52'),
(1, 'الدستة واحدة 12 قطعه', 'دستة', 0, '*', 1, '2021-07-11 17:16:28', '2021-07-14 20:56:29');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_original_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'uploads/banners/uddtO2yUnQmtamHJYIukdNG7v0lUDf6lwcNiE7ko.png', 12, 0, 'png', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(2, NULL, 'uploads/banners/banner.jpg', 12, 0, 'jpg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(3, NULL, 'uploads/banners/banner.jpg', 12, 0, 'jpg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(4, NULL, 'uploads/banners/banner.jpg', 12, 0, 'jpg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(5, NULL, 'uploads/banners/banner.jpg', 12, 0, 'jpg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(6, NULL, 'uploads/banners/banner.jpg', 12, 0, 'jpg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(7, NULL, 'uploads/banners/o6c4UQ5XEhvX8Wx99hrzetlcPIFKxGQu7Q4ukDAq.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(8, NULL, 'uploads/banners/4Ql5MyxTAf4jNBdGzyvH5tHJ4UeBP02HI2rfDNTO.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(9, NULL, 'uploads/banners/u6ifmCEhJwDBhjZoZVLwmkBfeqGOeg56lImDLvmS.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(10, NULL, 'uploads/banners/nRPoxxQuZfGy0w9yENGQUlGHDiadBUumlaamsfEk.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(11, NULL, 'uploads/banners/iDoDhYUUXvf1YdmVYPIqxpXJ6ioYo3win1OqFKcj.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(12, NULL, 'uploads/banners/1My13kQ4xkfOeNncVAWyQGPHUYGwwWBgY9k7XOC8.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(13, NULL, 'uploads/brands/jnU4nLAUOUmge8SoOuWkk86s17i1IxWeyggfbMn4.png', 12, 0, 'png', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(14, NULL, 'uploads/brands/dAKKcvZoCTuT0Q7uPJw1CKp76u5ObbdbPQ5cZHgI.svg', 12, 0, 'svg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(15, NULL, 'uploads/brands/XJ816S9oDlCtKFNdmvcqyzqkOPVQzvcX1UrrZtfq.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(16, NULL, 'uploads/brands/Di6BLozVlGmIGojtTkghinXXVVKwEBnyCmgqSjLV.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(17, NULL, 'uploads/brands/7EbNlJV9h0I1xfzDQVUd8y4h1XptercFip0bPVxR.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(18, NULL, 'uploads/brands/Sf3sTvTiHMoBe0TbYGA4PjzNBIt8x9WF3q5CXDch.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(19, NULL, 'uploads/categories/banner/7kd0Bq5TcW6ovxuleqpiIORWodxxRcsoCK8ZUGEI.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(20, NULL, 'uploads/categories/icon/KjJP9wuEZNL184XVUk3S7EiZ8NnBN99kiU4wdvp3.png', 12, 0, 'png', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(21, NULL, 'uploads/categories/banner/CSSFWJG1RqtCzqjhtpb7y8Kv59LPqASSA3sw4GzU.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(22, NULL, 'uploads/categories/icon/h9XhWwI401u6sRoLITEk9SUMRAlWN8moGrpPfS6I.png', 12, 0, 'png', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(23, NULL, 'uploads/categories/banner/M6KEdclZOzPwgRvgOgsCL3KBcGJXPOueLgUXFDTk.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(24, NULL, 'uploads/categories/icon/rKAPw5rNlS84JtD9ZQqn366jwE11qyJqbzAe5yaA.png', 12, 0, 'png', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(25, NULL, 'uploads/categories/banner/o722z3xi04oXEWF85mIsDeed6Pb6KigCdCU4UVeh.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(26, NULL, 'uploads/categories/icon/YzxpNM1VCJiVLiDxAnDZwAQE7CBk9WkLrtJhwtna.png', 12, 0, 'png', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(27, NULL, 'uploads/categories/banner/ccsItsiZFzFZsqN2jLPWfmnd9Vs0GHR1F2gbZ4RM.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(28, NULL, 'uploads/categories/icon/HSDArv2u3cnsuOfnvI1Vb17OnUE53AAAH9jl3RKP.png', 12, 0, 'png', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(29, NULL, 'uploads/offers/banner/A6BiEznWxa0qEspnRM0KbflCMIY86cb06tRZKCQ8.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(30, NULL, 'uploads/products/photos/TzEvONTbHxLZ2Uqcv2bWnF1ep0dctVHxAb3eIX29.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(31, NULL, 'uploads/products/photos/PsgpnxobKNGIqlteSWx05s9oPvMddVxJWhSbyRjJ.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(32, NULL, 'uploads/products/photos/BwDqd0SJUA1xDy2s2MXGry7EYqDoucnna3moHKbL.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(33, NULL, 'uploads/products/photos/zViSr3OYIqjLMI3gUH1g8wYfAJ9CLcJW0Pc1MQJ7.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(34, NULL, 'uploads/products/photos/h1r8IWwwwxvg7znwnSkE0pN9jYJHk8YQ8v4aSbuJ.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(35, NULL, 'uploads/products/photos/8W0YsxZVMbraFJfEpDjAfbQyw7hWfVUBCKS6Gjbb.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(36, NULL, 'uploads/products/photos/It75nIxp4083MQB5JfZ4NZEsdKHxuScHCJ3Tkup5.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(37, NULL, 'uploads/products/photos/MYXvGYl9oqbQ4QQbwPMTHBe6x3xbpRKqZV1BnVP1.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(38, NULL, 'uploads/products/photos/nDUkqOC0D2764HmuB55aRGwYeVYri5gykDg9VhOP.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(39, NULL, 'uploads/products/photos/gRAAi7k9wnVfMYMV3RIkBBAq3qKZWRqWlwP1Zr65.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(40, NULL, 'uploads/products/photos/yGGq4TAUsTdVwjPQ9QZKd0glAIF7f9qufFNvQdq2.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(41, NULL, 'uploads/products/photos/D9LkW6KJC7SkwLmZt3YL53WcTBXuRJP2zAuXniHy.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(42, NULL, 'uploads/products/photos/0Y21ovtDxRmPQPW8yvuqDG3KA2FXEkW1WPTpFzSQ.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(43, NULL, 'uploads/products/photos/T0VrIZM6lftNa3GeDfub2RTa4cln9QXzAs3x2JRV.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(44, NULL, 'uploads/products/photos/JOQOiuVY7bkfF96rdT3dItfb5Vg1d3XdOzTB1FDG.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(45, NULL, 'uploads/products/photos/xz0oSFRDvK4AaWTjoJLUJIkm0Tf8AvJmonol1y8y.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(46, NULL, 'uploads/products/photos/L0mgegvtkApMXTwTeCSUHv4pll4Q5XUJefrOE1rY.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(47, NULL, 'uploads/products/photos/NXk4TG8mI7ZAi3jWI5cCfJUtBFD5ZbQwZR9ut5Z7.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(48, NULL, 'uploads/products/photos/CDeVRuPoyBJPBvm17PAK5CdUA6pVZAOUkhnm9t06.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(49, NULL, 'uploads/products/photos/7LKL5mG0tFD7MEqvHBU5vV61jEZM7tJJh6CCzcN7.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(50, NULL, 'uploads/products/photos/JYCdZ3SVHBWfsyZI0U5y0wttR0qIP1dHODyXHRL5.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(51, NULL, 'uploads/products/photos/mTiwivpsxT9jbfi20Fe4HwyddlbZjBwjvf59WZ1I.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(52, NULL, 'uploads/products/photos/IDrp12qrDsQZko4Y8RcZgLwvAIcq0BXroO8trql1.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(53, NULL, 'uploads/products/photos/GnTLNNXUsa8XtOTdfyAiE7wQZ0m6jAySkX07d7p9.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(54, NULL, 'uploads/products/photos/rmxaCCvDO3hzeWzS3j0eSZTjB6nUXW8dTcd2Oblp.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(55, NULL, 'uploads/products/photos/X9Ivi6BWlG3Dc0G2DHqtISlk0zyeaN0qjy1LaZ8V.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(56, NULL, 'uploads/products/photos/QsLDzAvrHkCEDw2yNYuY0cJmH7YFuHpScFQP1IMe.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(57, NULL, 'uploads/products/photos/azSGRMcAZO96o76hyls5M7RAFJppi44mcxbAHoqD.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(58, NULL, 'uploads/products/photos/APdK1UdAKoxUZzwA4wX9MxKTA3noTLhyJRcVzO33.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(59, NULL, 'uploads/products/photos/JIAXZ6sd6dQzDLaCzDpJCsIsOiT3bcTAjt1AbQo3.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(60, NULL, 'uploads/products/photos/lmysbSKhzu1wKN36UeziXVKbU1aGwu9nbX7jchyM.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(61, NULL, 'uploads/products/photos/Ihey3sVJOUyPHNuwJDeEl094W0jA5QbGcotJUJuW.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(62, NULL, 'uploads/products/photos/ALID4k4z49iQGOVjf9vcK83xepBgSCKZaa4SxCEW.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(63, NULL, 'uploads/products/photos/3oKJoohOfXJeazYZ4pNsQbkq7SXVCu8noEImQg0T.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(64, NULL, 'uploads/products/photos/gWTTmoOFnnXgLcvDh6w6z8Cqkl9IaEdrhJsPKqgP.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(65, NULL, 'uploads/products/photos/ZgooECSOQYsf0Je3xPaPwXFZM8AazNTtDzKaectD.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(66, NULL, 'uploads/products/photos/Axsd2QBc0C4gqNa06txNTdd7OypD4RGXWLFFwLmw.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(67, NULL, 'uploads/products/photos/5wk1YUQPzp9HrJ5ieih76UhAinUdbBjNTFeZxNWH.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(68, NULL, 'uploads/products/photos/bOTOZLQWASeqZimfE5qKcgSMH65HcQvzQRHiAVOc.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(69, NULL, 'uploads/products/photos/yBgXPucbW0G6pgqJGIBJXpLuiEYRH5g6WFTEXwVZ.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(70, NULL, 'uploads/products/photos/kTvMBuOpc5KQxf0VHqM1kRHZndEbNEIUoh4cfq79.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(71, NULL, 'uploads/products/photos/oSZEYXHDNUxq50adGDvqXybS2GYyuoV75alW3IVu.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(72, NULL, 'uploads/products/photos/lQuYPRB9etvEsLiWmKhAhphtB9SAUs0lY2dVF5Sc.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(73, NULL, 'uploads/products/photos/urNXc0qV26tGjzylpCgCxaAzd4p2hT9mcBxpkIWf.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(74, NULL, 'uploads/products/photos/V2gy56jefmElGisNohikDboWUVtbPqiFoF3BBu1w.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(75, NULL, 'uploads/products/photos/f7t3FpDbVXlH3rkssyNxc6nuYJfpqFiEnUDu29jj.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(76, NULL, 'uploads/products/photos/UUdwQMQGUJ1xukHcgr4mxQIBQwQ1sdFSnWBhqjkx.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(77, NULL, 'uploads/products/photos/0wOdf9fqRIAvG0UnJ2zIjxr6V9rHmoPswUf77zof.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(78, NULL, 'uploads/products/photos/mITFOs4osWvy6DXQ8I4tn428WmHt8MqVhvhVaCyf.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(79, NULL, 'uploads/products/photos/sgHi3KWYXzL70STlHe4HdAyX8HjxnNTo4fkVbEuN.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(80, NULL, 'uploads/products/photos/Mn412Ge8rp8y4sHVhzT7QHoKJ6t8phij22KNV7la.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(81, NULL, 'uploads/products/photos/7HL7wcMrwLBde5kdmeLcjxC9ozIVw3qQrI9Qh2N6.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(82, NULL, 'uploads/products/photos/59DpEtDiyg1yTlYJO4f9tGU7ayG41E8ScABI1I3b.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(83, NULL, 'uploads/products/photos/sAVDwxcwNPiq0G6AZn3CjG6w6nZfahYh9LP6aUgB.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(84, NULL, 'uploads/products/photos/xBArQtxaGGrTmox8VKo8IMyYRDYffy4S7fvCc9Uu.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(85, NULL, 'uploads/products/photos/I1JT934jTaNSNPDH70O3N1AS14AzWCbjvadk6h9b.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(86, NULL, 'uploads/products/photos/xa3x5bkzS9kZyBJzAhGypPFWGEgLwZC9ZKJuN26X.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(87, NULL, 'uploads/products/photos/wrqYx9cYtloGGHs0msSf0T2cARoE43FTpXhi5hka.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(88, NULL, 'uploads/products/photos/xM1i6EWG66xEImnfjoXnEG0cNWPS8paSCEAVfore.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(89, NULL, 'uploads/products/photos/oqJUPrL922PodfKqwGCKRIJbrvTtv5we4JmYzAzg.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(90, NULL, 'uploads/products/photos/wFSzLVf4Q8mt0NHMjsusSrKyQiBrxJOVKiSPTk3k.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(91, NULL, 'uploads/products/photos/cJNiBl072mC3qYfVgASqtbmUoNgZT62gIpu4fLsb.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(92, NULL, 'uploads/products/photos/XxEg8l1mLeWvWt7uxsDN5pPSZ7X9j7x5UrVBTJdM.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(93, NULL, 'uploads/products/photos/jbSj3qp5jwnn58rNDx2kHUyyakVW2kevguIAAnYg.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(94, NULL, 'uploads/products/photos/mLKxaccE64OjwjgkAOTF1nGEyHIZPNWDdDSijkUh.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(95, NULL, 'uploads/products/photos/5Liw2nbN5lzem7xxeYbBH1u86QfqTtc8oRFyeLaG.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(96, NULL, 'uploads/products/photos/olr6Wk2SIYsd9QFmNybe3kngdIyjgKBiyum3utcK.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(97, NULL, 'uploads/products/photos/WgPUgyimCgvrt2mIF9mLXXuZPEHvqKuOlb2dYU08.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(98, NULL, 'uploads/products/photos/Cd6B4CHCDM50qZqFVNkAX3qjmSUGaOxiUGGW2ntQ.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(99, NULL, 'uploads/products/photos/jqclNxRJBqueyRco9Qebd73WNnIHBiZvxlxnFjEV.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(100, NULL, 'uploads/products/photos/5Y8gy2vMvyvQIN0vio2qZXy161niiHSLaimBp8VV.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(101, NULL, 'uploads/products/photos/0pvNr3k8Ug3zLAVy0aTk6PxaRbwVZzb8VjBLiY7h.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(102, NULL, 'uploads/products/photos/SleMXJCF3rIu0kCt23V0PFIfuKe5CmDPqqxOdotC.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(103, NULL, 'uploads/products/photos/aJxJtc1SXfMEHzCtiw0MkDHSIr0LYeW1eo4EFoEr.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(104, NULL, 'uploads/products/photos/94CaLBrhKN5lq6zkEsp0OV8dmUc9wigFjqPevR8a.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(105, NULL, 'uploads/products/photos/f39z40rVa7EiiDzUBrJRJUDuAlcxDglONwNNUoLI.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:36', '2020-11-21 13:20:36', NULL),
(106, NULL, 'uploads/products/photos/qm0bRVLMgcjnhH341Trddsql3JmirzVVEamqNo0Q.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(107, NULL, 'uploads/products/photos/lefnFh6umwTmTCFWA4nHTZeasiRQ2aqjA0D9Egv9.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(108, NULL, 'uploads/products/photos/fhD7Stf6FtZYnRZ2ZLpLDuBCohstJyZAG8c387mS.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(109, NULL, 'uploads/products/photos/iAFtDDaxjsKRbNIQXjBlSDwgtBSg4yvNnKFjyvnH.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(110, NULL, 'uploads/products/photos/HNW4GnhblYG9NC8zsafzpXE9mEA9mkWNdSyGA3mg.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(111, NULL, 'uploads/products/photos/jatHpuWBayVrrBHGkyrCHA4aQT1avMoh3kYTjkHj.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(112, NULL, 'uploads/products/photos/9YSMw7FfRp9vQP2WoR8YC2zZnqSKhFhXqXAzgGXZ.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(113, NULL, 'uploads/products/photos/b1iIkDow8nIMDFs7D4bDnJ1rxtmbmK6MVKBYxyLa.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(114, NULL, 'uploads/products/photos/ZK3nHHHerwGUmdRY1ifNjCo55ZaKizwZkYl6P0Ls.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(115, NULL, 'uploads/products/photos/tYqjUss0q6yCPvscetoL8SkXZCixdzGKQ9dYlcTK.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(116, NULL, 'uploads/products/photos/5IOMcInvCKWA7DyXEGkUATBU9rnc3PU7d0EbHfs4.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(117, NULL, 'uploads/products/photos/Xm5qZ4lv8OZETj2u2EKUNe2ov6K7eIXp7bQ0DQU1.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(118, NULL, 'uploads/products/photos/CFof8HjxkWgYvtNXMlkiqNh3tOHHIGjTJOs1kgZU.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(119, NULL, 'uploads/products/photos/tO2RNXo7nolFt6kJPoGAqFGTUjMH2gpbKyiC0MzS.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(120, NULL, 'uploads/products/photos/vEfe4GQF70oM8fJeuB4smHy0LQtoZVWAjlbBZRZC.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(121, NULL, 'uploads/products/photos/Jw6floFjv1UVnZItpsnBqWGxfaxNNMAiNGfx4oii.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(122, NULL, 'uploads/products/photos/0eV5UWBcEIRPwcKF0Igcw0tLeoUjuzoS5XA7iQ9S.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(123, NULL, 'uploads/products/photos/m46ZidaCYXNL6qb1tjhQycWBjNcrJlzOdnptIaMH.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(124, NULL, 'uploads/products/photos/yEXIFa8urMsGo02qdI9jWmcWhjcCY8dCLJheEnOb.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(125, NULL, 'uploads/products/photos/gZGjEGstXyPq5bLfncsaT79RaPN28JLzPljYzJS6.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(126, NULL, 'uploads/products/photos/I1TZ1pbedt6zBoc2qqfxkUaB5agtBEcggIX8xDco.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(127, NULL, 'uploads/products/photos/yILDBmUcPCJWBZVxt4TYmYLYCyS1A7sHRsqYqXFV.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(128, NULL, 'uploads/products/photos/7aaD2ln7EpPh5HvETzcOjVEU7R9EbTWp9Y9Jrc3r.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(129, NULL, 'uploads/products/photos/QHtuTRkjTdBTZUMq0aAfSfb8b3A00T0JRIYcplF0.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(130, NULL, 'uploads/products/photos/7T3mwCJlgkLB96Jg7l1IvtGRkto30GNJ3lSeJ7bD.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(131, NULL, 'uploads/products/photos/a9cTW5smbEFGETF1aH3qCuisyhKWTZEaGT8wayfH.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(132, NULL, 'uploads/products/photos/BS7z3WEyRe1z8g0bYOohcdTZpxWmkyf6VCHCAGYP.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(133, NULL, 'uploads/products/photos/KXDnYlADNzNLbcbJsQtfmFVO5cS033DpzZwLk9xV.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(134, NULL, 'uploads/products/photos/lgZA8Ugt02HDDq572a2J8pp7Tev3uu9IYSyitblB.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(135, NULL, 'uploads/products/photos/rmsk19RSI8e0HUh3rR6GgQUJetpmKteFvP1cpxe4.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(136, NULL, 'uploads/products/photos/9jvonU9OWAdj6vnCJkYTRUQf58riTSeMqpMvRZRk.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(137, NULL, 'uploads/products/photos/7YC9BQjOMUyxuwGgdqhjvVH8wkAq7icpeQzidqHx.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(138, NULL, 'uploads/products/photos/I51TcL33C2PxkTAG2HBCIzgG2CLqfjXKsDveDV2i.jpeg', 12, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(139, NULL, 'uploads/shop/sliders/lToeKDeUyWcxy1HRs2yH37oBLyIwEwyPkqdyXBRO.jpeg', 3, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(140, NULL, 'uploads/shop/sliders/asDBJ3Bro1ijNaNnx3Hpnp6uq3n66ndyLczOJ0F6.jpeg', 3, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(141, NULL, 'uploads/shop/sliders/ltwUfHND4QP1K7bPFbuOC4i8v6zL9KHJKzex4zaX.jpeg', 3, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(142, NULL, 'shop/logo/Gt1xw7vjTpMnwpADkGSilc35qrAfcw02kuZ36Jdn.png', 3, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(143, NULL, 'uploads/sliders/rjwIOxbkDNJGEjyasdol9AUH36slkOQYJKimpMNY.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(144, NULL, 'uploads/sliders/wcmnombK38AWAxThyvBp4xmv4rYbK9G60XNBbpcL.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(145, NULL, 'uploads/sliders/Yo76PXP9QjlyG3lZBh8RhUWmXPDg0d0rnDWtORB2.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(146, NULL, 'uploads/sliders/J0jmxhgzG2krlfFS0vlA8cvMQdQBTRFwHkf9HJTg.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(147, NULL, 'uploads/sliders/zOc7gTObSvzwVD72IORJfOKgqcqy5YZyImAuMorc.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(148, NULL, 'uploads/sliders/Cz1vN1rIpxzqeIfCRHnKTtXZnlrtnbGBc7fh5cd9.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(149, NULL, 'uploads/sliders/3osFzLN8PvZIKsYPzlNETTyLlyqOzWrUQoXUSsKd.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(150, NULL, 'uploads/sliders/ryKVLrdxwjecTL5qsDNxlDrR3dYPMKf4ehvyfDgc.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(151, NULL, 'uploads/sliders/7q8WXVUbttkfl0eCliW45xrlJG0OKvc22Nwq5vrB.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(152, NULL, 'uploads/sliders/FrXMTT63QnIUPcve6Mo8GQnfIKGfYnkt87vIZCHC.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(153, NULL, 'uploads/sliders/VEiDTGlPmLBj4Vzq1xdigKExbjnzy5KTr97r0ezO.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(154, NULL, 'uploads/sliders/Qhjvjygp5boME57KUS6W5j6WV05ztHUeSazW2lxC.png', 12, 0, 'png', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(155, NULL, 'uploads/ucQhvfz4EQXNeTbN8Eif0Cpq5LnOwvg8t7qKNKVs.jpeg', 3, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(156, NULL, 'uploads/ucQhvfz4EQXNeTbN8Eif0Cpq5LnOwvg8t7qKNKVs.jpeg', 8, 0, 'jpeg', 'image', '2020-11-21 13:20:37', '2020-11-21 13:20:37', NULL),
(157, 'taj-mahal-purpol4-top-banner', 'uploads/all/rtZPOTVtDPwAW6kdfaVEgaqBMz3U31bEXY8HGnB4.png', 12, 10020, 'png', 'image', '2020-11-21 15:19:33', '2020-11-21 15:19:33', NULL),
(158, 'tycoon-bammer-purple-x1-Recovered', 'uploads/all/bFPBbEs2ZiszPMXJ61M5p3RePHqHCHUphRlE9tNc.png', 12, 68994, 'png', 'image', '2020-11-22 02:56:17', '2020-11-22 02:56:17', NULL),
(159, 'tycoon-bammer-purple-x3-Recovered', 'uploads/all/WgpjJxnZY7k4IXIN88N195gylRMLau1R1sQgWRUP.png', 12, 74963, 'png', 'image', '2020-11-22 02:56:17', '2020-11-22 02:56:17', NULL),
(160, 'tycoon-bammer-purple-x2-Recovered', 'uploads/all/9pFQUDoJAQFlomn5MtQRfZVTxoZJNLREo1RucPqd.png', 12, 84698, 'png', 'image', '2020-11-22 02:56:17', '2020-11-22 02:56:17', NULL),
(161, 'tycoon-bammer-purple-x4-Recovered', 'uploads/all/oAjPRooxOGfb3gJnqd7gfas1tfusB21CU9pa8Ppw.png', 12, 117192, 'png', 'image', '2020-11-22 02:56:17', '2020-11-22 02:56:17', NULL),
(162, 'maxresdefault', 'uploads/all/egt0VZhaeN3eoWFskoWqS8a69XY0tY7KARW5lvO6.jpeg', 12, 184275, 'jpg', 'image', '2020-11-22 21:20:36', '2020-11-22 21:20:36', NULL),
(163, 'refund_request', 'uploads/all/7atZNeZRPtY7dAArCrvtp7ybjnjxt3e5mJbjIksb.jpeg', 12, 89892, 'png', 'image', '2020-11-23 16:21:56', '2020-11-23 16:21:56', NULL),
(164, 'GAMETOP', 'uploads/all/ulk6sUj9wgsjSQchkq2DaygHQRAEZ6SgMwV9b1kx.png', 13, 6526, 'png', 'image', '2020-11-23 16:37:53', '2020-11-23 16:37:53', NULL),
(165, 'women-icon', 'uploads/all/forCNE8BqDa4OODY4xvwzuxBdBA5H1WLEkN1jabJ.png', 12, 54687, 'png', 'image', '2020-11-23 23:57:58', '2020-11-23 23:57:58', NULL),
(166, 'girl-icons', 'uploads/all/zUBPdGIbz39j8dMWtqlZos9qqIEK4ENKvkVMHsk3.png', 12, 55158, 'png', 'image', '2020-11-23 23:57:59', '2020-11-23 23:57:59', NULL),
(167, 'boy-icon', 'uploads/all/95wr21MUs1p86cmZKNw67D92Z0OwqOTh6xbJ0jHK.png', 12, 50540, 'png', 'image', '2020-11-23 23:57:59', '2020-11-23 23:57:59', NULL),
(168, 'shoes-icon', 'uploads/all/rz56twOv1pO3I4DVmkw37JXqNrgJVSfAGypHu7VN.png', 12, 55531, 'png', 'image', '2020-11-23 23:57:59', '2020-11-23 23:57:59', NULL),
(169, 'baby-icon', 'uploads/all/jXFauLy4I6JvOEdENPOEgGT3h4yzIVQ0HID0Ppmm.png', 12, 70300, 'png', 'image', '2020-11-23 23:57:59', '2020-11-23 23:57:59', NULL),
(170, 'appbanner1', 'uploads/all/MMBYjN8qgWvqK6u5EggQBV9irBBNngRyprQ5eAtR.png', 12, 133227, 'png', 'image', '2020-11-24 02:08:25', '2020-11-24 02:08:25', NULL),
(171, 'tycoon-100', 'uploads/all/z4tUjwbMc1Hbg8QreTn0FYJmFwAgXndTVRULuyJn.png', 12, 227244, 'png', 'image', '2020-11-24 02:35:25', '2020-11-24 02:35:25', NULL),
(172, 'tycoon-200', 'uploads/all/0qIO98wAEDx6JAyBdt8RlC7Uhl7hNplzDfEZ4uca.png', 12, 162999, 'png', 'image', '2020-11-24 02:48:38', '2020-11-24 02:48:38', NULL),
(173, 'tycoon-500', 'uploads/all/6xEddZeOkTVK5TdiRgzcMmH6Itvhfg2dxxlJIpjU.png', 12, 204851, 'png', 'image', '2020-11-24 02:48:39', '2020-11-24 02:48:39', NULL),
(174, 'tycoon-800', 'uploads/all/0r0cBz98VMrvulNr7mayukGjGXOoPkQNh5J3RIOi.png', 12, 197773, 'png', 'image', '2020-11-24 02:48:39', '2020-11-24 02:48:39', NULL),
(175, 'tycoon-400', 'uploads/all/iMakz5XbBV6AJXFGv9jdYFBcXICcAuhyxBZajZ9B.png', 12, 225759, 'png', 'image', '2020-11-24 02:48:39', '2020-11-24 02:48:39', NULL),
(176, 'tycoon-300', 'uploads/all/JAmuv7lhqvQettkMQFGKMy0LhUCDHxWbuZC7by9P.png', 12, 230080, 'png', 'image', '2020-11-24 02:48:39', '2020-11-24 02:48:39', NULL),
(177, 'tycoon-700', 'uploads/all/qHnc6AvAE6nIs263921cXYTTp61ZFlCNHFEYiW0m.png', 12, 229979, 'png', 'image', '2020-11-24 02:48:40', '2020-11-24 02:48:40', NULL),
(178, 'tycoon-600', 'uploads/all/2suO4DLLGX92LCTdcDmBI1M4JEOrPoG1CYpKIhqN.png', 12, 186554, 'png', 'image', '2020-11-24 02:48:40', '2020-11-24 02:48:40', NULL),
(179, 'tycoon-1000', 'uploads/all/hIq3mMuRpUQSx9hyNeGMutr0GCoj8ce2FmsO1nNb.png', 12, 180996, 'png', 'image', '2020-11-24 02:48:40', '2020-11-24 02:48:40', NULL),
(180, 'appbanner2', 'uploads/all/fEXjnCkhaS9Yo9Yk7UR3tWM0WWyqtnhn5LXwOjzo.png', 12, 109230, 'png', 'image', '2020-11-24 04:21:31', '2020-11-24 04:21:31', NULL),
(181, 'appbanner4', 'uploads/all/2bzp6riAEsCMiDxJoE5SNvXyIHDnPMUFvcRZwUA9.png', 12, 113317, 'png', 'image', '2020-11-24 04:21:32', '2020-11-24 04:21:32', NULL),
(182, 'appbanner7', 'uploads/all/b1diE7UG5zmcEOHvqBJzx4QKvuj39rBDdjcRt6Eu.png', 12, 135234, 'png', 'image', '2020-11-24 04:21:32', '2020-11-24 04:21:32', NULL),
(183, 'appbanner6', 'uploads/all/Xx9BozrOpkchvAiYIuA7zyQrcFvNUatlTvk7D9Um.png', 12, 135325, 'png', 'image', '2020-11-24 04:21:32', '2020-11-24 04:21:32', NULL),
(184, 'appbanner5', 'uploads/all/1n3QcsvKUbT51prxugRd7PODALsDWnsSU4sNHQg6.png', 12, 126969, 'png', 'image', '2020-11-24 04:21:32', '2020-11-24 04:21:32', NULL),
(185, 'appbanner3', 'uploads/all/R8zdrh3G8qt5urZuud7WSQ8mdE6ExLkT8MmZUfPK.png', 12, 118739, 'png', 'image', '2020-11-24 04:21:32', '2020-11-24 04:21:32', NULL),
(186, 'appbanner8', 'uploads/all/a8nGX776v4FOV9hQSpluO2FMUSCtk36tQGKfJyy7.png', 12, 109585, 'png', 'image', '2020-11-24 04:21:32', '2020-11-24 04:21:32', NULL),
(187, 'appbanner7psd', 'uploads/all/tgcZgylUUqds44GvfCUUFH6LubsDapoKzZ0cfPDi.png', 12, 100641, 'png', 'image', '2020-11-24 04:40:18', '2020-11-24 04:40:18', NULL),
(188, 'men-clothes', 'uploads/all/fWbJbL2nIuKNkC5yDxMDohJWxGoTFqt97HJSDDI5.png', 12, 345965, 'png', 'image', '2020-12-07 11:28:09', '2020-12-07 11:28:09', NULL),
(189, 'baby-clothes', 'uploads/all/7bK2o0jGmojrD94hyr0C5gbZFzEcSvuq9MZDJmxl.png', 12, 363950, 'png', 'image', '2020-12-07 11:28:10', '2020-12-07 11:28:10', NULL),
(190, 'women-clothes', 'uploads/all/LprSz9P3rtJbJBI9GfbZ4y4lYo5CdvkK3lrH37vr.png', 12, 342817, 'png', 'image', '2020-12-07 11:28:10', '2020-12-07 11:28:10', NULL),
(191, 'shoes-clothes', 'uploads/all/moj8aPcl6JYVb4MuC2Z0cd75JmUEoLa8YHKsAmON.png', 12, 360416, 'png', 'image', '2020-12-07 11:28:10', '2020-12-07 11:28:10', NULL),
(192, 'girls-clothes', 'uploads/all/fNYI2WZlaNd3OPckOcuA9cn3nF5OnzeSqjgzvJOB.png', 12, 375678, 'png', 'image', '2020-12-07 11:28:10', '2020-12-07 11:28:10', NULL),
(193, 'new-kids2-clothes', 'uploads/all/UJBxr0BFkjuqQmbhq4MeFzEi3oYdzfieBw5IoUWJ.png', 12, 346408, 'png', 'image', '2020-12-07 11:55:57', '2020-12-07 11:55:57', NULL),
(194, 'new-kids-clothes', 'uploads/all/2u7ZQZPkc8ZGOOJrRGGoOpBy1Eh9n9eMe2i5hJXL.png', 12, 358920, 'png', 'image', '2020-12-07 11:55:57', '2020-12-07 11:55:57', NULL),
(195, 'cat-banner-tycoon-baby', 'uploads/all/EKpAKvbIYGUs7vsM5zLxqsbdlLcXYUAHUBQlc3hz.png', 12, 86370, 'png', 'image', '2020-12-07 12:24:18', '2020-12-07 12:24:18', NULL),
(196, 'cat-banner-tycoon-woman', 'uploads/all/A3YTaPkL1TjJbIeNxgOGbgEJDDGWCKPvEa9Ul9mm.png', 12, 62802, 'png', 'image', '2020-12-07 12:24:18', '2020-12-07 12:24:18', NULL),
(197, 'cat-banner-tycoon-girls', 'uploads/all/pAdJrSteafbafnAmuQSwyvT6kZVP4Zw7ir51SoJy.png', 12, 79714, 'png', 'image', '2020-12-07 12:24:19', '2020-12-07 12:24:19', NULL),
(198, 'cat-banner-tycoon-boys', 'uploads/all/xndYr8rC50NWGnp6o6KFKMXvwNDOz336FVVbVtqW.png', 12, 75301, 'png', 'image', '2020-12-07 12:24:19', '2020-12-07 12:24:19', NULL),
(199, 'cat-banner-tycoon-shoes', 'uploads/all/r75LRaySYLKAr4Fo3ya12SlxVPXVa6nC1fPoBiU9.png', 12, 69748, 'png', 'image', '2020-12-07 12:24:19', '2020-12-07 12:24:19', NULL),
(200, 'banner_istart-bg[1]', 'uploads/all/m40knyHO6qX24042KExK2jZ0TjjJc57HlHoiDPSP.jpeg', 12, 72012, 'jpg', 'image', '2020-12-09 15:57:08', '2020-12-09 15:57:08', NULL),
(201, NULL, '/home1/tycoon/public_html/public/uploads/all/1607545360H3lLlY4gC75i.jpg', 8, 0, 'jpg', 'img', '2020-12-09 18:22:40', '2020-12-09 18:22:40', NULL),
(202, NULL, '/home1/tycoon/public_html/public/uploads/all/1607545423mzdzzvM65WMW.jpg', 13, 0, 'jpg', 'img', '2020-12-09 18:23:43', '2020-12-09 18:23:43', NULL),
(203, NULL, 'uploads/all/1607545562kNbQtZDAeO8h.jpg', 13, 0, 'jpg', 'img', '2020-12-09 18:26:02', '2020-12-09 18:26:02', NULL),
(204, NULL, 'uploads/all/1607545593Do1GRfdr7gHx.jpg', 13, 0, 'jpg', 'img', '2020-12-09 18:26:33', '2020-12-09 18:26:33', NULL),
(205, NULL, 'uploads/all/1607546635rZEe3Ikb6W25.jpg', 13, 0, 'jpg', 'img', '2020-12-09 18:43:55', '2020-12-09 18:43:55', NULL),
(206, '#76  laravel roles and permissions without packages part1- eCommerce multi tenancy', 'uploads/all/Gx3qrzLare1X0oTe346ihjrjV55vgzLpiwF3U055.mp4', 12, 59296379, 'mp4', 'video', '2021-01-07 09:49:16', '2021-01-07 09:49:16', NULL),
(207, 'Gaming Accessories', 'uploads/all/m6yvSGFAABuk8MbBczZt5hvgTKncBMUNyIH5PuYl.jpeg', 12, 17310, 'jpg', 'image', '2021-01-21 08:50:06', '2021-01-21 08:50:06', NULL),
(208, 'tycoon-logo', 'uploads/all/3HCOaLcpi9sNwykZz5OB2MbPf0iPkGlt1kMOUVbi.jpg', 12, 32489, 'jpg', 'image', '2021-08-03 16:11:46', '2021-08-03 16:11:46', NULL),
(209, 'WhatsApp Image 2021-08-23 at 11.08.33 PM (2)', 'uploads/all/p4AeHEYaBEM0wQqj9PVBoIAXsoQRHul0Astemtg3.jpg', 12, 6621, 'jpeg', 'image', '2021-08-24 03:21:58', '2021-08-24 03:21:58', NULL),
(210, '5OawpCSDUkom4FLTHpRBmvknpgGdmhE72uZpIocG', 'uploads/all/czp4N669SKW3cIUYEFQ624hzwaKqABxRTT6DCzAO.jpg', 12, 10485, 'jpg', 'image', '2021-08-24 16:51:04', '2021-08-24 16:51:04', NULL),
(211, 'WhatsApp Image 2021-08-23 at 11.08.33 PM (2)', 'uploads/all/HnVwjI3DliltFosyDbxTFOYK2rXKaSJlSpUbJyPx.jpg', 12, 6621, 'jpeg', 'image', '2021-08-25 00:06:45', '2021-08-25 00:06:45', NULL),
(212, 'TYCOON-BANNER', 'uploads/all/KPiKXGHrWwpP2fdW1YLOmr24MgxcQKeTJaUqHe88.jpg', 12, 111846, 'jpg', 'image', '2021-08-26 18:24:00', '2021-08-26 18:24:00', NULL),
(213, 'TYCOON-BANNER2', 'uploads/all/znBQbSCbdn0lAC4mdEfRUeGxrI9hvQ1xdkhNS1fH.png', 12, 240482, 'png', 'image', '2021-08-26 18:24:00', '2021-08-26 18:24:00', NULL),
(214, 'tycoon99', 'uploads/all/2haNjZEmlgJANjfHxDChQ5MCwiVl4P5iATzXe5EL.jpg', 12, 300953, 'jpg', 'image', '2021-08-26 18:24:00', '2021-08-26 18:24:00', NULL),
(215, 'TYCOON100', 'uploads/all/f1sW8jaz9lEGLsQ7HmprXXkCHO6ODf4S9mt4DSZA.jpg', 12, 344179, 'jpg', 'image', '2021-08-26 18:24:00', '2021-08-26 18:24:00', NULL),
(216, 'icon5', 'uploads/all/ZyQnC5eJJPAN6pWA2ysNyyfGXAEUVzows2ndEfcq.png', 56, 4799, 'png', 'image', '2021-10-27 04:56:44', '2021-10-27 04:56:44', NULL),
(217, 'icon1', 'uploads/all/xgQgKV8EOUgdyTQj8PMaUljeoo5wgGGAT9b11vsx.png', 56, 7850, 'png', 'image', '2021-10-27 04:57:18', '2021-10-27 04:57:18', NULL),
(218, 'icon5', 'uploads/all/02Xy0kHAbTlLrzCYPUT66fEt7QnECwNlW1lXNmAI.png', 56, 4799, 'png', 'image', '2021-10-27 04:57:18', '2021-10-27 04:57:18', NULL),
(219, 'icon2', 'uploads/all/0oDhI2rfoJVEZ9I0DYPfUG9RvXodZoVPoTHbG7s3.png', 56, 6150, 'png', 'image', '2021-10-27 04:57:18', '2021-10-27 04:57:18', NULL),
(220, 'icon6', 'uploads/all/NZz0VA35Ko4EmChYA2ABUnHi3NCSv2Cs56q6CBgr.png', 56, 5796, 'png', 'image', '2021-10-27 04:57:18', '2021-10-27 04:57:18', NULL),
(221, 'icon4', 'uploads/all/rxQhsL0MxpqRqun0lW8l8QRfj9RJzq10IwyeuAfI.png', 56, 15100, 'png', 'image', '2021-10-27 04:57:18', '2021-10-27 04:57:18', NULL),
(222, 'icon3', 'uploads/all/hqVy2HrovIMTvWt0FFavaqmi6qUZj5uMtbIhyEmF.png', 56, 6336, 'png', 'image', '2021-10-27 04:57:18', '2021-10-27 04:57:18', NULL),
(223, 'H3acf0c82f1e6489cb9c8386b8f94ed06b', 'uploads/all/N78Gg5rUSkhmb1EvKgCQSEoxi4EqRfnYAr6IKIjI.jpg', 59, 363087, 'jpg', 'image', '2021-10-28 02:02:57', '2021-10-28 02:02:57', NULL),
(224, 'Ha2c4f63929874364a81db8d0107b107aM', 'uploads/all/c5ED1T1Ar7AQndAd2ykbKoO12bG7Fn6CTNvy0nyE.jpg', 59, 395194, 'jpg', 'image', '2021-10-28 02:02:58', '2021-10-28 02:02:58', NULL),
(225, 'Hc45348c968f9494d8e3b9bdb6aca28f3l', 'uploads/all/L0E5PtVctSDF5c3RwH4AYcdPH7u7yhdl4qmP8Jif.jpg', 59, 398910, 'jpg', 'image', '2021-10-28 02:02:58', '2021-10-28 02:02:58', NULL),
(226, 'H83c6ab2514604ff2857cb65a649f7ec5p', 'uploads/all/EiBOkNS2EAKO4cotqDE2DCtFKc2kUC6Fv2nP1o4K.jpg', 59, 520499, 'jpg', 'image', '2021-10-28 02:05:40', '2021-10-28 02:05:40', NULL),
(227, 'WhatsApp Image 2021-11-17 at 3.01.30 PM', 'uploads/all/rNj1RKAtxjrgwBMo27qEH3wStPWZ6XgwGzyonNEo.jpg', 12, 28264, 'jpeg', 'image', '2021-11-17 16:28:00', '2021-11-17 16:28:00', NULL),
(228, 'image-3', 'uploads/all/kUL63OWnri1E3AXG2Tk9G7dftXP4GjSq3NfwS67X.png', 68, 76127, 'png', 'image', '2021-11-25 17:47:45', '2021-11-25 17:47:45', NULL),
(229, 'Hc47923062c544184a58d765be99d85bdg', 'uploads/all/tDu73hsmWREZwolCrBefJhFchdjm8cR8EB9yPLmW.jpg', 69, 189041, 'jpg', 'image', '2021-11-25 19:41:58', '2021-11-25 19:41:58', NULL),
(230, 'H5915e40505b141ea946b18609ca2004cN', 'uploads/all/EfIa3dXSpl9BALu4HNHGpABEPq7K8LtVTU1kBiao.jpg', 69, 188979, 'jpg', 'image', '2021-11-25 19:41:59', '2021-11-25 19:41:59', NULL),
(231, 'H79b916c6f7264f06b18840bec79b0b33N', 'uploads/all/KK9vmOQ4qCn1CEz6K4kUh50XFZFMUe3xn4arQ6t3.jpg', 69, 199015, 'jpg', 'image', '2021-11-25 19:41:59', '2021-11-25 19:41:59', NULL),
(232, 'He919623adde442c4af14d58e44dd817fE', 'uploads/all/nlvhZpUIxrEKbPYnrTMSdloSK09eYYeaK5rmjcdE.jpg', 69, 203447, 'jpg', 'image', '2021-11-25 19:42:00', '2021-11-25 19:42:00', NULL),
(233, 'Hf481fb51f2ee48089633ff4b9408e26bC', 'uploads/all/SCmqMdKmxg6N2vBGx5s3FR4fDcKoHoCcx5dxNzEg.jpg', 69, 284774, 'jpg', 'image', '2021-11-25 19:42:02', '2021-11-25 19:42:02', NULL),
(234, 'Hdde8e3c11fde49f8bc18766db3341d70Z', 'uploads/all/kTdWAPHDClNVTMhwrWj8YtiGbL0aJcIvO0IOANTM.jpg', 69, 305442, 'jpg', 'image', '2021-11-25 19:42:02', '2021-11-25 19:42:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `upsale_product`
--

CREATE TABLE `upsale_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `upsale_product`
--

INSERT INTO `upsale_product` (`id`, `product_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 71, 1, '2021-06-24 02:08:08', '2021-06-24 02:08:08'),
(2, 71, 1, '2021-06-24 02:09:46', '2021-06-24 02:09:46'),
(3, 71, 2, '2021-06-24 03:25:28', '2021-06-24 03:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `new_email_verificiation_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verification_code` int(50) DEFAULT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `wholesale` tinyint(2) NOT NULL DEFAULT 0,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wholesale_active` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `email_verified_at`, `new_email_verificiation_code`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `verification_code`, `balance`, `wholesale`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`, `wholesale_active`) VALUES
(3, NULL, NULL, 'seller', 'Mr. Seller', 'seller@example.com', '2018-12-11 16:00:00', NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', '1zoU4eQxnOC5yxRWLsTzMNBPpJuOvTk4g3GMUVYIrbGijiXHOfIlFq0wHrIn', 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', '155', 'Demo address', 'US', 'Demo city', '1234', NULL, NULL, 0.00, 0, 0, '3dLUoHsR1l', NULL, NULL, '2018-10-07 02:42:57', '2020-11-21 13:20:37', 0),
(8, NULL, NULL, 'customer', 'hassan khaled', 'hassankhaled132@gmail.com', '2018-12-11 16:00:00', NULL, '$2y$10$JePYOAaCr7DL3g9UbxdEN.tuFzXljDn/qWfsBUNPQR4hW2LirZzcK', 'oodDiltXLbuaLhxAcy8MDP2IluWDRILQ6YOEOJKgFuuThFpKiUVf5SIMi5wf', 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', '156', 'Demo address', 'US', 'Demo city', '1234', NULL, NULL, 0.00, 1, 0, '8zJTyXTlTT', NULL, NULL, '2018-10-07 02:42:57', '2021-07-29 17:01:04', 1),
(12, NULL, NULL, 'admin', 'naderadam', 'naderadam20152015@gmail.com', '2020-06-14 19:06:37', NULL, '$2y$10$JePYOAaCr7DL3g9UbxdEN.tuFzXljDn/qWfsBUNPQR4hW2LirZzcK', 'OZugsudIPY7FNpTpsI6ob58UePdcQiilsP9E8RvyU7l1ugDK8RdX4pZ9I6y5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40.00, 0, 0, NULL, NULL, 0, '2020-06-14 19:51:37', '2020-12-07 18:31:48', 0),
(13, NULL, NULL, 'customer', 'Aya Shaban', 'aya@gmail.com', '2020-11-17 15:11:10', NULL, '$2y$10$JePYOAaCr7DL3g9UbxdEN.tuFzXljDn/qWfsBUNPQR4hW2LirZzcK', 'vQNsZqVFoGUA1QK45pW5q0zFZEFB3S14NYb90Yvi7sIQ7CBDRhHDz7C2S9dW', NULL, '205', 'القاهرة', 'egypt', 'cairo', '23', '2345678900', NULL, 410.00, 0, 0, NULL, NULL, 0, '2020-11-17 15:05:10', '2021-07-29 17:38:31', 0),
(14, NULL, NULL, 'customer', 'hassan', 'k.abo46@gmail.com', '2020-11-17 15:11:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-17 15:11:50', '2020-11-17 15:11:50', 0),
(15, NULL, NULL, 'customer', 'hosain', 'shs@shs.com', '2020-11-19 16:11:04', NULL, '$2y$10$cPhGkuGLpjUeqnXxrQzfI.9v3FbCDzEgKPJ5zSCgNVqyxyDQn4y0S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-19 16:59:04', '2020-11-19 16:59:04', 0),
(16, NULL, NULL, 'customer', 'shs', 'shs@email.com', '2020-11-19 18:11:00', NULL, '$2y$10$ileN5jKrbQM96ihPQJwl6uV/YqyZAVLbPqh/Xe.4BKkMKIOeVt7Ji', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-19 18:19:00', '2020-11-19 18:19:00', 0),
(17, NULL, NULL, 'customer', 'hosain', 'hosain@email.com', '2020-11-19 19:11:22', NULL, '$2y$10$sa6fl1OBEnYCFKBqsZRVYexJkoIDMovLszoWDN2GsFAmFGOJH.wOC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-19 19:00:22', '2020-11-19 19:00:22', 0),
(18, NULL, NULL, 'customer', 'Hosian', 'hosain@gmail.com', '2020-11-19 19:11:43', NULL, '$2y$10$uvnrm.E8eBdVEUK8gC7UkOlYaLm8U8OQ.bo4VmzLFUjgE8r6PHuj6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-19 19:41:43', '2020-11-19 19:41:43', 0),
(19, NULL, NULL, 'customer', 'حسين', 'hosain@hosain.com', '2020-11-19 19:11:58', NULL, '$2y$10$k1d9kIoxg9/52u1WrHh5tej6pq34TbZ3CB5eN46cfyErenNm5zj2W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-19 19:49:58', '2020-11-19 19:49:58', 0),
(20, NULL, NULL, 'customer', 'Hosain', 'HosainAli@gmail.com', '2020-11-23 03:11:15', NULL, '$2y$10$Tw7jCC.DfpRwu4nXMhzNnOz/CEPIgneReKFUZDu8PVM2eHaaPJSci', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-23 03:16:15', '2020-11-23 03:16:15', 0),
(21, NULL, NULL, 'customer', 'hosain', 'hosain@yahoo.com', '2020-11-23 07:11:56', NULL, '$2y$10$yH07ritetChaeO/B5yEGz.Tww9qTIc00NAght1nIf5cC4tZ3SV37.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-23 07:00:56', '2020-11-23 07:00:56', 0),
(22, NULL, NULL, 'customer', 'محمد سامي', 'mohamed@gmail.com', NULL, NULL, '$2y$10$1l3U5eXCOetdknpzJZFgDePmm2yHJAzxSWTFG0dlUpmwTvZPA.ilG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+01096432967', 940678, 0.00, 0, 0, NULL, NULL, 0, '2020-11-29 19:56:41', '2020-11-29 19:56:41', 0),
(23, NULL, NULL, 'customer', 'ابراهيم علي', NULL, NULL, NULL, '$2y$10$LZjggNxnsoS4Gg2CEtcdXud7RFmkl6DcVv8Dk/KYM3EtM9YH3NSwe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+0112345678908', 986438, 0.00, 0, 0, NULL, NULL, 0, '2020-11-29 20:01:04', '2020-11-29 20:01:04', 0),
(24, NULL, NULL, 'customer', 'نادر ادم', 'nader@gmail.com', NULL, NULL, '$2y$10$h1dBFt0yvcuNSvYnEYMmhOB.cZIa2dGGbGsMHDD1kat4tFC7ok0uy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+012345678905', 276845, 40.00, 0, 0, NULL, NULL, 0, '2020-11-29 21:01:05', '2020-11-29 22:23:48', 0),
(26, NULL, NULL, 'customer', 'نادر ادم', NULL, NULL, NULL, '$2y$10$xMLogFnYdP.IUb273wbRdeUkrswEEptGUkw7lp.INbQrIaSjocBLK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+012345678905', 862532, 0.00, 0, 0, NULL, NULL, 0, '2020-11-29 21:02:06', '2020-11-29 21:02:06', 0),
(27, NULL, NULL, 'customer', 'نادر ادم', NULL, NULL, NULL, '$2y$10$Nx22UV.tTO0EuiZVJchiZeXHZ0zSPtqkrBCF2qNflbC1hFUdYHQGK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+012345678905', 338714, 0.00, 0, 0, NULL, NULL, 0, '2020-11-29 21:02:15', '2020-11-29 21:02:15', 0),
(28, NULL, NULL, 'customer', 'نادر ادم', NULL, NULL, NULL, '$2y$10$Wc6bwYrYkkY/wIvcG0L0O.HW29xuznuWGrpOZy9irmVwJZeCTGlHm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+012345678905', 857860, 0.00, 0, 0, NULL, NULL, 0, '2020-11-29 21:02:55', '2020-11-29 21:02:55', 0),
(29, NULL, NULL, 'customer', 'نادر ادم', NULL, NULL, NULL, '$2y$10$30DCMgRJKH0wb4NbMfv25.0jczNRQa0l8CDHl4.bRMMVGl1SipS.u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+012345678905', 245695, 10.00, 0, 0, NULL, NULL, 0, '2020-11-29 21:03:10', '2020-11-29 21:03:11', 0),
(30, NULL, NULL, 'customer', 'نادر حنتش', NULL, NULL, NULL, '$2y$10$.LsDzyiHEp6Q9PEwNfkGmek86LILZPzkda7KmxTFXJK1tjc5v14di', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+012346754890', 375020, 30.00, 0, 0, NULL, NULL, 0, '2020-11-29 21:05:10', '2020-11-29 21:05:10', 0),
(31, NULL, NULL, 'customer', 'محمد سعيد', NULL, NULL, NULL, '$2y$10$O3cqa9bFY.gijjOdp8YYju9DmO5NuAHiuLD9DwzAGLRdv/T7NAMza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+02314567890', 474640, 20.00, 0, 0, NULL, NULL, 0, '2020-11-29 21:07:23', '2020-11-29 21:07:24', 0),
(32, NULL, NULL, 'customer', 'محمد سعيد', NULL, NULL, NULL, '$2y$10$fDKQ8FD4TTvCrIOcF70RuO7EQsIEGaQxGC8anM3iepLM40SNc4CVm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+0324567890', 318996, 20.00, 0, 0, NULL, NULL, 0, '2020-11-29 21:11:14', '2020-11-29 21:11:14', 0),
(33, NULL, NULL, 'customer', 'hosain', 'hosain44@gmail.com', '2020-11-30 22:11:08', NULL, '$2y$10$i9bKjE3dY0lybSv2fijbK.eJdPWQYFFslgvXI48XMv69V5U6tTFAa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-30 22:47:08', '2020-11-30 22:47:08', 0),
(34, NULL, NULL, 'customer', 'hosain', '123456@email.com', '2020-11-30 22:11:13', NULL, '$2y$10$/JVmF.y.p7XhfonS3AErKuA6YmXvdpe64vbroUyd2qgICuJOzndBW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-11-30 22:48:13', '2020-11-30 22:48:13', 0),
(35, NULL, NULL, 'customer', 'حسين', 'shs@gmail.com', '2020-12-01 12:12:38', NULL, '$2y$10$ahUBC4imJNVYaG30OhHYq.BHcpVVv/9yvDfBnyunfOItmBikuGSXW', NULL, NULL, NULL, 'Hospital ‎St', 'مصر', 'المنصورة', '١٢٣٤٥٦', '010123', NULL, 50.00, 0, 0, NULL, NULL, 0, '2020-12-01 12:52:38', '2020-12-10 22:40:30', 0),
(36, NULL, NULL, 'customer', 'Документ номер WLR509825WLR2 подготовлен. Смотрите документ12 далее на странице http://apple.com', 'oleg.amirov.80@mail.ru', '2020-12-09 05:12:03', NULL, '$2y$10$5vCS8w0.OmriglwGmTqLs.A9bbqziiatKbJPdKO5tzBzliYoKVGdW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-12-09 05:11:03', '2020-12-09 05:11:03', 0),
(37, NULL, NULL, 'customer', 'mohammad', 'gridsapps@gmail.com', '2020-12-16 17:12:17', NULL, '$2y$10$xLSLTWaAVeZ6giK0ekmXLuCxS.HG8/zuBVKkDLBrhjYuN/F4N4Rs2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-12-16 17:36:17', '2020-12-16 17:36:17', 0),
(38, NULL, NULL, 'customer', 'محمد', 'qassim.mohammad@gmail.com', '2020-12-16 22:12:38', NULL, '$2y$10$xLQ.8QZp1/4a8LvuXNC3fu7DGEtnA5hLEns2H92FVGTGcJ9GvkYQS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2020-12-16 22:51:38', '2020-12-16 22:51:38', 0),
(39, NULL, NULL, 'customer', 'Hosain', 'hosain@gridsapps.com', '2021-03-26 03:03:52', NULL, '$2y$10$eZAMAA40UK.lWf/GNjkL/O2DqbololpTZmN9dSdnWJhGeu9aL8JyO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-03-26 03:59:52', '2021-03-26 03:59:52', 0),
(40, NULL, NULL, 'customer', 'نادر', 'nadar@gmail.cm', NULL, NULL, '$2y$10$TjTwSZUo077Pl7h9EWgRQ.ds5cy8kUDTIACoMhWL0RhVlaDpl4aJq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+010123456789', 295822, 0.00, 0, 0, NULL, NULL, 0, '2021-07-25 20:35:12', '2021-07-25 20:35:12', 0),
(41, NULL, NULL, 'customer', 'name', 'email@email.com', NULL, NULL, '$2y$10$sBwXsnBmM/Mkb/vZQQbF7O811Vg3MJHsSG0XX/F6oB12TgUYStgA6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 1, 0, NULL, NULL, 0, '2021-07-29 17:32:53', '2021-07-29 17:33:12', 0),
(42, NULL, NULL, 'customer', 'Ahmed Ali', 'my@mozej.com', NULL, NULL, '$2y$10$Tm.ZzxFbHaRs4z.MObO1DOMaQSD9lBXxBAHtb5Wbupy26aWIrDoyy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-08-24 03:33:46', '2021-08-24 03:33:46', 0),
(43, NULL, NULL, 'customer', 'Ahmed Ali', 'my@admin.com', NULL, NULL, '$2y$10$8keOCnEpxRsBg.E74H25fOOQetTaS362bkI4yzTF5Vh6sMQ4IWaKi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-08-25 21:51:05', '2021-08-25 21:51:07', 0),
(44, NULL, NULL, 'seller', 'Aliiii', 'eb2ff10ad1@emailnax.com', '2021-08-28 13:08:08', NULL, '$2y$10$Lf7Lp5RXYEwx7VVhnae1UuimKl.8Rs/SRF7U1KLaudspiOeOviOta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-08-28 13:27:55', '2021-08-28 13:38:08', 0),
(45, NULL, NULL, 'seller', 'Armand Gilmore', 'gynoqaxof@mailinator.com', '2021-08-28 15:08:15', NULL, '$2y$10$8t5jfwwMUBRu6WBxFHqVZuLS6AMbdtKo4Z8FCAWNXI9nJpAJMjN5C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 1, 0, NULL, NULL, 0, '2021-08-28 14:06:51', '2021-08-28 15:53:15', 0),
(46, NULL, NULL, 'customer', 'mytagaer', 'mytagaer@gmail.com', NULL, NULL, '$2y$10$zj037Un0jZgeoMeBKHokg.QS530Bw79u5YN8wvE3psJg7rbL.h4xq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 1, 0, NULL, NULL, 0, '2021-08-28 15:57:17', '2021-08-28 15:57:36', 0),
(47, NULL, NULL, 'seller', 'Ahmed Tager', 'a@a.com', '2021-08-28 16:08:31', NULL, '$2y$10$919W1R4jc6UrdNjgOf9V5eIaMO85fu/1TCd5Z4dhiodB2zWMkxRiC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 1, 0, NULL, NULL, 0, '2021-08-28 16:04:37', '2021-08-28 16:19:31', 1),
(48, NULL, NULL, 'customer', 'ALi Ahmed', 'f993494f42@emailnax.com', NULL, NULL, '$2y$10$FLW79wEyCcIMIHqvNnMjueRHzxLZjcIvwXngg3EBvgoJpEd0fE4gW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-08-31 00:56:13', '2021-08-31 00:56:13', 0),
(49, NULL, NULL, 'customer', 'samiali', 'samiali@sami.com', NULL, NULL, '$2y$10$RB2DBZ79U7B4HNQkOWnMvetWcoLoeZ1O8q.CBi349RvhLLO0ppRJm', '3nd5wOQ5KbGB2RUu35oWUIxiSNnFB8tQR8vIqD0RKBsWRfty3fHTBr5YzAtm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 1, 0, NULL, NULL, 0, '2021-08-31 02:32:28', '2021-10-27 03:48:43', 1),
(50, NULL, NULL, 'seller', 'EtoHaMrshwdeG', 'silviomarileer3j5zc1@gmail.com', '2021-09-22 19:09:50', NULL, '$2y$10$jJluURC3vIJkAIkC9ndFDuB2WCQpUHQOsYfbKPK4LXhz3WfKYG.Na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-09-22 19:42:50', '2021-09-22 19:42:50', 0),
(51, NULL, NULL, 'seller', 'BoKaciYpsIUvZCmO', 'taddvrqfordaqw6fg2p7jli@gmail.com', '2021-09-25 09:09:30', NULL, '$2y$10$ODRpwPKsXSmcOm/U544ux.ZB59iWBFIYKBLwH/223SbyGqIVL73A2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-09-25 09:21:30', '2021-09-25 09:21:30', 0),
(52, NULL, NULL, 'seller', 'OoaeStmExUBzj', 'tonie4lmsr19@gmail.com', '2021-10-02 03:10:28', NULL, '$2y$10$B4B70fw50l2u2wGTMtvFZuLvoYawAFxPvviJrPpW.3zGuOKaJy1Dq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-10-02 03:23:28', '2021-10-02 03:23:28', 0),
(53, NULL, NULL, 'seller', 'jMOcyFYJzAwGUVhb', 'adelheidq4don06@gmail.com', '2021-10-04 12:10:13', NULL, '$2y$10$YlZr7P4Wejed7z6Bw1.1euZTUx.YUGFxFRctlYJySHQcK.EYtGJNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-10-04 12:30:13', '2021-10-04 12:30:13', 0),
(54, NULL, NULL, 'customer', 'Ich empfehle Ihnen Wem:tycoon.today https://audi.com', 'everodo23@mail.ru', NULL, NULL, '$2y$10$TmBHWRr846ZbGKgjC6J63e6XSJl0uD.8Kg9m76i1k6u1H6Rp.gfYW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-10-05 10:23:26', '2021-10-05 10:23:26', 0),
(55, NULL, NULL, 'seller', 'NZrvJoDkFHns', 'carmelinakfymi39@gmail.com', '2021-10-11 15:10:27', NULL, '$2y$10$wbtCltW43W/hrB345UpcEOlcgpsdFwSkI6BZ0Qe/SESerrr6OYI..', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-10-11 15:31:27', '2021-10-11 15:31:27', 0),
(56, NULL, NULL, 'seller', 'ali', 'ali@tycoon.today', '2021-10-27 04:10:21', NULL, '$2y$10$Xs0LH.LY7qM86W1ZyK7i7e2atp5CblnufHVOcqTAS7P9bEyVK4Rxe', 'puQqNxxpSmrNmjnMHxuVYMgXZJSXPpUZnHommoi8IG1ijGq8W3RQ6ncZg2pv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 1, 0, NULL, NULL, 0, '2021-10-27 04:33:10', '2021-10-27 04:45:21', 1),
(57, NULL, NULL, 'customer', 'somo', 'somo@tycoon.today', NULL, NULL, '$2y$10$0xN8tDBMwbKw5rsMV45bWODptdEEJ8qx.luCVmUgaTC5Lc5MRU2om', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-10-27 22:38:36', '2021-10-27 22:38:36', 0),
(58, NULL, NULL, 'staff', 'admin2', 'admin2@tycoon.today', NULL, NULL, '$2y$10$P81g1gw2wqNG7MFuw1oCD.9Hr6Qmvi/wkYGw3EIZlDncPgGbjXNxW', 'w8Gqiy0dhPz2BTvTzZQ9kAfqOx2Hruk6wPjmvGhxoW5gdB2K04p9YSsLHL0m', NULL, NULL, NULL, NULL, NULL, NULL, '0656095096', NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-10-27 22:53:01', '2021-10-27 22:53:01', 0),
(59, NULL, NULL, 'seller', 'ارسانيوس', 'arsanuoshanna3@gmail.com', '2021-10-28 01:10:39', NULL, '$2y$10$BS/6Y6HPsdB4Bkp2OHcEgeJ6x7c49Ig1r4xu.9JA/pR31frcwHDSO', 'Fgv2c0CiqwfsWMjRq0eIpF1aTsHMQjhhhbNtbCPTxRxK5aGHavOTjxDrB1f1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 1, 0, NULL, NULL, 0, '2021-10-28 01:44:55', '2021-10-28 01:56:39', 1),
(60, NULL, NULL, 'customer', 'Fg', 'totan400@gmail.com', NULL, NULL, '$2y$10$ezHIjxePfekVgn.nHIEGiOAZnCpV5TX.AJBz3x6ZEvEooYOw0WZyW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-10-28 02:39:30', '2021-10-28 02:39:30', 0),
(61, NULL, NULL, 'seller', 'Ahmed', '13d8aacf27@emailnax.com', '2021-10-28 22:10:59', NULL, '$2y$10$gNyKukO6/EwmPpG1TUpG5eAnq//SFwcEvKQnSx0B1Q23nNOubF0re', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 1, 0, NULL, NULL, 0, '2021-10-28 22:55:41', '2021-10-28 23:00:56', 0),
(62, NULL, NULL, 'customer', 'salo', 'salo@gridsapps.com', NULL, NULL, '$2y$10$iAxHiIp6kBROANl3sKBoue3f7mGSOqi2xWRtlYyuxDiyBUw0xyobu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-10-29 01:39:27', '2021-10-29 01:39:27', 0),
(63, NULL, NULL, 'customer', 'ah100', 'ah100@tycoon.today', NULL, NULL, '$2y$10$nDbp2ed8/J6JsFCpyveB2eqnVGyPCdQGFUsGic769vLmrltBWll4G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-10-29 03:19:39', '2021-10-29 03:19:39', 0),
(64, NULL, NULL, 'seller', 'oDmFiVQdnEWf', 'epope9288@gmail.com', '2021-11-03 17:11:34', NULL, '$2y$10$j5tM6EtxEJ8wzpp6RZOFo.ghk8NSzIPgeT.IT5pXDCVvfGwMDwDLS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-11-03 17:36:34', '2021-11-03 17:36:34', 0),
(65, NULL, NULL, 'seller', 'SzWOMNTovcnErJqI', 'alicestokes2866@gmail.com', '2021-11-07 14:11:03', NULL, '$2y$10$P0eIQ4SPl7.kpWtTnZDFguHenhqPZ/bF4JZA5bV04sh.e0/C8u9q2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-11-07 14:31:03', '2021-11-07 14:31:03', 0),
(66, NULL, NULL, 'seller', 'مصنع الملابس', 'f2de45a385@emailnax.com', '2021-11-24 19:11:02', NULL, '$2y$10$rU7GgHBYP3DxwM4T43N5iOhDA5tzHIWVzWKZ0TU8o2t0r/5aIop/e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-11-24 19:30:02', '2021-11-24 19:30:02', 0),
(67, NULL, NULL, 'customer', 'ارسانيوس', 'arsanuos27@gmail.com', NULL, NULL, '$2y$10$pzpTDTi1n5fK3b2v4Czl7OoK6YlETn7GK/tN02QClpYfyv2uD65K2', 'tyGUPoFhZ61NaiPezhCj5oRXrrHe7foD8D2i90UJypEioYx7z7PgXgxIIr81', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-11-25 15:15:48', '2021-11-25 21:44:35', 0),
(68, NULL, NULL, 'seller', 'test', 'test@test.com', '2021-11-25 17:11:46', NULL, '$2y$10$E6Wwk9tER7FQUarQxCcIFu4TNU17vqVllohMluoYEMdE.y6gJS9nO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, 1, 50, '2021-11-25 17:34:46', '2021-11-25 19:41:15', 0),
(69, NULL, NULL, 'seller', 'ابانوب', 'bebowilliam12@gmail.com', '2021-11-25 18:11:31', NULL, '$2y$10$eK47wR4UHVnJwGmGnLhCsO1XQxmeKiftvDZHLhd07tKa2J/cJ1a/S', 'ERlKe3rHleg16F0i9GwS2sCV8zrWEDDNBBZ6gv2WCXQRIhsQ0TMmkGvOn5P2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0.00, 0, 0, NULL, NULL, 0, '2021-11-25 18:08:32', '2021-11-25 18:57:31', 0),
(70, NULL, NULL, 'customer', 'ماريا', 'arsanuos35@gmail.com', '2021-11-25 20:11:22', NULL, '$2y$10$T05WKn68GovV7Tm9kPhRIOcefzggrtkOnkqYz4AJl5.QEauJMtMP.', '31EBDUwPpMX0XgEEX2mqSvrniMh7Gkm3OpqhCPCLBaGrZb2jK682OTYVtDAv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-11-25 20:28:22', '2021-11-25 20:28:22', 0),
(71, NULL, NULL, 'staff', 'شركه ايرجنت', 'totan400@yahoo.com', NULL, NULL, '$2y$10$MGhD2YQ/fPzk0i3ulyXJR.CR4oWrKYwlzlQv47fl3ob2pYuQMakJq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01283337434', NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-11-25 20:33:38', '2021-11-25 20:33:38', 0),
(72, NULL, NULL, 'customer', 'Mustafa', 'mustafa@gmail.com', '2021-11-26 01:11:05', NULL, '$2y$10$lNl20/tuVW8DBDLVE1TN8O4uoSJeSvFBGBQCQX8UX06aV6J3O.4rK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, 0, NULL, NULL, 0, '2021-11-26 01:43:05', '2021-11-26 01:43:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval` int(1) NOT NULL DEFAULT 0,
  `offline_payment` int(1) NOT NULL DEFAULT 0,
  `reciept` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `amount`, `payment_method`, `payment_details`, `approval`, `offline_payment`, `reciept`, `created_at`, `updated_at`) VALUES
(1, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-23 17:27:22', '2020-11-23 17:27:22'),
(2, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-23 17:27:26', '2020-11-23 17:27:26'),
(3, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-23 17:46:59', '2020-11-23 17:46:59'),
(4, 13, 100.00, 'Refund', 'Product Money Refund', 0, 0, NULL, '2020-11-23 17:48:47', '2020-11-23 17:48:47'),
(5, 13, 100.00, 'Refund', 'Product Money Refund', 0, 0, NULL, '2020-11-24 15:36:18', '2020-11-24 15:36:18'),
(6, 13, 110.00, 'Refund', 'Product Money Refund', 0, 0, NULL, '2020-11-25 16:44:45', '2020-11-25 16:44:45'),
(7, 13, 220.00, 'Refund', 'Product Money Refund', 0, 0, NULL, '2020-11-26 00:05:01', '2020-11-26 00:05:01'),
(8, 13, 110.00, 'Refund', 'Product Money Refund', 0, 0, NULL, '2020-11-26 00:37:22', '2020-11-26 00:37:22'),
(9, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 11:31:13', '2020-11-29 11:31:13'),
(10, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 11:32:23', '2020-11-29 11:32:23'),
(11, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 11:41:44', '2020-11-29 11:41:44'),
(12, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:34:10', '2020-11-29 12:34:10'),
(13, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:34:11', '2020-11-29 12:34:11'),
(14, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:34:12', '2020-11-29 12:34:12'),
(15, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:34:16', '2020-11-29 12:34:16'),
(16, 13, 170.00, 'my_check', '1234', 0, 1, '164', '2020-11-29 12:46:35', '2020-11-29 12:46:35'),
(17, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:50:05', '2020-11-29 12:50:05'),
(18, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:50:13', '2020-11-29 12:50:13'),
(19, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:50:18', '2020-11-29 12:50:18'),
(20, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:50:22', '2020-11-29 12:50:22'),
(21, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:50:26', '2020-11-29 12:50:26'),
(22, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:50:30', '2020-11-29 12:50:30'),
(23, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 12:50:45', '2020-11-29 12:50:45'),
(24, 13, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 13:34:52', '2020-11-29 13:34:52'),
(25, 13, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 13:34:55', '2020-11-29 13:34:55'),
(26, 24, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 21:01:05', '2020-11-29 21:01:05'),
(27, 26, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 21:02:06', '2020-11-29 21:02:06'),
(28, 27, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 21:02:16', '2020-11-29 21:02:16'),
(29, 29, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 21:03:11', '2020-11-29 21:03:11'),
(30, 30, 30.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 21:05:10', '2020-11-29 21:05:10'),
(31, 31, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 21:07:24', '2020-11-29 21:07:24'),
(32, 32, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 21:11:14', '2020-11-29 21:11:14'),
(33, 24, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 22:19:44', '2020-11-29 22:19:44'),
(34, 24, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 22:22:13', '2020-11-29 22:22:13'),
(35, 24, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-11-29 22:23:48', '2020-11-29 22:23:48'),
(36, 13, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-07 10:04:03', '2020-12-07 10:04:03'),
(37, 12, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-07 18:11:31', '2020-12-07 18:11:31'),
(38, 12, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-07 18:31:48', '2020-12-07 18:31:48'),
(39, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-08 12:34:18', '2020-12-08 12:34:18'),
(40, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-08 13:57:28', '2020-12-08 13:57:28'),
(41, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-08 14:06:51', '2020-12-08 14:06:51'),
(42, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-08 14:07:53', '2020-12-08 14:07:53'),
(43, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-08 15:03:53', '2020-12-08 15:03:53'),
(44, 12, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-09 14:00:40', '2020-12-09 14:00:40'),
(45, 12, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-09 15:57:57', '2020-12-09 15:57:57'),
(46, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-09 18:51:16', '2020-12-09 18:51:16'),
(47, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-09 18:52:34', '2020-12-09 18:52:34'),
(48, 12, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-09 22:58:03', '2020-12-09 22:58:03'),
(49, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-09 22:58:13', '2020-12-09 22:58:13'),
(50, 35, 10.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-09 23:11:27', '2020-12-09 23:11:27'),
(51, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-10 12:46:05', '2020-12-10 12:46:05'),
(52, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-10 13:00:44', '2020-12-10 13:00:44'),
(53, 35, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-10 13:57:06', '2020-12-10 13:57:06'),
(54, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-10 18:26:06', '2020-12-10 18:26:06'),
(55, 35, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-10 22:40:30', '2020-12-10 22:40:30'),
(56, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-10 22:43:01', '2020-12-10 22:43:01'),
(57, 35, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-13 08:48:13', '2020-12-13 08:48:13'),
(58, 13, 20.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-13 18:27:53', '2020-12-13 18:27:53'),
(59, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-13 19:47:11', '2020-12-13 19:47:11'),
(60, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-13 19:47:54', '2020-12-13 19:47:54'),
(61, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-13 19:49:20', '2020-12-13 19:49:20'),
(62, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-13 19:49:57', '2020-12-13 19:49:57'),
(63, 13, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-13 19:50:17', '2020-12-13 19:50:17'),
(64, 37, 0.00, 'Club Point Convert', 'Club Point Convert', 0, 0, NULL, '2020-12-16 17:39:12', '2020-12-16 17:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(2, 'المخزن الاول تعديل', '0123456789', 'عمان', '2021-06-29 17:46:51', '2021-06-29 17:46:51');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 13, 70, '2020-11-18 19:48:50', '2020-11-18 19:48:50'),
(5, 56, 16, '2020-12-01 16:41:56', '2020-12-01 16:41:56'),
(23, 37, 50, '2020-12-16 17:36:40', '2020-12-16 17:36:40'),
(24, 37, 21, '2020-12-16 19:59:30', '2020-12-16 19:59:30'),
(25, 39, 60, '2021-03-26 04:00:55', '2021-03-26 04:00:55'),
(26, 39, 69, '2021-03-26 04:02:00', '2021-03-26 04:02:00'),
(27, 39, 68, '2021-03-26 04:04:04', '2021-03-26 04:04:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_withdraw_requests`
--
ALTER TABLE `affiliate_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_points`
--
ALTER TABLE `club_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_point_details`
--
ALTER TABLE `club_point_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_packages`
--
ALTER TABLE `customer_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_translations`
--
ALTER TABLE `customer_package_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_products`
--
ALTER TABLE `customer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_product_translations`
--
ALTER TABLE `customer_product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_translations`
--
ALTER TABLE `flash_deal_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_payment_methods`
--
ALTER TABLE `manual_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_points`
--
ALTER TABLE `pickup_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_point_translations`
--
ALTER TABLE `pickup_point_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reting`
--
ALTER TABLE `product_reting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_upsale`
--
ALTER TABLE `product_upsale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases_products`
--
ALTER TABLE `purchases_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_translations`
--
ALTER TABLE `role_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_packages`
--
ALTER TABLE `seller_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_package_payments`
--
ALTER TABLE `seller_package_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_package_translations`
--
ALTER TABLE `seller_package_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `sub_category_translations`
--
ALTER TABLE `sub_category_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sub_category_id` (`sub_category_id`);

--
-- Indexes for table `sub_sub_category_translations`
--
ALTER TABLE `sub_sub_category_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upsale_product`
--
ALTER TABLE `upsale_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `affiliate_withdraw_requests`
--
ALTER TABLE `affiliate_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brand_translations`
--
ALTER TABLE `brand_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `club_points`
--
ALTER TABLE `club_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `club_point_details`
--
ALTER TABLE `club_point_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `customer_packages`
--
ALTER TABLE `customer_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_package_translations`
--
ALTER TABLE `customer_package_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_products`
--
ALTER TABLE `customer_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_product_translations`
--
ALTER TABLE `customer_product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `flash_deal_translations`
--
ALTER TABLE `flash_deal_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manual_payment_methods`
--
ALTER TABLE `manual_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_points`
--
ALTER TABLE `pickup_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_point_translations`
--
ALTER TABLE `pickup_point_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `product_reting`
--
ALTER TABLE `product_reting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product_upsale`
--
ALTER TABLE `product_upsale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases_products`
--
ALTER TABLE `purchases_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_translations`
--
ALTER TABLE `role_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `seller_packages`
--
ALTER TABLE `seller_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seller_package_payments`
--
ALTER TABLE `seller_package_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_package_translations`
--
ALTER TABLE `seller_package_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sub_category_translations`
--
ALTER TABLE `sub_category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sub_sub_category_translations`
--
ALTER TABLE `sub_sub_category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3341;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `upsale_product`
--
ALTER TABLE `upsale_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
