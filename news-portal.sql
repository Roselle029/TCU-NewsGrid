-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2022 at 10:29 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news-portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(35) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'admin@tcu.com', '$2y$10$b3GAX6.Pd6054RRQ8C9se.zfOhTljRkduBfAKWFrmtdKwj02aSTuq');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `article_title` varchar(250) NOT NULL,
  `article_image` varchar(200) NOT NULL,
  `article_description` text NOT NULL,
  `article_date` date NOT NULL,
  `article_trend` tinyint(4) NOT NULL,
  `article_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `category_id`, `author_id`, `article_title`, `article_image`, `article_description`, `article_date`, `article_trend`, `article_active`) VALUES
(42, 15, 6, 'Taguig Launches Teaching Hubs ', 'article-15-1670274598.jpg', 'Each \"teaching center\" is stocked with studio equipment and staffed with a team of technical experts to provide support for instructors who are teaching live online classes. The capability of the facility allows for the creation of videos that can be used for synchronous as well as asynchronous sessions.\r\n\r\n\"We have always taken pleasure in being one step ahead in our preparations for the COVID-19 pandemic, and the school system is no exception,\" said Mayor Lino. \"We have always been one step ahead in our preparations for the COVID-19 pandemic.\" We made sure to cover everything, from the hardware to the software. No matter what the circumstances may be, we are fully aware that learning must be a constant in our lives. Even when a pandemic is occurring, we are dedicated to creating an education system that is superior, welcoming, and forward-thinking, he continued.\r\n\r\nThe local government prepared the TCU faculty and nonteaching staff for a possible migration to the virtual platform due to the COVID-19 pandemic by enrolling them in online courses offered by Skillsoft, an international online education program provider. This was done in anticipation of a possible migration to the virtual platform. TECTOC, which stands for Training and Enrichment Courses from Taguig Online Campus, was the organization that was responsible for providing this service. In addition, members of the teaching staff received training in the use of LMS for online instruction from Computer Assisted Learning Philippines.\r\n\r\n#GOTAGUIG\r\n#CICTDEPARTMENT\r\n', '2022-12-05', 1, 1),
(43, 17, 5, 'Education helps in attaining self actualization', 'article-17-1670275152.jpg', 'Education as a means toward self-realization is one of the major tenets that underpins our national ideology and guides our efforts to achieve our educational objectives. The goals of self-realization are to achieve self-confidence, self-actualization, self-sufficiency, independence, freedom, and responsibility in order to create free and responsible citizens who are able to make important contributions to the growth of mankind. This objective is intended to be accomplished by the educational system via the use of an instructional strategy. This strategy requires both instructors and students to rely on classroom teaching in order to develop an understanding of who they are as individuals. Although it is true that a lot has been accomplished via the use of this method, the fact remains that not every student is a good candidate for the educational strategy. The Nigerian learner will be able to become more self-aware as a result of the application of Plato\'s human psychology to the construction of an education for self-realization, which will make it possible for him to uncover his potentials. To what degree, then, is it possible for Plato\'s human psychology to be of assistance in the building of education that facilitates self-realization in Nigerian education? The significance of the fact that every creature have wants and that those desires, when matched with potentials and possibilities, may result in the discovery of one\'s real self lies at the heart of this study. Plato\'s human psychology, education for self-realization, and how Plato\'s human psychology may be utilized to design education for self-realization in the schooling system were all examined using the technique of philosophical analysis.', '2022-12-05', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(35) NOT NULL,
  `author_password` varchar(100) NOT NULL,
  `author_email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`, `author_password`, `author_email`) VALUES
(5, 'Ivan Christian Afan', '$2y$10$sp2GtNlWP3QZ9SdDiUm5VeDTrhx6t1s3zuCa40SRtz3rQ9TqO4h7S', 'ivanafan88@gmail.com'),
(6, 'Jessa Afan', '$2y$10$zPHnlmHh.dEGvtfELgZ4nufAXcN7K7IWxqiYkLExt.xvW.7TJCE9.', 'jessaafan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `bookmark_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`bookmark_id`, `user_id`, `article_id`) VALUES
(9, 1, 4),
(10, 2, 7),
(11, 1, 29),
(12, 2, 4),
(16, 1, 1),
(18, 1, 19),
(19, 2, 20),
(20, 4, 37),
(21, 6, 28),
(22, 6, 29),
(23, 1, 37),
(24, 1, 6),
(25, 1, 17),
(26, 1, 7),
(27, 1, 28),
(29, 8, 40),
(30, 7, 42);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) NOT NULL,
  `category_color` varchar(35) NOT NULL,
  `category_image` varchar(250) NOT NULL,
  `category_description` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_color`, `category_image`, `category_description`) VALUES
(5, 'Psychology Society', 'tag-green', 'Psychology1669819688.jpg', 'Psychology is the scientific study of mind and behavior. Psychology includes the study of conscious and unconscious phenomena, including feelings and believes.'),
(6, 'CCJ', 'tag-orange', 'CCJ1669819984.jpg', 'The College of Criminal Justice Education (CCJE) fosters high concepts of citizenry and leadership by instilling in its students an understanding of the Constitutional guarantees, due process of law, and respect for human rights.'),
(15, 'CICT', 'tag-purple', 'CICT1669820115.png', 'The College of Information and Communications Technology (CICT) serves as a gateway for students eying dynamic careers in the world of Information Technology.'),
(16, 'COE', 'tag-orange', 'COE1669866045.png', 'Engineering college means a school, college, university, department of a university or other educational institution, reputable and in good standing in accordance with rules prescribed by the Department, and which grants baccalaureate degrees in engineering.'),
(17, 'CED', 'tag-brown', 'CED1669866566.png', 'The College of Education offers high quality professional education programs for the initial and advanced preparation of teachers to become effective professor.'),
(18, 'CHTM', 'tag-yellow', 'CHTM1669868319.png', 'Hospitality Management is a ladderized program that prepares students to have employable skills/competencies at every academic year level for them to be competitive in the hospitality industry locally and globally. This also prepares the students to be entrepreneurs.'),
(19, 'CBM', 'tag-blue', 'CBM1669868762.png', 'It seeks to provide its students business and management training in order to develop world-trained leaders in business and administrative fields.'),
(20, 'CAS', 'tag-green', 'CAS1669868868.png', 'A liberal arts and sciences education emphasizes a well-rounded course of study in the humanities and natural, mathematical and social sciences that aims to impart a broad general knowledge and develop intellectual capacities adaptable for numerous work and life environments.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(35) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(7, 'Ivan Christian Afan', 'ivanafan88@gmail.com', '$2y$10$sp2GtNlWP3QZ9SdDiUm5VeDTrhx6t1s3zuCa40SRtz3rQ9TqO4h7S'),
(8, 'Jake Fernandez', 'jakefernandez@gmail.com', '$2y$10$pwefslvQtI6pJ7LYOY54gu.KkW4HmmJfkh7D700mDmUarCMVC4QZG'),
(9, 'Jessa Afan', 'jessaafan@gmail.com', '$2y$10$zPHnlmHh.dEGvtfELgZ4nufAXcN7K7IWxqiYkLExt.xvW.7TJCE9.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`bookmark_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
