
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

public class DodajCrnuRupu implements Initializable{

	public String dodajCrnuRupu(String naziv, String vrsta, Float masa, int id_galaksije, Integer rekt, Integer deklinacija) {
		Connection c = null;
		ResultSet rs = null;
		CallableStatement cs = null;
		String poruka = "";
		
		DbConnection dc;
		try {
			dc = new DbConnection();
		    c = dc.Connect();
			cs = c.prepareCall("{call dodaj_crnu_rupu(?, ?, ?, ?, ?, ?, ?)}");
			
			//registrujemo izlazne parametre
			cs.registerOutParameter(7, Types.VARCHAR);
			
			//registrujemo ulazne parametre
			cs.setString(1, naziv);
			cs.setString(2, "crna rupa");
			
			//MASA
			if(masa != null)
				cs.setFloat(3, masa);
			else
				cs.setNull(3, Types.FLOAT);
			
			//ID GALAKSIJE
			cs.setInt(4, id_galaksije);;
			
			//Rektazscezija
			if (rekt != null)
				cs.setInt(5, rekt);
			else
				cs.setNull(5, Types.INTEGER);
			

			//DEKLINACIJA
			if(deklinacija != null)
				cs.setInt(6, deklinacija);
			else
				cs.setNull(6, Types.INTEGER);
	
		    //izvrsimo upit
			cs.executeQuery();
			
			//upisemo poruku
			poruka = cs.getString(7);
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





