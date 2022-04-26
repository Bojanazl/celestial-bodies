#**************************************************************************************************
#**********************************PROCEDURE ZA NEBESKA TIJELA*************************************
#**************************************************************************************************


#**************************************************************************
#************************Ispisi nebeskih tijela****************************
#**************************************************************************


#******************************************

/*DELIMITER $$
CREATE PROCEDURE ispis_detalja_planeta(IN id INT)
	BEGIN
		SELECT ID, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, Povrsina, 
				Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, 
                RotacioniPeriod, Albedo, Obim, TipPlanete, PovrsinskiPritisak, 
                PovrsinskaTemperatura, NagibOse 
		FROM planete_info p
        WHERE p.ID = id;
    END$$
DELIMITER ;

#******************************************
#call ispis_detalja_planete(189);
#drop procedure ispis_detalja_planete;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#******************************************

DELIMITER $$
CREATE PROCEDURE ispis_planeta()
	BEGIN
		SELECT *  
		FROM planete_info p;
    END$$
DELIMITER ;

#******************************************
#call ispis_detalja_planete(189);
#drop procedure ispis_detalja_planete;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************

DELIMITER $$
CREATE PROCEDURE ispis_detalja_planete(IN id INT)
BEGIN
		SELECT nt.NebeskoTijeloID as ID, nt.Ime as NazivPlanete, ls.ImeSatelita as ImaSatelit, lsr.ImeRoditelja as KruziOko, lsr.VrstaRoditelja, 
				zs.ZvjezdaniSistem, zj.ZvjezdanoJato, lg.Galaksija, gjato.GalaktickoJato, sj.Superjato
		FROM planeta p 
        INNER JOIN nebesko_tijelo nt ON nt.NebeskoTijeloID = p.NebeskoTijeloID
        LEFT JOIN lista_satelita ls ON p.NebeskoTijeloID = ls.RoditeljID
        LEFT JOIN lista_satelita lsr ON p.NebeskoTijeloID = lsr.SatelitID
		LEFT OUTER JOIN zvijezda z ON z.NebeskoTijeloID = lsr.RoditeljID
        LEFT OUTER JOIN lista_zvjezdanih_sistema zs ON z.ZvjezdaniSistemID = zs.ID
        LEFT OUTER JOIN lista_zvjezdanih_jata zj ON zs.ZvjezdanoJatoID = zj.ID
        LEft Outer JOIN lista_galaksija lg ON zj.GalaksijaID = lg.ID
        LEFT OUTER JOIN lista_galaktickih_jata gjato ON gjato.ID = lg.GalaktickoJatoID
        LEFT OUTER JOIN lista_superjata sj ON gjato.SuperjatoID = sj.ID
        WHERE nt.NebeskoTijeloID = id;
    END$$
DELIMITER ;

#******************************************
#call ispis_detalja_planete(191);
#drop procedure ispis_detalja_planete;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#******************************************

DELIMITER $$
CREATE PROCEDuRE dodaj_postojeci_objekat_za_satelit(IN satelit_id INT, IN roditelj_id INT)
	BEGIN 
		INSERT INTO ima_orbitu(SatelitID, RoditeljID)
        VALUES (satelit_id, roditelj_id);
	END $$
DELIMITER ;

#******************************************
#call dodaj_postojeci_objekat_za_satelit(191, 281);
#drop dodaj_postojeci_objekat_za_satelit;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_zvijezda()
	BEGIN
		SELECT nt.NebeskoTijeloID as ID, nt.Ime as ImeZvijezde, z.SpektralnaKlasifikacija, zs.ZvjezdaniSistem, zj.ZvjezdanoJato, g.Galaksija, gj.GalaktickoJato, sj.Superjato
		FROM zvijezda z
        INNER JOIN nebesko_tijelo nt ON z.NebeskoTijeloID = nt.NebeskoTijeloID
        LEFT OUTER JOIN lista_zvjezdanih_sistema zs ON zs.ID = z.ZvjezdaniSistemID
        LEFT OUTER JOIN lista_zvjezdanih_jata zj ON zj.ID = zs.ZvjezdanoJatoID
        LEFT OUTER JOIN lista_galaksija g ON g.ID = zj.GalaksijaID
        LEFT OUTER JOIN lista_galaktickih_jata gj ON g.GalaktickoJatoID = gj.ID
        LEFT OUTER JOIN lista_superjata sj ON gj.SuperjatoID = sj.ID;
    END$$
DELIMITER ;
#******************************************
#call ispis_zvijezda();
#drop procedure ispis_zvijezda;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_detalja_zvijezde(IN id INT)
	BEGIN
		SELECT z.NebeskoTijeloID, nt.Ime as NazivZvijezde, nt.Povrsina, nt.Zapremina, nt.Masa, z.Gustina, nt.RotacioniPeriod,
				z.ZvjezdaniSistemID, z.SpektralnaKlasifikacija, z.PovrsinskaTemperatura, z.Starost, z.Luminoznost
		FROM zvijezda z
        INNER JOIN nebesko_tijelo nt ON nt.NebeskoTijeloID = z.NebeskoTijeloID
        WHERE z.NebeskoTijeloID = id;
    END$$
DELIMITER ;

#****************************************** 
#call ispis_detalja_zvijezde(451);
#drop procedure ispis_detalja_zvijezde;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_asteroida() 
	BEGIN
		SELECT nb.Ime, a.TipAsteroida, a.Grupacija, nb.GlavniPoluprecnik, nb.EkvatorijalniPoluprecnik, nb.Povrsina, 
			   nb.Zapremina, nb.Masa, nb.PovrsinskaGravitacija, 
			   nb.BrzinaOslobadjanja, nb.RotacioniPeriod, nb.Albedo, nb.Obim
		FROM asteroid a INNER JOIN nebesko_tijelo nb ON a.NebeskoTijeloID = nb.NebeskoTijeloID;
    END$$
DELIMITER ;

#******************************************
#call ispis_asteroida();
#drop procedure ispis_asteroida;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_kometa()
	BEGIN
		SELECT nb.Ime, k.TipKomete, nb.EkvatorijalniPoluprecnik, nb.Povrsina, 
			   nb.Zapremina, nb.Masa, nb.PovrsinskaGravitacija, 
			   nb.BrzinaOslobadjanja, nb.RotacioniPeriod, nb.Albedo, nb.Obim
		FROM kometa k inner join nebesko_tijelo nb on k.NebeskoTijeloID = nb.NebeskoTijeloID;
    END$$
DELIMITER ;

#******************************************
#call ispis_kometa();
#drop procedure ispis_kometa;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_planetezimala()
	BEGIN
		SELECT nb.Ime, pz.TipPlanetezimala, nb.EkvatorijalniPoluprecnik, nb.Povrsina, 
			   nb.Zapremina, nb.Masa, nb.PovrsinskaGravitacija, 
			   nb.BrzinaOslobadjanja, nb.RotacioniPeriod, nb.Albedo, nb.Obim
		FROM planetezimal pz inner join nebesko_tijelo nb on pz.NebeskoTijeloID = nb.NebeskoTijeloID;
    END$$
DELIMITER ;

#******************************************
#call ispis_planetezimala();
#drop procedure ispis_planetezimala;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_patuljastih_planeta() /*nakon orbite*/
	BEGIN
		SELECT  ID,Ime,GlavniPoluprecnik, EkvatorijalniPoluprecnik, Povrsina, 
				Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, 
                RotacioniPeriod, Albedo, Obim, DioSolarnogSistema, PovrsinskiPritisak, 
                PovrsinskaTemperatura, NagibOse
		FROM patuljaste_planete_info;
    END$$
DELIMITER ;

#******************************************
#call ispis_patuljastih_planeta();
#drop procedure ispis_patuljastih_planeta;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_crnih_rupa()
	BEGIN
		SELECT Ime,GlavniPoluprecnik, EkvatorijalniPoluprecnik, Povrsina, 
				Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, 
                RotacioniPeriod, Albedo, Obim, Rektascenzija_Aproksimacija, Deklinacija_Aproksimacija
		FROM crne_rupe_info;
    END$$
DELIMITER ;

#******************************************
#call ispis_crnih_rupa();
#drop procedure ispis_crnih_rupa;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#***********************************************************************************************************
#****************************Dodavanje nebeskih objekata i sazvjezdja***************************************
#***********************************************************************************************************


#*******************************************
#1*Dodavanje nebeskog tijela****************
#*******************************************


DELIMITER $$

CREATE PROCEDURE dodaj_nebesko_tijelo (IN ime VARCHAR(50), IN vrsta VARCHAR(50), 
									   IN g_poluprecnik FLOAT, IN e_poluprecnik FLOAT, 
                                       IN p FLOAT, IN v FLOAT, IN m FLOAT, IN g FLOAT, 
                                       IN brzina_oslobadjanja FLOAT, IN rot_period FLOAT, IN albedo FLOAT, IN o FLOAT, 
                                       OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        
        SELECT MAX(NebeskoTijeloID) FROM nebesko_tijelo INTO temp;
        SET novi_id = temp +1; 
        
		INSERT INTO nebesko_tijelo(NebeskoTijeloID, Ime, VrstaNebeskogTijela, GlavniPoluprecnik, EkvatorijalniPoluprecnik, 
								   Povrsina, Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, RotacioniPeriod, Albedo, Obim)
        VALUES (novi_id, ime,vrsta, g_poluprecnik, e_poluprecnik, p, v, m, g, brzina_oslobadjanja, rot_period, albedo, o);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali novo nebesko tijelo ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
/*call dodaj_nebesko_tijelo('Misticni leteci objekat', 'mlo', null, null, null, null, null, null, null, null, 154, null, @poruka);
select @poruka as t;
drop procedure dodaj_nebesko_tijelo;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*******************************************
#2*Dodavanje zvijezde***********************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_zvijezdu (IN ime VARCHAR(50), IN id_zvjezdanog_sistema INT, IN vrsta VARCHAR(50), IN g_poluprecnik FLOAT, IN e_poluprecnik FLOAT, 
								 IN p FLOAT, IN v FLOAT, IN m FLOAT, IN g FLOAT, IN brzina_oslobadjanja FLOAT, IN rot_period FLOAT, 
								 IN albedo FLOAT, IN o FLOAT, IN klasifikacija VARCHAR(50), IN pritisak FLOAT, 
                                 IN temperatura FLOAT, IN osa FLOAT, IN starost FLOAT, IN luminoznost FLOAT, IN gustina FLOAT,
                                 OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        
        SELECT MAX(NebeskoTijeloID) FROM nebesko_tijelo INTO temp;
        SET novi_id = temp +1; 
        
        INSERT INTO nebesko_tijelo(NebeskoTijeloID, VrstaNebeskogTijela, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, 
									Povrsina, Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, RotacioniPeriod, Albedo, Obim) 
		VALUES (novi_id, vrsta, ime, g_poluprecnik, e_poluprecnik, p, v, m, g, brzina_oslobadjanja, rot_period, albedo, o); 
        
		INSERT INTO zvijezda(NebeskoTijeloID, ZvjezdaniSistemID, SpektralnaKlasifikacija, PovrsinskiPritisak, PovrsinskaTemperatura, 
							 NagibOse, Starost, Luminoznost, Gustina)
        VALUES (novi_id, id_zvjezdanog_sistema, klasifikacija, pritisak, temperatura, osa, starost, luminoznost, gustina);
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali novu Zvijezdu pod nazivom ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
/*call dodaj_zvijezdu('Zvjezdonosa', null, null, null, null, null, null, null, null, null, null, null, null, 'nesto', null, null, null, null, null, null, @poruka);
select @poruka as t;
drop procedure dodaj_zvijezdu;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*******************************************
#3*Dodavanje planete************************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_planetu (IN ime VARCHAR(50), IN tip VARCHAR(50), IN vrsta VARChar(50), IN g_poluprecnik FLOAT, IN e_poluprecnik FLOAT, 
								IN p FLOAT, IN v FLOAT, IN m FLOAT, IN g FLOAT, IN brzina_oslobadjanja FLOAT, IN rot_period FLOAT, 
								IN albedo FLOAT, IN o FLOAT, IN pritisak FLOAT, IN temperatura FLOAT, IN osa FLOAT,
								OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        
        SELECT MAX(NebeskoTijeloID) FROM nebesko_tijelo INTO temp;
        SET novi_id = temp +1; 
        
        INSERT INTO nebesko_tijelo(NebeskoTijeloID, VrstaNebeskogTijela, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, 
									Povrsina, Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, RotacioniPeriod, Albedo, Obim) 
		VALUES (novi_id, vrsta, ime, g_poluprecnik, e_poluprecnik, p, v, m, g, brzina_oslobadjanja, rot_period, albedo, o); 
        
		INSERT INTO planeta(NebeskoTijeloID, TipPlanete, PovrsinskiPritisak, PovrsinskaTemperatura, NagibOse)
        VALUES (novi_id, tip, pritisak, temperatura, osa);
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali novu planetu pod nazivom ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
/*call dodaj_planetu('Lazar', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka);
select @poruka as t;
drop procedure dodaj_planetu;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*******************************************
#4*Dodavanje satelita***********************
#*******************************************

DELIMITER $$ 

CREATE PROCEDURE dodaj_satelit (IN ime VARCHAR(50), IN roditelj INT, IN vrsta VARCHAR(50), IN g_poluprecnik FLOAT, IN e_poluprecnik FLOAT, 
								IN p FLOAT, IN v FLOAT, IN m FLOAT, IN g FLOAT, IN brzina_oslobadjanja FLOAT, IN rot_period FLOAT, 
								IN albedo FLOAT, IN o FLOAT, IN ekscentricitet FLOAT, IN o_period FLOAT, IN brzina FLOAT, 
                                IN anomalija FLOAT, IN inklinacija FLOAT, IN uzlazni_cvor FLOAT, IN perihel FLOAT,
								OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        
        SELECT MAX(NebeskoTijeloID) FROM nebesko_tijelo INTO temp;
        SET novi_id = temp +1; 
        
        INSERT INTO nebesko_tijelo(NebeskoTijeloID, Ime, VrstaNebeskogTijela, GlavniPoluprecnik, EkvatorijalniPoluprecnik, 
									Povrsina, Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, RotacioniPeriod, Albedo, Obim) 
		VALUES (novi_id, ime, vrsta, g_poluprecnik, e_poluprecnik, p, v, m, g, brzina_oslobadjanja, rot_period, albedo, o); 
        
		INSERT INTO ima_orbitu(SatelitID, RoditeljID, EkscentricitetOrbite, OrbitalniPeriod, OrbitalnaBrzina, Anomalija, OrbitalnaInklinacija, 
							   LongitudaUzlaznogCvora, ArgumentPerihela)
        VALUES (novi_id, roditelj,ekscentricitet, o_period, brzina, anomalija, inklinacija, uzlazni_cvor, perihel);
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali novi satelit pod nazivom ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
/*call dodaj_satelit('Lazar', 5, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka);
select @poruka as tp;
drop procedure dodaj_satelit;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*******************************************
#4*Dodavanje komete*************************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_kometu(IN ime VARCHAR(50), IN tip VARCHAR(50), IN vrsta VARCHAR(50), IN g_poluprecnik FLOAT, IN e_poluprecnik FLOAT, 
								IN p FLOAT, IN v FLOAT, IN m FLOAT, IN g FLOAT, IN brzina_oslobadjanja FLOAT, IN rot_period FLOAT, 
								IN albedo FLOAT, IN o FLOAT,
								OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        
        SELECT MAX(NebeskoTijeloID) FROM nebesko_tijelo INTO temp;
        SET novi_id = temp +1; 
        
        INSERT INTO nebesko_tijelo(NebeskoTijeloID, VrstaNebeskogTijela, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, 
									Povrsina, Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, RotacioniPeriod, Albedo, Obim) 
		VALUES (novi_id, vrsta, ime, g_poluprecnik, e_poluprecnik, p, v, m, g, brzina_oslobadjanja, rot_period, albedo, o); 
        
		INSERT INTO kometa(NebeskoTijeloID, TipKomete)
        VALUES (novi_id, tip);
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali novu kometu pod nazivom ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
/*call dodaj_kometu('Lazareva kometa', null, null, null, null, null, null, null, null, null, null, null, null, @poruka);
select @poruka as t;
drop procedure dodaj_kometu;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*******************************************
#5*Dodavanje asteroida**********************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_asteroid(IN ime VARCHAR(50), IN tip VARCHAR(50), IN grupacija VARCHAR(50), IN id_planetezimala INT, IN vrsta VARCHAR(50), 
								IN g_poluprecnik FLOAT, IN e_poluprecnik FLOAT, IN p FLOAT, IN v FLOAT, IN m FLOAT, IN g FLOAT, IN brzina_oslobadjanja FLOAT, 
                                IN rot_period FLOAT, IN albedo FLOAT, IN o FLOAT, OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        
        SELECT MAX(NebeskoTijeloID) FROM nebesko_tijelo INTO temp;
        SET novi_id = temp +1; 
        
        INSERT INTO nebesko_tijelo(NebeskoTijeloID, VrstaNebeskogTijela, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, 
									Povrsina, Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, RotacioniPeriod, Albedo, Obim) 
		VALUES (novi_id, vrsta,ime, g_poluprecnik, e_poluprecnik, p, v, m, g, brzina_oslobadjanja, rot_period, albedo, o); 
        
		INSERT INTO asteroid(NebeskoTijeloID, PlanetezimalID, TipAsteroida, Grupacija)
        VALUES (novi_id, id_planetezimala, tip, grupacija);
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali novu asteroid pod nazivom ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
/*call dodaj_asteroid('Astero', null, null, null, null, null, null, null, null, null, null, null, null, null, null,  @poruka);
select @poruka as t;
drop procedure dodaj_asteroid;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓



#*******************************************
#6*Dodavanje patuljaste planete*************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_patuljastu_planetu (IN ime VARCHAR(50), IN dio_solarnog_sistema VARCHAR(50), IN vrsta VARChar(50), IN g_poluprecnik FLOAT, IN e_poluprecnik FLOAT, 
								IN p FLOAT, IN v FLOAT, IN m FLOAT, IN g FLOAT, IN brzina_oslobadjanja FLOAT, IN rot_period FLOAT, 
								IN albedo FLOAT, IN o FLOAT, IN pritisak FLOAT, IN temperatura FLOAT, IN osa FLOAT,
								OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        
        SELECT MAX(NebeskoTijeloID) FROM nebesko_tijelo INTO temp;
        SET novi_id = temp +1; 
        
        INSERT INTO nebesko_tijelo(NebeskoTijeloID, VrstaNebeskogTijela, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, 
									Povrsina, Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, RotacioniPeriod, Albedo, Obim) 
		VALUES (novi_id, vrsta, ime, g_poluprecnik, e_poluprecnik, p, v, m, g, brzina_oslobadjanja, rot_period, albedo, o); 
        
		INSERT INTO patuljasta_planeta(NebeskoTijeloID, DioSolarnogSistema, PovrsinskiPritisak, PovrsinskaTemperatura, NagibOse)
        VALUES (novi_id, dio_solarnog_sistema, pritisak, temperatura, osa);
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali novu patuljastu planetu pod nazivom ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
/*call dodaj_planetu('Lazar Zec', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka);
select @poruka as t;
drop procedure dodaj_patuljastu_planetu;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*******************************************
#6*Dodavanje crne_rupe**********************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_crnu_rupu(IN ime VARCHAR(50), IN vrsta VARCHAR(50), IN masa FLOAT, IN id_galaksije INT, IN rektascenzija INT, IN deklinacija INT, OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE novi_id INT;
		DECLARE temp INT;
        DECLARE poruka bool default false;
        
        SELECT MAX(NebeskoTijeloID) FROM nebesko_tijelo INTO temp;
        SET novi_id = temp +1;
        
		INSERT INTO nebesko_tijelo(NebeskoTijeloID, Ime, VrstaNebeskogTijela, Masa)
        VALUES(novi_id, ime, vrsta, masa);
        
        INSERT INTO crna_rupa(NebeskoTijeloID, Rektascenzija_Aproksimacija, Deklinacija_Aproksimacija)
        VALUES(novi_id, rektascenzija, deklinacija);
        
        INSERT INTO pripada_nebeskom_objektu(NebeskoTijeloID, NebeskiObjekatID)
        VALUES(novi_id, id_galaksije);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali novu crnu rupu pod nazivom ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END $$
    
DELIMITER ;


#***********************************************************************************************************
#drop procedure dodaj_crnu_rupu;
#call dodaj_crnu_rupu('Najcrnja Rupa', 'crna rupa', 4310000 /*Solarnih*/, 18 /*h*/, -29 /*stepeni*/, @poruka);
#select @poruka as ct;*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************
#7*Ispisivanje hemmijskih elemenata za planete*****************
#**************************************************************


DELIMITER $$

CREATE PROCEDURE ispisi_hemijski_sastav(IN ime_planete VARCHAR(50))
	BEGIN
		SELECT h.NazivHemijskogElementa, h.Simbol, se.Kolicina
        FROM hemijski_element h
        INNER JOIN sadrzi_he se ON se.AtomskiBroj = h.AtomskiBroj
        LEFT OutER JOIN nebesko_tijelo nt ON se.NebeskoTijeloID = nt.NebeskoTijeloID
        WHERE nt.Ime LIKE ime_planete;
	END $$
    
DELIMITER ;

#***********************************************************************************************************
#call  ispisi_hemijski_sastav('Zemlja');
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓




#**************************************************************************************************
#**********************************PROCEDURE ZA NEBESKE OBJEKTE************************************
#**************************************************************************************************

#**************************************************************************
#******************Ispisi nebeskih objekata i sazvjezdja*******************
#**************************************************************************


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_sazvjezdja()
	BEGIN
		SELECT SazvjezdjeID as ID, NazivSazvjezdja FROM sazvjezdje;
    END$$
DELIMITER ;

#******************************************
#call ispis_sazvjezdja();
#drop procedure ispis_sazvjezdja;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_superjata()
	BEGIN
		SELECT s.NebeskiObjekatID as ID, nob.NazivNebeskogObjekta, sz.NazivSazvjezdja, s.CrveniPomak_z
		FROM superjato s inner join nebeski_objekat nob on s.NebeskiObjekatID = nob.NebeskiObjekatID 
        inner join sazvjezdje sz on nob.SazvjezdjeID = sz.SazvjezdjeID;
    END$$
DELIMITER ;

#******************************************
#call ispis_superjata();
#drop procedure ispis_superjata;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_galaktickog_jata()
	BEGIN
		SELECT gj.NebeskiObjekatID as ID, nob.NazivNebeskogObjekta as 'GalaktickoJato', sj.Superjato,
			   sz.NazivSazvjezdja as Sazvjezdje
		FROM galakticko_jato gj 
        INNER JOIN nebeski_objekat nob on gj.NebeskiObjekatID = nob.NebeskiObjekatID
        LEFT OUTER JOIN  lista_superjata sj on gj.SuperjatoID = sj.ID
        LEFT OUTER JOIN sazvjezdje sz ON nob.SazvjezdjeID = sz.SazvjezdjeID;
    END$$
DELIMITER ;

#******************************************
#call ispis_galaktickog_jata();
#drop procedure ispis_galaktickog_jata;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_detalja_galaksije(IN id INT)
	BEGIN
		SELECT g.NebeskiObjekatID as ID, nob.NazivNebeskogObjekta as ImeGalaksije, gjato.GalaktickoJato, sj.Superjato, sz.NazivSazvjezdja,
			   g.TipGalaksije as Tip, g.Precnik, g.Masa, g.Starost
		FROM galaksija g inner join nebeski_objekat nob on g.NebeskiObjekatID = nob.NebeskiObjekatID
        LEFT OUTER JOIN lista_galaktickih_jata gjato on g.GalaktickoJatoID = gjato.ID
		LEFT OUTER JOIN lista_superjata sj on gjato.SuperjatoID = sj.ID 
        LEFT OUTER JOIN sazvjezdje sz ON nob.SazvjezdjeID = sz.SazvjezdjeID
        WHERE g.NebeskiObjekatID = id;   
    END$$
DELIMITER ;

#******************************************
#call ispis_detalja_galaksije(42);
#drop procedure ispis_detalja_galaksije;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_zvjezdanog_jata()
	BEGIN
		SELECT zj.NebeskiObjekatID as ID, nob.NazivNebeskogObjekta as 'ZvjezdanoJato', g.Galaksija, gjato.GalaktickoJato, sj.Superjato,
			   sz.NazivSazvjezdja as Sazvjezdje, zj.Poluprecnik, zj.Masa, zj.Starost
		FROM zvjezdano_jato zj 
        INNER JOIN nebeski_objekat nob on zj.NebeskiObjekatID = nob.NebeskiObjekatID
        LEFT OUTER JOIN lista_galaksija g ON zj.GalaksijaID = g.ID
        LEFT OUTER JOIN lista_galaktickih_jata gjato ON g.GalaktickoJatoID =gjato.ID
        LEFT OUTER JOIN lista_superjata sj ON gjato.SuperjatoID = sj.ID
        LEFT OUTER JOIN sazvjezdje sz ON nob.SazvjezdjeID = sz.SazvjezdjeID;
    END$$
DELIMITER ;

#******************************************
#call ispis_zvjezdanog_jata();
#drop procedure ispis_zvjezdanog_jata;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_zvjezdanog_sistema()
	BEGIN
		SELECT zs.NebeskiObjekatID as ID, nob.NazivNebeskogObjekta as 'ZvjezdaniSistem', zs.Kategorija, zj.ZvjezdanoJato, g.Galaksija, gjato.GalaktickoJato, sj.Superjato,
			   sz.NazivSazvjezdja as Sazvjezdje
		FROM zvjezdani_sistem zs
        INNER JOIN nebeski_objekat nob on zs.NebeskiObjekatID = nob.NebeskiObjekatID
        LEFT OUTER JOIN lista_zvjezdanih_jata zj ON zs.ZvjezdanoJatoID = zj.ID
        LEFT OUTER JOIN lista_galaktickih_jata gjato ON gjato.ID =zs.GalaktickoJatoID
		LEFT OUTER JOIN lista_galaksija g ON zj.GalaksijaID = g.ID
        LEFT OUTER JOIN lista_superjata sj ON gjato.SuperjatoID = sj.ID
        LEFT OUTER JOIN sazvjezdje sz ON nob.SazvjezdjeID = sz.SazvjezdjeID;
    END$$
DELIMITER ;

#******************************************
#call ispis_zvjezdanog_sistema();
#drop procedure ispis_zvjezdanog_sistema;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#******************************************
DELIMITER $$
CREATE PROCEDURE ispis_maglina()
	BEGIN
		SELECT m.NebeskiObjekatID as ID, nob.NazivNebeskogObjekta as 'NazivMagline', m.TipMagline as Tip, g.Galaksija, zj.ZvjezdanoJato,
			   sz.NazivSazvjezdja as Sazvjezdje
		FROM maglina m
        INNER JOIN nebeski_objekat nob on m.NebeskiObjekatID = nob.NebeskiObjekatID
        LEFT OUTER JOIN lista_galaksija g ON m.GalaksijaID = g.ID
        LEFT OUTER JOIN lista_zvjezdanih_jata zj ON m.ZvjezdanoJatoID =zj.ID
        LEFT OUTER JOIN sazvjezdje sz ON nob.SazvjezdjeID = sz.SazvjezdjeID;
    END$$
DELIMITER ;

#******************************************
#call ispis_maglina();
#drop procedure ispis_maglina;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#***********************************************************************************************************
#****************************Dodavanje nebeskih objekata i sazvjezdja***************************************
#***********************************************************************************************************


#*******************************************
#1*Dodavanje sazvjezdja*********************
#*******************************************


DELIMITER $$

CREATE PROCEDURE dodaj_sazvjezdje (IN ime VARCHAR(50), OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        
        SELECT MAX(SazvjezdjeID) FROM sazvjezdje INTO temp;
        SET novi_id = temp +1; 
        
		INSERT INTO sazvjezdje(SazvjezdjeID, NazivSazvjezdja)
        VALUES (novi_id, ime);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali sazvjezdje ', ime, '.'); 
        END IF;
	END$$
delimiter ;


#***********************************************************************************************************
#call dodaj_sazvjezdje('Dejan', @poruka); 
#select @poruka as t; 
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*******************************************
#2*Dodaj superjato**************************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_superjato (IN ime VARCHAR(50), IN id_sazvjezdja INT, IN crveni_pomak FLOAT, OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        DECLARE sazvjezdje INT;
        
        IF (id_sazvjezdja IS NULL) THEN SET sazvjezdje  = 85; #Virgo
        ELSE SET sazvjezdje = id_sazvjezdja;
        END IF;
        
        SELECT MAX(NebeskiObjekatID) FROM nebeski_objekat INTO temp;
        SET novi_id = temp +1; 
        
		INSERT INTO nebeski_objekat(NebeskiObjekatID, SazvjezdjeID, NazivNebeskogObjekta)
        VALUES (novi_id, sazvjezdje, ime);
        
        INSERT INTO superjato(NebeskiObjekatID, CrveniPomak_z)
        VALUES (novi_id, crveni_pomak);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali superjato ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;


#***********************************************************************************************************
#drop procedure dodaj_superjato;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*******************************************
#3*Dodaj galakticko jato********************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_galakticko_jato (IN ime VARCHAR(50), IN id_sazvjezdja INT, IN id_superjata INT, OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        DECLARE sazvjezdje INT;
        DECLARE superjato INT;
        
        IF (id_sazvjezdja IS NULL) THEN SET sazvjezdje = 85; #Virgo
        ELSE SET sazvjezdje = id_sazvjezdja;
        END IF;
	
        SELECT MAX(NebeskiObjekatID) FROM nebeski_objekat INTO temp;
        SET novi_id = temp +1; 
        
		INSERT INTO nebeski_objekat(NebeskiObjekatID, SazvjezdjeID, NazivNebeskogObjekta)
        VALUES (novi_id, sazvjezdje, ime);
        
        INSERT INTO galakticko_jato(NebeskiObjekatID, SuperjatoID)
        VALUES (novi_id, id_superjata);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali galakticko jato ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;


#***********************************************************************************************************
#drop procedure dodaj_galakticko_jato;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*******************************************
#4*Dodaj galaksiju**************************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_galaksiju (IN ime VARCHAR(50), IN id_sazvjezdja INT, IN id_galaktickog_jata INT, 
								  IN id_zvijezda INT, IN tip VARCHAR(50), IN precnik FLOAT, IN masa FLOAT,
                                  IN starost FLOAT, OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        DECLARE sazvjezdje INT;
        DECLARE galakticko_jato INT;
        
        IF (id_sazvjezdja IS NULL) THEN SET sazvjezdje = 85; #Virgo
        ELSE SET sazvjezdje = id_sazvjezdja;
        END IF;

        
        SELECT MAX(NebeskiObjekatID) FROM nebeski_objekat INTO temp;
        SET novi_id = temp +1; 
        
		INSERT INTO nebeski_objekat(NebeskiObjekatID, SazvjezdjeID, NazivNebeskogObjekta)
        VALUES (novi_id, sazvjezdje, ime);
        
        INSERT INTO galaksija(NebeskiObjekatID, GalaktickoJatoID, NajstarijaZvijezdaID, TipGalaksije, 
							  Precnik, Masa, Starost)
        VALUES (novi_id, id_galaktickog_jata, id_zvijezda, tip, precnik, masa, starost);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali galaksiju ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
#call dodaj_galaksiju('Zec Lazar', null, null, null, 'spiralna', null, null, null, @poruka);
#select @poruka as t;
#drop procedure dodaj_galaksiju;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*******************************************
#4*Dodavanje zvjezdanog jata****************
#*******************************************

DELIMITER $$
CREATE PROCEDURE dodaj_zvjezdano_jato (IN ime VARCHAR(50), IN id_sazvjezdja INT, IN id_galaksija INT, 
								       IN poluprecnik FLOAT, IN masa FLOAT,
                                       IN starost FLOAT, OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        DECLARE sazvjezdje INT;
        
        IF (id_sazvjezdja IS NULL) THEN SET sazvjezdje = 85; #Virgo
        ELSE SET sazvjezdje = id_sazvjezdja;
        END IF;
        
      
        SELECT MAX(NebeskiObjekatID) FROM nebeski_objekat INTO temp;
        SET novi_id = temp +1; 
        
		INSERT INTO nebeski_objekat(NebeskiObjekatID, SazvjezdjeID, NazivNebeskogObjekta)
        VALUES (novi_id, sazvjezdje, ime);
        
        INSERT INTO zvjezdano_jato(NebeskiObjekatID, GalaksijaID, Poluprecnik, Masa, Starost)
        VALUES (novi_id, id_galaksija,poluprecnik, masa, starost);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali zvjezdano jato ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;


#***********************************************************************************************************
#call dodaj_zvjezdano_jato('Zecje jato', null, null, 5, 5, 5, @poruka);
#select @poruka as t;
#drop procedure dodaj_zvjezdano_jato;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*******************************************
#5*Dodavanje zvjezdanog sistema*************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_zvjezdani_sistem (IN ime VARCHAR(50), IN id_sazvjezdja INT, IN id_zvjezdano_jato INT, IN id_galaksija INT, IN id_galakticko_jato INT, 
								       IN kategorija VARCHAR(50), OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        DECLARE sazvjezdje INT;
        
        IF (id_sazvjezdja IS NULL) THEN SET sazvjezdje = 85; #Virgo
        ELSE SET sazvjezdje = id_sazvjezdja;
        END IF;
      
        SELECT MAX(NebeskiObjekatID) FROM nebeski_objekat INTO temp;
        SET novi_id = temp + 1; 
        
		INSERT INTO nebeski_objekat(NebeskiObjekatID, SazvjezdjeID, NazivNebeskogObjekta)
        VALUES (novi_id, sazvjezdje, ime);
        
        INSERT INTO zvjezdani_sistem(NebeskiObjekatID, ZvjezdanoJatoID, GalaktickoJatoID, Kategorija)
        VALUES (novi_id, id_zvjezdano_jato, id_galakticko_jato, kategorija);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali zvjezdani sistem ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
#call dodaj_zvjezdani_sistem('Sistem zeceva', null, null, null, null, null, @poruka);
#select @poruka as t;
#drop procedure dodaj_zvjezdani_sistem;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*******************************************
#5*Dodavanje magline************************
#*******************************************

DELIMITER $$

CREATE PROCEDURE dodaj_maglinu (IN ime VARCHAR(50), IN id_sazvjezdja INT, IN id_zvjezdano_jato INT, 
								id_galaksija INT, IN tip VARCHAR(50), OUT uspjesna_poruka VARCHAR(200))
	BEGIN
		DECLARE poruka bool default false;
        DECLARE novi_id INT;
        DECLARE temp INT;
        DECLARE sazvjezdje INT;
        
        IF (id_sazvjezdja IS NULL) THEN SET sazvjezdje = 85; #Virgo
        ELSE SET sazvjezdje = id_sazvjezdja;
        END IF;
      
        SELECT MAX(NebeskiObjekatID) FROM nebeski_objekat INTO temp;
        SET novi_id = temp + 1; 
        
		INSERT INTO nebeski_objekat(NebeskiObjekatID, SazvjezdjeID, NazivNebeskogObjekta)
        VALUES (novi_id, sazvjezdje, ime);
        
        INSERT INTO maglina(NebeskiObjekatID, ZvjezdanoJatoID, GalaksijaID, TipMagline)
        VALUES (novi_id, id_zvjezdano_jato, id_galaksija, tip);
        
        SELECT ROW_COUNT() INTO poruka;
        
        IF (poruka) THEN SET uspjesna_poruka = CONCAT('Uspjesno ste dodali maglinu pod imenom ', ime, '.');
        ELSE SET uspjesna_poruka = 'Desila se greska!';
        END IF;
	END$$
DELIMITER ;

#***********************************************************************************************************
#call dodaj_maglinu('Strasna maglina', null, null, null, 'difuzna', @poruka);
#select @poruka as t;
#drop procedure dodaj_maglinu;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓












