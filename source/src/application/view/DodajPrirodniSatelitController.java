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

public class DodajPrirodniSatelitController {

	private Main main; 
	
	@FXML 
	private TextField Naziv;
	@FXML 
	private ComboBox<String> idRoditelja;
	@FXML 
	private ComboBox<String> vrsta;
	@FXML 
	private TextField gPoluprecnik;
	@FXML 
	private TextField ePoluprecnik;
	@FXML 
	private TextField povrsina;
	@FXML
	private TextField zapremina;
	@FXML
	private TextField obim;
	@FXML 
	private TextField masa;
	@FXML
	private TextField gKonstanta;
	@FXML
	private TextField brzinaOslobadjanja;
	@FXML
	private TextField rPeriod;
	@FXML
	private TextField albedo;
	@FXML
	private TextField ekscentritet;
	@FXML
	private TextField oPeriod;
	@FXML
	private TextField brzina;
	@FXML
	private TextField anomalija;
	@FXML
	private TextField inklinacija;
	@FXML
	private TextField uCvor;
	@FXML
	private TextField perihel;
	
	@FXML
	private void goDodajNoviPrirodniSatelit() throws IOException {
		main.showDodajNoviPrirodniSatelitScene();
	}
	
	@FXML
	private void goIspisiSatelite() throws IOException {
		main.showIspisiPriodniSatelitScene();
	}
	
	@FXML
	private void goDefinicije() throws IOException {
		main.showDefinicije();
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

	      	DodajPrirodniSatelit psatelit = new DodajPrirodniSatelit();
	      	
	        String setnaziv = (Naziv.getText());       	      
	        
	        String roditeljTekst = idRoditelja.getValue();
	        String[] razdvojeni = roditeljTekst.split("\\(");
	        int id_roditelja = Integer.parseInt(razdvojeni[0]);
	        
	        String setvrsta = (vrsta.getValue());
	        
	        Float setgpoluprecnik = (parsirajFloat(gPoluprecnik.getText()));
	        Float setepoluprecnik = (parsirajFloat(ePoluprecnik.getText()));
	        Float setpovrsina = (parsirajFloat(povrsina.getText()));
	        Float setzapremina = (parsirajFloat(zapremina.getText()));
	        Float setobim = (parsirajFloat(obim.getText()));
	        Float setmasa = (parsirajFloat(masa.getText()));
	        Float setgkonstanta = (parsirajFloat(gKonstanta.getText()));
	        Float setboslobadjanja = (parsirajFloat(brzinaOslobadjanja.getText()));
	        Float setrperiod = (parsirajFloat(rPeriod.getText()));
	        Float setalbedo = (parsirajFloat(albedo.getText()));
	        Float setekscentritet = (parsirajFloat(ekscentritet.getText()));
	        Float setoperiod = (parsirajFloat(oPeriod.getText()));
	        Float setbrzina = (parsirajFloat(brzina.getText()));
	        Float setanomalija = (parsirajFloat(anomalija.getText()));
	        Float setinklinacija = (parsirajFloat(inklinacija.getText()));
	        Float setucvor = (parsirajFloat(uCvor.getText()));
	        Float setperihel = (parsirajFloat(perihel.getText()));
	        
	        
	        
	        String poruka = psatelit.dodajPrirodniSatelit( setnaziv, id_roditelja, setvrsta, setgpoluprecnik,setepoluprecnik, setpovrsina,
	        		setzapremina, setobim, setmasa, setgkonstanta, setboslobadjanja, setrperiod, setalbedo, setekscentritet, setoperiod,
	        		setbrzina, setanomalija, setinklinacija, setucvor, setperihel);
	        System.out.println(poruka);
	        
	        Alert alert = new Alert(AlertType.INFORMATION, poruka, ButtonType.OK);
	        alert.showAndWait();
	        
		}
	
	

	public void postaviRoditeljaUChoiceBox(){
		
		Connection conn = null;
		DbConnection dc;
		
		try {
			dc = new DbConnection();
		    conn = dc.Connect();
			Statement stmt = null;
			ResultSet rs = null;

			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT NebeskoTijeloID, Ime FROM nebesko_tijelo where NebeskoTijeloID <> 188; ");

			//ResultSetMetaData rsmd = rs.getMetaData();
			
			
			ArrayList<String> roditelj = new ArrayList<String>();
			
			while (rs.next()) {
				String rod = rs.getInt(1) + "(" + rs.getString(2) + ")";
				roditelj.add(rod);
			}

			idRoditelja.getItems().clear();
			idRoditelja.getItems().addAll(roditelj);
			
		}

		catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
	
	}	
	
	public void postaviVrstuUChoiceBox(){
		ArrayList<String> vrste = new ArrayList<String>();
		vrste.add("planeta");
		vrste.add("zvijezda");
		vrste.add("kometa");
		vrste.add("asteroid");
		
		vrsta.getItems().clear();
		vrsta.getItems().addAll(vrste);
	}
	
	

}

	