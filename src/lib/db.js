const mysql = require('mysql2/promise');

async function getConnection() {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT
  });
  await connection.connect();
  return connection;
}

async function listWomen() {
  // Crear una conexión con la bbdd

  const connection = await getConnection();

  // Lanza una query

  const [result] = await connection.query(`
  SELECT w.id AS woman_id, w.full_name, w.birth_date, w.death_date, w.bio, w.photo_url, c.name AS country, f.name AS field, a.title AS achievement_title, a.description AS achievement_description, a.year AS achievement_year FROM women w LEFT JOIN countries c ON w.country_id = c.id LEFT JOIN fields f ON w.field_id = f.id LEFT JOIN achievements a ON w.id = a.woman_id ORDER BY w.id, a.year`);
  connection.end();
  return result;
}

const obj = {
  getConnection,
  listWomen
}

module.exports = obj;