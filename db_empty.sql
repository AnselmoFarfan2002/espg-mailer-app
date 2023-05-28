-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: espg_mailer
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `admision`
--

DROP TABLE IF EXISTS `admision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admision` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(7) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admision`
--

LOCK TABLES `admision` WRITE;
/*!40000 ALTER TABLE `admision` DISABLE KEYS */;
INSERT INTO `admision` VALUES (4,'2021-I'),(5,'2021-II'),(1,'2022-I'),(2,'2022-II'),(3,'2023-I');
/*!40000 ALTER TABLE `admision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correo` (
  `PROPIETARIO` int NOT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  UNIQUE KEY `DIRECCION_UNIQUE` (`DIRECCION`),
  KEY `PROPIETARIO` (`PROPIETARIO`),
  CONSTRAINT `correo_ibfk_1` FOREIGN KEY (`PROPIETARIO`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (170,'Acústica ambiental'),(124,'Administración del conocimiento'),(43,'Administración financiera y costos educativos'),(37,'Administración gerencial'),(223,'Armonización contable internacional'),(72,'Arquitectura de computadores paralelos'),(14,'Auditoría de sistemas'),(104,'Auditoría financiera I'),(106,'Auditoría financiera II'),(108,'Auditoría gubernamental y de gestión'),(109,'Auditoría operativa'),(107,'Auditoría tributaria'),(207,'Bioestadística I'),(210,'Bioestadística II'),(214,'Bioética'),(172,'Biotecnología ambiental'),(227,'Calidad y procesos de acreditación'),(94,'Ciencia penitenciaria y criminología'),(21,'Comercio exterior y negocios internacionales'),(81,'Competitividad y desarrollo económico territorial'),(42,'Comunicación y liderazgo'),(225,'Contabilidad ambiental'),(88,'Contabilidad gerencial'),(64,'Contaminación ambiental e indicadores de sostenibilidad'),(174,'Contaminación atmosférica y lumínica'),(102,'Control interno'),(39,'Corrientes pedagógicas contemporáneas'),(182,'Corrientes y paradigmas pedagógicos contemporáneos'),(36,'Costos en salud pública'),(5,'Creatividad e innovación digital'),(55,'Creatividad e innovación educativa digital'),(22,'Derecho aduanero y tributario'),(15,'Derecho bancario y financiero'),(111,'Derecho civil I'),(112,'Derecho civil II'),(117,'Derecho civil III'),(118,'Derecho civil IV'),(113,'Derecho comercial I'),(114,'Derecho comercial II'),(115,'Derecho comercial III'),(86,'Derecho empresarial'),(98,'Derecho penal y procesal penal comparado'),(48,'Didáctica para la enseñanza virtual'),(130,'Dirección de la producción'),(12,'Dirección de operaciones y logística'),(185,'Diseño curricular en educación superior'),(47,'Diseño Curricular por competencias'),(53,'Diseño de material didáctico multimedia'),(80,'Diseño y evaluación de políticas públicas'),(65,'Diseños experimentales en medio ambiente'),(101,'Doctrina y normatividad contable'),(24,'E-business management'),(67,'Ecología y energía'),(216,'Economía en salud'),(66,'Elaboración de estudios de impacto ambiental'),(41,'Elaboración y evaluación de proyectos educativos'),(16,'Elaboración y evaluación de proyectos sectoriales'),(29,'Elaboración y evaluación de proyectos sociales'),(127,'Empresariado e innovación'),(31,'Epidemiología y estadística'),(120,'Epistemología'),(167,'Epistemología de las ciencias ambientales'),(218,'Epistemología de las ciencias contables'),(100,'Estadística aplicada a los negocios'),(171,'Estadística y diseño experimental'),(219,'Estadística y diseños experimentales'),(3,'Estrategia gerencial y desarrollo organizacional'),(217,'Evaluación de estrategias y programas de salud'),(61,'Evaluación de impacto ambiental'),(52,'Evaluación educativa'),(169,'Evaluación, gestión y conservación de recursos naturales'),(184,'Filosofía de la ciencia y tecnología'),(228,'Finanzas estratégicas internacionales'),(58,'Finanzas para proyectos'),(59,'Formulación y evaluación de proyectos'),(7,'Formulación y evaluación de proyectos ambientales'),(189,'Fundamentos axiológicos de la educación'),(79,'Fundamentos de economía para las decisiones públicas'),(181,'Fundamentos epistemológicos de la educación'),(166,'Fundamentos matemáticos para el estudio del medio ambiente'),(46,'Fundamentos teóricos para el aprendizaje online'),(1,'Gerencia de Calidad'),(34,'Gerencia de recursos humanos'),(123,'Gerencia estratégica y liderazgo'),(33,'Gerencia financiera'),(62,'Gerencia y gestión de proyectos'),(26,'Gerencia y supervisión de centros educativos'),(179,'Gestión ambiental y ordenamiento y territorial'),(20,'Gestión de programas educativos con TICS'),(75,'Gestión de proyectos de inversión'),(11,'Gestión de proyectos públicos'),(23,'Gestión de residuos urbanos e industriales'),(9,'Gestión del conocimiento'),(40,'Gestión educativa y de calidad'),(92,'Gestión financiera'),(83,'Gestión pública para resultados'),(28,'Gestión y gerencia ambiental'),(18,'Habilidades gerenciales en la gestión pública'),(73,'Habilidades gerenciales y competencias'),(50,'Herramientas para el trabajo cooperativo'),(49,'Herramientas TICS en educación'),(168,'Hidrología general'),(70,'Ingenieria de software web'),(97,'Instituciones del derecho procesal penal'),(71,'Inteligencia artificial'),(208,'Investigación científica I'),(211,'Investigación científica II'),(51,'Investigación educativa'),(187,'Las neurociencias y la educación'),(19,'Legislación ambiental nacional e internacional'),(173,'Legislación y evaluación de impacto ambiental'),(54,'Manejo de plataformas virtuales'),(220,'Marketing estratégicos internacional'),(87,'Mercadotecnia estratégica'),(30,'Metodología de la investigación científica (Proyecto de Tesis)'),(116,'Metodología de la investigación jurídica'),(56,'Métodos cuantitativos para la investigación'),(60,'Métodos de valoración y evaluación social de proyectos'),(57,'Microeconomía aplicada y política económica'),(128,'Modelamiento cuantitativo para la gestión'),(103,'Normas de auditoría'),(77,'Planeamiento estratégico de tecnologías de información'),(91,'Planeamiento estratégico y operativo'),(68,'Planificación de la gestión ambiental y desarrollo sostenible'),(89,'Política económica'),(224,'Política económica y globalización'),(45,'Política educativa'),(188,'Política y educación'),(191,'Producción intelectual y Ntic\'s'),(90,'Proyecto de inversión'),(82,'Reingeniería de procesos en instituciones públicas'),(32,'Salud ambiental'),(119,'Seminario de contratos modernos'),(110,'Seminario de desarrollo de tesis'),(206,'Seminario de epidemiología I'),(209,'Seminario de epidemiología II'),(183,'Seminario de gestión del conocimiento'),(186,'Seminario de gestión institucional educativa'),(131,'Seminario de investigación científica'),(193,'Seminario de investigación cualitativa'),(213,'Seminario de investigación cualitativa epidemiológica'),(192,'Seminario de investigación cuantitativa'),(212,'Seminario de investigación cuantitativa epidemiológica'),(35,'Seminario de investigación I'),(2,'Seminario de investigación II'),(178,'Seminario de investigación III'),(180,'Seminario de investigación IV'),(190,'Seminario de modelos de evaluación y calidad de resultados educativos'),(222,'Seminario de pequeñas y medianas empresas'),(95,'Seminario de precedentes vinculantes acuerdos plenarios y casaciones'),(105,'Seminario de proyecto de investigación'),(44,'Seminario de tesis'),(229,'Seminario de tesis doctoral I'),(230,'Seminario de tesis doctoral II'),(231,'Seminario de tesis doctoral III'),(96,'Seminario de tesis I'),(99,'Seminario de tesis II'),(194,'Seminario de tesis III'),(215,'Seminario de tesis IV'),(129,'Seminario dirección estratégica'),(78,'Sistema de planeamiento del sector público'),(85,'Sistema nacional de contrataciones del estado'),(25,'Sistema nacional de control y control de gestión'),(10,'Sistema nacional de recursos humanos'),(84,'Sistema nacional del presupuesto público'),(8,'Sistemas de gestión y auditoría ambiental'),(74,'Sistemas de seguridad, derecho informático y gobierno electrónico'),(6,'Taller de proyectos sectoriales I (educación, salud y agricultura)'),(17,'Taller de proyectos sectoriales II (saneamiento, transporte y electrificación)'),(226,'Tecnología de los negocios virtuales'),(125,'Teoría de administración financiera'),(13,'Teoría de la prueba en el proceso penal'),(221,'Teoría de las organizaciones empresariales'),(126,'Teoría de marketing estratégico'),(93,'Teoría del delito y política criminal'),(122,'Teoría organizacional'),(4,'Teoría y diseño curricular'),(121,'Teorías administrativas y sus enfoques'),(38,'Teorías de la educación'),(27,'Tesis I'),(63,'Tesis II'),(176,'Toxícología ambiental'),(175,'Tratamiento y gestión de aguas residuales'),(177,'Tratamiento y gestión de residuos sólidos'),(132,'Tutoría de tesis I'),(133,'Tutoría de tesis II');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_aperturado`
--

DROP TABLE IF EXISTS `curso_aperturado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_aperturado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SECCION` int NOT NULL,
  `MALLA_CURRICULAR` int unsigned NOT NULL DEFAULT '1',
  `DOCENTE` int NOT NULL,
  `FECHA_INICIO` date DEFAULT NULL COMMENT 'FECHA DE INICIO DEL CURSO',
  `FECHA_FIN` date DEFAULT NULL COMMENT 'FECHA DE FINALIZACION DEL CURSO',
  PRIMARY KEY (`ID`),
  KEY `DOCENTE` (`DOCENTE`),
  KEY `curso_aperturado_ibfk_1_idx` (`SECCION`),
  KEY `CURSO_` (`MALLA_CURRICULAR`),
  CONSTRAINT `curso_aperturado_ibfk_1` FOREIGN KEY (`SECCION`) REFERENCES `seccion` (`ID`),
  CONSTRAINT `curso_aperturado_ibfk_3` FOREIGN KEY (`DOCENTE`) REFERENCES `persona` (`ID`),
  CONSTRAINT `curso_aperturado_ibfk_4` FOREIGN KEY (`MALLA_CURRICULAR`) REFERENCES `malla_curricular` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_aperturado`
--

LOCK TABLES `curso_aperturado` WRITE;
/*!40000 ALTER TABLE `curso_aperturado` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_aperturado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `PERSONA` int NOT NULL,
  `CODIGO` varchar(8) NOT NULL,
  KEY `persona_idx` (`PERSONA`),
  CONSTRAINT `doc_persona` FOREIGN KEY (`PERSONA`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `PERSONA` int NOT NULL,
  `CODIGO` varchar(12) NOT NULL,
  KEY `persona` (`PERSONA`),
  CONSTRAINT `persona` FOREIGN KEY (`PERSONA`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malla_curricular`
--

DROP TABLE IF EXISTS `malla_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `malla_curricular` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `PROGRAMA` int NOT NULL,
  `CURSO` int NOT NULL,
  `SEMESTRE` varchar(4) NOT NULL DEFAULT 'I',
  PRIMARY KEY (`ID`),
  KEY `PROGRAMA` (`PROGRAMA`),
  KEY `CURSO` (`CURSO`),
  CONSTRAINT `malla_curricular_ibfk_1` FOREIGN KEY (`PROGRAMA`) REFERENCES `programa` (`ID`),
  CONSTRAINT `malla_curricular_ibfk_2` FOREIGN KEY (`CURSO`) REFERENCES `curso` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malla_curricular`
--

LOCK TABLES `malla_curricular` WRITE;
/*!40000 ALTER TABLE `malla_curricular` DISABLE KEYS */;
INSERT INTO `malla_curricular` VALUES (1,1,31,'I'),(2,1,32,'I'),(3,1,33,'I'),(4,1,34,'I'),(5,1,35,'I'),(6,1,36,'II'),(7,1,1,'II'),(8,1,3,'II'),(9,1,29,'II'),(10,1,2,'II'),(11,2,37,'I'),(12,2,38,'I'),(13,2,39,'I'),(14,2,40,'I'),(15,2,26,'I'),(16,2,41,'I'),(17,2,30,'II'),(18,2,42,'II'),(19,2,4,'II'),(20,2,43,'II'),(21,2,44,'II'),(22,2,45,'II'),(23,3,46,'I'),(24,3,47,'I'),(25,3,48,'I'),(26,3,49,'I'),(27,3,50,'I'),(28,3,51,'I'),(29,3,52,'II'),(30,3,53,'II'),(31,3,20,'II'),(32,3,54,'II'),(33,3,55,'II'),(34,3,56,'II'),(35,4,57,'I'),(36,4,58,'I'),(37,4,59,'I'),(38,4,60,'I'),(39,4,27,'I'),(40,4,61,'II'),(41,4,6,'II'),(42,4,17,'II'),(43,4,62,'II'),(44,4,63,'II'),(45,5,64,'I'),(46,5,65,'I'),(47,5,66,'I'),(48,5,67,'I'),(49,5,19,'I'),(50,5,27,'I'),(51,5,68,'II'),(52,5,7,'II'),(53,5,8,'II'),(54,5,23,'II'),(55,5,28,'II'),(56,5,63,'II'),(57,6,70,'I'),(58,6,71,'I'),(59,6,72,'I'),(60,6,73,'I'),(61,6,74,'I'),(62,6,27,'I'),(63,6,75,'II'),(64,6,9,'II'),(65,6,24,'II'),(66,6,77,'II'),(67,6,14,'II'),(68,6,63,'II'),(69,7,78,'I'),(70,7,79,'I'),(71,7,80,'I'),(72,7,81,'I'),(73,7,82,'I'),(74,7,83,'I'),(75,7,30,'I'),(76,7,11,'II'),(77,7,84,'II'),(78,7,10,'II'),(79,7,85,'II'),(80,7,25,'II'),(81,7,18,'II'),(82,7,44,'II'),(95,8,73,'I'),(96,8,86,'I'),(97,8,87,'I'),(98,8,88,'I'),(99,8,89,'I'),(100,8,30,'I'),(101,8,90,'II'),(102,8,91,'II'),(103,8,12,'II'),(104,8,21,'II'),(105,8,92,'II'),(106,8,44,'II'),(115,9,93,'I'),(116,9,94,'I'),(117,9,95,'I'),(118,9,96,'I'),(119,9,97,'II'),(120,9,13,'II'),(121,9,98,'II'),(122,9,99,'II'),(123,10,100,'I'),(124,10,101,'I'),(125,10,102,'I'),(126,10,103,'I'),(127,10,104,'I'),(128,10,105,'I'),(129,10,106,'II'),(130,10,107,'II'),(131,10,14,'II'),(132,10,108,'II'),(133,10,109,'II'),(134,10,110,'II'),(147,11,111,'I'),(148,11,112,'I'),(149,11,113,'I'),(150,11,114,'I'),(151,11,115,'I'),(152,11,116,'I'),(153,11,117,'II'),(154,11,118,'II'),(155,11,15,'II'),(156,11,22,'II'),(157,11,119,'II'),(158,11,44,'II'),(170,12,120,'I'),(171,12,121,'I'),(172,12,122,'I'),(173,12,123,'II'),(174,12,124,'II'),(175,12,125,'II'),(176,12,126,'III'),(177,12,127,'III'),(178,12,128,'III'),(179,12,129,'IV'),(180,12,130,'IV'),(181,12,131,'IV'),(182,12,132,'V'),(183,12,133,'VI'),(184,13,166,'I'),(185,13,167,'I'),(186,13,168,'I'),(187,13,169,'II'),(188,13,170,'II'),(189,13,171,'II'),(190,13,172,'III'),(191,13,173,'III'),(192,13,35,'III'),(193,13,174,'IV'),(194,13,175,'IV'),(195,13,2,'IV'),(196,13,176,'V'),(197,13,177,'V'),(198,13,178,'V'),(199,13,179,'VI'),(200,13,180,'VI'),(201,14,181,'I'),(202,14,182,'I'),(203,14,183,'I'),(204,14,184,'II'),(205,14,185,'II'),(206,14,186,'II'),(207,14,187,'III'),(208,14,188,'III'),(209,14,96,'III'),(210,14,189,'IV'),(211,14,190,'IV'),(212,14,99,'IV'),(213,14,191,'V'),(214,14,192,'V'),(215,14,193,'VI'),(216,14,194,'VI'),(217,15,206,'I'),(218,15,207,'I'),(219,15,208,'I'),(220,15,209,'II'),(221,15,210,'II'),(222,15,211,'II'),(223,15,212,'III'),(224,15,96,'III'),(225,15,213,'IV'),(226,15,99,'IV'),(227,15,216,'V'),(228,15,217,'V'),(229,15,194,'V'),(230,15,214,'VI'),(231,15,215,'VI'),(232,16,218,'I'),(233,16,219,'I'),(234,16,220,'I'),(235,16,221,'II'),(236,16,222,'II'),(237,16,223,'II'),(238,16,224,'III'),(239,16,225,'III'),(240,16,226,'III'),(241,16,227,'IV'),(242,16,228,'IV'),(243,16,229,'V'),(244,16,230,'V'),(245,16,231,'VI');
/*!40000 ALTER TABLE `malla_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ESTUDIANTE` int NOT NULL,
  `CURSO_AP` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ESTUDIANTE` (`ESTUDIANTE`),
  KEY `CURSO_AP` (`CURSO_AP`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`ESTUDIANTE`) REFERENCES `persona` (`ID`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`CURSO_AP`) REFERENCES `curso_aperturado` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `TIPO` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` VALUES (1,'Salud Pública',0),(2,'Gerencia y administración de la educación',0),(3,'Tecnología Educativa',0),(4,'Proyectos de Inversión',0),(5,'Ciencias con Mención en Gestión Ambiental y Desarrollo Sostenible',0),(6,'Ingeniería De Sistemas e Informática - Administración de Tecnologías de Información',0),(7,'Gerencia Pública',0),(8,'Gestión Empresarial',0),(9,'Derecho con Mención en Derecho Penal y Procesal Penal',0),(10,'Ciencias con Mención en Contabilidad: Auditoría',0),(11,'Derecho Civil y Comercial',0),(12,'Administración',1),(13,'Ciencias Ambientales',1),(14,'Ciencias de la Educación',1),(15,'Epidemiología',1),(16,'Ciencias Contables y Financieras',1);
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa_aperturado`
--

DROP TABLE IF EXISTS `programa_aperturado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa_aperturado` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ADMISION` int NOT NULL,
  `PROGRAMA` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ADMISION` (`ADMISION`),
  KEY `PROGRAMA` (`PROGRAMA`),
  CONSTRAINT `programa_aperturado_ibfk_1` FOREIGN KEY (`ADMISION`) REFERENCES `admision` (`ID`),
  CONSTRAINT `programa_aperturado_ibfk_2` FOREIGN KEY (`PROGRAMA`) REFERENCES `programa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa_aperturado`
--

LOCK TABLES `programa_aperturado` WRITE;
/*!40000 ALTER TABLE `programa_aperturado` DISABLE KEYS */;
/*!40000 ALTER TABLE `programa_aperturado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seccion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROGRAMA_AP` int NOT NULL,
  `NOMBRE` char(1) NOT NULL,
  `CORREO` varchar(50) NOT NULL,
  `CONTRASENIA` varchar(15) NOT NULL,
  `AULA` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `seccion_ibfk_1_idx` (`PROGRAMA_AP`),
  CONSTRAINT `seccion_ibfk_1` FOREIGN KEY (`PROGRAMA_AP`) REFERENCES `programa_aperturado` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'espg_mailer'
--

--
-- Dumping routines for database 'espg_mailer'
--
/*!50003 DROP FUNCTION IF EXISTS `aperturarCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `aperturarCurso`(idMalla int, idSeccion int, idDocente int, inicio date, fin date) RETURNS tinyint
begin
	IF( SELECT COUNT(ID) FROM CURSO_APERTURADO WHERE MALLA_CURRICULAR = idMalla and SECCION = idSeccion) = 0 then
		INSERT INTO CURSO_APERTURADO(SECCION, MALLA_CURRICULAR, DOCENTE, FECHA_INICIO, FECHA_FIN) 
        VALUES(idSeccion, idMalla, idDocente, inicio, fin);
        return 1;
    else
		return 0;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `aperturarPrograma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `aperturarPrograma`(programa_ int, admision_ int) RETURNS tinyint
begin
	IF( SELECT COUNT(ID) FROM PROGRAMA_APERTURADO WHERE PROGRAMA = programa_ AND ADMISION = admision_ ) = 0 then
		INSERT INTO PROGRAMA_APERTURADO (ADMISION, PROGRAMA) 
        VALUES (admision_, programa_);
        return (SELECT MAX(ID) FROM PROGRAMA_APERTURADO);
    else 
		return 0;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `aperturarSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `aperturarSeccion`(programa int, nombre char, correo varchar(50), contrasenia varchar(15), aula varchar(40)) RETURNS tinyint
begin
	IF( SELECT COUNT(ID) FROM SECCION S WHERE S.PROGRAMA_AP = programa AND S.NOMBRE = nombre ) = 0 then
		INSERT INTO SECCION (PROGRAMA_AP, NOMBRE, CORREO, CONTRASENIA, AULA) 
        VALUES (programa, nombre, correo, contrasenia, aula);
        return (SELECT MAX(ID) FROM SECCION);
    else 
		return 0;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `existeCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `existeCurso`(idCurso int) RETURNS tinyint
begin
	return (SELECT COUNT(ID) FROM CURSO WHERE ID = idCurso);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `existePersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `existePersona`(idPersona int) RETURNS tinyint
begin
	return (SELECT COUNT(ID) FROM PERSONA WHERE ID = idPersona);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fechaLatam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `fechaLatam`(fecha date) RETURNS varchar(10) CHARSET utf8mb4
begin
	return CONCAT_WS('-', 
		CASE WHEN LENGTH(DAY(fecha)) < 2 THEN CONCAT('0', DAY(fecha)) ELSE DAY(fecha) END,
		CASE WHEN LENGTH(MONTH(fecha)) < 2 THEN CONCAT('0', MONTH(fecha)) ELSE MONTH(fecha) END,
        YEAR(fecha));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `listarEstudiantePorCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `listarEstudiantePorCodigo`( _codigo varchar(12) ) RETURNS int
begin
	IF (SELECT COUNT(PERSONA) FROM ESTUDIANTE WHERE CODIGO = _codigo) = 0 THEN
		RETURN 0;
	ELSE 
		RETURN (SELECT PERSONA FROM ESTUDIANTE WHERE CODIGO = _codigo);
	END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `matricularPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `matricularPersona`(idPersona int, idCurso int) RETURNS tinyint
begin
	IF ( SELECT COUNT(ID) FROM MATRICULA WHERE ESTUDIANTE = idPersona AND CURSO_AP = idCurso ) = 0 then
		INSERT INTO MATRICULA (ESTUDIANTE, CURSO_AP) VALUES (idPersona, idCurso);
        return 1;
    else 
		return 0;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `registrarDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `registrarDocente`( codigo_ varchar(8), nombre_ varchar(100), correos_ varchar(100) ) RETURNS int
begin
	IF (SELECT COUNT(PERSONA) FROM DOCENTE WHERE CODIGO = codigo_) >= 1 THEN 
		RETURN 0;
	elseif (SELECT COUNT(PROPIETARIO) FROM CORREO WHERE DIRECCION = correos_) >= 1 THEN 
		set @_id = (SELECT PROPIETARIO FROM CORREO WHERE DIRECCION = correos_);
	else
		insert into PERSONA (NOMBRE) VALUES (nombre_);
        set @_id = (select max(ID) from persona);
        insert into CORREO VALUES (@_id, correos_);
	END IF; 
		
	insert into DOCENTE VALUES (@_id, codigo_);
       
    RETURN 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `registrarEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `registrarEstudiante`( codigo_ varchar(12), nombre_ varchar(100), correos_ varchar(100) ) RETURNS int
begin
	IF (SELECT COUNT(PERSONA) FROM ESTUDIANTE WHERE CODIGO = codigo_) >= 1 THEN 
		RETURN 0;
	elseif (SELECT COUNT(PROPIETARIO) FROM CORREO WHERE DIRECCION = correos_) >= 1 THEN 
		set @_id = (SELECT PROPIETARIO FROM CORREO WHERE DIRECCION = correos_);
	else
		insert into PERSONA (NOMBRE) VALUES (nombre_);
        set @_id = (select max(ID) from persona);
        insert into CORREO VALUES (@_id, correos_);
	END IF;
		
	insert into ESTUDIANTE VALUES (@_id, codigo_);
       
    RETURN 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editarCursoDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `editarCursoDocente`(_id int, idDocente int)
BEGIN
	UPDATE CURSO_APERTURADO SET DOCENTE = idDocente WHERE ID = _id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editarCursoFechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `editarCursoFechas`(_id int, _inicio date, _fin date)
BEGIN
	UPDATE CURSO_APERTURADO SET FECHA_INICIO = _inicio, FECHA_FIN = _fin WHERE ID = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editarSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `editarSeccion`(_id int, _nombre char, _correo varchar(50), _contrasenia varchar(15), _aula varchar(40))
BEGIN
	UPDATE SECCION SET NOMBRE = _nombre, CORREO = _correo, CONTRASENIA = _contrasenia, AULA = _aula WHERE ID = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtrarCursoPorFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `filtrarCursoPorFecha`(inicio date, fin date)
begin
	SELECT 
		CA.ID AS id, 
        DOCENTE AS idDocente,
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, 
        PR.NOMBRE AS programa, 
        A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, 
        C.NOMBRE AS curso, 
        S.NOMBRE as seccion, 
        P.NOMBRE AS docente,
        CA.FECHA_INICIO AS inicio, 
        CA.FECHA_FIN AS fin,
        S.AULA AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA 
    INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.MALLA_CURRICULAR
    INNER JOIN PERSONA P ON CA.DOCENTE = P.ID
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID
    WHERE FECHA_FIN >= inicio
	ORDER BY A.NOMBRE;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtrarCursosPorInicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `filtrarCursosPorInicio`(inicio varchar(10))
begin
	SELECT DISTINCT 
		CA.ID AS id, DOCENTE AS idDocente,
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, PR.NOMBRE AS programa, A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, C.NOMBRE AS curso, 
        S.NOMBRE as seccion, fechaLatam(FECHA_INICIO) as inicio, fechaLatam(FECHA_FIN) as fin,
        CASE WHEN LENGTH(S.AULA) < 4 THEN S.AULA ELSE  CONCAT('https://meet.google.com/', S.AULA) END AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.CURSO
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID
    WHERE fechaLatam(FECHA_INICIO) LIKE inicio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtrarDocentesPorNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `filtrarDocentesPorNombre`(nameTarget varchar(100))
begin
	SELECT ID as id, NOMBRE as nombre, CODIGO as codigo FROM PERSONA INNER JOIN DOCENTE ON PERSONA.ID = DOCENTE.PERSONA WHERE NOMBRE like CONCAT('%', nameTarget, '%') order by NOMBRE limit 15;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtrarPersonasPorNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `filtrarPersonasPorNombre`(nameTarget varchar(100))
begin
	SELECT ID as id, NOMBRE as nombre FROM PERSONA WHERE NOMBRE like CONCAT('%', nameTarget, '%') order by NOMBRE limit 15;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarAdmision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarAdmision`()
begin
	SELECT ID as id, NOMBRE as nombre from ADMISION;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarCursoDictado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarCursoDictado`(idCurso int)
begin 
	SELECT DISTINCT 
		CA.ID AS id, DOCENTE AS idDocente, P.NOMBRE as docente,
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, PR.NOMBRE AS programa, A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, C.NOMBRE AS curso, 
        S.NOMBRE as seccion, fechaLatam(FECHA_INICIO) as inicio, fechaLatam(FECHA_FIN) as fin,
        S.AULA AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.MALLA_CURRICULAR
    INNER JOIN PERSONA P ON P.ID = CA.DOCENTE
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID
    WHERE CA.ID = idCurso;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarCursos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarCursos`()
begin
	SELECT ID as id, NOMBRE as nombre FROM CURSO;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarCursosDictados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarCursosDictados`()
begin
	SELECT DISTINCT 
		CA.ID AS id, DOCENTE AS idDocente,
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, PR.NOMBRE AS programa, A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, C.NOMBRE AS curso, 
        S.NOMBRE as seccion, fechaLatam(FECHA_INICIO) as inicio, fechaLatam(FECHA_FIN) as fin,
        S.AULA AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.MALLA_CURRICULAR
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarCursosDictadosEn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarCursosDictadosEn`(idPrograma int)
begin
	SELECT DISTINCT 
		CA.ID AS id, DOCENTE AS idDocente, 
        CASE WHEN PR.TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END AS tipo, PR.NOMBRE AS programa, A.NOMBRE AS admision, 
        MC.SEMESTRE as semestre, C.NOMBRE AS curso, 
        S.NOMBRE as seccion, fechaLatam(FECHA_INICIO) as inicio, fechaLatam(FECHA_FIN) as fin,
        S.AULA AS aula, 
        S.CORREO AS correo, S.CONTRASENIA as contrasenia
	FROM CURSO_APERTURADO CA INNER JOIN MALLA_CURRICULAR MC ON MC.ID = CA.MALLA_CURRICULAR
    INNER JOIN CURSO C ON C.ID = MC.CURSO 
    INNER JOIN SECCION S ON CA.SECCION = S.ID
    INNER JOIN PROGRAMA_APERTURADO PA  ON S.PROGRAMA_AP = PA.ID 
    INNER JOIN PROGRAMA PR ON PA.PROGRAMA = PR.ID 
    INNER JOIN ADMISION A ON PA.ADMISION = A.ID
    WHERE S.PROGRAMA_AP = idPrograma
    ORDER BY S.NOMBRE, MC.SEMESTRE;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarMallaCurricularDe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarMallaCurricularDe`(idPrograma int)
BEGIN
	SELECT MC.ID as id, CURSO.NOMBRE as curso, MC.SEMESTRE AS semestre from CURSO INNER JOIN MALLA_CURRICULAR MC ON MC.CURSO = CURSO.ID WHERE MC.PROGRAMA = idPrograma order by MC.ID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarMatriculados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarMatriculados`( idCurso int )
begin
	SELECT P.ID as id, NOMBRE as nombre, E.CODIGO as codigo 
    FROM PERSONA P 
    INNER JOIN ESTUDIANTE E ON E.PERSONA = P.ID
    INNER JOIN MATRICULA M ON E.PERSONA = M.ESTUDIANTE
    WHERE M.CURSO_AP = idCurso;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarPersona`( idPersona int )
begin
	IF( SELECT COUNT(PERSONA) FROM ESTUDIANTE WHERE PERSONA = idPersona ) > 0 THEN
		SELECT ID as id, NOMBRE as nombre, CODIGO as codigo FROM PERSONA INNER JOIN ESTUDIANTE ON PERSONA.ID = ESTUDIANTE.PERSONA WHERE ID = idPersona;
	ELSEIF( SELECT COUNT(PERSONA) FROM DOCENTE WHERE PERSONA = idPersona ) > 0 THEN
		SELECT ID as id, NOMBRE as nombre, CODIGO as codigo FROM PERSONA INNER JOIN DOCENTE ON PERSONA.ID = DOCENTE.PERSONA WHERE ID = idPersona;
	ELSE 
		SELECT ID as id, NOMBRE as nombre FROM PERSONA WHERE ID = idPersona;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarProgramaAperturado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarProgramaAperturado`(idPrograma int)
begin
	SELECT PA.ID as id, CASE WHEN TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END as tipo, P.NOMBRE as nombre, A.NOMBRE as admision
    FROM PROGRAMA_APERTURADO PA INNER JOIN PROGRAMA P ON PA.PROGRAMA = P.ID INNER JOIN ADMISION A ON PA.ADMISION = A.ID WHERE PA.ID = idPrograma;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarProgramas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarProgramas`()
begin
	SELECT ID as id, CASE WHEN TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END as tipo, NOMBRE as nombre FROM PROGRAMA;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarProgramasAperturados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarProgramasAperturados`()
begin
	SELECT PA.ID as id, CASE WHEN TIPO = 0 THEN 'Maestría' ELSE 'Doctorado' END as tipo, P.NOMBRE as nombre, A.NOMBRE as admision
    FROM PROGRAMA_APERTURADO PA INNER JOIN PROGRAMA P ON PA.PROGRAMA = P.ID INNER JOIN ADMISION A ON PA.ADMISION = A.ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarSeccionesDe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `listarSeccionesDe`(idPrograma int)
BEGIN
	SELECT ID as id, NOMBRE as nombre, AULA as aula,  CORREO as correo, CONTRASENIA as contrasenia
    FROM SECCION WHERE PROGRAMA_AP = idPrograma ORDER BY NOMBRE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerCorreoDe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `obtenerCorreoDe`(id int)
begin
	SELECT C.DIRECCION FROM CORREO C WHERE C.PROPIETARIO = id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `registrarCorreo`(idPersona int, nuevoCorreo varchar(100))
begin
	INSERT INTO CORREO VALUES (idPersona, nuevoCorreo);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-27 19:11:49
