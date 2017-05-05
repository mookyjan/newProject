-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2017 at 06:42 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `parkingapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`name`, `password`, `email`, `phoneNumber`) VALUES
('abdul  basit', 'donkeyman', 'abbt@gmail.com', '03045896533'),
('Awesome Khan', 'awesome.khan@gmail.com', 'awesome.khan@gmail.com', '03459000749'),
('rafi ullah', 'romikhan', 'rafi@gmail.com', '03046929791');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_12_14_114347_create_parking_areas_table', 1),
(4, '2016_12_14_114831_create_parking_plots_table', 1),
(5, '2016_12_14_115020_create_parking_slots_table', 1),
(6, '2016_12_14_115249_create_customers_table', 1),
(7, '2016_12_14_164617_create_locations_table', 1),
(8, '2016_12_14_165332_create_feedback_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parking_areas`
--

CREATE TABLE IF NOT EXISTS `parking_areas` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `area_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parking_fee` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parking_areas`
--

INSERT INTO `parking_areas` (`id`, `name`, `area_address`, `image`, `parking_fee`, `longitude`, `latitude`, `description`, `email`) VALUES
(1, 'University Parking Lot Mardan', 'Abdul Wali Khan University Mardan KPK', 'image2.jpeg', 3, 72.44685712890623, 34.06618794346747, 'This parking spot is available upon request. Please submit your request for the date and time. Our team is on your side and will work hard to get you this parking spot', 'rafi@gmail.com'),
(2, 'Shopping Mall Parking Lot Mardan', 'Mardan Shopping Center Shamsi Road Mardan', 'image3.jpeg', 1, 72.48036542968748, 34.11844458311147, 'This parking spot is available upon request. Please submit your request for the date and time. Our team is on your side and will work hard to get you this parking spot', 'rafi@gmail.com'),
(3, 'Engineering University Parking ', 'Charsada road engineering uiniversity Mardan', 'imag4.jpeg', 2, 72.03998104171751, 34.19438524504278, 'This parking spot is available upon request. Please submit your request for the date and time. Our team is on your side and will work hard to get you this parking spot', 'abbt@gmail.com'),
(4, 'District Headquater Hospital Car Parking', 'District Headquarter Hospital Mardan ', 'image5.jpeg', 6, 72.08423534469603, 34.175099411674175, 'This parking spot is available upon request. Please submit your request for the date and time. Our team is on your side and will work hard to get you this parking spot', 'abbt@gmail.com'),
(5, 'Bank Road Parking', 'bank road bazar mardan', 'image1.jpg', 3, 72.09085718231199, 34.17720308948704, 'This parking spot is available upon request. Please submit your request for the date and time. Our team is on your side and will work hard to get you this parking spot', 'abbt@gmail.com'),
(8, 'Punjab Regiment Center Car parking', 'Punjab Regiment Center malakand road mardan', 'prc.jpg', 2, 72.21483961181639, 34.1622715170946, 'This parking spot is available upon request. Please submit your request for the date and time. Our team is on your side and will work hard to get you this parking spot', 'rafi@gmail.com'),
(10, 'ABC Clinik Parking Mardan', 'DR Ahmad Private Clinik', 'drParking.jpg', 1, 34.26272666156621, 72.41884199218748, 'This parking spot is available upon request. Please submit your request for the date and time. Our team is on your side and will work hard to get you this parking spot.', 'awesome.khan@gmail.com'),
(11, 'Nowshera Kalan Car Parking', 'Nowshera Kalan Car Parking', 'noshehra.jpeg', 2, 72.04508367614744, 33.98966581983511, 'This parking spot is available upon request. Please submit your request for the date and time. Our team is on your side and will work hard to get you this parking spot.', 'awesome.khan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `parking_plots`
--

CREATE TABLE IF NOT EXISTS `parking_plots` (
  `id` int(10) unsigned NOT NULL,
  `parkingarea_id` int(10) unsigned NOT NULL,
  `plot_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parking_plots`
--

INSERT INTO `parking_plots` (`id`, `parkingarea_id`, `plot_name`) VALUES
(2, 2, 'p1'),
(3, 3, 'p1'),
(4, 3, 'p2'),
(5, 1, 'p3'),
(6, 1, 'p1'),
(7, 1, 'p2'),
(8, 2, 'p2'),
(9, 8, 'p1');

-- --------------------------------------------------------

--
-- Table structure for table `parking_slots`
--

CREATE TABLE IF NOT EXISTS `parking_slots` (
  `parkingslot_id` int(10) unsigned NOT NULL,
  `parkingarea_id` int(10) unsigned NOT NULL,
  `parkingplot_id` int(10) unsigned NOT NULL,
  `parkingslot_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parking_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parking_slots`
--

INSERT INTO `parking_slots` (`parkingslot_id`, `parkingarea_id`, `parkingplot_id`, `parkingslot_name`, `parking_type`, `status`) VALUES
(1, 2, 2, 's1', 'four_wheel', 0),
(2, 3, 4, 's1', 'two_wheel', 0),
(3, 1, 6, 's1', 'four_wheel', 0),
(4, 1, 6, 's2', 'four_wheel', 0),
(5, 1, 7, 's1', 'four_wheel', 0),
(6, 1, 6, 's3', 'two_wheel', 0),
(7, 8, 9, 's1', 'four_wheel', 0),
(8, 8, 9, 's2', 'four_wheel', 0),
(9, 8, 9, 's3', 'four_wheel', 0),
(10, 8, 9, 's4', 'four_wheel', 0),
(11, 8, 9, 's5', 'four_wheel', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` int(11) NOT NULL,
  `parkingslot_id` int(10) unsigned NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `license_plate_no` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `email`, `password`, `phone_number`) VALUES
('abdul basit', 'a@gmail.com', 'abc', '2222'),
('Aleem Zada', 'aleem@shatai.com', 'shatai', '03449000864'),
('Rafi ullah', 'rafi@gmail.com', 'romikhan', '03046929791'),
('Romi khan', 'romikhan@gmail.com', 'romikhan', '03007865982');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_registration`
--

CREATE TABLE IF NOT EXISTS `vehicle_registration` (
  `make` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `license_plate_no` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_registration`
--

INSERT INTO `vehicle_registration` (`make`, `model`, `license_plate_no`, `description`, `email`, `image`) VALUES
('Honda', '2017', 'DBR109', 'white', 'rafi@gmail.com', 'image'),
('Yamaha', '2015', 'ICT265', 'white', 'aleem@shatai.com', 'image'),
('honda', '2016', 'ICT89', 'green', 'romikhan@gmail.com', 'image'),
('Honda', '2017', 'KRK195', 'White', 'a@gmail.com', 'image');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parking_areas`
--
ALTER TABLE `parking_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `parking_plots`
--
ALTER TABLE `parking_plots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parking_plots_parkingarea_id_foreign` (`parkingarea_id`),
  ADD KEY `parkingarea_id` (`parkingarea_id`),
  ADD KEY `parkingarea_id_2` (`parkingarea_id`);

--
-- Indexes for table `parking_slots`
--
ALTER TABLE `parking_slots`
  ADD PRIMARY KEY (`parkingslot_id`),
  ADD KEY `parking_slots_parkingarea_id_foreign` (`parkingarea_id`),
  ADD KEY `parking_slots_parkingplot_id_foreign` (`parkingplot_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `parkingslot_id` (`parkingslot_id`),
  ADD KEY `email` (`email`),
  ADD KEY `license_plate_no` (`license_plate_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicle_registration`
--
ALTER TABLE `vehicle_registration`
  ADD PRIMARY KEY (`license_plate_no`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `parking_areas`
--
ALTER TABLE `parking_areas`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `parking_plots`
--
ALTER TABLE `parking_plots`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `parking_slots`
--
ALTER TABLE `parking_slots`
  MODIFY `parkingslot_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `parking_areas`
--
ALTER TABLE `parking_areas`
  ADD CONSTRAINT `parking_areas_ibfk_1` FOREIGN KEY (`email`) REFERENCES `customers` (`email`);

--
-- Constraints for table `parking_plots`
--
ALTER TABLE `parking_plots`
  ADD CONSTRAINT `parking_plots_parkingarea_id_foreign` FOREIGN KEY (`parkingarea_id`) REFERENCES `parking_areas` (`id`);

--
-- Constraints for table `parking_slots`
--
ALTER TABLE `parking_slots`
  ADD CONSTRAINT `parking_slots_parkingarea_id_foreign` FOREIGN KEY (`parkingarea_id`) REFERENCES `parking_areas` (`id`),
  ADD CONSTRAINT `parking_slots_parkingplot_id_foreign` FOREIGN KEY (`parkingplot_id`) REFERENCES `parking_plots` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`parkingslot_id`) REFERENCES `parking_slots` (`parkingslot_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `vehicle_registration`
--
ALTER TABLE `vehicle_registration`
  ADD CONSTRAINT `vehicle_registration_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `delete_record` ON SCHEDULE EVERY '0:1' MINUTE_SECOND STARTS '2017-04-13 11:56:53' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM reservation WHERE end_time <= DATE_SUB(NOW(), INTERVAL 0 DAY)$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
