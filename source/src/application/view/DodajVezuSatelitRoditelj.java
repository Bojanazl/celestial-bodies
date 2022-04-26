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

public class DodajVezuSatelitRoditelj implements Initializable  {

		
		public String dodajPlanetu(String naziv, String tip, String vrsta, float g_poluprecnik, float e_poluprecnik, float p, float v, float m, 
									float g, float boslo, float roper, float albedo, float o, float pritisak, float temp, float osa) {
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
				cs.setFloat(4, g_poluprecnik);
				cs.setFloat(5, e_poluprecnik);
				cs.setFloat(6, p);
				cs.setFloat(7, v);
				cs.setFloat(8, m);
				cs.setFloat(9, g);
				cs.setFloat(10, boslo);
				cs.setFloat(11, roper);
				cs.setFloat(12, albedo);
				cs.setFloat(13, o);
				cs.setFloat(14, pritisak);
				cs.setFloat(15, temp);
				cs.setFloat(16, osa);
			    
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
