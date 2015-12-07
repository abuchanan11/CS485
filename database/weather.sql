-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2015 at 04:04 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `weather`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `longitude` varchar(45) NOT NULL,
  `latitude` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `name`, `longitude`, `latitude`, `state`) VALUES
(1, 'Winona', '-91.63', '44.05', 'MN'),
(2, 'SomePlace', '-91', '57', 'WI');

-- --------------------------------------------------------

--
-- Table structure for table `cities_has_day_forecast`
--

CREATE TABLE IF NOT EXISTS `cities_has_day_forecast` (
  `cities_city_id` int(11) NOT NULL,
  `day_forecast_forecast_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `day_forecast`
--

CREATE TABLE IF NOT EXISTS `day_forecast` (
  `forecast_id` int(11) NOT NULL AUTO_INCREMENT,
  `high` decimal(10,0) NOT NULL,
  `low` decimal(10,0) NOT NULL,
  `type_precip` varchar(45) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`forecast_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `day_forecast`
--

INSERT INTO `day_forecast` (`forecast_id`, `high`, `low`, `type_precip`, `date`) VALUES
(1, '42', '37', 'cloudy', '0000-00-00'),
(2, '42', '37', 'cloudy', '2015-12-06'),
(3, '48', '35', 'cloudy', '2015-12-05'),
(4, '51', '24', 'sunny', '2015-12-04'),
(5, '35', '28', 'sunny', '2015-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
  `file_name_path` varchar(60) NOT NULL,
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `location` varchar(45) NOT NULL,
  `condition` varchar(45) NOT NULL,
  `user_username` varchar(16) NOT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE IF NOT EXISTS `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `high` decimal(10,0) NOT NULL,
  `low` decimal(10,0) NOT NULL,
  `type_precip` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `cities_city_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(1) NOT NULL,
  `location` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `condition` varchar(45) NOT NULL,
  `user_username` varchar(16) NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` int(32) NOT NULL,
  `cities_city_id` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `email`, `password`, `cities_city_id`) VALUES
('admin', 'admin@skies.com', 0, 1),
('weather_lover1959', 'outdoordad1959@yahoo.com', 12345, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
