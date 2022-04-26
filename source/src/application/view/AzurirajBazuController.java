package application.view;
import application.view.*;
import application.view.DodajPrirodniSatelit;
import javafx.scene.control.TextField;
import java.io.FileInputStream;
import java.io.IOException;

import application.Main;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
public class AzurirajBazuController {
	
	private Main main; 
	
	@FXML
	private void goAzurirajBazu() throws IOException {
		main.showAzurirajBazuScene();	
	}
	
	@FXML
	private void goDodajNovuZvijezdu() throws IOException {
		main.showDodajNovuZvijezduScene();
	}
	
	@FXML 
	private void goHome() throws IOException {
		main.showMainItems();
	}
	
	@FXML
	private void goDodajNovuPlanetu() throws IOException {
		main.showDodajNovuPlanetuScene();
	}
	
	@FXML
	private void goDodajNovuCrnuRupu () throws IOException {
		main.showDodajNovuCrnuRupuScene();
		
	}
	
	@FXML
	private void goDodajNoviPrirodniSatelit() throws IOException {
		main.showDodajNoviPrirodniSatelitScene();
	}

}
