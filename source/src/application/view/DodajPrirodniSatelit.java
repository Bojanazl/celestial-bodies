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

public class DodajPrirodniSatelit implements Initializable{

	public String dodajPrirodniSatelit(String naziv,int id_roditelja, String vrsta, Float g_poluprecnik, Float e_poluprecnik, Float p, 
								Float m, Float v, Float g, Float broslo, Float roper, Float albedo, Float o,
								Float eks, Float o_period, Float brzina, Float anomalija, Float inklinacija, Float cvor, Float perihel) {
		Connection c = null;
		ResultSet rs = null;
		CallableStatement cs = null;
		String poruka = "";
		DbConnection dc;
		
		try {
			dc = new DbConnection();
		    c = dc.Connect();
			cs = c.prepareCall("{call dodaj_satelit(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			
			//registrujemo izlazne parametre
			cs.registerOutParameter(21, Types.VARCHAR);
			
			//registrujemo ulazne parametre
			cs.setString(1, naziv);
			cs.setInt(2, id_roditelja);
			cs.setString(3, vrsta);
			
			
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
			
			//MASA
			if(m != null)
				cs.setFloat(7, m);
			else
				cs.setNull(7, Types.FLOAT);
			
			//ZAPREMINA
			if(v != null)
				cs.setFloat(8, v);
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
			
			//Eks
			if(eks != null)
				cs.setFloat(14, eks);
			else
				cs.setNull(14,  Types.FLOAT);
			
			
			//O PERIOD
			if(o_period != null)
				cs.setFloat(15, o_period);
			else
				cs.setNull(15,  Types.FLOAT);
			
			
			//BRZINA
			if(brzina != null)
				cs.setFloat(16, brzina);
			else
				cs.setNull(16,  Types.FLOAT);
			
			
			//ANOMALIJA
			if(anomalija != null)
				cs.setFloat(17, anomalija);
			else
				cs.setNull(17,  Types.FLOAT);
			
			
			//INKLINACIJA
			if(inklinacija != null)
				cs.setFloat(18, inklinacija);
			else
				cs.setNull(18,  Types.FLOAT);
			
			
			//CVOR
			if(cvor != null)
				cs.setFloat(19, cvor);
			else
				cs.setNull(19,  Types.FLOAT);
			
			
			//PERIHEL
			if(perihel != null)
				cs.setFloat(20, perihel);
			else
				cs.setNull(20,  Types.FLOAT);
			
		    
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


