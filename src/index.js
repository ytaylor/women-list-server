


const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
require('dotenv').config();
//const { getConnection, listWomen } = require('./lib/db');


const app = express();
const PORT = process.env.PORT || 4000;

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
    port: process.env.DB_PORT
  });
};


// GET - Obtener todas las mujeres
// GET - Obtener mujeres (filtrar por país con query param)
app.get('/api/women', async (req, res) => {
  try {
    const connection = await getConnection();
    const { country } = req.query;

    let query = `
      SELECT w.id AS woman_id, w.full_name, w.birth_date, w.death_date, w.bio, w.photo_url,
             c.name AS country, f.name AS field,
             a.title AS achievement_title, a.description AS achievement_description, a.year AS achievement_year
      FROM women w
      LEFT JOIN countries c ON w.country_id = c.id
      LEFT JOIN fields f ON w.field_id = f.id
      LEFT JOIN achievements a ON w.id = a.woman_id
    `;

    const values = [];

    if (country) {
      query += ' WHERE c.name = ?';
      values.push(country);
    }

    query += ' ORDER BY w.id, a.year';

    const [rows] = await connection.query(query, values);
    connection.end();

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

    res.json({ success: true, women: Array.from(womenMap.values()) });

  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
});


// POST - Insertar una nueva mujer con búsqueda o creación de country/field
app.post('/api/women', async (req, res) => {
  const { full_name, birth_date, death_date, bio, country, field, photo_url } = req.body;

  if (!full_name || !country || !field) {
    return res.status(400).json({ success: false, message: 'Faltan campos obligatorios' });
  }

  try {
    const connection = await getConnection();

    // 1. Obtener o crear el country_id
    const [countryRows] = await connection.query(
      'SELECT id FROM countries WHERE name = ?',
      [country]
    );
    let country_id;
    if (countryRows.length > 0) {
      country_id = countryRows[0].id;
    } else {
      const [countryResult] = await connection.query(
        'INSERT INTO countries (name) VALUES (?)',
        [country]
      );
      country_id = countryResult.insertId;
    }

    // 2. Obtener o crear el field_id
    const [fieldRows] = await connection.query(
      'SELECT id FROM fields WHERE name = ?',
      [field]
    );
    let field_id;
    if (fieldRows.length > 0) {
      field_id = fieldRows[0].id;
    } else {
      const [fieldResult] = await connection.query(
        'INSERT INTO fields (name) VALUES (?)',
        [field]
      );
      field_id = fieldResult.insertId;
    }

    // 3. Insertar en women
    const [result] = await connection.query(
      `
      INSERT INTO women (full_name, birth_date, death_date, bio, country_id, field_id, photo_url)
      VALUES (?, ?, ?, ?, ?, ?, ?)
      `,
      [full_name, birth_date, death_date, bio, country_id, field_id, photo_url]
    );

    connection.end();

    res.status(201).json({
      success: true,
      message: 'Mujer insertada',
      id: result.insertId
    });

  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Error del servidor' });
  }
});


