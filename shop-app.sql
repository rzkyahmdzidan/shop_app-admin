-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2024 at 03:47 PM
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
-- Database: `shop-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'admin', '2024-05-24 12:26:36', '2024-05-24 12:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idProduk` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `createdAt`, `updatedAt`) VALUES
(1, 'Akrilik', '2024-05-23 18:43:18', '2024-05-23 18:43:18'),
(2, 'Buket', '2024-05-23 18:43:18', '2024-05-23 18:43:18'),
(3, 'Ganci', '2024-05-23 18:43:18', '2024-05-23 18:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idProduk` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `idOrder` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id`, `idUser`, `idProduk`, `amount`, `idOrder`, `createdAt`, `updatedAt`) VALUES
(19, 7, 11, 2, 9, '2024-05-25 11:22:06', '2024-05-25 11:22:46'),
(20, 7, 12, 1, 9, '2024-05-25 11:22:10', '2024-05-25 11:22:46'),
(21, 7, 14, 3, 9, '2024-05-25 11:22:28', '2024-05-25 11:22:46'),
(22, 7, 18, 1, 9, '2024-05-25 11:22:32', '2024-05-25 11:22:46'),
(23, 7, 19, 10, 9, '2024-05-25 11:22:37', '2024-05-25 11:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `metodeBayar` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `idUser`, `status`, `metodeBayar`, `ongkir`, `createdAt`, `updatedAt`) VALUES
(9, 7, 'Pending', 'Transfer Bank', 69000, '2024-05-25 11:22:46', '2024-05-25 11:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `images` varchar(255) NOT NULL,
  `idKategori` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `title`, `description`, `price`, `images`, `idKategori`, `createdAt`, `updatedAt`) VALUES
(11, 'Buket Korean Style', '- Tinggi 75cm\n- Warna paper pink\n- Terdapat bunga dan juga dedaunan yang indah dan memukau\n- Terbuat dari bahan-bahan premium dan berkualitas tinggi\n- Cocok untuk merayakan anniversary, wisuda, dan merayakan hari bahagia bersama orang terkasih', 100000, 'Bouquet Korean Style.jpg', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Double Flower', '- Tinggi 50cm\n- Warna bunga merah\n- Warna paper hitam\n- Terbuat dari bahan-bahan premium dan berkualitas tinggi\n- Cocok untuk hari ibu, ulang tahun, dan merayakan setiap event', 27000, 'Double Flower.jpg', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Fairytale Buket', '- Tinggi 75cm.\n- Menggunakan kertas berwarna pink.\n- Dipenuhi dengan bunga dan dedaunan yang bervariasi dan sangat memukau.\n- Dibuat dari bahan-bahan premium dan berkualitas tinggi.\n- Lebih tahan lama karena menggunakan bunga palsu berkualitas.\n- Cocok dijadikan hadiah untuk orang istimewa.', 170000, 'Fairytale Buket.jpg', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Akrilik Buket', '- Menampilkan keindahan yang memukau dengan harga yang terjangkau.\r\n- Warna transparan dengan tulisan putih, menciptakan perpaduan yang sangat indah.\r\n- Dikemas dengan flower bouquet mini yang terbuat dari bahan berkualitas.\r\n- Termasuk dalam paketnya adalah box estetik, kartu ucapan, dan paperbag.\r\n- Cocok sebagai hadiah untuk ulang tahun, hari ibu, hari guru, dan berbagai acara spesial lainnya.', 60000, 'Akrilik Buket.jpg', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Gantungan Kunci Bulat', '- Gantungan kunci berbentuk lingkaran dengan diameter 5cm, ukuran yang ideal untuk dibawa di saku atau digantung di tas.\n- Terbuat dari bahan berkualitas tinggi, memberikan tampilan yang elegan dan tahan lama.\n- Desain yang sederhana dan minimalis, cocok untuk digunakan oleh semua kalangan.\n- Dilengkapi dengan cincin kunci yang kuat dan aman, menjaga kunci Anda tetap terjaga dengan baik.\n- Cocok sebagai aksesori gaya atau sebagai hadiah yang praktis dan berguna untuk teman atau keluarga Anda.', 10000, 'Gantungan Kunci Bulat.jpg', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Gantungan Kunci Kupu-Kupu', '- Gantungan kunci berbentuk kupu-kupu, menghadirkan sentuhan keindahan alam pada setiap langkah Anda.\n- Didesain dengan detail yang memukau, menampilkan bentuk elegan dan lekukan yang halus dari seekor kupu-kupu.\n- Terbuat dari bahan berkualitas tinggi, memberikan kekuatan dan ketahanan yang diperlukan untuk penggunaan sehari-hari.\n- Ukuran yang ideal untuk dibawa di saku atau digantung di tas, menjadikannya aksesori yang praktis dan gaya.\n- Cocok untuk menyempurnakan gaya pribadi Anda atau sebagai hadiah yang indah untuk orang yang Anda sayangi.', 13000, 'Gantungan Kunci Kupu-Kupu.jpg', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Akrilik Plakat', '- Plakat akrilik yang elegan, memberikan tampilan yang cantik dan profesional pada penghargaan atau pengakuan Anda.\n- Dihiasi dengan bunga-bunga indah yang dipasang dengan rapi di sekitar tepi plakat, menambahkan sentuhan keindahan alami pada desainnya.\n- Terbuat dari bahan akrilik berkualitas tinggi, plakat ini kokoh dan tahan lama, menjadikannya pilihan yang sempurna untuk berbagai acara dan penghargaan.\n- Memungkinkan untuk dipajang dengan mudah di meja kerja, rak, atau dinding.\n- Cocok sebagai hadiah istimewa atau pengakuan untuk pencapaian, perayaan, atau momen-momen berharga lainnya yang patut dihargai.', 75000, 'Akrilik Plakat.jpg', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Akrilik Luxury Daisy A5', '- Plakat akrilik luxury daisy ukuran A5 yang memancarkan keanggunan dan kemewahan dalam setiap detailnya.\n- Didesain dengan motif bunga daisy yang indah dan elegan, menambahkan sentuhan alami yang memikat pada ruang kerja atau dekorasi rumah Anda.\n- Terbuat dari bahan akrilik berkualitas tinggi dengan kilauan yang mengesankan, menjadikan plakat ini sebagai pilihan yang mewah dan kokoh.\n- Ukuran A5 yang sempurna memberikan fleksibilitas untuk dipajang dengan mudah di meja, rak buku, atau dinding.\n- Cocok sebagai hadiah yang istimewa atau penghargaan untuk momen-momen penting seperti pencapaian, ulang tahun, atau pengakuan atas kerja keras.', 95000, 'Akrilik Luxury Daisy A5.jpg', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Mug', '- Tinggi 9.5cm, diameter 8cm\n- Kapasitas: 325ml\n- warna dasar mug : putih\n- Terbuat dari bahan porselain keramik berkualitas import premium \n- Tahan terhadap panas dan dingin dan dapat digunakan di dalam microwave\n- Bahan berkualitas tinggi, dijamin awet dan tidak gampang retak\n- Cetakan Awet dan tahan lama\n- Harga sudah termasuk dus\n- Bisa dicuci seperti biasa dan wajib gunakan busa spons halus.', 50000, 'Mug.jpg', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Akrilik Cotton Flower A5', '- Akrilik berbentuk lingkaran dengan motif cotton flower yang memukau, menambahkan sentuhan kelembutan dan keanggunan pada dekorasi Anda.\n- Didesain dengan detail yang teliti, plakat ini menghadirkan keindahan alami bunga cotton dalam bentuk yang elegan dan modern.\n- Terbuat dari bahan akrilik berkualitas tinggi, memberikan kilauan yang mengesankan dan ketahanan yang luar biasa.\n- Ukuran yang kompak dan ringan, memungkinkan untuk dipajang dengan mudah di meja, dinding, atau rak buku.\n- Cocok sebagai hiasan rumah yang cantik atau sebagai hadiah yang istimewa untuk orang tersayang dalam berbagai kesempatan.', 85000, 'Akrilik Cotton Flower A5.jpg', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `idKecamatan` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `token`, `idKecamatan`, `createdAt`, `updatedAt`, `nama`, `hp`, `alamat`) VALUES
(7, 'zuzuzu@gmail.com', '$2b$12$JRqLUgEIkY6glEeT2tXjwOWE7vANrFN7tIInA9iiAlkySUYa462ae', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzE2NjM2MDY4fQ.0T-I-IbwOFsWaah4ee5DTREi6WGAYEoqSwP-GU4UeiM', '17', '2024-05-25 11:21:08', '2024-05-25 11:21:08', 'Zuzuzu', '081818', 'Burj Khalifa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idProduk` (`idProduk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idProduk` (`idProduk`),
  ADD KEY `idOrder` (`idOrder`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idKategori` (`idKategori`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_89` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_90` FOREIGN KEY (`idProduk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_133` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keranjang_ibfk_134` FOREIGN KEY (`idProduk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keranjang_ibfk_135` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`idKategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
