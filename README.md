# Base de données sur les personnages dans le jeu Genshin Impact
Cette base de données sert à déterminer les armements optimales pour les différents personnages du jeu Genshin Impact et suivre l'avancée dudit armement de l'utilisateur.
Elle est codée en MySQL. 
Elle est encore en cours de construction.

## Structure

### Relation
Plusieurs relations existent en tant que fondement de la base de données, par exemple : personnages, armes, artefacts, sets, monstres, donjons ou materiaux qui reprennent les différents éléments du jeu nécessaire à l'amélioration des différents équipements des personnages ainsi que la localisation, si précise, dans le jeu.
Chaque relation détient plusieurs attributs relatifs à leur amélioration, comme leur niveau de base ou celui de raffinement spécifique à chaque utilisateur.

Ensuite, il y a les tables de liaison, reliant par exemple les matériaux aux monstres, ou les donjons aux sets d'artefacts pour savoir où pouvoir récupérer quel matériel. 
Il y a également des relations, toutes commençant par "meilleurs_" indiquant quelles sont les recommandations d'armes, d'artefacts et de statistiques pour chaque personnage, toutes organisés selon un rang. 

D'autres relations existent aussi pour compiler les éléments que possèdent le joueur comme "armes_attribuees" ou "artefacts_attribuees" qui gardent en mémoire les armes et artefacts possédées même lorsqu'ils ne sont attribués à aucun personnage. 

### Contraintes d'intégrité
Toutes les relations sont définies dès leurs créations avec leur clé primaire. Certaines (surtout les tables de liaisons) sont défini avec leur clé étrangère directement.
Les contraintes simples, ne nécessitant pas de trigger sont mis à la suite, que ce soit pour limiter le nombre d'étoile (mesurer la qualité d'une arme ou d'un personnage), le niveau ou les raffinages des différents objets existants.

Les triggers sont définis juste après, permettant, par exemple, de ne pas associé une arme avec un personnage ne maniant pas ce type d'arme, ou pour limiter de manière plus complexe le niveau des aptitudes de personnages (qui changent en fonction du nombre d'obtention du personnage). 

### Fonctions et Procédures
Les fonctions et procédures sont principalement utilisés pour faciliter le remplissage de la base de données. Le schéma, par exemple, de la quantité des différents matériel d'amélioration étant répétitif, j'ai créé des procédures pour insérer les tuples. 
De même pour la modification des niveaux de personnage ou d'arme, toujours en vérifiant qu'il n'y a pas d'erreur lors de l'entrée des paramètres.

### Vues
Elles n'ont pas encore été ajoutés à l'heure actuelle. 

## Données 
Pour cette base de données, il était important de faire une distinction entre deux types de données : les données générales du jeu et celles personalisées de l'utilsateur. Les deux types sont donc dans de fichiers différents.

### Générale
Les données ont été enregistrées, que ce soit par un insert basique ou par des procédures. Elles sont régulièrement actualisées en fonction des mises à jour du jeu.
Les données des différentes constructions d'armement sont basées sur les recommadations de l'application Web "La Gazette de Teyvat". 

### Données Personnalisées
Les données sont enregistrés par l'utilisateur au fur et à mesure. 
A titre d'exemple, j'ai commencé à enregistrer certaines données au hasard, afin de remplir la base. Elles se font au travers, en majorité de procédure pour faciliter l'utilisation. 