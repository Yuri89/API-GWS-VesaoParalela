CREATE DATABASE  IF NOT EXISTS `db_gws_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_gws_2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_gws_2
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `tb_avaliacoes`
--

DROP TABLE IF EXISTS `tb_avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_avaliacoes` (
  `id_avaliacao` binary(16) NOT NULL,
  `conceito` varchar(255) DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `relatorio` varchar(255) DEFAULT NULL,
  `id_usuario` binary(16) DEFAULT NULL,
  `id_tarefa` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `FKnpl86s9f26768tuyonf1bul6` (`id_usuario`),
  KEY `FKt2eleysniqsk8lqgfq8lihnyj` (`id_tarefa`),
  CONSTRAINT `FKnpl86s9f26768tuyonf1bul6` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`),
  CONSTRAINT `FKt2eleysniqsk8lqgfq8lihnyj` FOREIGN KEY (`id_tarefa`) REFERENCES `tb_tarefas` (`id_tarefa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_avaliacoes`
--

LOCK TABLES `tb_avaliacoes` WRITE;
/*!40000 ALTER TABLE `tb_avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_clientes` (
  `id_cliente` binary(16) NOT NULL,
  `id_demanda` binary(16) DEFAULT NULL,
  `nome_empresa` varchar(255) NOT NULL,
  `nome_cliente` varchar(255) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente` (`id_cliente`),
  KEY `tb_clientes_pk1_idx` (`id_demanda`),
  CONSTRAINT `tb_clientes_pk1` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES (_binary ';ö\‡#e@«àbà(Ø¸Ù',NULL,'Empresa','Cliente3','123456789','cliente3@email.com','16022024075458.jpg'),(_binary '.={$@#Öáˆ\‰ö',NULL,'Empresa','Cliente4','123456789','cliente4@email.com','16022024075503.jpg'),(_binary 'W¿tB\Ìö@<ÅCˇZi∂¨Ò',NULL,'Empresa','Cliente7','123456789','cliente7@email.com','16022024075515.jpg'),(_binary 'ln\rv\0\‰I\ÈøW;I\—\…g#',NULL,'Empresa','Cliente10','123456789','cliente10@email.com','16022024075531.jpg'),(_binary 'Æ≠=∫\rNû[}\€yA!W',NULL,'Empresa','Cliente8','123456789','cliente8@email.com','16022024075519.jpg'),(_binary '≥}ô™\÷eDô∂∂¡\⁄\Áf.\◊',NULL,'Empresa','Cliente6','123456789','cliente6@email.com','16022024075511.jpg'),(_binary '\—\Ë}EuCÙñ\È?â\„vr',NULL,'Empresa','Cliente5','123456789','cliente5@email.com','16022024075507.jpg'),(_binary '\ﬂA§®k|N∫É∞n∆®\0\Áu',NULL,'Empresa','Cliente1','123456789','cliente1@email.com','16022024075421.jpg'),(_binary '\ÔÛFß\⁄A\ÎµWEn8;¡˜',NULL,'Empresa','Cliente9','123456789','cliente9@email.com','16022024075523.jpg'),(_binary '\„{*˛@C0†2Ÿ≥Ië≥',NULL,'Empresa','Cliente2','123456789','cliente2@email.com','16022024075447.jpg');
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_demandas`
--

DROP TABLE IF EXISTS `tb_demandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_demandas` (
  `id_demanda` binary(16) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `prioridade` bit(2) NOT NULL,
  `privacidade` bit(1) NOT NULL,
  `status` bit(2) NOT NULL,
  `data_inical` datetime DEFAULT NULL,
  `data_final` date DEFAULT NULL,
  `custo` double NOT NULL,
  `data_inicio` date NOT NULL,
  `id_cliente` binary(16) DEFAULT NULL,
  `lider_squad` binary(16) DEFAULT NULL,
  `id_usuario` binary(16) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_demanda`),
  UNIQUE KEY `id_demanda` (`id_demanda`),
  KEY `FKiaru14x2kk73b3r1akaimy6r4` (`id_cliente`),
  KEY `liderSquad_idx` (`lider_squad`),
  KEY `FKc7xqwsqhcyncpvcj4h8ymlug8` (`id_usuario`),
  CONSTRAINT `FKc7xqwsqhcyncpvcj4h8ymlug8` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`),
  CONSTRAINT `FKiaru14x2kk73b3r1akaimy6r4` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`),
  CONSTRAINT `liderSquad` FOREIGN KEY (`lider_squad`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_demandas`
--

LOCK TABLES `tb_demandas` WRITE;
/*!40000 ALTER TABLE `tb_demandas` DISABLE KEYS */;
INSERT INTO `tb_demandas` VALUES (_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝','demanda6','test','demanda61(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',8000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì','demanda10','test','demanda101(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',2000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary 'Bà$gG\Ôô-\’yR)-','demanda5','test','demanda51(16022024).png',_binary '',_binary '\0',_binary '\0',NULL,'2025-10-10',12000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘','demanda2','test','demanda21(16022024).png, demanda22(16022024).png, demanda23(16022024).png, demanda24(16022024).png, demanda25(16022024).png, demanda26(16022024).png',_binary '\0',_binary '',_binary '\0',NULL,'2025-10-10',44000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary 'dTcÛsBáä<ªq†Tù','demanda8','test','demanda81(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',2000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary 'i%;¸\œM%ª≠ö¨∂7Ñ','demanda4','test','demanda41(16022024).png',_binary '',_binary '',_binary '\0',NULL,'2025-10-10',12000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary 'p\◊\–c\…BOùØOíßô1','demanda7','test','demanda71(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',2000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary 'ö\«U#¿hK3¶ñ7Nµ!','demanda1','test','demanda11(16022024).png, demanda12(16022024).png, demanda13(16022024).png, demanda14(16022024).png, demanda15(16022024).png, demanda16(16022024).png',_binary '\0',_binary '',_binary '\0',NULL,'2025-10-10',52000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á','demanda9','test','demanda91(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',2000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL),(_binary '\∆Oùö\'#@:ë\Ô∫_x›úc','demanda3','test','demanda31(16022024).png',_binary '\0',_binary '',_binary '\0',NULL,'2025-10-10',112000,'2024-10-10',_binary ';ö\‡#e@«àbà(Ø¸Ù',_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ',NULL,NULL);
/*!40000 ALTER TABLE `tb_demandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hardskills`
--

DROP TABLE IF EXISTS `tb_hardskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_hardskills` (
  `id_hardskill` binary(16) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `id_demanda` binary(16) DEFAULT NULL,
  `registro` date DEFAULT NULL,
  PRIMARY KEY (`id_hardskill`),
  KEY `id_demanda_hard_idx` (`id_demanda`),
  CONSTRAINT `id_demanda_hard` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hardskills`
--

LOCK TABLES `tb_hardskills` WRITE;
/*!40000 ALTER TABLE `tb_hardskills` DISABLE KEYS */;
INSERT INTO `tb_hardskills` VALUES (_binary '\«\√¿§D†ÖÒ†\·ù¡','CSS',NULL,'2024-02-16'),(_binary 'QH\ÕSå\ÍA¸õzî&è_ç','Java',NULL,'2024-02-16'),(_binary 'kÅÙQM\∆C∞ªU≤í\Z','C#',NULL,'2024-02-16'),(_binary '´\'ÜZG=â-∫Ù6ùL','PHP',NULL,'2024-02-16'),(_binary '≠Ü2CñDCña¸±\€W','HTML',NULL,'2024-02-16'),(_binary '∂G\ﬂ√ßH–∫ài\0›™ëâ','Go',NULL,'2024-02-16'),(_binary 'Ω\'j\„\‹A\‚çM2\n2K\Ë','Phyton',NULL,'2024-02-16'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€','JavaScript',NULL,'2024-02-16');
/*!40000 ALTER TABLE `tb_hardskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hardskills_demandas`
--

DROP TABLE IF EXISTS `tb_hardskills_demandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_hardskills_demandas` (
  `id_hardskill` binary(16) DEFAULT NULL,
  `id_demanda` binary(16) DEFAULT NULL,
  KEY `dh_hardskill_idx` (`id_hardskill`),
  KEY `dh_demanda_idx` (`id_demanda`),
  CONSTRAINT `dh_demanda` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`),
  CONSTRAINT `dh_hardskill` FOREIGN KEY (`id_hardskill`) REFERENCES `tb_hardskills` (`id_hardskill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hardskills_demandas`
--

LOCK TABLES `tb_hardskills_demandas` WRITE;
/*!40000 ALTER TABLE `tb_hardskills_demandas` DISABLE KEYS */;
INSERT INTO `tb_hardskills_demandas` VALUES (_binary '≠Ü2CñDCña¸±\€W',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary '≠Ü2CñDCña¸±\€W',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary '≠Ü2CñDCña¸±\€W',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary '≠Ü2CñDCña¸±\€W',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary '≠Ü2CñDCña¸±\€W',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary '≠Ü2CñDCña¸±\€W',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary '≠Ü2CñDCña¸±\€W',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary 'dTcÛsBáä<ªq†Tù'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary 'dTcÛsBáä<ªq†Tù'),(_binary '≠Ü2CñDCña¸±\€W',_binary 'dTcÛsBáä<ªq†Tù'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary '≠Ü2CñDCña¸±\€W',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary '\«\√¿§D†ÖÒ†\·ù¡',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì'),(_binary '◊âX,˛LDª¿=Ñ≤Õá\€',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì'),(_binary '≠Ü2CñDCña¸±\€W',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì');
/*!40000 ALTER TABLE `tb_hardskills_demandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hardskills_usuarios`
--

DROP TABLE IF EXISTS `tb_hardskills_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_hardskills_usuarios` (
  `id_hardskill` binary(16) NOT NULL,
  `id_usuario` binary(16) NOT NULL,
  KEY `id_hardskill` (`id_hardskill`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tb_hardskills_usuarios_ibfk_1` FOREIGN KEY (`id_hardskill`) REFERENCES `tb_hardskills` (`id_hardskill`),
  CONSTRAINT `tb_hardskills_usuarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hardskills_usuarios`
--

LOCK TABLES `tb_hardskills_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_hardskills_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_hardskills_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_horas_trabalho`
--

DROP TABLE IF EXISTS `tb_horas_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_horas_trabalho` (
  `id_horas_trabalho` binary(16) NOT NULL,
  `dia_registro` date DEFAULT NULL,
  `horas` int NOT NULL,
  `id_usuario` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id_horas_trabalho`),
  KEY `FKtkalr39ilt3aqc09418tl3fx6` (`id_usuario`),
  CONSTRAINT `FKtkalr39ilt3aqc09418tl3fx6` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_horas_trabalho`
--

LOCK TABLES `tb_horas_trabalho` WRITE;
/*!40000 ALTER TABLE `tb_horas_trabalho` DISABLE KEYS */;
INSERT INTO `tb_horas_trabalho` VALUES (_binary 'råBkcB]Ç»ñÑ.¿æı','2024-02-16',230,_binary '†d%0∂B\Z±]˚˙û\0L');
/*!40000 ALTER TABLE `tb_horas_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_media_soma`
--

DROP TABLE IF EXISTS `tb_media_soma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_media_soma` (
  `id_media_soma` binary(16) NOT NULL,
  `fte_medio_anual` int NOT NULL,
  `fte_medio_mensal` int NOT NULL,
  `fte_medio_semanal` int NOT NULL,
  `media_anual` int NOT NULL,
  `media_mensal` int NOT NULL,
  `media_semanal` int NOT NULL,
  `registro` date DEFAULT NULL,
  `total_anual` int NOT NULL,
  `total_mensal` int NOT NULL,
  `total_semanal` int NOT NULL,
  `id_usuario` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id_media_soma`),
  KEY `FKd4brrp1je53u20i5pxer9v92n` (`id_usuario`),
  CONSTRAINT `FKd4brrp1je53u20i5pxer9v92n` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_media_soma`
--

LOCK TABLES `tb_media_soma` WRITE;
/*!40000 ALTER TABLE `tb_media_soma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_media_soma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_segmentos`
--

DROP TABLE IF EXISTS `tb_segmentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_segmentos` (
  `id_segmento` binary(16) NOT NULL,
  `segmento` varchar(150) NOT NULL,
  `registro` date DEFAULT NULL,
  PRIMARY KEY (`id_segmento`),
  UNIQUE KEY `id_segmento` (`id_segmento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_segmentos`
--

LOCK TABLES `tb_segmentos` WRITE;
/*!40000 ALTER TABLE `tb_segmentos` DISABLE KEYS */;
INSERT INTO `tb_segmentos` VALUES (_binary 'úG,\Ÿ\nLÄíùnçf\∆','Segmento7',NULL),(_binary 'ç\·Z,WH¸ñë»ºQÑ´','Segmento8',NULL),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	','Segmento9',NULL),(_binary 'V\Zö=hOßIÒb\Êı\r!','Segmento2',NULL),(_binary 'âB\ÿ÷ïKü\‚~\Œ¡¢g\Õ','Segmento3',NULL),(_binary '™∏+ö¿H?∑°	Ò$ \Z3','Segmento10',NULL),(_binary 'º\Íô^\∆\ŒK^Ωì\◊ ∂U','Segmento5',NULL),(_binary '\”`\∆1+\‰FçT\r\Â\Ì=\—','Segmento4',NULL),(_binary 'Ììè+QXHLéAèè Q','Segmento1',NULL),(_binary '¸Kºò˝I¡≠\÷7\'xßñ','Segmento6',NULL);
/*!40000 ALTER TABLE `tb_segmentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_segmentos_demandas`
--

DROP TABLE IF EXISTS `tb_segmentos_demandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_segmentos_demandas` (
  `id_segmento` binary(16) DEFAULT NULL,
  `id_demanda` binary(16) DEFAULT NULL,
  KEY `tb_segmentos_demandas_pk1_idx` (`id_segmento`),
  KEY `tb_segmentos_demandas_pk2_idx` (`id_demanda`),
  CONSTRAINT `tb_segmentos_demandas_pk1` FOREIGN KEY (`id_segmento`) REFERENCES `tb_segmentos` (`id_segmento`),
  CONSTRAINT `tb_segmentos_demandas_pk2` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_segmentos_demandas`
--

LOCK TABLES `tb_segmentos_demandas` WRITE;
/*!40000 ALTER TABLE `tb_segmentos_demandas` DISABLE KEYS */;
INSERT INTO `tb_segmentos_demandas` VALUES (_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary 'dTcÛsBáä<ªq†Tù'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary 'dTcÛsBáä<ªq†Tù'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary 'dTcÛsBáä<ªq†Tù'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary 'ç\·Z,WH¸ñë»ºQÑ´',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì'),(_binary 'úG,\Ÿ\nLÄíùnçf\∆',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì'),(_binary '-ò˜áq@uÜ\Ê\rπ-gw	',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì');
/*!40000 ALTER TABLE `tb_segmentos_demandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_softskills`
--

DROP TABLE IF EXISTS `tb_softskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_softskills` (
  `id_softskill` binary(16) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `id_demanda` binary(16) DEFAULT NULL,
  `registro` date DEFAULT NULL,
  PRIMARY KEY (`id_softskill`),
  KEY `id_demanda_soft_idx` (`id_demanda`),
  CONSTRAINT `id_demanda_soft` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_softskills`
--

LOCK TABLES `tb_softskills` WRITE;
/*!40000 ALTER TABLE `tb_softskills` DISABLE KEYS */;
INSERT INTO `tb_softskills` VALUES (_binary 'X\‡|ΩwCVºà2Ñ_A','GOHorse',NULL,'2024-02-16'),(_binary 'íç1üôIõÇöKJì_\»','TechLeade',NULL,'2024-02-16'),(_binary '•µg\'BOîô≠öXyeÑ','SCRUM',NULL,'2024-02-16');
/*!40000 ALTER TABLE `tb_softskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_softskills_demandas`
--

DROP TABLE IF EXISTS `tb_softskills_demandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_softskills_demandas` (
  `id_softskill` binary(16) DEFAULT NULL,
  `id_demanda` binary(16) DEFAULT NULL,
  KEY `ds_softskill_idx` (`id_softskill`),
  KEY `ds_demanda_idx` (`id_demanda`),
  CONSTRAINT `ds_demanda` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`),
  CONSTRAINT `ds_softskill` FOREIGN KEY (`id_softskill`) REFERENCES `tb_softskills` (`id_softskill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_softskills_demandas`
--

LOCK TABLES `tb_softskills_demandas` WRITE;
/*!40000 ALTER TABLE `tb_softskills_demandas` DISABLE KEYS */;
INSERT INTO `tb_softskills_demandas` VALUES (_binary 'X\‡|ΩwCVºà2Ñ_A',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '•µg\'BOîô≠öXyeÑ',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary '•µg\'BOîô≠öXyeÑ',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary '•µg\'BOîô≠öXyeÑ',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary '•µg\'BOîô≠öXyeÑ',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary '•µg\'BOîô≠öXyeÑ',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary '•µg\'BOîô≠öXyeÑ',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary '•µg\'BOîô≠öXyeÑ',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary '•µg\'BOîô≠öXyeÑ',_binary 'dTcÛsBáä<ªq†Tù'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary 'dTcÛsBáä<ªq†Tù'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary '•µg\'BOîô≠öXyeÑ',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary '•µg\'BOîô≠öXyeÑ',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì'),(_binary 'X\‡|ΩwCVºà2Ñ_A',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì');
/*!40000 ALTER TABLE `tb_softskills_demandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_softskills_usuarios`
--

DROP TABLE IF EXISTS `tb_softskills_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_softskills_usuarios` (
  `id_softskill` binary(16) NOT NULL,
  `id_usuario` binary(16) NOT NULL,
  KEY `id_softskill` (`id_softskill`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tb_softskills_usuarios_ibfk_1` FOREIGN KEY (`id_softskill`) REFERENCES `tb_softskills` (`id_softskill`),
  CONSTRAINT `tb_softskills_usuarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_softskills_usuarios`
--

LOCK TABLES `tb_softskills_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_softskills_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_softskills_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tarefas`
--

DROP TABLE IF EXISTS `tb_tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tarefas` (
  `id_tarefa` binary(16) NOT NULL,
  `conclusao` tinyint DEFAULT NULL,
  `descricao_tarefa` varchar(255) DEFAULT NULL,
  `nome_tarefa` varchar(255) DEFAULT NULL,
  `id_demanda` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id_tarefa`),
  KEY `FKfcjqru68icy20ylsm12h7e01p` (`id_demanda`),
  CONSTRAINT `FKfcjqru68icy20ylsm12h7e01p` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`),
  CONSTRAINT `tb_tarefas_chk_1` CHECK ((`conclusao` between 0 and 3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tarefas`
--

LOCK TABLES `tb_tarefas` WRITE;
/*!40000 ALTER TABLE `tb_tarefas` DISABLE KEYS */;
INSERT INTO `tb_tarefas` VALUES (_binary '\0Å\·º]ˆI…≠$>J5Ø',0,'test','tarefa9',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '≈ò},\»H¨Ø“≤]\‡sò$',0,'test','tarefa1',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'µ∑\ÔˆcI@çã≤≤_A`',0,'test','tarefa4',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'G\Às⁄äF¶èpB2\nf≥\¬',0,'test','tarefa3',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary ')¸FØÆ∞EÙ∏Œ∑\›\Ïy',0,'test','tarefa14',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary ',+†f8GûãV°H‘∑7Å',3,'test','tarefa17',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'Q\Ê∏\œj-L◊Æ-£∑™¬ó',3,'test','tarefa16',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '^v£\Ï@\Áò¿LÀî\n≠\⁄',0,'test','tarefa8',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'wá£`âfGvÄû7®µ≤ã',0,'test','tarefa10',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '|R\ÊMN&ú\Ôï\Zjm\‡',3,'test','tarefa21',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'ö˘b∏Nµ\Ÿˆù>~Œô',0,'test','tarefa12',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'õpèÙIª´iì\÷\"',0,'test','tarefa2',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'ß˚\‚ Ä¥E˙åû¢ \Î>π',3,'test','tarefa19',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'ºó@A\‰+Nrú\·AR;}',0,'test','tarefa13',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '\»U\–v\◊\–BKπ|MR±Ö ',3,'test','tarefa20',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '–•êtP\ﬁI•+a\ÊlÔàØ',0,'test','tarefa15',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '\÷\‚q[äN-∑:©9\‡î\”',0,'test','tarefa7',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '\›0\“9MF6§êÜ\ÊÙciÜ',3,'test','tarefa18',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '\ﬂ\”#ıL-±:Vi¶∞',0,'test','tarefa5',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '\·4F\‘\“E“ï»ìÛësb¨',0,'test','tarefa11',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '\ÊÆ ˛F\ﬁOWò\–8mf¸\n{',0,'test','tarefa6',_binary 'ö\«U#¿hK3¶ñ7Nµ!');
/*!40000 ALTER TABLE `tb_tarefas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios` (
  `id_usuario` binary(16) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `tipo_usuario` tinyint NOT NULL,
  `sobrenome` varchar(150) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_ferias` date DEFAULT NULL,
  `designacao` text NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `hora_semanais` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `horas_semanais` time(6) DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `ano_trabalhado` int DEFAULT NULL,
  `horas` time(6) DEFAULT NULL,
  `mes_trabalhado` int DEFAULT NULL,
  `semana_trabalhada` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (_binary '†d%0∂B\Z±]˚˙û\0L','usuario5',3,'test','12345678','usuario5@email.com','$2a$10$reaN/C2ri33c8fXR12SEh.osfqBjuGonFArWuG5mhEYUcl09V6x8O','2024-02-16 07:30:53','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073052.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary 'IJ\‘\‘%¶B?û=\Ê™¿é% ','usuario2',2,'test','12345678','usuario2@email.com','$2a$10$JPEMlPiiGZiPOApAOW6a3uIdrWxXOwlPmplOcY7Fu7QyjezWJSJLy','2024-02-16 07:29:55','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024072954.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary 'd?]ΩrsO0üº7U\Ÿ\Ÿ/','usuario1',1,'test','12345678','usuario1@email.com','$2a$10$au4e6RiiSvhlrUR/XzN9Oe4EJ3Gckf3kcEjjPuZMmol6ckMRh/d2W','2024-02-16 07:29:34','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024072934.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary 'ÇBhX\'OÖwh2\È≤;','usuario9',3,'test','12345678','usuario9@email.com','$2a$10$3ilUmtFL48GEkKSZXv4BwuEmY5zLHg2MfGpbQNjB23yELSnt3tSzK','2024-02-16 07:31:39','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073139.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É','usuario6',3,'test','12345678','usuario6@email.com','$2a$10$BEbqyZYtkQ/FCUrZBS0VpuDGK0an9P1nhbLUzSYNwtmEWSM8e8Maa','2024-02-16 07:31:03','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073103.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ','usuario4',3,'test','12345678','usuario4@email.com','$2a$10$hFEyC7R7LcemIjFwrk/9bezHesrovujCGj6wOazZG7q6c5SLZ6m6G','2024-02-16 07:30:42','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073041.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<','usuario8',3,'test','12345678','usuario8@email.com','$2a$10$2JyPV3nFCFq9rHYpxVedO.ecu6cVjrKdimC2vO7OpI8pxqhxqEQg.','2024-02-16 07:31:28','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073127.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '\ÃDüõ#[E±<\÷:\œ[K','usuario7',3,'test','12345678','usuario7@email.com','$2a$10$J1GMpM1zoxTnEDzrlfh8huP50oQNMziwLDuEnRRrYNFQSSFANwoue','2024-02-16 07:31:16','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073115.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '\⁄\≈yˆrK^Øuxà	ï#ì','usuario3',2,'test','12345678','usuario3@email.com','$2a$10$pl1sKoplfVtJYrDw7bDtcuulYLHbtiK3J7./fEwjQY4MS6J5pA0B.','2024-02-16 07:30:15','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073015.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '\ÔO\‹*L\Óî4_9<éÑ','usuario10',3,'test','12345678','usuario10@email.com','$2a$10$hEvapKD1TCFzVlQk2Qiwze9IuksnL/4Bf6pIElp7QKImcjYNNXQVG','2024-02-16 07:32:00','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073200.jpg',NULL,'10:10:10.000000',NULL,NULL);
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios_demandas`
--

DROP TABLE IF EXISTS `tb_usuarios_demandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios_demandas` (
  `id_usuario` binary(16) NOT NULL,
  `id_demanda` binary(16) NOT NULL,
  KEY `id_demanda` (`id_demanda`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tb_usuarios_demandas_ibfk_1` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`),
  CONSTRAINT `tb_usuarios_demandas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios_demandas`
--

LOCK TABLES `tb_usuarios_demandas` WRITE;
/*!40000 ALTER TABLE `tb_usuarios_demandas` DISABLE KEYS */;
INSERT INTO `tb_usuarios_demandas` VALUES (_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary 'ö\«U#¿hK3¶ñ7Nµ!'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary 'bæ@d\Ê\≈Dõeˇ\ﬂ4Å˘'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary '\∆Oùö\'#@:ë\Ô∫_x›úc'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary 'i%;¸\œM%ª≠ö¨∂7Ñ'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary 'Bà$gG\Ôô-\’yR)-'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary '\›\ÃË∞îJ\·íe\‚sHü≥˝'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary 'p\◊\–c\…BOùØOíßô1'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary 'dTcÛsBáä<ªq†Tù'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary 'dTcÛsBáä<ªq†Tù'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary 'dTcÛsBáä<ªq†Tù'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary 'dTcÛsBáä<ªq†Tù'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary '∂cΩ\≈VIK\Íæ4\Ê1õ™á'),(_binary 'ç\‡[F\∆\'OÜπµY9h\«É',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì'),(_binary '∑Y\÷\‡uF\„Ç&áºú∑\\<',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì'),(_binary 'ÇBhX\'OÖwh2\È≤;',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì'),(_binary '® ñãM\’E=í\'Ú\ÓÇMÚΩ',_binary '¶{î\‡Jˇ∫T\œ\‡y+…ì');
/*!40000 ALTER TABLE `tb_usuarios_demandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios_tarefas`
--

DROP TABLE IF EXISTS `tb_usuarios_tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios_tarefas` (
  `id_usuario` binary(16) NOT NULL,
  `id_tarefa` binary(16) NOT NULL,
  KEY `tb_u_t_1_idx` (`id_usuario`),
  KEY `tb_u_t_2_idx` (`id_tarefa`),
  CONSTRAINT `tb_u_t_1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`),
  CONSTRAINT `tb_u_t_2` FOREIGN KEY (`id_tarefa`) REFERENCES `tb_tarefas` (`id_tarefa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios_tarefas`
--

LOCK TABLES `tb_usuarios_tarefas` WRITE;
/*!40000 ALTER TABLE `tb_usuarios_tarefas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_usuarios_tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-16 16:03:58
