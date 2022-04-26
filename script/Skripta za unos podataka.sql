#***************************************************************************************************
#****************************************UNOS PODATAKA U BAZU***************************************
#***************************************************************************************************


#****************************************
#********PODACI ZA NEBESKE OBJEKTE*******
#****************************************


#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Sazvjezdja ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

INSERT INTO sazvjezdje (SazvjezdjeID, NazivSazvjezdja) VALUES 
    (88,'Andromeda'),
    (1,'Antliantli'),
    (2,'Apus'),
    (3,'Aquarius kwris'),
    (4,'Aquila'),
    (5,'Arar'),
    (6,'Aries'),
    (7,'Auriga'),
    (8,'Boötes '),
    (9,'Caelum'),
    (10,'Camelopardalis '),
    (11,'Cancer  '),
    (12,'Canes Venatici'),
    (13,'Canis Major '),
    (14,'Canis Minor '),
    (15,'Capricornus '),
    (16,'Carina '),
    (17,'Cassiopeia '),
    (18,'Centaurus '),
    (19,'Cepheus '),
    (20,'Cetus'),
    (21,'Chamaeleon '),
    (22,'Circinus '),
    (23,'Columbako'),
    (24,'Coma Berenices '),
    (25,'Corona Australis'),
    (26,'Corona Borealis'),
    (27,'Corvus '),
    (28,'Crater '),
    (29,'Crux '),
    (30,'Cygnus '),
    (31,'Delphinus '),
    (32,'Dorado '),
    (33,'Draco '),
    (34,'Equuleus'),
    (35,'Eridanu'),
    (36,'Fornax'),
    (37,'Gemini '),
    (38,'Grus '),
    (39,'Hercules '),
    (40,'Horologium'),
    (41,'Hydra '),
    (42,'Hydrush'),
    (43,'Indus '),
    (44,'Lacerta'),
    (45,'Leo'),
    (46,'Leo Minor'),
    (47,'Lepus '),
    (48,'Libra '),
    (49,'Lupus '),
    (50,'Lynx '),
    (51,'Lyra '),
    (52,'Mensa'),
    (53,'Microscopium'),
    (54,'Monoceros'),
    (55,'Musca'),
    (56,'Norma '),
    (57,'Octans'),
    (58,'Ophiuchus '),
    (59,'Orion '),
    (60,'Pavo '),
    (61,'Pegasus'),
    (62,'Perseus '),
    (63,'Phoenix'),
    (64,'Pictor '),
    (65,'Pisces'),
    (66,'Piscis Austrinus '),
    (67,'Puppis'),
    (68,'Pyxis '),
    (69,'Reticulum '),
    (70,'Sagitta'),
    (71,'Sagittarius'),
    (72,'Scorpius'),
    (73,'Sculptors'),
    (74,'Scutum'),
    (75,'Serpens'),
    (76,'Sextans '),
    (77,'Taurus '),
    (78,'Telescopium '),
    (79,'Triangulum'),
    (80,'Triangulum Australe'),
    (81,'Tucana'),
    (82,'Ursa Major'),
    (83,'Ursa Minor'),
    (84,'Vela '),
    (85,'Virgo '),
    (86,'Volans'),
    (87,'Vulpecula');
   

#▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Holderi ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓
    
insert into nebeski_objekat(NebeskiObjekatID, SazvjezdjeID, NazivNebeskogObjekta)
values (1, 1, 'Holder');
insert into nebesko_tijelo(NebeskoTijeloID)
values(188);


#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Superjato ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_superjato('Saraswati', 65, null, @poruka);	select @poruka as t;		
call dodaj_superjato('Virgo', 85, null, @poruka);	select @poruka as t;
call dodaj_superjato('Hercules', 39, null, @poruka);select @poruka as t;		
call dodaj_superjato('Leo', 45, null, @poruka)	;select @poruka as t;
call dodaj_superjato('Ophiuchus', 58, null, @poruka);select @poruka as t;		
call dodaj_superjato('Shapleyr', 18, null, @poruka);select @poruka as t;	
call dodaj_superjato('Coma', 24, null, @poruka);select @poruka as t;
call dodaj_superjato('Sculptor', 73, null, @poruka);select @poruka as t;	
call dodaj_superjato('Laniakea', 85, 0.0708, @poruka);select @poruka as t; /*  <----------------*/
call dodaj_superjato('Perseus-Pisces', 65 , null, @poruka);	select @poruka as t;
call dodaj_superjato('Hydra-Centaurus', 41, null, @poruka);select @poruka as t;
call dodaj_superjato('Pavo-Indus', 60, null, @poruka);	select @poruka as t;	


#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Galakticka jata ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_galakticko_jato ('Bullet jato', 16, 2, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Abell 520', 59, 10, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Abell 2142', 26, 10, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Lokalna grupa'	, 85, 10, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Musket Ball jato', 11, null, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('El Gordo', 63, null, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Pandora jato', 73, null, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Phoenix jato', 63, null, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Fornax jato ', 36, null, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Antlia jato', 1, 12, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Virgo jato', 85, 3, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Centaurus jato', 18,12, @poruka); select @poruka as t;
call dodaj_galakticko_jato ('Hydra jato', 41, 12, @poruka); select @poruka as t;



#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Galaksije ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_galaksiju ('NGC AN 15', 88, 17, null, 'spiralna', null, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju ('NGC CO 16', 28, 24, null, 'spiralna', null, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju ('NGC BOD 17', 82, 24, null, 'spiralna', null, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju ('NGC TZK 18', 82, 24, null, 'spiralna', null, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju ('NGC CG 45', 82, 24, null, 'spiralna', null, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju ('NGC Comet B', 73, 24, null, 'spiralna', null, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju ('NGC TZKb 21', 73, 24, null, 'spiralna', null, null, null, @poruka);
select @poruka as t;
	
call dodaj_galaksiju ('Andromeda', 88, 24, null, 'spiralna', 110, 1500000000000.0, 10000000000.0, @poruka); 
select @poruka as t;
call dodaj_galaksiju('Crno oko', 24, null, null, 'spiralna', null, null, null, @poruka); 
select @poruka as t;
call dodaj_galaksiju('Bodova', 82, null, null, 'spiralna', null, null, null , @poruka);  
select @poruka as t;
call dodaj_galaksiju('Mesje 101 (Vatreno kolo)', 82, 24, null, 'spiralna', 85, null, null,  @poruka); /*170kly*/
select @poruka as t;
call dodaj_galaksiju('Cigara', 82, null, null, 'iregularna', 18.5, null, null,  @poruka); 
select @poruka as t;
call dodaj_galaksiju('Kometa',73, null, null, 'spiralna', 300, null, null, @poruka); 
select @poruka as t;
call dodaj_galaksiju('Cosmos Redshift 7 (CR7)', 76, null, null,'spiralna', null, null,800000000,  @poruka); 
select @poruka as t;
call dodaj_galaksiju('Tocak za karuce', 73, 24, null, 'prsten', 65, null, null,  @poruka); #170kly
select @poruka as t;
call dodaj_galaksiju('Hogov objekat', 75, null, null, 'prsten' , 60.5, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju('Veliki Magelanov oblak', 32, 24, null,  'iregularna', 7, 10000000000, null, @poruka);
select @poruka as t;
call dodaj_galaksiju('Mali Magelanov oblak', 42, 24, null, 'iregularna patuljasta', 7, null, null,  @poruka);
select @poruka as t;
call dodaj_galaksiju('Mejolov Objekat', 82, null, null, 'prsten', null, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju('Suncokret', 12, null, null, 'spiral', null, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju('Punogavac', 33, null, null, 'premoscena spiralna galaksija', 97.5, null, null, @poruka);
select @poruka as t;
call dodaj_galaksiju('Vir', 12, null, null, 'spiralna', 30, null, 400300000,  @poruka);
select @poruka as t;
call dodaj_galaksiju('Mlijecni put', null, 17, null, 'premoscena spiralna galaksija', 85, 1500000000000, 13700000000,  @poruka);
select @poruka as t;
/*call dodaj_galaksiju('Sombrero' ,85, 24, null, 'spiralna', null, null, null,  @poruka);
select @poruka as t;*/



#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Zvjezdana jata ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_zvjezdano_jato('NGC Hy ', 77, 49, 10, 400, 625000000, @poruka); 
select @poruka as tg;                                       
call dodaj_zvjezdano_jato('Hyades', 77, 49, 10, 400, 625000000, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Zecje jato', 88, 49, 10, 400, 625000000, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Messier 46', 77, 49, 10, 400, 625000000, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Coma', 24, 49, null, null, null, @poruka ); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Messier 6, Leptir jato', 72, 49, 6, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Messier 11, Divlja patka jato', 74, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Messier 44, Osinjak jato', 11, 49, null, 500, 600000000, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Messier 45, Plejade', 77, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('IC 2602, Juzne Plejade', 16, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('IC 2391, Omicron Velorum Cluster', 84, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Alfa Persej', 62, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('NGC 2516, Dijamant jato', 16, 49, null, 10000000, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('NGC 3532, Bunar zelja jato', 16, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('NGC 4755, Kutija za nakit', 29, 49, null, null, 16000000, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('NGC 3766, Biserno jato', 18, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('NGC 3767', 18, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('NGC 206', 88, 34, null, null, null, @poruka); 
select @poruka as tg;
/*
*/

#▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Magline ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_maglinu ('Duh Jupitera', 41, null, 49, 'planetarna', @poruka);
select @poruka as tm;
call dodaj_maglinu ('Prsten maglina', 51, 64, 49, 'planetarna',  @poruka);
select @poruka as tm;							
call dodaj_maglinu ('Macje oko maglina', 33,  null, 49, 'planetarna',  @poruka);
select @poruka as tm;						
call dodaj_maglinu ('Sova maglina', 82, null, 49, 'planetarna',  @poruka);
select @poruka as tm;
call dodaj_maglinu ('Leptir maglina',72, 55 , 49, 'planetarna',  @poruka);
select @poruka as tm;
call dodaj_maglinu ('Lobanja maglina', 20, null , 49, 'planetarna',  @poruka);
select @poruka as tm;
call dodaj_maglinu ('Plava grudva maglina', 88, null , 49, 'planetarna',  @poruka);
select @poruka as tm;						
call dodaj_maglinu ('Kraba maglina', 77, null , 49, 'supernova ostatak',  @poruka);
select @poruka as tm;								
call dodaj_maglinu ('Ledeni lav maglina',45,  null, 49, 'protoplanetarna',  @poruka);
select @poruka as tm; 
call dodaj_zvjezdano_jato('Sirius Superjato', 13, 49, null, null, null, @poruka); 
select @poruka as tg;
call dodaj_zvjezdano_jato('Lokalno jato', 85, 49, null, null, null, @poruka); 
select @poruka as tg;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Zvjezdani sistemi ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_zvjezdani_sistem ( 'Sirius',  13,  77 , 49, 24,  'binarni sistem', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Spica',  85, 78 , 49, 24, 'binarni sistem', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Glize 667',  72, 78 , 49,  24, 'ternarni sistem', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Alcor-Mizar',  82,  78 , 49, 24, 'kvarternarni sistem', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Delta Orionis', 59, 78 , 49, 24, 'kvinternarni sistem', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Beta Tucanae', 59,  78 , 49, 24, 'seksternarni sistem', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Nu Scorpii', 72,  78 ,49,  24, 'seksternarni sistem', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Solarni', 85,  78 , 49, 24, 'jednoclani', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Rigel', 59,  78 , 49, 24, 'jednoclani', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Proksima Kentaur', 59,  78 , 49, 18, 'jednoclani', @poruka);
select @poruka as st;
call dodaj_zvjezdani_sistem ( 'Polaris AB sistem', 83,  78 , 49, 18, 'jednoclani', @poruka);
select @poruka as st;

    



#▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Planete ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓
							
call dodaj_planetu ('Merkur', 'terestricka', 'planeta', 2439 /*km*/, null, 0.147 /*Earths*/, 0.056 /*Earths*/, 0.055 /*Earths*/, 3.7 /*m/s^2*/, 4.25 /*km/s*/,58.646 /*d*/, 0.142, 15324.68 /*km*/, 0.000000005/*P*/, 275, 0.034 /*stepena*/,@poruka);
select @poruka as pt;
call dodaj_planetu ('Venera', 'terestricka', 'planeta', 6051.8, null, 0.902, 0.866, 0.815, 8.87, 10.36, -243.025 /*retrograde*/, 0.689, 38024.55, 9200000, 737 /*prosjecna*/, 2.64 /*retrograde*/,@poruka);
select @poruka as pt;
call dodaj_planetu ('Zemlja', 'terestricka', 'planeta', 6371, 6378.1, 510072000, 108321000000, 5.97237 /*10 na 24*/, 9.807, 11.186, 0.997, 0.367, 40075.017, 101325, 288, 23.4392811,@poruka);
select @poruka as pt;
call dodaj_planetu ('Mars', 'terestricka', 'planeta', 3389.5, 3396.2, 0.284, 0.151, 0.107,3.711, 5.027, 1.025957, 0.170, 21296.8, 636, 210, 25.19,@poruka);
select @poruka as pt;
call dodaj_planetu ('Jupiter', 'gasovita', 'planeta', 69911, 71492, 121.9, 1321,317.8,24.79, 59.5, 0.38,0.538, 439263.397,70000, 138.5, 3.13,@poruka);
select @poruka as pt;
call dodaj_planetu ('Saturn', 'gasovita', 'planeta',  58232,60268, 83.703, 763.59, 95.159, 10.44, 35.5,0.45, 0.499, 365882.1378, 140000,48.5, 26.73,@poruka);
select @poruka as pt;
call dodaj_planetu ('Uran', 'gasovita', 'planeta', 25362, 25559, 15.91, 63.086,14.536,8.69, 21.3, -0.71833, 0.51, 159273.36, null, 916.5, 97.77,@poruka);
select @poruka as pt;
call dodaj_planetu ('Neptun', 'gasovita', 'planeta', 24622, 24341, 14.98, 57.74, 17.147,11.15, 23.5, 0.6713, 0.41, 154626.16, null, 63.5, 28.32,@poruka);
select @poruka as pt;


#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Patuljaste planete ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_patuljastu_planetu ('Eris', 'trans-neptunski objekat', 'patuljasta planeta', 1163, null, null, null, 0.0028, 0.82, 1.38, 1.104, null, 7303.64, null,null,null,@poruka);
select @poruka as ppt;
call dodaj_patuljastu_planetu ('Pluton', 'trans-neptunski objekat', 'patuljasta planeta',1188,null, 0.035, 0.00651, 0.00218, 0.620, 1.212, 6.387230, 0.49, 7460.64, null, 44, 122.53,@poruka);
select @poruka as ppt;
call dodaj_patuljastu_planetu ('Makemake', 'Kojperov pojas', 'patuljasta planeta', 715, null, null, null, null, null, null, 0.3, 0.81, null, null, 40, null,@poruka);
select @poruka as ppt;
call dodaj_patuljastu_planetu ('Haumea', 'trans-neptunski objekat', 'patuljasta planeta', 816, null, null, null, 0.00066, 0.401, 0.809, 0.163146, 0.7, null, null, 50 ,null,@poruka);
select @poruka as ppt;
call dodaj_patuljastu_planetu ('Cerera', 'pojas asteroida', 'patuljasta pleneta', 473, null, null, null,0.00015,0.28, 0.51, 0.3781, 0.09, null, null, 168, 4,@poruka);
select @poruka as ppt;


#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Prirodni sateliti ▓▓ Jupiter ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_satelit ('Metis', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Adrastea', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Amalthea', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Thebe', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Io', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Europa', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Ganymede', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Callisto', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Themisto', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Leda', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Himalia', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2018 J 1', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 4', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Lysithea', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Elara', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Dia', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Carpo', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 12', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2016 J 2', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Euporie', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 3', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2011 J 1', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 18', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2010 J 2', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Thelxinoe', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Euanthe', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Helike', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Orthosie', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 7', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2016 J 1', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 3', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Iocaste', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 16', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Praxidike', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Harpalyke', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Mneme', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Hermippe', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Thyone', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 9', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Ananke', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Herse', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Aitne', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 6', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Kale', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Taygete', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 19', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Chaldene', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 15', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 10', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 23', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Erinome', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Aoede', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Kallichore', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 5', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 8', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Kalyke', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Carme', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Callirrhoe', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Eurydome', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 2', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Pasithee', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2010 J 1', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Kore', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Cyllene', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2011 J 2', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Eukelade', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2017 J 1', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 4', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Pasiphae', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Hegemone', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Arche', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Isonoe', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 9', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 5', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Sinope', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Sponde', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Autonoe', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('Megaclite', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;
call dodaj_satelit ('S/2003 J 2', 193, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;   



#▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Zvijezde ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓
                                
call dodaj_zvijezdu('Sunce (Sol)', 86 , 'Zvijezda ', null, 109 /*Earths*/,  12000 /*Earths*/, 130000000/*zemalja*/, 333000/*zemalja*/,274 /*m/s^2*/, 617.7 /*km/s*/, 25.25 /*d*/, null, 109 /*Earths*/ , 'G-vrsta Glavni niz, G2V', null, 15700000 /*K*/, null, 4600000000, 98 /*lm/W*/, 12.4 /*Earths*/, @poruka);
select @poruka as zt; 
call dodaj_zvijezdu('Rigel A', 87 , 'Zvijezda',  null, null, null, 276000 /*Earth3.*/,398125000 , null, null, null, null, null, 'Alfa Signi, B8la', null, 12100, null, 8000000, null, null, @poruka);
select @poruka as zt; 
call dodaj_zvijezdu('Rigel Ba', 87 , 'Zvijezda',  null, null,  null, null, 46080, null, null, null, null, null, 'Glavni niz, B9v', null, null, null, null, null, null, @poruka);
select @poruka as zt; 
call dodaj_zvijezdu('Rigel Bb', 87 , 'Zvijezda',  null, null,  null, null, 35280, null, null, null, null, null, 'Glavni niz, B9v', null, null, null, null, null, null, @poruka);
select @poruka as zt;
call dodaj_zvijezdu('UY Stit (UY Scuti)', null , 'Zvijezda',null, 186172 /*E*/, null,  null, null, 7, -0.5, null, null, null, 'Crveni superdzin; Pulsirajuca var zvijezda, M4la', null, 3365, null, null, 340000, null, @poruka);
select @poruka as zt;
call dodaj_zvijezdu('Proksima Kenaturi', 88 , 'Zvijezda',8700, null, null,  null, 1465.2, null, null, null, null, null, 'Crveni dzin, M6Ve', null, null, null, 4890000000, null, null, @poruka);
select @poruka as zt;
call dodaj_zvijezdu('Alfa Kentaur A', 88 , 'Zvijezda',null, null, null,  null,36630000, 1178, null, null, null, null, 'Glavni niz, G2V', null,5790, null, 4400000000, 220.12, null, @poruka);
select @poruka as zt;
call dodaj_zvijezdu('Alfa Kentaur B', 88 , 'Zvijezda',null, null, null,  null, 302031,1279, null, null, null, null, 'Glavni niz, K1V', null,5260, null,650000000, 110.2, null, @poruka);
select @poruka as zt;
call dodaj_zvijezdu('Van Maanes', null , 'Zvijezda',null, null, null,  null, 2264400, 2235, null, null, null, null, 'Bijeli patuljak', null,6220, null, 3130000000, 220.12, null, @poruka);
select @poruka as zt;
call dodaj_zvijezdu ('Polaris A (Sjevijernjaca)', 89, 'Zvijezda', null, 4807.5, null, null, 1798200, 602.8, null, 119, null, null, 'Superdzin', null, 6015,null, 70000000, null, null, @poruka);
select @poruka as zt;
call dodaj_zvijezdu ('Sirius A', 79, 'Zvijezda', null, 4807.5, null, null, 1798200, 602.8, null, 119, null, null, 'Bijeli Glavni niz, A0 ili A1', null, 9940,null, 237000000, null, null, @poruka);
select @poruka as zt;
call dodaj_zvijezdu ('Sirius B', 79, 'Zvijezda', null, 4807.5, null, null, 1798200, 602.8, null, 119, null, null, 'SBijeli patuljak, DA2', null, 25200,null, 228000000, null, null, @poruka);
select @poruka as zt;



#▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Komete ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_kometu('Sedna', 'mala planeta', 'kometa', null, null, null,null, null,null,null, 0.428, 0.32, null,@poruka);
select @poruka as kt;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Asteroidi ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_asteroid('2013 ND15', null, 'Venerin trojanski asteroid', null,'asteroid', null, null,null,null, null, null, null, 224.8, null, null, @poruka);
select @poruka as at;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Prirodni sateliti ▓▓ Zemlja ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_satelit('Mjesec', 191, 'prirodni satelit', 1737.1, 1738.1, 0.074, 0.020, 0.012300, 1.62,2.38, 27.321661, 0.136, 10921, 0.0549, 27.321661, 1.022, null, 5.145, 18.61 /*godina*/, 362600, @poruka);
select @poruka as pst;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Prirodni sateliti ▓▓ Mears ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_satelit ('Dejmos', 192, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;  
call dodaj_satelit ('Fobos', 192, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;  

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Prirodni sateliti ▓▓ Saturn ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


call dodaj_satelit ('Enceladus', 194, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Prirodni sateliti ▓▓ Uran ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_satelit ('Ariel', 195, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Prirodni sateliti ▓▓ Neptun ▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_satelit ('Despina', 196, 'prirodni satelit', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, @poruka); 
select @poruka as pst;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Crne rupe ▓▓ 
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

call dodaj_crnu_rupu('Sagitarius A*', 'crna rupa', 4310000 /*Solarnih*/,49, 18 /*h*/, -29 /*stepeni*/, @poruka);
select @poruka as ct;
call dodaj_crnu_rupu('SDSS J140821.67+025733.2', 'crna rupa', 196000000000 /*Solarnih*/, 24, null, null, @poruka);
select @poruka as ct;
call dodaj_crnu_rupu('Cigara', 'crna rupa', 1000000000 /*Solarnih*/, 38, null, null, @poruka);
select @poruka as ct;
call dodaj_crnu_rupu('Andromeda', 'crna rupa', 230000000 /*Solarnih*/, 34, null, null, @poruka);
select @poruka as ct;

#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
#▓▓ Hemijski elementi ▓▓ 
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓


insert into hemijski_element(AtomskiBroj, NazivHemijskogElementa, Simbol)
values (1, 'Vodonik', 'H');
insert into hemijski_element(AtomskiBroj, NazivHemijskogElementa, Simbol)
values (6, 'Ugljenik', 'C');
insert into hemijski_element(AtomskiBroj, NazivHemijskogElementa, Simbol)
values (7, 'Azot', 'N');
insert into hemijski_element(AtomskiBroj, NazivHemijskogElementa, Simbol)
values (8, 'Kiseoink', 'O');
insert into hemijski_element(AtomskiBroj, NazivHemijskogElementa, Simbol)
values ( 11, 'Natrijum', 'Na');
insert into hemijski_element(AtomskiBroj, NazivHemijskogElementa, Simbol)
values (18, 'Argon', 'Ag');
insert into hemijski_element(AtomskiBroj, NazivHemijskogElementa, Simbol)
values (19, 'Kalijum', 'K');
insert into hemijski_element(AtomskiBroj, NazivHemijskogElementa, Simbol)
values (2, 'Helijum', 'He');



insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values( 189, 1, 22.0000);
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values( 189, 8, 42.0000);
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values( 189, 11, 29.0000);	
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(189,	19,	0.5000);	
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(190,	6,	90.0000);		
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(190,	8,	45.0000);		
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(191,	7, 78.8000);		
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(191,	8, 29.5000);			
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(	191, 18, 0.9340);			
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(	192, 6,	90.0000);			
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(192,	7, 1.8900);			
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(192,	18,	1.9300);					
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(193,	1,89.0000);		
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(	193, 2, 10.0000);	
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(194, 1, 96.3000);	
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(194, 2, 3.2500);	
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(	195, 1, 83.0000);	
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(	195, 2, 15.0000);		
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(196, 1, 80.2000);		
insert into sadrzi_he(NebeskoTijeloID, AtomskiBroj, Kolicina)
values(196, 2, 21.5000);
	
    
 call dodaj_postojeci_objekat_za_satelit(191,281);
	