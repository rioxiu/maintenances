# Host: localhost  (Version 5.7.33)
# Date: 2023-06-20 16:55:07
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "backup"
#

DROP TABLE IF EXISTS `backup`;
CREATE TABLE `backup` (
  `id_backup` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_backup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "backup"
#


#
# Structure for table "departemen"
#

DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen` (
  `id_dept` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dept` varchar(30) NOT NULL,
  PRIMARY KEY (`id_dept`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "departemen"
#

INSERT INTO `departemen` VALUES (1,'Super Administrator'),(2,'Information Technology'),(3,'Software Tester'),(4,'Staf Umum');

#
# Structure for table "departemen_bagian"
#

DROP TABLE IF EXISTS `departemen_bagian`;
CREATE TABLE `departemen_bagian` (
  `id_bagian_dept` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bagian_dept` varchar(100) NOT NULL,
  `id_dept` int(11) NOT NULL,
  PRIMARY KEY (`id_bagian_dept`),
  KEY `fk_id_dept` (`id_dept`),
  CONSTRAINT `fk_id_dept` FOREIGN KEY (`id_dept`) REFERENCES `departemen` (`id_dept`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "departemen_bagian"
#

INSERT INTO `departemen_bagian` VALUES (1,'Administrator',1),(2,'IT Support',2),(3,'Tester',3),(4,'Staf',4);

#
# Structure for table "jabatan"
#

DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "jabatan"
#

INSERT INTO `jabatan` VALUES (1,'Administrator'),(2,'Staf IT'),(3,'Staf Tester'),(4,'Staf');

#
# Structure for table "kategori"
#

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(35) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "kategori"
#

INSERT INTO `kategori` VALUES (1,'Hardware'),(2,'Software'),(3,'Request'),(4,'Service');

#
# Structure for table "kategori_sub"
#

DROP TABLE IF EXISTS `kategori_sub`;
CREATE TABLE `kategori_sub` (
  `id_sub_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sub_kategori` varchar(35) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  PRIMARY KEY (`id_sub_kategori`),
  KEY `fk_id_kategori` (`id_kategori`),
  CONSTRAINT `fk_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Data for table "kategori_sub"
#

INSERT INTO `kategori_sub` VALUES (1,'Server',1),(2,'Desktop',1),(3,'Laptop',1),(4,'Printer',1),(5,'SAP',2),(6,'Office \\ Productivity',2),(7,'Nisoft',2),(8,'PI',2),(9,'GDMS',2),(10,'Email Outlook',2),(11,'Others',2),(12,'Data Restore',3),(13,'Password Reset',3),(14,'New User / User Leaving',3),(15,'User / equipment Move or Change',3),(16,'New Software Request',3),(17,'Email',4),(18,'File Storage',4),(19,'Printing',4),(20,'Internet',4),(21,'Intranet',4),(22,'Document Management',4),(23,'Telecommunications',4),(24,'Networking',4);

#
# Structure for table "lokasi"
#

DROP TABLE IF EXISTS `lokasi`;
CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(128) NOT NULL,
  PRIMARY KEY (`id_lokasi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "lokasi"
#

INSERT INTO `lokasi` VALUES (1,'Lokasi 01'),(2,'Lokasi 02'),(3,'Lokasi 03');

#
# Structure for table "pegawai"
#

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai` (
  `nik` varchar(50) NOT NULL DEFAULT '',
  `nama` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `telp` char(25) DEFAULT NULL,
  `id_bagian_dept` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  PRIMARY KEY (`nik`),
  KEY `fk_id_bagian_dept` (`id_bagian_dept`),
  KEY `fk_id_jabatan` (`id_jabatan`),
  CONSTRAINT `fk_id_bagian_dept` FOREIGN KEY (`id_bagian_dept`) REFERENCES `departemen_bagian` (`id_bagian_dept`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pegawai"
#

INSERT INTO `pegawai` VALUES ('admin','Administrator','admin@gmail.com','082123456789',1,1),('aksara','Aksara Delana','-',NULL,4,4),('teknisi','Teknisi','-',NULL,2,2),('tester','User Tester','-','081234567890',3,3);

#
# Structure for table "prioritas"
#

DROP TABLE IF EXISTS `prioritas`;
CREATE TABLE `prioritas` (
  `id_prioritas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_prioritas` varchar(30) NOT NULL,
  `waktu_respon` int(11) NOT NULL,
  `warna` varchar(30) NOT NULL,
  PRIMARY KEY (`id_prioritas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "prioritas"
#

INSERT INTO `prioritas` VALUES (1,'High',1,'#B14145'),(2,'Medium',3,'#FC8500'),(3,'Low',5,'#FFB701');

#
# Structure for table "settings"
#

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_setting` varchar(100) NOT NULL,
  `variable_setting` varchar(255) NOT NULL,
  `value_setting` text NOT NULL,
  `deskripsi_setting` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "settings"
#

INSERT INTO `settings` VALUES (1,'app','aplikasi','IT Helpdesk','Nama Aplikasi','2022-07-20 07:20:58'),(2,'app','developer','PT. ITSHOP BISNIS DIGITAL','Pengembang Aplikasi','2023-06-17 15:21:28'),(3,'app','versi','1.0','Versi Aplikasi','2022-05-19 09:42:25'),(4,'general','perusahaan','ITSHOP Purwokerto','Nama Instansi','2023-06-17 14:02:42'),(5,'general','alamat','Jl. KH Ahmad Dahlan RT 1 RW 7 Dukuhwaluh Purwokerto','Alamat',NULL),(6,'general','telepon','08213456789','No Telepon',NULL),(7,'general','email','info@itshop.biz..id','Email',NULL),(8,'image','logo','icon.png','Logo','2023-06-17 14:51:55'),(9,'email','protocol','smtp','Email Protocol \'mail\', \'sendmail\', or \'smtp\'',NULL),(10,'email','smtp_host','mail.domain.com','SMTP Host',NULL),(11,'email','smtp_port','587','SMTP Port \'465\' or \'587\'',NULL),(12,'email','smtp_user','your@email.com','SMTP User',NULL),(13,'email','smtp_pass','12345','SMTP Password',NULL),(14,'email','smtp_crypto','ssl','SMTP Crypto',NULL),(15,'image','background','office.jpg','Background','2023-06-17 15:21:49');

#
# Structure for table "teknisi"
#

DROP TABLE IF EXISTS `teknisi`;
CREATE TABLE `teknisi` (
  `id_teknisi` varchar(50) NOT NULL DEFAULT '',
  `nik` varchar(50) NOT NULL DEFAULT '',
  `id_kategori` int(11) NOT NULL,
  PRIMARY KEY (`id_teknisi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "teknisi"
#


#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `level` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_user`),
  KEY `fk_nik` (`username`),
  CONSTRAINT `fk_nik` FOREIGN KEY (`username`) REFERENCES `pegawai` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'admin','25d55ad283aa400af464c76d713c07ad','Admin'),(2,'teknisi','25d55ad283aa400af464c76d713c07ad','Technician'),(3,'tester','25d55ad283aa400af464c76d713c07ad','User'),(4,'aksara','25d55ad283aa400af464c76d713c07ad','User');

#
# Structure for table "ticket"
#

DROP TABLE IF EXISTS `ticket`;
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
  `id_prioritas` int(11) NOT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `reported` (`reported`),
  KEY `id_lokasi` (`id_lokasi`),
  KEY `id_sub_kategori` (`id_sub_kategori`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`reported`) REFERENCES `user` (`username`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_sub_kategori`) REFERENCES `kategori_sub` (`id_sub_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "ticket"
#


#
# Structure for table "tracking"
#

DROP TABLE IF EXISTS `tracking`;
CREATE TABLE `tracking` (
  `id_tracking` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_ticket` varchar(13) NOT NULL DEFAULT '',
  `tanggal` datetime DEFAULT NULL,
  `status` text NOT NULL,
  `deskripsi` text NOT NULL,
  `id_user` varchar(50) NOT NULL DEFAULT '',
  `filefoto` text NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tracking`),
  KEY `id_ticket` (`id_ticket`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tracking"
#


#
# Structure for table "ticket_message"
#

DROP TABLE IF EXISTS `ticket_message`;
CREATE TABLE `ticket_message` (
  `id_message` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_ticket` varchar(13) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `id_user` varchar(50) NOT NULL DEFAULT '',
  `filefoto` text,
  PRIMARY KEY (`id_message`),
  KEY `id_ticket` (`id_ticket`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `ticket_message_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_message_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "ticket_message"
#


#
# Structure for table "informasi"
#

DROP TABLE IF EXISTS `informasi`;
CREATE TABLE `informasi` (
  `id_informasi` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `subject` varchar(35) NOT NULL,
  `pesan` varchar(250) NOT NULL,
  `id_user` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_informasi`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `informasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "informasi"
#

INSERT INTO `informasi` VALUES (1,'2022-07-20 07:20:50','Ganti Password','Demi keamanan, pengguna sistem diharuskan mengganti password','admin');
