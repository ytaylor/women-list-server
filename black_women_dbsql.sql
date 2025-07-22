-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: black_women_db
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `woman_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `woman_id` (`woman_id`),
  CONSTRAINT `achievements_ibfk_1` FOREIGN KEY (`woman_id`) REFERENCES `women` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (31,21,'Miembro de los Panteras Negras','Participó activamente en los movimientos revolucionarios afroamericanos de los años 60 y 70.',1969),(32,22,'TED Talk viral','Su charla “Todos deberíamos ser feministas” ha sido vista millones de veces.',2012),(33,23,'23 títulos de Grand Slam','Ha ganado más títulos individuales de Grand Slam que cualquier otra tenista en la era abierta.',2017),(34,24,'Campaña Let’s Move','Lideró una campaña nacional para combatir la obesidad infantil en EE.UU.',2010),(35,25,'Defensora de favelas','Denunció la violencia policial y las desigualdades en las favelas de Río de Janeiro.',2016),(36,26,'Protesta histórica en autobús','Se negó a ceder su asiento a un blanco en Montgomery, iniciando el boicot de autobuses.',1955),(37,27,'Publicación de “Yo sé por qué canta el pájaro enjaulado”','Su autobiografía se convirtió en un clásico de la literatura afroamericana.',1969),(38,28,'Oscar a Mejor Actriz de Reparto','Ganó el Oscar por su papel en “12 años de esclavitud”.',2014),(39,29,'Presidenta de Liberia','Primera mujer elegida democráticamente como presidenta en África.',2005),(40,30,'Programa “The Oprah Winfrey Show”','Condujo el talk show más visto de la historia de la televisión estadounidense.',1986),(41,31,'Símbolo del feminismo afroamericano','Continúa siendo una figura de referencia en la lucha interseccional.',2020),(42,22,'Icono global','Figura clave del empoderamiento femenino afroamericano en el siglo XXI.',2016),(43,23,'Premio literario post mortem','Su obra sigue siendo estudiada en todo el mundo.',2021),(44,34,'Reconocida por el Congreso','Homenajeada en EE.UU. por su legado en derechos civiles.',1999),(45,35,'Profesora emérita','Ha dictado clases sobre justicia social en varias universidades.',2015),(46,36,'Regreso al tenis tras maternidad','Ganó importantes torneos después de ser madre.',2019),(47,37,'Filántropa reconocida','Ha donado millones para educación y salud.',2018),(48,38,'Figura de liderazgo global','Participa en campañas globales por la educación de las niñas.',2021),(49,39,'Ganadora del Premio PEN','Recibió este reconocimiento por su defensa de la libertad de expresión.',2023),(50,40,'Embajadora de ONU Mujeres','Promueve los derechos de las mujeres desde las artes.',2022);
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (3,'Brasil'),(1,'Estados Unidos'),(4,'Kenia'),(5,'Liberia'),(2,'Nigeria');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (2,'Arte'),(3,'Deporte'),(1,'Política');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `women`
--

DROP TABLE IF EXISTS `women`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `women` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `bio` text,
  `country_id` int DEFAULT NULL,
  `field_id` int DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `women_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `women_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `women`
--

LOCK TABLES `women` WRITE;
/*!40000 ALTER TABLE `women` DISABLE KEYS */;
INSERT INTO `women` VALUES (21,'Angela Davis','1944-01-26',NULL,'Activista, filósofa y escritora estadounidense. Figura destacada en la lucha por los derechos civiles.',1,1,'https://upload.wikimedia.org/wikipedia/commons/a/a2/Angela_Davis_2010.jpg'),(22,'Chimamanda Ngozi Adichie','1977-09-15',NULL,'Escritora y feminista nigeriana reconocida internacionalmente.',2,2,'https://upload.wikimedia.org/wikipedia/commons/f/f5/Chimamanda_Ngozi_Adichie_2018.jpg'),(23,'Serena Williams','1981-09-26',NULL,'Tenista estadounidense considerada una de las mejores deportistas de todos los tiempos.',1,3,'https://upload.wikimedia.org/wikipedia/commons/1/19/Serena_Williams_2013_US_Open.jpg'),(24,'Michelle Obama','1964-01-17',NULL,'Primera dama de Estados Unidos entre 2009 y 2017, abogada y defensora de derechos.',1,1,'https://upload.wikimedia.org/wikipedia/commons/e/e2/Michelle_Obama_2013_official_portrait.jpg'),(25,'Marielle Franco','1979-07-27','2018-03-14','Sociáloga, feminista y activista de derechos humanos brasileña, asesinada en 2018.',3,1,'https://upload.wikimedia.org/wikipedia/commons/f/f4/Marielle_Franco.jpg'),(26,'Rosa Parks','1913-02-04','2005-10-24','Activista por los derechos civiles en EE.UU., conocida por su negativa a ceder el asiento en un autobús.',1,1,'https://upload.wikimedia.org/wikipedia/commons/8/81/Rosaparks.jpg'),(27,'Maya Angelou','1928-04-04','2014-05-28','Poeta, escritora y activista por los derechos civiles estadounidense.',1,2,'https://upload.wikimedia.org/wikipedia/commons/5/56/Maya_Angelou_2013.jpg'),(28,'Lupita Nyong\'o','1983-03-01',NULL,'Actriz keniana-mexicana ganadora del Óscar.',4,2,'https://upload.wikimedia.org/wikipedia/commons/3/30/Lupita_Nyong%27o_2019.jpg'),(29,'Ellen Johnson Sirleaf','1938-10-29',NULL,'Presidenta de Liberia y ganadora del Premio Nobel de la Paz.',5,1,'https://upload.wikimedia.org/wikipedia/commons/a/a9/Ellen_Johnson-Sirleaf_2012.jpg'),(30,'Oprah Winfrey','1954-01-29',NULL,'Presentadora, actriz y empresaria estadounidense, una de las mujeres más influyentes del mundo.',1,2,'https://upload.wikimedia.org/wikipedia/commons/8/8f/Oprah_in_2014.jpg'),(31,'Angela Davis #1','1944-01-26',NULL,'Activista, filósofa y escritora estadounidense. Figura destacada en la lucha por los derechos civiles.',1,1,'https://upload.wikimedia.org/wikipedia/commons/a/a2/Angela_Davis_2010.jpg'),(32,'Michelle Obama #1','1964-01-17',NULL,'Primera dama de Estados Unidos entre 2009 y 2017, abogada y defensora de derechos.',1,1,'https://upload.wikimedia.org/wikipedia/commons/e/e2/Michelle_Obama_2013_official_portrait.jpg'),(33,'Maya Angelou #1','1928-04-04','2014-05-28','Poeta, escritora y activista por los derechos civiles estadounidense.',1,2,'https://upload.wikimedia.org/wikipedia/commons/5/56/Maya_Angelou_2013.jpg'),(34,'Rosa Parks #1','1913-02-04','2005-10-24','Activista por los derechos civiles en EE.UU., conocida por su negativa a ceder el asiento en un autobús.',1,1,'https://upload.wikimedia.org/wikipedia/commons/8/81/Rosaparks.jpg'),(35,'Angela Davis #2','1944-01-26',NULL,'Activista, filósofa y escritora estadounidense. Figura destacada en la lucha por los derechos civiles.',1,1,'https://upload.wikimedia.org/wikipedia/commons/a/a2/Angela_Davis_2010.jpg'),(36,'Serena Williams #1','1981-09-26',NULL,'Tenista estadounidense considerada una de las mejores deportistas de todos los tiempos.',1,3,'https://upload.wikimedia.org/wikipedia/commons/1/19/Serena_Williams_2013_US_Open.jpg'),(37,'Oprah Winfrey #1','1954-01-29',NULL,'Presentadora, actriz y empresaria estadounidense, una de las mujeres más influyentes del mundo.',1,2,'https://upload.wikimedia.org/wikipedia/commons/8/8f/Oprah_in_2014.jpg'),(38,'Michelle Obama #2','1964-01-17',NULL,'Primera dama de Estados Unidos entre 2009 y 2017, abogada y defensora de derechos.',1,1,'https://upload.wikimedia.org/wikipedia/commons/e/e2/Michelle_Obama_2013_official_portrait.jpg'),(39,'Chimamanda Ngozi Adichie #1','1977-09-15',NULL,'Escritora y feminista nigeriana reconocida internacionalmente.',2,2,'https://upload.wikimedia.org/wikipedia/commons/f/f5/Chimamanda_Ngozi_Adichie_2018.jpg'),(40,'Lupita Nyong\'o #1','1983-03-01',NULL,'Actriz keniana-mexicana ganadora del Óscar.',4,2,'https://upload.wikimedia.org/wikipedia/commons/3/30/Lupita_Nyong%27o_2019.jpg'),(41,'Angela Davis','1944-01-26',NULL,'Activista, filósofa y escritora estadounidense. Figura destacada en la lucha por los derechos civiles.',1,1,'https://upload.wikimedia.org/wikipedia/commons/a/a2/Angela_Davis_2010.jpg'),(42,'Chimamanda Ngozi Adichie','1977-09-15',NULL,'Escritora y feminista nigeriana reconocida internacionalmente.',2,2,'https://upload.wikimedia.org/wikipedia/commons/f/f5/Chimamanda_Ngozi_Adichie_2018.jpg'),(43,'Serena Williams','1981-09-26',NULL,'Tenista estadounidense considerada una de las mejores deportistas de todos los tiempos.',1,3,'https://upload.wikimedia.org/wikipedia/commons/1/19/Serena_Williams_2013_US_Open.jpg'),(44,'Michelle Obama','1964-01-17',NULL,'Primera dama de Estados Unidos entre 2009 y 2017, abogada y defensora de derechos.',1,1,'https://upload.wikimedia.org/wikipedia/commons/e/e2/Michelle_Obama_2013_official_portrait.jpg'),(45,'Marielle Franco','1979-07-27','2018-03-14','Sociáloga, feminista y activista de derechos humanos brasileña, asesinada en 2018.',3,1,'https://upload.wikimedia.org/wikipedia/commons/f/f4/Marielle_Franco.jpg'),(46,'Rosa Parks','1913-02-04','2005-10-24','Activista por los derechos civiles en EE.UU., conocida por su negativa a ceder el asiento en un autobús.',1,1,'https://upload.wikimedia.org/wikipedia/commons/8/81/Rosaparks.jpg'),(47,'Maya Angelou','1928-04-04','2014-05-28','Poeta, escritora y activista por los derechos civiles estadounidense.',1,2,'https://upload.wikimedia.org/wikipedia/commons/5/56/Maya_Angelou_2013.jpg'),(48,'Lupita Nyong\'o','1983-03-01',NULL,'Actriz keniana-mexicana ganadora del Óscar.',4,2,'https://upload.wikimedia.org/wikipedia/commons/3/30/Lupita_Nyong%27o_2019.jpg'),(49,'Ellen Johnson Sirleaf','1938-10-29',NULL,'Presidenta de Liberia y ganadora del Premio Nobel de la Paz.',5,1,'https://upload.wikimedia.org/wikipedia/commons/a/a9/Ellen_Johnson-Sirleaf_2012.jpg'),(50,'Oprah Winfrey','1954-01-29',NULL,'Presentadora, actriz y empresaria estadounidense, una de las mujeres más influyentes del mundo.',1,2,'https://upload.wikimedia.org/wikipedia/commons/8/8f/Oprah_in_2014.jpg'),(51,'Angela Davis #1','1944-01-26',NULL,'Activista, filósofa y escritora estadounidense. Figura destacada en la lucha por los derechos civiles.',1,1,'https://upload.wikimedia.org/wikipedia/commons/a/a2/Angela_Davis_2010.jpg'),(52,'Michelle Obama #1','1964-01-17',NULL,'Primera dama de Estados Unidos entre 2009 y 2017, abogada y defensora de derechos.',1,1,'https://upload.wikimedia.org/wikipedia/commons/e/e2/Michelle_Obama_2013_official_portrait.jpg'),(53,'Maya Angelou #1','1928-04-04','2014-05-28','Poeta, escritora y activista por los derechos civiles estadounidense.',1,2,'https://upload.wikimedia.org/wikipedia/commons/5/56/Maya_Angelou_2013.jpg'),(54,'Rosa Parks #1','1913-02-04','2005-10-24','Activista por los derechos civiles en EE.UU., conocida por su negativa a ceder el asiento en un autobús.',1,1,'https://upload.wikimedia.org/wikipedia/commons/8/81/Rosaparks.jpg'),(55,'Angela Davis #2','1944-01-26',NULL,'Activista, filósofa y escritora estadounidense. Figura destacada en la lucha por los derechos civiles.',1,1,'https://upload.wikimedia.org/wikipedia/commons/a/a2/Angela_Davis_2010.jpg'),(56,'Serena Williams #1','1981-09-26',NULL,'Tenista estadounidense considerada una de las mejores deportistas de todos los tiempos.',1,3,'https://upload.wikimedia.org/wikipedia/commons/1/19/Serena_Williams_2013_US_Open.jpg'),(57,'Oprah Winfrey #1','1954-01-29',NULL,'Presentadora, actriz y empresaria estadounidense, una de las mujeres más influyentes del mundo.',1,2,'https://upload.wikimedia.org/wikipedia/commons/8/8f/Oprah_in_2014.jpg'),(58,'Michelle Obama #2','1964-01-17',NULL,'Primera dama de Estados Unidos entre 2009 y 2017, abogada y defensora de derechos.',1,1,'https://upload.wikimedia.org/wikipedia/commons/e/e2/Michelle_Obama_2013_official_portrait.jpg'),(59,'Chimamanda Ngozi Adichie #1','1977-09-15',NULL,'Escritora y feminista nigeriana reconocida internacionalmente.',2,2,'https://upload.wikimedia.org/wikipedia/commons/f/f5/Chimamanda_Ngozi_Adichie_2018.jpg'),(60,'Lupita Nyong\'o #1','1983-03-01',NULL,'Actriz keniana-mexicana ganadora del Óscar.',4,2,'https://upload.wikimedia.org/wikipedia/commons/3/30/Lupita_Nyong%27o_2019.jpg');
/*!40000 ALTER TABLE `women` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-19 13:26:03
