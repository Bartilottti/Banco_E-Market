-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e_market
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (3,'Armazenamentos de disco'),(2,'Fontes'),(5,'Monitor'),(4,'Perifericos'),(6,'Placa de video'),(1,'Processadores');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('07786798002',2,'Pietro Lorenzo','PietroGames@Gmail.com','2008-07-15','Minecraft123'),('123.456.789-00',4,'Pietro Santos','pietro.santos@email.com','2001-05-14','senha123'),('12345678901',3,'Gustavo','EmailTEST2@Unijorge.com.br','2000-01-20','unijorge'),('234.567.890-11',5,'Gustavo Lima','gustavo.lima@email.com','2002-08-22','gugu2026'),('345.678.901-22',6,'Navarro Silva','navarro.silva@email.com','2000-11-03','nav12345'),('456.789.012-33',7,'Leonardo Oliveira','leonardo.prof@email.com','1985-02-17','profLeo85'),('567.890.123-44',8,'Mariana Costa','mariana.costa@email.com','2003-01-30','mari2026'),('6163512302',1,'Fernando Bartilotti','Emailtest1@unijorge.com.br','2003-02-10','123456'),('678.901.234-55',9,'Ana Beatriz','ana.bia@email.com','1999-07-11','senhaSegura!'),('789.012.345-66',10,'Carlos Eduardo','carlos.edu@email.com','2001-12-05','carlitos00'),('890.123.456-77',11,'Fernanda Souza','fernanda.s@email.com','2002-03-28','nanda123');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom`
--

/*!40000 ALTER TABLE `cupom` DISABLE KEYS */;
INSERT INTO `cupom` VALUES (1,'PRIMEIRACOMPRA','fixo',300.00,1,1);
/*!40000 ALTER TABLE `cupom` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Av Sete de setembro','Campo Grande','2025','40080001','Salvador','Bahia'),(2,'R.Gen.Labatut','Barris','1202','40080010','Salvador','Bahia'),(3,'R.Salete','Barris','288','40080010','Salvador','Bahia'),(4,'Avenida Sete de Setembro','Campo Grande','1050','40080-001','Salvador','BA'),(5,'Rua da Paciência','Rio Vermelho','230','41950-010','Salvador','BA'),(6,'Avenida Manoel Dias da Silva','Pituba','850','41830-000','Salvador','BA'),(7,'Rua das Laranjeiras','Pelourinho','12','40026-230','Salvador','BA'),(8,'Rua Conselheiro Pedro Luiz','Rio Vermelho','112','41950-610','Salvador','BA'),(9,'Avenida Oceânica','Ondina','2500','40170-010','Salvador','BA'),(10,'Rua Silveira Martins','Cabula','455','41150-000','Salvador','BA'),(11,'Avenida Tancredo Neves','Caminho das Árvores','1000','41820-020','Salvador','BA');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;

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
  `VALOR_UNITARIO` decimal(10,2) DEFAULT NULL,
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

/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,3,1,NULL),(2,1,7,1,NULL),(3,1,9,1,NULL),(4,2,10,2,NULL),(5,3,1,1,NULL),(6,3,11,1,NULL);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'6163512302',1,'pendente',3680.04,3680.04),(2,'789.012.345-66',NULL,'cancelado',12998.00,12998.00),(3,'07786798002',NULL,'pago',14060.99,14060.99);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,'AMD','Ryzen 5 5700G',50,560.99),(2,1,'Intel','Processador Intel Core i5-12400F',150,1500.99),(3,3,'Kingston','SSD Kingston NV3 1TB M.2 2280 NVMe Gen4',500,2000.00),(4,1,'AMD','Ryzen 5 5700',100,749.99),(5,2,'MSI','Fonte MSI MAG A650BN, 650W, 80 Plus Bronze, PFC Ativo, Com Cabo, Preto ',200,290.00),(6,1,'Intel','Core i9-14900K Special Edition',25,4200.00),(7,2,'Corsair','Fonte RM850e 850W Full Modular 80 Plus Gold',40,780.50),(8,3,'Samsung','SSD 990 Pro 2TB NVMe M.2 Gen4',60,1150.00),(9,4,'Razer','Mouse Gamer DeathAdder V3 Pro Wireless',100,899.90),(10,5,'Alienware','Monitor Gamer Curvo 34\" QD-OLED 175Hz',15,6499.00),(11,6,'ASUS','ROG Strix GeForce RTX 4090 24GB GDDR6X',5,13500.00),(12,4,'HyperX','Headset Cloud II Wireless 7.1',80,550.00),(13,3,'Seagate','HD Externo Expansion 4TB USB 3.0',120,680.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

--
-- Temporary view structure for view `vw_resumo_pedidos`
--

DROP TABLE IF EXISTS `vw_resumo_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vw_resumo_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_resumo_pedidos` AS SELECT 
 1 AS `NOME`,
 1 AS `ID`,
 1 AS `STATUS_PEDIDO`,
 1 AS `TOTAL_DE_ITENS_COMPRADOS`,
 1 AS `VALOR_FINAL`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'e_market'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_CALCULAR_DESCONTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CALCULAR_DESCONTO`(VALOR_TOTAL DECIMAL(10,2), ID_CUPOM INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN 
DECLARE VALOR_DESCONTO DECIMAL(10,2) DEFAULT 0.00;

SELECT VALOR INTO VALOR_DESCONTO
FROM CUPOM 
WHERE ID_CUPOM = ID AND ATIVO = 1;

RETURN VALOR_TOTAL - VALOR_DESCONTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_resumo_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_resumo_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_resumo_pedidos` AS select `c`.`NOME` AS `NOME`,`p`.`ID` AS `ID`,`p`.`STATUS_PEDIDO` AS `STATUS_PEDIDO`,sum(`ip`.`QUANTIDADE`) AS `TOTAL_DE_ITENS_COMPRADOS`,`p`.`VALOR_FINAL` AS `VALOR_FINAL` from ((`cliente` `c` join `pedido` `p` on((`c`.`CPF` = `p`.`CPF_CLIENTE`))) join `itens_pedido` `ip` on((`p`.`ID` = `ip`.`ID_PEDIDO`))) group by `p`.`ID` */;
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

-- Dump completed on 2026-05-21 15:16:48
