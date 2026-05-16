CREATE DATABASE  IF NOT EXISTS `e_market` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e_market`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: e_market
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'eac28807-1c98-11f1-bd39-a8a159e9f924:1-203';

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NOME` (`NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (3,'Armazenamentos de disco'),(2,'Fontes'),(5,'Monitor'),(4,'Perifericos'),(6,'Placa de video'),(1,'Processadores');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CPF` varchar(14) NOT NULL,
  `ID_ENDERECO` int NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `DATA_NASCIMENTO` date NOT NULL,
  `SENHA` varchar(255) NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `FK_ENDERECO_CLIENTE` (`ID_ENDERECO`),
  CONSTRAINT `FK_ENDERECO_CLIENTE` FOREIGN KEY (`ID_ENDERECO`) REFERENCES `endereco` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('07786798002',2,'Pietro Lorenzo','PietroGames@Gmail.com','2008-07-15','Minecraft123'),('123.456.789-00',4,'Pietro Santos','pietro.santos@email.com','2001-05-14','senha123'),('12345678901',3,'Gustavo','EmailTEST2@Unijorge.com.br','2000-01-20','unijorge'),('234.567.890-11',5,'Gustavo Lima','gustavo.lima@email.com','2002-08-22','gugu2026'),('345.678.901-22',6,'Navarro Silva','navarro.silva@email.com','2000-11-03','nav12345'),('456.789.012-33',7,'Leonardo Oliveira','leonardo.prof@email.com','1985-02-17','profLeo85'),('567.890.123-44',8,'Mariana Costa','mariana.costa@email.com','2003-01-30','mari2026'),('6163512302',1,'Fernando Bartilotti','Emailtest1@unijorge.com.br','2003-02-10','123456'),('678.901.234-55',9,'Ana Beatriz','ana.bia@email.com','1999-07-11','senhaSegura!'),('789.012.345-66',10,'Carlos Eduardo','carlos.edu@email.com','2001-12-05','carlitos00'),('890.123.456-77',11,'Fernanda Souza','fernanda.s@email.com','2002-03-28','nanda123');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom`
--

DROP TABLE IF EXISTS `cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CODIGO` varchar(15) NOT NULL,
  `TIPO` enum('porcentagem','fixo') NOT NULL,
  `VALOR` decimal(10,2) NOT NULL,
  `ATIVO` tinyint(1) DEFAULT '1',
  `LIMITE_DE_USO` int DEFAULT '2000',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom`
--

LOCK TABLES `cupom` WRITE;
/*!40000 ALTER TABLE `cupom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RUA` varchar(255) NOT NULL,
  `BAIRRO` varchar(255) NOT NULL,
  `NUMERO` varchar(30) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  `CIDADE` varchar(100) NOT NULL,
  `ESTADO` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Av Sete de setembro','Campo Grande','2025','40080001','Salvador','Bahia'),(2,'R.Gen.Labatut','Barris','1202','40080010','Salvador','Bahia'),(3,'R.Salete','Barris','288','40080010','Salvador','Bahia'),(4,'Avenida Sete de Setembro','Campo Grande','1050','40080-001','Salvador','BA'),(5,'Rua da Paciência','Rio Vermelho','230','41950-010','Salvador','BA'),(6,'Avenida Manoel Dias da Silva','Pituba','850','41830-000','Salvador','BA'),(7,'Rua das Laranjeiras','Pelourinho','12','40026-230','Salvador','BA'),(8,'Rua Conselheiro Pedro Luiz','Rio Vermelho','112','41950-610','Salvador','BA'),(9,'Avenida Oceânica','Ondina','2500','40170-010','Salvador','BA'),(10,'Rua Silveira Martins','Cabula','455','41150-000','Salvador','BA'),(11,'Avenida Tancredo Neves','Caminho das Árvores','1000','41820-020','Salvador','BA');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_PEDIDO` int NOT NULL,
  `ID_PRODUTO` int NOT NULL,
  `QUANTIDADE` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PEDIDOS_ITENS` (`ID_PEDIDO`),
  KEY `FK_PRODUTO_ITENS` (`ID_PRODUTO`),
  CONSTRAINT `FK_PEDIDOS_ITENS` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedido` (`ID`),
  CONSTRAINT `FK_PRODUTO_ITENS` FOREIGN KEY (`ID_PRODUTO`) REFERENCES `produto` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,3,1),(2,1,7,1),(3,1,9,1),(4,2,10,2),(5,3,1,1),(6,3,11,1);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CPF_CLIENTE` varchar(14) NOT NULL,
  `ID_CUPOM` int DEFAULT NULL,
  `STATUS_PEDIDO` enum('pago','pendente','cancelado') NOT NULL,
  `VALOR_TOTAL` decimal(10,2) NOT NULL,
  `VALOR_FINAL` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CPF_CLIENTE` (`CPF_CLIENTE`),
  KEY `FK_CUPOM_PEDIDO` (`ID_CUPOM`),
  CONSTRAINT `FK_CLIENTE_PEDIDO` FOREIGN KEY (`CPF_CLIENTE`) REFERENCES `cliente` (`CPF`),
  CONSTRAINT `FK_CUPOM_PEDIDO` FOREIGN KEY (`ID_CUPOM`) REFERENCES `cupom` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'6163512302',NULL,'pendente',3680.04,3680.04),(2,'789.012.345-66',NULL,'cancelado',12998.00,12998.00),(3,'07786798002',NULL,'pago',14060.99,14060.99);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CATEGORIA` int NOT NULL,
  `MARCA` varchar(25) NOT NULL,
  `NOME` varchar(255) NOT NULL,
  `QUANTIDADE` int NOT NULL,
  `VALOR` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NOME` (`NOME`),
  KEY `FK_CATEGORIA_PRODUTO` (`ID_CATEGORIA`),
  CONSTRAINT `FK_CATEGORIA_PRODUTO` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,'AMD','Ryzen 5 5700G',50,560.99),(2,1,'Intel','Processador Intel Core i5-12400F',150,1500.99),(3,3,'Kingston','SSD Kingston NV3 1TB M.2 2280 NVMe Gen4',500,2000.00),(4,1,'AMD','Ryzen 5 5700',100,749.99),(5,2,'MSI','Fonte MSI MAG A650BN, 650W, 80 Plus Bronze, PFC Ativo, Com Cabo, Preto ',200,290.00),(6,1,'Intel','Core i9-14900K Special Edition',25,4200.00),(7,2,'Corsair','Fonte RM850e 850W Full Modular 80 Plus Gold',40,780.50),(8,3,'Samsung','SSD 990 Pro 2TB NVMe M.2 Gen4',60,1150.00),(9,4,'Razer','Mouse Gamer DeathAdder V3 Pro Wireless',100,899.90),(10,5,'Alienware','Monitor Gamer Curvo 34\" QD-OLED 175Hz',15,6499.00),(11,6,'ASUS','ROG Strix GeForce RTX 4090 24GB GDDR6X',5,13500.00),(12,4,'HyperX','Headset Cloud II Wireless 7.1',80,550.00),(13,3,'Seagate','HD Externo Expansion 4TB USB 3.0',120,680.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-15 21:24:45
