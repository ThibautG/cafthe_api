/*
// npm install mysql2
const mysql = require("mysql2");
require("dotenv").config({path: './env.test'}); //Permet de charger les variables d'environnement

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    charset: 'utf8mb4' // ✅ Corrige le problème d'encodage
});

db.connect((error) => {
    if (error) {
        console.error("❌ Erreur de connexion MySQL: ", error);
        process.exit(1);
    }

    console.log("✅ Connecté à la base MySQL");
});

module.exports = db;*/



const mysql = require("mysql2/promise"); // ✅ Utilisation de `mysql2/promise`
require("dotenv").config({ path: './env.test' });

let db; // ✅ Déclaration globale pour être accessible partout

async function connect() {
    db = await mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        charset: 'utf8mb4' // ✅ Évite le bug `cesu8`
    });

    console.log("✅ Connecté à la base MySQL");
}

async function close() {
    if (db) {
        await db.end(); // ✅ Fermeture propre de la connexion
        console.log("🔴 Connexion MySQL fermée");
    }
}

module.exports = { connect, close, db };
