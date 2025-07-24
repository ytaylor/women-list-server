-- Nuevas mujeres influyentes (sin duplicados existentes)

INSERT INTO women (full_name, birth_date, death_date, bio, country_id, field_id, photo_url) VALUES
  ('Wangari Maathai', '1940-04-01', '2011-09-25', 'Primera mujer africana en recibir el Premio Nobel de la Paz por su activismo ambiental.', 4, 1, 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Wangari_Maathai.jpg'),
  ('Harriet Tubman', '1822-01-01', '1913-03-10', 'Activista estadounidense que ayudó a liberar esclavos mediante el Ferrocarril Subterráneo.', 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Harriet_Tubman_by_Squyer%2C_NPG.jpg'),
  ('Zadie Smith', '1975-10-25', NULL, 'Escritora británica contemporánea, conocida por sus novelas sobre identidad y raza.', 1, 2, 'https://upload.wikimedia.org/wikipedia/commons/e/e1/Zadie_Smith_2019.jpg'),
  ('Simone Biles', '1997-03-14', NULL, 'Gimnasta estadounidense, considerada una de las mejores de todos los tiempos.', 1, 3, 'https://upload.wikimedia.org/wikipedia/commons/e/e2/Simone_Biles_Rio_2016.jpg'),
  ('Leymah Gbowee', '1972-02-01', NULL, 'Activista por la paz liberiana, galardonada con el Premio Nobel de la Paz.', 5, 1, 'https://upload.wikimedia.org/wikipedia/commons/0/03/Leymah_Gbowee_2012.jpg');

-- Logros para estas nuevas mujeres

INSERT INTO achievements (woman_id, title, description, year) VALUES
  ((SELECT id FROM women WHERE full_name = 'Wangari Maathai'), 'Premio Nobel de la Paz', 'Reconocida por su lucha por el medio ambiente y los derechos humanos en África.', 2004),
  ((SELECT id FROM women WHERE full_name = 'Harriet Tubman'), 'Ferrocarril Subterráneo', 'Ayudó a liberar a cientos de esclavos mediante una red clandestina.', 1850),
  ((SELECT id FROM women WHERE full_name = 'Zadie Smith'), 'Premio Orange', 'Finalista por su novela “On Beauty”.', 2006),
  ((SELECT id FROM women WHERE full_name = 'Simone Biles'), 'Medallas Olímpicas', 'Ganadora de múltiples medallas olímpicas y mundiales en gimnasia.', 2016),
  ((SELECT id FROM women WHERE full_name = 'Leymah Gbowee'), 'Nobel de la Paz', 'Premiada por su liderazgo en el movimiento pacífico de mujeres en Liberia.', 2011);