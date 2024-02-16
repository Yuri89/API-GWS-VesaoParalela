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
INSERT INTO `tb_clientes` VALUES (_binary ';�\�#e@ǈb�(���',NULL,'Empresa','Cliente3','123456789','cliente3@email.com','16022024075458.jpg'),(_binary '.={$@#���\�',NULL,'Empresa','Cliente4','123456789','cliente4@email.com','16022024075503.jpg'),(_binary 'W�tB\�@<�C�Zi���',NULL,'Empresa','Cliente7','123456789','cliente7@email.com','16022024075515.jpg'),(_binary 'ln\rv\0\�I\�W;I\�\�g#',NULL,'Empresa','Cliente10','123456789','cliente10@email.com','16022024075531.jpg'),(_binary '��=�\rN�[}\�yA!W',NULL,'Empresa','Cliente8','123456789','cliente8@email.com','16022024075519.jpg'),(_binary '�}��\�eD����\�\�f.\�',NULL,'Empresa','Cliente6','123456789','cliente6@email.com','16022024075511.jpg'),(_binary '\�\�}EuC��\�?�\�vr',NULL,'Empresa','Cliente5','123456789','cliente5@email.com','16022024075507.jpg'),(_binary '\�A��k|N���nƨ\0\�u',NULL,'Empresa','Cliente1','123456789','cliente1@email.com','16022024075421.jpg'),(_binary '\��F�\�A\�WEn8;��',NULL,'Empresa','Cliente9','123456789','cliente9@email.com','16022024075523.jpg'),(_binary '�\�{*�@C0�2ٳI��',NULL,'Empresa','Cliente2','123456789','cliente2@email.com','16022024075447.jpg');
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
INSERT INTO `tb_demandas` VALUES (_binary '\�\�谔J\�e\�sH���','demanda6','test','demanda61(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',8000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary '�{�\�J��T\�\�y+ɓ','demanda10','test','demanda101(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',2000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary 'B�$gG\�-\�yR)-','demanda5','test','demanda51(16022024).png',_binary '',_binary '\0',_binary '\0',NULL,'2025-10-10',12000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary 'b�@d\�\�D�e�\�4��','demanda2','test','demanda21(16022024).png, demanda22(16022024).png, demanda23(16022024).png, demanda24(16022024).png, demanda25(16022024).png, demanda26(16022024).png',_binary '\0',_binary '',_binary '\0',NULL,'2025-10-10',44000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary 'dTc�sB��<�q�T�','demanda8','test','demanda81(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',2000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary 'i%;�\�M%�����7�','demanda4','test','demanda41(16022024).png',_binary '',_binary '',_binary '\0',NULL,'2025-10-10',12000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary 'p\�\�c\�BO��O���1','demanda7','test','demanda71(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',2000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary '�\�U#�hK3��7N�!','demanda1','test','demanda11(16022024).png, demanda12(16022024).png, demanda13(16022024).png, demanda14(16022024).png, demanda15(16022024).png, demanda16(16022024).png',_binary '\0',_binary '',_binary '\0',NULL,'2025-10-10',52000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary '�c�\�VIK\�4\�1���','demanda9','test','demanda91(16022024).png',_binary '',_binary '\0',_binary '',NULL,'2025-10-10',2000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL),(_binary '\�O��\'#@:�\�_xݜc','demanda3','test','demanda31(16022024).png',_binary '\0',_binary '',_binary '\0',NULL,'2025-10-10',112000,'2024-10-10',_binary ';�\�#e@ǈb�(���',_binary 'IJ\�\�%�B?�=\���% ',NULL,NULL);
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
INSERT INTO `tb_hardskills` VALUES (_binary '\�\���D���\���','CSS',NULL,'2024-02-16'),(_binary 'QH\�S�\�A��z�&�_�','Java',NULL,'2024-02-16'),(_binary 'k��QM\�C��U��\Z','C#',NULL,'2024-02-16'),(_binary '�\'�ZG=�-��6�L','PHP',NULL,'2024-02-16'),(_binary '��2C�DC�a��\�W','HTML',NULL,'2024-02-16'),(_binary '�G\�çHк�i\0ݪ��','Go',NULL,'2024-02-16'),(_binary '�\'j\�\�A\�M2\n2K\�','Phyton',NULL,'2024-02-16'),(_binary '׉X,�LD��=��͇\�','JavaScript',NULL,'2024-02-16');
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
INSERT INTO `tb_hardskills_demandas` VALUES (_binary '��2C�DC�a��\�W',_binary '�\�U#�hK3��7N�!'),(_binary '׉X,�LD��=��͇\�',_binary '�\�U#�hK3��7N�!'),(_binary '\�\���D���\���',_binary '�\�U#�hK3��7N�!'),(_binary '׉X,�LD��=��͇\�',_binary 'b�@d\�\�D�e�\�4��'),(_binary '\�\���D���\���',_binary 'b�@d\�\�D�e�\�4��'),(_binary '��2C�DC�a��\�W',_binary 'b�@d\�\�D�e�\�4��'),(_binary '\�\���D���\���',_binary '\�O��\'#@:�\�_xݜc'),(_binary '��2C�DC�a��\�W',_binary '\�O��\'#@:�\�_xݜc'),(_binary '׉X,�LD��=��͇\�',_binary '\�O��\'#@:�\�_xݜc'),(_binary '��2C�DC�a��\�W',_binary 'i%;�\�M%�����7�'),(_binary '׉X,�LD��=��͇\�',_binary 'i%;�\�M%�����7�'),(_binary '\�\���D���\���',_binary 'i%;�\�M%�����7�'),(_binary '\�\���D���\���',_binary 'B�$gG\�-\�yR)-'),(_binary '��2C�DC�a��\�W',_binary 'B�$gG\�-\�yR)-'),(_binary '׉X,�LD��=��͇\�',_binary 'B�$gG\�-\�yR)-'),(_binary '\�\���D���\���',_binary '\�\�谔J\�e\�sH���'),(_binary '��2C�DC�a��\�W',_binary '\�\�谔J\�e\�sH���'),(_binary '׉X,�LD��=��͇\�',_binary '\�\�谔J\�e\�sH���'),(_binary '\�\���D���\���',_binary 'p\�\�c\�BO��O���1'),(_binary '׉X,�LD��=��͇\�',_binary 'p\�\�c\�BO��O���1'),(_binary '��2C�DC�a��\�W',_binary 'p\�\�c\�BO��O���1'),(_binary '׉X,�LD��=��͇\�',_binary 'dTc�sB��<�q�T�'),(_binary '\�\���D���\���',_binary 'dTc�sB��<�q�T�'),(_binary '��2C�DC�a��\�W',_binary 'dTc�sB��<�q�T�'),(_binary '\�\���D���\���',_binary '�c�\�VIK\�4\�1���'),(_binary '׉X,�LD��=��͇\�',_binary '�c�\�VIK\�4\�1���'),(_binary '��2C�DC�a��\�W',_binary '�c�\�VIK\�4\�1���'),(_binary '\�\���D���\���',_binary '�{�\�J��T\�\�y+ɓ'),(_binary '׉X,�LD��=��͇\�',_binary '�{�\�J��T\�\�y+ɓ'),(_binary '��2C�DC�a��\�W',_binary '�{�\�J��T\�\�y+ɓ');
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
INSERT INTO `tb_horas_trabalho` VALUES (_binary 'r�BkcB]�Ȗ�.���','2024-02-16',230,_binary '�d%0�B\Z�]���\0L');
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
INSERT INTO `tb_segmentos` VALUES (_binary '�G,\�\nL���n�f\�','Segmento7',NULL),(_binary '�\�Z,WH���ȼQ��','Segmento8',NULL),(_binary '-���q@u�\�\r�-gw	','Segmento9',NULL),(_binary 'V\Z�=hO�I�b\��\r!','Segmento2',NULL),(_binary '�B\�֕K�\�~\���g\�','Segmento3',NULL),(_binary '��+��H?��	�$ \Z3','Segmento10',NULL),(_binary '�\�^\�\�K^��\� �U','Segmento5',NULL),(_binary '\�`\�1+\�F�T\r\�\�=\�','Segmento4',NULL),(_binary '퓏+QXHL�A�� Q','Segmento1',NULL),(_binary '�K���I��\�7\'x��','Segmento6',NULL);
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
INSERT INTO `tb_segmentos_demandas` VALUES (_binary '�G,\�\nL���n�f\�',_binary '�\�U#�hK3��7N�!'),(_binary '�\�Z,WH���ȼQ��',_binary '�\�U#�hK3��7N�!'),(_binary '-���q@u�\�\r�-gw	',_binary '�\�U#�hK3��7N�!'),(_binary '-���q@u�\�\r�-gw	',_binary 'b�@d\�\�D�e�\�4��'),(_binary '�\�Z,WH���ȼQ��',_binary 'b�@d\�\�D�e�\�4��'),(_binary '�G,\�\nL���n�f\�',_binary 'b�@d\�\�D�e�\�4��'),(_binary '�\�Z,WH���ȼQ��',_binary '\�O��\'#@:�\�_xݜc'),(_binary '�G,\�\nL���n�f\�',_binary '\�O��\'#@:�\�_xݜc'),(_binary '-���q@u�\�\r�-gw	',_binary '\�O��\'#@:�\�_xݜc'),(_binary '-���q@u�\�\r�-gw	',_binary 'i%;�\�M%�����7�'),(_binary '�G,\�\nL���n�f\�',_binary 'i%;�\�M%�����7�'),(_binary '�\�Z,WH���ȼQ��',_binary 'i%;�\�M%�����7�'),(_binary '-���q@u�\�\r�-gw	',_binary 'B�$gG\�-\�yR)-'),(_binary '�\�Z,WH���ȼQ��',_binary 'B�$gG\�-\�yR)-'),(_binary '�G,\�\nL���n�f\�',_binary 'B�$gG\�-\�yR)-'),(_binary '�G,\�\nL���n�f\�',_binary '\�\�谔J\�e\�sH���'),(_binary '�\�Z,WH���ȼQ��',_binary '\�\�谔J\�e\�sH���'),(_binary '-���q@u�\�\r�-gw	',_binary '\�\�谔J\�e\�sH���'),(_binary '-���q@u�\�\r�-gw	',_binary 'p\�\�c\�BO��O���1'),(_binary '�\�Z,WH���ȼQ��',_binary 'p\�\�c\�BO��O���1'),(_binary '�G,\�\nL���n�f\�',_binary 'p\�\�c\�BO��O���1'),(_binary '�\�Z,WH���ȼQ��',_binary 'dTc�sB��<�q�T�'),(_binary '�G,\�\nL���n�f\�',_binary 'dTc�sB��<�q�T�'),(_binary '-���q@u�\�\r�-gw	',_binary 'dTc�sB��<�q�T�'),(_binary '-���q@u�\�\r�-gw	',_binary '�c�\�VIK\�4\�1���'),(_binary '�\�Z,WH���ȼQ��',_binary '�c�\�VIK\�4\�1���'),(_binary '�G,\�\nL���n�f\�',_binary '�c�\�VIK\�4\�1���'),(_binary '�\�Z,WH���ȼQ��',_binary '�{�\�J��T\�\�y+ɓ'),(_binary '�G,\�\nL���n�f\�',_binary '�{�\�J��T\�\�y+ɓ'),(_binary '-���q@u�\�\r�-gw	',_binary '�{�\�J��T\�\�y+ɓ');
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
INSERT INTO `tb_softskills` VALUES (_binary 'X\�|�wCV��2�_A','GOHorse',NULL,'2024-02-16'),(_binary '��1��I���KJ�_\�','TechLeade',NULL,'2024-02-16'),(_binary '��g�\'BO����Xye�','SCRUM',NULL,'2024-02-16');
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
INSERT INTO `tb_softskills_demandas` VALUES (_binary 'X\�|�wCV��2�_A',_binary '�\�U#�hK3��7N�!'),(_binary '��g�\'BO����Xye�',_binary '�\�U#�hK3��7N�!'),(_binary 'X\�|�wCV��2�_A',_binary 'b�@d\�\�D�e�\�4��'),(_binary '��g�\'BO����Xye�',_binary 'b�@d\�\�D�e�\�4��'),(_binary 'X\�|�wCV��2�_A',_binary '\�O��\'#@:�\�_xݜc'),(_binary '��g�\'BO����Xye�',_binary '\�O��\'#@:�\�_xݜc'),(_binary 'X\�|�wCV��2�_A',_binary 'i%;�\�M%�����7�'),(_binary '��g�\'BO����Xye�',_binary 'i%;�\�M%�����7�'),(_binary 'X\�|�wCV��2�_A',_binary 'B�$gG\�-\�yR)-'),(_binary '��g�\'BO����Xye�',_binary 'B�$gG\�-\�yR)-'),(_binary 'X\�|�wCV��2�_A',_binary '\�\�谔J\�e\�sH���'),(_binary '��g�\'BO����Xye�',_binary '\�\�谔J\�e\�sH���'),(_binary 'X\�|�wCV��2�_A',_binary 'p\�\�c\�BO��O���1'),(_binary '��g�\'BO����Xye�',_binary 'p\�\�c\�BO��O���1'),(_binary '��g�\'BO����Xye�',_binary 'dTc�sB��<�q�T�'),(_binary 'X\�|�wCV��2�_A',_binary 'dTc�sB��<�q�T�'),(_binary 'X\�|�wCV��2�_A',_binary '�c�\�VIK\�4\�1���'),(_binary '��g�\'BO����Xye�',_binary '�c�\�VIK\�4\�1���'),(_binary '��g�\'BO����Xye�',_binary '�{�\�J��T\�\�y+ɓ'),(_binary 'X\�|�wCV��2�_A',_binary '�{�\�J��T\�\�y+ɓ');
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
INSERT INTO `tb_tarefas` VALUES (_binary '\0�\�]�Iɭ$>J5�',0,'test','tarefa9',_binary '�\�U#�hK3��7N�!'),(_binary 'Ř},\�H��Ҳ]\�s�$',0,'test','tarefa1',_binary '�\�U#�hK3��7N�!'),(_binary '��\��cI@����_A`',0,'test','tarefa4',_binary '�\�U#�hK3��7N�!'),(_binary 'G\�sڊF��pB2\nf�\�',0,'test','tarefa3',_binary '�\�U#�hK3��7N�!'),(_binary ')�F���E��η\�\�y',0,'test','tarefa14',_binary '�\�U#�hK3��7N�!'),(_binary ',+�f8G��V�HԷ7�',3,'test','tarefa17',_binary '�\�U#�hK3��7N�!'),(_binary 'Q\�\�j-L׮-���',3,'test','tarefa16',_binary '�\�U#�hK3��7N�!'),(_binary '^v�\�@\��L˔\n�\�',0,'test','tarefa8',_binary '�\�U#�hK3��7N�!'),(_binary 'w��`�fGv��7����',0,'test','tarefa10',_binary '�\�U#�hK3��7N�!'),(_binary '|R�\�MN&��\�\Zjm\�',3,'test','tarefa21',_binary '�\�U#�hK3��7N�!'),(_binary '��b�N�\���>~Ι',0,'test','tarefa12',_binary '�\�U#�hK3��7N�!'),(_binary '�p���I��i�\�\"',0,'test','tarefa2',_binary '�\�U#�hK3��7N�!'),(_binary '��\� ��E���� \�>�',3,'test','tarefa19',_binary '�\�U#�hK3��7N�!'),(_binary '��@A\�+Nr�\�AR;}',0,'test','tarefa13',_binary '�\�U#�hK3��7N�!'),(_binary '\�U\�v\�\�BK�|MR�� ',3,'test','tarefa20',_binary '�\�U#�hK3��7N�!'),(_binary 'Х�tP\�I�+a\�l',0,'test','tarefa15',_binary '�\�U#�hK3��7N�!'),(_binary '\�\�q[�N-�:�9\��\�',0,'test','tarefa7',_binary '�\�U#�hK3��7N�!'),(_binary '\�0\�9MF6���\��ci�',3,'test','tarefa18',_binary '�\�U#�hK3��7N�!'),(_binary '\�\�#�L-�:Vi��',0,'test','tarefa5',_binary '�\�U#�hK3��7N�!'),(_binary '\�4F\�\�Eҕȓ�sb�',0,'test','tarefa11',_binary '�\�U#�hK3��7N�!'),(_binary '\� �F\�OW�\�8mf�\n{',0,'test','tarefa6',_binary '�\�U#�hK3��7N�!');
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
INSERT INTO `tb_usuarios` VALUES (_binary '�d%0�B\Z�]���\0L','usuario5',3,'test','12345678','usuario5@email.com','$2a$10$reaN/C2ri33c8fXR12SEh.osfqBjuGonFArWuG5mhEYUcl09V6x8O','2024-02-16 07:30:53','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073052.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary 'IJ\�\�%�B?�=\���% ','usuario2',2,'test','12345678','usuario2@email.com','$2a$10$JPEMlPiiGZiPOApAOW6a3uIdrWxXOwlPmplOcY7Fu7QyjezWJSJLy','2024-02-16 07:29:55','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024072954.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary 'd?]�rsO0��7U\�\�/','usuario1',1,'test','12345678','usuario1@email.com','$2a$10$au4e6RiiSvhlrUR/XzN9Oe4EJ3Gckf3kcEjjPuZMmol6ckMRh/d2W','2024-02-16 07:29:34','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024072934.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '��BhX\'O�wh2\��;','usuario9',3,'test','12345678','usuario9@email.com','$2a$10$3ilUmtFL48GEkKSZXv4BwuEmY5zLHg2MfGpbQNjB23yELSnt3tSzK','2024-02-16 07:31:39','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073139.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '�\�[F\�\'O���Y9h\��','usuario6',3,'test','12345678','usuario6@email.com','$2a$10$BEbqyZYtkQ/FCUrZBS0VpuDGK0an9P1nhbLUzSYNwtmEWSM8e8Maa','2024-02-16 07:31:03','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073103.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '�ʖ�M\�E=�\'�\�M�','usuario4',3,'test','12345678','usuario4@email.com','$2a$10$hFEyC7R7LcemIjFwrk/9bezHesrovujCGj6wOazZG7q6c5SLZ6m6G','2024-02-16 07:30:42','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073041.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '�Y\�\�uF\�&����\\<','usuario8',3,'test','12345678','usuario8@email.com','$2a$10$2JyPV3nFCFq9rHYpxVedO.ecu6cVjrKdimC2vO7OpI8pxqhxqEQg.','2024-02-16 07:31:28','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073127.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '\�D��#[E�<\�:\�[K','usuario7',3,'test','12345678','usuario7@email.com','$2a$10$J1GMpM1zoxTnEDzrlfh8huP50oQNMziwLDuEnRRrYNFQSSFANwoue','2024-02-16 07:31:16','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073115.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '\�\�y�rK^�ux�	�#�','usuario3',2,'test','12345678','usuario3@email.com','$2a$10$pl1sKoplfVtJYrDw7bDtcuulYLHbtiK3J7./fEwjQY4MS6J5pA0B.','2024-02-16 07:30:15','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073015.jpg',NULL,'10:10:10.000000',NULL,NULL),(_binary '�\�O\�*L\�4_9<��','usuario10',3,'test','12345678','usuario10@email.com','$2a$10$hEvapKD1TCFzVlQk2Qiwze9IuksnL/4Bf6pIElp7QKImcjYNNXQVG','2024-02-16 07:32:00','2024-10-10','front-end','true','SP',NULL,'',NULL,'16022024073200.jpg',NULL,'10:10:10.000000',NULL,NULL);
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
INSERT INTO `tb_usuarios_demandas` VALUES (_binary '�\�[F\�\'O���Y9h\��',_binary '�\�U#�hK3��7N�!'),(_binary '�Y\�\�uF\�&����\\<',_binary '�\�U#�hK3��7N�!'),(_binary '��BhX\'O�wh2\��;',_binary '�\�U#�hK3��7N�!'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary '�\�U#�hK3��7N�!'),(_binary '��BhX\'O�wh2\��;',_binary 'b�@d\�\�D�e�\�4��'),(_binary '�\�[F\�\'O���Y9h\��',_binary 'b�@d\�\�D�e�\�4��'),(_binary '�Y\�\�uF\�&����\\<',_binary 'b�@d\�\�D�e�\�4��'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary 'b�@d\�\�D�e�\�4��'),(_binary '��BhX\'O�wh2\��;',_binary '\�O��\'#@:�\�_xݜc'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary '\�O��\'#@:�\�_xݜc'),(_binary '�Y\�\�uF\�&����\\<',_binary '\�O��\'#@:�\�_xݜc'),(_binary '�\�[F\�\'O���Y9h\��',_binary '\�O��\'#@:�\�_xݜc'),(_binary '��BhX\'O�wh2\��;',_binary 'i%;�\�M%�����7�'),(_binary '�Y\�\�uF\�&����\\<',_binary 'i%;�\�M%�����7�'),(_binary '�\�[F\�\'O���Y9h\��',_binary 'i%;�\�M%�����7�'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary 'i%;�\�M%�����7�'),(_binary '�\�[F\�\'O���Y9h\��',_binary 'B�$gG\�-\�yR)-'),(_binary '�Y\�\�uF\�&����\\<',_binary 'B�$gG\�-\�yR)-'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary 'B�$gG\�-\�yR)-'),(_binary '��BhX\'O�wh2\��;',_binary 'B�$gG\�-\�yR)-'),(_binary '�\�[F\�\'O���Y9h\��',_binary '\�\�谔J\�e\�sH���'),(_binary '��BhX\'O�wh2\��;',_binary '\�\�谔J\�e\�sH���'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary '\�\�谔J\�e\�sH���'),(_binary '�Y\�\�uF\�&����\\<',_binary '\�\�谔J\�e\�sH���'),(_binary '��BhX\'O�wh2\��;',_binary 'p\�\�c\�BO��O���1'),(_binary '�Y\�\�uF\�&����\\<',_binary 'p\�\�c\�BO��O���1'),(_binary '�\�[F\�\'O���Y9h\��',_binary 'p\�\�c\�BO��O���1'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary 'p\�\�c\�BO��O���1'),(_binary '�\�[F\�\'O���Y9h\��',_binary 'dTc�sB��<�q�T�'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary 'dTc�sB��<�q�T�'),(_binary '�Y\�\�uF\�&����\\<',_binary 'dTc�sB��<�q�T�'),(_binary '��BhX\'O�wh2\��;',_binary 'dTc�sB��<�q�T�'),(_binary '�Y\�\�uF\�&����\\<',_binary '�c�\�VIK\�4\�1���'),(_binary '�\�[F\�\'O���Y9h\��',_binary '�c�\�VIK\�4\�1���'),(_binary '��BhX\'O�wh2\��;',_binary '�c�\�VIK\�4\�1���'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary '�c�\�VIK\�4\�1���'),(_binary '�\�[F\�\'O���Y9h\��',_binary '�{�\�J��T\�\�y+ɓ'),(_binary '�Y\�\�uF\�&����\\<',_binary '�{�\�J��T\�\�y+ɓ'),(_binary '��BhX\'O�wh2\��;',_binary '�{�\�J��T\�\�y+ɓ'),(_binary '�ʖ�M\�E=�\'�\�M�',_binary '�{�\�J��T\�\�y+ɓ');
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
