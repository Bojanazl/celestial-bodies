CREATE TABLE `sazvjezdje` (
  `SazvjezdjeID` int(11) NOT NULL,
  `NazivSazvjezdja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SazvjezdjeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nebeski_objekat` (
  `NebeskiObjekatID` int(11) NOT NULL,
  `SazvjezdjeID` int(11) NOT NULL,
  `NazivNebeskogObjekta` varchar(50) NOT NULL,
  PRIMARY KEY (`NebeskiObjekatID`),
  KEY `R_217` (`SazvjezdjeID`),
  CONSTRAINT `R_217` FOREIGN KEY (`SazvjezdjeID`) REFERENCES `sazvjezdje` (`sazvjezdjeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `superjato` (
  `NebeskiObjekatID` int(11) NOT NULL,
  `CrveniPomak_z` decimal(8,4) DEFAULT NULL,
  PRIMARY KEY (`NebeskiObjekatID`),
  CONSTRAINT `superjato_ibfk_1` FOREIGN KEY (`NebeskiObjekatID`) REFERENCES `nebeski_objekat` (`nebeskiobjekatid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `galakticko_jato` (
  `NebeskiObjekatID` int(11) NOT NULL,
  `SuperjatoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`NebeskiObjekatID`),
  KEY `R_4` (`SuperjatoID`),
  CONSTRAINT `R_4` FOREIGN KEY (`SuperjatoID`) REFERENCES `superjato` (`nebeskiobjekatid`),
  CONSTRAINT `galakticko_jato_ibfk_1` FOREIGN KEY (`NebeskiObjekatID`) REFERENCES `nebeski_objekat` (`nebeskiobjekatid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `galaksija` (
  `NebeskiObjekatID` int(11) NOT NULL,
  `GalaktickoJatoID` int(11) DEFAULT 200,
  `NajstarijaZvijezdaID` int(11) DEFAULT NULL, #<-------
  `TipGalaksije` varchar(50) NOT NULL DEFAULT 'spiralna',
  `Precnik` float DEFAULT NULL,
  `Masa` float DEFAULT NULL,
  `Starost` float DEFAULT NULL,
  PRIMARY KEY (`NebeskiObjekatID`),
  KEY `SADRZI` (`GalaktickoJatoID`),
  CONSTRAINT `SADRZI` FOREIGN KEY (`GalaktickoJatoID`) REFERENCES `galakticko_jato` (`nebeskiobjekatid`),
  CONSTRAINT `galaksija_ibfk_1` FOREIGN KEY (`NebeskiObjekatID`) REFERENCES `nebeski_objekat` (`nebeskiobjekatid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `zvjezdano_jato` (
  `NebeskiObjekatID` int(11) NOT NULL,
  `GalaksijaID` int(11) NOT NULL,
  `Poluprecnik` float DEFAULT NULL,
  `Masa` float DEFAULT NULL,
  `Starost` float DEFAULT NULL,
  PRIMARY KEY (`NebeskiObjekatID`),
  KEY `R_71` (`GalaksijaID`),
  CONSTRAINT `R_71` FOREIGN KEY (`GalaksijaID`) REFERENCES `galaksija` (`nebeskiobjekatid`),
  CONSTRAINT `zvjezdano_jato_ibfk_1` FOREIGN KEY (`NebeskiObjekatID`) REFERENCES `nebeski_objekat` (`nebeskiobjekatid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `maglina` (
  `NebeskiObjekatID` int(11) NOT NULL,
  `ZvjezdanoJatoID` int(11) DEFAULT NULL,
  `GalaksijaID` int(11) DEFAULT NULL,
  `TipMagline` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NebeskiObjekatID`),
  KEY `R_184` (`GalaksijaID`),
  KEY `R_186` (`ZvjezdanoJatoID`),
  CONSTRAINT `R_184` FOREIGN KEY (`GalaksijaID`) REFERENCES `galaksija` (`nebeskiobjekatid`),
  CONSTRAINT `R_186` FOREIGN KEY (`ZvjezdanoJatoID`) REFERENCES `zvjezdano_jato` (`nebeskiobjekatid`),
  CONSTRAINT `maglina_ibfk_1` FOREIGN KEY (`NebeskiObjekatID`) REFERENCES `nebeski_objekat` (`nebeskiobjekatid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `zvjezdani_sistem` (
  `NebeskiObjekatID` int(11) NOT NULL,
  `ZvjezdanoJatoID` int(11) DEFAULT NULL,
  `GalaktickoJatoID` int(11) DEFAULT NULL,
  `Kategorija` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NebeskiObjekatID`),
  KEY `R_201` (`ZvjezdanoJatoID`),
  KEY `R_202` (`GalaktickoJatoID`),
  CONSTRAINT `R_201` FOREIGN KEY (`ZvjezdanoJatoID`) REFERENCES `zvjezdano_jato` (`nebeskiobjekatid`),
  CONSTRAINT `R_202` FOREIGN KEY (`GalaktickoJatoID`) REFERENCES `galakticko_jato` (`nebeskiobjekatid`),
  CONSTRAINT `zvjezdani_sistem_ibfk_1` FOREIGN KEY (`NebeskiObjekatID`) REFERENCES `nebeski_objekat` (`nebeskiobjekatid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nebesko_tijelo` (
  `NebeskoTijeloID` int(11) NOT NULL,
  `VrstaNebeskogTijela` varchar(50) DEFAULT NULL,
  `Ime` varchar(50) DEFAULT NULL,
  `GlavniPoluprecnik` float DEFAULT NULL,
  `EkvatorijalniPoluprecnik` float DEFAULT NULL,
  `Povrsina` float DEFAULT NULL,
  `Zapremina` float DEFAULT NULL,
  `Masa` float DEFAULT NULL,
  `PovrsinskaGravitacija` float DEFAULT NULL,
  `BrzinaOslobadjanja` float DEFAULT NULL,
  `RotacioniPeriod` float DEFAULT NULL,
  `Albedo` float DEFAULT NULL,
  `Obim` float DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `zvijezda` (
  `NebeskoTijeloID` int(11) NOT NULL,
  `ZvjezdaniSistemID` int(11) DEFAULT NULL,
  `SpektralnaKlasifikacija` varchar(50) DEFAULT NULL,
  `PovrsinskiPritisak` float DEFAULT NULL,
  `PovrsinskaTemperatura` float DEFAULT NULL,
  `NagibOse` float DEFAULT NULL,
  `Starost` float DEFAULT NULL,
  `Luminoznost` float DEFAULT NULL,
  `Gustina` float DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`),
  KEY `R_204` (`ZvjezdaniSistemID`),
  CONSTRAINT `R_204` FOREIGN KEY (`ZvjezdaniSistemID`) REFERENCES `zvjezdani_sistem` (`nebeskiobjekatid`),
  CONSTRAINT `zvijezda_ibfk_1` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `planeta` (
  `NebeskoTijeloID` int(11) NOT NULL,
  `TipPlanete` varchar(50) DEFAULT NULL,
  `PovrsinskiPritisak` float DEFAULT NULL,
  `PovrsinskaTemperatura` float DEFAULT NULL,
  `NagibOse` float DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`),
  CONSTRAINT `planeta_ibfk_1` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `patuljasta_planeta` (
  `NebeskoTijeloID` int(11) NOT NULL DEFAULT '200',
  `DioSolarnogSistema` varchar(50) NOT NULL DEFAULT 'Glavni asteroidni pojas',
  `PovrsinskiPritisak` float DEFAULT NULL,
  `PovrsinskaTemperatura` float DEFAULT NULL,
  `NagibOse` float DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`),
  CONSTRAINT `patuljasta_planeta_ibfk_1` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`NebeskoTijeloID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `planetezimal` (
  `NebeskoTijeloID` int(11) NOT NULL,
  `TipPlanetezimala` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`),
  CONSTRAINT `planetezimal_ibfk_1` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `asteroid` (
  `NebeskoTijeloID` int(11) NOT NULL,
  `PlanetezimalID` int(11) DEFAULT NULL,
  `TipAsteroida` varchar(50) DEFAULT NULL,
  `Grupacija` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`),
  KEY `R_225` (`PlanetezimalID`),
  CONSTRAINT `R_225` FOREIGN KEY (`PlanetezimalID`) REFERENCES `planetezimal` (`nebeskotijeloid`),
  CONSTRAINT `asteroid_ibfk_1` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `kometa` (
  `NebeskoTijeloID` int(11) NOT NULL,
  `TipKomete` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`),
  CONSTRAINT `kometa_ibfk_1` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `hemijski_element` (
  `AtomskiBroj` int(11) NOT NULL,
  `NazivHemijskogElementa` varchar(50) NOT NULL,
  `Simbol` char(3) NOT NULL,
  PRIMARY KEY (`AtomskiBroj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sadrzi_he` (
  `NebeskoTijeloID` int(11) NOT NULL,
  `AtomskiBroj` int(11) NOT NULL,
  `Kolicina` decimal(8,4) DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`,`AtomskiBroj`),
  KEY `R_199` (`AtomskiBroj`),
  CONSTRAINT `R_198` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`),
  CONSTRAINT `R_199` FOREIGN KEY (`AtomskiBroj`) REFERENCES `hemijski_element` (`atomskibroj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ima_orbitu` (
  `SatelitID` int(11) NOT NULL,
  `RoditeljID` int(11) NOT NULL,
  `EkscentricitetOrbite` float DEFAULT NULL,
  `OrbitalniPeriod` float DEFAULT NULL,
  `OrbitalnaBrzina` float DEFAULT NULL,
  `Anomalija` float DEFAULT NULL,
  `OrbitalnaInklinacija` float DEFAULT NULL,
  `LongitudaUzlaznogCvora` float DEFAULT NULL,
  `ArgumentPerihela` float DEFAULT NULL,
  PRIMARY KEY (`SatelitID`,`RoditeljID`),
  KEY `R_207` (`RoditeljID`),
  CONSTRAINT `R_205` FOREIGN KEY (`SatelitID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`),
  CONSTRAINT `R_207` FOREIGN KEY (`RoditeljID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pripada_nebeskom_objektu` (
  `NebeskiObjekatID` int(11) NOT NULL,
  `NebeskoTijeloID` int(11) NOT NULL,
  PRIMARY KEY (`NebeskiObjekatID`,`NebeskoTijeloID`),
  KEY `R_210` (`NebeskoTijeloID`),
  CONSTRAINT `R_209` FOREIGN KEY (`NebeskiObjekatID`) REFERENCES `nebeski_objekat` (`nebeskiobjekatid`),
  CONSTRAINT `R_210` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`nebeskotijeloid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `crna_rupa` (
  `NebeskoTijeloID` int(11) NOT NULL,
  `Rektascenzija_Aproksimacija` int(20) DEFAULT NULL,
  `Deklinacija_Aproksimacija` int(20) DEFAULT NULL,
  PRIMARY KEY (`NebeskoTijeloID`),
  CONSTRAINT `crna_rupa_ibfk_1` FOREIGN KEY (`NebeskoTijeloID`) REFERENCES `nebesko_tijelo` (`NebeskoTijeloID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

