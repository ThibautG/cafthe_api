const express = require("express");
const db = require("./db");
const router = express.Router();
const bcrypt = require("bcrypt");
const {hash} = require("bcrypt");


/*
* Route lister les produits
* GET /api/produits
* */
router.get("/produits", (req, res) => {
    db.query("SELECT * FROM produit", (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }
        res.json(result);
    });
});

/*
* Route : récupérer un produit par son id
* GET /api/produits/:id
* Exemple : GET /api/produits/3
* */
router.get("/produits/:id", (req, res) => {
    const { id } = req.params; // pareil que const id = req.params.id
    db.query("SELECT * FROM produit WHERE Identifiant_produit = ?", [id], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "Produit non trouvé" });
        }

        res.json(result[0]); // retournera uniquement le premier résultat
    });
});


/*
* Route : inscription d'un client
* POST /api/clients/register
* Exemple : JSON
* {
* "Nom_client" : "Dupont",
* "Prenom_client" : "Jean",
* "Date_inscription_client": "2025-02-13",
* "Mail_client" : "jean.dupont@email.com",
* "Telephone_client": "0793625147",
* "Adresse_client": "13 Rue Des Roses, Nice, 06004",
* "Mdp_client" : "monMotDePasse"
* }
* */
router.post("/clients/register", (req, res) => {
    const {Nom_client, Prenom_client, Date_inscription_client, Mail_client, Telephone_client, Adresse_client, Mdp_client} = req.body;

    // contrôler si le mail est déjà présent dans la base de données
    db.query("SELECT * FROM client WHERE Mail_client = ?", [Mail_client], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length > 0) {
            return res.status(400).json({ message: "Cet email est déjà utilisé" });
        }
    });

    // Hachage du mot de passe
    bcrypt.hash(Mdp_client, 10, (err, hash) => {
        if (err) {
            return res.status(500).json({message: "Erreur lors du hachage du mot de passe"});
        }

        // insertion du nouveau client
        db.query("INSERT INTO client (Nom_client, Prenom_client, Date_inscription_client, Mail_client, Telephone_client, Adresse_client, Mdp_client) VALUES (?,?,?,?,?,?,?)",
        [Nom_client, Prenom_client, Date_inscription_client, Mail_client, Telephone_client, Adresse_client, hash],
            (err, result) => {
                if (err) {
                    // console.log(err);
                    return res.status(500).json({message: "Erreur lors de l'inscription"});
                }

                res.status(201).json({message: "Inscription réussie", client_id: result.insertId});
            },
        );
    });
});



/*
* Route : récupérer un client par son id
* GET /api/clients/:id
* Exemple : GET /api/clients/3
* */
router.get("/clients/:id", (req, res) => {
    const { id } = req.params; // pareil que const id = req.params.id
    db.query("SELECT * FROM client WHERE Identifiant_client = ?", [id], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "Client non trouvé" });
        }

        res.json(result[0]); // retournera uniquement le premier résultat
    });
});



/*
* Route : modification d'un compte client avec son id
* PUT /api/clients/:id
* Exemple : JSON
* {
* "Nom_client" : "Dupont",
* "Prenom_client" : "Jean",
* "Date_inscription_client": "2025-02-13",
* "Mail_client" : "jean.dupont@email.com",
* "Telephone_client": "0793625147",
* "Adresse_client": "13 Rue Des Roses, Nice, 06004",
* "Mdp_client" : "monMotDePasse"
* }
* */
router.put("/clients/:id", (req, res) => {
    const id = parseInt(req.params.id);
    const { mail, tel, adresse } = req.body;

    db.query("UPDATE client SET Mail_client = ?, Telephone_client = ?, Adresse_client = ? WHERE Identifiant_client = ?", [mail, tel, adresse, id], (err, result) => {
        if (err) {
            // console.log(err);
            return res.status(500).json({message: "Erreur lors de la modification"});
        }

        res.status(201).json({message: "Modification réussie"});
        }
    );


});


/*
* Route : liste des commandes du client
* GET /api/commandes/clients/:id
* Exemple : GET /api/commandes/clients/3
* */
router.get("/commandes/clients/:id", (req, res) => {
    const { id } = req.params; // pareil que const id = req.params.id
    db.query("SELECT Identifiant_commande, Date_commande, Montant_ttc_commande FROM commande WHERE Identifiant_client = ?", [id], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "Le client n'a passé aucune commande" });
        }

        res.json(result);
    });
});


/*
* Route : liste d'une commande d'un client
* GET /api/commandes/:id
* Exemple : GET /api/commandes/3
* */
router.get("/commandes/:id", (req, res) => {
    const { id } = req.params; // pareil que const id = req.params.id
    db.query("SELECT * FROM commande WHERE Identifiant_commande = ?", [id], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "Commande non trouvée" });
        }

        res.json(result);
    });
});



/*
* Route : suppression d'un client
* POST /api/clients/delete/:id
* Exemple : POST /api/clients/delete/3
* */
router.put("/clients/delete/:id", (req, res) => {
    const { id } = req.params; // pareil que const id = req.params.id

        db.query("UPDATE client SET Nom_client = ?, Prenom_client = ?, Date_inscription_client = ?, Mail_client = ?, Telephone_client = ?, Adresse_client = ?, Mdp_client = ? WHERE Identifiant_client = ?",
            ["", "", "2000-01-01", "", "", "", "", id],
            (err, result) => {
                if (err) {
                    return res.status(500).json({message: "Erreur lors de la suppression"});
                }

                res.status(201).json({message: "Suppression réussie"});
            },
        );
});
















module.exports = router;

/* npm install bcrypt
* npm install jsonwebtoken
* */