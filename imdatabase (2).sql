-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 07:43 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `completed`
--

CREATE TABLE `completed` (
  `id` int(20) NOT NULL,
  `customer_id` int(20) DEFAULT NULL,
  `order_id` int(20) DEFAULT NULL,
  `date_arrive` varchar(255) DEFAULT NULL,
  `prod_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `completed`
--

INSERT INTO `completed` (`id`, `customer_id`, `order_id`, `date_arrive`, `prod_id`) VALUES
(1, 9002, 105, '06/30/2023', 1011),
(3, 9003, 104, '06/30/2023', 1007);

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE `customer_info` (
  `customer_id` int(20) NOT NULL,
  `customer_name` varchar(250) DEFAULT NULL,
  `customer_address` varchar(250) DEFAULT NULL,
  `customer_number` varchar(250) DEFAULT NULL,
  `customer_postal` varchar(250) DEFAULT NULL,
  `customer_email` varchar(250) DEFAULT NULL,
  `customer_country` varchar(250) DEFAULT NULL,
  `ship_id` int(20) DEFAULT NULL,
  `order_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`customer_id`, `customer_name`, `customer_address`, `customer_number`, `customer_postal`, `customer_email`, `customer_country`, `ship_id`, `order_id`) VALUES
(9000, 'Jun', 'Phase 2 Camaman an', '02311231', '20031', 'jun@gmail.com', 'Philippines', 603, NULL),
(9001, 'Christian', 'Bugo', '0231992', '1022', 'Christian@gmail.com', 'Philippines', 602, NULL),
(9002, 'Terrence', 'Zone 2 Cugman', '023132312', '9090', 'terrence@gmail.com', 'Philippines', 601, NULL),
(9003, 'Mark', 'Lapasan', '023112', '9090', 'Mark@gmail.com', 'Canada', 604, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(20) NOT NULL,
  `prod_id` int(20) DEFAULT NULL,
  `QTY` varchar(225) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `prod_id`, `QTY`, `order_date`) VALUES
(101, 1006, '7', '06/12/2023'),
(102, 1004, '9', '06/12/2023'),
(103, 1003, '2', '06/03/2023'),
(104, 1007, '4', '06/07/2023'),
(105, 1011, '25', '06/14/2023');

-- --------------------------------------------------------

--
-- Table structure for table `pack`
--

CREATE TABLE `pack` (
  `pack_id` int(20) NOT NULL,
  `order_id` int(20) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pack`
--

INSERT INTO `pack` (`pack_id`, `order_id`, `status`) VALUES
(2001, 103, 'Ready'),
(2002, 102, 'Ready'),
(2003, 105, 'Ready'),
(2004, 104, 'Ready');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(20) NOT NULL,
  `prod_name` varchar(250) DEFAULT NULL,
  `prod_desc` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `price`) VALUES
(1001, 'Rubics Cube', 'Puzzle', '100'),
(1002, 'Keyboard', 'Mechanical Keyboard', '999'),
(1003, 'Router', 'Globe Router', '562'),
(1004, 'Eyeglass', 'Anti-Radiation Glasses', '300'),
(1005, 'Socket', 'Triple Safety Socket Rubber', '60'),
(1006, 'Charger', 'Triple Safety Socket Rubber', '340'),
(1007, 'Headset', 'Bass Boosted Headset', '450'),
(1008, 'Electric Fan', 'Portable Electric Fan', '720'),
(1009, 'Speaker', 'Quad Bass Boosted', '860'),
(1010, 'Sweater', 'Knitted Sweater', '400'),
(1011, 'SATA Data Cable', 'HDD connector', '30'),
(1012, 'Watch', 'Oyster Leather Strap Watch', '1400'),
(1013, 'Knife', 'Japan Made Knifes', '1999'),
(1014, 'Camera', 'HD Camera', '17000');

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `ship_id` int(20) NOT NULL,
  `ship_destination` varchar(250) DEFAULT NULL,
  `pack_id` int(20) DEFAULT NULL,
  `ship_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`ship_id`, `ship_destination`, `pack_id`, `ship_date`) VALUES
(601, 'Manila', 2003, '06/15/2023'),
(602, 'Cagayan', 2001, ' 06/13/2023'),
(603, 'Sulu', 2002, ' 06/14/2023'),
(604, 'Cebu', 2004, ' 06/18/2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `completed`
--
ALTER TABLE `completed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `ship_id` (`ship_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `pack`
--
ALTER TABLE `pack`
  ADD PRIMARY KEY (`pack_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`ship_id`),
  ADD KEY `pack_id` (`pack_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `completed`
--
ALTER TABLE `completed`
  ADD CONSTRAINT `completed_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`),
  ADD CONSTRAINT `completed_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `completed_ibfk_3` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);

--
-- Constraints for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD CONSTRAINT `customer_info_ibfk_1` FOREIGN KEY (`ship_id`) REFERENCES `shipment` (`ship_id`),
  ADD CONSTRAINT `customer_info_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);

--
-- Constraints for table `pack`
--
ALTER TABLE `pack`
  ADD CONSTRAINT `pack_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`pack_id`) REFERENCES `pack` (`pack_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
