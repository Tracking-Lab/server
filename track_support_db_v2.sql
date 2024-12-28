-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql5050.site4now.net
-- Generation Time: Oct 22, 2024 at 01:32 AM
-- Server version: 8.0.37
-- PHP Version: 8.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_a7d22a_support`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto_assign_setting`
--

CREATE TABLE `auto_assign_setting` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `time` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auto_assign_setting`
--

INSERT INTO `auto_assign_setting` (`id`, `user_id`, `time`, `created`) VALUES
(1, 2, 1, '2024-09-16 15:38:51');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  `auto_replay` text,
  `is_deleted` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `name`, `type`, `auto_replay`, `is_deleted`, `created`, `updated`) VALUES
(1, 'WB(0555315999)', 'WB', 'عزيزي العميل مرحباً بك في \\nTracking Maps\\nخدمة تتبع المركبات AVL\\n تفضل كيف يمكنني تقديم الخدمة.', 0, '2024-09-23 08:08:40', '2024-09-23 08:08:40'),
(2, 'WB(0555086030)', 'WB', 'عزيزي العميل مرحباً بك في \\nTracking Maps\\nخدمة تتبع المركبات AVL\\n تفضل كيف يمكنني تقديم الخدمة.', 0, '2024-10-19 19:46:46', '2024-10-19 19:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `group_id` int DEFAULT '1',
  `contact_import_id` int DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `phone`, `email`, `group_id`, `contact_import_id`, `created`) VALUES
(1, 'mohamed ahmed', '249123342124', NULL, 1, NULL, '2024-05-09 09:20:34'),
(2, 'yasir', '249123342120', NULL, 1, NULL, '2024-05-09 09:34:53'),
(3, NULL, '249927473106', NULL, 1, NULL, '2024-05-16 01:55:11'),
(4, 'عبدالملك عثمان', '966556824160', 'avl@trackingmaps.sa', 1, NULL, '2024-05-16 03:17:53'),
(5, 'عبدالملك', '966552168008', 'mlik.osman94@gmail.com', 1, NULL, '2024-09-03 21:34:49'),
(6, 'المحاسب المالي', '966555090160', NULL, 1, NULL, '2024-09-04 00:45:27'),
(7, '966112892999', '966112892999', NULL, 1, NULL, '2024-09-04 02:42:47'),
(8, NULL, '966555018868', NULL, 1, NULL, '2024-09-05 02:22:24'),
(9, '.', '966554355586', NULL, 1, NULL, '2024-09-05 04:20:42'),
(10, '966920031726', '966920031726', NULL, 1, NULL, '2024-09-06 04:05:54'),
(11, '𝒎𝒂𝒉𝒎𝒐𝒖𝒅 A 𝒊𝒃𝒏𝒐𝒖𝒇', '966509249009', NULL, 1, NULL, '2024-09-08 02:36:10'),
(12, 'nedal osman', '966575592716', NULL, 1, NULL, '2024-09-08 05:44:03'),
(13, 'MD Shalom', '966509722556', NULL, 1, NULL, '2024-09-09 05:56:00'),
(14, '966920013711', '966920013711', NULL, 1, NULL, '2024-09-11 03:07:17'),
(15, 'Office Tamken', '966553699355', NULL, 1, NULL, '2024-09-12 02:00:20'),
(16, '..', '966578015545', NULL, 1, NULL, '2024-09-12 10:13:08'),
(17, '.', '966501674927', NULL, 1, NULL, '2024-09-12 11:31:37'),
(18, '966920027707', '966920027707', NULL, 1, NULL, '2024-09-13 03:25:54'),
(19, NULL, '966555055425', NULL, 1, NULL, '2024-09-15 23:22:19'),
(20, 'Abdullah Alothman', '966555055425', NULL, 1, NULL, '2024-09-15 23:22:39'),
(21, 'Tazeen Al Zain', '971527956224', NULL, 1, NULL, '2024-09-16 19:04:08'),
(22, '966920017070', '966920017070', NULL, 1, NULL, '2024-09-22 15:14:13'),
(23, '966920009377', '966920009377', NULL, 1, NULL, '2024-09-24 10:46:49'),
(24, '.', '966559752282', NULL, 1, NULL, '2024-09-25 10:36:13'),
(25, 'محمد', '966544770775', NULL, 1, NULL, '2024-09-29 07:39:28'),
(26, 'قسم الاتصال المؤسسي', '966503640444', NULL, 1, NULL, '2024-09-30 07:20:09'),
(27, 'خاص', '966560054494', NULL, 1, NULL, '2024-10-01 07:43:19'),
(28, 'عبدالله سالم', '966598131984', NULL, 1, NULL, '2024-10-01 13:32:25'),
(29, '9668001169999', '9668001169999', NULL, 1, NULL, '2024-10-03 15:40:47'),
(30, 'ابو وليد', '966504882965', NULL, 1, NULL, '2024-10-03 19:03:01'),
(31, 'حمد بسطاوي', '966537814554', NULL, 1, NULL, '2024-10-03 19:45:23'),
(32, 'مضاوي ANB', '966564368588', NULL, 1, NULL, '2024-10-06 14:44:23'),
(33, 'شركة القرعاوى لقطع غيار تويوتا الاصلية', '966553234111', NULL, 1, NULL, '2024-10-07 14:46:40'),
(34, 'Ghada', '966544443767', NULL, 1, NULL, '2024-10-13 10:29:40'),
(35, 'مشعل', '966558854894', NULL, 1, NULL, '2024-10-17 07:39:54'),
(36, 'Ruban R', '966500417638', NULL, 1, NULL, '2024-10-20 06:32:05'),
(37, '966551303515', '966551303515', NULL, 1, NULL, '2024-10-20 15:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `contacts_imports`
--

CREATE TABLE `contacts_imports` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `contacts_count` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_notes`
--

CREATE TABLE `contact_notes` (
  `id` int NOT NULL,
  `contact_id` int NOT NULL,
  `user_id` int NOT NULL,
  `note` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact_notes`
--

INSERT INTO `contact_notes` (`id`, `contact_id`, `user_id`, `note`, `created`) VALUES
(1, 5, 4, 'تجربة النظام ', '2024-09-15 16:12:04'),
(2, 4, 2, 'عميل مميز', '2024-09-15 20:28:32'),
(3, 5, 2, 'مميز', '2024-09-15 20:29:56'),
(4, 5, 2, 'تم التركيب', '2024-09-21 18:30:03'),
(5, 5, 2, 'اسم المستخدم : 0556824160', '2024-09-21 18:30:19'),
(6, 5, 2, 'لديه موعد يوم 30 -09-2024', '2024-09-21 18:30:37');

-- --------------------------------------------------------

--
-- Table structure for table `email_channels`
--

CREATE TABLE `email_channels` (
  `id` int NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `inbox_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `inbox_id`, `user_id`) VALUES
(1, 2, 2),
(2, 24, 2),
(3, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_default` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `is_default`, `created`) VALUES
(1, 'الكل', 1, '2024-09-23 08:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `inboxes`
--

CREATE TABLE `inboxes` (
  `id` int NOT NULL,
  `channel_id` int NOT NULL,
  `contact_id` int NOT NULL,
  `assigned` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `result` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inboxes`
--

INSERT INTO `inboxes` (`id`, `channel_id`, `contact_id`, `assigned`, `status`, `result`, `created`, `updated`) VALUES
(1, 1, 1, 0, 2, 'تم معالجة الطلب', '2024-09-15 18:48:01', '2024-09-17 13:18:16'),
(2, 1, 5, 1, 1, 'تم معالجة الطلب', '2024-09-15 18:57:37', '2024-09-25 14:30:54'),
(3, 1, 4, 0, 2, 'تم معالجة الطلب', '2024-09-15 20:19:18', '2024-10-21 08:01:17'),
(4, 1, 19, 0, 2, 'تم معالجة الطلب', '2024-09-15 23:22:19', '2024-09-15 23:55:44'),
(5, 1, 20, 0, 2, 'تم معالجة الطلب', '2024-09-15 23:22:40', '2024-09-15 23:26:52'),
(6, 1, 21, 0, 2, 'تم معالجة الطلب', '2024-09-16 19:04:08', '2024-09-17 13:10:55'),
(7, 1, 8, 1, 1, 'تم معالجة الطلب', '2024-09-16 21:47:12', '2024-10-22 08:27:24'),
(8, 1, 22, 0, 2, 'تم معالجة الطلب', '2024-09-22 15:14:13', '2024-09-22 17:23:28'),
(9, 1, 23, 0, 2, 'تم معالجة الطلب', '2024-09-24 10:46:49', '2024-09-24 11:04:30'),
(10, 1, 24, 1, 1, NULL, '2024-09-25 10:36:13', '2024-10-15 09:40:33'),
(11, 1, 25, 0, 2, 'تم معالجة الطلب', '2024-09-29 07:39:28', '2024-10-16 13:15:29'),
(12, 1, 26, 0, 2, 'تم معالجة الطلب', '2024-09-30 07:20:09', '2024-10-21 08:04:40'),
(13, 1, 27, 1, 1, NULL, '2024-10-01 07:43:20', '2024-10-15 09:04:19'),
(14, 1, 28, 0, 2, 'تم معالجة الطلب', '2024-10-01 13:32:25', '2024-10-21 07:34:21'),
(15, 1, 18, 0, 2, 'تم معالجة الطلب', '2024-10-02 13:14:40', '2024-10-21 08:02:03'),
(16, 1, 29, 0, 2, 'تم تحويل الطلب', '2024-10-03 15:40:47', '2024-10-21 07:33:59'),
(17, 1, 30, 0, 2, 'تم معالجة الطلب', '2024-10-03 19:03:01', '2024-10-17 14:37:20'),
(18, 1, 31, 0, 2, 'تم معالجة الطلب', '2024-10-03 19:45:23', '2024-10-21 08:02:35'),
(19, 1, 10, 0, 2, 'تم معالجة الطلب', '2024-10-04 13:53:55', '2024-10-21 08:01:03'),
(20, 1, 32, 0, 2, 'تم تحويل الطلب', '2024-10-06 14:44:23', '2024-10-21 07:32:59'),
(21, 1, 33, 0, 2, 'تم تحويل الطلب', '2024-10-07 14:46:40', '2024-10-21 07:33:33'),
(22, 1, 34, 0, 2, 'تم تحويل الطلب', '2024-10-13 10:29:40', '2024-10-21 07:32:35'),
(23, 1, 35, 0, 2, 'تم تحويل الطلب', '2024-10-17 07:39:54', '2024-10-17 13:30:29'),
(24, 1, 36, 1, 1, NULL, '2024-10-20 06:32:05', '2024-10-21 07:31:54'),
(25, 1, 37, 0, 2, 'تم معالجة الطلب', '2024-10-20 15:52:04', '2024-10-21 07:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `inbox_assigned_user`
--

CREATE TABLE `inbox_assigned_user` (
  `id` int NOT NULL,
  `inbox_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inbox_assigned_user`
--

INSERT INTO `inbox_assigned_user` (`id`, `inbox_id`, `user_id`, `status`, `created`) VALUES
(1, 1, 2, 1, '2024-09-15 18:48:58'),
(2, 2, 1, 0, '2024-09-15 18:57:37'),
(3, 3, 2, 1, '2024-09-15 20:19:58'),
(4, 4, 4, 1, '2024-09-15 23:22:19'),
(5, 5, 4, 1, '2024-09-15 23:23:11'),
(6, 6, 2, 1, '2024-09-16 20:51:55'),
(7, 7, 2, 0, '2024-09-16 21:47:12'),
(8, 8, 2, 1, '2024-09-22 16:27:54'),
(9, 9, 2, 1, '2024-09-24 11:02:17'),
(10, 11, 4, 1, '2024-09-29 14:02:20'),
(11, 22, 2, 1, '2024-10-15 06:57:19'),
(12, 21, 2, 1, '2024-10-15 06:58:17'),
(13, 20, 2, 1, '2024-10-15 06:58:28'),
(15, 17, 2, 1, '2024-10-15 07:00:58'),
(16, 18, 2, 1, '2024-10-15 07:03:09'),
(17, 19, 2, 1, '2024-10-15 07:31:13'),
(18, 16, 2, 1, '2024-10-15 07:40:27'),
(19, 14, 2, 1, '2024-10-15 07:48:44'),
(20, 15, 2, 1, '2024-10-15 07:48:53'),
(21, 13, 1, 0, '2024-10-15 09:04:19'),
(22, 12, 1, 1, '2024-10-15 09:39:26'),
(23, 10, 1, 0, '2024-10-15 09:40:33'),
(24, 23, 2, 1, '2024-10-17 08:43:11'),
(25, 24, 2, 0, '2024-10-20 06:32:05'),
(26, 25, 2, 1, '2024-10-21 06:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `inbox_labels`
--

CREATE TABLE `inbox_labels` (
  `id` int NOT NULL,
  `inbox_id` int NOT NULL,
  `label_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inbox_labels`
--

INSERT INTO `inbox_labels` (`id`, `inbox_id`, `label_id`, `created`) VALUES
(1, 2, 1, '2024-09-15 19:24:23'),
(2, 2, 2, '2024-09-15 19:24:26'),
(3, 3, 3, '2024-09-15 20:21:33'),
(4, 1, 3, '2024-09-15 20:24:26'),
(5, 5, 3, '2024-09-15 23:25:15'),
(6, 4, 3, '2024-09-15 23:55:28'),
(7, 6, 3, '2024-09-16 20:54:16'),
(9, 8, 3, '2024-09-22 17:23:20'),
(10, 9, 3, '2024-09-24 11:03:27'),
(11, 11, 1, '2024-10-16 13:15:22'),
(12, 23, 1, '2024-10-17 13:30:23'),
(13, 17, 1, '2024-10-17 14:37:04'),
(14, 7, 2, '2024-10-20 12:35:52'),
(15, 25, 2, '2024-10-21 07:30:15'),
(16, 22, 1, '2024-10-21 07:32:22'),
(17, 20, 1, '2024-10-21 07:32:45'),
(18, 21, 1, '2024-10-21 07:33:24'),
(19, 16, 1, '2024-10-21 07:33:53'),
(20, 14, 2, '2024-10-21 07:34:16'),
(23, 19, 1, '2024-10-21 08:00:49'),
(25, 15, 1, '2024-10-21 08:01:58'),
(26, 18, 1, '2024-10-21 08:02:16'),
(27, 12, 1, '2024-10-21 08:04:35'),
(31, 1, 1, '2024-10-21 10:28:40');

-- --------------------------------------------------------

--
-- Table structure for table `inbox_results`
--

CREATE TABLE `inbox_results` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inbox_results`
--

INSERT INTO `inbox_results` (`id`, `name`) VALUES
(1, 'تم معالجة الطلب'),
(2, 'تم تحويل الطلب'),
(3, 'تأخير بالرد');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `name`, `color`, `created`) VALUES
(1, 'عميل جديد', '#327ee2', '2024-09-15 16:14:47'),
(2, 'مشكلة', '#ff0a0a', '2024-09-15 16:15:04'),
(3, 'تمت المعالجة', '#007539', '2024-09-15 16:15:17');

-- --------------------------------------------------------

--
-- Table structure for table `mentioned_inboxes`
--

CREATE TABLE `mentioned_inboxes` (
  `id` int NOT NULL,
  `mentioned_user_id` int NOT NULL,
  `user_id` int NOT NULL,
  `inbox_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mentioned_inboxes`
--

INSERT INTO `mentioned_inboxes` (`id`, `mentioned_user_id`, `user_id`, `inbox_id`, `created`) VALUES
(1, 2, 4, 2, '2024-09-15 21:21:24'),
(2, 2, 1, 10, '2024-10-15 11:14:50'),
(3, 2, 2, 10, '2024-10-15 11:14:54'),
(4, 2, 4, 10, '2024-10-15 11:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `from_phone` varchar(50) NOT NULL,
  `inbox_id` int NOT NULL,
  `message_id` varchar(100) NOT NULL,
  `timestamp` bigint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `media_link` varchar(255) DEFAULT NULL,
  `viewed` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_phone`, `inbox_id`, `message_id`, `timestamp`, `message`, `media_link`, `viewed`, `user_id`, `type`) VALUES
(1, '249123342124', 1, 'inset_id', 1726400881858, 'تم إنشاء التذكرة بواسطة mohamed ahmed', NULL, 1, NULL, 'inset_id'),
(2, '249123342124', 1, 'wamid.HBgMMjQ5MTIzMzQyMTI0FQIAEhgUM0E0NjIyQ0QyMzJENDEwMDhCREYA', 1726400881952, 'سلام عليكم', NULL, 1, NULL, 'text'),
(3, '249123342124', 1, 'wamid.HBgMMjQ5MTIzMzQyMTI0FQIAEhgUM0FGNDY2RUQ1RDQ0MTQzQ0Y3OUQA', 1726400914404, 'مرحبا', NULL, 1, NULL, 'text'),
(4, '249123342124', 1, 'inset_id', 1726400938345, 'تم التعيين لـ Mohamed Ahmed بواسطة Mohamed Ahmed', NULL, 1, 1, 'inset_id'),
(5, '249123342124', 1, 'local_id', 1726400944137, 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', NULL, 1, 1, 'template'),
(6, '249123342124', 1, 'wamid.HBgMMjQ5MTIzMzQyMTI0FQIAEhgUM0E5N0NBNUExRDUxOUE1QjBDNDAA', 1726400950000, 'التحدث لاحقا', NULL, 1, NULL, 'button'),
(7, '249123342124', 1, 'local_id', 1726401330850, 'قيمة تزويد الخدمة على السيارة الواحدة 530 ريال شاملة الضريبة باقة كاملة تشمل (جهاز تتبع مجانا + اشتراك سنة على منصة التتبع مع شريحة البيانات + التركيب والضريبة) ', NULL, 1, 1, 'text'),
(8, '966556824160', 2, 'inset_id', 1726401457835, 'تم إنشاء التذكرة بواسطة عبدالملك عثمان', NULL, 1, NULL, 'inset_id'),
(9, '966556824160', 2, 'inset_id', 1726401457883, 'تم التعيين بواسطة عبدالملك عثمان', NULL, 1, NULL, 'inset_id'),
(10, '966556824160', 2, 'local_id', 1726401457911, 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', NULL, 1, 2, 'template'),
(11, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggRDcxNUJCMUMzNTQ0OUJENUZDMzM5OEM2NDNEOTlFRDYA', 1726401471333, 'بدء المحادثة', NULL, 1, NULL, 'button'),
(12, '966556824160', 2, 'local_id', 1726401489259, 'مرحبا بك ', NULL, 1, 2, 'text'),
(13, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggOUI5NzlFQkI4QkRFNUNDNzZFNjc4OTk5NDhFQUZGNDMA', 1726401500381, 'احتاج تتبع', NULL, 1, NULL, 'text'),
(14, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggQTcwMEJEMjZGMkYzOTgwMDUzOTQwMjcwNDNCMDY1QjQA', 1726401665545, 'بكم السعر', NULL, 1, NULL, 'text'),
(15, '966555018868', 2, 'inset_id', 1726403063863, 'صنف عبدالعزيز المحيميد المحادثة بـ عميل جديد', NULL, 1, 4, 'inset_id'),
(16, '966555018868', 2, 'inset_id', 1726403066688, 'صنف عبدالعزيز المحيميد المحادثة بـ مشكلة', NULL, 1, 4, 'inset_id'),
(17, '966555018868', 2, 'inset_id', 1726403079391, 'تم الإغلاق بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(18, '249123342124', 1, 'local_id', 1726403141868, 'null', 'public/messages/1726403141846804.ogg', 1, 1, 'audio'),
(19, '249123342124', 2, 'inset_id', 1726403233557, 'تم إعادة الفتح بواسطة Mohamed Ahmed', NULL, 1, 1, 'inset_id'),
(20, '249123342124', 2, 'local_id', 1726403244256, 'null', 'public/messages/1726403244239598.ogg', 1, 1, 'audio'),
(21, '249123342124', 1, 'local_id', 1726403450754, 'null', 'public/messages/1726403450739992.ogg', 1, 1, 'audio'),
(22, '966556824160', 2, 'local_id', 1726404189471, '', 'public/messages/172640418944358.ogg', 1, 2, 'audio'),
(23, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggNkE4NEU1RUNGNjdFN0MxQzlCOTcwMzA5NkFBRjBEQjYA', 1726404398770, 'مرحبا', NULL, 1, NULL, 'text'),
(24, '966556824160', 2, 'local_id', 1726404498296, 'حياك ، تفضل ', NULL, 1, 2, 'text'),
(25, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggNUVGNkE1OTI3RjY0ODdCQ0M5RjI3ODY0NEZBRTg3NTQA', 1726404510396, 'احتاج تتبع', NULL, 1, NULL, 'text'),
(26, '966556824160', 2, 'local_id', 1726404523913, 'كمسيارة ', NULL, 1, 2, 'text'),
(27, '966556824160', 2, 'local_id', 1726404531892, 'كم سيارة ', NULL, 1, 2, 'text'),
(28, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggQ0QyNTQ4N0VFNDc4MjEwNUMzRDE3NzhDMkMyREZEM0UA', 1726404534776, 'سيارتين', NULL, 1, NULL, 'text'),
(29, '966556824160', 2, 'local_id', 1726405281937, 'قيمة تزويد الخدمة على السيارة الواحدة 530 ريال شاملة الضريبة باقة كاملة تشمل (جهاز تتبع مجانا + اشتراك سنة على منصة التتبع مع شريحة البيانات + التركيب والضريبة) ', NULL, 1, 2, 'text'),
(30, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggMUE4MThCOUNFOUM2NjY0MzUwQjczQ0RCNzcxRDQ4OUEA', 1726405316603, 'شكرا لك', NULL, 1, NULL, 'text'),
(31, '966556824160', 3, 'inset_id', 1726406358125, 'تم إنشاء التذكرة بواسطة null', NULL, 1, NULL, 'inset_id'),
(32, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNENFQTlFOTQ4OTQ1RDU0QTJGNUMzMEVEMjJDRjc1MEYA', 1726406358199, 'كم السعر', NULL, 1, NULL, 'text'),
(33, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNkZFMDM2ODA4QzIwRTU3MTI3MjY4MDU4NTU0RTJEQjEA', 1726406387687, 'احتاج جهاز بكم', NULL, 1, NULL, 'text'),
(34, '966556824160', 3, 'inset_id', 1726406398580, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(35, '966556824160', 3, 'local_id', 1726406413214, 'عليكم السلام ', NULL, 1, 2, 'text'),
(36, '966556824160', 3, 'local_id', 1726406418783, 'قيمة تزويد الخدمة على السيارة الواحدة 530 ريال شاملة الضريبة باقة كاملة تشمل (جهاز تتبع مجانا + اشتراك سنة على منصة التتبع مع شريحة البيانات + التركيب والضريبة) ', NULL, 1, 2, 'text'),
(37, '966556824160', 3, 'comment_message_id', 1726406487841, 'تمت افادة العميل ', NULL, 1, 2, 'text'),
(38, '966556824160', 3, 'inset_id', 1726406493741, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(39, '966556824160', 3, 'inset_id', 1726406503134, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(40, '966556824160', 2, 'comment_message_id', 1726406515651, 'تم معالجة الطلب ', NULL, 1, 2, 'text'),
(41, '966556824160', 2, 'inset_id', 1726406522263, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(42, '966556824160', 1, 'comment_message_id', 1726406535398, 'تم معالجة الطلب ', NULL, 1, 2, 'text'),
(43, '966556824160', 1, 'inset_id', 1726406666129, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(44, '966556824160', 1, 'inset_id', 1726406676356, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(45, '249123342124', 1, 'inset_id', 1726407332321, 'تم إعادة الفتح بواسطة Mohamed Ahmed', NULL, 1, 1, 'inset_id'),
(46, '249123342124', 1, 'local_id', 1726409308606, 'بخصوص أجهزة التتبع متوفرة عندنا أجهزة الجيل الرابع :\r\nالجهاز صغير بحجم كف اليد يتركب بشكل مخفي خلف الديكور الداخلي للمركبة وتتمدد توصيلاته على علبة الفيوزات بدون تقطيع او تجريح تفاديا لإلغاء ضمان الكهرب على المركبة, منصة التتبع تتيح لك تتبع مباشر على حركة المركبة بالاضافة الى حفظ المسارات المقطوعة لآخر 6 شهور, الجهاز يعطي مجموعة من التنبيهات والتقارير على سبيل المثال وليس الحصر (تنبيهات التشغيل والاطفاء / تنبيهات تجاوز السرعة / تنبيهات مناطق السياج / تنبيهات العبث بالكهرباء / تقارير الرحلات / تقارير استهلاك الوقود / تقارير الصيانة الدورية / تقارير وزن المركبة - خاص بالربط بالهيئة-)', NULL, 1, 1, 'text'),
(47, '966556824160', 1, 'inset_id', 1726409339888, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(48, '249123342124', 1, 'inset_id', 1726409341714, 'تم الإغلاق بواسطة Mohamed Ahmed', NULL, 1, 1, 'inset_id'),
(49, '966556824160', 2, 'inset_id', 1726409350509, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(50, '966556824160', 2, 'local_id', 1726409415644, '', 'public/messages/1726409415606114.opus', 1, 2, 'audio'),
(51, '249123342124', 1, 'inset_id', 1726409576482, 'تم إعادة الفتح بواسطة Mohamed Ahmed', NULL, 1, 1, 'inset_id'),
(52, '966556824160', 2, 'local_id', 1726409589271, 'null', 'public/messages/1726409589256142.ogg', 1, 2, 'audio'),
(53, '249123342124', 1, 'local_id', 1726409589308, 'null', 'public/messages/1726409589292420.opus', 1, 1, 'audio'),
(54, '966556824160', 2, 'local_id', 1726409646187, 'null', 'public/messages/172640964616929.opus', 1, 2, 'audio'),
(55, '966556824160', 2, 'local_id', 1726410938890, 'null', 'public/messages/1726410938872458.aac', 1, 2, 'audio'),
(56, '249123342124', 1, 'inset_id', 1726411446279, 'تم الإغلاق بواسطة Mohamed Ahmed', NULL, 1, 1, 'inset_id'),
(57, '966555018868', 4, 'inset_id', 1726417339893, 'تم إنشاء التذكرة بواسطة عبدالعزيز المحيميد', NULL, 1, NULL, 'inset_id'),
(58, '966555018868', 4, 'inset_id', 1726417339940, 'تم التعيين بواسطة عبدالعزيز المحيميد', NULL, 1, NULL, 'inset_id'),
(59, '966555018868', 4, 'local_id', 1726417339967, 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', NULL, 1, 4, 'template'),
(60, '966555055425', 5, 'inset_id', 1726417360026, 'تم إنشاء التذكرة بواسطة Abdullah Alothman', NULL, 1, NULL, 'inset_id'),
(61, '966555055425', 5, 'wamid.HBgMOTY2NTU1MDU1NDI1FQIAEhggMDY3MkM2Qzk5RjY4NDBGOUFBRjg3ODlDNjBEOUYyQzkA', 1726417360104, 'بدء المحادثة', NULL, 1, NULL, 'button'),
(62, '966555055425', 5, 'wamid.HBgMOTY2NTU1MDU1NDI1FQIAEhggODAwODk3QkMxQjhFODIwQTY4MjY4QTVEMjU3NUE3NUUA', 1726417368417, 'السلام عليكم', NULL, 1, NULL, 'text'),
(63, '966555018868', 5, 'inset_id', 1726417391738, 'تم التعيين لـ عبدالعزيز المحيميد بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(64, '966555018868', 5, 'local_id', 1726417401041, 'مرحبا', NULL, 1, 4, 'text'),
(65, '966555055425', 5, 'wamid.HBgMOTY2NTU1MDU1NDI1FQIAEhggODc5MkMyNTcxQzdCMTQxNTQ0RDQxQzA5MjlEODkwMzMA', 1726417408466, 'كيف حالك', NULL, 1, NULL, 'text'),
(66, '966555018868', 5, 'local_id', 1726417450507, 'null', 'public/messages/1726417450491149.png', 1, 4, 'image'),
(67, '966555055425', 5, 'wamid.HBgMOTY2NTU1MDU1NDI1FQIAEhggOENERTE4NTQ5OUU2NUYxRDUwMzA5QUREQjIwMjA4NjkA', 1726417496738, '', 'public/messages/513980024572957.jpeg', 1, NULL, 'image'),
(68, '966555018868', 5, 'inset_id', 1726417515403, 'صنف عبدالعزيز المحيميد المحادثة بـ تمت المعالجة', NULL, 1, 4, 'inset_id'),
(69, '966555018868', 5, 'inset_id', 1726417523259, 'تم الإغلاق بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(70, '966555055425', 5, 'inset_id', 1726417538546, 'تم إعادة الفتح بواسطة Abdullah Alothman', NULL, 1, NULL, 'inset_id'),
(71, '966555055425', 5, 'wamid.HBgMOTY2NTU1MDU1NDI1FQIAEhggNEE4M0U2RkFDMDY1OUY0Rjg4MjIzQ0UwQzExMDE4MjEA', 1726417538624, 'السلام عليكم', NULL, 1, NULL, 'text'),
(72, '966555018868', 5, 'inset_id', 1726417552258, 'تم التعيين لـ عبدالعزيز المحيميد بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(73, '966555018868', 5, 'local_id', 1726417562394, 'وعليكم السلام', NULL, 1, 4, 'text'),
(74, '966555018868', 5, 'comment_message_id', 1726417593045, '111', NULL, 1, 4, 'text'),
(75, '966555055425', 5, 'wamid.HBgMOTY2NTU1MDU1NDI1FQIAEhggMDgxRDk4QjVEMDVGMzc3M0VFNTM5NkU0MjJEMDg1NEMA', 1726417600873, 'شكرا', NULL, 1, NULL, 'text'),
(76, '966555018868', 5, 'inset_id', 1726417612233, 'تم الإغلاق بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(77, '966556824160', 4, 'inset_id', 1726419328745, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(78, '966556824160', 4, 'inset_id', 1726419344826, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(79, '966556824160', 2, 'comment_message_id', 1726419874500, 'تمت المعالجة', NULL, 1, 2, 'text'),
(80, '966556824160', 2, 'inset_id', 1726419886628, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(81, '966552168008', 2, 'inset_id', 1726467705681, 'تم إعادة الفتح بواسطة عبدالملك', NULL, 1, NULL, 'inset_id'),
(82, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggN0MzMjIwOUVFQjNBRjEwMjU4RkEwRUU5RUY0MUE1ODQA', 1726467705771, 'السلام عليكم ورحمة الله', NULL, 1, NULL, 'text'),
(83, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggQ0U4QjI0RTZDRUY5OEM5QjhFRDZFOTBENzZGRDUwNTcA', 1726467721860, 'كيف الحال', NULL, 1, NULL, 'text'),
(84, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggRUE1NUEwQTlBQjQ5MURGNTEwNThDMkExRDY4MEFCQ0MA', 1726467731032, 'احتاج تتبع', NULL, 1, NULL, 'text'),
(85, '966556824160', 2, 'inset_id', 1726467744342, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(86, '966556824160', 2, 'local_id', 1726467751344, 'تمام ', NULL, 1, 2, 'text'),
(87, '966556824160', 2, 'local_id', 1726467790489, '', 'public/messages/17264677904735.jpg', 1, 2, 'image'),
(88, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggRTc4NzA1MUQ2RjNERDAyMDQ0RTUyMTVBMkRDOTVENjIA', 1726467812015, '', 'public/messages/3046784122128370.jpeg', 1, NULL, 'image'),
(89, '966556824160', 2, 'comment_message_id', 1726467858426, 'تم ', NULL, 1, 2, 'text'),
(90, '966556824160', 2, 'inset_id', 1726467883075, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(91, '966556824160', 2, 'inset_id', 1726468308635, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(92, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggNTkxREIwQTU2ODk2RTI4RjA2NzFCRTdCRUJDRUMzQTEA', 1726471668124, 'Hi', NULL, 1, NULL, 'text'),
(93, '966556824160', 2, 'local_id', 1726471692508, 'yes', NULL, 1, 2, 'text'),
(94, '966556824160', 2, 'local_id', 1726473171553, 'hi', NULL, 1, 2, 'text'),
(95, '966556824160', 2, 'local_id', 1726473180223, 'i need avl logo', NULL, 1, 2, 'text'),
(96, '966556824160', 2, 'local_id', 1726473781478, 'logo send here', NULL, 1, 2, 'text'),
(97, '966556824160', 2, 'local_id', 1726473788983, 'i will download', NULL, 1, 2, 'text'),
(98, '966556824160', 3, 'inset_id', 1726473860121, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, NULL, 'inset_id'),
(99, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggQUFBNkFEMUVCMDdFRjg2RTZCN0I1NDM4M0IwMTc5NzAA', 1726473860879, '', 'public/messages/888295023202103.png', 1, NULL, 'document'),
(100, '966556824160', 2, 'inset_id', 1726475969059, 'تم التعيين لـ Mohamed Ahmed بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(101, '966556824160', 3, 'comment_message_id', 1726475981190, 'تم ', NULL, 1, 2, 'text'),
(102, '966556824160', 3, 'inset_id', 1726475987679, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(103, '966556824160', 3, 'inset_id', 1726475995609, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(104, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggNjY5MzVDNDM0RjMxNDVFQjgwQzhGRDMyQ0FBRUVFRjYA', 1726476036582, 'Ok done', NULL, 1, NULL, 'text'),
(105, '971527956224', 6, 'inset_id', 1726488248673, 'تم إنشاء التذكرة بواسطة Tazeen Al Zain', NULL, 1, NULL, 'inset_id'),
(106, '971527956224', 6, 'wamid.HBgMOTcxNTI3OTU2MjI0FQIAEhgWM0VCMEUwNzM0QjIzRTU0MjRBRDUxOQA=', 1726488248764, 'Hello! Are you the tour guide Ahmed?', NULL, 1, NULL, 'text'),
(107, '971527956224', 6, 'wamid.HBgMOTcxNTI3OTU2MjI0FQIAEhgWM0VCMEM5QTQxMUVEMEQ5N0Q3QzNGNgA=', 1726488394738, '?', NULL, 1, NULL, 'text'),
(108, '966556824160', 2, 'local_id', 1726493554391, 'https://drive.google.com/file/d/13eEYr-hI4wLPXG72S8PcV2U0YgLBMIP3/view?usp=sharing', NULL, 1, 2, 'text'),
(109, '966556824160', 6, 'inset_id', 1726494715174, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(110, '966556824160', 6, 'local_id', 1726494772537, 'Hello ,  No sorry , actually this is tracking maps , we povide tracking vehicles services', NULL, 1, 2, 'text'),
(111, '966556824160', 6, 'comment_message_id', 1726494847685, 'تم افادة المرسل ', NULL, 1, 2, 'text'),
(112, '966556824160', 6, 'inset_id', 1726494856102, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(113, '966556824160', 6, 'inset_id', 1726494862320, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(114, '966555018868', 7, 'inset_id', 1726498032255, 'تم إنشاء التذكرة بواسطة عبدالعزيز المحيميد', NULL, 1, NULL, 'inset_id'),
(115, '966555018868', 7, 'inset_id', 1726498032311, 'تم التعيين بواسطة عبدالعزيز المحيميد', NULL, 1, NULL, 'inset_id'),
(116, '966555018868', 7, 'local_id', 1726498032347, '911', NULL, 1, 4, 'text'),
(117, '966555018868', 7, 'wamid.HBgMOTY2NTU1MDE4ODY4FQIAEhgUM0FEMDJFNTI2QkFGRUM5MkMyREMA', 1726498165195, '', 'public/messages/846924864299092.webp', 1, NULL, 'sticker'),
(118, '971527956224', 6, 'inset_id', 1726498464685, 'تم إعادة الفتح بواسطة Tazeen Al Zain', NULL, 1, NULL, 'inset_id'),
(119, '971527956224', 6, 'wamid.HBgMOTcxNTI3OTU2MjI0FQIAEhgWM0VCMDgxQkM5QThDNDE4QzdFMEFDNwA=', 1726498464771, 'Oh no, I’m so sorry! It looks like I did reach out to the wrong person. I hope this hasn’t affected your mood. 😓', NULL, 1, NULL, 'text'),
(120, '249123342124', 1, 'inset_id', 1726501673889, 'تم إعادة الفتح بواسطة mohamed ahmed', NULL, 1, NULL, 'inset_id'),
(121, '249123342124', 1, 'wamid.HBgMMjQ5MTIzMzQyMTI0FQIAEhgUM0E2NTY5OEU2MkFCMkYzRTUyRTUA', 1726501673979, 'Ok', NULL, 1, NULL, 'text'),
(122, '966556824160', 2, 'local_id', 1726553179571, 'مرحبا', NULL, 1, 2, 'text'),
(123, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggNzg5NTgzMjY5OUY2N0E4MEI4MUYyM0VFQkM4QUE2QTUA', 1726553212603, 'هلا بيك', NULL, 1, NULL, 'text'),
(124, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggRDA4NUZENzM5MEY2MzQyQTJBNkIxNkIzMTdCRkQ0N0YA', 1726553257840, 'ربطت السيارة؟', NULL, 1, NULL, 'text'),
(125, '966556824160', 2, 'local_id', 1726553273975, 'نعم', NULL, 1, 2, 'text'),
(126, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggQzgyNjIwMENCMTVGMDQ5M0JBNURGRjYxRkE0ODIzMjgA', 1726553282060, 'شكرا لك', NULL, 1, NULL, 'text'),
(127, '966556824160', 2, 'comment_message_id', 1726553391630, 'تم اللربط', NULL, 1, 2, 'text'),
(128, '966556824160', 2, 'inset_id', 1726553399956, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(129, '966556824160', 6, 'comment_message_id', 1726553437672, 'ارسل بالخطأ', NULL, 1, 2, 'text'),
(130, '966556824160', 6, 'inset_id', 1726553445312, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(131, '966556824160', 6, 'inset_id', 1726553455278, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(132, '966556824160', 1, 'inset_id', 1726553484625, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(133, '966556824160', 1, 'comment_message_id', 1726553881324, 'تم', NULL, 1, 2, 'text'),
(134, '966556824160', 1, 'inset_id', 1726553896131, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(135, '966556824160', 3, 'inset_id', 1726563434613, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, NULL, 'inset_id'),
(136, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggQjcxOEZEREU1NzE1MkFFREYxQjgzQTNDMTkzRUE1RUUA', 1726563435312, '', 'public/messages/508694981899814.jpeg', 1, NULL, 'image'),
(137, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggRDc0RUY1QTE5OENFNjE0NDNFODE3RUEwMDE5NUZDQUEA', 1726563435585, '', 'public/messages/1458658934851897.jpeg', 1, NULL, 'image'),
(138, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNjgzQjYwRDQzN0VBMjNDQjZBMTU5M0I5NTIyRjYzN0YA', 1726563435655, '', 'public/messages/8623696954327545.jpeg', 1, NULL, 'image'),
(139, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNTRCMDA5RUM4QTM4M0VGOENENzg1QzZDRjJBODREOUEA', 1726563436495, '', 'public/messages/510733338260093.jpeg', 1, NULL, 'image'),
(140, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggRDRCMjlFRDY4MTk5NkEwNUJFQjhFQjcwMkQ2ODZGOUEA', 1726563436670, '', 'public/messages/1602795937283754.jpeg', 1, NULL, 'image'),
(141, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNTIzNTQzREFFRThFOEI3ODcyMDNEQ0RFNDhBM0EwRjUA', 1726563436801, '', 'public/messages/2444154979125408.jpeg', 1, NULL, 'image'),
(142, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggODVBNjU3QTBFNTA4NTU5Q0E1NjZENUVDRkI1Rjg1MTEA', 1726563436991, '', 'public/messages/822269333452520.jpeg', 1, NULL, 'image'),
(143, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMjI2RUE1RjhDMUNDQTk5QUVCQTMyMjM1MDY4RkRGRUUA', 1726563437310, '', 'public/messages/540835645276498.jpeg', 1, NULL, 'image'),
(144, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggQzQ3MzI3MzEyNENCQzc1QUNFNkExQTM4NTRGODIzRUUA', 1726563437623, '', 'public/messages/977757980821405.jpeg', 1, NULL, 'image'),
(145, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggQUI3MTk3NjUwMzIzQUQzQzc3RTVERkNEQjQ3NTM3REIA', 1726563437960, '', 'public/messages/418641687497495.jpeg', 1, NULL, 'image'),
(146, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggQTQzQzQ5RTVBQ0IwN0ZFMDZFNkM5N0ZBNDlGQTcxMTgA', 1726563438327, '', 'public/messages/1062858222032848.jpeg', 1, NULL, 'image'),
(147, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMEJEQzZBQzQ4RkQzMkQyNkE5RUEzQTE0NzVEOTZBRjMA', 1726563438842, '', 'public/messages/500119049446474.jpeg', 1, NULL, 'image'),
(148, '966556824160', 3, 'comment_message_id', 1726563468922, 'done', NULL, 1, 2, 'text'),
(149, '966556824160', 3, 'inset_id', 1726644766798, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(150, '966556824160', 3, 'local_id', 1726644790940, 'null', 'public/messages/1726644790903260.jpeg', 1, 2, 'image'),
(151, '966556824160', 3, 'local_id', 1726644811677, 'null', 'public/messages/1726644811647153.jpeg', 1, 2, 'image'),
(152, '966556824160', 3, 'local_id', 1726649239188, 'C:\\Users\\DELL\\StudioProjects\\trackingmapsbus\\build\\app\\outputs\\flutter-apk', NULL, 1, 2, 'text'),
(153, '966556824160', 7, 'inset_id', 1726651554821, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(154, '966556824160', 7, 'inset_id', 1726651558700, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(155, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhgWM0VCMDkwOTMwNEE4NkUzMTU3MzUwQwA=', 1726665647732, 'http://192.168.68.103:8000/api/company/2', NULL, 1, NULL, 'text'),
(156, '966556824160', 3, 'local_id', 1726666659511, 'bro keep on the laptop', NULL, 1, 2, 'text'),
(157, '966556824160', 3, 'local_id', 1726729858583, 'https://www.youtube.com/watch?v=EJq_JHk2d9A&list=PLSOI1xClksi-GT-Nv8TWGxgDseTxTxa9U', NULL, 1, 2, 'text'),
(158, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggRDFERTcwRjY0QzZDMUM5QjQ3ODgyOEU0QTRGODUyRDUA', 1726909075023, 'مرحبا', NULL, 1, NULL, 'text'),
(159, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggRjBGNzFDMEU4NEYyNjMxOUY2NzcxMDcwODVEMDc3N0EA', 1726909085130, 'كيف الحال', NULL, 1, NULL, 'text'),
(160, '966556824160', 3, 'local_id', 1726909118362, 'مرحبا', NULL, 1, 2, 'text'),
(161, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMTYzN0ZFQkMxRkE2MTk3QzM0QjNCMjM3NzA1NjU0QjgA', 1726909165479, 'كم السعر', NULL, 1, NULL, 'text'),
(162, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNkI3NkEzQjc0NzA2Rjg5RjM2NTBDRENEMDU0NTUyMDkA', 1726909179463, 'دينا', NULL, 1, NULL, 'text'),
(163, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMDgzNTUwNTMyMzUyMEI5OTc3RUZBMDgxNjhGOTFCRTkA', 1726909197193, 'مع الربط', NULL, 1, NULL, 'text'),
(164, '966556824160', 3, 'local_id', 1726909218054, 'قيمة تزويد الخدمة على السيارة الواحدة 530 ريال شاملة الضريبة باقة كاملة تشمل (جهاز تتبع مجانا + اشتراك سنة على منصة التتبع مع شريحة البيانات + التركيب والضريبة) ', NULL, 1, 2, 'text'),
(165, '966556824160', 3, 'comment_message_id', 1726909246651, 'تمت الافادة', NULL, 1, 2, 'text'),
(166, '966556824160', 3, 'inset_id', 1726909253123, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(167, '966556824160', 2, 'inset_id', 1726985613216, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(168, '966920017070', 8, 'inset_id', 1726992853417, 'تم إنشاء التذكرة بواسطة 966920017070', NULL, 1, NULL, 'inset_id'),
(169, '966920017070', 8, 'wamid.HBgMOTY2OTIwMDE3MDcwFQIAEhgSRDgzMjZBMjZENjRBMDk4OTc5AA==', 1726992853517, '', NULL, 1, NULL, 'unsupported'),
(170, '966556824160', 8, 'inset_id', 1726997274213, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(171, '966556824160', 2, 'inset_id', 1727000270218, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(172, '966556824160', 8, 'inset_id', 1727000600988, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(173, '966556824160', 8, 'inset_id', 1727000608518, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(174, '966556824160', 3, 'inset_id', 1727004516528, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, NULL, 'inset_id'),
(175, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggOERGRjU4MDVBNjYxMTBCODJBQUYwRUE5REZBRjIyQ0QA', 1727004516607, 'Hi', NULL, 1, NULL, 'text'),
(176, '966556824160', 3, 'inset_id', 1727004532574, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(177, '966556824160', 3, 'local_id', 1727004534825, 'avlruban793@gmail.com', NULL, 1, 2, 'text'),
(178, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMzM0ODI5MjRCMUVGNTgxN0U2MTRBODdERTQyODc2RDQA', 1727004541447, '', NULL, 1, NULL, 'reaction'),
(179, '966556824160', 3, 'comment_message_id', 1727008770168, 'تم ', NULL, 1, 2, 'text'),
(180, '966556824160', 3, 'inset_id', 1727008779193, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(181, '966556824160', 2, 'inset_id', 1727010161359, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(182, '966556824160', 2, 'inset_id', 1727016944192, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(183, '966556824160', 3, 'inset_id', 1727115464042, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, NULL, 'inset_id'),
(184, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMkJCMDEzNjQzMjI3QTBBNDU3NkRBQTMwOEYxNDFCMTIA', 1727115464136, 'بدء المحادثة', NULL, 1, NULL, 'button'),
(185, '966556824160', 3, 'inset_id', 1727119759915, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(186, '966556824160', 3, 'local_id', 1727119770142, 'كيف حالم', NULL, 1, 2, 'text'),
(187, '966556824160', 3, 'local_id', 1727119777530, 'كيف حالك', NULL, 1, 2, 'text'),
(188, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMjdBNjQ3QUY5QURFRUZBRTdDMEY1QkNBRTJFMTE1QzQA', 1727119787410, 'بخير الحمد لله', NULL, 1, NULL, 'text'),
(189, '966556824160', 3, 'comment_message_id', 1727119805225, 'تم', NULL, 1, 2, 'text'),
(190, '966556824160', 3, 'inset_id', 1727119854125, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(191, '966920009377', 9, 'inset_id', 1727174809094, 'تم إنشاء التذكرة بواسطة 966920009377', NULL, 1, NULL, 'inset_id'),
(192, '966920009377', 9, 'wamid.HBgMOTY2OTIwMDA5Mzc3FQIAEhgSQjgzQUEwNkU1NzgzQzIzMEQzAA==', 1727174809195, '', NULL, 1, NULL, 'unsupported'),
(193, '966556824160', 9, 'inset_id', 1727175737588, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(194, '966556824160', 9, 'local_id', 1727175775242, 'تفضل كيف اقدر اساعدك ', NULL, 1, 2, 'text'),
(195, '966920009377', 9, 'wamid.HBgMOTY2OTIwMDA5Mzc3FQIAEhgSMUJFRjlCNzY0Mjk1NEZFRTBDAA==', 1727175780203, 'My apologies dear customer, kindly choose one of the options from the list below', NULL, 1, NULL, 'text'),
(196, '966556824160', 9, 'comment_message_id', 1727175800614, 'مرسل بالخطأ ', NULL, 1, 2, 'text'),
(197, '966556824160', 9, 'inset_id', 1727175807849, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(198, '966556824160', 9, 'inset_id', 1727175870378, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(199, '966556824160', 2, 'inset_id', 1727176963532, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(200, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggN0I2OEUwMjNBMUE3RDNGMDQ5OTgwMEFDMDJBQTU3ODUA', 1727177068424, 'التحدث لاحقا', NULL, 1, NULL, 'button'),
(201, '966556824160', 2, 'local_id', 1727177097498, 'تفضل ', NULL, 1, 2, 'text'),
(202, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggNDgyNzc1NjEzQ0JCQzc2RTAzNThERTVCMkFCMzM4N0UA', 1727177165815, 'بكن', NULL, 1, NULL, 'text'),
(203, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggNDlCODkxRjkyM0I1QUQwNDVBRTIwNjJBOTJEOTMyQ0YA', 1727177170505, 'بكم', NULL, 1, NULL, 'text'),
(204, '966556824160', 2, 'local_id', 1727177183235, 'بخصوص أجهزة التتبع متوفرة عندنا أجهزة الجيل الرابع :\r\nالجهاز صغير بحجم كف اليد يتركب بشكل مخفي خلف الديكور الداخلي للمركبة وتتمدد توصيلاته على علبة الفيوزات بدون تقطيع او تجريح تفاديا لإلغاء ضمان الكهرب على المركبة, منصة التتبع تتيح لك تتبع مباشر على حركة المركبة بالاضافة الى حفظ المسارات المقطوعة لآخر 6 شهور, الجهاز يعطي مجموعة من التنبيهات والتقارير على سبيل المثال وليس الحصر (تنبيهات التشغيل والاطفاء / تنبيهات تجاوز السرعة / تنبيهات مناطق السياج / تنبيهات العبث بالكهرباء / تقارير الرحلات / تقارير استهلاك الوقود / تقارير الصيانة الدورية / تقارير وزن المركبة - خاص بالربط بالهيئة-)', NULL, 1, 2, 'text'),
(205, '966556824160', 2, 'local_id', 1727177186680, 'قيمة تزويد الخدمة على السيارة الواحدة 530 ريال شاملة الضريبة باقة كاملة تشمل (جهاز تتبع مجانا + اشتراك سنة على منصة التتبع مع شريحة البيانات + التركيب والضريبة) ', NULL, 1, 2, 'text'),
(206, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggMERFRjNEOTkzNzA0MjA5OTUwNUVDRjAxQkJGM0Q3RTUA', 1727177244215, 'شكرا لك', NULL, 1, NULL, 'text'),
(207, '966556824160', 2, 'inset_id', 1727194533481, 'تم التعيين لـ حساب المطور بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(208, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggRkVCOEVEQjJEQkJBRjU0MjQ3QkZBRDlCNDM3OThBQ0MA', 1727194606659, 'مرحبا', NULL, 1, NULL, 'text'),
(209, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggOUYzMURFRjEyMTY3NThFQTZCMjUyODFFMzgxMTJFNjYA', 1727194622311, 'كيف الحال', NULL, 1, NULL, 'text'),
(210, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggMDMyMjlGM0FFMzUyNzc3N0FDOUZBOTU4RTBFMThFREIA', 1727194644089, 'بانتظارك', NULL, 1, NULL, 'text'),
(211, '966552168008', 2, 'wamid.HBgMOTY2NTUyMTY4MDA4FQIAEhggMjY0MjkxMURENkU5Q0Q5RDZDMDJFMUIwRTIxRUVFNjYA', 1727194669012, 'الأمور والصحة', NULL, 1, NULL, 'text'),
(212, '966559752282', 10, 'inset_id', 1727260573796, 'تم إنشاء التذكرة بواسطة .', NULL, 1, NULL, 'inset_id'),
(213, '966556824160', 2, 'local_id', 1727274654270, 'i need user login for bus app', NULL, 1, 2, 'text'),
(214, '966556824160', 3, 'inset_id', 1727361607248, 'تم إعادة الفتح بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(215, '966544770775', 11, 'inset_id', 1727595568574, 'تم إنشاء التذكرة بواسطة محمد', NULL, 1, NULL, 'inset_id'),
(216, '966544770775', 11, 'wamid.HBgMOTY2NTQ0NzcwNzc1FQIAEhgUM0E2Qzk1REIxRkFCQ0IzNDVGQTIA', 1727595568720, 'السلام عليكم', NULL, 1, NULL, 'text'),
(217, '966555018868', 11, 'inset_id', 1727618540104, 'تم التعيين لـ عبدالعزيز المحيميد بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(218, '966555018868', 11, 'local_id', 1727618544267, '1020', NULL, 1, 4, 'text'),
(219, '966555018868', 7, 'inset_id', 1727618578016, 'تم إعادة الفتح بواسطة عبدالعزيز المحيميد', NULL, 1, NULL, 'inset_id'),
(220, '966555018868', 7, 'local_id', 1727618578100, '102030', NULL, 1, 4, 'text'),
(221, '966555018868', 7, 'local_id', 1727618687395, 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', NULL, 1, 4, 'template'),
(222, '966555018868', 7, 'wamid.HBgMOTY2NTU1MDE4ODY4FQIAEhgWM0VCMDlEMDQ2MDlGNDlGMDdGMEQ3RgA=', 1727618970489, 'بدء المحادثة', NULL, 1, NULL, 'button'),
(223, '966556824160', 3, 'inset_id', 1727619138412, 'تم التعيين لـ حساب المطور بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(224, '966544770775', 11, 'wamid.HBgMOTY2NTQ0NzcwNzc1FQIAEhgUM0EyOTk2RUY0RTEzQUYwM0VFQ0UA', 1727623699790, '؟؟', NULL, 1, NULL, 'text'),
(225, '966503640444', 12, 'inset_id', 1727680809614, 'تم إنشاء التذكرة بواسطة قسم الاتصال المؤسسي', NULL, 1, NULL, 'inset_id'),
(226, '966503640444', 12, 'wamid.HBgMOTY2NTAzNjQwNDQ0FQIAEhgWM0VCMEM5ODhDQzExMkM2QTQ0Q0Q2RgA=', 1727680809708, 'تقوم جمعية فائض للمساعدات العينية في محافظة عنيزة بتوفير مجموعة من الأجهزة الطبية النظيفة المستغنى عنها للمحتاجين بنظام الإستعاره \n،\nتبرعك بها يعتبر وقف خيري لك ولمن تحب\nتنال اجرها ♥️✨⬇️\n‏‪https://fayed.org.sa/?page_id=4257\n\nشاكرين لكم سلفاً ✨\n\nونسعد ونتشرف بمتابعتكم على حساباتنا في منصات التواصل الإجتماعي 🤍\nhttps://linktr.ee/fayedonaizah', NULL, 1, NULL, 'text'),
(227, '966560054494', 13, 'inset_id', 1727768600025, 'تم إنشاء التذكرة بواسطة خاص', NULL, 1, NULL, 'inset_id'),
(228, '966598131984', 14, 'inset_id', 1727789545216, 'تم إنشاء التذكرة بواسطة عبدالله سالم', NULL, 1, NULL, 'inset_id'),
(229, '966920027707', 15, 'inset_id', 1727874880199, 'تم إنشاء التذكرة بواسطة 966920027707', NULL, 1, NULL, 'inset_id'),
(230, '966920027707', 15, 'wamid.HBgMOTY2OTIwMDI3NzA3FQIAEhgSNjI1MUJBMTVFMUU3NjNCNENGAA==', 1727874880299, '', NULL, 1, NULL, 'unsupported'),
(231, '9668001169999', 16, 'inset_id', 1727970047843, 'تم إنشاء التذكرة بواسطة 9668001169999', NULL, 1, NULL, 'inset_id'),
(232, '9668001169999', 16, 'wamid.HBgNOTY2ODAwMTE2OTk5ORUCABIYEjNDQkJENjlBN0IyOEVGQzE0MAA=', 1727970047953, '', NULL, 1, NULL, 'unsupported'),
(233, '966504882965', 17, 'inset_id', 1727982181715, 'تم إنشاء التذكرة بواسطة ابو وليد', NULL, 1, NULL, 'inset_id'),
(234, '966504882965', 17, 'wamid.HBgMOTY2NTA0ODgyOTY1FQIAEhgUM0FDNTNEQUQxNjg2MzJFRkIxQkEA', 1727982181813, 'السلام عليكم مساء الخير \nاحتاج تجديد جهاز التتبع', NULL, 1, NULL, 'text'),
(235, '966537814554', 18, 'inset_id', 1727984723597, 'تم إنشاء التذكرة بواسطة حمد بسطاوي', NULL, 1, NULL, 'inset_id'),
(236, '966537814554', 18, 'wamid.HBgMOTY2NTM3ODE0NTU0FQIAEhggQTkxOTUwNzMxMkE4OURDMERGMDFEOTc4N0ZFOTM3NUIA', 1727984723684, 'هلا', NULL, 1, NULL, 'text'),
(237, '966537814554', 18, 'wamid.HBgMOTY2NTM3ODE0NTU0FQIAEhggMTFFQzk1OThGN0Y5MjU4NTZBQjdBQTI4QzE5MDQ2MDAA', 1727984747881, '', NULL, 1, NULL, 'location'),
(238, '966920031726', 19, 'inset_id', 1728050035074, 'تم إنشاء التذكرة بواسطة 966920031726', NULL, 1, NULL, 'inset_id'),
(239, '966920031726', 19, 'wamid.HBgMOTY2OTIwMDMxNzI2FQIAEhgSQzhFNjY4RkYyMTJDNjU3MUE1AA==', 1728050035169, '', NULL, 1, NULL, 'unsupported'),
(240, '966564368588', 20, 'inset_id', 1728225863450, 'تم إنشاء التذكرة بواسطة مضاوي ANB', NULL, 1, NULL, 'inset_id'),
(241, '966564368588', 20, 'wamid.HBgMOTY2NTY0MzY4NTg4FQIAEhgUM0E4Mjk4MjEwQUU1QkZCOTUwQzAA', 1728225863555, 'مرحبا أ.سلطان \nمعاك مضاوي من المصرفية المميزة في البنك العربي', NULL, 1, NULL, 'text'),
(242, '966553234111', 21, 'inset_id', 1728312400341, 'تم إنشاء التذكرة بواسطة شركة القرعاوى لقطع غيار تويوتا الاصلية', NULL, 1, NULL, 'inset_id'),
(243, '966553234111', 21, 'wamid.HBgMOTY2NTUzMjM0MTExFQIAEhggOTc1QTE2RjA0RUMwNzc2OUE2MjU1NTExODRGQ0NEMzQA', 1728312400439, 'السلام عليكم ورحمة الله وبركاتة', NULL, 1, NULL, 'text'),
(244, '966544443767', 22, 'inset_id', 1728815380273, 'تم إنشاء التذكرة بواسطة Ghada', NULL, 1, NULL, 'inset_id'),
(245, '966544443767', 22, 'wamid.HBgMOTY2NTQ0NDQzNzY3FQIAEhgUM0E4NkY4NDk1OEU4Mzk1QTU1QkIA', 1728815380349, 'السلام عليكم ورحمة الله وبركاته \nمساء الخير', NULL, 1, NULL, 'text'),
(246, '966556824160', 22, 'inset_id', 1728975439904, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(247, '966556824160', 21, 'inset_id', 1728975497066, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(248, '966556824160', 20, 'inset_id', 1728975509677, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(249, '966556824160', 20, 'inset_id', 1728975509678, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(250, '966556824160', 17, 'inset_id', 1728975659078, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(251, '966556824160', 18, 'inset_id', 1728975789214, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(252, '966556824160', 19, 'inset_id', 1728977474813, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(253, '966556824160', 16, 'inset_id', 1728978028826, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(254, '966556824160', 14, 'inset_id', 1728978524757, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(255, '966556824160', 15, 'inset_id', 1728978533344, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(256, '966556824160', 13, 'inset_id', 1728983059851, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(257, '966556824160', 12, 'inset_id', 1728985166974, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(258, '966556824160', 10, 'inset_id', 1728985233215, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(259, '966556824160', 12, 'inset_id', 1728985291703, 'تم التعيين لـ حساب المطور بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(260, '966556824160', 12, 'inset_id', 1728986430897, 'تم التعيين لـ حساب المطور بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(261, '966556824160', 13, 'inset_id', 1728986449526, 'تم التعيين لـ حساب المطور بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(262, '966556824160', 10, 'inset_id', 1728986467308, 'تم التعيين لـ حساب المطور بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(263, '966556824160', 7, 'comment_message_id', 1728997983905, 'hi', NULL, 1, 2, 'text'),
(264, '966556824160', 7, 'comment_message_id', 1729002890681, 'hi', NULL, 1, 2, 'text'),
(265, '966556824160', 7, 'inset_id', 1729064792919, 'قام عبدالملك عثمان بحذف التصنيف تمت المعالجة', NULL, 1, 2, 'inset_id'),
(266, '966556824160', 7, 'inset_id', 1729064794037, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(267, '966556824160', 7, 'inset_id', 1729064794038, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(268, '966556824160', 7, 'inset_id', 1729064794040, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(269, '966556824160', 7, 'inset_id', 1729064794045, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(270, '966556824160', 11, 'inset_id', 1729084523199, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(271, '966556824160', 11, 'inset_id', 1729084529451, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(272, '966558854894', 23, 'inset_id', 1729150794424, 'تم إنشاء التذكرة بواسطة مشعل', NULL, 1, NULL, 'inset_id'),
(273, '966558854894', 23, 'wamid.HBgMOTY2NTU4ODU0ODk0FQIAEhggNDI3NkVFNEU3NUM1NEIyMzNEQzUxRUE1RTgzRDQ4ODgA', 1729150795381, 'السلام عليكم', NULL, 1, NULL, 'text'),
(274, '966558854894', 23, 'wamid.HBgMOTY2NTU4ODU0ODk0FQIAEhggN0MxOEIwNjUzRDlCMDFDNjExOEI0RkI1MDM1NzY3RjMA', 1729150806373, 'ارسل الموقع', NULL, 1, NULL, 'text'),
(275, '966556824160', 23, 'inset_id', 1729154591660, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(276, '966556824160', 23, 'local_id', 1729154604311, 'عليكم السلام ورحمة الله ', NULL, 1, 2, 'text'),
(277, '966556824160', 23, 'local_id', 1729154665434, 'الرجاء المراسلة على الرقم الرئيسي للدعم الفني  لخدمتكم بشكل اسرع \r\n\r\n0555089009', NULL, 1, 2, 'text'),
(278, '966556824160', 23, 'comment_message_id', 1729171818341, 'تم تحويل الطلب', NULL, 1, 2, 'text'),
(279, '966556824160', 23, 'inset_id', 1729171824364, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(280, '966556824160', 23, 'inset_id', 1729171832341, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(281, '966556824160', 17, 'comment_message_id', 1729175817581, 'تم تحويل الطلب', NULL, 1, 2, 'text'),
(282, '966556824160', 17, 'inset_id', 1729175830454, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(283, '966556824160', 17, 'inset_id', 1729175842393, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(284, '966556824160', 3, 'local_id', 1729320688816, 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', NULL, 1, 2, 'template'),
(285, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMEFGRDYxNTIxNjc1QTRDQkY1OTMwQzhFMDIyNzFBQzAA', 1729320700681, 'بدء المحادثة', NULL, 1, NULL, 'button'),
(286, '966556824160', 3, 'inset_id', 1729320746286, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(287, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNjIwQzc5QjA4QTIyNDAyODFBRkRBMjhDQ0FDMEE0OEUA', 1729320755367, 'هلا بيك', NULL, 1, NULL, 'text'),
(288, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggRTdGOTJENDBDQ0Q5RThERkFGNjE2NzZGQ0MwNDMyRDMA', 1729323665905, 'مرحبا', NULL, 1, NULL, 'text'),
(289, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggRTNDNTRBQjZDNkQ2MEI1NDA5NjkwMkM0MkIyOUJGNjcA', 1729335339137, 'مرحبا', NULL, 1, NULL, 'text'),
(290, '249123342124', 3, 'local_id', 1729344797013, 'hi', NULL, 1, 1, 'text'),
(291, '249123342124', 3, 'local_id', 1729344798723, 'hi', NULL, 1, 1, 'text'),
(292, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggMTk5NTcxMUE2RjYwREUwNDFDMzM5Rjg3MDMzQjE5QzAA', 1729344809159, 'Hi', NULL, 1, NULL, 'text'),
(293, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNTk1RkM1RjFGQzM0QkZCQTM1N0RBRDFBQjNGNzVGOUMA', 1729344818731, 'Is This from aap', NULL, 1, NULL, 'text'),
(294, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggQTUyNDc2OUMwMzBFNjE1QzYyMDA1RkIwOUJDNjAxNzMA', 1729344823733, 'app', NULL, 1, NULL, 'text'),
(295, '249123342124', 3, 'local_id', 1729345121936, 'hi', NULL, 1, 1, 'text'),
(296, '249123342124', 3, 'local_id', 1729345123127, 'hi', NULL, 1, 1, 'text'),
(297, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNzdDNzAxMTI4MDY4QTAyMThCRUI4MkE2N0RCNzA5Q0EA', 1729345266852, 'Yes', NULL, 1, NULL, 'text'),
(298, '249123342124', 3, 'local_id', 1729345319170, 'yes', NULL, 1, 1, 'text'),
(299, '249123342124', 3, 'local_id', 1729345320534, 'yes', NULL, 1, 1, 'text'),
(300, '249123342124', 3, 'local_id', 1729345321743, 'yes', NULL, 1, 1, 'text'),
(301, '249123342124', 3, 'local_id', 1729345323812, 'yes', NULL, 1, 1, 'text'),
(302, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhggNjI2NTVGNDBBNDUzNDc0NTg4RUI3MkQxRTNCMzY5OEIA', 1729345352227, 'Yes', NULL, 1, NULL, 'text'),
(303, '249123342124', 3, 'local_id', 1729345361502, 'okay', NULL, 1, 1, 'text'),
(304, '249123342124', 3, 'local_id', 1729345362630, 'okay', NULL, 1, 1, 'text'),
(305, '249123342124', 3, 'local_id', 1729345965559, 'hi', NULL, 1, 1, 'text'),
(306, '249123342124', 3, 'local_id', 1729345966760, 'hi', NULL, 1, 1, 'text'),
(307, '249123342124', 3, 'local_id', 1729346137777, 'hi', NULL, 1, 1, 'text'),
(308, '249123342124', 3, 'local_id', 1729346140228, 'hi', NULL, 1, 1, 'text'),
(309, '249123342124', 3, 'local_id', 1729346140543, 'hi', NULL, 1, 1, 'text'),
(310, '249123342124', 3, 'local_id', 1729346142929, 'hi', NULL, 1, 1, 'text'),
(311, '249123342124', 3, 'local_id', 1729346815193, 'hi', NULL, 1, 1, 'text'),
(312, '249123342124', 3, 'local_id', 1729346817784, 'hi', NULL, 1, 1, 'text'),
(313, '249123342124', 3, 'local_id', 1729346823099, 'hi', NULL, 1, 1, 'text'),
(314, '249123342124', 3, 'local_id', 1729346827433, 'hi', NULL, 1, 1, 'text'),
(315, '249123342124', 3, 'local_id', 1729346839488, 'hi', NULL, 1, 1, 'text'),
(316, '249123342124', 3, 'local_id', 1729346840711, 'hi', NULL, 1, 1, 'text'),
(317, '249123342124', 3, 'local_id', 1729347778380, 'hi', NULL, 1, 1, 'text'),
(318, '249123342124', 3, 'local_id', 1729347780235, 'hi', NULL, 1, 1, 'text'),
(319, '966556824160', 3, 'wamid.HBgMOTY2NTU2ODI0MTYwFQIAEhgWM0VCMDFCNkNENEUwRDlEMkRCQTVDMQA=', 1729347824662, 'hi', NULL, 1, NULL, 'text'),
(320, '249123342124', 3, 'local_id', 1729348832997, 'hi', NULL, 1, 1, 'text'),
(321, '249123342124', 3, 'local_id', 1729348835359, 'hi', NULL, 1, 1, 'text'),
(322, '249123342124', 3, 'local_id', 1729405802427, 'hi', NULL, 1, 1, 'text'),
(323, '249123342124', 3, 'local_id', 1729405803986, 'hi', NULL, 1, 1, 'text'),
(324, '249123342124', 3, 'local_id', 1729405810557, 'hi', NULL, 1, 1, 'text'),
(325, '249123342124', 3, 'local_id', 1729405812682, 'hi', NULL, 1, 1, 'text'),
(326, '249123342124', 3, 'local_id', 1729405833342, 'hi', NULL, 1, 1, 'text'),
(327, '249123342124', 3, 'local_id', 1729405834549, 'hi', NULL, 1, 1, 'text'),
(328, '966556824160', 3, 'local_id', 1729405864004, 'hi', NULL, 1, 2, 'text'),
(329, '966556824160', 3, 'local_id', 1729405886407, 'hi', NULL, 1, 2, 'text'),
(330, '966556824160', 24, 'inset_id', 1729405925949, 'تم إنشاء التذكرة بواسطة عبدالملك عثمان', NULL, 1, NULL, 'inset_id'),
(331, '966556824160', 24, 'inset_id', 1729405925991, 'تم التعيين بواسطة عبدالملك عثمان', NULL, 1, NULL, 'inset_id'),
(332, '966556824160', 24, 'local_id', 1729405926380, 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', NULL, 1, 2, 'template'),
(333, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgUM0FBQjA4RkJBRjQxM0Q1MkI0M0YA', 1729405945821, 'Hi', NULL, 1, NULL, 'text'),
(334, '249123342124', 24, 'local_id', 1729406308098, 'hi', NULL, 1, 1, 'text'),
(335, '249123342124', 24, 'local_id', 1729406309746, 'hi', NULL, 1, 1, 'text'),
(336, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDk4NzVBMzZDRTZGMzNFQkQxNAA=', 1729406671207, 'hi', NULL, 1, NULL, 'text'),
(337, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMEJDOERCQkUxNzdFRDdFNEZCMgA=', 1729406681054, 'hi', NULL, 1, NULL, 'text'),
(338, '249123342124', 24, 'local_id', 1729406688154, 'hi', NULL, 1, 1, 'text'),
(339, '249123342124', 24, 'local_id', 1729406689363, 'hi', NULL, 1, 1, 'text'),
(340, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDJDQTBBQ0Q1QUUwRjc5NDEzMgA=', 1729407522864, 'hi', NULL, 1, NULL, 'text'),
(341, '249123342124', 24, 'local_id', 1729407527382, 'hi', NULL, 1, 1, 'text'),
(342, '249123342124', 24, 'local_id', 1729407528898, 'hi', NULL, 1, 1, 'text'),
(343, '249123342124', 24, 'local_id', 1729407929173, 'hi', NULL, 1, 1, 'text'),
(344, '249123342124', 24, 'local_id', 1729407930456, 'hi', NULL, 1, 1, 'text'),
(345, '249123342124', 24, 'local_id', 1729407967147, 'hi', NULL, 1, 1, 'text'),
(346, '249123342124', 24, 'local_id', 1729407968410, 'hi', NULL, 1, 1, 'text'),
(347, '249123342124', 24, 'local_id', 1729408205538, 'hi', NULL, 1, 1, 'text'),
(348, '249123342124', 24, 'local_id', 1729408207120, 'hi', NULL, 1, 1, 'text'),
(349, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMEFBMjU1RjgyQkVEMTU5NjFDMQA=', 1729408233310, 'hi', NULL, 1, NULL, 'text'),
(350, '249123342124', 24, 'local_id', 1729408239669, 'hi', NULL, 1, 1, 'text'),
(351, '249123342124', 24, 'local_id', 1729408242474, 'hi', NULL, 1, 1, 'text'),
(352, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDFDQjg1ODg5MkMyNzY5REVDMwA=', 1729408294930, 'hi', NULL, 1, NULL, 'text'),
(353, '249123342124', 24, 'local_id', 1729408307661, 'how are you', NULL, 1, 1, 'text'),
(354, '249123342124', 24, 'local_id', 1729408308834, 'how are you', NULL, 1, 1, 'text'),
(355, '249123342124', 24, 'local_id', 1729408326551, 'how are u', NULL, 1, 1, 'text'),
(356, '249123342124', 24, 'local_id', 1729408327953, 'how are u', NULL, 1, 1, 'text'),
(357, '249123342124', 24, 'local_id', 1729408424888, 'dfgdfg', NULL, 1, 1, 'text'),
(358, '249123342124', 24, 'local_id', 1729408426320, 'dfgdfg', NULL, 1, 1, 'text'),
(359, '249123342124', 24, 'local_id', 1729408882518, 'hi', NULL, 1, 1, 'text'),
(360, '249123342124', 24, 'local_id', 1729408884892, 'hi', NULL, 1, 1, 'text'),
(361, '249123342124', 24, 'local_id', 1729408913349, 'hi', NULL, 1, 1, 'text'),
(362, '249123342124', 24, 'local_id', 1729408915407, 'hi', NULL, 1, 1, 'text'),
(363, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDQ0MzA4MDc0REVGODVBNEU1QQA=', 1729408928554, 'rgerg', NULL, 1, NULL, 'text'),
(364, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDA2NzUyNDlGQkY5NUNCMjMwOAA=', 1729408966345, 'efgerg', NULL, 1, NULL, 'text'),
(365, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDc1NTQwQTU0QTJDNDYzMTM1OQA=', 1729408998804, 'gwegwe', NULL, 1, NULL, 'text'),
(366, '249123342124', 24, 'local_id', 1729409065508, 'hi', NULL, 1, 1, 'text'),
(367, '249123342124', 24, 'local_id', 1729409066731, 'hi', NULL, 1, 1, 'text'),
(368, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDMwRTdFRTMwQkNBQjhENTcxMAA=', 1729409361221, 'how are you?', NULL, 1, NULL, 'text'),
(369, '249123342124', 24, 'local_id', 1729409377008, 'good!', NULL, 1, 1, 'text'),
(370, '249123342124', 24, 'local_id', 1729409378658, 'good!', NULL, 1, 1, 'text'),
(371, '249123342124', 24, 'local_id', 1729410038545, 'hi', NULL, 1, 1, 'text'),
(372, '249123342124', 24, 'local_id', 1729410040442, 'hi', NULL, 1, 1, 'text'),
(373, '249123342124', 24, 'local_id', 1729410282641, 'hi', NULL, 1, 1, 'text'),
(374, '249123342124', 24, 'local_id', 1729410284008, 'hi', NULL, 1, 1, 'text'),
(375, '249123342124', 24, 'local_id', 1729411370123, 'sgsg', NULL, 1, 1, 'text'),
(376, '249123342124', 24, 'local_id', 1729411725779, 'sgsg', NULL, 1, 1, 'text'),
(377, '249123342124', 24, 'local_id', 1729411727274, 'sgsg', NULL, 1, 1, 'text'),
(378, '249123342124', 24, 'local_id', 1729412089255, 'hi', NULL, 1, 1, 'text'),
(379, '249123342124', 24, 'local_id', 1729412094560, 'hi', NULL, 1, 1, 'text'),
(380, '249123342124', 24, 'local_id', 1729412516669, 'hi', NULL, 1, 1, 'text'),
(381, '249123342124', 24, 'local_id', 1729412521324, 'hi', NULL, 1, 1, 'text'),
(382, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMERERTIxRjc0RkMzRERBRTQzRQA=', 1729415028197, 'hi', NULL, 1, NULL, 'text'),
(383, '249123342124', 24, 'local_id', 1729415035772, 'hi', NULL, 1, 1, 'text'),
(384, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDlGMUE2Nzg0MzAyOUYwMUJCMQA=', 1729415692927, 'how are you?', NULL, 1, NULL, 'text'),
(385, '249123342124', 24, 'local_id', 1729415705548, 'good', NULL, 1, 1, 'text'),
(386, '249123342124', 24, 'local_id', 1729416006705, 'hi', NULL, 1, 1, 'text'),
(387, '249123342124', 24, 'local_id', 1729416047128, 'ggg', NULL, 1, 1, 'text'),
(388, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDU3NTlBRkM1MDQ0RDBBNTExOAA=', 1729416199465, 'hi', NULL, 1, NULL, 'text'),
(389, '249123342124', 24, 'local_id', 1729416205880, 'hi', NULL, 1, 1, 'text'),
(390, '249123342124', 24, 'local_id', 1729416257907, 'hi', NULL, 1, 1, 'text'),
(391, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMEM2MDg1ODNGMzM4RTY4QkY4NgA=', 1729416309547, 'how are you', NULL, 1, NULL, 'text'),
(392, '249123342124', 24, 'local_id', 1729416324105, 'good', NULL, 1, 1, 'text'),
(393, '249123342124', 24, 'local_id', 1729416371020, 'good', NULL, 1, 1, 'text'),
(394, '249123342124', 24, 'local_id', 1729416444965, 'hi', NULL, 1, 1, 'text'),
(395, '249123342124', 24, 'local_id', 1729416444970, 'hi', NULL, 1, 1, 'text'),
(396, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMEFFMTEwQTMyNjlDNUVBM0U3RQA=', 1729416711868, 'hhhh', NULL, 1, NULL, 'text'),
(397, '249123342124', 24, 'local_id', 1729416720246, 'fff', NULL, 1, 1, 'text'),
(398, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDA3QzBENTFBNkFBNkJBRkVENAA=', 1729416948701, 'sdgs', NULL, 1, NULL, 'text'),
(399, '249123342124', 24, 'local_id', 1729416956197, 'sdgf', NULL, 1, 1, 'text'),
(400, '249123342124', 24, 'local_id', 1729417065158, 'sd', NULL, 1, 1, 'text'),
(401, '249123342124', 24, 'local_id', 1729417156316, 'fgj', NULL, 1, 1, 'text'),
(402, '249123342124', 24, 'local_id', 1729417253681, 'fgh', NULL, 1, 1, 'text'),
(403, '249123342124', 24, 'local_id', 1729417354456, 'sdgs', NULL, 1, 1, 'text'),
(404, '249123342124', 24, 'local_id', 1729417370925, 'sdgsd', NULL, 1, 1, 'text'),
(405, '249123342124', 24, 'local_id', 1729417393205, 'ghdfgh', NULL, 1, 1, 'text'),
(406, '249123342124', 24, 'local_id', 1729417613539, 'hi', NULL, 1, 1, 'text'),
(407, '249123342124', 24, 'local_id', 1729417692491, 'hi', NULL, 1, 1, 'text'),
(408, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDg1MUYzMTg1RjA3M0U1Q0I0OAA=', 1729418067527, 'hhhh', NULL, 1, NULL, 'text');
INSERT INTO `messages` (`id`, `from_phone`, `inbox_id`, `message_id`, `timestamp`, `message`, `media_link`, `viewed`, `user_id`, `type`) VALUES
(409, '249123342124', 24, 'local_id', 1729418087447, 'hi', NULL, 1, 1, 'text'),
(410, '249123342124', 24, 'local_id', 1729418232758, 'hi', NULL, 1, 1, 'text'),
(411, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMEI2MTVBOEFEMEJBRkRERUYwOAA=', 1729418300830, 'hi', NULL, 1, NULL, 'text'),
(412, '249123342124', 24, 'local_id', 1729418307488, 'hi', NULL, 1, 1, 'text'),
(413, '249123342124', 24, 'local_id', 1729418314845, 'hi', NULL, 1, 1, 'text'),
(414, '249123342124', 24, 'local_id', 1729418506780, 'hi', NULL, 1, 1, 'text'),
(415, '249123342124', 24, 'local_id', 1729418516694, 'hi', NULL, 1, 1, 'text'),
(416, '249123342124', 24, 'local_id', 1729418527038, 'hijj', NULL, 1, 1, 'text'),
(417, '249123342124', 24, 'local_id', 1729418678757, 'hi', NULL, 1, 1, 'text'),
(418, '249123342124', 24, 'local_id', 1729418693240, 'dgsdg', NULL, 1, 1, 'text'),
(419, '249123342124', 24, 'local_id', 1729418765854, 'sd', NULL, 1, 1, 'text'),
(420, '249123342124', 24, 'local_id', 1729418775838, 'ds', NULL, 1, 1, 'text'),
(421, '249123342124', 24, 'local_id', 1729418798472, 'gg', NULL, 1, 1, 'text'),
(422, '249123342124', 24, 'local_id', 1729418910007, 'hi', NULL, 1, 1, 'text'),
(423, '249123342124', 24, 'local_id', 1729419189861, 'hhkkk', NULL, 1, 1, 'text'),
(424, '249123342124', 24, 'local_id', 1729419356108, 'kkkllllll', NULL, 1, 1, 'text'),
(425, '249123342124', 24, 'local_id', 1729419383104, 'kjhgkkj', NULL, 1, 1, 'text'),
(426, '249123342124', 24, 'local_id', 1729419465199, 'jjjj', NULL, 1, 1, 'text'),
(427, '249123342124', 24, 'local_id', 1729419484703, 'hkjhk', NULL, 1, 1, 'text'),
(428, '249123342124', 24, 'local_id', 1729419813068, 'ruban', NULL, 1, 1, 'text'),
(429, '249123342124', 24, 'local_id', 1729419843566, 'hh', NULL, 1, 1, 'text'),
(430, '249123342124', 24, 'local_id', 1729419913506, 'rrrrrr', NULL, 1, 1, 'text'),
(431, '249123342124', 24, 'local_id', 1729419914643, 'rrrrrr', NULL, 1, 1, 'text'),
(432, '249123342124', 24, 'local_id', 1729419964893, 'hhhhh', NULL, 1, 1, 'text'),
(433, '249123342124', 24, 'local_id', 1729419992167, 'jbi', NULL, 1, 1, 'text'),
(434, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMEEyNUI1RjQ0QTcyRjEzQzk5RgA=', 1729420133069, 'ruban ruban', NULL, 1, NULL, 'text'),
(435, '249123342124', 24, 'local_id', 1729420145834, 'yes yes', NULL, 1, 1, 'text'),
(436, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDk1MTU4RkNFRDMzREM2NDk4QwA=', 1729420643177, 'dffdffd', NULL, 1, NULL, 'text'),
(437, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMENFNjk3MTM0Qzg1RTU3REQ3RAA=', 1729420666443, 'sdgsd', NULL, 1, NULL, 'text'),
(438, '249123342124', 24, 'local_id', 1729420672759, 'rubanruban', NULL, 1, 1, 'text'),
(439, '249123342124', 24, 'local_id', 1729421239911, 'sg', NULL, 1, 1, 'text'),
(440, '249123342124', 24, 'local_id', 1729421475824, 'hhh', NULL, 1, 1, 'text'),
(441, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDA0NjQ0NEU0MzlGQzlCRDFDMQA=', 1729421581381, 'hi', NULL, 1, NULL, 'text'),
(442, '249123342124', 24, 'local_id', 1729422667120, 'hi', NULL, 1, 1, 'text'),
(443, '249123342124', 24, 'local_id', 1729422736190, 'hhh', NULL, 1, 1, 'text'),
(444, '249123342124', 24, 'local_id', 1729422868977, 'sdgsg', NULL, 1, 1, 'text'),
(445, '249123342124', 24, 'local_id', 1729423282850, 'h', NULL, 1, 1, 'text'),
(446, '966555018868', 7, 'inset_id', 1729427710141, 'تم إعادة الفتح بواسطة null', NULL, 1, NULL, 'inset_id'),
(447, '966555018868', 7, 'wamid.HBgMOTY2NTU1MDE4ODY4FQIAEhgUM0E3RTNEOEVFQ0Q0RkFDNDIxRjkA', 1729427712490, 'هلا ومرحبا', NULL, 1, NULL, 'text'),
(448, '966555018868', 7, 'inset_id', 1729427721625, 'تم التعيين لـ عبدالعزيز المحيميد بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(449, '966555018868', 7, 'local_id', 1729427729330, '1202', NULL, 1, 4, 'text'),
(450, '966555018868', 7, 'inset_id', 1729427753642, 'صنف عبدالعزيز المحيميد المحادثة بـ مشكلة', NULL, 1, 4, 'inset_id'),
(451, '966555018868', 7, 'inset_id', 1729427758627, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(452, '966555018868', 7, 'inset_id', 1729427763102, 'تم الإغلاق بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(453, '966555018868', 7, 'inset_id', 1729427800613, 'تم إعادة الفتح بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(454, '966555018868', 7, 'inset_id', 1729427807456, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(455, '966555018868', 7, 'inset_id', 1729427817364, 'تم الإغلاق بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(456, '966555018868', 7, 'inset_id', 1729427817366, 'تم الإغلاق بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(457, '249123342124', 7, 'local_id', 1729427818684, 'hi', NULL, 1, 1, 'text'),
(458, '249123342124', 7, 'local_id', 1729427826530, 'hi', NULL, 1, 1, 'text'),
(459, '966555018868', 7, 'inset_id', 1729427833123, 'تم إعادة الفتح بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(460, '966555018868', 7, 'inset_id', 1729427833125, 'تم إعادة الفتح بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(461, '966555018868', 7, 'inset_id', 1729427837565, 'تم إعادة الفتح بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(462, '966555018868', 7, 'inset_id', 1729427837574, 'تم إعادة الفتح بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(463, '966555018868', 7, 'inset_id', 1729427837607, 'تم إعادة الفتح بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(464, '966555018868', 7, 'inset_id', 1729427843256, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالعزيز المحيميد', NULL, 1, 4, 'inset_id'),
(465, '249123342124', 24, 'local_id', 1729427857272, 'hi', NULL, 1, 1, 'text'),
(466, '966556824160', 7, 'comment_message_id', 1729427888507, 'for testing', NULL, 1, 2, 'text'),
(467, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDNFMEE5MENFMzBGOTQxNkM3QgA=', 1729427973189, 'hhh', NULL, 1, NULL, 'text'),
(468, '249123342124', 24, 'local_id', 1729427986959, 'hi', NULL, 1, 1, 'text'),
(469, '249123342124', 24, 'local_id', 1729428559554, 'tell', NULL, 1, 1, 'text'),
(470, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDlDMzc3NEU5NEZCQTY4RUUzMwA=', 1729428598431, 'hi', NULL, 1, NULL, 'text'),
(471, '249123342124', 3, 'local_id', 1729428673081, 'hi malik', NULL, 1, 1, 'text'),
(472, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDI4NzgzMjA2RDJFMzE4OUMxNQA=', 1729428976807, 'hi', NULL, 1, NULL, 'text'),
(473, '249123342124', 24, 'local_id', 1729428984741, 'hi', NULL, 1, 1, 'text'),
(474, '249123342124', 24, 'local_id', 1729428986167, 'hi', NULL, 1, 1, 'text'),
(475, '249123342124', 24, 'local_id', 1729429019023, 'hi', NULL, 1, 1, 'text'),
(476, '249123342124', 24, 'local_id', 1729429460873, 'hi', NULL, 1, 1, 'text'),
(477, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDIwMTE5QzAwNjc3MTA2QTRCNQA=', 1729437017486, 'hi', NULL, 1, NULL, 'text'),
(478, '249123342124', 24, 'local_id', 1729437025523, 'hi', NULL, 1, 1, 'text'),
(479, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDA3MEIzNDc0MzA3NUE1OTIxNgA=', 1729437098938, 'how are you', NULL, 1, NULL, 'text'),
(480, '249123342124', 24, 'local_id', 1729437108862, 'good', NULL, 1, 1, 'text'),
(481, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMEY5NDk5RjQ3MDY0RkMzMDg1OAA=', 1729437626236, 'hi malik', NULL, 1, NULL, 'text'),
(482, '249123342124', 24, 'local_id', 1729437638221, 'good ruban', NULL, 1, 1, 'text'),
(483, '966551303515', 25, 'inset_id', 1729439524424, 'تم إنشاء التذكرة بواسطة 966551303515', NULL, 1, NULL, 'inset_id'),
(484, '966551303515', 25, 'wamid.HBgMOTY2NTUxMzAzNTE1FQIAEhgWM0VCMDA1RDlGRkQ3NDFDMDc1Q0MwMgA=', 1729439524480, 'وين ماكنت بضغطة زر غازك يجيك\n*حمل تطبيق غازنا*✨\n\n*مميزات التطبيق*\nخاصية تتبع الطلب\nتوصيل اسرع\nسهولة الطلب\n\n*سعر التوصيل 15 ريال فقط لفترة محدودة*🔥🔥\n\n\n\n( ابل )\nhttps://apps.apple.com/us/app/%D8%BA%D8%A7%D8%B2%D9%86%D8%A7-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9/id6670285826\n\n ( اندرويد )\nhttps://play.google.com/store/apps/details?id=com.acwad.gazk_xxx&pli=1\n\nاو بتحميل التطبيق من خلال ابل ستور والمتجر باسم ( غازنا السعوديه )\n\nانشرووه لا يوقف🔥🔥\n', NULL, 1, NULL, 'text'),
(485, '249123342124', 24, 'local_id', 1729490228590, 'hi', NULL, 1, 1, 'text'),
(486, '249123342124', 24, 'local_id', 1729490373192, 'hi', NULL, 1, 1, 'text'),
(487, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDg1QkQ3RjQ2MDJDNTM0RTY4MwA=', 1729490418720, 'hi', NULL, 1, NULL, 'text'),
(488, '249123342124', 24, 'local_id', 1729492326721, 'hi', NULL, 1, 1, 'text'),
(489, '249123342124', 24, 'local_id', 1729492473538, 'hi', NULL, 1, 1, 'text'),
(490, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMEJEN0FBMUVGQkIxNjIwRTQwMQA=', 1729492684867, 'hi', NULL, 1, NULL, 'text'),
(491, '249123342124', 24, 'local_id', 1729492694073, 'hi', NULL, 1, 1, 'text'),
(492, '966556824160', 25, 'inset_id', 1729493232031, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(493, '966556824160', 25, 'comment_message_id', 1729495807114, 'رسائل غير مهمة', NULL, 1, 2, 'text'),
(494, '966556824160', 25, 'inset_id', 1729495815656, 'صنف عبدالملك عثمان المحادثة بـ مشكلة', NULL, 1, 2, 'inset_id'),
(495, '966556824160', 25, 'inset_id', 1729495821154, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(496, '966500417638', 24, 'wamid.HBgMOTY2NTAwNDE3NjM4FQIAEhgWM0VCMDE1RTgxOTYwMzE5NzU5M0NGQwA=', 1729495905984, 'hi', NULL, 1, NULL, 'text'),
(497, '249123342124', 24, 'local_id', 1729495914320, 'good', NULL, 1, 1, 'text'),
(498, '966556824160', 22, 'inset_id', 1729495942217, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(499, '966556824160', 22, 'comment_message_id', 1729495949527, 'تم تحويل الطلب', NULL, 1, 2, 'text'),
(500, '966556824160', 22, 'inset_id', 1729495955951, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(501, '966556824160', 20, 'inset_id', 1729495965650, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(502, '966556824160', 20, 'comment_message_id', 1729495972227, 'تم تحويل الطلب', NULL, 1, 2, 'text'),
(503, '966556824160', 20, 'inset_id', 1729495979965, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(504, '966556824160', 21, 'comment_message_id', 1729495993440, 'تم تحويل الطلب', NULL, 1, 2, 'text'),
(505, '966556824160', 21, 'inset_id', 1729496005653, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(506, '966556824160', 21, 'inset_id', 1729496013754, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(507, '966556824160', 16, 'comment_message_id', 1729496025403, 'تم معالجة الطلب', NULL, 1, 2, 'text'),
(508, '966556824160', 16, 'inset_id', 1729496033230, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(509, '966556824160', 16, 'inset_id', 1729496039121, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(510, '966556824160', 14, 'comment_message_id', 1729496051188, 'تم تحويل الطلب', NULL, 1, 2, 'text'),
(511, '966556824160', 14, 'inset_id', 1729496056348, 'صنف عبدالملك عثمان المحادثة بـ مشكلة', NULL, 1, 2, 'inset_id'),
(512, '966556824160', 14, 'inset_id', 1729496061314, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(513, '966556824160', 19, 'comment_message_id', 1729496071672, 'تم معالجة الطلب ', NULL, 1, 2, 'text'),
(514, '966556824160', 24, 'inset_id', 1729496937385, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(515, '966556824160', 24, 'inset_id', 1729496940740, 'قام عبدالملك عثمان بحذف التصنيف عميل جديد', NULL, 1, 2, 'inset_id'),
(516, '966556824160', 24, 'inset_id', 1729496952617, 'صنف عبدالملك عثمان المحادثة بـ مشكلة', NULL, 1, 2, 'inset_id'),
(517, '966556824160', 19, 'inset_id', 1729497650211, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(518, '966556824160', 19, 'inset_id', 1729497664095, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(519, '966556824160', 3, 'inset_id', 1729497677458, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(520, '966556824160', 15, 'comment_message_id', 1729497699413, 'تم تحويل الطلب ', NULL, 1, 2, 'text'),
(521, '966556824160', 15, 'inset_id', 1729497708699, 'صنف عبدالملك عثمان المحادثة بـ مشكلة', NULL, 1, 2, 'inset_id'),
(522, '966556824160', 15, 'inset_id', 1729497712034, 'قام عبدالملك عثمان بحذف التصنيف مشكلة', NULL, 1, 2, 'inset_id'),
(523, '966556824160', 15, 'inset_id', 1729497718320, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(524, '966556824160', 15, 'inset_id', 1729497723848, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(525, '966556824160', 18, 'inset_id', 1729497736431, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(526, '966556824160', 18, 'inset_id', 1729497755680, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(527, '966556824160', 7, 'inset_id', 1729497802929, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(528, '966556824160', 12, 'comment_message_id', 1729497847261, 'تم معالجة الطلب ', NULL, 1, 2, 'text'),
(529, '966556824160', 12, 'inset_id', 1729497875284, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(530, '966556824160', 12, 'inset_id', 1729497880986, 'تم الإغلاق بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id'),
(531, '966556824160', 24, 'inset_id', 1729500222022, 'صنف عبدالملك عثمان المحادثة بـ عميل جديد', NULL, 1, 2, 'inset_id'),
(532, '966556824160', 24, 'inset_id', 1729500225981, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(533, '966556824160', 24, 'inset_id', 1729500229690, 'قام عبدالملك عثمان بحذف التصنيف تمت المعالجة', NULL, 1, 2, 'inset_id'),
(534, '966556824160', 24, 'inset_id', 1729500234597, 'صنف عبدالملك عثمان المحادثة بـ تمت المعالجة', NULL, 1, 2, 'inset_id'),
(535, '966556824160', 24, 'inset_id', 1729505123582, 'قام عبدالملك عثمان بحذف التصنيف تمت المعالجة', NULL, 1, 2, 'inset_id'),
(536, '966556824160', 24, 'inset_id', 1729505124286, 'قام عبدالملك عثمان بحذف التصنيف عميل جديد', NULL, 1, 2, 'inset_id'),
(537, '966556824160', 24, 'inset_id', 1729505125077, 'قام عبدالملك عثمان بحذف التصنيف مشكلة', NULL, 1, 2, 'inset_id'),
(538, '249123342124', 1, 'inset_id', 1729506520049, 'صنف حساب المطور المحادثة بـ ruban', NULL, 1, 1, 'inset_id'),
(539, '966555018868', 7, 'inset_id', 1729524970350, 'تم إعادة الفتح بواسطة null', NULL, 1, NULL, 'inset_id'),
(540, '966556824160', 7, 'inset_id', 1729585644747, 'تم التعيين لـ عبدالملك عثمان بواسطة عبدالملك عثمان', NULL, 1, 2, 'inset_id');

-- --------------------------------------------------------

--
-- Table structure for table `messages_button`
--

CREATE TABLE `messages_button` (
  `id` int NOT NULL,
  `message_id` int NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `payload` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages_button`
--

INSERT INTO `messages_button` (`id`, `message_id`, `text`, `payload`) VALUES
(1, 6, 'التحدث لاحقا', 'التحدث لاحقا'),
(2, 11, 'بدء المحادثة', 'بدء المحادثة'),
(3, 61, 'بدء المحادثة', 'بدء المحادثة'),
(4, 184, 'بدء المحادثة', 'بدء المحادثة'),
(5, 200, 'التحدث لاحقا', 'التحدث لاحقا'),
(6, 222, 'بدء المحادثة', 'بدء المحادثة'),
(7, 285, 'بدء المحادثة', 'بدء المحادثة');

-- --------------------------------------------------------

--
-- Table structure for table `messages_template`
--

CREATE TABLE `messages_template` (
  `id` int NOT NULL,
  `message_id` int NOT NULL,
  `template_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages_template`
--

INSERT INTO `messages_template` (`id`, `message_id`, `template_id`) VALUES
(1, 5, 9),
(2, 10, 9),
(3, 59, 9),
(4, 221, 9),
(5, 284, 9),
(6, 332, 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `tittle` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `viewed` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replays`
--

CREATE TABLE `replays` (
  `id` int NOT NULL,
  `tag` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `replays`
--

INSERT INTO `replays` (`id`, `tag`, `body`, `created`) VALUES
(1, 'سعر جهاز فقط سيرفر 3', 'قيمة تزويد الخدمة على السيارة الواحدة 530 ريال شاملة الضريبة باقة كاملة تشمل (جهاز تتبع مجانا + اشتراك سنة على منصة التتبع مع شريحة البيانات + التركيب والضريبة) ', '2024-09-15 16:16:45'),
(8, 'خصائص الجهاز', 'بخصوص أجهزة التتبع متوفرة عندنا أجهزة الجيل الرابع :\nالجهاز صغير بحجم كف اليد يتركب بشكل مخفي خلف الديكور الداخلي للمركبة وتتمدد توصيلاته على علبة الفيوزات بدون تقطيع او تجريح تفاديا لإلغاء ضمان الكهرب على المركبة, منصة التتبع تتيح لك تتبع مباشر على حركة المركبة بالاضافة الى حفظ المسارات المقطوعة لآخر 6 شهور, الجهاز يعطي مجموعة من التنبيهات والتقارير على سبيل المثال وليس الحصر (تنبيهات التشغيل والاطفاء / تنبيهات تجاوز السرعة / تنبيهات مناطق السياج / تنبيهات العبث بالكهرباء / تقارير الرحلات / تقارير استهلاك الوقود / تقارير الصيانة الدورية / تقارير وزن المركبة - خاص بالربط بالهيئة-)', '2024-09-15 21:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `socket_id` text NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `device_id` varchar(100) DEFAULT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `app_os` varchar(100) DEFAULT NULL,
  `app_version` varchar(100) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finish_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `socket_id`, `token`, `device_id`, `device_type`, `app_os`, `app_version`, `ip_address`, `start_time`, `finish_time`) VALUES
(1, 1, 'bOdPnLGyy174dBfcAABU', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-15 15:25:56', NULL),
(2, 4, 'GX1kByhdylW6rZnTAAA2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-15 15:58:34', NULL),
(3, 2, 'WM7W1ODq_OPpS9ssAAAH', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-15 17:01:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spam`
--

CREATE TABLE `spam` (
  `id` int NOT NULL,
  `contact_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_deleted` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `is_deleted`, `created`) VALUES
(1, 'الدعم الفني ', 0, '2024-09-15 16:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `team_channels`
--

CREATE TABLE `team_channels` (
  `id` int NOT NULL,
  `team_id` int NOT NULL,
  `channel_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `team_channels`
--

INSERT INTO `team_channels` (`id`, `team_id`, `channel_id`, `created`) VALUES
(1, 1, 1, '2024-09-15 16:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `team_users`
--

CREATE TABLE `team_users` (
  `id` int NOT NULL,
  `team_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `team_users`
--

INSERT INTO `team_users` (`id`, `team_id`, `user_id`, `created`) VALUES
(3, 1, 2, '2024-09-15 17:03:50'),
(4, 1, 4, '2024-09-15 17:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int NOT NULL,
  `template_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `channel_id` int NOT NULL,
  `category` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `body_inputs` int NOT NULL DEFAULT '0',
  `header` varchar(60) DEFAULT NULL,
  `footer_text` varchar(60) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `status_note` text,
  `is_default` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `template_id`, `name`, `channel_id`, `category`, `language`, `body`, `body_inputs`, `header`, `footer_text`, `status`, `status_note`, `is_default`, `created`, `updated`) VALUES
(4, '1332342377669378', 'hello_world', 1, 'UTILITY', 'en_US', 'Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us', 0, 'TEXT', 'WhatsApp Business Platform sample message', 'DELETED', NULL, 1, '2024-05-16 04:25:03', '2024-09-15 16:43:01'),
(5, '1539152894148511', 'strat_conversation', 1, 'UTILITY', 'en_US', 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', 0, 'TEXT', NULL, 'DELETED', 'INCORRECT_CATEGORY', 0, '2024-09-15 16:29:48', '2024-09-15 16:42:53'),
(6, NULL, 'Start_Conversation', 1, 'MARKETING', 'en_US', 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', 0, 'TEXT', NULL, 'DELETED', NULL, 0, '2024-09-15 16:45:21', '2024-09-15 16:59:42'),
(7, NULL, 'Start_Conversation', 1, 'MARKETING', 'en_US', 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', 0, 'TEXT', NULL, 'DELETED', NULL, 0, '2024-09-15 16:46:16', '2024-09-15 16:47:09'),
(8, NULL, 'start_conv', 1, 'MARKETING', 'en_US', 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', 0, 'TEXT', NULL, 'DELETED', NULL, 0, '2024-09-15 16:49:24', '2024-09-15 16:59:33'),
(9, '1176336220327866', 'strart_new_conversation', 1, 'MARKETING', 'en_US', 'للتحدث مع موظف الدعم الفني يرجى اختيار بدء محادثة', 0, 'TEXT', NULL, 'APPROVED', 'NONE', 0, '2024-09-15 17:13:47', '2024-09-15 17:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `template_buttons`
--

CREATE TABLE `template_buttons` (
  `id` int NOT NULL,
  `template_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(25) NOT NULL,
  `value` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `template_buttons`
--

INSERT INTO `template_buttons` (`id`, `template_id`, `type`, `name`, `value`) VALUES
(1, 5, 'QUICK_REPLY', 'بدء المحادثة', NULL),
(2, 5, 'QUICK_REPLY', 'التحدث لاحقا', NULL),
(3, 6, 'QUICK_REPLY', 'بدء المحادثة', NULL),
(4, 6, 'QUICK_REPLY', 'التحدث لاحقا', NULL),
(5, 7, 'QUICK_REPLY', 'بدء المحادثة', NULL),
(6, 7, 'QUICK_REPLY', 'التحدث لاحقا', NULL),
(7, 8, 'QUICK_REPLY', 'بدء المحادثة', NULL),
(8, 8, 'QUICK_REPLY', 'التحدث لاحقا', NULL),
(9, 9, 'QUICK_REPLY', 'بدء المحادثة', NULL),
(10, 9, 'QUICK_REPLY', 'التحدث لاحقا', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `template_header`
--

CREATE TABLE `template_header` (
  `id` int NOT NULL,
  `template_id` int NOT NULL,
  `format` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `template_header`
--

INSERT INTO `template_header` (`id`, `template_id`, `format`, `value`) VALUES
(1, 5, 'TEXT', 'الدعم الفني خرائط التتبع'),
(2, 6, 'TEXT', 'الدعم الفني خرائط التتبع'),
(3, 7, 'TEXT', 'الدعم الفني خرائط التتبع'),
(4, 8, 'TEXT', 'الدعم الفني خرائط التتبع'),
(5, 9, 'TEXT', 'الدعم الفني خرائط التتبع');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_type_id` int NOT NULL,
  `is_deleted` int NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `status`, `user_type_id`, `is_deleted`, `created`, `updated`) VALUES
(1, 'حساب المطور', 'albrer112@gmail.com', '249123342124', '$2a$10$njpQGvDgOlEgZnMHe.o4U.eoBxUh07XhVbJP4rzq4COXzJH7.ZFQa', 0, 1, 0, '2024-09-24 11:22:09', '2024-09-24 11:22:09'),
(2, 'عبدالملك عثمان', 'avl@trackingmaps.sa', '966556824160', '$2a$10$8cmdHI/m2JSSB4RCngBcweYR7bq36fmw5Q9b1lNnnCN0/e5xEoQ8y', 0, 1, 0, '2024-09-15 17:01:37', '2024-09-15 17:01:37'),
(4, 'عبدالعزيز المحيميد', 'admin@trackingmaps.sa', '966555018868', '$2a$10$uOzydWdEHERX.kQcXg5Mn.1LKh.24gamxm92J5ZJs.4vHP4ntQUBC', 0, 1, 0, '2024-09-16 21:45:50', '2024-09-16 21:45:50'),
(5, 'عبدالملك عثمان', 'it@gpstracmap.com', '966552168008', '$2a$10$95tkLafcCoImTyLacOcBZ.Gg7f4WJ7KoV4eat4qlLDRLuGh8oXtG.', 0, 1, 1, '2024-09-15 17:00:49', '2024-09-15 17:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `users_types`
--

CREATE TABLE `users_types` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users_types`
--

INSERT INTO `users_types` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'AGENT');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `inbox_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` varchar(500) NOT NULL,
  `viewed` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `inbox_id`, `title`, `body`, `viewed`, `created`) VALUES
(1, 1, 3, 'توجد محادثة جديدة', 'عبدالملك عثمان - بدء المحادثة', 0, '2024-09-23 18:17:44'),
(2, 2, 3, 'توجد محادثة جديدة', 'عبدالملك عثمان - بدء المحادثة', 1, '2024-09-23 18:17:44'),
(3, 4, 3, 'توجد محادثة جديدة', 'عبدالملك عثمان - بدء المحادثة', 0, '2024-09-23 18:17:44'),
(4, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - بخير الحمد لله', 1, '2024-09-23 19:29:47'),
(5, 1, 9, 'توجد محادثة جديدة', '966920009377 - Media Content', 0, '2024-09-24 10:46:49'),
(6, 2, 9, 'توجد محادثة جديدة', '966920009377 - Media Content', 0, '2024-09-24 10:46:49'),
(7, 4, 9, 'توجد محادثة جديدة', '966920009377 - Media Content', 0, '2024-09-24 10:46:49'),
(8, 2, 9, 'لديك محادثة جديدة', '966920009377 - My apologies dear customer, kindly choose one of the options from the list below', 0, '2024-09-24 11:03:00'),
(9, 2, 2, 'لديك محادثة جديدة', 'عبدالملك - التحدث لاحقا', 0, '2024-09-24 11:24:28'),
(10, 2, 2, 'لديك محادثة جديدة', 'عبدالملك - بكن', 0, '2024-09-24 11:26:05'),
(11, 2, 2, 'لديك محادثة جديدة', 'عبدالملك - بكم', 0, '2024-09-24 11:26:10'),
(12, 2, 2, 'لديك محادثة جديدة', 'عبدالملك - شكرا لك', 0, '2024-09-24 11:27:24'),
(13, 1, 2, 'لديك محادثة جديدة', 'عبدالملك - مرحبا', 0, '2024-09-24 16:16:46'),
(14, 1, 2, 'لديك محادثة جديدة', 'عبدالملك - كيف الحال', 0, '2024-09-24 16:17:02'),
(15, 1, 2, 'لديك محادثة جديدة', 'عبدالملك - بانتظارك', 0, '2024-09-24 16:17:24'),
(16, 1, 2, 'لديك محادثة جديدة', 'عبدالملك - الأمور والصحة', 0, '2024-09-24 16:17:48'),
(17, 1, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-09-25 10:36:13'),
(18, 2, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-09-25 10:36:13'),
(19, 4, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-09-25 10:36:13'),
(20, 1, 11, 'توجد محادثة جديدة', 'محمد - السلام عليكم', 0, '2024-09-29 07:39:28'),
(21, 2, 11, 'توجد محادثة جديدة', 'محمد - السلام عليكم', 0, '2024-09-29 07:39:28'),
(22, 4, 11, 'توجد محادثة جديدة', 'محمد - السلام عليكم', 0, '2024-09-29 07:39:28'),
(23, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:42'),
(24, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:42'),
(25, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:42'),
(26, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:42'),
(27, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:42'),
(28, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:42'),
(29, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(30, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(31, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(32, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(33, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(34, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(35, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(36, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(37, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:43'),
(38, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:44'),
(39, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:44'),
(40, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:44'),
(41, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:44'),
(42, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:44'),
(43, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:44'),
(44, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(45, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(46, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(47, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(48, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(49, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(50, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(51, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(52, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:45'),
(53, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:46'),
(54, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:46'),
(55, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:46'),
(56, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:47'),
(57, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:48'),
(58, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:39:48'),
(59, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:00'),
(60, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:00'),
(61, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:00'),
(62, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:00'),
(63, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:00'),
(64, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:00'),
(65, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:01'),
(66, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:01'),
(67, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:01'),
(68, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:03'),
(69, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:03'),
(70, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:03'),
(71, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:09'),
(72, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:09'),
(73, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:09'),
(74, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:11'),
(75, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:11'),
(76, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:11'),
(77, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:15'),
(78, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:15'),
(79, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:15'),
(80, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:30'),
(81, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:30'),
(82, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:40:30'),
(83, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:46:19'),
(84, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:46:19'),
(85, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:46:19'),
(86, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:46:40'),
(87, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:46:40'),
(88, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:46:40'),
(89, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:47:12'),
(90, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:47:12'),
(91, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:47:12'),
(92, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:47:24'),
(93, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:47:24'),
(94, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 07:47:24'),
(95, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:21:48'),
(96, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:21:48'),
(97, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:21:48'),
(98, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:25:57'),
(99, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:25:57'),
(100, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:25:57'),
(101, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:35:44'),
(102, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:35:44'),
(103, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:35:44'),
(104, 1, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:37:19'),
(105, 2, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:37:19'),
(106, 4, 11, 'توجد محادثة جديدة', 'محمد - Media Content', 0, '2024-09-29 09:37:19'),
(107, 4, 7, 'لديك محادثة جديدة', '966555018868 - بدء المحادثة', 0, '2024-09-29 14:09:30'),
(108, 4, 11, 'لديك محادثة جديدة', 'محمد - ؟؟', 0, '2024-09-29 15:28:19'),
(109, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - تقوم جمعية فائض للمساعدات العينية في محافظة عنيزة بتوفير مجموعة من الأجهزة الطبية النظيفة المستغنى عنها للمحتاجين بنظام الإستعاره \n،\nتبرعك بها يعتبر وقف خيري لك ولمن تحب\nتنال اجرها ♥️✨⬇️\n‏‪https://fayed.org.sa/?page_id=4257\n\nشاكرين لكم سلفاً ✨\n\nونسعد ونتشرف بمتابعتكم على حساباتنا في منصات التواصل الإجتماعي 🤍\nhttps://linktr.ee/fayedonaizah', 0, '2024-09-30 07:20:09'),
(110, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - تقوم جمعية فائض للمساعدات العينية في محافظة عنيزة بتوفير مجموعة من الأجهزة الطبية النظيفة المستغنى عنها للمحتاجين بنظام الإستعاره \n،\nتبرعك بها يعتبر وقف خيري لك ولمن تحب\nتنال اجرها ♥️✨⬇️\n‏‪https://fayed.org.sa/?page_id=4257\n\nشاكرين لكم سلفاً ✨\n\nونسعد ونتشرف بمتابعتكم على حساباتنا في منصات التواصل الإجتماعي 🤍\nhttps://linktr.ee/fayedonaizah', 0, '2024-09-30 07:20:09'),
(111, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - تقوم جمعية فائض للمساعدات العينية في محافظة عنيزة بتوفير مجموعة من الأجهزة الطبية النظيفة المستغنى عنها للمحتاجين بنظام الإستعاره \n،\nتبرعك بها يعتبر وقف خيري لك ولمن تحب\nتنال اجرها ♥️✨⬇️\n‏‪https://fayed.org.sa/?page_id=4257\n\nشاكرين لكم سلفاً ✨\n\nونسعد ونتشرف بمتابعتكم على حساباتنا في منصات التواصل الإجتماعي 🤍\nhttps://linktr.ee/fayedonaizah', 0, '2024-09-30 07:20:09'),
(112, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:11'),
(113, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:11'),
(114, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:11'),
(115, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:12'),
(116, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:12'),
(117, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:12'),
(118, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:14'),
(119, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:14'),
(120, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:14'),
(121, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:16'),
(122, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:16'),
(123, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:16'),
(124, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:39'),
(125, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:39'),
(126, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:20:39'),
(127, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:27:13'),
(128, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:27:13'),
(129, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 07:27:13'),
(130, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 09:20:29'),
(131, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 09:20:29'),
(132, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 09:20:29'),
(133, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 11:38:52'),
(134, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 13:40:29'),
(135, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 14:57:22'),
(136, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:10:26'),
(137, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:10:27'),
(138, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:10:30'),
(139, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:10:52'),
(140, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:18:06'),
(141, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:24:26'),
(142, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:24:27'),
(143, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:24:29'),
(144, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:24:53'),
(145, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:31:15'),
(146, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:41:21'),
(147, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:41:21'),
(148, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:41:23'),
(149, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:41:50'),
(150, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:46:59'),
(151, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:47:00'),
(152, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:47:02'),
(153, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:47:28'),
(154, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:48:00'),
(155, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:54:07'),
(156, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:54:08'),
(157, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:54:10'),
(158, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:54:10'),
(159, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 15:54:36'),
(160, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:08'),
(161, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:08'),
(162, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:08'),
(163, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:09'),
(164, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:09'),
(165, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:09'),
(166, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:11'),
(167, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:11'),
(168, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:11'),
(169, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:34'),
(170, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:34'),
(171, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 15:56:34'),
(172, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 16:00:46'),
(173, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:22'),
(174, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:22'),
(175, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:22'),
(176, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:23'),
(177, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:23'),
(178, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:23'),
(179, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:25'),
(180, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:25'),
(181, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:25'),
(182, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:50'),
(183, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:50'),
(184, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:02:50'),
(185, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:08:45'),
(186, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:08:45'),
(187, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 16:08:45'),
(188, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:14:02'),
(189, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:20:03'),
(190, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:20:03'),
(191, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:20:06'),
(192, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:20:28'),
(193, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:27:14'),
(194, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:32:52'),
(195, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:02'),
(196, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:02'),
(197, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:02'),
(198, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:03'),
(199, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:03'),
(200, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:03'),
(201, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:05'),
(202, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:05'),
(203, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:05'),
(204, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:27'),
(205, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:27'),
(206, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:34:27'),
(207, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:40:37'),
(208, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:40:37'),
(209, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 17:40:37'),
(210, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:41:45'),
(211, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:41:46'),
(212, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:41:48'),
(213, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:42:13'),
(214, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:46:50'),
(215, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:46:51'),
(216, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:46:53'),
(217, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:47:18'),
(218, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:48:19'),
(219, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:48:20'),
(220, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:48:22'),
(221, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:48:35'),
(222, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:48:47'),
(223, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:54:24'),
(224, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 17:54:54'),
(225, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 18:05:21'),
(226, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 18:05:22'),
(227, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 18:05:23'),
(228, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 18:05:46'),
(229, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 18:12:36'),
(230, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 19:14:12'),
(231, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 19:18:10'),
(232, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 19:18:10'),
(233, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-09-30 19:18:10'),
(234, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 19:32:26'),
(235, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 19:32:59'),
(236, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-09-30 20:03:46'),
(237, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:20'),
(238, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:20'),
(239, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:20'),
(240, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:21'),
(241, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:21'),
(242, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:21'),
(243, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:23'),
(244, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:23'),
(245, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:23'),
(246, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:25'),
(247, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:25'),
(248, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:25'),
(249, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:51'),
(250, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:51'),
(251, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:43:51'),
(252, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:49:47'),
(253, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:49:47'),
(254, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 07:49:47'),
(255, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 09:40:58'),
(256, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 09:40:58'),
(257, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 09:40:58'),
(258, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:50'),
(259, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:50'),
(260, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:50'),
(261, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:51'),
(262, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:51'),
(263, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:51'),
(264, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:54'),
(265, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:54'),
(266, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:22:54'),
(267, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:23:20'),
(268, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:23:20'),
(269, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:23:20'),
(270, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:30:18'),
(271, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:30:18'),
(272, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 10:30:18'),
(273, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 12:16:14'),
(274, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 12:16:14'),
(275, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 12:16:14'),
(276, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:25'),
(277, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:25'),
(278, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:25'),
(279, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:26'),
(280, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:26'),
(281, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:26'),
(282, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:27'),
(283, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:27'),
(284, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:27'),
(285, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:29'),
(286, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:29'),
(287, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:29'),
(288, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:52'),
(289, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:52'),
(290, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:32:52'),
(291, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:38:51'),
(292, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:38:51'),
(293, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 13:38:51'),
(294, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 15:23:44'),
(295, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 15:23:44'),
(296, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 15:23:44'),
(297, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:42'),
(298, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:42'),
(299, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:42'),
(300, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:43'),
(301, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:43'),
(302, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:43'),
(303, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:45'),
(304, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:45'),
(305, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:03:45'),
(306, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:49'),
(307, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:49'),
(308, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:49'),
(309, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:51'),
(310, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:51'),
(311, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:51'),
(312, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:53'),
(313, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:53'),
(314, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:05:53'),
(315, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:06:17'),
(316, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:06:17'),
(317, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:06:17'),
(318, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:11'),
(319, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:11'),
(320, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:11'),
(321, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:12'),
(322, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:12'),
(323, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:12'),
(324, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:14'),
(325, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:14'),
(326, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:14'),
(327, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:41'),
(328, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:41'),
(329, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:09:41'),
(330, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:13:31'),
(331, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:13:31'),
(332, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 16:13:31'),
(333, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:16:39'),
(334, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:16:39'),
(335, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 16:16:39'),
(336, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 17:54:11'),
(337, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 17:54:11'),
(338, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-01 17:54:11'),
(339, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 17:59:26'),
(340, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 17:59:27'),
(341, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 17:59:27'),
(342, 1, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:18'),
(343, 2, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:18'),
(344, 4, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:18'),
(345, 1, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:19'),
(346, 2, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:19'),
(347, 4, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:19'),
(348, 1, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:21'),
(349, 2, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:21'),
(350, 4, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:21'),
(351, 1, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:46'),
(352, 2, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:46'),
(353, 4, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:37:46'),
(354, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:16'),
(355, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:17'),
(356, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:17'),
(357, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:17'),
(358, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:17'),
(359, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:17'),
(360, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:19'),
(361, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:19'),
(362, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:19'),
(363, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:46'),
(364, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:46'),
(365, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:43:46'),
(366, 1, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:43:52'),
(367, 2, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:43:52'),
(368, 4, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 18:43:52'),
(369, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:50:52'),
(370, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:50:52'),
(371, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:50:52'),
(372, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 18:53:00'),
(373, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 18:53:01'),
(374, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 18:53:03'),
(375, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 18:53:28'),
(376, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:32'),
(377, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:32'),
(378, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:32'),
(379, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:33'),
(380, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:33'),
(381, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:33'),
(382, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:35'),
(383, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:35'),
(384, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:56:35'),
(385, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:43'),
(386, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:43'),
(387, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:43'),
(388, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:44'),
(389, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:44'),
(390, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:44'),
(391, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:46'),
(392, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:46'),
(393, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:56:46'),
(394, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:57:00'),
(395, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:57:00'),
(396, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 18:57:00'),
(397, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:57:12'),
(398, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:57:12'),
(399, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 18:57:12'),
(400, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 18:59:26'),
(401, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:01:22'),
(402, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:01:23'),
(403, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:01:25'),
(404, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:01:50'),
(405, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:03:46'),
(406, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:03:46'),
(407, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:03:46'),
(408, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 19:04:09'),
(409, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 19:04:09'),
(410, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 19:04:09'),
(411, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:13'),
(412, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:13'),
(413, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:14'),
(414, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:15'),
(415, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:15'),
(416, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:15'),
(417, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:17'),
(418, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:18'),
(419, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:18'),
(420, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:06:36'),
(421, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:06:37'),
(422, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:06:39'),
(423, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:06:42'),
(424, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:06:42'),
(425, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:43'),
(426, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:43'),
(427, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:06:43'),
(428, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:06:44'),
(429, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:07:03'),
(430, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:07:09'),
(431, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:10:40'),
(432, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:10:40'),
(433, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:10:42'),
(434, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:11:08'),
(435, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:13:41'),
(436, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:13:47'),
(437, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:13:49'),
(438, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:13:49'),
(439, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 19:13:49'),
(440, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 19:17:11'),
(441, 1, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 20:30:50'),
(442, 2, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 20:30:50'),
(443, 4, 10, 'توجد محادثة جديدة', '. - Media Content', 0, '2024-10-01 20:30:50'),
(444, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 20:44:50'),
(445, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 20:44:50'),
(446, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-01 20:44:50'),
(447, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 20:50:36'),
(448, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 20:51:19'),
(449, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 21:01:42'),
(450, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 21:01:50'),
(451, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 21:01:50'),
(452, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 21:01:50'),
(453, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-01 21:02:03'),
(454, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:36'),
(455, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:36'),
(456, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:36'),
(457, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:37'),
(458, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:37'),
(459, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:37'),
(460, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:40'),
(461, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:40'),
(462, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:14:40'),
(463, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:15:06'),
(464, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:15:06'),
(465, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:15:06'),
(466, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:21:48'),
(467, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:21:48'),
(468, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-01 22:21:48'),
(469, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 00:14:02'),
(470, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 00:14:02'),
(471, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 00:14:02'),
(472, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:41'),
(473, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:41'),
(474, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:41'),
(475, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:43'),
(476, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:43'),
(477, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:43'),
(478, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:45'),
(479, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:45'),
(480, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:33:45'),
(481, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:34:11'),
(482, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:34:11'),
(483, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:34:11'),
(484, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:40:26'),
(485, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:40:26'),
(486, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 02:40:26'),
(487, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:29'),
(488, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:29'),
(489, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:29'),
(490, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:30'),
(491, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:30'),
(492, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:30'),
(493, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:33'),
(494, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:33'),
(495, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:33'),
(496, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:56'),
(497, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:56'),
(498, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:51:56'),
(499, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:57:59'),
(500, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:57:59'),
(501, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 03:57:59'),
(502, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 05:38:40'),
(503, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 05:38:40'),
(504, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-02 05:38:40'),
(505, 1, 15, 'توجد محادثة جديدة', '966920027707 - Media Content', 0, '2024-10-02 13:14:40'),
(506, 2, 15, 'توجد محادثة جديدة', '966920027707 - Media Content', 0, '2024-10-02 13:14:40'),
(507, 4, 15, 'توجد محادثة جديدة', '966920027707 - Media Content', 0, '2024-10-02 13:14:40'),
(508, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-02 21:35:09'),
(509, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-02 21:35:09'),
(510, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-02 21:35:09'),
(511, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-02 23:02:21'),
(512, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-02 23:41:14'),
(513, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-02 23:41:57'),
(514, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 02:06:28'),
(515, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 02:06:28'),
(516, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 02:06:28'),
(517, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 03:47:13'),
(518, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:09'),
(519, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:09'),
(520, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:09'),
(521, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:11'),
(522, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:11'),
(523, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:11'),
(524, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:13'),
(525, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:13'),
(526, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:14'),
(527, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:39'),
(528, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:39'),
(529, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:08:39'),
(530, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:15:33'),
(531, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:15:33'),
(532, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:15:33'),
(533, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:20'),
(534, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:20'),
(535, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:20'),
(536, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:21'),
(537, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:21'),
(538, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:21'),
(539, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:24'),
(540, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:24'),
(541, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:24'),
(542, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:53'),
(543, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:53'),
(544, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:22:53'),
(545, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:29:20'),
(546, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:29:20'),
(547, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 04:29:20'),
(548, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 06:24:42'),
(549, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 06:24:42'),
(550, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 06:24:42'),
(551, 1, 16, 'توجد محادثة جديدة', '9668001169999 - Media Content', 0, '2024-10-03 15:40:47'),
(552, 2, 16, 'توجد محادثة جديدة', '9668001169999 - Media Content', 0, '2024-10-03 15:40:47'),
(553, 4, 16, 'توجد محادثة جديدة', '9668001169999 - Media Content', 0, '2024-10-03 15:40:47'),
(554, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:45'),
(555, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:45'),
(556, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:45'),
(557, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:46'),
(558, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:46'),
(559, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:46'),
(560, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:49'),
(561, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:49'),
(562, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:16:49'),
(563, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:17:13'),
(564, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:17:13'),
(565, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:17:13');
INSERT INTO `user_notifications` (`id`, `user_id`, `inbox_id`, `title`, `body`, `viewed`, `created`) VALUES
(566, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 16:18:14'),
(567, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 16:18:15'),
(568, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 16:18:17'),
(569, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 16:18:40'),
(570, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:23:35'),
(571, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:23:35'),
(572, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 16:23:35'),
(573, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 16:25:18'),
(574, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 18:07:25'),
(575, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 18:07:25'),
(576, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-03 18:07:25'),
(577, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 18:17:31'),
(578, 1, 17, 'توجد محادثة جديدة', 'ابو وليد - السلام عليكم مساء الخير \nاحتاج تجديد جهاز التتبع', 0, '2024-10-03 19:03:01'),
(579, 2, 17, 'توجد محادثة جديدة', 'ابو وليد - السلام عليكم مساء الخير \nاحتاج تجديد جهاز التتبع', 0, '2024-10-03 19:03:01'),
(580, 4, 17, 'توجد محادثة جديدة', 'ابو وليد - السلام عليكم مساء الخير \nاحتاج تجديد جهاز التتبع', 0, '2024-10-03 19:03:01'),
(581, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:19:39'),
(582, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:19:40'),
(583, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:19:42'),
(584, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:20:10'),
(585, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:26:32'),
(586, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:26:33'),
(587, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:26:35'),
(588, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:26:59'),
(589, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:29:58'),
(590, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:29:59'),
(591, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:30:01'),
(592, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:30:25'),
(593, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:38'),
(594, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:38'),
(595, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:38'),
(596, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:40'),
(597, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:40'),
(598, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:40'),
(599, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:42'),
(600, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:42'),
(601, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:34:42'),
(602, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:34:48'),
(603, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:34:48'),
(604, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:34:50'),
(605, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:35:07'),
(606, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:35:07'),
(607, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:35:07'),
(608, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:35:15'),
(609, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:37:19'),
(610, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:41:38'),
(611, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:41:38'),
(612, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:41:38'),
(613, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:42:17'),
(614, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:53'),
(615, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:53'),
(616, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:53'),
(617, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:54'),
(618, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:54'),
(619, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:54'),
(620, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:56'),
(621, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:56'),
(622, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:43:56'),
(623, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:44:24'),
(624, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:44:24'),
(625, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:44:24'),
(626, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:22'),
(627, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:22'),
(628, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:22'),
(629, 1, 18, 'توجد محادثة جديدة', 'حمد بسطاوي - هلا', 0, '2024-10-03 19:45:23'),
(630, 2, 18, 'توجد محادثة جديدة', 'حمد بسطاوي - هلا', 0, '2024-10-03 19:45:23'),
(631, 4, 18, 'توجد محادثة جديدة', 'حمد بسطاوي - هلا', 0, '2024-10-03 19:45:23'),
(632, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:23'),
(633, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:24'),
(634, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:24'),
(635, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:26'),
(636, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:26'),
(637, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:26'),
(638, 1, 18, 'توجد محادثة جديدة', 'حمد بسطاوي - Media Content', 0, '2024-10-03 19:45:47'),
(639, 2, 18, 'توجد محادثة جديدة', 'حمد بسطاوي - Media Content', 0, '2024-10-03 19:45:47'),
(640, 4, 18, 'توجد محادثة جديدة', 'حمد بسطاوي - Media Content', 0, '2024-10-03 19:45:47'),
(641, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:54'),
(642, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:54'),
(643, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:45:54'),
(644, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:50:34'),
(645, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:50:34'),
(646, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 19:50:35'),
(647, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:51:29'),
(648, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:51:30'),
(649, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:51:32'),
(650, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:51:54'),
(651, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:52:28'),
(652, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:52:28'),
(653, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 19:52:28'),
(654, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 19:57:49'),
(655, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:29'),
(656, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:29'),
(657, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:29'),
(658, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:30'),
(659, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:30'),
(660, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:30'),
(661, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:32'),
(662, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:32'),
(663, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:32'),
(664, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:56'),
(665, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:56'),
(666, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:15:56'),
(667, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:22:18'),
(668, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:22:18'),
(669, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 20:22:18'),
(670, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 21:21:55'),
(671, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 21:24:17'),
(672, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 21:27:04'),
(673, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 21:27:04'),
(674, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-03 21:27:04'),
(675, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-03 21:50:02'),
(676, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 22:00:53'),
(677, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 22:00:53'),
(678, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-03 22:00:53'),
(679, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:25'),
(680, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:25'),
(681, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:25'),
(682, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:27'),
(683, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:27'),
(684, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:27'),
(685, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:29'),
(686, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:29'),
(687, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:29'),
(688, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:52'),
(689, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:53'),
(690, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:21:53'),
(691, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:28:43'),
(692, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:28:43'),
(693, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 05:28:43'),
(694, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 07:19:53'),
(695, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 07:19:53'),
(696, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 07:19:53'),
(697, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:01'),
(698, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:01'),
(699, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:01'),
(700, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:02'),
(701, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:02'),
(702, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:02'),
(703, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:04'),
(704, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:04'),
(705, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:04'),
(706, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:32'),
(707, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:32'),
(708, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:03:32'),
(709, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:09:38'),
(710, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:09:38'),
(711, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 11:09:38'),
(712, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 13:00:49'),
(713, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 13:00:49'),
(714, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 13:00:49'),
(715, 1, 19, 'توجد محادثة جديدة', '966920031726 - Media Content', 0, '2024-10-04 13:53:55'),
(716, 2, 19, 'توجد محادثة جديدة', '966920031726 - Media Content', 0, '2024-10-04 13:53:55'),
(717, 4, 19, 'توجد محادثة جديدة', '966920031726 - Media Content', 0, '2024-10-04 13:53:55'),
(718, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:44:17'),
(719, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:44:18'),
(720, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:44:21'),
(721, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:44:44'),
(722, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:51:42'),
(723, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:52:10'),
(724, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:52:11'),
(725, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:52:13'),
(726, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:52:39'),
(727, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:32'),
(728, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:32'),
(729, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:32'),
(730, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:33'),
(731, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:33'),
(732, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:33'),
(733, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:36'),
(734, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:36'),
(735, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:36'),
(736, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:59'),
(737, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:59'),
(738, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 15:57:59'),
(739, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 15:59:06'),
(740, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 16:04:09'),
(741, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 16:04:09'),
(742, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 16:04:09'),
(743, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:28'),
(744, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:28'),
(745, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:28'),
(746, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:29'),
(747, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:29'),
(748, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:29'),
(749, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:32'),
(750, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:32'),
(751, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:32'),
(752, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:56'),
(753, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:57'),
(754, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:11:57'),
(755, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:10'),
(756, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:10'),
(757, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:10'),
(758, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:11'),
(759, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:11'),
(760, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:11'),
(761, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:14'),
(762, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:14'),
(763, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:14'),
(764, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:38'),
(765, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:38'),
(766, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:15:38'),
(767, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:20:05'),
(768, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:20:06'),
(769, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:20:08'),
(770, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:20:35'),
(771, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:22:32'),
(772, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:22:32'),
(773, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:22:32'),
(774, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:27:01'),
(775, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:31:19'),
(776, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:52'),
(777, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:52'),
(778, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:52'),
(779, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:53'),
(780, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:53'),
(781, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:53'),
(782, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:56'),
(783, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:56'),
(784, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:32:56'),
(785, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:33:24'),
(786, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:33:24'),
(787, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:33:24'),
(788, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:39:34'),
(789, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:39:35'),
(790, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:39:37'),
(791, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:40:00'),
(792, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:23'),
(793, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:23'),
(794, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:23'),
(795, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:25'),
(796, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:25'),
(797, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:25'),
(798, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:27'),
(799, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:27'),
(800, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:27'),
(801, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:51'),
(802, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:51'),
(803, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:41:51'),
(804, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:43:14'),
(805, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:43:15'),
(806, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:43:17'),
(807, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:43:41'),
(808, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 17:44:50'),
(809, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 17:44:50'),
(810, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-04 17:44:50'),
(811, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:47:13'),
(812, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:48:26'),
(813, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:48:26'),
(814, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 17:48:26'),
(815, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:50:39'),
(816, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:57:23'),
(817, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:57:23'),
(818, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:57:25'),
(819, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 17:57:50'),
(820, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:12'),
(821, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:12'),
(822, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:12'),
(823, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:13'),
(824, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:13'),
(825, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:13'),
(826, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:15'),
(827, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:15'),
(828, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:15'),
(829, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:41'),
(830, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:41'),
(831, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 17:58:41'),
(832, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 18:05:03'),
(833, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 18:05:35'),
(834, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 18:05:35'),
(835, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 18:05:35'),
(836, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 19:12:56'),
(837, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 19:27:08'),
(838, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 19:28:04'),
(839, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 19:28:04'),
(840, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-04 19:28:04'),
(841, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 19:30:00'),
(842, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 19:49:24'),
(843, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 19:49:24'),
(844, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-04 19:49:24'),
(845, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-04 19:55:10'),
(846, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-05 21:28:22'),
(847, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-05 21:28:22'),
(848, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-05 21:28:22'),
(849, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-05 21:59:22'),
(850, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-05 21:59:22'),
(851, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-05 21:59:22'),
(852, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-05 22:54:11'),
(853, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-06 00:03:55'),
(854, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-06 00:03:55'),
(855, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-06 00:03:55'),
(856, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-06 00:31:59'),
(857, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-06 01:00:02'),
(858, 4, 11, 'لديك محادثة جديدة', 'محمد - Media Content', 0, '2024-10-06 01:08:07'),
(859, 1, 20, 'توجد محادثة جديدة', 'مضاوي ANB - مرحبا أ.سلطان \nمعاك مضاوي من المصرفية المميزة في البنك العربي', 0, '2024-10-06 14:44:23'),
(860, 2, 20, 'توجد محادثة جديدة', 'مضاوي ANB - مرحبا أ.سلطان \nمعاك مضاوي من المصرفية المميزة في البنك العربي', 0, '2024-10-06 14:44:23'),
(861, 4, 20, 'توجد محادثة جديدة', 'مضاوي ANB - مرحبا أ.سلطان \nمعاك مضاوي من المصرفية المميزة في البنك العربي', 0, '2024-10-06 14:44:23'),
(862, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:26'),
(863, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:26'),
(864, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:26'),
(865, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:27'),
(866, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:27'),
(867, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:27'),
(868, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:29'),
(869, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:29'),
(870, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:29'),
(871, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:54'),
(872, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:54'),
(873, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:22:54'),
(874, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:29:32'),
(875, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:29:32'),
(876, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-06 22:29:32'),
(877, 1, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-07 01:14:10'),
(878, 2, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-07 01:14:10'),
(879, 4, 12, 'توجد محادثة جديدة', 'قسم الاتصال المؤسسي - Media Content', 0, '2024-10-07 01:14:10'),
(880, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 03:54:32'),
(881, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 03:54:32'),
(882, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 03:54:33'),
(883, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:47'),
(884, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:47'),
(885, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:47'),
(886, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:48'),
(887, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:48'),
(888, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:48'),
(889, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:50'),
(890, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:50'),
(891, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:55:50'),
(892, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:56:16'),
(893, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:56:16'),
(894, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 12:56:16'),
(895, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 13:02:12'),
(896, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 13:02:12'),
(897, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 13:02:12'),
(898, 1, 21, 'توجد محادثة جديدة', 'شركة القرعاوى لقطع غيار تويوتا الاصلية - السلام عليكم ورحمة الله وبركاتة', 0, '2024-10-07 14:46:40'),
(899, 2, 21, 'توجد محادثة جديدة', 'شركة القرعاوى لقطع غيار تويوتا الاصلية - السلام عليكم ورحمة الله وبركاتة', 0, '2024-10-07 14:46:40'),
(900, 4, 21, 'توجد محادثة جديدة', 'شركة القرعاوى لقطع غيار تويوتا الاصلية - السلام عليكم ورحمة الله وبركاتة', 0, '2024-10-07 14:46:40'),
(901, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 14:54:25'),
(902, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 14:54:25'),
(903, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 14:54:25'),
(904, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:20'),
(905, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:20'),
(906, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:20'),
(907, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:20'),
(908, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:20'),
(909, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:20'),
(910, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:23'),
(911, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:23'),
(912, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:23'),
(913, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:49'),
(914, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:49'),
(915, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:21:49'),
(916, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:27:54'),
(917, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:27:54'),
(918, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:27:54'),
(919, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:28:00'),
(920, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:28:00'),
(921, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:28:00'),
(922, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:28:06'),
(923, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:28:06'),
(924, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:28:06'),
(925, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:28:39'),
(926, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:28:39'),
(927, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:28:39'),
(928, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:10'),
(929, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:10'),
(930, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:11'),
(931, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:11'),
(932, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:11'),
(933, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:11'),
(934, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:14'),
(935, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:14'),
(936, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:14'),
(937, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:40'),
(938, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:40'),
(939, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:30:40'),
(940, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:36:43'),
(941, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:36:43'),
(942, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 17:36:43'),
(943, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:31'),
(944, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:31'),
(945, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:31'),
(946, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:32'),
(947, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:32'),
(948, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:32'),
(949, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:35'),
(950, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:35'),
(951, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:53:35'),
(952, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:54:00'),
(953, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:54:00'),
(954, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 17:54:00'),
(955, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:00:07'),
(956, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:00:07'),
(957, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:00:07'),
(958, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:38'),
(959, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:38'),
(960, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:38'),
(961, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:40'),
(962, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:40'),
(963, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:40'),
(964, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:42'),
(965, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:42'),
(966, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:41:42'),
(967, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:42:07'),
(968, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:42:07'),
(969, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:42:08'),
(970, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:48:49'),
(971, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:48:49'),
(972, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:48:49'),
(973, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:14'),
(974, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:14'),
(975, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:14'),
(976, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:15'),
(977, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:15'),
(978, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:15'),
(979, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:17'),
(980, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:17'),
(981, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:17'),
(982, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:32'),
(983, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:32'),
(984, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:32'),
(985, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:33'),
(986, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:33'),
(987, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:33'),
(988, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:35'),
(989, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:35'),
(990, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:54:35'),
(991, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:40'),
(992, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:40'),
(993, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 18:54:40'),
(994, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:55:00'),
(995, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:55:00'),
(996, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 18:55:00'),
(997, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:01:10'),
(998, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:01:10'),
(999, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:01:10'),
(1000, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 19:01:29'),
(1001, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 19:01:29'),
(1002, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 19:01:29'),
(1003, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:14'),
(1004, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:14'),
(1005, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:14'),
(1006, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:14'),
(1007, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:14'),
(1008, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:14'),
(1009, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:16'),
(1010, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:16'),
(1011, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:16'),
(1012, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:43'),
(1013, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:43'),
(1014, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:16:43'),
(1015, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:22:38'),
(1016, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:22:38'),
(1017, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 19:22:38'),
(1018, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 20:52:39'),
(1019, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 20:52:39'),
(1020, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-07 20:52:39'),
(1021, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 21:05:25'),
(1022, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 21:05:25'),
(1023, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 21:05:25'),
(1024, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:14'),
(1025, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:14'),
(1026, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:14'),
(1027, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:16'),
(1028, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:16'),
(1029, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:16'),
(1030, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:42'),
(1031, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:42'),
(1032, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-07 23:59:42'),
(1033, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:11'),
(1034, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:11'),
(1035, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:11'),
(1036, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:12'),
(1037, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:12'),
(1038, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:12'),
(1039, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:15'),
(1040, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:15'),
(1041, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:15'),
(1042, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:40'),
(1043, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:40'),
(1044, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:03:40'),
(1045, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:10:22'),
(1046, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:10:22'),
(1047, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 00:10:22'),
(1048, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 01:53:09'),
(1049, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 01:53:09'),
(1050, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 01:53:09'),
(1051, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:29'),
(1052, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:29'),
(1053, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:29'),
(1054, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:30'),
(1055, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:30'),
(1056, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:30'),
(1057, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:32'),
(1058, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:32'),
(1059, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:32'),
(1060, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:56'),
(1061, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:56'),
(1062, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:49:56'),
(1063, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:56:03'),
(1064, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:56:03'),
(1065, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 02:56:03'),
(1066, 1, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 04:45:08'),
(1067, 2, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 04:45:08'),
(1068, 4, 13, 'توجد محادثة جديدة', 'خاص - Media Content', 0, '2024-10-08 04:45:08'),
(1069, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:15'),
(1070, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:15'),
(1071, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:15'),
(1072, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:16'),
(1073, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:16'),
(1074, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:16'),
(1075, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:18'),
(1076, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:18'),
(1077, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:18'),
(1078, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:41'),
(1079, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:41'),
(1080, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:35:41'),
(1081, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:41:44'),
(1082, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:41:44'),
(1083, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:41:44'),
(1084, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:07'),
(1085, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:07'),
(1086, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:07'),
(1087, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:08'),
(1088, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:08'),
(1089, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:09'),
(1090, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:11'),
(1091, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:11'),
(1092, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:11'),
(1093, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:36'),
(1094, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:36'),
(1095, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 11:59:36'),
(1096, 1, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 12:05:31'),
(1097, 2, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 12:05:31'),
(1098, 4, 14, 'توجد محادثة جديدة', 'عبدالله سالم - Media Content', 0, '2024-10-08 12:05:31'),
(1099, 1, 22, 'توجد محادثة جديدة', 'Ghada - السلام عليكم ورحمة الله وبركاته \nمساء الخير', 0, '2024-10-13 10:29:40'),
(1100, 2, 22, 'توجد محادثة جديدة', 'Ghada - السلام عليكم ورحمة الله وبركاته \nمساء الخير', 0, '2024-10-13 10:29:40'),
(1101, 4, 22, 'توجد محادثة جديدة', 'Ghada - السلام عليكم ورحمة الله وبركاته \nمساء الخير', 0, '2024-10-13 10:29:40'),
(1102, 1, 23, 'توجد محادثة جديدة', 'مشعل - السلام عليكم', 0, '2024-10-17 07:39:54'),
(1103, 2, 23, 'توجد محادثة جديدة', 'مشعل - السلام عليكم', 0, '2024-10-17 07:39:55'),
(1104, 4, 23, 'توجد محادثة جديدة', 'مشعل - السلام عليكم', 0, '2024-10-17 07:39:55'),
(1105, 1, 23, 'توجد محادثة جديدة', 'مشعل - ارسل الموقع', 0, '2024-10-17 07:40:06'),
(1106, 2, 23, 'توجد محادثة جديدة', 'مشعل - ارسل الموقع', 0, '2024-10-17 07:40:06'),
(1107, 4, 23, 'توجد محادثة جديدة', 'مشعل - ارسل الموقع', 0, '2024-10-17 07:40:06'),
(1108, 1, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - بدء المحادثة', 0, '2024-10-19 06:51:40'),
(1109, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - هلا بيك', 0, '2024-10-19 06:52:35'),
(1110, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - مرحبا', 0, '2024-10-19 07:41:05'),
(1111, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - مرحبا', 0, '2024-10-19 10:55:39'),
(1112, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - Hi', 0, '2024-10-19 13:33:29'),
(1113, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - Is This from aap', 0, '2024-10-19 13:33:38'),
(1114, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - app', 0, '2024-10-19 13:33:43'),
(1115, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - Yes', 0, '2024-10-19 13:41:06'),
(1116, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - Yes', 0, '2024-10-19 13:42:32'),
(1117, 2, 3, 'لديك محادثة جديدة', 'عبدالملك عثمان - hi', 0, '2024-10-19 14:23:44'),
(1118, 2, 24, 'لديك محادثة جديدة', '966500417638 - Hi', 0, '2024-10-20 06:32:25'),
(1119, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 06:44:31'),
(1120, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 06:44:40'),
(1121, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 06:58:42'),
(1122, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 07:10:32'),
(1123, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 07:11:34'),
(1124, 2, 24, 'لديك محادثة جديدة', '966500417638 - rgerg', 0, '2024-10-20 07:22:08'),
(1125, 2, 24, 'لديك محادثة جديدة', '966500417638 - efgerg', 0, '2024-10-20 07:22:46'),
(1126, 2, 24, 'لديك محادثة جديدة', '966500417638 - gwegwe', 0, '2024-10-20 07:23:17'),
(1127, 2, 24, 'لديك محادثة جديدة', '966500417638 - how are you?', 0, '2024-10-20 07:29:21'),
(1128, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 09:03:47'),
(1129, 2, 24, 'لديك محادثة جديدة', '966500417638 - how are you?', 0, '2024-10-20 09:14:52'),
(1130, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 09:23:18'),
(1131, 2, 24, 'لديك محادثة جديدة', '966500417638 - how are you', 0, '2024-10-20 09:25:09'),
(1132, 2, 24, 'لديك محادثة جديدة', '966500417638 - hhhh', 0, '2024-10-20 09:31:51'),
(1133, 2, 24, 'لديك محادثة جديدة', '966500417638 - sdgs', 0, '2024-10-20 09:35:48'),
(1134, 2, 24, 'لديك محادثة جديدة', '966500417638 - hhhh', 0, '2024-10-20 09:54:27'),
(1135, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 09:58:20'),
(1136, 2, 24, 'لديك محادثة جديدة', '966500417638 - ruban ruban', 0, '2024-10-20 10:28:53'),
(1137, 2, 24, 'لديك محادثة جديدة', '966500417638 - dffdffd', 0, '2024-10-20 10:37:16'),
(1138, 2, 24, 'لديك محادثة جديدة', '966500417638 - sdgsd', 0, '2024-10-20 10:37:46'),
(1139, 2, 24, 'لديك محادثة جديدة', '966500417638 - hi', 0, '2024-10-20 10:53:00'),
(1140, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:10'),
(1141, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:10'),
(1142, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:10');
INSERT INTO `user_notifications` (`id`, `user_id`, `inbox_id`, `title`, `body`, `viewed`, `created`) VALUES
(1143, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:11'),
(1144, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:11'),
(1145, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:11'),
(1146, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:12'),
(1147, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:12'),
(1148, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:12'),
(1149, 1, 7, 'توجد محادثة جديدة', '966555018868 - هلا ومرحبا', 0, '2024-10-20 12:35:12'),
(1150, 2, 7, 'توجد محادثة جديدة', '966555018868 - هلا ومرحبا', 0, '2024-10-20 12:35:12'),
(1151, 4, 7, 'توجد محادثة جديدة', '966555018868 - هلا ومرحبا', 0, '2024-10-20 12:35:12'),
(1152, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:14'),
(1153, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:14'),
(1154, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:14'),
(1155, 4, 7, 'لديك محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:35:37'),
(1156, 2, 24, 'لديك محادثة جديدة', 'Ruban R - hhh', 0, '2024-10-20 12:39:29'),
(1157, 2, 7, 'لديك محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 12:42:22'),
(1158, 2, 24, 'لديك محادثة جديدة', 'Ruban R - hi', 0, '2024-10-20 12:49:58'),
(1159, 2, 24, 'لديك محادثة جديدة', 'Ruban R - hi', 0, '2024-10-20 12:56:16'),
(1160, 2, 7, 'لديك محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-20 14:26:12'),
(1161, 2, 24, 'لديك محادثة جديدة', 'Ruban R - hi', 0, '2024-10-20 15:10:17'),
(1162, 2, 24, 'لديك محادثة جديدة', 'Ruban R - how are you', 0, '2024-10-20 15:11:38'),
(1163, 2, 24, 'لديك محادثة جديدة', 'Ruban R - hi malik', 0, '2024-10-20 15:20:26'),
(1164, 1, 25, 'توجد محادثة جديدة', '966551303515 - وين ماكنت بضغطة زر غازك يجيك\n*حمل تطبيق غازنا*✨\n\n*مميزات التطبيق*\nخاصية تتبع الطلب\nتوصيل اسرع\nسهولة الطلب\n\n*سعر التوصيل 15 ريال فقط لفترة محدودة*🔥🔥\n\n\n\n( ابل )\nhttps://apps.apple.com/us/app/%D8%BA%D8%A7%D8%B2%D9%86%D8%A7-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9/id6670285826\n\n ( اندرويد )\nhttps://play.google.com/store/apps/details?id=com.acwad.gazk_xxx&pli=1\n\nاو بتحميل التطبيق من خلال ابل ستور والمتجر باسم ( غازنا السعوديه )\n\nانشرووه لا يوقف🔥🔥\n', 0, '2024-10-20 15:52:04'),
(1165, 2, 25, 'توجد محادثة جديدة', '966551303515 - وين ماكنت بضغطة زر غازك يجيك\n*حمل تطبيق غازنا*✨\n\n*مميزات التطبيق*\nخاصية تتبع الطلب\nتوصيل اسرع\nسهولة الطلب\n\n*سعر التوصيل 15 ريال فقط لفترة محدودة*🔥🔥\n\n\n\n( ابل )\nhttps://apps.apple.com/us/app/%D8%BA%D8%A7%D8%B2%D9%86%D8%A7-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9/id6670285826\n\n ( اندرويد )\nhttps://play.google.com/store/apps/details?id=com.acwad.gazk_xxx&pli=1\n\nاو بتحميل التطبيق من خلال ابل ستور والمتجر باسم ( غازنا السعوديه )\n\nانشرووه لا يوقف🔥🔥\n', 0, '2024-10-20 15:52:04'),
(1166, 4, 25, 'توجد محادثة جديدة', '966551303515 - وين ماكنت بضغطة زر غازك يجيك\n*حمل تطبيق غازنا*✨\n\n*مميزات التطبيق*\nخاصية تتبع الطلب\nتوصيل اسرع\nسهولة الطلب\n\n*سعر التوصيل 15 ريال فقط لفترة محدودة*🔥🔥\n\n\n\n( ابل )\nhttps://apps.apple.com/us/app/%D8%BA%D8%A7%D8%B2%D9%86%D8%A7-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9/id6670285826\n\n ( اندرويد )\nhttps://play.google.com/store/apps/details?id=com.acwad.gazk_xxx&pli=1\n\nاو بتحميل التطبيق من خلال ابل ستور والمتجر باسم ( غازنا السعوديه )\n\nانشرووه لا يوقف🔥🔥\n', 0, '2024-10-20 15:52:04'),
(1167, 2, 24, 'لديك محادثة جديدة', 'Ruban R - hi', 0, '2024-10-21 06:00:18'),
(1168, 2, 24, 'لديك محادثة جديدة', 'Ruban R - hi', 0, '2024-10-21 06:38:01'),
(1169, 2, 24, 'لديك محادثة جديدة', 'Ruban R - hi', 0, '2024-10-21 07:31:45'),
(1170, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 15:36:10'),
(1171, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 15:36:10'),
(1172, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 15:36:10'),
(1173, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:43'),
(1174, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:43'),
(1175, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:43'),
(1176, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:44'),
(1177, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:44'),
(1178, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:44'),
(1179, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:46'),
(1180, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:46'),
(1181, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:44:46'),
(1182, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:45:11'),
(1183, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:45:11'),
(1184, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:45:11'),
(1185, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:52:24'),
(1186, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:52:24'),
(1187, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 16:52:24'),
(1188, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:09'),
(1189, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:09'),
(1190, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:09'),
(1191, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:10'),
(1192, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:10'),
(1193, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:10'),
(1194, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:12'),
(1195, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:12'),
(1196, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:12'),
(1197, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:35'),
(1198, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:35'),
(1199, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:11:35'),
(1200, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:18:05'),
(1201, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:18:05'),
(1202, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:18:05'),
(1203, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:32'),
(1204, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:33'),
(1205, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:33'),
(1206, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:34'),
(1207, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:35'),
(1208, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:36'),
(1209, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:38'),
(1210, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:39'),
(1211, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:29:40'),
(1212, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:30:06'),
(1213, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:30:06'),
(1214, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:30:06'),
(1215, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:36:13'),
(1216, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:36:13'),
(1217, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 17:36:13'),
(1218, 1, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 19:18:59'),
(1219, 2, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 19:19:00'),
(1220, 4, 7, 'توجد محادثة جديدة', '966555018868 - Media Content', 0, '2024-10-21 19:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_broadcasts`
--

CREATE TABLE `whatsapp_broadcasts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `whatsapp_channel_id` int NOT NULL,
  `template_id` int NOT NULL,
  `send_time` datetime NOT NULL,
  `cost` float NOT NULL,
  `contacts_count` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `whatsapp_broadcasts`
--

INSERT INTO `whatsapp_broadcasts` (`id`, `user_id`, `name`, `whatsapp_channel_id`, `template_id`, `send_time`, `cost`, `contacts_count`, `status`, `created`, `updated`) VALUES
(1, 1, 'test', 1, 9, '2024-09-23 18:16:14', 0.0812, 2, 'SENT', '2024-09-23 18:16:14', '2024-09-23 18:16:16'),
(2, 2, 'Test cast', 1, 9, '2024-09-24 08:14:30', 0.0812, 2, 'SENT', '2024-09-24 08:14:30', '2024-09-24 08:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_broadcasts_contacts`
--

CREATE TABLE `whatsapp_broadcasts_contacts` (
  `id` int NOT NULL,
  `whatsapp_broadcast_id` int NOT NULL,
  `contact_phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `whatsapp_broadcasts_contacts`
--

INSERT INTO `whatsapp_broadcasts_contacts` (`id`, `whatsapp_broadcast_id`, `contact_phone`) VALUES
(1, 1, '966556824160'),
(2, 1, '249123342124'),
(3, 2, '966552168008'),
(4, 2, '966556824160');

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_channels`
--

CREATE TABLE `whatsapp_channels` (
  `id` int NOT NULL,
  `channel_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_id` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `account_id` varchar(50) NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `is_deleted` int NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `whatsapp_channels`
--

INSERT INTO `whatsapp_channels` (`id`, `channel_id`, `name`, `phone_id`, `phone_number`, `account_id`, `app_id`, `secret_key`, `token`, `is_deleted`, `created`, `updated`) VALUES
(1, 1, 'WB(0555315999)', '383394578199374', '966555315999', '428968416963218', '471497852416957', 'ede9fb9b86bfefe91dcbdd9bd89e997b', 'EAAGs0yYBc70BOzmD8mODjub83tZAr561uxbDcHgdVWlmG8pxfZBJZCJgMN3t4XzajyY39DJCvr8pUwTEHace36ILiYg9dXf40NvVFUcZBosPwybVuo2VSSXA2S33PZCGTNgS4dXZAhNFjklhN8EOFm26zKnOZAKzLDw0nTnZAX834hSaIhOyGyukgqEB4rr9jzV45QZDZD', 0, '2024-05-07 04:16:53', '2024-09-15 16:58:53'),
(2, 2, 'WB(0555086030)', '461920357002589', '966555086030', '428968416963218', '471497852416957', NULL, 'EAAGs0yYBc70BOzmD8mODjub83tZAr561uxbDcHgdVWlmG8pxfZBJZCJgMN3t4XzajyY39DJCvr8pUwTEHace36ILiYg9dXf40NvVFUcZBosPwybVuo2VSSXA2S33PZCGTNgS4dXZAhNFjklhN8EOFm26zKnOZAKzLDw0nTnZAX834hSaIhOyGyukgqEB4rr9jzV45QZDZD', 0, '2024-10-19 19:46:46', '2024-10-19 19:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_template_cost`
--

CREATE TABLE `whatsapp_template_cost` (
  `id` int NOT NULL,
  `template_type` varchar(50) NOT NULL,
  `cost` float NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `whatsapp_template_cost`
--

INSERT INTO `whatsapp_template_cost` (`id`, `template_type`, `cost`, `created`) VALUES
(1, 'UTILITY', 0.0115, '2024-09-21 17:01:04'),
(2, 'MARKETING', 0.0406, '2024-09-21 17:01:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto_assign_setting`
--
ALTER TABLE `auto_assign_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `contact_import_id` (`contact_import_id`);

--
-- Indexes for table `contacts_imports`
--
ALTER TABLE `contacts_imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `contact_notes`
--
ALTER TABLE `contact_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `email_channels`
--
ALTER TABLE `email_channels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inbox_id` (`inbox_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `inbox_assigned_user`
--
ALTER TABLE `inbox_assigned_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inbox_id_2` (`inbox_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `inbox_id` (`inbox_id`);

--
-- Indexes for table `inbox_labels`
--
ALTER TABLE `inbox_labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `label_id` (`label_id`),
  ADD KEY `inbox_id` (`inbox_id`);

--
-- Indexes for table `inbox_results`
--
ALTER TABLE `inbox_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mentioned_inboxes`
--
ALTER TABLE `mentioned_inboxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inbox_id` (`inbox_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `mentioned_user_id` (`mentioned_user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`inbox_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages_button`
--
ALTER TABLE `messages_button`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `message_id` (`message_id`) USING BTREE;

--
-- Indexes for table `messages_template`
--
ALTER TABLE `messages_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `message_id` (`message_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replays`
--
ALTER TABLE `replays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `spam`
--
ALTER TABLE `spam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_channels`
--
ALTER TABLE `team_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `team_users`
--
ALTER TABLE `team_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `template_buttons`
--
ALTER TABLE `template_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `template_header`
--
ALTER TABLE `template_header`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_id` (`template_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `users_types`
--
ALTER TABLE `users_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `inbox_id` (`inbox_id`);

--
-- Indexes for table `whatsapp_broadcasts`
--
ALTER TABLE `whatsapp_broadcasts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `whatsapp_channel_id` (`whatsapp_channel_id`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `whatsapp_broadcasts_contacts`
--
ALTER TABLE `whatsapp_broadcasts_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `whatsapp_broadcast_id` (`whatsapp_broadcast_id`);

--
-- Indexes for table `whatsapp_channels`
--
ALTER TABLE `whatsapp_channels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_id` (`channel_id`) USING BTREE;

--
-- Indexes for table `whatsapp_template_cost`
--
ALTER TABLE `whatsapp_template_cost`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auto_assign_setting`
--
ALTER TABLE `auto_assign_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `contacts_imports`
--
ALTER TABLE `contacts_imports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_notes`
--
ALTER TABLE `contact_notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `email_channels`
--
ALTER TABLE `email_channels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inboxes`
--
ALTER TABLE `inboxes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `inbox_assigned_user`
--
ALTER TABLE `inbox_assigned_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `inbox_labels`
--
ALTER TABLE `inbox_labels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `inbox_results`
--
ALTER TABLE `inbox_results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mentioned_inboxes`
--
ALTER TABLE `mentioned_inboxes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- AUTO_INCREMENT for table `messages_button`
--
ALTER TABLE `messages_button`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages_template`
--
ALTER TABLE `messages_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replays`
--
ALTER TABLE `replays`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spam`
--
ALTER TABLE `spam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_channels`
--
ALTER TABLE `team_channels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_users`
--
ALTER TABLE `team_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `template_buttons`
--
ALTER TABLE `template_buttons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `template_header`
--
ALTER TABLE `template_header`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_types`
--
ALTER TABLE `users_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1221;

--
-- AUTO_INCREMENT for table `whatsapp_broadcasts`
--
ALTER TABLE `whatsapp_broadcasts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `whatsapp_broadcasts_contacts`
--
ALTER TABLE `whatsapp_broadcasts_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `whatsapp_channels`
--
ALTER TABLE `whatsapp_channels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `whatsapp_template_cost`
--
ALTER TABLE `whatsapp_template_cost`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auto_assign_setting`
--
ALTER TABLE `auto_assign_setting`
  ADD CONSTRAINT `auto_assign_setting_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_fk1` FOREIGN KEY (`contact_import_id`) REFERENCES `contacts_imports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contacts_fk2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `contacts_imports`
--
ALTER TABLE `contacts_imports`
  ADD CONSTRAINT `contacts_imports_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `contact_notes`
--
ALTER TABLE `contact_notes`
  ADD CONSTRAINT `contact_notes_fk1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `contact_notes_fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_fk1` FOREIGN KEY (`inbox_id`) REFERENCES `inboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD CONSTRAINT `inboxes_fk1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inboxes_fk2` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inbox_assigned_user`
--
ALTER TABLE `inbox_assigned_user`
  ADD CONSTRAINT `assigned_contacts_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_contacts_fk2` FOREIGN KEY (`inbox_id`) REFERENCES `inboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inbox_labels`
--
ALTER TABLE `inbox_labels`
  ADD CONSTRAINT `labeled_inboxes_fk1` FOREIGN KEY (`inbox_id`) REFERENCES `inboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `labeled_inboxes_fk2` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mentioned_inboxes`
--
ALTER TABLE `mentioned_inboxes`
  ADD CONSTRAINT `mentioned _inboxes_fk1` FOREIGN KEY (`inbox_id`) REFERENCES `inboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mentioned _inboxes_fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mentioned _inboxes_fk3` FOREIGN KEY (`mentioned_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_fk1` FOREIGN KEY (`inbox_id`) REFERENCES `inboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages_button`
--
ALTER TABLE `messages_button`
  ADD CONSTRAINT `messages_button_fk1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages_template`
--
ALTER TABLE `messages_template`
  ADD CONSTRAINT `messages_template_fk1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_template_fk2` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `spam`
--
ALTER TABLE `spam`
  ADD CONSTRAINT `spam_fk1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `spam_fk2` FOREIGN KEY (`user_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_channels`
--
ALTER TABLE `team_channels`
  ADD CONSTRAINT `team_channels_fk1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_channels_fk2` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_users`
--
ALTER TABLE `team_users`
  ADD CONSTRAINT `team_users_fk1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_users_fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `templates`
--
ALTER TABLE `templates`
  ADD CONSTRAINT `templates_fk1` FOREIGN KEY (`channel_id`) REFERENCES `whatsapp_channels` (`id`);

--
-- Constraints for table `template_buttons`
--
ALTER TABLE `template_buttons`
  ADD CONSTRAINT `template_buttons_fk1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `template_header`
--
ALTER TABLE `template_header`
  ADD CONSTRAINT `template_header_fk1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `users_types` (`id`);

--
-- Constraints for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_notifications_fk2` FOREIGN KEY (`inbox_id`) REFERENCES `inboxes` (`id`);

--
-- Constraints for table `whatsapp_broadcasts`
--
ALTER TABLE `whatsapp_broadcasts`
  ADD CONSTRAINT `whatsapp_channels_fk2` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `whatsapp_channels_fk3` FOREIGN KEY (`whatsapp_channel_id`) REFERENCES `whatsapp_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `whatsapp_broadcasts_contacts`
--
ALTER TABLE `whatsapp_broadcasts_contacts`
  ADD CONSTRAINT `broadcasts_contacts_fk1` FOREIGN KEY (`whatsapp_broadcast_id`) REFERENCES `whatsapp_broadcasts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `whatsapp_channels`
--
ALTER TABLE `whatsapp_channels`
  ADD CONSTRAINT `whatsapp_channels_fk1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
