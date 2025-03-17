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

CALL `modifierPersonnage`("Citlali", 0, 90, 6, 6, 6); 
CALL `modifierPersonnage`("Kinich", 0, 90, 4, 8, 7);
CALL `modifierPersonnage`("Arlecchino", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Neuvillette", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Lyney", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Alhaitham", 0, 90, 5, 7, 6);
CALL `modifierPersonnage`("Nomade", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Raiden", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Eula", 0, 90, 6, 8, 9);
CALL `modifierPersonnage`("Kazuha", 0, 90, 6, 9, 9);
CALL `modifierPersonnage`("Tao", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Mona", 2, 90, 4, 7, 6);
CALL `modifierPersonnage`("Tartaglia", 0, 90, 7, 7, 8);
CALL `modifierPersonnage`("Zhongli", 0, 90, 7, 8, 8);
CALL `modifierPersonnage`("Xiao", 0, 90, 8, 10, 10);
CALL `modifierPersonnage`("Venti", 0, 90, 3, 6, 7);
CALL `modifierPersonnage`("Diluc", 1, 90, 8, 10, 10);
CALL `modifierPersonnage`("Voyageur", 0, 90, NULL, NULL, NULL);
CALL `modifierPersonnage`("Voyageur pyro", 3, 90, 7, 12, 9);
CALL `modifierPersonnage`("Jean", 2, 90, 3, 7, 7);
CALL `modifierPersonnage`("Ayaka", 0, 90, 6, 9, 9); 
CALL `modifierPersonnage`("Kachina", 1, 90, 4, 6, 6);
CALL `modifierPersonnage`("Fréminet", 0, 90, 6, 8, 8);
CALL `modifierPersonnage`("Yanfei", 6, 90, 7, 11, 11);
CALL `modifierPersonnage`("Rosalia", 6, 90, 2, 10, 9);
CALL `modifierPersonnage`("Noëlle", 6, 90, 3, 4, 9);
CALL `modifierPersonnage`("Bennett", 6, 90, 3, 9, 10);
CALL `modifierPersonnage`("Fischl", 5, 90, 5, 11, 11);
CALL `modifierPersonnage`("Beidou", 6, 90, 6, 10, 10);
CALL `modifierPersonnage`("Kaeya", 3, 90, 3, 8, 7);
CALL `modifierPersonnage`("Barbara", 6, 90, 8, 11, 10);
CALL `modifierPersonnage`("Chongyun", 5, 87, 6, 7, 7);
CALL `modifierPersonnage`("Qiqi", 2, 84, 3, 5, 8);
CALL `modifierPersonnage`("Nahida", 0, 80, 2, 2, 2);
CALL `modifierPersonnage`("Ningguang", 6, 80, 5, 9, 9);
CALL `modifierPersonnage`("Razor", 4, 80, NULL, NULL, NULL);
CALL `AugNiveau`("Aloy", 60);
CALL `AugNiveau`("Yae", 60);
CALL `AugNiveau`("Keqing", 60);
CALL `modifierPersonnage`("Gaming", 1, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Gorou", 4, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Xinyan", 5, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Sucrose", 6, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Xingqiu", 6, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Xiangling", 6, 60, NULL, 9, 8);
CALL `modifierPersonnage`("Amber", 2, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Lisa", 1, 60, NULL, NULL, NULL);
CALL `modifierPersonnage`("Lynette", 3, 50, NULL, NULL, NULL);
CALL `AugNiveau`("Cyno", 40);
CALL `modifierPersonnage`("Tighnari", 1, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Ayato", 40);
CALL `modifierPersonnage`("Yan", 3, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Ororon", 1, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Sethos", 40);
CALL `modifierPersonnage`("Chevreuse", 6, 40, NULL, 4, NULL);
CALL `modifierPersonnage`("Kaveh", 1, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Mika", 4, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Yaoyao", 1, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Faruzan", 2, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Layla", 2, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Candace", 2, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Collei", 4, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Shinobu", 40);
CALL `modifierPersonnage`("Jin", 3, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Kirara", 3, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Heizou", 40);
CALL `modifierPersonnage`("Sara", 1, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Sayu", 2, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Thomas", 6, 40, NULL, NULL, NULL);
CALL `modifierPersonnage`("Diona", 4, 40, NULL, NULL, NULL);
CALL `AugNiveau`("Wriothesley", 1);

-- attribution des armes aux personnages


-----------------------------------------------
-----------------------------------------------
--- Changement à partir de l'initialisation ---
-----------------------------------------------
-----------------------------------------------

