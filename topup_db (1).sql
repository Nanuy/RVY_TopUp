-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jul 2024 pada 17.18
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topup_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `topup_transactions`
--

CREATE TABLE `topup_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `topup_transactions`
--

INSERT INTO `topup_transactions` (`id`, `user_id`, `amount`, `payment_method`, `status`, `timestamp`) VALUES
(2, 2, 1000000.00, 'QRIS', 'Completed', '2024-07-17 10:55:48'),
(3, 2, 100000.00, 'QRIS', 'Completed', '2024-07-17 11:02:31'),
(4, 2, 500000.00, 'QRIS', 'Completed', '2024-07-17 11:02:45'),
(5, 1, 500000.00, 'QRIS', 'Completed', '2024-07-17 11:52:20'),
(6, 1, 100000.00, 'QRIS', 'Completed', '2024-07-17 11:52:58'),
(8, 1, 100000.00, 'QRIS', 'Completed', '2024-07-17 11:59:45'),
(9, 1, 500000.00, 'QRIS', 'Completed', '2024-07-17 12:01:15'),
(10, 1, 100000.00, 'QRIS', 'Completed', '2024-07-17 12:07:20'),
(11, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 12:17:59'),
(12, 1, 500000.00, 'QRIS', 'Completed', '2024-07-17 12:42:30'),
(13, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 13:34:57'),
(14, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 13:35:03'),
(15, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 13:35:43'),
(16, 1, 500000.00, 'QRIS', 'Completed', '2024-07-17 13:35:56'),
(17, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 14:01:45'),
(18, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 14:01:53'),
(19, 3, 1000000.00, 'QRIS', 'Completed', '2024-07-17 15:49:27'),
(20, 3, 500000.00, 'QRIS', 'Completed', '2024-07-17 15:57:35'),
(21, 3, 500000.00, 'QRIS', 'Completed', '2024-07-17 16:01:32'),
(22, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:09:55'),
(23, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:10:29'),
(24, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:12:24'),
(25, 1, 100000.00, 'QRIS', 'Completed', '2024-07-17 16:14:26'),
(26, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:18:33'),
(27, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:21:48'),
(28, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:24:32'),
(29, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:25:26'),
(32, 1, 100000.00, 'QRIS', 'Completed', '2024-07-17 16:54:46'),
(34, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:56:35'),
(35, 1, 200000.00, 'QRIS', 'Completed', '2024-07-17 16:57:18'),
(36, 4, 200000.00, 'QRIS', 'Pending', '2024-07-18 01:32:50'),
(37, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 01:33:50'),
(38, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 01:35:28'),
(39, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 01:36:20'),
(40, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 01:37:04'),
(41, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 01:41:08'),
(42, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 01:41:53'),
(43, 4, 1250000.00, 'QRIS', 'Completed', '2024-07-18 01:42:40'),
(44, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 01:48:09'),
(45, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 01:54:21'),
(46, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 03:53:50'),
(47, 4, 100000.00, 'QRIS', 'Completed', '2024-07-18 03:59:38'),
(48, 1, 1750000.00, 'QRIS', 'Completed', '2024-07-18 04:49:03'),
(50, 1, 200000.00, 'QRIS', 'Completed', '2024-07-18 06:24:35'),
(52, 1, 100000.00, 'QRIS', 'Completed', '2024-07-18 14:26:40'),
(53, 6, 200000.00, 'QRIS', 'Completed', '2024-07-18 14:42:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(10) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `status`) VALUES
(1, 'dudul', 'dudul@gmail.com', 'hahah', 'inactive'),
(2, 'abc', 'abc@gmail.com', '1234567890-qwertyuiopasdfghjkl;zxcvbnm,', 'active'),
(3, 'pai', 'paigunshop@gmail.com', 'paigada', 'active'),
(4, 'abc', 'abc@gmail.com', '123', 'active'),
(5, 'hahah', 'hahah@gmail.com', '123', 'active'),
(6, 'CCIT_FTUI', 'CCIT@gmail.com', 'TICC', 'active');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `topup_transactions`
--
ALTER TABLE `topup_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `topup_transactions`
--
ALTER TABLE `topup_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `topup_transactions`
--
ALTER TABLE `topup_transactions`
  ADD CONSTRAINT `topup_transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
