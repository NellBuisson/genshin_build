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
-- Structure table Armes Attribuées

CREATE OR REPLACE TABLE `Armes_Attribuees` (
    `id` INT AUTO_INCREMENT,
    `nom` VARCHAR(50) NOT NULL,
    `lvl` INT NOT NULL,  
    `raffinage` INT DEFAULT 0,
    `personnage` VARCHAR(20),
    PRIMARY KEY (`id`)
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
    `constellation` INT DEFAULT 0,
    `niveau` INT DEFAULT 1,
    `niveau_atq_bas` INT DEFAULT 1,
    `niveau_atq_elm` INT DEFAULT 1,
    `niveau_atq_ult` INT DEFAULT 1,
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
    `donjon` VARCHAR(50),
    PRIMARY KEY(`nom`),
    FOREIGN KEY (`donjon`) REFERENCES donjons(`nom`)
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
-- Structure table Sets

CREATE OR REPLACE TABLE `Sets`(
    `nom` VARCHAR(60),
    `effet` VARCHAR(1100) NOT NULL,
    `donjon` VARCHAR(50),
    PRIMARY KEY(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Artefacts Attribués

CREATE OR REPLACE TABLE `Artefacts_Attribues` (
    `id` INT AUTO_INCREMENT,
    `type` VARCHAR(20) NOT NULL,
    `set` VARCHAR(60) NOT NULL,
    `lvl` INT DEFAULT 0,  
    `statP` VARCHAR(10) NOT NULL,
    `ssStat1` VARCHAR(10) NOT NULL,
    `ssStat2` VARCHAR(10) NOT NULL,
    `ssStat3` VARCHAR(10),
    `ssStat4` VARCHAR(10),
    `personnage` VARCHAR(20),    
    PRIMARY KEY (`id`),
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`type`) REFERENCES artefacts(`type`),
    FOREIGN KEY (`set`) REFERENCES sets(`nom`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-------------Tables de liaison-----------------
-----------------------------------------------
-- Structure table Pull Personnages

CREATE OR REPLACE TABLE `Pull_Personnages`(
    `banniere` VARCHAR(30),
    `datedeb` date,
    `datefin` date,
    `personnage5_1` VARCHAR(20),
    `personnage5_2` VARCHAR(20),
    `personnage4_1` VARCHAR(20),
    `personnage4_2` VARCHAR(20),
    `personnage4_3` VARCHAR(20),
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
    `type_build` VARCHAR(30),
    `rang` INT,
    `arme` VARCHAR(50),
    `raffinage` INT DEFAULT 1,
    `commentaire` VARCHAR(50),
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`arme`) REFERENCES armes(`nom`),
    PRIMARY KEY(`personnage`, `type_build`, `rang`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Matériaux Armes

CREATE OR REPLACE TABLE `Materiaux_Armes`(
    `arme` VARCHAR(50),
    `niveau` INT,
    `materiel` VARCHAR(60),
    `quantite` INT,
    FOREIGN KEY (`materiel`) REFERENCES materiaux(`nom`),
    FOREIGN KEY (`arme`) REFERENCES armes(`nom`),
    PRIMARY KEY(`materiel`, `arme`, `niveau`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Matériaux Personnages

CREATE OR REPLACE TABLE `Materiaux_Personnages`(
    `personnage` VARCHAR(20),
    `type` VARCHAR(20),
    `niveau` INT,
    `materiel` VARCHAR(60),
    `quantite` INT,
    FOREIGN KEY (`materiel`) REFERENCES materiaux(`nom`),
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    PRIMARY KEY(`materiel`, `personnage`, `niveau`, `type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-----------------------------------------------
-- Structure table Meilleurs Sets

CREATE OR REPLACE TABLE `Meilleurs_Sets`(
    `personnage` VARCHAR(20),
    `type_build` VARCHAR(30),
    `rang` INT,
    `set` VARCHAR(60),
    `nbr_art` INT,
    `commentaire` VARCHAR(50),
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`set`) REFERENCES sets(`nom`),
    PRIMARY KEY(`personnage`, `type_build`, `rang`, `set`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table sets_recommandes;

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
    `type_build` VARCHAR(30),
    `option` INT,
    `artefact` VARCHAR(20),
    `stat` VARCHAR(20) NOT NULL,
    `commentaire` VARCHAR(50),
    FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`),
    FOREIGN KEY (`artefact`) REFERENCES artefacts(`type`),
    PRIMARY KEY(`personnage`, `type_build`, `option`, `artefact`)
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

ALTER TABLE `armes_attribuees` 
    ADD FOREIGN KEY (`nom`) REFERENCES armes(`nom`);

ALTER TABLE `armes_attribuees` 
    ADD FOREIGN KEY (`personnage`) REFERENCES personnages(`prenom`);

ALTER TABLE `donjons`
    ADD FOREIGN KEY (`region`) REFERENCES  regions(`nom`);

ALTER TABLE `materiaux` 
    ADD FOREIGN KEY (`donjon`) REFERENCES donjons(`nom`);
ALTER TABLE `materiaux`
    ADD FOREIGN KEY (`evolution`) REFERENCES  materiaux(`nom`);

ALTER TABLE `sets` 
    ADD FOREIGN KEY (`donjon`) REFERENCES donjons(`nom`);



-----------------------------------------------
--------- Contraintes d'intégrité -------------
-----------------------------------------------

ALTER TABLE armes 
ADD CONSTRAINT armes_etoile CHECK(nbretoile BETWEEN 1 AND 5);

ALTER TABLE personnages 
ADD CONSTRAINT perso_etoile CHECK(nbretoile BETWEEN 4 AND 5);

ALTER TABLE monstres 
ADD CONSTRAINT monstres_type CHECK(`type` = "boss" OR `type` = "normal");

ALTER TABLE personnages 
ADD CONSTRAINT perso_constellation CHECK(constellation BETWEEN 0 AND 6);

ALTER TABLE pull_personnages
ADD CONSTRAINT pull_date CHECK(datefin>datedeb);

ALTER TABLE meilleures_armes
ADD CONSTRAINT meilleures_armes_raffinage CHECK(raffinage BETWEEN 1 AND 5);

ALTER TABLE armes_attribuees
ADD CONSTRAINT armes_attribuees_raffinage CHECK(raffinage BETWEEN 1 AND 5);

ALTER TABLE armes_attribuees
ADD CONSTRAINT armes_attribuees_lvl CHECK(lvl BETWEEN 1 AND 90);

ALTER TABLE artefacts_attribues
ADD CONSTRAINT artefacts_attribues_lvl CHECK(lvl BETWEEN 0 AND 20);
ALTER TABLE meilleurs_sets
ADD CONSTRAINT meilleurs_sets_nbr_art CHECK(nbr_art = 2 OR nbr_art = 4);

ALTER TABLE meilleurs_artefacts
ADD CONSTRAINT meilleurs_artefacts_nom CHECK(artefact = "Sablier" OR artefact = "Couronne" OR artefact = "Coupe");

ALTER TABLE personnages
ADD CONSTRAINT personnage_niveau CHECK(niveau BETWEEN 0 AND 90);

ALTER TABLE personnages
ADD CONSTRAINT personnage_lvl_atq_bas CHECK(niveau_atq_bas BETWEEN 1 AND 10);

-----------------------------------------------
----------------- Triggers --------------------
-----------------------------------------------

-- Trigger pour materiaux_armes
DELIMITER #

CREATE OR REPLACE TRIGGER before_insert_materiaux_armes
BEFORE INSERT
ON materiaux_armes
FOR EACH ROW
BEGIN
    SET @nbMat = NULL;
    -- vérifier qu'il n'y a pas plus de 4 matériaux pour une arme
    select COUNT(*) into @nbMat from materiaux_armes 
        where arme = NEW.arme AND niveau = NEW.niveau;
    IF (@nbMat > 4) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Insertion refusée. Trop de matériaux d'amélioration";
    END IF;
END #
DELIMITER ;

DELIMITER #

-- trigger pour meilleures_armes

DELIMITER #

CREATE OR REPLACE TRIGGER before_insert_meilleures_armes
BEFORE INSERT
ON meilleures_armes
FOR EACH ROW
BEGIN
    SET @typePerso = NULL;
    SET @typeArme = NULL;
    -- vérification de l'égalité des type arme entre la recommandation d'arme et celui du personnage
    select type_arme into @typePerso from personnages 
        where prenom = NEW.personnage;
    select type_arme into @typeArme from armes 
        where nom = NEW.arme;
    IF (@typeArme != @typePerso) THEN
    SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Insertion refusée. Le type d'arme du personnage et de l'arme ne correspondent pas.";
    END IF;

    IF (NEW.personnage = "Voyageur") THEN
    SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Insertion refusée. Le voyageur sans élément ne peut pas avoir de préférence d'arme. Choisir un élément";
    END IF;

    END #
DELIMITER ;

DELIMITER #

CREATE OR REPLACE TRIGGER before_update_meilleures_armes
BEFORE UPDATE
ON meilleures_armes
FOR EACH ROW
BEGIN
    SET @typePerso = NULL;
    SET @typeArme = NULL;
    -- vérification de l'égalité des type arme entre la recommandation d'arme et celui du personnage
    select type_arme into @typePerso from personnages 
        where prenom = NEW.personnage;
    select type_arme into @typeArme from armes 
        where nom = NEW.arme;
    IF (@typeArme != @typePerso) THEN
    SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Modification refusée. Le type d'arme du personnage et de la nouvelle arme ne correspondent pas.";
    END IF;
    END #
DELIMITER ;

-- trigger pour meilleur sets
DELIMITER #

CREATE OR REPLACE TRIGGER before_insert_meilleurs_sets
BEFORE INSERT
ON meilleurs_sets
FOR EACH ROW
BEGIN
    SET @Artefact = NULL;
    select sum(nbr_art) into @Artefact from meilleurs_sets
    where personnage = NEW.personnage AND type_build = NEW.type_build AND rang = NEW.rang;
    IF (@Artefact > 4) THEN
    SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Insertion refusée. Trop d'artefact inclu dans l'option rang";
    END IF;

    IF (NEW.personnage = "Voyageur") THEN
    SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Insertion refusée. Le voyageur sans élément ne peut pas avoir de préférence de sets. Choisir un élément";
    END IF;

END #
DELIMITER ;

DELIMITER #

CREATE OR REPLACE TRIGGER before_update_meilleurs_sets
BEFORE UPDATE
ON meilleurs_sets
FOR EACH ROW
BEGIN
    SET @Artefact = NULL;
    select sum(nbr_art) into @Artefact from meilleurs_sets
    where personnage = NEW.personnage AND type_build = NEW.type_build AND rang = NEW.rang;
    IF (@Artefact > 4) THEN
    SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Modification refusée. Trop d'artefact inclu dans l'option rang";
    END IF;

END #
DELIMITER ;

-- trigger pour meilleur sets

DELIMITER # 

CREATE OR REPLACE TRIGGER before_insert_meilleurs_artefacts
BEFORE INSERT
ON meilleurs_artefacts
FOR EACH ROW
BEGIN
    IF (NEW.personnage = "Voyageur") THEN
    SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Insertion refusée. Le voyageur sans élément ne peut pas avoir de préférence d'artefacts. Choisir un élément";
    END IF;
END #
DELIMITER ;

-- trigger pour personnages. 

DELIMITER #

CREATE OR REPLACE TRIGGER before_insert_personnages
BEFORE INSERT
ON personnages
FOR EACH ROW
BEGIN
    -- niveau atq elm limitation
    IF (NEW.constellation < 3) THEN 
        IF (NEW.niveau_atq_elm > 10) THEN 
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Insertion refusée. Niveau d'attaque élémentaire trop élevé.";
        END IF ;
    ELSE 
        IF (NEW.niveau_atq_elm > 13) THEN 
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Insertion refusée. Niveau d'attaque élémentaire trop élevé.";
        END IF ;
    END IF ;    
    -- niveau atq ult limitation
    IF (NEW.constellation < 3) THEN 
        IF (NEW.niveau_atq_ult > 10) THEN 
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Insertion refusée. Niveau d'attaque ultime trop élevé.";
        END IF ;
    ELSE 
        IF (NEW.niveau_atq_ult > 13) THEN 
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Insertion refusée. Niveau d'attaque ultime trop élevé.";
        END IF ;
    END IF ; 

    IF(NEW.possedee = FALSE AND (NEW.constellation != 0 OR NEW.niveau != 1)) THEN
        SET NEW.possedee = TRUE;
    END IF ;

END #

DELIMITER ;

DELIMITER #

CREATE OR REPLACE TRIGGER before_update_personnages
BEFORE UPDATE
ON personnages
FOR EACH ROW
BEGIN
    -- niveau atq elm limitation
    IF (NEW.constellation < 3) THEN 
        IF (NEW.niveau_atq_elm > 10) THEN 
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Modification refusée. Niveau d'attaque élémentaire trop élevé.";
        END IF ;
    ELSE 
        IF (NEW.niveau_atq_elm > 13) THEN 
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Modification refusée. Niveau d'attaque élémentaire trop élevé.";
        END IF ;
    END IF ;    
    -- niveau atq ult limitation
    IF (NEW.constellation < 3) THEN 
        IF (NEW.niveau_atq_ult > 10) THEN 
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Modification refusée. Niveau d'attaque ultime trop élevé.";
        END IF ;
    ELSE 
        IF (NEW.niveau_atq_ult > 13) THEN 
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Modification refusée. Niveau d'attaque ultime trop élevé.";
        END IF ;
    END IF ; 

    IF (OLD.possedee = 1 AND NEW.possedee = 0) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "On ne peut pas ne plus posséder un personnage.";
    END IF ;

    -- vérification niveau constellation
    IF (OLD.constellation > NEW.constellation) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "On ne peut pas baisser la constellation d'un personnage";
    END IF ;

    -- augmentation des matériaux personnages liés au nombre de constellation et des niveaux d'aptitude si non modifié
    IF(NEW.constellation >= 3 AND OLD.constellation < 3) THEN
        UPDATE materiaux_personnages
        SET niveau = niveau + 3
        WHERE personnage = NEW.prenom AND type = "aptitude element"
        ORDER BY niveau DESC;

        IF(NEW.niveau_atq_elm = OLD.niveau_atq_elm) THEN
            SET NEW.niveau_atq_elm = NEW.niveau_atq_elm  + 3;
        END IF ;

    END IF ;


    IF(NEW.constellation >= 5 AND OLD.constellation < 5) THEN
    
        UPDATE materiaux_personnages
        SET niveau = niveau + 3
        WHERE personnage = NEW.prenom AND type = "aptitude ult"
        ORDER BY niveau DESC;
        
        IF(NEW.niveau_atq_ult = OLD.niveau_atq_ult) THEN
            SET NEW.niveau_atq_ult = OLD.niveau_atq_ult +3;
        END IF ;
    END IF ;

    IF(NEW.possedee = FALSE AND (NEW.constellation != 0 OR NEW.niveau != 1)) THEN
        SET NEW.possedee = TRUE;
    END IF ;

    IF(NEW.nom != OLD.nom OR NEW.element != OLD.element OR NEW.nbretoile != OLD.nbretoile OR NEW.type_arme != OLD.type_arme) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Modification refusé. Une des caractéristiques modifiées est non modifiable.";
    END IF;

    IF (NEW.niveau < OLD.niveau OR NEW.niveau_atq_bas < OLD.niveau_atq_bas OR NEW.niveau_atq_elm < OLD.niveau_atq_elm OR NEW.niveau_atq_ult < OLD.niveau_atq_ult) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Modification refusé. Un personnage ne peut pas baisser de niveau.";
    END IF ;

    IF(NEW.prenom = "Voyageur" AND (NEW.constellation != 0 OR NEW.niveau_atq_bas != 1 OR NEW.niveau_atq_elm != 1 OR NEW.niveau_atq_ult != 1)) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Modification refusé. Le voyageur simple ne peut pas avoir de constellation ou de niveau d'aptitude, il faut choisir un élément";
    END IF ;

END #

DELIMITER ;


-- trigger pour materiaux personnages.     
DELIMITER #

CREATE OR REPLACE TRIGGER before_insert_materiaux_personnages
BEFORE INSERT
ON materiaux_personnages
FOR EACH ROW
BEGIN
    SET @type = NEW.type;
    IF(@type != "aptitude basique" AND @type != "aptitude element" AND @type != "aptitude ult" AND @type != "phase" AND @type != "entre phase") THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Le type n'existe pas.";
    END IF ;


    IF(@type = "phase" AND (NEW.niveau%10 != 0 OR NEW.niveau = 10 OR NEW.niveau = 30 OR NEW.niveau > 90)) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Pas de niveau d'élévation à ce niveau là.";
    END IF ;

    IF((@type = "aptitude basique" OR @type = "aptitude element" OR @type = "aptitude ult") AND NEW.personnage = "Voyageur") THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Le voyageur simple ne peut pas avoir d'aptitude.";
    END IF;

    IF(@type = "phase" AND (NEW.personnage = "Voyageur anémo" OR NEW.personnage = "Voyageur géo" OR NEW.personnage = "Voyageur électro" OR NEW.personnage = "Voyageur dendro" OR NEW.personnage = "Voyageur hydro" OR NEW.personnage = "Voyageur pyro" OR NEW.personnage = "Voyageur cryo")) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Le voyageur élémentaire n'a pas de matériaux d'évolution de phase'.";
    END IF;
END #
DELIMITER ;

DELIMITER #

CREATE OR REPLACE TRIGGER before_update_materiaux_personnages
BEFORE UPDATE
ON materiaux_personnages
FOR EACH ROW
BEGIN

    SET @type = NEW.type;
    IF(@type != "aptitude basique" AND @type != "aptitude element" AND @type != "aptitude ult" AND @type != "phase" AND @type != "entre phase") THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Le type n'existe pas.";
    END IF ;


    IF(@type = "phase" AND (NEW.niveau%10 != 0 OR NEW.niveau = 10 OR NEW.niveau = 30 OR NEW.niveau > 90)) THEN
        SIGNAL SQLSTATE "45000"
        SET MESSAGE_TEXT = "Pas de niveau d'élévation à ce niveau là.";
    END IF ;

END #
DELIMITER ;

-- trigger pour armes attribuees
DELIMITER #

CREATE OR REPLACE TRIGGER before_insert_armes_attribuees
BEFORE INSERT
ON armes_attribuees
FOR EACH ROW
BEGIN
    -- vérifier que le type d'arme de l'arme et celui du personnage corresponde.
    IF(NEW.personnage IS NOT NULL) THEN
        SET @typePerso = NULL;
        SELECT type_arme INTO @typePerso FROM personnages
            WHERE prenom = NEW.personnage;
        
        SET @typeArme = NULL;
        SELECT type_arme INTO @typeArme FROM armes
            WHERE nom = NEW.nom;
        
        IF(@typePerso != @TypeArme) THEN
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Ce n'est pas le bon type d'arme pour ce personnage.";
        END IF ;

        -- vérifie que le personnage n'a qu'une arme attibuée

        SET @Autre = NULL;
        SELECT id INTO @Autre FROM armes_attribuees
            WHERE personnage = NEW.personnage;
        
        IF(@Autre != "") THEN
            UPDATE armes_attribuees
            SET personnage = NULL
            WHERE id = @Autre;
        END IF ;
    END IF ;
END #
DELIMITER ;

DELIMITER #

CREATE OR REPLACE TRIGGER before_update_armes_attribuees
BEFORE UPDATE
ON armes_attribuees
FOR EACH ROW
BEGIN
    IF(NEW.personnage != OLD.personnage OR NEW.personnage != "") THEN
        SET @typePerso = NULL;
        SELECT type_arme INTO @typePerso FROM personnages
            WHERE prenom = NEW.personnage;

        SET @typeArme = NULL;
        SELECT type_arme INTO @typeArme FROM armes
            WHERE nom = NEW.nom;
        
        IF(@typePerso != @TypeArme) THEN
            SIGNAL SQLSTATE "45000"
            SET MESSAGE_TEXT = "Ce n'est pas le bon type d'arme pour ce personnage.";
        END IF ;
        
        SET @Autre = NULL;
        SELECT id INTO @Autre FROM armes_attribuees
            WHERE personnage = NEW.personnage;
        
        IF(@Autre != "" AND NEW.nom != OLD.nom) THEN
            UPDATE armes_attribuees
            SET personnage = NULL
            WHERE id = @Autre;
        END IF ;
    END IF ;
END #
DELIMITER ;

-- trigger pour artefacts attribues 
-----------------------------------------------
------------------ Fonction -------------------
-----------------------------------------------

-- création de la fonction pour automatiser la récupération du type de monstre qui drop un type de matériel. 
DELIMITER #

CREATE OR REPLACE FUNCTION recuperationTypeMonstreMat(p_materiel VARCHAR(60)) RETURNS VARCHAR(20)
BEGIN
    SET @type = "";
    SELECT type INTO @type FROM monstres
    WHERE nom = (SELECT monstre FROM drop_monstres
                WHERE materiel = p_materiel GROUP BY materiel);
    RETURN @type;
END #
DELIMITER ;


-- création de la fonction pour automatiser la récupération du donjon qui drop un type de matériel. 
DELIMITER #

CREATE OR REPLACE FUNCTION recuperationDonjonMat(p_materiel VARCHAR(60)) RETURNS VARCHAR(50)
BEGIN
    SET @donjon = "";
    SELECT donjon INTO @donjon FROM drop_donjons
    WHERE materiel = p_materiel
    GROUP BY materiel;
    RETURN @donjon;
END #
DELIMITER ;

-----------------------------------------------
----------------- Procedure -------------------
-----------------------------------------------
-- Création de la procedure pour automatiser l'entrée des matériaux d'amélioration d'arme
DELIMITER #

CREATE OR REPLACE PROCEDURE elevationArme (p_nom VARCHAR(50), p_mat1 VARCHAR(60), p_mat2 VARCHAR(60), p_mat3 VARCHAR(60))
BEGIN
    set @newMat1 = NULL;
    set @newMat2 = NULL;
    set @newMat3 = NULL;
    set @nbrEtoile = NULL;
    select nbretoile into @nbrEtoile FROM armes
        where nom = p_nom;
    IF (@nbrEtoile = 5) THEN
        insert into materiaux_armes
        values(p_nom,20,p_mat1, 5),
        (p_nom,20,p_mat2, 5),
        (p_nom,20,p_mat3, 3),
        (p_nom,20,"Moras", 10000);

        select evolution into @newMat1 from materiaux where nom = p_mat1;
        insert into materiaux_armes
        values(p_nom,40, @newMat1, 5),
        (p_nom,40,p_mat2, 18),
        (p_nom,40,p_mat3, 12),
        (p_nom,40,"Moras", 20000);

        select evolution into @newMat2 from materiaux where nom = p_mat2;
        select evolution into @newMat3 from materiaux where nom = p_mat3;
        insert into materiaux_armes
        values(p_nom,50, @newMat1, 9),
        (p_nom,50,@newMat2, 9),
        (p_nom,50,@newMat3, 9),
        (p_nom,50,"Moras", 30000);

        select evolution into @newMat1 from materiaux where nom = @newMat1;

        insert into materiaux_armes
        values(p_nom,60, @newMat1, 5),
        (p_nom,60,@newMat2, 18),
        (p_nom,60,@newMat3, 14),
        (p_nom,60,"Moras", 45000);

        select evolution into @newMat2 from materiaux where nom = @newMat2;
        select evolution into @newMat3 from materiaux where nom = @newMat3;
        insert into materiaux_armes
        values(p_nom,70, @newMat1, 9),
        (p_nom,70,@newMat2, 14),
        (p_nom,70,@newMat3, 9),
        (p_nom,70,"Moras", 55000);

        select evolution into @newMat1 from materiaux where nom = @newMat1;

        insert into materiaux_armes
        values(p_nom,80, @newMat1, 6),
        (p_nom,80,@newMat2, 18),
        (p_nom,80,@newMat3, 27),
        (p_nom,80,"Moras", 65000);

    END IF ;

    IF (@nbrEtoile = 4) THEN
        insert into materiaux_armes
        values(p_nom,20,p_mat1, 3),
        (p_nom,20,p_mat2, 3),
        (p_nom,20,p_mat3, 2),
        (p_nom,20,"Moras", 5000);

        select evolution into @newMat1 from materiaux where nom = p_mat1;
        insert into materiaux_armes
        values(p_nom,40, @newMat1, 3),
        (p_nom,40,p_mat2, 12),
        (p_nom,40,p_mat3, 8),
        (p_nom,40,"Moras", 15000);

        select evolution into @newMat2 from materiaux where nom = p_mat2;
        select evolution into @newMat3 from materiaux where nom = p_mat3;
        insert into materiaux_armes
        values(p_nom,50, @newMat1, 6),
        (p_nom,50,@newMat2, 6),
        (p_nom,50,@newMat3, 6),
        (p_nom,50,"Moras", 20000);

        select evolution into @newMat1 from materiaux where nom = @newMat1;

        insert into materiaux_armes
        values(p_nom,60, @newMat1, 3),
        (p_nom,60,@newMat2, 12),
        (p_nom,60,@newMat3, 9),
        (p_nom,60,"Moras", 30000);

        select evolution into @newMat2 from materiaux where nom = @newMat2;
        select evolution into @newMat3 from materiaux where nom = @newMat3;
        insert into materiaux_armes
        values(p_nom,70, @newMat1, 6),
        (p_nom,70,@newMat2, 9),
        (p_nom,70,@newMat3, 6),
        (p_nom,70,"Moras", 35000);

        select evolution into @newMat1 from materiaux where nom = @newMat1;

        insert into materiaux_armes
        values(p_nom,80, @newMat1, 4),
        (p_nom,80,@newMat2, 18),
        (p_nom,80,@newMat3, 14),
        (p_nom,80,"Moras", 45000);

    END IF ;

    IF (@nbrEtoile = 3) THEN
        insert into materiaux_armes
        values(p_nom,20,p_mat1, 2),
        (p_nom,20,p_mat2, 2),
        (p_nom,20,p_mat3, 1),
        (p_nom,20,"Moras", 5000);

        select evolution into @newMat1 from materiaux where nom = p_mat1;
        insert into materiaux_armes
        values(p_nom,40, @newMat1, 2),
        (p_nom,40,p_mat2, 8),
        (p_nom,40,p_mat3, 5),
        (p_nom,40,"Moras", 10000);

        select evolution into @newMat2 from materiaux where nom = p_mat2;
        select evolution into @newMat3 from materiaux where nom = p_mat3;
        insert into materiaux_armes
        values(p_nom,50, @newMat1, 4),
        (p_nom,50,@newMat2, 4),
        (p_nom,50,@newMat3, 4),
        (p_nom,50,"Moras", 15000);

        select evolution into @newMat1 from materiaux where nom = @newMat1;

        insert into materiaux_armes
        values(p_nom,60, @newMat1, 2),
        (p_nom,60,@newMat2, 8),
        (p_nom,60,@newMat3, 6),
        (p_nom,60,"Moras", 20000);

        select evolution into @newMat2 from materiaux where nom = @newMat2;
        select evolution into @newMat3 from materiaux where nom = @newMat3;
        insert into materiaux_armes
        values(p_nom,70, @newMat1, 4),
        (p_nom,70,@newMat2, 6),
        (p_nom,70,@newMat3, 4),
        (p_nom,70,"Moras", 25000);

        select evolution into @newMat1 from materiaux where nom = @newMat1;

        insert into materiaux_armes
        values(p_nom,80, @newMat1, 3),
        (p_nom,80,@newMat2, 12),
        (p_nom,80,@newMat3, 8),
        (p_nom,80,"Moras", 30000);

    END IF ;

    IF (@nbrEtoile = 2) THEN
        insert into materiaux_armes
        values(p_nom,20,p_mat1, 1),
        (p_nom,20,p_mat2, 1),
        (p_nom,20,p_mat3, 1),
        (p_nom,20,"Moras", 5000);

        select evolution into @newMat1 from materiaux where nom = p_mat1;
        insert into materiaux_armes
        values(p_nom,40, @newMat1, 1),
        (p_nom,40,p_mat2, 5),
        (p_nom,40,p_mat3, 4),
        (p_nom,40,"Moras", 5000);

        select evolution into @newMat2 from materiaux where nom = p_mat2;
        select evolution into @newMat3 from materiaux where nom = p_mat3;
        insert into materiaux_armes
        values(p_nom,50, @newMat1, 3),
        (p_nom,50,@newMat2, 3),
        (p_nom,50,@newMat3, 3),
        (p_nom,50,"Moras", 10000);

        select evolution into @newMat1 from materiaux where nom = @newMat1;

        insert into materiaux_armes
        values(p_nom,60, @newMat1, 1),
        (p_nom,60,@newMat2, 5),
        (p_nom,60,@newMat3, 4),
        (p_nom,60,"Moras", 15000);

    END IF ;

    IF (@nbrEtoile = 1) THEN
        insert into materiaux_armes
        values(p_nom,20,p_mat1, 1),
        (p_nom,20,p_mat2, 1),
        (p_nom,20,p_mat3, 1);

        select evolution into @newMat1 from materiaux where nom = p_mat1;
        insert into materiaux_armes
        values(p_nom,40, @newMat1, 1),
        (p_nom,40,p_mat2, 4),
        (p_nom,40,p_mat3, 2),
        (p_nom,40,"Moras", 5000);

        select evolution into @newMat2 from materiaux where nom = p_mat2;
        select evolution into @newMat3 from materiaux where nom = p_mat3;
        insert into materiaux_armes
        values(p_nom,50, @newMat1, 2),
        (p_nom,50,@newMat2, 2),
        (p_nom,50,@newMat3, 2),
        (p_nom,50,"Moras", 5000);

        select evolution into @newMat1 from materiaux where nom = @newMat1;

        insert into materiaux_armes
        values(p_nom,60, @newMat1, 1),
        (p_nom,60,@newMat2, 4),
        (p_nom,60,@newMat3, 3),
        (p_nom,60,"Moras", 10000);

    END IF ;
END #
DELIMITER ;

-- création de la procedure pour automatiser l'entrée des matériels et de leurs évolution en tant que drop monstre
DELIMITER #

CREATE OR REPLACE PROCEDURE dropMonstre(p_monstre VARCHAR(50), p_matbase VARCHAR(60))
BEGIN
    -- on insert le matériel de base dans la table
    INSERT INTO drop_monstres
    VALUES(p_monstre, p_matbase);

    -- on vérifie si il a une évolution
    SET @evol = "" ;
    SELECT evolution INTO @evol FROM materiaux WHERE lower(nom) = lower(p_matbase);
    
    -- si il a une évolution, on insert aussi l'évolution. Sachant qu'un matériel, si il a une évolution, il en a au moins 2 (et max 3).
    IF (@evol != "") THEN 
        -- insertion première évolution
        INSERT INTO drop_monstres
        VALUES(p_monstre, @evol);

        -- insertion deuxième
        SELECT evolution INTO @evol FROM materiaux WHERE lower(nom) = lower(@evol);
        INSERT INTO drop_monstres
        VALUES(p_monstre, @evol);

        -- vérification existence 3ème évolution et insertion si existe
        SELECT evolution INTO @evol FROM materiaux WHERE lower(nom) = lower(@evol);

        IF (@evol != "") THEN 
            INSERT INTO drop_monstres
            VALUES(p_monstre, @evol);
        END IF ;
        
    END IF ;
END #

DELIMITER ;

-- création de la procedure materiaux_personnages

-- création de la sous procedure pour les materiaux d'aptitude
DELIMITER #


CREATE OR REPLACE PROCEDURE AjoutMateriauxAptitude (p_personnage VARCHAR(20), p_type VARCHAR(20), p_matMonstre VARCHAR(60), p_matelev VARCHAR(60), p_matUltraBoss VARCHAR(60))
BEGIN
    SET @matMonstre = NULL;
    SET @matElev = NULL;

    INSERT INTO materiaux_personnages
    values(p_personnage, p_type, 2, "Moras", 12500),
    (p_personnage, p_type, 2, p_matelev, 3),
    (p_personnage, p_type, 2, p_matMonstre, 6);

    select evolution into @matMonstre from materiaux where nom = p_matMonstre;
    select evolution into @matElev from materiaux where nom = p_matelev;

    INSERT INTO materiaux_personnages
    values(p_personnage, p_type, 3, "Moras", 17500),
    (p_personnage, p_type, 3, @matElev, 2),
    (p_personnage, p_type, 3, @matMonstre, 3),
    (p_personnage, p_type, 4, "Moras", 25000),
    (p_personnage, p_type, 4, @matElev, 4),
    (p_personnage, p_type, 4, @matMonstre, 4),
    (p_personnage, p_type, 5, "Moras", 30000),
    (p_personnage, p_type, 5, @matElev, 6),
    (p_personnage, p_type, 5, @matMonstre, 6),
    (p_personnage, p_type, 6, "Moras", 37500),
    (p_personnage, p_type, 6, @matElev, 9),
    (p_personnage, p_type, 6, @matMonstre, 9);

    select evolution into @matMonstre from materiaux where nom = @matMonstre;
    select evolution into @matElev from materiaux where nom = @matElev;

    INSERT INTO materiaux_personnages
    values(p_personnage, p_type, 7, "Moras", 120000),
    (p_personnage, p_type, 7, @matElev, 4),
    (p_personnage, p_type, 7, @matMonstre, 4),
    (p_personnage, p_type, 7, p_matUltraBoss, 1),
    (p_personnage, p_type, 8, "Moras", 260000),
    (p_personnage, p_type, 8, @matElev, 6),
    (p_personnage, p_type, 8, @matMonstre, 6),
    (p_personnage, p_type, 8, p_matUltraBoss, 1),
    (p_personnage, p_type, 9, "Moras", 450000),
    (p_personnage, p_type, 9, @matElev, 12),
    (p_personnage, p_type, 9, @matMonstre, 9),
    (p_personnage, p_type, 9, p_matUltraBoss, 2),
    (p_personnage, p_type, 10, "Moras", 700000),
    (p_personnage, p_type, 10, @matElev, 16),
    (p_personnage, p_type, 10, @matMonstre, 12),
    (p_personnage, p_type, 10, p_matUltraBoss, 2),
    (p_personnage, p_type, 10, "Couronne de la sagesse", 1);

END #
DELIMITER ;

-- procedure princiale
DELIMITER #

CREATE OR REPLACE PROCEDURE AjoutmateriauxPersonnages(p_personnage VARCHAR(20), p_pierre VARCHAR(60), p_matBoss VARCHAR(60), p_matMonstre VARCHAR(60), p_herbe VARCHAR(60), p_matelev VARCHAR(60), p_matUltraBoss VARCHAR(60)) 
BEGIN
    SET @erreur = 0;
    SET @type = "";
    SET @donjon = "";

    -- vérifions que p_pierre est bien un butin de boss commençant par la bonne appelation. 

    SELECT `recuperationTypeMonstreMat`(p_pierre) INTO @type;

    IF(@type != "boss" AND p_personnage != "Voyageur") THEN
        SET @erreur = 1;
    END IF ;

    -- vérifions que p_matboss est bien issu d'un matériel de boss.
    SELECT `recuperationTypeMonstreMat`(p_matBoss) INTO @type;

    IF(@type != "boss" AND p_personnage != "Voyageur") THEN
        SET @erreur = 1;
    END IF ;

    -- vérifions que p_matMonstre vient d'un monstre élite ou normal.
    SELECT `recuperationTypeMonstreMat`(p_matMonstre) INTO @type;

    IF(@type != "normal") THEN
        SET @erreur = 1;
    END IF ;

    -- vérifions que p_herbe n'est pas drop par un monstre ni dans un donjon
    SELECT `recuperationTypeMonstreMat`(p_herbe) INTO @type;
    SELECT `recuperationDonjonMat`(p_herbe) INTO @donjon;

    IF(@type != "" OR @donjon != "") THEN
        SET @erreur = 1;
    END IF ;

    -- vérifions que p_matelev est bien issu d'un donjon d'élevation d'aptitude
    SELECT `recuperationDonjonMat`(p_matelev) INTO @donjon;
    SELECT type INTO @type FROM donjons WHERE nom = @donjon;

    IF(@type != "matériaux d'élévation d'aptitude" AND p_personnage != "Voyageur") THEN 
        SET @erreur = 1;
    END IF ;

    -- vérifions que p_matUltraBoss est bien issu d'un ultraboss
    SELECT donjon INTO @donjon FROM drop_donjons
    WHERE materiel = p_matUltraBoss AND jour IS NULL;
    IF(@donjon IS NULL AND p_personnage != "Voyageur") THEN 

        SET @erreur = 1;
    END IF ;
    
    IF(@erreur = 0) THEN
        -- matériaux élevation basique
        SET @matMonstre = NULL;
        SET @matPierre = NULL;

        INSERT INTO materiaux_personnages

        values(p_personnage, "phase", 20, "Moras", 20000),
        (p_personnage, "phase", 20, p_pierre, 1),
        (p_personnage, "phase", 20, p_herbe, 3),
        (p_personnage, "phase", 20, p_matMonstre, 3),
        (p_personnage, "entre phase", 20, "Moras", 24000),
        (p_personnage, "entre phase", 20, "Leçon du héros", 6),
        (p_personnage, "entre phase", 40, "Moras", 116000),
        (p_personnage, "entre phase", 40, "Leçon du héros", 29);

        IF(p_personnage != "Voyageur") THEN 
            select evolution into @matPierre from materiaux where nom = p_pierre;
        ELSE 
            select p_pierre into @matPierre;
        END IF;

        INSERT INTO materiaux_personnages
        values(p_personnage, "phase", 40, "Moras", 40000),
        (p_personnage, "phase", 40, @matPierre, 3),
        (p_personnage, "phase", 40, p_herbe, 10),
        (p_personnage, "phase", 40, p_matMonstre, 15),
        (p_personnage, "entre phase", 50, "Moras", 100000),
        (p_personnage, "entre phase", 50, "Leçon du héros", 26);

        select evolution into @matMonstre from materiaux where nom = p_matMonstre;

        INSERT INTO materiaux_personnages
        values(p_personnage, "phase", 50, "Moras", 60000),
        (p_personnage, "phase", 50, @matPierre, 6),
        (p_personnage, "phase", 50, p_herbe, 20),
        (p_personnage, "phase", 50, @matMonstre, 12),
        (p_personnage, "entre phase", 60, "Moras", 170000),
        (p_personnage, "entre phase", 60, "Leçon du héros", 43);

        IF(p_personnage != "Voyageur") THEN 
            select evolution into @matPierre from materiaux where nom = @matPierre;
        ELSE 
            select p_pierre into @matPierre;
        END IF ;

        INSERT INTO materiaux_personnages
        values(p_personnage, "phase", 60, "Moras", 80000),
        (p_personnage, "phase", 60, @matPierre, 3),
        (p_personnage, "phase", 60, p_herbe, 30),
        (p_personnage, "phase", 60, @matMonstre, 18),
        (p_personnage, "entre phase", 70, "Moras", 240000),
        (p_personnage, "entre phase", 70, "Leçon du héros", 60);

        select evolution into @matMonstre from materiaux where nom = @matMonstre;

        INSERT INTO materiaux_personnages
        values(p_personnage, "phase", 70, "Moras", 100000),
        (p_personnage, "phase", 70, @matPierre, 6),
        (p_personnage, "phase", 70, p_herbe, 45),
        (p_personnage, "phase", 70, @matMonstre, 12),
        (p_personnage, "entre phase", 80, "Moras", 324000),
        (p_personnage, "entre phase", 80, "Leçon du héros", 81);

        IF(p_personnage != "Voyageur") THEN 
            select evolution into @matPierre from materiaux where nom = @matPierre;
        ELSE 
            select p_pierre into @matPierre;
        END IF;

        INSERT INTO materiaux_personnages
        values(p_personnage, "phase", 80, "Moras", 120000),
        (p_personnage, "phase", 80, @matPierre, 6),
        (p_personnage, "phase", 80, p_herbe, 60),
        (p_personnage, "phase", 80, @matMonstre, 24),
        (p_personnage, "entre phase", 90, "Moras", 688000),
        (p_personnage, "entre phase", 90, "Leçon du héros", 172);

        -- matériaux élevation et materieux boss
        IF (p_personnage != "Voyageur") THEN 

            INSERT INTO materiaux_personnages
            values(p_personnage, "phase", 40, p_matBoss, 2),
            (p_personnage, "phase", 50, p_matBoss, 4),
            (p_personnage, "phase", 60, p_matBoss, 8),
            (p_personnage, "phase", 70, p_matBoss, 12),
            (p_personnage, "phase", 80, p_matBoss, 20);

            CALL `AjoutMateriauxAptitude`(p_personnage, "aptitude basique", p_matMonstre, p_matelev, p_matUltraBoss);
            CALL `AjoutMateriauxAptitude`(p_personnage, "aptitude element", p_matMonstre, p_matelev, p_matUltraBoss);
            CALL `AjoutMateriauxAptitude`(p_personnage, "aptitude ult", p_matMonstre, p_matelev, p_matUltraBoss);
        END IF ;
    END IF ;
END #
DELIMITER ;

-- Procedure pour les materiaux des voyageurs (excepté le géo qui est une exception dans l'exception)
DELIMITER #

CREATE OR REPLACE PROCEDURE AjoutMateriauxAptVoyageur (p_personnage VARCHAR(20), p_matMonstre VARCHAR(60), p_matelev1 VARCHAR(60), p_matelev2 VARCHAR(60), p_matelev3 VARCHAR(60),p_matUltraBoss VARCHAR(60))
BEGIN
    SET @matMonstre = NULL;
    SET @matElev1 = NULL;
    SET @matElev2 = NULL;
    SET @matElev3 = NULL;
    SET @perso = NULL;

    SELECT prenom INTO @perso FROM personnages
        WHERE prenom = p_personnage AND prenom like "Voyageur %" AND prenom != "Voyageur géo";

    IF (@perso != "") THEN
        INSERT INTO materiaux_personnages
            VALUES(p_personnage, "aptitude basique", 2, "Moras", 12500),
            (p_personnage, "aptitude basique", 2, p_matelev1, 3),
            (p_personnage, "aptitude basique", 2, p_matMonstre, 6),
            (p_personnage, "aptitude element", 2, "Moras", 12500),
            (p_personnage, "aptitude element", 2, p_matelev1, 3),
            (p_personnage, "aptitude element", 2, p_matMonstre, 6),
            (p_personnage, "aptitude ult", 2, "Moras", 12500),
            (p_personnage, "aptitude ult", 2, p_matelev1, 3),
            (p_personnage, "aptitude ult", 2, p_matMonstre, 6);


        select evolution into @matMonstre from materiaux where nom = p_matMonstre;
        select evolution into @matElev1 from materiaux where nom = p_matelev1;
        select evolution into @matElev2 from materiaux where nom = p_matelev2;
        select evolution into @matElev3 from materiaux where nom = p_matelev3;

        INSERT INTO materiaux_personnages
        VALUES(p_personnage, "aptitude basique", 3, "Moras", 17500),
        (p_personnage, "aptitude basique", 3, @matElev2, 2),
        (p_personnage, "aptitude basique", 3, @matMonstre, 3),
        (p_personnage, "aptitude element", 3, "Moras", 17500),
        (p_personnage, "aptitude element", 3, @matElev2, 2),
        (p_personnage, "aptitude element", 3, @matMonstre, 3),
        (p_personnage, "aptitude ult", 3, "Moras", 17500),
        (p_personnage, "aptitude ult", 3, @matElev2, 2),
        (p_personnage, "aptitude ult", 3, @matMonstre, 3),
        (p_personnage, "aptitude basique", 4, "Moras", 25000),
        (p_personnage, "aptitude basique", 4, @matElev3, 4),
        (p_personnage, "aptitude basique", 4, @matMonstre, 4),
        (p_personnage, "aptitude element", 4, "Moras", 25000),
        (p_personnage, "aptitude element", 4, @matElev3, 4),
        (p_personnage, "aptitude element", 4, @matMonstre, 4),
        (p_personnage, "aptitude ult", 4, "Moras", 25000),
        (p_personnage, "aptitude ult", 4, @matElev3, 4),
        (p_personnage, "aptitude ult", 4, @matMonstre, 4),
        (p_personnage, "aptitude basique", 5, "Moras", 30000),
        (p_personnage, "aptitude basique", 5, @matElev1, 6),
        (p_personnage, "aptitude basique", 5, @matMonstre, 6),
        (p_personnage, "aptitude element", 5, "Moras", 30000),
        (p_personnage, "aptitude element", 5, @matElev1, 6),
        (p_personnage, "aptitude element", 5, @matMonstre, 6),
        (p_personnage, "aptitude ult", 5, "Moras", 30000),
        (p_personnage, "aptitude ult", 5, @matElev1, 6),
        (p_personnage, "aptitude ult", 5, @matMonstre, 6),
        (p_personnage, "aptitude basique", 6, "Moras", 37500),
        (p_personnage, "aptitude basique", 6, @matElev2, 9),
        (p_personnage, "aptitude basique", 6, @matMonstre, 9),
        (p_personnage, "aptitude element", 6, "Moras", 37500),
        (p_personnage, "aptitude element", 6, @matElev2, 9),
        (p_personnage, "aptitude element", 6, @matMonstre, 9),
        (p_personnage, "aptitude ult", 6, "Moras", 37500),
        (p_personnage, "aptitude ult", 6, @matElev2, 9),
        (p_personnage, "aptitude ult", 6, @matMonstre, 9);

        select evolution into @matMonstre from materiaux where nom = @matMonstre;
        select evolution into @matElev1 from materiaux where nom = @matElev1;
        select evolution into @matElev2 from materiaux where nom = @matElev2;
        select evolution into @matElev3 from materiaux where nom = @matElev3;

        INSERT INTO materiaux_personnages
        VALUES(p_personnage, "aptitude basique", 7, "Moras", 120000),
        (p_personnage, "aptitude basique", 7, @matElev3, 4),
        (p_personnage, "aptitude basique", 7, @matMonstre, 4),
        (p_personnage, "aptitude basique", 7, p_matUltraBoss, 1),
        (p_personnage, "aptitude element", 7, "Moras", 120000),
        (p_personnage, "aptitude element", 7, @matElev3, 4),
        (p_personnage, "aptitude element", 7, @matMonstre, 4),
        (p_personnage, "aptitude element", 7, p_matUltraBoss, 1),
        (p_personnage, "aptitude ult", 7, "Moras", 120000),
        (p_personnage, "aptitude ult", 7, @matElev3, 4),
        (p_personnage, "aptitude ult", 7, @matMonstre, 4),
        (p_personnage, "aptitude ult", 7, p_matUltraBoss, 1),
        (p_personnage, "aptitude basique", 8, "Moras", 260000),
        (p_personnage, "aptitude basique", 8, @matElev1, 6),
        (p_personnage, "aptitude basique", 8, @matMonstre, 6),
        (p_personnage, "aptitude basique", 8, p_matUltraBoss, 1),
        (p_personnage, "aptitude element", 8, "Moras", 260000),
        (p_personnage, "aptitude element", 8, @matElev1, 6),
        (p_personnage, "aptitude element", 8, @matMonstre, 6),
        (p_personnage, "aptitude element", 8, p_matUltraBoss, 1),
        (p_personnage, "aptitude ult", 8, "Moras", 260000),
        (p_personnage, "aptitude ult", 8, @matElev1, 6),
        (p_personnage, "aptitude ult", 8, @matMonstre, 6),
        (p_personnage, "aptitude ult", 8, p_matUltraBoss, 1),
        (p_personnage, "aptitude basique", 9, "Moras", 450000),
        (p_personnage, "aptitude basique", 9, @matElev2, 12),
        (p_personnage, "aptitude basique", 9, @matMonstre, 9),
        (p_personnage, "aptitude basique", 9, p_matUltraBoss, 2),
        (p_personnage, "aptitude element", 9, "Moras", 450000),
        (p_personnage, "aptitude element", 9, @matElev2, 12),
        (p_personnage, "aptitude element", 9, @matMonstre, 9),
        (p_personnage, "aptitude element", 9, p_matUltraBoss, 2),
        (p_personnage, "aptitude ult", 9, "Moras", 450000),
        (p_personnage, "aptitude ult", 9, @matElev2, 12),
        (p_personnage, "aptitude ult", 9, @matMonstre, 9),
        (p_personnage, "aptitude ult", 9, p_matUltraBoss, 2),
        (p_personnage, "aptitude basique", 10, "Moras", 700000),
        (p_personnage, "aptitude basique", 10, @matElev3, 16),
        (p_personnage, "aptitude basique", 10, @matMonstre, 12),
        (p_personnage, "aptitude basique", 10, p_matUltraBoss, 2),
        (p_personnage, "aptitude basique", 10, "Couronne de la sagesse", 1),
        (p_personnage, "aptitude element", 10, "Moras", 700000),
        (p_personnage, "aptitude element", 10, @matElev3, 16),
        (p_personnage, "aptitude element", 10, @matMonstre, 12),
        (p_personnage, "aptitude element", 10, p_matUltraBoss, 2),
        (p_personnage, "aptitude element", 10, "Couronne de la sagesse", 1),
        (p_personnage, "aptitude ult", 10, "Moras", 700000),
        (p_personnage, "aptitude ult", 10, @matElev3, 16),
        (p_personnage, "aptitude ult", 10, @matMonstre, 12),
        (p_personnage, "aptitude ult", 10, p_matUltraBoss, 2),
        (p_personnage, "aptitude ult", 10, "Couronne de la sagesse", 1);

        END IF;

END #
DELIMITER ;

-- Personnage obtenu

DELIMITER #

CREATE OR REPLACE PROCEDURE persoObtenu(p_prenom VARCHAR(20))
BEGIN
    UPDATE personnages
    SET possedee = TRUE
    WHERE prenom = p_prenom;
END #
DELIMITER ;

-- modification de constellation
DELIMITER #

CREATE OR REPLACE PROCEDURE AugConstellation(p_prenom VARCHAR(20), p_cons INT)
BEGIN
    UPDATE personnages
    SET constellation = p_cons
    WHERE prenom = p_prenom;
END #
DELIMITER ;

-- modification de lvl 
DELIMITER #

CREATE OR REPLACE PROCEDURE AugNiveau(p_prenom VARCHAR(20), p_niveau INT)
BEGIN
    UPDATE personnages
    SET niveau = p_niveau
    WHERE prenom = p_prenom;
END #
DELIMITER ;

-- modifier lvl aptitude

DELIMITER #

CREATE OR REPLACE PROCEDURE AugApt(p_prenom VARCHAR(20), p_aptitude VARCHAR(20), p_niveau INT)
BEGIN
    IF(p_aptitude = "basique") THEN
        UPDATE personnages
        SET niveau_atq_bas = p_niveau
        WHERE prenom = p_prenom;
    END IF ;

    IF(p_aptitude = "élément") THEN
        UPDATE personnages
        SET niveau_atq_elm = p_niveau
        WHERE prenom = p_prenom;
    END IF ;

    IF(p_aptitude = "ult") THEN
        UPDATE personnages
        SET niveau_atq_ult = p_niveau
        WHERE prenom = p_prenom;
    END IF ;
END #
DELIMITER ;

-- Modification des personnages adaptés aux données du joueur les modifier ajoute automatiquement le personnage dans ceux obtenus. Utilisé dans le cas où le perso a déjà été build
DELIMITER #

CREATE OR REPLACE PROCEDURE modifierPersonnage(p_prenom VARCHAR(20), p_constellation INT, p_niveau INT, p_atqBas INT, p_atqElm INT, p_atqUlt INT)
BEGIN 
    IF(p_constellation != 0) THEN
        CALL `AugConstellation`(p_prenom, p_constellation);
    END IF;

    IF(p_niveau IS NOT NULL) THEN
        CALL `AugNiveau`(p_prenom, p_niveau);
    END IF;

    IF(p_atqBas IS NOT NULL) THEN
        CALL `AugApt`(p_prenom, "basique", p_atqBas);
    END IF ;

    IF(p_atqElm IS NOT NULL) THEN
        CALL `AugApt`(p_prenom, "élément", p_atqElm);
    END IF ;

    IF(p_atqUlt IS NOT NULL) THEN
        CALL `AugApt`(p_prenom, "ult", p_atqUlt);
    END IF ;

END #
DELIMITER ;

-- insérer une nouvelle arme attribuée (besoin d'améliorer pour gérer les changements d'arme ou une attribution d'une arme déjà existante)
DELIMITER #

CREATE OR REPLACE PROCEDURE attribuerArme(p_perso VARCHAR(20), p_arme VARCHAR(50), p_lvl INT, p_raffinage INT)
BEGIN
    INSERT INTO armes_attribuees (personnage, nom, lvl, raffinage)
    VALUES(p_perso, p_arme, p_lvl, p_raffinage);
END #
DELIMITER ;

-- augmenter une arme 

DELIMITER #

CREATE OR REPLACE PROCEDURE augArme(p_perso VARCHAR(20), p_lvl INT, p_raffinage INT)
BEGIN 
    IF(p_raffinage IS NULL OR p_raffinage = 1) THEN
        UPDATE armes_attribuees
        SET lvl = p_lvl
        WHERE personnage = p_perso;
    ELSEIF (p_lvl IS NULL) THEN
        UPDATE armes_attribuees
        SET raffinage = p_raffinage
        WHERE personnage = p_perso;
    ELSE 
        UPDATE armes_attribuees
        SET lvl = p_lvl, raffinage = p_raffinage
        WHERE personnage = p_perso;
    END IF ;
END #
DELIMITER ;

-- insérer un nouvel artefact (besoin d'améliorer pour gérer les changements d'artefact ou une attribution d'un artefact déjà existante)
DELIMITER #

CREATE OR REPLACE PROCEDURE attribuerArtefact(p_perso VARCHAR(20), p_art VARCHAR(20), p_set VARCHAR(60), p_lvl INT, p_statP VARCHAR(10), p_ss1 VARCHAR(10), p_ss2 VARCHAR(10),  p_ss3 VARCHAR(10), p_ss4 VARCHAR(10))
BEGIN 
    SET @exist = NULL;

    SELECT type INTO @exist FROM artefacts_attribues
    WHERE personnage = p_perso AND `type` = p_art;

    IF(@exist != NULL) THEN
        UPDATE armes_attribuees
        SET personnage = NULL
        WHERE personnage = p_perso;
    END IF ;
    
    INSERT INTO artefacts_attribues (`type`, `set`, lvl, statP, ssStatP1, ssStatP2,  ssStatP3, ssStatP4, personnage)
    VALUES(p_art, p_set, p_lvl, p_statP, p_ss1, p_ss2,  p_ss3, p_ss4, p_perso);
END #

DELIMITER ;

set foreign_key_checks = 1;
