-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: penyimpanantokopulaubaru
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `id_varian` int NOT NULL,
  `id_brand` int NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `imagepath` varchar(100) NOT NULL,
  `stok` int NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang`
--

LOCK TABLES `barang` WRITE;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` VALUES (1,1,1,'tes','storage/images/HrlBsxqcSj5t2Wh8iW4b5qzYRnZa32a1T8UhM0gW.jpg',50,1,'2025-10-12 13:33:25','2025-12-09 09:36:50'),(2,2,1,'tes','storage/images/RjQ0MBnQHBYlHOm1E83aJhb6C03TKxUjT5m8QdHD.jpg',62,1,'2025-10-12 13:33:25','2025-12-09 09:37:30'),(3,3,1,'tes','storage/images/oYWixuZTw41AU6rkGdZ9zRDBnsaBxjH7Qrzk6uuL.jpg',20,1,'2025-10-12 13:33:25','2025-12-09 09:37:30'),(4,4,1,'tes','storage/images/FOusFT2zwNyjccfaLuT8kCHoWhHztGbOoDBc6KBT.jpg',15,1,'2025-10-12 13:33:25','2025-10-22 04:38:49'),(5,5,1,'tes','storage/images/o7ULbLfXbhiOWxwqRi5MdHwETFyMgkwTLkwQP3ty.jpg',20,1,'2025-10-12 13:33:25','2025-10-21 15:31:12'),(6,6,1,'tes','storage/images/V4iWQCj93EbWZFySwmyyjkzTUHtA1pVcU3DNrgYL.jpg',92,1,'2025-10-12 13:33:25','2025-10-21 15:35:58'),(7,7,1,'tes','storage/images/Mavrj36irWSVwk9UnNiXexEB7uvcjnpXJRv4gEY9.jpg',100,1,'2025-10-12 13:33:25','2025-10-21 15:41:23'),(8,8,1,'tes','storage/images/QxJ654qNXAVj2BjFC3ngdpmXSA1GQwpxBwaWUH90.jpg',100,1,'2025-10-12 13:33:25','2025-10-21 15:37:28'),(9,9,1,'tes','storage/images/Q9J2IAJiMGgu8pDgqi2c2hl0JhAAIFWXUIXfSsjj.jpg',0,1,'2025-10-12 13:33:25','2025-10-21 15:40:48'),(10,10,1,'tes','storage/images/sryBiHU2yT238BU78qVJpj3dHrjAGQcBr5zNRvX7.jpg',100,1,'2025-10-12 13:33:25','2025-10-21 15:39:59'),(11,11,1,'tes','storage/images/1PeR4mnTzH51FFbp2YnrymZcRnZ6n2NfhSEAMNRF.jpg',100,1,'2025-10-12 13:33:25','2025-10-21 15:39:34'),(12,12,1,'tes','storage/images/gO2ZX6TZr9QMc3QnYUge8BCqdVtnUVFKRmHnU0D1.jpg',100,1,'2025-10-12 13:33:25','2025-10-21 15:39:19'),(13,13,1,'tes','storage/images/LyYMyGfsbiWZcq2MsJWCZfWcjaPHXGLZhOoHugCN.jpg',100,1,'2025-10-12 13:33:25','2025-10-21 15:39:00'),(14,14,1,'tes','storage/images/XIGvJs7s9JB3SZbDAYBGeVNcd7B97OzMsLPVlmCu.jpg',100,1,'2025-10-12 13:33:25','2025-10-21 15:38:44'),(15,15,1,'tes','storage/images/d7R87HuSNNQoarQMDXNEsbNJh6RNteEgRr1S0phd.jpg',100,1,'2025-10-12 13:33:25','2025-10-21 15:38:23'),(16,16,1,'tes','storage/images/7motVPdORoKjp9xv4U5d7bt6DbfIv8lPDyLrafMx.jpg',0,1,'2025-10-12 13:33:25','2025-10-21 15:32:02'),(17,17,1,'tes','storage/images/7i2Oeqm5c8dHcO3m4YAJylhxzFVT1dpvx3Q5sgp0.jpg',0,1,'2025-10-12 13:33:25','2025-10-21 15:32:59'),(18,18,1,'tes','storage/images/WwpXl8AkQg4Vztyt4fXWO1Xr2ACOq7A5YpRLWMIE.jpg',0,1,'2025-10-12 13:33:25','2025-10-21 15:35:15'),(19,19,1,'tes','storage/images/IvcdX2CBzBCgiD5lFPylRJsvlIa14NAuCR25DI8A.jpg',0,1,'2025-10-12 13:33:25','2025-10-21 15:34:48'),(20,20,1,'tes','storage/images/5SPoWEi3dSWYHeGWZi56DimDHamPAqDh5z638Bd7.jpg',0,1,'2025-10-12 13:33:25','2025-10-21 15:34:20'),(21,21,2,'tes','tes',0,0,'2025-10-12 13:33:25','2025-10-21 15:41:52'),(22,4,3,'orchid','storage/images/b2OJugSSaICDWr9lSf6ACeTmRPHusLf7UIqnce69.jpg',0,0,'2025-10-21 15:43:21','2025-10-21 15:43:32');
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barangkeluar`
--

DROP TABLE IF EXISTS `barangkeluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barangkeluar` (
  `id_transaksi` varchar(20) NOT NULL,
  `id_user` int NOT NULL,
  `pesananpartner` int NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barangkeluar`
--

LOCK TABLES `barangkeluar` WRITE;
/*!40000 ALTER TABLE `barangkeluar` DISABLE KEYS */;
INSERT INTO `barangkeluar` VALUES ('PB10-2025-000001-016',16,1,25000000.00,'returned','2025-10-13 09:25:05','2025-10-15 22:11:15'),('PB10-2025-000002-016',16,1,640500.00,'draft','2025-10-16 00:45:42','2025-10-16 00:45:42'),('PB10-2025-000003-016',16,1,11135250.00,'selesai','2025-10-16 10:07:52','2025-10-19 01:34:39'),('PB10-2025-000004-016',16,1,105000.00,'selesai','2025-10-16 10:32:26','2025-10-19 01:33:55'),('PB10-2025-000005-016',16,1,108465.00,'draft','2025-10-19 11:05:39','2025-10-19 11:05:39'),('PB10-2025-000006-016',16,1,216930.00,'draft','2025-10-19 11:16:30','2025-10-19 11:16:30'),('PB10-2025-000007-016',16,1,440000.00,'returned','2025-10-19 14:02:24','2025-10-22 06:10:14'),('PB10-2025-000008-016',16,1,216930.00,'draft','2025-10-19 14:34:59','2025-10-19 14:34:59'),('PB10-2025-000009-016',16,1,108465.00,'draft','2025-10-19 14:35:00','2025-10-19 14:35:00'),('PB10-2025-000010-016',16,1,1200.00,'returned','2025-10-19 14:35:00','2025-10-21 14:57:23'),('PB10-2025-000011-001',1,0,10.00,'selesai','2025-10-19 16:16:45','2025-10-19 16:16:45'),('PB10-2025-000012-001',1,0,3300000.00,'selesai','2025-10-22 05:51:55','2025-10-22 05:51:55'),('PB12-2025-000001-001',1,0,2600000.00,'selesai','2025-12-09 09:36:50','2025-12-09 09:36:50');
/*!40000 ALTER TABLE `barangkeluar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barangretur`
--

DROP TABLE IF EXISTS `barangretur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barangretur` (
  `id_retur` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_faktur` int NOT NULL,
  `id_tipe` int NOT NULL,
  `totalrefund` decimal(15,2) DEFAULT NULL,
  `createat` datetime NOT NULL,
  PRIMARY KEY (`id_retur`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barangretur`
--

LOCK TABLES `barangretur` WRITE;
/*!40000 ALTER TABLE `barangretur` DISABLE KEYS */;
INSERT INTO `barangretur` VALUES (1,1,1,1,200000.00,'2025-12-09 09:26:17'),(2,1,1,1,200000.00,'2025-12-09 09:26:17'),(11,1,2,1,481000.00,'2025-12-10 23:58:08');
/*!40000 ALTER TABLE `barangretur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id_brand` int NOT NULL AUTO_INCREMENT,
  `namabrand` varchar(50) NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Jawa',1,'2025-10-12 13:39:33','2025-10-12 13:39:33'),(2,'Maspion',0,'2025-10-15 23:54:21','2025-10-15 23:54:21'),(3,'Orchid',1,'2025-10-21 15:42:55','2025-10-21 15:42:55');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('prediksi_data','a:13:{i:0;a:6:{s:9:\"id_barang\";i:1;s:11:\"nama_barang\";s:23:\"Panci Tinggi Jawa 16 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:9;i:1;i:3;i:2;i:5;}s:5:\"total\";i:17;}i:1;a:6:{s:9:\"id_barang\";i:2;s:11:\"nama_barang\";s:23:\"Panci Tinggi Jawa 18 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:5;i:1;i:4;i:2;i:5;}s:5:\"total\";i:14;}i:2;a:6:{s:9:\"id_barang\";i:3;s:11:\"nama_barang\";s:23:\"Panci Tinggi Jawa 20 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:7;i:1;i:5;i:2;i:6;}s:5:\"total\";i:18;}i:3;a:6:{s:9:\"id_barang\";i:4;s:11:\"nama_barang\";s:23:\"Panci Tinggi Jawa 22 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:6;i:1;i:3;i:2;i:5;}s:5:\"total\";i:14;}i:4;a:6:{s:9:\"id_barang\";i:5;s:11:\"nama_barang\";s:23:\"Panci Tinggi Jawa 24 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:5;i:1;i:1;i:2;i:2;}s:5:\"total\";i:8;}i:5;a:6:{s:9:\"id_barang\";i:6;s:11:\"nama_barang\";s:26:\"Dandang Ekonomi Jawa 22 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:7;i:1;i:3;i:2;i:4;}s:5:\"total\";i:14;}i:6;a:6:{s:9:\"id_barang\";i:7;s:11:\"nama_barang\";s:26:\"Dandang Ekonomi Jawa 24 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:6;i:1;i:2;i:2;i:3;}s:5:\"total\";i:11;}i:7;a:6:{s:9:\"id_barang\";i:8;s:11:\"nama_barang\";s:26:\"Dandang Ekonomi Jawa 26 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:7;i:1;i:4;i:2;i:3;}s:5:\"total\";i:14;}i:8;a:6:{s:9:\"id_barang\";i:11;s:11:\"nama_barang\";s:26:\"Dandang Ekonomi Jawa 33 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:7;i:1;i:4;i:2;i:3;}s:5:\"total\";i:14;}i:9;a:6:{s:9:\"id_barang\";i:12;s:11:\"nama_barang\";s:26:\"Dandang Ekonomi Jawa 36 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:5;i:1;i:4;i:2;i:4;}s:5:\"total\";i:13;}i:10;a:6:{s:9:\"id_barang\";i:13;s:11:\"nama_barang\";s:26:\"Dandang Ekonomi Jawa 40 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:4;i:1;i:5;i:2;i:2;}s:5:\"total\";i:11;}i:11;a:6:{s:9:\"id_barang\";i:15;s:11:\"nama_barang\";s:26:\"Dandang Ekonomi Jawa 50 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:0;i:1;i:-6;i:2;i:-10;}s:5:\"total\";i:-16;}i:12;a:6:{s:9:\"id_barang\";i:17;s:11:\"nama_barang\";s:16:\"Kuali Jawa 30 CM\";s:14:\"bulan_sekarang\";s:7:\"2025-12\";s:14:\"bulan_prediksi\";a:3:{i:0;s:13:\"Desember 2025\";i:1;s:12:\"Januari 2026\";i:2;s:13:\"Februari 2026\";}s:8:\"prediksi\";a:3:{i:0;i:3;i:1;i:0;i:2;i:1;}s:5:\"total\";i:4;}}',1765333416);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailbarangkeluar`
--

DROP TABLE IF EXISTS `detailbarangkeluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailbarangkeluar` (
  `id_transaksi` varchar(20) NOT NULL,
  `id_barang` int NOT NULL,
  `hargajual` decimal(15,2) NOT NULL,
  `jumlah` int NOT NULL,
  `total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_transaksi`,`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailbarangkeluar`
--

LOCK TABLES `detailbarangkeluar` WRITE;
/*!40000 ALTER TABLE `detailbarangkeluar` DISABLE KEYS */;
INSERT INTO `detailbarangkeluar` VALUES ('PB10-2025-000001-016',1,125000.00,100,12500000.00),('PB10-2025-000001-016',4,125000.00,100,12500000.00),('PB10-2025-000002-016',1,105000.00,4,420000.00),('PB10-2025-000002-016',4,110250.00,2,220500.00),('PB10-2025-000003-016',1,105000.00,97,10185000.00),('PB10-2025-000003-016',4,110250.00,1,110250.00),('PB10-2025-000003-016',6,105000.00,8,840000.00),('PB10-2025-000004-016',1,105000.00,1,105000.00),('PB10-2025-000005-016',2,108465.00,1,108465.00),('PB10-2025-000006-016',2,108465.00,1,108465.00),('PB10-2025-000006-016',3,108465.00,1,108465.00),('PB10-2025-000007-016',2,110000.00,2,220000.00),('PB10-2025-000007-016',3,110000.00,2,220000.00),('PB10-2025-000008-016',2,108465.00,1,108465.00),('PB10-2025-000008-016',3,108465.00,1,108465.00),('PB10-2025-000009-016',2,108465.00,1,108465.00),('PB10-2025-000010-016',3,120.00,10,1200.00),('PB10-2025-000011-001',4,1.00,10,10.00),('PB10-2025-000012-001',1,110000.00,10,1100000.00),('PB10-2025-000012-001',2,110000.00,10,1100000.00),('PB10-2025-000012-001',3,110000.00,10,1100000.00),('PB12-2025-000001-001',1,130000.00,10,1300000.00),('PB12-2025-000001-001',2,130000.00,10,1300000.00);
/*!40000 ALTER TABLE `detailbarangkeluar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailfaktur`
--

DROP TABLE IF EXISTS `detailfaktur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailfaktur` (
  `id_faktur` int NOT NULL,
  `id_barang` int NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `jumlah` int NOT NULL,
  PRIMARY KEY (`id_faktur`,`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailfaktur`
--

LOCK TABLES `detailfaktur` WRITE;
/*!40000 ALTER TABLE `detailfaktur` DISABLE KEYS */;
INSERT INTO `detailfaktur` VALUES (1,2,100000.00,20),(1,3,100000.00,20),(2,1,95000.00,10),(2,2,98000.00,10),(3,1,120000.00,10),(3,2,105000.00,10),(4,1,105000.00,10),(5,1,120000.00,10),(5,2,120000.00,10),(6,1,120000.00,1),(6,2,120000.00,1),(7,1,120000.00,10),(7,2,120000.00,10),(8,1,100000.00,10),(8,2,120000.00,10),(9,1,120000.00,1),(9,2,120000.00,1),(10,2,150000.00,10),(10,3,120000.00,10);
/*!40000 ALTER TABLE `detailfaktur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailperubahan`
--

DROP TABLE IF EXISTS `detailperubahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailperubahan` (
  `id_logperubahan` int NOT NULL,
  `id_barang` int NOT NULL,
  `sebelum` int DEFAULT NULL,
  `sesudah` int DEFAULT NULL,
  PRIMARY KEY (`id_logperubahan`,`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailperubahan`
--

LOCK TABLES `detailperubahan` WRITE;
/*!40000 ALTER TABLE `detailperubahan` DISABLE KEYS */;
INSERT INTO `detailperubahan` VALUES (8,3,20,21),(8,4,19,15);
/*!40000 ALTER TABLE `detailperubahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detailretur`
--

DROP TABLE IF EXISTS `detailretur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detailretur` (
  `id_retur` int NOT NULL,
  `id_barang` int NOT NULL,
  `jumlahretur` int NOT NULL,
  PRIMARY KEY (`id_retur`,`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailretur`
--

LOCK TABLES `detailretur` WRITE;
/*!40000 ALTER TABLE `detailretur` DISABLE KEYS */;
INSERT INTO `detailretur` VALUES (1,2,10),(1,3,10),(2,2,10),(11,1,3),(11,2,2);
/*!40000 ALTER TABLE `detailretur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakturpembelian`
--

DROP TABLE IF EXISTS `fakturpembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fakturpembelian` (
  `id_faktur` int NOT NULL AUTO_INCREMENT,
  `id_supplier` int NOT NULL,
  `duedate` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `totalhargabarang` decimal(15,2) NOT NULL,
  `biayatambahan` decimal(15,2) NOT NULL,
  `updateat` datetime NOT NULL,
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_faktur`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakturpembelian`
--

LOCK TABLES `fakturpembelian` WRITE;
/*!40000 ALTER TABLE `fakturpembelian` DISABLE KEYS */;
INSERT INTO `fakturpembelian` VALUES (1,1,'2025-12-09 00:00:00','lunas',2700000.00,15000.00,'2025-12-09 09:37:30','2025-12-09 09:37:30'),(2,1,'2025-12-09 00:00:00','lunas',2700000.00,15000.00,'2025-12-09 09:37:30','2025-12-09 09:37:30'),(3,1,'2025-12-09 00:00:00','lunas',1200000.00,10000.00,'2025-12-09 09:25:39','2025-12-09 09:25:39'),(5,1,'2025-12-09 00:00:00','lunas',2400000.00,100000.00,'2025-12-09 09:26:17','2025-12-09 09:26:17'),(6,2,'2025-12-09 00:00:00','lunas',240000.00,10.00,'2025-12-09 09:26:39','2025-12-09 09:26:39'),(7,1,'2025-12-09 00:00:00','lunas',2400000.00,12000.00,'2025-12-09 09:33:19','2025-12-09 09:33:19'),(8,1,'2025-12-09 00:00:00','lunas',2200000.00,12000.00,'2025-12-09 09:33:53','2025-12-09 09:33:53'),(9,1,'2025-12-09 00:00:00','lunas',240000.00,5000.00,'2025-12-09 09:34:42','2025-12-09 09:34:42'),(10,1,'2025-12-09 00:00:00','lunas',2700000.00,15000.00,'2025-12-09 09:37:30','2025-12-09 09:37:30');
/*!40000 ALTER TABLE `fakturpembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hargabarang`
--

DROP TABLE IF EXISTS `hargabarang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hargabarang` (
  `id_barang` int NOT NULL,
  `id_pararel` int NOT NULL,
  `hargabeli` decimal(10,2) NOT NULL,
  `pilihan` int NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_barang`,`id_pararel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hargabarang`
--

LOCK TABLES `hargabarang` WRITE;
/*!40000 ALTER TABLE `hargabarang` DISABLE KEYS */;
INSERT INTO `hargabarang` VALUES (1,1,100000.00,0,1,'2025-10-12 15:51:39','2025-12-09 09:34:42'),(1,2,102400.00,0,1,'2025-10-20 01:14:31','2025-12-09 09:34:42'),(1,3,105100.00,0,1,'2025-10-22 05:50:17','2025-12-09 09:34:42'),(1,4,121000.00,0,1,'2025-12-09 09:25:39','2025-12-09 09:34:42'),(1,5,125000.00,0,1,'2025-12-09 09:26:17','2025-12-09 09:34:42'),(1,6,120100.00,0,1,'2025-12-09 09:26:39','2025-12-09 09:34:42'),(1,7,120600.00,0,1,'2025-12-09 09:33:19','2025-12-09 09:34:42'),(1,8,100600.00,0,1,'2025-12-09 09:33:53','2025-12-09 09:34:42'),(1,9,122500.00,1,1,'2025-12-09 09:34:42','2025-12-09 09:34:42'),(2,1,103300.00,0,1,'2025-10-16 20:42:16','2025-12-09 09:37:30'),(2,2,105700.00,0,1,'2025-10-20 01:14:31','2025-12-09 09:37:30'),(2,3,105000.00,0,1,'2025-10-22 05:09:38','2025-12-09 09:37:30'),(2,4,125000.00,0,1,'2025-12-09 09:26:17','2025-12-09 09:37:30'),(2,5,120100.00,0,1,'2025-12-09 09:26:39','2025-12-09 09:37:30'),(2,6,120600.00,0,1,'2025-12-09 09:33:19','2025-12-09 09:37:30'),(2,7,120700.00,0,1,'2025-12-09 09:33:53','2025-12-09 09:37:30'),(2,8,122500.00,0,1,'2025-12-09 09:34:42','2025-12-09 09:37:30'),(2,9,150900.00,1,1,'2025-12-09 09:37:30','2025-12-09 09:37:30'),(3,1,110000.00,0,1,'2025-10-12 15:51:39','2025-12-09 09:37:30'),(3,2,103300.00,0,1,'2025-10-16 20:42:16','2025-12-09 09:37:30'),(3,3,120700.00,1,1,'2025-12-09 09:37:30','2025-12-09 09:37:30'),(4,1,105000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(5,1,107000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(6,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(7,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(8,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(9,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(10,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(11,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(12,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(13,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(14,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(15,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(16,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(17,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(18,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(19,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39'),(20,1,100000.00,1,1,'2025-10-12 15:51:39','2025-10-12 15:51:39');
/*!40000 ALTER TABLE `hargabarang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `namakategori` varchar(25) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Alat Masak','Kumpulan alat-alat untuk memasak',1,'2025-10-12 13:33:25','2025-10-12 13:33:25'),(2,'alat pembersih','alat bersih bersih',0,'2025-10-15 22:37:20','2025-10-15 22:38:09');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `laporan`
--

DROP TABLE IF EXISTS `laporan`;
/*!50001 DROP VIEW IF EXISTS `laporan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `laporan` AS SELECT 
 1 AS `waktu`,
 1 AS `cashflowin`,
 1 AS `cashflowout`,
 1 AS `freecashflow`,
 1 AS `lababersih`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `logpenjualanharian`
--

DROP TABLE IF EXISTS `logpenjualanharian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logpenjualanharian` (
  `idlogpenjualan` varchar(20) NOT NULL,
  `id_user` int NOT NULL,
  `omsetinput` decimal(15,2) DEFAULT NULL,
  `totalhitungansistem` decimal(15,2) DEFAULT NULL,
  `keuntungansistem` decimal(15,2) DEFAULT NULL,
  `totalomset` decimal(15,2) DEFAULT NULL,
  `totalkeuntungan` decimal(15,2) DEFAULT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`idlogpenjualan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logpenjualanharian`
--

LOCK TABLES `logpenjualanharian` WRITE;
/*!40000 ALTER TABLE `logpenjualanharian` DISABLE KEYS */;
INSERT INTO `logpenjualanharian` VALUES ('20251013',1,0.00,2200000.00,200000.00,2200000.00,200000.00,'2025-10-13 09:33:41','2025-10-13 09:33:41'),('20251019',1,0.00,11240260.00,0.00,11240260.00,0.00,'2025-10-19 01:33:55','2025-10-19 16:16:45'),('20251022',1,0.00,3300000.00,166000.00,3300000.00,166000.00,'2025-10-22 05:51:55','2025-10-22 05:51:55'),('20251209',1,10.00,2600000.00,150000.00,2600010.00,150001.60,'2025-12-09 09:35:32','2025-12-09 09:36:50');
/*!40000 ALTER TABLE `logpenjualanharian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logperubahan`
--

DROP TABLE IF EXISTS `logperubahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logperubahan` (
  `id_logperubahan` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `createat` datetime NOT NULL,
  `alasan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_logperubahan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logperubahan`
--

LOCK TABLES `logperubahan` WRITE;
/*!40000 ALTER TABLE `logperubahan` DISABLE KEYS */;
INSERT INTO `logperubahan` VALUES (1,1,'2025-10-12 15:56:39','tes'),(2,1,'2025-10-12 15:58:26','tes'),(3,1,'2025-10-12 16:01:13','tes'),(4,1,'2025-10-12 16:03:44','tes aja'),(5,1,'2025-10-21 15:58:58','tes aja'),(6,1,'2025-10-22 03:57:07','r'),(7,1,'2025-10-22 05:53:25','perbaikan'),(8,1,'2025-12-10 22:01:32','Stock opname bulanan');
/*!40000 ALTER TABLE `logperubahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_09_08_144140_create_personal_access_tokens_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (53,'App\\Models\\User',3,'partner123@gmail.com','c07cc946ec872a28f623492525ebb8f908e19ce84b71cc4a06a50741fcbc3541','[\"*\"]','2025-10-05 11:37:45',NULL,'2025-10-04 07:31:30','2025-10-05 11:37:45'),(97,'App\\Models\\User',16,'partner@gmail.com','030405f07d5ffcd079139681a327276284261e78de3e4dff8fd9b7b62f471e2c','[\"*\"]','2025-10-19 07:47:20',NULL,'2025-10-19 07:34:47','2025-10-19 07:47:20'),(116,'App\\Models\\User',1,'pemilik@gmail.com','36e35cdc0678ba95e87d2b04156b1fc142b5bca3e488a2ec001f7da694c9300c','[\"*\"]','2025-12-10 16:58:08',NULL,'2025-12-10 14:49:45','2025-12-10 16:58:08');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perusahaan`
--

DROP TABLE IF EXISTS `perusahaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perusahaan` (
  `id_perusahaan` int NOT NULL AUTO_INCREMENT,
  `namaperusahaan` varchar(50) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `kontak` varchar(14) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_perusahaan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perusahaan`
--

LOCK TABLES `perusahaan` WRITE;
/*!40000 ALTER TABLE `perusahaan` DISABLE KEYS */;
INSERT INTO `perusahaan` VALUES (1,'PT Sepanjang Usaha Makmur','Menjual berbagai peralatan aluminium','776767','Jalan Sultan Muhammad No. 62',1,'2025-10-12 13:31:59','2025-10-12 13:31:59'),(2,'PT tes tes saja','tes aja','tes aja','tes aja',0,'2025-10-15 22:17:30','2025-10-15 22:18:48'),(3,'pt coba coba','coba coba','coba coba','coba coba',0,'2025-10-16 01:07:38','2025-10-16 01:09:33'),(4,'tes 123','tes','tes','tes',1,'2025-10-22 04:14:25','2025-10-22 04:14:25');
/*!40000 ALTER TABLE `perusahaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesananpartner`
--

DROP TABLE IF EXISTS `pesananpartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesananpartner` (
  `id_transaksi` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesananpartner`
--

LOCK TABLES `pesananpartner` WRITE;
/*!40000 ALTER TABLE `pesananpartner` DISABLE KEYS */;
INSERT INTO `pesananpartner` VALUES ('PB10-2025-000001-016','draft','2025-10-13 09:25:05','2025-10-15 22:11:15'),('PB10-2025-000002-016','draft','2025-10-16 00:45:42','2025-10-16 00:45:42'),('PB10-2025-000003-016','selesai','2025-10-16 10:07:52','2025-10-19 01:34:39'),('PB10-2025-000004-016','selesai','2025-10-16 10:32:26','2025-10-19 01:33:55'),('PB10-2025-000005-016','draft','2025-10-19 11:05:39','2025-10-19 11:05:39'),('PB10-2025-000006-016','draft','2025-10-19 11:16:30','2025-10-19 11:16:30'),('PB10-2025-000007-016','returned','2025-10-19 14:02:24','2025-10-22 06:10:14'),('PB10-2025-000008-016','ditolak','2025-10-19 14:34:59','2025-10-21 14:57:58'),('PB10-2025-000009-016','disetujui','2025-10-19 14:35:00','2025-10-21 14:57:05'),('PB10-2025-000010-016','returned','2025-10-19 14:35:00','2025-10-21 14:57:23');
/*!40000 ALTER TABLE `pesananpartner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiltoko`
--

DROP TABLE IF EXISTS `profiltoko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiltoko` (
  `id_pemilik` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `kontakwa` varchar(14) NOT NULL,
  `persenmitraprofit` decimal(10,2) NOT NULL,
  `persenprofitestimasi` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pemilik`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiltoko`
--

LOCK TABLES `profiltoko` WRITE;
/*!40000 ALTER TABLE `profiltoko` DISABLE KEYS */;
INSERT INTO `profiltoko` VALUES (1,'Toko Pulau Baru','Jalan Raya Sungai Pinyuh RT/RW 004/004','PulauBaruKalbar@gmail.com','081561562811',6.00,16.00);
/*!40000 ALTER TABLE `profiltoko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satuan`
--

DROP TABLE IF EXISTS `satuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `satuan` (
  `id_satuan` int NOT NULL AUTO_INCREMENT,
  `namasatuan` varchar(25) NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satuan`
--

LOCK TABLES `satuan` WRITE;
/*!40000 ALTER TABLE `satuan` DISABLE KEYS */;
INSERT INTO `satuan` VALUES (1,'CM',1,'2025-10-12 13:40:08','2025-10-12 13:40:08'),(2,'Liter',0,'2025-10-15 15:51:51','2025-10-15 15:53:49');
/*!40000 ALTER TABLE `satuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('11aArnaOGuxaZwzjfdjtb4NyMxgx7UgvjGU2Xb2T',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoicndPME9VYnNPTXRidUhIVDZza3JRY0kzMkdWMm14QVE0MTJVQjdhSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859293),('2fAolMQviMaluMC31FUQNlPsws929XnC0cnSZa4w',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidWRoTUo0WGp5YllnU2ppWVRVUXpmYk5VejYzR08wWHlLSmJ3M3JjdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859361),('5AXPg4VTdndfRyb6GocBsGlkMseplBksOY4pqlrJ',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0xCb0FoanUzdFNPeFljTWJacmtyWU5RR0JwOEdOTUVCNk9lYVVGSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857303),('5VCimpOVafWeXPiZzCKoW1KZxUxDBVqyNkTOG3rq',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidFRteGdDa3NHQ0p0ekgydjF1cUt5MUR5TzBiMmY5ZWU3ZklmcUM5SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857314),('5YpVWoeQO5Nbz2iYb6zTOpAMbezFpHMOcLPWdu9a',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkc1cFYwVHVna0dzbVlVZHMxOUpzRG52WXQxSHhORElRWng0MlBtYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859362),('6DhFNut29YYlcLoPutQMAodsGORty3EV1xtiG5Cp',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoicU1heVFLV3RZNzFTOFdNZzY1UXFMemQwMGh0MGZEWm55VU9jNEc0RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859307),('8dRexNukXe6HVFZS0vFCEozcXk8PmbnqplJVRrqd',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmRtYTdHOUJPazV6aDJueHBtdUxVbXlyRnhQMFJVTzdSa1lxU1pSNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859295),('9t0ofjfUdwh38Bkkpl3QopEfTRJTQGyPau5Kb8yY',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkdxUGhEbFpQVVAwUnY3dllxNWx1RXZGNTYwc2dNNEtrVDNSYUF2YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859261),('9WTYJUXtALNhJue3c5unZxYorcu6qk5umieVB1sm',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibHJlYjhLd3BUOVFiMU1jbnJmYUM4d093TlFCeVdqZm1MR2t5dFpFWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859261),('BvpYJfLys2rZQVXDxR3cwrfrTUItEPE21hWE61OU',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibnFaZ2NMdHVNMFRpOXBUOHdSSFpnYUdzVUN1SEN4MFhNWFM2VDZjaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857343),('CAx5MgOWkERVSK5mG1LbQyDc6nQtxssOcVwIJRWv',NULL,'192.168.100.106','PostmanRuntime/7.49.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmRrQ0N2UFROdXgyTnlPU2d0WW1iU3N1YkE4em11TWp2dkVkTmdDQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xOTIuMTY4LjEwMC4xMDY6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1764510845),('cR4CkW9YVVzsffU4OeFw5zrUhVNMPW2vSn5SYRFQ',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVJkR2pTOVV4bWxqYVRKVFQwWHpqWExHVFVXcGlVcEZVZExpem4yRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859289),('dYB3oMNGi4SuVhaaAxUzcdTfkQUa3nxtBBV4nSQZ',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoielVKSEhXVTZUcldUakYzWWVlYnEyOUNCSVRpajRqT3N1SnFxS1pTRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760860039),('esGfva4kVRpLatsZVQxgd8jPxeeLnIBsJkIMKkaj',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmxGTWhaRmJVeWpqc0pqMFhKVnJMaXo2V2Jub3JQTFpoc2dVRGVDOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859308),('IzoltOb0dptgF7n8tKpywJpRR5sLCsjfWlPLcPi6',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibXdQU21YSmhUUXVSbDNtalNPUHNlbWRLenVMVlQ0eW5la2hjam5ZOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859291),('jnmB9pRKcFY1Ut1N4OJUhLlSySMnGHb0fmz0rvDH',NULL,'10.60.215.66','PostmanRuntime/7.48.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEIxQkx0Q2U3N0hyOWswNnlvOTBTNDBnSVBhc0pKeWdOSEhHWm9VUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMC42MC4yMTUuNjY6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760720806),('k55el1U2EEa4icFUAqFQxc5vOvj44RLXnMOfEApO',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3plQllBWmFRaHBtMDhycjN4NGI2bXZKZ29nZjZ3akdSVkd5MlRFWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859334),('KgzNOylfI7URaTN9KK4kNGRMVeKI1qnKKjMYhUMd',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkQ3Smh6OGR0MXFjMkIzbHFsWkplRksyUjlSYnQ4NmtxdWlUREUxTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859301),('L5qlx90Ykap8OcxIPc4iMtjKSLidLYv7GW3GTH6e',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoicjIwRFM3cHNtbUNQblpObmxzVklQTUZDZWJzMmdlRXY3V01KSlFBWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857303),('Lsp1rsJW0VYykYtpuxWMVwbgg3rVwsJNpsvwkWlX',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGhUWkxDbkp5Vzhtak8ycVhvNlV0enY2aTN4c2MyY1pwY2Q4Y0F1NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859297),('MDeqPKWFEkx5qEFUytf9x1kvnzTc6M5XDuGErfPM',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0pLN3J5MDZRc3Btb08wY2lXb1d0aXdLOGZwVUUyVWFvUGNrcmtaMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857313),('NHjChfLbhhQDaKnjb3dnRlUCX8iobhqXg788B0qh',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1JDVnNHb0o4VXduT3AxOE9zNTNrMDFHY1dzUUwxT2E4dnJtdXJobiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859252),('o7yXXa3wOw0u6vuDzXRAi8lmyXY8qjVaOfhNTXmq',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoia0JxTFU4OFdHWk9ERGY1TmtPU0t6eWE5aVBZRm9yZUVEVXRnS3BJayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760860037),('ORuzfjtAc6TOmofyqS7fdHHwTMXPNEGybNQmgpch',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidnJFWlZJMHZKeGlvVEcxc0F4NGNrZ0psazhrUkd5MVM2UlRZWHZ5VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859332),('P2T6KtTzgQry7mp6floN62PwjF8W8fuYrus8VcwB',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmZYU2hQR3pXVkF0bEZVbElaRTdJeGZsN2l1WmU3bjNRQlAyZnlJQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859293),('P5mHw2Rmb0fwUSgsuYtVfuajztO1XoR8RCjNBq0N',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkwwWDRESjgxM0tQV1k2OFFkbURsTkQ1WU9RQ2oyNHZpNHdPaUlKUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857289),('p8YGDnaluDWMUBJYVYaGhAjmuVyX66ldplu8LYa3',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3BoZ05QYUIwRFdUcTMwNEFCUzNjdEV1SjFUSG8wMVNvcW51aTVhMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859298),('QklTge7NRUpxZrxr9zLuaPvbSujUuoxbz01t0HSJ',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE5DaW1JNjFOem02UDgxTFdsOGxJRW1sTkJKcHc0eEptUEZCS0ZPbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859262),('qoBC9LWaAfXw3CbatKRQsKZbXZj5SOrYDmLbMSY8',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibkdFc0dXcHFnelJDR3A5YW82S1cwQzlwUUZhU0NBVklKWTNaR3V3TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857345),('raTjnmTM4uRR3RECPSElYjHMPhsCoMKpWxVmAXUk',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiejBBTzc4dG1EVUxSNWRadTNmMmVic1U4TkdHd1haTTJRYmxhMUd2QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857290),('sEL0oFP4NxsitM0Gl2D0PQw2ueAmDyLDXghWEw4n',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1I2RmFGcjFIbW5CWUVwRUlKeTdGR0JiUXdJU3o0bUs1TldleW04RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859348),('tvSWsZPD8kQNZ8K3uG21VOwgACN4sQSHh0Zi0eTW',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXBvd3FZOVJhcEVWYWZXYjVuM0hEc0NqNVBlazFYeERtUGJWakFpeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859295),('uiDSXnXliHMw2aU0V4nw5FVz8eB9U1UxFIBpH1Db',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidENaSTA2UGJ0U05yTDBMbjQwN1I3QlJZQmFiM0hmSkdvaVI4MldneiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859349),('x9GxgHowodSfz43jfcn9I3r0os2JyBiBm2Hzy3Ci',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiczNZaFpLNENvaFlsOEJHOFJVZE5YZWdlWlF4S2JCbTE3R1p1Rk1VTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760857344),('xkIhrF5Bhz4JYUgbNJqymN8Ee7zOIdBJ6vI0VUM5',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGplSWZEUk1maldRd1p6RVQwNlhzM1ZKcHRCWk5iVzhrTGQ3TFRwdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859253),('xS5xjv92DlvI7DBlxxo2uR6xpAgkdYxY6SjQ5DjF',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGZVVFlxcUlscmNUQ1VwZlJYcVdTajlPTTRLQnpFcks1WHh2cW1vdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859288),('ZmHCguckNmk1l5rE8ttIjbawEMkv75YmJ4KcHFVz',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEhwQ0VuS210bUVRQWVTN2xmS1pRU25tdGVJQ0JSSlB2ajhCd2FNcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859261),('ZtQHSUEGR1z5bbvufpV6ycuLgb5dlfbE9vWCr0Ar',NULL,'192.168.43.234','Dart/3.5 (dart:io)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXRwbm84UFpIdFZUVDZYVGZxM3ZqbXRTcHhkN3pwWVZWeUpkWlVPVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjQzLjE3OTo4MDAwL1BpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760859290);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subkategori`
--

DROP TABLE IF EXISTS `subkategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subkategori` (
  `id_subkategori` int NOT NULL AUTO_INCREMENT,
  `id_kategori` int NOT NULL,
  `namasubkategori` varchar(25) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_subkategori`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subkategori`
--

LOCK TABLES `subkategori` WRITE;
/*!40000 ALTER TABLE `subkategori` DISABLE KEYS */;
INSERT INTO `subkategori` VALUES (1,1,'Panci Tinggi','Panci tinggi adalah panci dengan dinding yang panjang dan biasanya berkapasitas besar',1,'2025-10-12 13:34:42','2025-10-12 13:34:42'),(2,1,'Dandang Ekonomi','Dandang ekonomi adalah alat masak kukusan serbaguna',1,'2025-10-12 13:36:47','2025-10-12 13:36:47'),(3,1,'Kuali','Kuali masak adalah alat dapur berbentuk cekung dengan dasar bulat yang digunakan untuk menggoreng, menumis, atau memasak makanan lainnya',1,'2025-10-12 13:38:28','2025-10-12 13:38:28'),(4,2,'sapu','tes aja',0,'2025-10-15 22:37:47','2025-10-15 23:15:39');
/*!40000 ALTER TABLE `subkategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `id_perusahaan` int NOT NULL,
  `namasupplier` varchar(50) NOT NULL,
  `status` int NOT NULL,
  `kontak` varchar(14) NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,1,'Agen A',1,'08123456789','2025-10-12 13:32:39','2025-10-12 13:32:39'),(2,2,'agen tes',1,'tes','2025-10-15 22:18:08','2025-10-15 22:36:34'),(3,3,'tes 1234567',1,'tes 123','2025-10-16 01:08:22','2025-10-16 01:08:22');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipe`
--

DROP TABLE IF EXISTS `tipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipe` (
  `id_tipe` int NOT NULL AUTO_INCREMENT,
  `namatipe` varchar(50) NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_tipe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipe`
--

LOCK TABLES `tipe` WRITE;
/*!40000 ALTER TABLE `tipe` DISABLE KEYS */;
INSERT INTO `tipe` VALUES (1,'Refund',1,'2025-10-12 15:37:38','2025-10-12 15:37:38'),(2,'Ganti Barang',1,'2025-10-22 04:19:14','2025-10-22 04:19:14');
/*!40000 ALTER TABLE `tipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ukuran`
--

DROP TABLE IF EXISTS `ukuran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ukuran` (
  `id_ukuran` int NOT NULL AUTO_INCREMENT,
  `id_satuan` int NOT NULL,
  `ukuran` int NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_ukuran`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ukuran`
--

LOCK TABLES `ukuran` WRITE;
/*!40000 ALTER TABLE `ukuran` DISABLE KEYS */;
INSERT INTO `ukuran` VALUES (1,1,16,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(2,1,18,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(3,1,20,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(4,1,22,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(5,1,24,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(6,1,26,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(7,1,28,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(8,1,30,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(9,1,33,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(10,1,35,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(11,1,36,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(12,1,40,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(13,1,41,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(14,1,45,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(15,1,46,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(16,1,50,1,'2025-10-12 13:41:08','2025-10-12 13:41:08'),(17,2,55,0,'2025-10-15 15:53:00','2025-10-15 23:16:25');
/*!40000 ALTER TABLE `ukuran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` int NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pemilik','pemilik@gmail.com',NULL,'$2y$12$PomWlysMIbO691/UzKyLCeWGhFJdnFB15axOH983Oox0gRw7Sfr46','Jl. Sudirman No. 123','pemilik',1,NULL,'2025-09-08 07:49:52','2025-10-12 06:26:09'),(2,'karyawan sendri','karyawan@gmail.com',NULL,'$2y$12$vGNsYCaqtZ3sGyOqaAosZODrr8Mt0VfPnztcV4jjvCQP.KRHXFnCO','sungai pinyuh 2','karyawan',1,NULL,'2025-09-16 00:54:39','2025-10-21 21:07:41'),(16,'partner 1','partner@gmail.com',NULL,'$2y$12$dOCxVLwxfoCblDLbJ2xhmOQ7NJSczxT1cI4Mp.a.gBao9rm/62byi','sungai pinyuh','partner',1,NULL,'2025-10-13 02:23:04','2025-10-13 02:23:04'),(17,'user 1 2 3','tes@gmail.com',NULL,'$2y$12$eL1MEeIO0Vi0Aj3s6b9ZaOltdWHJYwOIhYlEjBdjBgBuYZvU4vdP2','tes saja lah','karyawan',1,NULL,'2025-10-21 21:10:30','2025-10-21 21:10:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_barang`
--

DROP TABLE IF EXISTS `v_barang`;
/*!50001 DROP VIEW IF EXISTS `v_barang`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_barang` AS SELECT 
 1 AS `namatext`,
 1 AS `id_barang`,
 1 AS `id_varian`,
 1 AS `id_subkategori`,
 1 AS `namasubkategori`,
 1 AS `namakategori`,
 1 AS `id_ukuran`,
 1 AS `ukuran`,
 1 AS `namasatuan`,
 1 AS `id_brand`,
 1 AS `namabrand`,
 1 AS `deskripsi`,
 1 AS `imagepath`,
 1 AS `stok`,
 1 AS `hargabeli`,
 1 AS `status`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_barangkeluar`
--

DROP TABLE IF EXISTS `v_barangkeluar`;
/*!50001 DROP VIEW IF EXISTS `v_barangkeluar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_barangkeluar` AS SELECT 
 1 AS `id_transaksi`,
 1 AS `name`,
 1 AS `pesananpartner`,
 1 AS `total`,
 1 AS `status`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_barangretur`
--

DROP TABLE IF EXISTS `v_barangretur`;
/*!50001 DROP VIEW IF EXISTS `v_barangretur`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_barangretur` AS SELECT 
 1 AS `id_retur`,
 1 AS `id_user`,
 1 AS `id_faktur`,
 1 AS `id_tipe`,
 1 AS `totalrefund`,
 1 AS `createat`,
 1 AS `name`,
 1 AS `namatipe`,
 1 AS `namasupplier`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_barangwithpartprice`
--

DROP TABLE IF EXISTS `v_barangwithpartprice`;
/*!50001 DROP VIEW IF EXISTS `v_barangwithpartprice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_barangwithpartprice` AS SELECT 
 1 AS `namatext`,
 1 AS `id_barang`,
 1 AS `id_varian`,
 1 AS `namasubkategori`,
 1 AS `namakategori`,
 1 AS `id_ukuran`,
 1 AS `ukuran`,
 1 AS `namasatuan`,
 1 AS `id_brand`,
 1 AS `namabrand`,
 1 AS `deskripsi`,
 1 AS `imagepath`,
 1 AS `stok`,
 1 AS `hargajual`,
 1 AS `status`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_barangwithprice`
--

DROP TABLE IF EXISTS `v_barangwithprice`;
/*!50001 DROP VIEW IF EXISTS `v_barangwithprice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_barangwithprice` AS SELECT 
 1 AS `namatext`,
 1 AS `id_barang`,
 1 AS `id_varian`,
 1 AS `id_subkategori`,
 1 AS `namasubkategori`,
 1 AS `namakategori`,
 1 AS `id_ukuran`,
 1 AS `ukuran`,
 1 AS `namasatuan`,
 1 AS `id_brand`,
 1 AS `namabrand`,
 1 AS `deskripsi`,
 1 AS `imagepath`,
 1 AS `stok`,
 1 AS `hargabeli`,
 1 AS `status`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_detailbarangkeluar`
--

DROP TABLE IF EXISTS `v_detailbarangkeluar`;
/*!50001 DROP VIEW IF EXISTS `v_detailbarangkeluar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_detailbarangkeluar` AS SELECT 
 1 AS `id_transaksi`,
 1 AS `hargajual`,
 1 AS `jumlah`,
 1 AS `id_barang`,
 1 AS `total`,
 1 AS `namatext`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_detailbarangretur`
--

DROP TABLE IF EXISTS `v_detailbarangretur`;
/*!50001 DROP VIEW IF EXISTS `v_detailbarangretur`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_detailbarangretur` AS SELECT 
 1 AS `id_retur`,
 1 AS `id_barang`,
 1 AS `jumlahretur`,
 1 AS `namatext`,
 1 AS `harga`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_detailfaktur`
--

DROP TABLE IF EXISTS `v_detailfaktur`;
/*!50001 DROP VIEW IF EXISTS `v_detailfaktur`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_detailfaktur` AS SELECT 
 1 AS `id_faktur`,
 1 AS `harga`,
 1 AS `jumlah`,
 1 AS `id_barang`,
 1 AS `namatext`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_fakturpembelian`
--

DROP TABLE IF EXISTS `v_fakturpembelian`;
/*!50001 DROP VIEW IF EXISTS `v_fakturpembelian`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_fakturpembelian` AS SELECT 
 1 AS `id_faktur`,
 1 AS `id_supplier`,
 1 AS `namasupplier`,
 1 AS `id_perusahaan`,
 1 AS `namaperusahaan`,
 1 AS `duedate`,
 1 AS `status`,
 1 AS `totalhargabarang`,
 1 AS `biayatambahan`,
 1 AS `updateat`,
 1 AS `createat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_fakturretur`
--

DROP TABLE IF EXISTS `v_fakturretur`;
/*!50001 DROP VIEW IF EXISTS `v_fakturretur`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_fakturretur` AS SELECT 
 1 AS `id_faktur`,
 1 AS `id_barang`,
 1 AS `namatext`,
 1 AS `harga`,
 1 AS `jumlah`,
 1 AS `totaljumlahretur`,
 1 AS `maxretur`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_hargabarang`
--

DROP TABLE IF EXISTS `v_hargabarang`;
/*!50001 DROP VIEW IF EXISTS `v_hargabarang`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_hargabarang` AS SELECT 
 1 AS `namatext`,
 1 AS `id_barang`,
 1 AS `id_pararel`,
 1 AS `hargabeli`,
 1 AS `pilihan`,
 1 AS `status`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_logperubahan`
--

DROP TABLE IF EXISTS `v_logperubahan`;
/*!50001 DROP VIEW IF EXISTS `v_logperubahan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_logperubahan` AS SELECT 
 1 AS `id_logperubahan`,
 1 AS `id_user`,
 1 AS `name`,
 1 AS `createat`,
 1 AS `alasan`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pesananpartner`
--

DROP TABLE IF EXISTS `v_pesananpartner`;
/*!50001 DROP VIEW IF EXISTS `v_pesananpartner`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pesananpartner` AS SELECT 
 1 AS `id_transaksi`,
 1 AS `statuspesanan`,
 1 AS `createat`,
 1 AS `updateat`,
 1 AS `id_user`,
 1 AS `name`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_subkategori`
--

DROP TABLE IF EXISTS `v_subkategori`;
/*!50001 DROP VIEW IF EXISTS `v_subkategori`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_subkategori` AS SELECT 
 1 AS `id_subkategori`,
 1 AS `id_kategori`,
 1 AS `namasubkategori`,
 1 AS `namakategori`,
 1 AS `deskripsi`,
 1 AS `status`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_supplier`
--

DROP TABLE IF EXISTS `v_supplier`;
/*!50001 DROP VIEW IF EXISTS `v_supplier`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_supplier` AS SELECT 
 1 AS `id_supplier`,
 1 AS `id_perusahaan`,
 1 AS `namaperusahaan`,
 1 AS `namasupplier`,
 1 AS `status`,
 1 AS `kontak`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ukuran`
--

DROP TABLE IF EXISTS `v_ukuran`;
/*!50001 DROP VIEW IF EXISTS `v_ukuran`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_ukuran` AS SELECT 
 1 AS `id_ukuran`,
 1 AS `id_satuan`,
 1 AS `ukuran`,
 1 AS `namasatuan`,
 1 AS `status`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_user`
--

DROP TABLE IF EXISTS `v_user`;
/*!50001 DROP VIEW IF EXISTS `v_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_user` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `email`,
 1 AS `alamat`,
 1 AS `role`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_varian`
--

DROP TABLE IF EXISTS `v_varian`;
/*!50001 DROP VIEW IF EXISTS `v_varian`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_varian` AS SELECT 
 1 AS `id_varian`,
 1 AS `id_subkategori`,
 1 AS `id_kategori`,
 1 AS `namasubkategori`,
 1 AS `namakategori`,
 1 AS `id_ukuran`,
 1 AS `id_satuan`,
 1 AS `ukuran`,
 1 AS `namasatuan`,
 1 AS `status`,
 1 AS `createat`,
 1 AS `updateat`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `varian`
--

DROP TABLE IF EXISTS `varian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varian` (
  `id_varian` int NOT NULL AUTO_INCREMENT,
  `id_subkategori` int NOT NULL,
  `id_ukuran` int NOT NULL,
  `status` int NOT NULL,
  `createat` datetime NOT NULL,
  `updateat` datetime NOT NULL,
  PRIMARY KEY (`id_varian`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varian`
--

LOCK TABLES `varian` WRITE;
/*!40000 ALTER TABLE `varian` DISABLE KEYS */;
INSERT INTO `varian` VALUES (1,1,1,1,'2025-10-12 13:45:17','2025-10-12 13:48:30'),(2,1,2,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(3,1,3,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(4,1,4,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(5,1,5,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(6,2,4,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(7,2,5,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(8,2,6,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(9,2,7,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(10,2,8,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(11,2,9,1,'2025-10-12 15:27:22','2025-10-12 15:27:22'),(12,2,11,1,'2025-10-12 15:32:16','2025-10-12 15:32:16'),(13,2,12,1,'2025-10-12 15:32:39','2025-10-12 15:32:39'),(14,2,14,1,'2025-10-12 15:33:15','2025-10-12 15:33:15'),(15,2,16,1,'2025-10-12 15:33:46','2025-10-12 15:33:46'),(16,3,6,1,'2025-10-12 15:34:27','2025-10-12 15:34:27'),(17,3,8,1,'2025-10-12 15:34:47','2025-10-12 15:34:47'),(18,3,10,1,'2025-10-12 15:35:11','2025-10-12 15:35:11'),(19,3,13,1,'2025-10-12 15:35:44','2025-10-12 15:35:44'),(20,3,15,1,'2025-10-12 15:36:08','2025-10-12 15:36:08'),(21,3,17,0,'2025-10-15 23:14:58','2025-10-15 23:19:52');
/*!40000 ALTER TABLE `varian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'penyimpanantokopulaubaru'
--

--
-- Dumping routines for database 'penyimpanantokopulaubaru'
--
/*!50003 DROP PROCEDURE IF EXISTS `getDocNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDocNo`(IN p_id INT)
BEGIN
    DECLARE v_lastDoc VARCHAR(50);
    DECLARE v_lastSeq INT;
    DECLARE v_newSeq INT;
    DECLARE v_today VARCHAR(10);

    SET v_today = DATE_FORMAT(CURDATE(), '%m-%Y');

    SELECT Id_transaksi
    INTO v_lastDoc
    FROM BarangKeluar
    WHERE MONTH(createat) = MONTH(CURDATE())
      AND YEAR(createat) = YEAR(CURDATE())
    ORDER BY Id_transaksi DESC
    LIMIT 1;

    IF v_lastDoc IS NULL THEN
        SET v_newSeq = 1;
    ELSE
        SET v_lastSeq = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(v_lastDoc, '-', 3), '-', -1) AS UNSIGNED);
		SET v_newSeq = v_lastSeq + 1;
    END IF;

    SELECT CONCAT('PB',v_today, '-', LPAD(v_newSeq, 6, '0'), '-', LPAD(p_id,3,'0')) AS docno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `laporan`
--

/*!50001 DROP VIEW IF EXISTS `laporan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `laporan` AS select `en`.`waktu` AS `waktu`,`en`.`cashflowmasuk` AS `cashflowin`,(`en`.`cashflowkeluar` - `en`.`uangmasuk2`) AS `cashflowout`,(`en`.`cashflowmasuk` - `en`.`cashflowkeluar`) AS `freecashflow`,`en`.`lababersih` AS `lababersih` from (select `um`.`bulantahun` AS `waktu`,ifnull(`um`.`uangmasuk`,0) AS `cashflowmasuk`,ifnull(`uk`.`uangkeluar`,0) AS `cashflowkeluar`,ifnull(`um`.`lababersih`,0) AS `lababersih`,ifnull(`ur`.`totaluangretur`,0) AS `uangmasuk2` from (((select date_format(`lph`.`updateat`,'%Y-%m') AS `bulantahun`,sum(`lph`.`totalomset`) AS `uangmasuk`,sum(`lph`.`totalkeuntungan`) AS `lababersih` from `logpenjualanharian` `lph` group by `bulantahun`) `um` left join (select date_format(`bk`.`updateat`,'%Y-%m') AS `bulantahun`,sum((`bk`.`totalhargabarang` + `bk`.`biayatambahan`)) AS `uangkeluar` from `fakturpembelian` `bk` where (`bk`.`status` = 'lunas') group by `bulantahun`) `uk` on((`um`.`bulantahun` = `uk`.`bulantahun`))) left join (select date_format(`br`.`createat`,'%Y-%m') AS `bulantahun`,sum(`br`.`totalrefund`) AS `totaluangretur` from `barangretur` `br` where (`br`.`id_tipe` = 1) group by `bulantahun`) `ur` on((`um`.`bulantahun` = `ur`.`bulantahun`)))) `en` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_barang`
--

/*!50001 DROP VIEW IF EXISTS `v_barang`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_barang` AS select concat(`a`.`namasubkategori`,' ',`c`.`namabrand`,' ',`a`.`ukuran`,' ',`a`.`namasatuan`) AS `namatext`,`b`.`id_barang` AS `id_barang`,`a`.`id_varian` AS `id_varian`,`a`.`id_subkategori` AS `id_subkategori`,`a`.`namasubkategori` AS `namasubkategori`,`a`.`namakategori` AS `namakategori`,`a`.`id_ukuran` AS `id_ukuran`,`a`.`ukuran` AS `ukuran`,`a`.`namasatuan` AS `namasatuan`,`b`.`id_brand` AS `id_brand`,`c`.`namabrand` AS `namabrand`,`b`.`deskripsi` AS `deskripsi`,`b`.`imagepath` AS `imagepath`,`b`.`stok` AS `stok`,`h`.`hargabeli` AS `hargabeli`,`b`.`status` AS `status`,`b`.`createat` AS `createat`,`b`.`updateat` AS `updateat` from (((`barang` `b` join `v_varian` `a` on((`b`.`id_varian` = `a`.`id_varian`))) join `brand` `c` on((`b`.`id_brand` = `c`.`id_brand`))) left join (select `hb`.`id_barang` AS `id_barang`,`hb`.`hargabeli` AS `hargabeli` from `hargabarang` `hb` where ((`hb`.`pilihan` = 1) and (`hb`.`status` = 1))) `h` on((`h`.`id_barang` = `b`.`id_barang`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_barangkeluar`
--

/*!50001 DROP VIEW IF EXISTS `v_barangkeluar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_barangkeluar` AS select `b`.`id_transaksi` AS `id_transaksi`,`v`.`name` AS `name`,`b`.`pesananpartner` AS `pesananpartner`,`b`.`total` AS `total`,`b`.`status` AS `status`,`b`.`createat` AS `createat`,`b`.`updateat` AS `updateat` from (`barangkeluar` `b` join `v_user` `v` on((`b`.`id_user` = `v`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_barangretur`
--

/*!50001 DROP VIEW IF EXISTS `v_barangretur`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_barangretur` AS select `t`.`id_retur` AS `id_retur`,`t`.`id_user` AS `id_user`,`t`.`id_faktur` AS `id_faktur`,`t`.`id_tipe` AS `id_tipe`,`t`.`totalrefund` AS `totalrefund`,`t`.`createat` AS `createat`,`u`.`name` AS `name`,`c`.`namatipe` AS `namatipe`,`f`.`namasupplier` AS `namasupplier` from (((`barangretur` `t` join `v_user` `u` on((`t`.`id_user` = `u`.`id`))) join `tipe` `c` on((`t`.`id_tipe` = `c`.`id_tipe`))) join `v_fakturpembelian` `f` on((`t`.`id_faktur` = `f`.`id_faktur`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_barangwithpartprice`
--

/*!50001 DROP VIEW IF EXISTS `v_barangwithpartprice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_barangwithpartprice` AS select concat(`a`.`namasubkategori`,' ',`c`.`namabrand`,' ',`a`.`ukuran`,' ',`a`.`namasatuan`) AS `namatext`,`b`.`id_barang` AS `id_barang`,`b`.`id_varian` AS `id_varian`,`a`.`namasubkategori` AS `namasubkategori`,`a`.`namakategori` AS `namakategori`,`a`.`id_ukuran` AS `id_ukuran`,`a`.`ukuran` AS `ukuran`,`a`.`namasatuan` AS `namasatuan`,`b`.`id_brand` AS `id_brand`,`c`.`namabrand` AS `namabrand`,`b`.`deskripsi` AS `deskripsi`,`b`.`imagepath` AS `imagepath`,`b`.`stok` AS `stok`,round((`h`.`hargabeli` + ((`h`.`hargabeli` * `p`.`persenmitraprofit`) / 100)),2) AS `hargajual`,`b`.`status` AS `status`,`b`.`createat` AS `createat`,`b`.`updateat` AS `updateat` from ((((`barang` `b` join `v_varian` `a` on((`b`.`id_varian` = `a`.`id_varian`))) join `brand` `c` on((`b`.`id_brand` = `c`.`id_brand`))) join `profiltoko` `p` on((1 = 1))) join (select `hb`.`id_barang` AS `id_barang`,`hb`.`hargabeli` AS `hargabeli` from `hargabarang` `hb` where ((`hb`.`pilihan` = 1) and (`hb`.`status` = 1))) `h` on(((`h`.`id_barang` = `b`.`id_barang`) and (`b`.`stok` <> 0)))) order by `b`.`id_barang` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_barangwithprice`
--

/*!50001 DROP VIEW IF EXISTS `v_barangwithprice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_barangwithprice` AS select concat(`a`.`namasubkategori`,' ',`c`.`namabrand`,' ',`a`.`ukuran`,' ',`a`.`namasatuan`) AS `namatext`,`b`.`id_barang` AS `id_barang`,`a`.`id_varian` AS `id_varian`,`a`.`id_subkategori` AS `id_subkategori`,`a`.`namasubkategori` AS `namasubkategori`,`a`.`namakategori` AS `namakategori`,`a`.`id_ukuran` AS `id_ukuran`,`a`.`ukuran` AS `ukuran`,`a`.`namasatuan` AS `namasatuan`,`b`.`id_brand` AS `id_brand`,`c`.`namabrand` AS `namabrand`,`b`.`deskripsi` AS `deskripsi`,`b`.`imagepath` AS `imagepath`,`b`.`stok` AS `stok`,`h`.`hargabeli` AS `hargabeli`,`b`.`status` AS `status`,`b`.`createat` AS `createat`,`b`.`updateat` AS `updateat` from (((`barang` `b` join `v_varian` `a` on((`b`.`id_varian` = `a`.`id_varian`))) join `brand` `c` on((`b`.`id_brand` = `c`.`id_brand`))) join (select `hb`.`id_barang` AS `id_barang`,`hb`.`hargabeli` AS `hargabeli` from `hargabarang` `hb` where ((`hb`.`pilihan` = 1) and (`hb`.`status` = 1))) `h` on(((`h`.`id_barang` = `b`.`id_barang`) and (`b`.`status` = 1)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_detailbarangkeluar`
--

/*!50001 DROP VIEW IF EXISTS `v_detailbarangkeluar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detailbarangkeluar` AS select `d`.`id_transaksi` AS `id_transaksi`,`d`.`hargajual` AS `hargajual`,`d`.`jumlah` AS `jumlah`,`d`.`id_barang` AS `id_barang`,`d`.`total` AS `total`,`v`.`namatext` AS `namatext` from (`detailbarangkeluar` `d` join `v_barang` `v` on((`d`.`id_barang` = `v`.`id_barang`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_detailbarangretur`
--

/*!50001 DROP VIEW IF EXISTS `v_detailbarangretur`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detailbarangretur` AS select `d`.`id_retur` AS `id_retur`,`d`.`id_barang` AS `id_barang`,`d`.`jumlahretur` AS `jumlahretur`,`v`.`namatext` AS `namatext`,`v`.`harga` AS `harga` from ((`detailretur` `d` join `barangretur` `b` on((`d`.`id_retur` = `b`.`id_retur`))) join `v_detailfaktur` `v` on(((`b`.`id_faktur` = `v`.`id_faktur`) and (`d`.`id_barang` = `v`.`id_barang`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_detailfaktur`
--

/*!50001 DROP VIEW IF EXISTS `v_detailfaktur`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_detailfaktur` AS select `d`.`id_faktur` AS `id_faktur`,`d`.`harga` AS `harga`,`d`.`jumlah` AS `jumlah`,`d`.`id_barang` AS `id_barang`,`v`.`namatext` AS `namatext` from (`detailfaktur` `d` join `v_barang` `v` on((`d`.`id_barang` = `v`.`id_barang`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_fakturpembelian`
--

/*!50001 DROP VIEW IF EXISTS `v_fakturpembelian`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_fakturpembelian` AS select `f`.`id_faktur` AS `id_faktur`,`v`.`id_supplier` AS `id_supplier`,`v`.`namasupplier` AS `namasupplier`,`v`.`id_perusahaan` AS `id_perusahaan`,`v`.`namaperusahaan` AS `namaperusahaan`,`f`.`duedate` AS `duedate`,`f`.`status` AS `status`,`f`.`totalhargabarang` AS `totalhargabarang`,`f`.`biayatambahan` AS `biayatambahan`,`f`.`updateat` AS `updateat`,`f`.`createat` AS `createat` from (`fakturpembelian` `f` join `v_supplier` `v` on((`f`.`id_supplier` = `v`.`id_supplier`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_fakturretur`
--

/*!50001 DROP VIEW IF EXISTS `v_fakturretur`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_fakturretur` AS select `df`.`id_faktur` AS `id_faktur`,`df`.`id_barang` AS `id_barang`,`vb`.`namatext` AS `namatext`,`df`.`harga` AS `harga`,`df`.`jumlah` AS `jumlah`,coalesce(sum(`dr`.`jumlahretur`),0) AS `totaljumlahretur`,(`df`.`jumlah` - coalesce(sum(`dr`.`jumlahretur`),0)) AS `maxretur` from (((`detailfaktur` `df` left join `v_barang` `vb` on((`vb`.`id_barang` = `df`.`id_barang`))) left join `barangretur` `br` on((`br`.`id_faktur` = `df`.`id_faktur`))) left join `detailretur` `dr` on(((`dr`.`id_retur` = `br`.`id_retur`) and (`dr`.`id_barang` = `df`.`id_barang`)))) group by `df`.`id_faktur`,`df`.`id_barang`,`vb`.`namatext`,`df`.`harga`,`df`.`jumlah` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_hargabarang`
--

/*!50001 DROP VIEW IF EXISTS `v_hargabarang`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_hargabarang` AS select concat(`a`.`namasubkategori`,' ',`c`.`namabrand`,' ',`a`.`ukuran`,' ',`a`.`namasatuan`) AS `namatext`,`hb`.`id_barang` AS `id_barang`,`hb`.`id_pararel` AS `id_pararel`,`hb`.`hargabeli` AS `hargabeli`,`hb`.`pilihan` AS `pilihan`,`hb`.`status` AS `status`,`hb`.`createat` AS `createat`,`hb`.`updateat` AS `updateat` from (((`hargabarang` `hb` join `barang` `b` on((`hb`.`id_barang` = `b`.`id_barang`))) join `v_varian` `a` on((`b`.`id_varian` = `a`.`id_varian`))) join `brand` `c` on((`b`.`id_brand` = `c`.`id_brand`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logperubahan`
--

/*!50001 DROP VIEW IF EXISTS `v_logperubahan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_logperubahan` AS select `l`.`id_logperubahan` AS `id_logperubahan`,`l`.`id_user` AS `id_user`,`v`.`name` AS `name`,`l`.`createat` AS `createat`,`l`.`alasan` AS `alasan` from (`logperubahan` `l` join `v_user` `v` on((`l`.`id_user` = `v`.`id`))) order by `l`.`createat` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pesananpartner`
--

/*!50001 DROP VIEW IF EXISTS `v_pesananpartner`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pesananpartner` AS select `pp`.`id_transaksi` AS `id_transaksi`,`pp`.`status` AS `statuspesanan`,`pp`.`createat` AS `createat`,`pp`.`updateat` AS `updateat`,`bk`.`id_user` AS `id_user`,`u`.`name` AS `name`,`bk`.`total` AS `total` from ((`pesananpartner` `pp` join `barangkeluar` `bk` on((`pp`.`id_transaksi` = `bk`.`id_transaksi`))) join `v_user` `u` on((`bk`.`id_user` = `u`.`id`))) order by field(`pp`.`status`,'draft','disetujui','returned','selesai','ditolak'),`pp`.`createat` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_subkategori`
--

/*!50001 DROP VIEW IF EXISTS `v_subkategori`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_subkategori` AS select `s`.`id_subkategori` AS `id_subkategori`,`s`.`id_kategori` AS `id_kategori`,`s`.`namasubkategori` AS `namasubkategori`,`k`.`namakategori` AS `namakategori`,`s`.`deskripsi` AS `deskripsi`,`s`.`status` AS `status`,`s`.`createat` AS `createat`,`s`.`updateat` AS `updateat` from (`subkategori` `s` join `kategori` `k` on((`s`.`id_kategori` = `k`.`id_kategori`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_supplier`
--

/*!50001 DROP VIEW IF EXISTS `v_supplier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_supplier` AS select `s`.`id_supplier` AS `id_supplier`,`s`.`id_perusahaan` AS `id_perusahaan`,`p`.`namaperusahaan` AS `namaperusahaan`,`s`.`namasupplier` AS `namasupplier`,`s`.`status` AS `status`,`s`.`kontak` AS `kontak`,`s`.`createat` AS `createat`,`s`.`updateat` AS `updateat` from (`supplier` `s` join `perusahaan` `p` on((`s`.`id_perusahaan` = `p`.`id_perusahaan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ukuran`
--

/*!50001 DROP VIEW IF EXISTS `v_ukuran`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ukuran` AS select `u`.`id_ukuran` AS `id_ukuran`,`u`.`id_satuan` AS `id_satuan`,`u`.`ukuran` AS `ukuran`,`s`.`namasatuan` AS `namasatuan`,`u`.`status` AS `status`,`u`.`createat` AS `createat`,`u`.`updateat` AS `updateat` from (`ukuran` `u` join `satuan` `s` on((`u`.`id_satuan` = `s`.`id_satuan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_user`
--

/*!50001 DROP VIEW IF EXISTS `v_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user` AS select `users`.`id` AS `id`,`users`.`name` AS `name`,`users`.`email` AS `email`,`users`.`alamat` AS `alamat`,`users`.`role` AS `role`,`users`.`status` AS `status` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_varian`
--

/*!50001 DROP VIEW IF EXISTS `v_varian`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_varian` AS select `v`.`id_varian` AS `id_varian`,`v`.`id_subkategori` AS `id_subkategori`,`s`.`id_kategori` AS `id_kategori`,`s`.`namasubkategori` AS `namasubkategori`,`s`.`namakategori` AS `namakategori`,`v`.`id_ukuran` AS `id_ukuran`,`u`.`id_satuan` AS `id_satuan`,`u`.`ukuran` AS `ukuran`,`u`.`namasatuan` AS `namasatuan`,`v`.`status` AS `status`,`v`.`createat` AS `createat`,`v`.`updateat` AS `updateat` from ((`varian` `v` join `v_ukuran` `u` on((`v`.`id_ukuran` = `u`.`id_ukuran`))) join `v_subkategori` `s` on((`v`.`id_subkategori` = `s`.`id_subkategori`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-23 11:42:48
