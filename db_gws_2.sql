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
  `relatorio` text,
  `conceito` varchar(255) DEFAULT NULL,
  `data_avaliacao` date NOT NULL,
  `id_usuario` binary(16) NOT NULL,
  `id_tarefa` binary(16) NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `tb_a_1_idx` (`id_usuario`),
  KEY `id_tarefas` (`id_tarefa`),
  CONSTRAINT `id_tarefas` FOREIGN KEY (`id_tarefa`) REFERENCES `tb_tarefas` (`id_tarefa`),
  CONSTRAINT `id_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_avaliacoes`
--

LOCK TABLES `tb_avaliacoes` WRITE;
/*!40000 ALTER TABLE `tb_avaliacoes` DISABLE KEYS */;
INSERT INTO `tb_avaliacoes` VALUES (_binary '\�ǩ\r\�\�I��N��~j�','apenas um teste','MEIA_ESTRELA','2024-01-09',_binary 'ÂÃÂm3Ã',_binary 'Ïy»ËÀSEw¿');
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
INSERT INTO `tb_clientes` VALUES (_binary 'Â6Ã\"ÂO',NULL,'empresa-6','cliente-6','123456789','emailcliente6@email.com','30112023170601.jpg'),(_binary '	KÃÃ­ÃL',NULL,'empresa-8','cliente-8','123456789','emailcliente8@email.com','30112023170621.jpg'),(_binary '\ZeLÃÃ¹Ã¼J',NULL,'empresa-4','cliente-4','123456789','emailcliente4@email.com','30112023170534.jpg'),(_binary 'DÃÂ½ÂÃ',NULL,'empresa-5','cliente-5','123456789','emailcliente5@email.com','30112023170545.jpg'),(_binary 'pdÃiOÃ°Â',NULL,'empresa-2','cliente-2','123456789','emailcliente2@email.com','30112023170508.jpg'),(_binary 'Â³ÃÃ¬%Â',NULL,'empresa-10','cliente-10','123456789','emailcliente10@email.com','30112023170636.jpg'),(_binary 'Â³ÃÂÃ\�',NULL,'empresa-1','cliente-1','123456789','emailcliente1@email.com','30112023170424.jpg'),(_binary 'ÂºÃÃ{Ã\�',NULL,'empresa-3','cliente-3','123456789','emailcliente3@email.com','30112023170519.jpg'),(_binary 'Ã¶Â»Â0Ã',NULL,'empresa-7','cliente-7','123456789','emailcliente7@email.com','30112023170612.jpg'),(_binary 'Ã·dÃÂ¨O',NULL,'empresa-9','cliente-9','123456789','emailcliente9@email.com','30112023170627.jpg');
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
  PRIMARY KEY (`id_demanda`),
  UNIQUE KEY `id_demanda` (`id_demanda`),
  KEY `FKiaru14x2kk73b3r1akaimy6r4` (`id_cliente`),
  CONSTRAINT `FKiaru14x2kk73b3r1akaimy6r4` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_demandas`
--

LOCK TABLES `tb_demandas` WRITE;
/*!40000 ALTER TABLE `tb_demandas` DISABLE KEYS */;
INSERT INTO `tb_demandas` VALUES (_binary 'a¥*$yMgøß','test','test','test','test1963(03122023220646).txt, test54209(03122023220646).docx',_binary '',_binary '',_binary '',NULL,'2024-10-10',0,'2023-12-03 22:06:46.969541',_binary 'Â6Ã\"ÂO'),(_binary '|Â%\\ÂLDÃ\�','titulo1','string','descriÃÂ§ÃÂ£o,string','30112023181344.png',_binary '\0',_binary '',_binary '',NULL,'2024-10-11',0,'2023-11-30 18:13:44.300585',_binary '	KÃÃ­ÃL');
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
  PRIMARY KEY (`id_hardskill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hardskills`
--

LOCK TABLES `tb_hardskills` WRITE;
/*!40000 ALTER TABLE `tb_hardskills` DISABLE KEYS */;
INSERT INTO `tb_hardskills` VALUES (_binary '5ÂXÂ¤Ã·Ã','hard-skill-6'),(_binary 'r6ÃÂLFÂ\�','hard-skill-10'),(_binary 'ÂÂ°ÂxJ','hard-skill-8'),(_binary 'ÂKk_sBLÂ§Â','hard-skill-7'),(_binary 'ÂÃ«Âµ@KÃ','hard-skill-4'),(_binary 'ÂªÂÃ¾$Ã\�','hard-skill-1'),(_binary 'Â¶vMÂ\"dE\0Â','hard-skill-3'),(_binary 'Â·Ã­ÃÂ¿','hard-skill-9'),(_binary 'ÃyÂ¿ÂÂ\�','hard-skill-5'),(_binary 'ÃÃ£ÂÃ','hard-skill-2');
/*!40000 ALTER TABLE `tb_hardskills` ENABLE KEYS */;
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
  `horas` int NOT NULL,
  `dia_registro` date NOT NULL,
  `id_usuario` binary(16) NOT NULL,
  PRIMARY KEY (`id_horas_trabalho`),
  KEY `fo_u_t_idx` (`id_usuario`),
  CONSTRAINT `fo_u_t` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_horas_trabalho`
--

LOCK TABLES `tb_horas_trabalho` WRITE;
/*!40000 ALTER TABLE `tb_horas_trabalho` DISABLE KEYS */;
INSERT INTO `tb_horas_trabalho` VALUES (_binary 'de�{C��$��a�',32,'2024-01-26',_binary 'ÂÃÂm3Ã'),(_binary '.�tE��f+Y�_�)',32,'2024-08-30',_binary 'ÂÃÂm3Ã'),(_binary '$�#4�HH5�x\�x\�X',8,'2024-01-05',_binary 'ÂÃÂm3Ã'),(_binary '&\��u�#EV�\�M<l�,',8,'2024-02-06',_binary 'ÂÃÂm3Ã'),(_binary '6`T��\�G��L\�����',8,'2024-01-08',_binary 'ÂÃÂm3Ã'),(_binary 'U�+b��C��\�e\�p\�it',8,'2024-03-06',_binary 'ÂÃÂm3Ã'),(_binary '\\�\�s�Dh�t,>\�\�ۅ',32,'2024-01-18',_binary 'ÂÃÂm3Ã'),(_binary 'b�Z��\�D7�jϥC�g',8,'2024-07-06',_binary 'ÂÃÂm3Ã'),(_binary 'u\�l!KCX�\�\�\�\�\�@',32,'2024-01-31',_binary 'ÂÃÂm3Ã'),(_binary '�O�w:KU�\�S�O,D',8,'2024-01-06',_binary 'ÂÃÂm3Ã'),(_binary '��Bw\�DHa�=U�R\ra�',32,'2024-10-31',_binary 'ÂÃÂm3Ã'),(_binary '�\03+[O��;nt�J\�',32,'2024-01-10',_binary 'ÂÃÂm3Ã'),(_binary '�gz��I��V�jl',8,'2024-01-07',_binary 'ÂÃÂm3Ã');
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
  `media_semanal` int DEFAULT NULL,
  `media_mensal` int DEFAULT NULL,
  `media_anual` int DEFAULT NULL,
  `total_semanal` int DEFAULT NULL,
  `total_mensal` int DEFAULT NULL,
  `total_anual` int DEFAULT NULL,
  `fte_medio_semanal` int DEFAULT NULL,
  `fte_medio_mensal` int DEFAULT NULL,
  `fte_medio_anual` int DEFAULT NULL,
  `registro` date DEFAULT NULL,
  `id_usuario` binary(16) NOT NULL,
  PRIMARY KEY (`id_media_soma`),
  UNIQUE KEY `id_media_soma_UNIQUE` (`id_media_soma`),
  KEY `id_u_m_s_idx` (`id_usuario`),
  CONSTRAINT `id_u_m_s` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_media_soma`
--

LOCK TABLES `tb_media_soma` WRITE;
/*!40000 ALTER TABLE `tb_media_soma` DISABLE KEYS */;
INSERT INTO `tb_media_soma` VALUES (_binary '!U�\�]NY�|���{',0,8,19,0,24,248,0,0,0,NULL,_binary 'ÂÃÂm3Ã');
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
INSERT INTO `tb_segmentos` VALUES (_binary 'kvÂ°ÃDÂ','test-segmento-2'),(_binary 'Â©Ãµ9_)A;Â','test-segmento-1'),(_binary '6Ã\0ÂÃ¶F','test-segmento-6'),(_binary '6ÃÃ¦ÃjK','test-segmento-5'),(_binary '^ÃÃÃ¾Ã\�','test-segmento-9'),(_binary 'ÂA Â2NIÂ','test-segmento-4'),(_binary 'Â¼wÂÂÂ\�','test-segmento-10'),(_binary 'Ã¬Â£	Â·A{F','test-segmento-8'),(_binary 'Ã²ÃhÂ­?*M','test-segmento-7'),(_binary 'Ã¼ÂÃ¾Â¾','test-segmento-3');
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
INSERT INTO `tb_segmentos_demandas` VALUES (_binary 'Â©Ãµ9_)A;Â',_binary '|Â%\\ÂLDÃ\�'),(_binary 'kvÂ°ÃDÂ',_binary '|Â%\\ÂLDÃ\�');
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
  PRIMARY KEY (`id_softskill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_softskills`
--

LOCK TABLES `tb_softskills` WRITE;
/*!40000 ALTER TABLE `tb_softskills` DISABLE KEYS */;
INSERT INTO `tb_softskills` VALUES (_binary 'ÃÂ¬Ã¦{Ã','soft-skill-2'),(_binary '*/Â!Ã«*NÂ','soft-skill-4'),(_binary 'F;$Ã¡0ÂLXÂ','soft-skill-6'),(_binary 'JÂ§ÂÃÂ\�','soft-skill-10'),(_binary 'P\\Â·}ÃnCÃ\�','soft-skill-5'),(_binary 'TÃDÃ\\Â¯I','soft-skill-1'),(_binary '_VÃÂ³Â\ZA','soft-skill-3'),(_binary 'xÃ¡Ã¬Ã·tE','soft-skill-9'),(_binary 'ÃÃ´rrÃ±B','soft-skill-7'),(_binary 'Ã¡Ã«Â>.Ã','soft-skill-8');
/*!40000 ALTER TABLE `tb_softskills` ENABLE KEYS */;
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
  `nome_tarefa` varchar(200) NOT NULL,
  `descricao_tarefa` text NOT NULL,
  `conclusao` tinyint DEFAULT NULL,
  `id_demanda` binary(16) NOT NULL,
  PRIMARY KEY (`id_tarefa`),
  KEY `id_demanda_idx` (`id_demanda`),
  CONSTRAINT `id_demanda_tarefa_1` FOREIGN KEY (`id_demanda`) REFERENCES `tb_demandas` (`id_demanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tarefas`
--

LOCK TABLES `tb_tarefas` WRITE;
/*!40000 ALTER TABLE `tb_tarefas` DISABLE KEYS */;
INSERT INTO `tb_tarefas` VALUES (_binary 'Ïy»ËÀSEw¿','tarefa5','deve tar alinhado com as reuniÃµes anteriores',0,_binary 'a¥*$yMgøß');
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
  `descricao` varchar(255) DEFAULT NULL,
  `horas` time(6) DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `semana_trabalhada` int unsigned DEFAULT NULL,
  `mes_trabalhado` int unsigned DEFAULT NULL,
  `ano_trabalhado` int unsigned DEFAULT NULL,
  `ano_trabalhada` int DEFAULT NULL,
  `mes_trabalhada` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tb_usuarios_chk_1` CHECK ((`semana_trabalhada` <= 300000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (_binary '^l�	YO���Ĩ|�4�','ok',3,'ok','123456','ok@ok','$2a$10$zufpfm3WQjQQF4INL63Qi.y56CCvL/Y08JHzArUWoUeUDwL6lyZNa','2024-01-09 13:45:54','2020-10-10','f','f','f','','10:10:10.000000','09012024134553.jpg',NULL,NULL,NULL,NULL,NULL),(_binary 'ÂÃÂm3Ã','usuario_1',1,'sobrenome_1','1234567','email1@email.com','123456','2023-11-30 17:36:45','2024-05-10','designacao1','cidade1','estado1','','00:00:00.000000','30112023173644.jpg',NULL,NULL,NULL,NULL,NULL),(_binary 'Ã¦ÃxMÃL','usuario_2',2,'sobrenome_2','1234567','email2@email.com','123456','2023-11-30 17:37:43','2024-05-10','designacao2','cidade2','estado2','','00:00:00.000000','30112023173743.jpg',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `tb_usuarios_demandas` VALUES (_binary 'ÂÃÂm3Ã',_binary '|Â%\\ÂLDÃ\�'),(_binary 'Ã¦ÃxMÃL',_binary '|Â%\\ÂLDÃ\�'),(_binary 'ÂÃÂm3Ã',_binary 'a¥*$yMgøß');
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

-- Dump completed on 2024-01-09 14:28:30
