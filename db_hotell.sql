-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2022 pada 05.35
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hotell`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas`
--

CREATE TABLE `tbl_fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL,
  `deskripsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_fasilitas`
--

INSERT INTO `tbl_fasilitas` (`id_fasilitas`, `nama_fasilitas`, `deskripsi`) VALUES
(0, 'taman', 'hal depan'),
(1, 'swimming pool', 'lantai 1'),
(2, 'gym', 'lantai 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_multi`
--

CREATE TABLE `tbl_multi` (
  `id_petugas` int(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1.admin 2.petugas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_multi`
--

INSERT INTO `tbl_multi` (`id_petugas`, `email`, `password`, `status`) VALUES
(1, 'salsa@gmail.com', 'fa246d0262c3925617b0c72bb20eeb1d', 1),
(2, 'yoyo@gmail.com', '934b535800b1cba8f96a5d72f72f1611', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `kd_bayar` char(11) NOT NULL,
  `kd_reservasi` char(11) NOT NULL,
  `nama_akun_rekening` varchar(50) NOT NULL,
  `no_rek` int(20) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bukti_bayar` int(255) NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_reservasi`
--

CREATE TABLE `tbl_reservasi` (
  `kd_reservasi` char(11) NOT NULL,
  `id_tamu` char(5) NOT NULL,
  `tgl_check_in` datetime NOT NULL,
  `tgl_check_out` datetime NOT NULL,
  `jml_kamar` int(11) NOT NULL,
  `jml_orang` int(11) NOT NULL,
  `jml_hari` varchar(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `tgl_dipesan` date NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `status_reservasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_reservasi`
--

INSERT INTO `tbl_reservasi` (`kd_reservasi`, `id_tamu`, `tgl_check_in`, `tgl_check_out`, `jml_kamar`, `jml_orang`, `jml_hari`, `id_kamar`, `tgl_dipesan`, `total_bayar`, `status_reservasi`) VALUES
('', 'TM001', '2022-03-28 00:00:00', '2022-03-29 00:00:00', 1, 1, '1', 1, '2022-03-28', 1200000, 0),
('RSV001', 'TM001', '2022-03-27 00:00:00', '2022-03-28 00:00:00', 2, 2, '2', 1, '2022-03-27', 1200000, 0),
('RSV002', 'TM001', '2022-03-27 00:00:00', '2022-03-28 00:00:00', 2, 1, '1', 1, '2022-03-27', 1200000, 0),
('RSV003', 'TM001', '2022-03-29 00:00:00', '2022-03-30 00:00:00', 1, 1, '1', 1, '2022-03-28', 1200000, 0),
('RSV004', 'TM001', '2022-03-28 00:00:00', '2022-03-29 00:00:00', 1, 1, '1', 1, '2022-03-28', 1200000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tamu`
--

CREATE TABLE `tbl_tamu` (
  `id_tamu` char(5) NOT NULL,
  `nama_pengguna` varchar(40) NOT NULL,
  `no_telepon` char(13) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `kata_sandi` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_tamu`
--

INSERT INTO `tbl_tamu` (`id_tamu`, `nama_pengguna`, `no_telepon`, `alamat`, `kecamatan`, `kabupaten`, `provinsi`, `email`, `kata_sandi`) VALUES
('TM001', 'wida', '087721342213', 'cangkorah', 'Batujajar', 'Bandung barat', 'Jawa Barat', 'wida@gmail.com', 'e9510081ac30ffa83f10b68cde1cac07'),
('TM002', 'Amelia', '087721235454', 'jl.perdana', 'Batujajar', 'Bandung barat', 'Jawa Barat', 'amel12@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('TM003', 'cica', '082134567788', 'jl.hegarwangi', 'Batujajar', 'Bandung barat', 'Jawa Barat', 'cica@gmail.com', 'd79c8788088c2193f0244d8f1f36d2db'),
('TM004', 'Anisaa', '081233445566', 'jl.pipit', 'batujajar', 'bandung', 'jawa barat', 'anisaa@gmail.com', '2be9bd7a3434f7038ca27d1918de58bd'),
('TM005', 'Lily', '089566778899', 'jl.sukamaju', 'batujajar', 'bandung', 'jawa barat', 'lily@gmail.com', 'd79c8788088c2193f0244d8f1f36d2db');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tipe_kamar`
--

CREATE TABLE `tbl_tipe_kamar` (
  `id_kamar` int(11) NOT NULL,
  `tipe_kamar` varchar(50) NOT NULL,
  `jumlah_kamar` int(11) NOT NULL,
  `harga_kamar` int(11) NOT NULL,
  `fasilitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_tipe_kamar`
--

INSERT INTO `tbl_tipe_kamar` (`id_kamar`, `tipe_kamar`, `jumlah_kamar`, `harga_kamar`, `fasilitas`) VALUES
(1, 'Standar Room', 15, 1200000, 'wifi,tv,ac'),
(2, 'Standard Twins Room', 20, 1500000, 'wifi,tv,bathroom'),
(3, 'Deluxe Room', 20, 2000000, 'wifi,tv,bathroom,bed uk 37x80');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_fasilitas`
--
ALTER TABLE `tbl_fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indeks untuk tabel `tbl_multi`
--
ALTER TABLE `tbl_multi`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`kd_bayar`),
  ADD KEY `kd_reservasi` (`kd_reservasi`);

--
-- Indeks untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  ADD PRIMARY KEY (`kd_reservasi`),
  ADD KEY `id_tamu_2` (`id_tamu`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indeks untuk tabel `tbl_tamu`
--
ALTER TABLE `tbl_tamu`
  ADD PRIMARY KEY (`id_tamu`);

--
-- Indeks untuk tabel `tbl_tipe_kamar`
--
ALTER TABLE `tbl_tipe_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_multi`
--
ALTER TABLE `tbl_multi`
  MODIFY `id_petugas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `tbl_pembayaran_ibfk_1` FOREIGN KEY (`kd_reservasi`) REFERENCES `tbl_reservasi` (`kd_reservasi`);

--
-- Ketidakleluasaan untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  ADD CONSTRAINT `tbl_reservasi_ibfk_1` FOREIGN KEY (`id_tamu`) REFERENCES `tbl_tamu` (`id_tamu`),
  ADD CONSTRAINT `tbl_reservasi_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `tbl_tipe_kamar` (`id_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
