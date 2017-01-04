-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Dec 29, 2016 at 07:13 PM
-- Server version: 10.0.27-MariaDB-cll-lve
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `everpsyc_practice`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE IF NOT EXISTS `appointments` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `doctor_id` int(9) unsigned NOT NULL,
  `whom` tinyint(1) NOT NULL,
  `patient_id` int(9) unsigned NOT NULL,
  `contact_id` int(9) unsigned NOT NULL,
  `other` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `motive` text NOT NULL,
  `notes` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_view` tinyint(1) NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `Color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `assistant_payment`
--

CREATE TABLE IF NOT EXISTS `assistant_payment` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `assistant_id` int(9) unsigned NOT NULL,
  `payment_mode_id` int(9) unsigned NOT NULL,
  `date` date NOT NULL,
  `invoice` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blood_group_type`
--

CREATE TABLE IF NOT EXISTS `blood_group_type` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `blood_group_type`
--

INSERT INTO `blood_group_type` (`id`, `name`) VALUES
(1, 'O-'),
(2, 'O+'),
(3, 'A-'),
(4, 'A+'),
(5, 'B-'),
(6, 'B+'),
(7, 'AB-'),
(8, 'AB+');

-- --------------------------------------------------------

--
-- Table structure for table `canned_messages`
--

CREATE TABLE IF NOT EXISTS `canned_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `case_history`
--

CREATE TABLE IF NOT EXISTS `case_history` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `field_type` int(10) NOT NULL,
  `form` int(10) NOT NULL,
  `values` text NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE IF NOT EXISTS `days` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `name`) VALUES
(1, 'Mon'),
(2, 'Tue'),
(3, 'Wed'),
(4, 'Thu'),
(5, 'Fri'),
(6, 'Sat'),
(7, 'Sun');

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE IF NOT EXISTS `disease` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_payment`
--

CREATE TABLE IF NOT EXISTS `doctor_payment` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` int(9) unsigned NOT NULL,
  `payment_mode_id` int(9) unsigned NOT NULL,
  `date` date NOT NULL,
  `invoice` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_calendar`
--

CREATE TABLE IF NOT EXISTS `event_calendar` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `schedule_category_id` int(9) unsigned NOT NULL,
  `doctor_id` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `prescription_id` int(9) unsigned NOT NULL,
  `payment_mode_id` int(9) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `invoice` int(10) NOT NULL,
  `patient_id` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_schedule`
--

CREATE TABLE IF NOT EXISTS `fixed_schedule` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` int(9) unsigned NOT NULL,
  `day` varchar(255) NOT NULL,
  `timing_to` time NOT NULL,
  `timing_from` time NOT NULL,
  `work` text NOT NULL,
  `hospital` int(9) unsigned NOT NULL,
  `type` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `doctor_id` int(9) unsigned NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `hospital_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `doctor_id`, `address`, `phone`, `hospital_type`) VALUES
(1, 'Okey Dokey Childhood Psychology', 2, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_type`
--

CREATE TABLE IF NOT EXISTS `hospital_type` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `instruction`
--

CREATE TABLE IF NOT EXISTS `instruction` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `doctor_id` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jqcalendar`
--

CREATE TABLE IF NOT EXISTS `jqcalendar` (
  `Id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `Subject` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `IsAllDayEvent` smallint(6) NOT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `RecurringRule` varchar(500) DEFAULT NULL,
  `doctor_id` int(9) unsigned NOT NULL,
  `type_id` tinyint(4) NOT NULL DEFAULT '5',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jqcalendar`
--

INSERT INTO `jqcalendar` (`Id`, `Subject`, `Location`, `Description`, `StartTime`, `EndTime`, `IsAllDayEvent`, `Color`, `RecurringRule`, `doctor_id`, `type_id`) VALUES
(1, '', NULL, NULL, '2016-12-19 01:00:00', '2016-12-19 01:30:00', 0, NULL, NULL, 2, 5),
(2, '', NULL, NULL, '2016-12-21 00:45:00', '2016-12-21 01:15:00', 0, NULL, NULL, 2, 5),
(3, '', NULL, NULL, '2016-12-22 01:30:00', '2016-12-22 02:00:00', 0, NULL, NULL, 2, 5),
(4, '', NULL, NULL, '2016-12-24 01:45:00', '2016-12-24 02:15:00', 0, NULL, NULL, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `flag` text NOT NULL,
  `file` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `flag`, `file`) VALUES
(1, 'englishfixed', '', 'admin_lang.php');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturing_company`
--

CREATE TABLE IF NOT EXISTS `manufacturing_company` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `doctor_id` int(9) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medical_college`
--

CREATE TABLE IF NOT EXISTS `medical_college` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(32) NOT NULL,
  `doctor_id` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medical_test`
--

CREATE TABLE IF NOT EXISTS `medical_test` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `doctor_id` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(9) unsigned NOT NULL,
  `company_id` int(9) unsigned NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `doctor_id` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE IF NOT EXISTS `medicine_category` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `doctor_id` int(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `from_id` int(9) unsigned NOT NULL,
  `to_id` int(9) unsigned NOT NULL,
  `is_view_from` int(9) NOT NULL DEFAULT '0',
  `is_view_to` int(9) NOT NULL DEFAULT '0',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `message`, `from_id`, `to_id`, `is_view_from`, `is_view_to`, `date_time`) VALUES
(1, 'sdfsdfsdvsdvsvsvsvdsvdsvdsd', 2, 5, 0, 1, '2016-12-24 08:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `monthly_schedule`
--

CREATE TABLE IF NOT EXISTS `monthly_schedule` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `date_id` int(2) NOT NULL,
  `doctor_id` int(11) unsigned NOT NULL,
  `timing_from` time NOT NULL,
  `timing_to` time NOT NULL,
  `work` text NOT NULL,
  `hospital` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) unsigned NOT NULL,
  `doctor_id` int(11) unsigned NOT NULL,
  `notes` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE IF NOT EXISTS `notification_setting` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `to_do_alert` int(10) NOT NULL,
  `appointment_alert` int(10) NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `other_schedule`
--

CREATE TABLE IF NOT EXISTS `other_schedule` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) unsigned NOT NULL,
  `dates` date NOT NULL,
  `timing_from` time NOT NULL,
  `timing_to` time NOT NULL,
  `work` text NOT NULL,
  `hospital_id` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE IF NOT EXISTS `payment_modes` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `doctor_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) unsigned NOT NULL,
  `patient_id` int(11) unsigned NOT NULL,
  `medicines` text NOT NULL,
  `tests` text NOT NULL,
  `test_instructions` text NOT NULL,
  `disease` text NOT NULL,
  `oe_description` text NOT NULL,
  `date_time` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `medicine_instruction` text NOT NULL,
  `case_history` text NOT NULL,
  `case_history_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_template`
--

CREATE TABLE IF NOT EXISTS `prescription_template` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `header` text,
  `footer` text,
  `doctor_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rel_form_custom_fields`
--

CREATE TABLE IF NOT EXISTS `rel_form_custom_fields` (
  `custom_field_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `reply` text NOT NULL,
  `table_id` int(9) unsigned NOT NULL,
  `form` int(9) unsigned NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) unsigned NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type_id` int(11) unsigned NOT NULL,
  `file` text NOT NULL,
  `remark` text NOT NULL,
  `from_id` int(11) unsigned NOT NULL,
  `to_id` int(11) unsigned NOT NULL,
  `is_view_to` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `invoice` int(10) NOT NULL DEFAULT '1',
  `date_format` varchar(255) NOT NULL,
  `timezone` varchar(255) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  `smtp_port` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `image`, `address`, `contact`, `email`, `doctor_id`, `invoice`, `date_format`, `timezone`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`) VALUES
(1, 'Okey Dokey Childhood Psychology', '', '', '0411322842', 'andrew@okeydokey.com.au', 0, 1, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `to_do_list`
--

CREATE TABLE IF NOT EXISTS `to_do_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `is_view` int(10) NOT NULL DEFAULT '0',
  `doctor_id` int(10) unsigned NOT NULL,
  `Color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `blood_group_id` int(10) NOT NULL,
  `image` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `dob` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `user_role` varchar(8) NOT NULL,
  `doctor_id` int(10) NOT NULL,
  `token` varchar(255) NOT NULL,
  `appointment_alert` int(10) NOT NULL DEFAULT '1',
  `to_do_alert` int(10) unsigned NOT NULL DEFAULT '1',
  `schedule` tinyint(1) DEFAULT '0',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `blood_group_id`, `image`, `username`, `password`, `gender`, `dob`, `email`, `contact`, `address`, `user_role`, `doctor_id`, `token`, `appointment_alert`, `to_do_alert`, `schedule`, `add_date`) VALUES
(1, 'Andrew Tompkins', 0, '', 'gorgar', '13db8101f97d1e5ea7ea830c7348278b7ab7d8c5', '', 0, 'andrew@veridon.com.au', '', '', 'Admin', 0, '', 1, 1, 0, '2016-12-24 07:12:00'),
(2, 'Raelene Dundon', 0, '', 'rdundon', '234796381608a35bd740adeed56498a51f7f49f8', 'Female', 2016, 'raelene@okeydokey.com.au', '0407550503', '', '1', 0, '', 1, 1, 0, '2016-12-24 07:14:19'),
(3, 'Louise Edwards', 0, '', '2Assistant1', 'ff2891a01391fbc7131a0a5d2181c86e1ea1b1a7', 'Female', 2016, 'louise@everpsych.com', '0387415059', '', '3', 2, '', 1, 1, 0, '2016-12-24 07:22:06'),
(4, 'Sonia Street', 0, '', 'sstreet', '404915fe5d807897e366731cf63826647d813533', 'Female', 2016, 'sonia@everpsych.com', '0387415059', '', '1', 0, '', 1, 1, 0, '2016-12-24 07:24:30'),
(5, 'Enara Tompkins', 0, '', '2Patient1', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'Female', 1982, 'gorgar@me.com', '0411322842', 'Mooroolbark', '2', 2, '', 1, 1, 0, '2016-12-24 08:12:52');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
