-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 07 avr. 2025 à 01:19
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
(1, 'Gentil', 'Dean', '2023-11-16', 'dean.gentil@email.com', '0667890148', '12 Rue des Fleurs, Paris, 75001', '$2b$10$YOxmOxs.BD0nD3nt5abnPe7ehxiNRDJtfUo.UM/7/waZc9mD/yb9q'),
(2, 'Dubois', 'Alice', '2025-01-05', 'alice.dubois@email.com', '0678901234', '45 Avenue du Parc, Lyon, 69002', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(3, 'DELETED', 'DATE', '2025-02-06', '', '', '', ''),
(4, 'Girard', 'Camille', '2024-09-21', 'camille.girard@email.com', '0690123456', '23 Boulevard Saint-Michel, Toulouse, 31000', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(5, 'Laurent', 'Mathieu', '2024-01-20', 'mathieu.laurent@email.com', '0701234567', '56 Rue des Roses, Nice, 06004', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(6, 'Michel', 'Léa', '2024-10-23', 'lea.michel@email.com', '0712345678', '89 Rue de la République, Bordeaux, 33000', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(7, 'Lefebvre', 'Hugo', '2024-06-13', 'hugo.lefebvre@email.com', '0723456789', '34 Rue des Lilas, Lille, 59000', '$2b$10$vXb9DzKL8fhfqutVs5x9x.XQWDXWDKrpZqPMs8Hs8ygDeCyuZrPBK$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(8, 'Garcia', 'Clara', '2024-01-27', 'clara.garcia@email.com', '0734567890', '67 Avenue des Champs, Strasbourg, 67000', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(9, 'Rodriguez', 'Nathan', '2024-12-07', 'nathan.rodriguez@email.com', '0745678901', '10 Rue du Centre, Montpellier, 34000', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(10, 'Muller', 'Chloé', '2024-11-23', 'chloe.muller@email.com', '0756789012', '42 Boulevard du Nord, Nantes, 44000', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(11, 'Dupont', 'Jean', '2025-02-13', 'jean.dupont@email.com', '0695623114', '14 rue des orties, Nice, 06004', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(13, 'Test', 'Etienne', '2025-02-23', 'etienne.test@email.com', '0678910112', '56 Rue Des Tests, Paris, 75015', '$2b$10$pqg3hsFvzMvphBltevSSSebZHL50wxQtJgoZgmQIvo/ZlI3Yc0NXm'),
(14, 'TEST', 'Marc', '2025-04-06', 'marc.test@email.com', '0659874112', '56 Rue Des Tests, Paris, 75015', '$2b$10$w4s2hXhK3b1hb4oaUzxLK.A9cFQEE9liS7Muoi1YaZ7Rx1bxOZoGW'),
(15, 'TEST', 'Jean', '2025-04-06', 'jean.test@eamail.com', '0745963215', '56 Rue Des Tests, Paris, 75015', '$2b$10$O0c2Mg3l7ZGjjzAkoOGlsOVc.J7v6dZAg2nHOeVAvztbYw0VB.iRW'),
(16, 'Test', 'Jeanne', '2025-04-06', 'jeanne.test@email.com', '0956321664', '56 Rue Des Tests, Paris, 75015', '$2b$10$8KpIbbh.axpp0r8jxym9l.kz2lLh07VkJLM2u.MPuA5vYyVgVo1iq'),
(17, 'Test', 'Jeanne', '2025-04-06', 'jeanne.test@email.com', '0956321664', '56 Rue Des Tests, Paris, 75015', '$2b$10$8pqioIBefXMe3BEFxEun1uFeHdCbdca5gKKlhaff4zykzMru6bdC6'),
(18, 'Test', 'Marie', '2025-04-06', 'marie.test@email.com', '0678910112', '56 Rue Des Tests, Paris, 75015', '$2b$10$.GyDHIx1QZ0nhAvOTrAukeVY9Cz1Z6chGKymDF/KObRae2alcMi3S'),
(19, 'Test', 'Fred', '2025-04-06', 'fred.test@email.com', '0689541779', '56 Rue Des Tests, Paris, 75015', '$2b$10$5l.rIu3KaLKjoZ1QxO/xteHc0ouMLm.sF0UUovwTipgpowcCbWMKe'),
(20, 'Test', 'Georges', '2025-04-06', 'georges.test@email.com', '0689541778', '56 Rue Des Tests, Paris, 75015', '$2b$10$YREj0P.zQSGJsRI1SkZO6OjnmR7a4WMCSgcD0TNip4dV67SwmQIa2'),
(21, 'Test', 'Bernard', '2025-04-06', 'bernard.test@email.com', '0695874116', '56 Rue Des Tests, Paris, 75015', '$2b$10$CNx.7WjxR8E8NcCd9tHjEehLUZoMiNLPWagE4GWzKTWvtgjtWHoKy');

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
(30, '2025-01-24', 'en magasin', 'en préparation', '42 Boulevard du Nord, Nantes, 44000', 135.50, 20.75, 156.25, 3, 10),
(31, '2025-02-10', 'en ligne', 'en préparation', '14 rue des orties, Nice, 06004', 120.00, 24.00, 144.00, 3, 11),
(32, '2025-02-11', 'en magasin', 'expédiée', '14 rue des orties, Nice, 06004', 80.00, 16.00, 96.00, 4, 11),
(33, '2025-02-12', 'en ligne', 'livrée', '14 rue des orties, Nice, 06004', 150.00, 30.00, 180.00, 2, 11),
(34, '2025-02-10', 'en ligne', 'en préparation', '14 rue des orties, Nice, 06004', 120.00, 24.00, 144.00, 3, 11),
(35, '2025-02-11', 'en magasin', 'expédiée', '14 rue des orties, Nice, 06004', 80.00, 16.00, 96.00, 4, 11),
(36, '2025-02-12', 'en ligne', 'livrée', '14 rue des orties, Nice, 06004', 150.00, 30.00, 180.00, 2, 11);

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
(21, 2, 12.50, 13.19, 15, 1),
(74, 2, 40.00, 48.00, 31, 1),
(75, 1, 60.00, 72.00, 31, 5),
(76, 3, 15.00, 18.00, 32, 3),
(77, 2, 35.00, 42.00, 32, 8),
(78, 1, 25.00, 30.00, 33, 2),
(79, 2, 50.00, 60.00, 33, 10),
(80, 2, 40.00, 48.00, 31, 1),
(81, 1, 60.00, 72.00, 31, 5),
(82, 3, 15.00, 18.00, 32, 3),
(83, 2, 35.00, 42.00, 32, 8),
(84, 1, 25.00, 30.00, 33, 2),
(85, 2, 50.00, 60.00, 33, 10),
(86, 2, 12.50, 13.19, 11, 1),
(87, 1, 30.00, 31.65, 11, 6),
(88, 1, 15.00, 15.83, 11, 2),
(89, 3, 18.00, 18.99, 12, 3),
(90, 1, 45.00, 54.00, 12, 9),
(91, 2, 22.00, 23.21, 12, 8),
(92, 2, 25.00, 26.38, 13, 5),
(93, 1, 55.00, 66.00, 13, 14),
(94, 1, 40.00, 48.00, 13, 16),
(95, 2, 12.50, 13.19, 14, 7),
(96, 1, 12.00, 14.40, 14, 10),
(97, 1, 25.00, 30.00, 14, 11),
(98, 3, 22.00, 23.21, 16, 8),
(99, 1, 18.00, 21.60, 16, 13),
(100, 2, 14.50, 15.30, 16, 4),
(101, 2, 30.00, 31.65, 17, 6),
(102, 1, 75.00, 90.00, 17, 15),
(103, 1, 25.00, 30.00, 17, 11),
(104, 3, 12.50, 13.19, 18, 1),
(105, 1, 50.00, 60.00, 18, 18),
(106, 2, 22.00, 23.21, 18, 8),
(107, 2, 15.00, 15.83, 19, 2),
(108, 1, 40.00, 48.00, 19, 16),
(109, 1, 35.00, 42.00, 19, 12),
(110, 1, 18.00, 18.99, 20, 3),
(111, 2, 25.00, 26.38, 20, 5),
(112, 1, 18.00, 21.60, 20, 13),
(113, 2, 12.50, 13.19, 21, 1),
(114, 1, 30.00, 31.65, 21, 6),
(115, 2, 18.00, 18.99, 22, 3),
(116, 1, 45.00, 54.00, 22, 9),
(117, 3, 25.00, 26.38, 23, 5),
(118, 1, 55.00, 66.00, 23, 14),
(119, 2, 12.50, 13.19, 24, 7),
(120, 1, 12.00, 14.40, 24, 10),
(121, 2, 15.00, 15.83, 25, 2),
(122, 1, 40.00, 48.00, 25, 16),
(123, 3, 22.00, 23.21, 26, 8),
(124, 1, 18.00, 21.60, 26, 13),
(125, 2, 14.50, 15.30, 27, 4),
(126, 1, 25.00, 30.00, 27, 11),
(127, 3, 30.00, 31.65, 28, 6),
(128, 1, 75.00, 90.00, 28, 15),
(129, 2, 12.50, 13.19, 29, 7),
(130, 1, 50.00, 60.00, 29, 18),
(131, 2, 22.00, 23.21, 30, 8),
(132, 1, 10.00, 12.00, 30, 17),
(133, 2, 40.00, 48.00, 34, 1),
(134, 1, 60.00, 72.00, 34, 5),
(135, 3, 15.00, 18.00, 35, 3),
(136, 2, 35.00, 42.00, 35, 8),
(137, 1, 25.00, 30.00, 36, 2),
(138, 2, 50.00, 60.00, 36, 10);

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
  `Designation_produit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Type_conditionnement` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Prix_ht_produit` decimal(15,2) NOT NULL,
  `Prix_ttc_produit` decimal(15,2) NOT NULL,
  `Description_produit` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description_courte_produit` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Stock_produit` int DEFAULT NULL,
  `Identifiant_categorie` int NOT NULL,
  `url_img_produit` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `isHighlighted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Identifiant_produit`, `Designation_produit`, `Type_conditionnement`, `Prix_ht_produit`, `Prix_ttc_produit`, `Description_produit`, `Description_courte_produit`, `Stock_produit`, `Identifiant_categorie`, `url_img_produit`, `isHighlighted`) VALUES
(1, 'Espresso Brésil', 'Tranche de 100g', 12.50, 13.19, 'Plongez au cœur des terres ensoleillées du Brésil avec notre Espresso Brésil, un café 100 % arabica à la personnalité marquée. Issu de plantations situées en altitude, ce cru développe une intensité généreuse, à la fois ronde et équilibrée, portée par des notes de cacao, de noisette grillée et une subtile touche de caramel brun. Récolté avec soin par des producteurs engagés dans une démarche durable, cet espresso révèle toute la richesse du terroir brésilien dans chaque tasse. Idéal pour les amateurs de cafés corsés.', 'Un espresso brésilien intense et équilibré aux notes de cacao et noisette, d\'origine durable.', 35, 1, '/assets/images/paquetCafe.png', 1),
(2, 'Moka Éthiopie', 'Boîte', 15.00, 15.83, 'Ce Moka d\'Éthiopie est une invitation au voyage dans la région originelle du café. Cultivé sur les hauts plateaux éthiopiens, il offre une tasse élégante et florale, avec des notes de jasmin, de bergamote et une légère acidité citronnée. Récolté de manière artisanale, ce café rend hommage à un savoir-faire ancestral et s’inscrit dans une filière respectueuse des producteurs locaux.', 'Un moka éthiopien floral et raffiné aux notes de jasmin et bergamote, issu d\'une culture artisanale.', 22, 1, '/assets/images/paquetCafe.png', 0),
(3, 'Blend Colombie', 'Boîte', 18.00, 18.99, 'Ce café de Colombie vous séduira par sa richesse aromatique et son équilibre parfait. Issu des montagnes de la région de Huila, il dévoile une belle douceur en bouche, soutenue par des arômes de fruits rouges, de chocolat noir et une légère note de noix. Un café de spécialité récolté à la main, qui illustre l’excellence colombienne dans l’art du café.', 'Café colombien équilibré aux arômes de fruits rouges et chocolat noir, récolté à la main.', 5, 1, '/assets/images/paquetCafe.png', 0),
(4, 'Colombian Supremo', 'Tranche de 100g', 14.50, 15.30, 'Découvrez le Colombian Supremo, un café de spécialité aux grains généreux, typique des meilleures récoltes colombiennes. Ce cru développe des arômes intenses de chocolat noir, de prune et de caramel, dans une tasse onctueuse et parfaitement équilibrée. Un indispensable pour les amateurs de cafés de caractère, cultivé avec soin dans le respect des traditions locales.', 'Café colombien corsé aux notes de chocolat noir, prune et caramel, issu d’une culture traditionnelle.', 36, 1, '/assets/images/paquetCafe.png', 0),
(5, 'Darjeeling First Flush', 'Tranche de 100g', 25.00, 26.38, 'Le Darjeeling First Flush est un thé noir d’exception, récolté au printemps dans les contreforts de l’Himalaya. Apprécié pour sa finesse et sa légèreté, il révèle des arômes floraux de muscat et une fraîcheur végétale très agréable. Cueilli à la main selon des méthodes traditionnelles, ce thé est une véritable invitation à la sérénité.', 'Thé noir Darjeeling printanier aux notes florales et muscatées, cueilli à la main dans l’Himalaya.', 25, 2, '/assets/images/paquetThe.png', 0),
(6, 'Matcha Premium', 'Boîte', 30.00, 31.65, 'Un thé vert d’exception, réduit en poudre selon la méthode traditionnelle japonaise. Ce matcha premium se distingue par sa texture soyeuse et ses arômes végétaux profonds, aux notes d’herbe fraîche et d’umami. Idéal pour une préparation cérémonielle ou en latte, il est issu d’un terroir respectueux de l’environnement et des pratiques ancestrales.', 'Matcha premium japonais au goût végétal et umami, parfait en cérémonie ou latte.', 18, 2, '/assets/images/paquetThe.png', 0),
(7, 'Earl Grey Bio', 'Tranche de 100g', 12.50, 13.19, 'Ce grand classique du thé noir est revisité dans une version biologique, subtilement parfumée à la bergamote naturelle. L’équilibre entre la rondeur du thé noir et la vivacité des agrumes en fait un compagnon raffiné pour une dégustation en après-midi. Cultivé sans pesticides, il incarne l’élégance anglaise avec une conscience écologique.', 'Thé noir bio à la bergamote, alliant rondeur et fraîcheur pour une dégustation élégante et éthique.', 39, 2, '/assets/images/paquetThe.png', 1),
(8, 'Oolong de Chine', 'Tranche de 100g', 22.00, 23.21, 'À mi-chemin entre le thé vert et le thé noir, ce oolong chinois dévoile des arômes de fleurs blanches et de châtaigne grillée. Légèrement oxydé, il est apprécié pour sa complexité et sa douceur. Une infusion précieuse qui évoque les montagnes brumeuses du Fujian, berceau historique de ce thé semi-fermenté.', 'Oolong chinois doux et floral aux notes de châtaigne, issu des montagnes du Fujian.', 22, 2, '/assets/images/paquetThe.png', 0),
(9, 'Théière en porcelaine', 'Unité', 45.00, 54.00, 'Cette théière allie élégance et tradition avec son design épuré en porcelaine blanche. Parfaite pour sublimer les arômes délicats de vos thés, elle retient la chaleur tout en offrant une prise en main confortable. Une pièce intemporelle, idéale pour vos rituels de dégustation.', 'Théière en porcelaine blanche, élégante et fonctionnelle, idéale pour les rituels de dégustation.', 13, 3, '/assets/images/accessoire.png', 0),
(10, 'Infuseur à thé', 'Unité', 12.00, 14.40, 'Un accessoire indispensable pour les amateurs de thé en vrac. Son maillage fin permet une infusion optimale des feuilles, sans dépôt dans la tasse. Pratique, discret et durable, il vous accompagne au quotidien pour savourer chaque moment.', 'Infuseur pratique et discret, idéal pour savourer le thé en vrac au quotidien.', 42, 3, '/assets/images/accessoire.png', 0),
(11, 'Mug signature CafThé', 'Unité', 25.00, 30.00, 'Un mug pensé pour magnifier chaque moment de dégustation. Conçu en céramique artisanale, il se distingue par son épaisseur généreuse qui conserve la chaleur, son intérieur émaillé facile à nettoyer et son toucher doux, effet mat.', 'Mug en céramique épaisse, fini mat et intérieur émaillé. Élégant, isolant et conçu pour durer.', 27, 3, '/assets/images/accessoire.png', 1),
(12, 'Moulin à café manuel', 'Unité', 35.00, 42.00, 'Moudre son café à la main, c’est redonner du sens à chaque tasse. Ce moulin à café manuel en acier inoxydable permet un réglage précis de la mouture, pour s’adapter à toutes les méthodes d’extraction. Compact et robuste, il est le compagnon des amateurs exigeants.', 'Moulin manuel précis et robuste, pour une mouture sur mesure adaptée à chaque méthode.', 19, 3, '/assets/images/accessoire.png', 0),
(13, 'Boîte de conservation', 'Unité', 18.00, 21.60, 'Préservez la fraîcheur et les arômes de vos thés grâce à cette boîte hermétique en métal. Son design sobre et élégant s’intègre parfaitement dans toute cuisine ou espace de dégustation, tout en garantissant une conservation optimale.', 'Boîte hermétique en métal, élégante et pratique pour conserver tous les arômes de vos thés.', 37, 3, '/assets/images/accessoire.png', 0),
(14, 'Service à thé japonais', 'Unité', 55.00, 66.00, 'Un ensemble raffiné inspiré des traditions nippones. Ce service à thé en céramique comprend une théière et ses tasses assorties, pour une expérience authentique. Chaque pièce est façonnée avec soin pour honorer l’art du thé japonais.', 'Service à thé japonais en céramique, raffiné et authentique, pour une expérience traditionnelle.', 8, 3, '/assets/images/accessoire.png', 0),
(15, 'Bouilloire électrique', 'Unité', 75.00, 90.00, 'Précise, rapide et élégante : cette bouilloire électrique s’adapte aux exigences des amateurs de thé. Son bec col de cygne offre un débit maîtrisé, idéal pour les infusions délicates ou les préparations en méthode douce.', 'Bouilloire élégante à bec col de cygne, parfaite pour les infusions et méthodes douces.', 23, 3, '/assets/images/accessoire.png', 0),
(16, 'Plateau de dégustation', 'Unité', 40.00, 48.00, 'Mettez en scène vos moments de dégustation avec ce plateau en bois naturel. Conçu pour accueillir tasses, théière ou douceurs, il structure l’espace avec élégance. Un support esthétique pour vos instants privilégiés.', 'Plateau en bois naturel, élégant et pratique pour sublimer vos moments de dégustation.', 12, 3, '/assets/images/accessoire.png', 0),
(17, 'Dosette réutilisable', 'Unité', 10.00, 12.00, 'Une alternative écologique aux capsules jetables. Cette dosette en inox s’adapte à de nombreuses machines à café et permet de savourer vos propres mélanges. Un geste simple pour réduire ses déchets sans renoncer au plaisir du café.', 'Dosette inox réutilisable, écologique et compatible, pour savourer vos cafés sans compromis.', 59, 3, '/assets/images/accessoire.png', 0),
(18, 'Matcha kit', 'Unité', 50.00, 60.00, 'Tout le nécessaire pour un rituel matcha réussi. Ce coffret contient un bol en céramique, un fouet en bambou (chasen) et une cuillère doseuse (chashaku). Un hommage à la cérémonie du thé japonaise, à reproduire chez soi avec authenticité.', 'Coffret matcha complet, pour recréer chez soi la cérémonie japonaise avec authenticité.', 18, 3, '/assets/images/accessoire.png', 0);

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
  MODIFY `Identifiant_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `Identifiant_commande` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `Identifiant_ligne_commande` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

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
