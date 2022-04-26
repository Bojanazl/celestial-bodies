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

public class DodajPlanetuController {
	
	private Main main; 
	
	@FXML 
	private TextField naziv;
	@FXML 
	private ComboBox<String> tip;
	@FXML 
	private TextField gPoluprecnik;
	@FXML 
	private TextField ePoluprecnik;
	@FXML 
	private TextField povrsina;
	@FXML
	private TextField zapremina;
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
	private TextField obim;
	@FXML
	private TextField pritisak;
	@FXML
	private TextField temperatura;
	@FXML
	private TextField osa;
	
	

	@FXML
	private void goDodajNovuPlanetu () throws IOException {
		main.showDodajNovuPlanetuScene();
	}

	@FXML 
	private void goIspisiPlanete() throws IOException{
		main.showIspisiPlaneteScene();
	}

	@FXML
	private void goDefinicije() throws IOException {
		main.showDefinicije();
	}

	public void postaviTipUChoiceBox(){
			ArrayList<String> tipovi = new ArrayList<String>();
			tipovi.add("terestricka");
			tipovi.add("gasovita");
			tip.getItems().clear();
			tip.getItems().addAll(tipovi);
	
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

	      	DodajPlanetu crupa = new DodajPlanetu();
	      	
	        String setnaziv = (naziv.getText());       
	        String settip = (tip.getValue());
	        String setvrsta = "planeta";
	        Float setgpoluprecnik = (parsirajFloat(gPoluprecnik.getText()));
	        Float setepoluprecnik = (parsirajFloat(ePoluprecnik.getText()));
	        Float setpovrsina = (parsirajFloat(povrsina.getText()));
	        Float setzapremina = (parsirajFloat(zapremina.getText()));
	        Float setmasa = (parsirajFloat(masa.getText()));
	        Float setgKonstanta = (parsirajFloat(gKonstanta.getText()));
	        Float setbrzinaOslobadjanja = (parsirajFloat(brzinaOslobadjanja.getText()));
	        Float setrPeriod = (parsirajFloat(rPeriod.getText()));
	        Float setalbedo = (parsirajFloat(albedo.getText()));
	        Float setobim = (parsirajFloat(obim.getText()));
	        Float setpritisak = (parsirajFloat(pritisak.getText()));
	        Float settemperatura = (parsirajFloat(temperatura.getText()));
	        Float setosa = (parsirajFloat(osa.getText()));

	        String poruka = crupa.dodajPlanetu( setnaziv, settip, setvrsta, setgpoluprecnik, setepoluprecnik, setpovrsina, setzapremina, setmasa, setgKonstanta, setbrzinaOslobadjanja,
	        									setrPeriod, setalbedo, setobim, setpritisak, settemperatura, setosa);
	        System.out.println(poruka);
	        
	        Alert alert = new Alert(AlertType.INFORMATION, poruka, ButtonType.OK);
	        alert.showAndWait();
	        
		}


}

