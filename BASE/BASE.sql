-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bd2cursosv2
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `percentual_desconto` double DEFAULT NULL,
  `valor_final` double DEFAULT NULL,
  `data_criacao` datetime(6),
  `forma_pagamento` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `curso_id` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compra__curso_id` (`curso_id`),
  KEY `fk_compra__usuario_id` (`usuario_id`),
  CONSTRAINT `fk_compra__curso_id` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  CONSTRAINT `fk_compra__usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,NULL,80,'2022-04-28 03:00:00.000000','BOLETO','CRIADO',1,6),(2,NULL,100,'2022-04-28 03:00:00.000000','PIX','PAGO',2,11),(3,10,90,'2022-04-28 03:00:00.000000','CARTAO_DEBITO','PAGO',3,2),(4,5,95,'2022-04-28 03:00:00.000000','CARTAO_CREDITO','PAGO',2,1),(5,NULL,450,'2022-04-29 03:00:00.000000','BOLETO','PAGO',7,1),(6,NULL,450,'2022-04-29 03:00:00.000000','CARTAO_CREDITO','PAGO',7,2),(7,NULL,450,'2022-04-29 03:00:00.000000','BOLETO','AGUARDANDO_PAGAMENTO',7,5),(8,NULL,450,'2022-04-29 03:00:00.000000','CARTAO_DEBITO','CANCELADO',7,12),(9,NULL,80,'2022-04-29 03:00:00.000000','CARTAO_CREDITO','CANCELADO',1,14);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `duracao_ch` double DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `criacao` datetime(6),
  `professor_id` bigint DEFAULT NULL,
  `aluno_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_curso__professor_id` (`professor_id`),
  KEY `fk_curso__aluno_id` (`aluno_id`),
  CONSTRAINT `fk_curso__aluno_id` FOREIGN KEY (`aluno_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_curso__professor_id` FOREIGN KEY (`professor_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Word Basico',80,'Uma descrição para Word Basico',150,'2022-04-28 04:09:00.000000',19,2),(2,'Phython Para Iniciantes',100,'Uma descrição para Phython Para Iniciantes',250,'2022-04-28 04:09:00.000000',18,5),(3,'PHP',100,'Uma descrição para PHP',250,'2022-04-28 04:09:00.000000',17,1),(7,'Redes de Computadores',700,'Uma descrição para Redes de Computadores',450,'2022-04-29 03:00:00.000000',18,7);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('00000000000001','jhipster','config/liquibase/changelog/00000000000000_initial_schema.xml','2022-04-28 03:31:16',1,'EXECUTED','8:c182bfa50da53dbf276cf5446294c2fc','createTable tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableName=jhi_user_authority; addForeignKeyConstraint baseTableName=jhi_user_authority, constraintName=fk_authority_name, ...','',NULL,'4.6.1',NULL,NULL,'1127475973'),('20220427134849-1','jhipster','config/liquibase/changelog/20220427134849_added_entity_Usuario.xml','2022-04-28 03:31:16',2,'EXECUTED','8:37fadfeb13b4f3d0f76fd841b80a9643','createTable tableName=usuario; dropDefaultValue columnName=criacao, tableName=usuario','',NULL,'4.6.1',NULL,NULL,'1127475973'),('20220427134850-1','jhipster','config/liquibase/changelog/20220427134850_added_entity_Endereco.xml','2022-04-28 03:31:16',3,'EXECUTED','8:439581a954b107c0f16f71f9102f3a6e','createTable tableName=endereco; dropDefaultValue columnName=criacao, tableName=endereco','',NULL,'4.6.1',NULL,NULL,'1127475973'),('20220427134851-1','jhipster','config/liquibase/changelog/20220427134851_added_entity_Compra.xml','2022-04-28 03:31:16',4,'EXECUTED','8:9bfc1a34b965dad1039d9792a617f70e','createTable tableName=compra; dropDefaultValue columnName=data_criacao, tableName=compra','',NULL,'4.6.1',NULL,NULL,'1127475973'),('20220427134852-1','jhipster','config/liquibase/changelog/20220427134852_added_entity_Curso.xml','2022-04-28 03:31:16',5,'EXECUTED','8:2b6e9105c0f38c021765902bf737c039','createTable tableName=curso; dropDefaultValue columnName=criacao, tableName=curso','',NULL,'4.6.1',NULL,NULL,'1127475973'),('20220427134850-2','jhipster','config/liquibase/changelog/20220427134850_added_entity_constraints_Endereco.xml','2022-04-28 03:31:16',6,'EXECUTED','8:78c4c2b33b5127ddc9a8c80d9e06a413','addForeignKeyConstraint baseTableName=endereco, constraintName=fk_endereco__usuario_id, referencedTableName=usuario','',NULL,'4.6.1',NULL,NULL,'1127475973'),('20220427134851-2','jhipster','config/liquibase/changelog/20220427134851_added_entity_constraints_Compra.xml','2022-04-28 03:31:16',7,'EXECUTED','8:14171bde5be6cf8e6fb518ef5ba4ae5f','addForeignKeyConstraint baseTableName=compra, constraintName=fk_compra__curso_id, referencedTableName=curso; addForeignKeyConstraint baseTableName=compra, constraintName=fk_compra__usuario_id, referencedTableName=usuario','',NULL,'4.6.1',NULL,NULL,'1127475973'),('20220427134852-2','jhipster','config/liquibase/changelog/20220427134852_added_entity_constraints_Curso.xml','2022-04-28 03:31:16',8,'EXECUTED','8:20cb084271ca12fdfefe0b3a96fdd237','addForeignKeyConstraint baseTableName=curso, constraintName=fk_curso__professor_id, referencedTableName=usuario; addForeignKeyConstraint baseTableName=curso, constraintName=fk_curso__aluno_id, referencedTableName=usuario','',NULL,'4.6.1',NULL,NULL,'1127475973');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cep` varchar(255) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `criacao` datetime(6),
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_endereco__usuario_id` (`usuario_id`),
  CONSTRAINT `fk_endereco__usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'68745000','Rua 21 de Abril','B','125','Castanheiras','Terra Alta','Para','2022-04-28 03:51:00.000000',1),(2,'68745300','Rua 31 de Março','A','354','Barreiras','São Joao','Paraiba','2022-04-28 03:51:00.000000',2),(3,'58963245','Va 7 de Setembro','S','5698','Juriti','Codó','Maranhão','2022-04-28 03:51:00.000000',14),(4,'96587452','TV 12 de Outubro','l','456','Getulio Vargas','Curitiba','Parana','2022-04-28 03:51:00.000000',3),(5,'69854722','PS 15 de Novembro','1','369','Folha Verde','Manaus','Amazonas','2022-04-28 03:51:00.000000',5),(11,'68742000','Rua Barão do Rio Branco','N/A','3212','Centro','Castanhal','Pará','2022-04-29 03:00:00.000000',9),(12,'68742000','Rua Comandante Francisco de Assis','B','123','Nova Olinda','Castanhal','Pará','2022-04-29 03:00:00.000000',4),(13,'68742000','Rua dos Universitarios','UFPA','1','Jaderlândia','Castanhal','Pará','2022-04-29 03:00:00.000000',6),(14,'66010-000','Rua Augusto Montenegro','N/A','98','Tenoné','Belém','Pará','2022-04-29 03:00:00.000000',7),(15,'66010-000','Rua Almirante Barroso','B','5642','Marco','Belém','Pará','2022-04-29 03:00:00.000000',8);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_authority`
--

DROP TABLE IF EXISTS `jhi_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_authority`
--

LOCK TABLES `jhi_authority` WRITE;
/*!40000 ALTER TABLE `jhi_authority` DISABLE KEYS */;
INSERT INTO `jhi_authority` VALUES ('ROLE_ADMIN'),('ROLE_USER');
/*!40000 ALTER TABLE `jhi_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user`
--

DROP TABLE IF EXISTS `jhi_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(10) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_login` (`login`),
  UNIQUE KEY `ux_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user`
--

LOCK TABLES `jhi_user` WRITE;
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` VALUES (1,'admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Administrator','Administrator','admin@localhost','',_binary '','pt-br',NULL,NULL,'system',NULL,NULL,'system',NULL),(2,'user','$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K','User','User','user@localhost','',_binary '','pt-br',NULL,NULL,'system',NULL,NULL,'system',NULL);
/*!40000 ALTER TABLE `jhi_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_user_authority`
--

DROP TABLE IF EXISTS `jhi_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jhi_user_authority` (
  `user_id` bigint NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_user_authority`
--

LOCK TABLES `jhi_user_authority` WRITE;
/*!40000 ALTER TABLE `jhi_user_authority` DISABLE KEYS */;
INSERT INTO `jhi_user_authority` VALUES (1,'ROLE_ADMIN'),(1,'ROLE_USER'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `criacao` datetime(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'YAsmim Rodrigues','21345678952','1985-02-03','ALUNO','2022-04-28 03:48:00.000000'),(2,'Aureni MARIA DA SILVA','54544874491','1988-06-19','ALUNO','2022-04-28 03:48:00.000000'),(3,'Bruno Cezar Da Silva','02436166439','2005-12-01','ALUNO','2022-04-28 03:48:00.000000'),(4,'Bruno Ricardo Marques Dutra','02314423437','2000-02-15','ALUNO','2022-04-28 03:48:00.000000'),(5,'Bruno Westmann Prado','07526066462','1982-03-05','ALUNO','2022-04-28 03:48:00.000000'),(6,'Camila Aparecida Da Silva Santos','02379285403','1979-08-13','ALUNO','2022-04-28 03:48:00.000000'),(7,'Camila Batista De Carvalho','03611363405','2003-10-10','ALUNO','2022-04-28 03:48:00.000000'),(8,'Camila Caetano Pereira','03406454402','1995-05-16','ALUNO','2022-04-28 03:48:00.000000'),(9,'Camila Calixto Moreira Dias','10712130403','1996-05-18','ALUNO','2022-04-28 03:48:00.000000'),(10,'Camila Reinaldo Bezerra','99388162404','1992-02-13','ALUNO','2022-04-28 03:48:00.000000'),(11,'Carina Kelly Da Costa Souza','06119597476','1984-02-16','ALUNO','2022-04-28 03:48:00.000000'),(12,'Carla Aparecida Da Silva Cavalheri','02791142495','1982-03-05','ALUNO','2022-04-28 03:48:00.000000'),(13,'Caroline Vieira Denani Diadema','06840062430','2007-06-16','ALUNO','2022-04-28 03:48:00.000000'),(14,'Cícera Da Silva Diadema','08024204436','1994-03-23','ALUNO','2022-04-28 03:48:00.000000'),(15,'Cíntia Pinheiro Macie','08692758442','1981-06-14','ALUNO','2022-04-28 03:48:00.000000'),(16,'Fernando Gabriel','52501982889','1981-06-14','PROFESSOR','2022-04-28 04:03:21.000000'),(17,'Aline Alves','52501982878','1987-09-30','PROFESSOR','2022-04-28 04:03:21.000000'),(18,'Ana Julia','14411159600','1978-04-15','PROFESSOR','2022-04-28 04:03:21.000000'),(19,'Manoel Ribeiro','49765843810','1985-04-21','PROFESSOR','2022-04-28 04:03:21.000000');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-29 17:17:24
