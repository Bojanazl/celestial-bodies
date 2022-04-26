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


public class IspisZvijezdeController implements Initializable{
	private Main main; 
	@FXML
    private TableView tabelaZvijezda;

    @FXML
    private TableColumn Column_ime;

    @FXML
    private TableColumn Column_spektral;

    @FXML
    private TableColumn Column_zsistem;

    @FXML
    private TableColumn Column_zjato;

    @FXML
    private TableColumn Column_galaksija;

    @FXML
    private TableColumn Column_gjato;

    @FXML
    private TableColumn Column_sjato;

private ObservableList<ZvijezdaDataModel>data;
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
		cs = conn.prepareCall("{call ispis_zvijezda()}");
		rs = cs.executeQuery();
		while(rs.next()) {
			
			data.add(new ZvijezdaDataModel(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), 
						rs.getString(7), rs.getString(8)));
		}
		
		} catch (SQLException ex) {
			System.err.println("Error"+ex);
		}
		
	String tmp = "tmp";
	tmp = "tm";

	
Column_ime = new TableColumn("Ime");
Column_ime.setCellValueFactory(new PropertyValueFactory<ZvijezdaDataModel, String>("ImeZvijezde"));

Column_spektral = new TableColumn("Spektralna klasifikacija");
Column_spektral.setCellValueFactory(new PropertyValueFactory<ZvijezdaDataModel,String>("SpektralnaKlasifikacija"));

Column_zsistem = new TableColumn("Zvjezdani sistem");
Column_zsistem.setCellValueFactory(new PropertyValueFactory<ZvijezdaDataModel, String>("ZvjezdaniSistem"));

Column_zjato = new TableColumn("Zvjezdano jato");
Column_zjato.setCellValueFactory(new PropertyValueFactory<ZvijezdaDataModel, String>("ZvjezdaniSistem"));

Column_galaksija = new TableColumn("Galaksija");
Column_galaksija.setCellValueFactory(new PropertyValueFactory<ZvijezdaDataModel, String>("Galaksija"));

Column_gjato = new TableColumn("Galakticko jato");
Column_gjato.setCellValueFactory(new PropertyValueFactory<ZvijezdaDataModel, String>("GalaktickoJato"));

Column_sjato = new TableColumn("Superjato");
Column_sjato.setCellValueFactory(new PropertyValueFactory<ZvijezdaDataModel, String>("Superjato"));


	tabelaZvijezda.getColumns().clear();
	tabelaZvijezda.getColumns().addAll(Column_ime, Column_spektral , Column_zsistem,Column_zjato,
		Column_galaksija, Column_gjato, Column_sjato);

	tabelaZvijezda.getItems().setAll(data);
	tmp = "tm";

}
}

