/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : helpdesk

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 20/06/2023 16:57:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for backup
-- ----------------------------
DROP TABLE IF EXISTS `backup`;
CREATE TABLE `backup`  (
  `id_backup` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_backup`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `id_dept` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dept` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_dept`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES (1, 'Super Administrator');
INSERT INTO `departemen` VALUES (2, 'Information Technology');
INSERT INTO `departemen` VALUES (3, 'Software Tester');
INSERT INTO `departemen` VALUES (4, 'Staf Umum');

-- ----------------------------
-- Table structure for departemen_bagian
-- ----------------------------
DROP TABLE IF EXISTS `departemen_bagian`;
CREATE TABLE `departemen_bagian`  (
  `id_bagian_dept` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bagian_dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_dept` int(11) NOT NULL,
  PRIMARY KEY (`id_bagian_dept`) USING BTREE,
  INDEX `fk_id_dept`(`id_dept`) USING BTREE,
  CONSTRAINT `fk_id_dept` FOREIGN KEY (`id_dept`) REFERENCES `departemen` (`id_dept`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departemen_bagian
-- ----------------------------
INSERT INTO `departemen_bagian` VALUES (1, 'Administrator', 1);
INSERT INTO `departemen_bagian` VALUES (2, 'IT Support', 2);
INSERT INTO `departemen_bagian` VALUES (3, 'Tester', 3);
INSERT INTO `departemen_bagian` VALUES (4, 'Staf', 4);

-- ----------------------------
-- Table structure for informasi
-- ----------------------------
DROP TABLE IF EXISTS `informasi`;
CREATE TABLE `informasi`  (
  `id_informasi` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime(0) NOT NULL,
  `subject` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pesan` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_informasi`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `informasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of informasi
-- ----------------------------
INSERT INTO `informasi` VALUES (1, '2022-07-20 07:20:50', 'Ganti Password', 'Demi keamanan, pengguna sistem diharuskan mengganti password', 'admin');

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan`  (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_jabatan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jabatan
-- ----------------------------
INSERT INTO `jabatan` VALUES (1, 'Administrator');
INSERT INTO `jabatan` VALUES (2, 'Staf IT');
INSERT INTO `jabatan` VALUES (3, 'Staf Tester');
INSERT INTO `jabatan` VALUES (4, 'Staf');

-- ----------------------------
-- Table structure for sss
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (1, 'Hardware');
INSERT INTO `kategori` VALUES (2, 'Software');
INSERT INTO `kategori` VALUES (3, 'Request');
INSERT INTO `kategori` VALUES (4, 'Service');

-- ----------------------------
-- Table structure for kategori_sub
-- ----------------------------
DROP TABLE IF EXISTS `kategori_sub`;
CREATE TABLE `kategori_sub`  (
  `id_sub_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sub_kategori` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_kategori` int(11) NOT NULL,
  PRIMARY KEY (`id_sub_kategori`) USING BTREE,
  INDEX `fk_id_kategori`(`id_kategori`) USING BTREE,
  CONSTRAINT `fk_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori_sub
-- ----------------------------
INSERT INTO `kategori_sub` VALUES (1, 'Server', 1);
INSERT INTO `kategori_sub` VALUES (2, 'Desktop', 1);
INSERT INTO `kategori_sub` VALUES (3, 'Laptop', 1);
INSERT INTO `kategori_sub` VALUES (4, 'Printer', 1);
INSERT INTO `kategori_sub` VALUES (5, 'SAP', 2);
INSERT INTO `kategori_sub` VALUES (6, 'Office \\ Productivity', 2);
INSERT INTO `kategori_sub` VALUES (7, 'Nisoft', 2);
INSERT INTO `kategori_sub` VALUES (8, 'PI', 2);
INSERT INTO `kategori_sub` VALUES (9, 'GDMS', 2);
INSERT INTO `kategori_sub` VALUES (10, 'Email Outlook', 2);
INSERT INTO `kategori_sub` VALUES (11, 'Others', 2);
INSERT INTO `kategori_sub` VALUES (12, 'Data Restore', 3);
INSERT INTO `kategori_sub` VALUES (13, 'Password Reset', 3);
INSERT INTO `kategori_sub` VALUES (14, 'New User / User Leaving', 3);
INSERT INTO `kategori_sub` VALUES (15, 'User / equipment Move or Change', 3);
INSERT INTO `kategori_sub` VALUES (16, 'New Software Request', 3);
INSERT INTO `kategori_sub` VALUES (17, 'Email', 4);
INSERT INTO `kategori_sub` VALUES (18, 'File Storage', 4);
INSERT INTO `kategori_sub` VALUES (19, 'Printing', 4);
INSERT INTO `kategori_sub` VALUES (20, 'Internet', 4);
INSERT INTO `kategori_sub` VALUES (21, 'Intranet', 4);
INSERT INTO `kategori_sub` VALUES (22, 'Document Management', 4);
INSERT INTO `kategori_sub` VALUES (23, 'Telecommunications', 4);
INSERT INTO `kategori_sub` VALUES (24, 'Networking', 4);

-- ----------------------------
-- Table structure for lokasi
-- ----------------------------
DROP TABLE IF EXISTS `lokasi`;
CREATE TABLE `lokasi`  (
  `id_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_lokasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lokasi
-- ----------------------------
INSERT INTO `lokasi` VALUES (1, 'Lokasi 01');
INSERT INTO `lokasi` VALUES (2, 'Lokasi 02');
INSERT INTO `lokasi` VALUES (3, 'Lokasi 03');

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai`  (
  `nik` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telp` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_bagian_dept` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  PRIMARY KEY (`nik`) USING BTREE,
  INDEX `fk_id_bagian_dept`(`id_bagian_dept`) USING BTREE,
  INDEX `fk_id_jabatan`(`id_jabatan`) USING BTREE,
  CONSTRAINT `fk_id_bagian_dept` FOREIGN KEY (`id_bagian_dept`) REFERENCES `departemen_bagian` (`id_bagian_dept`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pegawai
-- ----------------------------
INSERT INTO `pegawai` VALUES ('admin', 'Administrator', 'admin@gmail.com', '082123456789', 1, 1);
INSERT INTO `pegawai` VALUES ('aksara', 'Aksara Delana', '-', NULL, 4, 4);
INSERT INTO `pegawai` VALUES ('teknisi', 'Teknisi', '-', NULL, 2, 2);
INSERT INTO `pegawai` VALUES ('tester', 'User Tester', '-', '081234567890', 3, 3);

-- ----------------------------
-- Table structure for prioritas
-- ----------------------------
DROP TABLE IF EXISTS `prioritas`;
CREATE TABLE `prioritas`  (
  `id_prioritas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_prioritas` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `waktu_respon` int(11) NOT NULL,
  `warna` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_prioritas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prioritas
-- ----------------------------
INSERT INTO `prioritas` VALUES (1, 'High', 1, '#B14145');
INSERT INTO `prioritas` VALUES (2, 'Medium', 3, '#FC8500');
INSERT INTO `prioritas` VALUES (3, 'Low', 5, '#FFB701');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_setting` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `variable_setting` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value_setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deskripsi_setting` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'app', 'aplikasi', 'IT Helpdesk', 'Nama Aplikasi', '2022-07-20 07:20:58');
INSERT INTO `settings` VALUES (2, 'app', 'developer', 'PT. ITSHOP BISNIS DIGITAL', 'Pengembang Aplikasi', '2023-06-17 15:21:28');
INSERT INTO `settings` VALUES (3, 'app', 'versi', '1.0', 'Versi Aplikasi', '2022-05-19 09:42:25');
INSERT INTO `settings` VALUES (4, 'general', 'perusahaan', 'ITSHOP Purwokerto', 'Nama Instansi', '2023-06-17 14:02:42');
INSERT INTO `settings` VALUES (5, 'general', 'alamat', 'Jl. KH Ahmad Dahlan RT 1 RW 7 Dukuhwaluh Purwokerto', 'Alamat', NULL);
INSERT INTO `settings` VALUES (6, 'general', 'telepon', '08213456789', 'No Telepon', NULL);
INSERT INTO `settings` VALUES (7, 'general', 'email', 'info@itshop.biz..id', 'Email', NULL);
INSERT INTO `settings` VALUES (8, 'image', 'logo', 'icon.png', 'Logo', '2023-06-17 14:51:55');
INSERT INTO `settings` VALUES (9, 'email', 'protocol', 'smtp', 'Email Protocol \'mail\', \'sendmail\', or \'smtp\'', NULL);
INSERT INTO `settings` VALUES (10, 'email', 'smtp_host', 'mail.domain.com', 'SMTP Host', NULL);
INSERT INTO `settings` VALUES (11, 'email', 'smtp_port', '587', 'SMTP Port \'465\' or \'587\'', NULL);
INSERT INTO `settings` VALUES (12, 'email', 'smtp_user', 'your@email.com', 'SMTP User', NULL);
INSERT INTO `settings` VALUES (13, 'email', 'smtp_pass', '12345', 'SMTP Password', NULL);
INSERT INTO `settings` VALUES (14, 'email', 'smtp_crypto', 'ssl', 'SMTP Crypto', NULL);
INSERT INTO `settings` VALUES (15, 'image', 'background', 'office.jpg', 'Background', '2023-06-17 15:21:49');

-- ----------------------------
-- Table structure for teknisi
-- ----------------------------
DROP TABLE IF EXISTS `teknisi`;
CREATE TABLE `teknisi`  (
  `id_teknisi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nik` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `id_kategori` int(11) NOT NULL,
  PRIMARY KEY (`id_teknisi`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id_ticket` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tanggal` datetime(0) NULL DEFAULT NULL,
  `deadline` datetime(0) NULL DEFAULT NULL,
  `last_update` datetime(0) NULL DEFAULT NULL,
  `tanggal_proses` datetime(0) NULL DEFAULT NULL,
  `tanggal_solved` datetime(0) NULL DEFAULT NULL,
  `reported` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `id_sub_kategori` int(11) NOT NULL,
  `problem_summary` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `problem_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teknisi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `progress` decimal(10, 0) NOT NULL,
  `filefoto` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `id_prioritas` int(11) NOT NULL,
  PRIMARY KEY (`id_ticket`) USING BTREE,
  INDEX `reported`(`reported`) USING BTREE,
  INDEX `id_lokasi`(`id_lokasi`) USING BTREE,
  INDEX `id_sub_kategori`(`id_sub_kategori`) USING BTREE,
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`reported`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_sub_kategori`) REFERENCES `kategori_sub` (`id_sub_kategori`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ticket_message
-- ----------------------------
DROP TABLE IF EXISTS `ticket_message`;
CREATE TABLE `ticket_message`  (
  `id_message` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_ticket` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tanggal` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `filefoto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id_message`) USING BTREE,
  INDEX `id_ticket`(`id_ticket`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `ticket_message_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_message_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tracking
-- ----------------------------
DROP TABLE IF EXISTS `tracking`;
CREATE TABLE `tracking`  (
  `id_tracking` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_ticket` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `tanggal` datetime(0) NULL DEFAULT NULL,
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `filefoto` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tracking`) USING BTREE,
  INDEX `id_ticket`(`id_ticket`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_user`) USING BTREE,
  INDEX `fk_nik`(`username`) USING BTREE,
  CONSTRAINT `fk_nik` FOREIGN KEY (`username`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '25d55ad283aa400af464c76d713c07ad', 'Admin');
INSERT INTO `user` VALUES (2, 'teknisi', '25d55ad283aa400af464c76d713c07ad', 'Technician');
INSERT INTO `user` VALUES (3, 'tester', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` VALUES (4, 'aksara', '25d55ad283aa400af464c76d713c07ad', 'User');

SET FOREIGN_KEY_CHECKS = 1;
