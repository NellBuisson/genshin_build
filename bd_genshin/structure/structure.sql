-- Active: 1730657326662@@127.0.0.1@3306@genshin_build

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
    `nom` VARCHAR(10) PRIMARY KEY
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Armes

CREATE OR REPLACE TABLE `Armes` (
    `nom` VARCHAR(30), 
    `nbretoile` INT NOT NULL,
    `raffinage` INT,
    PRIMARY KEY(`nom`)
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
    PRIMARY KEY(`prenom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Regions

CREATE OR REPLACE TABLE `Regions`(
    `nom` VARCHAR(20),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Donjons

CREATE OR REPLACE TABLE `Donjons`(
    `nom` VARCHAR(20),
    `type` VARCHAR(20),
    `debloque` BOOL,
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Monstres

CREATE OR REPLACE TABLE `Monstres`(
    `nom` VARCHAR(20),
    `type` VARCHAR(20),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Materiaux

CREATE OR REPLACE TABLE `Materiaux`(
    `nom` VARCHAR(30),
    `niveau` VARCHAR(20) NOT NULL,
    `jour` VARCHAR(10),
    `donjon` VARCHAR(20),
    `evolution` VARCHAR(30),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Artefacts

CREATE OR REPLACE TABLE `Artefacts`(
    `type` VARCHAR(20),
    PRIMARY KEY(`type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Sets

CREATE OR REPLACE TABLE `Sets`(
    `nom` VARCHAR(60),
    `effet` VARCHAR(300) NOT NULL,
    `jour` VARCHAR(10) NOT NULL,
    `donjon` VARCHAR(30) NOT NULL,
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-------------Tables de liaison-----------------
-----------------------------------------------
-- Structure table Pull Personnages

CREATE OR REPLACE TABLE `Pull_Personnages`(
    `banniere` VARCHAR(10),
    `personnage` VARCHAR(20),
    `datedeb` date,
    `datefin` date,
    `obtenu` BOOL NOT NULL,
    FOREIGN KEY (`banniere`) REFERENCES bannieres(`nom`),
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    PRIMARY KEY(`banniere`, `personnage`, `datedeb`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Pull Armes

CREATE OR REPLACE TABLE `Pull_Armes`(
    `banniere` VARCHAR(10),
    `arme` VARCHAR(30),
    `datedeb` date,
    `datefin` date,
    `obtenu` BOOL NOT NULL,
    FOREIGN KEY (`banniere`) REFERENCES bannieres(`nom`),
    FOREIGN KEY (`arme`) REFERENCES armes(`nom`),
    PRIMARY KEY(`banniere`, `arme`, `datedeb`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Meilleures Armes

CREATE OR REPLACE TABLE `Meilleures_Armes`(
    `personnage` VARCHAR(20),
    `arme` VARCHAR(30),
    `rang` INT,
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`arme`) REFERENCES armes(`nom`),
    PRIMARY KEY(`personnage`, `arme`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Materiaux Armes

CREATE OR REPLACE TABLE `Meilleures_Armes`(
    `personnage` VARCHAR(20),
    `arme` VARCHAR(30),
    `rang` INT,
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`arme`) REFERENCES armes(`nom`),
    PRIMARY KEY(`personnage`, `arme`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Matériaux Armes

CREATE OR REPLACE TABLE `Materiaux_Armes`(
    `materiel` VARCHAR(30),
    `arme` VARCHAR(30),
    `niveau` INT,
    `fini` BOOL,
    `quantite` INT,
    FOREIGN KEY (`materiel`) REFERENCES materiaux(`nom`),
    FOREIGN KEY (`arme`) REFERENCES armes(`nom`),
    PRIMARY KEY(`materiel`, `arme`, `niveau`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Matériaux Personnages

CREATE OR REPLACE TABLE `Materiaux_Personnages`(
    `materiel` VARCHAR(30),
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
    `option` INT,
    `nbr` INT,
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`set`) REFERENCES sets(`nom`),
    PRIMARY KEY(`personnage`, `set`, `option`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Drop Monstres

CREATE OR REPLACE TABLE `Drop_Monstres`(
    `monstre` VARCHAR(20),
    `materiel` VARCHAR(30),
    FOREIGN KEY (`monstre`) REFERENCES monstres(`nom`),
    FOREIGN KEY (`materiel`) REFERENCES materiaux(`nom`),
    PRIMARY KEY(`monstre`, `materiel`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Meilleurs Artefacts

CREATE OR REPLACE TABLE `Meilleurs_Artefacts`(
    `personnage` VARCHAR(20),
    `artefact` VARCHAR(20),
    `stat` VARCHAR(20) NOT NULL,
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`artefact`) REFERENCES materiaux(`nom`),
    PRIMARY KEY(`personnage`, `artefact`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Donjons_Monstres

CREATE OR REPLACE TABLE `Donjons_Monstres`(
    `donjon` VARCHAR(30),
    `monstre` VARCHAR(20),
    FOREIGN KEY (`monstre`) REFERENCES monstres(`nom`),
    FOREIGN KEY (`donjon`) REFERENCES donjons(`nom`),
    PRIMARY KEY(`monstre`, `donjon`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;