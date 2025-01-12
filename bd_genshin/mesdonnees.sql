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
CALL `modifierPersonnage`();
CALL `modifierPersonnage`();


-- personnage avec un problème Yanfei (constellation) (duplicate entry mais non???), Voyageur géo aussi, Rosalia AUSSI BORDEL, Noelle too, Bennett, Fischl, Beidou, Kaeya
-- est ce que c'est le nombre de constellation ? Si c'est sup à 3 ? Oui. Mona passe mais Kaeya non. 
