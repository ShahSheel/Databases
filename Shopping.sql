-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2015 at 04:08 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pandq`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `AccountID` tinyint(8) NOT NULL DEFAULT '0',
  `CustomerID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`AccountID`, `CustomerID`) VALUES
(1, '1'),
(2, 'bob'),
(22, 'bob');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `BranchID` tinyint(4) NOT NULL DEFAULT '0',
  `Location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`BranchID`, `Location`) VALUES
(1, '1'),
(2, 'mitcham');

-- --------------------------------------------------------

--
-- Table structure for table `charge_accounts`
--

CREATE TABLE IF NOT EXISTS `charge_accounts` (
  `Charge_AccountID` tinyint(8) NOT NULL DEFAULT '0',
  `Interest_Rate` float DEFAULT NULL,
  `Payment_Rate` float DEFAULT NULL,
  `AccountID` tinyint(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charge_accounts`
--

INSERT INTO `charge_accounts` (`Charge_AccountID`, `Interest_Rate`, `Payment_Rate`, `AccountID`) VALUES
(1, 1, 1, 1),
(127, 2, 2321230000000, 22);

-- --------------------------------------------------------

--
-- Table structure for table `credit_accounts`
--

CREATE TABLE IF NOT EXISTS `credit_accounts` (
  `Credit_AccountID` tinyint(8) NOT NULL DEFAULT '0',
  `Credit_Limit` float DEFAULT NULL,
  `Interest_Rate` float DEFAULT NULL,
  `Payment_Rate` float DEFAULT NULL,
  `AccountID` tinyint(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_accounts`
--

INSERT INTO `credit_accounts` (`Credit_AccountID`, `Credit_Limit`, `Interest_Rate`, `Payment_Rate`, `AccountID`) VALUES
(1, 1, 1, 1, 1),
(127, 2323, 2, 323, 22);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` varchar(20) NOT NULL DEFAULT '',
  `First_Name` varchar(13) DEFAULT NULL,
  `Last_Name` varchar(13) DEFAULT NULL,
  `Address_Line_1` varchar(30) DEFAULT NULL,
  `Address_Line_2` varchar(30) DEFAULT NULL,
  `Address_Line_3` varchar(30) DEFAULT NULL,
  `County` varchar(15) DEFAULT NULL,
  `Post_Code` varchar(6) DEFAULT NULL,
  `TelNo` tinyint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `First_Name`, `Last_Name`, `Address_Line_1`, `Address_Line_2`, `Address_Line_3`, `County`, `Post_Code`, `TelNo`) VALUES
('1', 'bob', 'john', '31 street', NULL, NULL, 'surrey', 'sm44eu', 127),
('12', 'Hello', 'Word', 'This', 'Is', 'a', 'Test', 'For', 0),
('bob', 'john', 'john', 'hello', 'world', NULL, 'mitcham', NULL, 127);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
`mem_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mem_id`, `username`, `password`) VALUES
(1, 'argie', '9f51ce8e8e4374fd0736f3ece4a679dc'),
(2, 'ar', 'ar'),
(3, 'arg', 'arg'),
(4, 'bbb', 'bbb'),
(5, 'cccc', 'cccc'),
(6, 'hi', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `TransactionID` tinyint(11) DEFAULT NULL,
  `ProductID` varchar(15) DEFAULT NULL,
  `Quantity` tinyint(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`TransactionID`, `ProductID`, `Quantity`) VALUES
(1, '1', 1),
(1, '1', 1),
(1, '32', 22);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` varchar(15) NOT NULL DEFAULT '',
  `ProductNO` varchar(15) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `OfferPrice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductNO`, `Price`, `OfferPrice`) VALUES
('1', '1', 1, 1),
('32', '232323', 2321320, 2323210000);

--
-- Triggers `products`
--
DELIMITER //
CREATE TRIGGER `before_Product_Backup_Update` BEFORE UPDATE ON `products`
 FOR EACH ROW BEGIN

INSERT INTO Product_Backup
SET ACTION = 'update',
ProductID = OLD.ProductID,
Changedon = NOW();

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
`id` int(11) NOT NULL,
  `BranchID` int(4) NOT NULL DEFAULT '0',
  `Sales_Assistant_ID` varchar(20) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Charge_Accounts` int(8) DEFAULT NULL,
  `Credit_Accounts` int(8) DEFAULT NULL,
  `Total` int(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `BranchID`, `Sales_Assistant_ID`, `Quantity`, `Charge_Accounts`, `Credit_Accounts`, `Total`, `created`) VALUES
(1, 2323, 'asd', 0, 12323, 2323232, 23232, '2015-04-16 10:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `sales_assistants`
--

CREATE TABLE IF NOT EXISTS `sales_assistants` (
  `SalesID` varchar(20) NOT NULL DEFAULT '',
  `Sales_Assistant_ID` varchar(20) DEFAULT NULL,
  `SalesPName` varchar(20) DEFAULT NULL,
  `BranchID` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_assistants`
--

INSERT INTO `sales_assistants` (`SalesID`, `Sales_Assistant_ID`, `SalesPName`, `BranchID`) VALUES
('1', '1', '1', 1),
('102', '103', '103', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `TransactionID` tinyint(11) NOT NULL DEFAULT '0',
  `DATE` date DEFAULT NULL,
  `TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SalesID` varchar(20) DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `BranchID` tinyint(4) DEFAULT NULL,
  `Credit_AccountID` tinyint(8) DEFAULT NULL,
  `Charge_AccountID` tinyint(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionID`, `DATE`, `TIME`, `SalesID`, `Total`, `BranchID`, `Credit_AccountID`, `Charge_AccountID`) VALUES
(1, '2015-04-16', '2015-04-16 02:21:50', '1', 1, 1, 1, 1),
(12, '2015-04-14', '2015-04-16 02:26:55', '102', 121212, 2, 127, 127);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`AccountID`), ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
 ADD PRIMARY KEY (`BranchID`);

--
-- Indexes for table `charge_accounts`
--
ALTER TABLE `charge_accounts`
 ADD PRIMARY KEY (`Charge_AccountID`), ADD KEY `AccountID` (`AccountID`);

--
-- Indexes for table `credit_accounts`
--
ALTER TABLE `credit_accounts`
 ADD PRIMARY KEY (`Credit_AccountID`), ADD KEY `AccountID` (`AccountID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD KEY `TransactionID` (`TransactionID`), ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_assistants`
--
ALTER TABLE `sales_assistants`
 ADD PRIMARY KEY (`SalesID`), ADD KEY `BranchID` (`BranchID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
 ADD PRIMARY KEY (`TransactionID`), ADD UNIQUE KEY `DATE` (`DATE`), ADD UNIQUE KEY `DATE_2` (`DATE`), ADD KEY `BranchID` (`BranchID`), ADD KEY `SalesID` (`SalesID`), ADD KEY `Charge_AccountID` (`Charge_AccountID`), ADD KEY `Credit_AccountID` (`Credit_AccountID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
MODIFY `mem_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `charge_accounts`
--
ALTER TABLE `charge_accounts`
ADD CONSTRAINT `charge_accounts_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `accounts` (`AccountID`);

--
-- Constraints for table `credit_accounts`
--
ALTER TABLE `credit_accounts`
ADD CONSTRAINT `credit_accounts_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `accounts` (`AccountID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transaction` (`TransactionID`),
ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `sales_assistants`
--
ALTER TABLE `sales_assistants`
ADD CONSTRAINT `sales_assistants_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`),
ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`SalesID`) REFERENCES `sales_assistants` (`SalesID`),
ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`Charge_AccountID`) REFERENCES `charge_accounts` (`Charge_AccountID`),
ADD CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`Credit_AccountID`) REFERENCES `credit_accounts` (`Credit_AccountID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
