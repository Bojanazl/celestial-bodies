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
public class IspisiCrnuRupuController implements Initializable {
	
	private Main main; 
	
	@FXML
	TableView tabelaCrnihRupa;
	@FXML
	TableColumn Column_ime;
	/*@FXML
	TableColumn Column_gpoluprecnik;
	@FXML
	TableColumn Column_epoluprecnik;
	@FXML
	TableColumn Column_povrsina;*/
	@FXML
	TableColumn Column_zapremina;
	@FXML
	TableColumn Column_masa;
	/*@FXML
	TableColumn Column_pgravitacija;
	@FXML
	TableColumn Column_boslobadjanja;  
	@FXML
	TableColumn Column_rperiod;
	@FXML
	TableColumn Column_albedo;
	@FXML
	TableColumn Column_obim;*/
	@FXML
	TableColumn  Column_rekt;
	@FXML
	TableColumn Column_dekl;

		/***/private ObservableList<CrnaRupaDataModel>data;
		private DbConnection dc;
	
		@Override
		public void initialize(URL ur1, ResourceBundle rb) {
			dc = new DbConnection();
	
		}
		
		@FXML
		public void loadDataFromDatabase() {
	
			data = FXCollections.observableArrayList();
			try {
				dc = new DbConnection();
				Connection conn = dc.Connect();
				CallableStatement cs = null;
				ResultSet rs = null;
				cs = conn.prepareCall("{call ispis_crnih_rupa()}");
				rs = cs.executeQuery();
				while(rs.next()) {
					
					data.add(new CrnaRupaDataModel(rs.getString(1), rs.getFloat(2), rs.getFloat(3), rs.getFloat(4), rs.getFloat(5), rs.getFloat(6), rs.getFloat(7), rs.getFloat(8), rs.getFloat(9), rs.getFloat(10), rs.getFloat(11), rs.getInt(12), rs.getInt(13)));
				}
				
				} catch (SQLException ex) {
					System.err.println("Error"+ex);
				}
				
			String tmp = "tmp";
			tmp = "tm";
			
			//tabelaCrnihRupa = new TableView();
			
		Column_ime = new TableColumn("Naziv crne rupe");
		Column_ime.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, String>("Ime"));
		/*Column_gpoluprecnik = new TableColumn("GlavniPoluprecnik");
		Column_gpoluprecnik.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("GlavniPoluprecnik"));
		Column_epoluprecnik = new TableColumn("EkvatorijalniPoluprecnik");
		Column_epoluprecnik.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("EkvatorijalniPoluprecnik"));
		Column_povrsina = new TableColumn("Povrsina");
		Column_povrsina.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("Povrsina"));*/
		Column_zapremina = new TableColumn("Zapremina [Sol]");
		Column_zapremina.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("Zapremina"));
		Column_masa = new TableColumn("Masa [Sol]");
		Column_masa.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("Masa"));
		/*Column_pgravitacija = new TableColumn("PovrsinskaGravitacija");
		Column_pgravitacija.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("PovrsinskaGravitacija"));
		Column_boslobadjanja = new TableColumn("BrzinaOslobadjanja");
		Column_boslobadjanja.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("BrzinaOslobadjanja"));
		Column_rperiod = new TableColumn("RotacioniPeriod");
		Column_rperiod.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("RotacioniPeriod"));
		Column_albedo = new TableColumn("Albedo");
		Column_albedo.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("Albedo"));
		Column_obim = new TableColumn("Obim");
		Column_obim.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Float>("Obim"));*/
		Column_rekt = new TableColumn("Rektascenzija (aproks)");
		Column_rekt.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Integer>("Rektascenzija_Aproksimacija"));
		Column_dekl = new TableColumn("Deklinacija (aproks)");
		Column_dekl.setCellValueFactory(new PropertyValueFactory<CrnaRupaDataModel, Integer>("Deklinacija_Aproksimacija"));
		
		//tabelaCrnihRupa.setItems(null);
		
		tabelaCrnihRupa.getColumns().clear();
		tabelaCrnihRupa.getColumns().addAll(Column_ime, /*Column_gpoluprecnik, Column_epoluprecnik, Column_povrsina,*/
				Column_zapremina, Column_masa,/* Column_pgravitacija, Column_boslobadjanja, Column_rperiod, Column_albedo,
				Column_obim,*/ Column_rekt, Column_dekl);
		
		//tabelaCrnihRupa.setItems(data);
		tabelaCrnihRupa.getItems().setAll(data);
		tmp = "tm";
		//data = FXCollections.observableArrayList(); 
		
}
}


	
