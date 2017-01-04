-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2017 at 06:04 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `everpsych`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointmentID` int(255) unsigned NOT NULL COMMENT 'Appointment ID',
  `startTime` datetime NOT NULL COMMENT 'Start Time',
  `endTime` datetime NOT NULL COMMENT 'End Time',
  `practitioner` varchar(255) NOT NULL COMMENT 'Practitioner',
  `practitionerID` int(255) NOT NULL COMMENT 'Practitiner ID',
  `client` varchar(255) NOT NULL COMMENT 'Client',
  `clientID` int(255) NOT NULL COMMENT 'ClientID',
  `clientEmail` varchar(255) NOT NULL COMMENT 'Client Email',
  `appointmentType` varchar(255) NOT NULL COMMENT 'Appointment Type',
  `appointmentNotes` varchar(255) NOT NULL COMMENT 'Appointment Notes',
  `didnotArrive` tinyint(1) NOT NULL COMMENT 'Did Not Arrive',
  `clientArrived` tinyint(1) NOT NULL COMMENT 'Client Arrived',
  `smsSent` tinyint(1) NOT NULL COMMENT 'SMS Reminder Sent',
  `emailSent` tinyint(1) NOT NULL COMMENT 'Email Reminder Sent',
  `cancellationTime` datetime NOT NULL COMMENT 'Cancellation Time',
  `cancellationReason` enum('Feeling better','Sick','Away','Work','Forgot','Other') NOT NULL COMMENT 'Cancellation Reason',
  `cancellatinNote` varchar(255) NOT NULL COMMENT 'Cancellation Note',
  `createAt` datetime NOT NULL COMMENT 'Created At',
  `createdBy` int(255) NOT NULL COMMENT 'User ID',
  `updatedAt` datetime NOT NULL COMMENT 'Updated At',
  `updatedBy` int(255) NOT NULL COMMENT 'User ID',
  `invoiceID` varchar(255) NOT NULL COMMENT 'Invoice ID',
  `maxClients` int(11) NOT NULL COMMENT 'Maximun Number of Clients'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `clientID` int(255) unsigned NOT NULL COMMENT 'Client ID',
  `createDate` datetime NOT NULL COMMENT 'Created Date',
  `updateDate` datetime NOT NULL COMMENT 'Updated Date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `clientName` varchar(255) NOT NULL COMMENT 'First Name',
  `clientSurname` varchar(255) NOT NULL COMMENT 'Surname',
  `dob` datetime NOT NULL COMMENT 'Date of birth',
  `gender` enum('Male','Female') NOT NULL COMMENT 'Gender',
  `address` varchar(255) NOT NULL COMMENT 'Address',
  `suburb` varchar(255) NOT NULL COMMENT 'Suburb',
  `state` varchar(255) NOT NULL COMMENT 'State',
  `postcode` varchar(8) NOT NULL COMMENT 'Postcode',
  `country` varchar(255) NOT NULL COMMENT 'Country',
  `phoneMobile` varchar(16) NOT NULL COMMENT 'Mobile Phone',
  `phoneHome` varchar(16) NOT NULL COMMENT 'Home Phone',
  `phoneWork` varchar(16) NOT NULL COMMENT 'Work Phone',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `parentClientID` int(255) NOT NULL COMMENT 'Parent ID',
  `ParentClientname` int(255) NOT NULL COMMENT 'Primary Contact',
  `permissionNotes` varchar(255) NOT NULL COMMENT 'Permission Notes',
  `archived` tinyint(1) NOT NULL COMMENT 'Archived',
  `notes` varchar(255) NOT NULL COMMENT 'Notes',
  `medicareCardNumber` varchar(64) NOT NULL COMMENT 'Medicare Card Number',
  `medicareCardIRN` varchar(64) NOT NULL COMMENT 'Medicare Card IRN',
  `medicareCardExpireDAte` datetime NOT NULL COMMENT 'Expire Date',
  `remiderType` enum('SMS','Email','None') NOT NULL COMMENT 'Remider Type',
  `invoiceTo` varchar(255) NOT NULL COMMENT 'Invoice To',
  `invoiceEmail` varchar(255) NOT NULL COMMENT 'Invoice EMail',
  `invoiceExtraInfo` varchar(255) NOT NULL COMMENT 'Invoice Extra Info'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='client Table';

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoiceID` int(255) unsigned NOT NULL COMMENT 'Invoice ID',
  `invoiceDate` datetime NOT NULL COMMENT 'Date',
  `clientID` int(255) NOT NULL COMMENT 'client ID',
  `clientName` varchar(255) NOT NULL COMMENT 'First Name',
  `clientSurname` varchar(255) NOT NULL COMMENT 'Surname',
  `practitionerID` int(255) NOT NULL COMMENT 'Practitioner ID',
  `practitioner` varchar(255) NOT NULL COMMENT 'Practitioner',
  `extraInfo` varchar(255) NOT NULL COMMENT 'Extra Patient Info',
  `dob` datetime NOT NULL COMMENT 'Client DOB',
  `practiceID` int(255) NOT NULL COMMENT 'Practice ID',
  `practiceName` varchar(255) NOT NULL COMMENT 'Practice Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `invoiceID` int(255) unsigned NOT NULL COMMENT 'ID',
  `serviceID` int(255) NOT NULL COMMENT 'Service ID',
  `itemCode` varchar(64) NOT NULL COMMENT 'Item Code',
  `itemName` varchar(255) NOT NULL COMMENT 'Item',
  `itemType` varchar(255) NOT NULL COMMENT 'Type',
  `itemPrice` float NOT NULL COMMENT 'Unit Price',
  `quantity` int(16) NOT NULL COMMENT 'Quantity',
  `taxID` varchar(32) NOT NULL COMMENT 'Tax ID',
  `taxName` varchar(255) NOT NULL COMMENT 'Tax Name',
  `taxAmount` float NOT NULL COMMENT 'Tax Amount',
  `netPrice` float NOT NULL COMMENT 'Net Price',
  `total` float NOT NULL COMMENT 'Total'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentID` int(255) unsigned NOT NULL COMMENT 'Payment ID',
  `paymentDate` datetime NOT NULL COMMENT 'Payment Date',
  `clientName` varchar(255) NOT NULL COMMENT 'Patient',
  `hicaps` float NOT NULL COMMENT 'HICAPS',
  `creditcard` float NOT NULL COMMENT 'Card',
  `eftpos` float NOT NULL COMMENT 'EFTPOS',
  `cash` float NOT NULL COMMENT 'Cash',
  `medicare` float NOT NULL COMMENT 'Medicare',
  `fahcsia` float NOT NULL COMMENT 'FaHCSIA',
  `internet` float NOT NULL COMMENT 'Internet Banking',
  `amex` float NOT NULL COMMENT 'AMEX',
  `cheque` float NOT NULL COMMENT 'Cheque',
  `totalAmount` float NOT NULL COMMENT 'Amount',
  `createDate` datetime NOT NULL COMMENT 'CreatedAt',
  `updateDate` datetime NOT NULL COMMENT 'UpdatedAt',
  `notes` varchar(255) NOT NULL COMMENT 'Notes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `practices`
--

CREATE TABLE `practices` (
  `practiceID` int(64) unsigned NOT NULL COMMENT 'Practice ID',
  `practiceName` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT 'Practice Name',
  `address` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT 'Address',
  `suburb` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT 'Suburb',
  `state` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT 'State',
  `postcode` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT 'PostCode',
  `country` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT 'Country',
  `abn` int(128) unsigned NOT NULL COMMENT 'ABN',
  `website` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT 'Website',
  `email` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT 'Email',
  `phone` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'Phone',
  `fax` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'Fax'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `referrers`
--

CREATE TABLE `referrers` (
  `referrerPracticeID` int(255) NOT NULL COMMENT 'Practice ID',
  `referrerID` int(255) NOT NULL COMMENT 'Practice',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `name` varchar(255) NOT NULL COMMENT 'First Name',
  `surname` varchar(255) NOT NULL COMMENT 'Surname',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `phoneMobile` varchar(16) NOT NULL COMMENT 'Mobile Phone',
  `notes` varchar(255) NOT NULL COMMENT 'Notes',
  `type` enum('GP','Paediatrician','Psychiatrist','Other') NOT NULL COMMENT 'Practitioner Type',
  `providerNumber` varchar(64) NOT NULL COMMENT 'Provider Number',
  `createDate` datetime NOT NULL COMMENT 'Created At',
  `updateDate` datetime NOT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referrer_practices`
--

CREATE TABLE `referrer_practices` (
  `referrerPracticeID` int(255) NOT NULL COMMENT 'Practice ID',
  `practiceName` varchar(255) NOT NULL COMMENT 'Practice Name',
  `contactName` varchar(255) NOT NULL COMMENT 'Contact Name',
  `phoneWork` varchar(16) NOT NULL COMMENT 'Phone',
  `phoneFax` varchar(32) NOT NULL COMMENT 'Fax',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `address` varchar(255) NOT NULL COMMENT 'Address',
  `suburb` varchar(255) NOT NULL COMMENT 'Suburb',
  `state` varchar(255) NOT NULL COMMENT 'State',
  `postcode` varchar(16) NOT NULL COMMENT 'Postcode',
  `country` varchar(64) NOT NULL COMMENT 'Country',
  `Notes` varchar(255) NOT NULL COMMENT 'Notes',
  `createDate` datetime NOT NULL COMMENT 'Created At',
  `updateDate` datetime NOT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `itemName` varchar(255) NOT NULL COMMENT 'Item Name',
  `itemType` varchar(255) NOT NULL COMMENT 'Item Type',
  `itemCode` varchar(255) NOT NULL COMMENT 'Item Code',
  `taxName` varchar(255) NOT NULL COMMENT 'Tax Name',
  `taxRate` float NOT NULL COMMENT 'Pax Percentage',
  `itemPrice` float NOT NULL COMMENT 'Price',
  `serviceID` int(255) unsigned NOT NULL COMMENT 'ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(255) unsigned NOT NULL COMMENT 'User ID',
  `role` enum('A','P','R','B') NOT NULL COMMENT 'Admin, Practitioner, Receptionist, Bookkeeper',
  `practitioner` tinyint(1) NOT NULL COMMENT 'Practitioner',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'First Name',
  `surname` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'SurName',
  `email` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Email',
  `phoneMobile` varchar(64) NOT NULL COMMENT 'Mobile Phone',
  `password` varchar(255) NOT NULL COMMENT 'Password',
  `activeAccount` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `practitionerID` int(255) NOT NULL COMMENT 'PractitionerID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `waitlist`
--

CREATE TABLE `waitlist` (
  `clientID` int(255) NOT NULL COMMENT 'ClientID',
  `clientName` varchar(255) NOT NULL COMMENT 'First Name',
  `clientSurname` varchar(255) NOT NULL COMMENT 'Surname',
  `createdDate` datetime NOT NULL COMMENT 'CreatedAt',
  `updateDate` datetime NOT NULL COMMENT 'UpdatedAt',
  `notes` varchar(255) NOT NULL COMMENT 'Notes',
  `existingClient` tinyint(1) NOT NULL COMMENT 'Existing Client',
  `priority` tinyint(1) NOT NULL COMMENT 'Priority',
  `oneoff` tinyint(1) NOT NULL COMMENT 'One Off Appointment',
  `regular` tinyint(1) NOT NULL COMMENT 'Regular Appointment'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointmentID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`clientID`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoiceID`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`invoiceID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `practices`
--
ALTER TABLE `practices`
  ADD PRIMARY KEY (`practiceID`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`serviceID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointmentID` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Appointment ID';
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `clientID` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Client ID';
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoiceID` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Invoice ID';
--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `invoiceID` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentID` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment ID';
--
-- AUTO_INCREMENT for table `practices`
--
ALTER TABLE `practices`
  MODIFY `practiceID` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Practice ID';
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `serviceID` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
