CREATE TABLE `Especes` (
  `ID_espece` numeric PRIMARY KEY,
  `nom_especes` varchar(255)
);

CREATE TABLE `Sous_groupe_espece` (
  `ID_espece` numeric PRIMARY KEY,
  `ID_combinaison` numeric,
  `groupe_BIO` bool,
  `Cancer_ratio` float
);

CREATE TABLE `Combinaison` (
  `ID_combinaison` numeric PRIMARY KEY,
  `ID_Champ_OGM` numeric,
  `ID_Champ_Pesticide` numeric
);

CREATE TABLE `Champs_Bio` (
  `ID_combinaison` numeric PRIMARY KEY,
  `ID_champs` numeric,
  `Nom_cereale` varchar(255),
  `Nom_champs` varchar(255)
);

CREATE TABLE `Champs_traites` (
  `ID_champs_a_un_instant_T` numeric PRIMARY KEY,
  `Nom_cereale` varchar(255),
  `Nom_champs` varchar(255),
  `est_OGM` bool,
  `est_Pesticide` bool
);

CREATE TABLE `Details_champs` (
  `ID_champs_a_un_instant_T` numeric PRIMARY KEY,
  `Date_exploitation` Date
);

CREATE TABLE `Alimentation_especes` (
  `ID_espece` numeric PRIMARY KEY,
  `Nom_cereale` varchar(255),
  `Pourcentage_cereale_espece` float
);

ALTER TABLE `Sous_groupe_espece` ADD FOREIGN KEY (`ID_espece`) REFERENCES `Especes` (`ID_espece`);

ALTER TABLE `Combinaison` ADD FOREIGN KEY (`ID_combinaison`) REFERENCES `Sous_groupe_espece` (`ID_combinaison`);

ALTER TABLE `Champs_Bio` ADD FOREIGN KEY (`ID_combinaison`) REFERENCES `Combinaison` (`ID_combinaison`);

ALTER TABLE `Champs_traites` ADD FOREIGN KEY (`ID_champs_a_un_instant_T`) REFERENCES `Combinaison` (`ID_Champ_OGM`);

ALTER TABLE `Champs_traites` ADD FOREIGN KEY (`ID_champs_a_un_instant_T`) REFERENCES `Combinaison` (`ID_Champ_Pesticide`);

ALTER TABLE `Details_champs` ADD FOREIGN KEY (`ID_champs_a_un_instant_T`) REFERENCES `Champs_Bio` (`ID_champs`);

ALTER TABLE `Details_champs` ADD FOREIGN KEY (`ID_champs_a_un_instant_T`) REFERENCES `Champs_traites` (`ID_champs_a_un_instant_T`);

ALTER TABLE `Alimentation_especes` ADD FOREIGN KEY (`ID_espece`) REFERENCES `Especes` (`ID_espece`);
