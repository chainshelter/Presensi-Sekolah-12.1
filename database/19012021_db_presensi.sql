-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 19, 2021 at 10:47 AM
-- Server version: 5.7.32-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_presensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_absensi`
--

CREATE TABLE `tbl_absensi` (
  `kode_absensi` varchar(60) NOT NULL,
  `tanggal_pengabsenan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kode_matapelajaran` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_absensi`
--

INSERT INTO `tbl_absensi` (`kode_absensi`, `tanggal_pengabsenan`, `kode_matapelajaran`) VALUES
('18012021-JP1', '2021-01-18 04:29:31', 'MTK'),
('18012021-JP2', '2021-01-18 04:29:48', 'BI');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_angkatan`
--

CREATE TABLE `tbl_angkatan` (
  `kode_angkatan` varchar(30) NOT NULL,
  `angkatan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_angkatan`
--

INSERT INTO `tbl_angkatan` (`kode_angkatan`, `angkatan`) VALUES
('A1', 'Angkatan 1'),
('A2', 'Angkatan 2'),
('A3', 'Angkatan 3'),
('A4', 'Angkatan 4'),
('A5', 'Angkatan 5');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datasiswa`
--

CREATE TABLE `tbl_datasiswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` text,
  `nama_siswa` text,
  `jenis_kelamin` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_datasiswa`
--

INSERT INTO `tbl_datasiswa` (`id_siswa`, `nis`, `nama_siswa`, `jenis_kelamin`, `date_created`) VALUES
(1, '311310300', 'Asep Septiadi', 'Laki-laki', '2021-01-15 06:32:52'),
(2, '311310301', 'Wirda Andriyana', 'Perempuan', '2021-01-15 06:32:52'),
(3, '311310302', 'Suci Alfiah', 'Perempuan', '2021-01-15 06:32:52'),
(4, '311310303', 'Fithri Febiyani Yunus', 'Perempuan', '2021-01-15 06:32:52'),
(5, '311310304', 'Rahmet Abdillah', 'Laki-laki', '2021-01-15 06:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailabsensi`
--

CREATE TABLE `tbl_detailabsensi` (
  `kode_detailabsen` varchar(60) NOT NULL,
  `kode_absensi` varchar(60) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kehadiran` text,
  `waktu_kehadiran` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_detailabsensi`
--

INSERT INTO `tbl_detailabsensi` (`kode_detailabsen`, `kode_absensi`, `id_siswa`, `kehadiran`, `waktu_kehadiran`) VALUES
('JP1-MTK', '18012021-JP1', 1, 'H', '09:01:11'),
('JP1-MTK', '18012021-JP1', 2, 'H', '09:10:12'),
('JP1-MTK', '18012021-JP1', 3, 'H', '09:15:10'),
('JP1-MTK', '18012021-JP1', 4, 'H', '09:17:12'),
('JP1-MTK', '18012021-JP1', 5, 'H', '09:19:22'),
('JP2-BI', '18012021-JP2', 1, 'H', '11:01:11'),
('JP2-BI', '18012021-JP2', 2, 'H', '11:10:12'),
('JP2-BI', '18012021-JP2', 3, 'I', '11:15:10'),
('JP2-BI', '18012021-JP2', 4, 'H', '11:17:12'),
('JP2-BI', '18012021-JP2', 5, 'TK', '11:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailrombel`
--

CREATE TABLE `tbl_detailrombel` (
  `kode_detailrombel` varchar(60) NOT NULL,
  `kode_rombel` varchar(50) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tipe_anggota` text,
  `kode_jurusan` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_detailrombel`
--

INSERT INTO `tbl_detailrombel` (`kode_detailrombel`, `kode_rombel`, `id_siswa`, `tipe_anggota`, `kode_jurusan`) VALUES
('A1-1718-X-SMK', '1718-A1', 1, 'Ketua Kelas', 'RPL'),
('A1-1718-X-SMK', '1718-A1', 2, 'Anggota Kelas', 'TKJ'),
('A1-1718-X-SMK', '1718-A1', 3, 'Anggota Kelas', 'TKJ'),
('A1-1718-X-SMK', '1718-A1', 4, 'Anggota Kelas', 'RPL'),
('A1-1718-X-SMK', '1718-A1', 5, 'Anggota Kelas', 'RPL'),
('A1-1819-XI-SMK', '1819-A1', 1, 'Anggota Kelas', 'RPL'),
('A1-1819-XI-SMK', '1819-A1', 2, 'Anggota Kelas', 'TKJ'),
('A1-1819-XI-SMK', '1819-A1', 3, 'Anggota Kelas', 'TKJ'),
('A1-1819-XI-SMK', '1819-A1', 4, 'Ketua Kelas', 'RPL'),
('A1-1819-XI-SMK', '1819-A1', 5, 'Anggota Kelas', 'RPL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `id_guru` int(11) NOT NULL,
  `nip` text,
  `nama_guru` text,
  `jenis_kelamin` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_guru`
--

INSERT INTO `tbl_guru` (`id_guru`, `nip`, `nama_guru`, `jenis_kelamin`, `date_created`) VALUES
(1, '5995291101', 'M. Baehaki Fahrullah', 'Laki-laki', '2021-01-15 06:38:33'),
(2, '5995291102', 'Dinda Fitriana Ayu', 'Perempuan', '2021-01-15 06:38:33'),
(3, '5995291103', 'Diah Duniarti', 'Perempuan', '2021-01-15 06:38:33'),
(4, '5995291104', 'Tria Vivi Niarti', 'Perempuan', '2021-01-15 06:38:33'),
(5, '5995291105', 'Syukur Rahman Kamil', 'Laki-laki', '2021-01-15 06:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenjang`
--

CREATE TABLE `tbl_jenjang` (
  `kode_jenjang` varchar(60) NOT NULL,
  `jenjang` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jenjang`
--

INSERT INTO `tbl_jenjang` (`kode_jenjang`, `jenjang`, `date_created`) VALUES
('SD-1', 'SDIT', '2021-01-15 06:41:09'),
('SMK-1', 'SMKI', '2021-01-15 06:41:09'),
('SMP-1', 'SMPI', '2021-01-15 06:41:09'),
('TK-1', 'TKIT', '2021-01-15 06:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `kode_jurusan` varchar(60) NOT NULL,
  `jurusan` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`kode_jurusan`, `jurusan`, `date_created`) VALUES
('Dg', 'Desaingrafis', '2021-01-15 06:43:21'),
('Mm', 'Multimedia', '2021-01-15 06:43:21'),
('RPL', 'Rekayasa Perangkat Lunak', '2021-01-15 06:43:21'),
('TKJ', 'Teknik Komputer & Jaringan', '2021-01-15 06:43:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `kode_kelas` varchar(60) NOT NULL,
  `kelas` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`kode_kelas`, `kelas`, `date_created`) VALUES
('X', '10', '2021-01-15 06:44:43'),
('XI', '11', '2021-01-15 06:44:43'),
('XII', '12', '2021-01-15 06:44:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matapelajaran`
--

CREATE TABLE `tbl_matapelajaran` (
  `kode_matapelajaran` varchar(40) NOT NULL,
  `matapelajaran` text,
  `id_guru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_matapelajaran`
--

INSERT INTO `tbl_matapelajaran` (`kode_matapelajaran`, `matapelajaran`, `id_guru`) VALUES
('BI', 'Bahasa Indonesia', 3),
('MTK', 'Matematika', 4),
('MTK-X', 'Matematika Kelas 10', 4),
('RPL-01', 'Pemrograman Database', 2),
('RPL-02', 'Pemrograman Mobile Android', 2),
('RPL-03', 'Management Basic Server', 2),
('RPL-04', 'Control Version Git', 2),
('RPL-05', 'Produk Kreatif & Kewirausahaan', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rombelkelas`
--

CREATE TABLE `tbl_rombelkelas` (
  `kode_rombel` varchar(50) NOT NULL,
  `rombel_kelas` text,
  `kode_angkatan` varchar(30) NOT NULL,
  `kode_tahunajaran` varchar(60) NOT NULL,
  `kode_kelas` varchar(60) NOT NULL,
  `kode_jenjang` varchar(60) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rombelkelas`
--

INSERT INTO `tbl_rombelkelas` (`kode_rombel`, `rombel_kelas`, `kode_angkatan`, `kode_tahunajaran`, `kode_kelas`, `kode_jenjang`, `id_guru`, `date_created`) VALUES
('1718-A1', 'Angkatan 1 2017/2018', 'A1', '1718', 'X', 'SMK-1', 4, '2021-01-19 02:26:08'),
('1819-A1', 'Angkatan 1 2018/2019', 'A1', '1819', 'XI', 'SMK-1', 2, '2021-01-19 03:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tahunajaran`
--

CREATE TABLE `tbl_tahunajaran` (
  `kode_tahunajaran` varchar(60) NOT NULL,
  `tahunajaran` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_tahunajaran`
--

INSERT INTO `tbl_tahunajaran` (`kode_tahunajaran`, `tahunajaran`, `date_created`) VALUES
('1718', '2017/2018', '2021-01-15 06:46:44'),
('1819', '2018/2019', '2021-01-15 06:46:44'),
('1920', '2019/2020', '2021-01-15 06:46:44'),
('2021', '2020/2021', '2021-01-15 06:46:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_absensi`
--
ALTER TABLE `tbl_absensi`
  ADD PRIMARY KEY (`kode_absensi`,`kode_matapelajaran`),
  ADD KEY `fk_absensi2mapel` (`kode_matapelajaran`);

--
-- Indexes for table `tbl_angkatan`
--
ALTER TABLE `tbl_angkatan`
  ADD PRIMARY KEY (`kode_angkatan`);

--
-- Indexes for table `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tbl_detailabsensi`
--
ALTER TABLE `tbl_detailabsensi`
  ADD PRIMARY KEY (`kode_detailabsen`,`kode_absensi`,`id_siswa`),
  ADD KEY `fk_detailabsen2absen` (`kode_absensi`),
  ADD KEY `fk_detailabsen2siswa` (`id_siswa`);

--
-- Indexes for table `tbl_detailrombel`
--
ALTER TABLE `tbl_detailrombel`
  ADD PRIMARY KEY (`kode_detailrombel`,`kode_rombel`,`id_siswa`,`kode_jurusan`),
  ADD KEY `fk_detailrombel2rombel` (`kode_rombel`),
  ADD KEY `fk_rombel2jurusan` (`kode_jurusan`),
  ADD KEY `fk_rombel2siswa` (`id_siswa`);

--
-- Indexes for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tbl_jenjang`
--
ALTER TABLE `tbl_jenjang`
  ADD PRIMARY KEY (`kode_jenjang`);

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `tbl_matapelajaran`
--
ALTER TABLE `tbl_matapelajaran`
  ADD PRIMARY KEY (`kode_matapelajaran`,`id_guru`),
  ADD KEY `fk_mapel2guru` (`id_guru`);

--
-- Indexes for table `tbl_rombelkelas`
--
ALTER TABLE `tbl_rombelkelas`
  ADD PRIMARY KEY (`kode_rombel`,`kode_angkatan`,`kode_tahunajaran`,`kode_kelas`,`kode_jenjang`,`id_guru`),
  ADD KEY `fk_rombel2angkatan` (`kode_angkatan`),
  ADD KEY `fk_rombel2ta` (`kode_tahunajaran`),
  ADD KEY `fk_rombel2kelas` (`kode_kelas`),
  ADD KEY `fk_rombel2jenjang` (`kode_jenjang`),
  ADD KEY `fk_rombel2guru` (`id_guru`);

--
-- Indexes for table `tbl_tahunajaran`
--
ALTER TABLE `tbl_tahunajaran`
  ADD PRIMARY KEY (`kode_tahunajaran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_absensi`
--
ALTER TABLE `tbl_absensi`
  ADD CONSTRAINT `fk_absensi2mapel` FOREIGN KEY (`kode_matapelajaran`) REFERENCES `tbl_matapelajaran` (`kode_matapelajaran`);

--
-- Constraints for table `tbl_detailabsensi`
--
ALTER TABLE `tbl_detailabsensi`
  ADD CONSTRAINT `fk_detailabsen2absen` FOREIGN KEY (`kode_absensi`) REFERENCES `tbl_absensi` (`kode_absensi`),
  ADD CONSTRAINT `fk_detailabsen2siswa` FOREIGN KEY (`id_siswa`) REFERENCES `tbl_datasiswa` (`id_siswa`);

--
-- Constraints for table `tbl_detailrombel`
--
ALTER TABLE `tbl_detailrombel`
  ADD CONSTRAINT `fk_detailrombel2rombel` FOREIGN KEY (`kode_rombel`) REFERENCES `tbl_rombelkelas` (`kode_rombel`),
  ADD CONSTRAINT `fk_rombel2jurusan` FOREIGN KEY (`kode_jurusan`) REFERENCES `tbl_jurusan` (`kode_jurusan`),
  ADD CONSTRAINT `fk_rombel2siswa` FOREIGN KEY (`id_siswa`) REFERENCES `tbl_datasiswa` (`id_siswa`);

--
-- Constraints for table `tbl_matapelajaran`
--
ALTER TABLE `tbl_matapelajaran`
  ADD CONSTRAINT `fk_mapel2guru` FOREIGN KEY (`id_guru`) REFERENCES `tbl_guru` (`id_guru`);

--
-- Constraints for table `tbl_rombelkelas`
--
ALTER TABLE `tbl_rombelkelas`
  ADD CONSTRAINT `fk_rombel2angkatan` FOREIGN KEY (`kode_angkatan`) REFERENCES `tbl_angkatan` (`kode_angkatan`),
  ADD CONSTRAINT `fk_rombel2guru` FOREIGN KEY (`id_guru`) REFERENCES `tbl_guru` (`id_guru`),
  ADD CONSTRAINT `fk_rombel2jenjang` FOREIGN KEY (`kode_jenjang`) REFERENCES `tbl_jenjang` (`kode_jenjang`),
  ADD CONSTRAINT `fk_rombel2kelas` FOREIGN KEY (`kode_kelas`) REFERENCES `tbl_kelas` (`kode_kelas`),
  ADD CONSTRAINT `fk_rombel2ta` FOREIGN KEY (`kode_tahunajaran`) REFERENCES `tbl_tahunajaran` (`kode_tahunajaran`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
