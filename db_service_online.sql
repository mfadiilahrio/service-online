-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 15, 2021 at 05:01 AM
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
(1, 'BCA'),
(2, 'Mandiri');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `account_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_id`, `account_number`) VALUES
(1, 1, 11111111),
(2, 2, 2222222);

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
  `complaint` text NOT NULL,
  `date` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `other_cost` bigint(20) DEFAULT NULL,
  `other_cost_note` text,
  `booking_status` enum('waiting_confirmation','confirmed','booking','process','shipped','waiting_payment','checking_payment','completed','canceled') NOT NULL DEFAULT 'waiting_confirmation',
  `bank_account_id` int(11) DEFAULT NULL,
  `payment_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `service_id`, `workshop_id`, `area_id`, `mechanic_id`, `complaint`, `date`, `address`, `other_cost`, `other_cost_note`, `booking_status`, `bank_account_id`, `payment_url`, `created_at`) VALUES
(10001, 2, 1, 1, 1, NULL, 'Kampas rem abis', '2021-07-10 08:00:00', 'Taman alamanda blok G.11 No.29 RT/RW 002/RW022 Ds. Karang Satria Kec. Tambun Utara Kab. Bekasi 17510', 50000, 'Biaya pasang', 'waiting_confirmation', NULL, NULL, '2021-07-10 10:03:32'),
(10002, 2, 1, 1, 1, NULL, 'Ganti oli', '2021-07-10 14:00:00', 'Taman alamanda blok G.11 No.29 RT/RW 002/RW022 Ds. Karang Satria Kec. Tambun Utara Kab. Bekasi 17510', 50000, 'Biaya pasang', 'waiting_confirmation', NULL, NULL, '2021-07-15 02:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `bookings_items`
--

CREATE TABLE `bookings_items` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookings_items`
--

INSERT INTO `bookings_items` (`id`, `booking_id`, `item_id`, `price`, `qty`) VALUES
(1, 10001, 1, 40000, 1),
(2, 10001, 2, 50000, 1),
(3, 10002, 5, 42900, 1);

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
(1, 1, 1, 'Honda'),
(2, 1, 2, 'Mio');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`) VALUES
(1, 2);

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
(1, 1, 1, 2),
(2, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `brand_type_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `brand_type_id`, `name`, `price`, `qty`) VALUES
(1, 1, 'Kampas rem depan', 50000, 100),
(2, 1, 'Kampas rem belakang', 60000, 100),
(3, 2, 'Kampas rem depan', 40000, 100),
(4, 2, 'Kampas rem belakang', 50000, 100),
(5, NULL, 'Pertamina Enduro Matic, 10W-30, API SL, JASO MB 0.8L 1pc', 42900, 50);

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
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `address`, `dob`) VALUES
(1, 'Admin', '082125207042', 'Bekasi Utara', '1111-01-01'),
(2, 'M Fadhilah Rio Bagus Saputro', '089529037444', 'Taman alamanda blok G.11 No.29 RT/RW 002/RW022 Ds. Karang Satria Kec. Tambun Utara Kab. Bekasi 17510', '1998-05-08'),
(3, 'Berto', '082111111111', 'Bekasi', '1997-07-01'),
(4, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workshops`
--

CREATE TABLE `workshops` (
  `id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `bookings_items`
--
ALTER TABLE `bookings_items`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10003;

--
-- AUTO_INCREMENT for table `bookings_items`
--
ALTER TABLE `bookings_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
