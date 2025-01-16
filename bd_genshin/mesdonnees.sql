-- Active: 1729445084290@@127.0.0.1@3306@genshin_build

-- Actualisation des donjons débloqués
UPDATE donjons
SET debloque = TRUE
WHERE region = "Mondstadt";

UPDATE donjons
SET debloque = TRUE
WHERE region = "Liyue";

UPDATE donjons
SET debloque = TRUE
WHERE region = "Inazuma";

UPDATE donjons
SET debloque = TRUE
WHERE region = "Sumeru";

UPDATE donjons
SET debloque = TRUE
WHERE region = "Fontaine";

UPDATE donjons
SET debloque = TRUE
WHERE region = "Natlan";

-- actualisation de la possession des personnages

CALL `modifierPersonnage`("Kinich", 0, 90, 4, 6, 6);
CALL `modifierPersonnage`("Neuvillette", 0, 90, 5, 8, 7);
CALL `modifierPersonnage`("Lyney", 0, 90, 6, 7, 8);
CALL `modifierPersonnage`("Alhaitham", 0, 90, 5, 5, 5);
CALL `modifierPersonnage`("Nomade", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Raiden", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Eula", 0, 90, 6, 8, 9);
CALL `modifierPersonnage`("Kazuha", 0, 90, 6, 9, 9);
CALL `modifierPersonnage`("Tao", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Tartaglia", 0, 90, 7, 7, 7);
CALL `modifierPersonnage`("Zhongli", 0, 90, 7, 8, 8);
CALL `modifierPersonnage`("Xiao", 0, 90, 8, 10, 10);
CALL `modifierPersonnage`("Venti", 0, 90, 3, 5, 7);
CALL `modifierPersonnage`("Diluc", 1, 90, 8, 10, 10);
CALL `modifierPersonnage`("Voyageur", 0, 90, NULL, NULL, NULL);
CALL `modifierPersonnage`("Jean", 1, 90, 3, 4, 5);
CALL `modifierPersonnage`("Ayaka", 0, 90, 6, 9, 9); 
CALL `modifierPersonnage`("Kachina", 1, 90, 3, 4, 4);
CALL `modifierPersonnage`("Fréminet", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Mona", 2, 90, NULL, NULL, NULL);
CALL `modifierPersonnage`("Qiqi", 2, 80, NULL, 3, 3);
CALL `modifierPersonnage`("Chongyun", 5, 80, 6, 5, 5);
CALL `modifierPersonnage`("Yanfei", 6, 90, 5, 10, 9);
CALL `modifierPersonnage`("Rosalia", 3, 90, 2, 6, 4);
CALL `modifierPersonnage`("Noëlle", 6, 90, 3, 4, 6);
CALL `modifierPersonnage`("Bennett", 6, 90, 3, 8, 10);
CALL `modifierPersonnage`("Fischl", 5, 90, 5, 11, 11);
CALL `modifierPersonnage`("Beidou", 6, 90, 6, 10, 10);
CALL `modifierPersonnage`("Kaeya", 3, 90, NULL, 4, NULL);
CALL `modifierPersonnage`("Barbara", 6, 90, 8, 11, 10);
CALL `modifierPersonnage`("Ningguang", 6, 80, 5, 9, 9);
CALL `modifierPersonnage`("Citlali", 0, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Nahida", 0, 60, 2, 2, 2);
CALL `modifierPersonnage`("Aloy", 0, 60, NULL, NULL, NULL);
CALL `AugNiveau`("Yae", 60);
CALL `AugNiveau`("Keqing", 60);
CALL `AugNiveau`("Gaming", 60);
CALL `modifierPersonnage`("Gorou", 3, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Xinyan", 5, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Sucrose", 6, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Xingqiu", 5, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Xiangling", 5, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Amber", 1, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Razor", 4, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Lisa", 1, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Lynette", 3, 50, NULL, NULL, NULL);
CALL `AugNiveau`("Cyno", 40);
CALL `modifierPersonnage`("Tighnari", 1, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Ayato", 40);
CALL `modifierPersonnage`("Ororon", 1, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Sethos", 40);
CALL `modifierPersonnage`("Chevreuse", 4, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Kaveh", 1, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Yaoyao", 1, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Faruzan", 2, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Layla", 2, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Candace", 1, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Collei", 4, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Shinobu", 40);
CALL `modifierPersonnage`("Jin", 3, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Kirara", 3, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Heizou", 40);
CALL `modifierPersonnage`("Sara", 1, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Sayu", 2, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Thomas", 6, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Diona", 4, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Voyageur pyro", 0, 90, 3, 8, 7);

INSERT INTO armes_possedees (personnage, nom, lvl, raffinage)
values("Kinich","Trembleur de terre", 90, 2),
("Neuvillette", "Tome du flux éternel", 90, 1),
("Lyney", "Simulacre d'eau", 80, 1),
("Alhaitham", "Pluie florale", 90, 2),
("Nomade", "Mémoire de Tulaytullah", 90, 1),
("Raiden", "Lumière du faucheur", 90, 1),
("Eula", "Tombe-neige en argétoile", 90, 4),
("Kazuha", "Piqûre de fer", 90, 5),
("Tao", "Fléau du dragon", 90, 1),
("Mona", "Mouvement vagabond", 60, 5),
("Tartaglia", "Arc rouillé", 80, 4),
("Zhongli", "Pampille noire", 90, 3),
("Xiao", "Scion de la victoire", 90, 1),
("Venti", "Dernière corde", 90, 5),
("Diluc", "Mort-du-loup", 90, 1),
("Voyageur", "Lame d'aubier", 90, 1),
("Jean", "Passeur du Fleuve cendré", 90, 5),
("Ayaka", "Lune ondulante de Futsu", 90, 1),
("Kachina", "", , ),
("", "", , ),

-----------------------------------------------
-----------------------------------------------
--- Changement à partir de l'initialisation ---
-----------------------------------------------
-----------------------------------------------

CALL `AugNiveau`("Mona", 90);
CALL `AugNiveau`("Citlali", 70);
CALL `AugApt`("Voyageur pyro", "basique", 4);
CALL `AugApt`("Voyageur pyro", "ult", 8);
CALL `modifierPersonnage`("Jean", NULL, NULL, 3, 7, 7);
CALL `AugApt`("Venti", "element", 6);
CALL `modifierPersonnage`("Kaeya", NULL, NULL, 3, 7, 5);
CALL `modifierPersonnage`("Kachina", NULL, NULL, 4, 5, 5);