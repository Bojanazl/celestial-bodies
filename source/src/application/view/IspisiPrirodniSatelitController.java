package application.view;
import javafx.scene.control.TextField;
import javafx.scene.control.TextInputControl;
import java.awt.event.ActionEvent;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.Logger;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import application.Main;
import application.view.*;

public class IspisiPrirodniSatelitController  implements Initializable{
	
	private Main main;
	
	    @FXML
	    private TableView tabelaSatelita;

	    @FXML
	    private TableColumn id_roditelja;

	    @FXML
	    private TableColumn ime_roditelja;

	    @FXML
	    private TableColumn vrsta_roditelja;

	    @FXML
	    private TableColumn id_satelita;

	    @FXML
	    private TableColumn ime_satelita;

	    @FXML
	    private TableColumn vrsta_satelita;


	    private ObservableList<VezaRoditeljSatelitDataModel>data;
		private DbConnection dc;
	
		@Override
		public void initialize(URL ur1, ResourceBundle rb) {
			dc = new DbConnection();
			//loadDataFromDatabase();
		}
		
		@FXML
		public void loadDataFromDatabase() {
			data = FXCollections.observableArrayList();
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				dc = new DbConnection();
			    conn = dc.Connect();
				ps = conn.prepareStatement("SELECT * FROM lista_satelita");
				rs = ps.executeQuery();
				while(rs.next()) {
					
					data.add(new VezaRoditeljSatelitDataModel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
								rs.getString(5), rs.getString(6)));
				}
				
				} catch (SQLException ex) {
					System.err.println("Error"+ex);
				}
				
			String tmp = "tmp";
			tmp = "tm";
		
			
		id_roditelja = new TableColumn("ID Roditelja");
		id_roditelja.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, String>("RoditeljID"));
		
		ime_roditelja = new TableColumn("Ime roditelja");
		ime_roditelja.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("ImeRoditelja"));
		
		vrsta_roditelja = new TableColumn("Vrsta roditelja");
		vrsta_roditelja.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("VrstaRoditelja"));
		
		id_satelita = new TableColumn("ID Satelita");
		id_satelita.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("SatelitID"));
		
		ime_satelita = new TableColumn("Ime satelita");
		ime_satelita.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("ImeSatelita"));
		
		vrsta_satelita = new TableColumn("Vrsta satelita");
		vrsta_satelita.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("VrstaSatelita"));
		
		
		
		tabelaSatelita.getColumns().clear();
		
		tabelaSatelita.getColumns().addAll(id_roditelja, ime_roditelja, vrsta_roditelja, id_satelita,
				ime_satelita, vrsta_satelita);
		
		tabelaSatelita.getItems().setAll(data);
		tmp = "tm";

}
}


