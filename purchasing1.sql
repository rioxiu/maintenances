#
# TABLE STRUCTURE FOR: backup
#

DROP TABLE IF EXISTS `backup`;

CREATE TABLE `backup` (
  `id_backup` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_backup`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `backup` (`id_backup`, `file_name`, `file_path`, `created_at`) VALUES (1, 'backup-20241107-113018.sql.zip', 'files/backup/backup-20241107-113018.sql.zip', '2024-11-07 11:30:18');


#
# TABLE STRUCTURE FOR: departemen
#

DROP TABLE IF EXISTS `departemen`;

CREATE TABLE `departemen` (
  `id_dept` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dept` varchar(30) NOT NULL,
  PRIMARY KEY (`id_dept`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (1, 'QA/QC');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (2, 'HRGA');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (3, 'Finance and Accounting');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (4, 'Purchasing');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (5, 'HSE');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (6, 'Maintenance');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (7, 'Store');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (8, 'PPIC');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (9, 'Facility');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (10, 'Production');
INSERT INTO `departemen` (`id_dept`, `nama_dept`) VALUES (11, 'Project');


#
# TABLE STRUCTURE FOR: departemen_bagian
#

DROP TABLE IF EXISTS `departemen_bagian`;

CREATE TABLE `departemen_bagian` (
  `id_bagian_dept` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bagian_dept` varchar(100) NOT NULL,
  `id_dept` int(11) NOT NULL,
  PRIMARY KEY (`id_bagian_dept`),
  KEY `fk_id_dept` (`id_dept`),
  CONSTRAINT `fk_id_dept` FOREIGN KEY (`id_dept`) REFERENCES `departemen` (`id_dept`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (1, 'Administrator', 9);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (5, 'IT', 9);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (6, 'GA', 2);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (7, 'Finance and Accounting', 3);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (8, 'HR', 2);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (10, 'Safety', 5);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (11, 'Maintenance', 6);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (12, 'Planner', 8);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (13, 'Production', 10);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (14, 'Purchasing', 4);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (15, 'QA', 1);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (16, 'QC', 1);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (17, 'Warehouse', 7);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (18, 'Logistic & Marketing', 7);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (19, 'Project', 11);
INSERT INTO `departemen_bagian` (`id_bagian_dept`, `nama_bagian_dept`, `id_dept`) VALUES (20, 'Laboratorium', 1);


#
# TABLE STRUCTURE FOR: informasi
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `informasi` (`id_informasi`, `tanggal`, `subject`, `pesan`, `id_user`) VALUES (1, '2022-07-20 07:20:50', 'Ganti Password', 'Demi keamanan, pengguna sistem diharuskan mengganti password', 'admin');


#
# TABLE STRUCTURE FOR: jabatan
#

DROP TABLE IF EXISTS `jabatan`;

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES (1, 'Administrator');
INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES (3, 'Staff');
INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES (5, 'Supervisor');
INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES (6, 'Manager');
INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES (7, 'Director');
INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES (8, 'Senior Manager');
INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES (9, 'Assistant Manager');
INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES (10, 'Coordinator');


#
# TABLE STRUCTURE FOR: kategori
#

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(35) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES (1, 'Jasa');
INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES (5, 'Barang');


#
# TABLE STRUCTURE FOR: kategori_sub
#

DROP TABLE IF EXISTS `kategori_sub`;

CREATE TABLE `kategori_sub` (
  `id_sub_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sub_kategori` varchar(35) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  PRIMARY KEY (`id_sub_kategori`),
  KEY `fk_id_kategori` (`id_kategori`),
  CONSTRAINT `fk_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (2, 'Finance & Accounting', 1);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (3, 'HRGA', 1);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (4, 'HRGA', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (26, 'Finance & Accountingg', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (27, 'HSE', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (28, 'HSEE', 1);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (29, 'QAQC', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (30, 'QA/QC', 1);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (31, 'Store & Logistic', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (32, 'Store & Logistik', 1);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (33, 'PPIC/Planner', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (34, 'PPIC', 1);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (35, 'Facility/IT', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (36, 'Facility', 1);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (37, 'Production', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (38, 'Productionn', 1);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (39, 'Maintenance', 5);
INSERT INTO `kategori_sub` (`id_sub_kategori`, `nama_sub_kategori`, `id_kategori`) VALUES (40, 'Maintenancee', 1);


#
# TABLE STRUCTURE FOR: lokasi
#

DROP TABLE IF EXISTS `lokasi`;

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(128) NOT NULL,
  PRIMARY KEY (`id_lokasi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `lokasi` (`id_lokasi`, `lokasi`) VALUES (2, 'RTM 1');
INSERT INTO `lokasi` (`id_lokasi`, `lokasi`) VALUES (3, 'RTM 2');
INSERT INTO `lokasi` (`id_lokasi`, `lokasi`) VALUES (6, 'RTM 3');


#
# TABLE STRUCTURE FOR: pegawai
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('admin', 'Administrator', 'admin@gmail.com', '082123456789', 1, 1);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0293', 'Hamidjah', 'hamidjah@rainbowtubulars.com', '081261310209', 16, 6);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0306', 'Rora Ustira Mala', 'lala@rainbowtubulars.com', '081364672187', 8, 6);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0398', 'Yelki Argha', 'hse@rainbowtubulars.com', '081356898095', 10, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0408', 'Yusbar', 'yusbar@rainbowtubulars.com', '081270160818', 20, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0414', 'Enni F Tambunan', 'logistic@rainbowtubulars.com', '082288420059', 18, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0420', 'Herry Susanto', 'herry@rainbowtubulars.com', '081536603228', 16, 10);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0430', 'Ahmad Nasution', 'ahmad_nasution@rainbowtubulars.com', '085765138537', 17, 10);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0431', 'Rendy', 'rendy@rainbowtubulars.com', '0895349755613', 12, 5);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0453', 'Julian Ngantung', 'qaqcinspector@rainbowtubulars.com', '082286408353', 16, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0462', 'Nikson Nainggolan', 'nikson@rainbowtubulars.com', '081372462764', 15, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0486', 'Radiana', 'anna@rainbowtubulars.com', '081275310975', 15, 5);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0491', 'Tju Ket Li', 'ketli@rainbowtubulars.com', '0895711649000', 16, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0533', 'Arya Andriawan', 'support@rainbowtubulars.com', '082170082125', 5, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0534', 'Andy Dwiyanto', 'andy@rainbowtubulars.com', '082213472425', 19, 5);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0535', 'Denny Triyatmoko', 'deny@rainbowtubulars.com', '081268604625', 12, 8);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0538', 'Dwi Ilham Vanradj', 'planner@rainbowtubulars.com', '082169641367', 12, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0605', 'Angelica', 'ppicstaff@rainbowtubulars.com', '08985981051', 12, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0616', 'Wendy Venda Wahyuni T', 'qastaff@rainbowtubulars.com', '085364209145', 15, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0623', 'Deni Satria', 'lab@rainbowtubulars.com', '085265726486', 20, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0634', 'Kelvin', 'admini.store@rainbowtubulars.com', '081370413417', 17, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0636', 'Aisyah Dewi Pelita', 'hr-ga@rainbowtubulars.com', '089685828283', 6, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0637', 'Heriyono', 'support@rainbowtubulars.com', '087793643877', 5, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0653', 'M.Al Faridzi Aghnia', 'hse@rainbowtubulars.com', '081330025598', 10, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0659', 'Widia', 'widia@rainbowtubulars.com', '08561916101', 7, 8);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0660', 'Kathlen Anatasya', 'purchasingstaff3@rainbowtubulars.com', '0895605333958', 14, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0666', 'Rio Aditia Pardede', 'facilitystaff@rainbowtubulars.com', '081238778648', 1, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0673', 'Agus Widodo', 'equipmentengineer@rainbowtubulars.com', '083802107102', 11, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0674', 'Annisa Latif', 'purchasing@rainbowtubulars.com', '0895414459468', 14, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0695', 'Faqrul Rozi', 'rozi@rainbowtubulars.com', '085836603066', 17, 5);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0696', 'Nurmanita Desy Sasriani', 'nurma@rainbowtubulars.com', '089688351040', 7, 5);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0702', 'Yesseventin Nofyana', 'ddcofficer@rainbowtubulars.com', '082348357955', 15, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0707', 'Marvina', 'qcstaff@rainbowtubulars.com', '082172028336', 16, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0708', 'Wiston Pasaribu', 'hse@rainbowtubulars.com', '082249497070', 10, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0714', 'Farras Harits Febriadin', 'hse@rainbowtubulars.com', '08126841994', 10, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0715', 'Rino', 'hse@rainbowtubulars.com', '085272880967', 10, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0716', 'Febriana Situmorang', 'financestaff2@rainbowtubulars.com', '089623161075', 7, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0717', 'Dimas Alif Saputra', '-', '082175797053', 19, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0726', 'Romauli Lubis', 'maintenancestaff@rainbowtubulars.com', '082226192723', 11, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0732', 'Vicca Ediwibowo', 'hrtrainer@rainbowtubulars.com', '081288810024', 8, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0734', 'Yoga Mahardika', 'ga@rainbowtubulars.com', '082171099174', 6, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0746', 'Indah Dwi Andini', 'purchasingstaff2@rainbowtubulars.com', '081314465605', 14, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0763', 'Dedye', 'dedye@rainbowtubulars.com', '082111495577', 7, 9);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0767', 'M. Fauzi', '-', '082174420255', 19, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0774', 'Delen Jasika', 'ppicstaff2@rainbowtubulars.com', '082171485934', 12, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0783', 'Tri Media Siburian', '-', '0895384957214', 19, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0784', 'Radivo Filanda', '-', '082268856354', 19, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0785', 'Rosalina Valencia', 'rosalina@rainbowtubulars.com', '081386070753', 14, 5);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0797', 'Wilda Wati Simangunsong', 'wilda@rainbowtubulars.com', '081266241644', 8, 5);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0807', 'Riski Tri Prasetyo Junior', 'hse@rainbowtubulars.com', '085758896627', 10, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0809', 'Rudi', 'rudi@rainbowtubulars.com', '081371355755', 11, 10);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0810', 'Chelyn', 'hrstaff@rainbowtubulars.com', '082383292255', 8, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0811', 'Mohamad Tommy', 'tommy@rainbowtubulars.com', '081268733787', 10, 6);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0812', 'Syifa Latifah', 'qa1@rainbowtubulars.com', '081319799418', 15, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0816', 'Melda Suriani', 'hse1@rainbowtubulars.com', '081901826657', 10, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0823', 'Chyntia Chrestella Santoso', 'maintenance2@rainbowtubulars.com', '085264606562', 11, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-0832', 'Renny', 'production1@rainbowtubulars.com', '08984070340', 13, 3);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-1025', 'Bai Liyong', 'bai@rainbowtubulars.com', '087736207981', 13, 7);
INSERT INTO `pegawai` (`nik`, `nama`, `email`, `telp`, `id_bagian_dept`, `id_jabatan`) VALUES ('RTM-1031', 'Xu Mingming', 'xumingming@rainbowtubulars.com', '-', 16, 9);


#
# TABLE STRUCTURE FOR: prioritas
#

DROP TABLE IF EXISTS `prioritas`;

CREATE TABLE `prioritas` (
  `id_prioritas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_prioritas` varchar(30) NOT NULL,
  `waktu_respon` int(11) NOT NULL,
  `warna` varchar(30) NOT NULL,
  PRIMARY KEY (`id_prioritas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `prioritas` (`id_prioritas`, `nama_prioritas`, `waktu_respon`, `warna`) VALUES (1, 'High', 1, '#B14145');
INSERT INTO `prioritas` (`id_prioritas`, `nama_prioritas`, `waktu_respon`, `warna`) VALUES (2, 'Medium', 3, '#FC8500');
INSERT INTO `prioritas` (`id_prioritas`, `nama_prioritas`, `waktu_respon`, `warna`) VALUES (3, 'Low', 5, '#FFB701');


#
# TABLE STRUCTURE FOR: settings
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (1, 'app', 'aplikasi', 'PR Tracking', 'Nama Aplikasi', '2024-12-05 13:42:02');
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (2, 'app', 'developer', 'PT. ITSHOP BISNIS DIGITAL', 'Pengembang Aplikasi', '2023-06-17 15:21:28');
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (3, 'app', 'versi', '1.0', 'Versi Aplikasi', '2022-05-19 09:42:25');
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (4, 'general', 'perusahaan', 'PT. Rainbow Tubulars Manufacture', 'Nama Instansi', '2024-11-06 11:15:39');
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (5, 'general', 'alamat', 'Latrade Industrial Park, Blok G5-G7 Tanjung uncang , Batam Indonesia', 'Alamat', '2024-11-06 11:38:03');
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (6, 'general', 'telepon', '+62 (778) 396 886', 'No Telepon', '2024-11-06 11:38:19');
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (7, 'general', 'email', 'general@rainbowtubulars.com', 'Email', '2024-11-06 11:38:45');
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (8, 'image', 'logo', 'icon31.png', 'Logo', '2024-11-06 11:18:15');
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (9, 'email', 'protocol', 'smtp', 'Email Protocol \'mail\', \'sendmail\', or \'smtp\'', NULL);
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (10, 'email', 'smtp_host', 'mail.domain.com', 'SMTP Host', NULL);
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (11, 'email', 'smtp_port', '587', 'SMTP Port \'465\' or \'587\'', NULL);
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (12, 'email', 'smtp_user', 'your@email.com', 'SMTP User', NULL);
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (13, 'email', 'smtp_pass', '12345', 'SMTP Password', NULL);
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (14, 'email', 'smtp_crypto', 'ssl', 'SMTP Crypto', NULL);
INSERT INTO `settings` (`id`, `group_setting`, `variable_setting`, `value_setting`, `deskripsi_setting`, `updated_at`) VALUES (15, 'image', 'background', 'G71.jpg', 'Background', '2024-11-06 11:36:25');


#
# TABLE STRUCTURE FOR: teknisi
#

DROP TABLE IF EXISTS `teknisi`;

CREATE TABLE `teknisi` (
  `id_teknisi` varchar(50) NOT NULL DEFAULT '',
  `nik` varchar(50) NOT NULL DEFAULT '',
  `id_kategori` int(11) NOT NULL,
  PRIMARY KEY (`id_teknisi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: ticket
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `ticket` (`id_ticket`, `tanggal`, `deadline`, `last_update`, `tanggal_proses`, `tanggal_solved`, `reported`, `id_sub_kategori`, `problem_summary`, `problem_detail`, `teknisi`, `status`, `progress`, `filefoto`, `id_lokasi`, `id_prioritas`) VALUES ('8Q6gePSbj', '2024-12-05 13:25:09', NULL, '2024-12-05 13:25:09', NULL, NULL, 'RTM-0666', 3, 'Sqqs', 'Qsqsq', '', 1, '0', 'no-image.jpg', 2, 0);
INSERT INTO `ticket` (`id_ticket`, `tanggal`, `deadline`, `last_update`, `tanggal_proses`, `tanggal_solved`, `reported`, `id_sub_kategori`, `problem_summary`, `problem_detail`, `teknisi`, `status`, `progress`, `filefoto`, `id_lokasi`, `id_prioritas`) VALUES ('M0dXIfm18', '2024-12-05 13:35:13', NULL, '2024-12-05 13:35:13', NULL, NULL, 'RTM-0666', 3, 'Dasd', 'Dasda', '', 1, '0', 'no-image.jpg', 3, 0);


#
# TABLE STRUCTURE FOR: ticket_message
#

DROP TABLE IF EXISTS `ticket_message`;

CREATE TABLE `ticket_message` (
  `id_message` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_ticket` varchar(13) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `message` text NOT NULL,
  `id_user` varchar(50) NOT NULL DEFAULT '',
  `filefoto` text DEFAULT NULL,
  PRIMARY KEY (`id_message`),
  KEY `id_ticket` (`id_ticket`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `ticket_message_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_message_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: tracking
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `tracking` (`id_tracking`, `id_ticket`, `tanggal`, `status`, `deskripsi`, `id_user`, `filefoto`, `signature`) VALUES (1, '8Q6gePSbj', '2024-12-05 13:25:09', 'Ticket Submited. Kategori: Hardware(Laptop)', 'Qsqsq', 'RTM-0666', '', NULL);
INSERT INTO `tracking` (`id_tracking`, `id_ticket`, `tanggal`, `status`, `deskripsi`, `id_user`, `filefoto`, `signature`) VALUES (2, 'M0dXIfm18', '2024-12-05 13:35:13', 'Ticket Submited. Kategori: Hardware(Laptop)', 'Dasda', 'RTM-0666', '', NULL);


#
# TABLE STRUCTURE FOR: user
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (1, 'admin', '25d55ad283aa400af464c76d713c07ad', 'Admin');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (5, 'RTM-0673', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (6, 'RTM-0430', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (7, 'RTM-0636', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (8, 'RTM-0534', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (9, 'RTM-0605', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (10, 'RTM-0674', '25d55ad283aa400af464c76d713c07ad', 'Technician');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (11, 'RTM-0533', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (12, 'RTM-1025', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (13, 'RTM-0810', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (14, 'RTM-0823', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (15, 'RTM-0763', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (16, 'RTM-0774', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (17, 'RTM-0623', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (18, 'RTM-0535', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (19, 'RTM-0717', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (20, 'RTM-0538', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (21, 'RTM-0414', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (22, 'RTM-0695', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (23, 'RTM-0714', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (24, 'RTM-0716', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (25, 'RTM-0293', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (26, 'RTM-0637', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (27, 'RTM-0420', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (28, 'RTM-0746', '25d55ad283aa400af464c76d713c07ad', 'Technician');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (29, 'RTM-0453', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (30, 'RTM-0660', '25d55ad283aa400af464c76d713c07ad', 'Technician');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (31, 'RTM-0634', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (32, 'RTM-0767', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (33, 'RTM-0653', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (34, 'RTM-0707', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (35, 'RTM-0816', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (36, 'RTM-0811', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (37, 'RTM-0462', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (38, 'RTM-0696', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (39, 'RTM-0486', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (40, 'RTM-0784', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (41, 'RTM-0431', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (42, 'RTM-0832', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (43, 'RTM-0715', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (44, 'RTM-0666', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (45, 'RTM-0807', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (46, 'RTM-0726', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (47, 'RTM-0306', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (48, 'RTM-0785', '25d55ad283aa400af464c76d713c07ad', 'Admin');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (49, 'RTM-0809', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (50, 'RTM-0812', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (51, 'RTM-0491', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (52, 'RTM-0783', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (53, 'RTM-0732', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (55, 'RTM-0616', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (56, 'RTM-0659', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (57, 'RTM-0797', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (58, 'RTM-0708', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (59, 'RTM-1031', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (60, 'RTM-0398', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (61, 'RTM-0702', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (62, 'RTM-0734', '25d55ad283aa400af464c76d713c07ad', 'User');
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES (63, 'RTM-0408', '25d55ad283aa400af464c76d713c07ad', 'User');


