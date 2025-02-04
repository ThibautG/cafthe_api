/* npm install express */
/* npm install nodemon */
const express = require("express");
/* npm install cors (cross origin) */
const cors = require("cors");
/* npm install dotenv */
const db = require("./db") // Connexion à MySql
const routes = require("./endpoint") // Les routes de l'API

// On suit la doc d'express
const app = express();
app.use(express.json());
app.use(cors());

// Utilisation des routes
app.use("/api", routes);

// Démarrer le serveur
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`L'API CafThé est démarrée sur http://localhost:${PORT}`);
})