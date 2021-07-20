-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 20, 2021 at 12:21 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db_service_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`) VALUES
(1, 'Jakarta'),
(2, 'Bogor'),
(3, 'Depok'),
(4, 'Tangerang'),
(5, 'Bekasi');

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('customer','admin','mechanic') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `email`, `password`, `user_id`, `user_type`) VALUES
(1, 'jonathan@admin.com', '21232f297a57a5a743894a0e4a801fc3', 1, 'admin'),
(2, 'muhamadfrio@gmail.com', 'a5a2576f25e44aba47b6a3b2370cbae9', 2, 'customer'),
(3, 'berto@gmail.com', 'cb0b4891e61ccdd415a20252001fc265', 3, 'mechanic'),
(4, 'muhamadfrio+1@gmail.com', 'b4e43f8dbebf6f339dbb6948ddfcbddd', 4, 'customer'),
(5, 'muhamadfrio+2@gmail.com', 'b4e43f8dbebf6f339dbb6948ddfcbddd', 5, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`) VALUES
(1, 'Artha Graha'),
(2, 'BCA'),
(3, 'Mandiri');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `account_number` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_id`, `account_number`) VALUES
(1, 1, 50401056000076),
(2, 2, 5220304312),
(3, 3, 1560009861518);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `workshop_id` int(11) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `type` enum('booking','shopping') NOT NULL,
  `complaint` text,
  `date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `postal_code` int(5) NOT NULL,
  `other_cost` bigint(20) DEFAULT NULL,
  `other_cost_note` text,
  `booking_status` enum('waiting_confirmation','confirmed','booking','process','shipped','waiting_payment','checking_payment','completed','canceled') NOT NULL DEFAULT 'waiting_confirmation' COMMENT '**Untuk booking urutan statusnya** 1. waiting_confirmation 2. confirmed   3. booking 4. process 5. waiting_payment 6. checking_payment 7. completed  **Untuk shopping urutan statusnya** 1. waiting_confirmation 2. confirmed   3. waiting_payment 4. checking_payment 5. process 6. shipped 7. completed ',
  `bank_account_id` int(11) DEFAULT NULL,
  `awb_number` varchar(100) DEFAULT NULL,
  `payment_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `service_id`, `workshop_id`, `area_id`, `mechanic_id`, `type`, `complaint`, `date`, `address`, `phone`, `postal_code`, `other_cost`, `other_cost_note`, `booking_status`, `bank_account_id`, `awb_number`, `payment_url`, `created_at`) VALUES
(10016, 2, 2, NULL, 5, NULL, 'booking', 'Ganti oli', '2021-07-21 17:13:31', 'Perumahan Taman Alamanda Blok G11 No.29 Rt 002 RW 022 Tambun Utara', '0895-2903-7444', 17510, NULL, NULL, 'waiting_confirmation', 1, NULL, NULL, '2021-07-20 10:13:37'),
(10017, 2, 1, NULL, 5, NULL, 'shopping', NULL, '2021-07-20 17:18:23', 'Perumahan Taman Alamanda Blok G11 No.29 Rt 002 RW 022 Tambun Utara', '0895-2903-7444', 17510, NULL, NULL, 'waiting_confirmation', 1, NULL, NULL, '2021-07-20 10:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `booking_items`
--

CREATE TABLE `booking_items` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_items`
--

INSERT INTO `booking_items` (`id`, `booking_id`, `item_id`, `price`, `qty`) VALUES
(21, 10016, 5, 45000, 1),
(22, 10017, 1, 50000, 1),
(23, 10017, 11, 25900, 1),
(24, 10017, 2, 60000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Honda'),
(2, 'Yamaha'),
(3, 'Suzuki'),
(4, 'Kawasaki');

-- --------------------------------------------------------

--
-- Table structure for table `brand_types`
--

CREATE TABLE `brand_types` (
  `id` int(11) NOT NULL,
  `transportation_type_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand_types`
--

INSERT INTO `brand_types` (`id`, `transportation_type_id`, `brand_id`, `name`) VALUES
(1, 1, 1, 'Beat'),
(2, 1, 2, 'Mio');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('booking','shopping') NOT NULL DEFAULT 'shopping',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `type`, `status`) VALUES
(17, 2, 'booking', 0),
(18, 1, 'shopping', 1),
(19, 2, 'shopping', 0),
(20, 2, 'booking', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `item_id`, `qty`) VALUES
(84, 17, 5, 1),
(85, 18, 4, 1),
(86, 18, 3, 1),
(87, 19, 1, 1),
(88, 19, 11, 1),
(89, 19, 2, 1),
(90, 20, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `brand_type_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` bigint(20) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `brand_type_id`, `name`, `price`, `image_url`, `qty`) VALUES
(1, 1, 'Kampas rem depan', 50000, '', 98),
(2, 1, 'Kampas rem belakang', 60000, '', 98),
(3, 2, 'Kampas rem depan', 40000, '', 99),
(4, 2, 'Kampas rem belakang', 50000, '', 99),
(5, NULL, 'Pertamina Enduro Matic, 10W-30, API SL, JASO MB 0.8L 1pc', 45000, 'assets/images/item_5.png', 95),
(6, 1, 'Filter udara', 85000, '', 100),
(7, 1, 'Lampu depan', 25900, '', 100),
(8, 1, 'Kampas rem belakang', 60000, '', 100),
(9, 1, 'Lampu belakang', 26000, '', 100),
(10, 1, 'Lampu sein', 15000, '', 98),
(11, NULL, 'Minyak rem', 25900, '', 96),
(12, 1, 'Handle rem', 110000, '', 100);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `url` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `image_url`, `url`) VALUES
(1, 'Belanja Spare Part', 'Belanja kebutuhan kendaraan kamu dari rumah, biar kami kirim secepatnya', 'assets/images/shopping-cart.png', 'shopping'),
(2, 'Booking Teknisi Rumah', 'Tetap dirumah aja, biar teknisi kami yang datang ke lokasimu', 'assets/images/maintenance.png', 'bookingservice');

-- --------------------------------------------------------

--
-- Table structure for table `transportation_types`
--

CREATE TABLE `transportation_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transportation_types`
--

INSERT INTO `transportation_types` (`id`, `name`, `status`) VALUES
(1, 'Motor', 1),
(2, 'Mobil', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postal_code` int(5) DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `address`, `postal_code`, `dob`) VALUES
(1, 'Admin', '082125207042', 'Bekasi Utara', NULL, '1111-01-01'),
(2, 'M Fadhilah Rio Bagus Saputro', '0895-2903-7444', 'Perumahan Taman Alamanda Blok G11 No.29 Rt 002 RW 022 Tambun Utara', 17510, '1998-05-08'),
(3, 'Berto', '082111111111', 'Harapan Jaya Bekasi Utara', 17510, '1997-07-01'),
(4, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL),
(6, 'M Fadhilah Rio Bagus Saputroo', '0895-2903-7444', 'Perumahan Taman Alamanda Blok G11 No.29 Rt 002 RW 022 Tambun Utara', 17510, '1998-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `workshops`
--

CREATE TABLE `workshops` (
  `id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workshops`
--

INSERT INTO `workshops` (`id`, `area_id`, `name`, `phone`, `address`, `postal_code`) VALUES
(1, 1, 'Cabang Bekasi', '0821-2520-7042', 'Harapan Jaya, Bekasi Utara', 17124);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_items`
--
ALTER TABLE `booking_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_types`
--
ALTER TABLE `brand_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transportation_types`
--
ALTER TABLE `transportation_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workshops`
--
ALTER TABLE `workshops`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10018;

--
-- AUTO_INCREMENT for table `booking_items`
--
ALTER TABLE `booking_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brand_types`
--
ALTER TABLE `brand_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transportation_types`
--
ALTER TABLE `transportation_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `workshops`
--
ALTER TABLE `workshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
