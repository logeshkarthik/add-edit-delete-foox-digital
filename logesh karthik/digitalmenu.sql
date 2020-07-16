-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2020 at 05:19 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitalmenu`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `email`, `password`, `date`) VALUES
(1, 'Gopi', 'admin', 'gopinath93@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2018-10-06 08:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 0,
  `createdon` datetime NOT NULL,
  `createdby` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `restaurant_id`, `name`, `description`, `is_available`, `createdon`, `createdby`) VALUES
(1, 1, 'Starter', 'Starter is good', 1, '2020-06-06 19:10:46', 1),
(2, 1, 'Dessert', 'Dessert', 1, '2020-06-06 19:11:48', 1),
(3, 1, 'Soft Drinks', 'Soft Drinks', 0, '2020-06-06 19:13:57', 1),
(4, 1, 'dddd', 'dddd', 1, '2020-06-06 19:17:15', 1),
(5, 1, 'Biryani', 'Biryani', 1, '2020-06-06 21:28:56', 1),
(6, 1, 'Soups', 'Soups', 1, '2020-06-14 22:53:20', 1),
(7, 1, 'Juice', 'Juice', 1, '2020-06-14 23:21:04', 1),
(8, 1, 'Tandoori', 'Tandoori', 1, '2020-06-28 22:52:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `email` varchar(400) NOT NULL,
  `mobile` varchar(400) NOT NULL,
  `otpno` int(11) NOT NULL DEFAULT 0,
  `createdon` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `mobile`, `otpno`, `createdon`) VALUES
(1, 'Gopinath', 'gopinath93@gmail.com', '9944526954', 4226, '2020-06-28 21:33:01'),
(2, 'Gopinath', 'gopinath93@gmail.com1', '9944526952', 2798, '2020-06-28 22:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `gst_master`
--

CREATE TABLE `gst_master` (
  `id` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `createdon` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gst_master`
--

INSERT INTO `gst_master` (`id`, `percent`, `createdon`) VALUES
(1, 5, '2020-06-06 16:56:43'),
(2, 12, '2020-06-06 16:57:43'),
(3, 18, '2020-06-06 16:58:43'),
(4, 28, '2020-06-06 16:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_available` int(11) NOT NULL DEFAULT 0,
  `id_addon` int(11) NOT NULL DEFAULT 0,
  `foodtype` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `parcel_charges` int(11) NOT NULL,
  `gst` int(11) NOT NULL,
  `gst_value` float NOT NULL,
  `total_price` float NOT NULL,
  `total_price_parcel` float NOT NULL,
  `image` text DEFAULT NULL,
  `sortby` int(11) NOT NULL DEFAULT 0,
  `item_image` text DEFAULT NULL,
  `createdon` datetime NOT NULL,
  `createdby` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `restaurant_id`, `category_id`, `is_available`, `id_addon`, `foodtype`, `price`, `parcel_charges`, `gst`, `gst_value`, `total_price`, `total_price_parcel`, `image`, `sortby`, `item_image`, `createdon`, `createdby`) VALUES
(1, 'Chicken Lollipop', '                                                                                                      Chicken Lollipop                                                                                                                                ', 1, 1, 1, 0, 2, 250.00, 10, 3, 45, 295, 305, NULL, 1, '/upload/item/2020061614134297365303_161309942021352_866127533022642176_o.jpg', '2020-06-06 20:11:27', 1),
(2, 'Vanilla Ice Cream', 'Vanilla Ice Cream', 1, 2, 1, 0, 1, 150.00, 10, 2, 18, 150, 0, NULL, 1, NULL, '2020-06-06 20:26:24', 1),
(4, 'Chocolate Ice Cream', 'Chocolate Ice Cream', 1, 2, 1, 0, 1, 190.00, 10, 2, 22.8, 212.8, 222.8, NULL, 2, NULL, '2020-06-06 20:29:03', 1),
(5, 'Chicken Biryani', 'Chicken Biryani', 1, 5, 1, 0, 2, 150.00, 10, 3, 27, 177, 187, NULL, 1, NULL, '2020-06-06 21:29:20', 1),
(6, 'Mutton Biryani', 'Mutton Biryani', 1, 5, 1, 0, 2, 350.00, 10, 3, 63, 413, 423, NULL, 0, NULL, '2020-06-14 22:51:00', 1),
(7, 'Watermelon Juice', 'Watermelon Juice', 1, 7, 1, 0, 1, 100.00, 10, 3, 18, 118, 128, NULL, 0, NULL, '2020-06-14 23:21:30', 1),
(8, 'Grill Chicken', 'Grill Chicken', 1, 1, 1, 0, 2, 600.00, 40, 3, 108, 708, 748, NULL, 0, '/upload/item/20200615225511pngguru.com (2).png', '2020-06-15 22:55:13', 1),
(9, 'Half Plate', 'Half Plate', 1, 8, 1, 0, 2, 500.00, 10, 3, 90, 590, 600, NULL, 0, '', '2020-06-28 22:53:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ordertable`
--

CREATE TABLE `ordertable` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL DEFAULT 1,
  `customerid` varchar(40) NOT NULL DEFAULT '',
  `table_id` int(11) NOT NULL DEFAULT 0,
  `numberofguests` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `gst_value` float NOT NULL DEFAULT 0,
  `total_price` float NOT NULL DEFAULT 0,
  `confirmed` int(11) NOT NULL DEFAULT 0,
  `completed` int(11) NOT NULL DEFAULT 0,
  `generate_bill` int(11) NOT NULL DEFAULT 0,
  `customer_completed` int(11) NOT NULL DEFAULT 0,
  `createdon` datetime DEFAULT NULL,
  `createdby` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertable`
--

INSERT INTO `ordertable` (`id`, `restaurant_id`, `customerid`, `table_id`, `numberofguests`, `price`, `gst_value`, `total_price`, `confirmed`, `completed`, `generate_bill`, `customer_completed`, `createdon`, `createdby`) VALUES
(1, 1, '1', 1, 5, 2700, 360, 3060, 1, 1, 1, 0, '2020-06-28 22:53:58', 0),
(2, 1, '2', 1, 5, 700, 126, 826, 1, 1, 0, 0, '2020-06-28 22:59:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `restaurant_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` float(10,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `customer_id`, `restaurant_id`, `item_id`, `qty`, `price`, `status`) VALUES
(1, 1, 1, 1, 6, 1, 350.00, 3),
(2, 1, 1, 1, 7, 3, 300.00, 3),
(3, 1, 1, 1, 8, 1, 600.00, 3),
(4, 1, 1, 1, 9, 2, 1000.00, 3),
(5, 1, 1, 1, 6, 1, 350.00, 0),
(6, 1, 1, 1, 7, 1, 100.00, 0),
(7, 2, 2, 1, 7, 1, 100.00, 3),
(8, 2, 2, 1, 8, 1, 600.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_on` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`, `created_by`, `created_on`) VALUES
(1, 'admin', 0, 0),
(2, 'user', 0, 0),
(3, 'kitchen', 0, 0),
(7, 'super admin', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL DEFAULT 0,
  `table_name` varchar(100) NOT NULL DEFAULT '',
  `short_name` varchar(40) NOT NULL DEFAULT '',
  `table_capacity` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0,
  `createdon` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `restaurant_id`, `table_name`, `short_name`, `table_capacity`, `is_active`, `status`, `createdon`) VALUES
(1, 1, 'Table 1', 'T1', 0, 1, 0, '2020-06-26 15:28:19'),
(2, 1, 'Table 2', 'T2', 0, 1, 0, '2020-06-26 15:28:19'),
(3, 1, 'Table 3', 'T3', 0, 1, 0, '2020-06-26 15:28:19'),
(4, 1, 'Table 4', 'T4', 0, 1, 0, '2020-06-26 15:28:19'),
(5, 1, 'Table 5', 'T5', 0, 1, 0, '2020-06-26 15:28:19'),
(6, 1, 'Table 6', 'T6', 0, 1, 0, '2020-06-26 15:28:19'),
(7, 1, 'Table 7', 'T7', 0, 1, 0, '2020-06-26 15:28:19'),
(8, 1, 'Table 8', 'T8', 0, 1, 0, '2020-06-26 15:28:19'),
(9, 1, 'Table 9', 'T9', 0, 1, 0, '2020-06-26 15:28:19'),
(10, 1, 'Table 10', 'T10', 0, 1, 0, '2020-06-26 15:28:19'),
(11, 0, 'sasi', 's1', 4, 1, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `table_1`
--

CREATE TABLE `table_1` (
  `id` int(11) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `table_capacity` int(11) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_1`
--

INSERT INTO `table_1` (`id`, `table_name`, `short_name`, `table_capacity`, `is_active`) VALUES
(1, 'hello', 'hi', 6, 1),
(2, 'Table5', 'T5', 4, 1),
(3, 'table2', 't2', 6, 0),
(4, 'table1121', 't34', 6, 0),
(5, 'logesh', 'ewbfi', 9, 1),
(6, 'logesh', '1234', 78, 1),
(7, 'logesh', 'ewbfi', 4, 1),
(8, 'asdfghjk', 'asdfgh', 9, 1),
(9, 'table test', 'test', 4, 1),
(10, 'logesh', 'ewbfi', 9, 1),
(11, 'logesh', 'logesh', 89, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `role`, `password`) VALUES
(16, 'admin', 's.logeshkarthik@gmail.com', '9551783347', 'super admin', '123456'),
(17, 'kalai', 's.logeshkarthik@gmail.com', '9551783347', 'super admin', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gst_master`
--
ALTER TABLE `gst_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertable`
--
ALTER TABLE `ordertable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_1`
--
ALTER TABLE `table_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gst_master`
--
ALTER TABLE `gst_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ordertable`
--
ALTER TABLE `ordertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `table_1`
--
ALTER TABLE `table_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
