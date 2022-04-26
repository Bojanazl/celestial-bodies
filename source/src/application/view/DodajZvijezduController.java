package application.view;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ComboBox;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import application.Main;


public class DodajZvijezduController {
	
	private Main main; 
	
	@FXML 
	private TextField naziv;
	@FXML 
	private ComboBox<String> idZvjezdanogSistema;
	@FXML 
	private ComboBox<String> klasifikacija;
	@FXML 
	private TextField gPoluprecnik;
	@FXML 
	private TextField ePoluprecnik;
	@FXML 
	private TextField povrsina;
	@FXML
	private TextField zapremina;
	@FXML
	private TextField gKonstanta;
	@FXML
	private TextField brzinaOslobadjanja;
	@FXML
	private TextField rPeriod;
	@FXML
	private TextField Albedo;
	@FXML
	private TextField masa;


	@FXML
	private void goPrikaziZvijezde() throws IOException {
		main.showPrikaziZvijezdeScene();
	}
	
	@FXML
	private void goDefinicije() throws IOException {
		main.showDefinicije();
	}

	@FXML
	public void goIspisZvijezde () throws IOException {
		main.showIspisiZvijezdeScene();
	}
	
	private static Float parsirajFloat(String tekst) {
		try {
			Float vrijednost = Float.parseFloat(tekst);
			return vrijednost;
		}
		catch (Exception e) {
			Float nista = null;
			return nista;
		}
	}
	
	
	@FXML
	private void handleButtonAction() {

	      	DodajZvijezdu zvijezda = new DodajZvijezdu();
	        String setnaziv = (naziv.getText());       
	        
	        
	        String idZvjezdanogSistemaTekst = idZvjezdanogSistema.getValue();
	        String[] razdvojeni = idZvjezdanogSistemaTekst.split("\\(");
	        int zvjezdaniSistemID = Integer.parseInt(razdvojeni[0]);
	        String setvrsta = "crna rupa";
	        
	        Float setgpoluprecnik = parsirajFloat(gPoluprecnik.getText());	    
	        Float setepoluprecnik = parsirajFloat(ePoluprecnik.getText());
	        Float setpovrsina = parsirajFloat(povrsina.getText());
	        Float setzapremina = parsirajFloat(zapremina.getText());
	        Float setgkonstanta = parsirajFloat(gKonstanta.getText());
	        Float setboslobadjanja = parsirajFloat(brzinaOslobadjanja.getText());
	        Float setrperiod = parsirajFloat(rPeriod.getText());
	        Float setalbedo = parsirajFloat(Albedo.getText());
	        Float setmasa = parsirajFloat(masa.getText());
	        String setklasifikacija = (String) (klasifikacija.getValue());
	 
	        
	   
	        String poruka = zvijezda.dodajZvijezdu( setnaziv, zvjezdaniSistemID, setvrsta , setgpoluprecnik, setepoluprecnik, setpovrsina, setzapremina,
	        										setgkonstanta, setboslobadjanja, setrperiod, setalbedo, setmasa, setklasifikacija);
	        System.out.println(poruka);
	        
	        Alert alert = new Alert(AlertType.INFORMATION, poruka, ButtonType.OK);
	        alert.showAndWait();
	        
		}
	
	
public void postaviZvjezdaniSistemUChoiceBox(){
		
		Connection conn = null;
		DbConnection dc;
		
		try {
			dc = new DbConnection();
		    conn = dc.Connect();
			Statement stmt = null;
			ResultSet rs = null;

			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT ID, ZvjezdaniSistem FROM lista_zvjezdanih_sistema");
			
			
			ArrayList<String> zsistemi = new ArrayList<String>();
			
			while (rs.next()) {
				String zs = rs.getInt(1) + "(" + rs.getString(2) + ")";
				zsistemi.add(zs);
			}

			idZvjezdanogSistema.getItems().clear();
			idZvjezdanogSistema.getItems().addAll(zsistemi);
			
		}

		catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
	
	}	



public void postaviVrstuUChoiceBox(){
	
	Connection conn = null;
	DbConnection dc;
	try {
		dc = new DbConnection();
	    conn = dc.Connect();
		Statement stmt = null;
		ResultSet rs = null;

		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT DISTINCT SpektralnaKlasifikacija FROM zvijezde_info");
		
		
		ArrayList<String> klasifikacije = new ArrayList<String>();
		
		while (rs.next()) {
			String kl = rs.getString(1);
			klasifikacije.add(kl);
		}
		
		klasifikacija.getItems().clear();
		klasifikacija.getItems().addAll(klasifikacije);
		
	}

	catch (SQLException ex) {
	    // handle any errors
	    System.out.println("SQLException: " + ex.getMessage());
	    System.out.println("SQLState: " + ex.getSQLState());
	    System.out.println("VendorError: " + ex.getErrorCode());
	}

}	




}

