-- Active: 1729445084290@@127.0.0.1@3306@genshin_build

-- Version : MariaDB Server 11.5.2 Rolling


--------- Base de données : "Genshin Build"
-----------------------------------------------

--------- Début de la création des tables
--(ajout des contraintes après les structures)
-----------------------------------------------
-- Structure table Regions

CREATE OR REPLACE TABLE `Regions` (
    `nom` VARCHAR(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Bannière

CREATE OR REPLACE TABLE `Bannieres` (
    `type` VARCHAR(30) PRIMARY KEY
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-----------------------------------------------
-- Structure table Elements

CREATE OR REPLACE TABLE `Elements` (
    `nom` VARCHAR(10) PRIMARY KEY
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Types_Arme

CREATE OR REPLACE TABLE `Types_Arme` (
    `nom` VARCHAR(20) PRIMARY KEY
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Armes

CREATE OR REPLACE TABLE `Armes` (
    `nom` VARCHAR(50), 
    `nbretoile` INT NOT NULL,
    `type_arme` VARCHAR(20),
    `effet` VARCHAR(900),
    `obtention` VARCHAR(40),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-----------------------------------------------
-- Structure table Armes Possédées

CREATE OR REPLACE TABLE `Armes_Possedees` (
    `nom` VARCHAR(50),
    `id` INT,
    `lvl` INT, 
    `raffinage` INT,
    PRIMARY KEY (`nom`,`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Personnages

CREATE OR REPLACE TABLE `Personnages`(
    `prenom` VARCHAR(20),
    `nom` VARCHAR(20),
    `image` VARCHAR(100),
    `element` VARCHAR(10) NOT NULL, 
    `nbretoile` INT NOT NULL,
    `ssstat1` VARCHAR(10),
    `ssstat2` VARCHAR(10),
    `region` VARCHAR(20),
    `type_arme` VARCHAR(20),
    `possedee` BOOL,
    `constellation` INT,
    PRIMARY KEY(`prenom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table personnages
add `possedee` BOOL,
add `constellation` INT;

-----------------------------------------------
-- Structure table Regions

CREATE OR REPLACE TABLE `Regions`(
    `nom` VARCHAR(20),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Donjons

CREATE OR REPLACE TABLE `Donjons`(
    `nom` VARCHAR(50),
    `type` VARCHAR(40),
    `debloque` BOOL,
    `region` VARCHAR(20),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Monstres

CREATE OR REPLACE TABLE `Monstres`(
    `nom` VARCHAR(50),
    `type` VARCHAR(20),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Materiaux

CREATE OR REPLACE TABLE `Materiaux`(
    `nom` VARCHAR(60),
    `evolution` VARCHAR(60),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Artefacts

CREATE OR REPLACE TABLE `Artefacts`(
    `type` VARCHAR(20),
    PRIMARY KEY(`type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Artefacts Possédés

CREATE OR REPLACE TABLE `Artefacts_Possedes` (
    `nom` VARCHAR(50),
    `id` INT,
    `lvl` INT, 
    `raffinage` INT,
    PRIMARY KEY (`nom`,`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Sets

CREATE OR REPLACE TABLE `Sets`(
    `nom` VARCHAR(60),
    `effet` VARCHAR(1100) NOT NULL,
    `donjon` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-------------Tables de liaison-----------------
-----------------------------------------------
-- Structure table Pull Personnages

CREATE OR REPLACE TABLE `Pull_Personnages`(
    `banniere` VARCHAR(30),
    `datedeb` date,
    `personnage5_1` VARCHAR(20),
    `personnage5_2` VARCHAR(20),
    `personnage4_1` VARCHAR(20),
    `personnage4_2` VARCHAR(20),
    `personnage4_3` VARCHAR(20),
    `datefin` date,
    FOREIGN KEY (`banniere`) REFERENCES bannieres(`nom`),
    FOREIGN KEY (`personnage5_1`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`personnage5_2`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`personnage4_1`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`personnage4_2`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`personnage4_3`) REFERENCES personnages(`prenom`),
    PRIMARY KEY(`banniere`, `datedeb`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Pull Armes

CREATE OR REPLACE TABLE `Pull_Armes`(
    `banniere` VARCHAR(30),
    `datedeb` date,
    `datefin` date,
    `arme5_1` VARCHAR(50),
    `arme5_2` VARCHAR(50),
    `arme4_1` VARCHAR(50),
    `arme4_2` VARCHAR(50),
    `arme4_3` VARCHAR(50),
    FOREIGN KEY (`banniere`) REFERENCES bannieres(`nom`),
    FOREIGN KEY (`arme5_1`) REFERENCES armes(`nom`),
    FOREIGN KEY (`arme5_2`) REFERENCES armes(`nom`),
    FOREIGN KEY (`arme4_1`) REFERENCES armes(`nom`),
    FOREIGN KEY (`arme4_2`) REFERENCES armes(`nom`),
    FOREIGN KEY (`arme4_3`) REFERENCES armes(`nom`),
    PRIMARY KEY(`banniere`, `datedeb`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Meilleures Armes

CREATE OR REPLACE TABLE `Meilleures_Armes`(
    `personnage` VARCHAR(20),
    `arme` VARCHAR(50),
    `rang` INT,
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`arme`) REFERENCES armes(`nom`),
    PRIMARY KEY(`personnage`, `arme`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Matériaux Armes

CREATE OR REPLACE TABLE `Materiaux_Armes`(
    `materiel` VARCHAR(60),
    `arme` VARCHAR(50),
    `niveau` INT,
    `quantite` INT,
    FOREIGN KEY (`materiel`) REFERENCES materiaux(`nom`),
    FOREIGN KEY (`arme`) REFERENCES armes(`nom`),
    PRIMARY KEY(`materiel`, `arme`, `niveau`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Matériaux Personnages

CREATE OR REPLACE TABLE `Materiaux_Personnages`(
    `materiel` VARCHAR(60),
    `personnage` VARCHAR(20),
    `type` VARCHAR(20),
    `niveau` INT,
    `fini` BOOL,
    `quantite` INT,
    FOREIGN KEY (`materiel`) REFERENCES materiaux(`nom`),
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    PRIMARY KEY(`materiel`, `personnage`, `niveau`, `type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Sets Recommandés

CREATE OR REPLACE TABLE `Sets_Recommandes`(
    `set` VARCHAR(60),
    `personnage` VARCHAR(20),
    `option` VARCHAR(10),
    `nbr` INT,
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`set`) REFERENCES sets(`nom`),
    PRIMARY KEY(`personnage`, `set`, `option`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Drop Monstres

CREATE OR REPLACE TABLE `Drop_Monstres`(
    `monstre` VARCHAR(50),
    `materiel` VARCHAR(60),
    FOREIGN KEY (`monstre`) REFERENCES monstres(`nom`),
    FOREIGN KEY (`materiel`) REFERENCES materiaux(`nom`),
    PRIMARY KEY(`monstre`, `materiel`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Drop Donjons

CREATE OR REPLACE TABLE `Drop_Donjons`(
    `donjon` VARCHAR(50),
    `materiel` VARCHAR(60),
    `jour` VARCHAR(10),
    `jour2`VARCHAR(10),
    FOREIGN KEY (`donjon`) REFERENCES donjons(`nom`),
    FOREIGN KEY (`materiel`) REFERENCES materiaux(`nom`),
    PRIMARY KEY(`donjon`, `materiel`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Meilleurs Artefacts

CREATE OR REPLACE TABLE `Meilleurs_Artefacts`(
    `personnage` VARCHAR(20),
    `artefact` VARCHAR(20),
    `stat` VARCHAR(20) NOT NULL,
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`artefact`) REFERENCES artefacts(`type`),
    PRIMARY KEY(`personnage`, `artefact`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Donjons_Monstres

CREATE OR REPLACE TABLE `Donjons_Monstres`(
    `donjon` VARCHAR(50),
    `monstre` VARCHAR(50),
    FOREIGN KEY (`monstre`) REFERENCES monstres(`nom`),
    FOREIGN KEY (`donjon`) REFERENCES donjons(`nom`),
    PRIMARY KEY(`monstre`, `donjon`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Artéfacts Associés

CREATE OR REPLACE TABLE `Artefacts_Associes` (
    `personnage` VARCHAR(20),
    `artefact` VARCHAR(20),
    `set` VARCHAR(60),
    `stat` VARCHAR(20),
    `ssstat1` VARCHAR(20),
    `ssstat2` VARCHAR(20),
    `ssstat3` VARCHAR(20),
    `Lvl` INT NOT NULL,
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`artefact`) REFERENCES artefacts(`type`),
    FOREIGN KEY (`set`) REFERENCES sets(`nom`),
    PRIMARY KEY(`personnage`, `artefact`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-------------Clefs étrangères -----------------
-----------------------------------------------
ALTER TABLE `personnages` 
    ADD FOREIGN KEY (`region`) REFERENCES regions(`nom`);

ALTER TABLE `personnages` 
    ADD FOREIGN KEY (`element`) REFERENCES elements(`nom`);

ALTER TABLE `personnages` 
    ADD FOREIGN KEY (`type_arme`) REFERENCES types_arme(`nom`);

ALTER TABLE `armes` 
    ADD FOREIGN KEY (`type_arme`) REFERENCES types_arme(`nom`);

ALTER TABLE `armes_possedees` 
    ADD FOREIGN KEY (`nom`) REFERENCES armes(`nom`);

ALTER TABLE `donjons`
    ADD FOREIGN KEY (`region`) REFERENCES  regions(`nom`);

ALTER TABLE `materiaux` 
    ADD FOREIGN KEY (`donjon`) REFERENCES donjons(`nom`);
ALTER TABLE `materiaux`
    ADD FOREIGN KEY (`evolution`) REFERENCES  materiaux(`nom`);

ALTER TABLE `sets` 
    ADD FOREIGN KEY (`donjon`) REFERENCES donjons(`nom`);

ALTER TABLE `personnages`
    ADD FOREIGN KEY (`arme`,`id_arme`) REFERENCES armes_possedees(`nom`, `id`);


-----------------------------------------------
--------- Contraintes d'intégrité -------------
-----------------------------------------------

ALTER TABLE armes 
ADD CONSTRAINT armes_etoile CHECK(nbretoile BETWEEN 1 AND 5);

ALTER TABLE armes_associees
ADD CONSTRAINT armes_raffinage CHECK(raffinage BETWEEN 0 AND 5);

ALTER TABLE personnages 
ADD CONSTRAINT perso_etoile CHECK(nbretoile BETWEEN 4 AND 5);

ALTER TABLE pull_personnages
ADD CONSTRAINT pull_date CHECK(datefin>datedeb);

ALTER TABLE materiaux
ADD CONSTRAINT mat_jour CHECK(jour ="lundi" OR "mardi" OR "mercredi" OR "jeudi" OR "vendredi" OR "samedi");

ALTER TABLE materiaux
ADD CONSTRAINT mat_jour2 CHECK(jour2 = "lundi" OR "mardi" OR "mercredi" OR "jeudi" OR "vendredi" OR "samedi");


set foreign_key_checks = 1;
