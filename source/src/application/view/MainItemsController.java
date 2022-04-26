package application.view;
import javafx.scene.control.TextField;
import java.io.FileInputStream;
import java.io.IOException;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import application.Main;

public class MainItemsController {
	
	private Main main; 
	@FXML
	private void goAzurirajBazu() throws IOException {
		main.showAzurirajBazuScene();
	}
		
	@FXML
	private void goUputstvo() throws IOException {
		main.showUputstvoScene();
	}
	
	@FXML
	private void goDefinicije() throws IOException {
		main.showDefinicije();
	}
	}
	
