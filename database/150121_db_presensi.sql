-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 15, 2021 at 02:57 PM
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
  `kode_absensi` varchar(60) NOT NULL,
  `kode_rombel` varchar(60) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kode_jurusan` varchar(60) NOT NULL,
  `kehadiran` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_detailabsensi`
--

INSERT INTO `tbl_detailabsensi` (`kode_absensi`, `kode_rombel`, `id_siswa`, `kode_jurusan`, `kehadiran`, `date_created`) VALUES
('15012021-140342', 'R1718-A1', 1, 'Mm', 'H', '2021-01-15 07:09:59'),
('15012021-140342', 'R1718-A1', 2, 'RPL', 'A', '2021-01-15 07:09:59'),
('15012021-140342', 'R1718-A1', 3, 'TKJ', 'H', '2021-01-15 07:09:59'),
('15012021-140342', 'R1718-A1', 4, 'Dg', 'H', '2021-01-15 07:09:59'),
('15012021-140342', 'R1718-A1', 5, 'RPL', 'H', '2021-01-15 07:09:59');

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
-- Table structure for table `tbl_rombel`
--

CREATE TABLE `tbl_rombel` (
  `kode_rombel` varchar(60) NOT NULL,
  `rombel_kelas` text,
  `id_guru` int(11) NOT NULL,
  `kode_tahunajaran` varchar(60) NOT NULL,
  `kode_jenjang` varchar(60) NOT NULL,
  `kode_kelas` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rombel`
--

INSERT INTO `tbl_rombel` (`kode_rombel`, `rombel_kelas`, `id_guru`, `kode_tahunajaran`, `kode_jenjang`, `kode_kelas`) VALUES
('R1718-A1', 'X 2017', 1, '1718', 'SMK-1', 'X');

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
-- Indexes for table `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tbl_detailabsensi`
--
ALTER TABLE `tbl_detailabsensi`
  ADD PRIMARY KEY (`kode_absensi`,`kode_rombel`,`id_siswa`,`kode_jurusan`),
  ADD KEY `fk_absensi2rombel` (`kode_rombel`),
  ADD KEY `fk_absensi2jurusan` (`kode_jurusan`),
  ADD KEY `fk_absensi2datasiswa` (`id_siswa`);

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
-- Indexes for table `tbl_rombel`
--
ALTER TABLE `tbl_rombel`
  ADD PRIMARY KEY (`kode_rombel`,`kode_tahunajaran`,`kode_jenjang`,`kode_kelas`),
  ADD KEY `fk_rombel2guru` (`id_guru`),
  ADD KEY `fk_rombel2jenjang` (`kode_jenjang`),
  ADD KEY `fk_rombel2ta` (`kode_tahunajaran`),
  ADD KEY `fk_rombel2kelas` (`kode_kelas`);

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
-- Constraints for table `tbl_detailabsensi`
--
ALTER TABLE `tbl_detailabsensi`
  ADD CONSTRAINT `fk_absensi2datasiswa` FOREIGN KEY (`id_siswa`) REFERENCES `tbl_datasiswa` (`id_siswa`),
  ADD CONSTRAINT `fk_absensi2jurusan` FOREIGN KEY (`kode_jurusan`) REFERENCES `tbl_jurusan` (`kode_jurusan`),
  ADD CONSTRAINT `fk_absensi2rombel` FOREIGN KEY (`kode_rombel`) REFERENCES `tbl_rombel` (`kode_rombel`);

--
-- Constraints for table `tbl_rombel`
--
ALTER TABLE `tbl_rombel`
  ADD CONSTRAINT `fk_rombel2guru` FOREIGN KEY (`id_guru`) REFERENCES `tbl_guru` (`id_guru`),
  ADD CONSTRAINT `fk_rombel2jenjang` FOREIGN KEY (`kode_jenjang`) REFERENCES `tbl_jenjang` (`kode_jenjang`),
  ADD CONSTRAINT `fk_rombel2kelas` FOREIGN KEY (`kode_kelas`) REFERENCES `tbl_kelas` (`kode_kelas`),
  ADD CONSTRAINT `fk_rombel2ta` FOREIGN KEY (`kode_tahunajaran`) REFERENCES `tbl_tahunajaran` (`kode_tahunajaran`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
