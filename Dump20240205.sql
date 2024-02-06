CREATE DATABASE  IF NOT EXISTS `db_gws_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_gws_2`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_gws_2
-- ------------------------------------------------------
-- Server version	8.0.32

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
INSERT INTO `tb_clientes` VALUES (_binary '6Ä\"O_ª­',NULL,'empresa-6','cliente-6','123456789','emailcliente6@email.com','30112023170601.jpg'),(_binary '	KÌíÐL¸;',NULL,'empresa-8','cliente-8','123456789','emailcliente8@email.com','30112023170621.jpg'),(_binary '\ZeLÄùüJT¬u<L',NULL,'empresa-4','cliente-4','123456789','emailcliente4@email.com','30112023170534.jpg'),(_binary 'DÅ½ù@$¸a\�',NULL,'empresa-5','cliente-5','123456789','emailcliente5@email.com','30112023170545.jpg'),(_binary 'pdÁiOðY\�',NULL,'empresa-2','cliente-2','123456789','emailcliente2@email.com','30112023170508.jpg'),(_binary '³Ìæ¦LÇ',NULL,'empresa-1','cliente-1','123456789','emailcliente1@email.com','30112023170424.jpg'),(_binary 'ºÕÁ{úF1\�',NULL,'empresa-3','cliente-3','123456789','emailcliente3@email.com','30112023170519.jpg'),(_binary 'ö»0ï@¯ W',NULL,'empresa-7','cliente-7','123456789','emailcliente7@email.com','30112023170612.jpg'),(_binary '÷dÝ¨OÐp\�',NULL,'empresa-9','cliente-9','123456789','emailcliente9@email.com','30112023170627.jpg');
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
  `logo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `anexo` varchar(255) DEFAULT NULL,
  `prioridade` bit(2) NOT NULL,
  `privacidade` bit(1) NOT NULL,
  `status` bit(2) NOT NULL,
  `data_inical` datetime DEFAULT NULL,
  `data_final` date DEFAULT NULL,
  `custo` int NOT NULL,
  `data_inicio` datetime(6) NOT NULL,
  `id_cliente` binary(16) DEFAULT NULL,
  `lider_squad` binary(16) DEFAULT NULL,
  `id_usuario` binary(16) DEFAULT NULL,
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
INSERT INTO `tb_demandas` VALUES (_binary '[�DSF�����F\�','novaDemanda','string','iowfioe','novaDemanda1(05022024).png',_binary '\0',_binary '',_binary '\0',NULL,'2024-11-10',0,'2024-02-05 21:48:50.423436',_binary '\ZeLÄùüJT¬u<L',_binary 'Êm3þA\�',NULL),(_binary '\n\�\�[\�\�IG��ʚN)\�','testCurto','String','testentando aplicativo','testCurto1(05022024).png',_binary '',_binary '',_binary '\0',NULL,'2024-10-10',0,'2024-02-05 00:00:00.000000',_binary '6Ä\"O_ª­',NULL,NULL),(_binary 'rj\���C-����\�','testCurto3','String','testentando aplicativo','testCurto31(05022024).png',_binary '',_binary '',_binary '\0',NULL,'2024-10-10',0,'2024-02-05 00:00:00.000000',_binary '6Ä\"O_ª­',_binary 'Êm3þA\�',NULL),(_binary '|%\\LDÂ .¾','tituloNovo','stringSomente','novo teste PUT','tituloNovo1(01022024).png',_binary '\0',_binary '',_binary '\0',NULL,'2024-10-10',0,'2024-02-01 00:00:00.000000',_binary '	KÌíÐL¸;',NULL,NULL),(_binary '��CG�\�B=�Iն\n]$�','testCurto2','String','testentando aplicativo','testCurto21(05022024).png',_binary '',_binary '',_binary '\0',NULL,'2024-10-10',0,'2024-02-05 00:00:00.000000',_binary '6Ä\"O_ª­',NULL,NULL);
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
INSERT INTO `tb_hardskills` VALUES (_binary '5X¤÷ü@£§','hard-skill-6',NULL),(_binary '°xJ!¹\�','hard-skill-8',NULL),(_binary 'Kk_sBL§³ª­','hard-skill-7',NULL),(_binary 'ëµ@KÇOÈ´\'','hard-skill-4',NULL),(_binary 'ªþ$èOâN','hard-skill-1',NULL),(_binary '¶vM\"dE\0·ë','hard-skill-3',NULL),(_binary '·íÝ¿}Ewa','hard-skill-9',NULL),(_binary 'Îy¿tK \�','hard-skill-5',NULL),(_binary 'ÙãÁC¶Jæ¨','hard-skill-2',NULL);
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
INSERT INTO `tb_hardskills_demandas` VALUES (_binary '5X¤÷ü@£§',_binary '\n\�\�[\�\�IG��ʚN)\�'),(_binary 'Kk_sBL§³ª­',_binary '��CG�\�B=�Iն\n]$�'),(_binary '5X¤÷ü@£§',_binary '��CG�\�B=�Iն\n]$�'),(_binary 'Kk_sBL§³ª­',_binary 'rj\���C-����\�'),(_binary '5X¤÷ü@£§',_binary 'rj\���C-����\�');
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
  PRIMARY KEY (`id_segmento`),
  UNIQUE KEY `id_segmento` (`id_segmento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_segmentos`
--

LOCK TABLES `tb_segmentos` WRITE;
/*!40000 ALTER TABLE `tb_segmentos` DISABLE KEYS */;
INSERT INTO `tb_segmentos` VALUES (_binary 'kv°×D8»O','novoSegmento'),(_binary '©õ9_)A;uW©','test-segmento-1'),(_binary '6Õ\0öFºã','test-segmento-6'),(_binary '6ÞæÚjKq\�','test-segmento-5'),(_binary '^ÀËþÞÑA×','test-segmento-9'),(_binary 'A 2NIg¤','test-segmento-4'),(_binary '¼wØM\�','test-segmento-10'),(_binary 'ì£	·A{F^î','test-segmento-8'),(_binary 'òÒh­?*MÄ®W','test-segmento-7'),(_binary 'üþ¾Ô®Fr','test-segmento-3');
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
INSERT INTO `tb_segmentos_demandas` VALUES (_binary 'kv°×D8»O',_binary '|%\\LDÂ .¾');
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
INSERT INTO `tb_softskills` VALUES (_binary 'À¬æ{ÝL[','soft-skill-2',NULL),(_binary '*/!ë*N®Âç','soft-skill-4',NULL),(_binary 'F;$á0LX:\�','soft-skill-6',NULL),(_binary 'P\\·}ÞnCõ[','soft-skill-5',NULL),(_binary 'TÀDÈ\\¯I£¤1\\','soft-skill-1',NULL),(_binary '_VË³\ZA6I','soft-skill-3',NULL),(_binary 'xáì÷tEÚ¢','soft-skill-9',NULL),(_binary 'ÅôrrñBH\�','soft-skill-7',NULL),(_binary 'áë>.ÕKÔ¥l','soft-skill-8',NULL);
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
INSERT INTO `tb_softskills_demandas` VALUES (_binary 'À¬æ{ÝL[',_binary '\n\�\�[\�\�IG��ʚN)\�'),(_binary 'xáì÷tEÚ¢',_binary '��CG�\�B=�Iն\n]$�'),(_binary 'À¬æ{ÝL[',_binary '��CG�\�B=�Iն\n]$�'),(_binary 'À¬æ{ÝL[',_binary 'rj\���C-����\�'),(_binary 'xáì÷tEÚ¢',_binary 'rj\���C-����\�');
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
INSERT INTO `tb_usuarios` VALUES (_binary 'Êm3þA\�','usuario_1',1,'sobrenome_1','1234567','email1@email.com','123456','2023-11-30 17:36:45','2024-05-10','designacao1','cidade1','estado1',NULL,'','00:00:00.000000','30112023173644.jpg',NULL,NULL,NULL,NULL);
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
/*!40000 ALTER TABLE `tb_usuarios_demandas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-05 21:54:02
