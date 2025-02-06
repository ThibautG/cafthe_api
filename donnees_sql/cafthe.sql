-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 06 fév. 2025 à 08:15
-- Version du serveur : 8.0.30
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cafthe`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `Identifiant_categorie` int NOT NULL,
  `Type_categorie` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Taux_tva` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`Identifiant_categorie`, `Type_categorie`, `Taux_tva`) VALUES
(1, 'Café', 5.50),
(2, 'Thé', 5.50),
(3, 'Accessoires', 20.00);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Identifiant_client` int NOT NULL,
  `Nom_client` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Prenom_client` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Date_inscription_client` date NOT NULL,
  `Mail_client` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Telephone_client` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Adresse_client` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Mdp_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Identifiant_client`, `Nom_client`, `Prenom_client`, `Date_inscription_client`, `Mail_client`, `Telephone_client`, `Adresse_client`, `Mdp_client`) VALUES
(1, 'Petit', 'Jean', '2023-11-16', 'jean.petit@email.com', '0667890123', '12 Rue des Fleurs, Paris, 75001', 'G3m5Hq7rS2'),
(2, 'Dubois', 'Alice', '2025-01-05', 'alice.dubois@email.com', '0678901234', '45 Avenue du Parc, Lyon, 69002', 'H7n9Jt3sK6'),
(3, 'Bernard', 'Thomas', '2024-08-17', 'thomas.bernard@email.com', '0689012345', '78 Rue de la Paix, Marseille, 13003', 'J2p4Kw6uL9'),
(4, 'Girard', 'Camille', '2024-09-21', 'camille.girard@email.com', '0690123456', '23 Boulevard Saint-Michel, Toulouse, 31000', 'K6r8Lx9wM3'),
(5, 'Laurent', 'Mathieu', '2024-01-20', 'mathieu.laurent@email.com', '0701234567', '56 Rue des Roses, Nice, 06004', 'L9t2Mx5yN7'),
(6, 'Michel', 'Léa', '2024-10-23', 'lea.michel@email.com', '0712345678', '89 Rue de la République, Bordeaux, 33000', 'M3v6Ny8zP4'),
(7, 'Lefebvre', 'Hugo', '2024-06-13', 'hugo.lefebvre@email.com', '0723456789', '34 Rue des Lilas, Lille, 59000', 'N7w9Pz2qR6'),
(8, 'Garcia', 'Clara', '2024-01-27', 'clara.garcia@email.com', '0734567890', '67 Avenue des Champs, Strasbourg, 67000', 'P2x5Qw7rS9'),
(9, 'Rodriguez', 'Nathan', '2024-12-07', 'nathan.rodriguez@email.com', '0745678901', '10 Rue du Centre, Montpellier, 34000', 'Q6y8Rx3sT2'),
(10, 'Muller', 'Chloé', '2024-11-23', 'chloe.muller@email.com', '0756789012', '42 Boulevard du Nord, Nantes, 44000', 'R9z4St6uV5'),
(11, 'Dupont', 'Jean', '2025-02-13', 'jean.dupont@email.com', '0793625147', '13 Rue Des Roses, Nice, 06004', '$2b$10$oN9iW7lGx3opcYN0MHiV8u.lIhAlfCumBstuK0FYJXcmK.l3abmkO');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `Identifiant_commande` int NOT NULL,
  `Date_commande` date NOT NULL,
  `Type_commande` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Statut_commande` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Adresse_livraison_commande` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Montant_ht_commande` decimal(15,2) NOT NULL,
  `Montant_tva_commande` decimal(15,2) NOT NULL,
  `Montant_ttc_commande` decimal(15,2) NOT NULL,
  `Identifiant_vendeur` int NOT NULL,
  `Identifiant_client` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Identifiant_commande`, `Date_commande`, `Type_commande`, `Statut_commande`, `Adresse_livraison_commande`, `Montant_ht_commande`, `Montant_tva_commande`, `Montant_ttc_commande`, `Identifiant_vendeur`, `Identifiant_client`) VALUES
(1, '2024-05-15', 'en ligne', 'livrée', '12 Rue des Fleurs, Paris, 75001', 100.50, 15.50, 116.00, 2, 1),
(2, '2024-05-16', 'en magasin', 'expédiée', '45 Avenue du Parc, Lyon, 69002', 150.75, 22.75, 173.50, 3, 2),
(3, '2024-05-17', 'en ligne', 'en préparation', '78 Rue de la Paix, Marseille, 13003', 200.00, 30.50, 230.50, 4, 3),
(4, '2024-05-18', 'en magasin', 'livrée', '23 Boulevard Saint-Michel, Toulouse, 31000', 75.25, 11.50, 86.75, 5, 4),
(5, '2024-05-19', 'en ligne', 'expédiée', '56 Rue des Roses, Nice, 06004', 180.50, 27.50, 208.00, 2, 5),
(6, '2024-05-20', 'en magasin', 'livrée', '89 Rue de la République, Bordeaux, 33000', 120.75, 18.50, 139.25, 3, 6),
(7, '2024-05-21', 'en ligne', 'en préparation', '34 Rue des Lilas, Lille, 59000', 95.50, 14.50, 110.00, 4, 7),
(8, '2024-05-22', 'en magasin', 'expédiée', '67 Avenue des Champs, Strasbourg, 67000', 250.00, 38.00, 288.00, 5, 8),
(9, '2024-05-23', 'en ligne', 'livrée', '10 Rue du Centre, Montpellier, 34000', 175.25, 26.75, 202.00, 2, 9),
(10, '2024-05-24', 'en magasin', 'en préparation', '42 Boulevard du Nord, Nantes, 44000', 135.50, 20.75, 156.25, 3, 10),
(11, '2024-12-15', 'en ligne', 'livrée', '12 Rue des Fleurs, Paris, 75001', 100.50, 15.50, 116.00, 2, 1),
(12, '2024-12-16', 'en magasin', 'expédiée', '45 Avenue du Parc, Lyon, 69002', 150.75, 22.75, 173.50, 3, 2),
(13, '2024-12-17', 'en ligne', 'en préparation', '78 Rue de la Paix, Marseille, 13003', 200.00, 30.50, 230.50, 4, 3),
(14, '2024-12-18', 'en magasin', 'livrée', '23 Boulevard Saint-Michel, Toulouse, 31000', 75.25, 11.50, 86.75, 5, 4),
(15, '2024-12-19', 'en ligne', 'expédiée', '56 Rue des Roses, Nice, 06004', 180.50, 27.50, 208.00, 2, 5),
(16, '2024-12-20', 'en magasin', 'livrée', '89 Rue de la République, Bordeaux, 33000', 120.75, 18.50, 139.25, 3, 6),
(17, '2024-12-21', 'en ligne', 'en préparation', '34 Rue des Lilas, Lille, 59000', 95.50, 14.50, 110.00, 4, 7),
(18, '2024-12-22', 'en magasin', 'expédiée', '67 Avenue des Champs, Strasbourg, 67000', 250.00, 38.00, 288.00, 5, 8),
(19, '2024-12-23', 'en ligne', 'livrée', '10 Rue du Centre, Montpellier, 34000', 175.25, 26.75, 202.00, 2, 9),
(20, '2024-12-24', 'en magasin', 'en préparation', '42 Boulevard du Nord, Nantes, 44000', 135.50, 20.75, 156.25, 3, 10),
(21, '2025-01-15', 'en ligne', 'livrée', '12 Rue des Fleurs, Paris, 75001', 100.50, 15.50, 116.00, 2, 1),
(22, '2025-01-16', 'en magasin', 'expédiée', '45 Avenue du Parc, Lyon, 69002', 150.75, 22.75, 173.50, 3, 2),
(23, '2025-01-17', 'en ligne', 'en préparation', '78 Rue de la Paix, Marseille, 13003', 200.00, 30.50, 230.50, 4, 3),
(24, '2025-01-18', 'en magasin', 'livrée', '23 Boulevard Saint-Michel, Toulouse, 31000', 75.25, 11.50, 86.75, 5, 4),
(25, '2025-01-19', 'en ligne', 'expédiée', '56 Rue des Roses, Nice, 06004', 180.50, 27.50, 208.00, 2, 5),
(26, '2025-01-20', 'en magasin', 'livrée', '89 Rue de la République, Bordeaux, 33000', 120.75, 18.50, 139.25, 3, 6),
(27, '2025-01-21', 'en ligne', 'en préparation', '34 Rue des Lilas, Lille, 59000', 95.50, 14.50, 110.00, 4, 7),
(28, '2025-01-22', 'en magasin', 'expédiée', '67 Avenue des Champs, Strasbourg, 67000', 250.00, 38.00, 288.00, 5, 8),
(29, '2025-01-23', 'en ligne', 'livrée', '10 Rue du Centre, Montpellier, 34000', 175.25, 26.75, 202.00, 2, 9),
(30, '2025-01-24', 'en magasin', 'en préparation', '42 Boulevard du Nord, Nantes, 44000', 135.50, 20.75, 156.25, 3, 10);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `Identifiant_ligne_commande` int NOT NULL,
  `Quantite_produit_ligne_commande` int NOT NULL,
  `Prix_unitaire_ht_produit_ligne_commande` decimal(15,2) NOT NULL,
  `Prix_unitaire_ttc_produit_ligne_commande` decimal(15,2) NOT NULL,
  `Identifiant_commande` int NOT NULL,
  `Identifiant_produit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`Identifiant_ligne_commande`, `Quantite_produit_ligne_commande`, `Prix_unitaire_ht_produit_ligne_commande`, `Prix_unitaire_ttc_produit_ligne_commande`, `Identifiant_commande`, `Identifiant_produit`) VALUES
(1, 2, 12.50, 13.19, 1, 1),
(2, 1, 30.00, 31.65, 1, 6),
(3, 3, 18.00, 18.99, 2, 3),
(4, 1, 45.00, 54.00, 2, 9),
(5, 2, 25.00, 26.38, 3, 5),
(6, 1, 55.00, 66.00, 3, 15),
(7, 1, 12.50, 13.19, 4, 7),
(8, 1, 12.00, 14.40, 4, 10),
(9, 2, 15.00, 15.83, 5, 2),
(10, 1, 40.00, 48.00, 5, 16),
(11, 3, 22.00, 23.21, 6, 8),
(12, 1, 18.00, 21.60, 6, 14),
(13, 2, 14.50, 15.30, 7, 4),
(14, 1, 25.00, 30.00, 7, 11),
(15, 3, 30.00, 31.65, 8, 6),
(16, 1, 75.00, 90.00, 8, 17),
(17, 2, 12.50, 13.19, 9, 7),
(18, 1, 50.00, 60.00, 9, 18),
(19, 1, 22.00, 23.21, 10, 8),
(20, 2, 10.00, 12.00, 10, 18),
(21, 2, 12.50, 13.19, 15, 1);

--
-- Déclencheurs `ligne_commande`
--
DELIMITER $$
CREATE TRIGGER `UpdateStockProduit` AFTER INSERT ON `ligne_commande` FOR EACH ROW BEGIN
    	DECLARE idProduit INT;
        DECLARE qttProduit INT;
        SELECT Identifiant_produit INTO idProduit FROM ligne_commande
        WHERE Identifiant_ligne_commande = New.Identifiant_ligne_commande ;
        SELECT Quantite_produit_ligne_commande INTO qttProduit FROM ligne_commande
        WHERE Identifiant_ligne_commande = New.Identifiant_ligne_commande ;
        UPDATE produit SET produit.Stock_produit = produit.Stock_produit - qttProduit
        WHERE produit.Identifiant_produit = idProduit ;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `Identifiant_produit` int NOT NULL,
  `Designation_produit` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Type_conditionnement` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Prix_ht_produit` decimal(15,2) NOT NULL,
  `Prix_ttc_produit` decimal(15,2) NOT NULL,
  `Description_produit` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Stock_produit` int DEFAULT NULL,
  `Identifiant_categorie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Identifiant_produit`, `Designation_produit`, `Type_conditionnement`, `Prix_ht_produit`, `Prix_ttc_produit`, `Description_produit`, `Stock_produit`, `Identifiant_categorie`) VALUES
(1, 'Espresso Brésil', 'tranche de 100g', 12.50, 13.19, 'Café arabica intense du Brésil', 48, 1),
(2, 'Moka Éthiopie', 'boite', 15.00, 15.83, 'Café aux notes florales d\'Éthiopie', 30, 1),
(3, 'Blend Colombie', 'boite', 18.00, 18.99, 'Café corsé de Colombie', 20, 1),
(4, 'Colombian Supremo', 'tranche de 100g', 14.50, 15.30, 'Café de spécialité colombien', 40, 1),
(5, 'Darjeeling First Flush', 'tranche de 100g', 25.00, 26.38, 'Thé noir indien délicat', 35, 2),
(6, 'Matcha Premium', 'boite', 30.00, 31.65, 'Thé vert matcha de haute qualité', 25, 2),
(7, 'Earl Grey Bio', 'tranche de 100g', 12.50, 13.19, 'Thé noir aromatisé à la bergamote', 45, 2),
(8, 'Oolong de Chine', 'tranche de 100g', 22.00, 23.21, 'Thé bleu traditionnel chinois', 40, 2),
(9, 'Théière en porcelaine', 'unité', 45.00, 54.00, 'Théière artisanale en porcelaine', 15, 3),
(10, 'Infuseur à thé', 'unité', 12.00, 14.40, 'Infuseur en acier inoxydable', 50, 3),
(11, 'Tasse à café double paroi', 'unité', 25.00, 30.00, 'Tasse isotherme design', 30, 3),
(12, 'Moulin à café manuel', 'unité', 35.00, 42.00, 'Moulin à café en céramique', 20, 3),
(13, 'Boîte de conservation thé', 'unité', 18.00, 21.60, 'Boîte hermétique pour thé', 40, 3),
(14, 'Service à thé japonais', 'unité', 55.00, 66.00, 'Service à thé traditionnel', 10, 3),
(15, 'Bouilloire électrique', 'unité', 75.00, 90.00, 'Bouilloire à température réglable', 25, 3),
(16, 'Plateau de dégustation', 'unité', 40.00, 48.00, 'Plateau en bois pour dégustation', 15, 3),
(17, 'Dosette réutilisable', 'unité', 10.00, 12.00, 'Dosette compatible multi-machines', 60, 3),
(18, 'Kit de préparation matcha', 'unité', 50.00, 60.00, 'Kit complet pour préparation matcha', 20, 3);

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE `vendeur` (
  `Identifiant_vendeur` int NOT NULL,
  `Role_vendeur` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Nom_vendeur` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Prenom_vendeur` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Mail_vendeur` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Telephone_vendeur` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Mdp_vendeur` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vendeur`
--

INSERT INTO `vendeur` (`Identifiant_vendeur`, `Role_vendeur`, `Nom_vendeur`, `Prenom_vendeur`, `Mail_vendeur`, `Telephone_vendeur`, `Mdp_vendeur`) VALUES
(1, 'administrateur', 'Dupont', 'Marie', 'marie.dupont@cafthe.fr', '0612345678', 'A9x2Bk7pQ3'),
(2, 'vendeur', 'Martin', 'Pierre', 'pierre.martin@cafthe.fr', '0623456789', 'B5n3Cj6mR8'),
(3, 'vendeur', 'Leroy', 'Sophie', 'sophie.leroy@cafthe.fr', '0634567890', 'C7t4Dh9kL2'),
(4, 'vendeur', 'Moreau', 'Lucas', 'lucas.moreau@cafthe.fr', '0645678901', 'D2f5Ej8nM6'),
(5, 'vendeur', 'Rousseau', 'Emma', 'emma.rousseau@cafthe.fr', '0656789012', 'E6h7Fk4pN9');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`Identifiant_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Identifiant_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`Identifiant_commande`),
  ADD KEY `Identifiant_vendeur` (`Identifiant_vendeur`),
  ADD KEY `Identifiant_client` (`Identifiant_client`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`Identifiant_ligne_commande`),
  ADD KEY `Identifiant_commande` (`Identifiant_commande`),
  ADD KEY `Identifiant_produit` (`Identifiant_produit`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`Identifiant_produit`),
  ADD KEY `Identifiant_categorie` (`Identifiant_categorie`);

--
-- Index pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD PRIMARY KEY (`Identifiant_vendeur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `Identifiant_categorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `Identifiant_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `Identifiant_commande` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `Identifiant_ligne_commande` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `Identifiant_produit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `vendeur`
--
ALTER TABLE `vendeur`
  MODIFY `Identifiant_vendeur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`Identifiant_vendeur`) REFERENCES `vendeur` (`Identifiant_vendeur`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`Identifiant_client`) REFERENCES `client` (`Identifiant_client`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`Identifiant_commande`) REFERENCES `commande` (`Identifiant_commande`),
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`Identifiant_produit`) REFERENCES `produit` (`Identifiant_produit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`Identifiant_categorie`) REFERENCES `categorie` (`Identifiant_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
