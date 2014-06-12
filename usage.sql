-- phpMyAdmin SQL Dump
-- version 2.11.2.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 16 Mars 2014 à 11:54
-- Version du serveur: 5.0.45
-- Version de PHP: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `usage`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL auto_increment,
  `idUser` int(11) NOT NULL,
  `categorie` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `idUser`, `categorie`) VALUES
(1, 0, 'Sports'),
(2, 0, 'Music'),
(3, 0, 'Voyages'),
(5, 0, 'Cinema');

-- --------------------------------------------------------

--
-- Structure de la table `echange`
--

CREATE TABLE `echange` (
  `id_echange` int(11) NOT NULL auto_increment,
  `parent_user` int(11) NOT NULL,
  `id_corresp` int(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`id_echange`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Contenu de la table `echange`
--

INSERT INTO `echange` (`id_echange`, `parent_user`, `id_corresp`, `message`) VALUES
(20, 4, 42, 'salem'),
(21, 42, 4, 'merci bien'),
(22, 4, 42, 'xgfgdfg'),
(23, 4, 54, 'reter'),
(24, 4, 54, 'ghghgh'),
(25, 4, 42, '454');

-- --------------------------------------------------------

--
-- Structure de la table `mots_cles`
--

CREATE TABLE `mots_cles` (
  `id` int(11) NOT NULL auto_increment,
  `parent_categorie` int(11) NOT NULL,
  `mot` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `mots_cles`
--

INSERT INTO `mots_cles` (`id`, `parent_categorie`, `mot`) VALUES
(1, 1, 'Footbal'),
(2, 1, 'Ski'),
(3, 1, 'Karati'),
(4, 3, 'Jidou'),
(8, 2, 'Dance'),
(9, 2, 'House Music'),
(10, 3, 'Touriste'),
(13, 5, 'audio'),
(14, 5, 'vedio');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `nom` varchar(250) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `age` varchar(250) NOT NULL,
  `adresse` varchar(250) NOT NULL,
  `ville` varchar(250) NOT NULL,
  `login` varchar(250) NOT NULL,
  `motdepasse` varchar(250) NOT NULL,
  `photo` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `age`, `adresse`, `ville`, `login`, `motdepasse`, `photo`) VALUES
(4, 'faycel111', 'naimi', '30', '5151 Boulevard Leger , Montreal-Nord, QC, Canada', 'Montreal nord', '20', '30', '54'),
(42, 'mayssa', 'oudah ', '6', 'laval, quebec, canada', 'Montreal nord', '11', '22', ''),
(44, 'fayssol', 'NA3mouch', '22', 'tunise', 'tunis', '22', '22', 'null'),
(54, 'khene', 'soufiane', 'fdgfd', 'berriane, ALGERIE', 'Montreal nord', 'SOF', 'SOF', 'null'),
(56, 'khene', 'salah', '28', '2034 Rue Aylwin, montreal', 'montreal', 'salah', 'salah', '');

-- --------------------------------------------------------

--
-- Structure de la table `user_mots_cles`
--

CREATE TABLE `user_mots_cles` (
  `id` int(11) NOT NULL auto_increment,
  `parent_user` int(11) NOT NULL,
  `parent_mots_cles` varchar(250) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Contenu de la table `user_mots_cles`
--

INSERT INTO `user_mots_cles` (`id`, `parent_user`, `parent_mots_cles`) VALUES
(3, 45, 'Karati'),
(4, 54, 'Footbal'),
(5, 54, 'Jidou'),
(6, 45, 'Footbal'),
(7, 42, 'Ski'),
(9, 42, 'Footbal'),
(10, 42, 'Jidou'),
(11, 56, 'Footbal'),
(14, 43, 'Ski'),
(15, 43, 'Karati'),
(45, 4, 'vedio'),
(47, 4, 'Footbal'),
(48, 4, 'Jidou');
