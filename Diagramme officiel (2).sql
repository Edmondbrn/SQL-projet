CREATE TABLE `Sous_groupe_espece` (
  `Nom_espece` varchar(255),
  `ID_combinaison` numeric,
  `Cancer_ratio` float,
  PRIMARY KEY (`Nom_espece`, `ID_combinaison`)
);

CREATE TABLE `Champs` (
  `ID_combinaison` numeric,
  `ID_champs` numeric,
  `Nom_cereale` varchar(255),
  `Nom_champs` varchar(255),
  `Date_exploitation` Date,
  PRIMARY KEY (`ID_combinaison`, `Nom_cereale`)
);

CREATE TABLE `Champs_OGM` (
  `ID_champs_OGM_a_un_instant_T` numeric PRIMARY KEY,
  `Nom_OGM` varchar(255)
);

CREATE TABLE `Champs_Pesticide` (
  `ID_champs_pesticide_a_un_instant_T` numeric PRIMARY KEY,
  `Nom_Pesticide` varchar(255)
);

CREATE TABLE `Alimentation_especes` (
  `Nom_espece` varchar(255),
  `Nom_cereale` varchar(255),
  `Pourcentage_cereale_espece` float,
  PRIMARY KEY (`Nom_espece`, `Nom_cereale`)
);

ALTER TABLE `Alimentation_especes` ADD FOREIGN KEY (`Nom_espece`) REFERENCES `Sous_groupe_espece` (`Nom_espece`);

ALTER TABLE `Champs` ADD FOREIGN KEY (`ID_combinaison`) REFERENCES `Sous_groupe_espece` (`ID_combinaison`);

ALTER TABLE `Champs_OGM` ADD FOREIGN KEY (`ID_champs_OGM_a_un_instant_T`) REFERENCES `Champs` (`ID_champs`);

ALTER TABLE `Champs_Pesticide` ADD FOREIGN KEY (`ID_champs_pesticide_a_un_instant_T`) REFERENCES `Champs` (`ID_champs`);
