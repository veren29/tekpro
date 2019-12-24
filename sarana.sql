-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2019 at 06:49 AM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sarana`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
`id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `spesifikasi` varchar(50) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `kondisi` varchar(50) NOT NULL,
  `jumlah_barang` varchar(50) NOT NULL,
  `sumber_dana` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `spesifikasi`, `lokasi`, `kondisi`, `jumlah_barang`, `sumber_dana`) VALUES
(1, 'Pena', 'joyco', 'ruang marketing', 'baik', '10', '');

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE IF NOT EXISTS `barang_keluar` (
`id_barang` int(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `jml_keluar` varchar(50) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `penerima` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang`, `nama_barang`, `tgl_keluar`, `jml_keluar`, `lokasi`, `penerima`) VALUES
(4, 'Pena', '2019-11-15', '1', 'ruang marketing', 'a');

--
-- Triggers `barang_keluar`
--
DELIMITER //
CREATE TRIGGER `UI` AFTER INSERT ON `barang_keluar`
 FOR EACH ROW BEGIN
UPDATE stok set total_barang = total_barang - NEW.jml_keluar WHERE
NEW.nama_barang = nama_barang;
END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `ii` AFTER UPDATE ON `barang_keluar`
 FOR EACH ROW BEGIN
UPDATE stok set total_barang = total_barang - NEW.jml_keluar WHERE
NEW.nama_barang = nama_barang;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE IF NOT EXISTS `barang_masuk` (
`id_barang` int(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `jml_masuk` varchar(50) NOT NULL,
  `id_suplier` int(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang`, `nama_barang`, `tgl_masuk`, `jml_masuk`, `id_suplier`) VALUES
(22, 'HVS', '2019-11-15', '2 RIM', 1),
(24, 'buku ', '2019-11-15', '2 lusin', 2);

--
-- Triggers `barang_masuk`
--
DELIMITER //
CREATE TRIGGER `AI` AFTER INSERT ON `barang_masuk`
 FOR EACH ROW BEGIN
UPDATE stok set total_barang = total_barang + NEW.jml_masuk WHERE
NEW.nama_barang = nama_barang;
END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `aa` AFTER UPDATE ON `barang_masuk`
 FOR EACH ROW BEGIN
UPDATE stok set total_barang = total_barang + NEW.jml_masuk WHERE
NEW.nama_barang = nama_barang;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pinjam_barang`
--

CREATE TABLE IF NOT EXISTS `pinjam_barang` (
`id_pinjam` int(50) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `id_barang` int(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jml_barang` varchar(50) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `kondisi` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `pinjam_barang`
--

INSERT INTO `pinjam_barang` (`id_pinjam`, `peminjam`, `tgl_pinjam`, `id_barang`, `nama_barang`, `jml_barang`, `tgl_kembali`, `kondisi`) VALUES
(14, 'vvv', '2019-04-03', 1, 'buku', '3', '2019-04-09', 'baik'),
(15, 'Veren', '2019-04-10', 1, 'meja', '1', '2019-04-09', 'kurang baik'),
(17, 'aa', '2019-04-03', 1, 'meja', '2', '2019-04-09', 'Baik');

--
-- Triggers `pinjam_barang`
--
DELIMITER //
CREATE TRIGGER `ab` AFTER INSERT ON `pinjam_barang`
 FOR EACH ROW BEGIN
UPDATE stok set total_barang = total_barang - NEW.jml_barang WHERE
NEW.nama_barang = nama_barang;
END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `b` AFTER UPDATE ON `pinjam_barang`
 FOR EACH ROW BEGIN
UPDATE stok set total_barang = total_barang - NEW.jml_barang WHERE
NEW.nama_barang = nama_barang;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE IF NOT EXISTS `stok` (
`id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jml_masuk` varchar(50) NOT NULL,
  `jml_keluar` varchar(50) NOT NULL,
  `total_barang` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id_barang`, `nama_barang`, `jml_masuk`, `jml_keluar`, `total_barang`) VALUES
(2, 'Pena', '2 lusin', '1 lusin', '0');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
`id_supplier` int(50) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(50) NOT NULL,
  `telp_supplier` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `telp_supplier`) VALUES
(4, 'kamu', 'batu aji', '0778999');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(1, 'veren', 'manajemen', 'manajemen', 'manajemen'),
(8, 'veren', 'admin', 'admin', 'admin'),
(15, 'h', 'h', 'h', 'manajemen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
 ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
 ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
 ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `pinjam_barang`
--
ALTER TABLE `pinjam_barang`
 ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
 ADD PRIMARY KEY (`id_barang`), ADD UNIQUE KEY `id_barang` (`id_barang`), ADD KEY `jml_keluar` (`jml_keluar`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
 ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
MODIFY `id_barang` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
MODIFY `id_barang` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `pinjam_barang`
--
ALTER TABLE `pinjam_barang`
MODIFY `id_pinjam` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
MODIFY `id_supplier` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
