-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2023 at 12:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project_restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(25) NOT NULL,
  `jabatan` varchar(10) NOT NULL,
  `alamat` varchar(55) NOT NULL,
  `gaji` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `jabatan`, `alamat`, `gaji`) VALUES
(3, 'Fauz Maulana', 'Kasir', 'Cand Gebang 2', 1000.00),
(4, 'Widi Saputra', 'Koki', 'Cand Gebang 3', 5000.00),
(5, 'Angga Malik', 'Kasir', 'Cand Gebang 4', 1000.00),
(6, 'Iqbal Febriana', 'Koki', 'Cand Gebang 5', 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(55) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kategori` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `harga`, `kategori`) VALUES
(0, 'pisang goreng', 1000, 'makanan'),
(1, 'Nasi Goreng', 25000, 'Makanan'),
(2, 'Ayam Bakar', 35000, 'Makanan'),
(3, 'Es Teh Manis', 5000, 'Minuman'),
(4, 'Sate Ayam', 30000, 'Makanan'),
(5, 'Jus Jeruk', 8000, 'Minuman');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_menu`
--

CREATE TABLE `pesanan_menu` (
  `id_pesanan_menu` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan_menu`
--

INSERT INTO `pesanan_menu` (`id_pesanan_menu`, `id_menu`, `jumlah`) VALUES
(23, 3, 2),
(25, 1, 1),
(26, 3, 1),
(27, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `tanggal_reservasi` date NOT NULL,
  `nama_pelanggan` varchar(10) NOT NULL,
  `meja` int(11) NOT NULL,
  `id_pesanan_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id_reservasi`, `tanggal_reservasi`, `nama_pelanggan`, `meja`, `id_pesanan_menu`) VALUES
(10, '2023-07-19', 'Wildan hal', 2, 23),
(12, '2023-07-20', 'wisnu abdu', 10, 25),
(14, '2023-07-22', 'Sarifudin', 3, 26),
(15, '2023-07-20', 'Malik ingk', 4, 27);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pesanan_menu` int(11) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `total_harga` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pesanan_menu`, `tanggal_transaksi`, `total_harga`, `id_karyawan`, `id_reservasi`) VALUES
(3, 23, '2023-07-19 11:52:42', 10000, 5, 10),
(14, 25, '2023-07-19 12:23:31', 100, 5, 12),
(15, 26, '2023-07-19 12:30:51', 2000, 5, 14),
(16, 27, '2023-07-19 12:31:25', 5000, 5, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `pesanan_menu`
--
ALTER TABLE `pesanan_menu`
  ADD PRIMARY KEY (`id_pesanan_menu`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id_reservasi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_pesanan_menu` (`id_pesanan_menu`),
  ADD UNIQUE KEY `id_reservasi` (`id_reservasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pesanan_menu`
--
ALTER TABLE `pesanan_menu`
  MODIFY `id_pesanan_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesanan_menu`
--
ALTER TABLE `pesanan_menu`
  ADD CONSTRAINT `pesanan_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`id_pesanan_menu`) REFERENCES `pesanan_menu` (`id_pesanan_menu`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pesanan_menu`) REFERENCES `pesanan_menu` (`id_pesanan_menu`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
