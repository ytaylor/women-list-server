
// index.js - Proyecto Express + MySQL sin estructura MVC

const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
require('dotenv').config();


const app = express();
const PORT = 3000;

// Middleware para parsear JSON
app.use(express.json());
app.use(cors());


// Arrancar servidor
app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});


// Conexión a la base de datos usando variables de entorno
const getConnection = async () => {
  return await mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.PORT
  });
};


// GET - Obtener todas las mujeres
app.get('/api/women', async (req, res) => {
  try {
    const connection = await getConnection();
    const [rows] = await connection.query('SELECT w.id AS woman_id, w.full_name, w.birth_date, w.death_date, w.bio, w.photo_url, c.name AS country, f.name AS field, a.title AS achievement_title, a.description AS achievement_description, a.year AS achievement_year FROM women w LEFT JOIN countries c ON w.country_id = c.id LEFT JOIN fields f ON w.field_id = f.id LEFT JOIN achievements a ON w.id = a.woman_id ORDER BY w.id, a.year');
    connection.end();

    // Agrupar por mujer /**Esta manera es mas eficiente */
    /*  const womenMap = new Map();
 
     for (const row of rows) {
       if (!womenMap.has(row.woman_id)) {
         womenMap.set(row.woman_id, {
           woman_id: row.woman_id,
           full_name: row.full_name,
           birth_date: row.birth_date,
           death_date: row.death_date,
           bio: row.bio,
           photo_url: row.photo_url,
           country: row.country,
           field: row.field,
           achievements: []
         });
       }
 
       if (row.achievement_title) {
         womenMap.get(row.woman_id).achievements.push({
           title: row.achievement_title,
           description: row.achievement_description,
           year: row.achievement_year
         });
       }
     }
 
     const result = Array.from(womenMap.values()); */

    // Agrupar por mujer
    const womenMap = new Map();

    for (const row of rows) {
      if (!womenMap.has(row.woman_id)) {
        womenMap.set(row.woman_id, {
          woman_id: row.woman_id,
          full_name: row.full_name,
          birth_date: row.birth_date,
          death_date: row.death_date,
          bio: row.bio,
          photo_url: row.photo_url,
          country: row.country,
          field: row.field,
          achievements: []
        });
      }

      if (row.achievement_title) {
        womenMap.get(row.woman_id).achievements.push({
          title: row.achievement_title,
          description: row.achievement_description,
          year: row.achievement_year
        });
      }
    }

    const result = Array.from(womenMap.values());
    res.json({ success: true, women: result });

  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
});

// POST - Insertar una nueva mujer
app.post('/api/women', async (req, res) => {
  const { full_name, birth_date, death_date, bio, country_id, field_id, photo_url } = req.body;

  if (!full_name || !country_id || !field_id) {
    return res.status(400).json({ success: false, message: 'Faltan campos obligatorios' });
  }

  try {
    const connection = await getConnection();
    const query = `
      INSERT INTO women (full_name, birth_date, death_date, bio, country_id, field_id, photo_url)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `;
    const values = [full_name, birth_date, death_date, bio, country_id, field_id, photo_url];
    const [result] = await connection.query(query, values);
    connection.end();

    res.status(201).json({ success: true, message: 'Mujer insertada', id: result.insertId });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
});

