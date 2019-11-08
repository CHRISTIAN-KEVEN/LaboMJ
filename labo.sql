-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2019 at 11:48 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labo`
--

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `created_on`, `description`, `name`, `statut_vie`, `updated_on`) VALUES
(1, '2019-10-13 05:20:38.000000', 'Used during haemogram', 'Coagulometre', b'1', '2019-10-13 05:20:38.000000'),
(2, '2019-10-13 05:23:51.000000', 'Utilisé pour faire pousser les bacteries et les champignons a des temperature favorables', 'Incubateur', b'1', '2019-10-13 05:23:51.000000');

-- --------------------------------------------------------

--
-- Table structure for table `panel`
--

CREATE TABLE `panel` (
  `id` int(11) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `panel`
--

INSERT INTO `panel` (`id`, `created_on`, `description`, `name`, `statut_vie`, `updated_on`) VALUES
(1, '2019-10-13 06:09:35.000000', NULL, 'Anaemia panel', b'1', '2019-10-13 06:09:35.000000'),
(2, '2019-10-13 06:09:35.000000', NULL, 'Coagulation Factor', b'1', '2019-10-13 06:09:35.000000');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `abnormal` bit(1) NOT NULL,
  `attached_file` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `rejected` bit(1) NOT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `valeur` int(11) NOT NULL,
  `validator_id` int(11) DEFAULT NULL,
  `inference` text DEFAULT NULL,
  `valeur_caractere` varchar(255) DEFAULT NULL,
  `valeur_numeric` int(11) DEFAULT NULL,
  `sample_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE `sample` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `lab_technician_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `sample_type_id` int(11) DEFAULT NULL,
  `requester` varchar(255) DEFAULT NULL,
 -- `requester_address` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample`
--

INSERT INTO `sample` (`id`, `created_on`, `statut_vie`, `updated_on`, `lab_technician_id`, `patient_id`, `sample_type_id`, `requester`, `note`) VALUES
(1, '2019-10-13 06:07:14.000000', b'1', '2019-10-13 06:07:14.000000', 1, 2, 2, 'Dr. Asebong Lucas', NULL),
(3, '2019-10-27 12:31:43.000000', b'1', '2019-10-27 12:31:43.000000', 1, 22, 2, 'Dr Ajeitoh Christian', NULL),
(4, '2019-10-29 13:43:01.000000', b'1', '2019-10-29 13:43:01.000000', NULL, NULL, NULL, 'Dr. Moumbain', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sample_type`
--

CREATE TABLE `sample_type` (
  `id` int(11) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample_type`
--

INSERT INTO `sample_type` (`id`, `created_on`, `name`, `statut_vie`, `updated_on`) VALUES
(1, '2019-10-13 05:26:10.000000', 'Urine', b'1', '2019-10-13 05:26:10.000000'),
(2, '2019-10-13 05:26:10.000000', 'Sang', b'1', '2019-10-13 05:26:10.000000'),
(3, '2019-10-26 21:13:15.000000', 'Prelevement de peau', b'1', '2019-10-26 21:13:15.000000'),
(4, '2019-10-26 21:13:15.000000', 'Expectoration', b'1', '2019-10-26 21:13:15.000000'),
(5, '2019-10-26 21:15:11.000000', 'Prelevement nasal', b'1', '2019-10-26 21:15:11.000000'),
(6, '2019-10-26 21:15:11.000000', 'Prelevement de gorge', b'1', '2019-10-26 21:15:11.000000'),
(7, '2019-10-26 21:16:07.000000', 'Prelevement d\'Oreille', b'1', '2019-10-26 21:16:07.000000'),
(8, '2019-10-26 21:16:07.000000', 'Pus', b'1', '2019-10-26 21:16:07.000000'),
(9, '2019-10-26 21:38:22.000000', 'Selles', b'1', '2019-10-26 21:38:22.000000'),
(10, '2019-10-26 21:38:22.000000', 'LCR', b'1', '2019-10-26 21:38:22.000000'),
(11, '2019-10-26 21:40:13.000000', 'Liquide de Ponction', b'1', '2019-10-26 21:40:13.000000'),
(12, NULL, 'Prelèvement genitaux', b'1', '2019-10-26 21:40:13.000000');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `created_on`, `description`, `name`, `statut_vie`, `updated_on`) VALUES
(3, '2019-10-23 04:58:16.000000', NULL, 'BIOCHIMIE', b'1', '2019-10-23 04:58:16.000000'),
(4, '2019-10-23 04:58:16.000000', NULL, 'SEROLOGIE', b'1', '2019-10-23 04:58:16.000000'),
(5, '2019-10-23 05:00:28.000000', NULL, 'HEMATOLOGIE', b'1', '2019-10-23 05:00:28.000000'),
(6, '2019-10-23 05:00:28.000000', NULL, 'BACTERIOLOGIE', b'1', '2019-10-23 05:00:28.000000'),
(7, '2019-10-23 05:02:04.000000', NULL, 'PARASITOLOGIE', b'1', '2019-10-23 05:02:04.000000'),
(9, '2019-10-23 05:45:23.000000', NULL, 'ELECTROPHORESE', b'1', '2019-10-23 05:45:23.000000'),
(10, '2019-10-23 05:45:23.000000', NULL, 'HORMONOLOGIE', b'1', '2019-10-23 05:45:23.000000');

-- --------------------------------------------------------

--
-- Table structure for table `sexe`
--

CREATE TABLE `sexe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sexe`
--

INSERT INTO `sexe` (`id`, `name`) VALUES
(1, 'Masculin'),
(2, 'Feminin');

-- --------------------------------------------------------

--
-- Table structure for table `sigle`
--

CREATE TABLE `sigle` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigle`
--

INSERT INTO `sigle` (`id`, `name`) VALUES
(8, 'M.'),
(9, 'Mme.'),
(10, 'Mlle'),
(11, 'Dr.'),
(12, 'Prof.'),
(13, 'Hon.'),
(14, 'S.E.');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` bigint(20) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `unit_of_measurement` varchar(255) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `created_on`, `description`, `name`, `price`, `statut_vie`, `unit_of_measurement`, `updated_on`, `section_id`) VALUES
(1, '2019-10-13 06:00:53.000000', 'Test Haemoglobin count', 'Haemoglobin', 2000, b'1', 'gm/mol', '2019-10-13 06:00:53.000000', 5),
(2, '2019-10-13 06:00:53.000000', NULL, 'Platelet count', 1000, b'1', 'cumm', '2019-10-13 06:00:53.000000', 5),
(3, '2019-10-23 05:07:46.000000', NULL, 'Sodium/Potassium', 6000, b'1', NULL, '2019-10-23 05:07:46.000000', 3),
(4, '2019-10-23 05:12:41.000000', NULL, 'Glucose', 2000, b'1', NULL, '2019-10-23 05:12:41.000000', 3),
(5, '2019-10-23 05:12:41.000000', NULL, 'Chlore', 3000, b'1', NULL, '2019-10-23 05:12:41.000000', 3),
(6, '2019-10-23 05:17:17.000000', NULL, 'Urée', 2000, b'1', NULL, '2019-10-23 05:17:17.000000', 3),
(7, '2019-10-23 05:17:17.000000', NULL, 'Créatinine', 2000, b'1', NULL, '2019-10-23 05:17:17.000000', 3),
(8, '2019-10-23 05:17:17.000000', NULL, 'Clairance Créatinine', 6000, b'1', NULL, '2019-10-23 05:17:17.000000', 3),
(9, '2019-10-23 05:17:17.000000', NULL, 'Acide urique', 2000, b'1', NULL, '2019-10-23 05:17:17.000000', 3),
(10, '2019-10-23 05:17:17.000000', NULL, 'Proteine', 2000, b'1', NULL, '2019-10-23 05:17:17.000000', 3),
(11, '2019-10-23 05:17:17.000000', NULL, 'Albumine', 3000, b'1', NULL, '2019-10-23 05:17:17.000000', 3),
(12, '2019-10-23 05:24:53.000000', NULL, 'Calcium', 4000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(13, '2019-10-23 05:24:53.000000', NULL, 'Magnésium', 4000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(14, '2019-10-23 05:24:53.000000', NULL, 'Phosphore', 3000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(15, '2019-10-23 05:24:53.000000', NULL, 'Fer', 6000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(16, '2019-10-23 05:24:53.000000', NULL, 'Cholestérol T', 2000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(17, '2019-10-23 05:24:53.000000', NULL, 'HDL Cholestérol', 4000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(18, '2019-10-23 05:24:53.000000', NULL, 'LDL Cholestérol', 4000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(19, '2019-10-23 05:24:53.000000', NULL, 'Triglycéride', 6000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(20, '2019-10-23 05:24:53.000000', NULL, 'ALAT/ASAT', 9000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(21, '2019-10-23 05:24:53.000000', NULL, 'PAL', 5000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(22, '2019-10-23 05:24:53.000000', NULL, 'Chimie urinaire', 6000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(23, '2019-10-23 05:24:53.000000', NULL, 'Créatinurie 24h', 4000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(24, '2019-10-23 05:24:53.000000', NULL, 'Ionogramme sanguin', 7000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(25, '2019-10-23 05:24:53.000000', NULL, 'Ionogramme urinaire', 8000, b'1', NULL, '2019-10-23 05:24:53.000000', 3),
(26, '2019-10-23 05:33:54.000000', NULL, 'CRP', 4000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(27, '2019-10-23 05:33:54.000000', NULL, 'ASLO', 7000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(28, '2019-10-23 05:33:54.000000', NULL, 'AgHBS', 14000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(29, '2019-10-23 05:33:54.000000', NULL, 'ACHBS', 15000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(30, '2019-10-23 05:33:54.000000', NULL, 'ACHBC', 15000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(31, '2019-10-23 05:33:54.000000', NULL, 'AgHBe', 15000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(32, '2019-10-23 05:33:54.000000', NULL, 'ACHBe', 15000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(33, '2019-10-23 05:33:54.000000', NULL, 'Chlamedia', 14000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(34, '2019-10-23 05:33:54.000000', NULL, 'Rubeole', 12000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(35, '2019-10-23 05:33:54.000000', NULL, 'Widal', 8000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(36, '2019-10-23 05:33:54.000000', NULL, 'VDRL/TPHA', 8000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(37, '2019-10-23 05:33:54.000000', NULL, 'HIV Elisa', 14000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(38, '2019-10-23 05:33:54.000000', NULL, 'HIV PTME', 1000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(39, '2019-10-23 05:33:54.000000', NULL, 'Toxoplasme', 12000, b'1', NULL, '2019-10-23 05:33:54.000000', 4),
(40, '2019-10-23 05:36:10.000000', NULL, 'Facteur Rhumatoide', 0, b'1', NULL, '2019-10-23 05:36:10.000000', 4),
(41, '2019-10-23 05:36:10.000000', NULL, 'AC anti-HCV', 0, b'1', NULL, '2019-10-23 05:36:10.000000', 4),
(44, '2019-10-23 05:42:50.000000', NULL, 'HSV I (IgM + IgG)', 0, b'1', NULL, '2019-10-23 05:42:50.000000', 4),
(45, '2019-10-23 05:42:50.000000', NULL, 'HSV II (IgM + IgG)', 0, b'1', NULL, '2019-10-23 05:42:50.000000', 4),
(46, '2019-10-23 05:49:47.000000', NULL, 'ECBH+A+B', 12000, b'1', NULL, '2019-10-23 05:49:47.000000', 6),
(47, '2019-10-23 05:49:47.000000', NULL, 'Hémoculture +A+B', 14000, b'1', NULL, '2019-10-23 05:49:47.000000', 6),
(48, '2019-10-23 05:53:55.000000', NULL, 'Coproculture + ATB', 14000, b'1', NULL, '2019-10-23 05:53:55.000000', 6),
(49, '2019-10-23 05:53:55.000000', NULL, 'PCV + ATB', 14000, b'1', NULL, '2019-10-23 05:53:55.000000', 6),
(50, '2019-10-23 05:53:55.000000', NULL, 'PU + ATB', 14000, b'1', NULL, '2019-10-23 05:53:55.000000', 6),
(51, '2019-10-23 05:53:55.000000', NULL, 'Spermoculture + ATB', 14000, b'1', NULL, '2019-10-23 05:53:55.000000', 6),
(52, '2019-10-23 05:53:55.000000', NULL, 'Chlamedia Direct', 14000, b'1', NULL, '2019-10-23 05:53:55.000000', 6),
(53, '2019-10-23 05:53:55.000000', NULL, 'Mycoplasme + ATB', 14000, b'1', NULL, '2019-10-23 05:53:55.000000', 6),
(54, '2019-10-23 05:59:37.000000', NULL, 'pus + ATB', 0, b'1', NULL, '2019-10-23 05:59:37.000000', 6),
(55, '2019-10-23 05:59:37.000000', NULL, 'Prélèvement de gorge + ATB', 0, b'1', NULL, '2019-10-23 05:59:37.000000', 6),
(56, '2019-10-23 05:59:37.000000', NULL, 'LCR + ATB + CHIMIE', 0, b'1', NULL, '2019-10-23 05:59:37.000000', 6),
(57, '2019-10-23 05:59:37.000000', NULL, 'Expectoration + ATB', 0, b'1', NULL, '2019-10-23 05:59:37.000000', 6),
(58, '2019-10-23 05:59:37.000000', NULL, 'Liquide ponction + ATB', 0, b'1', NULL, '2019-10-23 05:59:37.000000', 6),
(59, '2019-10-23 05:59:37.000000', NULL, 'Squame + ATF', 0, b'1', NULL, '2019-10-23 05:59:37.000000', 6),
(60, '2019-10-23 06:01:43.000000', NULL, 'TCA', 4000, b'1', NULL, '2019-10-23 06:01:43.000000', 5),
(61, '2019-10-23 06:01:43.000000', NULL, 'TQ', 2000, b'1', NULL, '2019-10-23 06:01:43.000000', 5),
(62, '2019-10-23 06:06:32.000000', NULL, 'Temps de saignement (TS)', 2000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(63, '2019-10-23 06:06:32.000000', NULL, 'VS', 2000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(64, '2019-10-23 06:06:32.000000', NULL, 'Groupe sanguin Rhesus', 4000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(65, '2019-10-23 06:06:32.000000', NULL, 'Cross match', 8000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(66, '2019-10-23 06:06:32.000000', NULL, 'Coombs direct', 4000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(67, '2019-10-23 06:06:32.000000', NULL, 'Coombs indirect', 6000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(68, '2019-10-23 06:06:32.000000', NULL, 'Facteur coagulation', 8000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(69, '2019-10-23 06:06:32.000000', NULL, 'D-Dimère', 6000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(70, '2019-10-23 06:06:32.000000', NULL, 'NFS', 6000, b'1', NULL, '2019-10-23 06:06:32.000000', 5),
(71, '2019-10-23 06:08:22.000000', NULL, 'Dosage fibrinogène', 0, b'1', NULL, '2019-10-23 06:08:22.000000', 5),
(72, '2019-10-23 06:08:22.000000', NULL, 'TC (Temps Coagulation)', 0, b'1', NULL, '2019-10-23 06:08:22.000000', 5),
(73, '2019-10-23 06:10:37.000000', NULL, 'Hémoparasite', 4000, b'1', NULL, '2019-10-23 06:10:37.000000', 7),
(74, '2019-10-23 06:10:37.000000', NULL, 'Uroparasite', 4000, b'1', NULL, '2019-10-23 06:10:37.000000', 7),
(75, '2019-10-23 06:15:31.000000', NULL, 'Copnologie parasitaire', 8000, b'1', NULL, '2019-10-23 06:15:31.000000', 7),
(76, '2019-10-23 06:15:31.000000', NULL, 'Recherche de sang/selles', 3000, b'1', NULL, '2019-10-23 06:15:31.000000', 7),
(77, '2019-10-23 06:15:31.000000', NULL, 'Spermogramme', 14000, b'1', NULL, '2019-10-23 06:15:31.000000', 7),
(78, '2019-10-23 06:15:31.000000', NULL, 'Scotch test', 2000, b'1', NULL, '2019-10-23 06:15:31.000000', 7),
(79, '2019-10-23 06:15:31.000000', NULL, 'Skin test', 4000, b'1', NULL, '2019-10-23 06:15:31.000000', 7),
(80, '2019-10-23 06:20:12.000000', NULL, 'Electro hemoglobine', 0, b'1', NULL, '2019-10-23 06:20:12.000000', 9),
(81, '2019-10-23 06:20:12.000000', NULL, 'Electro protéines', 0, b'1', NULL, '2019-10-23 06:20:12.000000', 9),
(82, '2019-10-23 06:22:19.000000', NULL, 'Electro lipides', 0, b'1', NULL, '2019-10-23 06:22:19.000000', 9),
(83, '2019-10-23 06:22:19.000000', NULL, 'Test d\'emmel', 0, b'1', NULL, '2019-10-23 06:22:19.000000', 9),
(84, '2019-10-23 06:24:07.000000', NULL, 'Test de grossesse', 0, b'1', NULL, '2019-10-23 06:24:07.000000', 10),
(85, '2019-10-23 06:24:07.000000', NULL, 'Beta HCG quantitatif', 0, b'1', NULL, '2019-10-23 06:24:07.000000', 10),
(86, '2019-10-23 06:26:35.000000', NULL, 'Testostérone', 0, b'1', NULL, '2019-10-23 06:26:35.000000', 10),
(87, '2019-10-23 06:26:35.000000', NULL, 'Prolactine', 0, b'1', NULL, '2019-10-23 06:26:35.000000', 10),
(88, '2019-10-23 06:26:35.000000', NULL, 'Progesterone', 0, b'1', NULL, '2019-10-23 06:26:35.000000', 10),
(89, '2019-10-23 06:26:35.000000', NULL, 'Oestradiol', 0, b'1', NULL, '2019-10-23 06:26:35.000000', 10),
(90, '2019-10-23 06:29:10.000000', NULL, 'LH', 0, b'1', NULL, '2019-10-23 06:29:10.000000', 10),
(91, '2019-10-23 06:29:10.000000', NULL, 'FSH', 0, b'1', NULL, '2019-10-23 06:29:10.000000', 10),
(92, '2019-10-23 06:29:10.000000', NULL, 'TSH', 0, b'1', NULL, '2019-10-23 06:29:10.000000', 10),
(93, '2019-10-23 06:29:10.000000', NULL, 'T3', 0, b'1', NULL, '2019-10-23 06:29:10.000000', 10),
(94, '2019-10-23 06:29:10.000000', NULL, 'T4', 0, b'1', NULL, '2019-10-23 06:29:10.000000', 10),
(95, '2019-10-23 06:33:32.000000', NULL, 'Fer sérique', 0, b'1', NULL, '2019-10-23 06:33:32.000000', 5),
(96, '2019-10-23 06:33:32.000000', NULL, 'Lipides totaux', 0, b'1', NULL, '2019-10-23 06:33:32.000000', 5),
(97, '2019-10-23 06:39:17.000000', NULL, 'Hémoglobine glyquée', 0, b'1', NULL, '2019-10-23 06:39:17.000000', 5),
(98, '2019-10-23 06:39:17.000000', NULL, 'Hyper glycomie provoquée par voie orale (HGPO)', 0, b'1', NULL, '2019-10-23 06:39:17.000000', 5),
(99, '2019-10-23 06:39:17.000000', NULL, 'Ionogramme simple (Na+, K+, Cl-)', 0, b'1', NULL, '2019-10-23 06:39:17.000000', 5),
(100, '2019-10-23 06:39:17.000000', NULL, 'Protéines totales', 0, b'1', NULL, '2019-10-23 06:39:17.000000', 5),
(101, '2019-10-23 06:39:17.000000', NULL, 'Corps cétonique', 0, b'1', NULL, '2019-10-23 06:39:17.000000', 5),
(102, '2019-10-23 06:39:17.000000', NULL, 'Test de grossesse (HCG)', 0, b'1', NULL, '2019-10-23 06:39:17.000000', 5),
(103, '2019-10-23 06:51:26.000000', NULL, 'Gamma GT', 0, b'1', NULL, '2019-10-23 06:51:26.000000', 5),
(104, '2019-10-23 06:51:26.000000', NULL, 'CPK', 0, b'1', NULL, '2019-10-23 06:51:26.000000', 5),
(105, '2019-10-23 06:51:26.000000', NULL, 'G6PD', 0, b'1', NULL, '2019-10-23 06:51:26.000000', 5);

-- --------------------------------------------------------

--
-- Table structure for table `test_effectue`
--

CREATE TABLE `test_effectue` (
  `created_on` datetime(6) DEFAULT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `sample_id` bigint(20) NOT NULL,
  `test_id` bigint(20) NOT NULL,
  `device_used_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_effectue`
--

INSERT INTO `test_effectue` (`created_on`, `statut_vie`, `updated_on`, `sample_id`, `test_id`, `device_used_id`) VALUES
('2019-10-23 13:30:50.000000', b'1', '2019-10-23 13:30:50.000000', 1, 1, 1),
('2019-10-23 14:46:43.000000', b'1', '2019-10-23 14:46:43.000000', 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `test_panels`
--

CREATE TABLE `test_panels` (
  `tests_id` bigint(20) NOT NULL,
  `panels_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_sample_types`
--

CREATE TABLE `test_sample_types` (
  `tests_that_can_be_conducted_id` bigint(20) NOT NULL,
  `sample_types_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_sample_types`
--

INSERT INTO `test_sample_types` (`tests_that_can_be_conducted_id`, `sample_types_id`) VALUES
(6, 2),
(7, 2),
(9, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(25, 1),
(27, 2),
(36, 2),
(37, 2),
(38, 2),
(40, 2),
(47, 2),
(48, 9),
(49, 12),
(50, 12),
(53, 12),
(55, 6),
(56, 10),
(57, 4),
(58, 11),
(60, 2),
(62, 2),
(63, 2),
(65, 2),
(66, 2),
(67, 2),
(69, 2),
(70, 2),
(71, 2),
(74, 1),
(75, 9),
(77, 12),
(81, 2),
(87, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(98, 2),
(104, 2),
(105, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code_utilisateur` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `date_of_birth` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `id_card_no` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `sigle_id` int(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_type`, `id`, `address`, `code_utilisateur`, `created_on`, `date_of_birth`, `email`, `first_name`, `id_card_no`, `last_name`, `nationality`, `password`, `phone`, `picture`, `statut_vie`, `updated_on`, `roles`, `salary`, `sigle_id`, `sex_id`) VALUES
('employee', 1, 'Checkpoint, Buea', 'MJ1', '2019-10-13 05:53:37.000000', '1995-08-30 00:00:00.000000', 'christiankeven326@gmail.com', 'AJEITOH', '1176724952', 'CHRISTIAN', 'Cameroonian', 'chris12345', '678491482', NULL, b'1', '2019-10-13 05:53:37.000000', 'ADMIN', 300000, 8, 1),
('patient', 2, 'Checkpoint, Buea', 'MJ2', '2019-10-13 05:53:37.000000', '1991-05-22 00:00:00.000000', NULL, 'EKWANTI', '1111111111', 'YANICK ASHURUFANG', 'Cameroonian', 'yannick17', '671687161', NULL, b'1', '2019-10-13 05:53:37.000000', NULL, NULL, 9, 1),
('patient', 20, 'Picasso, village - Douala', 'MJ20', '2019-10-26 19:48:49.000000', '1979-12-12 00:00:00.000000', '', 'Wandji', '', 'Jahdomine', 'Camerounaise', NULL, '656241600', NULL, b'1', '2019-10-26 19:49:11.000000', NULL, NULL, 10, 2),
('patient', 21, 'Ndobong-Douala', 'MJ21', '2019-10-26 20:23:34.000000', '1983-09-09 00:00:00.000000', 'paulwamba14@gmail.com', 'Wamba', '1178694321', 'Paul', 'Camerounaise', NULL, '678904351', NULL, b'1', '2019-10-26 20:23:35.000000', NULL, NULL, 8, 1),
('patient', 22, 'Picasso, village - Douala', 'MJ22', '2019-10-27 12:26:58.000000', '2005-10-27 00:00:00.000000', 'moungangmichel@gmail.com', 'Moungang Mbiabo', '', 'Michel Andre', 'Française', NULL, '678378519', NULL, b'1', '2019-10-27 12:26:58.000000', NULL, NULL, 8, 1),
('patient', 23, 'Yassa-Douala', 'MJ23', '2019-10-29 13:12:45.000000', '1998-12-21 00:00:00.000000', '', 'Jean', '', 'Paul', 'Camerounaise', NULL, '67777890', NULL, b'1', '2019-10-29 13:12:45.000000', NULL, NULL, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `valeurs_de_reference`
--

CREATE TABLE `valeurs_de_reference` (
  `id` int(11) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `max_age` double DEFAULT NULL,
  `min_age` double DEFAULT NULL,
  `normal_high` int(11) DEFAULT NULL,
  `normal_low` int(11) DEFAULT NULL,
  `statut_vie` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `valid_high` int(11) DEFAULT NULL,
  `valid_low` int(11) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `test_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `valeurs_de_reference`
--

INSERT INTO `valeurs_de_reference` (`id`, `created_on`, `gender`, `max_age`, `min_age`, `normal_high`, `normal_low`, `statut_vie`, `updated_on`, `valid_high`, `valid_low`, `value_type`, `test_id`) VALUES
(1, '2019-10-13 06:05:25.000000', 'FEMALE', 300, 0, 300000, 100000, b'1', '2019-10-13 06:05:25.000000', 350000, 75000, 'Numeric', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel`
--
ALTER TABLE `panel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe9sd71mh7rbplun9xi38wmh5s` (`validator_id`),
  ADD KEY `FKqbsofayp40a5cw34s7q61ojk9` (`sample_id`);

--
-- Indexes for table `sample`
--
ALTER TABLE `sample`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn8uq1yo8i102264uwxjd3tkf1` (`lab_technician_id`),
  ADD KEY `FKsndj39fu5rn6hw1xwmoskn9ob` (`patient_id`),
  ADD KEY `FKpn1l2n3ch1y8o40rad7yymn0p` (`sample_type_id`);

--
-- Indexes for table `sample_type`
--
ALTER TABLE `sample_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sexe`
--
ALTER TABLE `sexe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sigle`
--
ALTER TABLE `sigle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_78vbj789bmlibs0oqt7tvn66i` (`name`),
  ADD KEY `FKlr83btx6fy4tst6uwlix2eguj` (`section_id`);

--
-- Indexes for table `test_effectue`
--
ALTER TABLE `test_effectue`
  ADD PRIMARY KEY (`sample_id`,`test_id`),
  ADD KEY `FKmftl8epew5cl226n1my0bho4b` (`device_used_id`),
  ADD KEY `FKscivxuyvqlcp4757tgdcynciw` (`test_id`);

--
-- Indexes for table `test_panels`
--
ALTER TABLE `test_panels`
  ADD KEY `FK1jrurc7kjo107rioy253twyu1` (`panels_id`),
  ADD KEY `FKj0gufr34ps54f2cyl5raaww4q` (`tests_id`);

--
-- Indexes for table `test_sample_types`
--
ALTER TABLE `test_sample_types`
  ADD UNIQUE KEY `tests_that_can_be_conducted_id` (`tests_that_can_be_conducted_id`,`sample_types_id`),
  ADD KEY `FK18fj1g9dnuh249ucb0ah7th6f` (`sample_types_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoj2rm7kpif3lnnc8gljo79t1v` (`sigle_id`),
  ADD KEY `FKlt7jknbs860ykhsiwhch4fon7` (`sex_id`);

--
-- Indexes for table `valeurs_de_reference`
--
ALTER TABLE `valeurs_de_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkcgoufhtel0rjhu5k26igasst` (`test_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `panel`
--
ALTER TABLE `panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sample`
--
ALTER TABLE `sample`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sample_type`
--
ALTER TABLE `sample_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sexe`
--
ALTER TABLE `sexe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sigle`
--
ALTER TABLE `sigle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `valeurs_de_reference`
--
ALTER TABLE `valeurs_de_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `FKe9sd71mh7rbplun9xi38wmh5s` FOREIGN KEY (`validator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKqbsofayp40a5cw34s7q61ojk9` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`);

--
-- Constraints for table `sample`
--
ALTER TABLE `sample`
  ADD CONSTRAINT `FKn8uq1yo8i102264uwxjd3tkf1` FOREIGN KEY (`lab_technician_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKpn1l2n3ch1y8o40rad7yymn0p` FOREIGN KEY (`sample_type_id`) REFERENCES `sample_type` (`id`),
  ADD CONSTRAINT `FKsndj39fu5rn6hw1xwmoskn9ob` FOREIGN KEY (`patient_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `FKlr83btx6fy4tst6uwlix2eguj` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`);

--
-- Constraints for table `test_effectue`
--
ALTER TABLE `test_effectue`
  ADD CONSTRAINT `FKmftl8epew5cl226n1my0bho4b` FOREIGN KEY (`device_used_id`) REFERENCES `device` (`id`),
  ADD CONSTRAINT `FKscivxuyvqlcp4757tgdcynciw` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`),
  ADD CONSTRAINT `FKtgk1atgflqwsdhmjsb6cegnef` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`);

--
-- Constraints for table `test_panels`
--
ALTER TABLE `test_panels`
  ADD CONSTRAINT `FK1jrurc7kjo107rioy253twyu1` FOREIGN KEY (`panels_id`) REFERENCES `panel` (`id`),
  ADD CONSTRAINT `FKj0gufr34ps54f2cyl5raaww4q` FOREIGN KEY (`tests_id`) REFERENCES `test` (`id`);

--
-- Constraints for table `test_sample_types`
--
ALTER TABLE `test_sample_types`
  ADD CONSTRAINT `FK18fj1g9dnuh249ucb0ah7th6f` FOREIGN KEY (`sample_types_id`) REFERENCES `sample_type` (`id`),
  ADD CONSTRAINT `FKhljv11r216yehnbm7jdayeabx` FOREIGN KEY (`tests_that_can_be_conducted_id`) REFERENCES `test` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKlt7jknbs860ykhsiwhch4fon7` FOREIGN KEY (`sex_id`) REFERENCES `sexe` (`id`),
  ADD CONSTRAINT `FKoj2rm7kpif3lnnc8gljo79t1v` FOREIGN KEY (`sigle_id`) REFERENCES `sigle` (`id`);

--
-- Constraints for table `valeurs_de_reference`
--
ALTER TABLE `valeurs_de_reference`
  ADD CONSTRAINT `FKkcgoufhtel0rjhu5k26igasst` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
