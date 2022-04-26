package application.view;
import javafx.scene.control.TextField;
import java.io.IOException;

import javafx.fxml.FXML;
import application.Main;

public class MainViewController {
	
	private Main main;
	
	@FXML 
	private void goHome() throws IOException {
		main.showMainItems();
	}

	/*@FXML 
	private void dodajDugme() throws IOException {
		main.showDodajStage();
	}*/
}
