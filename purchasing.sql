-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 05:35 AM
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
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `backup`
--

CREATE TABLE `backup` (
  `id_backup` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `backup`
--

INSERT INTO `backup` (`id_backup`, `file_name`, `file_path`, `created_at`) VALUES
(1, 'backup-20241107-113018.sql.zip', 'files/backup/backup-20241107-113018.sql.zip', '2024-11-07 11:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `id_dept` int(11) NOT NULL,
  `nama_dept` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES
(1, 'QA/QC'),
(2, 'HRGA'),
(3, 'Finance and Accounting'),
(4, 'Purchasing'),
(5, 'HSE'),
(6, 'Maintenance'),
(7, 'Store'),
(8, 'PPIC'),
(9, 'Facility'),
(10, 'Production'),
(11, 'Project');

-- --------------------------------------------------------

--
-- Table structure for table `departemen_bagian`
--

CREATE TABLE `departemen_bagian` (
  `id_bagian_dept` int(11) NOT NULL,
  `nama_bagian_dept` varchar(100) NOT NULL,
  `id_dept` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `departemen_bagian`
--

INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES
(1, 'Administrator', 9),
(5, 'IT', 9),
(6, 'GA', 2),
(7, 'Finance and Accounting', 3),
(8, 'HR', 2),
(10, 'Safety', 5),
(11, 'Maintenance', 6),
(12, 'Planner', 8),
(13, 'Production', 10),
(14, 'Purchasing', 4),
(15, 'QA', 1),
(16, 'QC', 1),
(17, 'Warehouse', 7),
(18, 'Logistic & Marketing', 7),
(19, 'Project', 11),
(20, 'Laboratorium', 1);

-- --------------------------------------------------------

--
-- Table structure for table `informasi`
--

CREATE TABLE `informasi` (
  `id_informasi` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `subject` varchar(35) NOT NULL,
  `pesan` varchar(250) NOT NULL,
  `id_user` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `informasi`
--

INSERT INTO `informasi` (`id_informasi`, `tanggal`, `subject`, `pesan`, `id_user`) VALUES
(1, '2022-07-20 07:20:50', 'Ganti Password', 'Demi keamanan, pengguna sistem diharuskan mengganti password', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'Administrator'),
(3, 'Staff'),
(5, 'Supervisor'),
(6, 'Manager'),
(7, 'Director'),
(8, 'Senior Manager'),
(9, 'Assistant Manager'),
(10, 'Coordinator');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Hardware'),
(2, 'Software'),
(3, 'Request'),
(4, 'Service');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_sub`
--

CREATE TABLE `kategori_sub` (
  `id_sub_kategori` int(11) NOT NULL,
  `nama_sub_kategori` varchar(35) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kategori_sub`
--

INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES
(1, 'Server', 3),
(2, 'PC / Desktop', 1),
(3, 'Laptop', 1),
(4, 'Printer / Scanner / Mesin Foto Copy', 1),
(6, 'Adobe Reader PDF', 4),
(10, 'Microsoft Office', 4),
(11, 'Others', 4),
(12, 'Data Restore', 3),
(13, 'Password Reset', 3),
(14, 'Installasi CCTV', 3),
(15, 'Installasi Jaringan / Telephone', 3),
(16, 'Installasi Aplikasi', 3),
(17, 'Email Outlook', 4),
(18, 'File Storage', 4),
(21, 'Internet', 4),
(25, 'VPN', 3);

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL,
  `lokasi` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `lokasi`) VALUES
(1, 'RTM 1 - G7'),
(2, 'RTM 1 - G5'),
(3, 'RTM 1 - G6'),
(4, 'RTM 2'),
(5, 'RTM 3');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nik` varchar(50) NOT NULL DEFAULT '',
  `nama` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `telp` char(25) DEFAULT NULL,
  `id_bagian_dept` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES
('admin', 'Administrator', 'admin@gmail.com', '082123456789', 1, 1),
('RTM-0293', 'Hamidjah', 'hamidjah@rainbowtubulars.com', '081261310209', 16, 6),
('RTM-0306', 'Rora Ustira Mala', 'lala@rainbowtubulars.com', '081364672187', 8, 6),
('RTM-0398', 'Yelki Argha', 'hse@rainbowtubulars.com', '081356898095', 10, 3),
('RTM-0408', 'Yusbar', 'yusbar@rainbowtubulars.com', '081270160818', 20, 3),
('RTM-0414', 'Enni F Tambunan', 'logistic@rainbowtubulars.com', '082288420059', 18, 3),
('RTM-0420', 'Herry Susanto', 'herry@rainbowtubulars.com', '081536603228', 16, 10),
('RTM-0430', 'Ahmad Nasution', 'ahmad_nasution@rainbowtubulars.com', '085765138537', 17, 10),
('RTM-0431', 'Rendy', 'rendy@rainbowtubulars.com', '0895349755613', 12, 5),
('RTM-0453', 'Julian Ngantung', 'qaqcinspector@rainbowtubulars.com', '082286408353', 16, 3),
('RTM-0462', 'Nikson Nainggolan', 'nikson@rainbowtubulars.com', '081372462764', 15, 3),
('RTM-0486', 'Radiana', 'anna@rainbowtubulars.com', '081275310975', 15, 5),
('RTM-0491', 'Tju Ket Li', 'ketli@rainbowtubulars.com', '0895711649000', 16, 3),
('RTM-0533', 'Arya Andriawan', 'support@rainbowtubulars.com', '082170082125', 5, 3),
('RTM-0534', 'Andy Dwiyanto', 'andy@rainbowtubulars.com', '082213472425', 19, 5),
('RTM-0535', 'Denny Triyatmoko', 'deny@rainbowtubulars.com', '081268604625', 12, 8),
('RTM-0538', 'Dwi Ilham Vanradj', 'planner@rainbowtubulars.com', '082169641367', 12, 3),
('RTM-0605', 'Angelica', 'ppicstaff@rainbowtubulars.com', '08985981051', 12, 3),
('RTM-0616', 'Wendy Venda Wahyuni T', 'qastaff@rainbowtubulars.com', '085364209145', 15, 3),
('RTM-0623', 'Deni Satria', 'lab@rainbowtubulars.com', '085265726486', 20, 3),
('RTM-0634', 'Kelvin', 'admini.store@rainbowtubulars.com', '081370413417', 17, 3),
('RTM-0636', 'Aisyah Dewi Pelita', 'hr-ga@rainbowtubulars.com', '089685828283', 6, 3),
('RTM-0637', 'Heriyono', 'support@rainbowtubulars.com', '087793643877', 5, 3),
('RTM-0653', 'M.Al Faridzi Aghnia', 'hse@rainbowtubulars.com', '081330025598', 10, 3),
('RTM-0659', 'Widia', 'widia@rainbowtubulars.com', '08561916101', 7, 8),
('RTM-0660', 'Kathlen Anatasya', 'purchasingstaff3@rainbowtubulars.com', '0895605333958', 14, 3),
('RTM-0666', 'Rio Aditia Pardede', 'facilitystaff@rainbowtubulars.com', '081238778648', 1, 3),
('RTM-0673', 'Agus Widodo', 'equipmentengineer@rainbowtubulars.com', '083802107102', 11, 3),
('RTM-0674', 'Annisa Latif', 'purchasing@rainbowtubulars.com', '0895414459468', 14, 3),
('RTM-0695', 'Faqrul Rozi', 'rozi@rainbowtubulars.com', '085836603066', 17, 5),
('RTM-0696', 'Nurmanita Desy Sasriani', 'nurma@rainbowtubulars.com', '089688351040', 7, 5),
('RTM-0702', 'Yesseventin Nofyana', 'ddcofficer@rainbowtubulars.com', '082348357955', 15, 3),
('RTM-0707', 'Marvina', 'qcstaff@rainbowtubulars.com', '082172028336', 16, 3),
('RTM-0708', 'Wiston Pasaribu', 'hse@rainbowtubulars.com', '082249497070', 10, 3),
('RTM-0714', 'Farras Harits Febriadin', 'hse@rainbowtubulars.com', '08126841994', 10, 3),
('RTM-0715', 'Rino', 'hse@rainbowtubulars.com', '085272880967', 10, 3),
('RTM-0716', 'Febriana Situmorang', 'financestaff2@rainbowtubulars.com', '089623161075', 7, 3),
('RTM-0717', 'Dimas Alif Saputra', '-', '082175797053', 19, 3),
('RTM-0726', 'Romauli Lubis', 'maintenancestaff@rainbowtubulars.com', '082226192723', 11, 3),
('RTM-0732', 'Vicca Ediwibowo', 'hrtrainer@rainbowtubulars.com', '081288810024', 8, 3),
('RTM-0734', 'Yoga Mahardika', 'ga@rainbowtubulars.com', '082171099174', 6, 3),
('RTM-0746', 'Indah Dwi Andini', 'purchasingstaff2@rainbowtubulars.com', '081314465605', 14, 3),
('RTM-0763', 'Dedye', 'dedye@rainbowtubulars.com', '082111495577', 7, 9),
('RTM-0767', 'M. Fauzi', '-', '082174420255', 19, 3),
('RTM-0774', 'Delen Jasika', 'ppicstaff2@rainbowtubulars.com', '082171485934', 12, 3),
('RTM-0783', 'Tri Media Siburian', '-', '0895384957214', 19, 3),
('RTM-0784', 'Radivo Filanda', '-', '082268856354', 19, 3),
('RTM-0785', 'Rosalina Valencia', 'rosalina@rainbowtubulars.com', '081386070753', 14, 5),
('RTM-0797', 'Wilda Wati Simangunsong', 'wilda@rainbowtubulars.com', '081266241644', 8, 5),
('RTM-0807', 'Riski Tri Prasetyo Junior', 'hse@rainbowtubulars.com', '085758896627', 10, 3),
('RTM-0809', 'Rudi', 'rudi@rainbowtubulars.com', '081371355755', 11, 10),
('RTM-0810', 'Chelyn', 'hrstaff@rainbowtubulars.com', '082383292255', 8, 3),
('RTM-0811', 'Mohamad Tommy', 'tommy@rainbowtubulars.com', '081268733787', 10, 6),
('RTM-0812', 'Syifa Latifah', 'qa1@rainbowtubulars.com', '081319799418', 15, 3),
('RTM-0816', 'Melda Suriani', 'hse1@rainbowtubulars.com', '081901826657', 10, 3),
('RTM-0823', 'Chyntia Chrestella Santoso', 'maintenance2@rainbowtubulars.com', '085264606562', 11, 3),
('RTM-0832', 'Renny', 'production1@rainbowtubulars.com', '08984070340', 13, 3),
('RTM-1025', 'Bai Liyong', 'bai@rainbowtubulars.com', '087736207981', 13, 7),
('RTM-1031', 'Xu Mingming', 'xumingming@rainbowtubulars.com', '-', 16, 9);

-- --------------------------------------------------------

--
-- Table structure for table `prioritas`
--

CREATE TABLE `prioritas` (
  `id_prioritas` int(11) NOT NULL,
  `nama_prioritas` varchar(30) NOT NULL,
  `waktu_respon` int(11) NOT NULL,
  `warna` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `prioritas`
--

INSERT INTO `prioritas` (`id_prioritas`, `nama_prioritas`, `waktu_respon`, `warna`) VALUES
(1, 'High', 1, '#B14145'),
(2, 'Medium', 3, '#FC8500'),
(3, 'Low', 5, '#FFB701');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `group_setting` varchar(100) NOT NULL,
  `variable_setting` varchar(255) NOT NULL,
  `value_setting` text NOT NULL,
  `deskripsi_setting` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES
(1, 'app', 'aplikasi', 'IT Helpdesk', 'Nama Aplikasi', '2024-11-06 11:19:19'),
(2, 'app', 'developer', 'PT. ITSHOP BISNIS DIGITAL', 'Pengembang Aplikasi', '2023-06-17 15:21:28'),
(3, 'app', 'versi', '1.0', 'Versi Aplikasi', '2022-05-19 09:42:25'),
(4, 'general', 'perusahaan', 'PT. Rainbow Tubulars Manufacture', 'Nama Instansi', '2024-11-06 11:15:39'),
(5, 'general', 'alamat', 'Latrade Industrial Park, Blok G5-G7 Tanjung uncang , Batam Indonesia', 'Alamat', '2024-11-06 11:38:03'),
(6, 'general', 'telepon', '+62 (778) 396 886', 'No Telepon', '2024-11-06 11:38:19'),
(7, 'general', 'email', 'general@rainbowtubulars.com', 'Email', '2024-11-06 11:38:45'),
(8, 'image', 'logo', 'icon31.png', 'Logo', '2024-11-06 11:18:15'),
(9, 'email', 'protocol', 'smtp', 'Email Protocol \'mail\', \'sendmail\', or \'smtp\'', NULL),
(10, 'email', 'smtp_host', 'mail.domain.com', 'SMTP Host', NULL),
(11, 'email', 'smtp_port', '587', 'SMTP Port \'465\' or \'587\'', NULL),
(12, 'email', 'smtp_user', 'your@email.com', 'SMTP User', NULL),
(13, 'email', 'smtp_pass', '12345', 'SMTP Password', NULL),
(14, 'email', 'smtp_crypto', 'ssl', 'SMTP Crypto', NULL),
(15, 'image', 'background', 'G71.jpg', 'Background', '2024-11-06 11:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `teknisi`
--

CREATE TABLE `teknisi` (
  `id_teknisi` varchar(50) NOT NULL DEFAULT '',
  `nik` varchar(50) NOT NULL DEFAULT '',
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` varchar(13) NOT NULL DEFAULT '',
  `tanggal` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `tanggal_proses` datetime DEFAULT NULL,
  `tanggal_solved` datetime DEFAULT NULL,
  `reported` varchar(50) NOT NULL DEFAULT '',
  `id_sub_kategori` int(11) NOT NULL,
  `problem_summary` varchar(50) NOT NULL DEFAULT '',
  `problem_detail` text NOT NULL,
  `teknisi` varchar(50) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `progress` decimal(10,0) NOT NULL,
  `filefoto` text NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `id_prioritas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_message`
--

CREATE TABLE `ticket_message` (
  `id_message` int(11) UNSIGNED NOT NULL,
  `id_ticket` varchar(13) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `message` text NOT NULL,
  `id_user` varchar(50) NOT NULL DEFAULT '',
  `filefoto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `id_tracking` int(11) UNSIGNED NOT NULL,
  `id_ticket` varchar(13) NOT NULL DEFAULT '',
  `tanggal` datetime DEFAULT NULL,
  `status` text NOT NULL,
  `deskripsi` text NOT NULL,
  `id_user` varchar(50) NOT NULL DEFAULT '',
  `filefoto` text NOT NULL,
  `signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `level` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', '25d55ad283aa400af464c76d713c07ad', 'Admin'),
(5, 'RTM-0673', '25d55ad283aa400af464c76d713c07ad', 'User'),
(6, 'RTM-0430', '25d55ad283aa400af464c76d713c07ad', 'User'),
(7, 'RTM-0636', '25d55ad283aa400af464c76d713c07ad', 'User'),
(8, 'RTM-0534', '25d55ad283aa400af464c76d713c07ad', 'User'),
(9, 'RTM-0605', '25d55ad283aa400af464c76d713c07ad', 'User'),
(10, 'RTM-0674', '25d55ad283aa400af464c76d713c07ad', 'User'),
(11, 'RTM-0533', '25d55ad283aa400af464c76d713c07ad', 'Technician'),
(12, 'RTM-1025', '25d55ad283aa400af464c76d713c07ad', 'User'),
(13, 'RTM-0810', '25d55ad283aa400af464c76d713c07ad', 'User'),
(14, 'RTM-0823', '25d55ad283aa400af464c76d713c07ad', 'User'),
(15, 'RTM-0763', '25d55ad283aa400af464c76d713c07ad', 'User'),
(16, 'RTM-0774', '25d55ad283aa400af464c76d713c07ad', 'User'),
(17, 'RTM-0623', '25d55ad283aa400af464c76d713c07ad', 'User'),
(18, 'RTM-0535', '25d55ad283aa400af464c76d713c07ad', 'User'),
(19, 'RTM-0717', '25d55ad283aa400af464c76d713c07ad', 'User'),
(20, 'RTM-0538', '25d55ad283aa400af464c76d713c07ad', 'User'),
(21, 'RTM-0414', '25d55ad283aa400af464c76d713c07ad', 'User'),
(22, 'RTM-0695', '25d55ad283aa400af464c76d713c07ad', 'User'),
(23, 'RTM-0714', '25d55ad283aa400af464c76d713c07ad', 'User'),
(24, 'RTM-0716', '25d55ad283aa400af464c76d713c07ad', 'User'),
(25, 'RTM-0293', '25d55ad283aa400af464c76d713c07ad', 'User'),
(26, 'RTM-0637', '25d55ad283aa400af464c76d713c07ad', 'Technician'),
(27, 'RTM-0420', '25d55ad283aa400af464c76d713c07ad', 'User'),
(28, 'RTM-0746', '25d55ad283aa400af464c76d713c07ad', 'User'),
(29, 'RTM-0453', '25d55ad283aa400af464c76d713c07ad', 'User'),
(30, 'RTM-0660', '25d55ad283aa400af464c76d713c07ad', 'User'),
(31, 'RTM-0634', '25d55ad283aa400af464c76d713c07ad', 'User'),
(32, 'RTM-0767', '25d55ad283aa400af464c76d713c07ad', 'User'),
(33, 'RTM-0653', '25d55ad283aa400af464c76d713c07ad', 'User'),
(34, 'RTM-0707', '25d55ad283aa400af464c76d713c07ad', 'User'),
(35, 'RTM-0816', '25d55ad283aa400af464c76d713c07ad', 'User'),
(36, 'RTM-0811', '25d55ad283aa400af464c76d713c07ad', 'User'),
(37, 'RTM-0462', '25d55ad283aa400af464c76d713c07ad', 'User'),
(38, 'RTM-0696', '25d55ad283aa400af464c76d713c07ad', 'User'),
(39, 'RTM-0486', '25d55ad283aa400af464c76d713c07ad', 'User'),
(40, 'RTM-0784', '25d55ad283aa400af464c76d713c07ad', 'User'),
(41, 'RTM-0431', '25d55ad283aa400af464c76d713c07ad', 'User'),
(42, 'RTM-0832', '25d55ad283aa400af464c76d713c07ad', 'User'),
(43, 'RTM-0715', '25d55ad283aa400af464c76d713c07ad', 'User'),
(44, 'RTM-0666', '25d55ad283aa400af464c76d713c07ad', 'User'),
(45, 'RTM-0807', '25d55ad283aa400af464c76d713c07ad', 'User'),
(46, 'RTM-0726', '25d55ad283aa400af464c76d713c07ad', 'User'),
(47, 'RTM-0306', '25d55ad283aa400af464c76d713c07ad', 'User'),
(48, 'RTM-0785', '25d55ad283aa400af464c76d713c07ad', 'User'),
(49, 'RTM-0809', '25d55ad283aa400af464c76d713c07ad', 'User'),
(50, 'RTM-0812', '25d55ad283aa400af464c76d713c07ad', 'User'),
(51, 'RTM-0491', '25d55ad283aa400af464c76d713c07ad', 'User'),
(52, 'RTM-0783', '25d55ad283aa400af464c76d713c07ad', 'User'),
(53, 'RTM-0732', '25d55ad283aa400af464c76d713c07ad', 'User'),
(55, 'RTM-0616', '25d55ad283aa400af464c76d713c07ad', 'User'),
(56, 'RTM-0659', '25d55ad283aa400af464c76d713c07ad', 'User'),
(57, 'RTM-0797', '25d55ad283aa400af464c76d713c07ad', 'User'),
(58, 'RTM-0708', '25d55ad283aa400af464c76d713c07ad', 'User'),
(59, 'RTM-1031', '25d55ad283aa400af464c76d713c07ad', 'User'),
(60, 'RTM-0398', '25d55ad283aa400af464c76d713c07ad', 'User'),
(61, 'RTM-0702', '25d55ad283aa400af464c76d713c07ad', 'User'),
(62, 'RTM-0734', '25d55ad283aa400af464c76d713c07ad', 'User'),
(63, 'RTM-0408', '25d55ad283aa400af464c76d713c07ad', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backup`
--
ALTER TABLE `backup`
  ADD PRIMARY KEY (`id_backup`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_dept`);

--
-- Indexes for table `departemen_bagian`
--
ALTER TABLE `departemen_bagian`
  ADD PRIMARY KEY (`id_bagian_dept`),
  ADD KEY `fk_id_dept` (`id_dept`);

--
-- Indexes for table `informasi`
--
ALTER TABLE `informasi`
  ADD PRIMARY KEY (`id_informasi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kategori_sub`
--
ALTER TABLE `kategori_sub`
  ADD PRIMARY KEY (`id_sub_kategori`),
  ADD KEY `fk_id_kategori` (`id_kategori`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `fk_id_bagian_dept` (`id_bagian_dept`),
  ADD KEY `fk_id_jabatan` (`id_jabatan`);

--
-- Indexes for table `prioritas`
--
ALTER TABLE `prioritas`
  ADD PRIMARY KEY (`id_prioritas`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teknisi`
--
ALTER TABLE `teknisi`
  ADD PRIMARY KEY (`id_teknisi`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `reported` (`reported`),
  ADD KEY `id_lokasi` (`id_lokasi`),
  ADD KEY `id_sub_kategori` (`id_sub_kategori`);

--
-- Indexes for table `ticket_message`
--
ALTER TABLE `ticket_message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`id_tracking`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_nik` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backup`
--
ALTER TABLE `backup`
  MODIFY `id_backup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_dept` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `departemen_bagian`
--
ALTER TABLE `departemen_bagian`
  MODIFY `id_bagian_dept` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `informasi`
--
ALTER TABLE `informasi`
  MODIFY `id_informasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori_sub`
--
ALTER TABLE `kategori_sub`
  MODIFY `id_sub_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prioritas`
--
ALTER TABLE `prioritas`
  MODIFY `id_prioritas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ticket_message`
--
ALTER TABLE `ticket_message`
  MODIFY `id_message` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `id_tracking` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departemen_bagian`
--
ALTER TABLE `departemen_bagian`
  ADD CONSTRAINT `fk_id_dept` FOREIGN KEY (`id_dept`) REFERENCES `departemen` (`id_dept`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `informasi`
--
ALTER TABLE `informasi`
  ADD CONSTRAINT `informasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`);

--
-- Constraints for table `kategori_sub`
--
ALTER TABLE `kategori_sub`
  ADD CONSTRAINT `fk_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `fk_id_bagian_dept` FOREIGN KEY (`id_bagian_dept`) REFERENCES `departemen_bagian` (`id_bagian_dept`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`reported`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_sub_kategori`) REFERENCES `kategori_sub` (`id_sub_kategori`);

--
-- Constraints for table `ticket_message`
--
ALTER TABLE `ticket_message`
  ADD CONSTRAINT `ticket_message_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_message_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`);

--
-- Constraints for table `tracking`
--
ALTER TABLE `tracking`
  ADD CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_nik` FOREIGN KEY (`username`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
