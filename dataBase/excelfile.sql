-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 25, 2020 at 10:13 AM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `excelfile`
--

-- --------------------------------------------------------

--
-- Table structure for table `questionnaire_category`
--

DROP TABLE IF EXISTS `questionnaire_category`;
CREATE TABLE IF NOT EXISTS `questionnaire_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_category` text NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionnaire_category`
--

INSERT INTO `questionnaire_category` (`id`, `question_category`, `is_active`) VALUES
(1, 'GK', 1),
(2, 'Aptitude', 1),
(3, 'Logical', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_bank`
--

DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE IF NOT EXISTS `question_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_category_id` int(11) NOT NULL,
  `questions` text NOT NULL,
  `option1` varchar(60) NOT NULL,
  `option2` varchar(60) NOT NULL,
  `option3` varchar(60) NOT NULL,
  `option4` varchar(60) NOT NULL,
  `answer` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionnaire_category_id` (`questionnaire_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_bank`
--

INSERT INTO `question_bank` (`id`, `questionnaire_category_id`, `questions`, `option1`, `option2`, `option3`, `option4`, `answer`) VALUES
(1, 1, 'A thief is noticed by a policeman from a distance of 200 m. The thief starts running and the policeman chases him. The thief and the policeman run at the rate of 10 km and 11 km per hour respectively. What is the distance between them after 6 minutes?', '50 meter', '150 meter', '120 meter', '100 meter', 1),
(2, 1, 'Harish can row a certain distance upstream in 18 hours and downstream the same distance in 12 hours. If the stream flows at the rate of 6 kmph, then find the speed of Harish in still water.', '30 kmph', '35 kmph', '20 kmph', '25 kmph', 1),
(3, 1, 'What is the sum of the first 12 terms of an arithmetic progession, if the first term is 3 and the last term is 47? ', '260', '300', '280', '220', 1),
(4, 1, 'A man sold an item for Rs. 2000 and incurred a loss. Had he sold the item for Rs. 3600, his gain would have been equal to three times of the amount of loss that he incurred. At what price should he sell the article to gain 20 %?', '2640', '2720', '2960', '2880', 1),
(5, 1, 'Hari had three notebooks X, Y, Z. Of these, X had 120 pages. Y had 10% more pages than X and Z had 10% less pages than X. If he tore roughly 5%, 10% and 15% of pages in X, Y and Z respectively, then what percent of pages did he tear out?', '8%', '10%', '7%', '13%', 1),
(6, 1, '40 % of goods are sold at 10 % loss while the remaining is sold at 20 % profit. If there is total profit of Rs. 640, then the worth of goods sold is?', '8000', '9500', '8600', '8700', 1),
(7, 1, 'Can you find the answer for the below equation 80 + 86 * 82 - 84 / 88', '7131.05', '7128.05', '7135.05', '7137.05', 1),
(8, 1, 'Can you find the answer for the below equation 89 + 84 / 86 * 91 - 82', '101.88', '92.88', '95.88', '99.88', 1),
(9, 1, 'Two persons start running simultaneously around a rectangular track of length 700 m from the same point at speeds of 45 km/hr and 25 km/hr. When will they meet for the first time any where on the track if they are moving in opposite directions?', '50 sec', '42 sec', '25 sec', '36 sec', 1),
(10, 1, 'If the arithmetic mean of 3a and 4b is greater than 50, and a is twice of b, then the smallest possible integer value of a is:', '19', '25', '23', '21', 1),
(11, 1, 'Find the greatest number which when divides 564 and 467 leaves the remainder as 4 and 7 respectively.', '30', '20', '25', '35', 1),
(12, 1, 'The selling price of Watch is Rs.920. The ratio of the marked price to cost price of the watch is 23: 20 and the ratio of the marked price to cost price of the Pen is 11: 10. If the ratio of the cost price of the watch to Pen is 2: 1 and the discount offers for watch is 20%, then what is the marked price of Pen? ', '550', '650', '450', '750', 1),
(13, 1, 'Four Iron metal rods of lengths 78 cm, 104 cm, 117 cm and 169 cm are to be cut into parts of equal length. Each part must be as long as possible. What is the maximum number of pieces that can be cut?', '27', '36', '43', '400', 1),
(14, 1, 'The average weight of 40 students in a class is 75 kg. By mistake the weights of two students are read as 74 kg and 66 kg respectively instead of 66 kg and 54 kg. Find the corrected average weight of the class.', '73.50 kg', '74.50 kg', '75.50 kg', '76.50 kg', 1),
(15, 1, 'Nithya is 4 years younger to his brother. Her father was 30 years old when her sister was born while her mother was was 30 years old when she was born. If her sister was 4 years old when their brother was born, find the age of her father when her mother was born.', '11', '4', '8', '9', 1),
(16, 1, 'Anish had a certain amount with him. He spent 20% of that to buy a new cell phone and 15% of the remaining on buying a laptop. Then he donated Rs. 160 in a temple. If he is left with Rs. 1,200, how much did he buy the laptop for?', '220', '240', '320', '350', 1),
(17, 1, 'Which of the numbers given below is not a square number?', '1225', '2025', '2525', '4225', 1),
(18, 1, 'Rahul spends 50% of his monthly income on household items, 20% of his monthly income on buying clothes, 5% of his monthly income on medicines and the remaining amount of Rs. 11250 he saves. What is Rahul\'s monthly income ?', '38200', '34000', '41600', '45000', 1),
(19, 1, 'Kaira is 4 years younger to his brother. Her father was 30 years old when her sister was born while her mother was 30 years old when she was born. If her sister was 4 years old when their brother was born, find the age of her father when her mother was born.', '11', '12', '8', '9', 1),
(20, 1, 'A boat can travel 55 km downstream in 66 min. The ratio of the speed of the boat in still water to the speed of the stream is 4: 1. How much time will the boat take to cover 84 km upstream?', '2 hour 48 min', '3 hour 12 min', '2 hour 51 min', '3 hour 28 min', 1),
(21, 1, 'How many tiles whose length and breadth are 12 cm and 5 cm respectively will be needed to fit in a rectangular region whose length and breadth are respectively 144 cm and 100 cm?', '160', '260', '240', '300', 1),
(22, 1, 'A rectangular garden has a four-metre-wide road along all the four sides. The area of the road is 1104 sq metre. What is the sum of the length and the breadth of the garden?', '120m', '125m', '130m', '135m', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
