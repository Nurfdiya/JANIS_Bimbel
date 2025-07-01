-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2025 at 04:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bimbel`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` varchar(11) NOT NULL,
  `no_ruangan` varchar(50) NOT NULL,
  `jenjang` varchar(10) NOT NULL,
  `hari` varchar(11) NOT NULL,
  `id_pengajar` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `no_ruangan`, `jenjang`, `hari`, `id_pengajar`) VALUES
('A001', '101', 'SD', 'Senin', 'P001'),
('A002', '102', 'SD', 'Senin', 'P004'),
('B001', '103', 'SMP', 'Rabu', 'P002'),
('C001', '104', 'SMA', 'Selasa', 'P003');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `nisn` int(30) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `tingkat_pendidikan` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`nisn`, `nama_siswa`, `tingkat_pendidikan`, `jenis_kelamin`, `no_hp`, `alamat`) VALUES
(12345670, 'Jeremy', 'SMP', 'Laki-laki', '082361739212', 'jl. cakra'),
(12345671, 'Ifan', 'SD', 'Laki-laki', '082314526378', 'jl. delima'),
(12345672, 'Ananda', 'SD', 'Perempuan', '081425368765', 'jl. alun'),
(12345678, 'Fadiya', 'SMK', 'Perempuan', '081514296260', 'jl. M. Siban'),
(12345679, 'Sinta', 'SMA', 'Perempuan', '081273622234', 'jl. kodiklat');

-- --------------------------------------------------------

--
-- Table structure for table `pengajar`
--

CREATE TABLE `pengajar` (
  `id_pengajar` varchar(12) NOT NULL,
  `nama_pengajar` varchar(100) NOT NULL,
  `mata_pelajaran` varchar(40) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajar`
--

INSERT INTO `pengajar` (`id_pengajar`, `nama_pengajar`, `mata_pelajaran`, `no_hp`) VALUES
('P001', 'Nasril', 'IPA', '081234567890'),
('P002', 'Sean', 'English', '087654321678'),
('P003', 'Rehan', 'Matematika', '089765432514'),
('P004', 'Dimas', 'Bahasa Jepang', '0876534215677');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_pendaftaran` varchar(30) NOT NULL,
  `nisn` varchar(30) NOT NULL,
  `id_kelas` varchar(11) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `tingkat_pendidikan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_pendaftaran`, `nisn`, `id_kelas`, `tgl_daftar`, `tingkat_pendidikan`) VALUES
('1003', '12345672', 'C001', '2025-06-01', 'SD'),
('1005', '12345679', 'A002', '2025-06-04', 'SMA'),
('1101', '12345670', 'A001', '2025-04-06', 'SMP'),
('1102', '12345671', 'B001', '2025-05-04', 'SD'),
('1104', '12345678', 'A002', '2025-06-02', 'SMK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD UNIQUE KEY `no_ruangan` (`no_ruangan`),
  ADD UNIQUE KEY `id_pengajar` (`id_pengajar`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`nisn`);

--
-- Indexes for table `pengajar`
--
ALTER TABLE `pengajar`
  ADD PRIMARY KEY (`id_pengajar`),
  ADD UNIQUE KEY `no_hp` (`no_hp`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD UNIQUE KEY `id_siswa` (`nisn`,`id_kelas`),
  ADD KEY `id_kelas` (`id_kelas`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
