-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 15 juin 2024 à 11:54
-- Version du serveur : 8.2.0
-- Version de PHP : 8.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `atelier`
--

-- --------------------------------------------------------

--
-- Structure de la table `atelier`
--

DROP TABLE IF EXISTS `atelier`;
CREATE TABLE IF NOT EXISTS `atelier` (
  `id_atelier` int NOT NULL AUTO_INCREMENT,
  `plan` text NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `id_compte` int NOT NULL,
  PRIMARY KEY (`id_atelier`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `atelier`
--

INSERT INTO `atelier` (`id_atelier`, `plan`, `x`, `y`, `id_compte`) VALUES
(1, 'images/plan1.png', 32, 40, 19),
(2, 'images/plan2.png', 20, 35, 19),
(3, 'images/plan3.png', 12, 25, 20),
(4, 'images/plan4.png', 30, 46, 20);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `mdp` longtext NOT NULL,
  `niveau` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `nom`, `mdp`, `niveau`) VALUES
(19, 'test@test.com', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', 1),
(20, 'testlvl2@test.com', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', 1),
(21, 'test@test.fr', '8393991ca52eeaddae7d4bc2f35ebda55916f913a45b39bfab58a2e75b8e5bcfbaefe88e7e18e011384ea7173036927a2bf80a8ac51b9998e89667f1675b06fd', 1),
(22, 'sae@sae.com', 'bf99317f9b00eb48805cf7aece5348079e47b3e57367abf864f903b99ee1203d0d73b2e1f9448efbf36a3db4522f0765e9a6e26356db6189387df6d55f5a0acc', 1);

-- --------------------------------------------------------

--
-- Structure de la table `etagere`
--

DROP TABLE IF EXISTS `etagere`;
CREATE TABLE IF NOT EXISTS `etagere` (
  `id` int NOT NULL AUTO_INCREMENT,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `id_atelier` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_atelier` (`id_atelier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etagere`
--

INSERT INTO `etagere` (`id`, `x`, `y`, `id_atelier`) VALUES
(1, 2, 2, 1),
(2, 15, 25, 2),
(3, 8, 17, 3),
(4, 29, 45, 4);

-- --------------------------------------------------------

--
-- Structure de la table `outil`
--

DROP TABLE IF EXISTS `outil`;
CREATE TABLE IF NOT EXISTS `outil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_etagere` int NOT NULL,
  `type` varchar(30) NOT NULL,
  `nbr_utilisations` int NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_etagere` (`id_etagere`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `outil`
--

INSERT INTO `outil` (`id`, `id_etagere`, `type`, `nbr_utilisations`, `x`, `y`) VALUES
(59, 1, 'Marteau', 11, 25, 23),
(60, 1, 'Tournevis', 5, 2, 2),
(61, 1, 'Clé à molette', 16, 2, 2),
(62, 2, 'Pied à coulisse', 5, 18, 33),
(63, 2, 'Marteau', 16, 13, 26),
(64, 3, 'Tournevis', 25, 5, 20),
(65, 3, 'Pompe hydraulique', 20, 8, 10),
(66, 3, 'Equerre', 2, 10, 20),
(67, 4, 'Truelle', 50, 25, 30),
(68, 4, 'Bétonnière', 60, 15, 13),
(69, 4, 'Perceuse', 10, 7, 32),
(70, 4, 'Pelle', 2, 27, 10);

-- --------------------------------------------------------

--
-- Structure de la table `position_history`
--

DROP TABLE IF EXISTS `position_history`;
CREATE TABLE IF NOT EXISTS `position_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `plan` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `position_history`
--

INSERT INTO `position_history` (`id`, `object_id`, `x`, `y`, `plan`, `timestamp`) VALUES
(1, 59, 15, 30, 'images.plan1.png', '2024-06-15 13:50:52'),
(2, 59, 20, 40, 'images.plan1.png', '2024-06-15 13:50:52'),
(3, 59, 25, 29, 'images.plan1.png', '2024-06-15 13:50:52'),
(4, 59, 14, 46, 'images.plan1.png', '2024-06-15 13:50:52'),
(5, 59, 32, 33, 'images.plan1.png', '2024-06-15 13:50:52'),
(6, 60, 19, 35, 'images.plan1.png', '2024-06-15 13:50:52'),
(7, 60, 22, 45, 'images.plan1.png', '2024-06-15 13:50:52'),
(8, 60, 31, 28, 'images.plan1.png', '2024-06-15 13:50:52'),
(9, 60, 13, 42, 'images.plan1.png', '2024-06-15 13:50:52'),
(10, 60, 30, 26, 'images.plan1.png', '2024-06-15 13:50:52');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `id_outil` int NOT NULL,
  `nom_utilisateur` varchar(32) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_outil` (`id_outil`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `id_outil`, `nom_utilisateur`, `date_debut`, `date_fin`) VALUES
(1, 59, 'Martin', '2023-01-26 08:00:00', '2023-01-27 18:00:00'),
(28, 61, 'test1', '2024-04-25 06:00:00', '2024-04-25 07:00:00'),
(29, 59, 'test2', '2024-04-25 06:00:00', '2024-04-25 07:00:00'),
(30, 60, 'test3', '2024-04-27 06:00:00', '2024-04-27 07:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `sav`
--

DROP TABLE IF EXISTS `sav`;
CREATE TABLE IF NOT EXISTS `sav` (
  `id_sav` int NOT NULL AUTO_INCREMENT,
  `id_compte` int NOT NULL,
  `nom` varchar(64) NOT NULL,
  `issue` longtext NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id_sav`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sav`
--

INSERT INTO `sav` (`id_sav`, `id_compte`, `nom`, `issue`, `commentaire`) VALUES
(6, 19, 'Clément', 'localisation', 'test'),
(7, 19, 'testsav', 'localisation', 'mon outil est mal localisé'),
(8, 19, 'testsav', 'statistiques', 'pas de stat'),
(9, 19, 'testsav', 'manchon', 'qsgzgzg'),
(10, 19, 'testsav', 'repertoire', 'zdgzgzg'),
(11, 19, 'testsav', 'plan', 'azerty'),
(12, 19, 'testsav', 'visualisation', 'azerty'),
(13, 19, 'testsav', 'autre', 'qsdfg');

-- --------------------------------------------------------

--
-- Structure de la table `user_key`
--

DROP TABLE IF EXISTS `user_key`;
CREATE TABLE IF NOT EXISTS `user_key` (
  `id_compte` int NOT NULL,
  `UUID` longtext NOT NULL,
  `date_valide` datetime NOT NULL,
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_key`
--

INSERT INTO `user_key` (`id_compte`, `UUID`, `date_valide`) VALUES
(20, '33015941-f857-473e-a5cb-d03406d7e477', '2023-01-20 01:55:34'),
(19, '02ab4e0d-8e33-4eed-b223-57be113c080d', '2023-01-20 02:41:23'),
(19, '1c6d2844-47d6-4d55-a7c5-d89e43a94495', '2023-01-20 02:41:36'),
(19, '4a1365d5-402f-4a0a-a360-0be18aa8da91', '2023-01-20 02:42:33'),
(19, '8fb81159-b528-4cae-8bf9-b6e2b3ab12fe', '2023-01-20 02:43:09'),
(19, 'a56c4b54-cc04-4c5b-9fcb-e0766d8ca786', '2023-01-20 02:43:21'),
(19, 'c685cb7f-3850-4970-8123-e1282a366e5e', '2023-01-20 02:44:16'),
(19, 'f3393489-534c-4c63-bb7e-a061ba0fd3e9', '2023-01-20 02:44:31'),
(19, '34e09c00-c953-473b-a649-0ffd2f092e2f', '2023-01-20 02:46:11'),
(19, '3e30a0d0-20e4-4508-ad28-29cfcb5920c8', '2023-01-20 02:47:05'),
(19, 'e4c0f796-3b46-4910-99bd-4dfc6b389597', '2023-01-20 02:47:28'),
(19, 'b6468254-dadd-4bea-beb5-273833fda4f6', '2023-01-20 02:47:43'),
(19, '198a6b62-645c-420c-a852-a9479e5508ec', '2023-01-20 02:48:27'),
(19, '0931d1fd-0cf7-4d6d-8566-394aa83353aa', '2023-01-20 02:51:34'),
(19, '483d28fc-8094-458d-bf65-12c77b9542b6', '2023-01-20 03:29:08'),
(19, '9cb7ee2c-bd6c-4b56-9c04-e6a0eac66228', '2023-01-20 03:30:36'),
(19, '19569bdc-0d50-4607-be91-07830a55d552', '2023-01-20 04:33:23'),
(21, 'afb0548b-7a55-4878-aaa7-fbf8f17738fd', '2024-04-04 18:39:34'),
(21, '254ea7cd-626f-480d-a941-e55c3533f1c4', '2024-04-04 18:40:16'),
(21, 'bc72cbab-ac13-4751-94f3-333a1dc276c7', '2024-04-04 18:40:27'),
(21, '2f39a8e0-8646-4e30-a5ab-d61712e749d8', '2024-04-04 18:41:57'),
(21, 'f484f13a-93ba-4b85-8d57-67d9129b30a8', '2024-04-04 18:43:35'),
(21, '6ea323cb-7a58-47e4-bc25-c61573912432', '2024-04-04 18:43:49'),
(21, 'ed233628-03d3-4a36-a86c-f99393d93ac1', '2024-04-06 17:54:25'),
(22, '5ba20491-2181-476e-87b7-f5d07336f6fe', '2024-04-06 18:16:07'),
(21, 'e178f515-15bc-4795-a8b2-a65065c17cf8', '2024-04-06 18:56:14'),
(21, '17f22525-f1aa-4cce-9c9a-4d63dc916e94', '2024-04-06 18:56:15'),
(21, '6e3c5741-ad16-4c2b-94c7-cfc39034ac7b', '2024-04-06 18:56:15'),
(21, '13b3569c-99b3-453a-84c6-4f62c076b4df', '2024-04-06 18:56:15'),
(21, '5088161c-279d-4701-8e9b-982d986be146', '2024-04-06 18:56:15'),
(21, '55379650-970d-4181-b27c-f19b241f1e1b', '2024-04-06 18:56:16'),
(21, 'e3f5732a-bc0f-454e-bb1f-ff39dbd53820', '2024-04-06 18:56:17'),
(21, '4846e30f-50a4-4744-8675-56046685ad6a', '2024-04-06 18:56:17'),
(21, '14967b69-fa64-4859-99d6-2176a236cbdc', '2024-04-06 18:56:17'),
(21, '859bdb25-ab47-4a55-b98e-f47a95be18ee', '2024-04-06 18:56:17'),
(21, '7f16893e-306c-482b-aa92-b3e303b126d1', '2024-04-06 18:56:30'),
(21, '33ee5d9f-1bed-4ddc-9ea7-11a83cd39a1c', '2024-04-06 20:02:25'),
(22, 'fc827e83-0e22-4dce-a7e3-5e4e97aaf317', '2024-04-06 20:03:30'),
(22, '6f587269-c4f5-4f16-ab89-5f9452759908', '2024-04-06 20:05:54'),
(22, '8c2553d0-2b52-46f1-bb04-50eb246b056d', '2024-04-06 20:06:28'),
(22, '8ed61e7a-4924-47f2-8931-bfc0118a20d5', '2024-04-06 20:06:48'),
(22, 'f2c61a33-b865-4750-94fd-4b495e3e9c94', '2024-04-06 20:07:44'),
(19, '1127275d-f419-4d22-83fb-3f2d6f1b93e0', '2024-04-09 22:21:49'),
(19, '0395071d-8ce2-4b20-ad42-36ff9d3081ac', '2024-04-11 15:51:27'),
(19, 'aa5062eb-b952-4eaa-b2a8-324a05734cdd', '2024-04-11 17:41:25'),
(19, '313f51f8-ab61-4487-8def-66a8c4112a35', '2024-04-11 17:56:08'),
(19, '7f503c57-d205-48f5-8d82-8994539c0c12', '2024-06-15 13:07:25'),
(19, '04ca94a6-73e8-42e0-b057-2bcdd28fed2a', '2024-06-15 13:26:18'),
(19, '364f1ab9-54d8-4424-bff0-e93f1db11a07', '2024-06-15 13:27:00');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `atelier`
--
ALTER TABLE `atelier`
  ADD CONSTRAINT `atelier_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id`);

--
-- Contraintes pour la table `etagere`
--
ALTER TABLE `etagere`
  ADD CONSTRAINT `etagere_ibfk_1` FOREIGN KEY (`id_atelier`) REFERENCES `atelier` (`id_atelier`);

--
-- Contraintes pour la table `outil`
--
ALTER TABLE `outil`
  ADD CONSTRAINT `outil_ibfk_1` FOREIGN KEY (`id_etagere`) REFERENCES `etagere` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_outil`) REFERENCES `outil` (`id`);

--
-- Contraintes pour la table `sav`
--
ALTER TABLE `sav`
  ADD CONSTRAINT `sav_key_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id`);

--
-- Contraintes pour la table `user_key`
--
ALTER TABLE `user_key`
  ADD CONSTRAINT `user_key_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
