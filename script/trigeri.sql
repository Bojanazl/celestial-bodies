#**************************************************************************************************
#**********************************TRIGERI ZA NEBESKA TIJELA***************************************
#**************************************************************************************************


#**************************************************************************
#1 Pogresan unos - zvijezda je satelit planeti*****************************
#**************************************************************************

DELIMITER $$
CREATE TRIGGER before_satelit_insert
	BEFORE INSERT ON ima_orbitu
    FOR EACH ROW
BEGIN
    IF EXISTS 
		(
			SELECT 1
			FROM planeta p
			WHERE NEW.RoditeljID = p.NebeskoTijeloID
		) 
	AND EXISTS 
		( 
			SELECT NebeskoTijeloID
			FROM zvijezda z
            WHERE NEW.SatelitID = z.NebeskoTijeloID
		) 
	THEN
		SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'ID Zvijezda ne moze biti satelit planeti.';
    END IF;
END$$


#DROP TRIGGER before_satelit_insert;
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓




