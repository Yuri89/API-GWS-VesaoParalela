CREATE DATABASE  IF NOT EXISTS `db_gws_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_gws_2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_gws
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
INSERT INTO `tb_clientes` VALUES (_binary '6\Ä\"O_ª­x\ã	X',NULL,'empresa-6','cliente-6','123456789','emailcliente6@email.com','30112023170601.jpg'),(_binary '	K\Ì\í\ÐL¸;(@\Û|\é',NULL,'empresa-8','cliente-8','123456789','emailcliente8@email.com','30112023170621.jpg'),(_binary '\ZeL\ÄùüJT¬u<L\Ïm',NULL,'empresa-4','cliente-4','123456789','emailcliente4@email.com','30112023170534.jpg'),(_binary 'DÅ½ù@$¸aô´zG\æ',NULL,'empresa-5','cliente-5','123456789','emailcliente5@email.com','30112023170545.jpg'),(_binary 'pdÁiOðY·\àI²',NULL,'empresa-2','cliente-2','123456789','emailcliente2@email.com','30112023170508.jpg'),(_binary '³\Å\ì%JT wöÇú&F',NULL,'empresa-10','cliente-10','123456789','emailcliente10@email.com','30112023170636.jpg'),(_binary '³Ì\æ¦LÇi\Ë\Ò!',NULL,'empresa-1','cliente-1','123456789','emailcliente1@email.com','30112023170424.jpg'),(_binary 'º\ÕÁ{úF1þh|«c²',NULL,'empresa-3','cliente-3','123456789','emailcliente3@email.com','30112023170519.jpg'),(_binary 'ö»0\ï@¯ W:\Ñ\Û\Î',NULL,'empresa-7','cliente-7','123456789','emailcliente7@email.com','30112023170612.jpg'),(_binary '÷d\Ý¨OÐp\ÛH²(o\Þ',NULL,'empresa-9','cliente-9','123456789','emailcliente9@email.com','30112023170627.jpg');
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
INSERT INTO `tb_demandas` VALUES (_binary '|%\\LDÂ .¾¸á¼X','titulo1','string','descriÃ§Ã£o,string','30112023181344.png',_binary '\0',_binary '',_binary '',NULL,'2024-10-11',0,'2023-11-30 18:13:44.300585',_binary '	K\Ì\í\ÐL¸;(@\Û|\é');
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
INSERT INTO `tb_hardskills` VALUES (_binary '5X¤÷ü@£§$:*ð7','hard-skill-6'),(_binary 'r6ÛLF«¡r¹?¾Z','hard-skill-10'),(_binary '°xJ!¹·\Ò\çº','hard-skill-8'),(_binary 'Kk_sBL§³ª­°\Ýo\Ö','hard-skill-7'),(_binary '\ëµ@K\ÇOÈ´\'üux','hard-skill-4'),(_binary 'ªþ$\èO\âNÐo§J','hard-skill-1'),(_binary '¶vM\"dE\0·\ë\ÑñM0d','hard-skill-3'),(_binary '·\íÝ¿}EwaIed','hard-skill-9'),(_binary '\Îy¿tK »rx|\í¡','hard-skill-5'),(_binary '\Ù\ãÁC¶J\æ¨ú3\ß|ª\Ë','hard-skill-2');
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
INSERT INTO `tb_segmentos` VALUES (_binary 'kv°\×D8»Oü&\é','test-segmento-2'),(_binary '©õ9_)A;uW©b{ö:','test-segmento-1'),(_binary '6\Õ\0öFº\ãúð/a','test-segmento-6'),(_binary '6\Þ\æ\ÚjKqúÖ¶B\Är','test-segmento-5'),(_binary '^À\Ëþ\Þ\ÑA×\ìÿC\è\Ä','test-segmento-9'),(_binary 'A 2NIg¤±\æ','test-segmento-4'),(_binary '¼w\ØMù©§¼','test-segmento-10'),(_binary '\ì£	·A{F^\îmü\ëNû','test-segmento-8'),(_binary 'ò\Òh­?*MÄ®WÀ\ål[','test-segmento-7'),(_binary 'üþ¾Ô®Fr\ÑøF[','test-segmento-3');
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
INSERT INTO `tb_segmentos_demandas` VALUES (_binary '©õ9_)A;uW©b{ö:',_binary '|%\\LDÂ .¾¸á¼X'),(_binary 'kv°\×D8»Oü&\é',_binary '|%\\LDÂ .¾¸á¼X');
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
INSERT INTO `tb_softskills` VALUES (_binary 'À¬\æ{\ÝL[j¶\Ã\ØO','soft-skill-2'),(_binary '*/!\ë*N®\Â\ç§\Þ}p','soft-skill-4'),(_binary 'F;$\á0LX:õG\Þ\×','soft-skill-6'),(_binary 'J§×­\êHÜo©Du\ä','soft-skill-10'),(_binary 'P\\·}\ÞnCõ[\\\Í\é','soft-skill-5'),(_binary 'TÀD\È\\¯I£¤1\\ZÕ­ ñ','soft-skill-1'),(_binary '_VË³\ZA6I§d\ê.','soft-skill-3'),(_binary 'x\á\ì÷tEÚ¢¸%.¿','soft-skill-9'),(_binary '\ÅôrrñBH©ýñ\Õ\ê','soft-skill-7'),(_binary '\á\ë>.\ÕKÔ¥l3\Ûx\Ä\Ã','soft-skill-8');
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
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (_binary 'Êm3þAÁ[f`\å÷','usuario_1',1,'sobrenome_1','1234567','email1@email.com','123456','2023-11-30 17:36:45','2024-05-10','designacao1','cidade1','estado1',NULL,'','00:00:00.000000','30112023173644.jpg'),(_binary '\æ\ÕxM\ÇLÓ©C\n¸Â\Ôw','usuario_2',2,'sobrenome_2','1234567','email2@email.com','123456','2023-11-30 17:37:43','2024-05-10','designacao2','cidade2','estado2',NULL,'','00:00:00.000000','30112023173743.jpg');
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
INSERT INTO `tb_usuarios_demandas` VALUES (_binary 'Êm3þAÁ[f`\å÷',_binary '|%\\LDÂ .¾¸á¼X'),(_binary '\æ\ÕxM\ÇLÓ©C\n¸Â\Ôw',_binary '|%\\LDÂ .¾¸á¼X');
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

-- Dump completed on 2023-12-01 16:54:10
