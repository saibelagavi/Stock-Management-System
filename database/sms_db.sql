-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 09:56 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `back_order_list`
--

CREATE TABLE `back_order_list` (
  `id` int(30) NOT NULL,
  `receiving_id` int(30) NOT NULL,
  `po_id` int(30) NOT NULL,
  `bo_code` varchar(50) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `back_order_list`
--

INSERT INTO `back_order_list` (`id`, `receiving_id`, `po_id`, `bo_code`, `supplier_id`, `amount`, `discount_perc`, `discount`, `tax_perc`, `tax`, `remarks`, `status`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 'BO-0001', 1, 40740, 3, 1125, 12, 4365, NULL, 1, '2021-11-03 11:20:38', '2021-11-03 11:20:51'),
(2, 2, 1, 'BO-0002', 1, 20370, 3, 562.5, 12, 2182.5, NULL, 2, '2021-11-03 11:20:51', '2021-11-03 11:21:00'),
(3, 4, 2, 'BO-0003', 2, 42826, 5, 2012.5, 12, 4588.5, NULL, 1, '2021-11-03 11:51:41', '2021-11-03 11:52:02'),
(4, 5, 2, 'BO-0004', 2, 10640, 5, 500, 12, 1140, NULL, 2, '2021-11-03 11:52:02', '2021-11-03 11:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `bo_items`
--

CREATE TABLE `bo_items` (
  `bo_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bo_items`
--

INSERT INTO `bo_items` (`bo_id`, `item_id`, `quantity`, `price`, `unit`, `total`) VALUES
(1, 1, 250, 150, 'pcs', 37500),
(2, 1, 125, 150, 'pcs', 18750),
(3, 2, 150, 200, 'Boxes', 30000),
(3, 4, 50, 205, 'pcs', 10250),
(4, 2, 50, 200, 'Boxes', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `item_list`
--

CREATE TABLE `item_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_list`
--

INSERT INTO `item_list` (`id`, `name`, `description`, `supplier_id`, `cost`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Item 101', 'Sample Only', 1, 150, 1, '2021-11-02 10:01:55', '2021-11-02 10:01:55'),
(2, 'Item 102', 'Sample only', 2, 200, 1, '2021-11-02 10:02:12', '2021-11-02 10:02:12'),
(3, 'Item 103', 'Sample', 1, 185, 1, '2021-11-02 10:02:27', '2021-11-02 10:02:27'),
(4, 'Item 104', 'Sample only', 2, 205, 1, '2021-11-02 10:02:47', '2021-11-02 10:02:47'),
(6, 'adidas shoes', 'best shoes', 4, 1000, 1, '2023-05-30 11:22:50', '2023-05-30 11:31:10'),
(7, 'lanatic shoes', '', 6, 500, 1, '2023-05-30 11:24:06', '2023-05-30 11:31:23'),
(8, 'puma shoes', '', 5, 1500, 1, '2023-05-30 11:24:49', '2023-05-30 11:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `po_items`
--

CREATE TABLE `po_items` (
  `po_id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL,
  `total` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `po_items`
--

INSERT INTO `po_items` (`po_id`, `item_id`, `quantity`, `price`, `unit`, `total`) VALUES
(1, 1, 500, 150, 'pcs', 75000),
(2, 2, 2, 200, '2', 400),
(3, 2, 10, 200, '10', 2000),
(4, 6, 10, 1000, '10', 10000),
(5, 7, 10, 500, '10', 5000),
(6, 8, 20, 1500, '20', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_list`
--

CREATE TABLE `purchase_order_list` (
  `id` int(30) NOT NULL,
  `po_code` varchar(50) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `remarks` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = partially received, 2 =received',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order_list`
--

INSERT INTO `purchase_order_list` (`id`, `po_code`, `supplier_id`, `amount`, `discount_perc`, `discount`, `tax_perc`, `tax`, `remarks`, `status`, `date_created`, `date_updated`) VALUES
(1, 'PO-0001', 1, 81480, 3, 2250, 21, 8730, 'Sample', 2, '2021-11-03 11:20:22', '2023-05-30 00:57:59'),
(2, 'PO-0002', 2, 405.92, 14, 56, 18, 61.92, 'bangalore', 2, '2021-11-03 11:50:50', '2023-05-30 01:37:27'),
(3, 'PO-0003', 2, 2208, 4, 80, 15, 288, '', 2, '2023-05-30 11:02:06', '2023-05-30 11:02:56'),
(4, 'PO-0004', 4, 11200, 0, 0, 12, 1200, '', 2, '2023-05-30 11:26:45', '2023-05-30 11:27:07'),
(5, 'PO-0005', 6, 5600, 0, 0, 12, 600, '', 2, '2023-05-30 11:28:04', '2023-05-30 11:28:20'),
(6, 'PO-0006', 5, 33600, 0, 0, 12, 3600, 'banglore', 2, '2023-05-30 11:29:44', '2023-05-30 14:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `receiving_list`
--

CREATE TABLE `receiving_list` (
  `id` int(30) NOT NULL,
  `form_id` int(30) NOT NULL,
  `from_order` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=PO ,2 = BO',
  `amount` float NOT NULL DEFAULT 0,
  `discount_perc` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `tax_perc` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `stock_ids` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receiving_list`
--

INSERT INTO `receiving_list` (`id`, `form_id`, `from_order`, `amount`, `discount_perc`, `discount`, `tax_perc`, `tax`, `stock_ids`, `remarks`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 40740, 3, 1125, 12, 4365, '1', 'Sample', '2021-11-03 11:20:38', '2021-11-03 11:20:38'),
(2, 1, 2, 20370, 3, 562.5, 12, 2182.5, '2', '', '2021-11-03 11:20:51', '2021-11-03 11:20:51'),
(3, 2, 2, 20370, 3, 562.5, 12, 2182.5, '3', 'Success', '2021-11-03 11:21:00', '2021-11-03 11:21:00'),
(4, 2, 1, 64638, 5, 3037.5, 12, 6925.5, '4,5', 'Sample Receiving (Partial)', '2021-11-03 11:51:41', '2021-11-03 11:51:41'),
(5, 3, 2, 32186, 5, 1512.5, 12, 3448.5, '6,7', 'BO Receive (Partial)', '2021-11-03 11:52:02', '2021-11-03 11:52:02'),
(6, 4, 2, 10640, 5, 500, 12, 1140, '8', 'Sample Success', '2021-11-03 11:52:15', '2021-11-03 11:52:15'),
(7, 3, 1, 2208, 4, 80, 15, 288, '34', '', '2023-05-30 11:02:56', '2023-05-30 11:02:56'),
(8, 4, 1, 11200, 0, 0, 12, 1200, '39', '', '2023-05-30 11:27:07', '2023-05-30 11:27:07'),
(9, 5, 1, 5600, 0, 0, 12, 600, '40', '', '2023-05-30 11:28:20', '2023-05-30 11:28:20'),
(10, 6, 1, 33600, 0, 0, 12, 3600, '47', '', '2023-05-30 14:52:45', '2023-05-30 14:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `return_list`
--

CREATE TABLE `return_list` (
  `id` int(30) NOT NULL,
  `return_code` varchar(50) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `stock_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `return_list`
--

INSERT INTO `return_list` (`id`, `return_code`, `supplier_id`, `amount`, `remarks`, `stock_ids`, `date_created`, `date_updated`) VALUES
(1, 'R-0001', 2, 3025, 'Sample Issue', '16,17', '2021-11-03 13:45:53', '2021-11-03 13:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `sales_list`
--

CREATE TABLE `sales_list` (
  `id` int(30) NOT NULL,
  `sales_code` varchar(50) NOT NULL,
  `client` text DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `stock_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `discount_perc` float NOT NULL,
  `discount` float NOT NULL,
  `tax_perc` float NOT NULL,
  `tax` float NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_list`
--

INSERT INTO `sales_list` (`id`, `sales_code`, `client`, `amount`, `remarks`, `stock_ids`, `date_created`, `date_updated`, `discount_perc`, `discount`, `tax_perc`, `tax`, `address`) VALUES
(1, 'SALE-0001', 'John Smith', 8540, 'thankyou', '53,54,55', '2021-11-03 14:03:30', '2023-06-03 14:07:42', 0, 0, 12, 915, ''),
(2, 'SALE-0002', 'Guest', 354, '', '48', '2023-05-30 01:54:09', '2023-05-30 14:55:03', 0, 0, 18, 54, ''),
(3, 'SALE-0003', 'Guest', 896, '', '62', '2023-05-30 02:30:39', '2023-06-04 13:13:35', 0, 0, 12, 96, 'bgm'),
(4, 'SALE-0004', 'anish', 400, '', '42', '2023-05-30 11:04:17', '2023-05-30 11:34:05', 0, 0, 12, 0, ''),
(6, 'SALE-0005', 'tejas', 3540, '', '41', '2023-05-30 11:33:08', '2023-05-30 11:33:08', 0, 0, 18, 540, ''),
(7, 'SALE-0006', 'avi', 6720, '', '43', '2023-05-30 11:35:44', '2023-05-30 11:35:45', 0, 0, 12, 720, ''),
(9, 'SALE-0007', 'sai', 3360, 'thankyou', '61', '2023-06-03 19:46:06', '2023-06-04 00:09:39', 0, 0, 12, 360, 'bgm');

-- --------------------------------------------------------

--
-- Table structure for table `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `unit` varchar(250) DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `total` float NOT NULL DEFAULT current_timestamp(),
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=IN , 2=OUT',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_list`
--

INSERT INTO `stock_list` (`id`, `item_id`, `quantity`, `unit`, `price`, `total`, `type`, `date_created`) VALUES
(1, 1, 250, 'pcs', 150, 37500, 1, '2021-11-03 11:20:38'),
(2, 1, 125, 'pcs', 150, 18750, 1, '2021-11-03 11:20:51'),
(3, 1, 125, 'pcs', 150, 18750, 1, '2021-11-03 11:21:00'),
(4, 2, 150, 'Boxes', 200, 30000, 1, '2021-11-03 11:51:41'),
(5, 4, 150, 'pcs', 205, 30750, 1, '2021-11-03 11:51:41'),
(6, 2, 100, 'Boxes', 200, 20000, 1, '2021-11-03 11:52:02'),
(7, 4, 50, 'pcs', 205, 10250, 1, '2021-11-03 11:52:02'),
(8, 2, 50, 'Boxes', 200, 10000, 1, '2021-11-03 11:52:15'),
(16, 2, 10, 'pcs', 200, 2000, 2, '2021-11-03 13:45:53'),
(17, 4, 5, 'boxes', 205, 1025, 2, '2021-11-03 13:45:53'),
(34, 2, 10, '10', 200, 2000, 1, '2023-05-30 11:02:56'),
(39, 6, 10, '10', 1000, 10000, 1, '2023-05-30 11:27:07'),
(40, 7, 10, '10', 500, 5000, 1, '2023-05-30 11:28:20'),
(41, 6, 3, '2', 1000, 3000, 2, '2023-05-30 11:33:08'),
(42, 2, 2, '2', 200, 400, 2, '2023-05-30 11:34:05'),
(43, 8, 4, '4', 1500, 6000, 2, '2023-05-30 11:35:45'),
(47, 8, 20, '20', 1500, 30000, 1, '2023-05-30 14:52:45'),
(48, 1, 2, '2', 150, 300, 2, '2023-05-30 14:55:03'),
(53, 1, 10, 'pcs', 150, 1500, 2, '2023-06-03 14:07:42'),
(54, 2, 5, 'pcs', 200, 1000, 2, '2023-06-03 14:07:42'),
(55, 4, 25, 'boxes', 205, 5125, 2, '2023-06-03 14:07:42'),
(61, 8, 2, '2', 1500, 3000, 2, '2023-06-04 00:09:39'),
(62, 2, 4, '2', 200, 800, 2, '2023-06-04 13:13:35');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_list`
--

CREATE TABLE `supplier_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `cperson` text NOT NULL,
  `contact` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_list`
--

INSERT INTO `supplier_list` (`id`, `name`, `address`, `cperson`, `contact`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Supplier 101', 'Sample Supplier Address 101', 'Supplier Staff 101', '09123456789', 1, '2021-11-02 09:36:19', '2021-11-02 09:36:19'),
(2, 'Supplier 102', 'Sample Address 102', 'Supplier Staff 102', '0987654332', 1, '2021-11-02 09:36:54', '2021-11-02 09:36:54'),
(4, 'ADIDAS', 'BANGLORE', '', '', 1, '2023-05-30 11:21:08', '2023-05-30 11:21:08'),
(5, 'PUMA', '', '', '', 1, '2023-05-30 11:21:55', '2023-05-30 11:21:55'),
(6, 'LANATIC', '', '', '', 1, '2023-05-30 11:22:35', '2023-05-30 11:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Excellent sports academy'),
(6, 'short_name', 'ESA'),
(11, 'logo', 'uploads/logo-1635816671.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1635816671.png'),
(15, 'content', 'Array');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, '2021-01-20 14:02:37', '2021-10-30 09:20:26'),
(10, 'John', NULL, 'Smith', 'jsmith', '39ce7e2a8573b41ce73b5ba41617f8f7', 'uploads/avatar-10.png?v=1635920488', NULL, 2, '2021-11-03 14:21:28', '2021-11-03 14:21:28'),
(11, 'Claire', NULL, 'Blake', 'cblake', 'cd74fae0a3adf459f73bbf187607ccea', 'uploads/avatar-11.png?v=1635920566', NULL, 1, '2021-11-03 14:22:46', '2021-11-03 14:22:46'),
(12, 'sainath', NULL, 'belagavi', 'sai', '585a32b10bf63cc329536ed8dbcb006a', NULL, NULL, 1, '2023-06-03 13:48:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `user_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `back_order_list`
--
ALTER TABLE `back_order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `po_id` (`po_id`),
  ADD KEY `receiving_id` (`receiving_id`);

--
-- Indexes for table `bo_items`
--
ALTER TABLE `bo_items`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `bo_id` (`bo_id`);

--
-- Indexes for table `item_list`
--
ALTER TABLE `item_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `po_items`
--
ALTER TABLE `po_items`
  ADD KEY `po_id` (`po_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `purchase_order_list`
--
ALTER TABLE `purchase_order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `receiving_list`
--
ALTER TABLE `receiving_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_list`
--
ALTER TABLE `return_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `sales_list`
--
ALTER TABLE `sales_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `supplier_list`
--
ALTER TABLE `supplier_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `back_order_list`
--
ALTER TABLE `back_order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item_list`
--
ALTER TABLE `item_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_order_list`
--
ALTER TABLE `purchase_order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `receiving_list`
--
ALTER TABLE `receiving_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `return_list`
--
ALTER TABLE `return_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_list`
--
ALTER TABLE `sales_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `supplier_list`
--
ALTER TABLE `supplier_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `back_order_list`
--
ALTER TABLE `back_order_list`
  ADD CONSTRAINT `back_order_list_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `back_order_list_ibfk_2` FOREIGN KEY (`po_id`) REFERENCES `purchase_order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `back_order_list_ibfk_3` FOREIGN KEY (`receiving_id`) REFERENCES `receiving_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bo_items`
--
ALTER TABLE `bo_items`
  ADD CONSTRAINT `bo_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bo_items_ibfk_2` FOREIGN KEY (`bo_id`) REFERENCES `back_order_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_list`
--
ALTER TABLE `item_list`
  ADD CONSTRAINT `item_list_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `po_items`
--
ALTER TABLE `po_items`
  ADD CONSTRAINT `po_items_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `purchase_order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `po_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order_list`
--
ALTER TABLE `purchase_order_list`
  ADD CONSTRAINT `purchase_order_list_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `return_list`
--
ALTER TABLE `return_list`
  ADD CONSTRAINT `return_list_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `stock_list_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
