-- Base de datos limpia sin mujeres duplicadas

DROP DATABASE IF EXISTS black_women_clean_db;
CREATE DATABASE black_women_clean_db;
USE black_women_clean_db;

-- Tabla countries
CREATE TABLE countries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla fields
CREATE TABLE fields (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla women
CREATE TABLE women (
  id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(150) NOT NULL,
  birth_date DATE,
  death_date DATE,
  bio TEXT,
  country_id INT,
  field_id INT,
  photo_url VARCHAR(255),
  UNIQUE KEY (full_name, birth_date),
  FOREIGN KEY (country_id) REFERENCES countries(id),
  FOREIGN KEY (field_id) REFERENCES fields(id)
);

-- Tabla achievements
CREATE TABLE achievements (
  id INT AUTO_INCREMENT PRIMARY KEY,
  woman_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  year INT,
  FOREIGN KEY (woman_id) REFERENCES women(id)
);

-- Insertar países
INSERT INTO countries (id, name) VALUES
  (1, 'Estados Unidos'),
  (2, 'Nigeria'),
  (3, 'Brasil'),
  (4, 'Kenia'),
  (5, 'Liberia');

-- Insertar campos
INSERT INTO fields (id, name) VALUES
  (1, 'Política'),
  (2, 'Arte'),
  (3, 'Deporte');

-- Insertar mujeres únicas (sin duplicados)
INSERT INTO women (id, full_name, birth_date, death_date, bio, country_id, field_id, photo_url) VALUES
  (1, 'Angela Davis', '1944-01-26', NULL, 'Activista, filósofa y escritora estadounidense. Figura destacada en la lucha por los derechos civiles.', 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Angela_Davis_2010.jpg'),
  (2, 'Chimamanda Ngozi Adichie', '1977-09-15', NULL, 'Escritora y feminista nigeriana reconocida internacionalmente.', 2, 2, 'https://upload.wikimedia.org/wikipedia/commons/f/f5/Chimamanda_Ngozi_Adichie_2018.jpg'),
  (3, 'Serena Williams', '1981-09-26', NULL, 'Tenista estadounidense considerada una de las mejores deportistas de todos los tiempos.', 1, 3, 'https://upload.wikimedia.org/wikipedia/commons/1/19/Serena_Williams_2013_US_Open.jpg'),
  (4, 'Michelle Obama', '1964-01-17', NULL, 'Primera dama de Estados Unidos entre 2009 y 2017, abogada y defensora de derechos.', 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/e/e2/Michelle_Obama_2013_official_portrait.jpg'),
  (5, 'Marielle Franco', '1979-07-27', '2018-03-14', 'Sociáloga, feminista y activista de derechos humanos brasileña, asesinada en 2018.', 3, 1, 'https://upload.wikimedia.org/wikipedia/commons/f/f4/Marielle_Franco.jpg'),
  (6, 'Rosa Parks', '1913-02-04', '2005-10-24', 'Activista por los derechos civiles en EE.UU., conocida por su negativa a ceder el asiento en un autobús.', 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/8/81/Rosaparks.jpg'),
  (7, 'Maya Angelou', '1928-04-04', '2014-05-28', 'Poeta, escritora y activista por los derechos civiles estadounidense.', 1, 2, 'https://upload.wikimedia.org/wikipedia/commons/5/56/Maya_Angelou_2013.jpg'),
  (8, 'Lupita Nyong'o', '1983-03-01', NULL, 'Actriz keniana-mexicana ganadora del Óscar.', 4, 2, 'https://upload.wikimedia.org/wikipedia/commons/3/30/Lupita_Nyong%27o_2019.jpg'),
  (9, 'Ellen Johnson Sirleaf', '1938-10-29', NULL, 'Presidenta de Liberia y ganadora del Premio Nobel de la Paz.', 5, 1, 'https://upload.wikimedia.org/wikipedia/commons/a/a9/Ellen_Johnson-Sirleaf_2012.jpg'),
  (10, 'Oprah Winfrey', '1954-01-29', NULL, 'Presentadora, actriz y empresaria estadounidense, una de las mujeres más influyentes del mundo.', 1, 2, 'https://upload.wikimedia.org/wikipedia/commons/8/8f/Oprah_in_2014.jpg');

-- Insertar logros
INSERT INTO achievements (woman_id, title, description, year) VALUES
  (1, 'Miembro de los Panteras Negras', 'Participó activamente en los movimientos revolucionarios afroamericanos de los años 60 y 70.', 1969),
  (2, 'TED Talk viral', 'Su charla “Todos deberíamos ser feministas” ha sido vista millones de veces.', 2012),
  (3, '23 títulos de Grand Slam', 'Ha ganado más títulos individuales de Grand Slam que cualquier otra tenista en la era abierta.', 2017),
  (4, 'Campaña Let’s Move', 'Lideró una campaña nacional para combatir la obesidad infantil en EE.UU.', 2010),
  (5, 'Defensora de favelas', 'Denunció la violencia policial y las desigualdades en las favelas de Río de Janeiro.', 2016),
  (6, 'Protesta histórica en autobús', 'Se negó a ceder su asiento a un blanco en Montgomery, iniciando el boicot de autobuses.', 1955),
  (7, 'Publicación de “Yo sé por qué canta el pájaro enjaulado”', 'Su autobiografía se convirtió en un clásico de la literatura afroamericana.', 1969),
  (8, 'Oscar a Mejor Actriz de Reparto', 'Ganó el Oscar por su papel en “12 años de esclavitud”.', 2014),
  (9, 'Presidenta de Liberia', 'Primera mujer elegida democráticamente como presidenta en África.', 2005),
  (10, 'Programa “The Oprah Winfrey Show”', 'Condujo el talk show más visto de la historia de la televisión estadounidense.', 1986);