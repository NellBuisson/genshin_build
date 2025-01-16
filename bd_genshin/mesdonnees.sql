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

-- actualisation de la possession des personnages et leurs niveau

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

-- attribution des armes aux personnages
CALL `attribuerArme`("Kinich","Trembleur de terre", 90, 2);
CALL `attribuerArme`("Neuvillette", "Tome du flux éternel", 90, 1);
CALL `attribuerArme`("Lyney", "Simulacre d'eau", 80, 1);
CALL `attribuerArme`("Alhaitham", "Pluie florale", 90, 2);
CALL `attribuerArme`("Nomade", "Mémoire de Tulaytullah", 90, 1);
CALL `attribuerArme`("Raiden", "Lumière du faucheur", 90, 1);
CALL `attribuerArme`("Eula", "Tombe-neige en argétoile", 90, 4);
CALL `attribuerArme`("Kazuha", "Piqûre de fer", 90, 5);
CALL `attribuerArme`("Tao", "Fléau du dragon", 90, 1);
CALL `attribuerArme`("Mona", "Mouvement vagabond", 60, 5);
CALL `attribuerArme`("Tartaglia", "Arc rouillé", 80, 4);
CALL `attribuerArme`("Zhongli", "Pampille noire", 90, 3);
CALL `attribuerArme`("Xiao", "Scion de la victoire", 90, 1);
CALL `attribuerArme`("Venti", "Dernière corde", 90, 5);
CALL `attribuerArme`("Diluc", "Mort-du-loup", 90, 1);
CALL `attribuerArme`("Voyageur", "Lame d'aubier", 90, 1);
CALL `attribuerArme`("Jean", "Passeur du Fleuve cendré", 90, 5);
CALL `attribuerArme`("Ayaka", "Lune ondulante de Futsu", 90, 1);
CALL `attribuerArme`("Kachina", "Trace d'arc-en-ciel", 50, 1);
CALL `attribuerArme`("Fréminet", "Ombre tidale", 90, 1);
CALL `attribuerArme`("Yanfei", "L'origine des Quatre Vents", 90, 2);
CALL `attribuerArme`("Rosalia", "Lance de Favonius", 80, 5);
CALL `attribuerArme`("Noëlle", "Ombre immaculée", 90, 1);
CALL `attribuerArme`("Bennett", "Épée de Favonius", 90, 1);
CALL `attribuerArme`("Fischl", "Ailes de la Voûte d'Azur", 90, 1);
CALL `attribuerArme`("Beidou", "Espadon", 90, 1);
CALL `attribuerArme`("Kaeya", "Rugissement du Lion", 90, 5);
CALL `attribuerArme`("Barbara", "Malice", 90, 4);
CALL `attribuerArme`("Qiqi", "Épée de Favonius", 90, 2);
CALL `attribuerArme`("Chongyun", "« Méga épée magique du suzerain ultime »", 90, 5);
CALL `attribuerArme`("Ningguang", "Contes de Dodoco", 90, 5);
CALL `attribuerArme`("Citlali", "Écho de la grue", 40, 1);
CALL `attribuerArme`("Nahida", "Mémoires de rituels", 90, 5);
CALL `attribuerArme`("Aloy", "Dernière corde", 60, 1);
CALL `attribuerArme`("Yae", "Mouvement vagabond", 1, 2);
CALL `attribuerArme`("Keqing", "Flûte", 70, 1);
CALL `attribuerArme`("Gaming", "Fluorescence", 1, 1);
CALL `attribuerArme`("Gorou", "Arc de chasse de Favonius", 50, 4);
CALL `attribuerArme`("Xinyan", "Épée-horloge", 1, 1);
CALL `attribuerArme`("Sucrose", "Mémoires de rituels", 1, 1);
CALL `attribuerArme`("Xingqiu", "Couteau à filets", 20, 5);
CALL `attribuerArme`("Xiangling", "Fléau du dragon", 40, 1);
CALL `attribuerArme`("Amber", "Arc courbé", 40, 2);
CALL `attribuerArme`("Razor", "Ombre immaculée", 1, 1);
CALL `attribuerArme`("Lisa", "Histoire des chasseurs de dragon", 1, 5);
CALL `attribuerArme`("Lynette", "Épée de Favonius", 50, 1);
CALL `attribuerArme`("Cyno", "Lance en croix de Kitain", 1, 1);
CALL `attribuerArme`("Tighnari", "Lune paisible", 20, 1);
CALL `attribuerArme`("Ayato", "Lame kageuchi d'Amenoma", 1, 1);
CALL `attribuerArme`("Ororon", "Arc de chasse de Favonius", 1, 1);
CALL `attribuerArme`("Sethos", "Lance-pierres", 1, 1);
CALL `attribuerArme`("Chevreuse", "Lance de Favonius", 90, 1);
CALL `attribuerArme`("Kaveh", "Fleur de mailles", 1, 4);
CALL `attribuerArme`("Yaoyao", "Fléau du dragon", 1, 1);
CALL `attribuerArme`("Faruzan", "Arc de chasse de Favonius", 1, 1);
CALL `attribuerArme`("Layla", "Kagotsurube Isshin", 90, 1);
CALL `attribuerArme`("Candace", "Lance Dosdragon", 90, 1);
CALL `attribuerArme`("Collei", "Arc de chasse de Favonius", 1, 1);
CALL `attribuerArme`("Jin", "Lance de Favonius", 1, 1);
CALL `attribuerArme`("Kirara", "Épée de Favonius", 60, 1);
CALL `attribuerArme`("Heizou", "Mouvement vagabond", 1, 1);
CALL `attribuerArme`("Sara", "Arc rituel", 20, 1);
CALL `attribuerArme`("Sayu", "Espadon rituel", 90, 3);
CALL `attribuerArme`("Thomas", "Lance en croix de Kitain", 1, 1);
CALL `attribuerArme`("Diona", "Arc de chasse de Favonius", 40, 1);

-- attribution des artefacts






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