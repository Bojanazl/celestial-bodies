
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


public class DodajPlanetu implements Initializable {
	
	public String dodajPlanetu(String naziv, String tip, String vrsta, Float g_poluprecnik, Float e_poluprecnik, Float p, Float v, Float m, 
								Float g, Float broslo, Float roper, Float albedo, Float o, Float pritisak, Float temp, Float osa) {
		Connection c = null;
		ResultSet rs = null;
		CallableStatement cs = null;
		String poruka = "";
		DbConnection dc;
		
		try {
			dc = new DbConnection();
		    c = dc.Connect();
			cs = c.prepareCall("{call dodaj_planetu(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			
			//registrujemo izlazne parametre
			cs.registerOutParameter(17, Types.VARCHAR);
			
			//registrujemo ulazne parametre
			cs.setString(1, naziv);
			cs.setString(2, tip);
			cs.setString(3, "planeta");
			
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
			
			//MASA
			if(m != null)
				cs.setFloat(8,  m);
			else
				cs.setNull(8, Types.FLOAT);
			
			//GRAVITACIONA KONSTANTA	
			if(g != null)
				cs.setFloat(9, g);
			else
				cs.setNull(9, Types.FLOAT);
			
			//BRZINA OSLOBADJANJA
			if(broslo != null)
				cs.setFloat(10,broslo);
			else
				cs.setNull(10, Types.FLOAT);
			
			//ROTACIONI PERIOD
			if(roper != null)
				cs.setFloat(11,  roper);
			else 
				cs.setNull(11,  Types.FLOAT);
			
			//ALBEDO
			if(albedo != null)
				cs.setFloat(12, albedo);
			else
				cs.setNull(12, Types.FLOAT);
			
			
			//OBIM
			if(o != null)
				cs.setFloat(13, o);
			else
				cs.setNull(13,  Types.FLOAT);
			
			//PRITISAK
			if(pritisak != null)
				cs.setFloat(14,  pritisak);
			else
				cs.setNull(14,  Types.FLOAT);
			
			//TEMPERATURA
			if (temp != null)
				cs.setFloat(15, temp);
			else
				cs.setNull(15, Types.FLOAT);
			
			//OSA
			if (osa != null)
				cs.setFloat(16,  osa);
			else
				cs.setNull(16, Types.FLOAT);
		
		    
		    //izvrsimo upit
			cs.executeQuery();
			
			//upisemo poruku
			poruka = cs.getString(17);
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





