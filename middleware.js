// le middleware vient se caler avant une route et permet de bloquer l'accès à cette route selon les users
const jwt = require("jsonwebtoken");
require("dotenv").config(); //Permet de charger les variables d'environnement
let pouet = jwt.sign({ foo: 'bar' }, process.env.JWT_SECRET);
/*
const pouet2 = jwt.sign({ foo: 'bar' }, 'shhhhh');
*/


// création du middleware
const verifyToken = (req, res, next) => {
    const token = req.headers["authorization"];
    console.log("secret : " + process.env.JWT_SECRET);
    console.log("token : " + pouet)
    /*console.log(pouet2)*/
    /*console.log(token);*/
    /*console.log(token.split(" ")[1]);*/
    /*console.log(res);*/

    if (!token) {
        return res.status(403).json({message: "Token introuvable"});
    }

    jwt.verify(token.split(" ")[1], process.env.JWT_SECRET, (err, decoded) => {
        if (err) {
            /*console.log(err);*/
            /*console.log(process.env.JWT_SECRET);*/
            /*console.log(pouet);*/
            return res.status(401).json({message: "Token invalide"});
        }

        req.client = decoded;
        next();
    });
};

module.exports = { verifyToken };