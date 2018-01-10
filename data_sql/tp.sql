-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 10 Janvier 2018 à 17:50
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `tp`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `numeroArticle` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prix` varchar(45) NOT NULL,
  PRIMARY KEY (`numeroArticle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`numeroArticle`, `nom`, `prix`) VALUES
(1, 'Rasoir', '5'),
(2, 'Mousse à raser', '4'),
(3, 'Javellisant', '3'),
(4, 'Savonnette', '6'),
(5, 'Shampoing', '4'),
(6, 'Dentifrice', '2'),
(7, 'Mouchoir', '1');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `numeroClient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `mdp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numeroClient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`numeroClient`, `nom`, `prenom`, `login`, `mdp`) VALUES
(1, 'Yves', 'Lord', 'lyves', '@lyvesS'),
(2, 'Don', 'Kruger', 'kdon', '?kdon#'),
(3, 'Marc', 'Jean', 'jmarc', '@jmarc#'),
(4, 'Paul', 'Huet', 'hpaul', '0000');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `numeroCommande` int(11) NOT NULL AUTO_INCREMENT,
  `dateCommande` datetime NOT NULL,
  `client_numeroClient` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numeroCommande`,`client_numeroClient`),
  KEY `fk_commande_client_idx` (`client_numeroClient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`numeroCommande`, `dateCommande`, `client_numeroClient`) VALUES
(1, '2006-01-24 00:30:00', 1),
(2, '2006-01-22 15:30:00', 2),
(3, '2006-01-20 16:00:00', 3),
(4, '2006-01-15 18:00:00', 4),
(5, '2006-01-12 19:15:00', 4);

-- --------------------------------------------------------

--
-- Structure de la table `comporter`
--

CREATE TABLE IF NOT EXISTS `comporter` (
  `commande_numeroCommande` int(11) NOT NULL,
  `article_numeroArticle` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`commande_numeroCommande`,`article_numeroArticle`),
  KEY `fk_commande_has_article_article1_idx` (`article_numeroArticle`),
  KEY `fk_commande_has_article_commande1_idx` (`commande_numeroCommande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `comporter`
--

INSERT INTO `comporter` (`commande_numeroCommande`, `article_numeroArticle`, `quantite`) VALUES
(1, 1, 90),
(1, 2, 50),
(2, 1, 100),
(3, 4, 202),
(4, 5, 20),
(5, 7, 100);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_client` FOREIGN KEY (`client_numeroClient`) REFERENCES `client` (`numeroClient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `comporter`
--
ALTER TABLE `comporter`
  ADD CONSTRAINT `fk_commande_has_article_article1` FOREIGN KEY (`article_numeroArticle`) REFERENCES `article` (`numeroArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_has_article_commande1` FOREIGN KEY (`commande_numeroCommande`) REFERENCES `commande` (`numeroCommande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
