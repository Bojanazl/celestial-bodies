
package application.view;

import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ResourceBundle;
import java.util.Scanner;

import javafx.fxml.Initializable;

public class DodajZvijezdu implements Initializable{
	
	/*PROCEDURE `dodaj_zvijezdu`(IN ime VARCHAR(50), IN id_zvjezdanog_sistema INT, IN vrsta VARCHAR(50), IN g_poluprecnik FLOAT, IN e_poluprecnik FLOAT, 
								 IN p FLOAT, IN v FLOAT, IN m FLOAT, IN g FLOAT, IN brzina_oslobadjanja FLOAT, IN rot_period FLOAT, 
								 IN albedo FLOAT, IN o FLOAT, IN klasifikacija VARCHAR(50), IN pritisak FLOAT, 
                                 IN temperatura FLOAT, IN osa FLOAT, IN starost FLOAT, IN luminoznost FLOAT, IN gustina FLOAT,
                                 OUT uspjesna_poruka VARCHAR(200))
BEGIN*/

	public String dodajZvijezdu(String naziv, int id_zs, String vrsta, Float g_poluprecnik, Float e_poluprecnik, Float p,  Float v, Float g, 
								Float broslo, Float roper, Float albedo, Float m, String klasifikacija) {
		Connection c = null;
		ResultSet rs = null;
		CallableStatement cs = null;
		String poruka = "";
		DbConnection dc;
		
		try {
			dc = new DbConnection();
		    c = dc.Connect();
			cs = c.prepareCall("{call dodaj_zvijezdu(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			
			//registrujemo izlazne parametre
			cs.registerOutParameter(21, Types.VARCHAR);
			
			//registrujemo ulazne parametre
			
			//NAZIV, ID, VRSTA
			cs.setString(1, naziv);
			cs.setInt(2,  id_zs);
			cs.setString(3, "zvijezda");
			
			
			//GLAVNI POLUPRECNIK
			if(g_poluprecnik != null)
				cs.setFloat(4, g_poluprecnik);
			else
				cs.setNull(4, Types.FLOAT);
			
			
			//EKVATORIJALNI POLUPRECNIK
			if(e_poluprecnik != null)
				cs.setFloat(5, e_poluprecnik);
			else
				cs.setNull(5, Types.FLOAT);
			
			//POVRSINA
			if(p != null)
				cs.setFloat(6, p);
			else 
				cs.setNull(6, Types.FLOAT);
			
			//ZAPREMINA
			if(v != null)
				cs.setFloat(7, v);
			else
				cs.setNull(7, Types.FLOAT);
			
			//GRAVITACIONA KONSTANTA	
			if(g != null)
				cs.setFloat(8, g);
			else
				cs.setNull(8, Types.FLOAT);
			
			//BRZINA OSLOBADJANJA
			if(broslo != null)
				cs.setFloat(9,broslo);
			else
				cs.setNull(9, Types.FLOAT);
			
			//ROTACIONI PERIOD
			if(roper != null)
				cs.setFloat(10,  roper);
			else 
				cs.setNull(10,  Types.FLOAT);
			
			//ALBEDO
			if(albedo != null)
				cs.setFloat(11, albedo);
			else
				cs.setNull(11, Types.FLOAT);
			
			//MASA
			if(m != null)
				cs.setFloat(13, m);
			else
				cs.setNull(13, Types.FLOAT);
			
			cs.setString(14, klasifikacija);
			
			cs.setNull(12,  Types.FLOAT);
			cs.setNull(15,  Types.FLOAT); // <---------------------dodano
			cs.setNull(16, Types.FLOAT);
			cs.setNull(17, Types.FLOAT);
			cs.setNull(18, Types.FLOAT);
			cs.setNull(19, Types.FLOAT);
			cs.setNull(20, Types.FLOAT);
			
		    
		    //izvrsimo upit
			cs.executeQuery();
			
			//upisemo poruku
			poruka = cs.getString(21);
			//System.out.println(poruka);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (cs != null)
				try {
					cs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (c != null)
				try {
					c.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return poruka;
	}

	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
		// TODO Auto-generated method stub
		
	}
}





