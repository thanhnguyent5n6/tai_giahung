-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2018 at 10:21 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vinhngan`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
`id` int(10) unsigned NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`, `status`) VALUES
(21, 24, '2018-05-30', 747000, 'COD', 'Giao hàng trước 5h chiều', '2018-05-30 14:57:00', '2018-05-30 14:57:00', 1),
(11, 11, '2017-03-21', 420000, 'COD', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09', 1),
(22, 25, '2018-06-13', 728000, 'COD', '', '2018-06-13 00:07:32', '2018-06-13 00:07:32', 1),
(23, 26, '2018-06-13', 30000, 'COD', 'Khoong', '2018-06-13 00:13:23', '2018-06-13 00:13:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE IF NOT EXISTS `bill_detail` (
`id` int(10) unsigned NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(14, 12, 63, 2, 200000, '2018-05-30 13:14:17', '2017-03-21 07:20:07'),
(12, 11, 11, 1, 120000, '2018-05-30 13:14:20', '2017-03-21 07:16:09'),
(23, 21, 13, 3, 239000, '2018-05-30 14:57:00', '2018-05-30 14:57:00'),
(22, 21, 7, 1, 30000, '2018-05-30 14:57:00', '2018-05-30 14:57:00'),
(24, 22, 2, 5, 50000, '2018-06-13 00:07:32', '2018-06-13 00:07:32'),
(25, 22, 13, 2, 239000, '2018-06-13 00:07:32', '2018-06-13 00:07:32'),
(26, 23, 7, 1, 30000, '2018-06-13 00:13:23', '2018-06-13 00:13:23');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(24, 'Thành Nguyên', 'nam', 'thanhnguyen.t5n6@gmail.com', 'Từ Liêm, Hà Nội', '09888877878', 'Giao hàng trước 5h chiều', '2018-05-30 14:57:00', '2018-05-30 14:57:00'),
(12, 'Nguyên', 'Nam', 'khoapham@gmail.com', 'Hà Nội', '1234567890', 'Vui lòng chuyển đúng hạn', '2018-05-30 13:07:05', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Từ Liêm, Hà Nội', '234567890-', 'không chú', '2018-05-30 13:07:12', '2017-03-21 07:16:09'),
(22, 'Nam', 'nam', 'A@gmail.com', 'Hà Nội', '123', 'Nhanh', '2018-05-15 06:16:46', '2018-05-15 06:16:46'),
(25, 'Thảo Nguyễn Ngọc', 'nam', 'ngocthao.t4k5@gmail.com', 'Hà Nội', '0164542154', '', '2018-06-13 00:07:32', '2018-06-13 00:07:32'),
(26, 'Nguyên Thành', 'nam', 'admin@gmail.com', 'Hà Nội', '123', 'Khoong', '2018-06-13 00:13:23', '2018-06-13 00:13:23');

-- --------------------------------------------------------

--
-- Table structure for table `customer_account`
--

CREATE TABLE IF NOT EXISTS `customer_account` (
`id` int(10) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_account`
--

INSERT INTO `customer_account` (`id`, `email`, `name`, `password`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'ngocthao.t4k5@gmail.com', 'Ngọc Thảo', '$2y$10$bAXKU5bH8DLsoV2dNBDofuTPbGmyJ.YWLjPlaZcUSgYpiXjEUHwHK', '0634654', 'Hà Nội', '2018-06-12 20:47:30', '2018-06-12 20:47:30'),
(2, 'A@gmail.com', 'a', '$2y$10$fV/HunCigpCfuHBmu8nW7OFMftia/aS8jF7kvuBb7m81BZ.8Xf2z.', '123', 'Hà Nội', '2018-06-12 21:07:19', '2018-06-12 21:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2018_06_12_132425_create_admins_table', 1),
('2018_06_13_032210_create_customer_account_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(2, 'JUMBO CHICKEN BURGER', 4, '', 50000, 0, 'jumbo.png', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'BURGER GÀ CAY', 4, '', 49000, 0, 'gacay.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'BURGER TÔM', 4, '', 45000, 0, 'tom.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'BULGOGI BURGER', 4, 'Burger với sốt Bulgogi mang hương vị truyền thống từ Hàn Quốc hòa quyện cùng nhân thịt bò Úc hảo hạng', 42000, 0, 'bulgogi.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'BURGER GÀ THƯỢNG HẠNG', 4, 'Burger với nguồn nguyên liệu gà được chọn lọc kĩ càng, độ tươi ngon nguyên vẹn được giữ trọn trong chiếc bánh.', 42000, 0, 'gavip.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'BURGER PHÔ MAI', 4, 'Phô mai hảo hạng tan chảy trên nhân bò thơm ngon kết hợp với rau tươi và sốt đặc trưng mang đến một trải nghiệm khó quên.', 32000, 30000, 'phomai.png', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'BURGER BÒ TERIYAKI', 4, '', 29000, 0, 'boteri.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(11, 'WOW BURGER', 4, '', 25000, 0, 'wow.png', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, 'BURGER GÀ', 4, '', 25000, 0, 'ga.png', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'FAMILY SET 2', 6, '06 Gà rán  01 Bulgogi Burger  01 Cá Nugget  03 Pepsi (M)  02 Tornado (Blueberry, Chocolate)', 251000, 239000, 'familyset2.png', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'FAMILY SET 1', 6, ' 01 Burger Bulgogi  01 Burger Tôm  02 Gà Rán  01 Khoai Tây Lắc  02 Pepsi (M)', 151000, 139000, 'familyset1.png', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'BIG STAR COMBO', 6, '01 Big Star  01 </br> Khoai tây chiên (M)  01 Pepsi (M)', 81000, 0, 'bigstarcombo.png', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'BURGER GÀ CAY COMBO', 6, '01 Burger Hot & Spicy Chicken  01 Khoai tây chiên (M)  01 Pepsi (M)', 78000, 75000, 'bergergacaycombo.png', 'hộp', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'BURGER TÔM COMBO', 6, '01 Burger Tôm  01 Khoai tây chiên (M)  01 Pepsi (M)', 74000, 71000, 'bergertomcombo.png', 'cai', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, 'BULGOGI COMBO', 6, '01 Burgur Bulgogi  01 Khoai tây chiên (M)  01 Pepsi (M)', 71000, 0, 'bulgogicombo.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'BURGER GÀ THƯỢNG HẠNG COMBO', 6, '01 Burger Gà thượng hạng  01 Khoai tây chiên (M)  01 Pepsi (M)', 71000, 0, 'bergergavipcombo.png', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'BURGER PHÔ MAI COMBO', 6, '01 Burger Phô Mai  01 Khoai tây chiên (M)  01 Pepsi (M)', 61000, 0, 'bergerfomatcombo.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, 'BURGER CÁ COMBO', 6, '01 Burger Cá  01 Khoai tây chiên (M)  01 Pepsi (M)', 61000, 0, 'burdercacombo.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'BIG STAR VALUE', 1, '01 Big Star  01 Miếng gà rán  01 Pepsi (M)', 88000, 0, 'bigstarvalue.png', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'BURGER GÀ CAY VALUE', 1, '01 Burger Gà cay  01 Miếng gà rán  01 Pepsi (M)', 85000, 0, 'v_bggacay.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'BURGER TÔM VALUE', 1, '01 Burger Tôm  01  Miếng gà rán  01 Pepsi (M)', 81000, 79000, 'v_bgtom.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'BULGOGI VALUE', 1, '01 Bulgogi Burger  01 Miếng gà rán  01 Pepsi (M)', 78000, 0, 'v_bul.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'BURGER PHÔ MAI VALUE', 1, '01 Burger Phô mai  01  Miếng gà rán  01 Pepsi (M)', 68000, 66000, 'v_bgformat.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(63, 'BURGER GÀ THƯỢNG HẠNG VALUE', 1, '01 Burger Gà Thượng Hạng\r\n\r\n01 Miếng gà rán\r\n\r\n01 Pepsi (M)', 78000, 0, 'v_bggavip.png', NULL, 0, NULL, NULL),
(64, 'GÀ RÁN PHẦN', 5, 'Gà rán phần:  81,000\r\n\r\nGà H&S phần: 83,000\r\n\r\nGà Sốt đậu phần: 83,000\r\n\r\nGà phô mai: 85,000 ', 81000, 0, 'g_ranphan.png', NULL, 0, NULL, NULL),
(65, 'GÀ SỐT PHÔ MAI (1 MIẾNG)', 5, '1 miếng: 37,000\r\n\r\n3 miếng: 104,000\r\n\r\n6 miếng: 201,000\r\n\r\n9 miếng: 301,000', 37000, 0, 'g_sotphomai11.png', NULL, 0, NULL, NULL),
(66, 'GÀ H&S (1 MIẾNG)', 5, '1 miếng: 36,000\r\n\r\n3 miếng: 101,000\r\n\r\n6 miếng: 195,000\r\n\r\n9 miếng: 292,000', 36000, 0, 'g_hs.png', NULL, 1, NULL, NULL),
(67, 'GÀ SỐT ĐẬU (1 MIẾNG)', 5, '1 miếng: 36,000\r\n\r\n3 miếng: 101,000\r\n\r\n6 miếng: 195,000\r\n\r\n9 miếng: 292,000', 36000, 0, 'g_sotdau.png', NULL, 0, NULL, NULL),
(68, 'GÀ RÁN (1 MIẾNG)', 5, '1 miếng: 35,000\r\n\r\n3 miếng: 98,000\r\n\r\n6 miếng: 189,000\r\n\r\n9 miếng: 283,000', 35000, 0, 'g_ran1mieng.png', NULL, 1, NULL, NULL),
(69, 'CHICKEN TENDER (3 MIẾNG)', 5, NULL, 25000, 0, 'g_chickentender.png', NULL, 0, NULL, NULL),
(70, 'CƠM THỊT HEO SỐT CAY', 3, NULL, 43000, 0, 'c_heocay.png', NULL, 0, NULL, NULL),
(71, 'CƠM THỊT HEO BULGOGI', 3, NULL, 43000, 0, 'c_comheobul.png', NULL, 0, NULL, NULL),
(72, 'CƠM THỊT HEO PHÔ MAI', 3, NULL, 40000, 0, 'c_comheoformat.png', NULL, 0, NULL, NULL),
(73, 'CƠM GÀ VIÊN', 3, NULL, 43000, 0, 'c_gavien.png', NULL, 0, NULL, NULL),
(74, 'CƠM GÀ SỐT ĐẬU', 3, NULL, 43000, 0, 'c_gasotdau.png', NULL, 1, NULL, NULL),
(75, 'CƠM THỊT BÒ', 3, NULL, 43000, 0, 'c_bo.png', NULL, 0, NULL, NULL),
(76, 'GÀ LẮC', 7, 'Những viên thịt gà không xương ngon ngọt hòa quyện cùng hương vị phô mai chất lượng, càng ăn càng ngon.', 42000, 0, 't_galac.png', NULL, 0, NULL, NULL),
(77, 'KHOAI TÂY LẮC', 7, '', 38000, 0, 't_khoaitaylac.png', NULL, 0, NULL, NULL),
(78, 'GÀ VIÊN', 7, NULL, 37000, 0, 't_gavien.png', NULL, 0, NULL, NULL),
(79, 'PHÔ MAI QUE', 7, 'Nguyên liệu nhập khẩu 100% Hàn Quốc với lớp vỏ chiên giòn, bên trong lớp phô mai dai béo thơm ngon.', 30000, 0, 't_phomaique.png', NULL, 0, NULL, NULL),
(80, 'MỰC RÁN (3 MIẾNG)', 7, '3 miếng: 26,000\r\n\r\n5 miếng: 40,000', 26000, 0, 't_mucran.png', NULL, 0, NULL, NULL),
(81, 'CÁ NUGGET ( 4 MIẾNG)', 7, NULL, 25000, 0, 't_canug.png', NULL, 1, NULL, NULL),
(82, 'BÁNH CÁ', 7, '3 cái: 25,000\r\n\r\n5 cái: 35,000', 25000, 0, 't_banhca.png', NULL, 0, NULL, NULL),
(83, 'BÁNH RÁN', 7, NULL, 15000, 0, 't_banhran.png', NULL, 0, NULL, NULL),
(84, 'TRÀ SỮA TRÂN CHÂU CARAMEL', 2, NULL, 28000, 0, 'u_chanchau.png', NULL, 1, NULL, NULL),
(86, 'KEM MAGIC POP TORNADO', 2, NULL, 25000, 0, 'u_kem.png', NULL, 1, NULL, NULL),
(87, 'LEMONADE BLUE OCEAN', 2, NULL, 25000, 0, 'u_lemon.png', NULL, 0, NULL, NULL),
(88, 'LEMONADE HIBISCUS', 2, NULL, 25000, 0, 'u_lemonh.png', NULL, 1, NULL, NULL),
(89, 'KEM SÔCÔLA TORNADO', 2, NULL, 25000, 0, 'u_kemsocola.png', NULL, 0, NULL, NULL),
(98, 'Big Star', 4, '', 52000, 49000, '1527523809bigstar.png', NULL, 1, NULL, NULL),
(99, 'Trà sữa pudding', 2, '', 25000, 0, '1527524173u_pudding.png', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE IF NOT EXISTS `slide` (
`id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(2, '', '2.png'),
(3, '', '3.png'),
(4, '', '4.png'),
(6, '', '15277367281.png');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE IF NOT EXISTS `type_products` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'VALUE', '<p>ab</p>\r\n', 'banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(2, 'Nước uống', '', '20131108144733.jpg', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Cơm', '', 'banhtraicay.jpg', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'BURGER', '', 'banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Gà', '', 'crepe.jpg', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'COMBO', '', 'pizza.jpg', '2016-10-25 17:19:00', NULL),
(7, 'Tráng miệng', '', 'sukemdau.jpg', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyên Thành', 'thanhnguyen.t5n6@gmail.com', '$2y$10$5BSu4C4Wdi5uZguKLM5wIuXtNe.Qdqb6/Eh2btGlXiuEeNdbt1BGi', 'zjaIBWOdJ9Ct56xBfut02GHVHPRqBkazpEgnYFibmV7WTHs0nUsbDWh2auBQ', '2018-06-12 06:31:47', '2018-06-12 20:44:33'),
(2, 'Nguyên A', 'haui@gmail.com', '$2y$10$dBMwuMV.zwdw3EXecmmYt.jY33TgMpC9stxbyq18O6HfficasZjM.', 'Y2LsNevtGaipgJaRhBegcldL0zGSkhBC8mtitlXrkhtkTaubOIGCVNC2HLXh', '2018-06-12 20:44:47', '2018-06-12 20:44:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
 ADD PRIMARY KEY (`id`), ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
 ADD PRIMARY KEY (`id`), ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_account`
--
ALTER TABLE `customer_account`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`), ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`), ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `customer_account`
--
ALTER TABLE `customer_account`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
