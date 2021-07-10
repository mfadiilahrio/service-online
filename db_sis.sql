-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 09, 2021 at 03:42 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db_sis`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` text NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `religion` enum('islam','protestant','catholic','hindu','buddha','kong hu cu') DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `nik`, `name`, `dob`, `address`, `gender`, `religion`, `phone`, `image`, `status`) VALUES
(2000, '1234567891011', 'Zuhfi Ahmad', '1998-05-08', 'Bekasi Kota', 'male', 'islam', '0871-2311-2311', NULL, 1),
(2001, '09887687618723', 'M Fadhilah Rio Bagus Saputro', '1998-05-08', 'Taman Alamanda Blok G11 No.29', 'male', 'islam', '0895-2903-7444', NULL, 1),
(2002, '123876128768', 'M Zakiyaman', '1998-05-08', 'Tambun Selatan', 'male', 'islam', '9879-1871-9987', NULL, 1),
(2003, '19873897987987', 'eko', '1998-05-08', 'Kampung durian', 'male', 'hindu', '0219-8789-7211', NULL, 1),
(2004, '2154365476576', 'Zul', '1998-05-08', 'Bekasi', 'male', 'islam', '0821-5436-4656', NULL, 1),
(10000, '8838382722', 'Zulfiqri', '1997-04-01', 'ujunhg harapan', 'male', 'islam', '0819-9999-9999', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `status`) VALUES
(1, 'Kerupuk Putih 1 Pack', 10000, 1),
(2, 'Kerupuk Gendar 1 pack', 20000, 1),
(3, 'kerupuk kulit sayur', 20000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `deposit` int(11) NOT NULL DEFAULT '0',
  `deposit_date` date DEFAULT NULL,
  `request_status` enum('pending','accepted','rejected','deposited') NOT NULL DEFAULT 'pending',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `employee_id`, `product_id`, `total`, `date`, `deposit`, `deposit_date`, `request_status`, `status`) VALUES
(17, 2003, 1, 100, '2021-06-07 21:17:07', 1000000, '2021-06-08', 'deposited', 1),
(18, 2003, 2, 500, '2021-06-08 22:52:26', 0, NULL, 'accepted', 1),
(19, 2004, 3, 600, '2021-06-09 20:20:09', 0, NULL, 'rejected', 1),
(20, 2004, 3, 100, '2021-06-09 20:23:09', 100000000, '2021-06-09', 'deposited', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `google_map_url` text,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `address`, `google_map_url`, `status`) VALUES
(1, 'Warung madura alamanda', 'Jl. Taman Alamanda Raya No.1, Karangsatria, Kec. Tambun Utara, Bekasi, Jawa Barat 17510', 'https://www.google.com/search?client=firefox-b-d&q=warung%20madura%20taman%20alamanda&safe=strict&tbs=lf:1,lf_ui:2&tbm=lcl&sxsrf=ALeKk03IJZj4FyyFsrJOJzPc1E7WqxUxdw:1622883373309&rflfq=1&num=10&rldimm=11445171542564581013&lqi=Chx3YXJ1bmcgbWFkdXJhIHRhbWFuIGFsYW1hbmRhSMCAts6Gq4CACFo3Cg13YXJ1bmcgbWFkdXJhEAAQARgBGAIYAyIcd2FydW5nIG1hZHVyYSB0YW1hbiBhbGFtYW5kYZIBEHNhdGF5X3Jlc3RhdXJhbnSaASRDaGREU1VoTk1HOW5TMFZKUTBGblNVUXdNSEkyVFhsUlJSQUKqARUQASoRIg13YXJ1bmcgbWFkdXJhKCY&ved=2ahUKEwjE6-jXj4DxAhUg_XMBHd0qCaQQvS4wAHoECBAQMw&rlst=f#rlfi=hd:;si:11445171542564581013,l,Chx3YXJ1bmcgbWFkdXJhIHRhbWFuIGFsYW1hbmRhSMCAts6Gq4CACFo3Cg13YXJ1bmcgbWFkdXJhEAAQARgBGAIYAyIcd2FydW5nIG1hZHVyYSB0YW1hbiBhbGFtYW5kYZIBEHNhdGF5X3Jlc3RhdXJhbnSaASRDaGREU1VoTk1HOW5TMFZKUTBGblNVUXdNSEkyVFhsUlJSQUKqARUQASoRIg13YXJ1bmcgbWFkdXJhKCY;mv:[[-6.1841222,107.0775718],[-6.2508588,107.02298669999999]];tbs:lrf:!1m4!1u3!2m2!3m1!1e1!1m4!1u2!2m2!2m1!1e1!1m4!1u16!2m2!16m1!1e1!1m4!1u16!2m2!16m1!1e2!2m1!1e2!2m1!1e16!2m1!1e3!3sIAE,lf:1,lf_ui:2', 1),
(2, 'Toko Zamil', 'Karangsatria, Kec. Tambun Utara, Bekasi, Jawa Barat 17510', 'https://www.google.com/maps/place/Toko+Zamil/@-6.2186361,107.0438647,18.38z/data=!4m12!1m6!3m5!1s0x2e698ed0639a5277:0x76ecfcdd9525369c!2sTaman+alamanda+Blok+B!8m2!3d-6.2193601!4d107.0444851!3m4!1s0x2e698f96a995dcd5:0xe7e1dd2accfc0327!8m2!3d-6.2177045!4d107.0447834', 1),
(3, 'Warung ENO', 'Jl. Taman Alamanda Raya No.29, Karangsatria, Kec. Tambun Utara, Bekasi, Jawa Barat 17510', 'https://www.google.com/maps/place/Warung+ENO/@-6.2202592,107.0424241,17.54z/data=!4m13!1m7!3m6!1s0x2e698ec4cae9dfcf:0x241c584128188d15!2sJl.+Taman+Alamanda+Raya,+Karangsatria,+Kec.+Tambun+Utara,+Bekasi,+Jawa+Barat+17510!3b1!8m2!3d-6.2196895!4d107.0442317!3m4!1s0x2e698ed05959262b:0x30f42e2a71bd2cc1!8m2!3d-6.2186079!4d107.0446968', 1),
(4, 'dadang', 'kerawang', 'https://www.google.com/maps/place/Dariza+Sport+Club/@-6.189365,107.0077018,17z/data=!4m13!1m7!3m6!1s0x2e6989674621932b:0x10189427ea23fbf4!2sJl.+Ujung+Harapan,+Jawa+Barat!3b1!8m2!3d-6.1893703!4d107.0098905!3m4!1s0x2e69896067a60db1:0x83445e74f2edadd2!8m2!3d-6.1900713!4d107.0090052', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` enum('in','out') NOT NULL DEFAULT 'in',
  `source` enum('production','unsold') NOT NULL DEFAULT 'production',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`id`, `product_id`, `total`, `date`, `type`, `source`, `status`) VALUES
(15, 1, 10000, '2021-06-08 09:19:39', 'in', 'production', 1),
(16, 1, 100, '2021-06-08 21:19:55', 'out', 'production', 1),
(17, 2, 1000, '2021-06-08 10:53:06', 'in', 'production', 1),
(18, 2, 500, '2021-06-08 22:53:13', 'out', 'production', 1),
(19, 3, 500, '2021-06-09 08:18:57', 'in', 'production', 1),
(20, 3, 100, '2021-06-09 20:23:31', 'out', 'production', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `total_product` int(11) NOT NULL,
  `type` enum('give','take') NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `request_id`, `store_id`, `total_product`, `type`, `date`, `status`) VALUES
(7, 17, 2, 30, 'give', '2021-06-07 21:20:32', 1),
(8, 17, 1, 50, 'give', '2021-06-07 22:20:32', 1),
(9, 17, 1, 20, 'give', '2021-06-07 22:20:32', 1),
(10, 17, 3, 20, 'give', '2021-06-07 22:20:32', 1),
(11, 17, 1, 70, 'take', '2021-06-08 22:46:57', 1),
(12, 17, 2, 30, 'take', '2021-06-08 22:47:36', 1),
(13, 17, 3, 20, 'take', '2021-06-08 22:48:32', 1),
(14, 18, 1, 50, 'give', '2021-06-08 22:54:03', 1),
(15, 18, 1, 50, 'take', '2021-06-08 23:05:00', 1),
(16, 20, 4, 50, 'give', '2021-06-09 20:26:41', 1),
(17, 20, 3, 50, 'give', '2021-06-09 20:27:28', 1),
(18, 20, 4, 5, 'take', '2021-06-09 20:28:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `employee_id` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('super admin','admin','sales') NOT NULL DEFAULT 'sales',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `username`, `password`, `user_type`, `status`) VALUES
(1, 2000, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'super admin', 1),
(2, 2001, 'mfad2001', '3183e55b41d0e5494aabd99c3bde1e0c', 'admin', 1),
(3, 2002, 'mzak2002', '3183e55b41d0e5494aabd99c3bde1e0c', 'sales', 1),
(4, 2003, 'eko2003', '3183e55b41d0e5494aabd99c3bde1e0c', 'sales', 1),
(5, 2004, 'zul2004', '3183e55b41d0e5494aabd99c3bde1e0c', 'sales', 1),
(6, 10000, 'zulfi10000', '7b9fd8ad93597b72f9c61d8a982008e4', 'admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplies`
--
ALTER TABLE `supplies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
