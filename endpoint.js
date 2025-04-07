const express = require("express");
const db = require("./db");
const router = express.Router();
require("dotenv").config(); //Permet de charger les variables d'environnement
const bcrypt = require("bcrypt");
const {hash} = require("bcrypt");
/* npm install jsonwebtoken
* npm install --save-dev jest
* npm install supertest
*  */
const jwt = require("jsonwebtoken");
const {sign} = require("jsonwebtoken");
/*on appelle la fonction verifyToken depuis middleware*/
const {verifyToken} = require("./middleware.js");


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
* GET /api/produit/:id
* Exemple : GET /api/produit/3
* */
router.get("/produit/:id", (req, res) => {
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
* Route : afficher tous les cafés
* GET /api/produits/cafes
* */
router.get("/produits/cafes", (req, res) => {
    db.query("SELECT * FROM produit WHERE Identifiant_categorie = ?", [1], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "Catégorie non trouvée" });
        }

        res.json(result);
    });
});

/*
* Route : afficher tous les thés
* GET /api/produits/thes
* */
router.get("/produits/thes", (req, res) => {
    db.query("SELECT * FROM produit WHERE Identifiant_categorie = ?", [2], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "Catégorie non trouvée" });
        }

        res.json(result);
    });
});

/*
* Route : afficher tous les accessoires
* GET /api/produits/accessoires
* */
router.get("/produits/accessoires", (req, res) => {
    db.query("SELECT * FROM produit WHERE Identifiant_categorie = ?", [3], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "Catégorie non trouvée" });
        }

        res.json(result);
    });
});

/*
* Route : afficher les produits en avant
* GET /api/produits/highlighted
* */
router.get("/produits/highlighted", (re, res) => {
    db.query("SELECT * FROM produit WHERE isHighlighted = ?", [1], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        if (result.length === 0) {
            return res.status(404).json({ message: "Catégorie non trouvée" });
        }

        res.json(result);
    });
});


/*
* Route : inscription d'un client
* POST /api/register
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
router.post("/register", (req, res) => {
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
* Route : Connexion d'un client (Génération de JWT)
* POST /api/login
* Exemple : JSON
* {
* "Mail_client" : "jean.dupont@email.com",
* "Mdp_client" : "monMotDePasse"
* }
* */
router.post("/login", (req, res) => {
    const {Mail_client, Mdp_client} = req.body;

    db.query("SELECT * FROM client WHERE Mail_client = ?", [Mail_client], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }
        if (result.length === 0) return res.status(401).json({message: "Identifiant incorrect"});

        const client = result[0]; // on prend que la première ligne du tableau

        /* Vérification du mot de passe */
        bcrypt.compare(Mdp_client, client.Mdp_client, (err, isMatch) => {
            if (err) {
                return res.status(500).json({ message: "Erreur du serveur" });
            }
            if (!isMatch) return res.status(401).json({message: "Mot de passe incorrect"});

            /* si on arrive là c'est que tout s'est bien passé alors on va générer le token JWT */
            const token = sign(
                {id: client.Identifiant_client, email: client.Mail_client},
                process.env.JWT_SECRET,
                {expiresIn: process.env.JWT_EXPIRES_IN}
            );
            /*console.log(process.env.JWT_SECRET);*/

            res.json({
                message : "Connexion réussie",
                token,
                client: {
                    id: client.Identifiant_client,
                    nom: client.Nom_client,
                    prenom: client.Prenom_client,
                    email: client.Mail_client,
                    adresse: client.Adresse_client,
                    tel: client.Telephone_client
                },
            });

        });
    })
})


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
* "Mail_client" : "jean.dupont@email.com",
* "Telephone_client": "0793625147",
* "Adresse_client": "13 Rue Des Roses, Nice, 06004",
* }
* */
router.put("/clients/:id", (req, res) => {
    const id = parseInt(req.params.id);
    const { Mail_client, Telephone_client, Adresse_client } = req.body;

    db.query("UPDATE client SET Mail_client = ?, Telephone_client = ?, Adresse_client = ? WHERE Identifiant_client = ?", [Mail_client, Telephone_client, Adresse_client, id], (err, result) => {
        if (err) {
            console.log(err);
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
    db.query("SELECT * FROM commande WHERE Identifiant_client = ?", [id], (err, result) => {
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
* Route : Détails d'une commande d'un client
* GET /api/commandes/:id
* Exemple : GET /api/commandes/3
* */
router.get("/commandes/:id", (req, res) => {
    const { id } = req.params; // pareil que const id = req.params.id
    db.query("SELECT * FROM commande " +
        "JOIN ligne_commande ON commande.Identifiant_commande = ligne_commande.Identifiant_commande " +
        "JOIN produit ON ligne_commande.Identifiant_produit = produit.Identifiant_produit " +
        "WHERE commande.Identifiant_commande = ?", [id], (err, result) => {
        if (err) {
            console.log(err)
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
    const date = new Date();
    const date2 = date.toISOString();
    const date3 = date2.split('T')[0];

    db.query("UPDATE client SET Nom_client = ?, Prenom_client = ?, Date_inscription_client = ?, Mail_client = ?, Telephone_client = ?, Adresse_client = ?, Mdp_client = ? WHERE Identifiant_client = ?",
        ["DELETED", "DATE", date3, "", "", "", "", id],
        (err, result) => {
            if (err) {
                return res.status(500).json({message: "Erreur lors de la suppression"});
            }

            res.status(201).json({message: "Suppression réussie"});
        },
    );
});



/*
* Route : modification password
* POST /api/login/:id
* Exemple : JSON
* {
* "oldMdp" : "monMotDePasse",
* "newMdp": "coucouLaTeam"
* }
* */
router.put("/login/:id", (req, res) => {
    const { id } = req.params;
    const { oldMdp, newMdp } = req.body;

    db.query("SELECT Mdp_client FROM client WHERE Identifiant_client = ?", [id], (err, result) => {
        if (err) {
            return res.status(500).json({ message: "Erreur du serveur" });
        }

        // console.log(result[0].Mdp_client);
        if (result.length === 0) {
            return res.status(404).json({ message: "Password non trouvé" });
        }
        //console.log(oldMdp);
        bcrypt.compare(oldMdp, result[0].Mdp_client, (pouet, isMatch) => {
            //console.log(isMatch);
            //console.log(result[0].Mdp_client);
            //console.log(pouet);
            if (pouet) {
                //console.log(pouet);
                return res.status(500).json({ message: "Problème dans la comparaison" });
            }

            if (isMatch) {
                //console.log(isMatch);
                //console.log(newMdp);

                bcrypt.hash(newMdp, 10, (error, hash) => {
                    if (error) {
                        return res.status(500).json({message: "Erreur lors du hachage du mot de passe"});
                    }

                    // modification du nouveau mdp
                    db.query("UPDATE client SET Mdp_client = ? WHERE Identifiant_client = ?", [hash, id], (erreur, result2) => {
                        if (erreur) {
                            return res.status(500).json({message: "Erreur lors de la suppression"});
                        }
                        //console.log(result2);
                        res.status(201).json({message: "Modification de mot de passe réussie"});
                    })
                });
            }

            if (!isMatch) {
                return res.status(500).json({ message: "Le mot de passe ne correspond pas" });
            }
        });
    });
});













module.exports = router;

/* npm install bcrypt
* npm install jsonwebtoken
* */