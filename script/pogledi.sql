#**************************************************************************************************
#**********************************POGLEDI ZA NEBESKA TIJELA***************************************
#**************************************************************************************************



#**************************************************************************
#1 Informacije o zvijezdama************************************************
#**************************************************************************
create view zvijezde_info as
select nb.NebeskoTijeloID as ID, nb.Ime, nb.GlavniPoluprecnik, nb.EkvatorijalniPoluprecnik, nb.Povrsina, nb.Zapremina, nb.Masa, nb.PovrsinskaGravitacija, 
							nb.BrzinaOslobadjanja, nb.RotacioniPeriod, nb.Albedo, nb.Obim,
							z.SpektralnaKlasifikacija, z.PovrsinskiPritisak, z.PovrsinskaTemperatura, z.NagibOse, z.Starost, z.Luminoznost, z.Gustina
from zvijezda z inner join nebesko_tijelo nb on z.NebeskoTijeloID = nb.NebeskoTijeloID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*************************************************************************
#2 Informacije o planetama***********************************************
#*************************************************************************
create view planete_info (ID, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, Povrsina, 
							Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, 
							RotacioniPeriod, Albedo, Obim, TipPlanete, PovrsinskiPritisak, 
                            PovrsinskaTemperatura, NagibOse) as
select nb.NebeskoTijeloID, nb.Ime, nb.GlavniPoluprecnik, nb.EkvatorijalniPoluprecnik, nb.Povrsina, nb.Zapremina, nb.Masa, nb.PovrsinskaGravitacija, 
							nb.BrzinaOslobadjanja, nb.RotacioniPeriod, nb.Albedo, nb.Obim,
                            p.TipPlanete, p.PovrsinskiPritisak, p.PovrsinskaTemperatura, p.NagibOse
from planeta p inner join nebesko_tijelo nb on p.NebeskoTijeloID = nb.NebeskoTijeloID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*************************************************************************
#3 Planete Solarnog sistema**********************************************
#*************************************************************************
CREATE VIEW planete_suncevog_sistema (NebeskoTijeloID, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, Povrsina, 
							Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, 
							RotacioniPeriod, Albedo, Obim, TipPlanete, PovrsinskiPritisak, 
                            PovrsinskaTemperatura, NagibOse) AS
SELECT p.NebeskoTijeloID, nt.Ime, nt.GlavniPoluprecnik, nt.EkvatorijalniPoluprecnik, nt.Povrsina, nt.Zapremina, nt.Masa, nt.PovrsinskaGravitacija, 
							nt.BrzinaOslobadjanja, nt.RotacioniPeriod, nt.Albedo, nt.Obim,
                            p.TipPlanete, p.PovrsinskiPritisak, p.PovrsinskaTemperatura, p.NagibOse
FROM planeta p 
INNER JOIN nebesko_tijelo nt ON p.NebeskoTijeloID = nt.NebeskoTijeloID
LEFT OUTER JOIN ima_orbitu o ON p.NebeskoTijeloID = o.SatelitID
WHERE o.RoditeljID = 281 
ORDER BY nt.Ime;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*************************************************************************
#4 Hemijski sastav tijela Solarnog sistema*******************************
#*************************************************************************
CREATE VIEW hemijski_sastav_objekataSolSistema AS
SELECT nt.Ime, he.NazivHemijskogElementa, sh.Kolicina
FROM sadrzi_he sh
INNER JOIN planete_suncevog_sistema nt ON nt.NebeskoTijeloID = sh.NebeskoTijeloID
INNER JOIN hemijski_element he ON he.AtomskiBroj = sh.AtomskiBroj;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*************************************************************************
#5 Informacije o crnim rupama********************************************
#*************************************************************************
CREATE VIEW crne_rupe_info (Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, Povrsina, 
							Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, 
							RotacioniPeriod, Albedo, Obim, Rektascenzija_Aproksimacija, Deklinacija_Aproksimacija) as
select nb.Ime, nb.GlavniPoluprecnik, nb.EkvatorijalniPoluprecnik, nb.Povrsina, nb.Zapremina, nb.Masa, nb.PovrsinskaGravitacija, 
							nb.BrzinaOslobadjanja, nb.RotacioniPeriod, nb.Albedo, nb.Obim,
                            cr.Rektascenzija_Aproksimacija, cr.Deklinacija_Aproksimacija
from crna_rupa cr inner join nebesko_tijelo nb on cr.NebeskoTijeloID = nb.NebeskoTijeloID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*************************************************************************
#6 Zvijezde patuljci*****************************************************
#*************************************************************************
CREATE VIEW zvijezde_patuljci (Ime) AS 
SELECT nt.Ime
FROM zvijezda z INNER JOIN nebesko_tijelo nt on z.NebeskoTijeloID = nt.NebeskoTijeloID
WHERE z.SpektralnaKlasifikacija = 'Bijeli patuljak';
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************************************
#**********************************POMOCNE PROCEDURE***********************************************
#**************************************************************************************************


#*************************************************************************
#7 Ispis superjata*******************************************************
#*************************************************************************
CREATE VIEW lista_superjata AS
SELECT s.NebeskiObjekatID AS ID, snob.NazivNebeskogObjekta AS Superjato, snob.SazvjezdjeID
            FROM superjato s
            INNER JOIN nebeski_objekat snob ON s.NebeskiObjekatID = snob.NebeskiObjekatID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ 

#*************************************************************************
#8 Ispis galaktickih jata************************************************
#*************************************************************************
CREATE VIEW lista_galaktickih_jata AS
SELECT gj.NebeskiObjekatID AS ID, gnob.NazivNebeskogObjekta AS GalaktickoJato, gj.SuperjatoID
            FROM galakticko_jato gj
            INNER JOIN nebeski_objekat gnob ON gj.NebeskiObjekatID = gnob.NebeskiObjekatID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*************************************************************************
#9 Ispis galaktickih jata************************************************
#*************************************************************************
CREATE VIEW lista_galaksija AS
SELECT g.NebeskiObjekatID as ID, nob.NazivNebeskogObjekta as Galaksija, g.GalaktickoJatoID, 
		g.TipGalaksije as Tip, g.Precnik, g.Masa, g.Starost
		FROM galaksija g inner join nebeski_objekat nob on g.NebeskiObjekatID = nob.NebeskiObjekatID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*************************************************************************
#10 Ispis zvjezdano jato**************************************************
#*************************************************************************
CREATE VIEW lista_zvjezdanih_jata AS
SELECT zj.NebeskiObjekatID as ID, zjnob.NazivNebeskogObjekta as ZvjezdanoJato, g.Galaksija, zj.GalaksijaID, zj.Poluprecnik, zj.Masa, zj.Starost
            FROM zvjezdano_jato zj
            INNER JOIN nebeski_objekat zjnob ON zj.NebeskiObjekatID = zjnob.NebeskiObjekatID
            INNER JOIN lista_galaksija g ON zj.GalaksijaID = g.ID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*************************************************************************
#11 Ispis zvjezdanog sistema**********************************************
#*************************************************************************
CREATE VIEW lista_zvjezdanih_sistema AS
SELECT zs.NebeskiObjekatID as ID, zsnob.NazivNebeskogObjekta as ZvjezdaniSistem,  zj.ZvjezdanoJato, zs.ZvjezdanoJatoID, g.Galaksija
			FROM zvjezdani_sistem zs
            INNER JOIN lista_zvjezdanih_jata zj ON zj.ID = zs.ZvjezdanoJatoID
            LEFT OUTER JOIN lista_galaksija g ON g.ID = zj.GalaksijaID
            LEFT OUTER JOIN nebeski_objekat zsnob ON zs.NebeskiObjekatID = zsnob.NebeskiObjekatID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*************************************************************************
#12 Ispis satelita********************************************************
#*************************************************************************

CREATE VIEW lista_satelita AS
SELECT nt.NebeskoTijeloID as RoditeljID,nt.Ime as ImeRoditelja, nt.VrstaNebeskogTijela as VrstaRoditelja,  
		nts.NebeskoTijeloID as SatelitID, nts.Ime as ImeSatelita, nts.VrstaNebeskogTijela as VrstaSatelita
	FROM ima_orbitu iob
    INNER JOIN nebesko_tijelo nt ON nt.NebeskoTijeloID = iob.RoditeljID
    LEFT OUTER JOIN nebesko_tijelo nts ON nts.NebeskoTijeloID = iob.SatelitID;
    
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#*************************************************************************
#13 Ispis crnih rupa******************************************************
#*************************************************************************

CREATE VIEW ispis_crne_rupe AS
SELECT nt.NebeskoTijeloID as ID, nt.Ime as NazivCrneRupe, nt.Masa as SolarnaMasa, nob.NazivNebeskogObjekta as JeUCentruGalaksije, 
		lgj.GalaktickoJato as JeUGalaktikomJatu, ls.Superjato as JeUSuperjatu, sz.NazivSazvjezdja as JeUSazvjezdju
FROM crna_rupa cr
INNER JOIN nebesko_tijelo nt ON nt.NebeskoTijeloID = cr.NebeskoTijeloID
LEFT OUTER JOIN pripada_nebeskom_objektu pno ON pno.NebeskoTijeloID = nt.NebeskoTijeloID
LEFT OUTER JOIN nebeski_objekat nob ON nob.NebeskiObjekatID = pno.NebeskiObjekatID
LEFT OUTER JOIN galaksija g ON g.NebeskiObjekatID = nob.NebeskiObjekatID
LEFT OUTER JOIN lista_galaksija lg ON nob.NebeskiObjekatID = lg.ID
LEFT OUTER JOIN lista_galaktickih_jata lgj ON lg.GalaktickoJatoID = lgj.ID
LEFT OUTER JOIN lista_superjata ls ON ls.ID = lgj.SuperjatoID
LEFT OUTER JOIN sazvjezdje sz ON nob.SazvjezdjeID = sz.SazvjezdjeID;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

#*************************************************************************
#14 Ispis zvijezda********************************************************
#*************************************************************************

CREATE VIEW lista_zvijezda AS
SELECT nt.NebeskoTijeloID as ID, nt.Ime  as ImeZvijezde ,zs.ZvjezdaniSistem as PripadaZvjezdanomSistemu, zs.ID as ZvjezdaniSistemID, zj.ZvjezdanoJato, g.Galaksija, gj.GalaktickoJato,
		sj.Superjato
FROM zvijezda z 
INNER JOIN nebesko_tijelo nt ON z.NebeskoTijeloID = nt.NebeskoTijeloID
LEFT OUTER JOIN lista_zvjezdanih_sistema zs ON zs.ID = z.ZvjezdaniSistemID
LEFT OUTER JOIN lista_zvjezdanih_jata zj ON zj.ID = zs.ZvjezdanoJatoID
LEFT OUTER JOIN lista_galaksija g ON g.ID = zj.GalaksijaID
LEFT OUTER JOIN lista_galaktickih_jata gj ON g.GalaktickoJatoID = gj.ID
LEFT OUTER JOIN lista_superjata sj ON gj.SuperjatoID = sj.ID;


#**************************************************************************
#15 Planete koje lutaju svemirom bez maticne zvijezde*********************** 
#**************************************************************************
CREATE VIEW planete_bez_zvijezde(Ime) AS
SELECT nt.Ime
FROM planeta p
INNER JOIN nebesko_tijelo nt ON p.NebeskoTijeloID = nt.NebeskoTijeloID
WHERE NOT EXISTS
(
	SELECT 1
	FROM ima_orbitu o
	WHERE o.SatelitID = nt.NebeskoTijeloID
);
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************
#16 Intergalakticka zvijezda - zvijezda izbacena iz svoje galaksije*********
#**************************************************************************
CREATE VIEW zvijezda_bez_galaksije AS
SELECT ID, ImeZvijezde
FROM lista_zvijezda 
WHERE Galaksija IS NULL
ORDER BY ImeZvijezde;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************
#17 Intergalakticka planeta - planeta izbacena iz svoje galaksije***********
#**************************************************************************
CREATE VIEW planete_bez_galaksije(Ime) AS
SELECT nt.Ime 
FROM planeta p
INNER JOIN nebesko_tijelo nt ON p.NebeskoTijeloID = nt.NebeskoTijeloID
LEFT OUTER JOIN ima_orbitu o on p.NebeskoTijeloID = o.SatelitID

WHERE (NOT ( EXISTS 
			( 
				select pno.NebeskiObjekatID 
				from pripada_nebeskom_objektu pno
				where pno.NebeskoTijeloID = p.NebeskoTijeloID
				and pno.NebeskiObjekatID in (select NebeskiObjekatID from galaksija)
				) 
			)
		AND o.RoditeljID is null );
/*OR EXISTS ( SELECT 1 
			from lista_zvijezda lz
            where lz.ID = o.RoditeljID)*/
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************
#18 Planete koje su unutar Solarnog sistema**********************************
#**************************************************************************
CREATE VIEW egzoplanete(Ime, RoditeljID) AS
SELECT nt.Ime, o.RoditeljID
FROM planeta p 
INNER JOIN nebesko_tijelo nt ON p.NebeskoTijeloID = nt.NebeskoTijeloID
INNER JOIN ima_orbitu o ON nt.NebeskoTijeloID = o.SatelitID
WHERE o.RoditeljID <> 281 
order by nt.Ime;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************
#19 Patuljaste planete******************************************************
#**************************************************************************
CREATE VIEW patuljaste_planete_info (ID, Ime, GlavniPoluprecnik, EkvatorijalniPoluprecnik, Povrsina, 
							Zapremina, Masa, PovrsinskaGravitacija, BrzinaOslobadjanja, 
							RotacioniPeriod, Albedo, Obim, DioSolarnogSistema, PovrsinskiPritisak, 
                            PovrsinskaTemperatura, NagibOse) as
select nb.NebeskoTijeloID, nb.Ime, nb.GlavniPoluprecnik, nb.EkvatorijalniPoluprecnik, nb.Povrsina, nb.Zapremina, nb.Masa, nb.PovrsinskaGravitacija, 
							nb.BrzinaOslobadjanja, nb.RotacioniPeriod, nb.Albedo, nb.Obim,
                            pp.DioSolarnogSistema, pp.PovrsinskiPritisak, pp.PovrsinskaTemperatura, pp.NagibOse
from patuljasta_planeta pp inner join nebesko_tijelo nb on pp.NebeskoTijeloID = nb.NebeskoTijeloID;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************
#20 Potencijalne naseljive planete******************************************
#**************************************************************************
CREATE VIEW goldilok_planete AS
SELECT ntp.Ime AS ImePlanete
FROM planeta p
INNER JOIN nebesko_tijelo ntp ON p.NebeskoTijeloID = ntp.NebeskoTijeloID
WHERE ntp.PovrsinskaGravitacija BETWEEN 3 AND 9.807
AND p.PovrsinskiPritisak BETWEEN 600 AND 101325
ORDER BY ntp.Ime;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************
#21 Zvijezde koje nisu dio viseclanog sistema*******************************
#**************************************************************************
CREATE VIEW zvijezde_bez_sistema AS
SELECT nt.Ime
FROM zvijezda z 
INNER JOIN nebesko_tijelo nt ON z.NebeskoTijeloID = nt.NebeskoTijeloID
WHERE z.ZvjezdaniSistemID IS NULL
ORDER BY nt.Ime;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************
#22 Zvijezde koje ne pripadaju Zvjezdanom jatu******************************
#**************************************************************************
CREATE VIEW zvijezda_bez_jata AS
SELECT ImeZvijezde
FROM lista_zvijezda
WHERE ZvjezdanoJato IS NULL
ORDER BY ImeZvijezde;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


#**************************************************************************
#23 Zvjezda koja pripada sistemu********************************************
#**************************************************************************
CREATE VIEW zvjezda_sa_sistemom AS
SELECT nt.Ime
FROM zvijezda z
INNER JOIN nebesko_tijelo nt ON z.NebeskoTijeloID = nt.NebeskoTijeloID
WHERE z.ZvjezdaniSistemID IS NOT NULL;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

