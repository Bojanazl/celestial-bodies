package application.view;
import javafx.scene.control.TextField;
import javafx.scene.control.TextInputControl;
import java.awt.event.ActionEvent;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import application.Main;
import application.view.DodajCrnuRupu;


public class DodajCrnuRupuController {
	
	private Main main; 
	
	//DodajCrnuRupu cr = new DodajCrnuRupu();
	
	//registrovanje
	@FXML 
	private TextField naziv;
	@FXML 
	/*private TextField vrsta;
	@FXML */
	private TextField masa;
	@FXML 
	private ComboBox<String> id_galaksije;
	@FXML 
	private TextField rektascenzija;
	@FXML
	private TextField deklinacija;
	@FXML
	private Button potvrdiDugme;
	@FXML
	private Button otkaziDugme;
	
	
	
	@FXML
	private void goDodajNovuCrnuRupu () throws IOException {
		main.showDodajNovuCrnuRupuScene();
	}

	@FXML
	public void goIspisiCrneRupe () throws IOException {
		Main.showIspisiCrneRupeScene();
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
	
	private static Integer parsirajInt(String tekst) {
		try {
			Integer vrijednost = Integer.parseInt(tekst);
			return vrijednost;
		}
		catch (Exception e) {
			Integer nista = null;
			return nista;
		}
	}
	
	@FXML
	private void handleButtonAction() {

	      	DodajCrnuRupu crupa = new DodajCrnuRupu();
	        String setnaziv = (naziv.getText());       
	        String setvrsta = "crna rupa";
	        Float setmasa = (parsirajFloat(masa.getText()));
	        
	        
	        String galaksijaTekst = id_galaksije.getValue();
	        String[] razdvojeni = galaksijaTekst.split("\\(");
	        int galaksijaID = Integer.parseInt(razdvojeni[0]);
	        
	        
	        Integer setrekt = (parsirajInt(rektascenzija.getText()));
	        Integer setdekl = (parsirajInt(deklinacija.getText()));
	        String poruka = crupa.dodajCrnuRupu( setnaziv, setvrsta, setmasa, galaksijaID, setrekt, setdekl);
	        System.out.println(poruka);
	        
	        Alert alert = new Alert(AlertType.INFORMATION, poruka, ButtonType.OK);
	        alert.showAndWait();
	        
		}
	
	

	public void postaviGalaksijeUChoiceBox(){
		DbConnection dc;
		
		Connection conn = null;
		try {
			dc = new DbConnection();
		    conn = dc.Connect();
		    
			Statement stmt = null;
			ResultSet rs = null;

			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT ID, Galaksija FROM lista_galaksija;");
			
			
			ArrayList<String> galaksije = new ArrayList<String>();
			
			while (rs.next()) {
				String gal = rs.getInt(1) + "(" + rs.getString(2) + ")";
				galaksije.add(gal);
			}

			id_galaksije.getItems().clear();
			id_galaksije.getItems().addAll(galaksije);
			
		}

		catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
	
	}	

}


	




    
