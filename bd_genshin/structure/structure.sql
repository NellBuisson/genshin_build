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
    `arme` VARCHAR(50),
    `id_arme` INT,
    `possedee` BOOL,
    `constellation` INT,
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
    `donjon` VARCHAR(50),
    PRIMARY KEY(`nom`)
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

ALTER TABLE personnages 
ADD CONSTRAINT perso_etoile CHECK(nbretoile BETWEEN 4 AND 5);

ALTER TABLE monstres 
ADD CONSTRAINT monstres_type CHECK(`type` = "boss" OR `type` = "élite" OR `type` = "normal");

ALTER TABLE personnages 
ADD CONSTRAINT perso_constellation CHECK(constellation BETWEEN 0 AND 6);

ALTER TABLE pull_personnages
ADD CONSTRAINT pull_date CHECK(datefin>datedeb);

ALTER TABLE meilleures_armes
ADD CONSTRAINT meilleures_armes_raffinage CHECK(raffinage BETWEEN 1 AND 5);

ALTER TABLE meilleurs_sets
ADD CONSTRAINT meilleurs_sets_nbr_art CHECK(nbr_art = 2 OR nbr_art = 4);

ALTER TABLE meilleurs_artefacts
ADD CONSTRAINT meilleurs_artefacts_nom CHECK(artefact = "Sablier" OR artefact = "Couronne" OR artefact = "Coupe");

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


-----------------------------------------------
----------------- Fonction --------------------
-----------------------------------------------
-- Création de la fonction pour automatiser l'entrée des matériaux d'amélioration d'arme
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
set foreign_key_checks = 0;
