package application.view;
import application.view.CrnaRupaDataModel;
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
import application.view.DodajCrnuRupu;
import application.view.*;

public class IspisiPlanetuController implements Initializable {
	
	private Main main; 
	
	@FXML
	TableView tabelaPlaneta;
	@FXML
	TableColumn Column_ime;
	@FXML
	TableColumn Column_gpoluprecnik;
	@FXML
	TableColumn Column_epoluprecnik;
	@FXML
	TableColumn Column_povrsina;
	@FXML
	TableColumn Column_zapremina;
	@FXML
	TableColumn Column_masa;
	@FXML
	TableColumn Column_pgravitacija;
	@FXML
	TableColumn Column_boslobadjanja;  
	@FXML
	TableColumn Column_rperiod;
	@FXML
	TableColumn Column_albedo;
	@FXML
	TableColumn Column_obim;
	@FXML
	TableColumn Column_tip;
	@FXML
	TableColumn Column_ppritisak;
	@FXML
	TableColumn Column_ptemperatura;
	@FXML
	TableColumn Column_nose;

		private ObservableList<PlanetaDataModel>data;
		private DbConnection dc;
	
		@Override
		public void initialize(URL ur1, ResourceBundle rb) {
			dc = new DbConnection();
			//loadDataFromDatabase();
		}
		
		@FXML
		public void loadDataFromDatabase() {
		
			data = FXCollections.observableArrayList();
			try {
				dc = new DbConnection();
				Connection conn = dc.Connect();
				CallableStatement cs = null;
				ResultSet rs = null;
				cs = conn.prepareCall("{call ispis_planeta()}");
				rs = cs.executeQuery();
				while(rs.next()) {
					
					data.add(new PlanetaDataModel(rs.getString(2),  rs.getFloat(3), rs.getFloat(4), rs.getFloat(5), rs.getFloat(6),
											 rs.getFloat(7), rs.getFloat(8), rs.getFloat(9), rs.getFloat(10), 
											 rs.getFloat(11), rs.getFloat(12), rs.getString(13), rs.getFloat(14), rs.getFloat(15), rs.getFloat(16)));
				}
				
				} catch (SQLException ex) {
					System.err.println("Error"+ex);
				}
				
			String tmp = "tmp";
			tmp = "tm";
		
			
		Column_ime = new TableColumn("Ime");
		Column_ime.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, String>("Ime"));
		
		Column_gpoluprecnik = new TableColumn("Glavni poluprecnik");
		Column_gpoluprecnik.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("GlavniPoluprecnik"));
		
		Column_epoluprecnik = new TableColumn("Ekvatorijalni poluprecnik");
		Column_epoluprecnik.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("EkvatorijalniPoluprecnik"));
		
		Column_povrsina = new TableColumn("Povrsina");
		Column_povrsina.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("Povrsina"));
		
		Column_zapremina = new TableColumn("Zapremina");
		Column_zapremina.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("Zapremina"));
		
		Column_masa = new TableColumn("Masa");
		Column_masa.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("Masa"));
		
		Column_pgravitacija = new TableColumn("Povrsinska gravitacija");
		Column_pgravitacija.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("PovrsinskaGravitacija"));
		
		Column_boslobadjanja = new TableColumn("Brzina oslobadjanja");
		Column_boslobadjanja.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("BrzinaOslobadjanja"));
		
		Column_rperiod = new TableColumn("Rotacioni period");
		Column_rperiod.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("RotacioniPeriod"));
		
		Column_albedo = new TableColumn("Albedo");
		Column_albedo.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("Albedo"));
		
		Column_obim = new TableColumn("Obim");
		Column_obim.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("Obim"));
		
		Column_tip = new TableColumn("Tip planete");
		Column_tip.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, String>("TipPlanete"));
		
		Column_ppritisak = new TableColumn("Povrsinski pritisak");
		Column_ppritisak.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("PovrsinskiPritisak"));
		
		Column_ptemperatura = new TableColumn("Povrsinska Temperatura");
		Column_ptemperatura.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("PovrsinskaTemperatura"));
		
		Column_nose = new TableColumn("Nagib ose");
		Column_nose.setCellValueFactory(new PropertyValueFactory<PlanetaDataModel, Float>("NagibOse"));
		
		//tabelaCrnihRupa.setItems(null);
		
		tabelaPlaneta.getColumns().clear();
		
		tabelaPlaneta.getColumns().addAll(Column_ime, Column_gpoluprecnik, Column_epoluprecnik, Column_povrsina,
				Column_zapremina, Column_masa, Column_pgravitacija, Column_boslobadjanja, Column_rperiod, Column_albedo,
				Column_obim, Column_tip, Column_ppritisak,Column_ptemperatura, Column_nose);
		
		tabelaPlaneta.getItems().setAll(data);
		tmp = "tm";

}
}
