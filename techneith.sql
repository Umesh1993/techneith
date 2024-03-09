-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2024 at 05:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techneith`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `description`, `date`, `location`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test1', 'test123 description', '2024-03-09', 'surat', '2024-03-08 22:59:45', '2024-03-08 22:59:45', NULL),
(2, 'test12', 'test123 description', '2024-03-09', 'surat', '2024-03-08 22:59:58', '2024-03-08 23:02:23', '2024-03-08 23:02:23'),
(3, 'test123', 'test123 description', '2024-03-09', 'vadodara', '2024-03-08 23:01:52', '2024-03-08 23:01:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_09_014009_create_event_table', 1),
(6, '2024_03_09_040916_create_weather_data_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'my-token', '9e0e5102181c68c4b24fb846d81be5627ee9d432e345563d0303b453c49de9e1', '[\"*\"]', '2024-03-08 23:05:00', NULL, '2024-03-08 22:49:21', '2024-03-08 23:05:00'),
(2, 'App\\Models\\User', 2, 'my-token', 'd01c83eff81f57c2439e3d6cfa0545018f23a425abeaa2a5089d93f59277e4c2', '[\"*\"]', '2024-03-08 23:06:55', NULL, '2024-03-08 22:59:25', '2024-03-08 23:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` enum('admin','buyer') NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$60L1bhNsnnehmPI5PQiwQeFmgfydbtI2umivyvMkIWdAdCJkibEoq', NULL, 'admin', '2024-03-08 22:48:52', '2024-03-08 22:48:52'),
(2, 'bunty', 'bunty@yopmail.com', NULL, '$2y$12$GLLw5z3T6NJ0zMGZYQRthuJYkVzgk/4an6TVHa.BPuPt9sXXHNbKO', NULL, 'buyer', '2024-03-08 22:59:25', '2024-03-08 22:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `weather_data`
--

CREATE TABLE `weather_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dt` bigint(20) NOT NULL,
  `dt_txt` datetime NOT NULL,
  `berlin_description` varchar(255) NOT NULL,
  `berlin_main` varchar(255) NOT NULL,
  `london_description` varchar(255) NOT NULL,
  `london_main` varchar(255) NOT NULL,
  `new_york_description` varchar(255) NOT NULL,
  `new_york_main` varchar(255) NOT NULL,
  `paris_description` varchar(255) NOT NULL,
  `paris_main` varchar(255) NOT NULL,
  `tokyo_description` varchar(255) NOT NULL,
  `tokyo_main` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weather_data`
--

INSERT INTO `weather_data` (`id`, `dt`, `dt_txt`, `berlin_description`, `berlin_main`, `london_description`, `london_main`, `new_york_description`, `new_york_main`, `paris_description`, `paris_main`, `tokyo_description`, `tokyo_main`, `created_at`, `updated_at`) VALUES
(1, 1709964000, '2024-03-09 06:00:00', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'few clouds', 'Clouds', NULL, NULL),
(2, 1709974800, '2024-03-09 09:00:00', 'clear sky', 'Clear', 'broken clouds', 'Clouds', 'overcast clouds', 'Clouds', 'scattered clouds', 'Clouds', 'scattered clouds', 'Clouds', NULL, NULL),
(3, 1709985600, '2024-03-09 12:00:00', 'clear sky', 'Clear', 'broken clouds', 'Clouds', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'scattered clouds', 'Clouds', NULL, NULL),
(4, 1709996400, '2024-03-09 15:00:00', 'light rain', 'Rain', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'clear sky', 'Clear', NULL, NULL),
(5, 1710007200, '2024-03-09 18:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'clear sky', 'Clear', NULL, NULL),
(6, 1710018000, '2024-03-09 21:00:00', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'light rain', 'Rain', 'light rain', 'Rain', 'clear sky', 'Clear', NULL, NULL),
(7, 1710028800, '2024-03-10 00:00:00', 'broken clouds', 'Clouds', 'light rain', 'Rain', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', NULL, NULL),
(8, 1710039600, '2024-03-10 03:00:00', 'broken clouds', 'Clouds', 'light rain', 'Rain', 'moderate rain', 'Rain', 'light rain', 'Rain', 'clear sky', 'Clear', NULL, NULL),
(9, 1710050400, '2024-03-10 06:00:00', 'broken clouds', 'Clouds', 'overcast clouds', 'Clouds', 'heavy intensity rain', 'Rain', 'light rain', 'Rain', 'clear sky', 'Clear', NULL, NULL),
(10, 1710061200, '2024-03-10 09:00:00', 'broken clouds', 'Clouds', 'light rain', 'Rain', 'moderate rain', 'Rain', 'light rain', 'Rain', 'scattered clouds', 'Clouds', NULL, NULL),
(11, 1710072000, '2024-03-10 12:00:00', 'broken clouds', 'Clouds', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'scattered clouds', 'Clouds', NULL, NULL),
(12, 1710082800, '2024-03-10 15:00:00', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'light rain', 'Rain', 'light rain', 'Rain', 'broken clouds', 'Clouds', NULL, NULL),
(13, 1710093600, '2024-03-10 18:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'broken clouds', 'Clouds', NULL, NULL),
(14, 1710104400, '2024-03-10 21:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'scattered clouds', 'Clouds', NULL, NULL),
(15, 1710115200, '2024-03-11 00:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'light snow', 'Snow', 'overcast clouds', 'Clouds', 'few clouds', 'Clouds', NULL, NULL),
(16, 1710126000, '2024-03-11 03:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'light snow', 'Snow', 'light rain', 'Rain', 'few clouds', 'Clouds', NULL, NULL),
(17, 1710136800, '2024-03-11 06:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'few clouds', 'Clouds', NULL, NULL),
(18, 1710147600, '2024-03-11 09:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'light rain', 'Rain', 'overcast clouds', 'Clouds', NULL, NULL),
(19, 1710158400, '2024-03-11 12:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', NULL, NULL),
(20, 1710169200, '2024-03-11 15:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', NULL, NULL),
(21, 1710180000, '2024-03-11 18:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'broken clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', NULL, NULL),
(22, 1710190800, '2024-03-11 21:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', NULL, NULL),
(23, 1710201600, '2024-03-12 00:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', NULL, NULL),
(24, 1710212400, '2024-03-12 03:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'light rain', 'Rain', NULL, NULL),
(25, 1710223200, '2024-03-12 06:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'light rain', 'Rain', NULL, NULL),
(26, 1710234000, '2024-03-12 09:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'moderate rain', 'Rain', NULL, NULL),
(27, 1710244800, '2024-03-12 12:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'heavy intensity rain', 'Rain', NULL, NULL),
(28, 1710255600, '2024-03-12 15:00:00', 'light rain', 'Rain', 'light rain', 'Rain', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'light rain', 'Rain', NULL, NULL),
(29, 1710266400, '2024-03-12 18:00:00', 'light rain', 'Rain', 'light rain', 'Rain', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'light rain', 'Rain', NULL, NULL),
(30, 1710277200, '2024-03-12 21:00:00', 'light rain', 'Rain', 'light rain', 'Rain', 'few clouds', 'Clouds', 'overcast clouds', 'Clouds', 'light rain', 'Rain', NULL, NULL),
(31, 1710288000, '2024-03-13 00:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'few clouds', 'Clouds', 'light rain', 'Rain', 'overcast clouds', 'Clouds', NULL, NULL),
(32, 1710298800, '2024-03-13 03:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'scattered clouds', 'Clouds', NULL, NULL),
(33, 1710309600, '2024-03-13 06:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'scattered clouds', 'Clouds', NULL, NULL),
(34, 1710320400, '2024-03-13 09:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', NULL, NULL),
(35, 1710331200, '2024-03-13 12:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', 'overcast clouds', 'Clouds', 'clear sky', 'Clear', NULL, NULL),
(36, 1710342000, '2024-03-13 15:00:00', 'light rain', 'Rain', 'overcast clouds', 'Clouds', 'few clouds', 'Clouds', 'broken clouds', 'Clouds', 'overcast clouds', 'Clouds', NULL, NULL),
(37, 1710352800, '2024-03-13 18:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'scattered clouds', 'Clouds', 'broken clouds', 'Clouds', 'overcast clouds', 'Clouds', NULL, NULL),
(38, 1710363600, '2024-03-13 21:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'broken clouds', 'Clouds', 'broken clouds', 'Clouds', NULL, NULL),
(39, 1710374400, '2024-03-14 00:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'broken clouds', 'Clouds', NULL, NULL),
(40, 1710385200, '2024-03-14 03:00:00', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', 'overcast clouds', 'Clouds', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weather_data`
--
ALTER TABLE `weather_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `weather_data`
--
ALTER TABLE `weather_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
